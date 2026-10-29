# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\sceneencounterboss.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 1997 bytes
from .scenebattle import CSceneBattle
from base.protobufdata import BattleCmd_pb2
from base.protobufdata import Common_pb2
from battlelogic.common.defines import IsPlayerObjectID
from battlelogic.common.debug import LogWarning
from base.data import GetEncounterBossData
from base.data import GetBossPlayData
from base.data import GetBOTPlayerData

class CSceneEncounterBoss(CSceneBattle):

    def __init__(self, iGameID, iRandomSeed, iGameMode, iBattleMode, iOwnerID, iSceneIndex):
        super().__init__(iGameID, iRandomSeed, iGameMode, iBattleMode, iOwnerID, iSceneIndex)
        self.m_EncounterBossID = 0
        self.m_AbnormalStatusCheck = True

    def GetSceneType(self):
        return BattleCmd_pb2.SCENE_TYPE_ENCOUNTER_BOSS

    def CouldInitRobot(self):
        return False

    def Init(self):
        super().Init()

    def InitBoss(self):
        iBossMemberType = Common_pb2.TEAM_MEMBER_TYPE_GUEST
        oEncounterBossData = GetEncounterBossData(self.m_EncounterBossID)
        oBossPlayData = GetBossPlayData(oEncounterBossData.m_BossPlayID)
        iPosIndex = 1
        for iBossID in oBossPlayData.m_BossLst:
            oData = GetBOTPlayerData(iBossID)
            self.DoCreateRobotPlayer(self.GetNpcID(), iBossMemberType, iPosIndex, oData)
            iPosIndex += 1

    def InitAfterAllPlayerEnter(self):
        self.InitBoss()
        super().InitAfterAllPlayerEnter()

    def InitEncounterBossID(self, iEncouterBossID):
        self.m_EncounterBossID = iEncouterBossID
        oEncounterBossData = GetEncounterBossData(self.m_EncounterBossID)
        oBossPlayData = GetBossPlayData(oEncounterBossData.m_BossPlayID)
        self.m_GameEndRuleType = oBossPlayData.m_GameEndRuleType
        self.m_ServeType = oBossPlayData.m_ServeType

    def CouldWinQuarter(self, iScore, iEnemyScore):
        if self.m_CurQuarterIndex < 3:
            if iScore >= 3:
                return True
        else:
            if iScore >= 3:
                if iScore - iEnemyScore >= 2:
                    return True
                if iScore >= 5:
                    return True
            return False
