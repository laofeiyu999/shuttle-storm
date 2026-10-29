# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\plugins\behavior\behaviormanager.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 3624 bytes
from base.protobufdata import BattleCmd_pb2
from battlelogic.common.debug import Log, LogWarning, LogError

class CBehaviorManager(object):

    def __init__(self, oOwner):
        self.m_Owner = oOwner
        self.m_BehaviorData = {}
        self.m_BehaviorFlag = 0

    def AddBehavior(self, iBehaviorType, sSrcKey):
        if iBehaviorType not in self.m_BehaviorData:
            self.m_BehaviorData[iBehaviorType] = {}
        self.m_BehaviorData[iBehaviorType][sSrcKey] = True
        self.OnAdd(iBehaviorType)
        lastFlag = self.m_BehaviorFlag
        self.m_BehaviorFlag = lastFlag | 1 << iBehaviorType
        if self.m_BehaviorFlag != lastFlag:
            self.GS2CBehavior()

    def GS2CBehavior(self):
        if not self.m_Owner:
            return
        oMsg = BattleCmd_pb2.BattleBehaviorMsg()
        oMsg.Behavior = self.m_BehaviorFlag
        self.m_Owner.UpdateDelta(BattleCmd_pb2.BATTLE_BEHAVIOR_MSG, oMsg)

    def RemoveBehavior(self, iBehaviorType, sSrcKey):
        if iBehaviorType not in self.m_BehaviorData:
            return
        else:
            if sSrcKey not in self.m_BehaviorData[iBehaviorType]:
                return
            del self.m_BehaviorData[iBehaviorType][sSrcKey]
            if len(self.m_BehaviorData[iBehaviorType]) <= 0:
                self.ClearType(iBehaviorType)
                self.m_BehaviorFlag = self.m_BehaviorFlag & ~(1 << iBehaviorType)
                self.GS2CBehavior()

    def HasBehavior(self, iBehaviorType):
        if 1 << iBehaviorType & self.m_BehaviorFlag:
            return True
        else:
            return False

    def GetAllBehavior(self):
        return self.m_BehaviorData

    def HasTheBehavior(self, iBehaviorType, sSrcKey):
        if iBehaviorType not in self.m_BehaviorData:
            return False
        else:
            if sSrcKey not in self.m_BehaviorData[iBehaviorType]:
                return False
            return True

    def ClearType(self, iBehaviorType):
        if iBehaviorType not in self.m_BehaviorData:
            return
        del self.m_BehaviorData[iBehaviorType]
        self.OnClear(iBehaviorType)

    def OnClear(self, iBehaviorType):
        if not self.m_Owner:
            return
        else:
            if iBehaviorType == BattleCmd_pb2.BEHAVIOR_TYPE_FORBIT_MOVE:
                self.m_Owner.OnHandleMove()
            if iBehaviorType == BattleCmd_pb2.BEHAVIOR_TYPE_INVERSE_JOYSTICK:
                self.m_Owner.OnHandleMove()

    def OnAdd(self, iBehaviorType):
        if not self.m_Owner:
            return
        else:
            if iBehaviorType == BattleCmd_pb2.BEHAVIOR_TYPE_FORBIT_MOVE:
                self.m_Owner.Stop()
            if iBehaviorType == BattleCmd_pb2.BEHAVIOR_TYPE_INVERSE_JOYSTICK:
                self.m_Owner.OnHandleMove()

    def SetBehaviorFlag(self, iFlag):
        iMoveFlag = 1 << BattleCmd_pb2.BEHAVIOR_TYPE_FORBIT_MOVE & 1 << BattleCmd_pb2.BEHAVIOR_TYPE_INVERSE_JOYSTICK
        if self.m_BehaviorFlag & iMoveFlag != iFlag & iMoveFlag:
            if not self.m_BehaviorFlag & 1 << BattleCmd_pb2.BEHAVIOR_TYPE_FORBIT_MOVE:
                if iFlag & 1 << BattleCmd_pb2.BEHAVIOR_TYPE_FORBIT_MOVE:
                    self.m_Owner.Stop()
                else:
                    self.m_Owner.OnHandleMove()
        self.m_BehaviorFlag = iFlag

    def DoRelease(self):
        self.m_Owner = None
