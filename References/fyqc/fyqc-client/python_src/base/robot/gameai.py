# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\base\robot\gameai.py
# Compiled at: 2023-04-06 17:07:51
# Size of source mod 2**32: 723 bytes
from base.protobufdata import BattleCmd_pb2
g_AIHitKey2HitKey = {1:BattleCmd_pb2.HIT_KEY_KEY_P, 
 2:BattleCmd_pb2.HIT_KEY_KEY_D, 
 3:BattleCmd_pb2.HIT_KEY_KEY_GY, 
 4:BattleCmd_pb2.HIT_KEY_KEY_ZD, 
 5:BattleCmd_pb2.HIT_KEY_KEY_DJ}
g_HitKey2AIHitKey = {(BattleCmd_pb2.HIT_KEY_KEY_P): 1, 
 (BattleCmd_pb2.HIT_KEY_KEY_D): 2, 
 (BattleCmd_pb2.HIT_KEY_KEY_GY): 3, 
 (BattleCmd_pb2.HIT_KEY_KEY_ZD): 4, 
 (BattleCmd_pb2.HIT_KEY_KEY_DJ): 5}

def GetHitKeyByAIHitKey(iAIHitKey):
    global g_AIHitKey2HitKey
    return g_AIHitKey2HitKey.get(iAIHitKey, BattleCmd_pb2.HIT_KEY_KEY_NONE)


def GetAIHitKeyByHitKey(iHitKey):
    global g_HitKey2AIHitKey
    return g_HitKey2AIHitKey.get(iHitKey, 0)
