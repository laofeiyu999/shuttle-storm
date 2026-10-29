# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\plugins\battleskill\battleskill.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 269 bytes


class CBattleSkill(object):

    def __init__(self, iSkillID, iLevel):
        self.m_ID = iSkillID
        self.m_Level = iLevel

    def GetLevel(self):
        return self.m_Level
