# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\scenegamelevel.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 4267 bytes
from .scenebattle import CSceneBattle
from base.data import GetGameLevelData, GetBOTPlayerData
from base.protobufdata import BattleCmd_pb2, Common_pb2
from battlelogic.common.defines import IsPlayerObjectID
from battlelogic.common.debug import LogError
from battlelogic.common.decorator import ClientOnly
from battlelogic.plugins.state import CAddStateArgs

class CSceneGameLevel(CSceneBattle):

    def __init__(self, iID, iRandomSeed, iGameMode, iBattleMode, iOwnerID, iSceneIndex):
        super().__init__(iID, iRandomSeed, iGameMode, iBattleMode, iOwnerID, iSceneIndex)
        self.m_GameLevelID = 0
        self.m_GMPass = False
        self.m_GameLevelWinTimes = 0

    def SetGameLevelID(self, iGameLevelID):
        self.m_GameLevelID = iGameLevelID

    def InitAfterAllPlayerEnter(self):
        super().InitAfterAllPlayerEnter()
        self.InitPlayerStateLst()
        self.InitGameEndRule()

    def CalcBOTPlayerData(self, iMemberType, iPosIndex):
        oGameLevelData = GetGameLevelData(self.m_GameLevelID)
        return GetBOTPlayerData(oGameLevelData.m_BOTID)

    def InitPlayerStateLst(self):
        oGameLevelData = GetGameLevelData(self.m_GameLevelID)
        oAddStateArgs = CAddStateArgs(0)
        for oPlayer in self.GetAllPlayer():
            if IsPlayerObjectID(oPlayer.m_ID):
                for iStateSID in oGameLevelData.m_PlayerStateIDList:
                    oAddStateArgs.m_StateSID = iStateSID
                    oPlayer.DoAddState(oAddStateArgs)

    def SetAllSkillData(self, oPlayerData):
        oGameLevelData = GetGameLevelData(self.m_GameLevelID)
        oSchemeData = oPlayerData.SchemeData.add()
        oSchemeData.SchemeIdx = 0
        oSchemeData.Name = "PVE关卡"
        for skillLst in oGameLevelData.m_SkillLst:
            oSkillData = oPlayerData.SkillData.add()
            oSkillData.SkillID = skillLst[0]
            oSkillData.Level = skillLst[1]
            oSkillData.IsEquip = True
            oSchemeData.Equips.append(skillLst[0])

    def SetTargetValue(self, iTargetType, iValue):
        if iValue < 0:
            return
        oGameLevelData = GetGameLevelData(self.m_GameLevelID)
        iTargetValue = iValue
        for iProcessID, tProcessData in oGameLevelData.m_TargetProcess.items():
            iType, iMaxTargetValue = tProcessData
            if iType == iTargetType and iValue >= iMaxTargetValue:
                iTargetValue = iMaxTargetValue

        self.m_TargetProcess[iTargetType] = iTargetValue
        self.OnTargetDelta(iTargetType)

    def FormatGameLevelFailedIDs(self, oGameRes):
        oGameLevelData = GetGameLevelData(self.m_GameLevelID)
        if not oGameLevelData:
            return
        for iProcessID, tProcessData in oGameLevelData.m_TargetProcess.items():
            iTargetType, iMaxTargetValue = tProcessData
            iCurValue = self.m_TargetProcess.get(iTargetType, 0)
            if iCurValue < iMaxTargetValue:
                oGameRes.GameLevelFailedIDs.append(iProcessID)

    def FormatGameLevelFinishIDs(self, oGameRes):
        oGameLevelData = GetGameLevelData(self.m_GameLevelID)
        if not oGameLevelData:
            return
        for iProcessID, tProcessData in oGameLevelData.m_TargetProcess.items():
            iTargetType, iMaxTargetValue = tProcessData
            iCurValue = self.m_TargetProcess.get(iTargetType, 0)
            if iCurValue >= iMaxTargetValue:
                oGameRes.GameLevelFinishIDs.append(iProcessID)

    def IsPassGameLevel(self, oGameRes):
        if self.m_GMPass:
            return True
        else:
            oGameLevelData = GetGameLevelData(self.m_GameLevelID)
            if not oGameLevelData:
                return False
            if self.m_WinTeam == Common_pb2.TEAM_MEMBER_TYPE_HOST:
                return True
            return False

    @ClientOnly
    def OnTargetDelta(self, iTargetType):
        oMsg = BattleCmd_pb2.BattleTechExamTargetMsg()
        oMsg.TargetType = iTargetType
        oMsg.TargetValue = int(self.GetTargetValue(iTargetType))
        oPlayer = self.GetPlayer(self.m_OwnerID)
        oPlayer.AddPersonalDelta(BattleCmd_pb2.BATTLE_TECH_EXAM_TARGET_MSG, oMsg)

    def FormatGameResBaseInfo(self, oGameRes):
        super().FormatGameResBaseInfo(oGameRes)
        self.FormatGameLevelFailedIDs(oGameRes)
        self.FormatGameLevelFinishIDs(oGameRes)
        oGameRes.PassGameLevel = self.IsPassGameLevel(oGameRes)

    def InitGameEndRule(self):
        oGameLevelData = GetGameLevelData(self.m_GameLevelID)
        self.m_GameEndRuleType = oGameLevelData.m_EndRuleType

    def DoGMPassGameLevel(self):
        self.m_GMPass = True
        self.OnGameEnd()

    def SetGameLevelWinTimes(self, iTimes):
        self.m_GameLevelWinTimes = iTimes
