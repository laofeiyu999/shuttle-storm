# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\plugins\hitaction\hitactionfunc.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 8184 bytes
from base.data import GetHitActionData
from base.data import GetStateData
from battlelogic.battlebase.dvec3 import CDVec3
from base.protobufdata import BattleCmd_pb2, Common_pb2
from .defines import GetValidHitKey
from battlelogic.common.defines import HITACTION_PREJUDGE_FRAME
from base.protobufdata import Common_pb2
from battlelogic.common.debug import LogWarning, LogError
from battlelogic.common.defines import GetEnemyMemberType
from battlelogic.plugins.state import CAddStateArgs
from battlelogic.common.decorator import NoPrediction

def AutoHit(oObject, oHitAction, iDefaultHitKey):
    oObject.DoAutoHitBadminton()


def HitActionGetSkillParamValue(oObject, oState, sParam):
    return oObject.GetSkillParamValue(sParam)


def Hit(oObject, oHitAction):
    oObject.DoHitBadminton()


@NoPrediction
def ActionAddState(oObject, oHitAction, iStateSID, iEffectFrame, iSelectObjectType, iEffectHit):
    oStateData = GetStateData(iStateSID)
    oAddStateArgs = CAddStateArgs(iStateSID)
    oAddStateArgs.m_EffectFrame = iEffectFrame
    oAddStateArgs.m_EffectHit = iEffectHit
    oAddStateArgs.m_SelectObjectType = iSelectObjectType
    oAddStateArgs.m_CasterID = oObject.m_ID
    oAddStateArgs.m_CasterSkillSID = oHitAction.GetSkillSID()
    oAddStateArgs.m_IsImmuneBulletTime = oStateData.m_IsImmuneBulletTime
    oObject.AddState(oAddStateArgs)


@NoPrediction
def ActionRemoveState(oObject, oHitAction, iStateSID):
    oObject.DoRemoveState(iStateSID)


def WinkMoveToHit(oObject, oHitAction, iMoveMaxDistance, iHitDistance, iHitHeight, fHitAngle, iStartFrame):
    oJoystickDir = oObject.GetHitData().m_MoveDir
    oScene = oObject.GetScene()
    if oJoystickDir.IsZero():
        oScene.SendWarningLog("Wink Move Dir None")
        return
    else:
        oBadminton = oScene.GetFirstBadminton()
        oActionData = GetHitActionData(oHitAction.m_ID)
        iEndFrame = oActionData.m_ActionTime
        oPos = oObject.GetPos()
        iMoveDistance = iMoveMaxDistance + iHitDistance
        fJoyStickAngle = CDVec3.DirAngle(oJoystickDir)
        oTargetPos = None
        iWinkFrame = 0
        for iFrame in range(iStartFrame, iEndFrame):
            oBadmintonPos = oBadminton.GetPreJudgePos(iFrame + HITACTION_PREJUDGE_FRAME)
            iBadmintonDistance = oPos.HorizontalDistance(oBadmintonPos)
            if iMoveDistance < iBadmintonDistance:
                pass
            else:
                iBadmintonHeight = oBadmintonPos.m_Y
                if iHitHeight < iBadmintonHeight:
                    pass
                else:
                    fBadmintonAngle = oBadminton.GetObjectToMePreAngle(oObject, iFrame + HITACTION_PREJUDGE_FRAME)
                    if fHitAngle < abs(fBadmintonAngle - fJoyStickAngle):
                        pass
                    elif oObject.GetMemberType() == Common_pb2.TEAM_MEMBER_TYPE_HOST:
                        oTargetPos = CDVec3(oBadmintonPos.m_X, 0, oBadmintonPos.m_Z - 50)
                    else:
                        oTargetPos = CDVec3(oBadmintonPos.m_X, 0, oBadmintonPos.m_Z + 50)
                    iWinkFrame = iFrame
                    break

        oMoveDir = oJoystickDir
        if oTargetPos:
            oMoveDir = oTargetPos - oPos
        else:
            iWinkFrame = oActionData.m_ActionTime
    fMagnitude = oMoveDir.Magnitude()
    oTargetPos = oPos + oMoveDir * (iMoveMaxDistance / fMagnitude)
    oMoveVec = oTargetPos - oPos
    iCurFrame = oScene.GetCurFrame()
    oObject.SetFacing(oMoveDir)
    oObject.WinkMove(oMoveVec.m_X, oMoveVec.m_Z, iWinkFrame)


@NoPrediction
def LockBadminton(oObject, oHitAction):
    oScene = oObject.GetScene()
    oBadminton = oScene.GetFirstBadminton()
    if oObject.m_PreJudgeFrame:
        oPreJudgePos = oBadminton.GetPreJudgePos(oObject.m_PreJudgeFrame)
        oBadminton.SetPos(oPreJudgePos)
    oBadminton.SetLockerID(oObject.m_ID)


def ResetBadmintonPos(oObject, oHitAction, iOffsetX, iOffsetY, iOffsetZ):
    oObject.DoResetBadmintonPos(iOffsetX, iOffsetY, iOffsetZ)


@NoPrediction
def ActionAddMonster(oObject, oHitAction, iMonsterSID, iBornAreaType, iEffectFrame):
    oScene = oObject.GetScene()
    oMonster = oScene.CreateMonster(iMonsterSID, oObject)
    iMemberType = oObject.GetMemberType()
    if iBornAreaType == BattleCmd_pb2.BORN_AREA_TYPE_ENEMY:
        iMemberType = GetEnemyMemberType(iMemberType)
    oBornPos = oScene.GetCourtRandPos(iMemberType)
    oMonster.SetPos(oBornPos, True)
    if iEffectFrame:
        iEndFrame = oScene.GetCurEffectiveFrame() + iEffectFrame
        oMonster.SetEndFrame(iEndFrame)


def ChooseNormalCurve(oObject, oHitAction, iCurveID):
    return iCurveID


def RandChooseNormalCurve(oObject, oHitAction, iValueLst):
    oScene = oObject.GetScene()
    iIndex = oScene.RandomBetween(0, len(iValueLst))
    iCurveID = iValueLst[iIndex]
    return iCurveID


def ActionSetCounterValue(oObject, oHitAction, iCounterType, iCurValue):
    oObject.SetCounterValue(iCounterType, iCurValue)


def ChooseTrunAroundCurve(oObject, oHitAction, iCurveID):
    return iCurveID


def ChooseParabolaDownCurve(oObject, oHitAction, iCurveID):
    return iCurveID


def ChooseStraightDownCurve(oObject, oHitAction, iCurveID):
    return iCurveID


@NoPrediction
def ActionAddSelfIdolum(oObject, oHitAction, iStateSID, iEffectFrame):
    oScene = oObject.GetScene()
    allIdolumLst = oScene.GetAllIdolum()
    for oIdolum in allIdolumLst:
        if oIdolum.m_OwnerID == oObject.m_ID:
            oIdolum.SetDelFlag()

    oIdolum = oScene.CreateIdolum(oObject.m_ID)
    if iEffectFrame:
        iEndFrame = oObject.GetCurEffectiveFrame() + iEffectFrame
        oIdolum.SetEndFrame(iEndFrame)
    oAddStateArgs = CAddStateArgs(iStateSID)
    oAddStateArgs.m_CasterID = oObject.m_ID
    oIdolum.DoAddState(oAddStateArgs)


def ChooseNormalFakeDropCurve(oObject, oHitAction, iCurveID):
    return iCurveID
