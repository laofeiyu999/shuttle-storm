

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
    if speed_mul is None or speed_mul <= 0 or abs(speed_mul - 1.0) < 1e-9:
        return c
    c.m_PointTime = [t / speed_mul for t in c.m_PointTime]
    c.m_FullTime = c.m_PointTime[-1] if c.m_PointTime else 0.0
    return c
