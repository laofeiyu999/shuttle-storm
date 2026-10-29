# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\scenenewbie.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 5709 bytes
from .scenebattle import CSceneBattle
from base.protobufdata import BattleCmd_pb2, Common_pb2
from battlelogic.common.debug import Log, LogWarning, LogError
from base.data import GetNewbieGuideData, GetBOTPlayerData
from battlelogic.common.defines import IsPlayerObjectID, NEWBIE_GUIDE_SINGLE_BOTPLAYER, NEWBIE_GUIDE_DUAL_BOTPLAYER, NEWBIE_BATTLE_GUIDE_FIRST
from battlelogic.plugins.state import CAddStateArgs

class CSceneNewbie(CSceneBattle):

    def __init__(self, iGameID, iRandomSeed, iGameMode, iBattleMode, iOwnerID, iSceneIndex):
        super().__init__(iGameID, iRandomSeed, iGameMode, iBattleMode, iOwnerID, iSceneIndex)
        self.m_GameEndRuleType = BattleCmd_pb2.GAME_END_RULE_TYPE_BO1
        self.m_CurProcID = iGameID
        self.m_CurGuideTargetTimes = 0
        self.m_FinishedGuide = {}

    def GetSceneType(self):
        return BattleCmd_pb2.SCENE_TYPE_NEWBIE

    def InitAfterAllPlayerEnter(self):
        super().InitAfterAllPlayerEnter()
        self.ResetGuide(self.m_CurProcID)

    def OnProcDelta(self):
        oUpdateProcMsg = BattleCmd_pb2.BattleGuideUpdateProcMsg()
        oUpdateProcMsg.CurProcID = self.m_CurProcID
        self.AddDelta(BattleCmd_pb2.BATTLE_GUIDE_UPDATE_PROC_MSG, oUpdateProcMsg)

    def ClearGuideStateLst(self, iOldProcID):
        if iOldProcID == 0:
            return
        oNewbieGuideData = GetNewbieGuideData(iOldProcID)
        for oObj in self.GetAllPlayer():
            if IsPlayerObjectID(oObj.m_ID):
                for iStateSID in oNewbieGuideData.m_PlayerStateLst:
                    oObj.RemoveState(iStateSID, BattleCmd_pb2.SELECT_OBJECT_TYPE_SELF, 0)

            else:
                for iStateSID in oNewbieGuideData.m_AIStateLst:
                    oObj.RemoveState(iStateSID, BattleCmd_pb2.SELECT_OBJECT_TYPE_SELF, 0)

    def InitGuideStateLst(self):
        if self.m_CurProcID == 0:
            return
        oNewbieGuideData = GetNewbieGuideData(self.m_CurProcID)
        oAddStateArgs = CAddStateArgs(0)
        for oObj in self.GetAllPlayer():
            if IsPlayerObjectID(oObj.m_ID):
                Log("玩家状态列表", oNewbieGuideData.m_PlayerStateLst)
                for iStateSID in oNewbieGuideData.m_PlayerStateLst:
                    oAddStateArgs.m_StateSID = iStateSID
                    oObj.DoAddState(oAddStateArgs)
                    Log("玩家添加状态id", iStateSID)

            else:
                for iStateSID in oNewbieGuideData.m_AIStateLst:
                    oAddStateArgs.m_StateSID = iStateSID
                    oObj.DoAddState(oAddStateArgs)

    def UpdateGuideProc(self, iProcID):
        iOldProcID = self.m_CurProcID
        self.m_CurProcID = iProcID
        self.OnProcDelta()
        self.ClearGuideStateLst(iOldProcID)
        self.InitGuideStateLst()

    def ResetGuideAI(self, iProcID):
        oNewbieGuideData = GetNewbieGuideData(iProcID)
        oPlayer = self.GetPlayer(self.m_OwnerID)
        iPlayerMemberType = oPlayer.GetMemberType()
        for oObj in self.GetAllPlayer():
            if IsPlayerObjectID(oObj.m_ID):
                pass
            else:
                oObj.DetachBT()
                if oObj.GetMemberType() == iPlayerMemberType:
                    oObj.AttachBT(oNewbieGuideData.m_TeamBTConfID)
                else:
                    oObj.AttachBT(oNewbieGuideData.m_BTConfID)

    def ResetGuide(self, iProcID):
        self.UpdateGuideProc(iProcID)
        self.ResetGuideAI(iProcID)

    def OnRoundEnd(self, iAttackerID, iScoreTeam, oHitArgs):
        iLastGameState = self.m_GameState
        super().OnRoundEnd(iAttackerID, iScoreTeam, oHitArgs)
        if iLastGameState == BattleCmd_pb2.GAME_STATE_PAUSE:
            self.StopMove()
            self.Pause()

    def GetHadFinishedGuide(self, iProcID):
        return self.m_FinishedGuide.get(iProcID, False)

    def EndCurNewbieGuide(self, bIsFinished):
        iOldProcID = self.m_CurProcID
        self.m_FinishedGuide[self.m_CurProcID] = bIsFinished
        self.m_CurProcID = 0
        self.ClearGuideStateLst(iOldProcID)
        self.OnEndCurNewbieGuide(bIsFinished)

    def OnEnterQuarterRest(self):
        super().OnEnterQuarterRest()
        self.InitGuideStateLst()

    def FinishCurNewbieBattle(self, bIsFinished):
        self.m_WinTeam = Common_pb2.TEAM_MEMBER_TYPE_HOST
        self.OnGameEnd()

    def StopGame(self):
        if self.m_GameState == BattleCmd_pb2.GAME_STATE_QUARTER_REST:
            return
        Log("发送冻结消息，引导:%d" % self.m_CurProcID)
        oMsg = BattleCmd_pb2.BattleGuideStopGameMsg()
        self.AddDelta(BattleCmd_pb2.BATTLE_GUIDE_STOP_GAME_MSG, oMsg)

    def OnGameStateChange(self):
        if self.m_GameState in (BattleCmd_pb2.GAME_STATE_PLAYING, BattleCmd_pb2.GAME_STATE_SERVE):
            self.m_EffectiveFlag = True
        else:
            self.m_EffectiveFlag = False

    def GameStartInitServe(self):
        if self.m_CurProcID == NEWBIE_BATTLE_GUIDE_FIRST:
            self.ReCalcServePlayer(Common_pb2.TEAM_MEMBER_TYPE_HOST, 1)
        else:
            self.ReCalcServePlayer(Common_pb2.TEAM_MEMBER_TYPE_GUEST, 2)

    def CalcBOTPlayerData(self, iMemberType, iPosIndex):
        iBOTPlayerID = NEWBIE_GUIDE_SINGLE_BOTPLAYER
        if self.m_BattleMode == Common_pb2.BATTLE_MODE_DUAL:
            iBOTPlayerID = NEWBIE_GUIDE_DUAL_BOTPLAYER[iMemberType][iPosIndex - 1]
        return GetBOTPlayerData(iBOTPlayerID)

    def OnEndCurNewbieGuide(self, bIsFinished):
        oMsg = BattleCmd_pb2.BattleGuideEndCurMsg()
        oMsg.IsFinished = bIsFinished
        self.AddDelta(BattleCmd_pb2.BATTLE_GUIDE_END_CUR_MSG, oMsg)
