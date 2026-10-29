# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\plugins\dohitaction\dohitaction.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 30199 bytes
from battlelogic.plugins.hitaction.hitdata import CHitData
from base.protobufdata import BattleCmd_pb2, Common_pb2
from battlelogic.battlebase.dvec3 import CDVec3, PackFloatVec3
from battlelogic.plugins.hitaction.hitactionvalue import BadmintonHeight, BadmintonDistance, BadmintonAngle, GetNetDistance
from base.data import GetHitActionData
from battlelogic.common.defines import Time2Frame, Frame2Sec
from battlelogic.common.defines import IsPlayerObjectID, GetRangeDir
from battlelogic.common.defines import HITACTION_PREJUDGE_FRAME, CURVE_PREJUDGE_FRAME, CURVE_DEFAULT_ID, SERVER_HIT_RANGE_TOLERANCE, SERVER_HIT_RECALC_LIMIT
from battlelogic.common.defines import RANGE_HIT, RANGE_STRIDE, RANGE_RETRIEVE, INT_MAX
from battlelogic.common.defines import HIT_HAND_TYPE_FORE, HIT_HAND_TYPE_BACK, SWING_SHOT_HIT_ACTION_ID, STAR_MARK_HIT_ACTION_ID
from battlelogic.common.decorator import NoRerun, NoPrediction
from battlelogic.common.logicutil import ConvertHitDirToDirType, AdjustDirByMemberType
from battlelogic.badminton import CHitBadmintonArgs
from battlelogic.common.debug import Profiler
from battlelogic.common.defines import NORMAL_HIT_KEY, SKILL_HIT_KEY
from .nearhitaction import CNearHitAction
from battlelogic.common.debug import LogError, LogFile
from .hitdirmgr import CHitDirMgr

class CDoHitAction:

    def __init__(self, oOwner):
        self.m_Owner = oOwner
        self.m_Scene = oOwner.GetScene()
        self.m_HitKey = BattleCmd_pb2.HIT_KEY_KEY_NONE
        self.m_HitType = BattleCmd_pb2.HIT_TYPE_NONE
        self.m_HitAction = None
        self.m_HitData = CHitData()
        self.m_DestineCurveID = 0
        self.m_CouldInterrupt = False
        self.m_HitDirMgr = CHitDirMgr(self)
        self.m_DirectActionID = 0

    def HitAndDestineCurve(self, oHitDir, iHitKey, iDestineCurveID):
        self.m_DestineCurveID = iDestineCurveID
        return self.Hit(oHitDir, iHitKey)

    def HitAndDestineAction(self, oHitDir, iHitKey, iDestineActionSID):
        return self.Hit(oHitDir, iHitKey, iDestineActionSID)

    def Hit(self, oDir, iHitKey, iHitActionID=0, oMoveScale=None, oClinetPlayerPos=None, oClientBadmintonPos=None):
        if iHitKey in NORMAL_HIT_KEY:
            return self.PreDoHitAction(oDir, iHitKey, iHitActionID, oMoveScale, oClinetPlayerPos, oClientBadmintonPos)
        if iHitKey in SKILL_HIT_KEY:
            return self.PreDoAction(oDir, iHitKey, iHitActionID, oMoveScale)

    def PreDoHitAction(self, oDir, iHitKey, iHitActionID=0, oMoveScale=None, oClinetPlayerPos=None, oClientBadmintonPos=None):
        if not self.CouldDoAction(iHitActionID):
            return False
        else:
            if self.m_Owner.m_BehaviorManager.HasBehavior(BattleCmd_pb2.BEHAVIOR_TYPE_ONLY_HIT_P):
                iHitKey = BattleCmd_pb2.HIT_KEY_KEY_P
            else:
                if self.m_Owner.m_BehaviorManager.HasBehavior(BattleCmd_pb2.BEHAVIOR_TYPE_ONLY_HIT_D):
                    iHitKey = BattleCmd_pb2.HIT_KEY_KEY_D
                else:
                    if self.m_Owner.m_BehaviorManager.HasBehavior(BattleCmd_pb2.BEHAVIOR_TYPE_ONLY_HIT_GY):
                        iHitKey = BattleCmd_pb2.HIT_KEY_KEY_GY
                if self.m_Owner.CheckForbitHitKey(iHitKey):
                    return False
                iActionID = self.DoAction(oDir, iHitKey, iHitActionID, oMoveScale, oClinetPlayerPos, oClientBadmintonPos)
                if iActionID == 0:
                    return False
            return True

    def PreDoAction(self, oDir, iHitKey, iHitActionID=0, oMoveScale=None):
        if iHitKey == BattleCmd_pb2.HIT_KEY_KEY_DJ:
            if self.m_Owner.m_PropertySkillID == 0:
                return False
            return self.CouldDoAction(iHitActionID) or False
        else:
            if self.m_Owner.CheckForbitHitKey(iHitKey):
                return False
            iActionID = self.DoAction(oDir, iHitKey, iHitActionID)
            if iActionID == 0:
                return False
            self.m_Owner.OnBattleEvent(BattleCmd_pb2.BATTLE_EVENT_TYPE_USE_ACTIVE_SKILL, {"动作ID": iActionID})
            return True

    def DoAction(self, oDir, iHitKey, iHitActionID=0, oMoveScale=None, oClinetPlayerPos=None, oClientBadmintonPos=None):
        self.m_Owner.SetPreJudgeFrame(HITACTION_PREJUDGE_FRAME)
        iHitType = self.CalcHitType()
        oHitAction = None
        if iHitActionID == 0:
            iHitActionID = self.CalcHitAction(iHitKey, iHitType)
            if iHitActionID:
                oHitAction = self.m_Owner.TryGetAction(iHitActionID)
        else:
            if self.NeedReCaclHitAction(oClinetPlayerPos, oClientBadmintonPos) and iHitActionID != STAR_MARK_HIT_ACTION_ID:
                if iHitKey not in SKILL_HIT_KEY:
                    oMoveScale = None
                    iOldActionID = iHitActionID
                    iHitActionID = self.CalcHitAction(iHitKey, iHitType)
                    if iHitActionID:
                        oHitAction = self.m_Owner.TryGetAction(iHitActionID)
                    LogFile("battlelogic", "位置偏差较大,重算动作 %s|%s|%s" % (self.m_Owner.m_ID, iOldActionID, iHitActionID))
                else:
                    oActionData = GetHitActionData(iHitActionID)
                    if oActionData.m_HitKey & iHitKey and (iHitType != BattleCmd_pb2.HIT_TYPE_STARMARK or oActionData.m_HitType & iHitType) and self.m_Owner.CouldUseAction(iHitActionID):
                        oHitAction = self.m_Owner.m_HitActionManager.GetAction(iHitActionID)
                        if oHitAction:
                            if not oActionData.CheckPreCondition(self.m_Owner, oHitAction):
                                if oActionData.m_FailActionID:
                                    oHitAction = self.m_Owner.m_HitActionManager.GetAction(oActionData.m_FailActionID)
                        else:
                            oHitAction = None
                        oMoveScale = None
                    else:
                        oActionData.m_NotCheckPreHitRadio or self.m_Owner.m_Random.SetRandomSeed(self.m_Owner.m_HitNum + iHitActionID - 1)
                if not oActionData.CheckPreHitRadio(self.m_Owner, oHitAction):
                    LogFile("battlelogic", "随机动作概率不通过! %s|%s|%s" % (self.m_Owner.m_ID, self.m_Owner.m_HitNum, iHitActionID))
                    oMoveScale = None
                    oHitAction.ClearCache()
                    iHitActionID = self.CalcHitAction(iHitKey, iHitType)
                    if iHitActionID:
                        oHitAction = self.m_Owner.TryGetAction(iHitActionID)
                    else:
                        print("玩家使用未拥有动作", iHitActionID)
                    iActionID = 0
                    if oHitAction:
                        iActionID = oHitAction.m_ID
                elif not self.m_CouldInterrupt:
                    iActionID = SWING_SHOT_HIT_ACTION_ID
                    oHitAction = self.m_Owner.TryGetAction(iActionID)
            else:
                return 0
            self.ClearHitData()
            self.m_HitDirMgr.SetInitHitDir(oDir)
            self.m_HitKey = iHitKey
            self.m_HitType = iHitType
            self.m_Owner.SetPreJudgeFrame(0)
            self.SetUpAction(iActionID, oHitAction, oMoveScale)
            return iActionID

    def SetUpAction(self, iActionID, oHitAction, oMoveScale=None, bDirect=False):
        if self.m_HitAction:
            self.InterruptAction(self.m_HitAction)
        else:
            oActionData = GetHitActionData(iActionID)
            if not oActionData.m_CouldMoveCast:
                self.m_Owner.Stop()
            if not oMoveScale or oMoveScale.IsZero():
                oMoveScale = self.GetActionMoveScale(oHitAction)
        oHitAction.ClearCache()
        self.m_HitAction = oHitAction
        self.m_HitData.m_ID = oHitAction.m_ID
        self.m_CouldInterrupt = False
        self.m_HitData.m_MoveDir = self.m_Owner.m_MoveDir
        self.SetHitactionState(BattleCmd_pb2.HITACTION_STATE_BEFORE)
        self.HitRes(self.m_HitKey, self.m_HitType, iActionID, oMoveScale, bDirect)
        self.m_Owner.SetActionTime(iActionID)
        self.m_Owner.SetActionCD(iActionID)
        self.SetHitActionPath(iActionID, oMoveScale)
        self.DoActionPreScript()
        self.OnSetUpAction(oHitAction)

    def OnSetUpAction(self, oHitAction):
        self.m_Owner.OnSetUpAction(oHitAction)

    def SetDirectActionID(self, iActionID):
        self.m_DirectActionID = iActionID

    def DirectDoAction(self, iActionID):
        oHitAction = self.m_Owner.TryGetAction(iActionID)
        self.ClearHitData()
        self.m_HitType = self.CalcHitType()
        self.SetUpAction(iActionID, oHitAction, bDirect=True)
        self.SetDirectActionID(0)

    def InterruptAction(self, oHitAction):
        self.DoHitActionEndScript(oHitAction, True)

    @Profiler
    def UpdateActionTime(self):
        if self.m_DirectActionID:
            self.DirectDoAction(self.m_DirectActionID)
        else:
            if not self.m_HitAction:
                return
            else:
                iCurFrame = self.m_Scene.GetCurFrame()
                fPassFrame = self.m_HitData.m_PassFrame
                oCurHitAction = self.m_HitAction
                oActionData = GetHitActionData(oCurHitAction.m_ID)
                oBadminton = self.m_Scene.GetFirstBadminton()
                if self.m_HitData.m_HitFrame == -1:
                    if self.m_HitType == BattleCmd_pb2.HIT_TYPE_SERVE or oBadminton.GetMemberType() != self.m_Owner.GetMemberType():
                        if oActionData.m_HasCurve:
                            if fPassFrame >= 1:
                                if fPassFrame >= oActionData.m_BeforeActionTime - CURVE_PREJUDGE_FRAME:
                                    self.m_HitData.m_HitFrame = INT_MAX
                                    self.PreJudgeCurve(oActionData)
                if self.m_HitData.m_State == BattleCmd_pb2.HITACTION_STATE_BEFORE:
                    if fPassFrame >= oActionData.m_BeforeActionTime:
                        self.m_CouldInterrupt = False
                        self.SetHitactionState(BattleCmd_pb2.HITACTION_STATE_ACTION)
                        self.DoHitActionDirectScript()
                if self.m_HitData.m_State == BattleCmd_pb2.HITACTION_STATE_ACTION:
                    if self.m_HitData.m_HitFrame != -1:
                        if fPassFrame >= self.m_HitData.m_HitFrame:
                            if not self.m_HitData.m_Hited:
                                oBadminton.SetIsPrejudeHit(False)
                                self.DoHitAction()
                    if fPassFrame >= oActionData.m_BeforeActionTime + oActionData.m_ActionTime:
                        self.m_CouldInterrupt = True
                        self.SetHitactionState(BattleCmd_pb2.HITACTION_STATE_AFTER)
                        self.DoHitActionEndScript(self.m_HitAction, False)
                if self.m_HitData.m_State == BattleCmd_pb2.HITACTION_STATE_AFTER:
                    if fPassFrame >= oActionData.m_TotalTime:
                        self.HitEnd()
            if self.m_HitData.m_State != BattleCmd_pb2.HITACTION_STATE_NONE:
                self.AddHitDataPassFrame(self.m_Owner.GetPassFrame(iCurFrame, iCurFrame + 1))

    @NoPrediction
    def PreJudgeCurve(self, oActionData):
        iStartFrame = int(oActionData.m_BeforeActionTime - self.m_HitData.m_PassFrame)
        oBadminton = self.m_Scene.GetFirstBadminton()
        for iPreFrame in range(max(0, -iStartFrame), oActionData.m_ActionTime + 1):
            self.m_Owner.m_PreJudgeFrame = iStartFrame + iPreFrame
            if self.DoHitActionCheck():
                oHitArgs = self.InitHitBadmintonArgs()
                self.m_HitData.m_HitArgs = oHitArgs
                bIsExplode = oBadminton.PreExplodeRandom(oHitArgs)
                iHitFrame = iStartFrame + iPreFrame
                self.m_HitData.m_HitFrame = iHitFrame
                oBadminton.SetIsPrejudeHit(True)
                self.m_Owner.OnBattleEvent(BattleCmd_pb2.BATTLE_EVENT_TYPE_CALC_CURVE, {"击球玩家ID": (oHitArgs.m_AtkPlayerID)})
                if not IsPlayerObjectID(self.m_Owner.m_ID):
                    if getattr(self.m_Scene, "m_AICurveID", 0):
                        iCurveID = self.m_Scene.m_AICurveID
                    elif self.m_DestineCurveID:
                        iCurveID = self.m_DestineCurveID
                    else:
                        iCurveID = oActionData.DoChooseCurve(self.m_Owner, self.m_HitAction, oHitArgs.m_HitKey)
                    if iCurveID == 0:
                        iCurveID = CURVE_DEFAULT_ID
                        self.m_Scene.SendWarningLog("球路计算错误 动作%d", oActionData.m_ID)
                    oHitArgs.m_CurveID = iCurveID
                    if oActionData.m_ResetBadmintonPos:
                        oHitArgs.m_StartPos = (self.m_Owner.GetOffsetPos)(*oActionData.m_ResetBadmintonPos)
                else:
                    oHitArgs.m_StartPos = self.GetHitPos(self.m_HitType, self.m_HitAction.m_ID)
                if self.m_Scene.GetSceneType() == BattleCmd_pb2.SCENE_TYPE_TEST:
                    oPos = self.m_Scene.GetDestineStartPos(iCurveID)
                    if oPos:
                        oHitArgs.m_StartPos = oPos
                    oHitArgs.m_DropPos = oBadminton.CalcDropPos(self.m_Owner, oHitArgs)
                    self.m_Scene.SendWarningLog("击球判断%d 计算落点 %s 击球点 %s 击球方向 %s", oActionData.m_ID, oHitArgs.m_DropPos, oHitArgs.m_StartPos, oHitArgs.m_OutDir)
                    self.OnPrejudeCurve(oBadminton, oHitArgs, iHitFrame, bIsExplode)
                    break

        self.m_Owner.m_PreJudgeFrame = 0

    def OnPrejudeCurve(self, oBadminton, oHitArgs, iHitFrame, bIsExplode):
        oMsg = BattleCmd_pb2.BattleBadmintonPrejudgeCurveMsg()
        oMsg.HitFrame = int((iHitFrame - 1) / (self.m_Owner.m_BulletTimeScaleMgr.m_BulletTimeScale / 100) + 1)
        oMsg.CurveID = oHitArgs.m_CurveID
        oMsg.IsExplode = bIsExplode
        oMsg.ActionID = oHitArgs.m_AtkActionSID
        oBadminton = self.m_Scene.GetFirstBadminton()
        oMsg.BadmintonBulletTimeScale = oBadminton.m_BulletTimeScaleMgr.GetPreJudgeBulletTimeScale()
        if oHitArgs.m_CurveID:
            oMsg.StartPos = oHitArgs.m_StartPos.PackVec3()
            oMsg.DropPos = oHitArgs.m_DropPos.PackVec3()
            oMsg.HitKey = oHitArgs.m_HitKey
            oMsg.AverageSpeedMul = oHitArgs.m_AverageSpeedMul
        self.m_Owner.AddDelta(BattleCmd_pb2.BATTLE_BADMINTON_PREJUDGE_CURVE_MSG, oMsg)

    def DoHitActionCheck(self):
        if not self.m_HitAction:
            return False
        else:
            self.m_Scene.SendWarningLog("生效判断 %d 经过帧数 %.2f 离地高度 %.2f 水平距离 %.2f 角度 %.2f" % (
             self.m_HitAction.m_ID, self.m_HitData.m_PassFrame + self.m_Owner.m_PreJudgeFrame,
             BadmintonHeight(self.m_Owner, self.m_HitAction), BadmintonDistance(self.m_Owner, self.m_HitAction), BadmintonAngle(self.m_Owner, self.m_HitAction)))
            oActionData = GetHitActionData(self.m_HitAction.m_ID)
            if not oActionData.CheckHitCondition(self.m_Owner, self.m_HitAction):
                return False
            return True

    def DoHitActionDirectScript(self):
        oActionData = GetHitActionData(self.m_HitAction.m_ID)
        oActionData.DoDirectScript(self.m_Owner, self.m_HitAction)

    def DoHitAction(self):
        self.m_HitData.m_Hited = True
        oActionData = GetHitActionData(self.m_HitAction.m_ID)
        oActionData.DoHitScript(self.m_Owner, self.m_HitAction)

    def DoHitActionEndScript(self, oHitAction, bInterrupted):
        oActionData = GetHitActionData(oHitAction.m_ID)
        oActionData.DoEndScript(self.m_Owner, oHitAction)
        self.m_Scene.OnHitActionEnd(self.m_Owner.m_ID, oHitAction.m_ID, oHitAction.GetSkillSID(), self.m_HitData.m_Hited, bInterrupted)

    def DoActionPreScript(self):
        if not self.m_HitAction.m_ID:
            return
        self.m_Owner.SetPreJudgeFrame(HITACTION_PREJUDGE_FRAME)
        oActionData = GetHitActionData(self.m_HitAction.m_ID)
        oActionData.DoPreScript(self.m_Owner, self.m_HitAction)
        self.m_Owner.SetPreJudgeFrame(0)

    def HitEnd(self):
        self.m_Owner.OnHandleMove()
        self.m_Owner.OnHitStateDelta()
        self.SetHitactionState(BattleCmd_pb2.HITACTION_STATE_NONE)
        self.m_CouldInterrupt = False
        self.ClearHitData()
        self.m_DestineCurveID = 0
        self.OnHitEndDelta()
        self.m_HitDirMgr.ClearHitDir()

    def AddHitDataPassFrame(self, val):
        self.m_HitData.m_PassFrame += val

    def GetHitFacing(self, iActionID):
        oActionData = GetHitActionData(iActionID)
        oBadminton = self.m_Scene.GetFirstBadminton()
        iPreJudgeFrame = oActionData.m_BeforeActionTime + oActionData.m_ActionTime // 3
        oBadmintonPos = oBadminton.GetPreJudgePos(iPreJudgeFrame)
        return oBadmintonPos - self.m_Owner.m_Pos

    def HitRes(self, iHitKey, iHitType, iActionID, oMoveScale, bDirect):
        if iHitKey in SKILL_HIT_KEY:
            if iActionID == 0:
                return
        oHitResMsg = BattleCmd_pb2.BattleHitResMsg()
        oHitResMsg.HitType = iHitType
        oHitResMsg.ActionID = iActionID
        oHitFacing = self.GetHitFacing(iActionID)
        oHitResMsg.HitFacing = oHitFacing.PackVec3()
        if oMoveScale:
            oHitResMsg.MoveScale = oMoveScale.PackVec3()
        PackFloatVec3(oHitResMsg.Pos, self.m_Owner.m_Pos)
        oHitResMsg.IsDirect = bDirect
        oHitResMsg.HitKey = iHitKey
        self.m_Owner.UpdateDelta(BattleCmd_pb2.BATTLE_HIT_RES_MSG, oHitResMsg)
        self.m_Scene.OnHitRes(self.m_Owner.m_ID, iHitKey, iHitType, iActionID, self.m_HitAction.GetSkillSID())

    def CouldDoAction(self, iHitActionID=0):
        if self.m_Scene.GetGameState() not in (BattleCmd_pb2.GAME_STATE_PLAYING, BattleCmd_pb2.GAME_STATE_SERVE, BattleCmd_pb2.GAME_STATE_REPLAY):
            return False
        else:
            if self.m_Scene.IsServePlayer(self.m_Owner.m_ID):
                if self.m_Scene.TestIsStopServe():
                    return False
                if self.IsDoingAction():
                    if self.m_CouldInterrupt:
                        if iHitActionID != 0:
                            oActionData = GetHitActionData(iHitActionID)
                            if not oActionData or not oActionData.m_CouldInterruptAftAct:
                                return False
            else:
                return False
            return True

    def IsDoingAction(self):
        if not self.m_HitAction:
            return False
        else:
            oActionData = GetHitActionData(self.m_HitAction.m_ID)
            return oActionData.m_TotalTime > self.m_HitData.m_PassFrame

    def GetHitPos(self, iHitType, iHitActionSID):
        oBadminton = self.m_Scene.GetFirstBadminton()
        if iHitType == BattleCmd_pb2.HIT_TYPE_SERVE:
            oActionData = GetHitActionData(iHitActionSID)
            dOffSet = oActionData.m_HitPos
            if self.m_Owner.GetMemberType() == Common_pb2.TEAM_MEMBER_TYPE_GUEST:
                return self.m_Owner.GetPos() + CDVec3(-dOffSet["X"], dOffSet["Y"], -dOffSet["Z"])
            else:
                return self.m_Owner.GetPos() + CDVec3(dOffSet["X"], dOffSet["Y"], dOffSet["Z"])
        else:
            return CDVec3.CopyFrom(oBadminton.GetPreJudgePos(self.m_Owner.m_PreJudgeFrame))

    def GetFixStartPos(self, oHitAction):
        oActionData = GetHitActionData(oHitAction.m_ID)
        dOffSet = oActionData.m_HitPos
        if self.m_Owner.GetMemberType() == Common_pb2.TEAM_MEMBER_TYPE_GUEST:
            return self.GetPos() + CDVec3(-dOffSet["X"], dOffSet["Y"], -dOffSet["Z"])
        else:
            return self.GetPos() + CDVec3(dOffSet["X"], dOffSet["Y"], dOffSet["Z"])

    def GetHitHandType(self):
        oPlayerPos = self.m_Owner.GetPos()
        oBadminton = self.m_Scene.GetFirstBadminton()
        oBadmintonPos = oBadminton.GetPos()
        if oBadmintonPos.m_X >= oPlayerPos.m_X:
            if self.m_Owner.GetMemberType() == Common_pb2.TEAM_MEMBER_TYPE_GUEST:
                return HIT_HAND_TYPE_BACK
            return HIT_HAND_TYPE_FORE
        else:
            if self.m_Owner.GetMemberType() == Common_pb2.TEAM_MEMBER_TYPE_GUEST:
                return HIT_HAND_TYPE_FORE
            return HIT_HAND_TYPE_BACK

    def GetServeOutDir(self):
        oPos = self.m_Owner.GetPos()
        if self.m_Owner.GetMemberType() == Common_pb2.TEAM_MEMBER_TYPE_HOST:
            if oPos.m_X > 0:
                return BattleCmd_pb2.BADMINTON_OUT_DIR_LEFT
            else:
                return BattleCmd_pb2.BADMINTON_OUT_DIR_RIGHT
        else:
            if oPos.m_X > 0:
                return BattleCmd_pb2.BADMINTON_OUT_DIR_RIGHT
            else:
                return BattleCmd_pb2.BADMINTON_OUT_DIR_LEFT

    def GetActionMoveScale(self, oHitAction):
        if not oHitAction:
            return
        else:
            oActionData = GetHitActionData(oHitAction.m_ID)
            hitFrameMovementDct = oActionData.GetHitFrameMovement(self.m_Owner, oHitAction)
            if not hitFrameMovementDct:
                return
            iXZ = hitFrameMovementDct["XZ"]
            iY = hitFrameMovementDct["Y"]
            if iY == 0:
                if iXZ == 0:
                    return
                oBadminton = self.m_Scene.GetFirstBadminton()
                iPreJudgeFrame = oActionData.m_BeforeActionTime + oActionData.m_ActionTime // 3
                oBadmintonPos = oBadminton.GetPreJudgePos(iPreJudgeFrame)
                oPos = oBadmintonPos
                if iXZ:
                    fHorizonDistance = oPos.HorizontalDistance(self.m_Owner.m_Pos)
                    oScale = CDVec3(oPos.m_X - self.m_Owner.m_Pos.m_X, 0, oPos.m_Z - self.m_Owner.m_Pos.m_Z).GetNormalized()
            else:
                oScale = CDVec3.Zero()
            if iY:
                oScale.m_Y = 1
            return oScale

    def SetHitActionPath(self, iHitActionSID, oScale):
        if not oScale:
            return
        lstPath = []
        oActionData = GetHitActionData(iHitActionSID)
        oHitAction = self.m_Owner.m_HitActionManager.GetAction(iHitActionSID)
        for d in oActionData.GetMoveMent(self.m_Owner, oHitAction):
            lstPath.append((d["XZ"], d["Y"], Time2Frame(d["Time"])))

        if not lstPath:
            return
        self.m_Owner.SetMoveType(BattleCmd_pb2.MOVE_TYPE_AUTO_MOVE)
        self.m_Scene.m_Phys.SetPath(self.m_Owner.m_ID, lstPath, oScale.m_X, oScale.m_Z)

    def CalcHitType(self):
        iHitType = BattleCmd_pb2.HIT_TYPE_NONE
        if self.m_Scene.IsServePlayer(self.m_Owner.m_ID):
            iHitType = BattleCmd_pb2.HIT_TYPE_SERVE
        elif self.m_Owner.IsInStarMarkRange():
            if not self.m_Owner.m_BehaviorManager.HasBehavior(BattleCmd_pb2.BEHAVIOR_TYPE_FORBID_STARMARK_HIT):
                iHitType = BattleCmd_pb2.HIT_TYPE_STARMARK
            else:
                iHitType = BattleCmd_pb2.HIT_TYPE_NORMAL
        return iHitType

    def CouldHitBadminton(self):
        if self.m_HitType == BattleCmd_pb2.HIT_TYPE_SERVE:
            return True
        else:
            if not self.m_Scene.CouldCatchServe(self.m_Owner.m_ID):
                return False
            else:
                if self.m_Scene.GetGameState() != BattleCmd_pb2.GAME_STATE_PLAYING:
                    return False
                else:
                    oBadminton = self.m_Scene.GetFirstBadminton()
                    if oBadminton.m_IsPrejudeHit:
                        return False
                    if not oBadminton.CheckHitValid(self.m_Owner.m_PreJudgeFrame):
                        return False
                    return oBadminton.CheckHitterValid(self.m_Owner, self.m_Owner.m_PreJudgeFrame) or False
            return True

    def DoAutoHitBadminton(self):
        self.DoHitBadminton()

    def DoHitBadminton(self):
        oBadminton = self.m_Scene.GetFirstBadminton()
        oHitArgs = self.m_HitData.m_HitArgs
        if not oHitArgs or not oHitArgs.m_CurveID:
            return
        oBadminton.HitBadminton(oHitArgs)
        self.m_Owner.AddHitNum()

    def GetHitBadmintonArgs(self):
        if not self.m_HitAction:
            return
        else:
            return self.m_HitData.m_HitArgs

    def InitHitBadmintonArgs(self):
        if not self.m_HitAction:
            return
        else:
            oActionData = GetHitActionData(self.m_HitAction.m_ID)
            if oActionData.m_AutoHitDefaultHitKey:
                iHitKey = oActionData.m_AutoHitDefaultHitKey
            else:
                iHitKey = self.m_HitKey
            if self.m_HitType == BattleCmd_pb2.HIT_TYPE_SERVE:
                iOutDir = self.GetServeOutDir()
            else:
                iOutDir = self.m_HitDirMgr.GetFinalHitDir()
            oHitArgs = CHitBadmintonArgs()
            oHitArgs.m_AtkPlayerID = self.m_Owner.m_ID
            oHitArgs.m_HitKey = iHitKey
            oHitArgs.m_IsServe = self.m_HitType == BattleCmd_pb2.HIT_TYPE_SERVE
            oHitArgs.m_OutDir = iOutDir
            oHitArgs.m_AtkActionSID = self.m_HitAction.m_ID
            oHitArgs.m_AtkSkillSID = self.m_HitAction.GetSkillSID()
            oHitArgs.m_DropPosGatherValue = self.m_Owner.GetPropValue(Common_pb2.BATTLE_PROP_TYPE_DROPPOS_GATHER) / 100
            oHitArgs.m_AverageSpeedMul = self.m_Owner.GetPropValue(Common_pb2.BATTLE_PROP_TYPE_HIT_BADMINTON_AVERAGE_SPEED_MUL)
            return oHitArgs

    def CalcHitAction(self, iHitKey, iHitType):
        oBadminton = self.m_Scene.GetFirstBadminton()
        self.m_Owner.SetPreJudgeFrame(HITACTION_PREJUDGE_FRAME)
        if iHitType != BattleCmd_pb2.HIT_TYPE_SERVE and iHitKey in NORMAL_HIT_KEY and not oBadminton.IsDropInSameHalfCourt(self.m_Owner.m_Pos):
            self.m_Owner.SetPreJudgeFrame(0)
            return 0
        else:
            iHitActionID = 0
            lstActions = self.m_Owner.m_HitActionManager.GetSortedActions(iHitKey, iHitType)
            oBadmintonPos = oBadminton.GetPreJudgePos(self.m_Owner.m_PreJudgeFrame)
            fHeight = oBadmintonPos.m_Y
            fDistance = self.m_Owner.GetPos().HorizontalDistance(oBadmintonPos)
            fAngle = oBadminton.GetObjectToMeAngle(self.m_Owner)
            iRangeDir = GetRangeDir(fAngle)
            if self.m_CouldInterrupt:
                lstActions = [iHitActionSID for iHitActionSID in lstActions if GetHitActionData(iHitActionSID).m_CouldInterruptAftAct]
            oNearHitAction = CNearHitAction(fHeight, fDistance, iHitKey, iRangeDir, self.m_CouldInterrupt)
            for iHitActionSID in lstActions:
                oHitAction = self.m_Owner.m_HitActionManager.GetAction(iHitActionSID)
                oActionData = GetHitActionData(iHitActionSID)
                if not self.m_Owner.CouldUseAction(iHitActionSID):
                    pass
                else:
                    oHitAction.ClearCache()
                if not oActionData.CheckPreCondition(self.m_Owner, oHitAction):
                    pass
                else:
                    bResult = True
                    tDistanceRange = oActionData.GetDistanceRange(self.m_Owner, oHitAction)
                    tHeightRange = oActionData.GetHeightRange(self.m_Owner, oHitAction)
                    oNearHitAction.Calc(oBadminton, tHeightRange, tDistanceRange, oHitAction, oActionData)
                    if oActionData.m_HitAngle:
                        if iRangeDir not in oActionData.m_HitAngle:
                            bResult = False
                    if tHeightRange:
                        if fHeight < tHeightRange[0] or fHeight > tHeightRange[1]:
                            bResult = False
                        if tDistanceRange:
                            if fDistance < tDistanceRange[0] or fDistance > tDistanceRange[1]:
                                bResult = False
                        else:
                            self.m_Owner.m_Random.SetRandomSeed(self.m_Owner.m_HitNum + iHitActionSID)
                            if not oActionData.CheckPreHitRadio(self.m_Owner, oHitAction):
                                bResult = False
                                oHitAction.ClearCache()
                            if bResult:
                                iHitActionID = oHitAction.m_ID
                                break

            self.m_Owner.SetPreJudgeFrame(0)
            if iHitActionID:
                return iHitActionID
            return oNearHitAction.GetNearHitActionID()

    def SetHitactionState(self, iHitActionState):
        if self.m_HitData.m_State == iHitActionState:
            return
        iOldHitActionState = self.m_HitData.m_State
        self.m_HitData.m_State = iHitActionState
        if self.m_HitData.m_State == BattleCmd_pb2.HITACTION_STATE_BEFORE:
            self.m_Owner.OnBattleEvent(BattleCmd_pb2.BATTLE_EVENT_TYPE_ENTER_HITACTION_BEFORE, {})
        elif self.m_HitData.m_State == BattleCmd_pb2.HITACTION_STATE_ACTION:
            self.m_Owner.OnBattleEvent(BattleCmd_pb2.BATTLE_EVENT_TYPE_ENTER_HITACTION_ACTION, {})
        elif self.m_HitData.m_State == BattleCmd_pb2.HITACTION_STATE_AFTER:
            self.m_Owner.OnBattleEvent(BattleCmd_pb2.BATTLE_EVENT_TYPE_ENTER_HITACTION_AFTER, {})
        elif iOldHitActionState == BattleCmd_pb2.HITACTION_STATE_AFTER:
            pass
        if self.m_HitData.m_State == BattleCmd_pb2.HITACTION_STATE_NONE:
            self.m_Owner.OnBattleEvent(BattleCmd_pb2.BATTLE_EVENT_TYPE_ENTER_HITACTION_FINISH, {})

    def GetHitPassFrame(self):
        return self.m_HitData.m_PassFrame + self.m_Owner.m_PreJudgeFrame

    def IsServing(self):
        if not self.m_HitAction:
            return False
        else:
            oActionData = GetHitActionData(self.m_HitAction.m_ID)
            if oActionData.m_HasCurve:
                if self.m_HitType & BattleCmd_pb2.HIT_TYPE_SERVE:
                    return True
            return False

    def GetHitType(self):
        return self.m_HitType

    def ClearHitData(self):
        self.m_HitKey = BattleCmd_pb2.HIT_KEY_KEY_NONE
        self.m_HitType = BattleCmd_pb2.HIT_TYPE_NONE
        self.m_HitAction = None
        self.m_HitData.ClearHitData()

    def OnHitEndDelta(self):
        oHitEndMsg = BattleCmd_pb2.BattleHitEndMsg()
        self.m_Owner.UpdateDelta(BattleCmd_pb2.BATTLE_HIT_END_MSG, oHitEndMsg)

    def NeedReCaclHitAction(self, oClinetPlayerPos, oClientBadmintonPos):
        if not oClinetPlayerPos or not oClientBadmintonPos:
            return False
        else:
            oPlayerCurPos = self.m_Owner.GetPos()
            if abs(oClinetPlayerPos.m_X - oPlayerCurPos.m_X) >= SERVER_HIT_RECALC_LIMIT:
                return True
            if abs(oClinetPlayerPos.m_Z - oPlayerCurPos.m_Z) >= SERVER_HIT_RECALC_LIMIT:
                return True
            oBadmintonPrePos = self.m_Scene.GetFirstBadminton().GetPreJudgePos(HITACTION_PREJUDGE_FRAME)
            if abs(oClientBadmintonPos.m_X - oBadmintonPrePos.m_X) >= SERVER_HIT_RECALC_LIMIT:
                return True
            if abs(oClientBadmintonPos.m_Y - oBadmintonPrePos.m_Y) >= SERVER_HIT_RECALC_LIMIT:
                return True
            if abs(oClientBadmintonPos.m_Z - oBadmintonPrePos.m_Z) >= SERVER_HIT_RECALC_LIMIT:
                return True
            return False

    def DoRelease(self):
        self.m_Owner = None
        self.m_Scene = None
        self.m_HitDirMgr = None
