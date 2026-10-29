# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\sceneplugins\gameai\gameaiservice.py
# Compiled at: 2023-04-06 17:07:52
# Size of source mod 2**32: 3271 bytes
from .gameai import CGameAI
from base.protobufdata import Common_pb2
from base.protobufdata import BattleCmd_pb2
from base.protobufdata import BattleRoomCmd_pb2
from battlelogic.common.defines import IsPlayerObjectID
from battlelogic.common.logicutil import GetOriginalDirByMemberType
from battlelogic.common.defines import Frame2Sec
from battlelogic.common.defines import IsServer
from battlelogic.battlebase.dmath import ClampFloat
from battlelogic.common.defines import Sec2Frame
from .defines import CalcGameAIDifficultyLevel
from battlelogic.common.defines import DY_GAME_AI_BTCONFID, GAME_AI_DIFFICULTY_LEVEL, GAME_AI_DIFFICULTY_NAME, PLAYER_ABNORMAL_STATUS_BTCONFID

class CGameAIService(CGameAI):

    def __init__(self, oScene, oReqActionFunc):
        super().__init__(oScene)
        self.m_ReqGameAIActionFunc = oReqActionFunc
        self.m_LastReqGameAIFrame = 0
        self.m_AIServerBlocked = False
        self.m_PlayerAvgElo = 0

    def DoRelease(self):
        self.m_ReqGameAIActionFunc = None
        super().DoRelease()

    def OnAIServerBlocked(self):
        self.m_AIServerBlocked = True
        for oPlayer in self.m_Scene.GetAllPlayer():
            oPlayer.OnAIServerBlocked()

    def TryReq(self):
        if self.m_AIServerBlocked:
            return
        else:
            if self.m_Scene.m_GameState != BattleCmd_pb2.GAME_STATE_PLAYING:
                return
            oBadminton = self.m_Scene.GetFirstBadminton()
            bExeFlag = True
            if bExeFlag:
                bReqRes = self.m_ReqGameAIActionFunc(self.FormatReqData())
                self.m_LastReqGameAIFrame = self.m_Scene.m_FrameNum
                if not bReqRes:
                    self.OnAIServerBlocked()

    def RenameForBOT(self):
        if self.m_Scene.GetGameMode() not in (Common_pb2.GAME_MODE_ROOM, Common_pb2.GAME_MODE_PRACTICE):
            return
        for oPlayer in self.m_Scene.GetAllPlayer():
            if IsPlayerObjectID(oPlayer.m_ID):
                pass
            elif self.m_Scene.GetGameMode() == Common_pb2.GAME_MODE_PRACTICE:
                sNewName = GAME_AI_DIFFICULTY_NAME[self.m_Scene.m_GameAIDifficulty]
            else:
                sCurName = oPlayer.Name()
                sNewName = sCurName + "-AL%s" % (self.m_DifficultyLevel,)
            oPlayer.SetName(sNewName)

    def ReAttachGameAIBT(self):
        for oPlayer in self.m_Scene.GetAllPlayer():
            if IsPlayerObjectID(oPlayer.m_ID):
                pass
            else:
                oPlayer.DetachBT()
                oPlayer.AttachBT(DY_GAME_AI_BTCONFID)

    def Init(self):
        if self.m_Scene.m_GameAIDifficulty in GAME_AI_DIFFICULTY_LEVEL:
            self.m_DifficultyLevel = GAME_AI_DIFFICULTY_LEVEL[self.m_Scene.m_GameAIDifficulty]
        else:
            self.m_PlayerAvgElo = self.CalcPlayerAvgElo()
            self.m_DifficultyLevel = CalcGameAIDifficultyLevel(self.m_PlayerAvgElo, self.m_Scene.m_GameAIDifficultyFluctuation)
        if self.m_Scene.GetSceneType() == BattleCmd_pb2.SCENE_TYPE_CHALLENGE:
            self.m_DifficultyLevel = 1
        self.RenameForBOT()
        self.ReAttachGameAIBT()
