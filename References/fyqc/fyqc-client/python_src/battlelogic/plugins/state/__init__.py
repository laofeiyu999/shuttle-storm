# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\plugins\state\__init__.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 1087 bytes
from base.protobufdata import BattleCmd_pb2

class CAddStateArgs(object):

    def __init__(self, iStateSID):
        self.m_StateSID = iStateSID
        self.m_EffectFrame = 0
        self.m_EffectHit = 0
        self.m_SelectObjectType = BattleCmd_pb2.SELECT_OBJECT_TYPE_SELF
        self.m_CasterID = 0
        self.m_CasterStateType = 0
        self.m_CasterSkillSID = 0
        self.m_EndFrame = 0
        self.m_EndHit = 0
        self.m_IsImmuneBulletTime = False

    def __repr__(self):
        return "state id %d, effect frame %d, effect hit %d, select object type %d, caster id %d, caster state type %d, caster skill id %d, end frame %d, end hit %d" % (
         self.m_StateSID,
         self.m_EffectFrame,
         self.m_EffectHit,
         self.m_SelectObjectType,
         self.m_CasterID,
         self.m_CasterStateType,
         self.m_CasterSkillSID,
         self.m_EndFrame,
         self.m_EndHit)
