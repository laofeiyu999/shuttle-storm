# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\rerunreplay\__init__.py
# Compiled at: 2023-04-06 17:03:31
# Size of source mod 2**32: 1364 bytes
from .defines import SERVER_REPLAY_PATH
from .rerunserverreplay import CReRunServerReplay
from .output import COutPutInit
import os
if "g_AllFileName" not in globals():
    g_AllFileName = []

def GetFilePostfix(sFilePath):
    iPos = sFilePath.rfind(".")
    if iPos == -1:
        return ""
    else:
        return sFilePath[iPos:]


def IsReplayFile(sFilePath):
    sPostfix = GetFilePostfix(sFilePath)
    return sPostfix == ".replay"


def DoReRun(sFilePath):
    global g_AllFileName
    oFile = open(sFilePath, "rb")
    sBuffer = oFile.read()
    oReRunServerReplay = CReRunServerReplay()
    oReRunServerReplay.Init(sBuffer)
    sFileName = oReRunServerReplay.Start()
    oReRunServerReplay.Release()
    g_AllFileName.append(sFileName)
    oFile.close()


def ReRunAll():
    global g_AllFileName
    g_AllFileName = []
    if not os.path.isdir(SERVER_REPLAY_PATH):
        return
    fileLst = os.listdir(SERVER_REPLAY_PATH)
    OnReRun(fileLst, SERVER_REPLAY_PATH)
    oOutPutInit = COutPutInit()
    oOutPutInit.WriteInitFile(g_AllFileName)


def OnReRun(fileLst, sReplayPath):
    for sFileDate in fileLst:
        sFilePath = sReplayPath + sFileDate
        if os.path.isdir(sFilePath):
            fileNameLst = os.listdir(sFilePath)
            sFilePath = sFilePath + "/"
            OnReRun(fileNameLst, sFilePath)
            continue
            if not IsReplayFile(sFilePath):
                pass
            else:
                DoReRun(sFilePath)
