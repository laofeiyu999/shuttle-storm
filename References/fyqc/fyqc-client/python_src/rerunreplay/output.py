# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\rerunreplay\output.py
# Compiled at: 2023-04-06 17:03:31
# Size of source mod 2**32: 1903 bytes
from .defines import OUT_PUT_OP_SNAP_SHOT_PATH
from base.protobufdata import BattleCmd_pb2
from battlelogic.common.debug import LogError
from battlelogic.common.defines import IsPlayerObjectID

class COutPut(object):

    def __init__(self):
        return

    def DoWriteFile(self, sFilePath, sText):
        oFile = open(sFilePath, "wt", encoding="utf8", newline="\n")
        oFile.write(sText)
        oFile.close()


class COutPutForGameAI(COutPut):

    def __init__(self, oScene):
        self.m_Scene = oScene
        self.m_OPSnapShot = []

    def WriteFile(self, sFilePath):
        sText = "# -*- coding:utf-8 -*-\n\ng_OPSnapShot = {self.m_OPSnapShot}\n"
        sText = sText.format(self=self)
        self.DoWriteFile(sFilePath, sText)

    def OutPut(self, sFileName):
        sFileName = sFileName.replace("-", "")
        sFileName = sFileName.replace("_", "")
        sFilePath = "%s%s.py" % (
         OUT_PUT_OP_SNAP_SHOT_PATH,
         sFileName)
        self.WriteFile(sFilePath)

    def CatchSnapShot(self, pid, iMsgID):
        if not IsPlayerObjectID(pid):
            return
        else:
            if self.m_Scene.m_GameState not in (BattleCmd_pb2.GAME_STATE_PLAYING,):
                return
            if iMsgID not in (BattleCmd_pb2.BATTLE_MOVE_DIR_MSG, BattleCmd_pb2.BATTLE_HIT_RES_MSG):
                return
        dReqData = self.m_Scene.m_GameAI.FormatReqData()
        self.m_OPSnapShot.append(dReqData)

    def TimeSnapShot(self, sUUID):
        dTimeData = {}
        if sUUID:
            if len(sUUID.split("-")) > 2:
                dTimeData["BeginTime"] = sUUID.split("-")[1]
        self.m_OPSnapShot.append(dTimeData)

    def Release(self):
        self.m_Scene = None
        self.m_OPSnapShot = None


class COutPutInit(COutPut):

    def WriteInitFile(self, lstFileName):
        sText = "# -*- coding:utf-8 -*-\n\ng_AllOPSnapShop = {lstFileName}\n"
        sText = sText.format(lstFileName=lstFileName)
        sFilePath = "%s%s.py" % (
         OUT_PUT_OP_SNAP_SHOT_PATH,
         "__init__")
        self.DoWriteFile(sFilePath, sText)
