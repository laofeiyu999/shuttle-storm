# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\battlebase\doutput.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 2938 bytes
from base.protobufdata import Common_pb2, DCmd_pb2
from C_net import GetPacketData, PacketPrepare, PacketAddI, PacketAddBinaryS
from base.serverconnstatus import ChooseRandomFSByType
from pubcore.pubfuncs import log_file, GetLogDir
import pubrpc, ctrlcenter, C_game, os

class COutputObj(object):

    def __init__(self):
        self.m_FileName = None
        self.m_OutputBuffer = None
        self.m_LogPath = GetLogDir()

    def SetOutputBuffer(self, sFileName, sBuffer):
        self.m_FileName = "%s/%s" % (self.m_LogPath, sFileName)
        self.m_OutputBuffer = sBuffer

    def ClearOutputBuffer(self):
        self.m_FileName = None
        self.m_OutputBuffer = None

    def Output(self):
        f = open(self.m_FileName, "wb")
        f.write(self.m_OutputBuffer)
        f.close()
        log_file("output", "output file %s,len %d" % (self.m_FileName, len(self.m_OutputBuffer)))

    def Makedirs(self, sDir):
        sDir = "%s/%s" % (self.m_LogPath, sDir)
        if not os.path.exists(sDir):
            os.makedirs(sDir)


class CReplayOutput(COutputObj):

    def __init__(self, oRoom, bOnSave=False):
        super().__init__()
        self.m_OnSave = bOnSave
        self.m_GameReplayData = Common_pb2.GameReplayData()
        self.m_Room = oRoom

    def SetCreateGameData(self, oMsg):
        if not self.m_OnSave:
            return
        self.m_GameReplayData.CreateGameData = oMsg.SerializeToString()

    def AddCmdData(self, iCurFrame, pid, iMsg, oMsg):
        if not self.m_OnSave:
            return
        sBuffer = oMsg.SerializeToString()
        PacketPrepare(DCmd_pb2.CMD_BATTLE)
        PacketAddI(iMsg, 1)
        PacketAddI(pid, 4)
        PacketAddBinaryS(sBuffer, len(sBuffer))
        sBuffer = GetPacketData()
        oReplayAICmd = self.m_GameReplayData.Datas.add()
        oReplayAICmd.CurFrame = iCurFrame
        oReplayAICmd.BinData = sBuffer

    def OutputReplayFile(self, sFileName):
        if not self.m_OnSave:
            return
        oScene = self.m_Room.GetScene()
        if not oScene:
            return
        oMsg = oScene.GetCreateGameInfo()
        self.SetCreateGameData(oMsg)
        sBuffer = self.m_GameReplayData.SerializeToString()
        self.SetOutputBuffer(sFileName, sBuffer)
        self.Output()
        self.ClearOutputBuffer()

    def RPCOutput(self):
        if not self.m_OnSave:
            return
        else:
            oScene = self.m_Room.GetScene()
            if not oScene:
                return
            oMsg = oScene.GetCreateGameInfo()
            self.SetCreateGameData(oMsg)
            lArgs = [self.m_Room.m_UUID, self.m_GameReplayData.SerializeToString()]
            iFSNum = ChooseRandomFSByType(ctrlcenter.defines.SERVERTYPE_OUTPUT)
            log_file("output", "rpcoutput uuid:%s, len:%d, output fs num %d, room id %d" % (
             self.m_Room.m_UUID,
             len(self.m_GameReplayData.SerializeToString()),
             iFSNum,
             self.m_Room.m_RoomID))
            if iFSNum:
                pubrpc.CallFunc(iFSNum, "outputserver.outputrpc.R_ReplayOutput", lArgs, None)

    def SetIsOnSave(self, bOnSave):
        self.m_OnSave = bOnSave

    def GetIsOnSave(self):
        return self.m_OnSave

    def DoRelease(self):
        self.m_Room = None
