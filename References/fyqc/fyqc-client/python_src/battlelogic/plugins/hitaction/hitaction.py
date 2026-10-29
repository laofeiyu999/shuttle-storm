# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\plugins\hitaction\hitaction.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 1076 bytes
from base.data import GetHitActionData
from base.protobufdata import BattleCmd_pb2
from battlelogic.battlebase.dvec3 import CDVec3

class CHitAction(object):

    def __init__(self, iHitActionSID, iSkillID, iHitKey, oOwner):
        self.m_ID = iHitActionSID
        self.m_SkillID = iSkillID
        self.m_HitKey = iHitKey
        self.m_Owner = oOwner
        self.m_RandomCache = {}

    def Init(self):
        return

    def GetSkillSID(self):
        return self.m_SkillID

    def GetHitKey(self):
        if not self.m_HitKey:
            oActionData = GetHitActionData(self.m_ID)
            return oActionData.m_HitKey
        else:
            return self.m_HitKey

    def GetRandomCache(self, sName):
        if sName in self.m_RandomCache:
            return self.m_RandomCache[sName]
        else:
            iRandom = self.m_Owner.RandomBetween(0, 10001)
            self.m_RandomCache[sName] = iRandom
            return iRandom

    def ClearCache(self):
        self.m_RandomCache = {}

    def DoRelease(self):
        self.m_Owner = None
