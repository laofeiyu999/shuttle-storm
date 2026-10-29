# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\common\logicdelegate.py
# Compiled at: 2023-04-06 17:07:52
# Size of source mod 2**32: 1146 bytes
__version__ = "0.0.1"
__all__ = [
 "Register", "Override"]
if "g_Override" not in globals():
    g_Override = {}

def Register(func):
    global g_Override
    return g_Override.get((func.__module__, func.__qualname__), func)


def Override(sRegisterName):

    def _Decorator(func):
        mod = __import__(sRegisterName, fromlist=[
         None])
        sFuncName = func.__name__
        setattr(mod, sFuncName, func)
        g_Override[(sRegisterName, sFuncName)] = func
        return func

    return _Decorator
