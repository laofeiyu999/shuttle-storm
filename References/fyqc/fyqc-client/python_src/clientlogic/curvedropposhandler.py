# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\clientlogic\curvedropposhandler.py
# Compiled at: 2023-04-06 17:03:30
# Size of source mod 2**32: 2313 bytes
from base.protobufdata import BattleCmd_pb2
from battlelogic.battlebase.dvec3 import CDVec3
from battlelogic.common.defines import Time2Frame
from battlelogic.battlebase.dmath import Lerp
from battlelogic.common.debug import Log, LogWarning, LogError, Profiler

class CCurveDropPosHandler:

    def __init__(self):
        self.m_StartBackTime = -1

    @Profiler
    def Update(self, oGame, oPlayer, iFrameNum):
        oBadminton = oGame.m_Scene.GetFirstBadminton()
        if not oBadminton:
            return
        else:
            oCurveData = oBadminton.m_CurveData
            if not oCurveData:
                self.ResetStartBackTime()
                return
            iCurIdx = oBadminton.GetCurPointIndex()
            iShapeType = oCurveData.m_CurveId // 1000
            if iShapeType == BattleCmd_pb2.SHAPE_TYPE_TURN_AROUND:
                oMsg = self.HandleTurnAroundDropPos(iCurIdx, oCurveData)
            elif iShapeType == BattleCmd_pb2.SHAPE_TYPE_NORMAL_FAKE_DROP:
                oMsg = self.HandleNormalFakeDropPos(iCurIdx, oCurveData)
            else:
                return
        if not oMsg:
            return
        oGame.m_Scene.AddDelta(BattleCmd_pb2.BATTLE_UPDATE_DROP_POS, oMsg)

    def HandleTurnAroundDropPos(self, iCurIdx, oCurveData):
        return self.MakeFakeDropPosMsg(oCurveData.m_TurnBackIdx, iCurIdx, oCurveData)

    def HandleNormalFakeDropPos(self, iCurIdx, oCurveData):
        return self.MakeFakeDropPosMsg(oCurveData.m_DropPosBackIdx, iCurIdx, oCurveData)

    def MakeFakeDropPosMsg(self, iBackIdx, iCurIdx, oCurveData):
        oMsg = BattleCmd_pb2.BattleUpdateDropPosMsg()
        if iCurIdx < iBackIdx:
            oMsg.IsLerp = False
            x, y, z = oCurveData.GetFakeDropPos()
            oCurDropPos = CDVec3(x, y, z)
            oMsg.DropPos = oCurDropPos.PackVec3()
            self.ResetStartBackTime()
        elif self.m_StartBackTime == -1:
            self.m_StartBackTime = oCurveData.m_PassTime
        oMsg.IsLerp = True
        fPercent = (oCurveData.m_PassTime - self.m_StartBackTime) / (oCurveData.m_FullTime - self.m_StartBackTime)
        x, y, z = oCurveData.GetFakeDropPos()
        oFakeDropPos = CDVec3(x, y, z)
        x, y, z = oCurveData.GetDropPos()
        oDropPos = CDVec3(x, y, z)
        oCurDropPos = Lerp(oFakeDropPos, oDropPos, fPercent)
        oMsg.DropPos = oCurDropPos.PackVec3()
        return oMsg

    def ResetStartBackTime(self):
        self.m_StartBackTime = -1
