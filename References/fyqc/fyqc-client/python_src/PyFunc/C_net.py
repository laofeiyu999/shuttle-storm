# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\PyFunc\C_net.py
# Compiled at: 2023-04-06 17:03:31
# Size of source mod 2**32: 13063 bytes
g_GlobalResult = None

def SetGlobalResule(obj):
    global g_GlobalResult
    g_GlobalResult = obj


def GetLen():
    return g_GlobalResult


def GetSeed(pid):
    return g_GlobalResult


def GetNetSeedMode():
    return g_GlobalResult


def GetNetType(pid):
    return g_GlobalResult


def UnpackString(iLen):
    return g_GlobalResult


def UnpackBinaryString(iLen, iFlag=None):
    return g_GlobalResult


def UnpackInt(iSize):
    return g_GlobalResult


def UnpackLong(iSize):
    return g_GlobalResult


def UnpackNetInt(iSize):
    return g_GlobalResult


def UnpackSignedChar():
    return g_GlobalResult


def UnpackBit(i0, i1):
    return g_GlobalResult


def UnpackAll(pid=None):
    return g_GlobalResult


def DataExpand(sData, iServer=None):
    return g_GlobalResult


def CDataExpand():
    return g_GlobalResult


def PacketPrepare(iCmd, i1=None, i2=None):
    return g_GlobalResult


def PacketAddL(iVar, iSize):
    return g_GlobalResult


def PacketAddI(iNum, iSize):
    return g_GlobalResult


def PacketAddNetI(iNum, iSize):
    return g_GlobalResult


def PacketAddS(sData, iLen=None):
    return g_GlobalResult


def PacketAddBinaryS(sData, iLen=None, i1=None):
    return g_GlobalResult


def PacketAddSL(sData, iSize=None):
    return g_GlobalResult


def PacketAddCPack():
    return g_GlobalResult


def PacketSend(id, iCmd=None):
    return g_GlobalResult


def TestSend():
    return g_GlobalResult


def PacketThrow(id, iCmd=None):
    return g_GlobalResult


def UDPPacketSend(i0, i1=None):
    return g_GlobalResult


def UDPStart(i0, i1, i2, i3=None):
    return g_GlobalResult


def ListenClientUDP(i0, i1=None, i2=None):
    return g_GlobalResult


def ListenServerUDP(i0):
    return g_GlobalResult


def SetClientUDPIP(o0):
    return g_GlobalResult


def GetClientSocketID(id):
    return g_GlobalResult


def GetClientIPPort(id):
    return g_GlobalResult


def GetCPacketData():
    return g_GlobalResult


def GetPacketData():
    return g_GlobalResult


def GetPacketDataForServer():
    return g_GlobalResult


def SetPacketDataForUnpack(sData):
    return g_GlobalResult


def SetPacketData(sData):
    return g_GlobalResult


def SendData(id):
    return g_GlobalResult


def SendToPlayers(players, iFlag=None, iCmd=None):
    return g_GlobalResult


def NakedSend(id):
    return g_GlobalResult


def DBSPause():
    return g_GlobalResult


def SendToDBS():
    return g_GlobalResult


def SetSocketDebugFlag(id, iFlag):
    return g_GlobalResult


def SetPacketLogSwitch(iFlag):
    return g_GlobalResult


def AddClientRecvPackage(id, sUUID, sData):
    return g_GlobalResult


def DoNetLink(i0, s0, i1, i2):
    return g_GlobalResult


def UnpackBytes():
    return g_GlobalResult


def OpenServerCmdStat(iFlag, iTime=None):
    return g_GlobalResult


def L2SPacketSend(pid):
    return g_GlobalResult
