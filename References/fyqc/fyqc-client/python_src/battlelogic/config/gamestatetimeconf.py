# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\config\gamestatetimeconf.py
# Compiled at: 2023-04-06 17:07:52
# Size of source mod 2**32: 848 bytes
from base.protobufdata import BattleCmd_pb2
from base.data import gametime
from battlelogic.common.defines import FRAME
g_GameStateLastTimeConf = {(BattleCmd_pb2.GAME_STATE_START_MOVIE): (10 * FRAME), 
 (BattleCmd_pb2.GAME_STATE_REPLAY): (3 * FRAME), 
 (BattleCmd_pb2.GAME_STATE_READY_SERVE): (8 + 2 * FRAME), 
 (BattleCmd_pb2.GAME_STATE_QUARTER_REST): (11 * FRAME), 
 (BattleCmd_pb2.GAME_STATE_SERVE): (15 * FRAME)}

def GetGameStateLastTime(iGameState):
    if iGameState not in g_GameStateLastTimeConf:
        return 0
    else:
        iFrame = gametime.GetGameStateLastTime(iGameState)
        if iFrame:
            return iFrame
        return g_GameStateLastTimeConf[iGameState]
