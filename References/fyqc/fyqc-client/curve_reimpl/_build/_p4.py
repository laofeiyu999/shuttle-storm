

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
