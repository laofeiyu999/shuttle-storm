# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\clientlogic\badmintonsmoothmove.py
# Compiled at: 2023-04-06 17:03:30
# Size of source mod 2**32: 1873 bytes
from base.protobufdata import BattleCmd_pb2
from battlelogic.common.defines import HITACTION_PREJUDGE_FRAME
from battlelogic.battlebase.dvec3 import CDVec3
from battlelogic.common.debug import Log, LogWarning, LogError, Profiler
from battlelogic.common.defines import FRAME

class CBadmintonSmoothMove:
    SMOOTH_FRAME = 47

    def __init__(self):
        self.m_BeginFrame = 0
        self.m_BeginPassTime = 0

    def BeginSmooth(self, oGame):
        oBadminton = oGame.m_Scene.GetFirstBadminton()
        if not oBadminton.m_CurveData:
            return
        oBadminton.m_CurveData.m_NeedSmooth = True
        self.m_BeginFrame = oGame.m_Scene.m_FrameNum
        self.m_BeginPassTime = oBadminton.m_CurveData.m_PassTime

    @Profiler
    def Update(self, oGame, oPlayer, fFrameNum):
        oBadminton = oGame.m_Scene.GetFirstBadminton()
        if not oBadminton.m_CurveData:
            return
        else:
            bNeedSmooth = getattr(oBadminton.m_CurveData, "m_NeedSmooth", False)
            if bNeedSmooth and not oBadminton.m_CurveData.m_Hited:
                fPassFrame = fFrameNum - int(fFrameNum)
                oCurPos = oBadminton.GetPreJudgePos(fPassFrame)
                fBakPassTime = oBadminton.m_CurveData.m_PassTime
                fPassTime = (fFrameNum + 1 - self.m_BeginFrame) / FRAME * oBadminton.m_BulletTimeScaleMgr.m_BulletTimeScale / 100
                oBadminton.m_CurveData.m_PassTime = self.m_BeginPassTime
                x, y, z = oBadminton.m_CurveData.GetPointBySecond(fPassTime)
                oPos = CDVec3(x, y, z)
                fPercent = (fFrameNum - self.m_BeginFrame) / self.SMOOTH_FRAME
                if fPercent > 1.0:
                    fPercent = 1.0
                    oBadminton.m_CurveData.m_NeedSmooth = False
                oPos = oPos.Lerp(oCurPos, fPercent)
                oBadminton.m_CurveData.m_PassTime = fBakPassTime
                oBadminton.OnPosDelta(oPos)
            else:
                oBadminton.OnPosDelta()
