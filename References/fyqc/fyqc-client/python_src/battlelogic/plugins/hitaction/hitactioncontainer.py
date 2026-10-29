# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\plugins\hitaction\hitactioncontainer.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 3524 bytes
from base.data import hitaction, GetHitActionData
from battlelogic.common.debug import Log, LogWarning, LogError
from .hitaction import CHitAction
from base.protobufdata.BattleCmd_pb2 import HIT_TYPE_NORMAL, HIT_TYPE_STARMARK

class CHitActionContainer(object):

    def __init__(self, oOwner):
        self.m_Owner = oOwner
        self.m_ActionDict = {}
        self.m_ActionByActionTypeDict = {}

    def InitDefaultAction(self):
        oScene = self.m_Owner.GetScene()
        lstAction = hitaction.INIT_ACTION_DICT.get(oScene.GetGameMode(), [])
        for iSID in lstAction:
            self.AddAction(iSID, 0, 0)

    def GetAction(self, iSID):
        return self.m_ActionDict.get(iSID, None)

    def GetSortedActions(self, iHitKey, iHitType):
        lstAction = self.m_Owner.m_Scene.m_Phys.GetActionsByKey(self.m_Owner.m_ID, iHitKey, iHitType)
        if not lstAction:
            lstAction = []
        return lstAction

    def CreateAction(self, iSID, iHitKey, iSkillID):
        oHitAction = CHitAction(iSID, iSkillID, iHitKey, self.m_Owner)
        oHitAction.Init()
        return oHitAction

    def OnAddAction(self, iSID, oHitAction):
        oActionData = GetHitActionData(iSID)
        iHitActionType = oActionData.m_HitActionType
        if iHitActionType not in self.m_ActionByActionTypeDict:
            self.m_ActionByActionTypeDict[iHitActionType] = {}
        self.m_ActionByActionTypeDict[iHitActionType][iSID] = oHitAction
        self.m_Owner.m_Scene.m_Phys.AddAction(self.m_Owner.m_ID, iSID, oHitAction.GetHitKey(), oActionData.m_HitType, oActionData.m_Priority)

    def AddAction(self, iSID, iSkillID, iHitKey):
        if iSID in self.m_ActionDict:
            return False
        else:
            oHitAction = CHitAction(iSID, iSkillID, iHitKey, self.m_Owner)
            oHitAction.Init()
            self.m_ActionDict[iSID] = oHitAction
            self.OnAddAction(iSID, oHitAction)
            return True

    def DelAction(self, iSID):
        if iSID not in self.m_ActionDict:
            return
        oActionData = GetHitActionData(iSID)
        oHitAction = self.m_ActionDict[iSID]
        self.m_Owner.m_Scene.m_Phys.DelAction(self.m_Owner.m_ID, iSID, oHitAction.GetHitKey(), oActionData.m_HitType)
        self.m_ActionDict[iSID].DoRelease()
        del self.m_ActionDict[iSID]
        del self.m_ActionByActionTypeDict[oActionData.m_HitActionType][iSID]

    def Reset(self):
        self.m_ActionDict = {}
        self.m_ActionByActionTypeDict = {}
        self.m_Owner.m_Scene.m_Phys.ClearAction(self.m_Owner.m_ID)

    def ReInitAction(self):
        self.ClearAll()
        self.InitDefaultAction()

    def ClearAll(self):
        for iSID, oHitAction in self.m_ActionDict.items():
            oHitAction.DoRelease()

        self.Reset()

    def DoRelease(self):
        self.ClearAll()
        self.m_Owner = None

    def HasHitKey(self, iHitKey):
        for iHitType in (HIT_TYPE_NORMAL, HIT_TYPE_STARMARK):
            resLst = self.GetSortedActions(iHitKey, iHitType)
            if len(resLst):
                return True

        return False

    def GetActionsByHitActionType(self, iHitActionType):
        return self.m_ActionByActionTypeDict.get(iHitActionType, {})
