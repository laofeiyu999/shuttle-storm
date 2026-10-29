# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\prediction\defines.py
# Compiled at: 2023-04-06 17:03:30
# Size of source mod 2**32: 954 bytes
from base.protobufdata import BattleCmd_pb2
import C_net, struct
PredictionMsg = {
 BattleCmd_pb2.BATTLE_POS_MSG,
 BattleCmd_pb2.BATTLE_MOVE_TYPE_MSG,
 BattleCmd_pb2.BATTLE_FACING_MSG,
 BattleCmd_pb2.BATTLE_HIT_RES_MSG,
 BattleCmd_pb2.BATTLE_NOTIFY_MSG,
 BattleCmd_pb2.BATTLE_FRAME_STATE_MSG}
PredictionCmd = {
 BattleCmd_pb2.BATTLE_HIT_MSG,
 BattleCmd_pb2.BATTLE_HIT_DIR_MSG,
 BattleCmd_pb2.BATTLE_JOYSTICK_DIR_MSG,
 BattleCmd_pb2.BATTLE_GM_COMMAND}
ScenePredictionMsg = {
 BattleCmd_pb2.BATTLE_BADMINTON_NET_SHOT_MSG}

def IsPredictionMsg(iMsg):
    return iMsg in PredictionMsg


def IsPredictionCmd(iCmd):
    return iCmd in PredictionCmd


def IsScenePredictionMsg(iMsg):
    return iMsg in ScenePredictionMsg
