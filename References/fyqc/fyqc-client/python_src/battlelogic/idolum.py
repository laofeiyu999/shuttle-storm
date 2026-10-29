# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\idolum.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 984 bytes
from .combatobject import CCombatObject
from base.protobufdata import BattleCmd_pb2
from battlelogic.battlebase.dvec3 import CDVec3

class CIdolum(CCombatObject):

    def __init__(self, iID, oScene, iOwnerID):
        super().__init__(iID, oScene, BattleCmd_pb2.SCENE_OBJECT_TYPE_IDOLUM)
        self.m_OwnerID = iOwnerID

    def CheckEnd(self):
        if not self.m_EndFrame:
            return
        oPlayer = self.m_Scene.GetPlayer(self.m_OwnerID)
        iCurEffectiveFrame = oPlayer.GetCurEffectiveFrame()
        if self.m_EndFrame <= iCurEffectiveFrame:
            self.SetDelFlag()

    def GetAddExtData(self):
        oExtData = BattleCmd_pb2.BattleAddIdolumExtData()
        oExtData.OwnerID = self.m_OwnerID
        return oExtData.SerializeToString()

    def InitBornPos(self):
        oOwner = self.m_Scene.GetPlayer(self.m_OwnerID)
        oOwnerPos = oOwner.GetPos()
        oPos = CDVec3(oOwnerPos.m_X, 0, oOwnerPos.m_Z)
        self.SetPos(oPos, True)

    def Init(self):
        self.InitBornPos()
