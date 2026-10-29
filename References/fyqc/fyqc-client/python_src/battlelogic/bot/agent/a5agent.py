# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\bot\agent\a5agent.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 24316 bytes
import typing, enum
from pubbehaviorc import agent
from battlelogic.bot.defines import BT_FAILURE, BT_SUCCESS, BT_RUNNING
from base.protobufdata import BattleCmd_pb2, SkillCmd_pb2
from base.data import GetCourtData
from battlelogic.battlebase.dvec3 import CDVec3
from base.protobufdata import Common_pb2
from battlelogic.common.debug import LogError
from battlelogic.common.logicutil import ConvertDirTypeToHitDir
from base.data.statename import _CSTATENAME as CSTATENAME
from base.data.skillname import _CSKILLNAME as CSKILLNAME
from base.data.hitactionname import _CHITACTIONNAME as CHITACTIONNAME
from battlelogic.config.courtconfig import GetAreaType
from battlelogic.bot.agent.common import GetMoveTargetPosOfDrop, GetMoveTargetPosOfDefense, GetClosestPropertyBox
from battlelogic.bot.agent.common import GetOutTypeOfCloestEnemyMonster, WalkToWithDetour, IsAvoidMonster
from battlelogic.common.defines import HITACTION_PREJUDGE_FRAME
from battlelogic.plugins.state import CAddStateArgs
from battlelogic.plugins.hitaction.hitactionvalue import GetRetrieveRangeDirValue, GetStrideRangeDirValue, GetHitRangeDirValue
from battlelogic.common.defines import BADMINTON_STARMARK_HEIGHT
status = typing.TypeVar("status")

class CHITKEY(enum.Enum):
    HIT_KEY_P = (
     "近球", BattleCmd_pb2.HIT_KEY_KEY_P)
    HIT_KEY_D = ("远球", BattleCmd_pb2.HIT_KEY_KEY_D)
    HIT_KEY_KEY_GY = ("高远球", BattleCmd_pb2.HIT_KEY_KEY_GY)
    HIT_KEY_KEY_DJ = ("道具", BattleCmd_pb2.HIT_KEY_KEY_DJ)
    HIT_KEY_KEY_ZD = ("主动", BattleCmd_pb2.HIT_KEY_KEY_ZD)


class CGAMESTATE(enum.Enum):
    GAME_STATE_PLAYING = (
     "游戏中", BattleCmd_pb2.GAME_STATE_PLAYING)
    GAME_STATE_REPLAY = ("回放中", BattleCmd_pb2.GAME_STATE_REPLAY)
    GAME_STATE_SERVE = ("发球", BattleCmd_pb2.GAME_STATE_SERVE)


class CHITOUTTYPE(enum.Enum):
    HIT_OUT_TYPE_NONE = (
     "中间", BattleCmd_pb2.BADMINTON_OUT_DIR_NONE)
    HIT_OUT_TYPE_LEFT = ("左边", BattleCmd_pb2.BADMINTON_OUT_DIR_LEFT)
    HIT_OUT_TYPE_RIGHT = ("右边", BattleCmd_pb2.BADMINTON_OUT_DIR_RIGHT)


class CHITACTIONTYPE(enum.Enum):
    HIT_ACTION_TYPE_INSIDE = (
     "内圈击球动作", BattleCmd_pb2.HIT_ACTION_TYPE_INSIDE)
    HIT_ACTION_TYPE_MIDDLE = ("中圈击球动作", BattleCmd_pb2.HIT_ACTION_TYPE_MIDDLE)
    HIT_ACTION_TYPE_OUTSIDE = ("外圈击球动作", BattleCmd_pb2.HIT_ACTION_TYPE_OUTSIDE)
    HIT_ACTION_TYPE_SKILL = ("技能动作", BattleCmd_pb2.HIT_ACTION_TYPE_SKILL)
    HIT_ACTION_TYPE_OTHER = ("其它动作", BattleCmd_pb2.HIT_ACTION_TYPE_OTHER)


class CAREATYPE(enum.Enum):
    AREA_TYPE_LEFT = (
     "左边", BattleCmd_pb2.AREA_TYPE_LEFT)
    AREA_TYPE_RIGHT = ("右边", BattleCmd_pb2.AREA_TYPE_RIGHT)


class CCURVESHAPETYPE(enum.Enum):
    SHAPE_TYPE_NORMAL = (
     "常规球路", BattleCmd_pb2.SHAPE_TYPE_NORMAL)
    SHAPE_TYPE_DOWN = ("下压型球路", BattleCmd_pb2.SHAPE_TYPE_DOWN)
    SHAPE_TYPE_TURN_AROUND = ("落点不变拐弯球路", BattleCmd_pb2.SHAPE_TYPE_TURN_AROUND)
    SHAPE_TYPE_PARABOLA_DOWN = ("抛物线下压球路", BattleCmd_pb2.SHAPE_TYPE_PARABOLA_DOWN)
    SHAPE_TYPE_FALLING = ("直线下坠球路", BattleCmd_pb2.SHAPE_TYPE_FALLING)


class STATETYPE(enum.Enum):
    STATE_TYPE_BUFF = (
     "增益", BattleCmd_pb2.STATE_TYPE_BUFF)
    STATE_TYPE_DEBUFF = ("减益", BattleCmd_pb2.STATE_TYPE_DEBUFF)
    STATE_TYPE_NEUTRAL = ("中性", BattleCmd_pb2.STATE_TYPE_NEUTRAL)


class SKILLSCHOOLTYPE(enum.Enum):
    SKILL_SCHOOL_TYPE_ATK = (
     "进攻型", SkillCmd_pb2.SKILL_SCHOOL_TYPE_ATK)
    SKILL_SCHOOL_TYPE_DEF = ("防御型", SkillCmd_pb2.SKILL_SCHOOL_TYPE_DEF)
    SKILL_SCHOOL_TYPE_AGILE = ("敏捷型", SkillCmd_pb2.SKILL_SCHOOL_TYPE_AGILE)
    SKILL_SCHOOL_TYPE_STRANGE_TRICK = ("奇招型", SkillCmd_pb2.SKILL_SCHOOL_TYPE_STRANGE_TRICK)
    SKILL_SCHOOL_TYPE_OTHER = ("其他", SkillCmd_pb2.SKILL_SCHOOL_TYPE_OTHER)


class SKILLTYPE(enum.Enum):
    SKILL_TYPE_ULTIMATE = (
     "大招", SkillCmd_pb2.SKILL_TYPE_ULTIMATE)
    SKILL_TYPE_GENERAL = ("小招", SkillCmd_pb2.SKILL_TYPE_GENERAL)


class CAgent(agent.CAgent):
    m_EventKey = {}

    def __init__(self):
        super().__init__()
        self.m_Controler = None
        self.m_CurMoveTargetIndex = 0

    def GetControler(self):
        if self.m_Controler:
            return self.m_Controler()

    def SetControler(self, oCombatObjectDynamic):
        import weakref
        self.m_Controler = weakref.ref(oCombatObjectDynamic)

    def GetCurMoveTargetIndex(self):
        return self.m_CurMoveTargetIndex

    def SetCurMoveTargetIndex(self, iIndex):
        self.m_CurMoveTargetIndex = iIndex

    @staticmethod
    def CouldHit(oAgent) -> bool:
        oControler = oAgent.GetControler()
        if oControler is None:
            return False
        else:
            if not oControler.CouldHitBadminton():
                return False
            return True

    @staticmethod
    def MoveToDropPos(iOffsetX: int, iOffsetZ: int, oAgent) -> status:
        oControler = oAgent.GetControler()
        if oControler is None:
            return BT_FAILURE
        oScene = oControler.GetScene()
        if not oScene.CouldCatchServe(oControler.m_ID):
            return BT_SUCCESS
        else:
            oTargetPos = GetMoveTargetPosOfDrop(oControler, iOffsetX, iOffsetZ)
            if oTargetPos.IsZero():
                return BT_SUCCESS
            WalkToWithDetour(oControler, oTargetPos)
            return BT_FAILURE

    @staticmethod
    def IsDefense(oAgent) -> bool:
        oControler = oAgent.GetControler()
        if oControler is None:
            return False
        oScene = oControler.GetScene()
        oBadminton = oScene.GetFirstBadminton()
        oOwner = oBadminton.GetOwner()
        if not oOwner:
            return False
        else:
            if oOwner.GetMemberType() == oControler.GetMemberType():
                return False
            return True

    @staticmethod
    def IsAttacker(oAgent) -> bool:
        oControler = oAgent.GetControler()
        if oControler is None:
            return False
        oScene = oControler.GetScene()
        oBadminton = oScene.GetFirstBadminton()
        oOwner = oBadminton.GetOwner()
        if not oOwner:
            return False
        else:
            if oOwner.GetMemberType() != oControler.GetMemberType():
                return False
            return True

    @staticmethod
    def Hit(iHitKey: CHITKEY, iOutType: CHITOUTTYPE, oAgent) -> status:
        oControler = oAgent.GetControler()
        if oControler is None:
            return BT_FAILURE
        else:
            oHitDir = ConvertDirTypeToHitDir(iOutType, oControler.GetMemberType())
            oScene = oControler.GetScene()
            if getattr(oScene, "m_AIHitKey", 0):
                iHitKey = oScene.m_AIHitKey
            iResetOutType = GetOutTypeOfCloestEnemyMonster(oControler, oScene)
            if iResetOutType != BattleCmd_pb2.BADMINTON_OUT_DIR_NONE:
                oHitDir = ConvertDirTypeToHitDir(iResetOutType, oControler.GetMemberType())
            oControler.Hit(oHitDir, iHitKey)
            return BT_SUCCESS

    @staticmethod
    def IsServePlayer(oAgent) -> bool:
        oControler = oAgent.GetControler()
        if oControler is None:
            return False
        else:
            oScene = oControler.GetScene()
            if oScene.IsServePlayer(oControler.ID()):
                return True
            return False

    @staticmethod
    def MoveToDefensePos(iOffsetX: int, iOffsetZ: int, oAgent) -> status:
        oControler = oAgent.GetControler()
        if oControler is None:
            return BT_FAILURE
        else:
            oTargetPos = GetMoveTargetPosOfDefense(oControler, iOffsetX, iOffsetZ)
            if oTargetPos.IsZero():
                return BT_SUCCESS
            WalkToWithDetour(oControler, oTargetPos)
            return BT_FAILURE

    @staticmethod
    def StopMove(oAgent) -> status:
        oControler = oAgent.GetControler()
        if oControler is None:
            return BT_FAILURE
        else:
            oControler.DoStand()
            return BT_SUCCESS

    @staticmethod
    def IsGameState(iGameState: CGAMESTATE, oAgent) -> bool:
        oControler = oAgent.GetControler()
        if oControler is None:
            return False
        else:
            oScene = oControler.GetScene()
            return oScene.IsGameState(iGameState)

    @staticmethod
    def Random(iDownLimit: int, iUpLimit: int, oAgent) -> int:
        oControler = oAgent.GetControler()
        if oControler is None:
            return 0
        else:
            return oControler.RandomBetween(iDownLimit, iUpLimit)

    @staticmethod
    def HitAndDestineCurve(iHitKey, iDestineCurveID, iOutType, oAgent):
        oControler = oAgent.GetControler()
        if oControler is None:
            return BT_FAILURE
        else:
            oHitDir = ConvertDirTypeToHitDir(iOutType, oControler.GetMemberType())
            oControler.HitAndDestineCurve(oHitDir, iHitKey, iDestineCurveID)
            return BT_SUCCESS

    @staticmethod
    def HitAndDestineAction(iHitKey, iDestineActionSID, iOutType, oAgent):
        oControler = oAgent.GetControler()
        if oControler is None:
            return BT_FAILURE
        else:
            oHitDir = ConvertDirTypeToHitDir(iOutType, oControler.GetMemberType())
            oControler.HitAndDestineAction(oHitDir, iHitKey, iDestineActionSID)
            return BT_SUCCESS

    @staticmethod
    def AddState(iStateSID: CSTATENAME, oAgent) -> status:
        oControler = oAgent.GetControler()
        if oControler is None:
            return BT_FAILURE
        else:
            oAddStateArgs = CAddStateArgs(iStateSID)
            oControler.DoAddState(oAddStateArgs)
            return BT_SUCCESS

    @staticmethod
    def RemoveState(iStateSID: CSTATENAME, oAgent) -> status:
        oControler = oAgent.GetControler()
        if oControler is None:
            return BT_FAILURE
        else:
            oControler.DoRemoveState(iStateSID)
            return BT_SUCCESS

    @staticmethod
    def CouldUseHitKey(iHitKey: CHITKEY, oAgent) -> bool:
        oControler = oAgent.GetControler()
        if oControler is None:
            return False
        if not oControler.HasHitKey(iHitKey):
            return False
        else:
            if oControler.IsInHitKeyCD(iHitKey):
                return False
            return True

    @staticmethod
    def CouldUseActionType(iHitActionType: CHITACTIONTYPE, oAgent) -> bool:
        oControler = oAgent.GetControler()
        if oControler is None:
            return False
        else:
            if oControler.CouldUseActionByHitActionType(iHitActionType):
                return True
            return False

    @staticmethod
    def GetNetDistance(oAgent) -> float:
        oControler = oAgent.GetControler()
        if oControler is None:
            return 0
        else:
            return abs(oControler.GetPos().m_Z)

    @staticmethod
    def IsInTheArea(iAreaType: CAREATYPE, oAgent) -> bool:
        oControler = oAgent.GetControler()
        if oControler is None:
            return False
        else:
            iMemberType = oControler.GetMemberType()
            iAreaTypeRes = GetAreaType(iMemberType, oControler.GetPos())
            if iAreaTypeRes == iAreaType:
                return True
            return False

    @staticmethod
    def IsTheCurveShapeType(iShapeType: CCURVESHAPETYPE, oAgent) -> bool:
        oControler = oAgent.GetControler()
        if oControler is None:
            return False
        else:
            oBadminton = oControler.GetScene().GetFirstBadminton()
            if oBadminton.GetCurveShapeType() == iShapeType:
                return True
            return False

    @staticmethod
    def GetDropPosToNetDistance(oAgent) -> float:
        oControler = oAgent.GetControler()
        if oControler is None:
            return 0
        else:
            oBadminton = oControler.GetScene().GetFirstBadminton()
            oDropPos = oBadminton.GetDropPos()
            return abs(oDropPos.m_Z)

    @staticmethod
    def GetMidDistance(oAgent) -> float:
        oControler = oAgent.GetControler()
        if oControler is None:
            return 0
        else:
            return abs(oControler.GetPos().m_X)

    @staticmethod
    def GetBadmintonHigh(oAgent) -> float:
        oControler = oAgent.GetControler()
        if oControler is None:
            return 0
        else:
            oBadminton = oControler.GetScene().GetFirstBadminton()
            oBadmintonPos = oBadminton.GetPreJudgePos(HITACTION_PREJUDGE_FRAME)
            return abs(oBadmintonPos.m_Y)

    @staticmethod
    def GetAttackerToNetDistanc(oAgent) -> float:
        oControler = oAgent.GetControler()
        if oControler is None:
            return 0
        else:
            oBadminton = oControler.GetScene().GetFirstBadminton()
            iAttackerID = oBadminton.GetAttackerID()
            oAttacker = oControler.GetScene().GetPlayer(iAttackerID)
            if oAttacker:
                return abs(oAttacker.GetPos().m_Z)
            return 0

    @staticmethod
    def IsAttackerInTheArea(iAreaType: CAREATYPE, oAgent) -> bool:
        oControler = oAgent.GetControler()
        if oControler is None:
            return False
        else:
            oBadminton = oControler.GetScene().GetFirstBadminton()
            iAttackerID = oBadminton.GetAttackerID()
            oAttacker = oControler.GetScene().GetPlayer(iAttackerID)
            if oAttacker:
                iMemberType = oAttacker.GetMemberType()
                iAreaTypeRes = GetAreaType(iMemberType, oAttacker.GetPos())
                if iAreaTypeRes == iAreaType:
                    return True
            return False

    @staticmethod
    def CouldDoAction(oAgent) -> bool:
        oControler = oAgent.GetControler()
        if oControler is None:
            return False
        else:
            if not oControler.CouldDoAction():
                return False
            return True

    @staticmethod
    def CouldMove(oAgent) -> bool:
        oControler = oAgent.GetControler()
        if oControler is None:
            return False
        else:
            if not oControler.CouldMove():
                return False
            return True

    @staticmethod
    def MoveToTargetPos(iIndex, iNextIndex, iTargetX, iTargetZ, oAgent):
        oControler = oAgent.GetControler()
        if oControler is None:
            return BT_FAILURE
        else:
            iCurMoveTargetIndex = oAgent.GetCurMoveTargetIndex()
            if iCurMoveTargetIndex:
                if iCurMoveTargetIndex != iIndex:
                    return BT_FAILURE
            oTargetPos = CDVec3(iTargetX, 0, iTargetZ)
            oPos = oControler.GetPos()
            if oPos.Overlap(oTargetPos):
                oAgent.SetCurMoveTargetIndex(iNextIndex)
                return BT_FAILURE
            oControler.WalkTo(oTargetPos.m_X, oTargetPos.m_Z)
            return BT_SUCCESS

    @staticmethod
    def FollowClosetPlayer(oAgent) -> status:
        oControler = oAgent.GetControler()
        if oControler is None:
            return BT_FAILURE
        else:
            oScene = oControler.GetScene()
            oPos = oControler.GetPos()
            iClosetPlayerID = oScene.GetClosetPlayer(oControler.m_ID, oPos)
            if iClosetPlayerID:
                oClosetPlayer = oScene.GetPlayer(iClosetPlayerID)
                oClosetPlayerPos = oClosetPlayer.GetPos()
                if oClosetPlayerPos.Overlap(oPos):
                    return BT_SUCCESS
                WalkToWithDetour(oControler, oClosetPlayerPos)
            return BT_FAILURE

    @staticmethod
    def InitCurMoveTargetIndex(iIndex: int, oAgent) -> status:
        oControler = oAgent.GetControler()
        if oControler is None:
            return BT_FAILURE
        else:
            oAgent.SetCurMoveTargetIndex(iIndex)
            return BT_SUCCESS

    @staticmethod
    def IsInPos(iPosX: int, iPosZ: int, oAgent) -> bool:
        oControler = oAgent.GetControler()
        if oControler is None:
            return False
        else:
            oPos = oControler.GetPos()
            if oPos.m_X == iPosX:
                if oPos.m_Z == iPosZ:
                    return True
            return False

    @staticmethod
    def GetCurMoveTargetIdx(oAgent) -> int:
        oControler = oAgent.GetControler()
        if oControler is None:
            return -1
        else:
            iCurMoveTargetIndex = oAgent.GetCurMoveTargetIndex()
            return iCurMoveTargetIndex

    @staticmethod
    def GetHorzDistFromBadminton(oAgent) -> float:
        oControler = oAgent.GetControler()
        if oControler is None:
            return 0
        else:
            dDistance = oControler.GetDistanceFromBadminton(True)
            return dDistance["Horizontal"]

    @staticmethod
    def HasTheState(iStateSID: CSTATENAME, oAgent) -> bool:
        oControler = oAgent.GetControler()
        if oControler is None:
            return False
        else:
            return oControler.HasState(iStateSID)

    @staticmethod
    def HasNotTheState(iStateSID: CSTATENAME, oAgent) -> bool:
        oControler = oAgent.GetControler()
        if oControler is None:
            return False
        else:
            return not oControler.HasState(iStateSID)

    @staticmethod
    def IsDropPosInTheArea(iAreaType: CAREATYPE, oAgent) -> bool:
        oControler = oAgent.GetControler()
        if oControler is None:
            return False
        else:
            oBadminton = oControler.GetScene().GetFirstBadminton()
            oDropPos = oBadminton.GetDropPos()
            iMemberType = oControler.GetMemberType()
            iAreaTypeRes = GetAreaType(iMemberType, oDropPos)
            if iAreaTypeRes == iAreaType:
                return True
            return False

    @staticmethod
    def HasStarMarkArea(oAgent) -> bool:
        oControler = oAgent.GetControler()
        if oControler is None:
            return False
        oScene = oControler.GetScene()
        oBadminton = oScene.GetFirstBadminton()
        oStarMarkPos = oBadminton.GetStarMarkPos()
        oBadmintonPos = oBadminton.GetPos()
        iHitRangeTolerance = oControler.GetHitRangeTolerance()
        if oStarMarkPos.IsZero() or oBadmintonPos.m_Y + iHitRangeTolerance <= BADMINTON_STARMARK_HEIGHT:
            return False
        else:
            iMemberType = oControler.GetMemberType()
            if not oScene.InScoreArea(iMemberType, oStarMarkPos, False):
                return False
            return True

    @staticmethod
    def IsInStarMarkArea(oAgent) -> bool:
        oControler = oAgent.GetControler()
        if oControler is None:
            return False
        else:
            return oControler.IsInStarMarkRange()

    @staticmethod
    def MoveToStarMarkArea(oAgent) -> status:
        oControler = oAgent.GetControler()
        if oControler is None:
            return BT_FAILURE
        oScene = oControler.GetScene()
        oBadminton = oScene.GetFirstBadminton()
        oTargetPos = oBadminton.GetStarMarkPos()
        if oTargetPos.IsZero():
            return BT_FAILURE
        else:
            iMemberType = oControler.GetMemberType()
            if not oScene.InScoreArea(iMemberType, oTargetPos, False):
                return BT_FAILURE
            oControler.WalkTo(oTargetPos.m_X, oTargetPos.m_Z)
            return BT_FAILURE

    @staticmethod
    def IsPropertyPlay(oAgent) -> bool:
        oControler = oAgent.GetControler()
        if oControler is None:
            return False
        else:
            oScene = oControler.GetScene()
            if not oScene.m_PropertyPlay:
                return False
            return True

    @staticmethod
    def HasTeammatePropertyBox(oAgent) -> bool:
        oControler = oAgent.GetControler()
        if oControler is None:
            return False
        oScene = oControler.GetScene()
        if not oScene.m_PropertyPlay:
            return False
        else:
            oPropertyBox, fDistance = GetClosestPropertyBox(oControler, oScene)
            if not oPropertyBox:
                return False
            return True

    @staticmethod
    def MoveToPropertyBox(oAgent) -> status:
        oControler = oAgent.GetControler()
        if oControler is None:
            return BT_FAILURE
        oScene = oControler.GetScene()
        if not oScene.m_PropertyPlay:
            return BT_FAILURE
        else:
            oPropertyBox, fDistance = GetClosestPropertyBox(oControler, oScene)
            oTargetPos = oPropertyBox.GetPos()
            if oTargetPos.IsZero():
                return BT_FAILURE
            WalkToWithDetour(oControler, oTargetPos)
            return BT_FAILURE

    @staticmethod
    def HasSkillSchoolType(iSkillSchoolType: SKILLSCHOOLTYPE, oAgent) -> bool:
        oControler = oAgent.GetControler()
        if oControler is None:
            return False
        else:
            if not oControler.CheckPositiveSkillSchoolType(iSkillSchoolType):
                return False
            return True

    @staticmethod
    def HasSkillType(iSkillType: SKILLTYPE, oAgent) -> bool:
        oControler = oAgent.GetControler()
        if oControler is None:
            return False
        else:
            if not oControler.CheckPositiveSkillType(iSkillType):
                return False
            return True

    @staticmethod
    def HasTheStateType(iStateType: STATETYPE, oAgent) -> bool:
        oControler = oAgent.GetControler()
        if oControler is None:
            return False
        else:
            return oControler.m_StateManager.HasStateType(iStateType)

    @staticmethod
    def IsDropPosInFrontBackLine(oAgent) -> bool:
        oControler = oAgent.GetControler()
        if oControler is None:
            return False
        else:
            oScene = oControler.GetScene()
            oBadminton = oScene.GetFirstBadminton()
            oDropPos = oBadminton.GetDropPos()
            return abs(oDropPos.m_Z) <= oScene.GetFrontBackLine()
