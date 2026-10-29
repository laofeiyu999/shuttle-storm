# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\sceneplugins\courtplay\courtmonster.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 1205 bytes
from base.protobufdata import Common_pb2
from battlelogic import monster
from battlelogic.battlebase.dvec3 import CDVec3

class CCourtMonster:

    def __init__(self, iMonsterIdx, dMonster):
        self.m_Idx = iMonsterIdx
        self.m_ID = None
        self.m_BornVec = None
        self.m_NextBornFrame = None
        self.m_IntervalFrame = None
        self.Init(dMonster)

    def Init(self, dMonster):
        self.m_ID = dMonster[0]
        self.m_BornVec = dMonster[1]

    def SetNextBornFrame(self, iNextBornFrame):
        self.m_NextBornFrame = iNextBornFrame

    def SetIntervalFrame(self, iIntervalFrame):
        self.m_IntervalFrame = iIntervalFrame

    def GetNextBornFrame(self):
        return self.m_NextBornFrame

    def GetIntervalFrame(self):
        return self.m_IntervalFrame

    def Born(self, oScene):
        oBornPos = self.GetRandomVec(oScene)
        if not oBornPos:
            return
        oMonster = oScene.CreateMonster(self.m_ID, None)
        oMonster.SetMemberType(Common_pb2.TEAM_MEMBER_TYPE_NONE)
        oMonster.SetPos(oBornPos, True)

    def GetRandomVec(self, oScene):
        iLength = len(self.m_BornVec)
        if not iLength:
            return
        else:
            iBronVecIdx = oScene.RandomBetween(0, iLength)
            tPos = self.m_BornVec[iBronVecIdx]
            return CDVec3(tPos[0], tPos[1], tPos[2])
