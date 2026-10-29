# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\badminton\badminton.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 26242 bytes
from battlelogic.combatobject import CCombatObject
from base.protobufdata import BattleCmd_pb2, Common_pb2
from battlelogic.battlebase.dvec3 import CDVec3
from battlelogic.battlebase.dphysics import RayCast
from battlelogic.battlebase.dmath import *
from battlelogic.common.defines import Frame2Sec, Sec2Frame, GetEnemyMemberType, IsServer, INT_MAX, CURVE_WAIT_TIME
from battlelogic.config.curveconfig import BADMINTON_MAPPER
from battlelogic.config.courtconfig import GetNetHeight
from battlelogic.common.debug import Log, LogWarning, LogError, Profiler
from battlelogic.battlebase.dmath import Lerp
from battlelogic.plugins.counter import countermanager
from base.data import GetHitActionData, GetCurveDropData
from C_debug import PythonError
from base.data import GetCourtData
from base.data import GetCounterData
from battlelogic.common.decorator import NoPrediction, ServerOnly
from battlelogic.common.defines import COLLISION_GROUP_BADMINTON
from battlelogic.battlebase.drandom import CGameRandom
from battlelogic.common.decorator import RecReplayOnly
if not IsServer():
    from prediction.curveprediction import CCurvePrediction
from battlelogic.common.debug import DevelopOnly
import math

class CBadminton(CCombatObject):

    def __init__(self, iID, oScene):
        super().__init__(iID, oScene, BattleCmd_pb2.SCENE_OBJECT_TYPE_BADMINTON)
        self.SetTableID(9001)
        self.m_HitObjectType = 0
        self.m_HitObjectID = 0
        self.m_IsSimulateFinished = True
        self.m_Owner = None
        self.m_HitKey = BattleCmd_pb2.HIT_KEY_KEY_NONE
        self.m_CurShape = 0
        self.m_IsShowBadminton = False
        self.m_StarMarkPos = CDVec3.Zero()
        self.m_HitBadmintonArgs = None
        self.m_CurveData = None
        if not IsServer():
            self.m_CurvePrediction = CCurvePrediction(self)
        self.m_IsServe = False
        self.m_LockerID = 0
        self.SetHidePos()
        self.m_CouldBeHit = True
        self.m_NotCheckStarMarkCounter = False
        self.m_Counter = countermanager.CCounterManager(self)
        self.m_Scene.m_Phys.CreateBadmintonController(self.m_ID, COLLISION_GROUP_BADMINTON)
        self.m_Random = CGameRandom()
        self.m_Random.SetRandomSeed(oScene.RandomBetween(0, 4294967295L))
        self.m_CurveCachePos = {}
        self.m_LastCurveID = 0
        self.m_IsServeCatch = False
        self.m_IsPrejudeHit = False
        self.m_IsHitObject = False
        self.m_HitObjectPos = CDVec3.Zero()
        self.m_IsForbidBodyShotVoice = False
        self.m_LastAttackerID = 0

    def SetPos(self, oPos, bNoLerp=False, bDelta=True):
        self.m_Pos = oPos
        if not IsServer():
            self.OnPosDelta()

    def InitAfterEnterScene(self):
        self.m_Scene.InitBadmintonStateByCourt(self)
        super().InitAfterEnterScene()

    def SetHidePos(self):
        self.SetPos(CDVec3(10000, 10000, 10000))

    def GetIsShowBadminton(self):
        return self.m_IsShowBadminton

    def SetIsShowBadminton(self, bIsShowBadminton):
        self.m_IsShowBadminton = bIsShowBadminton

    def GetCurCurveShape(self):
        return self.m_CurShape

    def GetHitKey(self):
        return self.m_HitKey

    def SetHitKey(self, iHitKey):
        self.m_HitKey = iHitKey

    def ClearOwner(self):
        self.m_Owner = None

    def GetOwner(self):
        return self.m_Owner

    def SetOwner(self, oObj):
        self.m_LastAttackerID = self.GetAttackerID()
        self.m_Owner = oObj

    def GetDropPos(self):
        if not self.m_CurveData:
            return CDVec3.Zero()
        else:
            x, y, z = self.m_CurveData.GetDropPos()
            return CDVec3(x, y, z)

    def GetTipsPos(self):
        if not self.m_CurveData:
            return CDVec3.Zero()
        else:
            x, y, z = self.m_CurveData.GetTipsPoint()
            return CDVec3(x, y, z)

    def GetStartPos(self):
        return self.m_StartPos

    def SetHitObjectType(self, iHitType):
        self.m_HitObjectType = iHitType

    def GetHitObjectType(self):
        return self.m_HitObjectType

    def GetSimulateFinished(self):
        return self.m_IsSimulateFinished

    def SetSimulateFinished(self, bFinished):
        self.m_IsSimulateFinished = bFinished
        self.OnSimulateFinishedDelta()

    def GetIsServe(self):
        return self.m_IsServe

    def SetIsServe(self, bIsServe):
        if self.m_IsServe:
            if not bIsServe:
                self.SetIsServeCatch(True)
        if self.GetIsServeCatch():
            self.SetIsServeCatch(False)
        self.m_IsServe = bIsServe

    def GetIsServeCatch(self):
        return self.m_IsServeCatch

    def SetIsServeCatch(self, bIsServeCatch):
        self.m_IsServeCatch = bIsServeCatch

    def SetLockerID(self, iLockerID):
        self.m_LockerID = iLockerID
        self.m_Scene.m_Phys.SetLockerID(self.m_ID, iLockerID)
        self.OnLockedDelta()

    def SetIsPrejudeHit(self, bIsPrejudeHit):
        self.m_IsPrejudeHit = bIsPrejudeHit
        self.m_Scene.OnSetBadmintonIsPrejudeHit(bIsPrejudeHit)

    def GetMemberType(self):
        if self.m_Owner:
            return self.m_Owner.GetMemberType()
        else:
            return Common_pb2.TEAM_MEMBER_TYPE_NONE

    def GetCurFrameSecond(self):
        iCurFrame = self.m_Scene.GetCurFrame()
        return Frame2Sec(iCurFrame)

    def InitHitData(self):
        self.SetHitObjectType(BattleCmd_pb2.HIT_OBJ_TYPE_HIT_NONE)
        self.m_HitObjectID = 0

    def IsDropInSameHalfCourt(self, oPos):
        return oPos.m_Z * self.GetDropPos().m_Z > 0

    def IsInSameHalfCourt(self, oPos, iPreJudgeFrame):
        oBadmintonPos = self.GetPreJudgePos(iPreJudgeFrame)
        return oPos.m_Z * oBadmintonPos.m_Z > 0

    def CheckBodyShot(self):
        return not self.GetSimulateFinished() and self.GetHitObjectType() != BattleCmd_pb2.HIT_OBJ_TYPE_HIT_NONE

    def IsFreeFly(self):
        if self.CheckBodyShot():
            return False
        else:
            if self.GetSimulateFinished():
                return False
            return True

    def ResetHitBadmintonArgs(self):
        self.m_HitBadmintonArgs = None

    def GetHitBadmintonArgs(self):
        return self.m_HitBadmintonArgs

    def CheckHitValid(self, iPreJudgeFrame):
        if not self.m_CouldBeHit:
            return False
        else:
            if not self.IsFreeFly():
                return False
            oPos = self.GetPreJudgePos(iPreJudgeFrame)
            if self.m_Scene.GetLowestHitHeight() > oPos.m_Y:
                return False
            return True

    def CheckHitterValid(self, oPlayer, iPreJudgeFrame):
        if self.m_LockerID:
            if oPlayer.m_ID != self.m_LockerID:
                return False
            if self.GetMemberType() == oPlayer.GetMemberType():
                return False
            oPlayerPos = oPlayer.GetPos()
            return self.IsDropInSameHalfCourt(oPlayerPos) or False
        else:
            if not self.IsInSameHalfCourt(oPlayerPos, iPreJudgeFrame):
                return False
            return True

    def SetCurveData(self, oCurveData):
        self.m_CurveData = oCurveData
        self.m_Scene.m_Phys.SetCurve(self.m_ID, oCurveData)
        self.m_CurveCachePos = {}
        if oCurveData:
            oCurveData.AddPassTime(0.04)

    def GetCurveLog(self, iCurveId, oDropPos, oHitArgs, iSpeedMul):
        sCurveLog = "生成球路  %s秒后落地 形状 （%s: %s）,计算落点 %s 实际落点 %s 击球参数 %s 球速倍率 %.2f" % (
         self.m_CurveData.m_FullTime,
         BattleCmd_pb2.SHAPE_TYPE.Name(iCurveId // 1000),
         iCurveId,
         oDropPos,
         self.m_CurveData.GetDropPos(),
         oHitArgs,
         iSpeedMul)
        return sCurveLog

    @Profiler
    def DoHitBadminton(self):
        oHitArgs = self.m_HitBadmintonArgs
        iCurveId = oHitArgs.m_CurveID
        oAttPlayer = self.m_Scene.GetPlayer(oHitArgs.m_AtkPlayerID)
        self.SetOwner(oAttPlayer)
        self.SetHitKey(oHitArgs.m_HitKey)
        self.InitHitData()
        self.SetIsServe(oHitArgs.m_IsServe)
        self.OnSceneBattleEvent(BattleCmd_pb2.BATTLE_EVENT_TYPE_BEFORE_HIT, {})
        oAttPlayer.SetCountersRecord(BattleCmd_pb2.COUNTER_TYPE_CONTINUOUS)
        oHitArgs.m_HitType = oAttPlayer.GetHitType()
        if oAttPlayer.GetDestineCurveID():
            iCurveId = oAttPlayer.GetDestineCurveID()
        oHitArgs.m_AtkCurveID = iCurveId
        iCurveType, dCurveData = self.GetCurveTypeAndData(iCurveId)
        iHitKey = oHitArgs.m_HitKey
        oStartPos = oHitArgs.m_StartPos
        oDropPos = oHitArgs.m_DropPos
        self.m_StartPos = oStartPos
        iAverageSpeedMultiAddition = self.GetCurveSpeedMultiAdditon(iHitKey)
        iSpeedMul = (oHitArgs.m_AverageSpeedMul + iAverageSpeedMultiAddition) / 10000
        if oStartPos.m_Y <= 0:
            oStartPos.m_Y = 0.1
        oCurveData = self.m_Scene.m_Phys.CreateCurve(oStartPos.m_X, oStartPos.m_Y, oStartPos.m_Z, oDropPos.m_X, oDropPos.m_Y, oDropPos.m_Z, iCurveId, iSpeedMul)
        if not oCurveData:
            LogError("生成球路失败", oStartPos, oDropPos, iCurveId, oHitArgs)
        oCurveData.m_OwnerID = oAttPlayer.m_ID
        self.SetCurveData(oCurveData)
        self.m_LastCurveID = iCurveId
        if iCurveType == BattleCmd_pb2.SHAPE_TYPE_FALLING:
            x, y, z = oCurveData.GetDropPos()
            oStartPos = CDVec3(x, dCurveData["startHeight"], z)
        self.m_Pos = oStartPos
        self.SetIsShowBadminton(True)
        if not IsServer():
            self.m_CurvePrediction.OnHitBegin(iCurveId)
        self.OnCurveDelta(iCurveId)
        if not oHitArgs.m_IsServe:
            self.CheckStarMark()
        self.HitBegin(oHitArgs)
        sCurveLog = self.GetCurveLog(iCurveId, oDropPos, oHitArgs, iSpeedMul)
        self.SendLogLog(sCurveLog)
        if math.isnan(self.m_CurveData.m_FullTime) or math.isnan(self.m_CurveData.m_PassTime):
            LogError("球路数据有误", sCurveLog)

    @RecReplayOnly
    def OnCurveDeltaForRecReplay(self, oMsg):
        oHitArgs = self.m_HitBadmintonArgs
        oMsg.OutDir = oHitArgs.m_OutDir

    @ServerOnly
    def OnCurveDelta(self, iCurveId):
        oCurveData = self.m_CurveData
        oHitArgs = self.m_HitBadmintonArgs
        oMsg = BattleCmd_pb2.BattleBadmintonCurveMsg()
        oMsg.OwnerID = oCurveData.m_OwnerID
        oMsg.DropPos = oHitArgs.m_DropPos.PackVec3()
        oMsg.StartFrame = self.m_Scene.GetCurFrame()
        oMsg.HitKey = oHitArgs.m_HitKey
        oMsg.StartPos = oHitArgs.m_StartPos.PackVec3()
        oPos = self.GetPos()
        oMsg.IsServe = self.GetIsServe()
        oMsg.CurveID = iCurveId
        oMsg.AverageSpeedMul = self.GetCurveAverageSpeedMulti()
        self.OnCurveDeltaForRecReplay(oMsg)
        self.m_Scene.AddDelta(BattleCmd_pb2.BATTLE_BADMINTON_CURVE_MSG, oMsg)

    def RecDefenseHitData(self, oHitArgs):
        oCurHitArgs = self.m_HitBadmintonArgs
        if oCurHitArgs:
            oHitArgs.m_DefActionSID = oCurHitArgs.m_AtkActionSID
            oHitArgs.m_DefPlayerID = oCurHitArgs.m_AtkPlayerID
            oHitArgs.m_DefSkillSID = oCurHitArgs.m_AtkSkillSID
            oHitArgs.m_DefCurveID = oCurHitArgs.m_AtkCurveID

    def HitBadminton(self, oHitArgs):
        self.RecDefenseHitData(oHitArgs)
        self.m_HitBadmintonArgs = oHitArgs
        self.DoHitBadminton()

    def HitBegin(self, oHitArgs):
        self.SetSimulateFinished(False)
        self.m_Scene.OnHitBegin(self.GetAttackerID(), oHitArgs)
        self.SetLockerID(0)
        if oHitArgs.m_HitType == BattleCmd_pb2.HIT_TYPE_STARMARK:
            self.OnSceneBattleEvent(BattleCmd_pb2.BATTLE_EVENT_TYPE_STARMARK_HIT, {})

    def RoundEnd(self):
        self.SetSimulateFinished(True)
        self.ResetStarMarkState()
        iScoreTeam = self.GetScoreTeam()
        if iScoreTeam == Common_pb2.TEAM_MEMBER_TYPE_NONE:
            Log("round end score team not found")
            return
        self.m_Scene.OnRoundEnd(self.GetAttackerID(), iScoreTeam, self.m_HitBadmintonArgs)
        self.OnCurveEndDelta()
        self.ResetHitBadmintonArgs()
        self.m_LastCurveID = 0

    def OnCurveEndDelta(self):
        oMsg = BattleCmd_pb2.BattleBadmintonCurveEndMsg()
        oMsg.Pos = self.m_Pos.PackVec3()
        self.m_Scene.AddDelta(BattleCmd_pb2.BATTLE_BADMINTON_CURVE_END_MSG, oMsg)

    def GetAttackerID(self):
        oAttacker = self.GetOwner()
        if oAttacker is None:
            return 0
        else:
            return oAttacker.m_ID

    def GetScoreTeam(self):
        iOtherSideMemberType = GetEnemyMemberType(self.GetMemberType())
        if self.GetHitObjectType() == BattleCmd_pb2.HIT_OBJ_TYPE_HIT_ENTITY:
            oHitObj = self.m_Scene.GetObject(self.m_HitObjectID)
            return GetEnemyMemberType(oHitObj.GetMemberType())
        else:
            if not self.m_Scene.InScoreArea(iOtherSideMemberType, self.GetPos(), self.GetIsServe()):
                return iOtherSideMemberType
            return self.GetMemberType()

    def PassHighestPos(self):
        self.OnSceneBattleEvent(BattleCmd_pb2.BATTLE_EVENT_TYPE_PASS_HIGHEST_POINT, {})

    def OnSimulateFinished(self):
        self.SetCurveData(None)
        if self.m_IsPrejudeHit:
            return
        self.OnSceneBattleEvent(BattleCmd_pb2.BATTLE_EVENT_TYPE_BADMINTON_LANDING, {})
        self.RoundEnd()

    def OnBodyShot(self, iHitObjectID, oShootPos, bIsForbidBodyShotVoice):
        oDelta = BattleCmd_pb2.BadmintonBodyShotMsg()
        oDelta.HitBodyID = iHitObjectID
        oDelta.Pos = oShootPos.PackVec3()
        oDelta.IsForbidVoice = bIsForbidBodyShotVoice
        self.m_Scene.AddDelta(BattleCmd_pb2.BATTLE_BADMINTON_BODY_SHOT_MSG, oDelta)

    def OnNetShot(self, oShootPos):
        oDelta = BattleCmd_pb2.BadmintonNetShotMsg()
        oDelta.Pos = oShootPos.PackVec3()
        self.m_Scene.AddDelta(BattleCmd_pb2.BATTLE_BADMINTON_NET_SHOT_MSG, oDelta)

    def GetStarMarkPos(self):
        return self.m_StarMarkPos

    def SetStarMarkPos(self, oPos):
        self.m_StarMarkPos = CDVec3.CopyFrom(oPos)

    def ResetStarMarkState(self):
        self.SetStarMarkPos(CDVec3.Zero())
        self.OnStarMarkDelta(False)

    def RefreshStarMarkInfo(self):
        x, y, z = self.m_CurveData.CalcStarMarkPos()
        self.SetStarMarkPos(CDVec3(x, y, z))

    @NoPrediction
    def CheckStarMark(self):
        self.RefreshStarMarkInfo()
        if not self.m_StarMarkPos.IsZero() and self.CheckAttackerStarMarkCounter():
            dEventData = {"pos": (self.m_StarMarkPos.m_X, self.m_StarMarkPos.m_Y, self.m_StarMarkPos.m_Z)}
            self.OnSceneBattleEvent(BattleCmd_pb2.BATTLE_EVENT_TYPE_STARMARK_BADMINTON, dEventData)
            self.OnStarMarkDelta(True)
        else:
            self.ResetStarMarkState()

    def GetCurPointIndex(self):
        if not self.m_CurveData:
            return 0
        else:
            return self.m_CurveData.m_CurPointIndex

    def OnStarMarkDelta(self, bIsShow):
        oDelta = BattleCmd_pb2.BadmintonStarMarkMsg()
        oDelta.IsShow = bIsShow
        oDelta.Pos = self.m_StarMarkPos.PackVec3()
        self.m_Scene.UpdateDelta(BattleCmd_pb2.BATTLE_BADMINTON_STAR_MARK_MSG, oDelta)

    @NoPrediction
    def OnSimulateFinishedDelta(self):
        oDelta = BattleCmd_pb2.BadmintonSimulateMsg()
        oDelta.IsFinished = self.GetSimulateFinished()
        self.m_Scene.UpdateDelta(BattleCmd_pb2.BATTLE_BADMINTON_SIMULATE_MSG, oDelta)

    def CalcDropPosX(self, oOwner, oStartPos, iOutDir, dCurveDrop, oHitArgs):
        dQuarterSize = self.m_Scene.GetQuartSizeDict()
        fHalfL = dQuarterSize["iLength"]
        if iOutDir != BattleCmd_pb2.BADMINTON_OUT_DIR_RIGHT:
            iStandard = dCurveDrop["LeftStandard"]
            iOffset = dCurveDrop["LeftOffset"] + oOwner.GetPropValue(Common_pb2.BATTLE_PROP_TYPE_DROPPOS_LEFT_OFFSET) / 100
            if oOwner.GetMemberType() == Common_pb2.TEAM_MEMBER_TYPE_HOST:
                fGood = -fHalfL
                fBad = 0
            else:
                fBad = 0
                fGood = fHalfL
        else:
            iStandard = dCurveDrop["RightStandard"]
            iOffset = dCurveDrop["RightOffset"] + oOwner.GetPropValue(Common_pb2.BATTLE_PROP_TYPE_DROPPOS_RIGHT_OFFSET) / 100
            if oOwner.GetMemberType() == Common_pb2.TEAM_MEMBER_TYPE_HOST:
                fGood = fHalfL
                fBad = 0
            else:
                fBad = 0
                fGood = -fHalfL
        fPercent = self.CalcDropValue(oOwner, iStandard, iOffset, "X", oHitArgs)
        if iOutDir == BattleCmd_pb2.BADMINTON_OUT_DIR_NONE:
            fPercent = self.RandomFloatBetween(-(1 - fPercent), 1 - fPercent)
        iPosX = (fGood - fBad) * fPercent + fBad
        if iOutDir == BattleCmd_pb2.BADMINTON_OUT_DIR_LEFT:
            if oOwner.GetMemberType() == Common_pb2.TEAM_MEMBER_TYPE_HOST:
                if iPosX > oStartPos.m_X:
                    iPosX = oStartPos.m_X
            elif iPosX < oStartPos.m_X:
                iPosX = oStartPos.m_X
        else:
            if iOutDir == BattleCmd_pb2.BADMINTON_OUT_DIR_RIGHT:
                if oOwner.GetMemberType() == Common_pb2.TEAM_MEMBER_TYPE_HOST:
                    if iPosX < oStartPos.m_X:
                        iPosX = oStartPos.m_X
                    elif iPosX > oStartPos.m_X:
                        iPosX = oStartPos.m_X
            return iPosX

    def CalcDropPosZ(self, oOwner, oStartPos, iHitKey, dCurveDrop, oHitArgs):
        dQuarterSize = self.m_Scene.GetQuartSizeDict()
        fHalfW = dQuarterSize["iWidth"]
        fFrontBackLine = self.m_Scene.GetFrontBackLine()
        if iHitKey in (BattleCmd_pb2.HIT_KEY_KEY_D, BattleCmd_pb2.HIT_KEY_KEY_GY):
            iStandard = dCurveDrop["FarStandard"]
            iOffset = dCurveDrop["FarOffset"] + oOwner.GetPropValue(Common_pb2.BATTLE_PROP_TYPE_DROPPOS_FAR_OFFSET) / 100
        else:
            iStandard = dCurveDrop["NearStandard"]
            iOffset = dCurveDrop["NearOffset"] + oOwner.GetPropValue(Common_pb2.BATTLE_PROP_TYPE_DROPPOS_NEAR_OFFSET) / 100
        if oOwner.GetMemberType() == Common_pb2.TEAM_MEMBER_TYPE_HOST:
            fGood = -fHalfW
            fBad = 0
        else:
            fGood = fHalfW
            fBad = 0
        fPercent = self.CalcDropValue(oOwner, iStandard, iOffset, "Z", oHitArgs)
        return (fBad - fGood) * fPercent - fBad

    def CalcDropValue(self, oOwner, iStandard, iOffset, sType, oHitArgs):
        if sType == "X":
            if oHitArgs.m_DropPosOffsetX != -1:
                iOffset = oHitArgs.m_DropPosOffsetX
            if sType == "Z":
                if oHitArgs.m_DropPosOffsetZ != -1:
                    iOffset = oHitArgs.m_DropPosOffsetZ
        elif sType == "Z" and oHitArgs.m_HitKey == BattleCmd_pb2.HIT_KEY_KEY_P:
            fGood = (iStandard - iStandard * iOffset / 100) / 100
        else:
            fGood = ((100 - iStandard) * iOffset / 100 + iStandard) / 100
        fBad = iStandard / 100
        fRand = self.RandomFloatBetween(0, 1)
        fGather = oHitArgs.m_DropPosGatherValue
        fOffset = fRand ** ((100 - fGather) / 100)
        return (fGood - fBad) * fOffset + fBad

    def CalcDropPos(self, oOwner, oHitArgs):
        _, dCurveData = self.GetCurveTypeAndData(oHitArgs.m_CurveID)
        oStartPos = oHitArgs.m_StartPos
        iHitKey = oHitArgs.m_HitKey
        iCurveDropID = dCurveData["curveDropId"]
        dCurveDrop = GetCurveDropData(iCurveDropID)
        iOutDir = oHitArgs.m_OutDir
        iX = self.CalcDropPosX(oOwner, oStartPos, iOutDir, dCurveDrop, oHitArgs)
        iZ = self.CalcDropPosZ(oOwner, oStartPos, iHitKey, dCurveDrop, oHitArgs)
        if self.m_Scene.m_TestDropPos:
            iX = self.m_Scene.m_TestDropPos[0]
            iZ = self.m_Scene.m_TestDropPos[2]
            if oOwner.GetMemberType() == Common_pb2.TEAM_MEMBER_TYPE_GUEST:
                iX = -iX
                iZ = -iZ
        return CDVec3(iX, 0, iZ)

    def GetCurveAverageSpeedMulti(self):
        oAttPlayer = self.GetOwner()
        return oAttPlayer.GetPropValue(Common_pb2.BATTLE_PROP_TYPE_HIT_BADMINTON_AVERAGE_SPEED_MUL)

    def GetCurveTypeAndData(self, iCurveId):
        iType = int(iCurveId / 1000)
        dData = None
        if iType in BADMINTON_MAPPER:
            shapeData = BADMINTON_MAPPER[iType]["shapeData"]
            dData = shapeData[iCurveId]
        return (
         iType, dData)

    def GetPreJudgePos(self, iPreJudgeFrame):
        iPreJudgeFrame = iPreJudgeFrame * self.m_BulletTimeScaleMgr.m_BulletTimeScale / 100
        if not self.m_CurveData or self.m_LockerID:
            return self.m_Pos
        if not iPreJudgeFrame:
            return self.m_Pos
        else:
            fPassTime = Frame2Sec(iPreJudgeFrame)
            if self.m_CurveData.m_PassTime + fPassTime in self.m_CurveCachePos:
                return self.m_CurveCachePos[self.m_CurveData.m_PassTime + fPassTime]
            x, y, z = self.m_CurveData.GetPointBySecond(fPassTime)
            oPos = CDVec3(x, y, z)
            self.m_CurveCachePos[self.m_CurveData.m_PassTime + fPassTime] = oPos
            return oPos

    def GetObjectToMePreAngle(self, oObject, iPreJudgeFrame):
        if iPreJudgeFrame:
            oPos = oObject.GetPreJudgePos(iPreJudgeFrame)
            oBadmintonPos = self.GetPreJudgePos(iPreJudgeFrame)
        else:
            oPos = oObject.GetPos()
            oBadmintonPos = self.GetPos()
        oDir = oBadmintonPos - oPos
        if oObject.GetMemberType() == Common_pb2.TEAM_MEMBER_TYPE_HOST:
            return CDVec3.DirAngle(oDir)
        else:
            return CDVec3.DirAngle(oDir * -1)

    def GetObjectToMeAngle(self, oObject):
        return self.GetObjectToMePreAngle(oObject, oObject.m_PreJudgeFrame)

    def CheckAttackerStarMarkCounter(self):
        if self.m_NotCheckStarMarkCounter:
            return True
        else:
            oAttacker = self.GetOwner()
            if oAttacker is None:
                return False
            dCounterData = GetCounterData(BattleCmd_pb2.COUNTER_TYPE_STARMARK)
            if oAttacker.GetCounterValue(BattleCmd_pb2.COUNTER_TYPE_STARMARK) >= dCounterData["maxvalue"]:
                return True
            return False

    def SetAllBulletTimeScale(self, iValue):
        oScene = self.m_Scene
        oScene.SetBulletTimeScale(iValue)
        oScene.SetAllPlayerBulletTimeScale(iValue)
        self.SetBulletTimeScale(iValue)

    def ResetAllBulletTimeScale(self):
        oScene = self.m_Scene
        oScene.ResetBulletTimeScale()
        oScene.ResetAllPlayerBulletTimeScale()
        self.ResetBulletTimeScale()

    def SetCouldBeHit(self, bFlag):
        self.m_CouldBeHit = bFlag
        self.OnCouldBeHitDelta()

    @ServerOnly
    def OnCouldBeHitDelta(self):
        oMsg = BattleCmd_pb2.BattleBadmintonCouldBeHitMsg()
        oMsg.CouldBeHit = self.m_CouldBeHit
        self.m_Scene.UpdateDelta(BattleCmd_pb2.BATTLE_BADMINTON_COULD_BE_HIT_MSG, oMsg)

    def ChangeNotCheckStarMarkCounter(self):
        self.m_NotCheckStarMarkCounter = 1 - self.m_NotCheckStarMarkCounter

    def DoRelease(self):
        self.m_Owner = None
        self.m_Counter.DoRelease()
        self.m_Scene.m_Phys.DestroyController(self.m_ID)
        super().DoRelease()

    def GetCounterValue(self, iCounterType):
        return self.m_Counter.GetCounter(iCounterType)

    def SetCounterValue(self, iCounterType, iCurValue):
        self.m_Counter.SetCounter(iCounterType, iCurValue)

    def OnCounterDelta(self, iCounterType, iCounterValue, bIsServeState=False):
        return

    def GetCurveShapeType(self):
        if not self.m_CurveData:
            return BattleCmd_pb2.SHAPE_TYPE_NONE
        else:
            return self.m_CurveData.m_CurveId // 1000

    def RandomBetween(self, param1, param2):
        if param1 > param2:
            param1, param2 = param2, param1
        return self.m_Random.Random(param2 - param1) + param1

    def RandomFloatBetween(self, param1, param2):
        return self.RandomBetween(int(param1 * 1000), int(param2 * 1000)) / 1000

    def ChooseKey(self, dRatio, iTotal=0):
        return self.m_Random.ChooseKey(dRatio, iTotal)

    def OnLockedDelta(self):
        oMsg = BattleCmd_pb2.BattleBadmintonLockedMsg()
        oMsg.LockerID = self.m_LockerID
        self.UpdateDelta(BattleCmd_pb2.BATTLE_BADMINTON_LOCKED_MSG, oMsg)

    def PackNeedCurveData(self):
        oMsg = BattleCmd_pb2.BattleFakebadmintonCurveMsg()
        oCurveData = self.m_CurveData
        oHitArgs = self.m_HitBadmintonArgs
        oMsg.CurveID = oCurveData.m_CurveId
        oMsg.OwnerID = oCurveData.m_OwnerID
        oMsg.StartPos = oHitArgs.m_StartPos.PackVec3()
        oMsg.HitKey = oHitArgs.m_HitKey
        oMsg.OutDir = oHitArgs.m_OutDir
        oMsg.AverageSpeedMul = self.GetCurveAverageSpeedMulti()
        oMsg.DropPosOffsetX = oHitArgs.m_DropPosOffsetX
        oMsg.DropPosOffsetZ = oHitArgs.m_DropPosOffsetZ
        return oMsg

    def GetCurveSpeedMultiAdditon(self, iHitKey):
        oAttacker = self.GetOwner()
        iAverageSpeedAddition = 0
        if iHitKey == BattleCmd_pb2.HIT_KEY_KEY_P:
            iAverageSpeedAddition = oAttacker.GetPropValue(Common_pb2.BATTLE_PROP_TYPE_P_BADMINTON_SPEED_MUL)
        elif iHitKey == BattleCmd_pb2.HIT_KEY_KEY_D:
            iAverageSpeedAddition = oAttacker.GetPropValue(Common_pb2.BATTLE_PROP_TYPE_D_BADMINTON_SPEED_MUL)
        else:
            if iHitKey == BattleCmd_pb2.HIT_KEY_KEY_GY:
                iAverageSpeedAddition = oAttacker.GetPropValue(Common_pb2.BATTLE_PROP_TYPE_GY_BADMINTON_SPEED_MUL)
        return iAverageSpeedAddition - 10000

    def GetHitDir(self):
        if self.m_HitBadmintonArgs:
            return self.m_HitBadmintonArgs.m_OutDir
        else:
            return 0

    def GetAtkSkillSID(self):
        if self.m_HitBadmintonArgs:
            return self.m_HitBadmintonArgs.m_AtkSkillSID
        else:
            return 0

    def PreExplodeRandom(self, oHitArgs):
        return False

    def SetHitObjectPos(self, oPos):
        self.m_HitObjectPos = oPos

    def GetHitObjectPos(self):
        return self.m_HitObjectPos

    def SetIsHitObject(self, bIsHitObject):
        self.m_IsHitObject = bIsHitObject

    def GetIsHitObject(self):
        return self.m_IsHitObject

    def SetIsPreExplode(self, bIsPreExplode):
        return

    def GetIsPreExplode(self):
        return False

    def SetIsForbidBodyShotVoice(self, bIsForbidBodyShotVoice):
        self.m_IsForbidBodyShotVoice = bIsForbidBodyShotVoice

    def GetIsForbidBodyShotVoice(self):
        return self.m_IsForbidBodyShotVoice

    def GetExplodeProgress(self):
        return 0

    def SetExplodeProgress(self, iValue):
        return
