# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\prediction\prediction.py
# Compiled at: 2023-04-06 17:03:30
# Size of source mod 2**32: 2757 bytes
from C_net import GetPacketData, SetPacketDataForUnpack, PacketPrepare, PacketAddI, UnpackInt, PacketAddBinaryS, UnpackBinaryString
from base.protobufdata import BattleCmd_pb2, PlayerFrameData_pb2
from base.data import GetHitActionData
from .playerframedata import GetFrameDataPacker, GetFrameDataUnpacker, GetFrameDataName, MergePlayerFrameData, GetFrameDataFields, GetFrameDataCopyFunc
from battlelogic.common.debug import LogWarning
from .serverdata import CServerData

class CPrediction:

    def __init__(self, oOwner):
        self.m_Owner = oOwner
        self.m_HistoryPackCache = {}
        self.m_HistoryCmdCahe = {}
        self.m_ServerFrameNum = {}

    def GetServerFrameNum(self, iFrameNum):
        return self.m_ServerFrameNum.get(iFrameNum, 0)

    def SetServerFrameNum(self, iFrameNum, iServerFrameNum):
        self.m_ServerFrameNum[iFrameNum] = iServerFrameNum

    def AddHistoryPack(self, iFrameNum, dData):
        self.m_HistoryPackCache[iFrameNum] = dData

    def DelHistoryPack(self, iFrameNum):
        if iFrameNum in self.m_HistoryPackCache:
            del self.m_HistoryPackCache[iFrameNum]

    def GetHistoryPack(self, iFrameNum):
        return self.m_HistoryPackCache.get(iFrameNum, None)

    def AddHistoryCmd(self, iFrameNum, iMsgID, sBuffer):
        if iFrameNum not in self.m_HistoryCmdCahe:
            self.m_HistoryCmdCahe[iFrameNum] = [
             (
              iMsgID, sBuffer)]
        else:
            self.m_HistoryCmdCahe[iFrameNum].append((iMsgID, sBuffer))

    def InsertHistoryCmd(self, iFrameNum, lstCmds):
        if iFrameNum not in self.m_HistoryCmdCahe:
            self.m_HistoryCmdCahe[iFrameNum] = lstCmds
        else:
            self.m_HistoryCmdCahe[iFrameNum] = lstCmds + self.m_HistoryCmdCahe[iFrameNum]

    def DelHistoryCmds(self, iFrameNum):
        if iFrameNum in self.m_HistoryCmdCahe:
            del self.m_HistoryCmdCahe[iFrameNum]

    def GetHistoryCmds(self, iFrameNum):
        return self.m_HistoryCmdCahe.get(iFrameNum, [])

    def PackPlayerFrameData(self):
        oMsg = PlayerFrameData_pb2.PlayerFrameData()
        for index in GetFrameDataFields():
            func = GetFrameDataPacker(index)
            func(self.m_Owner, oMsg)

        return oMsg

    def UnpackPlayerFrameData(self, oMsg):
        for iType in GetFrameDataFields():
            func = GetFrameDataUnpacker(iType)
            func(self.m_Owner, oMsg)

    def InsertHistoryPack(self, iBeginFrameNum, iEndFramNum, iType):
        for iFrameNum in range(iBeginFrameNum, iEndFramNum + 1):
            if iFrameNum not in self.m_HistoryPackCache:
                oMsg = PlayerFrameData_pb2.PlayerFrameData()
            else:
                oMsg = self.m_HistoryPackCache[iFrameNum]
            func = GetFrameDataPacker(iType)
            func(self.m_Owner, oMsg)
            self.m_HistoryPackCache[iFrameNum] = oMsg
