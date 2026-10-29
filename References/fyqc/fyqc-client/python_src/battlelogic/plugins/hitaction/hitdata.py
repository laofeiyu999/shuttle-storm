# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\plugins\hitaction\hitdata.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 763 bytes
from base.protobufdata import BattleCmd_pb2
from battlelogic.battlebase.dvec3 import CDVec3
from battlelogic.common.debug import LogWarning

class CHitData(object):

    def __init__(self):
        self.Init()

    def __repr__(self):
        return "id %s, state %s, hited %s, passframe %s, hitargs %s, hitframe %s" % (
         self.m_ID,
         self.m_State,
         self.m_Hited,
         self.m_PassFrame,
         self.m_HitArgs,
         self.m_HitFrame)

    def Init(self):
        self.m_ID = 0
        self.m_State = BattleCmd_pb2.HITACTION_STATE_NONE
        self.m_Hited = False
        self.m_PassFrame = 0
        self.m_HitArgs = None
        self.m_HitFrame = -1
        self.m_MoveDir = None

    def ClearHitData(self):
        self.Init()
