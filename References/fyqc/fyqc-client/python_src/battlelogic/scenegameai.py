# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\scenegameai.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 995 bytes
from .scenebattle import CSceneBattle
from base.protobufdata import Common_pb2
from battlelogic.common.defines import GetEnemyMemberType
from base.protobufdata import BattleCmd_pb2
from battlelogic.common.defines import IsPlayerObjectID
from battlelogic.common.debug import Log, LogWarning, LogError
from battlelogic.battlebase.dvec3 import CDVec3
from base.data import GetCourtData

class CSceneGameAI(CSceneBattle):

    def __init__(self, iGameID, iRandomSeed, iGameMode, iBattleMode, iOwnerID, iSceneIndex):
        super().__init__(iGameID, iRandomSeed, iGameMode, iBattleMode, iOwnerID, iSceneIndex)
        self.m_GameEndRuleType = BattleCmd_pb2.GAME_END_RULE_TYPE_BO1

    def GetSceneType(self):
        return BattleCmd_pb2.SCENE_TYPE_GAMEAI

    def ProcessServeState(self):
        return

    def ProcessReplayState(self):
        self.m_GameStateEndFrame = 0
        super().ProcessReplayState()

    def ProcessReadyServeState(self):
        self.OnServe()
