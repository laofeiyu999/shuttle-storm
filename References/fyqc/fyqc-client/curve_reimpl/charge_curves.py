# -*- coding: utf-8 -*-
"""
charge_curves.py  —  蓄力值(charge in [0,1])驱动的球路曲线簇
================================================================

第二轮需求（用户原话 m00349）：
  "调整曲线 加上参数 蓄力值x，对按键小球，高球设计成曲线簇。小球在蓄力值小于1/3是
   下网，最远则是到了发球线。高远最近是到中线，最远是到底线，按键杀球的线路在击球
   高度高于一定高度时是一条直线，蓄力值在大于4/5时会下网，越小距离越远，最远到中线。
   否则则转为平抽，一个较大初速度的曲线，参考其他两球逻辑。与击球点位置有关，前场
   击球更容易出界，设计成合适的速度区间，例如网前平抽蓄力值大于1/4出界，后场大于
   3/4出界。"

本模块把上面每条规则落成可断言的函数。几何层复用 fls_curve.py 的二次阻力弹道
（RK4 积分 + 固定仰角二分初速），与第一轮 51 条原生曲线共享同一套物理。

坐标约定（与 fls 源码一致，单位 cm）
    网平面 z = 0，网高 150；击球方 z < 0，对方 z > 0
    X 横向，单打边线 |x| = 260；Z 纵向，底线 |z| = 670
    单打发球线 z = 198，中场 z = 335，双打后发球线 z = 594
    g = 500 cm/s^2（curveconstant gravity = -5.0 m/s^2）
    k = 0.00024 1/cm（airFriction = 0.24，/1000）

规则 -> 代码 对照
  小球 KEY_P
      charge < 1/3        下网：撞网带(高度 70..148)后竖直落回己方
      charge = 1/3        刚好擦网过，落点 55cm
      charge = 1          落点 = 发球线 198
      中间线性；仰角从"能过网的最小角"起，保证任何档位都不意外挂网
  高远 KEY_GY
      charge = 0 -> 中线 335 ；charge = 1 -> 底线 670
      62 度大弧线，落点随蓄力线性后移
  杀球 KEY_D
      直线分支条件：击球高度 >= 240 且 击球点深度 <= 335*(y0-150)/150
          （后者是"以直线落到中线时仍能过网"的几何上界）
          charge -> 0      落点 = 中线 335（最远）
          charge -> 4/5    落点收到"擦网点"，即直线刚好擦网
          charge > 4/5     下网：撞网后落回
      否则 -> 平抽分支（大初速、低弧线，仰角取"能过网的最小角"）
          出界阈值 c_out = lerp(0.25, 0.75, 深度归一)  —— 前场 1/4、后场 3/4
          c <= c_out: 落点 60 -> 670 线性
          c >  c_out: 落点 670 -> 950 线性（明确出界区）
"""

import json
import math
import os
import sys

_HERE = os.path.dirname(os.path.abspath(__file__))
if _HERE not in sys.path:
    sys.path.insert(0, _HERE)

import fls_curve as F  # noqa: E402

# ============================================================================
# 1. 场地常量（cm）
# ============================================================================

NET_H = 150.0
NET_HALF_W = 305.0
COURT_HALF_L = 260.0
COURT_HALF_W = 670.0
SHORT_SERVICE = 198.0
MID_LINE = 335.0
BASELINE = 670.0
DBL_LONG_SERVICE = 594.0

G = 500.0
K = 0.00024

# ============================================================================
# 2. 设计参数
# ============================================================================

CHARGE_STEPS = 21

# --- 小球 ---
DROP_NET_CHARGE = 1.0 / 3.0
DROP_LAND_MIN = 55.0
DROP_LAND_MAX = SHORT_SERVICE
DROP_NET_CROSS_LOW = 70.0
DROP_NET_CROSS_HIGH = 147.0
DROP_TARGET_APEX = 205.0      # 小球弧顶目标（cm），用于反选仰角

# --- 高远 ---
CLEAR_LAND_MIN = MID_LINE
CLEAR_LAND_MAX = BASELINE
CLEAR_TARGET_APEX = 620.0

# --- 杀球 / 平抽 ---
SMASH_NET_CHARGE = 4.0 / 5.0
SMASH_MIN_H = 240.0
SMASH_LAND_MAX = MID_LINE
SMASH_SPEED = 3400.0
SMASH_NET_CROSS_LOW = 60.0
SMASH_NET_CROSS_HIGH = 148.0
SMASH_NET_SPEED = 2600.0

DRIVE_DEPTH_FRONT = 240.0
DRIVE_DEPTH_BACK = 500.0
DRIVE_OUT_FRONT = 0.25
DRIVE_OUT_BACK = 0.75
DRIVE_LAND_MIN = 150.0
DRIVE_LAND_MAX_OUT = 800.0
DRIVE_MAX_SPEED = 2600.0   # 平抽初速上限；超过就抬仰角（仍是过网解，只是更拱）
DRIVE_TARGET_APEX_FRONT = 200.0   # 平抽弧顶目标，随深度变化
DRIVE_TARGET_APEX_BACK = 290.0

CLEAR_MARGIN = 12.0
ANGLE_STEP = 2.0
ANGLE_MAX_RAISE = 40
ANGLE_FLOOR = -22.0
ANGLE_CEIL = 87.0
MIN_APEX_LIFT = 20.0   # 弧顶至少高出击球点这么多，避免二分退化

SAMPLE_DT = 0.01
MAX_POINTS = 400

# ============================================================================
# 3. 小工具
# ============================================================================

def clamp01(v):
    return 0.0 if v < 0.0 else (1.0 if v > 1.0 else v)


def clamp(v, lo, hi):
    return lo if v < lo else (hi if v > hi else v)


def lerp(a, b, t):
    return a + (b - a) * t


def lerp_clamped(a, b, t):
    return a + (b - a) * clamp01(t)


def _unit3(dx, dz):
    d = math.hypot(dx, dz)
    if d < 1e-9:
        return 1.0, 0.0, 1e-9
    return dx / d, dz / d, d


def _dist3(a, b):
    return math.sqrt((a[0] - b[0]) ** 2 + (a[1] - b[1]) ** 2 + (a[2] - b[2]) ** 2)


def _resample(ts, pts, T, dt=SAMPLE_DT):
    if T <= 1e-6:
        return [0.0, 0.0], [pts[0], pts[0]]
    n = int(clamp(int(round(T / dt)) + 1, 2, MAX_POINTS))
    grid = [T * i / (n - 1) for i in range(n)]
    xs = [p[0] for p in pts]
    ys = [p[1] for p in pts]
    zs = [p[2] for p in pts]
    out = [(F._lerp_at(ts, xs, t), F._lerp_at(ts, ys, t), F._lerp_at(ts, zs, t))
           for t in grid]
    return grid, out


def _dense(hit, ux, uz, vx, vy, T, dt=0.002):
    n = int(clamp(int(round(T / dt)), 4, 6000))
    ts = [T * i / n for i in range(n + 1)]
    xs, ys = F.integrate(vx, vy, G, K, T, steps=n)
    pts = [(hit[0] + ux * xs[i], hit[1] + ys[i], hit[2] + uz * xs[i])
           for i in range(n + 1)]
    return ts, pts


# ============================================================================
# 4. 弹道基元
# ============================================================================

def _ballistic(hit, land, angle_deg):
    """固定仰角反解初速，命中 land（land.y 一般为 0）。返回 (ts, pts, T, v)"""
    ux, uz, D = _unit3(land[0] - hit[0], land[2] - hit[2])
    dy = land[1] - hit[1]
    vx, vy, T, _ap, _ta = F.solve_by_angle(D, dy, angle_deg, G, K)
    ts, pts = _dense(hit, ux, uz, vx, vy, T)
    return ts, pts, T, math.hypot(vx, vy)


def _angle_for_apex(hit, land, apex_target):
    """选仰角使得轨迹弧顶高度接近 apex_target（二分，落在可行区间内）"""
    lo, hi = ANGLE_FLOOR, ANGLE_CEIL
    best = ANGLE_FLOOR
    for _ in range(40):
        mid = 0.5 * (lo + hi)
        ts, pts, T, v = _ballistic(hit, land, mid)
        ap = max(p[1] for p in pts)
        if ap < apex_target:
            lo = mid
        else:
            hi = mid
        best = mid
        # 0.02 度：仰角分辨率必须远小于"弧顶高度随角度"的局部斜率倒数，
        # 否则整条曲线簇会随蓄力值抖动（实测 0.5 度时飞行时长抖 +-0.07s）。
        if hi - lo < 0.02:
            break
    ts, pts, T, v = _ballistic(hit, land, best)
    return best, ts, pts, T, v


def _clear_angle(hit, land, ang0, need, max_raise=ANGLE_MAX_RAISE):
    """从 ang0 起，找"最小的、能过网(过网高度 >= need)"的仰角。

    用二分而不是按 2 度台阶抬角：台阶会让仰角随蓄力值呈阶梯变化，
    时间列/落点在台阶处出现跳变（实测 0.002 蓄力步长下 T 跳 0.08s）。
    二分后仰角是目标的连续函数，整条曲线簇才平滑。

    返回 (ang, ts, pts, T, v, net_y)。
    """
    def probe(a):
        ts, pts, T, v = _ballistic(hit, land, a)
        ny = F.net_cross_y(pts)
        return (ny is not None and ny >= need), (a, ts, pts, T, v, ny)

    ok, res = probe(ang0)
    if ok:
        return res

    lo, hi = ang0, ang0
    ok_hi = False
    # 粗搜必须覆盖整个 [ang0, ANGLE_CEIL] 区间：起始仰角很负时
    # （如后场吊球 ang0≈-22°）固定 2° 台阶 40 次只到 58°，够不到能过网的 ~64°，
    # 会误判"抬到顶也过不了网"从而输出下网球。这里按区间长度自适应当步长。
    step = max(ANGLE_STEP, (ANGLE_CEIL - ang0) / float(max_raise))
    for _ in range(max_raise + 1):
        hi = min(ANGLE_CEIL, hi + step)
        ok_hi, res = probe(hi)
        if ok_hi or hi >= ANGLE_CEIL - 1e-9:
            break
    if not ok_hi:
        return res  # 到底也过不了网：交给上层判下网

    for _ in range(24):
        mid = 0.5 * (lo + hi)
        ok_m, res_m = probe(mid)
        if ok_m:
            hi = mid
            res = res_m
        else:
            lo = mid
        if hi - lo < 0.02:
            break
    ok_f, res_f = probe(hi)
    return res_f if ok_f else res


def _lofted(hit, land, apex_target, kind, need_clear=True, dt=SAMPLE_DT):
    """构造"必须过网"的弧线：先按弧顶目标选仰角，过网不够则平滑抬角。"""
    start = (float(hit[0]), float(hit[1]), float(hit[2]))
    land = (float(land[0]), float(land[1]), float(land[2]))
    need = NET_H + CLEAR_MARGIN
    crosses = start[2] * land[2] < 0.0

    # 弧顶目标必须高于击球点，否则 _angle_for_apex 的二分退化到最低仰角，
    # 后场高点击球（y=268/285）配 apex_target=185 时整条弧变成平射，过网全靠抬角。
    apex_target = max(float(apex_target), start[1] + MIN_APEX_LIFT)
    ang, ts, pts, T, v = _angle_for_apex(start, land, apex_target)
    if need_clear and crosses:
        ang, ts, pts, T, v, _ny = _clear_angle(start, land, ang, need)

    grid, out = _resample(ts, pts, T, dt)
    out[0] = start
    out[-1] = land
    return {
        "kind": kind, "points": out, "times": grid, "T": grid[-1],
        "drop": land, "start": start, "angle": ang, "speed": v,
        "apex": max(p[1] for p in out), "netY": F.net_cross_y(out),
        "forced_net": False,
    }


def _min_angle_no_drag(hit, land, need_y):
    """无阻力闭式解：让轨迹在网面处恰为 need_y 的最小仰角。

    令 D = 水平总距离, q = 网距/D, dn = 网距, t = tan(theta)：
        y_net = y0(1 - q^2) + t (dn - dn^2/D)
      -> t = (need_y - y0(1-q^2)) / (dn - dn^2/D)
    有阻力时会比 this 低一些，调用方随后按实测过网高度抬角。
    """
    dx, dz = land[0] - hit[0], land[2] - hit[2]
    D = math.hypot(dx, dz)
    if D < 1e-6:
        return None
    dn = -hit[2] * D / dz if abs(dz) > 1e-9 else 0.0
    dn = abs(dn)
    if dn <= 1e-6 or dn >= D - 1e-6:
        return None
    q = dn / D
    den = dn - dn * dn / D
    if abs(den) < 1e-9:
        return None
    t = (need_y - hit[1] * (1.0 - q * q)) / den
    return math.degrees(math.atan(t))


def _lofted_min(hit, land, kind, margin=CLEAR_MARGIN, dt=SAMPLE_DT):
    """平抽：取"刚好过网"的最平仰角（大初速、低弧线），过网不足则逐级抬角。"""
    start = (float(hit[0]), float(hit[1]), float(hit[2]))
    land = (float(land[0]), float(land[1]), float(land[2]))
    need = NET_H + margin
    ang = _min_angle_no_drag(start, land, need)
    if ang is None:
        ang = -10.0
    ang = clamp(ang, ANGLE_FLOOR, ANGLE_CEIL)
    ang, ts, pts, T, v, _ny = _clear_angle(start, land, ang, need)
    # 速度上限：平抽不应解成"炮弹出膛"。抬角能换弧线，二分出刚好不超速的仰角，
    # 避免按 2 度台阶跳变导致时间列/落点不连续。
    if v > DRIVE_MAX_SPEED:
        lo, hi = ang, ANGLE_CEIL
        for _ in range(18):
            mid = 0.5 * (lo + hi)
            _t2, _p2, _T2, v2 = _ballistic(start, land, mid)
            if v2 > DRIVE_MAX_SPEED:
                lo = mid
            else:
                hi = mid
        ang = hi
        ts, pts, T, v = _ballistic(start, land, ang)
    grid, out = _resample(ts, pts, T, dt)
    out[0] = start
    out[-1] = land
    return {
        "kind": kind, "points": out, "times": grid, "T": grid[-1],
        "drop": land, "start": start, "angle": ang, "speed": v,
        "apex": max(p[1] for p in out), "netY": F.net_cross_y(out),
        "forced_net": False,
    }


def _straight(hit, land, speed, kind, dt=0.008):
    """三维等速直线（杀球"直线"分支）"""
    start = (float(hit[0]), float(hit[1]), float(hit[2]))
    land = (float(land[0]), float(land[1]), float(land[2]))
    L3 = _dist3(start, land)
    T = max(0.02, L3 / speed)
    n = int(clamp(int(round(T / dt)) + 1, 2, MAX_POINTS))
    grid = [T * i / (n - 1) for i in range(n)]
    pts = []
    for i in range(n):
        r = i / float(n - 1)
        pts.append((lerp(start[0], land[0], r), lerp(start[1], land[1], r),
                    lerp(start[2], land[2], r)))
    return {
        "kind": kind, "points": pts, "times": grid, "T": grid[-1],
        "drop": land, "start": start,
        "angle": math.degrees(math.atan2(land[1] - start[1], L3)),
        "speed": speed, "apex": max(p[1] for p in pts),
        "netY": F.net_cross_y(pts), "forced_net": False,
    }


def _net_fault(hit, cross_y, aim_x, kind, speed, dt=SAMPLE_DT):
    """下网球：以水平速度 speed 飞向网面，在 (aim_x, cross_y, 0) 撞网，然后竖直落回己方。

    第一段用无阻力解析抛物线（水平匀速 + 竖直匀加速）：
        t_net = d_net / speed
        vy0   = (cross_y - y0 + 0.5*G*t_net^2) / t_net
    这样速度/角度完全可控，不会被二分放大成非物理的高速。
    第二段从撞网点竖直自由落体，z 微微后退到 -10cm（读作"掉回自己场地"）。
    """
    start = (float(hit[0]), float(hit[1]), float(hit[2]))
    ax, az = float(aim_x), 0.0
    d_net = math.hypot(ax - start[0], az - start[2])
    d_net = max(d_net, 1.0)
    t_net = d_net / max(float(speed), 1.0)
    ux = (ax - start[0]) / d_net
    uz = (az - start[2]) / d_net
    vh = d_net / t_net
    vy0 = (float(cross_y) - start[1] + 0.5 * G * t_net * t_net) / t_net

    n = int(clamp(int(round(t_net / dt)) + 1, 3, MAX_POINTS))
    grid, out = [], []
    for i in range(n):
        t = t_net * i / (n - 1)
        grid.append(t)
        out.append((start[0] + ux * vh * t,
                    max(0.0, start[1] + vy0 * t - 0.5 * G * t * t),
                    start[2] + uz * vh * t))
    out[-1] = (ax, float(cross_y), az)

    h = max(5.0, float(cross_y))
    t_fall = math.sqrt(2.0 * h / G)
    nf = int(clamp(int(round(t_fall / dt)), 2, 120))
    for i in range(1, nf + 1):
        r = i / float(nf)
        grid.append(t_net + t_fall * r)
        out.append((ax, max(0.0, h - 0.5 * G * (t_fall * r) ** 2), -10.0 * r))
    out[-1] = (ax, 0.0, -10.0)
    return {
        "kind": kind, "points": out, "times": grid, "T": grid[-1],
        "drop": out[-1], "start": start, "angle": 0.0,
        "speed": math.hypot(vh, vy0), "apex": max(p[1] for p in out),
        "netY": float(cross_y), "forced_net": True,
    }


# ============================================================================
# 5. 三种击球键的曲线簇
# ============================================================================

def _shot_drop(hit, charge, aim_x):
    """小球 KEY_P"""
    if charge < DROP_NET_CHARGE:
        r = clamp01(charge / DROP_NET_CHARGE)
        cross_y = lerp(DROP_NET_CROSS_LOW, DROP_NET_CROSS_HIGH, r)
        spd = lerp(320.0, 900.0, r)
        return _net_fault(hit, cross_y, aim_x, "drop_net", spd)
    r = clamp01((charge - DROP_NET_CHARGE) / (1.0 - DROP_NET_CHARGE))
    z_land = lerp(DROP_LAND_MIN, DROP_LAND_MAX, r)
    apex = lerp(185.0, DROP_TARGET_APEX, r)
    return _lofted(hit, (aim_x, 0.0, z_land), apex, "drop")


def _shot_clear(hit, charge, aim_x):
    """高远球 KEY_GY"""
    c = clamp01(charge)
    z_land = lerp(CLEAR_LAND_MIN, CLEAR_LAND_MAX, c)
    apex = lerp(CLEAR_TARGET_APEX, CLEAR_TARGET_APEX + 40.0, c)
    return _lofted(hit, (aim_x, 0.0, z_land), apex, "clear")


def smash_reach_limit(y0):
    """直线杀能落到中线并把网压到 150 以内时，击球点离网的最大深度。
        NET_H = y0 * z1 / (z1 + L)   ->   L = z1*(y0-NET_H)/NET_H"""
    return SMASH_LAND_MAX * (float(y0) - NET_H) / NET_H


def drive_out_charge(hit_z):
    """平抽出界阈值：前场 1/4 -> 后场 3/4（按击球点深度线性）"""
    depth = clamp01((abs(float(hit_z)) - DRIVE_DEPTH_FRONT) /
                    (DRIVE_DEPTH_BACK - DRIVE_DEPTH_FRONT))
    return lerp(DRIVE_OUT_FRONT, DRIVE_OUT_BACK, depth)


_SMASH_POOL_N = 13
_SMASH_POOL = {}


def _resample_norm(cur, n=64):
    """按归一化时间 [0,1] 等分重采样点列（便于不同时长的曲线互插）"""
    ts, pts = cur["times"], cur["points"]
    T = ts[-1]
    grid = [T * i / (n - 1) for i in range(n)]
    return [(F._lerp_at(ts, [p[0] for p in pts], t),
             F._lerp_at(ts, [p[1] for p in pts], t),
             F._lerp_at(ts, [p[2] for p in pts], t)) for t in grid], [i / (n - 1.0) for i in range(n)]


def _smash_net_pool(hit, aim_x):
    """下网杀球池：蓄力 4/5..1 对应撞网高度 148..60、速度递减。
    预先造出各档曲线，查询时按归一化时间线性互插，保证序列平滑、速度不爆炸。"""
    key = (round(float(hit[0]), 2), round(float(hit[1]), 2), round(float(hit[2]), 2),
           round(float(aim_x), 2))
    if _SMASH_POOL and key in _SMASH_POOL:
        return _SMASH_POOL[key]
    pool = []
    for i in range(_SMASH_POOL_N):
        r = i / float(_SMASH_POOL_N - 1)
        cross_y = lerp(SMASH_NET_CROSS_HIGH, SMASH_NET_CROSS_LOW, r)
        spd = lerp(SMASH_NET_SPEED, SMASH_NET_SPEED * 0.62, r)
        c = _net_fault(hit, cross_y, aim_x, "smash_net", spd)
        np_, uu = _resample_norm(c)
        pool.append({"r": r, "normPoints": np_, "T": c["T"], "netY": cross_y, "speed": spd})
    _SMASH_POOL.clear()
    _SMASH_POOL[key] = pool
    return pool


def _smash_net_curve(hit, r, aim_x):
    pool = _smash_net_pool(hit, aim_x)
    r = clamp01(r)
    f = r * (_SMASH_POOL_N - 1)
    i0 = int(clamp(int(math.floor(f)), 0, _SMASH_POOL_N - 2))
    w = f - i0
    a, b = pool[i0], pool[i0 + 1]
    T = lerp(a["T"], b["T"], w)
    pts = [tuple(lerp(a["normPoints"][k][j], b["normPoints"][k][j], w) for j in range(3))
           for k in range(len(a["normPoints"]))]
    ts = [T * k / (len(pts) - 1.0) for k in range(len(pts))]
    return {
        "kind": "smash_net", "points": pts, "times": ts, "T": T,
        "drop": pts[-1], "start": pts[0], "angle": 0.0,
        "speed": lerp(a["speed"], b["speed"], w),
        "apex": max(p[1] for p in pts),
        "netY": lerp(a["netY"], b["netY"], w),
        "forced_net": True,
    }


def _shot_smash(hit, charge, aim_x):
    """杀球 KEY_D：高点击球走直线，否则转平抽"""
    y0 = float(hit[1])
    L = abs(float(hit[2]))
    straight_ok = (y0 >= SMASH_MIN_H) and (L <= smash_reach_limit(y0) + 1e-6)
    c = clamp01(charge)

    if straight_ok:
        if c > SMASH_NET_CHARGE:
            r = (c - SMASH_NET_CHARGE) / (1.0 - SMASH_NET_CHARGE)
            return _smash_net_curve(hit, r, aim_x)
        # c=0 -> 中线；c->4/5 -> 擦网点（直线刚好压网）
        z_graze = NET_H * L / (y0 - NET_H)          # 直线擦网落点
        z_graze = max(z_graze, 1.0)
        r = clamp01((SMASH_NET_CHARGE - c) / SMASH_NET_CHARGE)
        z_land = lerp(z_graze, SMASH_LAND_MAX, r)
        cur = _straight(hit, (aim_x, 0.0, z_land), SMASH_SPEED, "smash_straight")
        cur["z_graze"] = z_graze
        return cur

    # ---- 平抽 ----
    c_out = drive_out_charge(hit[2])
    if c <= c_out:
        z_land = lerp(DRIVE_LAND_MIN, BASELINE, c / max(c_out, 1e-6))
    else:
        z_land = lerp(BASELINE, DRIVE_LAND_MAX_OUT,
                      (c - c_out) / max(1.0 - c_out, 1e-6))
    cur = _lofted_min(hit, (aim_x, 0.0, z_land), "drive")
    cur["drive_out_charge"] = c_out
    cur["smash_why"] = ("击球高度 %.0f < %.0f" % (y0, SMASH_MIN_H)
                        if y0 < SMASH_MIN_H
                        else "击球点深度 %.0f > 直线可达 %.0f" % (L, smash_reach_limit(y0)))
    return cur


_SHOT_FN = {"P": _shot_drop, "GY": _shot_clear, "D": _shot_smash}
SHOT_KEYS = ("P", "D", "GY")
SHOT_NAMES = {"P": "小球", "D": "杀球/平抽", "GY": "高远"}

# 击球点预设（网页与 Python 共用同一组数字）
HIT_PRESETS = {
    "front": {"label": "网前", "x": 0.0, "y": 168.0, "z": -110.0},
    "mid":   {"label": "中场", "x": 0.0, "y": 285.0, "z": -280.0},
    "back":  {"label": "后场", "x": 0.0, "y": 268.0, "z": -600.0},
}
DEFAULT_PRESET = {"P": "front", "D": "mid", "GY": "back"}

# ============================================================================
# 6. 判定 + 封装
# ============================================================================

def classify(curve):
    if curve.get("forced_net"):
        return "net"
    ny = curve.get("netY")
    if ny is not None and ny < NET_H:
        return "net"
    x, _y, z = curve["drop"]
    if abs(x) > COURT_HALF_L + 1e-6 or z > COURT_HALF_W + 1e-6:
        return "out"
    return "in"


def build_shot(key, hit, charge, aim_x=0.0):
    cur = _SHOT_FN[key](hit, clamp01(charge), float(aim_x))
    cur["charge"] = clamp01(charge)
    cur["key"] = key
    cur["status"] = classify(cur)
    return cur


def build_family(key, hit, aim_x=0.0, n=CHARGE_STEPS):
    return [build_shot(key, hit, i / float(n - 1), aim_x) for i in range(n)]


def preset_hit(name):
    p = HIT_PRESETS[name]
    return (p["x"], p["y"], p["z"])

# ============================================================================
# 7. 自检
# ============================================================================

def _row(cur):
    x, _y, z = cur["drop"]
    return "c=%.2f %-15s land=(%7.1f,%7.1f) T=%.3f apex=%6.1f netY=%s v=%6.0f %s" % (
        cur["charge"], cur["kind"], x, z, cur["T"], cur["apex"],
        "-" if cur["netY"] is None else "%.1f" % cur["netY"],
        cur["speed"], cur["status"])


def validate(verbose=True):
    fails = []
    if verbose:
        sys.stdout.reconfigure(encoding="utf-8", errors="replace")

    def check(cond, msg):
        if not cond:
            fails.append(msg)
            if verbose:
                print("  [FAIL] " + msg)

    allc = []
    for key in SHOT_KEYS:
        for pname in HIT_PRESETS:
            fam = build_family(key, preset_hit(pname))
            allc += fam
            for cur in fam:
                ts = cur["times"]
                check(len(ts) == len(cur["points"]), "点数/时间列不等长 %s/%s" % (key, pname))
                check(ts[0] == 0.0, "首点时间非 0 %s/%s" % (key, pname))
                check(all(ts[i + 1] > ts[i] for i in range(len(ts) - 1)),
                      "时间列非严格递增 %s/%s" % (key, pname))
                check(cur["T"] > 0.05, "时长过短 %s/%s" % (key, pname))
                check(all(p[1] >= -1.0 for p in cur["points"]), "穿地 %s/%s" % (key, pname))
                check(abs(cur["points"][-1][1]) < 1e-6, "末点未落地 %s/%s" % (key, pname))
                check(len(cur["points"]) <= MAX_POINTS, "点数超限 %s/%s" % (key, pname))

    # ---------- 小球 ----------
    fam = build_family("P", preset_hit("front"))
    if verbose:
        print("\n[小球 KEY_P]  击球点 网前 %s" % (preset_hit("front"),))
        for c in fam:
            print("  " + _row(c))
    for c in fam:
        if c["charge"] < DROP_NET_CHARGE - 1e-9:
            check(c["status"] == "net", "小球 c=%.2f 应下网，实为 %s" % (c["charge"], c["status"]))
        else:
            check(c["status"] == "in", "小球 c=%.2f 应界内，实为 %s" % (c["charge"], c["status"]))
    zs = [c["drop"][2] for c in fam if c["status"] == "in"]
    check(all(zs[i] < zs[i + 1] for i in range(len(zs) - 1)), "小球落点未单调变远")
    check(abs(fam[-1]["drop"][2] - SHORT_SERVICE) < 1.0,
          "小球满蓄力应到发球线 %.0f，实为 %.1f" % (SHORT_SERVICE, fam[-1]["drop"][2]))

    # ---------- 高远 ----------
    fam = build_family("GY", preset_hit("back"))
    if verbose:
        print("\n[高远 KEY_GY]  击球点 后场 %s" % (preset_hit("back"),))
        for c in fam:
            print("  " + _row(c))
    check(abs(fam[0]["drop"][2] - MID_LINE) < 1.0,
          "高远最近应到中线 %.0f，实为 %.1f" % (MID_LINE, fam[0]["drop"][2]))
    check(abs(fam[-1]["drop"][2] - BASELINE) < 1.0,
          "高远最远应到底线 %.0f，实为 %.1f" % (BASELINE, fam[-1]["drop"][2]))
    zs = [c["drop"][2] for c in fam]
    check(all(zs[i] < zs[i + 1] for i in range(len(zs) - 1)), "高远落点未单调变远")
    check(all(c["status"] == "in" for c in fam), "高远全部应界内")

    # ---------- 直线杀 ----------
    fam = build_family("D", preset_hit("mid"))
    if verbose:
        print("\n[杀球 KEY_D] 击球点 中场 %s  y0=%.0f 直线可达深度 %.0f"
              % (preset_hit("mid"), preset_hit("mid")[1], smash_reach_limit(preset_hit("mid")[1])))
        for c in fam:
            print("  " + _row(c))
    check(all(c["kind"] in ("smash_straight", "smash_net") for c in fam),
          "中场高点击球应全部走直线分支")
    check(abs(fam[0]["drop"][2] - SMASH_LAND_MAX) < 1.0,
          "杀球蓄力 0 应到中线 %.0f，实为 %.1f" % (SMASH_LAND_MAX, fam[0]["drop"][2]))
    for c in fam:
        if c["charge"] > SMASH_NET_CHARGE + 1e-9:
            check(c["status"] == "net", "杀球 c=%.2f 应下网，实为 %s" % (c["charge"], c["status"]))
        elif c["charge"] < SMASH_NET_CHARGE - 1e-9:
            check(c["status"] == "in", "杀球 c=%.2f 应界内，实为 %s" % (c["charge"], c["status"]))
    ins = [c for c in fam if c["status"] == "in"]
    zs = [c["drop"][2] for c in ins]
    check(all(zs[i] >= zs[i + 1] for i in range(len(zs) - 1)), "杀球落点未单调变近")
    for c in fam:
        if c["kind"] != "smash_straight":
            continue
        a, b = c["points"][0], c["points"][-1]
        for p in c["points"][1:-1]:
            c1 = (b[0] - a[0]) * (p[1] - a[1]) - (b[1] - a[1]) * (p[0] - a[0])
            c2 = (b[2] - a[2]) * (p[1] - a[1]) - (b[1] - a[1]) * (p[2] - a[2])
            check(abs(c1) < 1e-6 and abs(c2) < 1e-6, "直线杀点列不共线")

    # ---------- 平抽 ----------
    for pname, want in (("front", 0.25), ("back", 0.75)):
        fam = build_family("D", preset_hit(pname))
        c_out = drive_out_charge(preset_hit(pname)[2])
        if verbose:
            print("\n[平抽 KEY_D] 击球点 %s %s  出界阈值 c_out=%.2f"
                  % (HIT_PRESETS[pname]["label"], preset_hit(pname), c_out))
            for c in fam:
                print("  " + _row(c))
        check(all(c["kind"] == "drive" for c in fam), "%s 应全部走平抽分支" % pname)
        check(abs(c_out - want) < 1e-6,
              "%s 平抽出界阈值应为 %.2f，实为 %.3f" % (pname, want, c_out))
        for c in fam:
            if c["status"] == "net":
                check(False, "%s 平抽 c=%.2f 意外下网" % (pname, c["charge"]))
            elif c["charge"] < c_out - 1e-9:
                check(c["status"] == "in", "%s 平抽 c=%.2f 应界内，实为 %s"
                      % (pname, c["charge"], c["status"]))
            elif c["charge"] > c_out + 1e-9:
                check(c["status"] == "out", "%s 平抽 c=%.2f 应出界，实为 %s"
                      % (pname, c["charge"], c["status"]))
        zs = [c["drop"][2] for c in fam]
        check(all(zs[i] <= zs[i + 1] for i in range(len(zs) - 1)), "%s 平抽落点未单调变远" % pname)
        check(all(c["speed"] > 240.0 for c in fam),
              "%s 平抽初速应明显大于小球(%.0f~%.0f)" % (pname, min(c["speed"] for c in fam), max(c["speed"] for c in fam)))

    # ---------- 回归：抬角粗搜覆盖 + 弧顶夹取（后修 bug）----------
    for pname in ("mid", "back"):
        hit_p = preset_hit(pname)
        fam = build_family("P", hit_p)
        for c in fam:
            if c["charge"] < DROP_NET_CHARGE - 1e-9:
                continue
            check(c["kind"] == "drop" and c["status"] == "in",
                  "回归 %s 小球 c=%.2f 应过网，实为 %s/%s"
                  % (pname, c["charge"], c["kind"], c["status"]))
            check(c["netY"] is not None and c["netY"] >= NET_H + 10.0,
                  "回归 %s 小球 c=%.2f 过网高度不足 %.1f"
                  % (pname, c["charge"], -1.0 if c["netY"] is None else c["netY"]))
            check(c["apex"] >= hit_p[1] + 15.0,
                  "回归 %s 小球 c=%.2f 弧顶未高出击球点 apex=%.1f hitY=%.1f"
                  % (pname, c["charge"], c["apex"], hit_p[1]))

    # ---------- 横向瞄点 ----------
    fam = build_family("GY", preset_hit("back"), aim_x=400.0)
    check(any(c["status"] == "out" for c in fam), "横向瞄到边线外应判出界")

    if verbose:
        print("\n" + "=" * 78)
        if fails:
            print("FAILED: %d 项" % len(fails))
            for m in fails:
                print("   - " + m)
        else:
            print("ALL CHECKS PASSED   （%d 条曲线）" % len(allc))
        print("=" * 78)
    return fails


def dump_json(path=None):
    data = {"constants": {
        "NET_H": NET_H, "COURT_HALF_L": COURT_HALF_L, "COURT_HALF_W": COURT_HALF_W,
        "SHORT_SERVICE": SHORT_SERVICE, "MID_LINE": MID_LINE, "BASELINE": BASELINE,
        "DBL_LONG_SERVICE": DBL_LONG_SERVICE, "G": G, "K": K,
    }, "families": []}
    for key in SHOT_KEYS:
        for pname in ("front", "mid", "back"):
            hit = preset_hit(pname)
            fam = build_family(key, hit)
            data["families"].append({
                "key": key, "preset": pname, "hit": list(hit),
                "curves": [{
                    "charge": c["charge"], "kind": c["kind"], "status": c["status"],
                    "drop": list(c["drop"]), "T": c["T"], "apex": c["apex"],
                    "netY": c["netY"], "speed": c["speed"],
                } for c in fam],
            })
    s = json.dumps(data, ensure_ascii=False)
    if path:
        with open(path, "w", encoding="utf-8") as f:
            f.write(s)
    return s


def main():
    try:
        sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    except Exception:
        pass
    print("charge_curves.py — 蓄力值驱动的球路曲线簇")
    print("场地: 网高 %.0f  单打边线 +-%.0f  底线 +-%.0f  发球线 %.0f  中线 %.0f"
          % (NET_H, COURT_HALF_L, COURT_HALF_W, SHORT_SERVICE, MID_LINE))
    fails = validate(True)
    out = os.path.join(_HERE, "charge_families.json")
    dump_json(out)
    print("\n曲线簇 JSON: " + out + "  (%d bytes)" % os.path.getsize(out))
    return 1 if fails else 0


if __name__ == "__main__":
    sys.exit(main())
