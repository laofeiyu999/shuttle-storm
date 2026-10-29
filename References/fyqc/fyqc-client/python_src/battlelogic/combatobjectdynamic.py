# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\combatobjectdynamic.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 31068 bytes
from .combatobject import CCombatObject
from base.protobufdata import Common_pb2
from base.protobufdata import BattleCmd_pb2
from .battlebase.dvec3 import CDVec3, PackFloatVec3, PackSintVec3
from .common.logicutil import IsMoveBySystem, AdjustDirByMemberType, GetInitFacing, IsInHorizontalRange, ConvertHitDirToDirType, CalcMoveSpeed
from .plugins.prop.propcontainer import CPropContainer
from .plugins.cd.cdmanager import CCDManager
from .plugins.hitaction.hitactioncontainer import CHitActionContainer
from base.data import GetHeroData
from .common.speedvalue import CSpeedValue
from .common.defines import FRAME, Time2Frame, Frame2Sec
from base.data import GetCourtData
from .battlebase.dmath import ClampFloat
from .badminton import CHitBadmintonArgs
from .common.defines import HIT_HAND_TYPE_FORE, HIT_HAND_TYPE_BACK
from base.protobufdata.BattleCmd_pb2 import DROP_AREA_MID_FLAG, DROP_AREA_FRONT_FLAG, DROP_AREA_BACK_FLAG, DROP_AREA_LEFT_FLAG, DROP_AREA_RIGHT_FLAG
from base.protobufdata.BattleCmd_pb2 import DROP_AREA_MEMIDFILED_FLAG, DROP_AREA_SIDE_FLAG
from base.protobufdata.BattleCmd_pb2 import HIT_TYPE_NONE, HIT_TYPE_SERVE, HIT_TYPE_NORMAL, HIT_TYPE_STARMARK
from .common.defines import HIT_AREA_MID_FLAG, HIT_AREA_FRONT_FLAG, HIT_AREA_BACK_FLAG, HIT_AREA_LEFT_FLAG, HIT_AREA_RIGHT_FLAG, HIT_AREA_SIDE_FLAG
from battlelogic.common.defines import IsServer, GetClientGame
from battlelogic.bot import CreateBOTAgent
from .battlebase.drandom import CGameRandom
from battlelogic.common.debug import LogWarning, TraceFunc, LogError, Profiler
from battlelogic.plugins.hitaction.hitactionvalue import BadmintonHeight, BadmintonDistance, BadmintonAngle, GetNetDistance
from battlelogic.common.defines import RANGE_HIT, RANGE_STRIDE, RANGE_RETRIEVE, INT_MAX
from battlelogic.common.defines import GetRangeDirPropType, GetRangeDir
from battlelogic.common.defines import HITACTION_PREJUDGE_FRAME, CURVE_PREJUDGE_FRAME
from battlelogic.common.defines import GetForbidActionFlag
from base.data import GetHitActionData
from base.protobufdata import SkillCmd_pb2
from .common.defines import SWING_SHOT_HIT_ACTION_ID
from battlelogic.common.debug import Log, LogFile
from battlelogic.plugins.hitaction.hitdata import CHitData
from battlelogic.plugins.counter.countermanager import CCounterManager
from battlelogic.plugins.behavior.behaviormanager import CBehaviorManager
from battlelogic.common.decorator import LocalPredictionHeroOnly, ClientOnly, NoRerun, ServerOnly, NoPrediction
from .common.defines import COLLISION_GROUP_CHAR
from battlelogic.common.defines import IsPlayerObjectID, COLLISION_GROUP_CHAR
from battlelogic.plugins.rune.runemanager import CRuneManager
from battlelogic.common.defines import SERVER_HIT_RANGE_TOLERANCE
from .plugins.dohitaction.dohitaction import CDoHitAction
from battlelogic.common.defines import BADMINTON_STARMARK_HEIGHT
from base.data import GetBTConfData
from battlelogic.plugins.state import CAddStateArgs
from .plugins.smoothpos.smoothposmgr import CSmoothPosMgr
import math

class CCombatObjectDynamic(CCombatObject):

    def __init__(self, iID, oScene, iSceneObjectType):
        super().__init__(iID, oScene, iSceneObjectType)
        self.m_PosIndex = 0
        self.m_MoveType = BattleCmd_pb2.MOVE_TYPE_STAND
        self.m_MoveDir = CDVec3.Zero()
        self.m_Facing = CDVec3.Zero()
        self.m_PropContainer = CPropContainer(self)
        self.m_ActionCDManager = CCDManager()
        self.m_HitActionManager = CHitActionContainer(self)
        self.m_BOTAgent = None
        self.m_CurBOTConfID = 0
        self.m_Random = CGameRandom()
        self.m_Random.SetRandomSeed(oScene.RandomBetween(0, 4294967295L))
        self.m_ApparelLst = []
        self.m_Record = {}
        self.m_ImmuneAttrData = {}
        self.m_ImmuneAttrFlag = 0
        self.m_CounterManager = CCounterManager(self)
        self.m_BehaviorManager = CBehaviorManager(self)
        self.m_TestIsNoCD = False
        self.m_InitPosIndex = 0
        self.m_RuneManager = CRuneManager(self)
        self.m_PreJudgeFrame = 0
        self.m_EquipVoiceID = 0
        self.m_DoHitAction = CDoHitAction(self)
        self.m_SmoothMgr = CSmoothPosMgr(self)

    def GetCollisionType(self):
        return COLLISION_GROUP_CHAR

    def GetPropValue(self, iPropType):
        return self.m_PropContainer.GetPropValue(iPropType)

    def Grade(self):
        return 0

    def ChangeProp(self, iPropType, sKey, iAddValue=0, iMulValue=0):
        self.m_PropContainer.ChangeProp(iPropType, sKey, iAddValue, iMulValue)

    def CancelChangeProp(self, iPropType, sKey):
        self.m_PropContainer.CancelChangeProp(iPropType, sKey)

    def GetSpeedValue(self):
        fSpeedForward = self.GetPropValue(Common_pb2.BATTLE_PROP_TYPE_SPEED_FORWARD)
        fSpeedBack = self.GetPropValue(Common_pb2.BATTLE_PROP_TYPE_SPEED_BACK)
        fSpeedRight = self.GetPropValue(Common_pb2.BATTLE_PROP_TYPE_SPEED_RIGHT)
        fSpeedLeft = self.GetPropValue(Common_pb2.BATTLE_PROP_TYPE_SPEED_LEFT)
        fDropPosSpeedMul = self.GetPropValue(Common_pb2.BATTLE_PROP_TYPE_TOWARD_DROPPOS_MAX_SPEED_MUL)
        fDropPosAngle = self.GetPropValue(Common_pb2.BATTLE_PROP_TYPE_TOWARD_DROPPOS_MAX_ANGLE)
        return CSpeedValue(fSpeedForward, fSpeedBack, fSpeedLeft, fSpeedRight, fDropPosSpeedMul, fDropPosAngle)

    def SetPosIndex(self, iPosIndex):
        self.m_PosIndex = iPosIndex
        self.OnPosIndexDelta()

    def OnPosIndexDelta(self):
        oPosIndexMsg = BattleCmd_pb2.BattlePosIndexMsg()
        oPosIndexMsg.PosIndex = self.m_PosIndex
        self.AddDelta(BattleCmd_pb2.BATTLE_POS_INDEX_MSG, oPosIndexMsg)

    def GetPosIndex(self):
        return self.m_PosIndex

    def GetMoveType(self):
        return self.m_MoveType

    @ClientOnly
    def OnMove(self, iMoveType):
        if iMoveType == BattleCmd_pb2.MOVE_TYPE_MOVE:
            self.OnBattleEvent(BattleCmd_pb2.BATTLE_EVENT_TYPE_START_MOVE, {})

    def SetMoveType(self, iMoveType, bDelta=True):
        if self.m_MoveType == iMoveType:
            return
        self.m_MoveType = iMoveType
        self.m_Scene.m_Phys.SetMoveType(self.m_ID, iMoveType)
        if bDelta:
            self.OnMoveTypeDelta()
        self.OnMove(iMoveType)

    def GetMoveDir(self):
        return self.m_MoveDir

    def SetMoveDir(self, oMoveDir):
        self.m_MoveDir = oMoveDir
        self.m_Scene.m_Phys.SetMoveDir(self.m_ID, oMoveDir.m_X, oMoveDir.m_Y, oMoveDir.m_Z)
        self.OnMoveDirDelta(oMoveDir)

    @ServerOnly
    def OnMoveDirDelta(self, oMoveDir):
        oMsg = BattleCmd_pb2.BattleMoveDirMsg()
        PackSintVec3(oMsg, oMoveDir)
        self.UpdateDelta(BattleCmd_pb2.BATTLE_MOVE_DIR_MSG, oMsg)

    def GetFacing(self):
        return self.m_Facing

    @ClientOnly
    def SetFacing(self, oFacing):
        self.m_Facing = oFacing
        self.OnFacingDelta()

    def GetHitKey(self):
        return self.m_DoHitAction.m_HitKey

    def SetApparelLst(self, oApparelLst):
        for iID in oApparelLst:
            self.m_ApparelLst.append(iID)

    def GetApparelLst(self):
        return self.m_ApparelLst

    def SetEquipVoice(self, iEquipVoiceID):
        self.m_EquipVoiceID = iEquipVoiceID

    def GetEquipVoice(self):
        return self.m_EquipVoiceID

    def AddQuarterScoreRecord(self, iQuarterIdx, iVal):
        iRecord = BattleCmd_pb2.BATTLE_RECORD_QUARTER_SCORE
        if iRecord not in self.m_Record:
            self.m_Record[iRecord] = {}
        dQuarterScore = self.m_Record[iRecord]
        if iQuarterIdx not in dQuarterScore:
            dQuarterScore[iQuarterIdx] = 0
        dQuarterScore[iQuarterIdx] += 1

    def SetRecord(self, iRecord, iVal):
        self.m_Record[iRecord] = iVal

    def AddRecord(self, iRecord, iVal):
        self.m_Record[iRecord] = self.m_Record.get(iRecord, 0) + iVal

    def GetRecord(self, iRecord):
        return self.m_Record.get(iRecord, 0)

    def AddImmuneAttr(self, iImmuneAttrType):
        if iImmuneAttrType not in self.m_ImmuneAttrData:
            self.m_ImmuneAttrData[iImmuneAttrType] = 0
        self.m_ImmuneAttrData[iImmuneAttrType] += 1
        self.m_ImmuneAttrFlag |= iImmuneAttrType

    def RemoveImmuneAttr(self, iImmuneAttrType):
        if iImmuneAttrType not in self.m_ImmuneAttrData:
            return
        self.m_ImmuneAttrData[iImmuneAttrType] -= 1
        if self.m_ImmuneAttrData[iImmuneAttrType] <= 0:
            self.m_ImmuneAttrFlag &= ~iImmuneAttrType

    def GetImmuneAttrFlag(self):
        return self.m_ImmuneAttrFlag

    def GetDestineCurveID(self):
        return self.m_DoHitAction.m_DestineCurveID

    def GetHitType(self):
        return self.m_DoHitAction.m_HitType

    def GetHitActionManager(self):
        return self.m_HitActionManager

    @Profiler
    def ExecuteLoop(self):
        self.m_DoHitAction.UpdateActionTime()
        super().ExecuteLoop()

    def GetCorrectPos(self, oNewPos):
        return oNewPos

    def CouldMove(self):
        if self.IsForbidMove():
            return False
        else:
            if IsMoveBySystem(self.m_MoveType):
                return False
            if self.m_Scene.GetGameState() not in (BattleCmd_pb2.GAME_STATE_SERVE, BattleCmd_pb2.GAME_STATE_PLAYING):
                return False
            return True

    def OnHitKeyCDDelta(self, iHitKey, iEndFrame):
        oHitKeyCDMsg = BattleCmd_pb2.BattleHitKeyCDMsg()
        oHitKeyCDMsg.CDData.HitKey = iHitKey
        oHitKeyCDMsg.CDData.EndFrame = iEndFrame
        self.AddPersonalDelta(BattleCmd_pb2.BATTLE_HIT_KEY_CD_MSG, oHitKeyCDMsg)

    def OnMoveTypeDelta(self):
        oMoveTypeMsg = BattleCmd_pb2.BattleMoveTypeMsg()
        oMoveTypeMsg.MoveType = self.m_MoveType
        self.UpdateDelta(BattleCmd_pb2.BATTLE_MOVE_TYPE_MSG, oMoveTypeMsg)

    def OnFacingDelta(self):
        oMsg = BattleCmd_pb2.BattleFacingMsg()
        oMsg.Facing = self.m_Facing.PackVec3()
        self.UpdateDelta(BattleCmd_pb2.BATTLE_FACING_MSG, oMsg)

    def OnPropDelta(self, iPropType, iValue):
        oMsg = BattleCmd_pb2.BattlePropChangeMsg()
        oMsg.PropType = iPropType
        oMsg.Value = iValue
        self.AddDelta(BattleCmd_pb2.BATTLE_PROP_CHANGE_MSG, oMsg)

    def StartMove(self, oMoveDir):
        self.SetMoveType(BattleCmd_pb2.MOVE_TYPE_MOVE)
        self.SetFacing(oMoveDir)

    def CouldStop(self):
        if self.m_DoHitAction.m_CouldInterrupt:
            return True
        else:
            if self.m_MoveType == BattleCmd_pb2.MOVE_TYPE_STAND:
                return False
            if self.IsForbidMove():
                if IsMoveBySystem(self.m_MoveType):
                    return False
            return True

    def StopMove(self):
        if not self.CouldStop():
            return
        self.Stop()

    def DoStand(self):
        self.m_MoveDir = CDVec3.Zero()
        self.StopMove()

    def Stop(self):
        if not self.CouldStop():
            return
        self.DoStop()

    def ClearPath(self):
        self.m_Scene.m_Phys.SetWalkTo(self.m_ID, 0, 0)

    def InitFacing(self):
        self.SetFacing(GetInitFacing(self.GetMemberType()))

    def InitPhys(self):
        dExtern = self.GetBounds()["extern"]
        self.m_Scene.m_Phys.CreateCapsuleController(self.m_ID, dExtern["Y"], dExtern["X"], self.GetCollisionType())

    def InitAfterEnterScene(self):
        super().InitAfterEnterScene()
        self.InitPhys()
        self.InitFacing()

    def CouldUseAction(self, iActionSID):
        oActionData = GetHitActionData(iActionSID)
        if self.m_BehaviorManager.HasBehavior(BattleCmd_pb2.BEHAVIOR_TYPE_ONLY_INSIDE_HIT):
            if oActionData.m_HitActionType != BattleCmd_pb2.HIT_ACTION_TYPE_INSIDE:
                return False
        if oActionData.m_HitActionType:
            iFlag = GetForbidActionFlag(oActionData.m_HitActionType)
            if self.m_BehaviorManager.HasBehavior(iFlag):
                return False
        return True

    def SetPreJudgeFrame(self, iPreJudgeFrame):
        self.m_PreJudgeFrame = iPreJudgeFrame

    def SetActionTime(self, iActionID):
        iCurFrame = self.m_Scene.GetCurFrame()
        oActionData = GetHitActionData(iActionID)
        self.OnHitStateDelta()

    def SetActionCD(self, iActionID):
        if not iActionID:
            return
        else:
            if self.m_TestIsNoCD:
                return
            oActionData = GetHitActionData(iActionID)
            iCDFrame = oActionData.GetHitCD(self, self.m_DoHitAction.m_HitAction)
            if iCDFrame <= 0:
                return
        iEndFrame = iCDFrame + self.m_Scene.GetCurEffectiveFrame()
        self.m_ActionCDManager.ReplaceCD(self.m_DoHitAction.m_HitKey, iEndFrame)
        self.OnHitKeyCDDelta(self.m_DoHitAction.m_HitKey, iEndFrame)

    def IsDoingAction(self):
        return self.m_DoHitAction.IsDoingAction()

    def IsForbidMove(self):
        if self.m_BehaviorManager.HasBehavior(BattleCmd_pb2.BEHAVIOR_TYPE_FORBIT_MOVE):
            return True
        else:
            if not self.m_DoHitAction.m_HitAction:
                return False
            oActionData = GetHitActionData(self.m_DoHitAction.m_HitAction.m_ID)
            if oActionData.m_CouldMoveCast:
                return False
            iForbidMoveTime = oActionData.m_BeforeActionTime + oActionData.m_ActionTime + oActionData.m_AfterMoveTime
            return iForbidMoveTime > self.m_DoHitAction.m_HitData.m_PassFrame

    def HandleJoystickDir(self, x, y, z):
        if self.m_BehaviorManager.HasBehavior(BattleCmd_pb2.BEHAVIOR_TYPE_INVERSE_JOYSTICK):
            x, z = -x, -z
        else:
            oDir = AdjustDirByMemberType(CDVec3(x, y, z), self.GetMemberType())
            if not hasattr(self, "m_SmoothMgr"):
                self.m_SmoothMgr = CSmoothPosMgr(self)
            self.m_SmoothMgr.SetClinetMoveDir(oDir)
            if oDir != self.m_MoveDir:
                self.SetMoveDir(oDir)
        self.OnHandleMove()

    def OnHandleMove(self):
        if not self.CouldMove():
            return
        else:
            oDir = self.m_MoveDir
            if not oDir.IsZero():
                self.StartMove(oDir)
            else:
                self.StopMove()

    def OnHitStateDelta(self):
        return

    def CouldDoAction(self, iHitActionID=0):
        return self.m_DoHitAction.CouldDoAction(iHitActionID)

    def GetHitRangeTolerance(self):
        if IsServer():
            if self.m_BOTAgent is None:
                return SERVER_HIT_RANGE_TOLERANCE
        return 0

    def IsInStarMarkRange(self):
        oBadminton = self.m_Scene.GetFirstBadminton()
        oStarMarkPos = oBadminton.GetStarMarkPos()
        iHitRangeTolerance = self.GetHitRangeTolerance()
        oPos = oBadminton.GetPreJudgePos(self.m_PreJudgeFrame)
        if not oStarMarkPos.IsZero() and oPos.m_Y + iHitRangeTolerance > BADMINTON_STARMARK_HEIGHT:
            fStarMarkRadius = self.GetPropValue(Common_pb2.BATTLE_PROP_TYPE_STAR_MARK_RADIUS) + iHitRangeTolerance
            return IsInHorizontalRange(self.GetPos(), oStarMarkPos, fStarMarkRadius)
        else:
            return False

    def IsInHitRange(self):
        oBadminton = self.m_Scene.GetFirstBadminton()
        fAngle = oBadminton.GetObjectToMeAngle(self)
        iPropType = GetRangeDirPropType(fAngle, RANGE_HIT)
        if iPropType is None:
            return False
        else:
            fHitRadius = self.GetPropValue(iPropType)
            fDis = self.GetPos().HorizontalDistance(oBadminton.GetPos())
            if fDis < fHitRadius:
                return True
            return False

    def IsInStrideRange(self):
        oBadminton = self.m_Scene.GetFirstBadminton()
        fAngle = oBadminton.GetObjectToMeAngle(self)
        iHitPropType = GetRangeDirPropType(fAngle, RANGE_HIT)
        iStridePropType = GetRangeDirPropType(fAngle, RANGE_STRIDE)
        if iHitPropType is None or iStridePropType is None:
            return False
        else:
            fHitRadius = self.GetPropValue(iHitPropType)
            fStrideRadius = self.GetPropValue(iStridePropType)
            fDis = self.GetPos().HorizontalDistance(oBadminton.GetPos())
            if fHitRadius <= fDis:
                if fDis < fStrideRadius:
                    return True
            return False

    def IsInRetrieveRange(self):
        oBadminton = self.m_Scene.GetFirstBadminton()
        fAngle = oBadminton.GetObjectToMeAngle(self)
        iStridePropType = GetRangeDirPropType(fAngle, RANGE_STRIDE)
        iRetrievePropType = GetRangeDirPropType(fAngle, RANGE_RETRIEVE)
        if iStridePropType is None or iRetrievePropType is None:
            return False
        else:
            fStrideRadius = self.GetPropValue(iStridePropType)
            fRetrieveRadius = self.GetPropValue(iRetrievePropType)
            fDis = self.GetPos().HorizontalDistance(oBadminton.GetPos())
            if fStrideRadius <= fDis:
                if fDis < fRetrieveRadius:
                    return True
            return False

    def Hit(self, oDir, iHitKey, iHitActionID=0, oMoveScale=None, oClinetPlayerPos=None, oClientBadmintonPos=None):
        if self.m_ActionCDManager.IsInCD(iHitKey, self.m_Scene.GetCurEffectiveFrame()):
            return
        self.m_DoHitAction.Hit(oDir, iHitKey, iHitActionID, oMoveScale, oClinetPlayerPos, oClientBadmintonPos)

    def HitAndDestineCurve(self, oHitDir, iHitKey, iDestineCurveID):
        if self.m_ActionCDManager.IsInCD(iHitKey, self.m_Scene.GetCurEffectiveFrame()):
            return
        self.m_DoHitAction.HitAndDestineCurve(oHitDir, iHitKey, iDestineCurveID)

    def HitAndDestineAction(self, oHitDir, iHitKey, iDestineActionSID):
        if self.m_ActionCDManager.IsInCD(iHitKey, self.m_Scene.GetCurEffectiveFrame()):
            return
        self.m_DoHitAction.HitAndDestineAction(oHitDir, iHitKey, iDestineActionSID)

    def GetFixStartPos(self, oHitAction):
        return self.m_DoHitAction.GetFixStartPos(oHitAction)

    def GetPreJudgePos(self, iPreJudgeFrame):
        if iPreJudgeFrame == 0:
            return self.m_Pos
        else:
            x, y, z = self.m_Scene.m_Phys.GetPrejudgePosition(self.m_ID, Frame2Sec(iPreJudgeFrame))
            return CDVec3(x, y, z)

    def GetPreJudgeFixStartPos(self, iPreJudgeFrame):
        oBadminton = self.m_Scene.GetFirstBadminton()
        return oBadminton.GetPreJudgePos(iPreJudgeFrame)

    def OnSetUpAction(self, oHitAction):
        return

    def TryGetAction(self, iActionID):
        oHitAction = self.m_HitActionManager.GetAction(iActionID)
        if not oHitAction:
            oHitAction = self.m_HitActionManager.CreateAction(iActionID, 0, 0)
        return oHitAction

    def DirectDoAction(self, iActionID):
        self.m_DoHitAction.DirectDoAction(iActionID)

    def CouldHitBadminton(self):
        return self.m_DoHitAction.CouldHitBadminton()

    def DoAutoHitBadminton(self):
        self.m_DoHitAction.DoAutoHitBadminton()

    def DoHitBadminton(self):
        self.m_DoHitAction.DoHitBadminton()

    def WalkTo(self, fX, fZ):
        if not self.CouldMove():
            return
        self.SetMoveType(BattleCmd_pb2.MOVE_TYPE_MOVE)
        self.SetFacing(CDVec3(fX, 0, fZ) - self.m_Pos)
        self.m_Scene.m_Phys.SetWalkTo(self.m_ID, fX, fZ)
        self.OnWalkToDelta(fX, fZ)

    @ServerOnly
    def OnWalkToDelta(self, fX, fZ):
        oMsg = BattleCmd_pb2.BattleWalkToMsg()
        oMsg.WalkTo = CDVec3(fX, 0, fZ).PackVec3()
        self.UpdateDelta(BattleCmd_pb2.BATTLE_WALK_TO_MSG, oMsg)

    def WinkMove(self, fOffsetX, fOffsetZ, iMoveFrame):
        fOffsetX = int(fOffsetX)
        fOffsetZ = int(fOffsetZ)
        self.SetMoveType(BattleCmd_pb2.MOVE_TYPE_WINK_MOVE)
        self.m_Scene.m_Phys.SetWinkMove(self.m_ID, fOffsetX, fOffsetZ, iMoveFrame)
        self.OnWinkMoveDelta(fOffsetX, fOffsetZ, iMoveFrame)

    @ServerOnly
    def OnWinkMoveDelta(self, fOffsetX, fOffsetZ, iMoveFrame):
        oMsg = BattleCmd_pb2.BattleWinkMoveMsg()
        oMsg.X = fOffsetX
        oMsg.Z = fOffsetZ
        oMsg.DurationFrame = iMoveFrame
        self.UpdateDelta(BattleCmd_pb2.BATTLE_WINK_MOVE_MSG, oMsg)

    def SetCurBOTConfID(self, iBTConfID):
        self.m_CurBOTConfID = iBTConfID

    def AttachBT(self, iBTConfID):
        if iBTConfID == 0:
            return
        else:
            if self.m_BOTAgent is not None:
                return
            self.m_BOTAgent = CreateBOTAgent(iBTConfID, self.m_Scene.GetAIManager())
            if self.m_BOTAgent is None:
                LogError("dynamic attach bot failed", self.m_ID, iBTConfID)
                return
        LogFile("battlelogic", "attachbt|%d|%d|%d" % (
         self.m_Scene.m_ID,
         self.m_ID,
         iBTConfID))
        oBTConfData = GetBTConfData(iBTConfID)
        for iStateSID in oBTConfData.m_BOTStateLst:
            oAddStateArgs = CAddStateArgs(iStateSID)
            self.DoAddState(oAddStateArgs)

        self.m_BOTAgent.SetControler(self)
        self.SetCurBOTConfID(iBTConfID)
        self.m_Scene.AddAIContextID(self.m_BOTAgent.m_ContextID)

    def RecInitPosIndex(self, iPosIndex):
        self.m_InitPosIndex = iPosIndex

    def DetachBT(self):
        if self.m_BOTAgent is None:
            return
        LogFile("battlelogic", "detachbt|%d|%d|%d" % (
         self.m_Scene.m_ID,
         self.m_ID,
         self.m_CurBOTConfID))
        oBTConfData = GetBTConfData(self.m_CurBOTConfID)
        for iStateSID in oBTConfData.m_BOTStateLst:
            self.DoRemoveState(iStateSID)

        self.OnBattleEvent(BattleCmd_pb2.BATTLE_EVENT_TYPE_CHANGE_BOTCONFID, {})
        self.m_Scene.DelAIContextID(self.m_BOTAgent.m_ContextID)
        self.m_BOTAgent.Release()
        self.m_BOTAgent = None
        self.SetCurBOTConfID(0)

    def HasBT(self):
        return self.m_BOTAgent != None

    def GetAIContextID(self):
        if self.m_BOTAgent is None:
            return 0
        else:
            return self.m_BOTAgent.m_ContextID

    def RandomBetween(self, param1, param2):
        if param1 > param2:
            param1, param2 = param2, param1
        return self.m_Random.Random(param2 - param1) + param1

    def RandomFloatBetween(self, param1, param2):
        return self.RandomBetween(int(param1 * 1000), int(param2 * 1000)) / 1000

    def ChooseKey(self, dRatio, iTotal=0):
        return self.m_Random.ChooseKey(dRatio, iTotal)

    @LocalPredictionHeroOnly
    def OnCounterDelta(self, iCounterType, iCounterValue, bIsServeState=False):
        oMsg = BattleCmd_pb2.BattleUpdateCounterMsg()
        oMsg.CounterType = iCounterType
        oMsg.Value = int(iCounterValue)
        oMsg.IsServeState = bIsServeState
        self.AddPersonalSpectatorsDelta(BattleCmd_pb2.BATTLE_UPDATE_COUNTER_MSG, oMsg)

    def GetHitPassFrame(self):
        return self.m_DoHitAction.GetHitPassFrame()

    def GetCounterValue(self, iCounterType):
        return self.m_CounterManager.GetCounter(iCounterType)

    def SetCounterValue(self, iCounterType, iCurValue):
        if iCounterType == BattleCmd_pb2.COUNTER_TYPE_CONTINUOUS and self.m_Scene.m_TestShareContinuous:
            for oPlayer in self.m_Scene.GetAllPlayer():
                if oPlayer.GetMemberType() == self.GetMemberType():
                    oPlayer.m_CounterManager.SetCounter(iCounterType, iCurValue)

        else:
            self.m_CounterManager.SetCounter(iCounterType, iCurValue)

    def PureSetCounterValue(self, iCounterType, iCurValue, bServeSet):
        if iCounterType == BattleCmd_pb2.COUNTER_TYPE_CONTINUOUS and self.m_Scene.m_TestShareContinuous:
            for oPlayer in self.m_Scene.GetAllPlayer():
                if oPlayer.GetMemberType() == self.GetMemberType():
                    oPlayer.m_CounterManager.PureSetCounter(iCounterType, iCurValue, bServeSet)

        else:
            self.m_CounterManager.PureSetCounter(iCounterType, iCurValue, bServeSet)

    def OnScore(self):
        self.m_CounterManager.OnScore()

    def OnAfterServe(self):
        return

    def AddBehavior(self, iBehaviorType, sSrcKey):
        self.m_BehaviorManager.AddBehavior(iBehaviorType, sSrcKey)

    def RemoveBehavior(self, iBehaviorType, sSrcKey):
        self.m_BehaviorManager.RemoveBehavior(iBehaviorType, sSrcKey)

    def HasBehavior(self, iBehaviorType):
        return self.m_BehaviorManager.HasBehavior(iBehaviorType)

    def GetDistanceFromBadminton(self, bWithPreJudge=False):
        oBadminton = self.m_Scene.GetFirstBadminton()
        if bWithPreJudge and self.m_PreJudgeFrame:
            oBadmintonPos = oBadminton.GetPreJudgePos(self.m_PreJudgeFrame)
            oSelfPos = self.GetPreJudgePos(self.m_PreJudgeFrame)
        else:
            oBadmintonPos = oBadminton.GetPos()
            oSelfPos = self.GetPos()
        dDistance = {'Horizontal':oSelfPos.HorizontalDistance(oBadmintonPos),  'Vertical':abs(oSelfPos.m_Y - oBadmintonPos.m_Y)}
        return dDistance

    def GetMoveDirAngleToBADDroppos(self):
        oBadminton = self.m_Scene.GetFirstBadminton()
        oBadmintonOwner = oBadminton.GetOwner()
        if oBadmintonOwner and oBadmintonOwner.GetMemberType() != self.GetMemberType() and not oBadminton.GetDropPos().IsZero():
            oDropPosAngle = oBadminton.GetDropPos() - self.GetPos()
        else:
            oDropPosAngle = CDVec3.Zero()
        oMoveDir = self.m_MoveDir
        fToDropPosAngle = CDVec3.Angle(oDropPosAngle, oMoveDir)
        return fToDropPosAngle

    def GetOffsetPos(self, iOffsetX, iOffsetY, iOffsetZ):
        if self.m_PreJudgeFrame:
            oPos = self.GetPreJudgePos(self.m_PreJudgeFrame)
        else:
            oPos = self.m_Pos
        if self.GetMemberType() == Common_pb2.TEAM_MEMBER_TYPE_GUEST:
            iOffsetX = -iOffsetX
            iOffsetZ = -iOffsetZ
        return CDVec3(oPos.m_X + iOffsetX, oPos.m_Y + iOffsetY, oPos.m_Z + iOffsetZ)

    def DoResetBadmintonPos(self, iOffsetX, iOffsetY, iOffsetZ):
        oScene = self.m_Scene
        oBadminton = oScene.GetFirstBadminton()
        oNewPos = self.GetOffsetPos(iOffsetX, iOffsetY, iOffsetZ)
        oBadminton.SetPos(oNewPos)

    def GetCurMVPScore(self):
        return self.m_Scene.m_MVPScore.CalcPlayerMVPScore(self.m_ID)

    def GetQuarterMVPScore(self):
        oScene = self.GetScene()
        return oScene.m_MVPScore.CalcCurQuarterPlayerMVPScore(self.m_ID, oScene.GetQuarterIndex())

    def ClearAllCD(self):
        iCurEffectiveFrame = self.m_Scene.GetCurEffectiveFrame()
        allValidCDLst = self.m_ActionCDManager.GetAllValidCD(iCurEffectiveFrame)
        if not allValidCDLst:
            return
        for tCDData in allValidCDLst:
            self.OnHitKeyCDDelta(tCDData[0], 0)

        self.m_ActionCDManager.ClearAllCD()

    def OnEnterQuarterRest(self):
        self.m_CounterManager.ClearAllCounter()
        self.ClearAllCD()
        super().OnEnterQuarterRest()

    def OnLeaveQuarterRest(self):
        super().OnLeaveQuarterRest()

    def DoRelease(self):
        self.m_PropContainer.DoRelease()
        self.m_HitActionManager.DoRelease()
        self.m_CounterManager.DoRelease()
        self.m_BehaviorManager.DoRelease()
        self.m_RuneManager.DoRelease()
        self.m_DoHitAction.DoRelease()
        if hasattr(self, "m_SmoothMgr"):
            self.m_SmoothMgr.DoRelease()
        self.DetachBT()
        self.m_Scene.m_Phys.DestroyController(self.m_ID)
        super().DoRelease()

    def CheckForbitHitKey(self, iHitKey):
        if iHitKey == BattleCmd_pb2.HIT_KEY_KEY_P:
            if self.m_BehaviorManager.HasBehavior(BattleCmd_pb2.BEHAVIOR_TYPE_FORBIT_HIT_P):
                return True
        elif iHitKey == BattleCmd_pb2.HIT_KEY_KEY_D:
            if self.m_BehaviorManager.HasBehavior(BattleCmd_pb2.BEHAVIOR_TYPE_FORBIT_HIT_D):
                return True
        else:
            if iHitKey == BattleCmd_pb2.HIT_KEY_KEY_GY:
                if self.m_BehaviorManager.HasBehavior(BattleCmd_pb2.BEHAVIOR_TYPE_FORBIT_HIT_GY):
                    return True
            return False

    def IsInHitKeyCD(self, iHitKey):
        if self.m_ActionCDManager.IsInCD(iHitKey, self.m_Scene.GetCurEffectiveFrame()):
            return True
        else:
            return False

    def JudgeHorizontalDisFromTeammates(self, iDistance):
        if not self.m_Scene:
            return False
        else:
            teammateLst = self.m_Scene.GetAllTeammate(self.m_ID, self.GetMemberType())
            if not teammateLst:
                return False
            oSelfPos = self.GetPos()
            for oTeammate in teammateLst:
                iDis = oSelfPos.HorizontalDistance(oTeammate.GetPos())
                if iDis < iDistance:
                    return True

            return False

    def IsServing(self):
        oDoHitAciont = self.m_DoHitAction
        if not oDoHitAciont.m_HitAction:
            return False
        if not oDoHitAciont.m_HitType:
            return False
        else:
            oActionData = GetHitActionData(oDoHitAciont.m_HitAction.m_ID)
            if oActionData.m_HasCurve:
                if oDoHitAciont.m_HitType & BattleCmd_pb2.HIT_TYPE_SERVE:
                    return True
            return False

    def JudgeLeftRightArea(self, iArea):
        oPos = self.GetPos()
        if oPos.m_Z == 0:
            return False
        else:
            iLRArea = None
            if oPos.m_X * oPos.m_Z > 0:
                iLRArea = Common_pb2.PLAYERGROUND_LRAREA_LEFT
            if oPos.m_X * oPos.m_Z <= 0:
                iLRArea = Common_pb2.PLAYERGROUND_LRAREA_RIGHT
            if iLRArea != iArea:
                return False
            return True

    def SetTestNoCD(self):
        if self.m_TestIsNoCD:
            self.m_TestIsNoCD = False
        else:
            self.m_TestIsNoCD = True
            self.m_ActionCDManager.ClearAllCD()

    def SetRuneData(self, oRuneData):
        self.m_RuneManager.SetRuneData(oRuneData)

    def FormatPlayerRuneData(self, oData):
        self.m_RuneManager.FormatRuneData(oData)

    def GetRuneProperty(self):
        return self.m_RuneManager.GetRuneProperty()

    def GetRuneTableID(self):
        return self.m_RuneManager.GetRuneTableID()

    def SetCountersRecord(self, iCounterType):
        self.m_CounterManager.SetCountersRecord(iCounterType)

    def DoStop(self):
        self.SetMoveType(BattleCmd_pb2.MOVE_TYPE_STAND)
        self.InitFacing()
        self.ClearPath()

    def GetHitData(self):
        return self.m_DoHitAction.m_HitData
