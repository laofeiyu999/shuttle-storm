# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\scenetechexam.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 3909 bytes
from .scenebattle import CSceneBattle
from base.data import GetTechnicalExamData, GetBOTPlayerData
from base.protobufdata import BattleCmd_pb2, Common_pb2
from battlelogic.common.defines import IsPlayerObjectID
from battlelogic.common.debug import LogError
from battlelogic.common.decorator import ClientOnly
from battlelogic.plugins.state import CAddStateArgs

class CSceneTechExam(CSceneBattle):

    def __init__(self, iID, iRandomSeed, iGameMode, iBattleMode, iOwnerID, iSceneIndex):
        super().__init__(iID, iRandomSeed, iGameMode, iBattleMode, iOwnerID, iSceneIndex)
        self.m_TechExamID = 0
        self.m_GMPass = False
        self.m_TechnicalExamWinTimes = 0

    def SetTechExamID(self, iTechExamID):
        self.m_TechExamID = iTechExamID

    def InitAfterAllPlayerEnter(self):
        super().InitAfterAllPlayerEnter()
        self.InitPlayerStateLst()
        self.InitGameEndRule()

    def CalcBOTPlayerData(self, iMemberType, iPosIndex):
        oTechExamData = GetTechnicalExamData(self.m_TechExamID)
        return GetBOTPlayerData(oTechExamData.m_BOTID)

    def InitPlayerStateLst(self):
        oTechExamData = GetTechnicalExamData(self.m_TechExamID)
        oAddStateArgs = CAddStateArgs(0)
        for oObj in self.GetAllPlayer():
            if IsPlayerObjectID(oObj.m_ID):
                for iStateSID in oTechExamData.m_PlayerStateIDList:
                    oAddStateArgs.m_StateSID = iStateSID
                    oObj.DoAddState(oAddStateArgs)

    def SetTargetValue(self, iTargetType, iValue):
        if iValue < 0:
            return
        oTechExamData = GetTechnicalExamData(self.m_TechExamID)
        iTargetValue = iValue
        for iProcessID, tProcessData in oTechExamData.m_TargetProcess.items():
            iType, iMaxTargetValue = tProcessData
            if iType == iTargetType and iValue >= iMaxTargetValue:
                iTargetValue = iMaxTargetValue

        self.m_TargetProcess[iTargetType] = iTargetValue
        self.OnTargetDelta(iTargetType)

    def FormatTechExamFailedIDs(self, oGameRes):
        oTechExamData = GetTechnicalExamData(self.m_TechExamID)
        if not oTechExamData:
            return
        for iProcessID, tProcessData in oTechExamData.m_TargetProcess.items():
            iTargetType, iMaxTargetValue = tProcessData
            iCurValue = self.m_TargetProcess.get(iTargetType, 0)
            if iCurValue < iMaxTargetValue:
                oGameRes.TechExamFailedIDs.append(iProcessID)

    def FormatTechExamFinishIDs(self, oGameRes):
        oTechExamData = GetTechnicalExamData(self.m_TechExamID)
        if not oTechExamData:
            return
        for iProcessID, tProcessData in oTechExamData.m_TargetProcess.items():
            iTargetType, iMaxTargetValue = tProcessData
            iCurValue = self.m_TargetProcess.get(iTargetType, 0)
            if iCurValue >= iMaxTargetValue:
                oGameRes.TechExamFinishIDs.append(iProcessID)

    def IsPassTechExam(self, oGameRes):
        if self.m_GMPass:
            return True
        else:
            oTechExamData = GetTechnicalExamData(self.m_TechExamID)
            if not oTechExamData:
                return False
            if oTechExamData.CheckIsExtraExam():
                if self.m_WinTeam == Common_pb2.TEAM_MEMBER_TYPE_HOST:
                    return True
            if oGameRes.TechExamFailedIDs:
                return False
            return True

    @ClientOnly
    def OnTargetDelta(self, iTargetType):
        oMsg = BattleCmd_pb2.BattleTechExamTargetMsg()
        oMsg.TargetType = iTargetType
        oMsg.TargetValue = int(self.GetTargetValue(iTargetType))
        oPlayer = self.GetPlayer(self.m_OwnerID)
        oPlayer.AddPersonalDelta(BattleCmd_pb2.BATTLE_TECH_EXAM_TARGET_MSG, oMsg)

    def FormatGameResBaseInfo(self, oGameRes):
        super().FormatGameResBaseInfo(oGameRes)
        self.FormatTechExamFailedIDs(oGameRes)
        self.FormatTechExamFinishIDs(oGameRes)
        oGameRes.PassTechExam = self.IsPassTechExam(oGameRes)

    def InitGameEndRule(self):
        oTechExamData = GetTechnicalExamData(self.m_TechExamID)
        self.m_GameEndRuleType = oTechExamData.m_EndRuleType

    def DoGMPassTechExam(self):
        self.m_GMPass = True
        self.OnGameEnd()

    def SetTechnicalExamWinTimes(self, iTimes):
        self.m_TechnicalExamWinTimes = iTimes
