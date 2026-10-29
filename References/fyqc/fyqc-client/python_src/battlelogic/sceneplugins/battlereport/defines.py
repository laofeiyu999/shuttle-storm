# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\sceneplugins\battlereport\defines.py
# Compiled at: 2023-04-06 17:07:52
# Size of source mod 2**32: 572 bytes
BATTLE_REPORT_ROW_TYPE_ACTION = 1
BATTLE_REPORT_ROW_TYPE_STATE = 2
BATTLE_REPORT_ROW_TYPE_CURVE = 3

class CBattleReportRowData(object):

    def __init__(self, iSkillSID):
        self.m_SkillSID = iSkillSID
        self.m_UseTimes = 0
        self.m_HitTimes = 0
        self.m_RetrieveHitTimes = 0
        self.m_ScoreTimes = 0
        self.m_EnemyHitTimes = 0
        self.m_EnemyRetrieveHitTimes = 0
        self.m_LoseTimes = 0
