# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\gameplayer.py
# Compiled at: 2023-04-06 17:07:52
# Size of source mod 2**32: 34682 bytes
from .combatobjectdynamic import CCombatObjectDynamic
from base.protobufdata import BattleCmd_pb2, PlayerFrameData_pb2, SkillCmd_pb2
from battlelogic.common.defines import IsServer
from base.data import GetHeroData
from .plugins.prop.propdata import CPropData
from .plugins.battleskill.battleskill import CBattleSkill
from base.data import GetSkillData
from battlelogic.battlebase.dphysics import GetDetourPassPos
from .config.courtconfig import CorrectPos
from .common.debug import LogWarning, Profiler, LogError, Log, LogFile
from base.data import GetCourtData
from battlelogic.common.decorator import PredictionHeroOnly, ServerOnly, NoPrediction
from base.data import GetHitActionData
from battlelogic.common.defines import HITACTION_PREJUDGE_FRAME, COLLISION_GROUP_CHAR, HANG_UP_FRAMES, HANG_UP_WARNING_FRAMES, HANG_UP_FRAMES_WITH_FRIEND
from battlelogic.common.defines import GetRangeDir
from base.protobufdata import Common_pb2, NormalCmd_pb2, RuneCmd_pb2
from battlelogic.plugins.state import CAddStateArgs
from base.data import GetGameRuleData
from battlelogic.common.defines import IsPlayerObjectID
from battlelogic.common.defines import DISCONNECT_WITHOUT_PING_FRAME, OFFLINE_WITHOUT_PING_FRAME, OFFLINE_WITHOUT_PING_FRAME_WITH_FRIEND
from battlelogic.common.defines import PLAYER_ABNORMAL_STATUS_BTCONFID, FIRE_EMOJI_INTERVAL_FRAME
from base.data import rplstr
from battlelogic.common.defines import PLAYER_ABNORMAL_STATUS_HANGUP, PLAYER_ABNORMAL_STATUS_QIUT, PLAYER_ABNORMAL_STATUS_DISCONNECT, PLAYER_ABNORMAL_STATUS_OFFLINE
from base.data import GetStateData
from base.data.bombplayskill import ConvertBombSkillLstToNormal, GetBombPlaySkill
from base.data.battleemoji import BATTLEEMOJI_LIST

class CGamePlayer(CCombatObjectDynamic):

    def __init__(self, iPlayerID, oScene):
        super().__init__(iPlayerID, oScene, BattleCmd_pb2.SCENE_OBJECT_TYPE_PLAYER)
        self.m_BriefData = Common_pb2.PlayerBriefData()
        self.m_SunburnData = Common_pb2.PlayerSunburnData()
        self.m_SkillParamValue = {}
        self.m_EquipingSkill = set()
        self.m_SkillInfo = {}
        self.m_PositiveSkillData = {}
        self.m_HasAbandonedExchangeSkill = False
        self.m_PropertySkillID = 0
        self.m_LastActiveFrameNum = 0
        self.m_PersonalDetail = {}
        self.m_HasWarningHangUp = False
        self.m_LastPingFrame = 0
        self.m_IsLoading = False
        self.m_LastFireEmojiFrame = 0
        self.m_OriginalSchemeIdx = 0
        self.m_SchemeData = {}
        self.m_CurSchemeIdx = 0
        self.m_LastSchemeIdx = 0
        self.m_SkillSchemeHis = {}
        self.m_IsGameAI = False
        self.m_AbnormalStatus = 0
        self.m_WithFriend = False
        self.m_HistoryPropertySkills = set()
        self.m_GameAI2BTConfID = 0
        self.m_GameAI2BotFlag = False

    def SetName(self, sName):
        self.m_BriefData.Name = sName
        self.m_Name = sName

    def Grade(self):
        return self.m_BriefData.Grade

    def Elo(self):
        if self.m_Scene.m_GameMode == Common_pb2.GAME_MODE_QUALIFY:
            return self.m_BriefData.QualifyElo
        else:
            if self.m_Scene.m_GameMode == Common_pb2.GAME_MODE_ROOM:
                if self.m_Scene.m_BattleMode == Common_pb2.BATTLE_MODE_SINGLE:
                    return self.m_BriefData.QualifyElo
            return self.m_BriefData.MatchElo

    def SetLoading(self, bLoading):
        self.m_IsLoading = bLoading

    def GetCollisionType(self):
        return COLLISION_GROUP_CHAR

    def GetPlayerStatus(self):
        if self.m_AbnormalStatus == PLAYER_ABNORMAL_STATUS_DISCONNECT:
            return BattleCmd_pb2.BATTLE_SCENE_PLAYER_STATUS_DISCONNECT
        else:
            if self.m_AbnormalStatus:
                return BattleCmd_pb2.BATTLE_SCENE_PLAYER_STATUS_OFFLINE
            return BattleCmd_pb2.BATTLE_SCENE_PLAYER_STATUS_NORMAL

    def OnPlayerStatusDelta(self):
        oMsg = BattleCmd_pb2.BattleUpdatePlayerStatusMsg()
        oMsg.PlayerID = self.m_ID
        oMsg.PlayerStatus = self.GetPlayerStatus()
        LogFile("battlelogic", "playerstatusdelta|%d|%d|%d" % (
         self.m_Scene.m_ID,
         self.m_ID,
         self.m_AbnormalStatus))
        self.AddDelta(BattleCmd_pb2.BATTLE_UPDATE_PLAYER_STATUS_MSG, oMsg)

    def OnHangUpWarning(self):
        self.m_HasWarningHangUp = True
        self.m_Scene.NotifyToAll(rplstr.CRplStr("S_GAMEPLAYER_1", {"$$0": (self.Name())}))

    def EnterHangUp(self):
        Log("%d enter hangup attach bt" % (self.m_ID,))
        self.AttachBT(PLAYER_ABNORMAL_STATUS_BTCONFID)
        self.m_Scene.OnPlayerHangUp(self.m_ID)
        self.m_Scene.CheckGameAdvanceEnd()
        self.OnPlayerStatusDelta()

    def OnHangUp(self):
        self.m_AbnormalStatus |= PLAYER_ABNORMAL_STATUS_HANGUP
        self.m_Scene.NotifyToAll(rplstr.CRplStr("S_GAMEPLAYER_2", {"$$0": (self.Name())}))
        self.EnterHangUp()

    def CancelHangUp(self, fMoveX, fMoveZ):
        if not self.m_HasWarningHangUp:
            return
        self.m_HasWarningHangUp = False
        Log("%d cancel hangup detach bt" % (self.m_ID,))
        self.DetachBT()
        self.HandleJoystickDir(fMoveX, 0, fMoveZ)

    def OnConnected(self):
        if not self.m_AbnormalStatus & PLAYER_ABNORMAL_STATUS_DISCONNECT:
            return
        Log("%d on connected detach bt" % (self.m_ID,))
        self.DetachBT()
        self.m_AbnormalStatus ^= PLAYER_ABNORMAL_STATUS_DISCONNECT
        self.m_Scene.NotifyToAll(rplstr.CRplStr("S_GAMEPLAYER_6", {"$$0": (self.Name())}))
        self.OnPlayerStatusDelta()

    def CouldCheckAbnormalStatus(self):
        if not self.m_Scene.m_AbnormalStatusCheck:
            return False
        else:
            if not IsPlayerObjectID(self.m_ID):
                return False
            if self.m_IsLoading:
                return False
            return True

    def HandleHangUp(self):
        if self.m_AbnormalStatus:
            return
        else:
            iNegativeFrame = self.m_Scene.m_EffectiveFrameNum - self.m_LastActiveFrameNum
            if not self.m_HasWarningHangUp:
                if iNegativeFrame >= HANG_UP_WARNING_FRAMES:
                    self.OnHangUpWarning()
                bHangUp = False
                if self.m_WithFriend:
                    if iNegativeFrame >= HANG_UP_FRAMES_WITH_FRIEND:
                        bHangUp = True
            else:
                if iNegativeFrame >= HANG_UP_FRAMES:
                    bHangUp = True
            if bHangUp:
                self.OnHangUp()

    def HandlerPing(self):
        if self.m_AbnormalStatus == PLAYER_ABNORMAL_STATUS_DISCONNECT | PLAYER_ABNORMAL_STATUS_OFFLINE:
            return
        elif self.m_AbnormalStatus & PLAYER_ABNORMAL_STATUS_HANGUP or self.m_AbnormalStatus & PLAYER_ABNORMAL_STATUS_QIUT:
            return
        else:
            iCurFrame = self.m_Scene.GetCurFrame()
            iPassFrame = iCurFrame - self.m_LastPingFrame
            if not self.m_AbnormalStatus & PLAYER_ABNORMAL_STATUS_DISCONNECT:
                if iPassFrame > DISCONNECT_WITHOUT_PING_FRAME:
                    self.OnDisconnect()
            elif not self.m_AbnormalStatus & PLAYER_ABNORMAL_STATUS_OFFLINE:
                pass
            bOfflineFlag = False
            if self.m_WithFriend:
                if iPassFrame > OFFLINE_WITHOUT_PING_FRAME_WITH_FRIEND:
                    bOfflineFlag = True
            else:
                if iPassFrame > OFFLINE_WITHOUT_PING_FRAME:
                    bOfflineFlag = True
            if bOfflineFlag:
                self.OnOffline()
            elif self.m_AbnormalStatus & PLAYER_ABNORMAL_STATUS_DISCONNECT:
                if iPassFrame < DISCONNECT_WITHOUT_PING_FRAME:
                    self.OnConnected()

    @ServerOnly
    def CheckAbnormalStatus(self):
        if not self.CouldCheckAbnormalStatus():
            return
        self.HandleHangUp()
        self.HandlerPing()

    def ExecuteLoop(self):
        self.CheckAbnormalStatus()
        super().ExecuteLoop()

    def GetSkillParamValue(self, sParam):
        if sParam not in self.m_SkillParamValue:
            return 0
        else:
            return self.m_SkillParamValue[sParam]

    def SetSkillParamValue(self, sParam, iValue):
        if sParam not in self.m_SkillParamValue:
            self.m_SkillParamValue[sParam] = 0
        self.m_SkillParamValue[sParam] += iValue

    def ClearSkillParamValue(self, sParam):
        if sParam not in self.m_SkillParamValue:
            return
        del self.m_SkillParamValue[sParam]

    def SetSkillInfo(self, iSkillID, iLevel, bEquip):
        self.m_SkillInfo[iSkillID] = {'level':iLevel, 
         'isequip':bEquip}

    def GetSkillLevel(self, iSkillID):
        if self.m_Scene.GetGameMode() == Common_pb2.GAME_MODE_BOMB:
            iSkillID = GetBombPlaySkill(iSkillID)
        dSkillData = self.m_SkillInfo.get(iSkillID, {})
        if "newlevel" in dSkillData:
            return dSkillData["newlevel"]
        else:
            return dSkillData["level"]

    def GetSkillEquip(self, iSkillID):
        if self.m_Scene.GetGameMode() == Common_pb2.GAME_MODE_BOMB:
            iSkillID = GetBombPlaySkill(iSkillID)
        dSkillData = self.m_SkillInfo.get(iSkillID, {})
        return dSkillData.get("isequip", False)

    def SetSkillNewLevel(self, iSkillID, iNewLevel):
        if iSkillID not in self.m_SkillInfo:
            return
        self.m_SkillInfo[iSkillID]["newlevel"] = iNewLevel

    def SetAllSkillData(self, oPlayerData):
        for oSkillData in oPlayerData.SkillData:
            self.SetSkillInfo(oSkillData.SkillID, oSkillData.Level, oSkillData.IsEquip)

        self.m_OriginalSchemeIdx = oPlayerData.SchemeIdx
        self.m_CurSchemeIdx = oPlayerData.SchemeIdx
        self.m_LastSchemeIdx = oPlayerData.SchemeIdx
        lstSchemeData = []
        for oSchemeData in oPlayerData.SchemeData:
            iSchemeIdx = oSchemeData.SchemeIdx
            self.m_SchemeData[iSchemeIdx] = {}
            self.m_SchemeData[iSchemeIdx]["name"] = oSchemeData.Name
            self.m_SchemeData[iSchemeIdx]["equips"] = []
            for iSkillID in oSchemeData.Equips:
                self.m_SchemeData[iSchemeIdx]["equips"].append(iSkillID)

            lstSchemeData.append(self.m_SchemeData[iSchemeIdx]["equips"])

        LogFile("battlelogic", "setskillscheme|%d|%d|%s" % (
         self.m_Scene.m_ID,
         self.m_ID,
         lstSchemeData))

    def FormatSkillInfo(self, oPlayerData):
        for iSkillID in self.m_SkillInfo.keys():
            oSkillData = oPlayerData.SkillData.add()
            oSkillData.SkillID = iSkillID
            oSkillData.Level = self.GetSkillLevel(iSkillID)
            oSkillData.IsEquip = self.GetSkillEquip(iSkillID)

        oPlayerData.SchemeIdx = self.m_OriginalSchemeIdx
        for iSchemeIdx, dData in self.m_SchemeData.items():
            oSchemeData = oPlayerData.SchemeData.add()
            oSchemeData.SchemeIdx = iSchemeIdx
            oSchemeData.Name = dData["name"]
            for iSkillID in dData["equips"]:
                oSchemeData.Equips.append(iSkillID)

    def GetPositiveSkillData(self, oPlayerData):
        for iSkillID, iHitKey in self.m_PositiveSkillData.items():
            oSkillData = oPlayerData.PositiveSkillData.add()
            oSkillData.SkillID = iSkillID
            oSkillData.HitKey = iHitKey

    def SetBriefData(self, oBriefData):
        self.m_BriefData.CopyFrom(oBriefData)

    def GetBriefData(self):
        return self.m_BriefData

    def SetSunburnData(self, oSunburnData):
        self.m_SunburnData.CopyFrom(oSunburnData)

    def InitPropData(self):
        oHeroData = GetHeroData(self.GetTableID())
        for iPropType, iValue in oHeroData.m_PropDict.items():
            oPropData = CPropData()
            iMulValue = self.m_RuneManager.GetRuneEffectMulValue(RuneCmd_pb2.RUNE_PROPERTY_TYPE_PROPERTY, iPropType) / 10000 + 1
            iAddValue = self.m_RuneManager.GetRuneEffectValue(RuneCmd_pb2.RUNE_PROPERTY_TYPE_PROPERTY, iPropType)
            iMaxValue = oHeroData.m_PropMaxDict.get(iPropType, 0)
            oPropData.m_InitValue = iValue * iMulValue + iAddValue
            oPropData.m_MaxValue = iMaxValue
            self.m_PropContainer.InitProp(iPropType, oPropData)

    def DoAttachSkill(self, iSkillID, iLevel, iHitKey):
        oBattleSkill = CBattleSkill(iSkillID, iLevel)
        oSkillData = GetSkillData(iSkillID)
        dParamValue = oSkillData.GetLevelParamValue(self, oBattleSkill)
        for sParamName, iParamValue in dParamValue.items():
            self.SetSkillParamValue(sParamName, iParamValue)

        oAddStateArgs = CAddStateArgs(0)
        for iStateSID in oSkillData.m_StateLst:
            oAddStateArgs.m_StateSID = iStateSID
            oAddStateArgs.m_CasterID = self.m_ID
            oAddStateArgs.m_CasterSkillSID = iSkillID
            self.DoAddState(oAddStateArgs)

        for iActionID in oSkillData.m_ActionLst:
            self.m_HitActionManager.AddAction(iActionID, iSkillID, iHitKey)

    def AttachSkill(self, iSkillID, iLevel):
        if iSkillID in self.m_EquipingSkill:
            return
        self.DoEquipSkill(iSkillID, True)
        iNewLevel = iLevel + self.m_RuneManager.GetRuneEffectValue(RuneCmd_pb2.RUNE_PROPERTY_TYPE_SKILL_LEVEL, iSkillID)
        oSkillData = GetSkillData(iSkillID)
        iNewLevel = min(oSkillData.GetMaxLevel(), iNewLevel)
        self.SetSkillNewLevel(iSkillID, iNewLevel)
        iHitKey = self.CalcEquipSkillHitKey(iSkillID)
        if iHitKey:
            self.m_PositiveSkillData[iSkillID] = iHitKey
        self.DoAttachSkill(iSkillID, iNewLevel, iHitKey)

    def DetachSkill(self, iSkillID):
        if iSkillID not in self.m_EquipingSkill:
            return
        self.DoEquipSkill(iSkillID, False)
        oBattleSkill = CBattleSkill(iSkillID, 1)
        oSkillData = GetSkillData(iSkillID)
        dParamValue = oSkillData.GetLevelParamValue(self, oBattleSkill)
        for sParamName in dParamValue.keys():
            self.ClearSkillParamValue(sParamName)

        for iStateSID in oSkillData.m_StateLst:
            self.DoRemoveState(iStateSID)

        for iActionID in oSkillData.m_ActionLst:
            self.m_HitActionManager.DelAction(iActionID)

    @NoPrediction
    def GS2CPositiveSkillInfo(self):
        oMsg = BattleCmd_pb2.BattleUpdatePositiveSkillDataMsg()
        for iSkillID, iHitKey in self.m_PositiveSkillData.items():
            oSkillData = oMsg.PositiveSkillDatas.add()
            oSkillData.SkillID = iSkillID
            oSkillData.HitKey = iHitKey

        self.AddPersonalDelta(BattleCmd_pb2.BATTLE_UPDATE_POSITIVE_SKILL_DATA_MSG, oMsg)

    def CalcEquipSkillHitKey(self, iSkillID):
        oSkillData = GetSkillData(iSkillID)
        if oSkillData.m_SkillType in (SkillCmd_pb2.SKILL_TYPE_GENERAL, SkillCmd_pb2.SKILL_TYPE_ULTIMATE):
            return BattleCmd_pb2.HIT_KEY_KEY_ZD
        else:
            if oSkillData.m_SkillType == SkillCmd_pb2.SKILL_TYPE_PROPERTY:
                return BattleCmd_pb2.HIT_KEY_KEY_DJ
            return 0

    def InitSkillData(self):
        self.m_PositiveSkillData = {}
        self.m_SkillParamValue = {}
        if self.m_OriginalSchemeIdx not in self.m_SchemeData:
            return
        for iSkillID in self.m_SchemeData[self.m_OriginalSchemeIdx]["equips"]:
            iLevel = self.GetSkillLevel(iSkillID)
            self.AttachSkill(iSkillID, iLevel)

        self.GS2CPositiveSkillInfo()

    def InitAfterEnterScene(self):
        super().InitAfterEnterScene()
        if self.m_Scene.GetGameMode() not in (Common_pb2.GAME_MODE_NO_SKILL,):
            self.InitRuneData()
        self.InitPropData()
        self.m_HitActionManager.ReInitAction()
        if self.m_Scene.GetGameMode() not in (Common_pb2.GAME_MODE_NO_SKILL,):
            self.InitSkillData()
        self.m_Scene.InitPlayerStateByCourt(self)
        self.m_Scene.InitStateByCourtPlay(self)

    def GetModelID(self):
        oHeroData = GetHeroData(self.GetTableID())
        return oHeroData.m_ModelID

    def GetCorrectPos(self, oNewPos):
        oNewPos = GetDetourPassPos(self.m_Scene, self, oNewPos)
        iGameState = self.m_Scene.GetGameState()
        bNeedServeCorrect = False
        if iGameState == BattleCmd_pb2.GAME_STATE_SERVE:
            iServePlayerID = self.m_Scene.GetCurPointServePlayerID()
            oServePlayer = self.m_Scene.GetPlayer(iServePlayerID)
            if oServePlayer:
                if self.GetPosIndex() == oServePlayer.GetPosIndex():
                    if not self.m_Scene.TestIsStopServe():
                        bNeedServeCorrect = True
        oNewPos = CorrectPos(self.GetMemberType(), oNewPos, self.GetModelID(), bNeedServeCorrect, self.GetPosIndex(), self.m_Scene.GetCourtSID(), self.m_Scene.GetBattleMode())
        return oNewPos

    def RplNotify(self, sTextTableKey, dReplaceInfo=None):
        if dReplaceInfo is None:
            dReplaceInfo = {}
        self.Notify(rplstr.CRplStr(sTextTableKey, dReplaceInfo))

    def Notify(self, sMsg):
        self.m_Scene.NotifyToPid(self.m_ID, sMsg)

    def DoEquipSkill(self, iSkillID, bEquip):
        if bEquip:
            self.m_EquipingSkill.add(iSkillID)
        else:
            self.m_EquipingSkill.discard(iSkillID)

    def CouldExchangeSkillScheme(self):
        if self.m_Scene.GetGameState() != BattleCmd_pb2.GAME_STATE_QUARTER_REST:
            self.RplNotify("S_GAMEPLAYER_8")
            return False
        else:
            if self.m_HasAbandonedExchangeSkill:
                self.RplNotify("S_GAMEPLAYER_11")
                return False
            return True

    def GS2CExchangeSkillScheme(self):
        oMsg = BattleCmd_pb2.BattleExchangeSkillSchemeMsg()
        oMsg.SchemeIdx = self.m_CurSchemeIdx
        self.AddDelta(BattleCmd_pb2.BATTLE_EXCHANGE_SKILL_SCHEME_MSG, oMsg)

    def ExchangeSkillScheme(self, iSchemeIdx):
        if not self.CouldExchangeSkillScheme():
            return
        else:
            if iSchemeIdx == self.m_CurSchemeIdx:
                return
            if iSchemeIdx not in self.m_SchemeData:
                return
        LogFile("battlelogic", "changeskillscheme|%d|%d|%d" % (
         self.m_Scene.m_ID,
         self.m_ID,
         iSchemeIdx))
        self.m_CurSchemeIdx = iSchemeIdx
        self.GS2CExchangeSkillScheme()

    @ServerOnly
    def GS2CLeaveQuarterRest(self):
        oMsg = BattleCmd_pb2.BattleLeaveQuarterRestMsg()
        self.AddPersonalDelta(BattleCmd_pb2.BATTLE_LEAVE_QUARTER_REST_MSG, oMsg)

    def DoExchangeSkillScheme(self):
        if self.m_LastSchemeIdx == self.m_CurSchemeIdx:
            return
        self.m_PositiveSkillData = {}
        for iSkillID in self.m_SchemeData[self.m_LastSchemeIdx]["equips"]:
            self.DetachSkill(iSkillID)

        for iSkillID in self.m_SchemeData[self.m_CurSchemeIdx]["equips"]:
            iLevel = self.GetSkillLevel(iSkillID)
            self.AttachSkill(iSkillID, iLevel)

        self.m_LastSchemeIdx = self.m_CurSchemeIdx
        self.GS2CPositiveSkillInfo()

    def OnLeaveQuarterRest(self):
        self.GS2CLeaveQuarterRest()
        self.m_HasAbandonedExchangeSkill = False
        self.ClearPropertySkill()
        self.DoExchangeSkillScheme()
        super().OnLeaveQuarterRest()

    def GS2CAbandonExchangeSkill(self):
        oMsg = BattleCmd_pb2.BattleAbandonExchangeSkillMsg()
        self.AddPersonalDelta(BattleCmd_pb2.BATTLE_ABANDON_EXCHANGE_SKILL_MSG, oMsg)

    def AbandonExchangeSkill(self):
        if not self.CouldExchangeSkillScheme():
            return
        self.m_HasAbandonedExchangeSkill = True
        self.GS2CAbandonExchangeSkill()
        self.m_Scene.CheckReadyLeaveQuarterRest()

    def FormatOwnHalfwayEnterInfo(self, oOwnData):
        oOwnData.IsAbandonExchangeSkill = self.m_HasAbandonedExchangeSkill
        iCurEffectiveFrame = self.m_Scene.GetCurEffectiveFrame()
        allValidCDLst = self.m_ActionCDManager.GetAllValidCD(iCurEffectiveFrame)
        for tCDData in allValidCDLst:
            oCDData = oOwnData.CDDatas.add()
            oCDData.HitKey = tCDData[0]
            oCDData.EndFrame = tCDData[1]

        for iSkillID in self.m_EquipingSkill:
            oOwnData.EquipSkillLst.append(iSkillID)

        self.GetPositiveSkillData(oOwnData)
        oOwnData.CurSchemeIdx = self.m_CurSchemeIdx
        oOwnData.LastSchemeIdx = self.m_LastSchemeIdx

    def GS2CExchangePropertySkill(self, iSkillSID):
        oMsg = BattleCmd_pb2.BattleExchangePropertySkillMsg()
        oMsg.SkillID = iSkillSID
        self.AddPersonalDelta(BattleCmd_pb2.BATTLE_EXCHANGE_PROPERTY_SKILL_MSG, oMsg)

    def SetPropertySkill(self, iSkillID):
        if iSkillID:
            self.m_HistoryPropertySkills.add(iSkillID)
        self.m_PropertySkillID = iSkillID
        self.GS2CExchangePropertySkill(iSkillID)

    def AddPropertySkill(self, iSkillSID):
        if self.m_PropertySkillID:
            self.DetachSkill(self.m_PropertySkillID)
        self.AttachSkill(iSkillSID, 1)
        self.SetPropertySkill(iSkillSID)

    def ClearPropertySkill(self):
        if self.m_PropertySkillID == 0:
            return
        self.DetachSkill(self.m_PropertySkillID)
        self.SetPropertySkill(0)

    def OnSetUpAction(self, oHitAction):
        if self.m_PropertySkillID:
            if oHitAction:
                if oHitAction.GetSkillSID() == self.m_PropertySkillID:
                    self.ClearPropertySkill()
        super().OnSetUpAction(oHitAction)

    def FireEmoji(self, iEmojiID):
        if iEmojiID not in BATTLEEMOJI_LIST:
            return
        iCurFrame = self.m_Scene.GetCurFrame()
        if self.m_LastFireEmojiFrame != 0:
            if iCurFrame - self.m_LastFireEmojiFrame < FIRE_EMOJI_INTERVAL_FRAME:
                return
        self.m_LastFireEmojiFrame = iCurFrame
        oMsg = BattleCmd_pb2.BattleFireEmojiMsg()
        oMsg.PlayerID = self.m_ID
        oMsg.EmojiID = iEmojiID
        self.AddDelta(BattleCmd_pb2.BATTLE_FIRE_EMOJI, oMsg)

    def FormatPlayerData(self, oPlayerData):
        oPlayerData.BriefData.CopyFrom(self.m_BriefData)
        oPlayerData.PlayerSunburnData.CopyFrom(self.m_SunburnData)
        oPlayerData.MemberType = self.m_MemberType
        oPlayerData.PosIndex = self.m_PosIndex
        oPlayerData.HeroID = self.m_TableID
        oPlayerData.ObjectType = self.m_SceneObjectType
        self.FormatSkillInfo(oPlayerData)
        self.GetPositiveSkillData(oPlayerData)
        for iID in self.GetApparelLst():
            oPlayerData.Apparels.append(iID)

        oPlayerData.PlayerStatus = self.GetPlayerStatus()
        oPlayerData.InitPosIndex = self.m_InitPosIndex
        oPlayerData.NetIndex = self.m_NetIndex
        oPlayerData.EquipVoiceID = self.GetEquipVoice()
        oPlayerData.IsGameAI = self.m_IsGameAI

    def HasHitKey(self, iHitKey):
        return self.m_HitActionManager.HasHitKey(iHitKey)

    def CouldUseActionByHitActionType(self, iHitActionType):
        dActionDatas = self.m_HitActionManager.GetActionsByHitActionType(iHitActionType)
        if not len(dActionDatas):
            return False
        else:
            self.SetPreJudgeFrame(HITACTION_PREJUDGE_FRAME)
            oBadminton = self.m_Scene.GetFirstBadminton()
            oBadmintonPos = oBadminton.GetPreJudgePos(self.m_PreJudgeFrame)
            fHeight = oBadmintonPos.m_Y
            fDistance = self.GetPos().HorizontalDistance(oBadmintonPos)
            fAngle = oBadminton.GetObjectToMeAngle(self)
            iRangeDir = GetRangeDir(fAngle)
            bRes = False
            for iSID, oHitAction in dActionDatas.items():
                oActionData = GetHitActionData(iSID)
                if oActionData.m_HitAngle:
                    if iRangeDir not in oActionData.m_HitAngle:
                        continue
                    tDistanceRange = oActionData.GetDistanceRange(self, oHitAction)
                    tHeightRange = oActionData.GetHeightRange(self, oHitAction)
                    if tDistanceRange:
                        if not tDistanceRange[0] > fDistance:
                            if tDistanceRange[1] < fDistance:
                                continue
                if tHeightRange:
                    if not tHeightRange[0] > fHeight:
                        if tHeightRange[1] < fHeight:
                            continue
                        if not oActionData.CheckPreCondition(self, oHitAction):
                            pass
                        else:
                            bRes = True
                            break

            self.SetPreJudgeFrame(0)
            return bRes

    def FormatPlayerScoreData(self, oData):
        oData.PHitTimes = self.GetRecord(BattleCmd_pb2.BATTLE_RECORD_P_HIT_TIMES)
        oData.DHitTimes = self.GetRecord(BattleCmd_pb2.BATTLE_RECORD_D_HIT_TIMES)
        oData.GYHitTimes = self.GetRecord(BattleCmd_pb2.BATTLE_RECORD_GY_HIT_TIMES)
        oData.JumpTimes = self.GetRecord(BattleCmd_pb2.BATTLE_RECORD_JUMP_TIMES)
        oData.StarTimes = self.GetRecord(BattleCmd_pb2.BATTLE_RECORD_STAR_TIMES)
        oData.ActiveSkillTimes = self.GetRecord(BattleCmd_pb2.BATTLE_RECORD_ACTIVE_SKILL_TIMES)
        oData.HighContinuousTimes = self.GetRecord(BattleCmd_pb2.BATTLE_RECORD_HIGH_CONTINUOUS)
        oData.MiddleContinuousTimes = self.GetRecord(BattleCmd_pb2.BATTLE_RECORD_MIDDLE_CONTINUOUS)
        oData.LowContinuousTimes = self.GetRecord(BattleCmd_pb2.BATTLE_RECORD_LOW_CONTINUOUS)
        oData.InsideHitTimes = self.GetRecord(BattleCmd_pb2.BATTLE_RECORD_INSIDE_HIT_TIMES)
        oData.NormalHitTimes = self.GetRecord(BattleCmd_pb2.BATTLE_RECORD_NORMAL_HIT_TIMES)
        oData.OutsideHitTimes = self.GetRecord(BattleCmd_pb2.BATTLE_RECORD_OUTSIDE_HIT_TIMES)
        oData.HitTimes = self.GetRecord(BattleCmd_pb2.BATTLE_RECORD_HIT_TIMES)
        oData.SkillValue = self.GetRecord(BattleCmd_pb2.BATTLE_RECORD_SKILL_VALUE)
        oData.FrontScore = self.GetRecord(BattleCmd_pb2.BATTLE_RECORD_FRONT_SCORE)
        oData.ServeWinTimes = self.GetRecord(BattleCmd_pb2.BATTLE_RECORD_SERVE_WIN)
        oData.CatchServeWinTimes = self.GetRecord(BattleCmd_pb2.BATTLE_RECORD_CATCH_SERVE_WIN)
        oData.HitNetTimes = self.GetRecord(BattleCmd_pb2.BATTLE_RECORD_HIT_NET_TIMES)
        oData.OutOfAreaTimes = self.GetRecord(BattleCmd_pb2.BATTLE_RECORD_OUT_OF_AREA_TIMES)
        oData.AVGContinuousTimes = int(self.m_CounterManager.GetSelfAverageCounter(BattleCmd_pb2.COUNTER_TYPE_CONTINUOUS))
        oData.MVPScore = int(self.GetCurMVPScore() * 10)
        oData.LoseServeTimes = self.GetRecord(BattleCmd_pb2.BATTLE_RECORD_LOSE_SERVE_TIMES)
        oData.LoseCatchServeTimes = self.GetRecord(BattleCmd_pb2.BATTLE_RECORD_LOSE_CATCH_SERVE_TIMES)
        oData.PropertyBoxTriggerTimes = self.GetRecord(BattleCmd_pb2.BATTLE_RECORD_PROPERTYBOX_TRIGGER)
        oData.ClearDebuffStateTimes = self.GetRecord(BattleCmd_pb2.BATTLE_RECORD_CLEAR_DEBUFF_STATE_TIMES)
        oData.MaxContinuousHitTimes = self.GetRecord(BattleCmd_pb2.BATTLE_RECORD_MAX_CONTINUOUS_HIT_TIMES)
        oData.CatchStarTimes = self.GetRecord(BattleCmd_pb2.BATTLE_RECORD_CATCH_STAR_TIMES)
        oData.CatchJumpTimes = self.GetRecord(BattleCmd_pb2.BATTLE_RECORD_CATCH_JUMP_TIMES)
        oData.SkillScore = self.GetRecord(BattleCmd_pb2.BATTLE_RECORD_SKILL_SCORE)
        oData.MiddleHitTimes = self.GetRecord(BattleCmd_pb2.BATTLE_RECORD_HIT_MIDDLE)
        oData.JumpScore = self.GetRecord(BattleCmd_pb2.BATTLE_RECORD_JUMP_SCORE)
        oData.StarScore = self.GetRecord(BattleCmd_pb2.BATTLE_RECORD_STAR_SCORE)
        dQuarterScore = self.GetRecord(BattleCmd_pb2.BATTLE_RECORD_QUARTER_SCORE)
        if dQuarterScore:
            for iQuarterIdx, iScore in dQuarterScore.items():
                oQuarterData = oData.PlayerQuarterScore.add()
                oQuarterData.QuarterIndex = iQuarterIdx
                oQuarterData.Score = iScore

    def FormatPlayerBattleData(self, oData):
        oData.ID = self.m_ID
        oData.Name = self.m_Name
        oData.MemberType = self.m_MemberType
        oData.PosIndex = self.m_PosIndex
        oData.QualifyElo = self.m_BriefData.QualifyElo
        oData.QuitBattleType = Common_pb2.QUIT_BATTLE_TYPE_NORMAL
        if self.m_AbnormalStatus & PLAYER_ABNORMAL_STATUS_QIUT:
            oData.QuitBattleType = Common_pb2.QUIT_BATTLE_TYPE_ESCAPE
        else:
            if self.m_AbnormalStatus & PLAYER_ABNORMAL_STATUS_HANGUP:
                oData.QuitBattleType = Common_pb2.QUIT_BATTLE_TYPE_HANGUP
        oData.MatchElo = self.m_BriefData.MatchElo
        oData.WithFriend = self.m_WithFriend
        self.FormatPlayerScoreData(oData.PlayerScoreData)

    def FormatPlayerSkillData(self, oData):
        lstUsedSkill = set()
        for iQuarterIdx, iSchemeIdx in self.m_SkillSchemeHis.items():
            oQuarterEquipSkill = oData.QuarterEquipSkill.add()
            oQuarterEquipSkill.QuarterIndex = iQuarterIdx
            if iSchemeIdx not in self.m_SchemeData:
                pass
            else:
                lstSkill = self.GetSchemeNormalSkill(iSchemeIdx)
                for iSkillID in lstSkill:
                    oQuarterEquipSkill.EquipSkill.append(iSkillID)
                    lstUsedSkill.add(iSkillID)

        for iSkillID in lstUsedSkill:
            oSkillData = oData.SkillData.add()
            oSkillData.SkillID = iSkillID
            oSkillData.Level = self.GetSkillLevel(iSkillID)
            oSkillData.IsEquip = self.GetSkillEquip(iSkillID)

    def AddSkillWhilePlaying(self, iSkillID, iLevel):
        self.AttachSkill(iSkillID, iLevel)
        self.GS2CPositiveSkillInfo()

    @ServerOnly
    def LogActive(self, fMoveX=0, fMoveZ=0):
        if not self.m_Scene.m_AbnormalStatusCheck:
            return
        self.m_LastActiveFrameNum = self.m_Scene.GetCurEffectiveFrame()
        self.CancelHangUp(fMoveX, fMoveZ)
        self.OnPing()

    def SetPersonalDetail(self, oPlayerPreCreateGameData):
        self.m_PersonalDetail = {'QualifyMatchingScore':oPlayerPreCreateGameData.QualifyMatchingScore, 
         'MatchMatchingScore':oPlayerPreCreateGameData.MatchMatchingScore, 
         'ServerNum':oPlayerPreCreateGameData.ServerNum, 
         'CareerWinRate':oPlayerPreCreateGameData.CareerWinRate}

    def OnQuit(self):
        if self.m_AbnormalStatus & PLAYER_ABNORMAL_STATUS_QIUT:
            return
        self.m_AbnormalStatus |= PLAYER_ABNORMAL_STATUS_QIUT
        Log("%d on quit attach bt" % (self.m_ID,))
        self.AttachBT(PLAYER_ABNORMAL_STATUS_BTCONFID)
        self.m_Scene.NotifyToAll(rplstr.CRplStr("S_GAMEPLAYER_3", {"$$0": (self.Name())}))
        self.m_Scene.CheckGameAdvanceEnd()
        self.OnPlayerStatusDelta()

    def OnDisconnect(self):
        if self.m_AbnormalStatus & PLAYER_ABNORMAL_STATUS_DISCONNECT:
            return
        self.m_AbnormalStatus |= PLAYER_ABNORMAL_STATUS_DISCONNECT
        self.SetLoading(False)
        Log("%d on disconnect attach bt" % (self.m_ID,))
        self.AttachBT(PLAYER_ABNORMAL_STATUS_BTCONFID)
        self.m_Scene.NotifyToAll(rplstr.CRplStr("S_GAMEPLAYER_4", {"$$0": (self.Name())}))
        self.OnPlayerStatusDelta()

    def GetCurData(self, oCurData):
        oCurData.ID = self.m_ID
        oPos = self.GetPos()
        oCurData.Pos = oPos.PackVec3()
        dAllStateData = self.GetAllStateData()
        for iStateSID, tStateData in dAllStateData.items():
            oStateData = GetStateData(iStateSID)
            if not oStateData.m_Show:
                continue
            oStateMsgData = oCurData.StateLst.add()
            oStateMsgData.StateSID = iStateSID
            oStateMsgData.StartFrame, oStateMsgData.EndFrame, oStateMsgData.CasterID = tStateData

        oCurData.PlayerStatus = self.GetPlayerStatus()

    def OnPing(self):
        self.m_LastPingFrame = self.m_Scene.GetCurFrame()

    def OnOffline(self):
        if self.m_AbnormalStatus & PLAYER_ABNORMAL_STATUS_OFFLINE:
            return
        self.m_AbnormalStatus |= PLAYER_ABNORMAL_STATUS_OFFLINE
        self.m_Scene.NotifyToAll(rplstr.CRplStr("S_GAMEPLAYER_5", {"$$0": (self.Name())}))
        self.EnterHangUp()

    def OnLoadingDone(self):
        self.SetLoading(False)
        self.LogActive()
        self.OnPing()
        if self.m_Scene.GetGameState() != BattleCmd_pb2.GAME_STATE_INIT:
            self.OnConnected()
            self.OnPlayerStatusDelta()

    def DecreaseActionCD(self, iEffectFrame):
        oScene = self.GetScene()
        iCurEffectiveFrame = oScene.GetCurEffectiveFrame()
        decreaseActionCDLst = []
        for iSkillID, iHitKey in self.m_PositiveSkillData.items():
            oSkillData = GetSkillData(iSkillID)
            if oSkillData.m_SkillType not in (SkillCmd_pb2.SKILL_TYPE_ULTIMATE, SkillCmd_pb2.SKILL_TYPE_GENERAL):
                pass
            else:
                iEndFrame = self.m_ActionCDManager.GetSrcCD(iHitKey, iCurEffectiveFrame)
                if not iEndFrame:
                    pass
                else:
                    iEndFrame = iEndFrame - iEffectFrame
                    self.m_ActionCDManager.ReplaceCD(iHitKey, iEndFrame)
                    decreaseActionCDLst.append((iHitKey, iEndFrame))

        self.OnDecreaseHitKeyCDDelta(decreaseActionCDLst)

    def OnDecreaseHitKeyCDDelta(self, lstHitKey):
        oMsg = BattleCmd_pb2.BattleDecreaseHitKeyCDMsg()
        for iSrcID, iEndFrame in lstHitKey:
            oData = oMsg.CDData.add()
            oData.HitKey = iSrcID
            oData.EndFrame = iEndFrame

        self.AddPersonalDelta(BattleCmd_pb2.BATTLE_DECREASE_HIT_KEY_CD_MSG, oMsg)

    def InitRuneData(self):
        self.m_RuneManager.InitRuneData()

    def CheckForbitHitKey(self, iHitKey):
        if iHitKey == BattleCmd_pb2.HIT_KEY_KEY_ZD:
            if self.m_BehaviorManager.HasBehavior(BattleCmd_pb2.BEHAVIOR_TYPE_FORBIT_XZ_SKILL):
                for iSkillID in self.m_PositiveSkillData.keys():
                    oSkillData = GetSkillData(iSkillID)
                    if oSkillData.m_SkillType == SkillCmd_pb2.SKILL_TYPE_GENERAL:
                        return True

            elif self.m_BehaviorManager.HasBehavior(BattleCmd_pb2.BEHAVIOR_TYPE_FORBIT_DZ_SKILL):
                for iSkillID in self.m_PositiveSkillData.keys():
                    oSkillData = GetSkillData(iSkillID)
                    if oSkillData.m_SkillType == SkillCmd_pb2.SKILL_TYPE_ULTIMATE:
                        return True

        return super().CheckForbitHitKey(iHitKey)

    def AddUsedSkillSchemeHis(self, iQuarterIdx):
        self.m_SkillSchemeHis[iQuarterIdx] = self.m_CurSchemeIdx

    def GetCurMVPScore(self):
        if self.m_AbnormalStatus:
            return 0
        else:
            return super().GetCurMVPScore()

    def GetQuarterMVPScore(self):
        if self.m_AbnormalStatus:
            return 0
        else:
            return super().GetQuarterMVPScore()

    def FormatPlayerBriefData(self, oData):
        oData.BriefData.CopyFrom(self.m_BriefData)

    def SetGameAI2BTConfID(self, iBTConfID):
        if not iBTConfID:
            iBTConfID = PLAYER_ABNORMAL_STATUS_BTCONFID
        self.m_GameAI2BTConfID = iBTConfID
        if not self.m_GameAI2BotFlag:
            return
        self.DetachBT()
        self.AttachBT(iBTConfID)

    def OnAIServerBlocked(self):
        if not self.m_IsGameAI:
            return
        self.m_GameAI2BotFlag = True
        self.SetGameAI2BTConfID(self.m_GameAI2BTConfID)

    def OnEnterQuarterRest(self):
        if self.m_IsGameAI:
            self.AIPlayerExchangeSkillScheme()
        super().OnEnterQuarterRest()

    def AIPlayerExchangeSkillScheme(self):
        iIdx = self.RandomBetween(0, len(self.m_SchemeData))
        self.ExchangeSkillScheme(iIdx)

    def GetSchemeNormalSkill(self, iSchemeIdx):
        if iSchemeIdx not in self.m_SchemeData:
            return []
        else:
            lstSkill = self.m_SchemeData[iSchemeIdx]["equips"]
            if self.m_Scene.GetGameMode() != Common_pb2.GAME_MODE_BOMB:
                return lstSkill
            return ConvertBombSkillLstToNormal(lstSkill)

    def CheckPositiveSkillSchoolType(self, iSkillSchoolType):
        for iSkillID, iHitKey in self.m_PositiveSkillData.items():
            if iHitKey == BattleCmd_pb2.HIT_KEY_KEY_ZD:
                oSkillData = GetSkillData(iSkillID)
                if oSkillData.m_SkillSchoolType == iSkillSchoolType:
                    return True

        return False

    def CheckPositiveSkillType(self, iSkillType):
        for iSkillID, iHitKey in self.m_PositiveSkillData.items():
            if iHitKey == BattleCmd_pb2.HIT_KEY_KEY_ZD:
                oSkillData = GetSkillData(iSkillID)
                if oSkillData.m_SkillType == iSkillType:
                    return True

        return False
