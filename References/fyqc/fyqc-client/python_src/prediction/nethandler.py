# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\prediction\nethandler.py
# Compiled at: 2023-04-06 17:03:30
# Size of source mod 2**32: 19788 bytes
from base.protobufdata import BattleCmd_pb2, PlayerFrameData_pb2, DCmd_pb2, Common_pb2
from battlelogic.battlebase.dvec3 import CDVec3, UnpackSintVec3, UnpackFloatVec3
from battlelogic.common.debug import Profiler, LogWarning, LogError
from .defines import IsPredictionMsg, IsScenePredictionMsg
from battlelogic.monster import CMonster
from battlelogic.propertybox import CPropertyBox
from battlelogic.plugins.prop.defines import GetOnChangeFunc
from battlelogic.badminton import CHitBadmintonArgs
from battlelogic.badminton.fakebadminton import CFakeBadminton
from battlelogic.common.defines import Frame2Sec, STAR_MARK_HIT_ACTION_ID, BULLET_TIME_DELAY_FRAME
from C_net import *
from C_debug import PythonError
from battlelogic.idolum import CIdolum
from base.data import GetHitActionData
import game, random
from . import recordserverdata
from . import recordclientdata
from . import recordreplaydata

def SmoothSetPos(who, oPos):
    recordclientdata.BeginSmooth(who, oPos)


@Profiler
def GameState(who, iPlayerID, sBuff):
    oMsg = BattleCmd_pb2.BattleGameStateMsg()
    oMsg.ParseFromString(sBuff)
    iGameState = oMsg.GameState
    oScene = who.m_Scene
    oScene.m_GameState = iGameState
    oScene.OnGameStateChange()
    if iGameState not in (BattleCmd_pb2.GAME_STATE_SERVE, BattleCmd_pb2.GAME_STATE_PLAYING):
        oScene.StopMove()
    if iGameState == BattleCmd_pb2.GAME_STATE_SERVE:
        oScene.m_Phys.SetIsServe(True)
        oScene.ResetBadminton()
    elif iGameState == BattleCmd_pb2.GAME_STATE_PLAYING:
        oScene.m_Phys.SetIsServe(False)
        for obj in oScene.GetAllDynamic():
            obj.OnAfterServe()

    else:
        if iGameState == BattleCmd_pb2.GAME_STATE_REPLAY:
            for obj in oScene.GetAllDynamic():
                obj.OnScore()

    recordreplaydata.GameState(who, iGameState)
    recordserverdata.UpdateFrameData(PlayerFrameData_pb2.PLAYER_FRAME_DATA_GAMESTATE, oMsg)
    recordserverdata.UpdateFrameData(PlayerFrameData_pb2.PLAYER_FRAME_DATA_EFFECTIVE_FRAME_NUM, oMsg)


@Profiler
def ServePlayerID(who, iPlayerID, sBuff):
    oMsg = BattleCmd_pb2.BattleServePlayerMsg()
    oMsg.ParseFromString(sBuff)
    who.m_Scene.m_ServePlayerID = oMsg.PlayerID


@Profiler
def BadmintonCurve(who, iPlayerID, sBuff):
    oMsg = BattleCmd_pb2.BattleBadmintonCurveMsg()
    oMsg.ParseFromString(sBuff)
    oBadminton = who.m_Scene.GetFirstBadminton()
    if oBadminton:
        oBadminton.m_CurvePrediction.OnServerCurve(oMsg)
    recordclientdata.ClearPrejudgeCurve()
    recordreplaydata.BadmintonCurve(who, oMsg)


@Profiler
def BadmintonCurveEnd(who, iPlayerID, sBuff):
    oMsg = BattleCmd_pb2.BattleBadmintonCurveEndMsg()
    oMsg.ParseFromString(sBuff)
    oBadminton = who.m_Scene.GetFirstBadminton()
    if oBadminton:
        oBadminton.SetCurveData(None)
        oBadminton.SetSimulateFinished(True)
        oBadminton.m_Pos.UnpackVec3(oMsg.Pos)
        oBadminton.OnPosDelta()


@Profiler
def BadmintonStarMark(who, iPlayerID, sBuff):
    oMsg = BattleCmd_pb2.BadmintonStarMarkMsg()
    oMsg.ParseFromString(sBuff)
    oBadminton = who.m_Scene.GetFirstBadminton()
    if oBadminton:
        oBadminton.m_StarMarkPos.UnpackVec3(oMsg.Pos)
        recordclientdata.RecBadmintonHintHitLastPos(CDVec3(0, 0, 0))


@Profiler
def BadmintonBodyShot(who, iPlayerID, sBuff):
    oMsg = BattleCmd_pb2.BadmintonBodyShotMsg()
    oMsg.ParseFromString(sBuff)
    oBadminton = who.m_Scene.GetFirstBadminton()
    if oBadminton:
        oBadminton.m_CurvePrediction.OnServerBodyShot(oMsg)


@Profiler
def BadmintonNetShot(who, iPlayerID, sBuff):
    oMsg = BattleCmd_pb2.BadmintonNetShotMsg()
    oMsg.ParseFromString(sBuff)
    oBadminton = who.m_Scene.GetFirstBadminton()
    if oBadminton:
        oBadminton.m_CurvePrediction.OnServerNetShot(oMsg)


@Profiler
def Pos(who, iObjectID, sBuff):
    oMsg = BattleCmd_pb2.BattlePosMsg()
    oMsg.ParseFromString(sBuff)
    oObject = who.m_Scene.GetObject(iObjectID)
    if not oObject:
        return
    else:
        oPos = UnpackFloatVec3(oMsg.Pos)
        if oMsg.NoLerp:
            recordclientdata.EndSmooth(iObjectID)
            oObject.SetPos(oPos, bNoLerp=True)
        else:
            SmoothSetPos(oObject, oPos)
    recordserverdata.UpdateFrameData(PlayerFrameData_pb2.PLAYER_FRAME_DATA_POS, oMsg, iObjectID)


@Profiler
def PosIndex(who, iObjectID, sBuff):
    oMsg = BattleCmd_pb2.BattlePosIndexMsg()
    oMsg.ParseFromString(sBuff)
    if not recordserverdata.UpdateFrameData(PlayerFrameData_pb2.PLAYER_FRAME_DATA_POS_INDEX, oMsg, iObjectID):
        oObject = who.m_Scene.GetObject(iObjectID)
        if oObject:
            oObject.SetPosIndex(oMsg.PosIndex)


@Profiler
def CurPointServePlayerID(who, iPlayerID, sBuff):
    oMsg = BattleCmd_pb2.BattleCurPointServePlayerIDMsg()
    oMsg.ParseFromString(sBuff)
    who.m_Scene.m_CurPointServePlayerID = oMsg.PlayerID


@Profiler
def BadmintonCouldBeHit(who, iPlayerID, sBuff):
    oMsg = BattleCmd_pb2.BattleBadmintonCouldBeHitMsg()
    oMsg.ParseFromString(sBuff)
    oBadminton = who.m_Scene.GetFirstBadminton()
    if oBadminton:
        oBadminton.m_CouldBeHit = oMsg.CouldBeHit


@Profiler
def MoveDir(who, iObjectID, sBuff):
    oMsg = BattleCmd_pb2.BattleMoveDirMsg()
    oMsg.ParseFromString(sBuff)
    oObj = who.m_Scene.GetObject(iObjectID)
    if not oObj:
        return
    oDir = UnpackSintVec3(oMsg)
    oObj.SetMoveDir(oDir)
    oObj.SetFacing(oDir)


@Profiler
def Facing(who, iPlayerID, sBuff):
    oMsg = BattleCmd_pb2.BattleFacingMsg()
    oMsg.ParseFromString(sBuff)
    recordserverdata.UpdateFrameData(PlayerFrameData_pb2.PLAYER_FRAME_DATA_FACING, oMsg, iPlayerID)


@Profiler
def MoveType(who, iObjectID, sBuff):
    oMsg = BattleCmd_pb2.BattleMoveTypeMsg()
    oMsg.ParseFromString(sBuff)
    oObj = who.m_Scene.GetObject(iObjectID)
    if oObj:
        oObj.SetMoveType((oMsg.MoveType), bDelta=False)
        if oMsg.MoveType == BattleCmd_pb2.MOVE_TYPE_STAND:
            oObj.m_Scene.m_Phys.SetWalkTo(iObjectID, 0, 0)
            if oObj.m_ID != who.m_ID:
                oObj.InitFacing()
    recordserverdata.UpdateFrameData(PlayerFrameData_pb2.PLAYER_FRAME_DATA_MOVE_TYPE, oMsg, iObjectID)


@Profiler
def UpdateCounter(who, iPlayerID, sBuff):
    oMsg = BattleCmd_pb2.BattleUpdateCounterMsg()
    oMsg.ParseFromString(sBuff)
    recordserverdata.UpdateCounterList(oMsg, iPlayerID)
    recordserverdata.UpdateFrameDataChanged(iPlayerID, PlayerFrameData_pb2.PLAYER_FRAME_DATA_COUNTER)


@Profiler
def UpdateHitKeyCD(who, iPlayerID, sBuff):
    oMsg = BattleCmd_pb2.BattleHitKeyCDMsg()
    oMsg.ParseFromString(sBuff)
    recordserverdata.UpdateHitKeyCD(who, iPlayerID, oMsg)


def NeedReDoAction(who, iPlayerID, iClientActionID, iServerActionID, oMoveScale):
    if iServerActionID == STAR_MARK_HIT_ACTION_ID:
        return True
    else:
        return False


@Profiler
def HitRes(who, iPlayerID, sBuff):
    oMsg = BattleCmd_pb2.BattleHitResMsg()
    oMsg.ParseFromString(sBuff)
    oObj = who.m_Scene.GetObject(iPlayerID)
    oClientHitPos, iHitAction = getattr(oObj, "m_ClientHitData", (oObj.GetPos(), 0))
    if recordserverdata.OnHitRes(who, iPlayerID, oMsg):
        if oMsg.IsDirect:
            SendToClient(who, iPlayerID, BattleCmd_pb2.BATTLE_HIT_RES_MSG, sBuff)
        elif NeedReDoAction(who, iPlayerID, iHitAction, oMsg.ActionID, oMsg.MoveScale):
            SendToClient(who, iPlayerID, BattleCmd_pb2.BATTLE_HIT_RES_MSG, sBuff)
    if oObj:
        if oMsg.MoveScale:
            if who.m_ID != iPlayerID or iHitAction == oMsg.ActionID:
                oMoveScale = CDVec3.UnpackCDVec3(oMsg.MoveScale)
                oObj.m_DoHitAction.SetHitActionPath(oMsg.ActionID, oMoveScale)
            else:
                oGame = game.GetGame()
                oGame.m_ClientLogic.m_CombatObjectServerSmoothMove.BeginSmooth(oGame)
        recordclientdata.SetHitRes(iPlayerID, oObj, oMsg.ActionID)
        recordreplaydata.HitRes(oObj, iPlayerID, oMsg)
        oServerPos = UnpackFloatVec3(oMsg.Pos)
        if oObj.m_ID == iPlayerID:
            if recordclientdata.NeedSmooth(oClientHitPos, oServerPos):
                SmoothSetPos(oObj, oServerPos)


@Profiler
def ExchangeSkillScheme(who, iPlayerID, sBuff):
    oMsg = BattleCmd_pb2.BattleExchangeSkillSchemeMsg()
    oMsg.ParseFromString(sBuff)
    oPlayer = who.m_Scene.GetPlayer(iPlayerID)
    if oPlayer:
        oPlayer.m_CurSchemeIdx = oMsg.SchemeIdx


@Profiler
def LeaveQuarterRest(who, iPlayerID, sBuff):
    oMsg = BattleCmd_pb2.BattleLeaveQuarterRestMsg()
    oMsg.ParseFromString(sBuff)
    oPlayer = who.m_Scene.GetPlayer(iPlayerID)
    for oObj in who.m_Scene.GetAllPlayer():
        oObj.OnLeaveQuarterRest()


@Profiler
def OnBulletTime(who, iPlayerID, sBuff):
    oMsg = BattleCmd_pb2.BattleObjBulletTimeMsg()
    oMsg.ParseFromString(sBuff)
    oObject = who.m_Scene.GetObject(oMsg.ID)
    if oObject:
        oGame = game.GetGame()
        iServerBulletTimeFrame = oGame.m_ServerFrameNum + 1 + BULLET_TIME_DELAY_FRAME
        oObject.m_BulletTimeScaleMgr.m_BulletTimeDelay[iServerBulletTimeFrame] = (oMsg.BulletTimeScale, oMsg.IsSmooth)
        recordclientdata.OnBulletTime(who, oObject, iPlayerID, oMsg)


def DoSetBulletTime(who, iPlayerID, sBuff):
    oMsg = BattleCmd_pb2.BattleObjDoSetBulletTimeMsg()
    oMsg.ParseFromString(sBuff)
    oObject = who.m_Scene.GetObject(oMsg.ID)
    if oObject:
        if oMsg.BulletTimeScale != oObject.m_BulletTimeScaleMgr.m_BulletTimeScale:
            oObject.m_BulletTimeScaleMgr.m_BulletTimeScale = oMsg.BulletTimeScale
            oObject.m_Scene.m_Phys.SetBulletTimeScale(oObject.m_ID, oMsg.BulletTimeScale)


@Profiler
def AddObject(who, iObjectID, sBuff):
    oMsg = BattleCmd_pb2.BattleAddObjectMsg()
    oMsg.ParseFromString(sBuff)
    oObject = who.m_Scene.GetObject(oMsg.ObjectID)
    if oObject:
        return
    if oMsg.Type == BattleCmd_pb2.SCENE_OBJECT_TYPE_MONSTER:
        oMonster = CMonster(oMsg.ObjectID, None, who.m_Scene)
        oMonster.SetTableID(oMsg.TableID)
        who.m_Scene.AddObject(BattleCmd_pb2.SCENE_OBJECT_TYPE_MONSTER, oMsg.ObjectID, oMsg.NetIndex, oMonster)
        oMonster.InitPhys()
    elif oMsg.Type == BattleCmd_pb2.SCENE_OBJECT_TYPE_PROPERTY_BOX:
        oPropertyBox = CPropertyBox(oMsg.ObjectID, who.m_Scene, Common_pb2.TEAM_MEMBER_TYPE_NONE)
        oPropertyBox.SetTableID(oMsg.TableID)
        who.m_Scene.AddObject(BattleCmd_pb2.SCENE_OBJECT_TYPE_PROPERTY_BOX, oMsg.ObjectID, oMsg.NetIndex, oPropertyBox)
        oPropertyBox.InitPhys()
    elif oMsg.Type == BattleCmd_pb2.SCENE_OBJECT_TYPE_FAKE_BADMINTON:
        oFakeBadminton = CFakeBadminton(oMsg.ObjectID, who.m_Scene)
        oFakeBadminton.SetTableID(oMsg.TableID)
        who.m_Scene.AddObject(BattleCmd_pb2.SCENE_OBJECT_TYPE_FAKE_BADMINTON, oMsg.ObjectID, oMsg.NetIndex, oFakeBadminton)
    elif oMsg.Type == BattleCmd_pb2.SCENE_OBJECT_TYPE_IDOLUM:
        oExtData = BattleCmd_pb2.BattleAddIdolumExtData()
        oExtData.ParseFromString(oMsg.ExtData)
        oIdolum = CIdolum(oMsg.ObjectID, who.m_Scene, oExtData.OwnerID)
        who.m_Scene.AddObject(BattleCmd_pb2.SCENE_OBJECT_TYPE_IDOLUM, oMsg.ObjectID, oMsg.NetIndex, oIdolum)


@Profiler
def RemoveObject(who, iObjectID, sBuff):
    oMsg = BattleCmd_pb2.BattleRemoveObjectMsg()
    oMsg.ParseFromString(sBuff)
    oObject = who.m_Scene.GetObject(oMsg.ObjectID)
    if not oObject:
        return
    who.m_Scene.DelObject(oMsg.Type, oMsg.ObjectID)


@Profiler
def ExchangePropertySkill(who, iPlayerID, sBuff):
    oMsg = BattleCmd_pb2.BattleExchangePropertySkillMsg()
    oMsg.ParseFromString(sBuff)
    oPlayer = who.m_Scene.GetPlayer(iPlayerID)
    iSkillID = oMsg.SkillID
    if oPlayer:
        if iSkillID:
            oPlayer.AddPropertySkill(iSkillID)
        else:
            oPlayer.ClearPropertySkill()


@Profiler
def WalkTo(who, iObjectID, sBuff):
    oMsg = BattleCmd_pb2.BattleWalkToMsg()
    oMsg.ParseFromString(sBuff)
    oObj = who.m_Scene.GetObject(iObjectID)
    if not oObj:
        return
    oWalkTo = CDVec3.UnpackCDVec3(oMsg.WalkTo)
    oObj.WalkTo(oWalkTo.m_X, oWalkTo.m_Z)
    oObj.SetFacing(oWalkTo - oObj.m_Pos)


@Profiler
def WinkMove(who, iObjectID, sBuff):
    oMsg = BattleCmd_pb2.BattleWinkMoveMsg()
    oMsg.ParseFromString(sBuff)
    oObj = who.m_Scene.GetObject(iObjectID)
    if not oObj:
        return
    oObj.WinkMove(oMsg.X, oMsg.Z, oMsg.DurationFrame)


@Profiler
def PropChange(who, iPlayerID, sBuff):
    oMsg = BattleCmd_pb2.BattlePropChangeMsg()
    oMsg.ParseFromString(sBuff)
    oObj = who.m_Scene.GetObject(iPlayerID)
    if not oObj:
        return
    func = GetOnChangeFunc(oMsg.PropType)
    if func:
        func(oObj, oMsg.Value)
    oObj.m_PropContainer.ClientPropChange(oMsg.PropType, oMsg.Value)


@Profiler
def PreJudgeCurve(who, iPlayerID, sBuff):
    oMsg = BattleCmd_pb2.BattleBadmintonPrejudgeCurveMsg()
    oMsg.ParseFromString(sBuff)
    if oMsg.IsExplode:
        oGame = game.GetGame()
        oBadminton = oGame.m_Scene.GetFirstBadminton()
        oBadminton.DoExplode()
        return
    if not oMsg.CurveID:
        return
    if not recordserverdata.PreJudgeCurve(who, iPlayerID, oMsg):
        recordclientdata.PreJudgeCurve(who, iPlayerID, oMsg)


@Profiler
def HitNum(who, iObjectID, sBuff):
    oMsg = BattleCmd_pb2.BattleHitNumMsg()
    oMsg.ParseFromString(sBuff)
    recordserverdata.UpdateFrameData(PlayerFrameData_pb2.PLAYER_FRAME_DATA_HIT_NUM, oMsg, iObjectID)


def BadmintonLocked(who, iObjectID, sBuff):
    oMsg = BattleCmd_pb2.BattleBadmintonLockedMsg()
    oMsg.ParseFromString(sBuff)
    oBadminton = who.m_Scene.GetObject(iObjectID)
    oBadminton.SetLockerID(oMsg.LockerID)


def FakeBadmintonCurve(who, iPlayerID, sBuff):
    if who.m_ID == iPlayerID:
        return
    oMsg = BattleCmd_pb2.BattleFakebadmintonCurveMsg()
    oMsg.ParseFromString(sBuff)
    oScene = who.GetScene()
    oScene.SetAllFakeBadmintonCurve(oMsg)


@Profiler
def Behavior(who, iObjectID, sBuff):
    oMsg = BattleCmd_pb2.BattleBehaviorMsg()
    oMsg.ParseFromString(sBuff)
    oObj = who.m_Scene.GetObject(iObjectID)
    if oObj:
        oObj.m_BehaviorManager.SetBehaviorFlag(oMsg.Behavior)
    recordserverdata.UpdateFrameData(PlayerFrameData_pb2.PLAYER_FRAME_DATA_BEHAVIOR, oMsg, iObjectID)


def ScoreBoard(who, iPlayerID, sBuff):
    oMsg = BattleCmd_pb2.BattleScoreBoardMsg()
    oMsg.ParseFromString(sBuff)
    recordreplaydata.ScoreBoard(who, oMsg)


def AddState(who, iPlayerID, sBuff):
    oMsg = BattleCmd_pb2.BattleAddStateMsg()
    oMsg.ParseFromString(sBuff)
    recordserverdata.AddState(who, iPlayerID, oMsg)


def RemoveState(who, iPlayerID, sBuff):
    oMsg = BattleCmd_pb2.BattleRemoveStateMsg()
    oMsg.ParseFromString(sBuff)
    recordserverdata.RemoveState(who, iPlayerID, oMsg.StateSID)


def UpdatePostiveSkillData(who, iPlayerID, sBuff):
    oMsg = BattleCmd_pb2.BattleUpdatePositiveSkillDataMsg()
    oMsg.ParseFromString(sBuff)
    recordreplaydata.UpdatePostiveSkillData(who, iPlayerID, oMsg)


def HitEnd(who, iPlayerID, sBuff):
    recordreplaydata.HitEnd(who, iPlayerID)


def DecreaseActionCD(who, iPlayerID, sBuff):
    oMsg = BattleCmd_pb2.BattleDecreaseHitKeyCDMsg()
    oMsg.ParseFromString(sBuff)
    recordserverdata.DecreaseHitKeyCD(who, iPlayerID, oMsg)


def ServerSmoothPos(who, iPlayerID, sBuff):
    oMsg = BattleCmd_pb2.BattleServerSmoothPosMsg()
    oMsg.ParseFromString(sBuff)
    oGame = game.GetGame()
    oGame.m_ClientLogic.m_CombatObjectServerSmoothMove.EndSmooth(oGame)


g_ServerCmdOP = {(BattleCmd_pb2.BATTLE_GAME_STATE_MSG): GameState, 
 (BattleCmd_pb2.BATTLE_SERVE_PLAYER_MSG): ServePlayerID, 
 (BattleCmd_pb2.BATTLE_BADMINTON_CURVE_MSG): BadmintonCurve, 
 (BattleCmd_pb2.BATTLE_BADMINTON_CURVE_END_MSG): BadmintonCurveEnd, 
 (BattleCmd_pb2.BATTLE_BADMINTON_STAR_MARK_MSG): BadmintonStarMark, 
 (BattleCmd_pb2.BATTLE_BADMINTON_BODY_SHOT_MSG): BadmintonBodyShot, 
 (BattleCmd_pb2.BATTLE_BADMINTON_NET_SHOT_MSG): BadmintonNetShot, 
 (BattleCmd_pb2.BATTLE_POS_MSG): Pos, 
 (BattleCmd_pb2.BATTLE_POS_INDEX_MSG): PosIndex, 
 (BattleCmd_pb2.BATTLE_CUR_POINT_SERVE_PLAERID_MSG): CurPointServePlayerID, 
 (BattleCmd_pb2.BATTLE_BADMINTON_COULD_BE_HIT_MSG): BadmintonCouldBeHit, 
 (BattleCmd_pb2.BATTLE_MOVE_DIR_MSG): MoveDir, 
 (BattleCmd_pb2.BATTLE_FACING_MSG): Facing, 
 (BattleCmd_pb2.BATTLE_MOVE_TYPE_MSG): MoveType, 
 (BattleCmd_pb2.BATTLE_UPDATE_COUNTER_MSG): UpdateCounter, 
 (BattleCmd_pb2.BATTLE_HIT_KEY_CD_MSG): UpdateHitKeyCD, 
 (BattleCmd_pb2.BATTLE_HIT_RES_MSG): HitRes, 
 (BattleCmd_pb2.BATTLE_EXCHANGE_SKILL_SCHEME_MSG): ExchangeSkillScheme, 
 (BattleCmd_pb2.BATTLE_LEAVE_QUARTER_REST_MSG): LeaveQuarterRest, 
 (BattleCmd_pb2.BATTLE_OBJ_BULLET_TIME_MSG): OnBulletTime, 
 (BattleCmd_pb2.BATTLE_ADD_OBJECT_MSG): AddObject, 
 (BattleCmd_pb2.BATTLE_REMOVE_OBJECT_MSG): RemoveObject, 
 (BattleCmd_pb2.BATTLE_EXCHANGE_PROPERTY_SKILL_MSG): ExchangePropertySkill, 
 (BattleCmd_pb2.BATTLE_WALK_TO_MSG): WalkTo, 
 (BattleCmd_pb2.BATTLE_WINK_MOVE_MSG): WinkMove, 
 (BattleCmd_pb2.BATTLE_PROP_CHANGE_MSG): PropChange, 
 (BattleCmd_pb2.BATTLE_BADMINTON_PREJUDGE_CURVE_MSG): PreJudgeCurve, 
 (BattleCmd_pb2.BATTLE_HIT_NUM_MSG): HitNum, 
 (BattleCmd_pb2.BATTLE_BADMINTON_LOCKED_MSG): BadmintonLocked, 
 (BattleCmd_pb2.BATTLE_FAKEBADMINTON_CURVE_MSG): FakeBadmintonCurve, 
 (BattleCmd_pb2.BATTLE_BEHAVIOR_MSG): Behavior, 
 (BattleCmd_pb2.BATTLE_SCORE_BOARD_MSG): ScoreBoard, 
 (BattleCmd_pb2.BATTLE_ADD_STATE_MSG): AddState, 
 (BattleCmd_pb2.BATTLE_REMOVE_STATE_MSG): RemoveState, 
 (BattleCmd_pb2.BATTLE_UPDATE_POSITIVE_SKILL_DATA_MSG): UpdatePostiveSkillData, 
 (BattleCmd_pb2.BATTLE_HIT_END_MSG): HitEnd, 
 (BattleCmd_pb2.BATTLE_DECREASE_HIT_KEY_CD_MSG): DecreaseActionCD, 
 (BattleCmd_pb2.BATTLE_OBJ_DO_SET_BULLET_TIME_MSG): DoSetBulletTime, 
 (BattleCmd_pb2.BATTLE_SERVER_SMOOTH_POS_MSG): ServerSmoothPos}

def SetFrameNum(who, iFrameNum, iExecuteCmdCount):
    oGame = game.GetGame()
    oGame.m_ServerFrameNum = iFrameNum
    recordserverdata.InsertHistoryCmd(who.m_ID, iFrameNum, iExecuteCmdCount)


@Profiler
def OnBattleCmd(who, sBuffer):
    if not sBuffer:
        return
    SetPacketDataForUnpack(bytes(sBuffer))
    iExecuteCmdCount = UnpackInt(1)
    iFrameNum = UnpackInt(4)
    lstCmds = []
    iMsgID = UnpackInt(1)
    while iMsgID != 0:
        iNetIndex = UnpackInt(1)
        iLen = UnpackInt(2)
        if iLen:
            sBuffer = UnpackBinaryString(iLen)
        else:
            sBuffer = b''
        lstCmds.append((iNetIndex, iMsgID, sBuffer))
        iMsgID = UnpackInt(1)

    iMsgID = UnpackInt(1)
    while iMsgID != 0:
        iLen = UnpackInt(2)
        if iLen:
            sBuffer = UnpackBinaryString(iLen)
        else:
            sBuffer = b''
        lstCmds.append((who.m_NetIndex, iMsgID, sBuffer))
        iMsgID = UnpackInt(1)

    iMsgID = UnpackInt(1)
    while iMsgID != 0:
        iNetIndex = UnpackInt(1)
        iLen = UnpackInt(2)
        if iLen:
            sBuffer = UnpackBinaryString(iLen)
        else:
            sBuffer = b''
        lstCmds.append((iNetIndex, iMsgID, sBuffer))
        iMsgID = UnpackInt(1)

    recordserverdata.ProcFrameNum(iFrameNum)
    oGame = game.GetGame()
    oGame.m_ServerFrameNum = iFrameNum - 1
    for iNetIndex, iMsgID, sBuffer in lstCmds:
        pid = oGame.m_Scene.m_NetIndexDict.get(iNetIndex, 0)
        OnServerCmd(who, pid, iMsgID, sBuffer)

    CheckPropChange(who)
    oGame.m_ServerFrameNum = iFrameNum
    SetFrameNum(who, iFrameNum, iExecuteCmdCount)


def DoServerCmd(who, pid, iCmd, sBuffer):
    func = g_ServerCmdOP.get(iCmd)
    if func:
        func(who, pid, sBuffer)


def OnServerCmd(who, iObjectID, iCmd, sBuffer):
    oGame = game.GetGame()
    DoServerCmd(who, iObjectID, iCmd, sBuffer)
    if oGame.m_ClientLogicMode == Common_pb2.CLIENT_LOGIC_MODE_BATTLE:
        if iObjectID == who.m_ID:
            if IsPredictionMsg(iCmd):
                return
            if IsScenePredictionMsg(iCmd):
                return
    if iCmd == BattleCmd_pb2.BATTLE_POS_MSG:
        return
    if iCmd == BattleCmd_pb2.BATTLE_FRAME_STATE_MSG:
        return
    SendToClient(who, iObjectID, iCmd, sBuffer)


def SendToClient(who, pid, iCmd, sBuffer):
    PacketPrepare(DCmd_pb2.CMD_BATTLE)
    PacketAddI(iCmd, 1)
    PacketAddI(pid, 4)
    PacketAddBinaryS(sBuffer, len(sBuffer))
    PacketSend(who.m_ID)


def CheckPropChange(who):
    for oObj in who.m_Scene.GetAllPlayer():
        if oObj.m_PropContainer.DoClientPropChange():
            oGame = game.GetGame()
            oGame.m_NeedRerun = True
