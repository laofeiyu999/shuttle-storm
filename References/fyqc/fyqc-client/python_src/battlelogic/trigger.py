# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\trigger.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 1662 bytes
from battlelogic.combatobject import CCombatObject
from base.protobufdata import BattleCmd_pb2
from battlelogic.common.defines import COLLISION_GROUP_MONSTER
from base.data import GetTriggerData
from battlelogic.plugins.state import CAddStateArgs

class CTrigger(CCombatObject):

    def __init__(self, iID, oOwner, oScene, iCasterSkillID):
        CCombatObject.__init__(self, iID, oScene, BattleCmd_pb2.SCENE_OBJECT_TYPE_TRIGGER)
        self.m_Owner = oOwner
        self.m_CasterSkillID = iCasterSkillID

    def GetMemberType(self):
        if self.m_Owner:
            return self.m_Owner.GetMemberType()
        else:
            return super().GetMemberType()

    def GetCollisionType(self):
        return COLLISION_GROUP_MONSTER

    def GetModelID(self):
        iTriggerSID = self.GetTableID()
        oTriggerData = GetTriggerData(iTriggerSID)
        return oTriggerData.m_ModelID

    def InitPhys(self):
        dExtern = self.GetBounds()["extern"]
        self.m_Scene.m_Phys.CreateCapsuleController(self.m_ID, dExtern["Y"], dExtern["X"], self.GetCollisionType())

    def InitStateData(self):
        iTriggerSID = self.GetTableID()
        oTriggerData = GetTriggerData(iTriggerSID)
        oAddStateArgs = CAddStateArgs(0)
        for iStateSID in oTriggerData.m_StateLst:
            oAddStateArgs.m_StateSID = iStateSID
            oAddStateArgs.m_CasterID = self.m_Owner.m_ID
            oAddStateArgs.m_CasterSkillSID = self.m_CasterSkillID
            self.DoAddState(oAddStateArgs)

    def InitAfterEnterScene(self):
        super().InitAfterEnterScene()
        self.InitPhys()
        self.InitStateData()

    def DoRelease(self):
        self.m_Owner = None
        self.m_Scene.m_Phys.DestroyController(self.m_ID)
        super().DoRelease()
