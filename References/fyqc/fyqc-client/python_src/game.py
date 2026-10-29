# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\game.py
# Compiled at: 2023-04-06 17:03:30
# Size of source mod 2**32: 27329 bytes
from base.protobufdata import BattleCmd_pb2, Common_pb2, DCmd_pb2, NormalCmd_pb2, PlayerFrameData_pb2
from base.protobufdata import BattleCtrl_pb2
from battlelogic.scenepvp import CScenePVP
from battlelogic.scenetest import CSceneTest
from battlelogic.scenenewbie import CSceneNewbie
from battlelogic.scenetechexam import CSceneTechExam
from battlelogic.scenechallenge import CSceneChallenge
from battlelogic.sceneskill import CSceneSKill
from battlelogic.nethandler import GetNetHandler
from prediction.defines import IsPredictionCmd
from prediction.prediction import CPrediction
from C_net import *
from prediction.nethandler import OnServerCmd, OnBattleCmd, SmoothSetPos
from nethandler import OnClientCmd
from prediction.playerframedata import MergePlayerFrameData, FieldEqual, GetFrameDataCompareFields, GetFrameDataName
from battlelogic.common.debug import Log, LogWarning, LogError, BeginSample, EndSample, Profiler
from base.data import GetSkillData
from clientlogic import CClientLogic
from battlelogic.common.defines import IsPlayerObjectID, FRAME, PING_INTERVAL
from stepframe import CStepFrame, CLIENT_AHEAD_FRAME_NUM
from prediction.serverdata import CServerData
from battlelogic.sceneencounterboss import CSceneEncounterBoss
from battlelogic.battlebase.dvec3 import CDVec3
from battlelogic.scenegameai import CSceneGameAI
from defines import GetSceneByType, GetSceneByMode
from battlelogic.common.defines import TransformPosIndexFromRoomToBattle
import time

class CGame(object):

    def __init__(self):
        self.m_ClientLogic = CClientLogic()
        self.m_Scene = None
        self.m_IsReRunReplay = True
        self.Reset()

    def Reset(self):
        if self.m_Scene:
            self.m_Scene.DoRelease()
        self.m_Scene = None
        self.m_HeroId = 0
        self.m_ClientLogicMode = Common_pb2.CLIENT_LOGIC_MODE_NONE
        self.m_ServerFrameNum = 0
        self.m_LastServerFrameNum = 0
        self.m_FrameDelta = 0
        self.m_UUID = ""
        self.m_ReplayFrameData = {}
        self.m_StepFrame = CStepFrame()
        self.m_BattleCmd = {}
        self.m_ServerData = None
        self.m_Prediction = None
        self.m_Rerunning = False
        self.m_NeedRerun = False
        self.m_LastPingTime = 0
        self.m_WatcherID = 0
        self.m_IsReRunReplay = True
        self.m_QuitBattleType = Common_pb2.QUIT_BATTLE_TYPE_NORMAL
        self.m_LogTextForBigData = ""

    def InitGame(self, iHeroId, sInitBuffer, iClientLogicMode):
        self.m_HeroId = iHeroId
        self.m_IsReRunReplay = False
        self.m_ClientLogicMode = iClientLogicMode
        if iClientLogicMode == Common_pb2.CLIENT_LOGIC_MODE_SINGLE:
            self.InitSingleGame(sInitBuffer)
        elif iClientLogicMode == Common_pb2.CLIENT_LOGIC_MODE_BATTLE:
            self.InitNormalGame(sInitBuffer)
        elif iClientLogicMode in (Common_pb2.CLIENT_LOGIC_MODE_GAMEAI_REPLAY, Common_pb2.CLIENT_LOGIC_MODE_REPLAY):
            self.InitReplayGame(sInitBuffer)
        elif iClientLogicMode == Common_pb2.CLIENT_LOGIC_MODE_GUIDE:
            self.InitGuideGame(sInitBuffer)
        elif iClientLogicMode == Common_pb2.CLIENT_LOGIC_MODE_WATCH:
            self.InitWatchGame(sInitBuffer)
        elif iClientLogicMode == Common_pb2.CLIENT_LOGIC_MODE_BATTLE_ON_CLIENT:
            self.InitBattleOnClient(sInitBuffer)
        elif iClientLogicMode == Common_pb2.CLIENT_LOGIC_MODE_SKILL:
            self.InitSkillGame(sInitBuffer)
        else:
            LogError("init game client logic mode not found", iClientLogicMode)

    def PackBattleCmd(self, pid, iMsg, oMsg):
        sBuffer = oMsg.SerializeToString()
        PacketPrepare(DCmd_pb2.CMD_BATTLE)
        PacketAddI(iMsg, 1)
        PacketAddI(pid, 4)
        PacketAddBinaryS(sBuffer, len(sBuffer))

    def Broadcast(self, pid, iCmd, oMsg):
        sBuffer = oMsg.SerializeToString()
        PacketPrepare(DCmd_pb2.CMD_BATTLE)
        PacketAddI(iCmd, 1)
        PacketAddI(pid, 4)
        PacketAddBinaryS(sBuffer, len(sBuffer))
        PacketSend(self.m_HeroId)

    def SendToPid(self, pid, iCmd, oMsg):
        if not pid == self.m_HeroId:
            return
        sBuffer = oMsg.SerializeToString()
        PacketPrepare(DCmd_pb2.CMD_BATTLE)
        PacketAddI(iCmd, 1)
        PacketAddI(pid, 4)
        PacketAddBinaryS(sBuffer, len(sBuffer))
        PacketSend(self.m_HeroId)

    def SendToSpectators(self, pid, iCmd, oMsg):
        return

    def L2CCreateGame(self, pid):
        PacketPrepare(DCmd_pb2.CMD_BATTLE_CTRL)
        PacketAddI(BattleCtrl_pb2.BATTLE_CTRL_CREATE_GAME_MSG, 1)
        oMsg = self.m_Scene.GetCreateGameInfo()
        oMsg.ClientLogicMode = self.m_ClientLogicMode
        oMsg.UUID = self.m_UUID
        sBuffer = oMsg.SerializeToString()
        PacketAddBinaryS(sBuffer, len(sBuffer))
        PacketSend(pid)

    def L2CGameRes(self):
        oMsg = NormalCmd_pb2.NormalGameResMsg()
        oMsg.GameRes.UUID = self.m_UUID
        oMsg.GameRes.QuitBattleType = self.m_QuitBattleType
        self.m_Scene.FormatGameResInfo(oMsg.GameRes)
        oMsg.LogTextForBigData = self.m_LogTextForBigData
        PacketPrepare(DCmd_pb2.CMD_NORMAL)
        PacketAddI(NormalCmd_pb2.NORMAL_GAME_RES_MSG, 1)
        sBuffer = oMsg.SerializeToString()
        PacketAddBinaryS(sBuffer, len(sBuffer))
        PacketSend(self.m_HeroId)

    def OnLocalGameEnd(self):
        self.L2CGameRes()

    def InitSingleGame(self, sInitBuffer):
        oMsg = BattleCmd_pb2.BattleCreateLocalGame()
        oMsg.ParseFromString(sInitBuffer)
        if oMsg.IsTest:
            self.m_Scene = CSceneTest(1001, 100000001, Common_pb2.GAME_MODE_ROOM, Common_pb2.BATTLE_MODE_SINGLE, self.m_HeroId, oMsg.Scene)
        else:
            iGameMode = oMsg.GameMode
            iBattleMode = oMsg.BattleMode
            cSceneClass = GetSceneByMode(iGameMode)
            self.m_Scene = cSceneClass(1001, 100000001, iGameMode, iBattleMode, self.m_HeroId, oMsg.Scene)
        if iGameMode == Common_pb2.GAME_MODE_TECHNICAL_EXAM:
            self.m_Scene.SetTechExamID(oMsg.TechExamID)
            self.m_Scene.SetTechnicalExamWinTimes(oMsg.TechExamWinTimes)
        else:
            if iGameMode == Common_pb2.GAME_MODE_GAME_LEVEL:
                self.m_Scene.SetGameLevelID(oMsg.GameLevelID)
                self.m_Scene.SetGameLevelWinTimes(oMsg.GameLevelWinTimes)
                self.m_Scene.SetAllSkillData(oMsg.PlayerData)
        self.m_Scene.SetSenderFunc(self.Broadcast, self.SendToPid, self.SendToSpectators)
        self.m_Scene.Init()
        self.m_Scene.SetGameEndFunc(self.OnLocalGameEnd)
        oPlayerData = oMsg.PlayerData
        oPlayer = self.m_Scene.CreatePlayer(self.m_HeroId)
        oPlayerData.MemberType = Common_pb2.TEAM_MEMBER_TYPE_HOST
        oPlayerData.PosIndex = 1
        if oMsg.GameMode == Common_pb2.GAME_MODE_PRACTICE:
            self.m_Scene.SetGameAIDifficulty(oMsg.AIDifficulty)
        else:
            self.m_Scene.AddPlayer(oPlayer, oPlayerData)
            oPlayerPreCreateGameData = Common_pb2.PlayerPreCreateGameData()
            oPlayerPreCreateGameData.CareerWinRate = oMsg.CareerWinRate
            oPlayer.SetPersonalDetail(oPlayerPreCreateGameData)
            if oMsg.GameMode == Common_pb2.GAME_MODE_CHALLENGE:
                self.m_Scene.InitAfterAllPlayerEnter(True)
            else:
                self.m_Scene.InitAfterAllPlayerEnter()
        self.L2CCreateGame(self.m_HeroId)

    def InitNormalGame(self, sInitBuffer):
        oMsg = BattleCtrl_pb2.BattleCtrlCreateGameMsg()
        oMsg.ParseFromString(sInitBuffer)
        cSceneClass = GetSceneByType(oMsg.SceneType)
        self.m_Scene = cSceneClass(oMsg.SceneID, oMsg.RandSeed, oMsg.GameMode, oMsg.BattleMode, self.m_HeroId, oMsg.SceneIndex)
        self.m_Scene.SetSenderFunc(self.Broadcast, self.SendToPid, self.SendToSpectators)
        self.m_Scene.Init()
        for i in range(len(oMsg.PlayerDatas)):
            oPlayerData = oMsg.PlayerDatas[i]
            if oPlayerData.ObjectType == BattleCmd_pb2.SCENE_OBJECT_TYPE_PLAYER:
                oPlayer = self.m_Scene.CreatePlayer(oPlayerData.BriefData.ID)
                self.m_Scene.AddPlayer(oPlayer, oPlayerData, oPlayerData.NetIndex)

        oPlayer = self.m_Scene.GetPlayer(self.m_HeroId)
        self.m_Prediction = CPrediction(oPlayer)
        self.m_ServerData = CServerData(self, self.m_Prediction.PackPlayerFrameData())
        self.m_NeedRerun = True

    def InitReplayGame(self, sInitBuffer):
        oMsg = BattleCtrl_pb2.BattleCtrlCreateGameMsg()
        oMsg.ParseFromString(sInitBuffer)
        cSceneClass = GetSceneByType(oMsg.SceneType)
        self.m_UUID = oMsg.UUID
        self.m_Scene = cSceneClass(oMsg.SceneID, oMsg.RandSeed, oMsg.GameMode, oMsg.BattleMode, self.m_HeroId, oMsg.SceneIndex)
        self.m_Scene.SetSenderFunc(self.Broadcast, self.SendToPid, self.SendToSpectators)
        self.m_Scene.Init()
        self.m_Scene.SetGameEndFunc(self.OnLocalGameEnd)
        for i in range(len(oMsg.PlayerDatas)):
            oPlayerData = oMsg.PlayerDatas[i]
            if oPlayerData.ObjectType == BattleCmd_pb2.SCENE_OBJECT_TYPE_PLAYER:
                oPlayer = self.m_Scene.CreatePlayer(oPlayerData.BriefData.ID)
                if oPlayerData.InitPosIndex:
                    oPlayerData.PosIndex = oPlayerData.InitPosIndex
                self.m_Scene.AddPlayer(oPlayer, oPlayerData, oPlayerData.NetIndex)

        self.m_Scene.InitAfterAllPlayerEnter()
        self.m_Scene.OnServe()
        self.L2CCreateGame(self.m_HeroId)
        oOwner = self.m_Scene.GetPlayer(self.m_HeroId)
        self.m_Prediction = CPrediction(oOwner)
        self.m_ServerData = CServerData(self, self.m_Prediction.PackPlayerFrameData())

    def InitGuideGame(self, sInitBuffer):
        oMsg = BattleCmd_pb2.BattleCreateLocalGame()
        oMsg.ParseFromString(sInitBuffer)
        self.m_Scene = CSceneNewbie(oMsg.NewbieGuideID, 100000001, Common_pb2.GAME_MODE_ROOM, oMsg.BattleMode, self.m_HeroId, oMsg.Scene)
        self.m_Scene.SetSenderFunc(self.Broadcast, self.SendToPid, self.SendToSpectators)
        self.m_Scene.Init()
        self.m_Scene.SetGameEndFunc(self.OnLocalGameEnd)
        oPlayerData = oMsg.PlayerData
        oPlayer = self.m_Scene.CreatePlayer(self.m_HeroId)
        oPlayerData.MemberType = Common_pb2.TEAM_MEMBER_TYPE_HOST
        oPlayerData.PosIndex = 1
        self.m_Scene.AddPlayer(oPlayer, oPlayerData)
        self.m_Scene.InitAfterAllPlayerEnter()
        self.L2CCreateGame(self.m_HeroId)

    def InitSkillGame(self, sInitBuffer):
        oMsg = BattleCmd_pb2.BattleCreateLocalGame()
        oMsg.ParseFromString(sInitBuffer)
        self.m_Scene = CSceneSKill(oMsg.SkillID, 100000001, Common_pb2.GAME_MODE_ROOM, oMsg.BattleMode, self.m_HeroId, oMsg.Scene)
        self.m_Scene.SetSenderFunc(self.Broadcast, self.SendToPid, self.SendToSpectators)
        self.m_Scene.Init()
        self.m_Scene.SetGameEndFunc(self.OnLocalGameEnd)
        oPlayerData = oMsg.PlayerData
        oPlayer = self.m_Scene.CreatePlayer(self.m_HeroId)
        oPlayerData.MemberType = Common_pb2.TEAM_MEMBER_TYPE_HOST
        oPlayerData.PosIndex = 1
        self.m_Scene.AddPlayer(oPlayer, oPlayerData)
        self.m_Scene.InitAfterAllPlayerEnter()
        self.L2CCreateGame(self.m_HeroId)

    def InitWatchGame(self, sInitBuffer):
        oMsg = BattleCtrl_pb2.BattleCtrlCreateGameMsg()
        oMsg.ParseFromString(sInitBuffer)
        self.m_WatcherID = oMsg.WatcherID
        cSceneClass = GetSceneByType(oMsg.SceneType)
        self.m_Scene = cSceneClass(oMsg.SceneID, oMsg.RandSeed, oMsg.GameMode, oMsg.BattleMode, self.m_HeroId, oMsg.SceneIndex)
        self.m_Scene.SetSenderFunc(self.Broadcast, self.SendToPid, self.SendToSpectators)
        self.m_Scene.Init()
        for i in range(len(oMsg.PlayerDatas)):
            oPlayerData = oMsg.PlayerDatas[i]
            if oPlayerData.ObjectType == BattleCmd_pb2.SCENE_OBJECT_TYPE_PLAYER:
                oPlayer = self.m_Scene.CreatePlayer(oPlayerData.BriefData.ID)
                self.m_Scene.AddPlayer(oPlayer, oPlayerData, oPlayerData.NetIndex)

        oPlayer = self.m_Scene.GetPlayer(self.m_HeroId)
        self.m_Prediction = CPrediction(oPlayer)
        self.m_ServerData = CServerData(self, self.m_Prediction.PackPlayerFrameData())

    def OnBattleOnClientGameEnd(self):
        self.L2CGameRes()

    def InitBattleOnClient(self, sInitBuffer):
        oMsg = NormalCmd_pb2.NormalCreateGameOnClientMsg()
        oMsg.ParseFromString(sInitBuffer)
        oPreCreateGameData = oMsg.PreCreateGameData
        self.m_UUID = oPreCreateGameData.UUID
        iGameMode = oPreCreateGameData.GameMode
        iBattleMode = oPreCreateGameData.BattleMode
        cSceneClass = GetSceneByMode(iGameMode)
        self.m_Scene = cSceneClass(1001, oPreCreateGameData.RandSeed, iGameMode, iBattleMode, self.m_HeroId, oPreCreateGameData.SceneIndex)
        self.m_Scene.SetSenderFunc(self.Broadcast, self.SendToPid, self.SendToSpectators)
        self.m_Scene.SetUUID(self.m_UUID)
        self.m_Scene.Init()
        self.m_Scene.SetGameEndFunc(self.OnBattleOnClientGameEnd)
        for oPlayerPreCreateGameData in oPreCreateGameData.PlayerDatas:
            oPlayerData = BattleCmd_pb2.BattleScenePlayerData()
            oPlayerData.ParseFromString(oPlayerPreCreateGameData.BattleDataBuffer)
            iPlayerID = oPlayerPreCreateGameData.PlayerID
            oPlayer = self.m_Scene.CreatePlayer(iPlayerID)
            oPlayerData.PosIndex = TransformPosIndexFromRoomToBattle(oPlayerData.PosIndex)
            oPlayer.SetPersonalDetail(oPlayerPreCreateGameData)
            if not IsPlayerObjectID(iPlayerID):
                iBTConfID = oPlayerPreCreateGameData.BTConfID
                if iBTConfID:
                    oPlayer.AttachBT(iBTConfID)
                self.m_Scene.AddPlayer(oPlayer, oPlayerData, oPlayerData.NetIndex)

        self.m_Scene.InitAfterAllPlayerEnter()
        self.L2CCreateGame(self.m_HeroId)

    def IsLocalGame(self):
        if self.m_ClientLogicMode in (
         Common_pb2.CLIENT_LOGIC_MODE_SINGLE,
         Common_pb2.CLIENT_LOGIC_MODE_GUIDE,
         Common_pb2.CLIENT_LOGIC_MODE_BATTLE_ON_CLIENT,
         Common_pb2.CLIENT_LOGIC_MODE_SKILL):
            return True
        else:
            return False

    @Profiler
    def Update(self, iFrameNum, lstCmds, lstServerCmd):
        self.m_StepFrame.FixApplationPause()
        if self.IsLocalGame():
            self.UpdateSingleMode(lstCmds)
        elif self.m_ClientLogicMode in (Common_pb2.CLIENT_LOGIC_MODE_GAMEAI_REPLAY, Common_pb2.CLIENT_LOGIC_MODE_REPLAY):
            self.UpdateReplayMode(lstCmds)
        elif self.m_ClientLogicMode == Common_pb2.CLIENT_LOGIC_MODE_WATCH:
            self.UpdateWatchMode(lstCmds, lstServerCmd)
        else:
            self.UpdatePrediction(lstCmds, lstServerCmd)
        if self.m_StepFrame.m_LoadingDone:
            self.m_Scene.PushUpdateFrameMsg()

    def L2CFrameStateMsg(self):
        oFrameMsg = BattleCmd_pb2.BattleFrameStateMsg()
        oFrameMsg.CurFrame = self.m_Scene.GetCurFrame()
        oFrameMsg.CurEffectiveFrame = self.m_Scene.GetCurEffectiveFrame()
        sBuffer = oFrameMsg.SerializeToString()
        PacketPrepare(DCmd_pb2.CMD_BATTLE)
        PacketAddI(BattleCmd_pb2.BATTLE_FRAME_STATE_MSG, 1)
        PacketAddI(0, 4)
        PacketAddBinaryS(sBuffer, len(sBuffer))
        PacketSend(self.m_HeroId)

    def SendToLogic(self, iMsgID, sBuff):
        if self.m_ClientLogicMode == Common_pb2.CLIENT_LOGIC_MODE_BATTLE:
            if IsPredictionCmd(iMsgID):
                self.m_BattleCmd[iMsgID] = sBuff
            else:
                self.L2SFrameCmd(self.m_StepFrame.m_FrameNum, iMsgID, sBuff)
        else:
            self.m_BattleCmd[iMsgID] = sBuff

    def L2SFrameCmd(self, iCurFrame, iMsgID, sBuff):
        if not sBuff:
            sBuff = b''
        PacketPrepare(DCmd_pb2.CMD_BATTLE)
        PacketAddI(iCurFrame % 255, 1)
        PacketAddI(iMsgID, 1)
        PacketAddBinaryS(sBuff, len(sBuff))
        L2SPacketSend(self.m_HeroId)

    def L2SPing(self, iCurFrame):
        PacketPrepare(DCmd_pb2.CMD_BATTLE_PING)
        PacketAddI(iCurFrame % 255, 1)
        if self.m_ClientLogicMode == Common_pb2.CLIENT_LOGIC_MODE_WATCH and self.m_WatcherID:
            L2SPacketSend(self.m_WatcherID)
        else:
            L2SPacketSend(self.m_HeroId)

    def SaveHeroSnapshot(self):
        return self.m_Scene.m_Phys.SaveSnapshot(self.m_HeroId)

    def RestoreHeroFromSnapshot(self, sBuffer, bDelta=True):
        oPhys = self.m_Scene.m_Phys
        oPlayer = self.m_Scene.GetPlayer(self.m_HeroId)
        oPhys.RestoreFromSnapshot(self.m_HeroId, sBuffer)
        oPlayer.m_MoveType = oPhys.GetMoveType(self.m_HeroId)
        x, y, z = oPhys.GetMoveDir(self.m_HeroId)
        oPlayer.m_MoveDir = CDVec3(x, y, z)
        oPlayer.m_BulletTimeScaleMgr.m_BulletTimeScale = oPhys.GetBulletTimeScale(self.m_HeroId)
        if bDelta:
            oPlayer.OnMoveTypeDelta()
            oPlayer.OnMoveDirDelta(oPlayer.m_MoveDir)

    def CheckNeedRerun(self, iType):
        oPreData = self.m_Prediction.GetHistoryPack(self.m_ServerFrameNum)
        oData = self.m_ServerData.m_FullFrameData
        if not oPreData:
            self.m_NeedRerun = True
            return
        func = GetFrameDataCompareFields().get(iType, None)
        if not func:
            return
        sName = GetFrameDataName(iType)
        if not func(getattr(oPreData, sName), getattr(oData, sName)):
            self.m_NeedRerun = True

    def PrePing(self, iFrameNum):
        fCurTime = time.time()
        if fCurTime - self.m_LastPingTime > PING_INTERVAL:
            self.m_LastPingTime = fCurTime
            self.L2SPing(iFrameNum)

    def UpdatePrediction(self, lstCmds, lstServerCmd):
        oPlayer = self.m_Scene.GetPlayer(self.m_HeroId)
        iFrameNum = self.m_StepFrame.m_FrameNum
        self.PrePing(iFrameNum)
        if lstServerCmd:
            oClientSnapshot = self.SaveHeroSnapshot()
            self.RestoreHeroFromSnapshot((self.m_ServerData.m_Snapshot), bDelta=False)
            for sBuffer in lstServerCmd:
                OnBattleCmd(oPlayer, sBuffer)

            self.m_ServerData.m_Snapshot = self.SaveHeroSnapshot()
            self.RestoreHeroFromSnapshot(oClientSnapshot, bDelta=False)
        else:
            oPrediction = self.m_Prediction
            for iCmd, iMsgID, sBuffer in lstCmds:
                OnClientCmd(self, oPlayer, iCmd, iMsgID, sBuffer)

            if self.m_StepFrame.CouldStep():
                iServerFrameNum = self.m_ServerFrameNum
                for iFrame in range(self.m_LastServerFrameNum, iServerFrameNum):
                    oPrediction.DelHistoryCmds(iFrame)
                    oPrediction.DelHistoryPack(iFrame)

                self.m_LastServerFrameNum = iServerFrameNum
                bDiff = False
                oData = self.m_ServerData.m_FullFrameData
                oPreData = oPrediction.GetHistoryPack(iServerFrameNum)
                if not self.m_NeedRerun:
                    iStartFrame = iFrameNum
                    iEndFrame = iFrameNum
                else:
                    oMsg = PlayerFrameData_pb2.PlayerFrameData()
                    oMsg.MergeFrom(oData)
                    oPrediction.AddHistoryPack(iServerFrameNum, oMsg)
                    oPrediction.UnpackPlayerFrameData(oData)
                    if iFrameNum <= iServerFrameNum:
                        iFrameNum = iServerFrameNum + CLIENT_AHEAD_FRAME_NUM
                        self.m_StepFrame.SetFrameNum(iFrameNum)
                    iStartFrame = iServerFrameNum + 1
                    iEndFrame = iFrameNum
                for iMsgID, sBuffer in self.m_BattleCmd.items():
                    self.m_Prediction.AddHistoryCmd(iFrameNum, iMsgID, sBuffer)
                    self.L2SFrameCmd(iFrameNum, iMsgID, sBuffer)

                if self.m_NeedRerun:
                    self.m_Rerunning = True
                    self.m_Scene.SetCurFrame(iStartFrame - 1)
                    oPackPos = CDVec3.CopyFrom(oPlayer.m_Pos)
                    for iFrame in range(iStartFrame, iEndFrame):
                        self.m_Scene.SetCurFrame(iFrame)
                        self.m_Scene.UpdateEffectiveFrame()
                        lstCmds = oPrediction.GetHistoryCmds(iFrame)
                        oNetHandler = GetNetHandler()
                        self.m_Scene.m_ServerFrameNum = oPrediction.GetServerFrameNum(iFrame)
                        self.m_FrameDelta = iFrame - self.m_Scene.m_ServerFrameNum
                        for iMsgID, sBuff in lstCmds:
                            if sBuff is None:
                                sBuff = b''
                            if iMsgID == BattleCmd_pb2.BATTLE_HIT_MSG:
                                oClientHitPos, iHitAction = getattr(oPlayer, "m_ClientHitData", (None,
                                                                                                 0))
                                if oClientHitPos:
                                    oPlayer.m_Pos = oClientHitPos
                                oNetHandler.OnCmd(oPlayer, iMsgID, sBuff)

                        for oBadminton in self.m_Scene.GetAllBadminton():
                            oBadminton.m_CurvePrediction.ExecuteLoop(iFrameNum)

                        oPlayer.ExecuteLoop()
                        self.m_Scene.m_Phys.SimulatePlayer(self.m_HeroId, 0.04)
                        x, y, z = self.m_Scene.m_Phys.GetPosition(self.m_HeroId)
                        oPlayer.m_Pos = CDVec3(x, y, z)
                        oPrediction.AddHistoryPack(iFrame, oPrediction.PackPlayerFrameData())

                    oNewPos = CDVec3.CopyFrom(oPlayer.m_Pos)
                    oPlayer.SetPos(oPackPos)
                    SmoothSetPos(oPlayer, oNewPos)
                    self.m_Rerunning = False
                    if not oPlayer.m_DoHitAction.m_HitData.m_ID:
                        if oPlayer.m_DoHitAction.m_CouldInterrupt:
                            oPlayer.m_DoHitAction.m_CouldInterrupt = False
                self.m_NeedRerun = False
                self.m_Scene.SetCurFrame(iFrameNum)
                self.m_Scene.UpdateEffectiveFrame()
                oNetHandler = GetNetHandler()
                self.m_Scene.m_ServerFrameNum = oPrediction.GetServerFrameNum(iFrameNum)
                self.m_FrameDelta = iFrameNum - self.m_Scene.m_ServerFrameNum
                dBattleCmd = self.m_BattleCmd
                self.m_BattleCmd = {}
                for iMsgID, sBuff in dBattleCmd.items():
                    if sBuff is None:
                        sBuff = b''
                    oNetHandler.OnCmd(oPlayer, iMsgID, sBuff)

                for oBadminton in self.m_Scene.GetAllBadminton():
                    oBadminton.m_BulletTimeScaleMgr.ExecuteLoop()

                oPlayer.ExecuteLoop()
                self.m_Scene.Simulate()
                oPrediction.AddHistoryPack(iFrameNum, oPrediction.PackPlayerFrameData())
                self.m_ClientLogic.Update(self, iFrameNum)
                self.L2CFrameStateMsg()
                iFrameNum += 1
                self.m_StepFrame.m_FrameNum = iFrameNum
                oPrediction.SetServerFrameNum(iFrameNum, self.m_ServerFrameNum)
                self.m_Scene.SetCurFrame(iFrameNum)
            else:
                self.L2CFrameStateMsg()

    def UpdateSingleMode(self, lstCmds):
        oPlayer = self.m_Scene.GetPlayer(self.m_HeroId)
        for iCmd, iMsgID, sBuffer in lstCmds:
            OnClientCmd(self, oPlayer, iCmd, iMsgID, sBuffer)

        oNetHandler = GetNetHandler()
        if self.m_StepFrame.CouldStep():
            iFrameNum = self.m_StepFrame.m_FrameNum
            self.m_Scene.SetCurFrame(iFrameNum)
            self.m_Scene.m_ServerFrameNum = iFrameNum
            for iMsgID, sBuffer in self.m_BattleCmd.items():
                oNetHandler.OnCmd(oPlayer, iMsgID, sBuffer)

            self.m_BattleCmd = {}
            self.m_Scene.StepFrame()
            self.m_ClientLogic.Update(self, iFrameNum)
            self.L2CFrameStateMsg()
            self.m_StepFrame.m_FrameNum += 1
            self.m_Scene.SetCurFrame(self.m_StepFrame.m_FrameNum)
        else:
            self.L2CFrameStateMsg()

    def UpdateReplayMode(self, lstCmds):
        oPlayer = self.m_Scene.GetPlayer(self.m_HeroId)
        for iCmd, iMsgID, sBuffer in lstCmds:
            if iCmd == DCmd_pb2.CMD_BATTLE_CTRL and iMsgID == BattleCtrl_pb2.BATTLE_CTRL_ALL_LOADING_DONE_MSG:
                OnClientCmd(self, oPlayer, iCmd, iMsgID, sBuffer)
                self.m_Scene.OnServe()

        if self.m_StepFrame.CouldStep():
            iFrameNum = self.m_StepFrame.m_FrameNum
            self.m_Scene.SetCurFrame(iFrameNum)
            self.m_Scene.m_ServerFrameNum = iFrameNum
            self.m_ServerData.m_FrameNum = iFrameNum
            if iFrameNum in self.m_ReplayFrameData:
                for sBuffer in self.m_ReplayFrameData[iFrameNum]:
                    sBuffer = sBuffer[1:]
                    SetPacketDataForUnpack(sBuffer)
                    iMsgID = UnpackInt(1)
                    pid = UnpackInt(4)
                    sBuffer = UnpackBinaryString(0)
                    OnServerCmd(oPlayer, pid, iMsgID, sBuffer)

            self.m_Scene.Simulate()
            self.m_ClientLogic.Update(self, iFrameNum)
            self.L2CFrameStateMsg()
            self.m_StepFrame.m_FrameNum += 1
            self.m_Scene.SetCurFrame(self.m_StepFrame.m_FrameNum)

    def UpdateWatchMode(self, lstCmds, lstServerCmd):
        oPlayer = self.m_Scene.GetPlayer(self.m_HeroId)
        iFrameNum = self.m_StepFrame.m_FrameNum
        for sBuffer in lstServerCmd:
            OnBattleCmd(oPlayer, sBuffer)

        for iCmd, iMsgID, sBuffer in lstCmds:
            if iCmd != DCmd_pb2.CMD_BATTLE:
                OnClientCmd(self, oPlayer, iCmd, iMsgID, sBuffer)

        if self.m_StepFrame.CouldStep():
            iFrameNum = self.m_StepFrame.m_FrameNum
            self.m_Scene.SetCurFrame(iFrameNum)
            self.m_Scene.m_ServerFrameNum = iFrameNum
            self.m_ServerData.m_FrameNum = self.m_ServerFrameNum
            self.m_Scene.Simulate()
            self.m_ClientLogic.Update(self, iFrameNum)
            self.L2CFrameStateMsg()
            if iFrameNum % (FRAME * PING_INTERVAL) == 0:
                self.L2SPing(iFrameNum)
            self.m_StepFrame.m_FrameNum += 1
            self.m_Scene.SetCurFrame(self.m_StepFrame.m_FrameNum)
        else:
            self.L2CFrameStateMsg()

    def SetFrameDatas(self, sFrameBuffer):
        if not sFrameBuffer:
            return
        oReplayFrameData = Common_pb2.GameReplayData()
        oReplayFrameData.ParseFromString(sFrameBuffer)
        for oReplayCmd in oReplayFrameData.Datas:
            iCurFrame = oReplayCmd.CurFrame
            if iCurFrame not in self.m_ReplayFrameData:
                self.m_ReplayFrameData[iCurFrame] = []
            self.m_ReplayFrameData[iCurFrame].append(oReplayCmd.BinData)

    def OnBattleReport2BigData(self, sLogText):
        self.m_LogTextForBigData = sLogText

    def OnAllLoadingDone(self, iFrameNum):
        self.m_Scene.SetBattleReportInfo(self.OnBattleReport2BigData)
        if self.IsLocalGame():
            self.m_Scene.OnGameStart()
        self.m_StepFrame.LoadingDone(iFrameNum)

    def UpdateClientBadmintonPos(self):
        oBadminton = self.m_Scene.GetFirstBadminton()
        if not oBadminton.m_CurveData:
            return
        bNeedSmooth = getattr(oBadminton.m_CurveData, "m_NeedSmooth", False)
        if not bNeedSmooth:
            return
        iClientPassFrame = self.m_StepFrame.GetClientPassFrame()
        if iClientPassFrame == 0:
            return
        iLastFrame = self.m_StepFrame.m_FrameNum - 1
        oPlayer = self.m_Scene.GetPlayer(self.m_HeroId)
        self.m_ClientLogic.m_BadmintonSmoothMove.Update(self, oPlayer, iLastFrame + iClientPassFrame)

    def UpdateSingleBadmintonPos(self):
        oBadminton = self.m_Scene.GetFirstBadminton()
        if not oBadminton.m_CurveData or oBadminton.m_CurveData.m_Hited:
            return
        iClientPassFrame = self.m_StepFrame.GetClientPassFrame()
        if iClientPassFrame == 0:
            return
        iLastFrame = self.m_StepFrame.m_FrameNum - 1
        iPassFrame = oBadminton.GetPassFrame(iLastFrame, iLastFrame + iClientPassFrame)
        oPos = oBadminton.GetPreJudgePos(iPassFrame)
        oBadminton.OnPosDelta(oPos, False)


if "g_Game" not in globals():
    g_Game = CGame()

def GetGame():
    global g_Game
    return g_Game


def ReleaseGame():
    global g_Game
    if not g_Game:
        return
    if g_Game.m_Scene:
        g_Game.m_Scene.DoRelease()
        g_Game.m_Scene = None
    g_Game.m_ClientLogic = None
    g_Game = None
