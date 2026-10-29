# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\sceneplugins\courtplay\courtplay.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 2382 bytes
from base.data import GetCourtPlayData
from base.protobufdata import BattleCmd_pb2
from .courtmonster import CCourtMonster
from battlelogic.plugins.state import CAddStateArgs

class CCourtPlay(object):

    def __init__(self, iID, oScene):
        self.m_TableID = iID
        self.m_Scene = oScene
        self.m_MonsterCircleBorn = {}
        self.m_MinCheckCircleFrame = None
        self.Init()

    def Init(self):
        self.AddMonsterBorn()

    def GetScene(self):
        return self.m_Scene

    def CircleTimeBorn(self):
        if not self.m_MonsterCircleBorn:
            self.m_MinCheckCircleFrame = None
            return
        iCurEffectiveFrame = self.m_Scene.GetCurEffectiveFrame()
        if iCurEffectiveFrame < self.m_MinCheckCircleFrame:
            return
        nextBornFrameLst = []
        for iMonsterIdx, oMonster in self.m_MonsterCircleBorn.items():
            iNextBornFrame = oMonster.GetNextBornFrame()
            iIntervalFrame = oMonster.GetIntervalFrame()
            if iNextBornFrame <= iCurEffectiveFrame:
                oMonster.Born(self.m_Scene)
            iNextBornFrame += iIntervalFrame
            oMonster.SetNextBornFrame(iNextBornFrame)
            nextBornFrameLst.append(iNextBornFrame)

        self.m_MinCheckCircleFrame = min(nextBornFrameLst)

    def ExecuteLoop(self):
        self.CircleTimeBorn()

    def AddMonsterBorn(self):
        oCourtPlayData = GetCourtPlayData(self.m_TableID)
        oCourtPlayData.AddMonsterBorn(self)

    def AddMonsterCircleTimeBorn(self, iMonsterIdx, iIntervalFrame):
        iCurEffectiveFrame = self.m_Scene.GetCurEffectiveFrame()
        if iCurEffectiveFrame is None:
            iCurEffectiveFrame = 0
        oCourtPlayData = GetCourtPlayData(self.m_TableID)
        dMonster = oCourtPlayData.m_MonsterDct[iMonsterIdx]
        oMonster = CCourtMonster(iMonsterIdx, dMonster)
        iNextBornFrame = iCurEffectiveFrame + iIntervalFrame
        oMonster.SetNextBornFrame(iNextBornFrame)
        oMonster.SetIntervalFrame(iIntervalFrame)
        self.m_MonsterCircleBorn[iMonsterIdx] = oMonster
        if self.m_MinCheckCircleFrame is None:
            self.m_MinCheckCircleFrame = iNextBornFrame
        elif self.m_MinCheckCircleFrame > iNextBornFrame:
            self.m_MinCheckCircleFrame = iNextBornFrame

    def InitStateByCourtPlay(self, oPlayer):
        oCourtPlayData = GetCourtPlayData(self.m_TableID)
        oAddStateArgs = CAddStateArgs(0)
        for iStateSID in oCourtPlayData.m_StateLst:
            oAddStateArgs.m_StateSID = iStateSID
            oPlayer.DoAddState(oAddStateArgs)

    def DoRelease(self):
        self.m_Scene = None
