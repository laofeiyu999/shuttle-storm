# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\config\courtconfig.py
# Compiled at: 2023-04-06 17:07:52
# Size of source mod 2**32: 3561 bytes
from base.data import GetModelData, GetCourtData
from base.protobufdata import Common_pb2
from battlelogic.common.debug import LogWarning
from base.protobufdata import BattleCmd_pb2

def CorrectPos(iMemberType, oPos, iModelID, bNeedServeCorrect, iPosIndex, iCourtSID, iBattleMode):
    oModelData = GetModelData(iModelID)
    boundExternPosDict = oModelData.m_Bounds["extern"]
    oCourtData = GetCourtData(iCourtSID)
    dCourtAreaCornerPos = None
    if bNeedServeCorrect:
        if iBattleMode == Common_pb2.BATTLE_MODE_SINGLE:
            dCourtAreaCornerPos = oCourtData.m_SingleServeMoveableDict[iMemberType][iPosIndex]
        else:
            dCourtAreaCornerPos = oCourtData.m_DualServeMoveableDict[iMemberType][iPosIndex]
    else:
        dCourtAreaCornerPos = oCourtData.m_MoveableCornerPosDict[iMemberType]
    for index, sKey in ((0, 'X'), (2, 'Z')):
        if oPos[index] < dCourtAreaCornerPos["MinPos"][sKey] + boundExternPosDict[sKey]:
            oPos[index] = dCourtAreaCornerPos["MinPos"][sKey] + boundExternPosDict[sKey]
        if oPos[index] > dCourtAreaCornerPos["MaxPos"][sKey] - boundExternPosDict[sKey]:
            oPos[index] = dCourtAreaCornerPos["MaxPos"][sKey] - boundExternPosDict[sKey]

    return oPos


def GetNetHeight(iCourtSID):
    oCourtData = GetCourtData(iCourtSID)
    return oCourtData.m_NetHeight


def GetAreaType(iMemberType, oPos):
    iX = oPos.m_X
    if iMemberType == Common_pb2.TEAM_MEMBER_TYPE_HOST:
        if iX <= 0:
            return BattleCmd_pb2.AREA_TYPE_LEFT
        return BattleCmd_pb2.AREA_TYPE_RIGHT
    else:
        if iX >= 0:
            return BattleCmd_pb2.AREA_TYPE_LEFT
        return BattleCmd_pb2.AREA_TYPE_RIGHT
