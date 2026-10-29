# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\sceneplugins\property\propertyplay.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 2894 bytes
from base.data import GetPropertyData
from base.protobufdata import Common_pb2

class CPropertyPlay(object):

    def __init__(self, iID, oScene):
        self.m_TableID = iID
        self.m_Scene = oScene
        self.m_RefreshBoxesFrame = 0
        self.m_RefreshBoxesAgainData = {}
        self.m_PropertyBoxTriggerTimes = {}

    def AfterServe(self):
        oPropertyData = GetPropertyData(self.m_TableID)
        self.m_RefreshBoxesFrame = self.m_Scene.GetCurEffectiveFrame() + oPropertyData.m_AfterServeRefreshTime

    def DoRefreshBoxes(self):
        oPropertyData = GetPropertyData(self.m_TableID)
        for iPropertyBoxSID in oPropertyData.m_PropBoxLst:
            self.m_Scene.CreatePropertyBox(iPropertyBoxSID, Common_pb2.TEAM_MEMBER_TYPE_HOST)
            self.m_Scene.CreatePropertyBox(iPropertyBoxSID, Common_pb2.TEAM_MEMBER_TYPE_GUEST)

        self.m_RefreshBoxesFrame = 0

    def RefreshBoxes(self):
        if self.m_RefreshBoxesFrame == 0:
            return
        if self.m_Scene.GetCurEffectiveFrame() >= self.m_RefreshBoxesFrame:
            self.DoRefreshBoxes()

    def RefreshBoxesAgain(self):
        if not self.m_RefreshBoxesAgainData:
            return
        iCurEffectiveFrame = self.m_Scene.GetCurEffectiveFrame()
        refreshLst = []
        for iMemberType, dData in self.m_RefreshBoxesAgainData.items():
            for iPropertyBoxSID, iRefreshFrame in dData.items():
                if iCurEffectiveFrame >= iRefreshFrame:
                    self.m_Scene.CreatePropertyBox(iPropertyBoxSID, iMemberType)
                    refreshLst.append((iMemberType, iPropertyBoxSID))

        for tData in refreshLst:
            del self.m_RefreshBoxesAgainData[tData[0]][tData[1]]

    def ExecuteLoop(self):
        self.RefreshBoxes()
        self.RefreshBoxesAgain()

    def OnRoundEnd(self):
        self.m_RefreshBoxesFrame = 0
        self.m_RefreshBoxesAgainData = {}
        allPropertyBox = self.m_Scene.GetAllPropertyBox()
        for oObject in allPropertyBox:
            oObject.SetDelFlag()

    def OnPropertyBoxTrigger(self, iPropertyBoxSID, iMemberType, iRefreshFrame, iTriggerPlayID, iPropertyID=0):
        iRefreshFrame = self.m_Scene.GetCurEffectiveFrame() + iRefreshFrame
        if iMemberType not in self.m_RefreshBoxesAgainData:
            self.m_RefreshBoxesAgainData[iMemberType] = {}
        self.m_RefreshBoxesAgainData[iMemberType][iPropertyBoxSID] = iRefreshFrame
        if iTriggerPlayID not in self.m_PropertyBoxTriggerTimes:
            self.m_PropertyBoxTriggerTimes[iTriggerPlayID] = {}
        if iPropertyID not in self.m_PropertyBoxTriggerTimes[iTriggerPlayID]:
            self.m_PropertyBoxTriggerTimes[iTriggerPlayID][iPropertyID] = 0
        self.m_PropertyBoxTriggerTimes[iTriggerPlayID][iPropertyID] += 1

    def DoRelease(self):
        self.m_Scene = None
