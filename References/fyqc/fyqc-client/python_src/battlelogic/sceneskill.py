# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\sceneskill.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 2149 bytes
from .scenebattle import CSceneBattle
from base.protobufdata import BattleCmd_pb2, Common_pb2
from battlelogic.common.debug import Log, LogWarning, LogError
from base.data import GetBOTPlayerData, GetSkillShowData
from battlelogic.common.defines import IsPlayerObjectID

class CSceneSKill(CSceneBattle):

    def __init__(self, iSkillShowID, iRandomSeed, iGameMode, iBattleMode, iOwnerID, iSceneIndex):
        super().__init__(iSkillShowID, iRandomSeed, iGameMode, iBattleMode, iOwnerID, iSceneIndex)
        self.m_GameEndRuleType = BattleCmd_pb2.GAME_END_RULE_TYPE_BO1
        self.m_SkillShowID = iSkillShowID

    def GetSceneType(self):
        return BattleCmd_pb2.SCENE_TYPE_SKILL

    def InitAfterAllPlayerEnter(self):
        super().InitAfterAllPlayerEnter()
        self.SetSkillShowID(self.m_SkillShowID)

    def SetBTConfID(self, iPlayerBTConfID, iAIBTConfID):
        for oObj in self.GetAllPlayer():
            if IsPlayerObjectID(oObj.m_ID):
                oObj.DetachBT()
                oObj.AttachBT(iPlayerBTConfID)
                oObj.AddSkillWhilePlaying(self.m_SkillShowID, 1)
                oObj.SetTestNoCD()
            else:
                oObj.DetachBT()
                oObj.AttachBT(iAIBTConfID)

    def SetSkillShowID(self, iSkillShowID):
        oSkillShowData = GetSkillShowData(iSkillShowID)
        self.SetBTConfID(oSkillShowData.m_PlayerBTConfID, oSkillShowData.m_AIBTConfID)

    def GameStartInitServe(self):
        self.ReCalcServePlayer(Common_pb2.TEAM_MEMBER_TYPE_GUEST, 2)

    def CalcBOTPlayerData(self, iMemberType, iPosIndex):
        oSkillShowData = GetSkillShowData(self.m_SkillShowID)
        iBOTPlayerID = oSkillShowData.m_AIPlayer
        return GetBOTPlayerData(iBOTPlayerID)

    def AddScore(self, iAttackerID, iScoreTeam):
        self.OnScoreBoardDelta(iAttackerID, iScoreTeam)
