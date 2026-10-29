# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\plugins\bullettime\bullettimemanager.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 4791 bytes
from base.protobufdata import BattleCmd_pb2
from battlelogic.common.defines import BULLET_TIME_DELAY_FRAME
from battlelogic.common.decorator import NoPrediction
from battlelogic.common.debug import LogError

class CButtleTimeMgr(object):

    def __init__(self, oOwner):
        self.m_Owner = oOwner
        self.m_BulletTimeScale = 100
        self.m_BulletTimeRec = {}
        self.m_BulletTimeScaleCache = ()
        self.m_BulletTimeDelay = {}

    def AddBulletTimeScale(self, iStateSID, iValue, bIsSmooth):
        self.m_BulletTimeRec[iStateSID] = (
         iValue, bIsSmooth)
        self.SetMinBulletTimeScaleFromRec()

    def RemoveBulletTimeScale(self, iStateSID, iOldValue):
        if iStateSID not in self.m_BulletTimeRec:
            return
        del self.m_BulletTimeRec[iStateSID]
        self.SetMinBulletTimeScaleFromRec()

    def SetMinBulletTimeScaleFromRec(self):
        if not self.m_BulletTimeRec:
            self.ResetBulletTimeScale()
            return
        iMinBulletTimeScale = 0
        bNeedSmooth = True
        for iBulletTimeScale, bIsSmooth in self.m_BulletTimeRec.values():
            if iMinBulletTimeScale != 0:
                if iBulletTimeScale >= iMinBulletTimeScale:
                    continue
            iMinBulletTimeScale = iBulletTimeScale
            bNeedSmooth = bIsSmooth

        self.SetBulletTimeScale(iMinBulletTimeScale, bNeedSmooth)

    def ResetBulletTimeScale(self):
        self.m_BulletTimeRec = {}
        self.m_BulletTimeScaleCache = ()
        self.SetBulletTimeScale(100)

    def SetBulletTimeScale(self, iValue, bIsSmooth=True):
        oScene = self.m_Owner.m_Scene
        oBadminton = oScene.GetFirstBadminton()
        if oBadminton.m_IsPrejudeHit:
            self.m_BulletTimeScaleCache = (
             iValue, bIsSmooth)
            return
        iFrame = oScene.GetCurFrame()
        self.m_BulletTimeDelay[iFrame + BULLET_TIME_DELAY_FRAME] = (iValue, bIsSmooth)
        self.OnBulletTimeScale(bIsSmooth)

    def GetBulletTimeScale(self):
        iCurFrame = self.m_Owner.m_Scene.GetCurFrame()
        iCurBulletTimeScale = self.m_BulletTimeScale
        for iFrame in range(iCurFrame, iCurFrame + BULLET_TIME_DELAY_FRAME + 1):
            if iFrame not in self.m_BulletTimeDelay:
                pass
            else:
                iCurBulletTimeScale, bIsSmooth = self.m_BulletTimeDelay[iFrame]

        return iCurBulletTimeScale

    @NoPrediction
    def OnBulletTimeScale(self, bIsSmooth):
        oDelta = self.GetBulletTimeScaleMsg()
        oDelta.IsSmooth = bIsSmooth
        self.m_Owner.AddDelta(BattleCmd_pb2.BATTLE_OBJ_BULLET_TIME_MSG, oDelta)

    def GetBulletTimeScaleMsg(self):
        oDelta = BattleCmd_pb2.BattleObjBulletTimeMsg()
        oDelta.ID = self.m_Owner.m_ID
        oDelta.BulletTimeScale = self.GetBulletTimeScale()
        oDelta.IsSmooth = True
        return oDelta

    def TrySetBulletTimeScale(self):
        iFrame = self.m_Owner.m_Scene.GetCurFrame()
        if iFrame not in self.m_BulletTimeDelay:
            return
        iBulletTimeScale, bIsSmooth = self.m_BulletTimeDelay[iFrame]
        del self.m_BulletTimeDelay[iFrame]
        if iBulletTimeScale == self.m_BulletTimeScale:
            return
        oScene = self.m_Owner.m_Scene
        oBadminton = oScene.GetFirstBadminton()
        if oBadminton.m_IsPrejudeHit:
            self.m_BulletTimeScaleCache = (
             iBulletTimeScale, bIsSmooth)
            return
        self.m_BulletTimeScale = iBulletTimeScale
        self.m_Owner.m_Scene.m_Phys.SetBulletTimeScale(self.m_Owner.m_ID, iBulletTimeScale)
        self.OnDoSetBulletTimeScale()

    def OnSetBadmintonIsPrejudeHit(self, bIsPrejudeHit):
        if bIsPrejudeHit:
            return
        if not self.m_BulletTimeScaleCache:
            return
        iBulletTimeScale, bIsSmooth = self.m_BulletTimeScaleCache
        self.m_BulletTimeScaleCache = ()
        self.m_BulletTimeScale = iBulletTimeScale
        self.m_Owner.m_Scene.m_Phys.SetBulletTimeScale(self.m_Owner.m_ID, iBulletTimeScale)
        self.OnDoSetBulletTimeScale()

    def ExecuteLoop(self):
        self.TrySetBulletTimeScale()

    def DoRelease(self):
        self.m_BulletTimeRec = {}
        self.m_BulletTimeScaleCache = ()
        self.m_BulletTimeDelay = {}
        self.m_Owner = None

    def OnDoSetBulletTimeScale(self):
        oDelta = BattleCmd_pb2.BattleObjDoSetBulletTimeMsg()
        oDelta.ID = self.m_Owner.m_ID
        oDelta.BulletTimeScale = self.m_BulletTimeScale
        oDelta.IsSmooth = True
        self.m_Owner.AddDelta(BattleCmd_pb2.BATTLE_OBJ_DO_SET_BULLET_TIME_MSG, oDelta)

    def GetPreJudgeBulletTimeScale(self):
        if not self.m_BulletTimeScaleCache:
            return self.m_BulletTimeScale
        else:
            iBulletTimeScale, bIsSmooth = self.m_BulletTimeScaleCache
            return iBulletTimeScale
