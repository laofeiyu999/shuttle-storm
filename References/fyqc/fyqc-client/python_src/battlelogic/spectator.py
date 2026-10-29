# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\spectator.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 1187 bytes
from battlelogic.common.defines import FIRE_EMOJI_INTERVAL_FRAME
from base.protobufdata import Common_pb2, BattleCmd_pb2

class CSpectator(object):

    def __init__(self, iID, oRoom):
        self.m_ID = iID
        self.m_Room = oRoom
        self.m_ApparelLst = []
        self.m_LastFireEmojiFrame = 0
        self.m_BriefData = Common_pb2.PlayerBriefData()
        self.m_SunburnData = Common_pb2.PlayerSunburnData()

    def SetBriefData(self, oBriefData):
        self.m_BriefData.CopyFrom(oBriefData)

    def SetSunburnData(self, oSunburnData):
        self.m_SunburnData.CopyFrom(oSunburnData)

    def SetApparelLst(self, oApparelLst):
        for iID in oApparelLst:
            self.m_ApparelLst.append(iID)

    def SetTableID(self, iTableID):
        self.m_TableID = iTableID

    def GetTableID(self):
        return self.m_TableID

    def FireEmoji(self, iEmojiID):
        return

    def FormatSpectatorData(self, oMsg):
        oMsg.BriefData.CopyFrom(self.m_BriefData)
        oMsg.PlayerSunburnData.CopyFrom(self.m_SunburnData)
        for iTableID in self.m_ApparelLst:
            oMsg.Apparels.append(iTableID)

        oMsg.HeroID = self.GetTableID()

    def Release(self):
        self.m_Room = None
