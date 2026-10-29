# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\defines.py
# Compiled at: 2023-04-06 17:03:30
# Size of source mod 2**32: 1778 bytes
from base.protobufdata import BattleCmd_pb2
from battlelogic.common.debug import LogError
from battlelogic.scenepvp import CScenePVP
from battlelogic.sceneencounterboss import CSceneEncounterBoss
from battlelogic.scenegameai import CSceneGameAI
from battlelogic.scenebomb import CSceneBomb
from battlelogic.scenechallenge import CSceneChallenge
from base.protobufdata import Common_pb2
from battlelogic.scenetechexam import CSceneTechExam
from battlelogic.scenegamelevel import CSceneGameLevel
if "g_IsReRunReplay" not in globals():
    g_IsReRunReplay = False

def GetSceneByType(iSceneType):
    cSceneClass = None
    if iSceneType == BattleCmd_pb2.SCENE_TYPE_PVP:
        cSceneClass = CScenePVP
    elif iSceneType == BattleCmd_pb2.SCENE_TYPE_ENCOUNTER_BOSS:
        cSceneClass = CSceneEncounterBoss
    elif iSceneType == BattleCmd_pb2.SCENE_TYPE_GAMEAI:
        cSceneClass = CSceneGameAI
    elif iSceneType == BattleCmd_pb2.SCENE_TYPE_BOMBPLAY:
        cSceneClass = CSceneBomb
    elif iSceneType == BattleCmd_pb2.SCENE_TYPE_CHALLENGE:
        cSceneClass = CSceneChallenge
    else:
        LogError("get scene type %s not found", iSceneType)
    return cSceneClass


def GetSceneByMode(iGameMode):
    cSceneClass = None
    if iGameMode == Common_pb2.GAME_MODE_TECHNICAL_EXAM:
        cSceneClass = CSceneTechExam
    elif iGameMode == Common_pb2.GAME_MODE_CHALLENGE:
        cSceneClass = CSceneChallenge
    elif iGameMode == Common_pb2.GAME_MODE_BOMB:
        cSceneClass = CSceneBomb
    elif iGameMode == Common_pb2.GAME_MODE_GAME_LEVEL:
        cSceneClass = CSceneGameLevel
    else:
        cSceneClass = CScenePVP
    return cSceneClass


def SetReRunReplay(bFlag):
    global g_IsReRunReplay
    g_IsReRunReplay = bFlag


def GetReRunReplay():
    return g_IsReRunReplay
