# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\sceneplugins\gameai\gameairerun.py
# Compiled at: 2023-04-06 17:07:52
# Size of source mod 2**32: 2783 bytes
from .gameai import CGameAI
from base.data import GetHitActionData
from base.protobufdata import BattleCmd_pb2
from battlelogic.common.debug import LogError
from base.protobufdata import Common_pb2
from base.robot.gameai import GetAIHitKeyByHitKey
from .defines import CalcGameAIDifficultyLevel

class CGameAIReRun(CGameAI):

    def __init__(self, oScene):
        super().__init__(oScene)
        self.m_PlayerLastActionID = {}

    def FormatReqActionSceneStatus(self, dReqData):
        super().FormatReqActionSceneStatus(dReqData)
        dReqData["t1p"] = self.m_Scene.GetTeamScore(Common_pb2.TEAM_MEMBER_TYPE_HOST)
        dReqData["t2p"] = self.m_Scene.GetTeamScore(Common_pb2.TEAM_MEMBER_TYPE_GUEST)

    def FormatReqActionBadmintonStatus(self, dBadmintonData):
        super().FormatReqActionBadmintonStatus(dBadmintonData)
        dBadmintonData["vhs"] = []
        for oPlayer in self.m_Scene.GetAllPlayer():
            if oPlayer.CouldHitBadminton():
                dBadmintonData["vhs"].append(oPlayer.m_ID)

    def DoFormatReqActionPlayerStatus(self, oPlayer, dPlayerData):
        super().DoFormatReqActionPlayerStatus(oPlayer, dPlayerData)
        pid = oPlayer.m_ID
        dPlayerData["lv"] = oPlayer.Grade()
        dPlayerData["ihr"] = 0
        if oPlayer.IsInHitRange():
            dPlayerData["ihr"] = 1
        elif oPlayer.GetMoveType() == BattleCmd_pb2.MOVE_TYPE_STAND:
            dPlayerData["mt"] = 0
        else:
            dPlayerData["mt"] = 1
        iCouldDoAction = 0
        if oPlayer.CouldDoAction():
            if self.m_Scene.IsServePlayer(pid):
                iCouldDoAction = 1
            elif oPlayer.CouldHitBadminton():
                iCouldDoAction = 1
        dPlayerData["cdh"] = iCouldDoAction
        iHitKey = oPlayer.GetHitKey()
        iAIHitKey = GetAIHitKeyByHitKey(iHitKey)
        dPlayerData["hk"] = iAIHitKey
        dPlayerData["elo"] = oPlayer.Elo()
        dPlayerData["al"] = CalcGameAIDifficultyLevel(self.CalcPlayerAvgElo())
        oHitAction = oPlayer.m_DoHitAction.m_HitAction
        iNewActionID = 0
        if oHitAction:
            iCurHitActionID = oHitAction.m_ID
            iLastActionID = self.m_PlayerLastActionID.get(pid, 0)
            if iLastActionID != iCurHitActionID:
                self.m_PlayerLastActionID[pid] = iCurHitActionID
                iNewActionID = iCurHitActionID
            if iNewActionID:
                iHitQuality = 0
                oHitAction = GetHitActionData(iNewActionID)
                if oHitAction.m_HitActionType == BattleCmd_pb2.HIT_ACTION_TYPE_INSIDE:
                    iHitQuality = 1
            elif oHitAction.m_HitActionType == BattleCmd_pb2.HIT_ACTION_TYPE_MIDDLE:
                iHitQuality = 2
        else:
            if oHitAction.m_HitActionType == BattleCmd_pb2.HIT_ACTION_TYPE_OUTSIDE:
                iHitQuality = 3
        dPlayerData["hq"] = iHitQuality

    def DoFormatReqActionPlayerSkillStatus(self, oPlayer, iSkillID, dData):
        super().DoFormatReqActionPlayerSkillStatus(oPlayer, iSkillID, dData)
        dData["lv"] = oPlayer.GetSkillLevel(iSkillID)
