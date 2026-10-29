# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\nethandler.py
# Compiled at: 2023-04-06 17:03:30
# Size of source mod 2**32: 5746 bytes
from base.protobufdata import DCmd_pb2, Common_pb2, BattleCtrl_pb2, BattleCmd_pb2
from battlelogic.nethandler import GetNetHandler
from prediction.defines import IsPredictionCmd
from battlelogic.common.debug import LogWarning, LogError, Profiler
from battlelogic.battlebase.dvec3 import CDVec3, PackSintVec3
from battlelogic.common.logicutil import CalcMoveSpeed, AdjustDirByMemberType
from battlelogic.common.defines import SWING_SHOT_HIT_ACTION_ID, HITACTION_PREJUDGE_FRAME
from prediction.serverdata import CServerData
from battlelogic.battlebase.drandom import CGameRandom
from base.data import GetHitActionData
from C_net import SetPacketDataForUnpack, UnpackInt

def OnAllLoadingDone(oGame, who, sBuffer):
    oMsg = BattleCtrl_pb2.BattleCtrlAllLoadingDoneMsg()
    oMsg.ParseFromString(sBuffer)
    oGame.OnAllLoadingDone(oMsg.FrameNum)


def OnExitGame(oGame, who, sBuffer):
    return


def OnReqQuitGame(oGame, who, sBuffer):
    if not oGame.IsLocalGame():
        return
    oGame.m_QuitBattleType = Common_pb2.QUIT_BATTLE_TYPE_ESCAPE
    oGame.OnLocalGameEnd()


def OnHalfWayEnter(oGame, who, sBuffer):
    oMsg = BattleCtrl_pb2.BattleCtrlHalfwayEnterMsg()
    oMsg.ParseFromString(sBuffer)
    oScene = who.m_Scene
    oScene.SetGameState(oMsg.GameState)
    if oScene.m_GameState == BattleCmd_pb2.GAME_STATE_SERVE:
        oScene.m_Phys.SetIsServe(True)
    elif oScene.GetGameMode() == Common_pb2.GAME_MODE_BOMB:
        oScene.SetTeamHP(Common_pb2.TEAM_MEMBER_TYPE_HOST, oMsg.HostHP)
        oScene.SetTeamHP(Common_pb2.TEAM_MEMBER_TYPE_GUEST, oMsg.GuestHP)
    else:
        oScene.SetScore(Common_pb2.TEAM_MEMBER_TYPE_HOST, oMsg.HostScore)
        oScene.SetScore(Common_pb2.TEAM_MEMBER_TYPE_GUEST, oMsg.GuestScore)
    for oCurData in oMsg.CurDatas:
        pid = oCurData.ID
        oPlayer = oScene.GetPlayer(pid)
        if not oPlayer:
            oPlayer = oScene.CreatePlayer(pid)
        oPos = CDVec3()
        oPos.UnpackVec3(oCurData.Pos)
        oPlayer.SetPos(oPos, True)

    oScene.m_FrameNum = oMsg.CurFrame
    oScene.m_ServePlayerID = oMsg.ServePlayerID
    oScene.m_CurPointServePlayerID = oMsg.CurPointServePlayerID
    oOwnData = oMsg.OwnData
    who.m_ExchangeSkillTimes = oOwnData.CurExchangeSkillTimes
    who.m_HasAbandonedExchangeSkill = oOwnData.IsAbandonExchangeSkill
    for oCDData in oOwnData.CDDatas:
        who.m_ActionCDManager.ReplaceCD(oCDData.HitKey, oCDData.EndFrame)

    who.m_CurSchemeIdx = oOwnData.CurSchemeIdx
    if oScene.GetGameState() != BattleCmd_pb2.GAME_STATE_QUARTER_REST:
        who.DoExchangeSkillScheme()
    oGame.m_ServerFrameNum = oMsg.CurFrame
    oGame.m_LastServerFrameNum = oMsg.CurFrame
    if oGame.m_ClientLogicMode == Common_pb2.CLIENT_LOGIC_MODE_BATTLE:
        oGame.m_ServerData = CServerData(oGame, oGame.m_Prediction.PackPlayerFrameData())


def OnNetStatus(oGame, who, sBuffer):
    SetPacketDataForUnpack(sBuffer)
    iNetStatus = UnpackInt(1)
    oGame.m_StepFrame.SetNetStatus(iNetStatus)


g_BattleCtrlOP = {(BattleCtrl_pb2.BATTLE_CTRL_ALL_LOADING_DONE_MSG): OnAllLoadingDone, 
 (BattleCtrl_pb2.BATTLE_CTRL_HALFWAY_ENTER_MSG): OnHalfWayEnter, 
 (BattleCtrl_pb2.BATTLE_CTRL_NET_STATUS_MSG): OnNetStatus, 
 (BattleCtrl_pb2.BATTLE_CTRL_EXIT_GAME_MSG): OnExitGame, 
 (BattleCtrl_pb2.BATTLE_CTRL_REQ_QUIT_GAME_MSG): OnReqQuitGame}

def OnBattleCtrl(oGame, who, iMsgID, sBuffer):
    func = g_BattleCtrlOP.get(iMsgID)
    if func:
        func(oGame, who, sBuffer)


def OnHit(oGame, who, sBuffer):
    oBadminton = oGame.m_Scene.GetFirstBadminton()
    oHitMsg = BattleCmd_pb2.BattleHitMsg()
    oHitMsg.ParseFromString(sBuffer)
    iHitType = who.m_DoHitAction.CalcHitType()
    if oGame.m_Scene.m_GameState not in (BattleCmd_pb2.GAME_STATE_SERVE, BattleCmd_pb2.GAME_STATE_PLAYING):
        return
    if not who.HasHitKey(oHitMsg.HitKey):
        return
    if oGame.m_Scene.m_GameState == BattleCmd_pb2.GAME_STATE_SERVE:
        if oHitMsg.HitKey == BattleCmd_pb2.HIT_KEY_KEY_ZD:
            return
        who.m_InterruptAction = False
        return who.m_DoHitAction.CouldDoAction() or None
    else:
        if who.m_ActionCDManager.IsInCD(oHitMsg.HitKey, oGame.m_Scene.GetCurEffectiveFrame()):
            return
        else:
            bakRandom = who.m_Random
            iHitActionID = who.m_DoHitAction.CalcHitAction(oHitMsg.HitKey, iHitType)
            who.m_Random = bakRandom
            if not iHitActionID:
                iHitActionID = SWING_SHOT_HIT_ACTION_ID
            oHitMsg.HitActionID = iHitActionID
            oHitAction = who.m_HitActionManager.GetAction(iHitActionID)
            if oHitAction:
                oMoveScale = who.m_DoHitAction.GetActionMoveScale(oHitAction)
                if oMoveScale:
                    PackSintVec3(oHitMsg.MoveScale, oMoveScale * 1000)
        PackSintVec3(oHitMsg.PlayerPos, who.GetPos())
        PackSintVec3(oHitMsg.BadmintonPos, oBadminton.GetPreJudgePos(HITACTION_PREJUDGE_FRAME))
        who.m_ClientHitData = (
         CDVec3.CopyFrom(who.m_Pos), iHitActionID)
        return oHitMsg


def OnHitDir(oGame, who, sBuffer):
    oGame.L2SFrameCmd(oGame.m_StepFrame.m_FrameNum, BattleCmd_pb2.BATTLE_HIT_DIR_MSG, sBuffer)
    return


g_BattleOP = {(BattleCmd_pb2.BATTLE_HIT_MSG): OnHit, 
 (BattleCmd_pb2.BATTLE_HIT_DIR_MSG): OnHitDir}

@Profiler
def OnBattle(oGame, who, iMsgID, sBuffer):
    func = g_BattleOP.get(iMsgID)
    if func:
        oMsg = func(oGame, who, sBuffer)
        if oMsg:
            oGame.SendToLogic(iMsgID, oMsg.SerializeToString())
    else:
        oGame.SendToLogic(iMsgID, sBuffer)


g_ClientCmdOP = {(DCmd_pb2.CMD_BATTLE): OnBattle, 
 (DCmd_pb2.CMD_BATTLE_CTRL): OnBattleCtrl}

def OnClientCmd(oGame, who, iCmd, iMsgID, sBuffer):
    func = g_ClientCmdOP.get(iCmd)
    if func:
        func(oGame, who, iMsgID, sBuffer)
