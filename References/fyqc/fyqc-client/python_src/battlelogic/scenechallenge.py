# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\scenechallenge.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 3937 bytes
from .scenebattle import CSceneBattle
from base.protobufdata import Common_pb2, BattleCmd_pb2
from battlelogic.common.defines import CHALLENGE_GAMEBOT_PLAYER
from base.data import GetBOTPlayerData, challengemodeconfig
from base.data import GetRandChallengeAI, challengedifficulty, GetChallengeAIPlayerData, GetChallengeDifficultyData
from battlelogic.plugins.state import CAddStateArgs
import random

class CSceneChallenge(CSceneBattle):

    def __init__(self, iID, iRandomSeed, iGameMode, iBattleMode, iOwnerID, iSceneIndex):
        super().__init__(iID, iRandomSeed, iGameMode, iBattleMode, iOwnerID, iSceneIndex)
        self.m_MaxHostScore = 0
        self.m_MaxGuestScore = 0
        self.m_CurChallengeScore = 0

    def Init(self):
        super().Init()
        dConfig = challengemodeconfig.CHALLENGE_MODE_CONFIG
        iSceneIndex = dConfig["SceneIndex"]
        self.m_MaxHostScore = dConfig.get("HostScoreLimit", 0)
        self.m_MaxGuestScore = dConfig.get("GuestScoreLimit", 0)
        self.m_SceneIndex = iSceneIndex

    def GetSceneType(self):
        return BattleCmd_pb2.SCENE_TYPE_CHALLENGE

    def InitGameEndRule(self):
        self.m_GameEndRuleType = BattleCmd_pb2.GAME_END_RULE_TYPE_BO1

    def DoCreateGameAIPlayer(self, iMemberType, iPosIndex):
        iGameAIPlayerID = GetRandChallengeAI()
        oData = GetChallengeAIPlayerData(iGameAIPlayerID)
        oPlayer = self.DoCreateRobotPlayer(self.GetNpcID(), iMemberType, iPosIndex, oData)
        oPlayer.m_IsGameAI = True

    def DoCreateBOTPlayer(self, iMemberType, iPosIndex):
        iGameBOTPlayerID = random.choice(CHALLENGE_GAMEBOT_PLAYER)
        oData = GetBOTPlayerData(iGameBOTPlayerID)
        self.DoCreateRobotPlayer(self.GetNpcID(), iMemberType, iPosIndex, oData)

    def InitAfterAllPlayerEnter(self, bIsUseBOT=False):
        if bIsUseBOT:
            self.m_HasGameAI = False
        else:
            self.m_HasGameAI = True
        super().InitAfterAllPlayerEnter()

    def CheckGameEndBO1(self):
        iHostScore = self.GetTeamScore(Common_pb2.TEAM_MEMBER_TYPE_HOST)
        iGuestScore = self.GetTeamScore(Common_pb2.TEAM_MEMBER_TYPE_GUEST)
        if iHostScore >= self.m_MaxHostScore or iGuestScore >= self.m_MaxGuestScore:
            self.m_WinTeam = Common_pb2.TEAM_MEMBER_TYPE_HOST
            return True
        else:
            return False

    def AddStateByDifficultyData(self, oDifficultyData):
        if not oDifficultyData.m_StateLst:
            return
        challengeAILst = self.GetAllTeamPlayer(Common_pb2.TEAM_MEMBER_TYPE_GUEST)
        oAddStateArgs = CAddStateArgs(0)
        for oPlayer in challengeAILst:
            for iStateSID in oDifficultyData.m_StateLst:
                oAddStateArgs.m_StateSID = iStateSID
                oPlayer.DoAddState(oAddStateArgs)

    def SetBTConfIDByDifficultyData(self, oDifficultyData):
        if not oDifficultyData.m_BTConfID:
            return
        challengeAILst = self.GetAllTeamPlayer(Common_pb2.TEAM_MEMBER_TYPE_GUEST)
        for oPlayer in challengeAILst:
            oPlayer.SetGameAI2BTConfID(oDifficultyData.m_BTConfID)

    def SetDifficultyDataByHostScore(self, iScore):
        iDataID = challengedifficulty.SCORE_DICT.get(iScore, 0)
        if not iDataID:
            return
        oDifficultyData = GetChallengeDifficultyData(iDataID)
        self.SetBTConfIDByDifficultyData(oDifficultyData)
        self.AddStateByDifficultyData(oDifficultyData)
        self.m_CurChallengeScore += oDifficultyData.m_IntegralScore
        if self.m_HasGameAI:
            self.m_GameAI.m_DifficultyLevel = oDifficultyData.m_AIDifficultyLevel

    def OnRoundEnd(self, iAttackerID, iScoreTeam, oHitArgs):
        super().OnRoundEnd(iAttackerID, iScoreTeam, oHitArgs)
        if iScoreTeam != Common_pb2.TEAM_MEMBER_TYPE_HOST:
            return
        iHostScore = self.GetTeamScore(Common_pb2.TEAM_MEMBER_TYPE_HOST)
        if iHostScore > 0:
            self.SetDifficultyDataByHostScore(iHostScore)

    def FormatGameResBaseInfo(self, oGameRes):
        super().FormatGameResBaseInfo(oGameRes)
        oGameRes.ChallengeScore = self.m_CurChallengeScore

    def GMSetChallengeScore(self, iChallengeScore):
        self.m_CurChallengeScore = iChallengeScore
