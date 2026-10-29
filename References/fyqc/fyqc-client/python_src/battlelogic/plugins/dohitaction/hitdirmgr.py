# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\plugins\dohitaction\hitdirmgr.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 1746 bytes
from battlelogic.battlebase.dvec3 import CDVec3
from base.protobufdata import BattleCmd_pb2
from battlelogic.common.logicutil import ConvertHitDirToDirType, AdjustDirByMemberType
HIT_DIR_CHANGE = 10

class CHitDirMgr:

    def __init__(self, oOwner):
        self.m_Owner = oOwner
        self.m_OriHitDir = CDVec3.Zero()
        self.m_LastHitDir = None
        self.m_IsInverse = False

    def SetInitHitDir(self, oDir):
        oPlayer = self.GetPlayer()
        if oPlayer.m_BehaviorManager.HasBehavior(BattleCmd_pb2.BEHAVIOR_TYPE_INVERSE_JOYSTICK):
            self.SetInverseDir()
        self.m_OriHitDir = self.RecalcDir(oDir)

    def SetLastHitDir(self, oDir):
        self.m_LastHitDir = self.RecalcDir(oDir)
        oPlayer = self.GetPlayer()

    def GetFinalHitDir(self):
        oPlayer = self.GetPlayer()
        iOutDir = ConvertHitDirToDirType(self.m_OriHitDir, oPlayer.GetMemberType())
        iOriX = self.m_OriHitDir.m_X
        if self.m_LastHitDir is None:
            return iOutDir
        else:
            iLastX = self.m_LastHitDir.m_X
            if iLastX == 0:
                iOutDir = BattleCmd_pb2.BADMINTON_OUT_DIR_NONE
            else:
                if abs(iOriX - iLastX) >= HIT_DIR_CHANGE:
                    oDir = self.m_LastHitDir - self.m_OriHitDir
                    iOutDir = ConvertHitDirToDirType(oDir, oPlayer.GetMemberType())
            return iOutDir

    def GetPlayer(self):
        return self.m_Owner.m_Owner

    def RecalcDir(self, oDir):
        oPlayer = self.GetPlayer()
        oDir = AdjustDirByMemberType(oDir, oPlayer.GetMemberType())
        if oPlayer.m_BehaviorManager.HasBehavior(BattleCmd_pb2.BEHAVIOR_TYPE_ONLY_HIT_MIDDLE):
            oDir = CDVec3(0, 0, 0)
        return oDir

    def SetInverseDir(self):
        if self.m_OriHitDir:
            self.m_OriHitDir

    def ClearHitDir(self):
        self.m_OriHitDir = CDVec3.Zero()
        self.m_LastHitDir = None
        self.m_IsInverse = False
