# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\common\debug.py
# Compiled at: 2023-04-06 17:07:52
# Size of source mod 2**32: 2258 bytes
from .logicdelegate import Register
from .defines import IsServer
ENABLE_PROFILER_DECORATOR = True

@Register
def Log(*args):
    return


@Register
def LogWarning(*args):
    return


@Register
def LogError(*args):
    return


@Register
def LogFile(sFileName, sStr):
    return


@Register
def BeginSample(sText):
    return


@Register
def EndSample():
    return


@Register
def DevelopOnly(func):
    return


def Profiler(func):
    if IsServer() or not ENABLE_PROFILER_DECORATOR:
        return func
    else:

        def Wrapper(*args, **dictarg):
            BeginSample(func.__qualname__)
            oRet = func(*args, **dictarg)
            EndSample()
            return oRet

        return Wrapper


def TraceFunc(func):
    iTabCount = 0

    def ProfileFunc(frame, event, arg):
        nonlocal iTabCount
        if event == "call":
            LogWarning("  " * iTabCount + frame.f_code.co_name + "(%s)" % ", ".join([str(frame.f_locals[x]) for x in frame.f_code.co_varnames[:frame.f_code.co_argcount] if x != "self"]))
            iTabCount += 1
        elif event == "return":
            iTabCount -= 1
            LogWarning("  " * iTabCount + "return", arg)
        elif event == "c_call":
            LogWarning("  " * iTabCount + str(arg))
            iTabCount += 1
        elif event == "c_return":
            iTabCount -= 1
            LogWarning("  " * iTabCount + "return")

    def Wrapper(*args, **dicts):
        nonlocal iTabCount
        import sys
        iTabCount = 0
        sys.setprofile(ProfileFunc)
        oRet = func(*args, **dicts)
        sys.setprofile(None)
        return oRet

    return Wrapper
