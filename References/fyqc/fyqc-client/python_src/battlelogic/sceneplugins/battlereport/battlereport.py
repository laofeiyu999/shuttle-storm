# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\sceneplugins\battlereport\battlereport.py
# Compiled at: 2023-04-06 17:07:52
# Size of source mod 2**32: 20084 bytes
from .defines import CBattleReportRowData
from .defines import BATTLE_REPORT_ROW_TYPE_ACTION, BATTLE_REPORT_ROW_TYPE_STATE, BATTLE_REPORT_ROW_TYPE_CURVE
from base.data import GetHitActionData, GetRunePropertyData, GetApparelData
from base.protobufdata import BattleCmd_pb2, NormalCmd_pb2, Common_pb2, RuneCmd_pb2
from base.data import GetSkillData
from base.data import bombplayconfig
from battlelogic.common.defines import IsPlayerObjectID
from battlelogic.common.defines import GetEnemyMemberType
from .bigdata import FormatLogText
RUNE_PROPERTY_VALUE_TYPE_PERCENT = 100

class CBattleReport(object):

    def __init__(self, oScene):
        self.m_Scene = oScene
        self.m_PlayerData = {}
        self.m_ReportFunc = None
        self.m_HitData = {}
        self.m_GameLastTime = 0
        self.m_QuarterWinTimes = {}

    def ReCalcPlayerTeamID(self):
        dTeamData = {}
        for iPlayerID, dPlayerData in self.m_PlayerData.items():
            iMemberType = dPlayerData["MemberType"]
            if iMemberType not in dTeamData:
                dTeamData[iMemberType] = []
            dTeamData[iMemberType].append(iPlayerID)
            dTeamData[iMemberType].sort()
            playerIDLst = map(str, dTeamData[iMemberType])
            sTeamID = "-".join(playerIDLst)
            dPlayerData["TeamID"] = sTeamID

    def CalcPlayerTeamID(self, oPlayer):
        playerIDLst = []
        iMemberType = oPlayer.GetMemberType()
        for oObj in self.m_Scene.GetAllTeamPlayer(iMemberType):
            playerIDLst.append(oObj.ID())
            playerIDLst.sort(reverse=True)

        sPlayerIDLst = map(str, playerIDLst)
        sTeamID = "-".join(sPlayerIDLst)
        return sTeamID

    def CalcHasRobot(self):
        for oObj in self.m_Scene.GetAllPlayer():
            if not IsPlayerObjectID(oObj.ID()):
                return True

        return False

    def ReCalcSkillData(self, oPlayer):
        lstSkill = []
        equipSkillLst = []
        for iQuarterIdx in oPlayer.m_SkillSchemeHis:
            iSchemeIdx = oPlayer.m_SkillSchemeHis[iQuarterIdx]
            lstEquipSkill = oPlayer.GetSchemeNormalSkill(iSchemeIdx)
            if not lstEquipSkill:
                pass
            else:
                for iSkillID in lstEquipSkill:
                    if iSkillID in lstSkill:
                        pass
                    else:
                        lstSkill.append(iSkillID)
                        skillLst = []
                        iLevel = oPlayer.GetSkillLevel(iSkillID)
                        skillLst.append(iSkillID)
                        skillLst.append(iLevel)
                        sSkillLst = map(str, skillLst)
                        sSkillData = "_".join(sSkillLst)
                        equipSkillLst.append(sSkillData)

        return equipSkillLst

    def ReCalcPropertyData(self, oPlayer):
        if not self.m_Scene.m_PropertyPlay:
            return ""
        else:
            if not self.m_Scene.m_PropertyPlay.m_PropertyBoxTriggerTimes:
                return ""
            if oPlayer.m_ID not in self.m_Scene.m_PropertyPlay.m_PropertyBoxTriggerTimes:
                return ""
            propertyDataLst = []
            dPropertyData = self.m_Scene.m_PropertyPlay.m_PropertyBoxTriggerTimes[oPlayer.m_ID]
            for iPropertyID, iTriggerTimes in dPropertyData.items():
                propertyLst = []
                propertyLst.append(iPropertyID)
                propertyLst.append(iTriggerTimes)
                sPropertyLst = map(str, propertyLst)
                sPropertyData = "_".join(sPropertyLst)
                propertyDataLst.append(sPropertyData)

            sDaoju = "&".join(propertyDataLst)
            return sDaoju

    def ReCalcPlayerRuneData(self, oPlayer):
        normalPropertyRuneLst = []
        percentPropertyRuneLst = []
        dRuneProperty = oPlayer.GetRuneProperty()
        if not dRuneProperty:
            return ""
        else:
            for iPropertyID, iValue in dRuneProperty.items():
                oRunePropertyData = GetRunePropertyData(iPropertyID)
                if not oRunePropertyData:
                    pass
                elif oRunePropertyData.m_AddType == RuneCmd_pb2.RUNE_PROPERTY_VALUE_TYPE_NORMAL:
                    runeDataLst = []
                    runeDataLst.append(iPropertyID)
                    runeDataLst.append(iValue)
                    sRuneDataLst = map(str, runeDataLst)
                    sRuneData = "_".join(sRuneDataLst)
                    normalPropertyRuneLst.append(sRuneData)
                else:
                    if oRunePropertyData.m_AddType == RuneCmd_pb2.RUNE_PROPERTY_VALUE_TYPE_TEN_THOUSAND:
                        iValue = round(iValue / RUNE_PROPERTY_VALUE_TYPE_PERCENT)
                        runeDataLst = []
                        runeDataLst.append(iPropertyID)
                        runeDataLst.append(iValue)
                        sRuneDataLst = map(str, runeDataLst)
                        sRuneData = "_".join(sRuneDataLst)
                        sRuneData = sRuneData + "%"
                        percentPropertyRuneLst.append(sRuneData)

            while len(normalPropertyRuneLst) < 4:
                normalPropertyRuneLst.append("0_0")

            while len(percentPropertyRuneLst) < 4:
                percentPropertyRuneLst.append("0_0")

            propertyRuneLst = percentPropertyRuneLst + normalPropertyRuneLst
            sPropertyRune = "&".join(propertyRuneLst)
            return sPropertyRune

    def ReCalcPersonalScore(self, oPlayer):
        iPersonalScore = 0
        dQuarterScore = oPlayer.GetRecord(BattleCmd_pb2.BATTLE_RECORD_QUARTER_SCORE)
        if not dQuarterScore:
            return 0
        else:
            for _, iScore in dQuarterScore.items():
                iPersonalScore += iScore

            return iPersonalScore

    def CalcTeamTotalScore(self, oPlayer):
        iTeamTotalScore = 0
        iMemberType = oPlayer.GetMemberType()
        iTeamTotalScore = self.CaclTotalScore(iMemberType)
        return iTeamTotalScore

    def CaclEnemyTotalScore(self, oPlayer):
        iEnemyTotalScore = 0
        iEnemyMemberType = GetEnemyMemberType(oPlayer.GetMemberType())
        iEnemyTotalScore = self.CaclTotalScore(iEnemyMemberType)
        return iEnemyTotalScore

    def CaclTotalScore(self, iMemberType):
        iTotalScore = 0
        dQuarterScore = self.m_Scene.m_QuarterScoreBoard
        if not dQuarterScore:
            return 0
        else:
            for _, dScore in dQuarterScore.items():
                iScore = dScore.get(iMemberType, 0)
                iTotalScore += iScore

            return iTotalScore

    def ReCalcApparel(self, oPlayer):
        apparelLst = oPlayer.GetApparelLst()
        if not apparelLst:
            return ""
        else:
            apparelLst = map(str, apparelLst)
            sApparel = "&".join(apparelLst)
            return sApparel

    def CalcCauseDamage(self, oPlayer):
        dDamage = self.m_Scene.m_ScoreTeamDamage.get(oPlayer.m_MemberType, {})
        iCauseDamage = 0
        for iIdx, iDamage in dDamage.items():
            iCauseDamage += iDamage

        return iCauseDamage

    def CalcHurtTeamHP(self, iMemberType):
        iLastTeamHP = self.m_Scene.m_TeamHP.get(iMemberType, 0)
        iBattleMode = self.m_Scene.GetBattleMode()
        dConfig = bombplayconfig.GetBombplayConfig(iBattleMode)
        return dConfig["teamHP"] - iLastTeamHP

    def GetHitExplodeDamage(self, iMemberType):
        return self.m_Scene.m_TeamHitExplodeDamage.get(iMemberType, 0)

    def GetNotHitExplodeDamage(self, iMemberType):
        return self.m_Scene.m_TeamNotHitExplodeDamage.get(iMemberType, 0)

    def InitPlayer(self, oPlayer):
        self.m_PlayerData[oPlayer.m_ID] = {'MemberType':oPlayer.GetMemberType(), 
         'TotalHitTimes':0, 
         'TotalScore':0, 
         'ActionData':{},  'StateData':{},  'ContinuesCounterAdd':0, 
         'ContinuesCounterReduce':0, 
         'StarMarkTimes':0, 
         'CurveData':{},  'Grade':oPlayer.Grade(), 
         'Name':oPlayer.Name(), 
         'PersonalDetail':oPlayer.m_PersonalDetail, 
         'RuneData':self.ReCalcPlayerRuneData(oPlayer), 
         'AccountID':oPlayer.m_BriefData.AccountID, 
         'Sex':oPlayer.m_BriefData.Sex, 
         'RankID':oPlayer.m_BriefData.RankID, 
         'RankPoints':oPlayer.m_BriefData.RankPoints, 
         'Record':oPlayer.m_Record, 
         'AVGContinuousTimes':0, 
         'MVPScore':0, 
         'QualifyElo':oPlayer.m_BriefData.QualifyElo, 
         'RuneID':oPlayer.GetRuneTableID(), 
         'PersonalScore':0, 
         'Zhuangbei':self.ReCalcApparel(oPlayer), 
         'EquipSkills':"", 
         'Daoju':"", 
         'TeamID':self.CalcPlayerTeamID(oPlayer), 
         'AbnormalStatus':0, 
         'MatchElo':oPlayer.m_BriefData.MatchElo, 
         'ChallengeScore':0, 
         'EnemyTotalScore':0}

    def IsValidPlayer(self, iPlayerID):
        if iPlayerID not in self.m_PlayerData:
            return False
        else:
            return True

    def OutPutReport2BigData(self, iPlayerID, dGameData, dPlayerData):
        sLogText = FormatLogText(iPlayerID, dGameData, dPlayerData)
        self.m_ReportFunc(sLogText)

    def OutPutReport(self):
        if not self.m_ReportFunc:
            return
        dGameData = {}
        dGameData["WinMemberType"] = self.m_WinMemberType
        dGameData["GameMode"] = self.m_Scene.m_GameMode
        dGameData["BattleMode"] = self.m_Scene.m_BattleMode
        dGameData["SceneIndex"] = self.m_Scene.m_SceneIndex
        dGameData["HasGameAI"] = self.m_Scene.m_HasGameAI
        dGameData["HasRobot"] = self.CalcHasRobot()
        dGameData["GameLastTime"] = self.m_GameLastTime
        dGameData["FightID"] = self.m_Scene.m_UUID + "VER2"
        dGameData["UUID"] = self.m_Scene.m_UUID + "VER2"
        if self.m_Scene.m_GameAI:
            dGameData["GameAIDifficulty"] = self.m_Scene.m_GameAI.m_DifficultyLevel
        dGameData["MvpPlayerID"] = self.m_Scene.GetMVPPlayerID(self.m_Scene.m_WinTeam)
        for iPlayerID, dPlayerData in self.m_PlayerData.items():
            self.OutPutReport2BigData(iPlayerID, dGameData, dPlayerData)

    def SetReportFunc(self, oReportFunc):
        self.m_ReportFunc = oReportFunc

    def TryGetRowData(self, iPlayerID, iRowType, oRowKey, iSkillSID):
        if not oRowKey:
            return
        else:
            dPlayerData = self.m_PlayerData[iPlayerID]
            dRowDatas = None
            if iRowType == BATTLE_REPORT_ROW_TYPE_ACTION:
                dRowDatas = dPlayerData["ActionData"]
            elif iRowType == BATTLE_REPORT_ROW_TYPE_STATE:
                dRowDatas = dPlayerData["StateData"]
            else:
                if iRowType == BATTLE_REPORT_ROW_TYPE_CURVE:
                    dRowDatas = dPlayerData["CurveData"]
            if dRowDatas is None:
                return
            if oRowKey not in dRowDatas:
                dRowDatas[oRowKey] = CBattleReportRowData(iSkillSID)
            return dRowDatas[oRowKey]

    def LogAtkRowData(self, oRowData, bRetrieve):
        oRowData.m_HitTimes += 1
        if bRetrieve:
            oRowData.m_RetrieveHitTimes += 1

    def LogDefRowData(self, oRowData, bRetrieve):
        oRowData.m_EnemyHitTimes += 1
        if bRetrieve:
            oRowData.m_EnemyRetrieveHitTimes += 1

    def ProcHitAction(self, dHitData):
        dAtkData = dHitData["AtkData"]
        iAtkPlayerID = dAtkData["PlayerID"]
        bRetrieve = dAtkData["Retrieve"]
        if self.IsValidPlayer(iAtkPlayerID):
            self.m_PlayerData[iAtkPlayerID]["TotalHitTimes"] += 1
            oAtkRowData = self.TryGetRowData(iAtkPlayerID, BATTLE_REPORT_ROW_TYPE_ACTION, dAtkData["ActionSID"], dAtkData["SkillSID"])
            if oAtkRowData:
                self.LogAtkRowData(oAtkRowData, bRetrieve)
            if dAtkData["HitType"] == BattleCmd_pb2.HIT_TYPE_STARMARK:
                self.m_PlayerData[iAtkPlayerID]["StarMarkTimes"] += 1
        dDefData = dHitData["DefData"]
        iDefPlayerID = dDefData["PlayerID"]
        if self.IsValidPlayer(iDefPlayerID):
            oDefRowData = self.TryGetRowData(iDefPlayerID, BATTLE_REPORT_ROW_TYPE_ACTION, dDefData["ActionSID"], dDefData["SkillSID"])
            if oDefRowData:
                self.LogDefRowData(oDefRowData, bRetrieve)

    def ProcHitState(self, dHitData):
        dAtkData = dHitData["AtkData"]
        iAtkPlayerID = dAtkData["PlayerID"]
        bRetrieve = dAtkData["Retrieve"]
        if iAtkPlayerID in self.m_PlayerData:
            for iStateSID, tAtkState in dAtkData["StateLst"].items():
                oRowData = self.TryGetRowData(iAtkPlayerID, BATTLE_REPORT_ROW_TYPE_STATE, iStateSID, tAtkState[0])
                if oRowData:
                    self.LogAtkRowData(oRowData, bRetrieve)

        dDefData = dHitData["DefData"]
        iDefPlayerID = dDefData["PlayerID"]
        if iDefPlayerID in self.m_PlayerData:
            for iStateSID, tDefState in dDefData["StateLst"].items():
                oRowData = self.TryGetRowData(iDefPlayerID, BATTLE_REPORT_ROW_TYPE_STATE, iStateSID, tDefState[0])
                if oRowData:
                    self.LogDefRowData(oRowData, bRetrieve)

    def ProcHitCurve(self, dHitData):
        dAtkData = dHitData["AtkData"]
        iAtkPlayerID = dAtkData["PlayerID"]
        bRetrieve = dAtkData["Retrieve"]
        if self.IsValidPlayer(iAtkPlayerID):
            tAtkKey = (
             dAtkData["CurveID"], dAtkData["ActionSID"])
            oAtkRowData = self.TryGetRowData(iAtkPlayerID, BATTLE_REPORT_ROW_TYPE_CURVE, tAtkKey, dAtkData["SkillSID"])
            if oAtkRowData:
                self.LogAtkRowData(oAtkRowData, bRetrieve)
        dDefData = dHitData["DefData"]
        iDefPlayerID = dDefData["PlayerID"]
        if self.IsValidPlayer(iDefPlayerID):
            tDefKey = (
             dDefData["CurveID"], dDefData["ActionSID"])
            oDefRowData = self.TryGetRowData(iDefPlayerID, BATTLE_REPORT_ROW_TYPE_CURVE, tDefKey, dDefData["SkillSID"])
            if oDefRowData:
                self.LogDefRowData(oDefRowData, bRetrieve)

    def ProcHit(self):
        self.ProcHitAction(self.m_HitData)
        self.ProcHitState(self.m_HitData)
        self.ProcHitCurve(self.m_HitData)

    def FormatActionData(self, iActionSID):
        if not iActionSID:
            return False
        else:
            oActionData = GetHitActionData(iActionSID)
            bRetrieve = False
            if oActionData.m_HitActionType == BattleCmd_pb2.HIT_ACTION_TYPE_OUTSIDE:
                bRetrieve = True
            return bRetrieve

    def FormatStateData(self, dData):
        dData["StateLst"] = {}
        oPlayer = self.m_Scene.GetPlayer(dData["PlayerID"])
        if oPlayer:
            dData["StateLst"] = oPlayer.GetCurUsingStateData()

    def FormatAtkHitData(self, dHitData, oHitArgs):
        dHitData["AtkData"] = {}
        dAtkData = dHitData["AtkData"]
        dAtkData["PlayerID"] = oHitArgs.m_AtkPlayerID
        dAtkData["Retrieve"] = self.FormatActionData(oHitArgs.m_AtkActionSID)
        dAtkData["ActionSID"] = oHitArgs.m_AtkActionSID
        dAtkData["SkillSID"] = oHitArgs.m_AtkSkillSID
        dAtkData["HitType"] = oHitArgs.m_HitType
        dAtkData["CurveID"] = oHitArgs.m_AtkCurveID
        self.FormatStateData(dAtkData)

    def FormatDefHitData(self, dHitData, oHitArgs):
        dHitData["DefData"] = {}
        dDefData = dHitData["DefData"]
        dDefData["PlayerID"] = oHitArgs.m_DefPlayerID
        dDefData["Retrieve"] = self.FormatActionData(oHitArgs.m_DefActionSID)
        dDefData["ActionSID"] = oHitArgs.m_DefActionSID
        dDefData["SkillSID"] = oHitArgs.m_DefSkillSID
        dDefData["CurveID"] = oHitArgs.m_DefCurveID
        self.FormatStateData(dDefData)

    def FormatHitData(self, oHitArgs):
        self.m_HitData = {}
        self.FormatAtkHitData(self.m_HitData, oHitArgs)
        self.FormatDefHitData(self.m_HitData, oHitArgs)

    def ProcScoreAction(self, dHitData):
        dAtkData = dHitData["AtkData"]
        iAtkPlayerID = dAtkData["PlayerID"]
        if self.IsValidPlayer(iAtkPlayerID):
            oAtkRowData = self.TryGetRowData(iAtkPlayerID, BATTLE_REPORT_ROW_TYPE_ACTION, dAtkData["ActionSID"], dAtkData["SkillSID"])
            if oAtkRowData:
                oAtkRowData.m_ScoreTimes += 1
            self.m_PlayerData[iAtkPlayerID]["TotalScore"] += 1
        dDefData = dHitData["DefData"]
        iDefPlayerID = dDefData["PlayerID"]
        if self.IsValidPlayer(iDefPlayerID):
            oDefRowData = self.TryGetRowData(iDefPlayerID, BATTLE_REPORT_ROW_TYPE_ACTION, dDefData["ActionSID"], dDefData["SkillSID"])
            if oDefRowData:
                oDefRowData.m_LoseTimes += 1

    def ProcScoreState(self, dHitData):
        dAtkData = dHitData["AtkData"]
        iAtkPlayerID = dAtkData["PlayerID"]
        if self.IsValidPlayer(iAtkPlayerID):
            for iStateSID, tAtkState in dAtkData["StateLst"].items():
                oRowData = self.TryGetRowData(iAtkPlayerID, BATTLE_REPORT_ROW_TYPE_STATE, iStateSID, tAtkState[0])
                if oRowData:
                    oRowData.m_ScoreTimes += 1

    def ProcScoreCurve(self, dHitData):
        dAtkData = dHitData["AtkData"]
        iAtkPlayerID = dAtkData["PlayerID"]
        if self.IsValidPlayer(iAtkPlayerID):
            tAtkKey = (
             dAtkData["CurveID"], dAtkData["ActionSID"])
            oAtkRowData = self.TryGetRowData(iAtkPlayerID, BATTLE_REPORT_ROW_TYPE_CURVE, tAtkKey, dAtkData["SkillSID"])
            if oAtkRowData:
                oAtkRowData.m_ScoreTimes += 1

    def ProcScore(self, iAttakerID, iScoreTeam):
        oAttakerPlayer = self.m_Scene.GetPlayer(iAttakerID)
        if oAttakerPlayer.GetMemberType() != iScoreTeam:
            dTemp = self.m_HitData["AtkData"]
            self.m_HitData["AtkData"] = self.m_HitData["DefData"]
            self.m_HitData["DefData"] = dTemp
        self.FormatStateData(self.m_HitData["AtkData"])
        self.FormatStateData(self.m_HitData["DefData"])
        self.ProcScoreAction(self.m_HitData)
        self.ProcScoreState(self.m_HitData)
        self.ProcScoreCurve(self.m_HitData)

    def OnTouchAction(self, iPlayerID, iActionSID, iSkillSID):
        if not self.IsValidPlayer(iPlayerID):
            return
        oRowData = self.TryGetRowData(iPlayerID, BATTLE_REPORT_ROW_TYPE_ACTION, iActionSID, iSkillSID)
        if oRowData:
            oRowData.m_UseTimes += 1

    def OnHitBegin(self, oHitArgs):
        self.FormatHitData(oHitArgs)
        self.ProcHit()

    def OnScore(self, iAttakerID, iScoreTeam):
        if not iAttakerID:
            return
        self.ProcScore(iAttakerID, iScoreTeam)

    def DoRelease(self):
        self.m_Scene = None
        self.m_ReportFunc = None

    def AfterGameEnd(self):
        for iPlayerID, dPlayerData in self.m_PlayerData.items():
            oPlayer = self.m_Scene.GetPlayer(iPlayerID)
            dPlayerData["AbnormalStatus"] = oPlayer.m_AbnormalStatus
            dPlayerData["Record"] = oPlayer.m_Record
            dPlayerData["AVGContinuousTimes"] = int(oPlayer.m_CounterManager.GetSelfAverageCounter(BattleCmd_pb2.COUNTER_TYPE_CONTINUOUS))
            dPlayerData["MVPScore"] = int(oPlayer.GetCurMVPScore() * 10) / 10
            dPlayerData["PersonalScore"] = self.ReCalcPersonalScore(oPlayer)
            dPlayerData["Daoju"] = self.ReCalcPropertyData(oPlayer)
            dPlayerData["EquipSkills"] = self.ReCalcSkillData(oPlayer)
            dPlayerData["TotalScore"] = self.CalcTeamTotalScore(oPlayer)
            dPlayerData["EnemyTotalScore"] = self.CaclEnemyTotalScore(oPlayer)
            if self.m_Scene.m_GameMode == Common_pb2.GAME_MODE_CHALLENGE:
                dPlayerData["ChallengeScore"] = self.m_Scene.m_CurChallengeScore
            if self.m_Scene.m_GameMode == Common_pb2.GAME_MODE_BOMB:
                dPlayerData["CauseDamage"] = self.CalcCauseDamage(oPlayer)
                dPlayerData["HurtDamage"] = self.CalcHurtTeamHP(oPlayer.m_MemberType)
                dPlayerData["HitExplodeDamage"] = self.GetHitExplodeDamage(oPlayer.m_MemberType)
                dPlayerData["NotHitExplodeDamage"] = self.GetNotHitExplodeDamage(oPlayer.m_MemberType)

    def OnGameEnd(self, iWinMemberType, iLastTime, dQuarterWinTimes):
        self.m_WinMemberType = iWinMemberType
        self.m_GameLastTime = iLastTime
        self.m_QuarterWinTimes = dQuarterWinTimes
        self.AfterGameEnd()
        self.OutPutReport()

    def CounterListener(self, iPlayerID, dEventData):
        if not self.IsValidPlayer(iPlayerID):
            return
        else:
            iCounterType = dEventData["计数器类型"]
            iChange = dEventData["计数器变化值"]
            if iCounterType != BattleCmd_pb2.COUNTER_TYPE_CONTINUOUS:
                return
            dPlayerData = self.m_PlayerData[iPlayerID]
            if iChange > 0:
                dPlayerData["ContinuesCounterAdd"] += iChange
            elif iChange < 0:
                dPlayerData["ContinuesCounterReduce"] += abs(iChange)

    def OnHitActionEnd(self, iPlayerID, iActionSID, iSkillSID, bHited):
        if not self.IsValidPlayer(iPlayerID):
            return
        oDefRowData = self.TryGetRowData(iPlayerID, BATTLE_REPORT_ROW_TYPE_ACTION, iActionSID, iSkillSID)
        if oDefRowData:
            oDefRowData.m_LoseTimes += 1
