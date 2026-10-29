# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\plugins\state\statecontainer.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 12163 bytes
from .state import CState
from battlelogic.common.debug import LogWarning, Log, LogError
from base.data import GetStateData
from base.protobufdata import BattleCmd_pb2
from battlelogic.battlebase.dfunctor import CDFunctor
from battlelogic.common.decorator import NoPrediction
import math

class CStateContainer(object):

    def __init__(self, oOwner):
        self.m_Owner = oOwner
        self.m_StateDict = {}
        self.m_RemoveSet = set()
        self.m_ObjTimerFunc = {}
        self.m_HitCounterFunc = {}
        self.m_StateTypeDict = {}
        self.m_SceneTimerFunc = {}

    def HasStateType(self, iType):
        if iType not in self.m_StateTypeDict:
            return False
        else:
            if not self.m_StateTypeDict[iType]:
                return False
            return True

    def GetState(self, iStateSID):
        if iStateSID in self.m_RemoveSet:
            return
        else:
            return self.m_StateDict.get(iStateSID, None)

    def AddState(self, oAddStateArgs):
        iStateSID = oAddStateArgs.m_StateSID
        iEndFrame = 0
        iCurEffectiveFrame = self.m_Owner.GetCurEffectiveFrame()
        if oAddStateArgs.m_IsImmuneBulletTime:
            iCurEffectiveFrame = self.m_Owner.m_Scene.GetCurEffectiveFrame()
        if oAddStateArgs.m_EffectFrame:
            iEndFrame = iCurEffectiveFrame + oAddStateArgs.m_EffectFrame
        else:
            if oAddStateArgs.m_EndFrame:
                iEndFrame = oAddStateArgs.m_EndFrame
        iEndHit = 0
        if oAddStateArgs.m_EffectHit:
            iEndHit = self.m_Owner.GetHitNum() + oAddStateArgs.m_EffectHit
        else:
            if oAddStateArgs.m_EndHit:
                iEndHit = oAddStateArgs.m_EndHit
        iCasterID = self.m_Owner.ID()
        if oAddStateArgs.m_CasterID:
            iCasterID = oAddStateArgs.m_CasterID
        else:
            if iStateSID in self.m_StateDict:
                if iStateSID in self.m_RemoveSet:
                    self.m_RemoveSet.remove(iStateSID)
                self.DoRemoveState(iStateSID)
            else:
                oState = CState(iStateSID, self.m_Owner, iEndFrame, iEndHit, iCasterID, oAddStateArgs.m_CasterSkillSID, iCurEffectiveFrame)
                self.m_StateDict[iStateSID] = oState
                oState.Init()
                oStateData = GetStateData(iStateSID)
                self.m_Owner.OnAddStateDelta(oState, oStateData.m_Show)
                if iEndFrame:
                    if oStateData.m_IsImmuneBulletTime:
                        self.AddSceneTimerFunc(iStateSID, iEndFrame, self.RemoveState)
                    else:
                        self.AddObjTimerFunc(iStateSID, iEndFrame, self.RemoveState)
                if iEndHit:
                    self.AddHitCounterFunc(iStateSID, iEndHit, self.RemoveState)
            iIntervalTime = oStateData.GetIntervalTime(self.m_Owner, oState)
            if iIntervalTime:
                iFrameNum = oState.m_StartFrame + ((iCurEffectiveFrame - oState.m_StartFrame) // iIntervalTime + 1) * iIntervalTime
                if iEndFrame == 0 or iFrameNum < iEndFrame:
                    if oStateData.m_IsImmuneBulletTime:
                        self.AddSceneTimerFunc(iStateSID, iFrameNum, self.DoStateInterval)
                    else:
                        self.AddObjTimerFunc(iStateSID, iFrameNum, self.DoStateInterval)
                if oStateData.m_Type not in self.m_StateTypeDict:
                    self.m_StateTypeDict[oStateData.m_Type] = set([iStateSID])
            else:
                self.m_StateTypeDict[oStateData.m_Type].add(iStateSID)
        return True

    def DoRemoveState(self, iStateSID):
        if iStateSID not in self.m_StateDict:
            return
        else:
            oState = self.m_StateDict[iStateSID]
            oState.OnRelease()
            del self.m_StateDict[iStateSID]
            oStateData = GetStateData(iStateSID)
            self.m_Owner.OnRemoveStateDelta(iStateSID, oStateData.m_Show)
            iEndFrame = oState.GetEndFrame()
            if iEndFrame:
                if oStateData.m_IsImmuneBulletTime:
                    self.DelSceneTimerFunc(iStateSID, iEndFrame)
                else:
                    self.DelObjTimerFunc(iStateSID, iEndFrame)
            iEndHit = oState.GetEndHit()
            if iEndHit:
                self.DelHitCounterFunc(iStateSID, iEndHit)
            iIntervalTime = oStateData.GetIntervalTime(self.m_Owner, oState)
            if iIntervalTime:
                if oStateData.m_IsImmuneBulletTime:
                    iCurEffectiveFrame = self.m_Owner.m_Scene.GetCurEffectiveFrame()
                    iFrameNum = oState.m_StartFrame + ((iCurEffectiveFrame - oState.m_StartFrame) // iIntervalTime + 1) * iIntervalTime
                    self.DelSceneTimerFunc(iStateSID, iFrameNum)
                else:
                    iCurEffectiveFrame = self.m_Owner.GetCurEffectiveFrame()
                    iFrameNum = oState.m_StartFrame + ((iCurEffectiveFrame - oState.m_StartFrame) // iIntervalTime + 1) * iIntervalTime
                    self.DelObjTimerFunc(iStateSID, iFrameNum)
            if oStateData.m_Type in self.m_StateTypeDict:
                if iStateSID in self.m_StateTypeDict[oStateData.m_Type]:
                    self.m_StateTypeDict[oStateData.m_Type].remove(iStateSID)

    def RemoveState(self, iStateSID):
        if iStateSID not in self.m_StateDict:
            return False
        else:
            if iStateSID in self.m_RemoveSet:
                return False
            self.m_RemoveSet.add(iStateSID)
            return True

    @NoPrediction
    def DoStateInterval(self, iStateSID):
        oState = self.GetState(iStateSID)
        if not oState:
            return
        oStateData = GetStateData(iStateSID)
        oStateData.DoIntervalScript(self.m_Owner, oState)
        iIntervalTime = oStateData.GetIntervalTime(self.m_Owner, oState)
        if not iIntervalTime:
            return
        iEndFrame = oState.GetEndFrame()
        if oStateData.m_IsImmuneBulletTime:
            iFrameNum = self.m_Owner.m_Scene.GetCurEffectiveFrame() + iIntervalTime
            if iEndFrame == 0 or iFrameNum < iEndFrame:
                self.AddSceneTimerFunc(iStateSID, iFrameNum, self.DoStateInterval)
        else:
            iFrameNum = self.m_Owner.GetCurEffectiveFrame() + iIntervalTime
        if iEndFrame == 0 or iFrameNum < iEndFrame:
            self.AddObjTimerFunc(iStateSID, iFrameNum, self.DoStateInterval)

    def ExeTimerFunc(self, iObjEffectiveFrame, iSceneEffectiveFrame):
        if iObjEffectiveFrame in self.m_ObjTimerFunc:
            for iStateSID, func in list(self.m_ObjTimerFunc[iObjEffectiveFrame].items()):
                func(iStateSID)

            del self.m_ObjTimerFunc[iObjEffectiveFrame]
        if iSceneEffectiveFrame in self.m_SceneTimerFunc:
            for iStateSID, func in list(self.m_SceneTimerFunc[iSceneEffectiveFrame].items()):
                func(iStateSID)

            del self.m_SceneTimerFunc[iSceneEffectiveFrame]

    def HeartBeat(self):
        oScene = self.m_Owner.m_Scene
        if oScene.m_EffectiveFlag:
            self.ExeTimerFunc(self.m_Owner.GetCurEffectiveFrame(), self.m_Owner.m_Scene.GetCurEffectiveFrame())
        if self.m_RemoveSet:
            removeSet = self.m_RemoveSet
            self.m_RemoveSet = set()
            for iStateSID in removeSet:
                self.DoRemoveState(iStateSID)

    def AddObjTimerFunc(self, iStateID, iFrameNum, func):
        if iFrameNum not in self.m_ObjTimerFunc:
            self.m_ObjTimerFunc[iFrameNum] = {}
        self.m_ObjTimerFunc[iFrameNum][iStateID] = func

    def DelObjTimerFunc(self, iStateID, iFrameNum):
        if iFrameNum in self.m_ObjTimerFunc:
            if iStateID in self.m_ObjTimerFunc[iFrameNum]:
                del self.m_ObjTimerFunc[iFrameNum][iStateID]

    def AddSceneTimerFunc(self, iStateID, iFrameNum, func):
        if iFrameNum not in self.m_SceneTimerFunc:
            self.m_SceneTimerFunc[iFrameNum] = {}
        self.m_SceneTimerFunc[iFrameNum][iStateID] = func

    def DelSceneTimerFunc(self, iStateID, iFrameNum):
        if iFrameNum in self.m_SceneTimerFunc:
            if iStateID in self.m_SceneTimerFunc[iFrameNum]:
                del self.m_SceneTimerFunc[iFrameNum][iStateID]

    def AddHitCounterFunc(self, iStateID, iHitNum, func):
        if iHitNum not in self.m_HitCounterFunc:
            self.m_HitCounterFunc[iHitNum] = {}
        self.m_HitCounterFunc[iHitNum][iStateID] = func

    def DelHitCounterFunc(self, iStateID, iHitNum):
        if iHitNum in self.m_HitCounterFunc:
            if iStateID in self.m_HitCounterFunc[iHitNum]:
                del self.m_HitCounterFunc[iHitNum][iStateID]

    def GetAllStateData(self):
        dAllStateData = {}
        for iStateSID, oState in self.m_StateDict.items():
            if iStateSID in self.m_RemoveSet:
                pass
            else:
                dAllStateData[iStateSID] = (
                 oState.m_StartFrame,
                 oState.GetEndFrame(),
                 oState.GetCasterID())

        return dAllStateData

    def ClearAll(self):
        clearLst = list(self.m_StateDict.keys())
        for iStateSID in clearLst:
            self.DoRemoveState(iStateSID)

        self.m_StateDict = {}
        self.m_RemoveSet = set()
        self.m_ObjTimerFunc = {}
        self.m_HitCounterFunc = {}
        self.m_SceneTimerFunc = {}

    def GetStateLst(self):
        return list(self.m_StateDict.keys())

    def DoRelease(self):
        self.ClearAll()
        self.m_Owner = None

    def ClearStateByType(self, iStateTypeFlag, iCasterID):
        allStateLst = list(self.m_StateDict.keys())
        clearLst = []
        iClearDebuffNum = 0
        for iStateSID in allStateLst:
            oStateData = GetStateData(iStateSID)
            if oStateData.m_TimelinessType == BattleCmd_pb2.STATE_TIMELINESS_TYPE_PERMANENT:
                continue
            if oStateData.m_Type & iStateTypeFlag:
                clearLst.append(iStateSID)
                if oStateData.m_Type == BattleCmd_pb2.STATE_TYPE_DEBUFF:
                    iClearDebuffNum += 1

        for iStateSID in clearLst:
            self.RemoveState(iStateSID)

        if self.m_Owner.m_ID == iCasterID:
            if iClearDebuffNum > 0:
                self.m_Owner.OnBattleEvent(BattleCmd_pb2.BATTLE_EVENT_TYPE_CLEAR_DEBUFF_STATE, {})

    def GetCurUsingStateData(self):
        dAllStateData = {}
        for iStateSID, oState in self.m_StateDict.items():
            dAllStateData[iStateSID] = (oState.GetCasterSkillSID(),)

        return dAllStateData

    def OnAddHitNum(self, iCurHit):
        if iCurHit in self.m_HitCounterFunc:
            if self.m_HitCounterFunc[iCurHit]:
                for iStateSID, func in list(self.m_HitCounterFunc[iCurHit].items()):
                    func(iStateSID)

            del self.m_HitCounterFunc[iCurHit]

    def OnEnterQuarterRest(self):
        allStateLst = list(self.m_StateDict.keys())
        clearLst = []
        for iStateSID in allStateLst:
            oStateData = GetStateData(iStateSID)
            if oStateData.m_TimelinessType == BattleCmd_pb2.STATE_TIMELINESS_TYPE_TIMELIMITED:
                clearLst.append(iStateSID)
                continue
                oState = self.GetState(iStateSID)
                if not oState:
                    pass
            elif oState.GetEndFrame() or oState.GetEndHit():
                clearLst.append(iStateSID)
                continue
            if oState.GetCasterID() != self.m_Owner.m_ID:
                clearLst.append(iStateSID)
                continue

        for iStateSID in clearLst:
            self.RemoveState(iStateSID)

    def SetStateEffect(self, iStateSID, iEffectFrame, iEffectHit):
        oState = self.GetState(iStateSID)
        if not oState:
            return
        oStateData = GetStateData(iStateSID)
        if iEffectFrame:
            iEndFrame = oState.GetEndFrame()
            if iEndFrame:
                if oStateData.m_IsImmuneBulletTime:
                    self.DelSceneTimerFunc(iStateSID, iEndFrame)
                else:
                    self.DelObjTimerFunc(iStateSID, iEndFrame)
                iCurEffectiveFrame = self.m_Owner.GetCurEffectiveFrame()
                if oStateData.m_IsImmuneBulletTime:
                    iCurEffectiveFrame = self.m_Owner.m_Scene.GetCurEffectiveFrame()
                iNewEndFrame = iCurEffectiveFrame + iEffectFrame
                if oStateData.m_IsImmuneBulletTime:
                    self.AddSceneTimerFunc(iStateSID, iNewEndFrame, self.RemoveState)
            else:
                self.AddObjTimerFunc(iStateSID, iNewEndFrame, self.RemoveState)
            oState.m_EndFrame = iNewEndFrame
        if iEffectHit:
            iEndHit = oState.GetEndHit()
            if iEndHit:
                self.DelHitCounterFunc(iStateSID, iEndHit)
            iNewEndHit = self.m_Owner.GetHitNum() + iEffectHit
            self.AddHitCounterFunc(iStateSID, iNewEndHit, self.RemoveState)
            oState.m_EndHit = iNewEndHit
