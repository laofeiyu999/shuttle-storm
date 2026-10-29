# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\badminton\fakebadminton.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 2218 bytes
from . import CHitBadmintonArgs
from .badminton import CBadminton
from base.protobufdata import BattleCmd_pb2
from battlelogic.common.decorator import ClientOnly
from battlelogic.common.debug import LogError
from battlelogic.battlebase.dvec3 import CDVec3
import random

class CFakeBadminton(CBadminton):

    def __init__(self, iID, oScene):
        super(CFakeBadminton, self).__init__(iID, oScene)
        self.m_SceneObjectType = BattleCmd_pb2.SCENE_OBJECT_TYPE_FAKE_BADMINTON

    def InitAfterEnterScene(self):
        return

    def ExecuteLoop(self):
        return

    @ClientOnly
    def SetFakeCurve(self, oMsg, iHitKey, iOutDir):
        oHitArgs = CHitBadmintonArgs()
        self.m_HitBadmintonArgs = oHitArgs
        oHitArgs.m_AtkPlayerID = oMsg.OwnerID
        oHitArgs.m_CurveID = oMsg.CurveID
        oHitArgs.m_AverageSpeedMul = oMsg.AverageSpeedMul
        oHitArgs.m_HitKey, oHitArgs.m_OutDir = iHitKey, iOutDir
        oHitArgs.m_DropPosOffsetX = oMsg.DropPosOffsetX
        oHitArgs.m_DropPosOffsetZ = oMsg.DropPosOffsetZ
        oStartPos = oHitArgs.m_StartPos = CDVec3.UnpackCDVec3(oMsg.StartPos)
        oScene = self.GetScene()
        if not oScene:
            return
        oAttPlayer = oScene.GetPlayer(oHitArgs.m_AtkPlayerID)
        oDropPos = oHitArgs.m_DropPos = self.CalcDropPos(oAttPlayer, oHitArgs)
        if oStartPos.m_Y <= 0:
            oStartPos.m_Y = 0.1
        oCurveData = self.m_Scene.m_Phys.CreateCurve(oStartPos.m_X, oStartPos.m_Y, oStartPos.m_Z, oDropPos.m_X, oDropPos.m_Y, oDropPos.m_Z, oHitArgs.m_CurveID, oHitArgs.m_AverageSpeedMul / 10000)
        oCurveData.m_OwnerID = oAttPlayer.m_ID
        self.SetCurveData(oCurveData)
        self.m_CurvePrediction.OnHitBadminton(oHitArgs.m_HitKey, oHitArgs.m_CurveID, oStartPos, oDropPos, self.GetTipsPos())

    def SetHidePos(self):
        oBadminton = self.m_Scene.GetFirstBadminton()
        self.SetPos(oBadminton.m_Pos)

    def OnSceneBattleEvent(self, iEventType, dEventData):
        return

    def OnBattleEvent(self, iEventType, dEventData):
        return

    def OnSimulateFinished(self):
        return
