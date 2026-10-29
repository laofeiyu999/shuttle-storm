# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\rerunreplay\rerunserverreplay.py
# Compiled at: 2023-04-06 17:03:31
# Size of source mod 2**32: 3789 bytes
from base.protobufdata import Common_pb2
from .output import COutPutForGameAI
from base.protobufdata import BattleCtrl_pb2
from defines import GetSceneByType
from base.protobufdata import BattleCmd_pb2
from C_net import *
from prediction.nethandler import DoServerCmd
from battlelogic.common.debug import LogError

class CReRunServerReplay(object):

    def __init__(self):
        self.m_Scene = None
        self.m_OutPut = None
        self.m_ReplayFrameData = {}
        self.m_UUID = ""
        self.m_FrameNum = 0
        self.m_Owner = None

    def Broadcast(self, pid, iCmd, oMsg):
        return

    def SendToPid(self, pid, iCmd, oMsg):
        return

    def SendToSpectators(self, pid, iCmd, oMsg):
        return

    def OnGameEnd(self):
        sFileName = "ops" + self.m_UUID
        self.m_OutPut.OutPut(sFileName)
        return sFileName

    def InitGame(self, sCreateGameBuffer):
        oCreateGameMsg = BattleCtrl_pb2.BattleCtrlCreateGameMsg()
        oCreateGameMsg.ParseFromString(sCreateGameBuffer)
        self.m_UUID = oCreateGameMsg.UUID
        cSceneClass = GetSceneByType(oCreateGameMsg.SceneType)
        self.m_Scene = cSceneClass(oCreateGameMsg.SceneID, oCreateGameMsg.RandSeed, oCreateGameMsg.GameMode, oCreateGameMsg.BattleMode, 0, oCreateGameMsg.SceneIndex)
        self.m_Scene.SetSenderFunc(self.Broadcast, self.SendToPid, self.SendToSpectators)
        self.m_Scene.Init()
        for i in range(len(oCreateGameMsg.PlayerDatas)):
            oPlayerData = oCreateGameMsg.PlayerDatas[i]
            if oPlayerData.ObjectType == BattleCmd_pb2.SCENE_OBJECT_TYPE_PLAYER:
                oPlayer = self.m_Scene.CreatePlayer(oPlayerData.BriefData.ID)
                oPlayer.SetName(oPlayerData.BriefData.Name)
                oPlayer.SetTableID(oPlayerData.HeroID)
                oPlayer.SetMemberType(oPlayerData.MemberType)
                oPlayer.SetAllSkillData(oPlayerData)
                oPlayer.SetBriefData(oPlayerData.BriefData)
                oPlayer.SetApparelLst(oPlayerData.Apparels)
                if oPlayerData.IsGameAI:
                    oPlayer.m_IsGameAI = True
                if oPlayerData.InitPosIndex:
                    oPlayer.SetPosIndex(oPlayerData.InitPosIndex)
                else:
                    oPlayer.SetPosIndex(oPlayerData.PosIndex)
                self.m_Scene.AddPlayer(oPlayer, oPlayerData, oPlayerData.NetIndex)
                self.m_Owner = oPlayer

        self.m_Scene.InitAfterAllPlayerEnter()
        self.m_Scene.OnServe()

    def InitFrameData(self, oGameReplayData):
        for oReplayCmd in oGameReplayData.Datas:
            iCurFrame = oReplayCmd.CurFrame
            if iCurFrame not in self.m_ReplayFrameData:
                self.m_ReplayFrameData[iCurFrame] = []
            self.m_ReplayFrameData[iCurFrame].append(oReplayCmd.BinData)

    def InitOutPut(self):
        self.m_Scene.InitGameAIReRun()
        self.m_OutPut = COutPutForGameAI(self.m_Scene)

    def Init(self, sReplayBuffer):
        oGameReplayData = Common_pb2.GameReplayData()
        oGameReplayData.ParseFromString(sReplayBuffer)
        self.InitGame(oGameReplayData.CreateGameData)
        self.InitFrameData(oGameReplayData)
        self.InitOutPut()

    def Update(self):
        iFrameNum = self.m_FrameNum
        self.m_Scene.SetCurFrame(iFrameNum)
        if iFrameNum in self.m_ReplayFrameData:
            for sBuffer in self.m_ReplayFrameData[iFrameNum]:
                sBuffer = sBuffer[1:]
                SetPacketDataForUnpack(sBuffer)
                iMsgID = UnpackInt(1)
                pid = UnpackInt(4)
                sBuffer = UnpackBinaryString(0)
                DoServerCmd(self.m_Owner, pid, iMsgID, sBuffer)
                self.m_OutPut.CatchSnapShot(pid, iMsgID)

        self.m_Scene.Simulate()
        self.m_FrameNum += 1

    def Start(self):
        self.m_OutPut.TimeSnapShot(self.m_UUID)
        while self.m_Scene.m_GameState != BattleCmd_pb2.GAME_STATE_END:
            self.Update()

        sFileName = self.OnGameEnd()
        return sFileName

    def Release(self):
        self.m_OutPut.Release()
        self.m_Scene.DoRelease()
        self.m_Owner = None
        self.m_Scene = None
        self.m_OutPut = None
        self.m_ReplayFrameData = None
