# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\badminton\bombbadminton.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 5528 bytes
from .badminton import CBadminton
from base.data import bombplayconfig
from base.data import GetHitActionData
from base.protobufdata import Common_pb2, BattleCmd_pb2
from battlelogic.battlebase.dvec3 import PackSintVec3
from battlelogic.common.defines import GetEnemyMemberType
from battlelogic.common.decorator import NoPrediction
from battlelogic.common.debug import LogError

class CBombBadminton(CBadminton):

    def __init__(self, iID, oScene):
        super().__init__(iID, oScene)
        self.m_Damage = (0, 0)
        self.m_DamageDis = (0, 0)
        self.m_ExplodeProbConfig = {}
        self.m_ExplodeProgress = 0
        self.m_ExplodeProb = 0
        self.m_PreJudgeExplode = False

    def InitBombplayConfig(self):
        iBattleMode = self.m_Scene.GetBattleMode()
        dConfig = bombplayconfig.GetBombplayConfig(iBattleMode)
        self.m_Damage = dConfig["bombDamage"]
        self.m_DamageDis = dConfig["bombDamageDis"]
        self.m_ExplodeProbConfig = dConfig["explodeProb"]

    def HitBadminton(self, oHitArgs):
        if self.m_PreJudgeExplode:
            oAttPlayer = self.m_Scene.GetPlayer(oHitArgs.m_AtkPlayerID)
            oAttPlayer.AddRecord(BattleCmd_pb2.BATTLE_RECORD_PRE_EXPLOD_TIMES, 1)
            oAttPlayer.DoStop()
            self.DoExplode(oHitArgs.m_AtkPlayerID)
            return
        self.RecDefenseHitData(oHitArgs)
        self.m_HitBadmintonArgs = oHitArgs
        self.PreDoHitBadminton()
        self.DoHitBadminton()

    def InitAfterEnterScene(self):
        self.InitBombplayConfig()
        super().InitAfterEnterScene()

    def PreDoHitBadminton(self):
        oHitArgs = self.m_HitBadmintonArgs
        iActionID = oHitArgs.m_AtkActionSID
        oHitActionData = GetHitActionData(iActionID)
        iNewProgress = self.GetExplodeProgress() + oHitActionData.m_ExplodeProgressEffect
        self.SetExplodeProgress(iNewProgress)

    def PreExplodeRandom(self, oHitArgs):
        iActionID = oHitArgs.m_AtkActionSID
        oHitActionData = GetHitActionData(iActionID)
        if oHitActionData.m_IsSafe:
            self.m_PreJudgeExplode = False
        else:
            self.m_PreJudgeExplode = self.ExplodeRandom()
        return self.m_PreJudgeExplode

    def ExplodeRandom(self):
        return self.RandomBetween(0, 10000) < self.m_ExplodeProb

    def GetExplodeProgress(self):
        return self.m_ExplodeProgress

    def SetExplodeProgress(self, iValue):
        if iValue < 0:
            iValue = 0
        if iValue > 10000:
            iValue = 10000
        self.m_ExplodeProgress = iValue
        self.m_ExplodeProb = 0
        for iProgress, iProb in self.m_ExplodeProbConfig.items():
            if self.m_ExplodeProgress >= iProgress:
                self.m_ExplodeProb = iProb
            else:
                break

        self.OnExplodeProbDelta()
        self.OnSceneBattleEvent(BattleCmd_pb2.BATTLE_EVENT_TYPE_BOMB_EXPLODE_PROG_UPDATE, {})

    def RoundEnd(self):
        self.SetExplodeProgress(0)
        super().RoundEnd()

    def DoExplode(self, iTargetID=0):
        self.SetCurveData(None)
        self.OnExplodeDelta(iTargetID)
        self.RoundEnd()

    def OnSimulateFinished(self):
        self.SetCurveData(None)
        self.OnSceneBattleEvent(BattleCmd_pb2.BATTLE_EVENT_TYPE_BADMINTON_LANDING, {})
        iScoreTeam = self.GetScoreTeam()
        iHurtTeam = GetEnemyMemberType(iScoreTeam)
        playerLst = self.m_Scene.GetAllTeamPlayer(iHurtTeam)
        for oPlayer in playerLst:
            oPlayer.AddRecord(BattleCmd_pb2.BATTLE_RECORD_NOT_PRE_EXPLOD_TIMES, 1)

        self.DoExplode()

    def CalExplodeDamage(self, oPlayer):
        dDistance = self.CalcDistanceFromPlayer(oPlayer)
        iHorizontal = dDistance["Horizontal"]
        iMaxDis, iMinDis = self.m_DamageDis
        iMinDamage, iMaxDamage = self.m_Damage
        iDamage = 0
        if iHorizontal >= iMaxDis:
            iDamage = iMinDamage
        elif iHorizontal <= iMinDis:
            iDamage = iMaxDamage
        else:
            iDam = iMaxDamage - iMinDamage
            iDis = iMaxDis - iMinDis
            iDamage = iMinDamage + int((iMaxDis - iHorizontal) / iDis * iDam)
        return iDamage

    @NoPrediction
    def OnExplodeDelta(self, iTargetID):
        oMsg = BattleCmd_pb2.BattleBombBadmintonExplodeMsg()
        PackSintVec3(oMsg.ExplodePos, self.m_Pos)
        oMsg.PlayerID = iTargetID
        self.UpdateDelta(BattleCmd_pb2.BATTLE_BOMB_BADMINTON_EXPLODE_MSG, oMsg)

    @NoPrediction
    def OnExplodeProbDelta(self):
        oMsg = BattleCmd_pb2.BattleBombBadmintonProbMsg()
        oMsg.Prob = self.m_ExplodeProb
        oMsg.Progress = self.m_ExplodeProgress
        self.UpdateDelta(BattleCmd_pb2.BATTLE_BOMB_BADMINTON_PROB_MSG, oMsg)

    def CalcDistanceFromPlayer(self, oPlayer):
        oSelfPos = None
        if self.GetIsHitObject():
            oSelfPos = self.GetHitObjectPos()
        else:
            oSelfPos = self.GetPos()
        oPlayerPos = oPlayer.GetPos()
        dDistance = {'Horizontal':oSelfPos.HorizontalDistance(oPlayerPos), 
         'Vertical':abs(oSelfPos.m_Y - oPlayerPos.m_Y)}
        return dDistance

    def GetScoreTeam(self):
        iOtherSideMemberType = GetEnemyMemberType(self.GetMemberType())
        if self.GetHitObjectType() == BattleCmd_pb2.HIT_OBJ_TYPE_HIT_ENTITY:
            oHitObj = self.m_Scene.GetObject(self.m_HitObjectID)
            return GetEnemyMemberType(oHitObj.GetMemberType())
        else:
            if not self.m_PreJudgeExplode:
                if not self.m_Scene.InScoreArea(iOtherSideMemberType, self.GetPos(), self.GetIsServe()):
                    return iOtherSideMemberType
            return self.GetMemberType()

    def SetIsPreExplode(self, bIsPreExplode):
        self.m_PreJudgeExplode = bIsPreExplode

    def GetIsPreExplode(self):
        return self.m_PreJudgeExplode
