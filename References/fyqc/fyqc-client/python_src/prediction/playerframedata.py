# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\prediction\playerframedata.py
# Compiled at: 2023-04-06 17:03:30
# Size of source mod 2**32: 10372 bytes
from base.protobufdata import PlayerFrameData_pb2, BattleCmd_pb2
from battlelogic.common.debug import LogWarning, LogError
from battlelogic.plugins.state import CAddStateArgs
from battlelogic.battlebase.dvec3 import CDVec3, UnpackSintVec3, UnpackFloatVec3, PackFloatVec3
import game

def PackEffectiveFrameNum(oPlayer, oMsg):
    oMsg.EffectiveFrameNum = oPlayer.m_Scene.m_EffectiveFrameNum


def UnpackEffectiveFrameNum(oPlayer, oMsg):
    oPlayer.m_Scene.m_EffectiveFrameNum = oMsg.EffectiveFrameNum


def PackEngineData(oPlayer, oMsg):
    oGame = game.GetGame()
    oMsg.EngineData = oGame.SaveHeroSnapshot()


def UnpackEngineData(oPlayer, oMsg):
    oGame = game.GetGame()
    oDir = CDVec3.CopyFrom(oPlayer.m_MoveDir)
    oGame.RestoreHeroFromSnapshot(oMsg.EngineData)
    oPlayer.SetMoveDir(oDir)


def PackPosIndex(oPlayer, oMsg):
    oMsg.PosIndex = oPlayer.m_PosIndex


def UnpackPosIndex(oPlayer, oMsg):
    oPlayer.m_PosIndex = oMsg.PosIndex


def PackPos(oPlayer, oMsg):
    PackFloatVec3(oMsg.Pos, oPlayer.m_Pos)


def UnpackPos(oPlayer, oMsg):
    return


def PackFacing(oPlayer, oMsg):
    oMsg.Facing = oPlayer.m_Facing.PackVec3()


def UnpackFacing(oPlayer, oMsg):
    oPlayer.m_Facing.UnpackVec3(oMsg.Facing)


def PackHitAction(oPlayer, oMsg):
    oMsg = oMsg.HitAction
    oMsg.HitActionID = oPlayer.GetHitData().m_ID


def UnpackHitAction(oPlayer, oMsg):
    oMsg = oMsg.HitAction
    oHitData = oPlayer.GetHitData()
    oHitData.m_ID = oMsg.HitActionID
    if oMsg.HitActionID:
        oPlayer.m_DoHitAction.m_HitAction = oPlayer.m_HitActionManager.GetAction(oMsg.HitActionID)
        if not oPlayer.m_DoHitAction.m_HitAction:
            oPlayer.m_DoHitAction.m_HitAction = oPlayer.m_HitActionManager.CreateAction(oMsg.HitActionID, 0, 0)
    else:
        oPlayer.m_DoHitAction.m_HitAction = None


def PackMoveType(oPlayer, oMsg):
    oMsg.MoveType = oPlayer.m_MoveType


def UnpackMoveType(oPlayer, oMsg):
    if oMsg.MoveType not in (BattleCmd_pb2.MOVE_TYPE_STAND, BattleCmd_pb2.MOVE_TYPE_MOVE):
        oPlayer.SetMoveType(oMsg.MoveType)


def PackHitActionPassFrame(oPlayer, oMsg):
    oHitData = oPlayer.GetHitData()
    oMsg.HitActionPassFrame = oHitData.m_PassFrame


def UnpackHitActionPassFrame(oPlayer, oMsg):
    oHitData = oPlayer.GetHitData()
    oHitData.m_PassFrame = oMsg.HitActionPassFrame


def PackHitActionState(oPlayer, oMsg):
    oHitData = oPlayer.GetHitData()
    oMsg.HitActionState = oHitData.m_State


def UnpackHitActionState(oPlayer, oMsg):
    oHitData = oPlayer.GetHitData()
    oHitData.m_State = oMsg.HitActionState


def PackCounter(oPlayer, oMsg):
    dAllCounterData = oPlayer.m_CounterManager.GetAllCounter()
    for iCounterType, iValue in dAllCounterData.items():
        oMsg.CounterList[iCounterType] = iValue


def UnpackCounter(oPlayer, oMsg):
    oCounterMgr = oPlayer.m_CounterManager
    for iCounterType, iValue in oMsg.CounterList.items():
        if oCounterMgr.GetCounter(iCounterType) != iValue:
            oCounterMgr.m_CounterData[iCounterType] = iValue


def PackGameState(oPlayer, oMsg):
    oMsg.GameState = oPlayer.m_Scene.m_GameState


def UnpackGameState(oPlayer, oMsg):
    oPlayer.m_Scene.m_GameState = oMsg.GameState


def PackHitNum(oPlayer, oMsg):
    oMsg.HitNum = oPlayer.m_HitNum


def UnpackHitNum(oPlayer, oMsg):
    oPlayer.m_HitNum = oMsg.HitNum


def PackBehavior(oPlayer, oMsg):
    oMsg.Behavior = oPlayer.m_BehaviorManager.m_BehaviorFlag


def UnpackBehavior(oPlayer, oMsg):
    oPlayer.m_BehaviorManager.SetBehaviorFlag(oMsg.Behavior)


g_PlayerFrameDataPacker = {(PlayerFrameData_pb2.PLAYER_FRAME_DATA_EFFECTIVE_FRAME_NUM): PackEffectiveFrameNum, 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_ENGINE_DATA): PackEngineData, 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_POS_INDEX): PackPosIndex, 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_POS): PackPos, 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_FACING): PackFacing, 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_HITACTION): PackHitAction, 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_MOVE_TYPE): PackMoveType, 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_HITACTION_PASS_FRAME): PackHitActionPassFrame, 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_HITACTION_STATE): PackHitActionState, 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_COUNTER): PackCounter, 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_GAMESTATE): PackGameState, 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_HIT_NUM): PackHitNum, 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_BEHAVIOR): PackBehavior}
g_PlayerFrameDataUnpacker = {(PlayerFrameData_pb2.PLAYER_FRAME_DATA_EFFECTIVE_FRAME_NUM): UnpackEffectiveFrameNum, 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_ENGINE_DATA): UnpackEngineData, 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_POS_INDEX): UnpackPosIndex, 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_POS): UnpackPos, 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_FACING): UnpackFacing, 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_HITACTION): UnpackHitAction, 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_MOVE_TYPE): UnpackMoveType, 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_HITACTION_PASS_FRAME): UnpackHitActionPassFrame, 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_HITACTION_STATE): UnpackHitActionState, 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_COUNTER): UnpackCounter, 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_GAMESTATE): UnpackGameState, 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_HIT_NUM): UnpackHitNum, 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_BEHAVIOR): UnpackBehavior}
g_PlayerFrameDataFieldName = {(PlayerFrameData_pb2.PLAYER_FRAME_DATA_EFFECTIVE_FRAME_NUM): "EffectiveFrameNum", 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_ENGINE_DATA): "EngineData", 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_POS_INDEX): "PosIndex", 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_POS): "Pos", 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_FACING): "Facing", 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_HITACTION): "HitAction", 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_MOVE_TYPE): "MoveType", 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_HITACTION_PASS_FRAME): "HitActionPassFrame", 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_HITACTION_STATE): "HitActionState", 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_COUNTER): "CounterList", 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_GAMESTATE): "GameState", 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_HIT_NUM): "HitNum", 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_BEHAVIOR): "Behavior"}

def CopyEffectFrameNum(oMsg, oMsgFrom):
    oMsg.EffectiveFrameNum = oMsgFrom.EffectiveFrameNum


def CopyEngineData(oMsg, oMsgFrom):
    oMsg.EngineData = oMsgFrom.EngineData


def CopyPosIndex(oMsg, oMsgFrom):
    oMsg.PosIndex = oMsgFrom.PosIndex


def CopyPos(oMsg, oMsgFrom):
    oMsg.Pos.X = oMsgFrom.Pos.X
    oMsg.Pos.Y = oMsgFrom.Pos.Y
    oMsg.Pos.Z = oMsgFrom.Pos.Z


def CopyFacing(oMsg, oMsgFrom):
    oMsg.Facing = oMsgFrom.Facing


def CopyHitAction(oMsg, oMsgFrom):
    oMsg.HitAction.CopyFrom(oMsgFrom.HitAction)


def CopyMoveType(oMsg, oMsgFrom):
    oMsg.MoveType = oMsgFrom.MoveType


def CopyHitActionPassFrame(oMsg, oMsgFrom):
    oMsg.HitActionPassFrame = oMsgFrom.HitActionPassFrame


def CopyHitActionState(oMsg, oMsgFrom):
    oMsg.HitActionState = oMsgFrom.HitActionState


def CopyCounterList(oMsg, oMsgFrom):
    oMsg.CounterList.clear()
    oMsg.CounterList.update(oMsgFrom.CounterList)


def CopyGameState(oMsg, oMsgFrom):
    oMsg.GameState = oMsgFrom.GameState


def CopyHitNum(oMsg, oMsgFrom):
    oMsg.HitNum = oMsgFrom.HitNum


def CopyBehavior(oMsg, oMsgFrom):
    oMsg.Behavior = oMsgFrom.Behavior


g_PlayerFrameDataCopyFunc = {(PlayerFrameData_pb2.PLAYER_FRAME_DATA_EFFECTIVE_FRAME_NUM): CopyEffectFrameNum, 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_ENGINE_DATA): CopyEngineData, 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_POS_INDEX): CopyPosIndex, 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_POS): CopyPos, 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_FACING): CopyFacing, 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_HITACTION): CopyHitAction, 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_MOVE_TYPE): CopyMoveType, 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_HITACTION_PASS_FRAME): CopyHitActionPassFrame, 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_HITACTION_STATE): CopyHitActionState, 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_COUNTER): CopyCounterList, 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_GAMESTATE): CopyGameState, 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_HIT_NUM): CopyHitNum, 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_BEHAVIOR): CopyBehavior}

def EqualPos(sBuffA, sBuffB):
    oPosA = UnpackFloatVec3(sBuffA)
    oPosB = UnpackFloatVec3(sBuffB)
    if abs(oPosA.m_X - oPosB.m_X) > 0.01 or abs(oPosA.m_X - oPosB.m_X) > 0.01 or abs(oPosA.m_X - oPosB.m_X) > 0.01:
        return False
    else:
        return True


def EqualMoveType(sBuffA, sBuffB):
    if sBuffB not in (BattleCmd_pb2.MOVE_TYPE_WINK_MOVE, BattleCmd_pb2.MOVE_TYPE_AUTO_MOVE):
        return True
    else:
        return sBuffA == sBuffB


def EqualHitaction(sBuffA, sBuffB):
    return sBuffA == sBuffB


def EqualGameState(sBuffA, sBuffB):
    return sBuffA == sBuffB


def EqualEffectiveFrameNum(sBuffA, sBuffB):
    return sBuffA == sBuffB


def EqualHitNum(sBuffA, sBuffB):
    return sBuffA == sBuffB


def EqualBehavior(sBuffA, sBuffB):
    return sBuffA == sBuffB


g_CompareFields = {(PlayerFrameData_pb2.PLAYER_FRAME_DATA_MOVE_TYPE): EqualMoveType, 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_HITACTION): EqualHitaction, 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_GAMESTATE): EqualGameState, 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_EFFECTIVE_FRAME_NUM): EqualEffectiveFrameNum, 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_HIT_NUM): EqualHitNum, 
 (PlayerFrameData_pb2.PLAYER_FRAME_DATA_BEHAVIOR): EqualBehavior}

def GetFrameDataPacker(iType):
    return g_PlayerFrameDataPacker[iType]


def GetFrameDataUnpacker(iType):
    return g_PlayerFrameDataUnpacker[iType]


def GetFrameDataName(iType):
    return g_PlayerFrameDataFieldName[iType]


def GetFrameDataCopyFunc(iType):
    return g_PlayerFrameDataCopyFunc[iType]


def FieldEqual(iType, oMsg1, oMsg2):
    sName = g_PlayerFrameDataFieldName[iType]
    return getattr(oMsg1, sName) == getattr(oMsg2, sName)


def GetFrameDataFields():
    return g_PlayerFrameDataPacker.keys()


def GetFrameDataCompareFields():
    return g_CompareFields


def MergePlayerFrameData(oMsg, oMsgFrom, lstChanged):
    for iType in lstChanged:
        func = g_PlayerFrameDataCopyFunc[iType]
        func(oMsg, oMsgFrom)
