# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\scene.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 47757 bytes
from .badminton.badminton import CBadminton
from .badminton.fakebadminton import CFakeBadminton
from base.protobufdata import BattleCmd_pb2, PlayerFrameData_pb2, BattleCtrl_pb2
from .battlebase.drandom import CGameRandom
from .battlebase.dmath import ClampFloat
from battlelogic.common.defines import IsServer
from battlelogic import bot
from base.data import A5PythonError
from base.data import GetCourtData
from base.protobufdata import Common_pb2, DCmd_pb2
from .battlebase.dvec3 import CDVec3
from .common.defines import INT_MAX, Sec2Frame
from .gameplayer import CGamePlayer
from battlelogic.common.defines import MAX_USER_ID
from .monster import CMonster
from battlelogic.common.defines import IsPlayerObjectID
from battlelogic.common.debug import LogWarning, Profiler, LogError, Log
from battlelogic.common.decorator import NoPrediction, ServerOnly, ClientOnly
from C_net import *
from battlelogic.config.gamestatetimeconf import GetGameStateLastTime
from battlelogic.common.debug import DevelopOnly
from battlelogic.propertybox import CPropertyBox
from battlelogic.plugins.state import CAddStateArgs
from battlelogic.common.defines import FRAME, COLLISION_GROUP_SERVE, COLLISION_GROUP_STATIC, COLLISION_GROUP_CHAR
from base.data import GetHitActionData, GetGameRuleData
from .trigger import CTrigger
from battlelogic.common.defines import g_RandomHitKeyDir
from battlelogic.sceneplugins.gameai.gameaiservice import CGameAIService
from battlelogic.sceneplugins.gameai.gameairerun import CGameAIReRun
from .idolum import CIdolum
from C_debug import PythonError
import phys, random, time, math
AI_UPDATE_INTERVAL = 8

class CScene(object):

    def __init__(self, iID, iRandomSeed, iGameMode, iBattleMode, iOwnerID, iSceneIndex):
        self.m_ID = iID
        self.m_GameMode = iGameMode
        self.m_BattleMode = iBattleMode
        self.m_OwnerID = iOwnerID
        self.m_SceneIndex = iSceneIndex
        self.m_FrameNum = 1
        self.m_EffectiveFrameNum = 1
        self.m_GameState = BattleCmd_pb2.GAME_STATE_INIT
        self.m_AllObjects = {}
        self.m_AllObjectsByType = {}
        self.m_NetIndexDict = {}
        self.m_CurNetIndex = 1
        self.m_PlayerByMemberType = {}
        self.m_GameStateEndFrame = 0
        self.m_ServePlayerID = 0
        self.m_AttackerID = 0
        self.m_CourtSID = 1001
        self.m_Random = CGameRandom()
        self.m_RandomSeed = iRandomSeed
        self.m_Random.SetRandomSeed(iRandomSeed)
        self.m_UpdateFrameMsg = {}
        self.m_UpdatePersonnalFrameMsg = {}
        self.m_UpdateSpectatorsFrameMsg = {}
        if not IsServer():
            self.m_ServerFrameNum = 0
        self.m_BOTManager = bot.NewGameSpace()
        self.m_CurPointServePlayerID = 0
        self.m_NpcID = MAX_USER_ID + 1
        self.m_GameEndFunc = None
        self.m_BroadcastFunc = None
        self.m_SendToPid = None
        self.m_SendToSpectators = None
        self.m_DelSet = set()
        self.m_TestShareContinuous = True
        self.m_TestShowRandom = False
        self.m_BulletTimeScale = 100
        self.m_BulletTimeRec = []
        self.m_LastGameState = BattleCmd_pb2.GAME_STATE_NONE
        self.m_FinalWinScore = self.GetNormalMaxScore()
        self.m_IsMatchPoint = False
        self.m_GameEndRuleType = BattleCmd_pb2.GAME_END_RULE_TYPE_NONE
        self.m_ServeType = BattleCmd_pb2.SERVE_TYPE_NONE
        self.m_BOTContextIDList = []
        self.m_BOTLastUpdate = 0
        self.m_FirstBadminton = None
        self.m_EffectiveFlag = False
        self.m_AbnormalStatusCheck = False
        self.m_OnPlayerHangUpFunc = None
        self.m_NotifyFunc = None
        self.m_TestDropPos = None
        self.m_GameAI = None
        self.m_UUID = ""
        self.m_HasGameAI = False
        self.m_BeginTime = int(time.time())
        self.m_GameAICnt = 0
        self.m_GameAILastUpdate = 0
        self.m_GameAIDifficulty = 0
        self.m_GameAIDifficultyFluctuation = 0
        self.m_BulletTimeScaleCache = []
        self.m_OriginalGameMode = Common_pb2.GAME_MODE_NONE
        self.InitPhys()

    def InitPhys(self):
        self.m_Phys = phys.Scene()
        oCourtData = GetCourtData(self.m_CourtSID)
        dMoveAble = oCourtData.m_MoveableCornerPosDict[2]["MaxPos"]
        iMoveAbleX = dMoveAble["X"]
        iMoveAbleZ = dMoveAble["Z"]
        iNetHeight = oCourtData.m_NetHeight
        iServeFrontZ = oCourtData.m_FrontServeLine
        if self.m_BattleMode == Common_pb2.BATTLE_MODE_SINGLE:
            iServeX = oCourtData.m_SingleQuarterSizeDict["iLength"]
            iServeBackZ = oCourtData.m_SingleQuarterSizeDict["iWidth"]
        else:
            iServeX = oCourtData.m_DualQuarterSizeDict["iLength"]
            iServeBackZ = oCourtData.m_DualBackServeLine
        self.m_Phys.InitCourt(iMoveAbleX, iMoveAbleZ, iServeX, iServeFrontZ, iServeBackZ, iNetHeight)
        self.m_Phys.SetStopCallback(self.OnStopCallback)
        self.m_Phys.SetTriggerCallback(self.OnTriggerCallback)
        self.m_Phys.SetCurveEndCallback(self.OnCurveEndCallback)
        self.m_Phys.SetCurvePassHighestCallback(self.OnCurvePassHighestCallback)
        self.m_Phys.SetHitNetCallback(self.OnHitNetCallback)
        self.m_Phys.SetHitObjectCallback(self.OnHitObjectCallback)

    def OnStopCallback(self, iObjectID):
        obj = self.GetObject(iObjectID)
        if not obj:
            return
        obj.SetMoveType(BattleCmd_pb2.MOVE_TYPE_STAND)
        obj.InitFacing()

    def OnTriggerCallback(self, iOwnerID, iTargetID, iCheckRes):
        oOwner = self.GetObject(iOwnerID)
        if not oOwner:
            return
        oOwner.TouchTrigger(iTargetID, iCheckRes)

    @NoPrediction
    def OnCurveEndCallback(self, iObjectID, x, y, z):
        obj = self.GetObject(iObjectID)
        if not obj:
            return
        obj.m_Pos = CDVec3(x, y, z)
        obj.OnSimulateFinished()

    @NoPrediction
    def OnCurvePassHighestCallback(self, iObjectID):
        obj = self.GetObject(iObjectID)
        if not obj:
            return
        obj.PassHighestPos()

    def OnHitNetCallback(self, iObjectID, x, y, z):
        obj = self.GetObject(iObjectID)
        if not obj:
            return
        obj.m_CurveData.m_Hited = True
        oPos = CDVec3(x, y, z)
        obj.SetHitObjectType(BattleCmd_pb2.HIT_OBJ_TYPE_HIT_NET)
        self.OnBattleEvent(BattleCmd_pb2.BATTLE_EVENT_TYPE_HIT_NET, {})
        obj.OnNetShot(oPos)

    @NoPrediction
    def OnHitObjectCallback(self, iObjectID, iHitObjectID, x, y, z):
        return
        oHitObject = self.GetObject(iHitObjectID)
        if not oHitObject:
            return
        if oHitObject.GetSceneObjectType() != BattleCmd_pb2.SCENE_OBJECT_TYPE_PLAYER:
            return
        if oHitObject.IsDoingAction():
            return
        if oHitObject.m_IgnoreHitObjectSet:
            return
        obj.m_CurveData.m_Hited = True
        oPos = CDVec3(x, y, z)
        obj.SetIsHitObject(True)
        obj.SetHitObjectType(BattleCmd_pb2.HIT_OBJ_TYPE_HIT_ENTITY)
        obj.SetHitObjectPos(oPos)
        obj.m_HitObjectID = iHitObjectID
        obj.OnBattleEvent(BattleCmd_pb2.BATTLE_EVENT_TYPE_BODY_SHOT, {})
        oHitObject.OnBattleEvent(BattleCmd_pb2.BATTLE_EVENT_TYPE_BODY_SHOT, {})
        bIsForbidBodyShotVoice = obj.GetIsForbidBodyShotVoice()
        obj.OnBodyShot(iHitObjectID, oPos, bIsForbidBodyShotVoice)

    def GetNpcID(self):
        self.m_NpcID = self.m_NpcID + 1
        return self.m_NpcID

    def Init(self):
        self.SetGameState(BattleCmd_pb2.GAME_STATE_INIT)
        self.CreateBadminton()

    def StepFrame(self):
        self.UpdateEffectiveFrame()
        self.RobotUpdate()
        self.ExecuteLoop()
        self.CheckDel()
        self.Simulate()

    @Profiler
    def Simulate(self):
        self.m_Phys.Simulate(0.04)
        for iObjectID, x, y, z in self.m_Phys.GetMovedControllers():
            oObj = self.GetObject(iObjectID)
            if not oObj:
                continue
            oObj.m_Pos = CDVec3(x, y, z)

    def CalcRobotUpdateInterval(self):
        oBadminton = self.GetFirstBadminton()
        if oBadminton.m_CurveData:
            if math.isnan(oBadminton.m_CurveData.m_FullTime) or math.isnan(oBadminton.m_CurveData.m_PassTime):
                LogError("球路数据有误", oBadminton.m_HitKey, oBadminton.m_CurShape, oBadminton.m_HitBadmintonArgs, oBadminton.m_LastCurveID)
        iUpdateInterval = 1
        if oBadminton.GetSimulateFinished() or not oBadminton.m_CurveData:
            iUpdateInterval = 12
        else:
            if oBadminton.m_CurveData.m_PassTime > 0:
                iUpdateInterval = ClampFloat(int(Sec2Frame(oBadminton.m_CurveData.m_FullTime - oBadminton.m_CurveData.m_PassTime) / 2), 4, 15)
        return iUpdateInterval

    @Profiler
    def OnBotUpdate(self):
        self.m_BOTManager.SetFrameSinceStartup(self.m_FrameNum)
        iUpdateInterval = self.CalcRobotUpdateInterval()
        iBOTOneUpdateNum = len(self.m_BOTContextIDList) / iUpdateInterval
        iUpdate = self.m_BOTLastUpdate + iBOTOneUpdateNum
        iNum = int(iUpdate)
        if iNum:
            self.m_BOTManager.Update(self.m_BOTContextIDList[:iNum])
            self.m_BOTContextIDList = self.m_BOTContextIDList[iNum:] + self.m_BOTContextIDList[:iNum]
        self.m_BOTLastUpdate = iUpdate % 1

    def PreGameAIUpdate(self):
        iUpdateInterval = self.CalcRobotUpdateInterval()
        iUpdateInterval = ClampFloat(iUpdateInterval, 1, 8)
        fUpdateNum = self.m_GameAICnt / iUpdateInterval
        self.m_GameAILastUpdate += fUpdateNum
        if self.m_GameAILastUpdate >= self.m_GameAICnt:
            self.m_GameAILastUpdate -= self.m_GameAICnt
            return True
        else:
            return False

    @ServerOnly
    def OnGameAIUpdate(self):
        if not self.m_GameAI:
            return
        self.m_GameAI.TryReq()

    def RobotUpdate(self):
        if self.m_GameState != BattleCmd_pb2.GAME_STATE_PLAYING:
            if self.m_GameState != BattleCmd_pb2.GAME_STATE_SERVE:
                return
        if not self.m_BOTContextIDList:
            return
        self.OnBotUpdate()
        self.OnGameAIUpdate()

    def AddAIContextID(self, iContextID):
        self.m_BOTContextIDList.append(iContextID)

    def DelAIContextID(self, iContextID):
        if iContextID in self.m_BOTContextIDList:
            self.m_BOTContextIDList.remove(iContextID)

    def UpdateEffectiveFrame(self):
        if self.m_EffectiveFlag:
            self.SetCurEffectiveFrame(self.m_EffectiveFrameNum + 1)
            for oObject in list(self.m_AllObjects.values()):
                oObject.AddEffectiveFrameNum(1)

    @Profiler
    def ExecuteLoop(self):
        for oObject in list(self.m_AllObjects.values()):
            oObject.ExecuteLoop()

    def CheckDel(self):
        for tData in self.m_DelSet:
            self.DelObject(tData[0], tData[1])

        self.m_DelSet.clear()

    def ID(self):
        return self.m_ID

    def GetCurFrame(self):
        return self.m_FrameNum

    def SetCurFrame(self, iFrameNum):
        self.m_FrameNum = iFrameNum

    def GetCurEffectiveFrame(self):
        return self.m_EffectiveFrameNum

    def SetCurEffectiveFrame(self, iFrameNum):
        self.m_EffectiveFrameNum = iFrameNum

    def OnGameStateChange(self):
        if self.m_GameState == BattleCmd_pb2.GAME_STATE_PLAYING:
            self.m_EffectiveFlag = True
        else:
            self.m_EffectiveFlag = False

    def SetGameState(self, iGameState):
        self.m_GameState = iGameState
        self.m_GameStateEndFrame = self.GetCurFrame() + GetGameStateLastTime(iGameState)
        self.OnGameStateChange()
        self.OnGameStateDelta()

    def GetGameState(self):
        return self.m_GameState

    def CalcCatchServePlayerID(self):
        iServePlayerID = self.m_CurPointServePlayerID
        oServePlayer = self.GetPlayer(iServePlayerID)
        allEnemyLst = self.GetAllEnemy(oServePlayer.GetMemberType())
        iCatchPlayerID = 0
        bFoundSamePosIndex = False
        for oEnemy in allEnemyLst:
            iCatchPlayerID = oEnemy.ID()
            if oEnemy.GetPosIndex() == oServePlayer.GetPosIndex():
                bFoundSamePosIndex = True
                break

        if not bFoundSamePosIndex:
            oCatchServePlayer = self.GetPlayer(iCatchPlayerID)
            oCatchServePlayer.SetPosIndex(oServePlayer.GetPosIndex())
        return iCatchPlayerID

    def SwitchServePlayer(self, pid):
        self.SetCurPointServePlayerID(pid)
        iCatchPlayerID = self.CalcCatchServePlayerID()
        self.SetServePlayerID(pid, iCatchPlayerID)

    def SetServePlayerID(self, pid, iCatchPlayerID):
        if self.m_ServePlayerID == pid:
            return
        iLastPlayerID = self.m_ServePlayerID
        self.m_ServePlayerID = pid
        self.OnServePlayerDelta(iLastPlayerID, iCatchPlayerID)

    def GetServePlayerID(self):
        return self.m_ServePlayerID

    def GetCurPointServePlayerID(self):
        return self.m_CurPointServePlayerID

    def SetCurPointServePlayerID(self, pid):
        self.m_CurPointServePlayerID = pid
        self.OnCurPointServePlayerDelta()

    def GetAttackerID(self):
        return self.m_AttackerID

    def SetAttackerID(self, iAttackerID):
        self.m_AttackerID = iAttackerID

    def GetCourtSID(self):
        return self.m_CourtSID

    def GetOwnerID(self):
        return self.m_OwnerID

    def GetAIManager(self):
        return self.m_BOTManager

    def GetBattleMode(self):
        return self.m_BattleMode

    def GetGameMode(self):
        return self.m_GameMode

    def GetSceneType(self):
        return BattleCmd_pb2.SCENE_TYPE_NONE

    def SetTestIsStopServe(self):
        return

    def TestIsStopServe(self):
        return False

    def SetTestShowRandom(self):
        if self.m_TestShowRandom:
            self.m_TestShowRandom = False
        else:
            self.m_TestShowRandom = True

    def GetTestShowRandom(self):
        return self.m_TestShowRandom

    def SetTestShareContinuous(self):
        if self.m_TestShareContinuous:
            self.m_TestShareContinuous = False
        else:
            self.m_TestShareContinuous = True

    def InitEncounterBossID(self, iEncounterBossID):
        return

    def AddFrameMsg(self, pid, iMsg, oMsg):
        self.m_BroadcastFunc(pid, iMsg, oMsg)

    def AddPersonalFrameMsg(self, pid, iMsg, oMsg):
        self.m_SendToPid(pid, iMsg, oMsg)

    def AddPersonalSpectatorsFrameMsg(self, pid, iMsg, oMsg):
        self.m_SendToPid(pid, iMsg, oMsg)
        self.m_SendToSpectators(pid, iMsg, oMsg)

    def UpdateFrameMsg(self, pid, iMsg, oMsg):
        self.m_UpdateFrameMsg[(pid, iMsg)] = oMsg

    def UpdatePersonalFrameMsg(self, pid, iMsg, oMsg):
        self.m_UpdatePersonnalFrameMsg[(pid, iMsg)] = oMsg

    def UpdatePersonalSpectatorsFrameMsg(self, pid, iMsg, oMsg):
        self.m_UpdateSpectatorsFrameMsg[(pid, iMsg)] = oMsg

    def PushUpdateFrameMsg(self):
        if self.m_UpdateFrameMsg:
            for k, oMsg in self.m_UpdateFrameMsg.items():
                pid, iMsg = k
                self.AddFrameMsg(pid, iMsg, oMsg)

            self.m_UpdateFrameMsg = {}
        else:
            if self.m_UpdatePersonnalFrameMsg:
                for k, oMsg in self.m_UpdatePersonnalFrameMsg.items():
                    pid, iMsg = k
                    self.AddPersonalFrameMsg(pid, iMsg, oMsg)

                self.m_UpdatePersonnalFrameMsg = {}
            if self.m_UpdateSpectatorsFrameMsg:
                for k, oMsg in self.m_UpdateSpectatorsFrameMsg.items():
                    pid, iMsg = k
                    self.AddPersonalSpectatorsFrameMsg(pid, iMsg, oMsg)

    def AddDelta(self, iMsg, oMsg):
        self.AddFrameMsg(0, iMsg, oMsg)

    def UpdateDelta(self, iMsg, oMsg):
        self.UpdateFrameMsg(0, iMsg, oMsg)

    def OnHitBegin(self, iAttackerID, oHitArgs):
        if oHitArgs.m_HitType == BattleCmd_pb2.HIT_TYPE_SERVE:
            self.AfterServe()
        dEventData = {'动作ID':oHitArgs.m_AtkActionSID, 
         '敌方动作ID':oHitArgs.m_DefActionSID, 
         '击球玩家ID':iAttackerID}
        oAttPlayer = self.GetPlayer(oHitArgs.m_AtkPlayerID)
        self.OnBattleEvent(BattleCmd_pb2.BATTLE_EVENT_TYPE_HIT, dEventData)
        oAttPlayer.OnBattleEvent(BattleCmd_pb2.BATTLE_EVENT_TYPE_SELF_HIT, dEventData)
        if oHitArgs.m_HitKey == BattleCmd_pb2.HIT_KEY_KEY_P:
            oAttPlayer.OnBattleEvent(BattleCmd_pb2.BATTLE_EVENT_TYPE_HIT_P, dEventData)
        elif oHitArgs.m_HitKey == BattleCmd_pb2.HIT_KEY_KEY_D:
            oAttPlayer.OnBattleEvent(BattleCmd_pb2.BATTLE_EVENT_TYPE_HIT_D, dEventData)
        else:
            if oHitArgs.m_HitKey == BattleCmd_pb2.HIT_KEY_KEY_GY:
                oAttPlayer.OnBattleEvent(BattleCmd_pb2.BATTLE_EVENT_TYPE_HIT_GY, dEventData)
            if oHitArgs.m_OutDir == BattleCmd_pb2.BADMINTON_OUT_DIR_NONE:
                oAttPlayer.OnBattleEvent(BattleCmd_pb2.BATTLE_EVENT_TYPE_HIT_MIDDLE, dEventData)
            elif oHitArgs.m_OutDir == BattleCmd_pb2.BADMINTON_OUT_DIR_LEFT:
                oAttPlayer.OnBattleEvent(BattleCmd_pb2.BATTLE_EVENT_TYPE_HIT_LEFT, dEventData)
            elif oHitArgs.m_OutDir == BattleCmd_pb2.BADMINTON_OUT_DIR_RIGHT:
                oAttPlayer.OnBattleEvent(BattleCmd_pb2.BATTLE_EVENT_TYPE_HIT_RIGHT, dEventData)

    def OnGameStateDelta(self):
        oGameStateMsg = BattleCmd_pb2.BattleGameStateMsg()
        oGameStateMsg.GameState = self.m_GameState
        oGameStateMsg.EffectiveFrameNum = self.m_EffectiveFrameNum
        oGameStateMsg.UUID = self.m_UUID
        oGameStateMsg.OwnerID = self.m_OwnerID
        oGameStateMsg.SendTime = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(time.time()))
        self.AddDelta(BattleCmd_pb2.BATTLE_GAME_STATE_MSG, oGameStateMsg)

    def OnServePlayerDelta(self, iLastPlayerID, iCatchPlayerID):
        oServePlayerMsg = BattleCmd_pb2.BattleServePlayerMsg()
        oServePlayerMsg.PlayerID = self.m_ServePlayerID
        oServePlayerMsg.LastPlayerID = iLastPlayerID
        oServePlayerMsg.CatchPlayerID = iCatchPlayerID
        self.AddDelta(BattleCmd_pb2.BATTLE_SERVE_PLAYER_MSG, oServePlayerMsg)

    @ServerOnly
    def OnCurPointServePlayerDelta(self):
        oMsg = BattleCmd_pb2.BattleCurPointServePlayerIDMsg()
        oMsg.PlayerID = self.GetCurPointServePlayerID()
        self.AddDelta(BattleCmd_pb2.BATTLE_CUR_POINT_SERVE_PLAERID_MSG, oMsg)

    def NewNetIndex(self):
        for _ in range(255):
            self.m_CurNetIndex += 1
            if self.m_CurNetIndex >= 255:
                self.m_CurNetIndex = 1
            if self.m_CurNetIndex not in self.m_NetIndexDict:
                return self.m_CurNetIndex

        LogError("KEMITest", self.m_CurNetIndex, self.m_NetIndexDict)
        PythonError()

    def AddObject(self, iObjectType, iID, iNetIndex, oObject):
        if iID in self.m_AllObjects:
            return
        if iObjectType not in self.m_AllObjectsByType:
            self.m_AllObjectsByType[iObjectType] = {}
        oObject.m_NetIndex = iNetIndex
        self.m_AllObjectsByType[iObjectType][iID] = oObject
        self.m_AllObjects[iID] = oObject
        self.m_NetIndexDict[iNetIndex] = iID
        self.OnAddObjectDelta(iID, oObject)
        oObject.InitAfterEnterScene()

    def DelObject(self, iObjectType, iID):
        if iID not in self.m_AllObjects:
            return
        else:
            oObj = self.m_AllObjects[iID]
            oObj.DoRelease()
            del self.m_AllObjects[iID]
            if iObjectType in self.m_AllObjectsByType:
                if iID in self.m_AllObjectsByType[iObjectType]:
                    del self.m_AllObjectsByType[iObjectType][iID]
            if oObj.m_NetIndex in self.m_NetIndexDict:
                del self.m_NetIndexDict[oObj.m_NetIndex]
        self.OnRemoveObjectDelta(iObjectType, iID)

    def GetObject(self, iTargetID):
        return self.m_AllObjects.get(iTargetID, None)

    def GetAddObjectMsg(self, iID, oObject):
        oMsg = BattleCmd_pb2.BattleAddObjectMsg()
        oMsg.ObjectID = iID
        oMsg.Type = oObject.GetSceneObjectType()
        oMsg.TableID = oObject.GetTableID()
        oMsg.NetIndex = oObject.m_NetIndex
        sExtData = oObject.GetAddExtData()
        if sExtData:
            oMsg.ExtData = sExtData
        return oMsg

    @NoPrediction
    def OnAddObjectDelta(self, iID, oObject):
        oMsg = self.GetAddObjectMsg(iID, oObject)
        self.AddDelta(BattleCmd_pb2.BATTLE_ADD_OBJECT_MSG, oMsg)

    def OnRemoveObjectDelta(self, iObjectType, iID):
        oRemoveMsg = BattleCmd_pb2.BattleRemoveObjectMsg()
        oRemoveMsg.ObjectID = iID
        oRemoveMsg.Type = iObjectType
        self.AddDelta(BattleCmd_pb2.BATTLE_REMOVE_OBJECT_MSG, oRemoveMsg)

    def OnRoundEnd(self, iAttackerID, iScoreTeam, oHitArgs):
        return

    def CreateBadminton(self):
        iID = self.GetNpcID()
        iNetIndex = self.NewNetIndex()
        oBadminton = CBadminton(iID, self)
        self.AddObject(BattleCmd_pb2.SCENE_OBJECT_TYPE_BADMINTON, iID, iNetIndex, oBadminton)
        if not self.m_FirstBadminton:
            self.m_FirstBadminton = oBadminton

    def GetAllBadminton(self):
        return self.m_AllObjectsByType[BattleCmd_pb2.SCENE_OBJECT_TYPE_BADMINTON].values()

    def GetBadmintion(self, iId):
        return self.GetObject(iId)

    def GetFirstBadminton(self):
        return self.m_FirstBadminton

    def CreatePlayer(self, pid):
        return CGamePlayer(pid, self)

    def CreateMonster(self, iMonsterSID, oOwner):
        iID = self.GetNpcID()
        iNetIndex = self.NewNetIndex()
        oMonster = CMonster(iID, oOwner, self)
        oMonster.SetTableID(iMonsterSID)
        self.AddObject(BattleCmd_pb2.SCENE_OBJECT_TYPE_MONSTER, iID, iNetIndex, oMonster)
        return oMonster

    def CreateTrigger(self, iTriggerSID, oOwner, iCasterSkillID):
        iID = self.GetNpcID()
        iNetIndex = self.NewNetIndex()
        oTrigger = CTrigger(iID, oOwner, self, iCasterSkillID)
        oTrigger.SetTableID(iTriggerSID)
        self.AddObject(BattleCmd_pb2.SCENE_OBJECT_TYPE_TRIGGER, iID, iNetIndex, oTrigger)
        return oTrigger

    def DelMonster(self, iMonsterID):
        self.DelObject(BattleCmd_pb2.SCENE_OBJECT_TYPE_MONSTER, iMonsterID)

    def CreatePropertyBox(self, iPropertyBoxSID, iMemberType):
        iID = self.GetNpcID()
        iNetIndex = self.NewNetIndex()
        oPropertyBox = CPropertyBox(iID, self, iMemberType)
        oPropertyBox.SetTableID(iPropertyBoxSID)
        self.AddObject(BattleCmd_pb2.SCENE_OBJECT_TYPE_PROPERTY_BOX, iID, iNetIndex, oPropertyBox)
        oPropertyBox.Init()
        return oPropertyBox

    def DelPropertyBox(self, iPropertyBoxID):
        self.DelObject(BattleCmd_pb2.SCENE_OBJECT_TYPE_PROPERTY_BOX, iPropertyBoxID)

    def GetPlayer(self, pid):
        return self.GetObject(pid)

    def AddPlayer(self, oPlayer, oBattleScenePlayerData, iNetIndex=0):
        oPlayer.SetName(oBattleScenePlayerData.BriefData.Name)
        oPlayer.SetBriefData(oBattleScenePlayerData.BriefData)
        oPlayer.SetTableID(oBattleScenePlayerData.HeroID)
        oPlayer.SetMemberType(oBattleScenePlayerData.MemberType)
        oPlayer.SetPosIndex(oBattleScenePlayerData.PosIndex)
        oPlayer.SetApparelLst(oBattleScenePlayerData.Apparels)
        oPlayer.SetAllSkillData(oBattleScenePlayerData)
        oPlayer.SetRuneData(oBattleScenePlayerData.RuneData)
        oPlayer.SetEquipVoice(oBattleScenePlayerData.EquipVoiceID)
        oPlayer.m_IsGameAI = oBattleScenePlayerData.IsGameAI
        oPlayer.RecInitPosIndex(oBattleScenePlayerData.PosIndex)
        oPlayer.SetSunburnData(oBattleScenePlayerData.PlayerSunburnData)
        if iNetIndex is 0:
            iNetIndex = self.NewNetIndex()
        self.AddObject(BattleCmd_pb2.SCENE_OBJECT_TYPE_PLAYER, oPlayer.m_ID, iNetIndex, oPlayer)
        iMemberType = oPlayer.GetMemberType()
        if iMemberType not in self.m_PlayerByMemberType:
            self.m_PlayerByMemberType[iMemberType] = {}
        self.m_PlayerByMemberType[iMemberType][oPlayer.m_ID] = oPlayer

    def DelPlayer(self, pid):
        oPlayer = self.GetObject(pid)
        self.DelObject(BattleCmd_pb2.SCENE_OBJECT_TYPE_PLAYER, pid)
        iMemberType = oPlayer.GetMemberType()
        if iMemberType in self.m_PlayerByMemberType:
            if pid in self.m_PlayerByMemberType[iMemberType]:
                del self.m_PlayerByMemberType[iMemberType][pid]

    def GetAllPlayer(self):
        return self.m_AllObjectsByType[BattleCmd_pb2.SCENE_OBJECT_TYPE_PLAYER].values()

    def GetAllDynamic(self):
        allDynamicList = []
        allDynamicList.extend(self.m_AllObjectsByType.get(BattleCmd_pb2.SCENE_OBJECT_TYPE_PLAYER, {}).values())
        allDynamicList.extend(self.m_AllObjectsByType.get(BattleCmd_pb2.SCENE_OBJECT_TYPE_MONSTER, {}).values())
        return allDynamicList

    def GetAllTeamPlayer(self, iMemberType):
        return self.m_PlayerByMemberType.get(iMemberType, {}).values()

    def GetAllTeammate(self, pid, iMemberType):
        allTeammeate = self.m_PlayerByMemberType.get(iMemberType, {}).copy()
        if pid in allTeammeate:
            del allTeammeate[pid]
        return allTeammeate.values()

    def IsTeammate(self, pid, iMemberType, iTargetID):
        teammateLst = self.GetAllTeammate(pid, iMemberType)
        for oPlayer in teammateLst:
            if iTargetID == oPlayer.ID():
                return True

        return False

    def GetAllEnemy(self, iMemberType):
        if iMemberType == Common_pb2.TEAM_MEMBER_TYPE_HOST:
            return self.GetAllTeamPlayer(Common_pb2.TEAM_MEMBER_TYPE_GUEST)
        else:
            if iMemberType == Common_pb2.TEAM_MEMBER_TYPE_GUEST:
                return self.GetAllTeamPlayer(Common_pb2.TEAM_MEMBER_TYPE_HOST)
            return self.GetAllPlayer()

    def IsEnemy(self, iMemberType, iTargetID):
        if iMemberType == Common_pb2.TEAM_MEMBER_TYPE_HOST:
            if iTargetID in self.m_PlayerByMemberType.get(Common_pb2.TEAM_MEMBER_TYPE_GUEST, {}):
                return True
        elif iMemberType == Common_pb2.TEAM_MEMBER_TYPE_GUEST:
            if iTargetID in self.m_PlayerByMemberType.get(Common_pb2.TEAM_MEMBER_TYPE_HOST, {}):
                return True
        else:
            if iTargetID in self.m_AllObjectsByType[BattleCmd_pb2.SCENE_OBJECT_TYPE_PLAYER]:
                return True
            return False

    def GetAllPropertyBox(self):
        return self.m_AllObjectsByType.get(BattleCmd_pb2.SCENE_OBJECT_TYPE_PROPERTY_BOX, {}).values()

    def GetAllMonster(self):
        return self.m_AllObjectsByType.get(BattleCmd_pb2.SCENE_OBJECT_TYPE_MONSTER, {}).values()

    def OnGameStart(self):
        self.SetGameState(BattleCmd_pb2.GAME_STATE_START_MOVIE)

    def AppointOwner(self):
        if self.m_OwnerID != 0:
            return
        for oObj in self.GetAllPlayer():
            self.m_OwnerID = oObj.ID()
            break

    def CalcGameAICount(self):
        self.m_GameAICnt = 0
        for oPlayer in self.GetAllPlayer():
            if oPlayer.m_IsGameAI:
                self.m_GameAICnt += 1

    def InitAfterAllPlayerEnter(self):
        self.AppointOwner()
        self.CalcGameAICount()

    def RandomBetween(self, param1, param2):
        if param1 > param2:
            param1, param2 = param2, param1
        return self.m_Random.Random(param2 - param1) + param1

    def RandomFloatBetween(self, param1, param2):
        return self.RandomBetween(int(param1 * 1000), int(param2 * 1000)) / 1000

    def ChooseKey(self, dRatio, iTotal=0):
        return self.m_Random.ChooseKey(dRatio, iTotal)

    def IsServePlayer(self, pid):
        return self.m_ServePlayerID == pid and self.m_GameState == BattleCmd_pb2.GAME_STATE_SERVE

    @DevelopOnly
    def OnLogDelta(self, iLogLevel, sLogFormat, *arg):
        sLog = sLogFormat % arg
        oLogMsg = BattleCmd_pb2.BattleLogMsg()
        oLogMsg.LogLevel = iLogLevel
        oLogMsg.LogStr = sLog
        self.AddDelta(BattleCmd_pb2.BATTLE_LOG_MSG, oLogMsg)

    def SendLogLog(self, sLogFormat, *arg):
        (self.OnLogDelta)(BattleCmd_pb2.BATTLE_LOG_LEVEL_LOG, sLogFormat, *arg)

    def SendWarningLog(self, sLogFormat, *arg):
        (self.OnLogDelta)(BattleCmd_pb2.BATTLE_LOG_LEVEL_WARNING, sLogFormat, *arg)

    def SendErrorLog(self, sLogFormat, *arg):
        (self.OnLogDelta)(BattleCmd_pb2.BATTLE_LOG_LEVEL_ERROR, sLogFormat, *arg)

    def AfterServe(self):
        self.m_Phys.SetIsServe(False)
        self.SetServePlayerID(0, 0)
        self.SetGameState(BattleCmd_pb2.GAME_STATE_PLAYING)
        for oObj in self.GetAllPlayer():
            oObj.OnAfterServe()

    def GetCreateGameInfo(self):
        oCreatGameMsg = BattleCtrl_pb2.BattleCtrlCreateGameMsg()
        oCreatGameMsg.UUID = self.m_UUID
        oCreatGameMsg.SceneID = self.m_ID
        oCreatGameMsg.RandSeed = self.m_RandomSeed
        oCreatGameMsg.OwnerID = self.m_OwnerID
        oCreatGameMsg.GameMode = self.m_GameMode
        oCreatGameMsg.BattleMode = self.m_BattleMode
        oCreatGameMsg.SceneIndex = self.m_SceneIndex
        oCreatGameMsg.SceneType = self.GetSceneType()
        oCreatGameMsg.ClientLogicMode = Common_pb2.CLIENT_LOGIC_MODE_BATTLE
        oCreatGameMsg.GameEndRuleType = self.m_GameEndRuleType
        for oObj in self.GetAllPlayer():
            oPlayerData = oCreatGameMsg.PlayerDatas.add()
            oObj.FormatPlayerData(oPlayerData)

        oCreatGameMsg.GameState = self.m_GameState
        return oCreatGameMsg

    def GetQuartSizeDict(self):
        oCourtData = GetCourtData(self.m_CourtSID)
        if self.GetBattleMode() == Common_pb2.BATTLE_MODE_SINGLE:
            return oCourtData.m_SingleQuarterSizeDict
        else:
            return oCourtData.m_DualQuarterSizeDict

    def GetFrontBackLine(self):
        oCourtData = GetCourtData(self.m_CourtSID)
        return oCourtData.m_FrontBackLine

    def GetCourtArea(self, iMemberType, bIsServe=False):
        oCourtData = GetCourtData(self.m_CourtSID)
        dCourtAreaCornerPos = None
        if bIsServe:
            if self.GetBattleMode() == Common_pb2.BATTLE_MODE_SINGLE:
                dCourtAreaCornerPos = oCourtData.m_SingleServeCourtCornerPosDict[iMemberType]
            else:
                dCourtAreaCornerPos = oCourtData.m_DualServeCourtCornerPosDict[iMemberType]
        elif self.GetBattleMode() == Common_pb2.BATTLE_MODE_SINGLE:
            dCourtAreaCornerPos = oCourtData.m_SingleCourtCornerPosDict[iMemberType]
        else:
            dCourtAreaCornerPos = oCourtData.m_DualCourtCornerPosDict[iMemberType]
        return dCourtAreaCornerPos

    def GetOutOfArea(self, iMemberType, oPos, bIsServe):
        dCourtAreaCornerPos = self.GetCourtArea(iMemberType, bIsServe)
        oOutOfArea = CDVec3(0, 0, 0)
        for i, k in ((0, 'X'), (2, 'Z')):
            if oPos[i] < dCourtAreaCornerPos["MinPos"][k]:
                oOutOfArea[i] = oPos[i] - dCourtAreaCornerPos["MinPos"][k]
            if oPos[i] > dCourtAreaCornerPos["MaxPos"][k]:
                oOutOfArea[i] = oPos[i] - dCourtAreaCornerPos["MaxPos"][k]

        return oOutOfArea

    def GetIsOutOfArea(self, iMemberType, oPos, bIsServe):
        dCourtAreaCornerPos = self.GetCourtArea(iMemberType, bIsServe)
        bIsOutOfArea = False
        for i, k in ((0, 'X'), (2, 'Z')):
            if oPos[i] < dCourtAreaCornerPos["MinPos"][k] or oPos[i] > dCourtAreaCornerPos["MaxPos"][k]:
                bIsOutOfArea = True
                break

        return bIsOutOfArea

    def InScoreArea(self, iMemberType, oPos, bIsServe):
        dCourtAreaCornerPos = self.GetCourtArea(iMemberType, bIsServe)
        for i, k in ((0, 'X'), (2, 'Z')):
            if oPos[i] < dCourtAreaCornerPos["MinPos"][k]:
                return False
            if oPos[i] > dCourtAreaCornerPos["MaxPos"][k]:
                return False

        return True

    def GetServeRange(self):
        oCourtData = GetCourtData(self.m_CourtSID)
        dQuarterSize = self.GetQuartSizeDict()
        fFront = oCourtData.m_FrontServeLine
        if self.GetBattleMode() == Common_pb2.BATTLE_MODE_SINGLE:
            fBack = dQuarterSize["iWidth"]
        else:
            fBack = oCourtData.m_DualBackServeLine
        fMid = (fFront + fBack) / 2
        return (fFront, fBack, fMid)

    def GetLowestHitHeight(self):
        oCourtData = GetCourtData(self.m_CourtSID)
        iLowestHitHeight = oCourtData.m_LowestHitHeight
        return iLowestHitHeight

    def GetClosestOne(self, iMemberType, oTargetPos):
        fClosestDistance = INT_MAX
        iClosestPlayerID = 0
        for oObj in self.GetAllPlayer():
            if oObj.GetMemberType() != iMemberType:
                pass
            else:
                oPos = oObj.GetPos()
                fDistance = oPos.Distance(oTargetPos)
                if fDistance < fClosestDistance:
                    fClosestDistance = fDistance
                    iClosestPlayerID = oObj.m_ID

        return iClosestPlayerID

    def SetGameEndFunc(self, func):
        self.m_GameEndFunc = func

    def SetBattleReportInfo(self, oReportFunc):
        return

    def SetSenderFunc(self, func1, func2, func3):
        self.m_BroadcastFunc = func1
        self.m_SendToPid = func2
        self.m_SendToSpectators = func3

    def OnBattleEvent(self, iEventType, dEventData):
        for oObject in list(self.m_AllObjects.values()):
            oObject.OnBattleEvent(iEventType, dEventData)

    def GetCourtRandPos(self, iMemberType):
        oPos = CDVec3()
        dCourtAreaCornerPos = self.GetCourtArea(iMemberType)
        oPos.m_X = self.RandomBetween(int(dCourtAreaCornerPos["MinPos"]["X"]), int(dCourtAreaCornerPos["MaxPos"]["X"]))
        oPos.m_Z = self.RandomBetween(int(dCourtAreaCornerPos["MinPos"]["Z"]), int(dCourtAreaCornerPos["MaxPos"]["Z"]))
        return oPos

    def AddDelObject(self, iObjectType, iID):
        self.m_DelSet.add((iObjectType, iID))

    def NotifyToAll(self, sMsg):
        lstPlayer = self.GetAllPlayer()
        for oPlayer in lstPlayer:
            self.NotifyToPid(oPlayer.m_ID, sMsg)

    def NotifyToPid(self, pid, sMsg):
        if not self.m_NotifyFunc:
            return
        self.m_NotifyFunc(pid, sMsg)

    def OnPlayerQuit(self, pid):
        if self.m_GameState != BattleCmd_pb2.GAME_STATE_END:
            oPlayer = self.GetPlayer(pid)
            oPlayer.OnQuit()

    def OnPlayerReEnter(self, pid):
        return

    def CouldQuitGame(self):
        if self.m_GameState != BattleCmd_pb2.GAME_STATE_END:
            return False
        else:
            return True

    def GetPlayerCnt(self):
        return len(self.GetAllPlayer())

    def GetRealPlayerCnt(self):
        iRealPlayerCnt = 0
        for pid, _ in self.m_AllObjects[BattleCmd_pb2.SCENE_OBJECT_TYPE_PLAYER].items():
            if IsPlayerObjectID(pid):
                iRealPlayerCnt += 1

        return iRealPlayerCnt

    def ChangeAICurveID(self, iCurveId):
        return

    def ChangeAIHitHigh(self, sHitHigh):
        return

    def ChangeAIHitKey(self, sHitKey):
        return

    def SetBulletTimeScale(self, iValue):
        oBadminton = self.GetFirstBadminton()
        if oBadminton.m_IsPrejudeHit:
            self.m_BulletTimeScaleCache.append(iValue)
        else:
            self.DoSetBulletTimeScale(iValue)

    def OnSetBadmintonIsPrejudeHit(self, bIsPrejudeHit):
        if bIsPrejudeHit:
            return
        lstCache = self.m_BulletTimeScaleCache
        self.m_BulletTimeScaleCache = []
        for iValue in lstCache:
            self.DoSetBulletTimeScale(iValue)

        for oObject in list(self.m_AllObjects.values()):
            oObject.OnSetBadmintonIsPrejudeHit(bIsPrejudeHit)

    def DoSetBulletTimeScale(self, iValue):
        if iValue < 0:
            return
        if self.m_BulletTimeScale == iValue:
            return
        self.m_BulletTimeScale = iValue
        self.OnBulletTimeScaleDelta()

    @NoPrediction
    def OnBulletTimeScaleDelta(self):
        oDelta = BattleCmd_pb2.BattleSceneBulletTimeMsg()
        oDelta.BulletTimeScale = self.m_BulletTimeScale
        self.UpdateDelta(BattleCmd_pb2.BATTLE_SCENE_BULLET_TIME_MSG, oDelta)

    def ResetBulletTimeScale(self):
        if self.m_BulletTimeScale != 100:
            self.SetBulletTimeScale(100)
        self.m_BulletTimeRec = []

    def AddBulletTimeScale(self, iStateSID, iValue):
        self.m_BulletTimeRec.append((iStateSID, iValue))
        if iValue > self.m_BulletTimeScale:
            if len(self.m_BulletTimeRec) > 1:
                return
        self.SetBulletTimeScale(iValue)

    def RemoveBulletTimeScale(self, iStateSID, iOldValue):
        if (
         iStateSID, iOldValue) not in self.m_BulletTimeRec:
            return
        else:
            self.m_BulletTimeRec.remove((iStateSID, iOldValue))
            if iOldValue > self.m_BulletTimeScale:
                return
            else:
                self.m_BulletTimeRec or self.ResetBulletTimeScale()
                return
        iBullteTimeScale = min([tRec[1] for tRec in self.m_BulletTimeRec])
        self.SetBulletTimeScale(iBullteTimeScale)

    def SetAllPlayerBulletTimeScale(self, iValue):
        objectList = self.GetAllPlayer()
        if not objectList:
            return
        for oPlayer in objectList:
            oPlayer.SetBulletTimeScale(iValue)

    def ResetAllPlayerBulletTimeScale(self):
        objectList = self.GetAllPlayer()
        if not objectList:
            return
        for oPlayer in objectList:
            oPlayer.ResetBulletTimeScale()

    def GetNormalMaxScore(self):
        dGameRuleData = GetGameRuleData()
        return dGameRuleData["NormalMaxScore"]

    def GetLimitMaxScore(self):
        dGameRuleData = GetGameRuleData()
        return dGameRuleData["LimitMaxScore"]

    def GetLimitScoreDif(self):
        dGameRuleData = GetGameRuleData()
        return dGameRuleData["LimitScoreDif"]

    def GetFinalWinScore(self):
        return self.m_FinalWinScore

    def SetFinalWinScore(self, iValue):
        if iValue <= self.m_FinalWinScore:
            return
        iLimitMaxScore = self.GetLimitMaxScore()
        if iValue > iLimitMaxScore:
            iValue = iLimitMaxScore
        self.m_FinalWinScore = iValue

    def Pause(self):
        if self.m_GameState == BattleCmd_pb2.GAME_STATE_PAUSE:
            return
        self.m_LastGameState = self.m_GameState
        self.SetGameState(BattleCmd_pb2.GAME_STATE_PAUSE)

    def Resume(self):
        if self.m_GameState != BattleCmd_pb2.GAME_STATE_PAUSE:
            return False
        else:
            self.SetGameState(self.m_LastGameState)
            return True

    def InitPlayerStateByCourt(self, oPlayer):
        oCourtData = GetCourtData(self.m_CourtSID)
        addStateSet = set()
        oAddStateArgs = CAddStateArgs(0)
        for iGameMode, stateSet in oCourtData.m_PlayerInitStateDct.items():
            if iGameMode != 0:
                if iGameMode != self.m_GameMode:
                    continue
            addStateSet.update(stateSet)

        for iStateSID in addStateSet:
            oAddStateArgs.m_StateSID = iStateSID
            oPlayer.DoAddState(oAddStateArgs)

    def InitBadmintonStateByCourt(self, oBadminton):
        oCourtData = GetCourtData(self.m_CourtSID)
        addStateSet = set()
        oAddStateArgs = CAddStateArgs(0)
        for iGameMode, stateSet in oCourtData.m_BadmintonInitStateDct.items():
            if iGameMode != 0:
                if iGameMode != self.m_GameMode:
                    continue
            addStateSet.update(stateSet)

        for iStateSID in addStateSet:
            oAddStateArgs.m_StateSID = iStateSID
            oBadminton.DoAddState(oAddStateArgs)

    def DoRelease(self):
        self.ReleaseAllObjects()
        self.m_GameEndFunc = None
        self.m_BroadcastFunc = None
        self.m_SendToPid = None
        self.m_SendToSpectators = None
        self.m_OnPlayerHangUpFunc = None
        self.m_NotifyFunc = None
        self.m_Phys.SetStopCallback(None)
        self.m_Phys.SetTriggerCallback(None)
        self.m_Phys.SetCurveEndCallback(None)
        self.m_Phys.SetCurvePassHighestCallback(None)
        self.m_Phys.SetHitNetCallback(None)
        self.m_Phys.SetHitObjectCallback(None)
        self.m_Phys = None
        self.m_BOTManager.Clear()
        self.m_BOTManager = None
        self.m_ReqGameAIActionFunc = None
        if self.m_GameAI:
            self.m_GameAI.DoRelease()

    def ReleaseAllObjects(self):
        for oObject in list(self.m_AllObjects.values()):
            oObject.DoRelease()

        self.m_AllObjects = {}
        self.m_AllObjectsByType = {}

    def OnPropertyBoxTrigger(self, iPropertyBoxSID, iMemberType, iRefreshFrame, iTriggerPlayID, iPropertyID=0):
        return

    def GetBattleScoreByPid(self, pid):
        return

    def OnHitRes(self, iPlayerID, iHitKey, iHitType, iActionSID, iSkillSID):
        return

    def OnHitActionEnd(self, iPlayerID, iActionSID, iSkillSID, bHited, bInterrupted):
        return

    def SetTestServePosIndex(self, iPosIndex):
        return

    def SetTestServeResetPos(self):
        return

    def IsGameState(self, iGameState):
        return self.m_GameState == iGameState

    def CouldCatchServe(self, iPlayerID):
        oBadminton = self.GetFirstBadminton()
        if oBadminton.GetIsServe():
            iCatchPlayerID = self.CalcCatchServePlayerID()
            if iPlayerID != iCatchPlayerID:
                return False
        return True

    def SetOnPlayerHangUpFunc(self, oFunc):
        self.m_OnPlayerHangUpFunc = oFunc

    def OnPlayerHangUp(self, pid):
        if self.m_OnPlayerHangUpFunc:
            self.m_OnPlayerHangUpFunc(pid)

    def FormatGameResInfo(self, oGameRes):
        return

    def OnPlayerPing(self, iPlayerID):
        oPlayer = self.GetPlayer(iPlayerID)
        if not oPlayer:
            return
        oPlayer.OnPing()

    def CheckGameAdvanceEnd(self):
        return

    def OnPlayerBeginLoading(self, iPlayerID):
        oPlayer = self.GetPlayer(iPlayerID)
        oPlayer.SetLoading(True)

    def OnPlayerLoadingDone(self, iPlayerID):
        oPlayer = self.GetPlayer(iPlayerID)
        oPlayer.OnLoadingDone()

    def OnPlayerCancelLoading(self, iPlayerID):
        oPlayer = self.GetPlayer(iPlayerID)
        oPlayer.SetLoading(False)

    @NoPrediction
    def CreateFakeBadminton(self, oObject, iAmount):
        self.ClearAllFakeBadminton()
        for i in range(iAmount):
            iID = self.GetNpcID()
            iNetIndex = self.NewNetIndex()
            oFakeBadminton = CFakeBadminton(iID, self)
            oFakeBadminton.m_Owner = oObject
            self.AddObject(BattleCmd_pb2.SCENE_OBJECT_TYPE_FAKE_BADMINTON, iID, iNetIndex, oFakeBadminton)

    @NoPrediction
    def DelFakeBadminton(self, iID):
        self.DelObject(BattleCmd_pb2.SCENE_OBJECT_TYPE_FAKE_BADMINTON, iID)

    def GetAllFakeBadminton(self):
        if BattleCmd_pb2.SCENE_OBJECT_TYPE_FAKE_BADMINTON not in self.m_AllObjectsByType:
            return []
        else:
            return self.m_AllObjectsByType[BattleCmd_pb2.SCENE_OBJECT_TYPE_FAKE_BADMINTON].values()

    def ClearAllFakeBadminton(self):
        lstID = list(self.m_AllObjectsByType.get(BattleCmd_pb2.SCENE_OBJECT_TYPE_FAKE_BADMINTON, {}).keys())
        for iID in lstID:
            self.DelFakeBadminton(iID)

    @ClientOnly
    def SetAllFakeBadmintonCurve(self, oMsg):
        oBadminton = self.GetFirstBadminton()
        fakeBadmintonList = self.GetAllFakeBadminton()
        if not fakeBadmintonList:
            return
        elif oMsg.RandomType == BattleCmd_pb2.FAKEBADMINTON_CURVE_TYPE_DIF_KEY:
            randomLst = g_RandomHitKeyDir.copy()
        else:
            randomLst = [
             (
              oMsg.HitKey, BattleCmd_pb2.BADMINTON_OUT_DIR_NONE),
             (
              oMsg.HitKey, BattleCmd_pb2.BADMINTON_OUT_DIR_RIGHT),
             (
              oMsg.HitKey, BattleCmd_pb2.BADMINTON_OUT_DIR_LEFT)]
        tRemoveRandom = (oMsg.HitKey, oMsg.OutDir)
        if tRemoveRandom in randomLst:
            randomLst.remove(tRemoveRandom)
        random.shuffle(randomLst)
        for oFakeBadminton in fakeBadmintonList:
            if not randomLst:
                return
            iHitKey, iOutDir = randomLst.pop()
            oFakeBadminton.SetFakeCurve(oMsg, iHitKey, iOutDir)

    def SetNotifyFunc(self, func):
        self.m_NotifyFunc = func

    def FormatPlayerGameResExt(self, pid, oMsg):
        return

    def AddMVPKeyRecord(self, pid, iKey, iValue):
        return

    def SetUUID(self, sUUID):
        self.m_UUID = sUUID

    @ServerOnly
    def InitGameAIService(self, oReqActionFunc):
        if not self.m_HasGameAI:
            return
        self.m_GameAI = CGameAIService(self, oReqActionFunc)
        self.m_GameAI.Init()

    @ClientOnly
    def InitGameAIReRun(self):
        self.m_GameAI = CGameAIReRun(self)

    def CouldInitRobot(self):
        if self.m_BattleMode == Common_pb2.BATTLE_MODE_SINGLE:
            if self.GetPlayerCnt() != 2:
                return True
        else:
            if self.m_BattleMode == Common_pb2.BATTLE_MODE_DUAL:
                if self.GetPlayerCnt() != 4:
                    return True
            return False

    def CreateIdolum(self, iOwnerID):
        iID = self.GetNpcID()
        iNetIndex = self.NewNetIndex()
        oIdolum = CIdolum(iID, self, iOwnerID)
        self.AddObject(BattleCmd_pb2.SCENE_OBJECT_TYPE_IDOLUM, iID, iNetIndex, oIdolum)
        oIdolum.Init()
        return oIdolum

    def GetAllIdolum(self):
        return self.m_AllObjectsByType.get(BattleCmd_pb2.SCENE_OBJECT_TYPE_IDOLUM, {}).values()

    def SetGameAIDifficulty(self, iGameAIDifficulty):
        self.m_GameAIDifficulty = iGameAIDifficulty

    def SetGameAIDifficultyFluctuation(self, iGameAIDifficultyFluctuation):
        self.m_GameAIDifficultyFluctuation = iGameAIDifficultyFluctuation

    def SetTechExamID(self, iTechExamID):
        return

    def SetOriginalGameMode(self, iGameMode):
        self.m_OriginalGameMode = iGameMode
