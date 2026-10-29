# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\debug.py
# Compiled at: 2023-04-06 17:03:31
# Size of source mod 2**32: 2266 bytes
from battlelogic.common.logicdelegate import Override
import C_logic, C_debug, traceback, sys, os
LOGTYPE_LOG = 1
LOGTYPE_WARNING = 2
LOGTYPE_ERROR = 3
SHOW_TRACE = True

@Override("battlelogic.common.debug")
def DevelopOnly(func):
    if os.getenv("IS_UNITY_DEVELOP", "NO") == "YES":
        return func
    else:

        def Wrapper(*args, **dicts):
            return

        return Wrapper


@Override("battlelogic.common.debug")
@DevelopOnly
def Log(*args):
    if len(args) == 1:
        sMsg = args[0]
    else:
        sMsg = "%s " * len(args) % args
    if SHOW_TRACE:
        sMsg = sMsg + "\n" + "\n".join(GetTraceText())
    C_logic.Message(LOGTYPE_LOG, sMsg)


@Override("battlelogic.common.debug")
@DevelopOnly
def LogWarning(*args):
    if len(args) == 1:
        sMsg = args[0]
    else:
        sMsg = "%s " * len(args) % args
    if SHOW_TRACE:
        sMsg = sMsg + "\n" + "\n".join(GetTraceText())
    C_logic.Message(LOGTYPE_WARNING, sMsg)


@Override("battlelogic.common.debug")
def LogError(*args):
    if len(args) == 1:
        sMsg = args[0]
    else:
        sMsg = "%s " * len(args) % args
    if SHOW_TRACE:
        sMsg = sMsg + "\n" + "\n".join(GetTraceText())
    C_logic.Message(LOGTYPE_ERROR, sMsg)


@Override("battlelogic.common.debug")
def BeginSample(sText):
    C_debug.BeginSample(sText)


@Override("battlelogic.common.debug")
def EndSample():
    C_debug.EndSample()


def EnableDeepProfiler():

    def DeepProfiler(frame, event, arg):
        if event == "call":
            C_debug.BeginSample(frame.f_code.co_name)
        else:
            if event == "return":
                C_debug.EndSample()
        if event == "c_call":
            C_debug.BeginSample(str(arg))
        elif event == "c_return":
            C_debug.EndSample()

    sys.setprofile(DeepProfiler)


def DisableDeepProfiler():
    sys.setprofile(None)


def GetTraceText():
    txtlist = []
    stack = traceback.extract_stack()
    for filename, lineno, name, line in stack[:-2]:
        txt = " File '%s', line %s, in '%s'" % (filename, lineno, name)
        txtlist.insert(0, txt)

    return txtlist
