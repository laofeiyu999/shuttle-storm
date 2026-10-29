# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\plugins\prop\propcontainer.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 7985 bytes
from base.protobufdata import Common_pb2
from .propdata import CPropChangeData
from .defines import GetOnChangeFunc
from battlelogic.common.decorator import ClientOnly

class CPropContainer(object):

    def __init__(self, oOwner):
        self.m_PropDict = {}
        self.m_PropChangeDict = {}
        self.m_CurMaxDict = {}
        self.m_Owner = oOwner
        self.m_ClientPropChange = {}

    def GetPropValue(self, iPropType):
        if iPropType in self.m_CurMaxDict:
            return self.m_CurMaxDict[iPropType]
        else:
            return 0

    def ReCalcRiskInitPropValue(self, iPropType, iValue):
        iRes = iValue
        if self.m_Owner.GetMemberType() == Common_pb2.TEAM_MEMBER_TYPE_HOST:
            if iPropType in (Common_pb2.BATTLE_PROP_TYPE_RIGHT_RISK_LINE,):
                iRes = -iRes
        else:
            if iPropType in (Common_pb2.BATTLE_PROP_TYPE_LEFT_RISK_LINE, Common_pb2.BATTLE_PROP_TYPE_FRONT_RISK_LINE,
             Common_pb2.BATTLE_PROP_TYPE_BACK_RISK_LINE):
                iRes = -iRes
        return iRes

    def ReCalcRiskAdditionPropValue(self, iPropType, iValue):
        iRes = iValue
        if self.m_Owner.GetMemberType() == Common_pb2.TEAM_MEMBER_TYPE_HOST:
            if iPropType in (Common_pb2.BATTLE_PROP_TYPE_RIGHT_RISK_LINE, Common_pb2.BATTLE_PROP_TYPE_FRONT_RISK_LINE):
                iRes = -iRes
        else:
            if iPropType in (Common_pb2.BATTLE_PROP_TYPE_BACK_RISK_LINE, Common_pb2.BATTLE_PROP_TYPE_LEFT_RISK_LINE):
                iRes = -iRes
        return iRes

    def ChangeProp(self, iPropType, sKey, iAddValue, iMulValue):
        iAddValue = self.ReCalcRiskAdditionPropValue(iPropType, iAddValue)
        iMulValue = self.ReCalcRiskAdditionPropValue(iPropType, iMulValue)
        if iPropType not in self.m_PropChangeDict:
            self.m_PropChangeDict[iPropType] = {}
        else:
            dChangeDict = self.m_PropChangeDict[iPropType]
            if sKey not in dChangeDict:
                dChangeDict[sKey] = CPropChangeData(iAddValue, iMulValue)
            else:
                dChangeDict[sKey].Add(iAddValue, iMulValue)
        self.OnChange(iPropType)

    def CancelChangeProp(self, iPropType, sKey):
        if iPropType not in self.m_PropChangeDict:
            return
        dChangeDict = self.m_PropChangeDict[iPropType]
        if sKey not in dChangeDict:
            return
        del dChangeDict[sKey]
        self.OnChange(iPropType)

    def OnChange(self, iPropType):
        if not self.m_Owner:
            return
        else:
            iCurValue = 0
            iTrueAdd = 0
            iTrueMul = 0
            if iPropType in self.m_PropChangeDict:
                dChangeDict = self.m_PropChangeDict[iPropType]
                for _, oPropChangeData in dChangeDict.items():
                    iTrueAdd += oPropChangeData.m_AddValue
                    iTrueMul += oPropChangeData.m_MulValue

            iCurValue += iTrueAdd
            if iPropType in self.m_PropDict:
                propData = self.m_PropDict[iPropType]
                if propData.m_MaxMulValue != 0:
                    if iTrueMul > propData.m_MaxMulValue:
                        iTrueMul = propData.m_MaxMulValue
                if iTrueMul < propData.m_MinMulValue:
                    iTrueMul = propData.m_MinMulValue
                iCurValue = iCurValue + propData.m_InitValue
                iCurValue = iCurValue * (10000 + iTrueMul) // 10000
                if propData.m_MaxValue != 0:
                    if iCurValue > propData.m_MaxValue:
                        iCurValue = propData.m_MaxValue
                if iCurValue < propData.m_MinMulValue:
                    iCurValue = propData.m_MinMulValue
            iCurValue = int(iCurValue)
            self.m_CurMaxDict[iPropType] = iCurValue
            func = GetOnChangeFunc(iPropType)
            if func:
                func(self.m_Owner, iCurValue)
        self.m_Owner.OnPropDelta(iPropType, iCurValue)

    def InitProp(self, iPropType, oPropData):
        if iPropType in self.m_PropDict:
            return
        oPropData.m_InitValue = self.ReCalcRiskInitPropValue(iPropType, oPropData.m_InitValue)
        self.m_PropDict[iPropType] = oPropData
        self.OnChange(iPropType)

    def OnMemberTypeChange(self):
        for iPropType, oPropData in self.m_PropDict:
            oPropData.m_InitValue = self.ReCalcRiskInitPropValue(iPropType, oPropData.m_InitValue)
            self.OnChange(iPropType)

        for iPropType, dChangeDict in self.m_PropChangeDict.items():
            for sKey, oPropChangeData in dChangeDict.items():
                oPropChangeData.m_AddValue = self.ReCalcRiskAdditionPropValue(iPropType, oPropChangeData.m_AddValue)
                oPropChangeData.m_MulValue = self.ReCalcRiskAdditionPropValue(iPropType, oPropChangeData.m_MulValue)

            self.OnChange(iPropType)

    @ClientOnly
    def ClientPropChange(self, iPropType, iValue):
        self.m_ClientPropChange[iPropType] = iValue

    @ClientOnly
    def DoClientPropChange(self):
        bChanged = False
        for iPropType, iValue in self.m_ClientPropChange.items():
            iCurValue = self.GetPropValue(iPropType)
            if iCurValue == iValue:
                continue
            bChanged = True
            self.m_CurMaxDict[iPropType] = iValue

        self.m_ClientPropChange = {}
        return bChanged

    def ClearAllProp(self):
        propLst = list(self.m_CurMaxDict.keys())
        self.m_PropDict = {}
        self.m_PropChangeDict = {}
        self.m_CurMaxDict = {}
        for iPropType in propLst:
            self.m_Owner.OnPropDelta(iPropType, 0)

    def DoRelease(self):
        self.m_Owner = None
