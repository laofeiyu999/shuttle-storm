# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\plugins\state\statefunc.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 19390 bytes
from battlelogic.battlebase.dfunctor import CDFunctor
from base.protobufdata import BattleCmd_pb2
from base.data import GetStateData
from battlelogic.battlebase.dvec3 import CDVec3
from base.protobufdata import Common_pb2
from battlelogic.common.debug import LogWarning, LogError
from battlelogic.common.defines import FRAME
from battlelogic.plugins.state import CAddStateArgs
from battlelogic.common.decorator import NoPrediction

@NoPrediction
def StateChangePropValue(oObject, oState, iPropType, iAddValue, iMulValue):
    sKey = oState.SrcKey()
    oState.RecChangeProp(iPropType)
    oObject.ChangeProp(iPropType, sKey, iAddValue, iMulValue)


def StateListenEventCallBackScript(oObject, oState, iEventType, iCallBackIndex):
    sSrcKey = oState.SrcKey()
    oListenFunc = CDFunctor(oState.DoCallBackScript, iCallBackIndex)
    oObject.AddBattleListen(iEventType, sSrcKey, oListenFunc)


@NoPrediction
def StateAddState(oObject, oState, iStateSID, iEffectFrame, iSelectObjectType, iEffectHit):
    oStateData = GetStateData(iStateSID)
    oAddStateArgs = CAddStateArgs(iStateSID)
    oAddStateArgs.m_EffectFrame = iEffectFrame
    oAddStateArgs.m_EffectHit = iEffectHit
    oAddStateArgs.m_SelectObjectType = iSelectObjectType
    oAddStateArgs.m_CasterID = oState.GetCasterID()
    oAddStateArgs.m_CasterSkillSID = oState.m_CasterSkillSID
    oAddStateArgs.m_IsImmuneBulletTime = oStateData.m_IsImmuneBulletTime
    oObject.AddState(oAddStateArgs)


@NoPrediction
def StateRemoveState(oObject, oState, iStateSID, iSelectObjectType):
    oStateData = GetStateData(oState.m_ID)
    iCasterStateType = oStateData.m_Type
    oObject.RemoveState(iStateSID, iSelectObjectType, iCasterStateType)


def StateRoundCheckAndDoScript(oObject, oState, iRadius, iSelectObjectType, iExeTimes, iImmuneFlag):
    oPos = oObject.GetPos()
    oStateData = GetStateData(oState.m_ID)
    iCasterStateType = oStateData.m_Type
    targetLst = oObject.GetTargetLst(iSelectObjectType)
    iSuccessTimes = 0
    iSuccessFlag = False
    bSuccessCheckerFlag = False
    for oTarget in targetLst:
        if oTarget.TouchImmuneStateType(iCasterStateType):
            pass
        else:
            oTargetPos = oTarget.GetPos()
            iTargetImmuneFlag = oTarget.GetImmuneAttrFlag()
            iDistance = oPos.HorizontalDistance(oTargetPos)
            if iDistance <= iRadius:
                if not bSuccessCheckerFlag:
                    bSuccessCheckerFlag = True
            if iImmuneFlag & iTargetImmuneFlag:
                continue
            if iDistance <= iRadius:
                iSuccessTimes += 1
                oStateData.DoRangeBeCheckScript(oTarget, oState)
                iSuccessFlag = True
                if iExeTimes:
                    if iSuccessTimes >= iExeTimes:
                        break

    if bSuccessCheckerFlag:
        oStateData.DoRangeCheckerScript(oObject, oState)
    if iSuccessFlag:
        oState.OnRangeScriptSuccess()


def StateExeRangeEffect(oObject, oState):
    oStateData = GetStateData(oState.m_ID)
    oStateData.DoRangeCheckScript(oObject, oState)


def StateRemoveSelf(oObject, oState):
    oObject.RemoveState(oState.m_ID, BattleCmd_pb2.SELECT_OBJECT_TYPE_SELF, 0)


def StateMoveOwnerBackward(oObject, oState, iDistance, iMoveFrame):
    if oObject.GetMemberType() == Common_pb2.TEAM_MEMBER_TYPE_HOST:
        iDistance = -iDistance
    oObject.WinkMove(0, iDistance, iMoveFrame)


def StateAddImmune(oObject, oState, iImmuneAttrType):
    oState.RecImmuneAttr(iImmuneAttrType)
    oObject.AddImmuneAttr(iImmuneAttrType)


def StateUseAction(oObject, oState, iActionSID):
    oObject.m_DoHitAction.SetDirectActionID(iActionSID)


def StateAwardSetContinuousCounterValue(oObject, oState, iValue):
    oObject.m_CounterManager.AwardSetContinuousCounterValue(iValue)


def StateSetBulletTimeScale(oObject, oState, iValue, bIsSmooth):
    oState.AddObjectBulletTimeScale(int(iValue), bIsSmooth)


def StateSetSceneBulletTimeScale(oObject, oState, iValue):
    oState.AddSceneBulletTimeScale(iValue)


def StateSetBadmintonCouldBeHit(oObject, oState, bFlag):
    oScene = oObject.GetScene()
    oBadminton = oScene.GetFirstBadminton()
    oBadminton.SetCouldBeHit(bFlag)


def StateSetCounterValue(oObject, oState, iCounterType, iCurValue):
    oObject.SetCounterValue(iCounterType, iCurValue)


def StateSetDropPosGatherValue(oObject, oState, iValue):
    oHitArgs = oObject.GetHitData().m_HitArgs
    if oHitArgs:
        oHitArgs.m_DropPosGatherValue = iValue


def StateSetDropPosOffsetX(oObject, oState, iValue):
    oHitArgs = oObject.GetHitData().m_HitArgs
    if oHitArgs:
        oHitArgs.m_DropPosOffsetX = iValue


def StateSetDropPosOffsetZ(oObject, oState, iValue):
    oHitArgs = oObject.GetHitData().m_HitArgs
    if oHitArgs:
        oHitArgs.m_DropPosOffsetZ = iValue


def StateSetBehavior(oObject, oState, iBehaviorType):
    oObject.AddBehavior(iBehaviorType, oState.SrcKey())
    oState.RecChangeBehavior(iBehaviorType)


def StateExeRangeSuccessRemoveSelf(oObject, oState):
    if oState.GetDoRangeScriptSuccessTime() >= 1:
        oObject.RemoveState(oState.m_ID, BattleCmd_pb2.SELECT_OBJECT_TYPE_SELF, 0)


def StateSetSelfBeServePlayer(oObject, oState):
    oScene = oObject.GetScene()
    oScene.SwitchServePlayer(oObject.m_ID)


def StatePureSetCounterValue(oObject, oState, iCounterType, iCurValue):
    oObject.PureSetCounterValue(iCounterType, iCurValue, False)


def StateResetBadmintonPos(oObject, oState, iOffsetX, iOffsetY, iOffsetZ):
    oObject.DoResetBadmintonPos(iOffsetX, iOffsetY, iOffsetZ)


def StateMoveOwnerAwayFromPoint(oObject, oState, iX, iZ, iDistance, iMoveFrame):
    if oObject.GetMemberType() == Common_pb2.TEAM_MEMBER_TYPE_HOST:
        iZ = -iZ
        iX = -iX
    fOffsetX = oObject.m_Pos.m_X - iX
    fOffsetZ = oObject.m_Pos.m_Z - iZ
    iR = (fOffsetX ** 2 + fOffsetZ ** 2) ** 0.5
    fOffsetX = iDistance * fOffsetX / iR
    fOffsetZ = iDistance * fOffsetZ / iR
    oObject.WinkMove(fOffsetX, fOffsetZ, iMoveFrame)


@NoPrediction
def StateAddBadmintonGravitation(oObject, oState, iRadius, iHeight, iDistance):
    return


def StateClearState(oObject, oState, iStateTypeFlag):
    oObject.m_StateManager.ClearStateByType(iStateTypeFlag, oState.GetCasterID())


def StateImmuneState(oObject, oState, iStateTypeFlag):
    oState.RecImmuneStateType(iStateTypeFlag)
    oObject.AddImmuneStateType(iStateTypeFlag)


def StateRemoveOwner(oObject, oState):
    oObject.SetDelFlag()


def StateAddAction(oObject, oState, iActionSID):
    if oObject.GetHitActionManager().AddAction(iActionSID, 0, 0):
        oState.RecAddHitAction(iActionSID)


def StateEnterNewbieGuide(oObject, oState, iNewbieGuideID):
    oScene = oObject.GetScene()
    oScene.ResetGuide(iNewbieGuideID)


def StateEndNewbieGuide(oObject, oState, bIsFinished):
    oScene = oObject.GetScene()
    oScene.EndCurNewbieGuide(bIsFinished)


def StateFinishCurNewbieBattle(oObject, oState, bIsFinished):
    oScene = oObject.GetScene()
    oScene.FinishCurNewbieBattle(bIsFinished)


def StateStopGame(oObject, oState):
    oScene = oObject.GetScene()
    oScene.StopGame()


def StateAttachSkill(oObject, oState, iSkillID, iLevel):
    oObject.AddSkillWhilePlaying(iSkillID, iLevel)


def StateAddSphereTrigger(oObject, oState, iRadius, iSelectObjectType, iExeTimes, iImmuneFlag):
    bRes = oObject.AttachTrigger(oState.m_ID, iRadius)
    if not bRes:
        return
    oState.RecAtachTrigger(iSelectObjectType, iExeTimes, iImmuneFlag)


def StateOwnerBeClose(oObject, oState):
    oState.GetOwner().OnOtherCloseToMe(oObject)


def StateTriggerEvent(oObject, oState, iEventType):
    oObject.OnBattleEvent(iEventType, {})


def StateAddMonster(oObject, oState, dEventData, iMonsterSID):
    oScene = oObject.GetScene()
    oMonster = oScene.CreateMonster(iMonsterSID, oObject)
    iMemberType = oObject.GetMemberType()
    if "pos" in dEventData:
        x, y, z = dEventData["pos"]
        oBornPos = CDVec3(x, y, z)
    else:
        oBornPos = oScene.GetCourtRandPos(iMemberType)
    oMonster.SetPos(oBornPos, True)


def DoAddTrigger(oObject, oState, iTriggerSID, iX, iY, iZ):
    oScene = oObject.GetScene()
    oTrigger = oScene.CreateTrigger(iTriggerSID, oObject, oState.m_CasterSkillSID)
    oBornPos = CDVec3(iX, iY, iZ)
    oTrigger.SetPos(oBornPos, True)


def StateAddTrigger(oObject, oState, dEventData, iTriggerSID):
    iMemberType = oObject.GetMemberType()
    iX, iY, iZ = (0, 0, 0)
    if "pos" in dEventData:
        iX, iY, iZ = dEventData["pos"]
    else:
        oBornPos = oObject.GetScene().GetCourtRandPos(iMemberType)
        iX, iY, iZ = oBornPos.m_X, oBornPos.m_Y, oBornPos.m_Z
    DoAddTrigger(oObject, oState, iTriggerSID, iX, iY, iZ)


def StateAddDestinePosTrigger(oObject, oState, iTriggerSID, iX, iZ):
    DoAddTrigger(oObject, oState, iTriggerSID, iX, 0, iZ)


@NoPrediction
def StateAddFakeBadminton(oObject, oState, iAmount):
    oScene = oObject.GetScene()
    oScene.CreateFakeBadminton(oObject, iAmount)


@NoPrediction
def StateSetAllFakeBadmintonCurve(oObject, oState, iRandomType):
    oScene = oObject.GetScene()
    oBadminton = oScene.GetFirstBadminton()
    oMsg = oBadminton.PackNeedCurveData()
    oMsg.RandomType = iRandomType
    oScene.SetAllFakeBadmintonCurve(oMsg)
    oScene.AddDelta(BattleCmd_pb2.BATTLE_FAKEBADMINTON_CURVE_MSG, oMsg)


@NoPrediction
def StateDelAllFakeBadminton(oObject, oState):
    oScene = oObject.GetScene()
    lstID = []
    for oBadminton in oScene.GetAllFakeBadminton():
        if oBadminton.m_Owner == oObject:
            lstID.append(oBadminton.ID())

    for iID in lstID:
        oScene.DelFakeBadminton(iID)


def StateHideAllFakeBadminton(oObject, oState, iTime):
    oScene = oObject.GetScene()
    oMsg = BattleCmd_pb2.BattleFakebadmintonHideMsg()
    oMsg.Time = iTime
    oScene.AddDelta(BattleCmd_pb2.BATTLE_FAKEBADMINTON_HIDE_MSG, oMsg)


def StateChangeAI(oObject, oState, iBTConfID):
    oObject.DetachBT()
    oObject.AttachBT(iBTConfID)


def StateSetTechExamTargetValue(oObject, oState, iTargetType, iValue):
    oScene = oObject.GetScene()
    oScene.SetTargetValue(iTargetType, iValue)


def StateDecreaseActionCD(oObject, oState, iEffectFrame):
    oObject.DecreaseActionCD(iEffectFrame)


def StateAddMVPRecord(oObject, oState, iType, iValue):
    oScene = oObject.GetScene()
    oScene.AddMVPKeyRecord(oObject.m_ID, iType, iValue)


def StateAddPersonalRecord(oObject, oState, iType, iValue):
    oObject.AddRecord(iType, iValue)


def StateAddBombExplodeProgress(oObject, oState, iValue):
    oScene = oObject.GetScene()
    oBadminton = oScene.GetFirstBadminton()
    iNewValue = oBadminton.GetExplodeProgress() + iValue
    oBadminton.SetExplodeProgress(iNewValue)


def StateSetForbidBodyShotVoice(oObject, oState, bIsForbidBodyShotVoice):
    oScene = oObject.GetScene()
    oBadminton = oScene.GetFirstBadminton()
    oBadminton.SetIsForbidBodyShotVoice(bIsForbidBodyShotVoice)


def StateSetIgnoreHitObject(oObject, oState):
    sSrcKey = oState.SrcKey()
    oObject.AddIgnoreHitObjectSet(sSrcKey)


def StateCancelChangePropValue(oObject, oState, iPropType):
    sKey = oState.SrcKey()
    oState.DelChangePropRec(iPropType)
    oObject.CancelChangeProp(iPropType, sKey)


def StateCancelAllChangePropValue(oObject, oState):
    oState.CancelAllChangeProp()


def StateSetPersonalRecord(oObject, oState, iType, iValue):
    oObject.SetRecord(iType, iValue)


def StateSetStateEffect(oObject, oState, iStateSID, iEffectFrame, iEffectHit):
    oObject.m_StateManager.SetStateEffect(iStateSID, iEffectFrame, iEffectHit)
