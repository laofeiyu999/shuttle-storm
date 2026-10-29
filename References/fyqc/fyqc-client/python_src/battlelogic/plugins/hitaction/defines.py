# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\plugins\hitaction\defines.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 409 bytes
from base.protobufdata import BattleCmd_pb2

def GetValidHitKey(iHitKey, iDefaultHitKey):
    if iHitKey not in (BattleCmd_pb2.HIT_KEY_KEY_D, BattleCmd_pb2.HIT_KEY_KEY_P, BattleCmd_pb2.HIT_KEY_KEY_GY, iDefaultHitKey):
        iHitKey = iDefaultHitKey
    return iHitKey
