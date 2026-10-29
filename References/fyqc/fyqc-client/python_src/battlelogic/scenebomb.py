# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\scenebomb.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 6500 bytes
from .scenepvp import CScenePVP
from .badminton.bombbadminton import CBombBadminton
from base.protobufdata import Common_pb2, BattleCmd_pb2
from base.data import bombplayconfig
from battlelogic.common.defines import GetEnemyMemberType
from battlelogic.common.decorator import NoPrediction

class CSceneBomb(CScenePVP):

    def __init__(self, iID, iRandomSeed, iGameMode, iBattleMode, iOwnerID, iSceneIndex):
        super().__init__(iID, iRandomSeed, iGameMode, iBattleMode, iOwnerID, iSceneIndex)
        self.m_TeamHP = {}
        self.m_ScoreTeamDamage = {}
        self.m_TeamHitExplodeDamage = {}
        self.m_TeamNotHitExplodeDamage = {}

    def GetSceneType(self):
        return BattleCmd_pb2.SCENE_TYPE_BOMBPLAY

    def InitGameEndRule(self):
        self.m_GameEndRuleType = BattleCmd_pb2.GAME_END_RULE_TYPE_BO1

    def InitBombplayConfig(self):
        iBattleMode = self.GetBattleMode()
        dConfig = bombplayconfig.GetBombplayConfig(iBattleMode)
        self.m_TeamHP[Common_pb2.TEAM_MEMBER_TYPE_HOST] = dConfig["teamHP"]
        self.m_TeamHP[Common_pb2.TEAM_MEMBER_TYPE_GUEST] = dConfig["teamHP"]

    def InitAfterAllPlayerEnter(self):
        self.InitBombplayConfig()
        super().InitAfterAllPlayerEnter()

    def CreateBadminton(self):
        iID = self.GetNpcID()
        iNetIndex = self.NewNetIndex()
        oBadminton = CBombBadminton(iID, self)
        self.AddObject(BattleCmd_pb2.SCENE_OBJECT_TYPE_BADMINTON, iID, iNetIndex, oBadminton)
        if not self.m_FirstBadminton:
            self.m_FirstBadminton = oBadminton

    @NoPrediction
    def OnRoundEnd(self, iAttackerID, iScoreTeam, oHitArgs):
        self.SetGameState(BattleCmd_pb2.GAME_STATE_REPLAY)
        self.CalcDamage(iAttackerID, iScoreTeam)
        if iAttackerID != 0:
            self.SetAttackerID(iAttackerID)
            self.AddAttackerScoreRecord(iAttackerID, iScoreTeam, oHitArgs)
        self.m_LastScoreTeam = iScoreTeam
        self.StopMove()
        if self.m_PropertyPlay:
            self.m_PropertyPlay.OnRoundEnd()
        for oSceneObjectDynamic in self.GetAllPlayer():
            oSceneObjectDynamic.OnScore()

    def RecHurtTeamDamage(self, iHurtTeam, iTeamDamage):
        oBadminton = self.GetFirstBadminton()
        if oBadminton.GetIsPreExplode():
            if iHurtTeam not in self.m_TeamHitExplodeDamage:
                self.m_TeamHitExplodeDamage[iHurtTeam] = 0
            self.m_TeamHitExplodeDamage[iHurtTeam] += iTeamDamage
        else:
            if iHurtTeam not in self.m_TeamNotHitExplodeDamage:
                self.m_TeamNotHitExplodeDamage[iHurtTeam] = 0
            self.m_TeamNotHitExplodeDamage[iHurtTeam] += iTeamDamage

    def CalcDamage(self, iAttackerID, iScoreTeam):
        oBadminton = self.GetFirstBadminton()
        iHurtTeam = GetEnemyMemberType(iScoreTeam)
        playerLst = self.GetAllTeamPlayer(iHurtTeam)
        iTeamDamage = 0
        playerHurtLst = []
        for oPlayer in playerLst:
            iDamage = oBadminton.CalExplodeDamage(oPlayer)
            iTeamDamage += iDamage
            playerHurtLst.append((oPlayer.m_ID, iDamage))

        self.SyncPlayerHurtData(playerHurtLst)
        self.DoTeamDamage(iAttackerID, iScoreTeam, iHurtTeam, iTeamDamage)
        self.OnAddScore(iAttackerID, iScoreTeam)
        self.RecHurtTeamDamage(iHurtTeam, iTeamDamage)
        if oBadminton.GetIsPreExplode() or oBadminton.GetIsHitObject():
            return
        self.AddWinDropPos(iAttackerID, iScoreTeam)

    def DoTeamDamage(self, iAttackerID, iScoreTeam, iHurtTeam, iValue):
        iTeamCurHP = self.GetTeamHP(iHurtTeam)
        iTeamNewHP = max(0, iTeamCurHP - iValue)
        self.SetTeamHP(iHurtTeam, iTeamNewHP)
        self.OnDamage(iAttackerID, iScoreTeam, iTeamCurHP - iTeamNewHP)

    def OnTeamHPDelta(self, iMemberType):
        oMsg = BattleCmd_pb2.BattleBombTeamHPMsg()
        oMsg.TeamMember = iMemberType
        oMsg.HP = self.GetTeamHP(iMemberType)
        self.AddDelta(BattleCmd_pb2.BATTLE_BOMB_TEAM_HP_MSG, oMsg)

    def ServeOverTime(self, oPlayer):
        self.OnServeOverTimeDelta()
        oBadminton = self.GetFirstBadminton()
        oBadminton.SetPos(oPlayer.GetPos())
        oBadminton.SetOwner(oPlayer)
        oBadminton.DoExplode(oPlayer.m_ID)

    def CheckGameEndBO1(self):
        iHostHP = self.GetTeamHP(Common_pb2.TEAM_MEMBER_TYPE_HOST)
        iGuestHP = self.GetTeamHP(Common_pb2.TEAM_MEMBER_TYPE_GUEST)
        if iHostHP <= 0:
            self.m_WinTeam = Common_pb2.TEAM_MEMBER_TYPE_GUEST
            return True
        else:
            if iGuestHP <= 0:
                self.m_WinTeam = Common_pb2.TEAM_MEMBER_TYPE_HOST
                return True
            return False

    def GetTeamHP(self, iMemberType):
        return self.m_TeamHP.get(iMemberType, 0)

    def SetTeamHP(self, iMemberType, iValue):
        if iValue < 0:
            iValue = 0
        self.m_TeamHP[iMemberType] = iValue
        self.OnTeamHPDelta(iMemberType)

    def SyncPlayerHurtData(self, playerHurtLst):
        if not playerHurtLst:
            return
        oMsg = BattleCmd_pb2.BattleBombPlayerHurtMsg()
        for iPlayerID, iDamage in playerHurtLst:
            oData = oMsg.PlayerHurtDatas.add()
            oData.PlayerID = iPlayerID
            oData.Damage = iDamage

        self.AddDelta(BattleCmd_pb2.BATTLE_BOMB_PLAYER_HURT_MSG, oMsg)

    def FormatHalfwayEnterScoreBoard(self, oHalfwayEnterMsg):
        oHalfwayEnterMsg.HostHP = self.GetTeamHP(Common_pb2.TEAM_MEMBER_TYPE_HOST)
        oHalfwayEnterMsg.GuestHP = self.GetTeamHP(Common_pb2.TEAM_MEMBER_TYPE_GUEST)

    def OnDamage(self, iAttackerID, iScoreTeam, iTeamDamage):
        if iScoreTeam not in self.m_ScoreBoard:
            self.m_ScoreBoard[iScoreTeam] = 0
        self.m_ScoreBoard[iScoreTeam] += 1
        iCurWinIdx = self.GetTotalScore()
        if iScoreTeam not in self.m_ScoreTeamDamage:
            self.m_ScoreTeamDamage[iScoreTeam] = {}
        self.m_ScoreTeamDamage[iScoreTeam][iCurWinIdx] = iTeamDamage

    def FormatGameResBaseInfo(self, oGameRes):
        oBombBattleData = oGameRes.BombBattleData
        self.FormatBombMemberBattleData(oBombBattleData)
        super().FormatGameResBaseInfo(oGameRes)

    def FormatBombMemberBattleData(self, oData):
        for iMemberType in (Common_pb2.TEAM_MEMBER_TYPE_HOST, Common_pb2.TEAM_MEMBER_TYPE_GUEST):
            oMemberBattleData = oData.MemberBattleDatas.add()
            oMemberBattleData.MemberType = iMemberType
            oMemberBattleData.HurtDamage = self.m_BattleReport.CalcHurtTeamHP(iMemberType)
            self.FormatBombMemberDamageData(iMemberType, oMemberBattleData)
            self.FormatWinDropPosData(iMemberType, oMemberBattleData)

    def FormatBombMemberDamageData(self, iMemberType, oData):
        dDamage = self.m_ScoreTeamDamage.get(iMemberType, {})
        iTotal = 0
        for iIdx, iDamage in dDamage.items():
            iTotal += iDamage
            oMemberDamageData = oData.MemberDamageData.add()
            oMemberDamageData.WinIndex = iIdx
            oMemberDamageData.Damage = iDamage

        oData.TotalDamage = iTotal
