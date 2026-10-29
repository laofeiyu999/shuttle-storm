# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\common\speedvalue.py
# Compiled at: 2023-04-06 17:07:52
# Size of source mod 2**32: 555 bytes


class CSpeedValue(object):
    __slots__ = [
     'm_SpeedForward', 'm_SpeedBack', 'm_SpeedLeft', 'm_SpeedRight', 
     'm_DropPosSpeedMul', 'm_DropPosAngle', 'm_Acceleration']

    def __init__(self, fSpeedForward, fSpeedBack, fSpeedLeft, fSpeedRight, fDropPosSpeedMul, iDropPosAngle):
        self.m_SpeedForward = fSpeedForward
        self.m_SpeedBack = fSpeedBack
        self.m_SpeedLeft = fSpeedLeft
        self.m_SpeedRight = fSpeedRight
        self.m_DropPosSpeedMul = fDropPosSpeedMul
        self.m_DropPosAngle = iDropPosAngle
