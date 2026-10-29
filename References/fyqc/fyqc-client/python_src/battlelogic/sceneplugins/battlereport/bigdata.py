# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\sceneplugins\battlereport\bigdata.py
# Compiled at: 2023-04-06 17:07:52
# Size of source mod 2**32: 6904 bytes
from base.protobufdata import Common_pb2, BattleCmd_pb2
from battlelogic.common.defines import PLAYER_ABNORMAL_STATUS_HANGUP, PLAYER_ABNORMAL_STATUS_QIUT, PLAYER_ABNORMAL_STATUS_DISCONNECT, PLAYER_ABNORMAL_STATUS_OFFLINE
BATTLE_INFO_IS_MVP = 1
BATTLE_INFO_IS_NOT_MVP = 2
BATTLE_INFO_ENEMY_TYPE_REAL_PLAYER = 1
BATTLE_INFO_ENEMY_TYPE_BOT = 2
BATTLE_INFO_ENEMY_TYPE_AI = 3

def GetGameResult(dGameData, dPlayerData):
    iAbnormalStatus = dPlayerData.get("AbnormalStatus", 0)
    if iAbnormalStatus & PLAYER_ABNORMAL_STATUS_QIUT:
        return 3
    if iAbnormalStatus & PLAYER_ABNORMAL_STATUS_OFFLINE:
        return 4
    if iAbnormalStatus & PLAYER_ABNORMAL_STATUS_HANGUP:
        return 5
    else:
        if dPlayerData["MemberType"] == dGameData["WinMemberType"]:
            return 1
        return 2


def GetGameInfo(pid, dGameData, dPlayerData, sExtraDict):
    sExtraList = []
    for key, value in sExtraDict.items():
        sExtraList.append("%s:%s" % (key, value))

    sExtraText = ",".join(sExtraList)
    gameInfoLst = []
    if dGameData["GameMode"] in (Common_pb2.GAME_MODE_MATCH, Common_pb2.GAME_MODE_QUALIFY, Common_pb2.GAME_MODE_ROOM, Common_pb2.GAME_MODE_BOMB):
        gameInfoLst.append(1)
    else:
        gameInfoLst.append(2)
    gameInfoLst.append(dPlayerData["PersonalDetail"]["ServerNum"])
    gameInfoLst.append(dPlayerData["AccountID"])
    gameInfoLst.append(pid)
    sFightUUID = dGameData["FightID"]
    gameInfoLst.append(sFightUUID)
    gameInfoLst.append(dPlayerData["TeamID"])
    gameInfoLst.append(dGameData["GameMode"])
    gameInfoLst.append(dGameData["BattleMode"])
    gameInfoLst.append(dPlayerData["Grade"])
    if dPlayerData["Sex"] == Common_pb2.SEX_TYPE_BOY:
        gameInfoLst.append(1)
    else:
        gameInfoLst.append(2)
    iGameRes = GetGameResult(dGameData, dPlayerData)
    gameInfoLst.append(iGameRes)
    gameInfoLst.append(dGameData["GameLastTime"])
    gameInfoLst.append(dGameData["SceneIndex"])
    gameInfoLst.append(dPlayerData["RankID"])
    gameInfoLst.append(dPlayerData["RankPoints"])
    gameInfoLst.append(sExtraText)
    return gameInfoLst


def CalIsMvp(pid, iMvpPlayerID):
    iIsMVP = BATTLE_INFO_IS_NOT_MVP
    if iMvpPlayerID == pid:
        iIsMVP = BATTLE_INFO_IS_MVP
    return iIsMVP


def CalRobotType(pid, dGameData):
    if not dGameData["HasRobot"]:
        return BATTLE_INFO_ENEMY_TYPE_REAL_PLAYER
    else:
        if dGameData["HasGameAI"]:
            return BATTLE_INFO_ENEMY_TYPE_AI
        return BATTLE_INFO_ENEMY_TYPE_BOT


def GetMatchBattleInfo(pid, dGameData, dPlayerData):
    dInfo = {}
    dInfo = GetBattleInfo(pid, dGameData, dPlayerData)
    dInfo["elo"] = dPlayerData["MatchElo"]
    dInfo["pipeifen"] = dPlayerData["PersonalDetail"]["MatchMatchingScore"]
    return dInfo


def GetQualifyBattleInfo(pid, dGameData, dPlayerData):
    dInfo = {}
    dInfo = GetBattleInfo(pid, dGameData, dPlayerData)
    dInfo["elo"] = dPlayerData["QualifyElo"]
    dInfo["pipeifen"] = dPlayerData["PersonalDetail"]["QualifyMatchingScore"]
    return dInfo


def GetChallengeBattleInfo(pid, dGameData, dPlayerData):
    dInfo = {}
    dInfo = GetBattleInfo(pid, dGameData, dPlayerData)
    dInfo["elo"] = dPlayerData["MatchElo"]
    dInfo["pipeifen"] = dPlayerData["PersonalDetail"]["MatchMatchingScore"]
    dInfo["challenge_points"] = dPlayerData["ChallengeScore"]
    return dInfo


def GetBombBattleInfo(pid, dGameData, dPlayerData):
    dInfo = {}
    dInfo = GetBattleInfo(pid, dGameData, dPlayerData)
    dRecord = dPlayerData["Record"]
    dInfo["damage"] = dPlayerData["CauseDamage"]
    dInfo["enemy_damage"] = dPlayerData["HurtDamage"]
    dInfo["boom_num"] = dRecord.get(BattleCmd_pb2.BATTLE_RECORD_PRE_EXPLOD_TIMES, 0)
    dInfo["boom_damage"] = dPlayerData["HitExplodeDamage"]
    dInfo["nonboom_num"] = dRecord.get(BattleCmd_pb2.BATTLE_RECORD_NOT_PRE_EXPLOD_TIMES, 0)
    dInfo["nonboom_damage"] = dPlayerData["NotHitExplodeDamage"]
    return dInfo


def GetBattleInfo(pid, dGameData, dPlayerData):
    dInfo = {}
    iSkillNum = 0
    equipSkillsLst = dPlayerData["EquipSkills"]
    if equipSkillsLst:
        for sEquipSkill in equipSkillsLst:
            iSkillNum += 1
            sSkill = "skill%d" % iSkillNum
            dInfo[sSkill] = sEquipSkill

    else:
        dInfo["skill1"] = ""
    dInfo["daoju"] = dPlayerData["Daoju"]
    dInfo["MVPscore"] = dPlayerData["MVPScore"]
    dInfo["team_score"] = dPlayerData["TotalScore"]
    dInfo["enemy_team_score"] = dPlayerData["EnemyTotalScore"]
    iIsMVP = CalIsMvp(pid, dGameData["MvpPlayerID"])
    dInfo["MVP"] = iIsMVP
    dInfo["score"] = dPlayerData["PersonalScore"]
    dInfo["snackid"] = dPlayerData["RuneID"]
    dInfo["snack"] = dPlayerData["RuneData"]
    dRecord = dPlayerData["Record"]
    dInfo["short"] = dRecord.get(BattleCmd_pb2.BATTLE_RECORD_P_HIT_TIMES, 0)
    dInfo["long"] = dRecord.get(BattleCmd_pb2.BATTLE_RECORD_D_HIT_TIMES, 0)
    dInfo["clear"] = dRecord.get(BattleCmd_pb2.BATTLE_RECORD_GY_HIT_TIMES, 0)
    dInfo["smash"] = dRecord.get(BattleCmd_pb2.BATTLE_RECORD_JUMP_TIMES, 0)
    dInfo["star"] = dRecord.get(BattleCmd_pb2.BATTLE_RECORD_STAR_TIMES, 0)
    dInfo["averener"] = dPlayerData["AVGContinuousTimes"]
    dInfo["highener"] = dRecord.get(BattleCmd_pb2.BATTLE_RECORD_HIGH_CONTINUOUS, 0)
    dInfo["midener"] = dRecord.get(BattleCmd_pb2.BATTLE_RECORD_MIDDLE_CONTINUOUS, 0)
    dInfo["lowener"] = dRecord.get(BattleCmd_pb2.BATTLE_RECORD_LOW_CONTINUOUS, 0)
    dInfo["ace"] = dRecord.get(BattleCmd_pb2.BATTLE_RECORD_INSIDE_HIT_TIMES, 0)
    dInfo["normal"] = dRecord.get(BattleCmd_pb2.BATTLE_RECORD_NORMAL_HIT_TIMES, 0)
    dInfo["bad"] = dRecord.get(BattleCmd_pb2.BATTLE_RECORD_OUTSIDE_HIT_TIMES, 0)
    dInfo["skill_act"] = dRecord.get(BattleCmd_pb2.BATTLE_RECORD_ACTIVE_SKILL_TIMES, 0)
    dInfo["servewin"] = dRecord.get(BattleCmd_pb2.BATTLE_RECORD_SERVE_WIN, 0)
    dInfo["catchservewin"] = dRecord.get(BattleCmd_pb2.BATTLE_RECORD_CATCH_SERVE_WIN, 0)
    dInfo["net"] = dRecord.get(BattleCmd_pb2.BATTLE_RECORD_HIT_NET_TIMES, 0)
    dInfo["overdrive"] = dRecord.get(BattleCmd_pb2.BATTLE_RECORD_OUT_OF_AREA_TIMES, 0)
    dInfo["zhuangbei"] = dPlayerData["Zhuangbei"]
    dInfo["robot"] = CalRobotType(pid, dGameData)
    dInfo["robotlevel"] = dGameData.get("GameAIDifficulty", 0)
    dInfo["uuid"] = dGameData["UUID"]
    return dInfo


g_BattleInfoFunc = {(Common_pb2.GAME_MODE_MATCH): GetMatchBattleInfo, 
 (Common_pb2.GAME_MODE_QUALIFY): GetQualifyBattleInfo, 
 (Common_pb2.GAME_MODE_CHALLENGE): GetChallengeBattleInfo, 
 (Common_pb2.GAME_MODE_BOMB): GetBombBattleInfo}

def GetBattleLogInfo(pid, dGameData, dPlayerData):
    global g_BattleInfoFunc
    sExtraDict = {}
    oBattleInfoFunc = g_BattleInfoFunc.get(dGameData["GameMode"])
    if oBattleInfoFunc:
        sExtraDict = oBattleInfoFunc(pid, dGameData, dPlayerData)
    return sExtraDict


def FormatLogText(pid, dGameData, dPlayerData):
    sExtraDict = GetBattleLogInfo(pid, dGameData, dPlayerData)
    gameInfoLst = GetGameInfo(pid, dGameData, dPlayerData, sExtraDict)
    sLogText = "\t"
    if gameInfoLst:
        gameInfoList2 = map(str, gameInfoLst)
        sLogText = "\t".join(gameInfoList2)
    return sLogText
