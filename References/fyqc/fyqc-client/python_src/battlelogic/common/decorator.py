# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\common\decorator.py
# Compiled at: 2023-04-06 17:07:52
# Size of source mod 2**32: 2111 bytes
from battlelogic.common.defines import IsServer, GetClientGame
from battlelogic.common import defines

def PredictionHeroOnly(func):
    if IsServer():
        return func
    else:

        def Wrapper(*args, **dicts):
            if GetClientGame().IsLocalGame():
                return func(*args, **dicts)
            else:
                iHeroId = GetClientGame().m_HeroId
                oObject = args[0]
                if not oObject or oObject.m_ID != iHeroId:
                    return
                return func(*args, **dicts)

        return Wrapper


def NoPrediction(func):
    if IsServer():
        return func
    else:

        def Wrapper(*args, **dicts):
            if GetClientGame().IsLocalGame():
                return func(*args, **dicts)
            else:
                return

        return Wrapper


def NoRerun(func):
    if IsServer():
        return func
    else:

        def Wrapper(*args, **dicts):
            if not GetClientGame().m_Rerunning:
                return func(*args, **dicts)
            else:
                return

        return Wrapper


def ServerOnly(func):
    if IsServer():
        return func
    else:

        def Wrapper(*args, **dicts):
            return

        return Wrapper


def ClientOnly(func):
    if not IsServer():
        return func
    else:

        def Wrapper(*args, **dicts):
            return

        return Wrapper


def LocalPredictionHeroOnly(func):
    if IsServer():
        return func
    else:

        def Wrapper(*args, **dicts):
            if GetClientGame().IsLocalGame():
                iHeroId = GetClientGame().m_HeroId
                oObject = args[0]
                if not oObject or oObject.m_ID != iHeroId:
                    return
                return func(*args, **dicts)
            else:
                return

        return Wrapper


def RecReplayOnly(func):
    if defines.NEED_REC_REPLAY:
        return func
    else:

        def Wrapper(*args, **dicts):
            return

        return Wrapper
