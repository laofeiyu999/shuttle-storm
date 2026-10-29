# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\init.py
# Compiled at: 2023-04-06 17:03:31
# Size of source mod 2**32: 1874 bytes
import sys
if "PRELOADED_MODULES" not in globals():
    PRELOADER_MODULES = set(sys.modules.values())

def PrintProtobufVesion():
    from google.protobuf.internal import api_implementation
    import google.protobuf, debug
    debug.LogWarning("protobuf:%s:%s" % (api_implementation.Type(), google.protobuf.__version__))


def InitSysPath():
    script_path = ""
    for sPath in sys.path:
        if sPath.endswith("PyScript"):
            script_path = sPath
            break
        elif sPath.endswith("logic.fls"):
            script_path = sPath
            break

    sys.path.append(script_path + "/base/protobufdata")
    import debug
    debug.LogWarning("script_path %s" % script_path)


def Reload():
    import imp
    for module in set(sys.modules.values()) - PRELOADER_MODULES:
        try:
            imp.reload(module)
        except:
            debug.LogWarning("Reload Failed", str(module))


InitSysPath()
import debug, delegate
from game import GetGame, ReleaseGame
import battlelogic

def ClientInit():
    debug.Log("py client init")
    PrintProtobufVesion()
    battlelogic.MyInit()
    GetGame().Reset()


def ClientUpdate(iFrameNum, lstCmds, lstServerCmd):
    GetGame().Update(iFrameNum, lstCmds, lstServerCmd)


def InitGame(iHeroId, sInitBuffer, iClientLogicMode):
    debug.Log("py init game", iClientLogicMode)
    GetGame().Reset()
    GetGame().InitGame(iHeroId, sInitBuffer, iClientLogicMode)


def SetFrameDatas(sFrameBuffer):
    GetGame().SetFrameDatas(sFrameBuffer)


def HotFix(sHotFixScript):
    exec(sHotFixScript)


def ReRunServerRePlay():
    from defines import SetReRunReplay
    SetReRunReplay(True)
    from rerunreplay import ReRunAll
    ReRunAll()


def ClientRelease():
    ReleaseGame()
