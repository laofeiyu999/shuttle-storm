# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\scenepvp.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 1562 bytes
from base.data import GetCourtData
from battlelogic.battlebase.dvec3 import CDVec3
from .scenebattle import CSceneBattle
from base.protobufdata import Common_pb2
from base.protobufdata import BattleCmd_pb2
from base.protobufdata import NormalCmd_pb2
from battlelogic.common.debug import Log, LogWarning, LogError
from battlelogic.common.defines import Frame2Sec
from battlelogic.common.defines import IsServer
from battlelogic.common.decorator import ServerOnly
from base.data import GetGameRuleData

class CScenePVP(CSceneBattle):

    def __init__(self, iID, iRandomSeed, iGameMode, iBattleMode, iOwnerID, iSceneIndex):
        super().__init__(iID, iRandomSeed, iGameMode, iBattleMode, iOwnerID, iSceneIndex)
        self.m_AbnormalStatusCheck = True

    def GetSceneType(self):
        return BattleCmd_pb2.SCENE_TYPE_PVP

    def HasNewbie(self):
        dGameRuleData = GetGameRuleData()
        bHasNewbie = False
        dAllPlayers = self.GetAllPlayer()
        for oObj in dAllPlayers:
            iGrade = oObj.Grade()
            if iGrade < dGameRuleData["NewbieLevel"]:
                bHasNewbie = True
                break

        return bHasNewbie

    def InitGameEndRule(self):
        if self.m_GameMode == Common_pb2.GAME_MODE_NO_SKILL:
            self.m_GameEndRuleType = BattleCmd_pb2.GAME_END_RULE_TYPE_BO1
            return
        else:
            bHasNewbie = self.HasNewbie()
            if bHasNewbie:
                self.m_GameEndRuleType = BattleCmd_pb2.GAME_END_RULE_TYPE_BO1
            else:
                self.m_GameEndRuleType = BattleCmd_pb2.GAME_END_RULE_TYPE_BO3

    def InitAfterAllPlayerEnter(self):
        self.InitGameEndRule()
        super().InitAfterAllPlayerEnter()
