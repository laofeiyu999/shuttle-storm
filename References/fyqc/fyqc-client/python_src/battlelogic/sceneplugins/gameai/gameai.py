# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\sceneplugins\gameai\gameai.py
# Compiled at: 2023-04-06 17:07:52
# Size of source mod 2**32: 7222 bytes
from base.protobufdata import Common_pb2
from base.protobufdata import BattleCmd_pb2, SkillCmd_pb2
from battlelogic.common.defines import IsPlayerObjectID
from battlelogic.common.logicutil import GetOriginalDirByMemberType
from battlelogic.common.defines import Frame2Sec
from battlelogic.common.defines import IsServer
from battlelogic.battlebase.dmath import ClampFloat
from battlelogic.common.defines import Sec2Frame
from .defines import CalcGameAIDifficultyLevel
from base.data import GetSkillData

class CGameAI(object):

    def __init__(self, oScene):
        self.m_Scene = oScene
        self.m_AllPlayerDoingSkill = {}
        self.m_DifficultyLevel = 1

    def DoRelease(self):
        self.m_Scene = None
        self.m_AllPlayerDoingSkill = {}

    def FormatReqActionSceneStatus(self, dReqData):
        return

    def FormatReqActionBadmintonStatus(self, dBadmintonData):
        if self.m_Scene.GetGameState() != BattleCmd_pb2.GAME_STATE_PLAYING:
            return
        else:
            oBadminton = self.m_Scene.GetFirstBadminton()
            dBadmintonData["nps"] = []
            for i in range(5):
                oPos = oBadminton.GetPreJudgePos(i)
                dBadmintonData["nps"].append((oPos.m_X, oPos.m_Y, oPos.m_Z))

            if not oBadminton.GetSimulateFinished():
                oDropPos = oBadminton.GetDropPos()
                dBadmintonData["dp"] = (oDropPos.m_X, oDropPos.m_Y, oDropPos.m_Z)
            if oBadminton.m_CurveData:
                dBadmintonData["cid"] = oBadminton.m_CurveData.m_CurveId
            oStarMarkPos = oBadminton.GetStarMarkPos()
            dBadmintonData["smp"] = (oStarMarkPos.m_X, oStarMarkPos.m_Y, oStarMarkPos.m_Z)
            if oBadminton.GetAtkSkillSID():
                oSkillData = GetSkillData(oBadminton.GetAtkSkillSID())
                if oSkillData:
                    if oSkillData.m_SkillType in (SkillCmd_pb2.SKILL_TYPE_ULTIMATE, SkillCmd_pb2.SKILL_TYPE_GENERAL):
                        dBadmintonData["st"] = oSkillData.m_SkillSchoolType
            oOwner = oBadminton.GetOwner()
            if oOwner:
                dBadmintonData["oid"] = oOwner.m_ID

    def CalcPlayerAvgElo(self):
        iTotalElo = 0
        iTotalPlayerCnt = 0
        iAvgElo = 0
        for oPlayer in self.m_Scene.GetAllPlayer():
            if IsPlayerObjectID(oPlayer.m_ID):
                iTotalElo += oPlayer.Elo()
                iTotalPlayerCnt += 1

        if iTotalPlayerCnt == 0:
            return iAvgElo
        else:
            iAvgElo = int(iTotalElo / iTotalPlayerCnt)
            return iAvgElo

    def ReCalcAllPlayerSkillStatus(self):
        dAllPlayerDoingSkill = {}
        for oPlayer in self.m_Scene.GetAllPlayer():
            pid = oPlayer.m_ID
            dAllPlayerDoingSkill[pid] = set()
            for iSkillID, iHitKey in oPlayer.m_PositiveSkillData.items():
                if iHitKey == oPlayer.GetHitKey():
                    dAllPlayerDoingSkill[pid].add(iSkillID)

            for iStateSID, oState in oPlayer.m_StateManager.m_StateDict.items():
                if iStateSID in oPlayer.m_StateManager.m_RemoveSet:
                    pass
                else:
                    if oState.m_CasterID == pid and oState.m_CasterSkillSID:
                        dAllPlayerDoingSkill[pid].add(oState.m_CasterSkillSID)

        self.m_AllPlayerDoingSkill = dAllPlayerDoingSkill

    def IsSkillDoing(self, oTarget, iSkillID):
        iTargetID = oTarget.m_ID
        if iTargetID in self.m_AllPlayerDoingSkill:
            if iSkillID in self.m_AllPlayerDoingSkill[iTargetID]:
                return 1
        return 0

    def DoFormatReqActionPlayerSkillStatus(self, oPlayer, iSkillID, dData):
        dData["id"] = iSkillID
        dData["cd"] = 0
        iHitKey = oPlayer.m_PositiveSkillData.get(iSkillID, 0)
        if iHitKey:
            dData["cd"] = Frame2Sec(oPlayer.m_ActionCDManager.GetLeftCD(iHitKey, self.m_Scene.GetCurEffectiveFrame()))
        dData["d"] = self.IsSkillDoing(oPlayer, iSkillID)

    def DoFormatReqActionPlayerPropertySkill(self, oPlayer, dPlayerData):
        if not oPlayer.m_HistoryPropertySkills:
            return
        dPlayerData["pss"] = []
        fCD = Frame2Sec(oPlayer.m_ActionCDManager.GetLeftCD(BattleCmd_pb2.HIT_KEY_KEY_DJ, self.m_Scene.GetCurEffectiveFrame()))
        iCurPropertySkillID = oPlayer.m_PropertySkillID
        for iSkillID in oPlayer.m_HistoryPropertySkills:
            dData = {}
            dData["id"] = iSkillID
            dData["cd"] = fCD
            dData["d"] = self.IsSkillDoing(oPlayer, iSkillID)
            if iCurPropertySkillID == iSkillID:
                dData["cu"] = 1
            dPlayerData["pss"].append(dData)

    def DoFormatReqActionPlayerStatus(self, oPlayer, dPlayerData):
        oBadminton = self.m_Scene.GetFirstBadminton()
        pid = oPlayer.m_ID
        dPlayerData["pid"] = pid
        dPlayerData["te"] = oPlayer.GetMemberType()
        if IsPlayerObjectID(pid):
            dPlayerData["ty"] = Common_pb2.GAME_AI_TYPE_PLAYER
        elif oPlayer.m_IsGameAI:
            dPlayerData["ty"] = Common_pb2.GAME_AI_TYPE_GAME_AI
            dPlayerData["al"] = self.m_DifficultyLevel
        else:
            dPlayerData["ty"] = Common_pb2.GAME_AI_TYPE_A5_AI
        oPos = oPlayer.GetPos()
        dPlayerData["p"] = (oPos.m_X, oPos.m_Y, oPos.m_Z)
        oMoveDir = oPlayer.GetMoveDir()
        oRiginalDir = GetOriginalDirByMemberType(oMoveDir, oPlayer.GetMemberType())
        oSpeedData = oPlayer.GetSpeedValue()
        dPlayerData["sp"] = (oSpeedData.m_SpeedForward, oSpeedData.m_SpeedBack, oSpeedData.m_SpeedLeft, oSpeedData.m_SpeedRight)
        dPlayerData["er"] = oPlayer.GetCounterValue(BattleCmd_pb2.COUNTER_TYPE_CONTINUOUS)
        if oBadminton.GetAttackerID() == pid:
            dPlayerData["hd"] = oBadminton.GetHitDir()
        else:
            dPlayerData["ss"] = []
            for iSkillID in oPlayer.m_EquipingSkill:
                dData = {}
                self.DoFormatReqActionPlayerSkillStatus(oPlayer, iSkillID, dData)
                dPlayerData["ss"].append(dData)

            oHitAction = oPlayer.m_DoHitAction.m_HitAction
            if oHitAction:
                dPlayerData["caid"] = oHitAction.m_ID
            if oPlayer.m_StateManager.HasStateType(BattleCmd_pb2.STATE_TYPE_DEBUFF):
                dPlayerData["df"] = 1
            else:
                dPlayerData["df"] = 0
        self.DoFormatReqActionPlayerPropertySkill(oPlayer, dPlayerData)

    def FormatReqActionPlayerStatus(self):
        playerDataLst = []
        for oPlayer in self.m_Scene.GetAllPlayer():
            dPlayerData = {}
            self.DoFormatReqActionPlayerStatus(oPlayer, dPlayerData)
            playerDataLst.append(dPlayerData)

        return playerDataLst

    def FormatReqActionMonsterStatus(self):
        monsterDataLst = []
        for oMonster in self.m_Scene.GetAllMonster():
            dMonsterData = {}
            dMonsterData["tid"] = oMonster.GetTableID()
            dMonsterData["te"] = oMonster.GetMemberType()
            oPos = oMonster.GetPos()
            dMonsterData["pos"] = (oPos.m_X, oPos.m_Y, oPos.m_Z)
            monsterDataLst.append(dMonsterData)

        return monsterDataLst

    def FormatReqActionPropertyBoxStatus(self):
        propertyBoxDataLst = []
        for oPropertyBox in self.m_Scene.GetAllPropertyBox():
            dPropertyBoxData = {}
            dPropertyBoxData["tid"] = oPropertyBox.GetTableID()
            oPos = oPropertyBox.GetPos()
            dPropertyBoxData["pos"] = (oPos.m_X, oPos.m_Y, oPos.m_Z)
            propertyBoxDataLst.append(dPropertyBoxData)

        return propertyBoxDataLst

    def FormatReqData(self):
        dReqData = {}
        self.ReCalcAllPlayerSkillStatus()
        self.FormatReqActionSceneStatus(dReqData)
        dBadmintonData = {}
        self.FormatReqActionBadmintonStatus(dBadmintonData)
        dReqData["b"] = dBadmintonData
        dReqData["rs"] = self.FormatReqActionPlayerStatus()
        dReqData["bs"] = self.FormatReqActionPropertyBoxStatus()
        dReqData["ms"] = self.FormatReqActionMonsterStatus()
        return dReqData

    def TryReq(self):
        return

    def Init(self):
        return
