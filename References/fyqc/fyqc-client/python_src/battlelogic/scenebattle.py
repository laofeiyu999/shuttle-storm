# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\scenebattle.py
# Compiled at: 2023-04-06 17:07:52
# Size of source mod 2**32: 40334 bytes
from base.data import GetCourtData, GetBOTPlayerData, GetCourtPlayData
from battlelogic.battlebase.dvec3 import CDVec3, PackSintVec3
from .scene import CScene
from base.protobufdata import DCmd_pb2
from base.protobufdata import Common_pb2
from base.protobufdata import BattleCmd_pb2
from base.protobufdata import BattleCtrl_pb2
from base.protobufdata import NormalCmd_pb2
from battlelogic.common.debug import Log, LogWarning, LogError
from battlelogic.common.defines import FRAME, Frame2Sec
from battlelogic.common.defines import IsServer
from battlelogic.common.defines import GetEnemyMemberType
from battlelogic.common.defines import IsPlayerObjectID
from C_net import *
from .sceneplugins.property.propertyplay import CPropertyPlay
from .sceneplugins.courtplay.courtplay import CCourtPlay
from base.data import GetSceneData
from .sceneplugins.battlereport.battlereport import CBattleReport
from .common.defines import INT_MAX, COLLISION_GROUP_CHAR
from battlelogic.battlebase.dfunctor import CDFunctor
from base.data import GetHeroData, GetGameRuleData, GetRandIcon
from base.data import rplstr
from base.data import GetHitActionData
from .sceneplugins.mvpscore.mvpscore import CMVPScore
from battlelogic.common.decorator import NoPrediction
from base.data import GetGameAIPlayerData
from base.data import GetRandGameAI
from base.data import voice, GetVoiceData
from battlelogic.common.defines import GAME_BOT_DIFFICULTY_LEVEL
from base.robot.bot import GetBOTPlayerLst
import random

class CSceneBattle(CScene):

    def __init__(self, iID, iRandomSeed, iGameMode, iBattleMode, iOwnerID, iSceneIndex):
        super().__init__(iID, iRandomSeed, iGameMode, iBattleMode, iOwnerID, iSceneIndex)
        self.m_LastScoreTeam = Common_pb2.TEAM_MEMBER_TYPE_NONE
        self.m_ScoreBoard = {}
        self.m_WinTeam = Common_pb2.TEAM_MEMBER_TYPE_NONE
        self.m_PropertyPlay = None
        self.m_CourtPlay = None
        self.m_OnScoreChangeFunc = None
        self.m_GameEndRuleType = BattleCmd_pb2.GAME_END_RULE_TYPE_BO1
        self.m_ServeType = BattleCmd_pb2.SERVE_TYPE_NORMAL
        self.m_CurQuarterIndex = 1
        self.m_QuarterScoreBoard = {}
        self.m_BattleReport = None
        self.m_LastWinScoreRecord = (0, 0)
        self.m_MVPScore = CMVPScore(self)
        self.m_WinDropPos = {}
        self.m_MemberWinScoreIdx = {}
        self.m_MemberWinQuarterIdx = {}
        self.m_LastScorePlayerID = 0
        self.m_LastPropertyBoxTrigger = 0
        self.m_TargetProcess = {}

    def Init(self):
        super().Init()
        self.InitScenePlugins()

    def GetSceneType(self):
        return BattleCmd_pb2.SCENE_TYPE_NONE

    def ExecuteLoop(self):
        self.HandleState()
        if self.m_PropertyPlay:
            self.m_PropertyPlay.ExecuteLoop()
        if self.m_CourtPlay:
            self.m_CourtPlay.ExecuteLoop()
        super().ExecuteLoop()

    def OnQuarterIndexDelta(self):
        oMsg = BattleCmd_pb2.BattleUpdateQuarterIndexMsg()
        oMsg.CurQuarterIndex = self.m_CurQuarterIndex
        self.AddDelta(BattleCmd_pb2.BATTLE_UPDATE_QUARTER_INDEX_MSG, oMsg)

    def SetQuarterIndex(self, iQuarterIndex):
        self.m_CurQuarterIndex = iQuarterIndex
        self.OnQuarterIndexDelta()

    def GetQuarterIndex(self):
        return self.m_CurQuarterIndex

    def AddScore(self, iAttackerID, iScoreTeam):
        oAttacker = self.GetPlayer(iAttackerID)
        oBadminton = self.GetFirstBadminton()
        if iScoreTeam not in self.m_ScoreBoard:
            self.m_ScoreBoard[iScoreTeam] = 0
        self.m_ScoreBoard[iScoreTeam] += 1
        self.OnScoreBoardDelta(iAttackerID, iScoreTeam)
        self.OnAddScore(iAttackerID, iScoreTeam)
        self.AddQuarterScoreBoard(iScoreTeam)
        self.AddWinDropPos(iAttackerID, iScoreTeam)
        self.SetMemberWinScoreIdx(iScoreTeam)
        if self.m_OnScoreChangeFunc:
            self.m_OnScoreChangeFunc()

    def OnAddScore(self, iAttackerID, iScoreTeam):
        oAttacker = self.GetPlayer(iAttackerID)
        oBadminton = self.GetFirstBadminton()
        oDropPos = oBadminton.GetPos()
        bIsInScoreArea, bIsOutofArea = (False, False)
        iAttackerMemberType = None
        if oAttacker:
            iAttackerMemberType = oAttacker.GetMemberType()
            bIsInScoreArea = self.InScoreArea(GetEnemyMemberType(iAttackerMemberType), oDropPos, oBadminton.GetIsServe())
            bIsOutofArea = self.GetIsOutOfArea(GetEnemyMemberType(iAttackerMemberType), oDropPos, oBadminton.GetIsServe())
        if oBadminton.GetHitObjectType() == BattleCmd_pb2.HIT_OBJ_TYPE_HIT_ENTITY:
            bIsInScoreArea = False
            bIsOutofArea = False
        if oBadminton.GetHitObjectType() == BattleCmd_pb2.HIT_OBJ_TYPE_HIT_NET:
            bIsOutofArea = False
        iAtkActionSID, iDefActionSID = (0, 0)
        if oBadminton.GetHitBadmintonArgs():
            iAtkActionSID = oBadminton.GetHitBadmintonArgs().m_AtkActionSID
            iDefActionSID = oBadminton.GetHitBadmintonArgs().m_DefActionSID
        dEventData = {'是否发球得分':oBadminton.GetIsServe(),  '是否接发球得分':oBadminton.GetIsServeCatch(), 
         '是否界内':bIsInScoreArea, 
         '是否出界':bIsOutofArea, 
         '动作ID':iAtkActionSID, 
         '敌方动作ID':iDefActionSID, 
         '击球玩家ID':iAttackerID}
        self.OnBattleEvent(BattleCmd_pb2.BATTLE_EVENT_TYPE_SCORE_BOARD_UPDATE, dEventData)

    def AddQuarterScoreBoard(self, iScoreTeam):
        iIdx = self.m_CurQuarterIndex
        if iIdx not in self.m_QuarterScoreBoard:
            self.m_QuarterScoreBoard[iIdx] = {}
        dScoreBoard = self.m_QuarterScoreBoard[iIdx]
        if iScoreTeam not in dScoreBoard:
            dScoreBoard[iScoreTeam] = 0
        dScoreBoard[iScoreTeam] += 1

    def AddWinDropPos(self, iAttackerID, iScoreTeam):
        if not iAttackerID:
            return
        else:
            oAttacker = self.GetPlayer(iAttackerID)
            iAttackerMemberType = oAttacker.GetMemberType()
            oBadminton = self.GetFirstBadminton()
            oDropPos = oBadminton.GetPos()
            if iScoreTeam not in self.m_WinDropPos:
                self.m_WinDropPos[iScoreTeam] = []
            if iScoreTeam == iAttackerMemberType:
                self.m_WinDropPos[iScoreTeam].append(oDropPos)

    def OnSetScoreBoardDelta(self, iMemberType):
        oMsg = BattleCmd_pb2.BattleSetScoreBoardMsg()
        oMsg.TeamMember = iMemberType
        oMsg.Score = self.GetTeamScore(iMemberType)
        self.AddDelta(BattleCmd_pb2.BATTLE_SET_SCORE_BORAD_MSG, oMsg)

    def SetScore(self, iMemberType, iScore):
        self.m_ScoreBoard[iMemberType] = iScore
        self.OnSetScoreBoardDelta(iMemberType)

    def GMSetScore(self, iScoreTeam, iScore):
        iCurQuarterIndex = self.m_CurQuarterIndex
        if iCurQuarterIndex not in self.m_QuarterScoreBoard:
            self.m_QuarterScoreBoard[iCurQuarterIndex] = {}
        dScoreBoard = self.m_QuarterScoreBoard[iCurQuarterIndex]
        if iScoreTeam not in dScoreBoard:
            dScoreBoard[iScoreTeam] = 0
        dScoreBoard[iScoreTeam] = iScore
        self.SetScore(iScoreTeam, iScore)

    def GetTeamScore(self, iMemberType):
        return self.m_ScoreBoard.get(iMemberType, 0)

    def GetQuarterScore(self, iMemberType):
        if iMemberType not in self.m_MemberWinQuarterIdx:
            return 0
        else:
            return len(self.m_MemberWinQuarterIdx[iMemberType])

    def GetAllMembersQuarterScore(self):
        dMembersQuarterScore = {}
        for iMemberType in self.m_PlayerByMemberType.keys():
            dMembersQuarterScore[iMemberType] = self.GetQuarterScore(iMemberType)

        return dMembersQuarterScore

    def GetMemberWinQuarterIdx(self, iMemberType):
        return self.m_MemberWinQuarterIdx.get(iMemberType, [])

    def GetLastScoreTeam(self):
        return self.m_LastScoreTeam

    def OnScoreBoardDelta(self, iAttackerID, iScoreTeam):
        oScoreBoardMsg = BattleCmd_pb2.BattleScoreBoardMsg()
        oScoreBoardMsg.ScoreTeam = iScoreTeam
        oScoreBoardMsg.Score = self.GetTeamScore(iScoreTeam)
        oScoreBoardMsg.AttackerID = iAttackerID
        self.AddDelta(BattleCmd_pb2.BATTLE_SCORE_BOARD_MSG, oScoreBoardMsg)

    def HandleState(self):
        iGameState = self.m_GameState
        if iGameState == BattleCmd_pb2.GAME_STATE_REPLAY:
            self.ProcessReplayState()
        elif iGameState == BattleCmd_pb2.GAME_STATE_READY_SERVE:
            self.ProcessReadyServeState()
        elif iGameState == BattleCmd_pb2.GAME_STATE_START_MOVIE:
            self.ProcessStartMovieState()
        elif iGameState == BattleCmd_pb2.GAME_STATE_SERVE:
            self.ProcessServeState()
        elif iGameState == BattleCmd_pb2.GAME_STATE_QUARTER_REST:
            self.ProcessQuarterRestState()

    def ProcessReplayState(self):
        if self.m_GameEndRuleType == BattleCmd_pb2.GAME_END_RULE_TYPE_BO1:
            self.ProcessReplayStateBO1()
        elif self.m_GameEndRuleType == BattleCmd_pb2.GAME_END_RULE_TYPE_BO3:
            self.ProcessReplayStateBO3()

    def ProcessReplayStateBO1(self):
        if self.m_GameStateEndFrame < self.GetCurFrame():
            if self.CheckGameEnd():
                self.OnGameEnd()
            else:
                self.OnReadyServe()

    def OnReadyServe(self):
        self.SetGameState(BattleCmd_pb2.GAME_STATE_READY_SERVE)
        self.ResetServeAndPosIndex()
        self.ResetPosition(False)
        self.ResetBadminton()
        self.OnBattleEvent(BattleCmd_pb2.BATTLE_EVENT_TYPE_READY_SERVE_STATE, {})

    def ProcessReplayStateBO3(self):
        if self.m_GameStateEndFrame < self.m_FrameNum:
            iWinQuarterTeam = self.CheckEnterQuarterRest()
            if iWinQuarterTeam != Common_pb2.TEAM_MEMBER_TYPE_NONE:
                if iWinQuarterTeam not in self.m_MemberWinQuarterIdx:
                    self.m_MemberWinQuarterIdx[iWinQuarterTeam] = []
                self.m_MemberWinQuarterIdx[iWinQuarterTeam].append(self.m_CurQuarterIndex)
        if self.CheckGameEnd():
            self.OnGameEnd()
        elif iWinQuarterTeam != Common_pb2.TEAM_MEMBER_TYPE_NONE:
            self.OnLeaveQuarter()
            self.OnEnterQuarterRest()
        else:
            self.OnReadyServe()

    def ProcessReadyServeState(self):
        if self.m_GameStateEndFrame < self.GetCurFrame():
            self.OnServe()

    def ProcessServeState(self):
        if self.m_GameStateEndFrame < self.GetCurFrame():
            iPlayerID = self.GetCurPointServePlayerID()
            oPlayer = self.GetPlayer(iPlayerID)
            if oPlayer.IsServing():
                return
            self.ServeOverTime(oPlayer)

    def ProcessQuarterRestState(self):
        if self.m_GameStateEndFrame < self.m_FrameNum:
            self.OnLeaveQuarterRest()

    def OnServe(self):
        self.SetGameState(BattleCmd_pb2.GAME_STATE_SERVE)
        self.OnBattleEvent(BattleCmd_pb2.BATTLE_EVENT_TYPE_SERVE_STATE, {})

    def AfterServe(self):
        if self.m_PropertyPlay:
            self.m_PropertyPlay.AfterServe()
        super().AfterServe()

    def ResetBadminton(self):
        for oBadminton in self.GetAllBadminton():
            oBadminton.SetHidePos()
            oBadminton.SetIsHitObject(False)
            oBadminton.SetHitObjectPos(CDVec3.Zero())
            oBadminton.SetIsPreExplode(False)

    def ProcessStartMovieState(self):
        if self.m_GameStateEndFrame < self.GetCurFrame():
            self.SetGameState(BattleCmd_pb2.GAME_STATE_READY_SERVE)
            self.OnBattleEvent(BattleCmd_pb2.BATTLE_EVENT_TYPE_READY_SERVE_STATE, {})

    def ResetPosIndexForSingle(self, iRemainder, iScoreTeam):
        iServePosIndex = 0
        for oSceneObjectDynamic in self.GetAllPlayer():
            iPosIndex = 0
            if iRemainder == 1:
                iPosIndex = 2
            else:
                iPosIndex = 1
            oSceneObjectDynamic.SetPosIndex(iPosIndex)
            if oSceneObjectDynamic.GetMemberType() == iScoreTeam:
                iServePosIndex = iPosIndex

        self.ReCalcServePlayer(iScoreTeam, iServePosIndex)

    def GetPlayerTeam(self, iTargetID):
        oTarget = self.GetPlayer(iTargetID)
        return oTarget.GetMemberType()

    def ResetPosIndexForDouble(self, iRemainder, iScoreTeam):
        iCurPointServePlayerID = self.GetCurPointServePlayerID()
        iLastServeTeam = self.GetPlayerTeam(iCurPointServePlayerID)
        iServePosIndex = 0
        for oSceneObjectDynamic in self.GetAllPlayer():
            iID = oSceneObjectDynamic.m_ID
            if oSceneObjectDynamic.GetMemberType() == iScoreTeam:
                if oSceneObjectDynamic.GetMemberType() == iLastServeTeam:
                    if iRemainder == 1:
                        if iID == iCurPointServePlayerID:
                            oSceneObjectDynamic.SetPosIndex(2)
                            iServePosIndex = 2
                        else:
                            oSceneObjectDynamic.SetPosIndex(1)
                    elif iID == iCurPointServePlayerID:
                        oSceneObjectDynamic.SetPosIndex(1)
                        iServePosIndex = 1
                    else:
                        oSceneObjectDynamic.SetPosIndex(2)
                elif iRemainder == 1:
                    iServePosIndex = 2
                else:
                    iServePosIndex = 1

        self.ReCalcServePlayer(iScoreTeam, iServePosIndex)

    def ResetServeAndPosIndex(self):
        iScoreTeam = self.m_LastScoreTeam
        iScore = self.GetTeamScore(iScoreTeam)
        iRemainder = iScore % 2
        if self.m_BattleMode == Common_pb2.BATTLE_MODE_SINGLE:
            self.ResetPosIndexForSingle(iRemainder, iScoreTeam)
        else:
            self.ResetPosIndexForDouble(iRemainder, iScoreTeam)

    def ResetPosition(self, bInit):
        self.m_Phys.SetIsServe(True)
        oCourtData = GetCourtData(self.m_CourtSID)
        for oObj in self.GetAllPlayer():
            oObj.StopMove()
            iPosIndex = oObj.GetPosIndex()
            iMemberType = oObj.GetMemberType()
            oPos = CDVec3.GetDVec3FromDict(oCourtData.m_ServePosDict[iMemberType][iPosIndex])
            oObj.SetPos(oPos, bNoLerp=True)

    def StopMove(self):
        for oObj in self.GetAllPlayer():
            oObj.StopMove()
            if not hasattr(oObj, "m_SmoothMgr"):
                pass
            else:
                oObj.m_SmoothMgr.Reset()

    def DoSelectServePlayer(self, iServeTeam, iPosIndex):
        iServePlayerID = 0
        for oObj in self.GetAllTeamPlayer(iServeTeam):
            iServePlayerID = oObj.ID()
            if oObj.GetPosIndex() == iPosIndex:
                break

        self.SwitchServePlayer(iServePlayerID)

    def ReCalcServePlayer(self, iServeTeam, iPosIndex):
        if self.m_ServeType == BattleCmd_pb2.SERVE_TYPE_NORMAL:
            self.DoSelectServePlayer(iServeTeam, iPosIndex)
        elif self.m_ServeType == BattleCmd_pb2.SERVE_TYPE_ONLY_HOST:
            self.DoSelectServePlayer(Common_pb2.TEAM_MEMBER_TYPE_HOST, iPosIndex)
        elif self.m_ServeType == BattleCmd_pb2.SERVE_TYPE_ONLY_GUEST:
            self.DoSelectServePlayer(Common_pb2.TEAM_MEMBER_TYPE_GUEST, iPosIndex)

    def GameStartInitServe(self):
        dTeamData = {(Common_pb2.TEAM_MEMBER_TYPE_GUEST): 50, (Common_pb2.TEAM_MEMBER_TYPE_HOST): 50}
        iServeTeam = self.ChooseKey(dTeamData)
        self.ReCalcServePlayer(iServeTeam, 1)

    def InitBattleReport(self):
        if not self.m_BattleReport:
            return
        for oPlayer in self.GetAllPlayer():
            if IsPlayerObjectID(oPlayer.m_ID):
                self.m_BattleReport.InitPlayer(oPlayer)
                oListenFunc = CDFunctor(self.m_BattleReport.CounterListener, oPlayer.m_ID)
                oPlayer.AddBattleListen(BattleCmd_pb2.BATTLE_EVENT_TYPE_COUNTER_UPDATE, "batlereport", oListenFunc)

    def InitScenePlugins(self):
        oSceneData = GetSceneData(self.m_SceneIndex)
        if oSceneData.m_PropertyID:
            self.m_PropertyPlay = CPropertyPlay(oSceneData.m_PropertyID, self)
        if oSceneData.m_CourtPlayID:
            self.m_CourtPlay = CCourtPlay(oSceneData.m_CourtPlayID, self)
        if self.m_GameMode in (Common_pb2.GAME_MODE_MATCH, Common_pb2.GAME_MODE_QUALIFY, Common_pb2.GAME_MODE_CHALLENGE, Common_pb2.GAME_MODE_BOMB,
         Common_pb2.GAME_MODE_NO_SKILL):
            self.m_BattleReport = CBattleReport(self)

    def InitAfterAllPlayerEnter(self):
        self.InitRobotPlayer()
        self.GameStartInitServe()
        self.ResetPosition(True)
        self.InitBattleReport()
        super().InitAfterAllPlayerEnter()

    def OnHitBegin(self, iAttackerID, oHitArgs):
        super().OnHitBegin(iAttackerID, oHitArgs)
        self.m_MVPScore.AddHitBadmintonRecord(iAttackerID)
        if self.m_BattleReport:
            self.m_BattleReport.OnHitBegin(oHitArgs)

    def TryRecServeScore(self, iAttackerID, iScoreTeam, oHitArgs):
        if iAttackerID == 0:
            if self.m_CurPointServePlayerID:
                oServePlayer = self.GetPlayer(self.m_CurPointServePlayerID)
                oServePlayer.AddRecord(BattleCmd_pb2.BATTLE_RECORD_LOSE_SERVE_TIMES, 1)
        elif oHitArgs.m_IsServe:
            pass
        iCatchPlayerID = self.CalcCatchServePlayerID()
        if iCatchPlayerID:
            oCatchServePlayer = self.GetPlayer(iCatchPlayerID)
            if oCatchServePlayer.GetMemberType() != iScoreTeam:
                oCatchServePlayer.AddRecord(BattleCmd_pb2.BATTLE_RECORD_LOSE_CATCH_SERVE_TIMES, 1)

    @NoPrediction
    def OnRoundEnd(self, iAttackerID, iScoreTeam, oHitArgs):
        self.SetGameState(BattleCmd_pb2.GAME_STATE_REPLAY)
        self.m_MVPScore.OnRoundEnd(iScoreTeam)
        self.TryRecServeScore(iAttackerID, iScoreTeam, oHitArgs)
        self.AddScore(iAttackerID, iScoreTeam)
        if iAttackerID != 0:
            self.SetAttackerID(iAttackerID)
            self.AddAttackerScoreRecord(iAttackerID, iScoreTeam, oHitArgs)
        self.m_LastScoreTeam = iScoreTeam
        self.StopMove()
        if self.m_PropertyPlay:
            self.m_PropertyPlay.OnRoundEnd()
        if self.m_BattleReport:
            self.m_BattleReport.OnScore(iAttackerID, iScoreTeam)
        for oSceneObjectDynamic in self.GetAllPlayer():
            oSceneObjectDynamic.OnScore()

        super().OnRoundEnd(iAttackerID, iScoreTeam, oHitArgs)

    def AddMVPKeyRecord(self, pid, iKey, iValue):
        self.m_MVPScore.AddMVPKeyRecord(pid, iKey, iValue)

    def AddAttackerScoreRecord(self, iAttackerID, iScoreTeam, oHitArgs):
        oAttacker = self.GetPlayer(iAttackerID)
        if not oAttacker:
            return
        else:
            oBadminton = self.GetFirstBadminton()
            if iScoreTeam != oAttacker.GetMemberType():
                oLastAttacker = self.GetPlayer(oBadminton.m_LastAttackerID)
                if oLastAttacker:
                    oLastAttacker.AddQuarterScoreRecord(self.m_CurQuarterIndex, 1)
                return
            self.m_LastScorePlayerID = iAttackerID
            oAttacker.AddQuarterScoreRecord(self.m_CurQuarterIndex, 1)
            if oBadminton.m_LastCurveID:
                iCurveType, dCurveData = oBadminton.GetCurveTypeAndData(oBadminton.m_LastCurveID)
                self.m_LastWinScoreRecord = (iAttackerID, iCurveType)
            else:
                self.m_LastWinScoreRecord = (0, 0)

    def CheckGameEndBO1(self):
        iHostScore = self.GetTeamScore(Common_pb2.TEAM_MEMBER_TYPE_HOST)
        iGuestScore = self.GetTeamScore(Common_pb2.TEAM_MEMBER_TYPE_GUEST)
        iFinalWinScore = self.GetFinalWinScore()
        iWinTeam = Common_pb2.TEAM_MEMBER_TYPE_NONE
        if iHostScore > iGuestScore:
            iMaxScore = iHostScore
            iMinScore = iGuestScore
            iWinTeam = Common_pb2.TEAM_MEMBER_TYPE_HOST
        else:
            iMaxScore = iGuestScore
            iMinScore = iHostScore
            iWinTeam = Common_pb2.TEAM_MEMBER_TYPE_GUEST
        if iFinalWinScore < iMinScore + self.GetLimitScoreDif():
            self.SetFinalWinScore(iFinalWinScore + 1)
            iFinalWinScore = self.GetFinalWinScore()
        elif iMaxScore == iFinalWinScore - 1:
            self.m_IsMatchPoint = True
        else:
            self.m_IsMatchPoint = False
        if iMaxScore >= iFinalWinScore:
            self.m_IsMatchPoint = False
            self.m_WinTeam = iWinTeam
            return True
        else:
            return False

    def CouldWinQuarter(self, iScore, iEnemyScore):
        dGameRuleData = GetGameRuleData()
        if self.m_CurQuarterIndex < 3:
            if iScore >= dGameRuleData["QuarterMaxScore"]:
                return True
        else:
            if iScore >= dGameRuleData["QuarterMaxScore"]:
                if iScore - iEnemyScore >= dGameRuleData["DeciderScoreDif"]:
                    return True
                if iScore >= dGameRuleData["DeciderMaxScore"]:
                    return True
            return False

    def CheckEnterQuarterRest(self):
        iHostScore = self.GetTeamScore(Common_pb2.TEAM_MEMBER_TYPE_HOST)
        iGuestScore = self.GetTeamScore(Common_pb2.TEAM_MEMBER_TYPE_GUEST)
        if self.CouldWinQuarter(iHostScore, iGuestScore):
            return Common_pb2.TEAM_MEMBER_TYPE_HOST
        else:
            if self.CouldWinQuarter(iGuestScore, iHostScore):
                return Common_pb2.TEAM_MEMBER_TYPE_GUEST
            return Common_pb2.TEAM_MEMBER_TYPE_NONE

    def CheckGameEndBO3(self):
        if self.GetQuarterScore(Common_pb2.TEAM_MEMBER_TYPE_HOST) >= 2:
            self.m_WinTeam = Common_pb2.TEAM_MEMBER_TYPE_HOST
            return True
        else:
            if self.GetQuarterScore(Common_pb2.TEAM_MEMBER_TYPE_GUEST) >= 2:
                self.m_WinTeam = Common_pb2.TEAM_MEMBER_TYPE_GUEST
                return True
            return False

    def CheckGameEnd(self):
        bRes = False
        if self.m_GameEndRuleType == BattleCmd_pb2.GAME_END_RULE_TYPE_BO1:
            bRes = self.CheckGameEndBO1()
        else:
            if self.m_GameEndRuleType == BattleCmd_pb2.GAME_END_RULE_TYPE_BO3:
                bRes = self.CheckGameEndBO3()
        return bRes

    def GetGameDuration(self):
        return int(Frame2Sec(self.m_FrameNum))

    def FormatMemberBattleData(self, oData):
        for iMemberType in (Common_pb2.TEAM_MEMBER_TYPE_HOST, Common_pb2.TEAM_MEMBER_TYPE_GUEST):
            oMemberBattleData = oData.MemberBattleDatas.add()
            oMemberBattleData.MemberType = iMemberType
            self.FormatMemberQuarterScoreData(iMemberType, oMemberBattleData)
            self.FormatWinDropPosData(iMemberType, oMemberBattleData)

    def FormatMemberQuarterScoreData(self, iMemberType, oData):
        dMemberWinIdx = self.m_MemberWinScoreIdx.get(iMemberType, {})
        for iQuarterIdx, lstWinIdx in dMemberWinIdx.items():
            oMemberQuarterScore = oData.MemberQuarterScore.add()
            oMemberQuarterScore.QuarterIndex = iQuarterIdx
            for iWinIdx in lstWinIdx:
                oMemberQuarterScore.WinIndex.append(iWinIdx)

    def FormatWinDropPosData(self, iMemberType, oData):
        lstDropPos = self.m_WinDropPos.get(iMemberType, [])
        for oPos in lstDropPos:
            oPosMsg = oData.WinDropPos.add()
            PackSintVec3(oPosMsg, oPos)

    def FormatGameResBaseInfo(self, oGameRes):
        if self.m_OriginalGameMode != Common_pb2.GAME_MODE_NONE:
            oGameRes.GameMode = self.m_OriginalGameMode
        else:
            oGameRes.GameMode = self.m_GameMode
        oGameRes.BattleMode = self.m_BattleMode
        oGameRes.SceneIndex = self.m_SceneIndex
        oGameRes.GameDuration = self.GetGameDuration()
        oGameRes.WinTeam = self.m_WinTeam
        oGameRes.MvpPlayerID = self.GetMVPPlayerID(self.m_WinTeam)
        oGameRes.HostScore = self.GetTeamScore(Common_pb2.TEAM_MEMBER_TYPE_HOST)
        oGameRes.GuestScore = self.GetTeamScore(Common_pb2.TEAM_MEMBER_TYPE_GUEST)
        oGameRes.BeginTime = self.m_BeginTime
        for iQuarterIndex in range(1, self.m_CurQuarterIndex + 1):
            oQuarterData = oGameRes.QuarterDatas.add()
            self.FormatQuarterData(oQuarterData, iQuarterIndex)

        self.FormatMemberBattleData(oGameRes)

    def FormatGameResPlayerInfo(self, oGameRes):
        for oPlayer in self.GetAllPlayer():
            oData = oGameRes.PlayerBattleDatas.add()
            oPlayer.FormatPlayerBattleData(oData)
            if self.m_GameMode not in (Common_pb2.GAME_MODE_NO_SKILL,):
                oPlayer.FormatPlayerSkillData(oData)
                oPlayer.FormatPlayerRuneData(oData)
            oPlayer.FormatPlayerBriefData(oData)

    def FormatGameResInfo(self, oGameRes):
        self.FormatGameResBaseInfo(oGameRes)
        self.FormatGameResPlayerInfo(oGameRes)

    def GS2CReadyLeaveQuarterRest(self):
        oMsg = BattleCmd_pb2.BattleReadyLeaveQuarterRestMsg()
        self.AddDelta(BattleCmd_pb2.BATTLE_READY_LEAVE_QUARTER_REST_MSG, oMsg)

    def DoReadyLeaveQuarterRest(self):
        self.m_GameStateEndFrame = self.m_FrameNum + 75
        self.GS2CReadyLeaveQuarterRest()

    def CheckReadyLeaveQuarterRest(self):
        allLosePlayerLst = self.GetAllEnemy(self.m_LastScoreTeam)
        for oPlayer in allLosePlayerLst:
            if not oPlayer.m_HasAbandonedExchangeSkill:
                return

        self.DoReadyLeaveQuarterRest()

    def OnGameEnd(self):
        self.OnLeaveQuarter()
        self.SetGameState(BattleCmd_pb2.GAME_STATE_END)
        if self.m_BattleReport:
            iGameLastSec = int(Frame2Sec(self.m_FrameNum))
            self.m_BattleReport.OnGameEnd(self.m_WinTeam, iGameLastSec, self.GetAllMembersQuarterScore())
        if self.m_GameEndFunc:
            self.m_GameEndFunc()

    def FormatQuarterData(self, oQuarterData, iQuarterIndex):
        oQuarterData.QuarterIndex = iQuarterIndex
        if iQuarterIndex in self.m_QuarterScoreBoard:
            dScoreBoard = self.m_QuarterScoreBoard[iQuarterIndex]
            oQuarterData.HostScore = dScoreBoard.get(Common_pb2.TEAM_MEMBER_TYPE_HOST, 0)
            oQuarterData.GuestScore = dScoreBoard.get(Common_pb2.TEAM_MEMBER_TYPE_GUEST, 0)

    def FormatQuarterMVPPlayerID(self, oData):
        iMVPScore = 0
        for oPlayer in self.GetAllPlayer():
            iPlayerMVPScore = oPlayer.GetQuarterMVPScore()
            if iPlayerMVPScore < iMVPScore:
                continue
            iMVPScore = iPlayerMVPScore
            oData.MVPPlayerID = oPlayer.m_ID

    def GS2CUpdateQuarterData(self):
        oMsg = BattleCmd_pb2.BattleUpdateQuarterDataMsg()
        self.FormatQuarterData(oMsg.Data, self.m_CurQuarterIndex)
        self.FormatQuarterMVPPlayerID(oMsg)
        self.AddDelta(BattleCmd_pb2.BATTLE_UPDATE_QUERTER_DATA_MSG, oMsg)

    def OnEnterQuarterRest(self):
        self.GS2CUpdateQuarterData()
        self.SetGameState(BattleCmd_pb2.GAME_STATE_QUARTER_REST)
        self.OnBattleEvent(BattleCmd_pb2.BATTLE_EVENT_TYPE_QUARTER_REST_STATE, {})
        for oObj in self.m_AllObjects.values():
            oObj.OnEnterQuarterRest()

    def ClearScoreBoard(self):
        for iScoreTeam in self.m_ScoreBoard.keys():
            self.SetScore(iScoreTeam, 0)

    def OnLeaveQuarterRest(self):
        self.ClearScoreBoard()
        self.SetQuarterIndex(self.m_CurQuarterIndex + 1)
        for oObj in self.m_AllObjects.values():
            oObj.OnLeaveQuarterRest()

        self.OnReadyServe()

    def FormatHalfwayEnterInfo(self, pid, oHalfwayEnterMsg):
        oHalfwayEnterMsg.GameState = self.m_GameState
        self.FormatHalfwayEnterScoreBoard(oHalfwayEnterMsg)
        for oPlayer in self.GetAllPlayer():
            oCurData = oHalfwayEnterMsg.CurDatas.add()
            oPlayer.GetCurData(oCurData)

        oBadminton = self.GetFirstBadminton()
        oHalfwayEnterMsg.BadmintonID = oBadminton.m_ID
        oHalfwayEnterMsg.CurFrame = self.m_FrameNum
        oHalfwayEnterMsg.CurEffectiveFrame = self.m_EffectiveFrameNum
        oHalfwayEnterMsg.ServePlayerID = self.m_ServePlayerID
        oHalfwayEnterMsg.GameStateEndFrame = self.m_GameStateEndFrame
        oHalfwayEnterMsg.CurQuarterIndex = self.m_CurQuarterIndex
        oHalfwayEnterMsg.CurPointServePlayerID = self.GetCurPointServePlayerID()
        for iQuarterIndex in range(1, self.m_CurQuarterIndex + 1):
            if iQuarterIndex == self.m_CurQuarterIndex:
                if self.m_GameState != BattleCmd_pb2.GAME_STATE_QUARTER_REST:
                    continue
            oQuarterData = oHalfwayEnterMsg.QuarterDatas.add()
            self.FormatQuarterData(oQuarterData, iQuarterIndex)

        self.FormatQuarterMVPPlayerID(oHalfwayEnterMsg)
        oPlayer = self.GetPlayer(pid)
        if oPlayer:
            if oPlayer.GetSceneObjectType() == BattleCmd_pb2.SCENE_OBJECT_TYPE_PLAYER:
                oPlayer.FormatOwnHalfwayEnterInfo(oHalfwayEnterMsg.OwnData)

    def GetHalfwayEnterInfo(self, pid):
        oHalfwayEnterMsg = BattleCtrl_pb2.BattleCtrlHalfwayEnterMsg()
        self.FormatHalfwayEnterInfo(pid, oHalfwayEnterMsg)
        return oHalfwayEnterMsg

    def OnPlayerReEnter(self, pid):
        oPlayer = self.GetPlayer(pid)
        self.NotifyToAll(rplstr.CRplStr("S_GAMEPLAYER_7", {"$$0": (oPlayer.Name())}))
        super().OnPlayerReEnter(pid)

    def GetPlayerGradeForRobot(self):
        if BattleCmd_pb2.SCENE_OBJECT_TYPE_PLAYER not in self.m_AllObjectsByType:
            return 5
        else:
            if self.GetSceneType() == BattleCmd_pb2.SCENE_TYPE_CHALLENGE:
                return 30
            for iPlayerID, oPlayer in self.m_AllObjectsByType[BattleCmd_pb2.SCENE_OBJECT_TYPE_PLAYER].items():
                if IsPlayerObjectID(iPlayerID):
                    return oPlayer.Grade()

            return 5

    def FormatRobotSkillData(self, oPlayerData, oData):
        oSchemeData = oPlayerData.SchemeData.add()
        oSchemeData.SchemeIdx = 0
        oSchemeData.Name = "AISkill"
        for iSkillID, iLevel in oData.m_SkillList:
            oSkillData = oPlayerData.SkillData.add()
            oSkillData.SkillID = iSkillID
            oSkillData.Level = iLevel
            oSkillData.IsEquip = True
            oSchemeData.Equips.append(iSkillID)

    def DoCreateRobotPlayer(self, iID, iMemberType, iPosIndex, oData):
        oPlayer = self.CreatePlayer(iID)
        oBattleScenePlayerData = BattleCmd_pb2.BattleScenePlayerData()
        oBriefData = oBattleScenePlayerData.BriefData
        oBriefData.ID = iID
        oBriefData.Name = oData.m_Name
        oHeroData = GetHeroData(oData.m_HeroID)
        iSex = oHeroData.m_Sex
        oBriefData.Grade = self.GetPlayerGradeForRobot()
        oBriefData.Icon = GetRandIcon()
        oBriefData.Sex = iSex
        oBattleScenePlayerData.MemberType = iMemberType
        oBattleScenePlayerData.PosIndex = iPosIndex
        oBattleScenePlayerData.HeroID = oData.m_HeroID
        for iApparealID in oData.m_ApparelList:
            oBattleScenePlayerData.Apparels.append(iApparealID)

        oPlayer.AttachBT(oData.m_BTConfID)
        if oData.m_Voice:
            oBattleScenePlayerData.EquipVoiceID = oData.m_Voice
        else:
            for iTableID in voice.DEFAULT_INIT_VOICE:
                oVoiceData = GetVoiceData(iTableID)
                if not not oVoiceData:
                    if iSex != oVoiceData.m_Sex:
                        pass
                    else:
                        oBattleScenePlayerData.EquipVoiceID = iTableID
                        break

        self.FormatRobotSkillData(oBattleScenePlayerData, oData)
        self.AddPlayer(oPlayer, oBattleScenePlayerData)
        return oPlayer

    def CalcMatchBotTeamInfo(self, iMemberType):
        targetLst = self.GetAllTeamPlayer(iMemberType)
        iTotalCnt = 0
        iTotalElo = 0
        iTotalWinRate = 0
        for oTarget in targetLst:
            if not IsPlayerObjectID(oTarget.m_ID):
                pass
            else:
                iTotalCnt += 1
                if self.m_BattleMode == Common_pb2.BATTLE_MODE_SINGLE:
                    iTotalElo += oTarget.m_BriefData.QualifyElo
                else:
                    if self.m_BattleMode == Common_pb2.BATTLE_MODE_DUAL:
                        iTotalElo += oTarget.m_BriefData.MatchElo
                iTotalWinRate += int(oTarget.m_PersonalDetail.get("CareerWinRate", 0.5) * 100)

        if iTotalCnt == 0:
            return (0, 0)
        else:
            return (
             iTotalElo / iTotalCnt, int(iTotalWinRate / iTotalCnt))

    def TryMatchOneBotPlayer(self, iMemberType):
        iEnemyMemberType = GetEnemyMemberType(iMemberType)
        fAvgElo, iAvgWinRate = self.CalcMatchBotTeamInfo(iEnemyMemberType)
        if not fAvgElo:
            if not iAvgWinRate:
                fAvgElo, iAvgWinRate = self.CalcMatchBotTeamInfo(iMemberType)
            lstBOTPlayerID = GetBOTPlayerLst(1, fAvgElo, iAvgWinRate)
            return lstBOTPlayerID or 1001
        else:
            return lstBOTPlayerID[0]

    def CalcBOTPlayerData(self, iMemberType, iPosIndex):
        iBOTPlayerID = 1001
        if self.m_GameMode == Common_pb2.GAME_MODE_PRACTICE:
            practiceBotLst = GAME_BOT_DIFFICULTY_LEVEL[self.m_GameAIDifficulty]
            iBOTPlayerID = random.choice(practiceBotLst)
        else:
            iBOTPlayerID = self.TryMatchOneBotPlayer(iMemberType)
        return GetBOTPlayerData(iBOTPlayerID)

    def DoCreateBOTPlayer(self, iMemberType, iPosIndex):
        oData = self.CalcBOTPlayerData(iMemberType, iPosIndex)
        self.DoCreateRobotPlayer(self.GetNpcID(), iMemberType, iPosIndex, oData)

    def DoCreateGameAIPlayer(self, iMemberType, iPosIndex):
        iGameAIPlayerID = GetRandGameAI()
        oData = GetGameAIPlayerData(iGameAIPlayerID)
        oPlayer = self.DoCreateRobotPlayer(self.GetNpcID(), iMemberType, iPosIndex, oData)
        oPlayer.m_IsGameAI = True

    def CreateRobotPlayer(self, iMemberType, iPosIndex):
        if self.m_OriginalGameMode == Common_pb2.GAME_MODE_ROOM:
            self.DoCreateBOTPlayer(iMemberType, iPosIndex)
        elif self.m_HasGameAI:
            self.DoCreateGameAIPlayer(iMemberType, iPosIndex)
        else:
            self.DoCreateBOTPlayer(iMemberType, iPosIndex)

    def InitRobotPlayerSingle(self):
        dAllPlayers = self.GetAllPlayer()
        iMemberType = Common_pb2.TEAM_MEMBER_TYPE_NONE
        for oObj in dAllPlayers:
            iMemberType = GetEnemyMemberType(oObj.GetMemberType())
            break

        self.CreateRobotPlayer(iMemberType, 1)

    def InitRobotPlayerDual(self):
        dAllPlayers = self.GetAllPlayer()
        dPlayerInfo = {}
        dPlayerInfo[Common_pb2.TEAM_MEMBER_TYPE_HOST] = {'Count':0, 
         'PosIndexDict':{}}
        dPlayerInfo[Common_pb2.TEAM_MEMBER_TYPE_GUEST] = {'Count':0, 
         'PosIndexDict':{}}
        for oObj in dAllPlayers:
            iMemberType = oObj.GetMemberType()
            dInfo = dPlayerInfo[iMemberType]
            dInfo["Count"] = dInfo["Count"] + 1
            dInfo["PosIndexDict"][oObj.GetPosIndex()] = True

        for iMemberType, dInfo in dPlayerInfo.items():
            for i in range(0, 2 - dInfo["Count"]):
                iPosIndex = 2 - i
                if iPosIndex in dInfo["PosIndexDict"]:
                    iPosIndex = iPosIndex - 1
                self.CreateRobotPlayer(iMemberType, iPosIndex)

    def InitRobotPlayer(self):
        if not self.CouldInitRobot():
            return
        if self.m_BattleMode == Common_pb2.BATTLE_MODE_SINGLE:
            self.InitRobotPlayerSingle()
        elif self.m_BattleMode == Common_pb2.BATTLE_MODE_DUAL:
            self.InitRobotPlayerDual()

    def ReleasePlugins(self):
        if self.m_PropertyPlay:
            self.m_PropertyPlay.DoRelease()
        else:
            if self.m_CourtPlay:
                self.m_CourtPlay.DoRelease()
            if self.m_BattleReport:
                self.m_BattleReport.DoRelease()
        self.m_MVPScore.DoRelease()

    def DoRelease(self):
        self.ReleasePlugins()
        self.m_OnScoreChangeFunc = None
        super().DoRelease()

    def ChangeNotCheckStarMarkCounter(self):
        oBadminton = self.GetFirstBadminton()
        oBadminton.ChangeNotCheckStarMarkCounter()

    def GetMVPPlayerID(self, iMemberType):
        allTeamPlayerLst = self.GetAllTeamPlayer(iMemberType)
        iMVPPlayerID = 0
        iMaxMVPScore = 0
        for oPlayer in allTeamPlayerLst:
            iMVPScore = oPlayer.GetCurMVPScore()
            if not iMVPPlayerID:
                if not iMaxMVPScore:
                    iMVPPlayerID = oPlayer.m_ID
                    iMaxMVPScore = iMVPScore
            if iMaxMVPScore < iMVPScore:
                iMVPPlayerID = oPlayer.m_ID
                iMaxMVPScore = iMVPScore

        return iMVPPlayerID

    def OnPropertyBoxTrigger(self, iPropertyBoxSID, iMemberType, iRefreshFrame, iTriggerPlayID, iPropertyID=0):
        if self.m_PropertyPlay:
            self.m_PropertyPlay.OnPropertyBoxTrigger(iPropertyBoxSID, iMemberType, iRefreshFrame, iTriggerPlayID, iPropertyID)
        self.OnPropertyBoxTriggerDelta(iTriggerPlayID)
        self.m_LastPropertyBoxTrigger = iTriggerPlayID
        self.OnBattleEvent(BattleCmd_pb2.BATTLE_EVENT_TYPE_PROPERTYBOX_TRIGGER, {})

    def SetScoreChangeFunc(self, func):
        self.m_OnScoreChangeFunc = func

    def GetClosestPlayer(self, iTargetID, oTargetPos):
        fClosestDistance = INT_MAX
        iClosestPlayerID = 0
        for oObj in self.GetAllPlayer():
            if iTargetID == oObj.m_ID:
                pass
            else:
                oPos = oObj.GetPos()
                fDistance = oPos.Distance(oTargetPos)
                if fDistance < fClosestDistance:
                    fClosestDistance = fDistance
                    iClosestPlayerID = oObj.m_ID

        return iClosestPlayerID

    def InitStateByCourtPlay(self, oPlayer):
        if not self.m_CourtPlay:
            return
        self.m_CourtPlay.InitStateByCourtPlay(oPlayer)

    def GetBattleScoreByPid(self, pid):
        oPlayer = self.GetPlayer(pid)
        if not oPlayer:
            return
        else:
            dBattleScore = {}
            iMemberType = oPlayer.GetMemberType()
            dCurScoreBoard = self.m_QuarterScoreBoard.get(self.m_CurQuarterIndex, {})
            dBattleScore["memberType"] = iMemberType
            dBattleScore["gameMode"] = self.m_GameMode
            dBattleScore["hostQuarterScore"] = self.GetQuarterScore(Common_pb2.TEAM_MEMBER_TYPE_HOST)
            dBattleScore["hostScore"] = dCurScoreBoard.get(Common_pb2.TEAM_MEMBER_TYPE_HOST, 0)
            dBattleScore["guestQuarterScore"] = self.GetQuarterScore(Common_pb2.TEAM_MEMBER_TYPE_GUEST)
            dBattleScore["guestScore"] = dCurScoreBoard.get(Common_pb2.TEAM_MEMBER_TYPE_GUEST, 0)
            return dBattleScore

    def SetBattleReportInfo(self, oReportFunc):
        if self.m_BattleReport:
            self.m_BattleReport.SetReportFunc(oReportFunc)

    def OnHitRes(self, iPlayerID, iHitKey, iHitType, iActionID, iSkillID):
        if self.m_BattleReport:
            self.m_BattleReport.OnTouchAction(iPlayerID, iActionID, iSkillID)
        super().OnHitRes(iPlayerID, iHitKey, iHitType, iActionID, iSkillID)

    def OnHitActionEnd(self, iPlayerID, iActionSID, iSkillSID, bHited, bInterrupted):
        if self.m_BattleReport:
            if not bInterrupted:
                self.m_BattleReport.OnHitActionEnd(iPlayerID, iActionSID, iSkillSID, bHited)

    def CheckGameAdvanceEnd(self):
        dNormalPlayerData = {}
        for oObj in self.GetAllPlayer():
            if oObj.GetPlayerStatus() == BattleCmd_pb2.BATTLE_SCENE_PLAYER_STATUS_NORMAL:
                iMemberType = oObj.GetMemberType()
                if iMemberType not in dNormalPlayerData:
                    dNormalPlayerData[iMemberType] = 0
                dNormalPlayerData[iMemberType] += 1

        for iMemberType in (Common_pb2.TEAM_MEMBER_TYPE_HOST, Common_pb2.TEAM_MEMBER_TYPE_GUEST):
            if iMemberType not in dNormalPlayerData:
                self.m_WinTeam = GetEnemyMemberType(iMemberType)
                self.OnGameEnd()
                break

    def FormatPlayerGameResExt(self, pid, oMsg):
        iPlayerID, iCurveID = self.m_LastWinScoreRecord
        if pid == iPlayerID:
            if iCurveID == BattleCmd_pb2.SHAPE_TYPE_PARABOLA_DOWN:
                oMsg.SelfJumpWinMatchPoint = True
        oMsg.LastScorePlayerID = self.m_LastScorePlayerID

    def GetWinTeam(self):
        return self.m_WinTeam

    def GetTotalScore(self):
        iTotal = 0
        for iScoreTeam, iScore in self.m_ScoreBoard.items():
            iTotal += iScore

        return iTotal

    def SetMemberWinScoreIdx(self, iScoreTeam):
        if iScoreTeam not in self.m_MemberWinScoreIdx:
            self.m_MemberWinScoreIdx[iScoreTeam] = {}
        dMemberWinIdx = self.m_MemberWinScoreIdx[iScoreTeam]
        if self.m_CurQuarterIndex not in dMemberWinIdx:
            dMemberWinIdx[self.m_CurQuarterIndex] = []
        iCurWinIdx = self.GetTotalScore()
        dMemberWinIdx[self.m_CurQuarterIndex].append(iCurWinIdx)

    def OnLeaveQuarter(self):
        for oPlayer in self.GetAllPlayer():
            oPlayer.AddUsedSkillSchemeHis(self.m_CurQuarterIndex)

    def ServeOverTime(self, oPlayer):
        self.OnServeOverTimeDelta()
        iMemberType = GetEnemyMemberType(oPlayer.GetMemberType())
        self.OnRoundEnd(0, iMemberType, None)

    def GetLastPropertyBoxTrigger(self):
        return self.m_LastPropertyBoxTrigger

    def OnServeOverTimeDelta(self):
        oMsg = BattleCmd_pb2.BattleServeOvertimeMsg()
        self.AddDelta(BattleCmd_pb2.BATTLE_SERVE_OVERTIME_MSG, oMsg)

    def OnPropertyBoxTriggerDelta(self, iTriggerPlayID):
        oMsg = BattleCmd_pb2.BattlePropertyBoxTriggerMsg()
        oMsg.PlayerID = iTriggerPlayID
        self.AddDelta(BattleCmd_pb2.BATTLE_TRIGGER_BOX_MSG, oMsg)

    def FormatHalfwayEnterScoreBoard(self, oHalfwayEnterMsg):
        oHalfwayEnterMsg.HostScore = self.m_ScoreBoard.get(Common_pb2.TEAM_MEMBER_TYPE_HOST, 0)
        oHalfwayEnterMsg.GuestScore = self.m_ScoreBoard.get(Common_pb2.TEAM_MEMBER_TYPE_GUEST, 0)

    def GetTargetValue(self, iTargetType):
        return self.m_TargetProcess.get(iTargetType, 0)

    def SetTargetValue(self, iTargetType, iValue):
        if iValue < 0:
            return
        self.m_TargetProcess[iTargetType] = iValue
