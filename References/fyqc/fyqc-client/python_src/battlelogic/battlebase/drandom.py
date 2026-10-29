# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\battlebase\drandom.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 1843 bytes
import time
from C_random import CRandom

class CGameRandom(object):

    def __init__(self):
        iSeed = int(time.time())
        self.m_RandomObj = CRandom(iSeed)

    def SetRandomSeed(self, iSeed):
        self.m_RandomObj.seed(iSeed)

    def Random(self, iMax):
        return self.m_RandomObj.RandInt(0, iMax - 1)

    def RandomList(self, datalist):
        return self.m_RandomObj.RandList(datalist)

    def ChooseKey(self, dRatio, iTotal=0):
        return self.m_RandomObj.ChooseKey(dRatio, iTotal)

    def ShufferList(self, datalist, iNum=0):
        return self.m_RandomObj.ShufferList(datalist, iNum)

    def GetRandomCard(self, iSize, iMax, get_off=None):
        return self.m_RandomObj.GetRandomCard(iSize, iMax, get_off)

    def Save(self):
        return self.m_RandomObj.Save()

    def Load(self, data):
        if not data:
            return
        self.m_RandomObj.Load(data)
