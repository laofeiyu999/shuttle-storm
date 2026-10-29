# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\plugins\prop\defines.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 2049 bytes
from base.protobufdata import Common_pb2
from battlelogic.common.defines import FRAME
from battlelogic.common.debug import LogError

def OnTowardDropposSpeedMul(who, iVal):
    who.m_Scene.m_Phys.SetTowardDropPosSpeedMul(who.m_ID, iVal)


def OnTowardDropposMaxAngle(who, iVal):
    who.m_Scene.m_Phys.SetTowardDropPosMaxAngle(who.m_ID, iVal)


def OnSpeedForward(who, iVal):
    if who.GetMemberType() == Common_pb2.TEAM_MEMBER_TYPE_GUEST:
        who.m_Scene.m_Phys.SetSpeedBack(who.m_ID, iVal / FRAME)
    else:
        who.m_Scene.m_Phys.SetSpeedForward(who.m_ID, iVal / FRAME)


def OnSpeedBack(who, iVal):
    if who.GetMemberType() == Common_pb2.TEAM_MEMBER_TYPE_GUEST:
        who.m_Scene.m_Phys.SetSpeedForward(who.m_ID, iVal / FRAME)
    else:
        who.m_Scene.m_Phys.SetSpeedBack(who.m_ID, iVal / FRAME)


def OnSpeedLeft(who, iVal):
    if who.GetMemberType() == Common_pb2.TEAM_MEMBER_TYPE_GUEST:
        who.m_Scene.m_Phys.SetSpeedRight(who.m_ID, iVal / FRAME)
    else:
        who.m_Scene.m_Phys.SetSpeedLeft(who.m_ID, iVal / FRAME)


def OnSpeedRight(who, iVal):
    if who.GetMemberType() == Common_pb2.TEAM_MEMBER_TYPE_GUEST:
        who.m_Scene.m_Phys.SetSpeedLeft(who.m_ID, iVal / FRAME)
    else:
        who.m_Scene.m_Phys.SetSpeedRight(who.m_ID, iVal / FRAME)


def OnStartingFrame(who, iVal):
    who.m_Scene.m_Phys.SetStartingFrame(who.m_ID, iVal)


def OnTurningFrame(who, iVal):
    who.m_Scene.m_Phys.SetTurningFrame(who.m_ID, iVal)


g_OnChangeFunc = {(Common_pb2.BATTLE_PROP_TYPE_TOWARD_DROPPOS_MAX_SPEED_MUL): OnTowardDropposSpeedMul, 
 (Common_pb2.BATTLE_PROP_TYPE_TOWARD_DROPPOS_MAX_ANGLE): OnTowardDropposMaxAngle, 
 (Common_pb2.BATTLE_PROP_TYPE_SPEED_FORWARD): OnSpeedForward, 
 (Common_pb2.BATTLE_PROP_TYPE_SPEED_BACK): OnSpeedBack, 
 (Common_pb2.BATTLE_PROP_TYPE_SPEED_LEFT): OnSpeedLeft, 
 (Common_pb2.BATTLE_PROP_TYPE_SPEED_RIGHT): OnSpeedRight, 
 (Common_pb2.BATTLE_PROP_TYPE_STARTING_FRAME): OnStartingFrame, 
 (Common_pb2.BATTLE_PROP_TYPE_TURNING_FRAME): OnTurningFrame}

def GetOnChangeFunc(iType):
    return g_OnChangeFunc.get(iType, None)
