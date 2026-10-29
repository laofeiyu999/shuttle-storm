# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\plugins\dohitaction\nearhitaction.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 2409 bytes
from battlelogic.common.defines import INT_MAX, NORMAL_HIT_KEY

class CNearHitAction(object):

    def __init__(self, fHeight, fDistance, iHitKey, iRangeDir, bCouldInterrupt):
        self.m_NearHitActionID = 0
        self.m_NearHeight = INT_MAX
        self.m_NearDistance = INT_MAX
        self.m_NearPriority = 0
        self.m_NearDistanceRange = ()
        self.m_NearHeightRange = ()
        self.m_Height = fHeight
        self.m_Distance = fDistance
        self.m_HitKey = iHitKey
        self.m_RangeDir = iRangeDir
        self.m_CouldInterrupt = bCouldInterrupt

    def Calc(self, oBadminton, tHeightRange, tDistanceRange, oHitAction, oActionData):
        if not oBadminton.IsFreeFly():
            return
        else:
            if self.m_HitKey not in NORMAL_HIT_KEY:
                return
            elif oActionData.m_HitAngle:
                if self.m_RangeDir not in oActionData.m_HitAngle:
                    return
                else:
                    if self.m_CouldInterrupt:
                        return
                    else:
                        return oActionData.m_NotCheckPreHitRadio or None
                bSelected = False
                if not self.m_NearHitActionID:
                    fCurNearHeight = max(self.m_Height - tHeightRange[1], tHeightRange[0] - self.m_Height, 0) if tHeightRange else INT_MAX
                    fCurNearDistance = max(self.m_Distance - tDistanceRange[1], tDistanceRange[0] - self.m_Distance, 0) if tDistanceRange else INT_MAX
                    bSelected = True
            elif tDistanceRange == self.m_NearDistanceRange:
                if tHeightRange == self.m_NearHeightRange:
                    if oActionData.m_Priority > self.m_NearPriority:
                        bSelected = True
                elif tHeightRange:
                    fCurNearHeight = max(self.m_Height - tHeightRange[1], tHeightRange[0] - self.m_Height, 0)
                else:
                    fCurNearHeight = INT_MAX
                if tDistanceRange:
                    fCurNearDistance = max(self.m_Distance - tDistanceRange[1], tDistanceRange[0] - self.m_Distance, 0)
            else:
                fCurNearDistance = INT_MAX
            if fCurNearHeight < self.m_NearHeight:
                bSelected = True
            elif fCurNearHeight == self.m_NearHeight:
                if fCurNearDistance <= self.m_NearDistance:
                    bSelected = True
            if bSelected:
                self.m_NearHitActionID = oHitAction.m_ID
                self.m_NearHeight = fCurNearHeight
                self.m_NearDistance = fCurNearDistance
                self.m_NearPriority = oActionData.m_Priority
                self.m_NearHeightRange = tHeightRange
                self.m_NearDistanceRange = tDistanceRange

    def GetNearHitActionID(self):
        return self.m_NearHitActionID
