# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\battlebase\dphysics.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 5425 bytes
from .dvec3 import CDVec3
from battlelogic.common.debug import Log

class CDHitInfo(object):

    def __init__(self):
        self.m_HitPoint = CDVec3.Zero()
        self.m_HitObject = None

    def __repr__(self):
        iID = 0
        if self.m_HitObject is not None:
            iID = self.m_HitObject.ID()
        return "hitinfo(hitPoint %s, hitObj %s)" % (self.m_HitPoint, iID)


class CShape:

    def CheckPosInShape(self, oPos):
        return

    def IntersectWithShape(self, oFrom, oDir, fLength):
        return


class CAABB(CShape):

    def __init__(self, dBounds, oPos):
        dCenter = dBounds["center"]
        dExtern = dBounds["extern"]
        fMinX = dCenter["X"] - dExtern["X"]
        fMinY = dCenter["Y"] - dExtern["Y"]
        fMinZ = dCenter["Z"] - dExtern["Z"]
        fMaxX = dCenter["X"] + dExtern["X"]
        fMaxY = dCenter["Y"] + dExtern["Y"]
        fMaxZ = dCenter["Z"] + dExtern["Z"]
        self.m_Pos = oPos
        self.m_Min = CDVec3(fMinX, fMinY, fMinZ)
        self.m_Max = CDVec3(fMaxX, fMaxY, fMaxZ)

    def __repr__(self):
        return "AABB(min %s, max %s)" % (self.m_Min, self.m_Max)

    def CheckPosInShape(self, oPos):
        for d in (0, 1, 2):
            if oPos[d] < self.m_Pos[d] + self.m_Min[d] or oPos[d] > self.m_Pos[d] + self.m_Max[d]:
                return False

        return True

    def IntersectWithShape(self, oFrom, oDir, fLength):
        fMin = 0
        fMax = fLength
        fDirMag = oDir.Magnitude()
        for d in (0, 1, 2):
            if abs(oDir[d]) <= 1e-08:
                if oFrom[d] < self.m_Pos[d] + self.m_Min[d] or oFrom[d] > self.m_Pos[d] + self.m_Max[d]:
                    return (
                     False, fLength)
            else:
                ood = fDirMag / oDir[d]
                t1 = (self.m_Pos[d] + self.m_Min[d] - oFrom[d]) * ood
                t2 = (self.m_Pos[d] + self.m_Max[d] - oFrom[d]) * ood
                if t1 > t2:
                    temp = t1
                    t1 = t2
                    t2 = temp
                if t1 > fMin:
                    fMin = t1
                if t2 < fMax:
                    fMax = t2
                if fMin > fMax:
                    return (
                     False, fLength)

        return (
         True, fMax)


class CCylinder(CShape):

    def __init__(self, oPos, iHeight, iRadius):
        self.m_Pos = oPos
        self.m_Height = iHeight
        self.m_Radius = iRadius

    def CheckPosInShape(self, oPos):
        if oPos.m_Y < self.m_Pos.m_Y or oPos.m_Y > self.m_Pos.m_Y + self.m_Height:
            return False
        else:
            if (oPos.m_X - self.m_Pos.m_X) ** 2 + (oPos.m_Z - self.m_Pos.m_Z) ** 2 > self.m_Radius ** 2:
                return False
            return True

    def GetDetourPassPos(self, obj, oNewPos):
        if oNewPos.m_Y < self.m_Pos.m_Y or oNewPos.m_Y > self.m_Pos.m_Y + self.m_Height:
            return oNewPos
        else:
            fDistance = ((oNewPos.m_X - self.m_Pos.m_X) ** 2 + (oNewPos.m_Z - self.m_Pos.m_Z) ** 2) ** 0.5
            if fDistance >= 2 * self.m_Radius:
                return oNewPos
            oNormalized = (oNewPos - self.m_Pos).GetNormalized()
            oNewPos = self.m_Pos + oNormalized * 2 * self.m_Radius
            if abs(oNewPos.m_X - obj.GetPos().m_X) < 0.01:
                if abs(oNewPos.m_Z - obj.GetPos().m_Z) < 0.01:
                    oNewPos.m_X = obj.GetPos().m_X + oNormalized.m_Z
                    oNewPos.m_Z = obj.GetPos().m_Z + oNormalized.m_X
            return oNewPos


def RayTestObj(oFromPos, oDir, oObj, fLength):
    dBounds = oObj.GetBounds()
    oAABB = CAABB(dBounds, oObj.GetPos())
    if oAABB.CheckPosInShape(oFromPos):
        return True
    else:
        bRes, fLength = oAABB.IntersectWithShape(oFromPos, oDir, fLength)
        return bRes


def RayCast(oScene, oFromObj, oDir, fLength, filterIds, iMemberType):
    if not isinstance(oFromObj, CDVec3):
        filterIds.add(oFromObj.m_ID)
        oFromPos = oFromObj.GetPos()
    else:
        oFromPos = oFromObj
    bIsHit = False
    oHitInfo = CDHitInfo()
    if fLength <= 0:
        return (False, oHitInfo)
    else:
        allObjects = oScene.GetAllTeamPlayer(iMemberType)
        for oObj in allObjects:
            if oObj.m_ID in filterIds:
                pass
            else:
                dBounds = oObj.GetBounds()
                oAABB = CAABB(dBounds, oObj.GetPos())
                if oAABB.CheckPosInShape(oFromPos):
                    oHitInfo.m_HitPoint = oFromPos
                    oHitInfo.m_HitObject = oObj
                    return (True, oHitInfo)
                bRes, fLength = oAABB.IntersectWithShape(oFromPos, oDir, fLength)
                if bRes:
                    bIsHit = True
                    oHitInfo.m_HitPoint = oFromPos + oDir.GetNormalized() * fLength
                    oHitInfo.m_HitObject = oObj

        return (
         bIsHit, oHitInfo)


def GetDetourPassPos(oScene, obj, oNewPos):
    iHeight = 80
    iRadius = 25
    for oObj in oScene.GetAllTeamPlayer(obj.GetMemberType()):
        if obj.m_ID == oObj.m_ID:
            pass
        elif abs(obj.m_Pos.m_X - oObj.m_Pos.m_X) > 2 * iRadius:
            if abs(obj.m_Pos.m_Z - oObj.m_Pos.m_Z) > 2 * iRadius:
                continue
            oShape = CCylinder(oObj.GetPos(), iHeight, iRadius)
            oNewPos = oShape.GetDetourPassPos(obj, oNewPos)

    return oNewPos
