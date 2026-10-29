# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\battlebase\dmath.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 2597 bytes
import math
DEG2RAD = math.pi * 2 / 360
RAD2DEG = 1 / DEG2RAD

def ClampFloat(fValue, fMin, fMax):
    if fValue < fMin:
        fValue = fMin
    else:
        if fValue > fMax:
            fValue = fMax
    return fValue


def Clamp01(fValue):
    if fValue < 0.0:
        return 0.0
    else:
        if fValue > 1.0:
            return 1.0
        return fValue


def Lerp(fA, fB, t):
    t = Clamp01(t)
    return fA + (fB - fA) * t


def LineGeneralExpression(x1, y1, x2, y2):
    fA = y2 - y1
    fB = x1 - x2
    fC = x2 * y1 - x1 * y2
    return (fA, fB, fC)


def LineIntersectPoint(x1_1, y1_1, x1_2, y1_2, x2_1, y2_1, x2_2, y2_2):
    fA1, fB1, fC1 = LineGeneralExpression(x1_1, y1_1, x1_2, y1_2)
    fA2, fB2, fC2 = LineGeneralExpression(x2_1, y2_1, x2_2, y2_2)
    m = fA1 * fB2 - fA2 * fB1
    if m == 0:
        return
    else:
        m *= 1.0
        x = (fC2 * fB1 - fC1 * fB2) / m
        y = (fC1 * fA2 - fC2 * fA1) / m
        return (x, y)


def Sign(fValue):
    if fValue < 0:
        return -1
    else:
        if fValue > 0:
            return 1
        return 0


def SymmetricalPointToLine(fA, fB, fC, x1, y1):
    x2 = x1 - 2 * fA * (fA * x1 + fB * y1 + fC) / (fA ** 2 + fB ** 2)
    y2 = y1 - 2 * fB * (fA * x1 + fB * y1 + fC) / (fA ** 2 + fB ** 2)
    return (x2, y2)


def DistanceOfPointToLine(fA, fB, fC, x1, y1):
    fDiv = math.sqrt(fA ** 2 + fB ** 2)
    if fDiv == 0:
        return 0
    else:
        fDistance = abs((fA * x1 + fB * y1 + fC) / fDiv)
        return fDistance
