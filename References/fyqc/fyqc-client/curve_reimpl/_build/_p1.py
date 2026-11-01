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
