# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\plugins\state\statevalue.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 15499 bytes
from battlelogic.common.defines import GetEnemyMemberType
from base.data import GetHitActionData, GetStateData
from battlelogic.common.defines import Frame2Time, SECOND_SCALE
from base.protobufdata import BattleCmd_pb2, Common_pb2

def StateGetSkillParamValue(oObject, oState, sParam):
    return oObject.GetSkillParamValue(sParam)


def StateGetSkillLevel(oObject, oState, iSkillID):
    return oObject.GetSkillLevel(iSkillID)


def StateGetPropValue(oObject, oState, iPropType):
    return oObject.GetPropValue(iPropType)


def StateCheckExistState(oObject, oState, iStateSID):
    return oObject.HasState(iStateSID)


def StateGetSelfScore(oObject, oState):
    return oObject.GetScene().GetTeamScore(oObject.GetMemberType())


def StateGetEnemyScore(oObject, oState):
    return oObject.GetScene().GetTeamScore(GetEnemyMemberType(oObject.GetMemberType()))


def StateGetHitBadmintonActionID(oObject, oState):
    oScene = oObject.GetScene()
    oBadminton = oScene.GetFirstBadminton()
    oHitArgs = oBadminton.GetHitBadmintonArgs()
    iACtionSID = 0
    if oHitArgs:
        iACtionSID = oHitArgs.m_AtkActionSID
    return iACtionSID


def StateGetHitBadmintonActionType(oObject, oState):
    if oObject.GetSceneObjectType() == BattleCmd_pb2.SCENE_OBJECT_TYPE_BADMINTON:
        oHitArgs = oObject.GetHitBadmintonArgs()
    else:
        oHitArgs = oObject.m_DoHitAction.GetHitBadmintonArgs()
    if not oHitArgs:
        oScene = oObject.GetScene()
        oBadminton = oScene.GetFirstBadminton()
        oHitArgs = oBadminton.GetHitBadmintonArgs()
    iACtionSID = 0
    if oHitArgs:
        iACtionSID = oHitArgs.m_AtkActionSID
        oData = GetHitActionData(iACtionSID)
        if oData:
            return oData.m_HitActionType
    return 0


def StateGetHitActionTypeValue(oObject, oState, iHitActionType):
    return iHitActionType


def StateGetCaster(oObject, oState):
    return oState.GetCasterID()


def StateGetCasterSkillParamValue(oObject, oState, sParam):
    iCasterID = oState.GetCasterID()
    oCaster = oObject.GetScene().GetObject(iCasterID)
    if not oCaster:
        return 0
    else:
        return oCaster.GetSkillParamValue(sParam)


def StateGetCasterPropValue(oObject, oState, iPropType):
    iCasterID = oState.GetCasterID()
    oCaster = oObject.GetScene().GetObject(iCasterID)
    if not oCaster:
        return 0
    else:
        return oCaster.GetPropValue(iPropType)


def StateGetEventParamValue(oObject, oState, dEventData, sParamName):
    if not dEventData:
        return
    else:
        return dEventData.get(sParamName, None)


def StateGetCurHitActionID(oObject, oState):
    oHitData = oObject.GetHitData()
    if oHitData:
        return oHitData.m_ID
    else:
        return 0


def StateGetRandomNum(oObject, oState, sName):
    return oState.GetRandomCache(sName)


def StateGetCounterTypeValue(oObject, oState, iCounterType):
    return iCounterType


def StateGetCounterValue(oObject, oState, iCounterType):
    return oObject.GetCounterValue(iCounterType)


def StateGetHorzDistFromBadminton(oObject, oState):
    dDistance = oObject.GetDistanceFromBadminton()
    return dDistance["Horizontal"]


def StateGetVertDistFromBadminton(oObject, oState):
    dDistance = oObject.GetDistanceFromBadminton()
    return dDistance["Vertical"]


def StateGetMoveDirAngleToBADDroppos(oObject, oState):
    return oObject.GetMoveDirAngleToBADDroppos()


def StateGetNormalMaxScore(oObject, oState):
    return oObject.GetScene().GetNormalMaxScore()


def StateJudgeCurHitKey(oObject, oState, iHitKey):
    if oObject.GetSceneObjectType() == BattleCmd_pb2.SCENE_OBJECT_TYPE_BADMINTON:
        oHitArgs = oObject.GetHitBadmintonArgs()
    else:
        oHitArgs = oObject.m_DoHitAction.GetHitBadmintonArgs()
    if oHitArgs:
        iCurHitKey = oHitArgs.m_HitKey
    else:
        oScene = oObject.GetScene()
        oBadminton = oScene.GetFirstBadminton()
        iCurHitKey = oBadminton.GetHitKey()
    return iCurHitKey == iHitKey


def StateJudgeCurAttacker(oObject, oState, iAttackerType):
    oScene = oObject.GetScene()
    oBadminton = oScene.GetFirstBadminton()
    iAttackerID = oBadminton.GetAttackerID()
    if not iAttackerID:
        return False
    else:
        objLst = oObject.GetTargetLst(iAttackerType)
        for obj in objLst:
            if obj.m_ID == iAttackerID:
                return True

        return False


def StateGetNetDistance(oObject, oState):
    return abs(oObject.GetPos().m_Z)


def StateJudgeLeftRightArea(oObject, oState, iArea):
    return oObject.JudgeLeftRightArea(iArea)


def StateGetCurCurveDataFullTime(oObject, oState):
    oScene = oObject.GetScene()
    oBadminton = oScene.GetFirstBadminton()
    if oBadminton.m_CurveData:
        return oBadminton.m_CurveData.m_FullTime * SECOND_SCALE
    else:
        return 0


def StateGetClosedIntervalRandom(oObject, oState, sName, iLeft, iRight):
    return oState.GetRandomCache(sName, iLeft, iRight)


def StateJudgeCouldHitBadminton(oObject, oState):
    return oObject.CouldHitBadminton()


def StateJudgeFinishedNewbieGuide(oObject, oState, iNewbieGuideID):
    oScene = oObject.GetScene()
    return oScene.GetHadFinishedGuide(iNewbieGuideID)


def StateGetSelfQuarterScore(oObject, oState):
    return oObject.GetScene().GetQuarterScore(oObject.GetMemberType())


def StateGetEnemyQuarterScore(oObject, oState):
    return oObject.GetScene().GetQuarterScore(GetEnemyMemberType(oObject.GetMemberType()))


def StateJudgeHorizontalDisFromTeammates(oObject, oState, iDistance):
    return oObject.JudgeHorizontalDisFromTeammates(iDistance)


def StateJudgeIsInStarMarkRange(oObject, oState):
    return oObject.IsInStarMarkRange()


def StateJudgeSceneObjectType(oObject, oState, iSceneObjectType):
    if oObject.GetSceneObjectType() == iSceneObjectType:
        return True
    else:
        return False


def StateGetGameDuration(oObject, oState):
    oScene = oObject.GetScene()
    return oScene.GetGameDuration() * 100


def StateHasStateType(oObject, oState, iType):
    return oObject.m_StateManager.HasStateType(iType)


def StateGetRuneAddition(oObject, oState, iRunePorpertyID):
    return oObject.m_RuneManager.GetRunePorpertyValue(iRunePorpertyID)


def StateGetTechExamTargetValue(oObject, oState, iTargetType):
    oScene = oObject.GetScene()
    return oScene.GetTargetValue(iTargetType)


def StateJudgeSelfIsWinner(oObject, oState):
    oScene = oObject.GetScene()
    return oObject.m_ID == oScene.m_MVPScore.GetWinner()


def StateJudgeSelfIsAssister(oObject, oState):
    oScene = oObject.GetScene()
    return oObject.m_ID == oScene.m_MVPScore.GetAssister()


def StateGetBadmintonVertDist(oObject, oState):
    oScene = oObject.GetScene()
    oBadminton = oScene.GetFirstBadminton()
    return abs(oBadminton.GetPos().m_Z)


def StateJudgeGameState(oObject, oState, iGameState):
    oScene = oObject.GetScene()
    return oScene.GetGameState() == iGameState


def StateJudgeCurKeyType(oObject, oState, iHitKey):
    return oObject.GetHitKey() == iHitKey


def StateJudgeLastPropertyBoxTrigger(oObject, oState, iType):
    oScene = oObject.GetScene()
    iTriggerID = oScene.GetLastPropertyBoxTrigger()
    if not iTriggerID:
        return False
    else:
        objLst = oObject.GetTargetLst(iType)
        for obj in objLst:
            if obj.m_ID == iTriggerID:
                return True

        return False


def StateJudgeActionCD(oObject, oState):
    oScene = oObject.GetScene()
    iCurEffectiveFrame = oScene.GetCurEffectiveFrame()
    if oObject.m_ActionCDManager.IsInCD(BattleCmd_pb2.HIT_KEY_KEY_ZD, iCurEffectiveFrame):
        return True
    else:
        return False


def StateGetHorzDisFromBadmintonDropPos(oObject, oState):
    dDistance = oObject.GetDistanceFromBadmintonDropPos()
    return dDistance["Horizontal"]


def StateGetVertDisFromBadmintonDropPos(oObject, oState):
    dDistance = oObject.GetDistanceFromBadmintonDropPos()
    return dDistance["Vertical"]


def StateGetLastScoreTeam(oObject, oState, iSelectTeamType):
    oScene = oObject.GetScene()
    iLastScoreTeam = oScene.GetLastScoreTeam()
    if iSelectTeamType == BattleCmd_pb2.BORN_AREA_TYPE_SELF:
        iMemberType = oObject.GetMemberType()
        if iLastScoreTeam == iMemberType:
            return True
    elif iSelectTeamType == BattleCmd_pb2.BORN_AREA_TYPE_ENEMY:
        pass
    iMemberType = GetEnemyMemberType(oObject.GetMemberType())
    if iLastScoreTeam == iMemberType:
        return True
    return False


def StateGetBombExplodeProgress(oObject, oState):
    oScene = oObject.GetScene()
    oBadminton = oScene.GetFirstBadminton()
    return oBadminton.GetExplodeProgress()


def StateGetEffectTime(oObject, oState):
    iEffectTime = oState.m_EndFrame - oState.m_StartFrame
    return Frame2Time(iEffectTime)


def StateGetPassTime(oObject, oState):
    oStateData = GetStateData(oState.m_ID)
    if oStateData.m_IsImmuneBulletTime:
        iPassTime = oObject.m_Scene.GetCurEffectiveFrame() - oState.m_StartFrame
    else:
        iPassTime = oObject.GetCurEffectiveFrame() - oState.m_StartFrame
    return Frame2Time(iPassTime)


def StateGetTechnicalExamWinTimes(oObject, oState):
    oScene = oObject.GetScene()
    if oScene.m_GameMode != Common_pb2.GAME_MODE_TECHNICAL_EXAM:
        return 0
    else:
        return oScene.m_TechnicalExamWinTimes


def StateGetPersonalRecordValue(oObject, oState, iType):
    return oObject.GetRecord(iType)
