# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\__init__.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 498 bytes
from . import bot

def InitData():
    import base.data.curve.curveconstant, base.data.curve.curvedrop, base.data.curve.fallingcurve, base.data.curve.normalcurve, base.data.curve.normalfakedropcurve, base.data.curve.paraboladowncurve, base.data.curve.turnaroundcurve, base.data.curve.curvedata


def MyInit():
    bot.MyInit()
    InitData()
