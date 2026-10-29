# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\plugins\rune\runemanager.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 2430 bytes
from . import OnRunePropertyRec
from base.protobufdata import BattleCmd_pb2, Common_pb2, NormalCmd_pb2, RuneCmd_pb2
from base.data import GetRunePropertyData

class CRuneManager(object):

    def __init__(self, oOwner):
        self.m_Owner = oOwner
        self.m_RuneData = Common_pb2.RuneData()
        self.m_RuneID = None
        self.m_RuneProperty = {}
        self.m_RunePropertyData = {}

    def InitRuneData(self):
        if not self.m_RuneData:
            return
        for oPropertyData in self.m_RuneData.PropertyData:
            iID = oPropertyData.PropertyID
            iValue = oPropertyData.Value
            self.m_RunePropertyData[iID] = iValue
            OnRunePropertyRec(oPropertyData, self.m_RuneProperty)

    def SetRuneData(self, oRuneData):
        if not oRuneData:
            return
        sBuffer = oRuneData.SerializeToString()
        self.m_RuneData.ParseFromString(sBuffer)
        self.m_RuneID = (oRuneData.RuneID.FirstID, oRuneData.RuneID.SecID, oRuneData.RuneID.ThirdID)

    def GetRuneEffectValue(self, iRunePropertyType, iType):
        dTypeValue = self.m_RuneProperty.get(iRunePropertyType, {})
        dValue = dTypeValue.get(iType, {})
        iValue = dValue.get(RuneCmd_pb2.RUNE_PROPERTY_VALUE_TYPE_NORMAL, 0)
        return iValue

    def GetRuneEffectMulValue(self, iRunePropertyType, iType):
        dTypeValue = self.m_RuneProperty.get(iRunePropertyType, {})
        dValue = dTypeValue.get(iType, {})
        iMulValue = dValue.get(RuneCmd_pb2.RUNE_PROPERTY_VALUE_TYPE_TEN_THOUSAND, 0)
        return iMulValue

    def GetRunePorpertyValue(self, iRunePorpertyID):
        return self.m_RunePropertyData.get(iRunePorpertyID, 0)

    def GetRuneProperty(self):
        return self.m_RunePropertyData

    def GetRuneTableID(self):
        return self.m_RuneData.RuneTableID

    def FormatRuneData(self, oData):
        if not self.m_RuneData:
            return
        oData.RuneData.CopyFrom(self.m_RuneData)

    def DoRelease(self):
        self.m_Owner = None
