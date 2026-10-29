# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\stepframe.py
# Compiled at: 2023-04-06 17:03:30
# Size of source mod 2**32: 2803 bytes
from base.protobufdata import Common_pb2
from battlelogic.common.debug import LogWarning, LogError
import time, game, C_net
DEFAULT_FRAME_RATE = 25
DEFAULT_FRAME_TIME = 0.04
CLIENT_AHEAD_FRAME_NUM = 3

class CStepFrame:

    def __init__(self):
        self.m_StartTime = 0
        self.m_StartFrame = 0
        self.m_FrameRate = DEFAULT_FRAME_RATE
        self.m_FrameTime = DEFAULT_FRAME_TIME
        self.m_LoadingDone = False
        self.m_FrameNum = 0
        self.m_NetStatus = Common_pb2.NET_STATUS_NORMAL

    def LoadingDone(self, iCurFrame):
        self.m_LoadingDone = True
        self.SetFrameNum(iCurFrame)

    def SetFrameNum(self, iCurFrame):
        self.m_StartTime = time.time()
        self.m_StartFrame = iCurFrame
        self.m_FrameRate = DEFAULT_FRAME_RATE
        self.m_FrameTime = DEFAULT_FRAME_TIME
        self.m_FrameNum = iCurFrame

    def SetFrameRate(self, iFrameRate):
        self.m_FrameRate = iFrameRate
        self.m_StartTime = self.m_StartTime + (self.m_FrameNum - self.m_StartFrame) * self.m_FrameTime
        self.m_FrameTime = 1.0 / self.m_FrameRate
        self.m_StartFrame = self.m_FrameNum

    def SetNetStatus(self, iNetStatus):
        if iNetStatus == self.m_NetStatus:
            if iNetStatus != Common_pb2.NET_STATUS_SUPER_DELAY:
                return
        self.m_NetStatus = iNetStatus
        if iNetStatus == Common_pb2.NET_STATUS_SUPER_DELAY:
            iFrameNum = C_net.UnpackInt(4)
            if self.m_FrameNum < iFrameNum + CLIENT_AHEAD_FRAME_NUM:
                self.SetFrameNum(iFrameNum + CLIENT_AHEAD_FRAME_NUM)
            self.SetFrameRate(25.2)
        elif iNetStatus == Common_pb2.NET_STATUS_DELAY:
            self.SetFrameRate(25.1)
        elif iNetStatus == Common_pb2.NET_STATUS_AHEAD:
            self.SetFrameRate(24.9)
        else:
            self.SetFrameRate(25)

    def FixApplationPause(self):
        if self.m_StartTime == 0:
            return
        else:
            iFrameNum = int(self.m_StartFrame + (time.time() - self.m_StartTime) / self.m_FrameTime)
            iDeltaFrame = iFrameNum - self.m_FrameNum
            if iDeltaFrame < 15:
                return
            oGame = game.GetGame()
            if oGame.IsLocalGame():
                self.m_StartTime += iDeltaFrame * self.m_FrameTime
            else:
                self.m_FrameNum += iDeltaFrame

    def CouldStep(self):
        if not self.m_LoadingDone:
            return False
        else:
            if time.time() - self.m_StartTime - (self.m_FrameNum - self.m_StartFrame) * self.m_FrameTime <= self.m_FrameTime:
                return False
            return True

    def GetClientPassFrame(self):
        if not self.m_LoadingDone:
            return 0
        else:
            iFloatFrame = (time.time() - self.m_StartTime - (self.m_FrameNum - self.m_StartFrame) * self.m_FrameTime) / self.m_FrameTime
            if iFloatFrame >= 1 or iFloatFrame < 0:
                return 0
            return iFloatFrame
