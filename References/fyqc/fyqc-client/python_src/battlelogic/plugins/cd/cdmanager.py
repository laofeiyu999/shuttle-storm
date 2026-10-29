# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\plugins\cd\cdmanager.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 1489 bytes


class CCDManager(object):

    def __init__(self):
        self.m_CDDict = {}

    def ReplaceCD(self, iSrcID, iEndFrame):
        self.m_CDDict[iSrcID] = iEndFrame

    def IsInCD(self, iSrcID, iCurEffectiveFrame):
        if iSrcID not in self.m_CDDict:
            return False
        else:
            if self.m_CDDict[iSrcID] > iCurEffectiveFrame:
                return True
            return False

    def GetAllValidCD(self, iCurEffectiveFrame):
        allValidCDLst = []
        for iSrcID, iEndFrame in self.m_CDDict.items():
            if iEndFrame <= iCurEffectiveFrame:
                pass
            else:
                allValidCDLst.append((iSrcID, iEndFrame))

        return allValidCDLst

    def GetSrcCD(self, iSrcID, iCurEffectiveFrame):
        if not self.IsInCD(iSrcID, iCurEffectiveFrame):
            return 0
        else:
            return self.m_CDDict[iSrcID]

    def ClearAllCD(self):
        self.m_CDDict = {}

    def GetLeftCD(self, iSrcID, iCurEffectiveFrame):
        if iSrcID not in self.m_CDDict:
            return 0
        else:
            if self.m_CDDict[iSrcID] <= iCurEffectiveFrame:
                return 0
            return self.m_CDDict[iSrcID] - iCurEffectiveFrame
