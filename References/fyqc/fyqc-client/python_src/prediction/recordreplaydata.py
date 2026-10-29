# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\prediction\recordreplaydata.py
# Compiled at: 2023-04-06 17:03:30
# Size of source mod 2**32: 1657 bytes
from battlelogic.common.debug import LogError
from base.protobufdata import BattleCmd_pb2
from battlelogic.badminton import CHitBadmintonArgs
from defines import GetReRunReplay
import game

def RecReplayDataOnly(func):

    def Wrapper(*args, **dicts):
        if GetReRunReplay():
            return func(*args, **dicts)
        else:
            return

    return Wrapper


@RecReplayDataOnly
def UpdatePostiveSkillData(who, iPlayerID, oMsg):
    oObj = who.m_Scene.GetObject(iPlayerID)
    oObj.m_PositiveSkillData = {}
    for oData in oMsg.PositiveSkillDatas:
        oObj.m_PositiveSkillData[oMsg.SkillID] = oMsg.HitKey


@RecReplayDataOnly
def HitRes(who, iPlayerID, oMsg):
    oObj = who.m_Scene.GetObject(iPlayerID)
    oObj.m_DoHitAction.m_HitKey = oMsg.HitKey
    oHitAction = oObj.TryGetAction(oMsg.ActionID)
    oObj.m_DoHitAction.m_HitAction = oHitAction


@RecReplayDataOnly
def HitEnd(who, iPlayerID):
    oObj = who.m_Scene.GetObject(iPlayerID)
    oObj.m_DoHitAction.m_HitKey = BattleCmd_pb2.HIT_KEY_KEY_NONE
    oObj.m_DoHitAction.m_HitAction = None


@RecReplayDataOnly
def GameState(who, iGameState):
    oScene = who.m_Scene
    if iGameState == BattleCmd_pb2.GAME_STATE_QUARTER_REST:
        oScene.m_ScoreBoard = {}


@RecReplayDataOnly
def ScoreBoard(who, oMsg):
    who.m_Scene.m_ScoreBoard[oMsg.ScoreTeam] = oMsg.Score


@RecReplayDataOnly
def BadmintonCurve(who, oMsg):
    oBadminton = who.m_Scene.GetFirstBadminton()
    if not oBadminton.m_HitBadmintonArgs:
        oBadminton.m_HitBadmintonArgs = CHitBadmintonArgs()
    oBadminton.m_HitBadmintonArgs.m_OutDir = oMsg.OutDir
