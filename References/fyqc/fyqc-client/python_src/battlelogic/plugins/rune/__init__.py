# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\plugins\rune\__init__.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 2622 bytes
from base.protobufdata import NormalCmd_pb2, RuneCmd_pb2
from base.data import GetRunePropertyData

def OnBasePropertyRec(oRunePropertyData, iValue, dTypeValue):
    for iBasePropertyType in oRunePropertyData.m_PropertyType:
        if iBasePropertyType not in dTypeValue:
            dTypeValue[iBasePropertyType] = {}
        dValue = dTypeValue.get(iBasePropertyType)
        if oRunePropertyData.m_AddType not in dValue:
            dValue[oRunePropertyData.m_AddType] = 0
        dValue[oRunePropertyData.m_AddType] += iValue


def OnSkillRec(oRunePropertyData, iValue, dTypeValue):
    for iSkillID in oRunePropertyData.m_SkillIDList:
        if iSkillID not in dTypeValue:
            dTypeValue[iSkillID] = {}
        dValue = dTypeValue.get(iSkillID)
        if oRunePropertyData.m_AddType not in dValue:
            dValue[oRunePropertyData.m_AddType] = 0
        dValue[oRunePropertyData.m_AddType] += iValue


def OnCounterRec(oRunePropertyData, iValue, dTypeValue):
    if oRunePropertyData.m_CounterType not in dTypeValue:
        dTypeValue[oRunePropertyData.m_CounterType] = {}
    dValue = dTypeValue.get(oRunePropertyData.m_CounterType)
    if oRunePropertyData.m_AddType not in dValue:
        dValue[oRunePropertyData.m_AddType] = 0
    dValue[oRunePropertyData.m_AddType] += iValue


def OnHitActionRec(oRunePropertyData, iValue, dTypeValue):
    for iActionID in oRunePropertyData.m_HitActionIDList:
        if iActionID not in dTypeValue:
            dTypeValue[iActionID] = {}
        dValue = dTypeValue.get(iActionID)
        if oRunePropertyData.m_AddType not in dValue:
            dValue[oRunePropertyData.m_AddType] = 0
        dValue[oRunePropertyData.m_AddType] += iValue


def OnOtherRec(oRunePropertyData, iValue, dTypeValue):
    return


RUNE_PROPERTY_REC = {(RuneCmd_pb2.RUNE_PROPERTY_TYPE_PROPERTY): OnBasePropertyRec, 
 (RuneCmd_pb2.RUNE_PROPERTY_TYPE_SKILL_LEVEL): OnSkillRec, 
 (RuneCmd_pb2.RUNE_PROPERTY_TYPE_SKILL_RADIO): OnSkillRec, 
 (RuneCmd_pb2.RUNE_PROPERTY_TYPE_COUNTER): OnCounterRec, 
 (RuneCmd_pb2.RUNE_PROPERTY_TYPE_HITACTION_HITHEIGHT): OnHitActionRec, 
 (RuneCmd_pb2.RUNE_PROPERTY_TYPE_OTHER): OnOtherRec}

def OnRunePropertyRec(oPropertyData, dRuneProperty):
    global RUNE_PROPERTY_REC
    oRunePropertyData = GetRunePropertyData(oPropertyData.PropertyID)
    if not oRunePropertyData:
        return
    iRunePropertyType = oRunePropertyData.m_RunePropertyType
    if iRunePropertyType not in RUNE_PROPERTY_REC:
        return
    if iRunePropertyType not in dRuneProperty:
        dRuneProperty[iRunePropertyType] = {}
    func = RUNE_PROPERTY_REC.get(iRunePropertyType, None)
    if not func:
        return
    func(oRunePropertyData, oPropertyData.Value, dRuneProperty[iRunePropertyType])
