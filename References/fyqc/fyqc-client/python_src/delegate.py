# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\delegate.py
# Compiled at: 2023-04-06 17:03:31
# Size of source mod 2**32: 472 bytes
from battlelogic.common.logicdelegate import Override

@Override("battlelogic.common.defines")
def IsServer():
    return False


@Override("battlelogic.common.defines")
def IsEnableLog():
    if game.GetGame().IsLocalGame():
        return True
    else:
        return False


@Override("battlelogic.common.defines")
def GetClientGame():
    return game.GetGame()


import game
