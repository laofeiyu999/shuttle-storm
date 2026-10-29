# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\plugins\event\eventcenter.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 1270 bytes


class CEventCenter(object):

    def __init__(self, oOwner):
        self.m_Owner = oOwner
        self.m_EventData = {}

    def AddBattleListen(self, iEventType, sSrcKey, oListenFunc):
        if iEventType not in self.m_EventData:
            self.m_EventData[iEventType] = {}
        if sSrcKey not in self.m_EventData[iEventType]:
            self.m_EventData[iEventType][sSrcKey] = []
        self.m_EventData[iEventType][sSrcKey].append(oListenFunc)

    def RemoveBattleListen(self, sSrcKey):
        for dlistener in self.m_EventData.values():
            if sSrcKey in dlistener:
                del dlistener[sSrcKey]

    def OnBattleEvent(self, iEventType, dEventData):
        if iEventType not in self.m_EventData:
            return
        dlistener = self.m_EventData[iEventType]
        for oListenFuncLst in list(dlistener.values()):
            for oListenFunc in oListenFuncLst:
                oListenFunc(dEventData)

    def DoRelease(self):
        self.m_Owner = None
