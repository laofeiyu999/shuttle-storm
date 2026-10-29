# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\prediction\recordserverdata.py
# Compiled at: 2023-04-06 17:03:30
# Size of source mod 2**32: 4908 bytes
from base.protobufdata import Common_pb2
from base.protobufdata import PlayerFrameData_pb2
from battlelogic.battlebase.dvec3 import CDVec3
from base.protobufdata import BattleCmd_pb2
from battlelogic.plugins.state.state import CState
from battlelogic.common.debug import LogError
from battlelogic.plugins.state import CAddStateArgs
import game

def NeedRecordServerData(oGame, pid=0):
    if oGame.m_IsReRunReplay:
        return False
    else:
        if oGame.m_ClientLogicMode != Common_pb2.CLIENT_LOGIC_MODE_BATTLE:
            return False
        if pid:
            if oGame.m_HeroId != pid:
                return False
        return True


def UpdateFrameData(iType, oMsg, pid=0):
    oGame = game.GetGame()
    if not NeedRecordServerData(oGame, pid):
        return False
    else:
        oGame.m_ServerData.UpdateFrameData(iType, oMsg)
        return True


def UpdateCounterList(oMsg, pid=0):
    oGame = game.GetGame()
    if not NeedRecordServerData(oGame, pid):
        return False
    else:
        oGame.m_ServerData.m_FrameData.CounterList[oMsg.CounterType] = oMsg.Value
        return True


def OnHitRes(who, iPlayerID, oMsg):
    oGame = game.GetGame()
    if not NeedRecordServerData(oGame, iPlayerID):
        return False
    else:
        oFrameData = oGame.m_ServerData.m_FrameData
        oData = oFrameData.HitAction
        oData.HitActionID = oMsg.ActionID
        oGame.m_ServerData.UpdateFrameDataChanged(PlayerFrameData_pb2.PLAYER_FRAME_DATA_HITACTION)
        oGame.m_ServerData.UpdateFrameDataChanged(PlayerFrameData_pb2.PLAYER_FRAME_DATA_HITACTION_PASS_FRAME)
        oGame.m_ServerData.UpdateFrameData(PlayerFrameData_pb2.PLAYER_FRAME_DATA_POS, oMsg)
        return True


def PreJudgeCurve(who, iPlayerID, oMsg):
    oGame = game.GetGame()
    if not NeedRecordServerData(oGame, iPlayerID):
        return False
    oHitArgs = who.m_DoHitAction.GetHitBadmintonArgs()
    if not oHitArgs:
        return
    else:
        oHitArgs.m_StartPos = CDVec3.UnpackCDVec3(oMsg.StartPos)
        oHitArgs.m_DropPos = CDVec3.UnpackCDVec3(oMsg.DropPos)
        oHitArgs.m_HitKey = oMsg.HitKey
        oHitArgs.m_CurveID = oMsg.CurveID
        oHitArgs.m_AverageSpeedMul = oMsg.AverageSpeedMul
        oHitData = who.GetHitData()
        oHitData.m_HitFrame = oMsg.HitFrame
        oHitData.m_HitArgs = oHitArgs
        if oHitData.m_State != BattleCmd_pb2.HITACTION_STATE_BEFORE:
            if oHitData.m_State != BattleCmd_pb2.HITACTION_STATE_ACTION:
                oBadminton = oGame.m_Scene.GetFirstBadminton()
                oBadminton.HitBadminton(oHitArgs)
        return True


def ProcFrameNum(iFrameNum):
    oGame = game.GetGame()
    if not NeedRecordServerData(oGame):
        return False
    else:
        oGame.m_ServerData.ProcFrameNum(iFrameNum - 1)
        return True


def InsertHistoryCmd(pid, iFrameNum, iExecuteCmdCount):
    oGame = game.GetGame()
    if not NeedRecordServerData(oGame, pid):
        return False
    else:
        oGame.m_ServerData.SetFrameNum(iFrameNum)
        lstCmds = oGame.m_Prediction.GetHistoryCmds(iFrameNum)
        lstCmds = lstCmds[iExecuteCmdCount:]
        if lstCmds:
            oGame.m_Prediction.InsertHistoryCmd(iFrameNum + 1, lstCmds)
        return True


def UpdateFrameDataChanged(pid, iType):
    oGame = game.GetGame()
    if not NeedRecordServerData(oGame, pid):
        return False
    else:
        oGame.m_ServerData.UpdateFrameDataChanged(iType)
        return True


def UpdateHitKeyCD(who, pid, oMsg):
    oGame = game.GetGame()
    if not NeedRecordServerData(oGame, pid):
        return False
    else:
        who.m_ActionCDManager.ReplaceCD(oMsg.CDData.HitKey, oMsg.CDData.EndFrame)
        return True


def DecreaseHitKeyCD(who, pid, oMsg):
    oGame = game.GetGame()
    if not NeedRecordServerData(oGame, pid):
        return
    else:
        for oData in oMsg.CDData:
            who.m_ActionCDManager.ReplaceCD(oData.HitKey, oData.EndFrame)

        return True


def AddState(who, iPlayerID, oMsg):
    oObj = who.m_Scene.GetObject(iPlayerID)
    iStateSID = oMsg.StateSID
    iEndHit = 0
    iCasterSkillID = 0
    oObj.m_StateManager.m_StateDict[iStateSID] = CState(iStateSID, oObj, oMsg.EndFrame, iEndHit, oMsg.CasterID, iCasterSkillID, oMsg.StartFrame)
    if oObj.GetSceneObjectType() == BattleCmd_pb2.SCENE_OBJECT_TYPE_BADMINTON:
        lstFakeBadminton = who.m_Scene.GetAllFakeBadminton()
        if not lstFakeBadminton:
            return
        for oFakeBadminton in lstFakeBadminton:
            for iStateSID in oObj.m_StateManager.GetStateLst():
                oState = oObj.m_StateManager.m_StateDict[iStateSID]
                oAddStateArgs = CAddStateArgs(iStateSID)
                oFakeBadminton.m_StateManager.AddState(oAddStateArgs)


def RemoveState(who, iPlayerID, iStateSID):
    oObj = who.m_Scene.GetObject(iPlayerID)
    if iStateSID in oObj.m_StateManager.m_StateDict:
        del oObj.m_StateManager.m_StateDict[iStateSID]
    if oObj.GetSceneObjectType() == BattleCmd_pb2.SCENE_OBJECT_TYPE_BADMINTON:
        lstFakeBadminton = who.m_Scene.GetAllFakeBadminton()
        if not lstFakeBadminton:
            return
        for oFakeBadminton in lstFakeBadminton:
            oFakeBadminton.m_StateManager.DoRemoveState(iStateSID)
