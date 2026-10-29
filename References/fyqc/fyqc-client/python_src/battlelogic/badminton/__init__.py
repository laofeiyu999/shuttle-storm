# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\badminton\__init__.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 1183 bytes
from battlelogic.battlebase.dvec3 import CDVec3
from base.protobufdata import BattleCmd_pb2

class CHitBadmintonArgs(object):

    def __init__(self):
        self.m_AtkPlayerID = 0
        self.m_AtkSkillSID = 0
        self.m_AtkActionSID = 0
        self.m_AtkCurveID = 0
        self.m_DefPlayerID = 0
        self.m_DefSkillSID = 0
        self.m_DefActionSID = 0
        self.m_DefCurveID = 0
        self.m_HitKey = BattleCmd_pb2.HIT_KEY_KEY_NONE
        self.m_HitType = BattleCmd_pb2.HIT_TYPE_NONE
        self.m_HitDir = CDVec3.Zero()
        self.m_HitAction = None
        self.m_StartPos = CDVec3.Zero()
        self.m_OutDir = 0
        self.m_IsServe = False
        self.m_DropPos = None
        self.m_DropPosGatherValue = 0
        self.m_DropPosOffsetX = -1
        self.m_DropPosOffsetZ = -1

    def __repr__(self):
        return "ctrl %s, hitkey %s, startpos %s, droppos %s, outdir %s, isserve %s , actionsid %s, defactionsid %d, hittype %d" % (
         self.m_AtkPlayerID,
         self.m_HitKey,
         self.m_StartPos,
         self.m_DropPos,
         self.m_OutDir,
         self.m_IsServe,
         self.m_AtkActionSID,
         self.m_DefActionSID,
         self.m_HitType)
