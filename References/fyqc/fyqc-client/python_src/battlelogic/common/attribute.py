# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\common\attribute.py
# Compiled at: 2023-04-06 17:07:52
# Size of source mod 2**32: 1133 bytes
GAME_ATTRIBUTE = 1

class CAttributeData:

    def __init__(self, dProps):
        self.m_Prop = dProps

    def __getattr__(self, k):
        if k in self.m_Prop:
            return self.m_Prop[k]
        raise RuntimeError("Attribute's sub property not exist")


def Attribute(iName, **dArgs):

    def Func(func):
        if not hasattr(func, "__attribute"):
            func.__attribute = {}
        func.__attribute[iName] = CAttributeData(dArgs)
        return func

    return Func


def GetAttribute(func, iName):
    if not hasattr(func, "__attribute"):
        return
    else:
        return func.__attribute.get(iName, None)
