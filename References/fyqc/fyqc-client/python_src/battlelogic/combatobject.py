# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\combatobject.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 15016 bytes
from .battlebase.dvec3 import CDVec3, PackFloatVec3, PackSintVec3
from base.protobufdata import BattleCmd_pb2
from .plugins.state.statecontainer import CStateContainer
from base.protobufdata import Common_pb2
from battlelogic.plugins.event.eventcenter import CEventCenter
from battlelogic.common.decorator import PredictionHeroOnly, NoPrediction
from battlelogic.common.debug import Profiler, LogWarning, Log, LogError
from battlelogic.common.defines import COLLISION_GROUP_CHAR, IsServer
from base.data import GetModelData
from base.data import GetStateData
from .plugins.bullettime.bullettimemanager import CButtleTimeMgr
g_AllStateType = (
 BattleCmd_pb2.STATE_TYPE_BUFF, BattleCmd_pb2.STATE_TYPE_DEBUFF, BattleCmd_pb2.STATE_TYPE_NEUTRAL)

class CCombatObject(object):

    def __init__(self, iID, oScene, iSceneObjectType):
        self.m_ID = iID
        self.m_Name = ""
        self.m_Scene = oScene
        self.m_SceneObjectType = iSceneObjectType
        self.m_Pos = CDVec3()
        self.m_TableID = 0
        self.m_StateManager = CStateContainer(self)
        self.m_MemberType = Common_pb2.TEAM_MEMBER_TYPE_NONE
        self.m_EventCenter = CEventCenter(self)
        self.m_HitNum = 0
        self.m_ImmuneStateTypeFlag = 0
        self.m_EndFrame = 0
        self.m_TriggerStateSID = 0
        self.m_NetIndex = 0
        self.m_EffectiveFrameNum = 1
        self.m_ImmuneStateTypeData = {}
        self.m_IgnoreHitObjectSet = set()
        self.m_BulletTimeScaleMgr = CButtleTimeMgr(self)

    def AddEffectiveFrameNum(self, iVal):
        self.m_EffectiveFrameNum += iVal * self.m_BulletTimeScaleMgr.m_BulletTimeScale / 100

    def GetCurEffectiveFrame(self):
        return int(self.m_EffectiveFrameNum)

    def ID(self):
        return self.m_ID

    def Name(self):
        return self.m_Name

    def SetName(self, sName):
        self.m_Name = sName

    def SetMemberType(self, iMemberType):
        self.m_MemberType = iMemberType

    def GetMemberType(self):
        return self.m_MemberType

    def AddHitNum(self):
        self.m_HitNum += 1
        self.OnAddHitNum()
        self.OnHitNumDelta()

    def GetHitNum(self):
        return self.m_HitNum

    def OnAddHitNum(self):
        self.m_StateManager.OnAddHitNum(self.m_HitNum)

    def OnHitNumDelta(self):
        oMsg = BattleCmd_pb2.BattleHitNumMsg()
        oMsg.HitNum = self.m_HitNum
        self.UpdatePersonalDelta(BattleCmd_pb2.BATTLE_HIT_NUM_MSG, oMsg)

    @Profiler
    def UpdateState(self):
        self.m_StateManager.HeartBeat()

    @Profiler
    def ExecuteLoop(self):
        self.CheckEnd()
        self.UpdateState()
        self.m_BulletTimeScaleMgr.ExecuteLoop()

    def GetPassFrame(self, iLastFrame, iCurFrame):
        return (iCurFrame - iLastFrame) * self.m_BulletTimeScaleMgr.m_BulletTimeScale / 100

    def GetPos(self):
        return self.m_Pos

    def SetPos(self, oPos, bNoLerp=False, bDelta=True):
        self.m_Pos = oPos
        self.m_Scene.m_Phys.SetPosition(self.m_ID, oPos.m_X, oPos.m_Y, oPos.m_Z)
        if bDelta:
            self.OnPosDelta(oPos, bNoLerp)

    def GetScene(self):
        return self.m_Scene

    def GetSceneObjectType(self):
        return self.m_SceneObjectType

    def AddDelta(self, iMsg, oMsg):
        self.m_Scene.AddFrameMsg(self.m_ID, iMsg, oMsg)

    def AddPersonalDelta(self, iMsg, oMsg):
        self.m_Scene.AddPersonalFrameMsg(self.m_ID, iMsg, oMsg)

    def AddPersonalSpectatorsDelta(self, iMsg, oMsg):
        self.m_Scene.AddPersonalSpectatorsFrameMsg(self.m_ID, iMsg, oMsg)

    def UpdateDelta(self, iMsg, oMsg):
        self.m_Scene.UpdateFrameMsg(self.m_ID, iMsg, oMsg)

    def UpdatePersonalDelta(self, iMsg, oMsg):
        self.m_Scene.UpdatePersonalFrameMsg(self.m_ID, iMsg, oMsg)

    def UpdatePersonalSpectatorsDelta(self, iMsg, oMsg):
        self.m_Scene.UpdatePersonalSpectatorsFrameMsg(self.m_ID, iMsg, oMsg)

    def GetPosMsg(self, oPos=None, bNoLerp=False):
        oPosMsg = BattleCmd_pb2.BattlePosMsg()
        if not oPos:
            oPos = self.GetPos()
        PackFloatVec3(oPosMsg.Pos, oPos)
        if bNoLerp:
            oPosMsg.NoLerp = bNoLerp
        return oPosMsg

    def OnPosDelta(self, oPos=None, bNoLerp=False):
        oPosMsg = self.GetPosMsg(oPos, bNoLerp)
        self.UpdateDelta(BattleCmd_pb2.BATTLE_POS_MSG, oPosMsg)

    def SetTableID(self, iTableID):
        self.m_TableID = iTableID

    def GetTableID(self):
        return self.m_TableID

    def SendLogLog(self, sLogFormat, *arg):
        (self.m_Scene.SendLogLog)(sLogFormat, *arg)

    def SendWarningLog(self, sLog):
        self.m_Scene.SendWarningLog(sLog)

    def SendErrorLog(self, sLog):
        self.m_Scene.SendErrorLog(sLog)

    def InitAfterEnterScene(self):
        return

    def GetAddStateMsg(self, oState):
        oAddStateMsg = BattleCmd_pb2.BattleAddStateMsg()
        oAddStateMsg.StateSID = oState.m_ID
        oAddStateMsg.EndFrame = oState.m_EndFrame
        oAddStateMsg.CasterID = oState.m_CasterID
        oAddStateMsg.StartFrame = oState.m_StartFrame
        return oAddStateMsg

    def OnAddStateDelta(self, oState, bShow):
        if not bShow:
            return
        oAddStateMsg = self.GetAddStateMsg(oState)
        self.AddDelta(BattleCmd_pb2.BATTLE_ADD_STATE_MSG, oAddStateMsg)

    def OnRemoveStateDelta(self, iStateSID, bShow):
        if not bShow:
            return
        oRemoveStateMsg = BattleCmd_pb2.BattleRemoveStateMsg()
        oRemoveStateMsg.StateSID = iStateSID
        self.AddDelta(BattleCmd_pb2.BATTLE_REMOVE_STATE_MSG, oRemoveStateMsg)

    @NoPrediction
    def DoAddState(self, oAddStateArgs):
        self.m_StateManager.AddState(oAddStateArgs)

    def AddState(self, oAddStateArgs):
        oStateData = GetStateData(oAddStateArgs.m_StateSID)
        iStateType = oStateData.m_Type
        targetLst = self.GetTargetLst(oAddStateArgs.m_SelectObjectType)
        for oTarget in targetLst:
            if oTarget.GetSceneObjectType() == BattleCmd_pb2.SCENE_OBJECT_TYPE_PLAYER:
                if oTarget.TouchImmuneStateType(iStateType):
                    continue
            oTarget.DoAddState(oAddStateArgs)

    def TouchImmuneStateType(self, iStateType):
        if self.GetImmuneStateTypeFlag() & iStateType:
            self.OnBattleEvent(BattleCmd_pb2.BATTLE_EVENT_TYPE_IMMUNE_TRIGGER, {})
            return True
        else:
            return False

    @NoPrediction
    def DoRemoveState(self, iStateSID):
        self.m_StateManager.RemoveState(iStateSID)

    def RemoveState(self, iStateSID, iSelectObjectType, iCasterStateType):
        targetLst = self.GetTargetLst(iSelectObjectType)
        for oTarget in targetLst:
            oTarget.DoRemoveState(iStateSID)

    def HasState(self, iStateSID):
        if self.GetState(iStateSID):
            return True
        else:
            return False

    def GetTargetLst(self, iSelectObjectType):
        targetLst = []
        oScene = self.m_Scene
        if iSelectObjectType == BattleCmd_pb2.SELECT_OBJECT_TYPE_SELF:
            targetLst.append(self)
        elif iSelectObjectType == BattleCmd_pb2.SELECT_OBJECT_TYPE_BADMINTON:
            targetLst.append(oScene.GetFirstBadminton())
        elif iSelectObjectType == BattleCmd_pb2.SELECT_OBJECT_TYPE_TEAMMATE:
            targetLst = oScene.GetAllTeammate(self.m_ID, self.GetMemberType())
        elif iSelectObjectType == BattleCmd_pb2.SELECT_OBJECT_TYPE_ENEMY:
            targetLst = oScene.GetAllEnemy(self.GetMemberType())
        elif iSelectObjectType == BattleCmd_pb2.SELECT_OBJECT_TYPE_HITER:
            oBadminton = oScene.GetFirstBadminton()
            oHiter = oBadminton.GetOwner()
            if oHiter:
                targetLst.append(oHiter)
            elif iSelectObjectType == BattleCmd_pb2.SELECT_OBJECT_TYPE_SELF_AND_TEAMMATE:
                targetLst.append(self)
                targetLst.extend(oScene.GetAllTeammate(self.m_ID, self.GetMemberType()))
        else:
            if iSelectObjectType == BattleCmd_pb2.SELECT_OBJECT_TYPE_MONSTER:
                targetLst = oScene.GetAllMonster()
        return targetLst

    def IsTheTarget(self, iSelectObjectType, iTargetID):
        oScene = self.m_Scene
        if iSelectObjectType == BattleCmd_pb2.SELECT_OBJECT_TYPE_SELF:
            if iTargetID == self.m_ID:
                return True
        elif iSelectObjectType == BattleCmd_pb2.SELECT_OBJECT_TYPE_BADMINTON:
            pass
        if iTargetID == oScene.GetFirstBadminton().m_ID:
            return True
        elif iSelectObjectType == BattleCmd_pb2.SELECT_OBJECT_TYPE_TEAMMATE:
            if oScene.IsTeammate(self.m_ID, self.GetMemberType(), iTargetID):
                return True
        elif iSelectObjectType == BattleCmd_pb2.SELECT_OBJECT_TYPE_ENEMY:
            if oScene.IsEnemy(self.GetMemberType(), iTargetID):
                return True
        elif iSelectObjectType == BattleCmd_pb2.SELECT_OBJECT_TYPE_HITER:
            pass
        oBadminton = oScene.GetFirstBadminton()
        oHiter = oBadminton.GetOwner()
        if oHiter and iTargetID == oHiter.m_ID:
            return True
        else:
            if iSelectObjectType == BattleCmd_pb2.SELECT_OBJECT_TYPE_SELF_AND_TEAMMATE:
                if iTargetID == self.m_ID:
                    return True
                if oScene.IsTeammate(self.m_ID, self.GetMemberType(), iTargetID):
                    return True
            return False

    def AddBattleListen(self, iEventType, sSrcKey, oListenFunc):
        self.m_EventCenter.AddBattleListen(iEventType, sSrcKey, oListenFunc)

    def RemoveBattleListen(self, sSrcKey):
        self.m_EventCenter.RemoveBattleListen(sSrcKey)

    def OnBattleEvent(self, iEventType, dEventData):
        self.m_EventCenter.OnBattleEvent(iEventType, dEventData)

    def SetDelFlag(self):
        self.m_Scene.AddDelObject(self.m_SceneObjectType, self.m_ID)

    def GetStateLst(self):
        return self.m_StateManager.GetStateLst()

    def IsDoingAction(self):
        return False

    def SetBulletTimeScale(self, iValue, bIsSmooth=True):
        self.m_BulletTimeScaleMgr.SetBulletTimeScale(iValue, bIsSmooth)

    def OnSetBadmintonIsPrejudeHit(self, bIsPrejudeHit):
        self.m_BulletTimeScaleMgr.OnSetBadmintonIsPrejudeHit(bIsPrejudeHit)

    def ResetBulletTimeScale(self):
        self.m_BulletTimeScaleMgr.ResetBulletTimeScale()

    def AddBulletTimeScale(self, iStateSID, iValue, bIsSmooth):
        self.m_BulletTimeScaleMgr.AddBulletTimeScale(iStateSID, iValue, bIsSmooth)

    def RemoveBulletTimeScale(self, iStateSID, iOldValue):
        self.m_BulletTimeScaleMgr.RemoveBulletTimeScale(iStateSID, iOldValue)

    def OnEnterQuarterRest(self):
        self.m_StateManager.OnEnterQuarterRest()

    def OnLeaveQuarterRest(self):
        return

    def DoRelease(self):
        self.m_StateManager.DoRelease()
        self.m_EventCenter.DoRelease()
        self.m_BulletTimeScaleMgr.DoRelease()
        self.m_Scene = None

    def GetModelID(self):
        return

    def GetBounds(self):
        return GetModelData(self.GetModelID()).m_Bounds

    def AddImmuneStateType(self, iStateTypeFlag):
        for iStateType in g_AllStateType:
            if iStateType & iStateTypeFlag:
                if iStateType not in self.m_ImmuneStateTypeData:
                    self.m_ImmuneStateTypeData[iStateType] = 0
                self.m_ImmuneStateTypeData[iStateType] += 1

        self.m_ImmuneStateTypeFlag |= iStateTypeFlag

    def RemoveImmuneStateType(self, iStateTypeFlag):
        for iStateType in g_AllStateType:
            if iStateType & iStateTypeFlag:
                self.m_ImmuneStateTypeData[iStateType] -= 1
                if self.m_ImmuneStateTypeData[iStateType] <= 0:
                    self.m_ImmuneStateTypeFlag &= ~iStateType

    def GetImmuneStateTypeFlag(self):
        return self.m_ImmuneStateTypeFlag

    def SetEndFrame(self, iEndFrame):
        self.m_EndFrame = iEndFrame

    def CheckEnd(self):
        if not self.m_EndFrame:
            return
        iCurEffectiveFrame = self.m_Scene.GetCurEffectiveFrame()
        if self.m_EndFrame <= iCurEffectiveFrame:
            self.SetDelFlag()

    def GetCurUsingStateData(self):
        return self.m_StateManager.GetCurUsingStateData()

    def AttachTrigger(self, iStateSID, fRadius):
        if self.m_TriggerStateSID:
            return False
        else:
            bRes = self.m_Scene.m_Phys.AttachTrigger(self.m_ID, fRadius)
            if bRes:
                self.m_TriggerStateSID = iStateSID
            return bRes

    def DetachTrigger(self):
        if not self.m_TriggerStateSID:
            return
        self.m_Scene.m_Phys.DetachTrigger(self.m_ID)
        self.m_TriggerStateSID = 0

    def TouchTrigger(self, iTargetID, iCheckRes):
        if not self.m_TriggerStateSID:
            return
        oState = self.GetState(self.m_TriggerStateSID)
        if not oState:
            return
        oState.TouchTrigger(iTargetID, iCheckRes)

    def OnOtherCloseToMe(self, oTarget):
        return

    def PassHighestPos(self):
        return

    def GetAllStateData(self):
        return self.m_StateManager.GetAllStateData()

    def OnSceneBattleEvent(self, iEventType, dEventData):
        self.m_Scene.OnBattleEvent(iEventType, dEventData)

    def GetAddExtData(self):
        return

    def GetState(self, iStateSID):
        return self.m_StateManager.GetState(iStateSID)

    def GetDistanceFromBadmintonDropPos(self):
        oBadminton = self.m_Scene.GetFirstBadminton()
        oBadmintonPos = oBadminton.GetDropPos()
        oSelfPos = self.GetPos()
        dDistance = {'Horizontal':oSelfPos.HorizontalDistance(oBadmintonPos), 
         'Vertical':abs(oSelfPos.m_Y - oBadmintonPos.m_Y)}
        return dDistance

    def AddIgnoreHitObjectSet(self, sSrcKey):
        self.m_IgnoreHitObjectSet.add(sSrcKey)

    def DelIgnoreHitObjectSet(self, sSrcKey):
        self.m_IgnoreHitObjectSet.discard(sSrcKey)
