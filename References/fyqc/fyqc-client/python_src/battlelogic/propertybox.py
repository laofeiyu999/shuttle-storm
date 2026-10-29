# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\propertybox.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 2845 bytes
from .combatobject import CCombatObject
from base.protobufdata import BattleCmd_pb2
from base.data import GetPropertyBoxData
from base.protobufdata import Common_pb2
from battlelogic.battlebase.dvec3 import CDVec3
from battlelogic.common.debug import LogWarning
from battlelogic.plugins.state import CAddStateArgs
from battlelogic.common.defines import COLLISION_GROUP_MONSTER

class CPropertyBox(CCombatObject):

    def __init__(self, iID, oScene, iMemberType):
        super().__init__(iID, oScene, BattleCmd_pb2.SCENE_OBJECT_TYPE_PROPERTY_BOX)
        self.m_MemberType = iMemberType

    def GetModelID(self):
        oPropertyBoxData = GetPropertyBoxData(self.m_TableID)
        return oPropertyBoxData.m_ModelID

    def InitPhys(self):
        oScene = self.m_Scene
        dExtern = self.GetBounds()["extern"]
        oScene.m_Phys.CreateCapsuleController(self.m_ID, dExtern["Y"], dExtern["X"], COLLISION_GROUP_MONSTER)

    def GetBornPos(self):
        oPropertyBoxData = GetPropertyBoxData(self.m_TableID)
        dRandPos = oPropertyBoxData.m_RandPos
        iX = self.m_Scene.RandomBetween(dRandPos["BeginPos"]["X"], dRandPos["EndPos"]["X"])
        iZ = self.m_Scene.RandomBetween(dRandPos["BeginPos"]["Z"], dRandPos["EndPos"]["Z"])
        if self.m_MemberType == Common_pb2.TEAM_MEMBER_TYPE_HOST:
            iX = -iX
            iZ = -iZ
        return (
         iX, iZ)

    def InitBornPos(self):
        iX, iZ = self.GetBornPos()
        oPos = CDVec3(iX, 0, iZ)
        self.SetPos(oPos, True)

    def InitStateData(self):
        oPropertyBoxData = GetPropertyBoxData(self.m_TableID)
        oAddStateArgs = CAddStateArgs(0)
        for iStateSID in oPropertyBoxData.m_SelfStateLst:
            oAddStateArgs.m_StateSID = iStateSID
            self.DoAddState(oAddStateArgs)

    def Init(self):
        self.InitPhys()
        self.InitBornPos()
        self.InitStateData()

    def OnOtherCloseToMe(self, oTarget):
        oPropertyBoxData = GetPropertyBoxData(self.m_TableID)
        iStateLen = len(oPropertyBoxData.m_StateLst)
        iSkillLen = len(oPropertyBoxData.m_SkillLst)
        iTotalLen = iStateLen + iSkillLen
        if iTotalLen:
            iRandIndex = self.m_Scene.RandomBetween(1, iTotalLen)
            if iStateLen >= iRandIndex:
                tData = oPropertyBoxData.m_StateLst[iRandIndex - 1]
                oAddStateArgs = CAddStateArgs(tData[0])
                oAddStateArgs.m_EffectFrame = tData[1]
                iPropertyID = tData[0]
                oTarget.DoAddState(oAddStateArgs)
            else:
                iRandIndex = iRandIndex - iStateLen
                iSkillSID = oPropertyBoxData.m_SkillLst[iRandIndex - 1]
                iPropertyID = iSkillSID
                oTarget.AddPropertySkill(iSkillSID)
        self.m_Scene.OnPropertyBoxTrigger(self.m_TableID, self.m_MemberType, oPropertyBoxData.m_AfterTriggerRefreshTime, oTarget.m_ID, iPropertyID)

    def DoRelease(self):
        self.m_Scene.m_Phys.DestroyController(self.m_ID)
        super().DoRelease()
