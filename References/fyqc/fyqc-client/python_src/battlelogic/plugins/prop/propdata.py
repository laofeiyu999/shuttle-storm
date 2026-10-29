# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\plugins\prop\propdata.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 1479 bytes
from battlelogic.common import defines

class CPropData(object):

    def __init__(self):
        self.m_MaxValue = 0
        self.m_MinValue = defines.INT_MAX
        self.m_InitValue = 0
        self.m_MaxMulValue = 0
        self.m_MinMulValue = defines.INT_MIN


class CPropChangeData(object):

    def __init__(self, iAdd=0, iMul=0):
        self.m_AddValue = iAdd
        self.m_MulValue = iMul

    def __repr__(self):
        return "add %s, mul %s" % (self.m_AddValue, self.m_MulValue)

    def Add(self, iAdd=0, iMul=0):
        self.m_AddValue += iAdd
        self.m_MulValue += iMul
