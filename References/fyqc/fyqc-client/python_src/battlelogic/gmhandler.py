# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\gmhandler.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 9227 bytes
from battlelogic.common.debug import LogWarning, LogError
from base.protobufdata import Common_pb2
from battlelogic.battlebase.dvec3 import CDVec3
from battlelogic.common.decorator import NoPrediction, IsServer
from battlelogic.sceneplugins.gameai.defines import GAME_DIFFICULTY_LEVEL_MAX
from base.data import GetMatchRuledata

def CurveTest(oPlayer):
    oStartPos = CDVec3(-7.914706, 296.724976, 501.602844)
    oDropPos = CDVec3(-77.942329, 0.0, -548.586487)
    iCurveId = 4007
    iSpeedMul = 0.94
    oCurveData = oPlayer.m_Scene.m_Phys.CreateCurve(oStartPos.m_X, oStartPos.m_Y, oStartPos.m_Z, oDropPos.m_X, oDropPos.m_Y, oDropPos.m_Z, iCurveId, iSpeedMul)
    print("GetDropPos", oCurveData.GetDropPos())
    print("GetPointList", oCurveData.GetPointList())


def Do_Score(oPlayer, cmd):
    if len(cmd) < 3:
        LogError(oPlayer.m_ID, "请输入正确参数：修改分数 5 0")
        return
    iScoreA = int(cmd[1])
    iScoreB = int(cmd[2])
    oScene = oPlayer.m_Scene
    oScene.GMSetScore(Common_pb2.TEAM_MEMBER_TYPE_HOST, iScoreA)
    oScene.GMSetScore(Common_pb2.TEAM_MEMBER_TYPE_GUEST, iScoreB)
    LogWarning(oPlayer.m_ID, "执行成功")


def Do_ChallengeScore(oPlayer, cmd):
    if len(cmd) < 2:
        LogError(oPlayer.m_ID, "请输入正确参数：challengescore 20")
        return
    iChallengeScore = int(cmd[1])
    oScene = oPlayer.m_Scene
    if oScene.GetGameMode() != Common_pb2.GAME_MODE_CHALLENGE:
        LogError(oPlayer.m_ID, "仅在“最佳拍档”模式可用", oScene.GetGameMode())
        return
    oScene.GMSetChallengeScore(iChallengeScore)
    LogWarning(oPlayer.m_ID, "执行成功")


def Do_ChangeAICurve(oPlayer, cmd):
    if len(cmd) < 2:
        LogError(oPlayer.m_ID, "请输入球路ID：修改AI球路 1001")
        return
    iCurveId = 0
    iCurveId = int(cmd[1])
    oScene = oPlayer.GetScene()
    oScene.ChangeAICurveID(iCurveId)
    LogWarning(oPlayer.m_ID, "执行成功")


def Do_StopServe(oPlayer, cmd):
    oScene = oPlayer.GetScene()
    oScene.SetTestIsStopServe()
    LogWarning(oPlayer.m_ID, "执行成功")


def Do_ChangeAIHitHigh(oPlayer, cmd):
    if len(cmd) < 2:
        LogError(oPlayer.m_ID, "请输入高度参数：切换AI击球高度(low,mid,high) low")
        return
    oScene = oPlayer.GetScene()
    sHitHigh = cmd[1]
    if sHitHigh not in ('low', 'mid', 'high'):
        LogError(oPlayer.m_ID, "请输入正确高度参数：切换AI击球高度(low,mid,high) low")
        return
    oScene.ChangeAIHitHigh(sHitHigh)
    LogWarning(oPlayer.m_ID, "执行成功")


def Do_ChangeAIHitKey(oPlayer, cmd):
    if len(cmd) < 2:
        LogError(oPlayer.m_ID, "请输入击球按键参数(p近球,d远球,gy吊球)：切换AI击球按键(p,d,gy) p")
        return
    oScene = oPlayer.GetScene()
    sHitKey = cmd[1]
    if sHitKey not in ('p', 'd', 'gy'):
        LogError(oPlayer.m_ID, "请输入正确击球按键参数(p近球,d远球,gy吊球)：切换AI击球按键(p,d,gy) p")
        return
    oScene.ChangeAIHitKey(sHitKey)
    LogWarning(oPlayer.m_ID, "执行成功")


def Do_NoCD(oPlayer, cmd):
    oPlayer.SetTestNoCD()
    LogWarning(oPlayer.m_ID, "执行成功")


def Do_ShowRandom(oPlayer, cmd):
    oScene = oPlayer.GetScene()
    oScene.SetTestShowRandom()
    LogWarning(oPlayer.m_ID, "执行成功")


def Do_ChangeNotCheckStarMarkCounter(oPlayer, cmd):
    oScene = oPlayer.GetScene()
    oScene.ChangeNotCheckStarMarkCounter()
    LogWarning(oPlayer.m_ID, "执行成功")


def Do_AttachAI(oPlayer, cmd):
    iBTConfID = 1001
    if len(cmd) == 2:
        iBTConfID = int(cmd[1])
    elif oPlayer.HasBT():
        oPlayer.DetachBT()
        LogWarning(oPlayer.m_ID, "卸下BOT成功")
    else:
        oPlayer.AttachBT(iBTConfID)
        LogWarning(oPlayer.m_ID, "挂上BOT成功")


def Do_ShareContinuous(oPlayer, cmd):
    oScene = oPlayer.GetScene()
    oScene.SetTestShareContinuous()
    LogWarning(oPlayer.m_ID, "执行成功")


def Do_SetServePosIndex(oPlayer, cmd):
    if len(cmd) < 2:
        LogError(oPlayer.m_ID, "请输入方向参数：设置发球方向(0随机,1左,2右) 1")
        return
    oScene = oPlayer.GetScene()
    iPosIndex = int(cmd[1])
    if iPosIndex not in (0, 1, 2):
        LogError(oPlayer.m_ID, "请输入正确方向参数：设置发球方向(0随机,1左,2右) 1")
        return
    oScene.SetTestServePosIndex(iPosIndex)
    LogWarning(oPlayer.m_ID, "执行成功")


def Do_SetSelfServeResetPos(oPlayer, cmd):
    oScene = oPlayer.GetScene()
    oScene.SetTestServeResetPos()
    LogWarning(oPlayer.m_ID, "执行成功")


def Do_HangupCheck(oPlayer, cmd):
    oScene = oPlayer.GetScene()
    if oScene.m_AbnormalStatusCheck:
        oScene.m_AbnormalStatusCheck = False
    else:
        oScene.m_AbnormalStatusCheck = True
    LogWarning(oPlayer.m_ID, "执行成功")


def Do_ExchangeSkillScheme(oPlayer, cmd):
    iSchemeIdx = int(cmd[1])
    oPlayer.ExchangeSkillScheme(iSchemeIdx)


def Do_SetDropPos(oPlayer, cmd):
    if len(cmd) < 3:
        LogError(oPlayer.m_ID, "请输入x,z轴坐标：设置发球方向(0随机,1左,2右) 1")
        return
    iX = min(int(cmd[1]), 305)
    iZ = min(int(cmd[2]), 670)
    iX = max(iX, -305)
    iZ = max(iZ, -670)
    oScene = oPlayer.GetScene()
    oScene.m_TestDropPos = CDVec3(iX, 0, iZ)


def Do_PassTechExam(oPlayer, cmd):
    oScene = oPlayer.GetScene()
    oScene.DoGMPassTechExam()


@NoPrediction
def Do_CheckGameAI(oPlayer, cmd):
    oScene = oPlayer.GetScene()
    if not oScene.m_GameAI:
        lstBOTConfID = []
        lstDynamicPlayer = oScene.GetAllTeamPlayer(Common_pb2.TEAM_MEMBER_TYPE_GUEST)
        for oPlayer in lstDynamicPlayer:
            lstBOTConfID.append(oPlayer.m_CurBOTConfID)

        sServerType = "本地BOT"
        if IsServer():
            sServerType = "联网BOT"
        oScene.SendWarningLog("该场比赛无GAMEAI服务, 客队%s行为树%s" % (sServerType, lstBOTConfID))
        return
    dMatchRuleData = GetMatchRuledata()
    iPlayerAILevel = int(GAME_DIFFICULTY_LEVEL_MAX * (oScene.m_GameAI.m_PlayerAvgElo - dMatchRuleData["AIMinElo"]) / (dMatchRuleData["AIMaxElo"] - dMatchRuleData["AIMinElo"]))
    oScene.SendWarningLog("玩家平均ELO[%s],玩家AI难度等级[%s], GAMEAI难度等级[%s]", oScene.m_GameAI.m_PlayerAvgElo, iPlayerAILevel, oScene.m_GameAI.m_DifficultyLevel)


def Do_CheckPlayerInfo(oPlayer, cmd):
    oScene = oPlayer.GetScene()
    lstPlayer = oScene.GetAllPlayer()
    for oPlayer in lstPlayer:
        oScene.SendWarningLog("玩家%d 等级%d 隐藏分%d 段位ID[%d]" % (oPlayer.m_ID, oPlayer.Grade(), oPlayer.Elo(), oPlayer.m_BriefData.RankID))


g_Command = {
 'score': Do_Score, 
 'changeaicurve': Do_ChangeAICurve, 
 'stopserve': Do_StopServe, 
 'changeaihithigh': Do_ChangeAIHitHigh, 
 'changeaihitkey': Do_ChangeAIHitKey, 
 'nocd': Do_NoCD, 
 'showrandom': Do_ShowRandom, 
 'changechecksmc': Do_ChangeNotCheckStarMarkCounter, 
 'attachai': Do_AttachAI, 
 'sharecontinuous': Do_ShareContinuous, 
 'setserveposindex': Do_SetServePosIndex, 
 'setserveresetpos': Do_SetSelfServeResetPos, 
 'hangupcheck': Do_HangupCheck, 
 'exchangeskillscheme': Do_ExchangeSkillScheme, 
 'setdroppos': Do_SetDropPos, 
 'passtechexam': Do_PassTechExam, 
 'checkgameai': Do_CheckGameAI, 
 'challengescore': Do_ChallengeScore, 
 'playerinfo': Do_CheckPlayerInfo}

def OnCmd(oPlayer, sCmd):
    cmd = sCmd.split()
    func = g_Command.get(cmd[0], None)
    if not func:
        LogError("指令不存在")
        return
    func(oPlayer, cmd)
