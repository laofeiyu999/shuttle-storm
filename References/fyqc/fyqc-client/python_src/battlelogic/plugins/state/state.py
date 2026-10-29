# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\plugins\state\state.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 8788 bytes
from base.data import GetStateData
from battlelogic.common.debug import LogWarning, Profiler
from base.protobufdata import BattleCmd_pb2
from battlelogic.common.defines import TRIGGER_CHECK_RES_ENTER, TRIGGER_CHECK_RES_LEAVE
from battlelogic.common.decorator import NoPrediction

class CState(object):

    def __init__(self, iStateSID, oOwner, iEndFrame, iEndHit, iCasterID, iCasterSkillSID, iStartFrame=0):
        self.m_ID = iStateSID
        self.m_Owner = oOwner
        self.m_EndFrame = int(iEndFrame)
        self.m_EndHit = int(iEndHit)
        self.m_SrcKey = ""
        self.m_ChangePropRec = set()
        self.m_CasterID = iCasterID
        self.m_ImmuneAttrRec = set()
        self.m_ObjectBulletTimeRec = None
        self.m_SceneBulletTimeRec = None
        self.m_RandomCache = {}
        self.m_RandomCacheFrame = 0
        self.m_ChangeBehaviorRec = set()
        self.m_DoRangeScriptSuccessTimes = 0
        if iStartFrame:
            self.m_StartFrame = int(iStartFrame)
        else:
            self.m_StartFrame = oOwner.m_Scene.m_EffectiveFrameNum
        self.m_CasterSkillSID = iCasterSkillSID
        self.m_ImmuneStateTypeFlag = 0
        self.m_AddHitActionRec = set()
        self.m_AttachTriggerRec = False
        self.m_TriggerSelectObjectType = 0
        self.m_TriggerExeTimes = 0
        self.m_TriggerImmuneFlag = 0
        self.m_TriggerTargetLst = set()

    def SrcKey(self):
        return self.m_SrcKey

    def GetEndFrame(self):
        return self.m_EndFrame

    def GetEndHit(self):
        return self.m_EndHit

    def GetCasterID(self):
        return self.m_CasterID

    def GetOwner(self):
        return self.m_Owner

    def Init(self):
        self.m_SrcKey = "ST-%d-%d" % (self.m_ID, self.m_Owner.m_ID)
        oStateData = GetStateData(self.m_ID)
        oStateData.DoDirectScript(self.m_Owner, self)

    @NoPrediction
    def DoCallBackScript(self, iCallBackIndex, dEventData):
        if not self.m_Owner:
            return
        oStateData = GetStateData(self.m_ID)
        oStateData.DoCallBackScript(self.m_Owner, self, iCallBackIndex, dEventData)

    def RecChangeProp(self, iPropType):
        self.m_ChangePropRec.add(iPropType)

    def DelChangePropRec(self, iPropType):
        self.m_ChangePropRec.discard(iPropType)

    def RecImmuneAttr(self, iImmuneAttrType):
        self.m_ImmuneAttrRec.add(iImmuneAttrType)

    def RecObjectBulletTime(self, iValue):
        self.m_ObjectBulletTimeRec = iValue

    def RecSceneBulletTime(self, iValue):
        self.m_SceneBulletTimeRec = iValue

    def RecChangeBehavior(self, iBehaviorType):
        self.m_ChangeBehaviorRec.add(iBehaviorType)

    def RecImmuneStateType(self, iStateTypeFlag):
        self.m_ImmuneStateTypeFlag = iStateTypeFlag

    @NoPrediction
    def RecAtachTrigger(self, iSelectObjectType, iExeTimes, iImmuneFlag):
        self.m_TriggerSelectObjectType = iSelectObjectType
        self.m_TriggerExeTimes = iExeTimes
        self.m_TriggerImmuneFlag = iImmuneFlag
        self.m_AttachTriggerRec = True
        self.EnterTrigger(self.m_Owner.m_ID)

    @NoPrediction
    def ReleaseTrigger(self):
        if self.m_AttachTriggerRec:
            self.m_Owner.DetachTrigger()
        lstTempTarget = set(self.m_TriggerTargetLst)
        for iTargetID in lstTempTarget:
            self.LeaveTrigger(iTargetID)

    def OnRelease(self):
        self.m_Owner.RemoveBattleListen(self.m_SrcKey)
        for iPropType in self.m_ChangePropRec:
            self.m_Owner.CancelChangeProp(iPropType, self.m_SrcKey)

        for iImmuneAttrType in self.m_ImmuneAttrRec:
            self.m_Owner.RemoveImmuneAttr(iImmuneAttrType)

        if self.m_ObjectBulletTimeRec is not None:
            self.m_Owner.RemoveBulletTimeScale(self.m_ID, self.m_ObjectBulletTimeRec)
        if self.m_SceneBulletTimeRec is not None:
            oScene = self.m_Owner.GetScene()
            oScene.RemoveBulletTimeScale(self.m_ID, self.m_SceneBulletTimeRec)
        for iBehaviorType in self.m_ChangeBehaviorRec:
            self.m_Owner.RemoveBehavior(iBehaviorType, self.m_SrcKey)

        if self.m_ImmuneStateTypeFlag:
            self.m_Owner.RemoveImmuneStateType(self.m_ImmuneStateTypeFlag)
        for iActionSID in self.m_AddHitActionRec:
            self.m_Owner.GetHitActionManager().DelAction(iActionSID)

        if self.m_SrcKey in self.m_Owner.m_IgnoreHitObjectSet:
            self.m_Owner.DelIgnoreHitObjectSet(self.m_SrcKey)
        self.ReleaseTrigger()
        self.m_ChangePropRec.clear()
        self.m_ImmuneAttrRec.clear()
        self.m_ObjectBulletTimeRec = None
        self.m_SceneBulletTimeRec = None
        self.m_Owner = None

    def GetRandomCache(self, sName, iLeft=0, iRight=10000):
        if iLeft > iRight:
            iLeft, iRight = iRight, iLeft
        iFrameNum = self.m_Owner.m_Scene.GetCurFrame()
        if iFrameNum != self.m_RandomCacheFrame:
            self.m_RandomCache = {}
        if sName in self.m_RandomCache:
            return self.m_RandomCache[sName]
        else:
            iRandom = self.m_Owner.RandomBetween(iLeft, iRight + 1)
            self.m_RandomCache[sName] = iRandom
            self.m_RandomCacheFrame = iFrameNum
            return iRandom

    def OnRangeScriptSuccess(self):
        self.m_DoRangeScriptSuccessTimes += 1

    def GetDoRangeScriptSuccessTime(self):
        return self.m_DoRangeScriptSuccessTimes

    def GetCasterSkillSID(self):
        return self.m_CasterSkillSID

    def RecAddHitAction(self, iActionSID):
        self.m_AddHitActionRec.add(iActionSID)

    def CouldEnterTrigger(self, iTargetID):
        if self.m_TriggerExeTimes:
            if self.m_TriggerExeTimes <= len(self.m_TriggerTargetLst):
                return False
            return self.m_Owner.IsTheTarget(self.m_TriggerSelectObjectType, iTargetID) or False
        else:
            oTarget = self.m_Owner.GetScene().GetObject(iTargetID)
            if not oTarget:
                return False
            oStateData = GetStateData(self.m_ID)
            iCasterStateType = oStateData.m_Type
            if oTarget.TouchImmuneStateType(iCasterStateType):
                return False
            iTargetImmuneFlag = oTarget.GetImmuneAttrFlag()
            if self.m_TriggerImmuneFlag & iTargetImmuneFlag:
                return False
            return True

    def EnterTrigger(self, iTargetID):
        if not self.CouldEnterTrigger(iTargetID):
            return
        oTarget = self.m_Owner.GetScene().GetObject(iTargetID)
        oStateData = GetStateData(self.m_ID)
        oStateData.DoEnterTriggerScript(oTarget, self)
        self.m_TriggerTargetLst.add(iTargetID)
        self.m_Owner.OnBattleEvent(BattleCmd_pb2.BATTLE_EVENT_TYPE_TOUCH_TRIGGER, {})

    def LeaveTrigger(self, iTargetID):
        if iTargetID not in self.m_TriggerTargetLst:
            return
        oTarget = self.m_Owner.GetScene().GetObject(iTargetID)
        oStateData = GetStateData(self.m_ID)
        oStateData.DoLeaveTriggerScript(oTarget, self)
        self.m_TriggerTargetLst.remove(iTargetID)

    def TouchTrigger(self, iTargetID, iCheckRes):
        if iCheckRes == TRIGGER_CHECK_RES_ENTER:
            self.EnterTrigger(iTargetID)
        elif iCheckRes == TRIGGER_CHECK_RES_LEAVE:
            self.LeaveTrigger(iTargetID)

    def AddObjectBulletTimeScale(self, iValue, bIsSmooth):
        if self.m_ObjectBulletTimeRec is not None:
            self.m_Owner.RemoveBulletTimeScale(self.m_ID, self.m_ObjectBulletTimeRec)
        self.RecObjectBulletTime(iValue)
        self.m_Owner.AddBulletTimeScale(self.m_ID, iValue, bIsSmooth)

    def AddSceneBulletTimeScale(self, iValue):
        oScene = self.m_Owner.GetScene()
        if self.m_SceneBulletTimeRec is not None:
            oScene.RemoveBulletTimeScale(self.m_ID, self.m_SceneBulletTimeRec)
        self.RecSceneBulletTime(iValue)
        oScene.AddBulletTimeScale(self.m_ID, iValue)

    def CancelAllChangeProp(self):
        for iPropType in self.m_ChangePropRec:
            self.m_Owner.CancelChangeProp(iPropType, self.m_SrcKey)

        self.m_ChangePropRec.clear()
