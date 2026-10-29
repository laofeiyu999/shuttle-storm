# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\common\logicutil.py
# Compiled at: 2023-04-06 17:07:52
# Size of source mod 2**32: 6460 bytes
from base.protobufdata import BattleCmd_pb2, Common_pb2
from battlelogic.battlebase.dvec3 import CDVec3
from battlelogic.common.debug import LogWarning, TraceFunc
from battlelogic.common.defines import INF_TIME, FRAME
import math

def CalcMoveSpeed(oMoveDir, iMemberType, oSpeedValue, fXLastSpeed, fZLastSpeed, oDropPosAngle):
    fSpeed = 0
    fXSpeed = 0
    fZSpeed = 0
    fXAxis = oMoveDir.m_X
    fZAxis = oMoveDir.m_Z
    if fXAxis == 0:
        if fZAxis == 0:
            return (0, 0, 0, 0, 0, 0)
        oFrom = CDVec3(fXAxis, 0, fZAxis)
        oTo = CDVec3.Right()
        fRadian = CDVec3.Radian(oFrom, oTo)
        fXAxisSpeed = 0
        fZAxisSpeed = 0
        if iMemberType == Common_pb2.TEAM_MEMBER_TYPE_HOST:
            fXAxisSpeed = oSpeedValue.m_SpeedRight if fXAxis >= 0 else oSpeedValue.m_SpeedLeft
            fZAxisSpeed = oSpeedValue.m_SpeedForward if fZAxis >= 0 else oSpeedValue.m_SpeedBack
    else:
        fXAxisSpeed = oSpeedValue.m_SpeedLeft if fXAxis >= 0 else oSpeedValue.m_SpeedRight
        fZAxisSpeed = oSpeedValue.m_SpeedBack if fZAxis >= 0 else oSpeedValue.m_SpeedForward
    fMoveSpeed = fXAxisSpeed * fZAxisSpeed / math.sqrt(math.pow(fXAxisSpeed * math.sin(fRadian), 2) + math.pow(fZAxisSpeed * math.cos(fRadian), 2)) / FRAME
    fDistance = math.sqrt(fXAxis * fXAxis + fZAxis * fZAxis)
    if oSpeedValue.m_DropPosSpeedMul and oSpeedValue.m_DropPosAngle:
        if not oDropPosAngle.IsZero():
            fToDropPosAngle = CDVec3.Angle(oDropPosAngle, oMoveDir)
            if fToDropPosAngle > oSpeedValue.m_DropPosAngle:
                fToDropPosAngle = 360 - fToDropPosAngle
            if fToDropPosAngle <= oSpeedValue.m_DropPosAngle:
                fRadio = (oSpeedValue.m_DropPosAngle - fToDropPosAngle) / oSpeedValue.m_DropPosAngle
                fSpeedMul = (100 + oSpeedValue.m_DropPosSpeedMul * fRadio) / 100
                fMoveSpeed = fMoveSpeed * fSpeedMul
    fXMaxSpeed = fMoveSpeed * fXAxis / fDistance
    fZMaxSpeed = fMoveSpeed * fZAxis / fDistance
    fXMaxSpeed = int(fXMaxSpeed)
    fZMaxSpeed = int(fZMaxSpeed)
    fXAcceleration = 0
    fZAcceleration = 0
    fXSpeed = fXMaxSpeed
    fZSpeed = fZMaxSpeed
    return (
     fXSpeed, fZSpeed, fXAcceleration, fZAcceleration, fXMaxSpeed, fZMaxSpeed)


def CalcStopSpeed(iAcceleration, fXLastSpeed, fZLastSpeed):
    fAcceleration = iAcceleration / (FRAME * FRAME)
    fXMaxSpeed = 0
    fZMaxSpeed = 0
    iDurationFrame = 0
    fXAcceleration = 0
    fZAcceleration = 0
    if fXLastSpeed != 0:
        if fXLastSpeed > 0:
            fXAcceleration = -fAcceleration
        else:
            fXAcceleration = fAcceleration
        iDurationFrame = max(iDurationFrame, int(abs(fXLastSpeed) / fAcceleration))
    if fZLastSpeed != 0:
        if fZLastSpeed > 0:
            fZAcceleration = -fAcceleration
        else:
            fZAcceleration = fAcceleration
        iDurationFrame = max(iDurationFrame, int(abs(fZLastSpeed) / fAcceleration))
    return (
     fXLastSpeed, fZLastSpeed, fXAcceleration, fZAcceleration, fXMaxSpeed, fZMaxSpeed, iDurationFrame)


def IsMoveBySystem(iMoveType):
    if iMoveType in (BattleCmd_pb2.MOVE_TYPE_AUTO_MOVE, BattleCmd_pb2.MOVE_TYPE_WINK_MOVE):
        return True
    else:
        return False


def AdjustDirByMemberType(oVec3, iMemberType):
    if iMemberType == Common_pb2.TEAM_MEMBER_TYPE_GUEST:
        return -oVec3
    else:
        return oVec3


def GetOriginalDirByMemberType(oVec3, iMemberType):
    if iMemberType == Common_pb2.TEAM_MEMBER_TYPE_GUEST:
        return -oVec3
    else:
        return oVec3


def GetInitFacing(iMemberType):
    if iMemberType == Common_pb2.TEAM_MEMBER_TYPE_HOST:
        return CDVec3.Forward()
    else:
        if iMemberType == Common_pb2.TEAM_MEMBER_TYPE_GUEST:
            return CDVec3.Back()
        return CDVec3.Zero()


def IsInHorizontalRange(oStartPos, oEndPos, fRangeRadius):
    oStartXZ = CDVec3(oStartPos.m_X, 0, oStartPos.m_Z)
    oEndXZ = CDVec3(oEndPos.m_X, 0, oEndPos.m_Z)
    if oStartXZ.Distance(oEndXZ) > fRangeRadius:
        return False
    else:
        return True


def ConvertHitDirToDirType(oHitDir, iTeamMemberType):
    fXAxis = oHitDir.m_X
    if iTeamMemberType == Common_pb2.TEAM_MEMBER_TYPE_GUEST:
        fXAxis = -fXAxis
    if fXAxis == 0:
        return BattleCmd_pb2.BADMINTON_OUT_DIR_NONE
    else:
        if fXAxis > 0:
            return BattleCmd_pb2.BADMINTON_OUT_DIR_RIGHT
        return BattleCmd_pb2.BADMINTON_OUT_DIR_LEFT


def GetXAxisByDirType(iOutType, iTeamMemberType):
    fXAxis = 0
    if iOutType == BattleCmd_pb2.BADMINTON_OUT_DIR_LEFT:
        fXAxis = -1
    else:
        if iOutType == BattleCmd_pb2.BADMINTON_OUT_DIR_RIGHT:
            fXAxis = 1
    if iTeamMemberType == Common_pb2.TEAM_MEMBER_TYPE_GUEST:
        fXAxis = -fXAxis
    return fXAxis


def ConvertDirTypeToHitDir(iOutType, iTeamMemberType):
    fXAxis = GetXAxisByDirType(iOutType, iTeamMemberType)
    oDir = CDVec3(fXAxis, 0, 0)
    return oDir
