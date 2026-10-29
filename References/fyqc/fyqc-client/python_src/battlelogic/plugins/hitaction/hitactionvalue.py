# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\plugins\hitaction\hitactionvalue.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 5084 bytes
from battlelogic.battlebase.dmath import RAD2DEG
from battlelogic.battlebase.dvec3 import CDVec3
from base.protobufdata import Common_pb2
from battlelogic.common.defines import RANGE_HIT, RANGE_STRIDE, RANGE_RETRIEVE
from battlelogic.common.defines import GetRangeDirPropType, IsServer
from battlelogic.common.debug import LogWarning
import math

def BadmintonHeight(oObject, oHitAction):
    oBadminton = oObject.GetScene().GetFirstBadminton()
    if oObject.m_PreJudgeFrame:
        oPos = oBadminton.GetPreJudgePos(oObject.m_PreJudgeFrame)
    else:
        oPos = oBadminton.GetPos()
    return oPos.m_Y


def BadmintonDistance(oObject, oHitAction):
    dDistance = oObject.GetDistanceFromBadminton(True)
    return dDistance["Horizontal"]


def BadmintonAngle(oObject, oHitAction):
    oBadminton = oObject.GetScene().GetFirstBadminton()
    return oBadminton.GetObjectToMeAngle(oObject)


def GetHitRangeTolerance(oObject, oHitAction):
    return oObject.GetHitRangeTolerance()


def GetHitRangeDirValue(oObject, oHitAction):
    oBadminton = oObject.GetScene().GetFirstBadminton()
    fAngle = oBadminton.GetObjectToMeAngle(oObject)
    iPropType = GetRangeDirPropType(fAngle, RANGE_HIT)
    if iPropType is None:
        return 0
    else:
        return oObject.GetPropValue(iPropType)


def GetStrideRangeDirValue(oObject, oHitAction):
    oBadminton = oObject.GetScene().GetFirstBadminton()
    fAngle = oBadminton.GetObjectToMeAngle(oObject)
    iPropType = GetRangeDirPropType(fAngle, RANGE_STRIDE)
    if iPropType is None:
        return 0
    else:
        return oObject.GetPropValue(iPropType)


def GetRetrieveRangeDirValue(oObject, oHitAction):
    oBadminton = oObject.GetScene().GetFirstBadminton()
    fAngle = oBadminton.GetObjectToMeAngle(oObject)
    iPropType = GetRangeDirPropType(fAngle, RANGE_RETRIEVE)
    if iPropType is None:
        return 0
    else:
        return oObject.GetPropValue(iPropType)


def GetNetDistance(oObject, oHitAction):
    return abs(oObject.GetPos().m_Z)


def GetBatDistance(oObject, oHitAction):
    oPos = oObject.GetFixStartPos(oObject.m_DoHitAction.m_HitAction)
    oBadminton = oObject.GetScene().GetFirstBadminton()
    oBadmintonPos = oBadminton.GetPos()
    return oPos.Distance(oBadmintonPos)


def CouldHitBadminton(oObject, oHitAction):
    return oObject.CouldHitBadminton()


def IsThisBattleModel(oObject, oHitAction, iBattleMode):
    oScene = oObject.GetScene()
    return oScene.GetBattleMode() == iBattleMode


def IsWithJoystickDir(oObject, oHitAction):
    oJoystickDir = oObject.GetMoveDir()
    if oJoystickDir.IsZero():
        return False
    else:
        return True


def ActionGetRandomNum(oObject, oHitAction, sName):
    iVal = oHitAction.GetRandomCache(sName)
    if oObject.m_Scene.GetTestShowRandom():
        LogWarning("动作取得万分比随机数(%s)=%d" % (sName, iVal))
    return iVal


def ActionGetHitPassFrame(oObject, oHitAction):
    return oObject.m_DoHitAction.GetHitPassFrame()


def ActionGetCounterValue(oObject, oHitAction, iCounterType):
    return oObject.GetCounterValue(iCounterType)


def ActionJudgeHasState(oObject, oHitAction, iStateSID):
    return oObject.HasState(iStateSID)


def HitActionGetPropValue(oObject, oHitAction, iPropType):
    return oObject.GetPropValue(iPropType)


def ActionGetRuneAddition(oObject, oHitAction, iRunePorpertyID):
    return oObject.m_RuneManager.GetRunePorpertyValue(iRunePorpertyID)


def ActionJudgeGameState(oObject, oHitAction, iGameState):
    oScene = oObject.GetScene()
    return oScene.GetGameState() == iGameState


def ActionGetSkillLevel(oObject, oHitAction, iSkillID):
    return oObject.GetSkillLevel(iSkillID)
