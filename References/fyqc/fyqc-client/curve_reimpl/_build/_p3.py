

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
