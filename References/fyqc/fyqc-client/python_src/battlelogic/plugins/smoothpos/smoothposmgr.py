# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\plugins\smoothpos\smoothposmgr.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 1771 bytes
from battlelogic.battlebase.dvec3 import CDVec3
from battlelogic.common.logicutil import AdjustDirByMemberType
from base.protobufdata import BattleCmd_pb2
from battlelogic.common.decorator import ServerOnly
from battlelogic.common.defines import IsServer
from battlelogic.common.debug import LogError

class CSmoothPosMgr(object):

    def __init__(self, oOwner):
        self.m_Owner = oOwner
        self.m_IsSmoothing = False
        self.m_ClientPos = CDVec3()
        self.m_Delta = CDVec3()
        self.m_ClientMoveDir = CDVec3()

    def BeginSmooth(self):
        self.m_IsSmoothing = True

    def EndSmooth(self):
        self.m_ClientPos = CDVec3()
        self.m_Delta = CDVec3()
        self.m_IsSmoothing = False
        self.SendIsSmooth()

    def SetClinetMoveDir(self, oDir):
        self.m_ClientMoveDir = oDir

    def SetClientPos(self, oPos, oLastPos):
        self.m_ClientPos = oPos
        if self.NeedSmooth(oLastPos):
            self.BeginSmooth()
        else:
            self.EndSmooth()
        self.RecalcMoveDir()

    def NeedSmooth(self, oPos):
        self.m_Delta = oPos - self.m_Owner.GetPos()
        if abs(self.m_Delta.m_X) > 8 or abs(self.m_Delta.m_Z) > 8:
            return True
        else:
            return False

    def RecalcMoveDir(self):
        if self.m_IsSmoothing:
            oMoveDir = self.m_ClientPos - self.m_Owner.GetPos()
        else:
            oMoveDir = CDVec3.CopyFrom(self.m_ClientMoveDir)
        if oMoveDir != self.m_Owner.m_MoveDir:
            self.m_Owner.SetMoveDir(oMoveDir)
        self.m_Owner.OnHandleMove()

    def SendIsSmooth(self):
        oMsg = BattleCmd_pb2.BattleServerSmoothPosMsg()
        oMsg.IsSmoothing = self.m_IsSmoothing
        self.m_Owner.UpdatePersonalDelta(BattleCmd_pb2.BATTLE_SERVER_SMOOTH_POS_MSG, oMsg)

    def Reset(self):
        self.EndSmooth()
        self.m_ClientMoveDir = CDVec3()

    def DoRelease(self):
        self.m_Owner = None
