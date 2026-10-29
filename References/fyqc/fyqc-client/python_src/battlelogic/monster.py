# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\monster.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 1794 bytes
from .combatobjectdynamic import CCombatObjectDynamic
from base.protobufdata import BattleCmd_pb2
from base.data import GetMonsterData
from battlelogic.plugins.state import CAddStateArgs
from .plugins.prop.propdata import CPropData
from battlelogic.common.defines import COLLISION_GROUP_MONSTER

class CMonster(CCombatObjectDynamic):

    def __init__(self, iID, oOwner, oScene):
        CCombatObjectDynamic.__init__(self, iID, oScene, BattleCmd_pb2.SCENE_OBJECT_TYPE_MONSTER)
        self.m_Owner = oOwner

    def GetMemberType(self):
        if self.m_Owner:
            return self.m_Owner.GetMemberType()
        else:
            return super().GetMemberType()

    def GetCollisionType(self):
        return COLLISION_GROUP_MONSTER

    def InitPropData(self):
        iMonsterSID = self.GetTableID()
        oMonsterData = GetMonsterData(iMonsterSID)
        for iPropType, iValue in oMonsterData.m_PropDict.items():
            oPropData = CPropData()
            oPropData.m_InitValue = iValue
            self.m_PropContainer.InitProp(iPropType, oPropData)

    def InitStateData(self):
        iMonsterSID = self.GetTableID()
        oMonsterData = GetMonsterData(iMonsterSID)
        oAddStateArgs = CAddStateArgs(0)
        for iStateSID in oMonsterData.m_StateLst:
            oAddStateArgs.m_StateSID = iStateSID
            self.DoAddState(oAddStateArgs)

    def InitBTTree(self):
        iMonsterSID = self.GetTableID()
        oMonsterData = GetMonsterData(iMonsterSID)
        self.AttachBT(oMonsterData.m_BTConfID)

    def InitAfterEnterScene(self):
        super().InitAfterEnterScene()
        self.InitPropData()
        self.InitStateData()
        self.InitBTTree()

    def GetModelID(self):
        iMonsterSID = self.GetTableID()
        oMonsterData = GetMonsterData(iMonsterSID)
        return oMonsterData.m_ModelID

    def DoRelease(self):
        self.m_Owner = None
        super().DoRelease()
