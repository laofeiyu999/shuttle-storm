# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\prediction\recordclientdata.py
# Compiled at: 2023-04-06 17:03:30
# Size of source mod 2**32: 4089 bytes
from base.protobufdata import BattleCmd_pb2
from battlelogic.common.defines import Frame2Sec, BULLET_TIME_DELAY_FRAME
from battlelogic.battlebase.dvec3 import CDVec3
from battlelogic.badminton import CHitBadmintonArgs
from base.protobufdata import Common_pb2
from battlelogic.common.debug import LogError
import game

def NeedRecordClientData(oGame):
    if oGame.m_IsReRunReplay:
        return False
    else:
        return True


def ClearPrejudgeCurve():
    oGame = game.GetGame()
    if not NeedRecordClientData(oGame):
        return
    oGame.m_ClientLogic.m_PrejudgeCurve.Clear()


def RecBadmintonHintHitLastPos(oPos):
    oGame = game.GetGame()
    if oGame.m_IsReRunReplay:
        return
    oGame.m_ClientLogic.m_BadmintonHintHit.m_LastPos = oPos


def EndSmooth(pid):
    oGame = game.GetGame()
    if not NeedRecordClientData(oGame):
        return
    oGame.m_ClientLogic.m_CombatObjectSmoothMove.EndSmooth(pid)


def SetHitRes(iPlayerID, oObj, iActionID):
    oGame = game.GetGame()
    if not NeedRecordClientData(oGame):
        return
    iServerPassFrame = 1 / (oObj.m_BulletTimeScaleMgr.m_BulletTimeScale / 100)
    oGame.m_ClientLogic.m_PrejudgeCurve.SetHitRes(iPlayerID, oGame.m_ServerData.m_FrameNum + iServerPassFrame, iActionID)


def OnBulletTime(who, oObject, iPlayerID, oMsg):
    oGame = game.GetGame()
    if not NeedRecordClientData(oGame):
        return
    if oObject:
        if iPlayerID == who.m_ID:
            oGame.m_NeedRerun = True
    if oObject.m_SceneObjectType == BattleCmd_pb2.SCENE_OBJECT_TYPE_BADMINTON:
        if not oObject.m_CurveData:
            return
        else:
            iFrameSetBulletTimeScale = oGame.m_ServerFrameNum + BULLET_TIME_DELAY_FRAME + 1
            if iFrameSetBulletTimeScale >= oObject.m_Scene.GetCurFrame():
                return
            oBulletTimeScaleMgr = oObject.m_BulletTimeScaleMgr
            del oBulletTimeScaleMgr.m_BulletTimeDelay[iFrameSetBulletTimeScale]
            iOldBulletTimeScale = oBulletTimeScaleMgr.m_BulletTimeScale
            oBulletTimeScaleMgr.m_BulletTimeScale = oMsg.BulletTimeScale
            oObject.m_Scene.m_Phys.SetBulletTimeScale(oObject.m_ID, oMsg.BulletTimeScale)
            iDelta = 0.01 * (oGame.m_Scene.GetCurFrame() - iFrameSetBulletTimeScale) * (oMsg.BulletTimeScale - iOldBulletTimeScale)
            bIsSmooth = oMsg.IsSmooth
            if bIsSmooth:
                if iDelta:
                    oGame.m_ClientLogic.m_BadmintonSmoothMove.BeginSmooth(oGame)
            oGame.m_ClientLogic.m_BadmintonHintHit.m_LastPos = CDVec3(0, 0, 0)
            if iDelta:
                oObject.m_CurveData.AddPassTime(Frame2Sec(iDelta))


def PreJudgeCurve(who, iPlayerID, oMsg):
    oGame = game.GetGame()
    if not NeedRecordClientData(oGame):
        return
    oPlayer = who.m_Scene.GetObject(iPlayerID)
    oHitArgs = CHitBadmintonArgs()
    oHitArgs.m_AtkPlayerID = iPlayerID
    oHitArgs.m_StartPos = CDVec3.UnpackCDVec3(oMsg.StartPos)
    oHitArgs.m_DropPos = CDVec3.UnpackCDVec3(oMsg.DropPos)
    oHitArgs.m_HitKey = oMsg.HitKey
    oHitArgs.m_CurveID = oMsg.CurveID
    oHitArgs.m_AverageSpeedMul = oMsg.AverageSpeedMul
    oHitArgs.m_DropPosGatherValue = oPlayer.GetPropValue(Common_pb2.BATTLE_PROP_TYPE_DROPPOS_GATHER) / 100
    oHitArgs.m_AtkActionSID = oMsg.ActionID
    oBadminton = who.m_Scene.GetFirstBadminton()
    oBadminton.m_BulletTimeScaleMgr.m_BulletTimeScaleCache = (oMsg.BadmintonBulletTimeScale, True)
    oGame.m_ClientLogic.m_PrejudgeCurve.SetHitArgs(oGame, iPlayerID, oMsg.HitFrame, oHitArgs)


def NeedSmooth(oSrcPos, oDesPos):
    oDelta = oDesPos - oSrcPos
    if abs(oDelta.m_X) > 5 or abs(oDelta.m_Y) > 5 or abs(oDelta.m_Z) > 5:
        return True
    else:
        return False


def BeginSmooth(oPlayer, oPos):
    oGame = game.GetGame()
    if not NeedRecordClientData(oGame):
        return
    else:
        if NeedSmooth(oPlayer.m_Pos, oPos):
            if oPlayer.m_ID == oGame.m_HeroId:
                oGame.m_ClientLogic.m_CombatObjectServerSmoothMove.BeginSmooth(oGame)
            else:
                oGame.m_ClientLogic.m_CombatObjectSmoothMove.BeginSmooth(oGame, oPlayer.m_ID, oPlayer.m_Pos)
                oPlayer.SetPos(oPos, bDelta=False)
