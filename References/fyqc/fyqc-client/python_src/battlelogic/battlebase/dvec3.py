# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\battlebase\dvec3.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 6214 bytes
from battlelogic.common.defines import FLOAT_MAX
from .dmath import ClampFloat, Clamp01, DEG2RAD, RAD2DEG
import math
from base.protobufdata import BattleCmd_pb2

class CDVec3(object):
    __slots__ = [
     "m_X", "m_Y", "m_Z"]
    K_EPSILON = 1e-05

    def __init__(self, fX=0, fY=0, fZ=0):
        self.m_X = fX
        self.m_Y = fY
        self.m_Z = fZ

    def __repr__(self):
        return "(%.2f,%.2f,%.2f)" % (self.m_X, self.m_Y, self.m_Z)

    def __getitem__(self, index):
        if index == 0:
            return self.m_X
        else:
            if index == 1:
                return self.m_Y
            if index == 2:
                return self.m_Z
            return 0

    def __setitem__(self, index, value):
        if index == 0:
            self.m_X = value
        elif index == 1:
            self.m_Y = value
        elif index == 2:
            self.m_Z = value

    def __str__(self):
        return "(%s, %s, %s)" % (self.m_X, self.m_Y, self.m_Z)

    def __add__(self, oOther):
        return CDVec3(self.m_X + oOther.m_X, self.m_Y + oOther.m_Y, self.m_Z + oOther.m_Z)

    def __radd__(self, oOther):
        return CDVec3(self.m_X + oOther.m_X, self.m_Y + oOther.m_Y, self.m_Z + oOther.m_Z)

    def __sub__(self, oOther):
        return CDVec3(self.m_X - oOther.m_X, self.m_Y - oOther.m_Y, self.m_Z - oOther.m_Z)

    def __rsub__(self, oOther):
        return CDVec3(self.m_X - oOther.m_X, self.m_Y - oOther.m_Y, self.m_Z - oOther.m_Z)

    def __mul__(self, iNum):
        return CDVec3(self.m_X * iNum, self.m_Y * iNum, self.m_Z * iNum)

    def __rmul__(self, iNum):
        return CDVec3(self.m_X * iNum, self.m_Y * iNum, self.m_Z * iNum)

    def __ne__(self, oOther):
        return self.m_X != oOther.m_X or self.m_Y != oOther.m_Y or self.m_Z != oOther.m_Z

    def __eq__(self, oOther):
        return self.m_X == oOther.m_X and self.m_Y == oOther.m_Y and self.m_Z == oOther.m_Z

    def __truediv__(self, iNum):
        return CDVec3(self.m_X / iNum, self.m_Y / iNum, self.m_Z / iNum)

    def __rtruediv__(self, iNum):
        return CDVec3(self.m_X / iNum, self.m_Y / iNum, self.m_Z / iNum)

    def __floordiv__(self, iNum):
        return CDVec3(self.m_X // iNum, self.m_Y // iNum, self.m_Z // iNum)

    @staticmethod
    def Zero():
        return CDVec3(0, 0, 0)

    @staticmethod
    def One():
        return CDVec3(1, 1, 1)

    @staticmethod
    def Up():
        return CDVec3(0, 1, 0)

    @staticmethod
    def Down():
        return CDVec3(0, -1, 0)

    @staticmethod
    def Left():
        return CDVec3(-1, 0, 0)

    @staticmethod
    def Right():
        return CDVec3(1, 0, 0)

    @staticmethod
    def Forward():
        return CDVec3(0, 0, 1)

    @staticmethod
    def Back():
        return CDVec3(0, 0, -1)

    @staticmethod
    def MaxVector():
        return CDVec3(FLOAT_MAX, FLOAT_MAX, FLOAT_MAX)

    @staticmethod
    def GetMagnitude(oVector):
        return math.sqrt(oVector.m_X * oVector.m_X + oVector.m_Y * oVector.m_Y + oVector.m_Z * oVector.m_Z)

    def GetNormalized(self):
        fMag = CDVec3.GetMagnitude(self)
        if fMag > CDVec3.K_EPSILON:
            return self / fMag
        else:
            return CDVec3.Zero()

    def Normalized(self):
        return CDVec3.GetNormalize(self)

    def Magnitude(self):
        return CDVec3.GetMagnitude(self)

    @staticmethod
    def Dot(oLeftVector, oRightVector):
        return oLeftVector.m_X * oRightVector.m_X + oLeftVector.m_Y * oRightVector.m_Y + oLeftVector.m_Z * oRightVector.m_Z

    @staticmethod
    def Angle(oFrom, oTo):
        fDot = ClampFloat(CDVec3.Dot(oFrom.GetNormalized(), oTo.GetNormalized()), -1, 1)
        if abs(fDot) > 1 - CDVec3.K_EPSILON:
            if fDot > 0:
                return 0
            return 180
        else:
            return math.acos(fDot) * RAD2DEG

    @staticmethod
    def SignedAngle(oFrom, oTo, oAxis):
        fVal = CDVec3.Dot(oAxis, CDVec3.Cross(oFrom, oTo))
        if fVal > 0:
            iSign = 1
        else:
            iSign = -1
        return CDVec3.Angle(oFrom, oTo) * iSign

    @staticmethod
    def DirAngle(oDir):
        return math.atan2(oDir.m_X, oDir.m_Z) * RAD2DEG % 360

    @staticmethod
    def Cross(lhs, rhs):
        return CDVec3(lhs.m_Y * rhs.m_Z - lhs.m_Z * rhs.m_Y, lhs.m_Z * rhs.m_X - lhs.m_X * rhs.m_Z, lhs.m_X * rhs.m_Y - lhs.m_Y * rhs.m_X)

    @staticmethod
    def Radian(oFrom, oTo):
        angle = CDVec3.Angle(oFrom, oTo)
        return angle * DEG2RAD

    @staticmethod
    def GetDVec3FromDict(posDict):
        return CDVec3(posDict["X"], posDict["Y"], posDict["Z"])

    @staticmethod
    def GetDVec3FromCmdVec3(oVec3):
        return CDVec3(oVec3.X, oVec3.Y, oVec3.Z)

    def Distance(self, oPos2):
        oVec = self - oPos2
        return math.sqrt(oVec.m_X * oVec.m_X + oVec.m_Y * oVec.m_Y + oVec.m_Z * oVec.m_Z)

    def HorizontalDistance(self, oOther):
        return ((self.m_X - oOther.m_X) ** 2 + (self.m_Z - oOther.m_Z) ** 2) ** 0.5

    def Lerp(self, o, t):
        t = Clamp01(t)
        return CDVec3(self.m_X + (o.m_X - self.m_X) * t, self.m_Y + (o.m_Y - self.m_Y) * t, self.m_Z + (o.m_Z - self.m_Z) * t)

    @staticmethod
    def CopyFrom(oOther):
        return CDVec3(oOther.m_X, oOther.m_Y, oOther.m_Z)

    def Overlap(self, oOther):
        if abs(self.m_X - oOther.m_X) < 20:
            if abs(self.m_Z - oOther.m_Z) < 20:
                return True
        return False


from C_vec3 import CDVec3

def PackFloatVec3(oMsg, oVec3):
    oMsg.X = oVec3.m_X
    oMsg.Y = oVec3.m_Y
    oMsg.Z = oVec3.m_Z


def UnpackFloatVec3(oMsg):
    oVec3 = CDVec3()
    oVec3.m_X = oMsg.X
    oVec3.m_Y = oMsg.Y
    oVec3.m_Z = oMsg.Z
    return oVec3


def PackSintVec3(oMsg, oVec3):
    oMsg.X = int(oVec3.m_X)
    oMsg.Y = int(oVec3.m_Y)
    oMsg.Z = int(oVec3.m_Z)


def UnpackSintVec3(oMsg):
    oVec3 = CDVec3()
    oVec3.m_X = oMsg.X
    oVec3.m_Y = oMsg.Y
    oVec3.m_Z = oMsg.Z
    return oVec3
