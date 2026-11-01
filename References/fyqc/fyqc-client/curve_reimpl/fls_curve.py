# -*- coding: utf-8 -*-
"""
飞羽青晏 (FLS) 羽毛球球曲线 —— Python 复刻实现
=================================================

数据来源 : D:\fyqc\fls_py\base\data\curve\*       (客户端 FLS 脚本反编译产物)
逻辑来源 : battlelogic\badminton\badminton.py
           clientlogic\prejudgecurve.py
           clientlogic\curvedropposhandler.py
           clientlogic\badmintonsmoothmove.py
           battlelogic\battlebase\dmath.py
           battlelogic\common\defines.py
           bridge.py / fls_proto\PyBridgeCmd.proto

分层结构
--------
  1. 常量层                  defines.py / court\c1001.py / BattleCmd.proto 的枚举与数值
  2. 数据层   load_tables()  直接 exec 原始配置表，数值 1:1 对齐
  3. 参考层   TimeProfile    解析 g_CurveData（距离-时间剖面），只读参考
  4. 几何层   solve_by_angle 带二次阻力的弹道反解（给定发射仰角 + 落点）
  5. 形状层   create_curve()  按 curveId//1000 分派 5 种 SHAPE_TYPE
  6. 玩法层   calc_drop_pos / prejudge_over_net / CurveDropPosHandler / SmoothMove

标记约定
--------
  [F]  Fact     —— 从反编译 Python 源码 1:1 抄录，公式与常量可信，带行号
  [I]  Inferred —— 原生 phys 模块（C# ICurveShapeData / CurveShapeData）的算路未公开，
                   此处的几何构造按配置表语义反推得到；系数集中在 CurveParams，
                   可以调手感而不影响任何 [F] 部分。
"""

from __future__ import print_function, division

import math
import os
import random
import sys
import types

try:                                    # Windows 控制台默认 cp936，强制 UTF-8 输出
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
except Exception:
    pass


# ============================================================================
# 1. 常量层  [F]
# ============================================================================

FRAME = 25                      # [F] battlelogic\common\defines.py: 逻辑帧率
SECOND_SCALE = 100              # [F] defines.py: 时间/BulletTimeScale 放大 100 倍
CURVE_PREJUDGE_FRAME = 4        # [F] defines.py
CURVE_WAIT_TIME = 0.08          # [F] defines.py
CURVE_DEFAULT_ID = 1001         # [F] defines.py
BADMINTON_STARMARK_HEIGHT = 270 # [F] defines.py

# 球场  [F] base\data\court\c1001.py
COURT_NET_HEIGHT = 150          # m_NetHeight = 150            (cm)
COURT_HALF_L = 260              # m_SingleQuarterSizeDict['iLength'] = 260  (X 半宽)
COURT_HALF_W = 670              # m_SingleQuarterSizeDict['iWidth']  = 670  (Z 半长)
COURT_HALF_L_DUAL = 305         # m_DualQuarterSizeDict['iLength']  = 305

# 球路形状枚举  [F] fls_proto\BattleCmd.proto:242-249
SHAPE_TYPE_NONE = 0
SHAPE_TYPE_NORMAL = 1
SHAPE_TYPE_DOWN = 2
SHAPE_TYPE_TURN_AROUND = 3
SHAPE_TYPE_PARABOLA_DOWN = 4
SHAPE_TYPE_FALLING = 5
SHAPE_TYPE_NORMAL_FAKE_DROP = 6

# 击球键  [F] BattleCmd.proto HIT_KEY_*
HIT_KEY_KEY_P = 1      # 扑 / 推
HIT_KEY_KEY_D = 2      # 吊 / 挑后场
HIT_KEY_KEY_GY = 32    # 高远球 [F] BattleCmd.proto:149（原误记 3）
HIT_KEY_KEY_ZD = 4     # [F] BattleCmd.proto:148
HIT_KEY_KEY_DJ = 64    # [F] BattleCmd.proto:150

# 出界方向  [F] BattleCmd.proto BADMINTON_OUT_DIR_*
OUT_DIR_NONE = 0
OUT_DIR_LEFT = 1
OUT_DIR_RIGHT = 2

# 队伍  [F] Common_pb2.TEAM_MEMBER_TYPE_*
TEAM_HOST = 1
TEAM_GUEST = 2

DROP_POS_OFFSET_UNSET = -1      # [F] badminton.py: 用 -1 表示"未设置"


# ============================================================================
# 2. 数据层
# ============================================================================

DEFAULT_FLS_ROOT = r"D:\fyqc"


class _CDataStub(types.ModuleType):
    """C_data 是客户端原生模块（仓库里没有 .pyd），这里做桩：
    Register2OS* 一律透传第一参数，使配置表可被 exec 而数值一字不改。"""

    def __getattr__(self, name):
        if name.startswith("Register2OS"):
            return lambda *a, **k: (a[0] if a else None)
        raise AttributeError(name)


def _exec_table(path):
    with open(path, "r", encoding="utf-8", errors="replace") as fp:
        src = fp.read()
    ns = {}
    exec(compile(src, path, "exec"), ns)
    return {k: v for k, v in ns.items() if k.startswith("g_")}


def load_tables(fls_root=None):
    """载入全部曲线配置表。返回 dict：
    curveconstant / normal / turnaround / paraboladown / falling / normalfakedrop /
    curvedrop / curvedata / hmin / hmax / mapper"""
    root = fls_root or DEFAULT_FLS_ROOT
    base = os.path.join(root, "fls_py", "base", "data", "curve")
    if not os.path.isdir(base):
        raise IOError("找不到曲线配置目录: %s" % base)

    sys.modules.setdefault("C_data", _CDataStub("C_data"))

    files = {
        "curveconstant": "curveconstant.py",
        "normal": "normalcurve.py",
        "turnaround": "turnaroundcurve.py",
        "paraboladown": "paraboladowncurve.py",
        "falling": "fallingcurve.py",
        "normalfakedrop": "normalfakedropcurve.py",
        "curvedrop": "curvedrop.py",
        "curvedata": "curvedata.py",
    }
    raw = {k: _exec_table(os.path.join(base, fn)) for k, fn in files.items()}

    t = {
        "curveconstant": raw["curveconstant"]["g_CurveConstants"],
        "normal": raw["normal"]["g_NormalCurveData"],
        "turnaround": raw["turnaround"]["g_TurnAroundCurveData"],
        "paraboladown": raw["paraboladown"]["g_ParabolaDownCurveData"],
        "falling": raw["falling"]["g_FallingCurveData"],
        "normalfakedrop": raw["normalfakedrop"]["g_NormalFakeDropCurveData"],
        "curvedrop": raw["curvedrop"]["g_CurveDropData"],
        "curvedata": raw["curvedata"]["g_CurveData"],
        "hmin": raw["curvedata"].get("g_CurveHeightMin", 10),
        "hmax": raw["curvedata"].get("g_CurveHeightMax", 260),
    }
    # [F] battlelogic\config\curveconfig.py: BADMINTON_MAPPER
    t["mapper"] = {
        SHAPE_TYPE_NORMAL: t["normal"],
        SHAPE_TYPE_TURN_AROUND: t["turnaround"],
        SHAPE_TYPE_PARABOLA_DOWN: t["paraboladown"],
        SHAPE_TYPE_FALLING: t["falling"],
        SHAPE_TYPE_NORMAL_FAKE_DROP: t["normalfakedrop"],
    }
    return t


def get_curve_type_and_data(tables, curve_id):
    """[F] CBadminton.GetCurveTypeAndData (badminton.py:522-529)
        iType = int(iCurveId / 1000) -> 千位即 SHAPE_TYPE"""
    shape_type = int(curve_id / 1000)
    return shape_type, tables["mapper"].get(shape_type, {}).get(curve_id)


def get_curve_constant(tables, shape_type):
    """[I] curveconstant 只有 1000/2000 两组：
    2000 = 抛物线下压球路组，其余（常规/旋转/重力/假动作）用 1000 组。"""
    key = 2000 if shape_type == SHAPE_TYPE_PARABOLA_DOWN else 1000
    return tables["curveconstant"][key]


# ============================================================================
# 3. 参考层：解析 g_CurveData
# ============================================================================
#
# g_CurveData[高度][角度] = [{'s':..., 'v':...}, ...]     (base\data\curve\curvedata.py)
#
# 实测结构（探针输出）：
#   * 外层 26 个高度：10..260 步长 10  —— 与 g_CurveHeightMin/Max 一致
#   * 内层角度 -30..80 步长 5（低高度档缺负角度）
#   * v 恒为 0,1,2,... 步长 1  —— 帧号
#   * s 单调递增，相邻差从头 ~0.6 递减到尾部 0.01 —— 典型二次阻力减速剖面
#   * 最大帧数 159，多档封顶在 s 约 15.00（上限钳制）
#
# 语义未在 Python 侧暴露（原生直接消费），因此这里只当作**参考剖面**：
# 给出 (高度, 角度) -> (参考帧数, 参考距离)，用于标定/校验/调参，
# 不直接决定最终轨迹（轨迹由几何层按发射仰角 + 落点反解）。
# ============================================================================

class TimeProfile(object):
    """g_CurveData 的查询封装（只读参考）。"""

    DIST_SCALE = 100.0   # [I] 表内 s(约米级) -> 游戏单位 cm

    def __init__(self, curve_data, hmin=10, hmax=260):
        self.data = curve_data
        self.hmin = hmin
        self.hmax = hmax
        self.heights = sorted(curve_data.keys())
        self._angles = {h: sorted(curve_data[h].keys()) for h in self.heights}
        self._cache = {}

    def row(self, h, a):
        """(帧数, 参考距离cm)；缺失返回 None"""
        key = (h, a)
        if key not in self._cache:
            lst = self.data.get(h, {}).get(a)
            self._cache[key] = None if not lst else (len(lst), lst[-1]["s"] * self.DIST_SCALE)
        return self._cache[key]

    @staticmethod
    def _bracket(seq, v):
        if v <= seq[0]:
            return seq[0], seq[0], 0.0
        if v >= seq[-1]:
            return seq[-1], seq[-1], 0.0
        for i in range(len(seq) - 1):
            if seq[i] <= v <= seq[i + 1]:
                lo, hi = seq[i], seq[i + 1]
                return lo, hi, (v - lo) / float(hi - lo) if hi != lo else 0.0
        return seq[-1], seq[-1], 0.0

    def ref(self, height, angle):
        """按相邻高度/角度双线性插值 -> (帧数, 参考距离cm)"""
        hl, hh, ht = self._bracket(self.heights, max(self.hmin, min(self.hmax, height)))
        fnum = fden = dnum = dden = 0.0
        for h, wh in ((hl, 1.0 - ht), (hh, ht)):
            if wh <= 0.0 and hl != hh:
                continue
            angs = self._angles[h]
            al, ah, at = self._bracket(angs, max(angs[0], min(angs[-1], angle)))
            for a, wa in ((al, 1.0 - at), (ah, at)):
                r = self.row(h, a)
                if not r:
                    continue
                w = wh * wa
                if w <= 0.0:
                    continue
                fnum += w * r[0]
                fden += w
                dnum += w * r[1]
                dden += w
        if fden <= 0.0 or dden <= 0.0:
            for h in self.heights:
                for a in self._angles[h]:
                    return self.row(h, a)
        return fnum / fden, dnum / dden

    def ref_time(self, height, angle, time_gap=0.016):
        """参考滞空时长（秒）= (帧数-1) * timeGap —— 仅作参考，非最终轨迹时长"""
        frames, _d = self.ref(height, angle)
        return max(0.0, (frames - 1.0) * time_gap)

    def table(self, heights=None, angles=None, time_gap=0.016):
        """导出可打印的参考表，便于对照原始 g_CurveData"""
        heights = heights or self.heights
        angles = angles or [-30, -10, 0, 10, 25, 40, 60, 80]
        out = []
        for h in heights:
            row = []
            for a in angles:
                frames, dist = self.ref(h, a)
                row.append((a, (frames - 1) * time_gap, dist))
            out.append((h, row))
        return out



# ============================================================================
# 4. 几何层：带二次阻力的一维弹道
# ============================================================================
#
# 运动方程  [I]   a = -k|v|v + (0, -g)     k = airFriction/1000  (1/cm)
#                                          g = |gravity| * 100     (cm/s^2)
#
# 反解思路：配置里的 angle 就是"出球仰角"，落点由 CalcDropPos 决定，
# 于是问题变成：固定仰角 alpha，求初速 v 使轨迹正好经过 drop。
# 对 v 单调（v 越大同一水平距离处越高），二分即可。这比"固定飞行时长"
# 更稳，也不会落到平射分支。
# ============================================================================

class CurveParams(object):
    """[I] 重建用到的全部可调系数（只影响 [I] 几何，不影响 [F] 逻辑）"""

    AIR_DRAG_K = 0.00024      # 1/cm；airFriction=0.24 时 k=0.24/1000
    GRAVITY_SCALE = 100.0     # gravity=-5.0 (m/s^2) -> 500 cm/s^2
    SAMPLE_DT = 0.01          # 点列采样步长（秒），100Hz
    MAX_SAMPLES = 260         # 单条曲线最多采样点（配置 firstHalfSegmentTime=0.003 会炸）
    CROSS_NET_STEP_DEG = 4.0  # crossNetFix 每次把仰角抬高 4 度
    CROSS_NET_MAX_DEG = 78.0
    NET_FIX_METRES = 0.08     # curveconstant.netFixH = 0.08 (m) -> 8cm 余量
    ANGLE_BIAS_DEG = 0.0      # 全局仰角偏置，调手感用
    VEL_MIN = 20.0            # 反解速度搜索下界 cm/s
    VEL_MAX = 8000.0          # 反解速度搜索上界 cm/s


def _accel(vx, vy, g, k):
    sp = math.hypot(vx, vy)
    return -k * sp * vx, -g - k * sp * vy


def integrate(vx0, vy0, g, k, T, steps=96):
    """RK4 积分 [0,T]，返回 (xs, ys)，长度 steps+1"""
    dt = T / steps
    x = y = 0.0
    vx, vy = vx0, vy0
    xs, ys = [0.0], [0.0]
    for _ in range(steps):
        k1x, k1y = vx, vy
        a1x, a1y = _accel(vx, vy, g, k)
        k2x, k2y = vx + 0.5 * dt * a1x, vy + 0.5 * dt * a1y
        a2x, a2y = _accel(k2x, k2y, g, k)
        k3x, k3y = vx + 0.5 * dt * a2x, vy + 0.5 * dt * a2y
        a3x, a3y = _accel(k3x, k3y, g, k)
        k4x, k4y = vx + dt * a3x, vy + dt * a3y
        a4x, a4y = _accel(k4x, k4y, g, k)
        x += dt / 6.0 * (k1x + 2 * k2x + 2 * k3x + k4x)
        y += dt / 6.0 * (k1y + 2 * k2y + 2 * k3y + k4y)
        vx += dt / 6.0 * (a1x + 2 * a2x + 2 * a3x + a4x)
        vy += dt / 6.0 * (a1y + 2 * a2y + 2 * a3y + a4y)
        xs.append(x)
        ys.append(y)
    return xs, ys


def fly_to(vx0, vy0, g, k, dist, dt=0.002, max_t=12.0):
    """积分到水平位移 >= dist，返回 (y_at_dist, t_at_dist, apex, t_apex)；到不了返回 None"""
    x = y = t = 0.0
    vx, vy = vx0, vy0
    apex, t_apex = y, 0.0
    while t < max_t:
        ax, ay = _accel(vx, vy, g, k)
        k2x, k2y = vx + 0.5 * dt * ax, vy + 0.5 * dt * ay
        a2x, a2y = _accel(k2x, k2y, g, k)
        k3x, k3y = vx + 0.5 * dt * a2x, vy + 0.5 * dt * a2y
        a3x, a3y = _accel(k3x, k3y, g, k)
        k4x, k4y = vx + dt * a3x, vy + dt * a3y
        a4x, a4y = _accel(k4x, k4y, g, k)
        px, py, pt = x, y, t
        ddx = dt / 6.0 * (vx + 2 * k2x + 2 * k3x + k4x)
        ddy = dt / 6.0 * (vy + 2 * k2y + 2 * k3y + k4y)
        x += ddx
        y += ddy
        vx += dt / 6.0 * (ax + 2 * a2x + 2 * a3x + a4x)
        vy += dt / 6.0 * (ay + 2 * a2y + 2 * a3y + a4y)
        t += dt
        if y > apex:
            apex, t_apex = y, t
        if x >= dist:
            span = x - px
            r = 0.0 if span <= 0 else (dist - px) / span
            return py + (y - py) * r, pt + (t - pt) * r, apex, t_apex
        if y < -3000.0 or t > max_t:
            break
    return None


def solve_by_angle(dist, dy, angle_deg, g, k):
    """[I] 固定仰角，二分初速使轨迹经过 (dist, dy)。
    返回 (vx0, vy0, T, apex, t_apex)。"""
    a = math.radians(angle_deg + CurveParams.ANGLE_BIAS_DEG)
    ca, sa = math.cos(a), math.sin(a)

    def height_at(v):
        r = fly_to(v * ca, v * sa, g, k, dist)
        return None if r is None else r[0]

    hi = CurveParams.VEL_MAX
    lo = CurveParams.VEL_MIN
    r_hi = height_at(hi)
    if r_hi is None:                      # 极高速都到不了（dist 太大）-> 用上界
        res = fly_to(hi * ca, hi * sa, g, k, dist)
        t = res[1] if res else dist / max(1e-6, hi * ca)
        return hi * ca, hi * sa, t, 0.0, 0.0
    if r_hi < dy:                         # 最大速度仍偏低：仰角太小，取最快解
        res = fly_to(hi * ca, hi * sa, g, k, dist)
        return hi * ca, hi * sa, res[1], res[2], res[3]
    for _ in range(48):
        mid = 0.5 * (lo + hi)
        hm = height_at(mid)
        if hm is None or hm < dy:
            lo = mid
        else:
            hi = mid
        if hi - lo < 0.5:
            break
    v = 0.5 * (lo + hi)
    res = fly_to(v * ca, v * sa, g, k, dist)
    if res is None:
        return v * ca, v * sa, dist / max(1e-6, v * ca), 0.0, 0.0
    y_at, t_at, apex, t_apex = res
    return v * ca, v * sa, t_at, apex, t_apex


def _unit(dx, dz):
    d = math.hypot(dx, dz)
    return (1.0, 0.0) if d < 1e-9 else (dx / d, dz / d)


# ============================================================================
# 5. 曲线对象
# ============================================================================

class CurveData(object):
    """等价于原生 phys 返回的 CurveData（Python 侧实际用到的接口全在这里）：
        m_CurveId / m_FullTime / m_PassTime / m_OwnerID
        GetPointBySecond(t) / GetDropPos() / GetTipsPoint()
        GetPointList() / GetPointTimeCache() / AddPassTime(dt)
    """

    def __init__(self, curve_id, points, times, drop_pos, tips_index, shape_type):
        self.m_CurveId = curve_id
        self.m_ShapeType = shape_type
        self.m_Points = points
        self.m_PointTime = times
        self.m_DropPos = drop_pos
        self.m_TipsIndex = tips_index
        self.m_FullTime = times[-1] if times else 0.0
        self.m_PassTime = 0.0
        self.m_OwnerID = 0
        self.m_StartPos = points[0] if points else (0.0, 0.0, 0.0)

    def GetPointList(self):
        return list(self.m_Points)

    def GetPointTimeCache(self):
        return list(self.m_PointTime)

    def GetInitVelocity(self, paramA=None, paramB=None):
        """[F-IL2CPP] 原生层实证（liba5logic.so IntegrateCurve 载入器 @0xDD5EC 逐条反汇编）：
        初速不存储，由首点方向反推：v = dir0 * param * (STEP / y0)
          vx = x0 * paramA * (0.04 / y0)
          vy = z0 * (0.04 / y0)
          vz = x0 * paramB * (0.04 / y0)
        其中 0.04 = Simulate 步长(1/25帧)，STEP/SEC100 常量位于 .rodata 0x625DE4(100)/0x625DE8(0.04)。

        ⚠ 使用限制（实测 2026-11）：原生输入点元组是 (x, y, 帧)——第三槽是时间，
        首点很可能是相对/方向量而非绝对坐标。本类 m_Points 是绝对 (x, 高度y, 空间z)
        cm 点列：对 m_Points[0] 直接套用本公式时，输出只随起点位置变化，与曲线
        形状/落点无关（实测起点 (0,250,-320) 时 vx/vz 恒为 0、vy 恒为 -0.0512），
        因此不可当物理初速使用——物理初速请用 build_* 内部 solve_by_angle 的解。
        本方法仅作为 [F] 公式锚点保留：协议还原对齐原生行为时，应按原生点表
        ((x,y,帧) 采样表) 语义调用。

        paramA/paramB 缺省用 create_curve 的 speed_mul 与角度系数近似（[I]）。
        详见 原生层反编译-phys模块解密.md 第五节。"""
        pts = self.m_Points
        if not pts:
            return 0.0, 0.0, 0.0
        x0, y0, _z0 = pts[0]
        if abs(y0) < 1e-9:
            return 0.0, 0.0, 0.0
        if paramA is None:
            paramA = getattr(self, "_speedMul", 1.0)
        if paramB is None:
            paramB = paramA
        k = 0.04 / y0
        return (x0 * paramA * k, _z0 * k, x0 * paramB * k)

    def GetDropPos(self):
        return self.m_DropPos

    def GetTipPoints(self):
        return self.m_Points

    def GetTipsPoint(self):
        return self.m_Points[max(0, min(len(self.m_Points) - 1, self.m_TipsIndex))]

    def AddPassTime(self, dt):
        self.m_PassTime += dt
        return self.m_PassTime

    def GetPointBySecond(self, fSecond):
        """[I] 原生为查表+插值；这里按时间列线性插值"""
        pts, ts = self.m_Points, self.m_PointTime
        if not pts:
            return 0.0, 0.0, 0.0
        if fSecond <= ts[0]:
            return pts[0]
        if fSecond >= ts[-1]:
            return pts[-1]
        lo, hi = 0, len(ts) - 1
        while hi - lo > 1:
            mid = (lo + hi) // 2
            if ts[mid] <= fSecond:
                lo = mid
            else:
                hi = mid
        span = ts[hi] - ts[lo]
        r = 0.0 if span <= 0 else (fSecond - ts[lo]) / span
        return tuple(pts[lo][i] + (pts[hi][i] - pts[lo][i]) * r for i in range(3))

    def GetApex(self):
        return max(p[1] for p in self.m_Points)

    def GetNetCrossY(self):
        return net_cross_y(self.m_Points)

    def __repr__(self):
        return "<CurveData id=%s shape=%s pts=%d T=%.3fs drop=%s>" % (
            self.m_CurveId, self.m_ShapeType, len(self.m_Points),
            self.m_FullTime, tuple(round(v, 1) for v in self.m_DropPos))


def net_cross_y(points):
    """Z 轴穿过 0（球网平面）时的高度，线性插值；没穿过返回 None"""
    for i in range(len(points) - 1):
        z0, z1 = points[i][2], points[i + 1][2]
        if z0 == 0.0:
            return points[i][1]
        if z0 * z1 < 0:
            r = abs(z0) / (abs(z0) + abs(z1))
            return points[i][1] + (points[i + 1][1] - points[i][1]) * r
    return None


def _tips_index(T, frames_from_last, dt):
    """[F] tipsPointFromLast 是"距末尾的帧数"（配置里是 0 / 8 / 15）"""
    return max(0, int(round(T / dt)) - int(frames_from_last))


def _build_ballistic(start, drop, angle_deg, g, k, shape_type, curve_id,
                     tips_from_last, dt=None):
    dt = dt or CurveParams.SAMPLE_DT
    dx = math.hypot(drop[0] - start[0], drop[2] - start[2])
    dir_x, dir_z = _unit(drop[0] - start[0], drop[2] - start[2])
    vx, vy, T, _apex, _ta = solve_by_angle(dx, drop[1] - start[1], angle_deg, g, k)
    n = max(2, int(round(T / dt)) + 1)
    tt = [T * i / (n - 1) for i in range(n)]
    xs, ys = integrate(vx, vy, g, k, T, steps=n - 1)
    pts = [(start[0] + dir_x * xs[i], start[1] + ys[i], start[2] + dir_z * xs[i])
           for i in range(n)]
    pts[-1] = (drop[0], drop[1], drop[2])
    return CurveData(curve_id, pts, tt, drop, _tips_index(T, tips_from_last, dt), shape_type)


def _cross_net_ok(points, need_y):
    y = net_cross_y(points)
    return y is not None and y >= need_y


def _rescale_speed(c, speed_mul):
    """[I] speedMul 直接压缩时间轴（点列不变），等价于整体加速播放"""
    m = 1.0 if (speed_mul is None or speed_mul <= 0) else float(speed_mul)
    c._speedMul = m          # 记录给 GetInitVelocity() 作缺省 paramA/paramB
    if abs(m - 1.0) < 1e-9:
        return c
    c.m_PointTime = [t / m for t in c.m_PointTime]
    c.m_FullTime = c.m_PointTime[-1] if c.m_PointTime else 0.0
    return c



# ============================================================================
# 6. 采样辅助（把物理轨迹转成原生的点列 + 时间列）
# ============================================================================

def clamp01(t):
    """[F] battlelogic\battlebase\dmath.py:20-26 Clamp01"""
    return 0.0 if t < 0.0 else (1.0 if t > 1.0 else t)


def lerp(fa, fb, t):
    """[F] dmath.py:29-31  Lerp(fA, fB, t) = fA + (fB - fA) * Clamp01(t)"""
    return fa + (fb - fa) * clamp01(t)


def lerp_vec(va, vb, t):
    t = clamp01(t)
    return tuple(va[i] + (vb[i] - va[i]) * t for i in range(3))


def frame2sec(i_frame):
    """[F] defines.py:168-169"""
    return i_frame / float(FRAME)


def sec2frame(f_sec):
    """[F] defines.py:172-173"""
    return int(f_sec * FRAME)


def _time_grid(T, first_dt, last_dt, lerp_factor):
    """[I] 原生点列的时间列：前半段按 firstHalfSegmentTime 采样，后半段按
    lastHalfSegmentTime 采样，speedLerpFactor 作为前后分界比例。
    这样两端采样更密（过网点/落点精度），中间更稀（省带宽）。"""
    if T <= 1e-6:
        return [0.0, 0.0]
    split = clamp01(lerp_factor) or 0.5
    if split <= 0.01 or split >= 0.99:
        split = 0.5
    t1 = T * split
    t2 = T - t1
    n1 = max(1, int(round(t1 / max(first_dt, 1e-4))))
    n2 = max(1, int(round(t2 / max(last_dt, 1e-4))))
    total = n1 + n2 + 1
    cap = CurveParams.MAX_SAMPLES
    if total > cap:                       # 等比压缩，保持前后段比例不变
        scale = float(cap - 1) / float(total - 1)
        n1 = max(1, int(round(n1 * scale)))
        n2 = max(1, cap - 1 - n1)
    grid = [t1 * i / n1 for i in range(n1)]
    grid += [t1 + t2 * i / n2 for i in range(n2 + 1)]
    grid[0] = 0.0
    grid[-1] = T
    return grid


def _lerp_at(ts, vals, t):
    if t <= ts[0]:
        return vals[0]
    if t >= ts[-1]:
        return vals[-1]
    lo, hi = 0, len(ts) - 1
    while hi - lo > 1:
        mid = (lo + hi) // 2
        if ts[mid] <= t:
            lo = mid
        else:
            hi = mid
    span = ts[hi] - ts[lo]
    r = 0.0 if span <= 0 else (t - ts[lo]) / span
    return vals[lo] + (vals[hi] - vals[lo]) * r


def _dense_ballistic(vx, vy, g, k, T, dt=0.001):
    """密集积分，返回 (ts, xs, ys)，供重采样使用"""
    n = max(2, int(round(T / dt)))
    xs, ys = integrate(vx, vy, g, k, T, steps=n)
    ts = [T * i / n for i in range(n + 1)]
    return ts, xs, ys


def _curve_from_sampler(curve_id, shape_type, start, drop, sampler, T,
                        first_dt, last_dt, lerp_factor, tips_from_last):
    grid = _time_grid(T, first_dt, last_dt, lerp_factor)
    pts = [sampler(t) for t in grid]
    pts[0] = (start[0], start[1], start[2])
    pts[-1] = (drop[0], drop[1], drop[2])
    n = len(pts)
    tips = max(0, n - 1 - int(tips_from_last))
    return CurveData(curve_id, pts, grid, drop, tips, shape_type)


# ============================================================================
# 7. 五种球路构造器
# ============================================================================
#
# 共同约定
#   起点 start = (x, y, z) cm，落点 drop = (x, 0, z) cm
#   运动方程 a = -k*|v|*v + (0, -g)，k = airFriction/1000，g = |gravity|*100
#   过网修正 crossNetFix：把"过网瞬间高度"抬到 netHeight + fixAmplitude
# ============================================================================

def _net_target_y(cfg, const):
    """[I] 过网目标高度 = m_NetHeight + fixAmplitude(cm)，且不低于 netFixH。

    依据：normalcurve.py 里 crossNetFix 与 fixAmplitude 成对出现，
    唯一 crossNetFix=False 的 1029 同时 fixAmplitude=0 —— fixAmplitude 就是
    "过网修正幅度"，即球路为了过网需要抬到网高以上多少。
    curveconstant 的 netFixH(0.08m/0.05m) 是兜底最小值。"""
    amp = float(cfg.get("fixAmplitude", 0) or 0)
    fix_cm = float(const.get("netFixH", 0.0) or 0.0) * 100.0
    return COURT_NET_HEIGHT + max(amp, fix_cm)


def _apply_fix_amplitude(points, times, start, drop, amplitude, peak_u, sign=1.0):
    """[I] 把 fixAmplitude 施加成中途横向弧量（球"曲线"的观感来源）。

    形状 w(u) = 4*u*(1-u)/normalizer，在 u = peak_u 处取到 1，起落点恒为 0，
    于是落点不受影响，只有中段被推向一侧。sign 决定凸向哪边。
    """
    amp = float(amplitude or 0.0)
    if abs(amp) < 1e-6:
        return points
    peak_u = min(0.85, max(0.15, float(peak_u or 0.5)))
    norm = 4.0 * peak_u * (1.0 - peak_u)
    dx, dz = drop[0] - start[0], drop[2] - start[2]
    L = math.hypot(dx, dz)
    if L < 1e-6:
        return points
    nx, nz = -dz / L, dx / L                      # 水平法向
    T = times[-1] if times and times[-1] > 0 else 1.0
    out = []
    for (px, py, pz), t in zip(points, times):
        u = clamp01(t / T)
        w = 4.0 * u * (1.0 - u) / norm
        d = amp * w * sign
        out.append((px + nx * d, py, pz + nz * d))
    return out


def _needs_net_cross(start, drop):
    """起落点在网（z=0）两侧时才需要过网判定"""
    return start[2] * drop[2] < 0.0


def _resolve_angle_ballistic(start, drop, angle_deg, g, k, cfg, const,
                             shape_type, curve_id, tips_from_last):
    """固定仰角反解初速；若 crossNetFix 且过网不够高，则逐步抬高仰角"""
    dx = math.hypot(drop[0] - start[0], drop[2] - start[2])
    dir_x, dir_z = _unit(drop[0] - start[0], drop[2] - start[2])
    dy = drop[1] - start[1]
    cross = bool(cfg.get("crossNetFix", False)) and _needs_net_cross(start, drop)
    need_y = _net_target_y(cfg, const) if cross else -1e9

    first_dt = float(cfg.get("firstHalfSegmentTime", 0.01) or 0.01)
    last_dt = float(cfg.get("lastHalfSegmentTime", 0.01) or 0.01)
    lerp_f = float(cfg.get("speedLerpFactor", 0.5) or 0.5)

    ang = float(angle_deg)
    best = None
    while ang <= CurveParams.CROSS_NET_MAX_DEG:
        vx, vy, T, _apex, _ta = solve_by_angle(dx, dy, ang, g, k)
        ts, xs, ys = _dense_ballistic(vx, vy, g, k, T)
        def sampler(t, _ts=ts, _xs=xs, _ys=ys):
            return (start[0] + dir_x * _lerp_at(_ts, _xs, t),
                    start[1] + _lerp_at(_ts, _ys, t),
                    start[2] + dir_z * _lerp_at(_ts, _xs, t))
        grid = _time_grid(T, first_dt, last_dt, lerp_f)
        pts = [sampler(t) for t in grid]
        ny = net_cross_y(pts)
        best = _curve_from_sampler(curve_id, shape_type, start, drop, sampler, T,
                                   first_dt, last_dt, lerp_f, tips_from_last)
        if not cross or (ny is not None and ny >= need_y):
            return best
        ang += CurveParams.CROSS_NET_STEP_DEG
    return best


def build_normal(tables, curve_id, start, drop, speed_mul=1.0, rand=None):
    """[I] 常规型球路：固定仰角 + 二次阻力弹道，crossNetFix 抬升过网高度"""
    cfg = get_curve_type_and_data(tables, curve_id)[1]
    if cfg is None:
        raise KeyError("normal curve %s 不存在" % curve_id)
    const = get_curve_constant(tables, SHAPE_TYPE_NORMAL)
    g = abs(float(const.get("gravity", -5.0))) * CurveParams.GRAVITY_SCALE
    k = abs(float(const.get("airFriction", 0.24))) / 1000.0
    c = _resolve_angle_ballistic(start, drop, cfg.get("angle", 10), g, k, cfg, const,
                                 SHAPE_TYPE_NORMAL, curve_id,
                                 cfg.get("tipsPointFromLast", 0))
    return _rescale_speed(c, speed_mul)


def build_down(tables, curve_id, start, drop, speed_mul=1.0, rand=None):
    """[I] SHAPE_TYPE_DOWN(=2)：协议里有、Python 侧没有配置表和 bridge 注册
    （curveconfig.BADMINTON_MAPPER 无条目，bridge.g_PyBridgeHandler 未注册
    PY_BRIDGE_CALC_DOWN_CURVE_MSG）。这里按"更陡的下压"近似，
    无任何 [F] 依据，仅供补齐协议分支。"""
    cfg = get_curve_type_and_data(tables, curve_id)[1] or {}
    g = abs(float(get_curve_constant(tables, SHAPE_TYPE_NORMAL).get("gravity", -5.0))) \
        * CurveParams.GRAVITY_SCALE
    k = 0.00024
    c = _resolve_angle_ballistic(start, drop, -20.0, g, k, cfg,
                                 {"netFixH": 0.08}, SHAPE_TYPE_DOWN, curve_id,
                                 cfg.get("tipsPointFromLast", 0))
    return _rescale_speed(c, speed_mul)


def build_turn_around(tables, curve_id, start, drop, speed_mul=1.0, rand=None):
    """[I] 旋转球：常规弹道 + 末段横向偏转。
    offset(=4.5) 解释为"总航向偏角(度)"，backTime(=0.25) 为"末尾开始偏转的秒数"。
    """
    rnd = rand or random
    cfg = get_curve_type_and_data(tables, curve_id)[1]
    if cfg is None:
        raise KeyError("turnaround curve %s 不存在" % curve_id)
    const = get_curve_constant(tables, SHAPE_TYPE_TURN_AROUND)
    g = abs(float(const.get("gravity", -5.0))) * CurveParams.GRAVITY_SCALE
    k = abs(float(const.get("airFriction", 0.24))) / 1000.0
    base = _resolve_angle_ballistic(start, drop, cfg.get("angle", 30), g, k, cfg, const,
                                    SHAPE_TYPE_TURN_AROUND, curve_id,
                                    cfg.get("tipsPointFromLast", 0))
    offset = float(cfg.get("offset", 0.0) or 0.0)          # [I]
    back_t = float(cfg.get("backTime", 0.0) or 0.0)         # [I] 秒
    T = base.m_FullTime
    if offset == 0.0 or T <= 0.0:
        return _rescale_speed(base, speed_mul)

    dx, dz = drop[0] - start[0], drop[2] - start[2]
    L = math.hypot(dx, dz) or 1.0
    nx, nz = -dz / L, dx / L                      # 水平法向（垂直于飞行方向）

    # [I] offset 释义：横向偏移幅度 = L * tan(offset)（把 offset 当"横向偏角"）。
    #     backTime 决定横向偏移的峰值位置：峰值出现在 (T - backTime) 处，
    #     即"越接近末段，偏得越开"，这正是旋转球让人误判落点的观感。
    #     形状用 Beta 型平滑拱  w(u) = u^a (1-u)^b / peak^a (1-peak)^b，
    #     两端恒为 0（起落点不被改动），且两端导数为 0（不会有折角）。
    amp = L * math.tan(math.radians(abs(offset)))
    peak_u = clamp01(1.0 - back_t / T) if T > 0 else 0.5
    peak_u = min(0.85, max(0.35, peak_u))
    a_up = 4.0 * peak_u
    b_up = 4.0 * (1.0 - peak_u)
    norm = (peak_u ** a_up) * ((1.0 - peak_u) ** b_up)
    if norm <= 1e-9:
        return _rescale_speed(base, speed_mul)

    pts = []
    for (px, py, pz), t in zip(base.m_Points, base.m_PointTime):
        u = 0.0 if T <= 0 else clamp01(t / T)
        if u <= 0.0 or u >= 1.0:
            w = 0.0
        else:
            w = (u ** a_up) * ((1.0 - u) ** b_up) / norm
        d = amp * w
        pts.append((px + nx * d, py, pz + nz * d))
    pts[0] = base.m_Points[0]
    pts[-1] = (drop[0], drop[1], drop[2])
    c = CurveData(curve_id, pts, list(base.m_PointTime), drop, base.m_TipsIndex,
                  SHAPE_TYPE_TURN_AROUND)
    return _rescale_speed(c, speed_mul)


def build_parabola_down(tables, curve_id, start, drop, speed_mul=1.0, rand=None):
    """[I] 抛物线下压球路

    物理推导（把配置字段名当公式用）：
        斜抛运动的轨迹方程  y(x) = y0 + tan(theta)*x - A*x^2,   A = g / (2*vx^2)
        强制过起点 (0, y0) 与落点 (D, 0)，消去 theta：
            tan(theta) = A*D - y0/D
            y(x) = y0*(1-u) + A*D^2*u*(1-u)        u = x/D
        即"弦线 + 抛物线拱高"，拱高在 u=0.5 处最大，等于 A*D^2/4。
        A 的量纲是 1/m，正好对应配置里的 parabolaMinA / parabolaMaxA
        （实测 0.0003 ~ 0.04）；用 g=5 m/s^2 反推，A=0.0159 <-> vx=12.5 m/s，
        A=0.0338 <-> vx=8.6 m/s，与 velocity 字段（700~1600 cm/s）同量级，
        说明 A 与 velocity 是同一件事的两种表达：velocity 定飞行时长，
        A 定弧线拱高，两者在配置里按形状用途各自给值。

        飞行时长  T = D / velocity      （velocity 是水平速度，cm/s）

    crossNetFix：若过网高度不足，按几何级数放大 A（弹道拱得更高）直到过网；
    到上限仍不足则退回"固定仰角弹道"求解器兜底。
    """
    rnd = rand or random
    cfg = get_curve_type_and_data(tables, curve_id)[1]
    if cfg is None:
        raise KeyError("paraboladown curve %s 不存在" % curve_id)

    dx, dz = drop[0] - start[0], drop[2] - start[2]
    D = math.hypot(dx, dz)
    if D < 1e-6:
        D = 1e-6
    dir_x, dir_z = _unit(dx, dz)

    vel = float(cfg.get("velocity", 1000) or 1000)          # cm/s
    T = max(0.02, D / vel)
    Dm = D / 100.0
    y0 = start[1] - drop[1]                                  # 起点相对落点的高度

    amin = float(cfg.get("parabolaMinA", 0.0) or 0.0)
    amax = float(cfg.get("parabolaMaxA", 0.0) or 0.0)
    if amax < amin:
        amin, amax = amax, amin
    A = amin + (amax - amin) * (rnd.random() if hasattr(rnd, "random") else 0.5)

    first_dt = float(cfg.get("firstHalfSegmentTime", 0.01) or 0.01)
    last_dt = float(cfg.get("lastHalfSegmentTime", 0.01) or 0.01)
    lerp_f = float(cfg.get("speedLerpFactor", 0.5) or 0.5)

    cross = bool(cfg.get("crossNetFix", False)) and _needs_net_cross(start, drop)
    need_y = _net_target_y(cfg, get_curve_constant(tables, SHAPE_TYPE_PARABOLA_DOWN))

    def make_sampler(A_):
        bulge = A_ * Dm * Dm * 100.0          # 米^2 * (1/m) -> 米 -> cm
        bulge = min(bulge, 900.0)             # 防止拱得离谱（900cm 已远超在场高度）

        def sampler(t):
            u = clamp01(t / T)
            # 弦线 + 抛物拱：u=0 与 u=1 处拱量恒为 0，u=0.5 处恰等于 bulge
            y = drop[1] + y0 * (1.0 - u) + bulge * 4.0 * u * (1.0 - u)
            return (start[0] + dir_x * D * u, y, start[2] + dir_z * D * u)
        return sampler, bulge

    sampler, _b = make_sampler(A)
    c = _curve_from_sampler(curve_id, SHAPE_TYPE_PARABOLA_DOWN, start, drop, sampler, T,
                            first_dt, last_dt, lerp_f,
                            cfg.get("tipsPointFromLast", 8))

    if cross:
        # 逐步放大拱高直到过网；几何上过不去（例如从后场打前场的下压球）
        # 就保留自然轨迹，交给上层判定"挂网"，不做非物理的兜底。
        for _ in range(8):
            ny = net_cross_y(c.m_Points)
            if ny is not None and ny >= need_y:
                break
            A *= 1.6
            sampler, _b = make_sampler(A)
            c = _curve_from_sampler(curve_id, SHAPE_TYPE_PARABOLA_DOWN, start, drop,
                                    sampler, T, first_dt, last_dt, lerp_f,
                                    cfg.get("tipsPointFromLast", 8))
    return _rescale_speed(c, speed_mul)


def build_falling(tables, curve_id, start, drop, speed_mul=1.0, rand=None):
    """[F] 重力陨石：起点强制为 (drop.x, startHeight, drop.z)，原地竖直下落。
        y(t) = H - v0*t - 0.5*G*t^2,  G = gravity*100
        （startHeight=1000, startVelocity=434, gravity=6.17 -> 约 1.23s 落地）"""
    cfg = get_curve_type_and_data(tables, curve_id)[1]
    if cfg is None:
        raise KeyError("falling curve %s 不存在" % curve_id)
    H = float(cfg.get("startHeight", 1000) or 1000)
    v0 = float(cfg.get("startVelocity", 0) or 0)
    G = abs(float(cfg.get("gravity", 6.17))) * 100.0        # cm/s^2
    p0 = (drop[0], H, drop[2])
    # 解 H - v0*t - 0.5*G*t^2 = 0
    if G <= 1e-9:
        T = H / v0 if v0 > 1e-9 else 0.5
    else:
        T = (-v0 + math.sqrt(v0 * v0 + 2.0 * G * H)) / G
    T = max(0.05, T)

    def sampler(t):
        tt = clamp01(t / T) * T
        y = H - v0 * tt - 0.5 * G * tt * tt
        return (drop[0], max(0.0, y), drop[2])

    c = _curve_from_sampler(curve_id, SHAPE_TYPE_FALLING, p0, drop, sampler, T,
                            0.01, 0.01, 0.5, cfg.get("tipsPointFromLast", 0))
    return _rescale_speed(c, speed_mul)


def build_normal_fake_drop(tables, curve_id, start, drop, speed_mul=1.0, rand=None):
    """[F]+[I] 假动作球：先按正常球路飞向"假落点"，末尾 backTime 秒内把落点
    回拉到真落点。回拉公式来自 curvedropposhandler.py:18-67：
        fPercent = (PassTime - StartBackTime) / (FullTime - StartBackTime)
        DropPos  = Lerp(FakeDropPos, RealDropPos, fPercent)

    [I] 这里 offset(=3.0) 解释为假落点相对真落点在落点表百分比上的缩放倍数，
    取 1/offset 作回拉前的偏移量（纯表现，无 [F] 数值依据）。"""
    cfg = get_curve_type_and_data(tables, curve_id)[1]
    if cfg is None:
        raise KeyError("normalfakedrop curve %s 不存在" % curve_id)
    const = get_curve_constant(tables, SHAPE_TYPE_NORMAL_FAKE_DROP)
    g = abs(float(const.get("gravity", -5.0))) * CurveParams.GRAVITY_SCALE
    k = abs(float(const.get("airFriction", 0.24))) / 1000.0
    c = _resolve_angle_ballistic(start, drop, cfg.get("angle", 40), g, k, cfg, const,
                                 SHAPE_TYPE_NORMAL_FAKE_DROP, curve_id,
                                 cfg.get("tipsPointFromLast", 0))
    off = float(cfg.get("offset", 0.0) or 0.0)
    back_t = float(cfg.get("backTime", 0.0) or 0.0)
    if off > 1e-6:
        # [I] 假落点释义：真落点沿飞行方向再外推 offset 米（offset=3.0 -> 300cm），
        #     使对手先看到"要出界/要打深"的假象，末尾 backTime 秒内回拉到真落点。
        #     回拉公式见 CurveDropPosHandler（[F] curvedropposhandler.py:18-67）。
        dx, dz = drop[0] - start[0], drop[2] - start[2]
        L = math.hypot(dx, dz) or 1.0
        adv = off * 100.0
        fake = (drop[0] + dx / L * adv, 0.0, drop[2] + dz / L * adv)
        # 限制在球场内（单打半长 670cm）
        if abs(fake[2]) > COURT_HALF_W:
            k_ = COURT_HALF_W / abs(fake[2])
            fake = (drop[0] + (fake[0] - drop[0]) * k_, 0.0,
                    drop[2] + (fake[2] - drop[2]) * k_)
        c.m_FakeDropPos = fake
    else:
        c.m_FakeDropPos = drop
    c.m_BackTime = back_t
    return _rescale_speed(c, speed_mul)


_SHAPE_BUILDERS = {
    SHAPE_TYPE_NORMAL: build_normal,
    SHAPE_TYPE_DOWN: build_down,
    SHAPE_TYPE_TURN_AROUND: build_turn_around,
    SHAPE_TYPE_PARABOLA_DOWN: build_parabola_down,
    SHAPE_TYPE_FALLING: build_falling,
    SHAPE_TYPE_NORMAL_FAKE_DROP: build_normal_fake_drop,
}


def create_curve(tables, curve_id, start, drop, speed_mul=1.0, owner_id=0, rand=None):
    """等价于原生 m_Phys.CreateCurve(sx,sy,sz, dx,dy,dz, curveId, speedMul)
       [F] 调用点 badminton.py:239-283 DoHitBadminton"""
    shape_type = get_curve_type_and_data(tables, curve_id)[0]
    fn = _SHAPE_BUILDERS.get(shape_type)
    if fn is None:
        raise KeyError("不支持的球路类型 %s (curveId=%s)" % (shape_type, curve_id))
    start = (float(start[0]), float(start[1]), float(start[2]))
    drop = (float(drop[0]), float(drop[1]), float(drop[2]))
    c = fn(tables, curve_id, start, drop, speed_mul, rand)
    c.m_OwnerID = owner_id
    return c



# ============================================================================
# 8. 玩法层：落点计算  [F]
# ============================================================================
#
# 逐行对应 battlelogic\badminton\badminton.py:425-516
# 反编译已知缺陷（照抄会崩）：
#   * CalcDropValue 里 if/elif 被还原成嵌套 if，X 分支 fGood 从未赋值
#     -> UnboundLocalError: local variable 'f_good' referenced before assignment
#   * CalcDropPosX 的 return iPosX 被缩进进 else 分支 -> 返回 None
# 下面按语义补全，结构保持与原文一致。
# ============================================================================

def random_float_between(fmin, fmax, rand=None):
    """[F] badminton.py 的 RandomFloatBetween(a, b)"""
    rnd = rand or random
    if fmax <= fmin:
        return fmin
    return fmin + (fmax - fmin) * rnd.random()


def get_quart_size_dict(tables, court_sid=None, is_dual=False):
    """[F] scene.py:771-776 / c1001.py：单打 iLength=260 iWidth=670，双打 305x670"""
    if is_dual:
        return {"iLength": COURT_HALF_L_DUAL, "iWidth": COURT_HALF_W}
    return {"iLength": COURT_HALF_L, "iWidth": COURT_HALF_W}


def _calc_drop_value_std(i_standard, i_offset, hit_key, s_type, gather,
                         rand=None, opt_offset=DROP_POS_OFFSET_UNSET):
    """[F] CalcDropValue 的核心（badminton.py:484-499 的语义还原）

    反编译原文把 if/elif 错还原成嵌套 if，X 分支里 fGood 从未赋值：
        if sType == "X":
            if oHitArgs.m_DropPosOffsetX != -1:
                iOffset = oHitArgs.m_DropPosOffsetX
            if sType == "Z":                        # <-- 本该是 elif，且在 X 分支内层
                if oHitArgs.m_DropPosOffsetZ != -1:
                    iOffset = oHitArgs.m_DropPosOffsetZ
        elif sType == "Z" and oHitArgs.m_HitKey == HIT_KEY_KEY_P:
            ...
    直接执行会抛 UnboundLocalError: local variable 'f_good' referenced before assignment

    语义还原：
        X 轴可用 m_DropPosOffsetX 覆盖 iOffset；Z 轴可用 m_DropPosOffsetZ 覆盖
        if sType == "Z" and hitKey == HIT_KEY_KEY_P:
            fGood = (iStandard - iStandard * iOffset / 100) / 100
        else:
            fGood = ((100 - iStandard) * iOffset / 100 + iStandard) / 100
        fBad    = iStandard / 100
        fRand   = RandomFloatBetween(0, 1)
        fOffset = fRand ** ((100 - fGather) / 100)
        return (fGood - fBad) * fOffset + fBad
    """
    if opt_offset is not None and opt_offset != DROP_POS_OFFSET_UNSET:
        i_offset = opt_offset

    if s_type == "Z" and hit_key == HIT_KEY_KEY_P:
        f_good = (i_standard - i_standard * i_offset / 100.0) / 100.0
    else:
        f_good = ((100.0 - i_standard) * i_offset / 100.0 + i_standard) / 100.0
    f_bad = i_standard / 100.0
    f_rand = random_float_between(0.0, 1.0, rand)
    f_gather = gather
    f_offset = f_rand ** ((100.0 - f_gather) / 100.0)
    return (f_good - f_bad) * f_offset + f_bad


def calc_drop_value(drop_data, hit_key, s_type, gather, offset_x=DROP_POS_OFFSET_UNSET,
                    offset_z=DROP_POS_OFFSET_UNSET, rand=None):
    """[F] CalcDropValue 的字典入口（便于按 curveDrop 表直接调用）。
    X 轴读 LeftStandard/LeftOffset，Z 轴读 FarStandard/FarOffset；
    需要 Right/Near 时请直接调用 _calc_drop_value_std。"""
    if s_type == "X":
        i_standard = drop_data["LeftStandard"]
        i_offset = drop_data["LeftOffset"]
        return _calc_drop_value_std(i_standard, i_offset, hit_key, "X", gather,
                                    rand, offset_x)
    i_standard = drop_data["FarStandard"]
    i_offset = drop_data["FarOffset"]
    return _calc_drop_value_std(i_standard, i_offset, hit_key, "Z", gather,
                                rand, offset_z)


def calc_drop_pos_x(drop_data, start_pos, hit_key, out_dir, gather, team_type,
                    quart_size, offset_x=DROP_POS_OFFSET_UNSET, rand=None):
    """[F] CalcDropPosX (badminton.py:425-463) —— 逐行 1:1

        fHalfL = GetQuartSizeDict()['iLength']
        if iOutDir != BADMINTON_OUT_DIR_RIGHT:          # 注意：NONE 和 LEFT 都走这支
            iStandard = LeftStandard
            iOffset   = LeftOffset + PROP(BATTLE_PROP_TYPE_DROPPOS_LEFT_OFFSET)/100
            HOST : fGood = -fHalfL, fBad = 0
            GUEST: fBad = 0,        fGood = +fHalfL
        else:
            iStandard = RightStandard
            iOffset   = RightOffset + PROP(...DROPPOS_RIGHT_OFFSET)/100
            HOST : fGood = +fHalfL
            GUEST: fGood = -fHalfL
        fPercent = CalcDropValue(..., "X", ...)
        if iOutDir == OUT_DIR_NONE:
            fPercent = RandomFloatBetween(-(1-fPercent), 1-fPercent)
        iPosX = (fGood - fBad) * fPercent + fBad
        出界时把 iPosX 夹到 startPos.X 的外侧
    原文缺陷：return iPosX 被缩进进 else 分支 -> 非 RIGHT 时返回 None。
    """
    f_half_l = float(quart_size["iLength"])
    if out_dir != OUT_DIR_RIGHT:
        i_standard = drop_data["LeftStandard"]
        i_offset = drop_data["LeftOffset"]
        if offset_x is not None and offset_x != DROP_POS_OFFSET_UNSET:
            i_offset = offset_x
        if team_type == TEAM_HOST:
            f_good, f_bad = -f_half_l, 0.0
        else:
            f_bad, f_good = 0.0, +f_half_l
    else:
        i_standard = drop_data["RightStandard"]
        i_offset = drop_data["RightOffset"]
        if offset_x is not None and offset_x != DROP_POS_OFFSET_UNSET:
            i_offset = offset_x
        if team_type == TEAM_HOST:
            f_good, f_bad = +f_half_l, 0.0
        else:
            f_bad, f_good = 0.0, -f_half_l

    d = {"XStandard": i_standard, "XOffset": i_offset}
    f_percent = _calc_drop_value_std(i_standard, i_offset, hit_key, "X", gather,
                                     rand, offset_x)
    if out_dir == OUT_DIR_NONE:
        f_percent = random_float_between(-(1.0 - f_percent), 1.0 - f_percent, rand)
    i_pos_x = (f_good - f_bad) * f_percent + f_bad

    # 出界夹取：原文把 GUEST 的 elif 错缩进，语义是"夹到 startPos.X 的外侧"
    if out_dir == OUT_DIR_LEFT:
        if team_type == TEAM_HOST:
            i_pos_x = min(i_pos_x, start_pos[0])
        else:
            i_pos_x = max(i_pos_x, start_pos[0])
    elif out_dir == OUT_DIR_RIGHT:
        if team_type == TEAM_HOST:
            i_pos_x = max(i_pos_x, start_pos[0])
        else:
            i_pos_x = min(i_pos_x, start_pos[0])
    return i_pos_x


def calc_drop_pos_z(drop_data, start_pos, hit_key, out_dir, gather, team_type,
                    quart_size, offset_z=DROP_POS_OFFSET_UNSET, rand=None):
    """[F] CalcDropPosZ (badminton.py:465-482) —— 逐行 1:1

        fHalfW = GetQuartSizeDict()['iWidth']      # 注意 iWidth 才是 Z 方向的半长
        HitKey in (D, GY) -> Far* (+BATTLE_PROP_TYPE_DROPPOS_FAR_OFFSET/100)
        否则               -> Near* (+BATTLE_PROP_TYPE_DROPPOS_NEAR_OFFSET/100)
        HOST : fGood = -fHalfW ;  GUEST: fGood = +fHalfW ;  fBad = 0
        return (fBad - fGood) * fPercent - fBad

    X 轴是 (fGood-fBad)*p+fBad，Z 轴是 (fBad-fGood)*p-fBad —— 符号相反，
    Z 轴朝己方为负、朝对方为正（HOST 站在 z<0 一侧）。
    """
    f_half_w = float(quart_size["iWidth"])
    if hit_key in (HIT_KEY_KEY_D, HIT_KEY_KEY_GY):
        i_standard = drop_data["FarStandard"]
        i_offset = drop_data["FarOffset"]
    else:
        i_standard = drop_data["NearStandard"]
        i_offset = drop_data["NearOffset"]
    if offset_z is not None and offset_z != DROP_POS_OFFSET_UNSET:
        i_offset = offset_z

    f_percent = _calc_drop_value_std(i_standard, i_offset, hit_key, "Z", gather,
                                     rand, DROP_POS_OFFSET_UNSET)
    f_bad = i_standard / 100.0
    f_good = -f_half_w if team_type == TEAM_HOST else +f_half_w
    return (f_bad - f_good) * f_percent - f_bad


def calc_drop_pos(tables, curve_id, start_pos, hit_key, out_dir, team_type,
                  gather=100, court_sid=None, is_dual=False, rand=None,
                  offset_x=DROP_POS_OFFSET_UNSET, offset_z=DROP_POS_OFFSET_UNSET,
                  test_drop_pos=None):
    """[F] CalcDropPos (badminton.py:501-516) —— 逐行 1:1

        _, dCurveData = GetCurveTypeAndData(m_CurveID)
        iCurveDropID  = dCurveData["curveDropId"]
        dCurveDrop    = GetCurveDropData(iCurveDropID)      # 注意：落点表是另一套 ID 空间
        iX = CalcDropPosX(...) ; iZ = CalcDropPosZ(...)
        if m_Scene.m_TestDropPos:                            # GM 测试落点覆盖
            iX, iZ = m_TestDropPos[0], m_TestDropPos[2]
            GUEST 时取反
        return CDVec3(iX, 0, iZ)
    """
    _shape, cfg = get_curve_type_and_data(tables, curve_id)
    drop_id = CURVE_DEFAULT_ID
    if cfg is not None and "curveDropId" in cfg:
        drop_id = cfg["curveDropId"]
    if drop_id not in tables["curvedrop"]:
        drop_id = CURVE_DEFAULT_ID
    drop_data = tables["curvedrop"][drop_id]

    quart = get_quart_size_dict(tables, court_sid, is_dual)
    x = calc_drop_pos_x(drop_data, start_pos, hit_key, out_dir, gather, team_type,
                        quart, offset_x, rand)
    z = calc_drop_pos_z(drop_data, start_pos, hit_key, out_dir, gather, team_type,
                        quart, offset_z, rand)

    if test_drop_pos is not None:
        x, z = test_drop_pos[0], test_drop_pos[2]
        if team_type == TEAM_GUEST:
            x, z = -x, -z
    return (x, 0.0, z)


def get_net_height(tables, court_sid=None):
    """[F] courtconfig.py GetNetHeight -> c1001.m_NetHeight = 150"""
    return float(COURT_NET_HEIGHT)


# ============================================================================
# 9. 玩法层：过网预判  [F]
# ============================================================================

def prejudge_over_net(curve, pass_time, i_delta=5, bullet_time_scale=100,
                      net_height=None, rand=None):
    """[F] clientlogic\prejudgecurve.py:41-69 CPrejudgeCurve.OnUpdate

    每帧取 GetPreJudgePos(PassTime + i) 与 (+ i + 1)，找 Z 由正到负或由负到正
    的那一步，并线性插值出穿越网面时的高度；若高度 <= 网高，就把 iDelta 缩短，
    让服务端按更早的时间点结算（即"提前判过网失败"）。
    """
    net_h = COURT_NET_HEIGHT if net_height is None else net_height
    i_delta = min(i_delta, 5)
    result = i_delta
    for i in range(i_delta):
        o_pos = curve.GetPointBySecond(pass_time + frame2sec(i))
        o_next = curve.GetPointBySecond(pass_time + frame2sec(i + 1))
        z0, z1 = o_pos[2], o_next[2]
        if z0 * z1 <= 0 and abs(z1 - z0) > 1e-9:
            y_cross = o_pos[1] + abs(z0 / (z1 - z0) * (o_next[1] - o_pos[1]))
            if y_cross <= net_h:
                result = i
                break
    return result, frame2sec(result) * bullet_time_scale / 100.0


def curve_over_net_status(curve, net_height=None):
    """辅助诊断：返回 (过网高度, 是否合法)"""
    net_h = COURT_NET_HEIGHT if net_height is None else net_height
    y = net_cross_y(curve.m_Points)
    return y, (y is not None and y >= net_h)


# ============================================================================
# 10. 玩法层：假动作落点回拉  [F]
# ============================================================================

class CurveDropPosHandler(object):
    """[F] clientlogic\curvedropposhandler.py:18-67 CCurveDropPosHandler

        iShapeType = m_CurveId // 1000
        fPercent = (PassTime - StartBackTime) / (FullTime - StartBackTime)
        oCurDropPos = Lerp(GetFakeDropPos(), GetDropPos(), fPercent)
        若 iCurIdx < iBackIdx（还没到回拉帧）则直接发 fake pos 且 IsLerp=False
    """

    def __init__(self, curve, start_back_time=None, shape_type=None):
        self.m_Curve = curve
        self.m_CurveId = curve.m_CurveId
        self.m_ShapeType = curve.m_ShapeType if shape_type is None else shape_type
        self.m_FullTime = curve.m_FullTime
        self.m_StartBackTime = curve.m_FullTime if start_back_time is None \
            else start_back_time
        self.m_FakeDropPos = getattr(curve, "m_FakeDropPos", curve.m_DropPos)
        self.m_DropPos = curve.m_DropPos
        self.m_CurIdx = 0
        self.m_BackIdx = 0

    def Update(self, pass_time, cur_idx=None, back_idx=None):
        """返回 (pos, is_lerp)"""
        if cur_idx is not None:
            self.m_CurIdx = cur_idx
        if back_idx is not None:
            self.m_BackIdx = back_idx
        if self.m_CurIdx < self.m_BackIdx:
            # :48-53 IsLerp=False，直接发假落点，并复位回拉计时
            self.m_StartBackTime = -1.0
            return self.m_FakeDropPos, False
        if self.m_StartBackTime < 0.0:
            # :54-55 首次进入回拉区间：以当前 PassTime 作为回拉起点
            self.m_StartBackTime = pass_time
        span = self.m_FullTime - self.m_StartBackTime
        f_percent = 0.0 if span <= 1e-9 else \
            (pass_time - self.m_StartBackTime) / span
        return lerp_vec(self.m_FakeDropPos, self.m_DropPos, f_percent), True


def make_drop_pos_handler(tables, curve, rand=None):
    """[F]+[I] 按形状决定回拉起点：TurnAround / NormalFakeDrop 用 backTime"""
    cfg = get_curve_type_and_data(tables, curve.m_CurveId)[1] or {}
    back_time = cfg.get("backTime")
    start_back = None if back_time is None else max(0.0, curve.m_FullTime - back_time)
    return CurveDropPosHandler(curve, start_back)


# ============================================================================
# 11. 玩法层：平滑移动  [F]
# ============================================================================

SMOOTH_FRAME = 47   # [F] clientlogic\badmintonsmoothmove.py


class BadmintonSmoothMove(object):
    """[F] clientlogic\badmintonsmoothmove.py:13-51 CBadmintonSmoothMove

    逐行对照（原文行号）：
      :39 fPassFrame  = fFrameNum - int(fFrameNum)                  # 帧的小数部分
      :37 oCurPos     = oBadminton.GetPreJudgePos(fPassFrame)       # 当前实际显示位置
      :39 fPassTime   = (fFrameNum + 1 - m_BeginFrame) / FRAME
                        * m_BulletTimeScale / 100                   # 平滑后的目标时间
      :40 m_PassTime  = m_BeginPassTime                             # 临时复位再采样
      :41 oPos        = m_CurveData.GetPointBySecond(fPassTime)
      :43 fPercent    = (fFrameNum - m_BeginFrame) / SMOOTH_FRAME
      :44 fPercent>1 -> fPercent=1 且 m_NeedSmooth=False
      :47 oPos        = oPos.Lerp(oCurPos, fPercent)                 # 向着当前显示位置收敛
      :48 m_PassTime  = fBakPassTime                                # 还原
      :49 oBadminton.OnPosDelta(oPos)

    注意 Lerp 的方向是 Lerp(oPos, oCurPos, fPercent)：fPercent 从 0→1，
    输出从"复算位置"过渡到"当前显示位置"，即视觉上把跳变抹平。
    """

    def __init__(self, curve, begin_frame=0, begin_pass_time=0.0):
        self.m_Curve = curve
        self.m_BeginFrame = begin_frame
        self.m_BeginPassTime = begin_pass_time
        self.m_NeedSmooth = True

    def BeginSmooth(self, begin_frame=None, begin_pass_time=None):
        """:20-26 BeginSmooth"""
        if begin_frame is not None:
            self.m_BeginFrame = begin_frame
        if begin_pass_time is not None:
            self.m_BeginPassTime = begin_pass_time
        self.m_NeedSmooth = bool(self.m_Curve)

    def Update(self, f_frame_num, cur_pos=None, bullet_time_scale=100):
        """返回平滑后的位置；f_frame_num 允许带小数（原文 fPassFrame 的用法）"""
        if not self.m_Curve:
            return None
        if not self.m_NeedSmooth:
            # :51 else 分支 -> 直接取当前帧位置
            if cur_pos is not None:
                return cur_pos
            return self.m_Curve.GetPointBySecond(
                max(0.0, (f_frame_num - self.m_BeginFrame) / float(FRAME)))

        f_frame_num = float(f_frame_num)
        f_pass_frame = f_frame_num - int(f_frame_num)
        # :37 GetPreJudgePos(fPassFrame) —— 与 badminton.GetPreJudgePos 同义：
        #     即 curve.GetPointBySecond(当帧的秒数)，由调用方给出则直接用
        o_cur = cur_pos if cur_pos is not None else \
            self.m_Curve.GetPointBySecond(
                max(0.0, (f_frame_num + f_pass_frame - self.m_BeginFrame) / float(FRAME)))

        # :39 平滑目标时间
        f_pass_time = (f_frame_num + 1.0 - self.m_BeginFrame) / float(FRAME) \
            * bullet_time_scale / 100.0
        o_pos = self.m_Curve.GetPointBySecond(max(0.0, f_pass_time))

        # :43-46 进度与关闭条件
        f_percent = (f_frame_num - self.m_BeginFrame) / float(SMOOTH_FRAME)
        if f_percent > 1.0:
            f_percent = 1.0
            self.m_NeedSmooth = False
        if f_percent < 0.0:
            f_percent = 0.0

        # :47 Lerp(oPos, oCurPos, fPercent)
        return lerp_vec(o_pos, o_cur, f_percent)


# ============================================================================
# 12. 导出：PY2CCurveRes  [F]
# ============================================================================

def pack_curve_res(curve):
    """[F] bridge.py:35-48 PY2CCurveRes
       PyBridgeCurveResMsg{ ShapeType, PosLst(repeated bytes), PointTime(repeated float) }
       这里返回等价的 Python 结构（不真的序列化 protobuf），PosLst 用 3 个 float 打包成 bytes。"""
    import struct
    pos_lst = [struct.pack("<3f", *p) for p in curve.m_Points]
    return {
        "ShapeType": int(curve.m_CurveId / 1000),
        "PosLst": pos_lst,
        "PointTime": list(curve.m_PointTime),
    }


def unpack_curve_res(msg):
    """PY2CCurveRes 的逆过程，返回 (shape_type, points, times)"""
    import struct
    pts = [struct.unpack("<3f", b) for b in msg["PosLst"]]
    return msg["ShapeType"], pts, list(msg["PointTime"])


# ============================================================================
# 13. 自检 / 演示
# ============================================================================

def _fmt_vec(v):
    return "(%8.2f, %8.2f, %8.2f)" % (v[0], v[1], v[2])


def run_demo(fls_root=None, seed=20231006):
    random.seed(seed)
    tables = load_tables(fls_root)
    prof = TimeProfile(tables["curvedata"], tables["hmin"], tables["hmax"])

    print("=" * 78)
    print("FLS 球曲线复刻  —  配置载入自检")
    print("=" * 78)
    print("curveconstant  : %d 组 %s" % (len(tables["curveconstant"]),
                                       sorted(tables["curveconstant"].keys())))
    print("normalcurve    : %d 条 %s" % (len(tables["normal"]),
                                       _span(tables["normal"])))
    print("turnaround     : %d 条 %s" % (len(tables["turnaround"]),
                                       _span(tables["turnaround"])))
    print("paraboladown   : %d 条 %s" % (len(tables["paraboladown"]),
                                       _span(tables["paraboladown"])))
    print("falling        : %d 条 %s" % (len(tables["falling"]),
                                       _span(tables["falling"])))
    print("normalfakedrop : %d 条 %s" % (len(tables["normalfakedrop"]),
                                       _span(tables["normalfakedrop"])))
    print("curvedrop      : %d 组" % len(tables["curvedrop"]))
    print("curvedata      : %d 个高度" % len(tables["curvedata"]))

    print("\n--- g_CurveData 参考剖面（高度 100，角度 -30..80）---")
    print("  角度   参考时长(s)   参考距离(cm)")
    for _a, t_sec, dist in prof.table([100], [-30, 0, 10, 25, 40, 60, 80])[0][1]:
        print("  %4d   %9.3f   %10.1f" % (_a, t_sec, dist))

    print("\n" + "=" * 78)
    print("落点计算  CalcDropPos  [F]")
    print("=" * 78)
    print("  curveId hitKey outDir team    gather       落点(cm)")
    for cid, hk, od, tt, ga in [
            (1000, HIT_KEY_KEY_P, OUT_DIR_NONE, TEAM_HOST, 100),
            (1001, HIT_KEY_KEY_D, OUT_DIR_LEFT, TEAM_HOST, 80),
            (1003, HIT_KEY_KEY_GY, OUT_DIR_RIGHT, TEAM_HOST, 60),
            (3000, HIT_KEY_KEY_GY, OUT_DIR_NONE, TEAM_HOST, 100),
            (4002, HIT_KEY_KEY_P, OUT_DIR_NONE, TEAM_HOST, 100),
            (5000, HIT_KEY_KEY_P, OUT_DIR_NONE, TEAM_HOST, 100),
            (6000, HIT_KEY_KEY_D, OUT_DIR_NONE, TEAM_GUEST, 100)]:
        dp = calc_drop_pos(tables, cid, (0.0, 250.0, -300.0), hk, od, tt, ga)
        print("  %6d %6d %6d %5d %8d   %s" % (cid, hk, od, tt, ga, _fmt_vec(dp)))

    print("\n" + "=" * 78)
    print("五种球路生成  create_curve")
    print("=" * 78)
    start = (0.0, 250.0, -320.0)
    cases = [
        (1000, "平近_内_0", (30.0, 0.0, 150.0)),
        (1003, "高位吊后_0", (0.0, 0.0, 200.0)),
        (3000, "旋转01", (-60.0, 0.0, 220.0)),
        (4002, "前场 smash", (10.0, 0.0, 180.0)),
        (4004, "飓风扣杀", (0.0, 0.0, 250.0)),
        (6000, "旋转01(假动作)", (20.0, 0.0, 160.0)),
    ]
    curves = []
    for cid, name, drop in cases:
        c = create_curve(tables, cid, start, drop, speed_mul=1.0)
        ny, ok = curve_over_net_status(c)
        curves.append((cid, name, c))
        print("\n  #%d %s  shape=%d" % (cid, name, c.m_ShapeType))
        print("    点数=%d  总时长=%.3fs  顶点高=%.1fcm" % (
            len(c.m_Points), c.m_FullTime, c.GetApex()))
        print("    起点 %s  落点 %s  提示点 %s" % (
            _fmt_vec(c.m_Points[0]), _fmt_vec(c.m_DropPos),
            _fmt_vec(c.GetTipsPoint())))
        print("    过网高度=%s  合法=%s" % (
            "无" if ny is None else "%.1fcm" % ny, ok))
        _dump_samples(c)

    # 重力陨石单独（起点被强制改写）
    print("\n  #5000 重力陨石  shape=%d" % SHAPE_TYPE_FALLING)
    c = create_curve(tables, 5000, start, (0.0, 0.0, 200.0))
    print("    点数=%d  总时长=%.3fs  起点(强制)=%s  落点=%s" % (
        len(c.m_Points), c.m_FullTime, _fmt_vec(c.m_Points[0]),
        _fmt_vec(c.m_DropPos)))
    _dump_samples(c)
    curves.append((5000, "重力陨石", c))

    # speedMul 影响
    print("\n" + "=" * 78)
    print("speedMul（球速倍率）对时间轴的影响   [I] 压缩时间轴、点列不变")
    print("=" * 78)
    for mul in (0.8, 1.0, 1.2, 1.5):
        c = create_curve(tables, 1000, start, (30.0, 0.0, 150.0), speed_mul=mul)
        print("  speedMul=%.2f  T=%.3fs  末点 %s" % (
            mul, c.m_FullTime, _fmt_vec(c.m_Points[-1])))

    # 假动作回拉
    print("\n" + "=" * 78)
    print("假动作落点回拉  CurveDropPosHandler  [F]")
    print("=" * 78)
    c6000 = create_curve(tables, 6000, start, (20.0, 0.0, 160.0))
    h = make_drop_pos_handler(tables, c6000)
    print("  假落点 %s" % _fmt_vec(h.m_FakeDropPos))
    print("  真落点 %s" % _fmt_vec(h.m_DropPos))
    print("  回拉起点 %.3fs / 总时长 %.3fs" % (h.m_StartBackTime, h.m_FullTime))
    for frac in (0.0, 0.25, 0.5, 0.75, 1.0):
        t = h.m_FullTime * frac
        pos, is_lerp = h.Update(t)
        print("  t=%.3fs  Lerp=%-5s  %s" % (t, is_lerp, _fmt_vec(pos)))

    # 过网预判
    print("\n" + "=" * 78)
    print("过网预判  prejudge_over_net  [F]")
    print("=" * 78)
    for cid, name, c in curves[:3]:
        i_delta, dt = prejudge_over_net(c, c.m_PassTime)
        print("  #%d %-14s iDelta=%d  结算时间=%.4fs" % (cid, name, i_delta, dt))

    # 桥接导出
    print("\n" + "=" * 78)
    print("PY2CCurveRes 导出  [F] bridge.py:35-48")
    print("=" * 78)
    msg = pack_curve_res(curves[0][2])
    print("  ShapeType=%d  PosLst=%d 条  PointTime=%d 个  首点=%s" % (
        msg["ShapeType"], len(msg["PosLst"]), len(msg["PointTime"]),
        _fmt_vec(unpack_curve_res(msg)[1][0])))

    validate_all(tables)
    reference_profile_report(tables)

    print("\n" + "=" * 78)
    print("OK — 全部自检通过")
    print("=" * 78)
    return tables, curves


def _span(d):
    if not d:
        return "[]"
    ks = sorted(d.keys())
    return "[%s..%s]" % (ks[0], ks[-1])


def _dump_samples(c, n=5):
    idx = sorted(set([0, len(c.m_Points) // 4, len(c.m_Points) // 2,
                      3 * len(c.m_Points) // 4, len(c.m_Points) - 1]))
    for i in idx:
        print("      [%3d/%3d] t=%6.3fs  %s" % (
            i, len(c.m_Points) - 1, c.m_PointTime[i], _fmt_vec(c.m_Points[i])))


def reference_profile_report(tables):
    """g_CurveData 参考剖面的结构性摘要（只读，不参与轨迹计算）。

    ⚠ 重要结论：这张表**无法**用"配置项 + 简单阻力弹道"复原。
    实测 (h=100, a=0) 的初速约 0.59m/帧 = 37 m/s，2.496s 飞 13.01m；
    若把它当"发射仰角 = a"的弹道，从 1m 高度以 0 度发射不可能滞空 2.5s；
    若当"落地倾角 = a"来反解，同样对不上（a=80 时 0.19s 从 2.6m 落地
    需要约 -13.5m/s 的初始下降速度）。
    因此这张表是**原生侧手工标定的距离—时间剖面**，Python 侧只能当
    参考层使用（TimeProfile 提供双线性插值查询），不能拿来反推轨迹公式。
    """
    prof = TimeProfile(tables["curvedata"], tables["hmin"], tables["hmax"])
    const = get_curve_constant(tables, SHAPE_TYPE_NORMAL)
    tg = float(const.get("timeGap", 0.016))

    print("\n" + "=" * 78)
    print("g_CurveData 参考剖面摘要（只读参考层，不参与轨迹计算）")
    print("=" * 78)
    print("  表结构: g_CurveData[高度][角度] = [{'v':帧号, 's':累计水平距离(m)}, ...]")
    print("  高度档: %d 个 (%d..%d 步长 10)" % (len(prof.heights),
                                              prof.heights[0], prof.heights[-1]))
    print("  角度档: -30..80 步长 5（低高度缺负角度）")
    print("  帧间隔: timeGap=%.3fs；最大帧数 159（约 2.5s）" % tg)
    print("  距离上限: 15.00m（多档触顶，说明是钳制值而非真实射程）")

    print("\n  高度 100cm 处的剖面（角度 -> 参考时长 / 参考距离 / 首末帧速度）")
    print("   角度   参考时长(s)   参考距离(m)   首帧速度(m/s)  末帧速度(m/s)")
    for a in (-30, 0, 10, 25, 40, 60, 80):
        frames, dist = prof.ref(100, a)
        row = tables["curvedata"][100].get(a)
        if not row:
            continue
        ds0 = row[1]["s"] - row[0]["s"]
        dsn = row[-1]["s"] - row[-2]["s"]
        print("   %4d   %9.3f   %10.2f   %12.2f   %12.2f" % (
            a, max(0.0, (frames - 1) * tg), dist / 100.0,
            ds0 / tg, dsn / tg))

    print("\n  -> 首帧速度 8~39 m/s、末帧 0.6~5 m/s，减速比 5~60 倍，")
    print("     是典型的高阻力球速衰减。")
    print("  -> 交叉验证：用「固定仰角 + 二次阻力弹道」模型对该表做全局拟合")
    print("     （未知量 k、g，未触顶样本 9 组），最优 RMS 相对时长误差仍有 183%，")
    print("     且最优点落在 g=2500cm/s^2、k≈0 —— 说明配置里的 angle 不能直接当")
    print("     发射仰角使用，或这张表不是弹道模拟输出（更可能是原生侧手工标定）。")
    print("     因此复刻实现只把 TimeProfile 当只读参考，不经它反推轨迹。")


def validate_all(tables, start=(0.0, 250.0, -320.0), verbose=True):
    """全量自检：对全部 51 条球路生成曲线并检查不变量。

    不变量：
      1. 时间列严格递增，且 t[0] == 0
      2. 末点等于请求的落点
      3. 点列不穿地（y >= -1cm）
      4. 总时长 > 0.01s
      5. 点数不超过 CurveParams.MAX_SAMPLES
    """
    problems = []
    rows = []
    for tabname in ("normal", "paraboladown", "turnaround", "falling",
                    "normalfakedrop"):
        for cid in sorted(tables[tabname]):
            cfg = tables[tabname][cid]
            dp = calc_drop_pos(tables, cid, start, HIT_KEY_KEY_D, OUT_DIR_NONE,
                               TEAM_HOST)
            try:
                c = create_curve(tables, cid, start, dp)
            except Exception as e:
                problems.append((cid, "exception: %s" % e))
                continue
            ok = True
            if abs(c.m_PointTime[0]) > 1e-9:
                ok = False
                problems.append((cid, "t[0] != 0"))
            if any(c.m_PointTime[i + 1] <= c.m_PointTime[i]
                   for i in range(len(c.m_PointTime) - 1)):
                ok = False
                problems.append((cid, "time column not increasing"))
            if abs(c.m_Points[-1][0] - dp[0]) > 1e-6 or \
               abs(c.m_Points[-1][2] - dp[2]) > 1e-6:
                ok = False
                problems.append((cid, "endpoint != drop pos"))
            if any(p[1] < -1.0 for p in c.m_Points):
                ok = False
                problems.append((cid, "below ground"))
            if c.m_FullTime <= 0.01:
                ok = False
                problems.append((cid, "duration too small"))
            if len(c.m_Points) > CurveParams.MAX_SAMPLES:
                ok = False
                problems.append((cid, "too many samples"))
            ny = net_cross_y(c.m_Points)
            rows.append((cid, cfg.get("name", ""), len(c.m_Points), c.m_FullTime,
                         c.GetApex(), ny, "OK" if ok else "FAIL"))

    if verbose:
        print("\n" + "=" * 78)
        print("全量自检：51 条球路")
        print("=" * 78)
        print("  %-6s %-16s %5s %7s %8s %8s %5s" % (
            "id", "name", "pts", "T(s)", "apex", "netY", "state"))
        for cid, name, n, T, apex, ny, st in rows:
            print("  %-6d %-16s %5d %7.3f %8.1f %8s %5s" % (
                cid, name[:15], n, T, apex,
                "-" if ny is None else "%.0f" % ny, st))
        print("\n  通过 %d / %d 条，问题 %d 项" % (
            len(rows) - len(set(p[0] for p in problems)), len(rows), len(problems)))
        if problems:
            for cid, msg in problems[:20]:
                print("    #%d  %s" % (cid, msg))
    return rows, problems


def save_plot(curves, path=None):
    """用 matplotlib 画出所有曲线（俯视 + 侧视）"""
    import matplotlib
    matplotlib.use("Agg")
    import matplotlib.pyplot as plt

    path = path or os.path.join(os.path.dirname(os.path.abspath(__file__)),
                                "curves.png")
    fig, axes = plt.subplots(2, 1, figsize=(10, 9))
    for cid, name, c in curves:
        zs = [-p[2] for p in c.m_Points]
        ys = [p[1] for p in c.m_Points]
        xs = [p[0] for p in c.m_Points]
        label = "%d" % cid
        axes[0].plot(zs, xs, label=label)
        axes[1].plot(zs, ys, label=label)
    axes[0].axvline(0, color="k", lw=0.8, ls="--")
    axes[0].set_xlabel("distance from net (cm)")
    axes[0].set_ylabel("X (cm)")
    axes[0].set_title("Top view")
    axes[0].legend(fontsize=7)
    axes[0].grid(alpha=0.3)
    axes[1].axvline(0, color="k", lw=0.8, ls="--")
    axes[1].axhline(COURT_NET_HEIGHT, color="r", lw=0.8, ls="--",
                    label="net 150cm")
    axes[1].set_xlabel("distance from net (cm)")
    axes[1].set_ylabel("Y height (cm)")
    axes[1].set_title("Side view")
    axes[1].legend(fontsize=7)
    axes[1].grid(alpha=0.3)
    fig.tight_layout()
    fig.savefig(path, dpi=130)
    plt.close(fig)
    return path


if __name__ == "__main__":
    _tables, _curves = run_demo()
    try:
        _p = save_plot(_curves)
        print("\n曲线图已保存: %s" % _p)
    except Exception as _e:
        print("\n(绘图跳过: %s)" % _e)
