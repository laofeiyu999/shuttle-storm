# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\common\defines.py
# Compiled at: 2023-04-06 17:07:52
# Size of source mod 2**32: 9447 bytes
from base.protobufdata import Common_pb2
from .logicdelegate import Register
from base.protobufdata import BattleCmd_pb2
from base.protobufdata import SkillCmd_pb2
from base.protobufdata import BattleRoomCmd_pb2
from base.data import GetSkillData
COLLISION_GROUP_STATIC = 1
COLLISION_GROUP_SERVE = 2
COLLISION_GROUP_CHAR = 4
COLLISION_GROUP_MONSTER = 8
COLLISION_GROUP_BADMINTON = 16
HITACTION_PREJUDGE_FRAME = 3
CURVE_PREJUDGE_FRAME = 4
CURVE_WAIT_TIME = 0.08
BULLET_TIME_DELAY_FRAME = 2
MAX_USER_ID = 268435455
INT_MAX = 2147483647
INT_MIN = -2147483648
FLOAT_MAX = 3.40282347e+38
FLOAT_MIN = -3.40282347e+38
INF_TIME = 1061109567
FRAME = 25
SECOND_SCALE = 100
SYNC_INTERVAL = SECOND_SCALE // FRAME
HIT_HAND_TYPE_FORE = 1
HIT_HAND_TYPE_BACK = 2
HIT_AREA_MID_FLAG = 1
HIT_AREA_FRONT_FLAG = 2
HIT_AREA_BACK_FLAG = 4
HIT_AREA_LEFT_FLAG = 8
HIT_AREA_RIGHT_FLAG = 16
HIT_AREA_SIDE_FLAG = 32
RANGE_HIT = 1
RANGE_STRIDE = 2
RANGE_RETRIEVE = 3
SERVER_HIT_RANGE_TOLERANCE = 15
SERVER_HIT_RECALC_LIMIT = 50
SWING_SHOT_HIT_ACTION_ID = 2010
STAR_MARK_HIT_ACTION_ID = 1076
TRIGGER_CHECK_RES_ENTER = 1
TRIGGER_CHECK_RES_LEAVE = 2
PING_INTERVAL = 5
HANG_UP_FRAMES = 30 * FRAME
HANG_UP_FRAMES_WITH_FRIEND = 999 * FRAME
HANG_UP_WARNING_FRAMES = 10 * FRAME
DISCONNECT_WITHOUT_PING_FRAME = 6 * FRAME
OFFLINE_WITHOUT_PING_FRAME = 40 * FRAME
OFFLINE_WITHOUT_PING_FRAME_WITH_FRIEND = 999 * FRAME
PLAYER_ABNORMAL_STATUS_BTCONFID = 1001
DY_GAME_AI_BTCONFID = 6001
FIRE_EMOJI_INTERVAL_FRAME = 5 * FRAME
SPECTATOR_SHOW_MAX_AMOUNT = 10
NEED_REC_REPLAY = True
PLAYER_ABNORMAL_STATUS_HANGUP = 1
PLAYER_ABNORMAL_STATUS_QIUT = 2
PLAYER_ABNORMAL_STATUS_DISCONNECT = 4
PLAYER_ABNORMAL_STATUS_OFFLINE = 8
NEWBIE_GUIDE_SINGLE_BOTPLAYER = 3000
CURVE_DEFAULT_ID = 1001
BADMINTON_STARMARK_HEIGHT = 270
SPECTATE_ACTION_CD_FRAME = 4 * FRAME
SPECTATE_CHAT_CD_FRAME = 5 * FRAME
NEWBIE_GUIDE_DUAL_BOTPLAYER = {(Common_pb2.TEAM_MEMBER_TYPE_HOST): [3000, 3001], 
 (Common_pb2.TEAM_MEMBER_TYPE_GUEST): [3002, 3003]}
NEWBIE_BATTLE_GUIDE_FIRST = 1001010
GAME_AI_DIFFICULTY_LEVEL = {(BattleRoomCmd_pb2.TEST_AI_DIFFICULTY_NEWBIE): 1, 
 (BattleRoomCmd_pb2.TEST_AI_DIFFICULTY_MASTER): 7, 
 (BattleRoomCmd_pb2.TEST_AI_DIFFICULTY_GRANDMASTER): 15}
GAME_BOT_DIFFICULTY_LEVEL = {(BattleRoomCmd_pb2.TEST_AI_DIFFICULTY_NEWBIE): [2101, 2102, 2103, 2104, 2105, 
                                                 2106, 
                                                 2107, 
                                                 2108], 
 (BattleRoomCmd_pb2.TEST_AI_DIFFICULTY_MASTER): [2111, 2112, 2113, 2114, 2115, 
                                                 2116, 
                                                 2117, 
                                                 2118], 
 (BattleRoomCmd_pb2.TEST_AI_DIFFICULTY_GRANDMASTER): [3010]}
GAME_AI_DIFFICULTY_NAME = {(BattleRoomCmd_pb2.TEST_AI_DIFFICULTY_NEWBIE): "新手级训练员", 
 (BattleRoomCmd_pb2.TEST_AI_DIFFICULTY_MASTER): "高手级训练员", 
 (BattleRoomCmd_pb2.TEST_AI_DIFFICULTY_GRANDMASTER): "大师级训练员"}
CHALLENGE_GAMEBOT_PLAYER = [
 2901, 2902, 2903, 2904]
MONSTER_TRIGGER_RADIUS = 75
g_RangeDirPropType = {RANGE_HIT: {1:Common_pb2.BATTLE_PROP_TYPE_HIT_RADIUS_DIR1, 
             2:Common_pb2.BATTLE_PROP_TYPE_HIT_RADIUS_DIR2, 
             3:Common_pb2.BATTLE_PROP_TYPE_HIT_RADIUS_DIR3, 
             4:Common_pb2.BATTLE_PROP_TYPE_HIT_RADIUS_DIR4, 
             5:Common_pb2.BATTLE_PROP_TYPE_HIT_RADIUS_DIR5, 
             6:Common_pb2.BATTLE_PROP_TYPE_HIT_RADIUS_DIR6, 
             7:Common_pb2.BATTLE_PROP_TYPE_HIT_RADIUS_DIR7, 
             8:Common_pb2.BATTLE_PROP_TYPE_HIT_RADIUS_DIR8}, 
 
 RANGE_STRIDE: {1:Common_pb2.BATTLE_PROP_TYPE_STRIDE_RADIUS_DIR1, 
                2:Common_pb2.BATTLE_PROP_TYPE_STRIDE_RADIUS_DIR2, 
                3:Common_pb2.BATTLE_PROP_TYPE_STRIDE_RADIUS_DIR3, 
                4:Common_pb2.BATTLE_PROP_TYPE_STRIDE_RADIUS_DIR4, 
                5:Common_pb2.BATTLE_PROP_TYPE_STRIDE_RADIUS_DIR5, 
                6:Common_pb2.BATTLE_PROP_TYPE_STRIDE_RADIUS_DIR6, 
                7:Common_pb2.BATTLE_PROP_TYPE_STRIDE_RADIUS_DIR7, 
                8:Common_pb2.BATTLE_PROP_TYPE_STRIDE_RADIUS_DIR8}, 
 
 RANGE_RETRIEVE: {1:Common_pb2.BATTLE_PROP_TYPE_RETRIEVE_RADIUS_DIR1, 
                  2:Common_pb2.BATTLE_PROP_TYPE_RETRIEVE_RADIUS_DIR2, 
                  3:Common_pb2.BATTLE_PROP_TYPE_RETRIEVE_RADIUS_DIR3, 
                  4:Common_pb2.BATTLE_PROP_TYPE_RETRIEVE_RADIUS_DIR4, 
                  5:Common_pb2.BATTLE_PROP_TYPE_RETRIEVE_RADIUS_DIR5, 
                  6:Common_pb2.BATTLE_PROP_TYPE_RETRIEVE_RADIUS_DIR6, 
                  7:Common_pb2.BATTLE_PROP_TYPE_RETRIEVE_RADIUS_DIR7, 
                  8:Common_pb2.BATTLE_PROP_TYPE_RETRIEVE_RADIUS_DIR8}}
g_ForbidActionFlag = {(BattleCmd_pb2.HIT_ACTION_TYPE_INSIDE): (BattleCmd_pb2.BEHAVIOR_TYPE_FORBID_INSIDE_ACTION), 
 (BattleCmd_pb2.HIT_ACTION_TYPE_MIDDLE): (BattleCmd_pb2.BEHAVIOR_TYPE_FORBID_MIDDLE_ACTION), 
 (BattleCmd_pb2.HIT_ACTION_TYPE_OUTSIDE): (BattleCmd_pb2.BEHAVIOR_TYPE_FORBID_OUTSIDE_ACTION), 
 (BattleCmd_pb2.HIT_ACTION_TYPE_SKILL): (BattleCmd_pb2.BEHAVIOR_TYPE_FORBID_SKILL_ACTION), 
 (BattleCmd_pb2.HIT_ACTION_TYPE_OTHER): (BattleCmd_pb2.BEHAVIOR_TYPE_FORBID_OTHER_ACTION)}
g_RandomHitKeyDir = [
 (
  BattleCmd_pb2.HIT_KEY_KEY_P, BattleCmd_pb2.BADMINTON_OUT_DIR_NONE),
 (
  BattleCmd_pb2.HIT_KEY_KEY_P, BattleCmd_pb2.BADMINTON_OUT_DIR_RIGHT),
 (
  BattleCmd_pb2.HIT_KEY_KEY_P, BattleCmd_pb2.BADMINTON_OUT_DIR_LEFT),
 (
  BattleCmd_pb2.HIT_KEY_KEY_D, BattleCmd_pb2.BADMINTON_OUT_DIR_NONE),
 (
  BattleCmd_pb2.HIT_KEY_KEY_D, BattleCmd_pb2.BADMINTON_OUT_DIR_RIGHT),
 (
  BattleCmd_pb2.HIT_KEY_KEY_D, BattleCmd_pb2.BADMINTON_OUT_DIR_LEFT),
 (
  BattleCmd_pb2.HIT_KEY_KEY_GY, BattleCmd_pb2.BADMINTON_OUT_DIR_NONE),
 (
  BattleCmd_pb2.HIT_KEY_KEY_GY, BattleCmd_pb2.BADMINTON_OUT_DIR_RIGHT),
 (
  BattleCmd_pb2.HIT_KEY_KEY_GY, BattleCmd_pb2.BADMINTON_OUT_DIR_LEFT)]
NORMAL_HIT_KEY = (
 BattleCmd_pb2.HIT_KEY_KEY_D, BattleCmd_pb2.HIT_KEY_KEY_P, BattleCmd_pb2.HIT_KEY_KEY_GY)
SKILL_HIT_KEY = (BattleCmd_pb2.HIT_KEY_KEY_DJ, BattleCmd_pb2.HIT_KEY_KEY_ZD)

def GetForbidActionFlag(iActionType):
    return g_ForbidActionFlag.get(iActionType, 0)


@Register
def IsServer():
    return


@Register
def GetClientGame():
    return


def Time2Frame(iTime):
    iFrame = iTime * FRAME // SECOND_SCALE
    return iFrame


def Frame2Time(iFrame):
    iPresec = iFrame * SECOND_SCALE // FRAME
    return iPresec


def Frame2Sec(iFrame):
    return iFrame / FRAME


def Sec2Frame(fSec):
    return int(fSec * FRAME)


def GetEnemyMemberType(iMemberType):
    if iMemberType == Common_pb2.TEAM_MEMBER_TYPE_GUEST:
        return Common_pb2.TEAM_MEMBER_TYPE_HOST
    else:
        if iMemberType == Common_pb2.TEAM_MEMBER_TYPE_HOST:
            return Common_pb2.TEAM_MEMBER_TYPE_GUEST
        return Common_pb2.TEAM_MEMBER_TYPE_NONE


def GetRangeDir(fAngle):
    iArea = 0
    if fAngle >= 337.5 or fAngle < 22.5:
        iArea = 1
    if fAngle < 202.5:
        if 22.5 <= fAngle:
            if fAngle < 67.5:
                iArea = 2
        else:
            if 67.5 <= fAngle:
                if fAngle < 112.5:
                    iArea = 3
            if 112.5 <= fAngle:
                if fAngle < 157.5:
                    iArea = 4
        if 157.5 <= fAngle:
            if fAngle < 202.5:
                iArea = 5
    elif 202.5 <= fAngle:
        pass
    if fAngle < 247.5:
        iArea = 6
    elif 247.5 <= fAngle and fAngle < 292.5:
        iArea = 7
    else:
        if 292.5 <= fAngle:
            if fAngle < 337.5:
                iArea = 8
    return iArea


def GetRangeDirPropType(fAngle, iRangeType):
    iArea = GetRangeDir(fAngle)
    if iArea == 0:
        return
    else:
        if iRangeType not in g_RangeDirPropType:
            return
        return g_RangeDirPropType[iRangeType][iArea]


def IsPlayerObjectID(pid):
    return pid > 0 and pid <= MAX_USER_ID


def String2IntLst(sData, sFliter='|'):
    iValueLst = []
    if not sData or len(sData) == 0:
        return iValueLst
    else:
        sValueLst = sData.split(sFliter)
        for sValue in sValueLst:
            if not sValue:
                break
            iValueLst.append(int(sValue))

        return iValueLst


def TransformPosIndexFromRoomToBattle(iRoomPosIndex):
    return iRoomPosIndex // 2 + 1
