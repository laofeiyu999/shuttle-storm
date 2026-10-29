# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\scenetest.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 4761 bytes
from .scenebattle import CSceneBattle
from base.data import GetBOTPlayerData
from base.protobufdata import Common_pb2
from battlelogic.common.defines import GetEnemyMemberType
from base.protobufdata import BattleCmd_pb2
from battlelogic.common.defines import IsPlayerObjectID
from battlelogic.common.debug import Log, LogWarning, LogError
from battlelogic.battlebase.dvec3 import CDVec3
from base.data import GetCourtData

class CSceneTest(CSceneBattle):

    def __init__(self, iGameID, iRandomSeed, iGameMode, iBattleMode, iOwnerID, iSceneIndex):
        super().__init__(iGameID, iRandomSeed, iGameMode, iBattleMode, iOwnerID, iSceneIndex)
        self.m_AICurveID = 0
        self.m_IsStopServe = False
        self.m_AIHitHigh = BattleCmd_pb2.HIT_HIGH_TYPE_NONE
        self.m_AIHitKey = BattleCmd_pb2.HIT_KEY_KEY_NONE
        self.m_ServePosIndex = 0
        self.m_ServeResetPos = True

    def GetSceneType(self):
        return BattleCmd_pb2.SCENE_TYPE_TEST

    def SetTestIsStopServe(self):
        if self.m_IsStopServe:
            self.m_IsStopServe = False
        else:
            self.m_IsStopServe = True

    def TestIsStopServe(self):
        return self.m_IsStopServe

    def GetDestineStartPos(self, iCurveId):
        if self.m_AIHitHigh == BattleCmd_pb2.HIT_HIGH_TYPE_NONE:
            return
        else:
            iCurveType, dCurveData = self.GetFirstBadminton().GetCurveTypeAndData(iCurveId)
            if self.m_AIHitHigh == BattleCmd_pb2.HIT_HIGH_TYPE_LOW:
                return CDVec3.GetDVec3FromDict(dCurveData["lowAiHitPos"])
            if self.m_AIHitHigh == BattleCmd_pb2.HIT_HIGH_TYPE_MIDDLE:
                return CDVec3.GetDVec3FromDict(dCurveData["midAiHitPos"])
            if self.m_AIHitHigh == BattleCmd_pb2.HIT_HIGH_TYPE_HIGH:
                return CDVec3.GetDVec3FromDict(dCurveData["highAiHitPos"])
            return

    def ChangeAICurveID(self, iCurveId):
        self.m_AICurveID = iCurveId

    def OnRoundEnd(self, iAttackerID, iScoreTeam, oHitArgs):
        self.SetAttackerID(iAttackerID)
        self.m_LastScoreTeam = iScoreTeam
        self.OnBattleEvent(BattleCmd_pb2.BATTLE_EVENT_TYPE_READY_SERVE_STATE, {})
        self.OnBattleEvent(BattleCmd_pb2.BATTLE_EVENT_TYPE_SERVE_STATE, {})
        for oSceneObjectDynamic in self.GetAllPlayer():
            oSceneObjectDynamic.OnScore()

        if self.m_ServeResetPos:
            self.OnReadyServe()
        else:
            self.m_ServePlayerID = iAttackerID

    def CalcBOTPlayerData(self, iMemberType, iPosIndex):
        if iMemberType == Common_pb2.TEAM_MEMBER_TYPE_HOST:
            if iPosIndex == 1:
                iBOTPlayerID = 1001
            else:
                iBOTPlayerID = 1002
        elif iPosIndex == 1:
            iBOTPlayerID = 1003
        else:
            iBOTPlayerID = 1004
        return GetBOTPlayerData(iBOTPlayerID)

    def ChangeAIHitHigh(self, sHitHigh):
        sHitHigh = sHitHigh.lower()
        if sHitHigh == "low":
            self.m_AIHitHigh = BattleCmd_pb2.HIT_HIGH_TYPE_LOW
        elif sHitHigh == "mid":
            self.m_AIHitHigh = BattleCmd_pb2.HIT_HIGH_TYPE_MIDDLE
        elif sHitHigh == "high":
            self.m_AIHitHigh = BattleCmd_pb2.HIT_HIGH_TYPE_HIGH

    def ChangeAIHitKey(self, sHitKey):
        sHitKey = sHitKey.lower()
        if sHitKey == "p":
            self.m_AIHitKey = BattleCmd_pb2.HIT_KEY_KEY_P
        elif sHitKey == "d":
            self.m_AIHitKey = BattleCmd_pb2.HIT_KEY_KEY_D
        elif sHitKey == "gy":
            self.m_AIHitKey = BattleCmd_pb2.HIT_KEY_KEY_GY

    def ProcessServeState(self):
        return

    def SetTestServePosIndex(self, iPosIndex):
        self.m_ServePosIndex = iPosIndex

    def GetRemainder(self):
        if self.m_ServePosIndex:
            return self.m_ServePosIndex
        else:
            return self.RandomBetween(1, 10) % 2

    def ResetPosIndexForSingle(self, iRemainder, iScoreTeam):
        iNewRemainder = self.GetRemainder()
        super().ResetPosIndexForSingle(iNewRemainder, iScoreTeam)

    def ResetPosIndexForDouble(self, iRemainder, iScoreTeam):
        iNewRemainder = self.GetRemainder()
        super().ResetPosIndexForDouble(iNewRemainder, iScoreTeam)

    def SetTestServeResetPos(self):
        if self.m_ServeResetPos:
            self.m_ServeResetPos = False
        else:
            self.m_ServeResetPos = True

    def IsInServeGameState(self):
        oBadminton = self.GetFirstBadminton()
        if oBadminton.GetSimulateFinished():
            if not self.m_ServeResetPos:
                return True
        return self.m_GameState == BattleCmd_pb2.GAME_STATE_SERVE

    def IsServePlayer(self, pid):
        if self.IsInServeGameState():
            return self.m_ServePlayerID == pid
        else:
            return super().IsServePlayer(pid)

    def IsGameState(self, iGameState):
        if iGameState == BattleCmd_pb2.GAME_STATE_SERVE:
            return self.IsInServeGameState()
        else:
            return self.m_GameState == iGameState

    def CouldCatchServe(self, iPlayerID):
        if self.m_ServeResetPos:
            return super().CouldCatchServe(iPlayerID)
        else:
            return True
