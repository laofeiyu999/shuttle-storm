# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\plugins\counter\countermanager.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 4590 bytes
from base.data import GetCounterData
from base.protobufdata import BattleCmd_pb2
from battlelogic.common.debug import LogError

class CCounterManager(object):

    def __init__(self, oOwner):
        self.m_CounterData = {}
        self.m_CounterRecord = {}
        self.m_Owner = oOwner
        self.Init()

    def Init(self):
        for iCounterType in BattleCmd_pb2.COUNTER_TYPE.values():
            if iCounterType == BattleCmd_pb2.COUNTER_TYPE_NONE:
                pass
            else:
                self.m_CounterData[iCounterType] = 0

    def PureSetCounter(self, iCounterType, iCurValue, bServeSet):
        dCounterData = GetCounterData(iCounterType)
        iMaxValue = dCounterData["maxvalue"]
        if iCurValue > iMaxValue:
            iCurValue = iMaxValue
        if iCurValue < 0:
            iCurValue = 0
        iOldValue = self.m_CounterData.get(iCounterType, 0)
        self.m_CounterData[iCounterType] = iCurValue
        iDelta = iCurValue - iOldValue
        self.OnCounterDelta(iCounterType, iCurValue, bServeSet)

    def SetCounter(self, iCounterType, iCurValue):
        if iCounterType not in self.m_CounterData:
            self.m_CounterData[iCounterType] = 0
        else:
            iOldValue = self.m_CounterData[iCounterType]
            dCounterData = GetCounterData(iCounterType)
            iMaxValue = dCounterData["maxvalue"]
            if iCurValue > iMaxValue:
                iCurValue = iMaxValue
            if iCurValue < 0:
                iCurValue = 0
            iChange = iCurValue - iOldValue
            self.PureSetCounter(iCounterType, iCurValue, False)
            dEventData = {'计数器变化值':iChange,  '计数器类型':iCounterType}
            self.m_Owner.OnBattleEvent(BattleCmd_pb2.BATTLE_EVENT_TYPE_COUNTER_UPDATE, dEventData)
            if iCounterType == BattleCmd_pb2.COUNTER_TYPE_CONTINUOUS:
                self.m_Owner.OnBattleEvent(BattleCmd_pb2.BATTLE_EVENT_TYPE_CONTINUOUS_COUNTER_AWARD, dEventData)

    def AwardSetContinuousCounterValue(self, iCurValue):
        iCounterType = BattleCmd_pb2.COUNTER_TYPE_CONTINUOUS
        if iCounterType not in self.m_CounterData:
            self.m_CounterData[iCounterType] = 0
        iOldValue = self.m_CounterData[iCounterType]
        dCounterData = GetCounterData(iCounterType)
        iMaxValue = dCounterData["maxvalue"]
        if iCurValue > iMaxValue:
            iCurValue = iMaxValue
        if iCurValue < 0:
            iCurValue = 0
        iChange = iCurValue - iOldValue
        self.PureSetCounter(iCounterType, iCurValue, False)
        dEventData = {'计数器变化值':iChange,  '计数器类型':iCounterType}
        self.m_Owner.OnBattleEvent(BattleCmd_pb2.BATTLE_EVENT_TYPE_COUNTER_UPDATE, dEventData)

    def GetCounter(self, iCounterType):
        if iCounterType not in self.m_CounterData:
            return 0
        else:
            return self.m_CounterData[iCounterType]

    def SetCountersRecord(self, iCounterType):
        if iCounterType not in self.m_CounterRecord:
            self.m_CounterRecord[iCounterType] = []
        self.m_CounterRecord[iCounterType].append(self.GetCounter(iCounterType))

    def GetSelfAverageCounter(self, iCounterType):
        lstCounterValue = self.m_CounterRecord.get(iCounterType, [])
        iAverage = 0
        iTotal = 0
        for iValue in lstCounterValue:
            iTotal += iValue

        if len(lstCounterValue) > 0:
            iAverage = iTotal / len(lstCounterValue)
        return iAverage

    def DoClearLst(self, clearLst):
        for iCounterType in clearLst:
            self.m_Owner.PureSetCounterValue(iCounterType, 0, True)

    def OnScore(self):
        if not len(self.m_CounterData):
            return
        clearLst = []
        for iCounterType in self.m_CounterData.keys():
            dCounterData = GetCounterData(iCounterType)
            if dCounterData["isscoreclear"]:
                clearLst.append(iCounterType)

        self.DoClearLst(clearLst)

    def GetAllCounter(self):
        return self.m_CounterData

    def OnCounterDelta(self, iCounterType, iCounterValue, bIsServeState=False):
        self.m_Owner.OnCounterDelta(iCounterType, iCounterValue, bIsServeState)

    def ClearAllCounter(self):
        if not len(self.m_CounterData):
            return
        clearLst = list(self.m_CounterData.keys())
        self.DoClearLst(clearLst)

    def DoRelease(self):
        self.m_Owner = None
