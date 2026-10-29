# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\prediction\serverdata.py
# Compiled at: 2023-04-06 17:03:30
# Size of source mod 2**32: 4355 bytes
from base.protobufdata import BattleCmd_pb2, PlayerFrameData_pb2
from .playerframedata import GetFrameDataPacker, GetFrameDataUnpacker, GetFrameDataName, MergePlayerFrameData, GetFrameDataFields, GetFrameDataCopyFunc, GetFrameDataCompareFields
from battlelogic.battlebase.dvec3 import CDVec3, PackFloatVec3
from battlelogic.common.debug import LogWarning, LogError, Log
from base.data import GetHitActionData
from battlelogic.common.defines import Time2Frame, INF_TIME
from battlelogic.common.logicutil import IsMoveBySystem
from battlelogic.common.defines import COLLISION_GROUP_CHAR
MAP_TYPE_FRAME_DATA = {
 PlayerFrameData_pb2.PLAYER_FRAME_DATA_COUNTER}
HERO_PHYSX_HELPER_ID = -1

class CServerData:

    def __init__(self, oGame, oData):
        self.m_FrameData = PlayerFrameData_pb2.PlayerFrameData()
        self.m_FullFrameData = oData
        MergePlayerFrameData(self.m_FrameData, self.m_FullFrameData, MAP_TYPE_FRAME_DATA)
        self.m_FrameDataChanged = set()
        self.m_FrameNum = -1
        self.m_Game = oGame
        self.m_Snapshot = oGame.SaveHeroSnapshot()
        self.m_LastGameState = 0
        self.m_NeedCheckRerun = False

    def UpdateFrameData(self, iType, oMsg):
        func = GetFrameDataCopyFunc(iType)
        func(self.m_FrameData, oMsg)
        self.m_FrameDataChanged.add(iType)
        if iType in GetFrameDataCompareFields():
            self.m_NeedCheckRerun = True

    def UpdateFrameDataChanged(self, iType):
        self.m_FrameDataChanged.add(iType)
        if iType in GetFrameDataCompareFields():
            self.m_NeedCheckRerun = True

    def ProcFrameNum(self, iFrameNum):
        for i in range(self.m_FrameNum + 1, iFrameNum + 1):
            self.m_FrameNum = i
            self.ExecuteLoop(i)

    def SetFrameNum(self, iFrameNum):
        MergePlayerFrameData(self.m_FullFrameData, self.m_FrameData, self.m_FrameDataChanged)
        self.m_FrameNum = iFrameNum
        self.ExecuteLoop(iFrameNum)
        if self.m_NeedCheckRerun:
            for iType in GetFrameDataCompareFields():
                self.m_Game.CheckNeedRerun(iType)

            self.m_NeedCheckRerun = False
        self.m_FrameData = PlayerFrameData_pb2.PlayerFrameData()
        self.m_FrameDataChanged = set()
        MergePlayerFrameData(self.m_FrameData, self.m_FullFrameData, MAP_TYPE_FRAME_DATA)

    def GetPassFrame(self, iVal):
        iBulletTimeScale = self.m_Game.m_Scene.m_Phys.GetBulletTimeScale(self.m_Game.m_HeroId)
        return iVal * iBulletTimeScale / 100

    def UpdateHitActionState(self, oActionData, fPassFrame):
        if fPassFrame < oActionData.m_BeforeActionTime:
            self.m_FullFrameData.HitActionState = BattleCmd_pb2.HITACTION_STATE_BEFORE
        elif fPassFrame < oActionData.m_BeforeActionTime + oActionData.m_ActionTime:
            self.m_FullFrameData.HitActionState = BattleCmd_pb2.HITACTION_STATE_ACTION
        else:
            self.m_FullFrameData.HitActionState = BattleCmd_pb2.HITACTION_STATE_AFTER

    def ExecuteLoop(self, iFrameNum):
        oFrameData = self.m_FullFrameData
        if self.m_LastGameState == BattleCmd_pb2.GAME_STATE_PLAYING:
            if oFrameData.GameState == BattleCmd_pb2.GAME_STATE_PLAYING:
                oFrameData.EffectiveFrameNum += 1
            self.m_LastGameState = oFrameData.GameState
            self.m_Game.m_Scene.m_Phys.SimulatePlayer(self.m_Game.m_HeroId, 0.04)
            fPassFrame = self.GetPassFrame(1)
            if oFrameData.HitAction.HitActionID:
                oActionData = GetHitActionData(oFrameData.HitAction.HitActionID)
                self.UpdateHitActionState(oActionData, oFrameData.HitActionPassFrame)
                if oFrameData.HitActionPassFrame >= oActionData.m_TotalTime:
                    oFrameData.HitActionState = BattleCmd_pb2.HITACTION_STATE_NONE
                    oFrameData.HitAction.HitActionID = 0
                    oFrameData.HitActionPassFrame = 0
            else:
                oFrameData.HitActionPassFrame += fPassFrame
        else:
            oFrameData.HitActionState = BattleCmd_pb2.HITACTION_STATE_NONE
        oFrameData.EngineData = self.m_Game.SaveHeroSnapshot()
        x, y, z = self.m_Game.m_Scene.m_Phys.GetPosition(self.m_Game.m_HeroId)
        PackFloatVec3(oFrameData.Pos, CDVec3(x, y, z))
        oFrameData.MoveType = self.m_Game.m_Scene.m_Phys.GetMoveType(self.m_Game.m_HeroId)
