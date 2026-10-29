# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\bot\agent\common.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 7428 bytes
from base.protobufdata import BattleCmd_pb2
from battlelogic.battlebase.dvec3 import CDVec3
from base.protobufdata import Common_pb2
from base.data import GetCourtData
from battlelogic.battlebase.dmath import SymmetricalPointToLine, LineGeneralExpression, DistanceOfPointToLine
from battlelogic.common.defines import INT_MAX
from battlelogic.config.courtconfig import GetAreaType
from battlelogic.common.defines import MONSTER_TRIGGER_RADIUS
if "g_DefensePosConf" not in globals():
    g_DefensePosConf = {}

def CalcOffset(iMemberType, oTargetPos, iOffsetX, iOffsetZ):
    if iMemberType == Common_pb2.TEAM_MEMBER_TYPE_HOST:
        iOffsetX = -iOffsetX
    else:
        iOffsetZ = -iOffsetZ
    oResPos = CDVec3.Zero()
    oResPos.m_X = oTargetPos.m_X + iOffsetX
    oResPos.m_Z = oTargetPos.m_Z + iOffsetZ
    return oResPos


def GetMoveTargetPos(oControler, oTargetPos, iOffsetX, iOffsetZ):
    oResPos = CalcOffset(oControler.GetMemberType(), oTargetPos, iOffsetX, iOffsetZ)
    oPos = oControler.GetPos()
    if oPos.Overlap(oResPos):
        return CDVec3.Zero()
    else:
        return oResPos


def GetMoveTargetPosOfDrop(oControler, iOffsetX, iOffsetZ):
    oScene = oControler.GetScene()
    if oScene.GetGameState() != BattleCmd_pb2.GAME_STATE_PLAYING:
        return CDVec3.Zero()
    oBadminton = oScene.GetFirstBadminton()
    oDropPos = oBadminton.GetDropPos()
    if oDropPos.IsZero():
        return CDVec3.Zero()
    else:
        iClosestPlayerID = oScene.GetClosestOne(oControler.GetMemberType(), oDropPos)
        if iClosestPlayerID != oControler.m_ID:
            return CDVec3.Zero()
        return GetMoveTargetPos(oControler, oDropPos, iOffsetX, iOffsetZ)


def DoGetDefensePos(iCourtSID, iMemberCount, iMemberType, iPosIndex):
    global g_DefensePosConf
    if iCourtSID not in g_DefensePosConf:
        g_DefensePosConf[iCourtSID] = {}
    else:
        if iMemberCount not in g_DefensePosConf[iCourtSID]:
            g_DefensePosConf[iCourtSID][iMemberCount] = {}
        if iMemberType not in g_DefensePosConf[iCourtSID][iMemberCount]:
            g_DefensePosConf[iCourtSID][iMemberCount][iMemberType] = {}
    if iPosIndex in g_DefensePosConf[iCourtSID][iMemberCount][iMemberType]:
        return g_DefensePosConf[iCourtSID][iMemberCount][iMemberType][iPosIndex]
    else:
        oCourtData = GetCourtData(iCourtSID)
        oTargetPos = CDVec3.Zero()
        if iMemberCount == 2:
            oTargetPos = CDVec3.GetDVec3FromDict(oCourtData.m_ServePosDict[iMemberType][iPosIndex])
        else:
            if iMemberCount == 1:
                iZ = oCourtData.m_SingleQuarterSizeDict["iWidth"] / 2
                if iMemberType == Common_pb2.TEAM_MEMBER_TYPE_HOST:
                    iZ = -iZ
                oTargetPos = CDVec3(0, 0, iZ)
        g_DefensePosConf[iCourtSID][iMemberCount][iMemberType][iPosIndex] = oTargetPos
        return oTargetPos


def GetMoveTargetPosOfDefense(oControler, iOffsetX, iOffsetZ):
    oScene = oControler.GetScene()
    iCourtSID = oScene.GetCourtSID()
    iMemberType = oControler.GetMemberType()
    oTargetPos = CDVec3.Zero()
    allTeamPlayerLst = oScene.GetAllTeamPlayer(iMemberType)
    iMemberCount = len(allTeamPlayerLst)
    iPosIndex = oControler.GetPosIndex()
    oTargetPos = DoGetDefensePos(iCourtSID, iMemberCount, iMemberType, iPosIndex)
    return GetMoveTargetPos(oControler, oTargetPos, iOffsetX, iOffsetZ)


def GetOutTypeOfCloestEnemyMonster(oControler, oScene):
    allEnemyPlayLst = list(oScene.GetAllEnemy(oControler.GetMemberType()))
    oPlayer = allEnemyPlayLst[0]
    oMonster = GetClosestMonster(oPlayer, oScene)
    if not oMonster:
        return BattleCmd_pb2.BADMINTON_OUT_DIR_NONE
    else:
        oMonsterPos = oMonster.GetPos()
        iAreaTypeRes = GetAreaType(oPlayer.GetMemberType(), oMonsterPos)
        iOutType = BattleCmd_pb2.BADMINTON_OUT_DIR_NONE
        if iAreaTypeRes == BattleCmd_pb2.AREA_TYPE_LEFT:
            iOutType = BattleCmd_pb2.BADMINTON_OUT_DIR_LEFT
        else:
            iOutType = BattleCmd_pb2.BADMINTON_OUT_DIR_RIGHT
        return iOutType


def GetClosestPropertyBox(oControler, oScene):
    oControlerPos = oControler.GetPos()
    iMemberType = oControler.GetMemberType()
    allPropertyBox = oScene.GetAllPropertyBox()
    fClosestDistance = INT_MAX
    oClosestPropertyBox = None
    for oPropertyBox in allPropertyBox:
        if oPropertyBox.GetMemberType() != iMemberType:
            pass
        else:
            oPropertyBoxPos = oPropertyBox.GetPos()
            fDistance = oControlerPos.HorizontalDistance(oPropertyBoxPos)
            if fDistance < fClosestDistance:
                fClosestDistance = fDistance
                oClosestPropertyBox = oPropertyBox

    return (
     oClosestPropertyBox, fClosestDistance)


def GetClosestMonster(oControler, oScene):
    oControlerPos = oControler.GetPos()
    allMonster = oScene.GetAllMonster()
    fClosestDistance = INT_MAX
    oClosestMonster = None
    for oMonster in allMonster:
        oMonsterPos = oMonster.GetPos()
        if oControlerPos.m_Z * oMonsterPos.m_Z < 0:
            continue
        fDistance = oControlerPos.HorizontalDistance(oMonsterPos)
        if fDistance < fClosestDistance:
            fClosestDistance = fDistance
            oClosestMonster = oMonster

    return oClosestMonster


def IsAvoidMonster(oControler, oScene, oTargetPos):
    allMonster = oScene.GetAllMonster()
    if not allMonster:
        return False
    oMonster = GetClosestMonster(oControler, oScene)
    if not oMonster:
        return False
    oControlerPos = oControler.GetPos()
    oMonsterPos = oMonster.GetPos()
    oToMonsterDir = oMonsterPos - oControlerPos
    oToTargetPosDir = oTargetPos - oControlerPos
    fAngle = CDVec3.Angle(oToMonsterDir, oToTargetPosDir)
    if fAngle > 90:
        return False
    else:
        fA, fB, fC = LineGeneralExpression(oControlerPos.m_X, oControlerPos.m_Z, oTargetPos.m_X, oTargetPos.m_Z)
        fDistOfMonsterToMoveLine = DistanceOfPointToLine(fA, fB, fC, oMonsterPos.m_X, oMonsterPos.m_Z)
        if fDistOfMonsterToMoveLine > MONSTER_TRIGGER_RADIUS:
            return False
        return True


def GetMoveTargetOfAvoidMonster(oControler, oOldTargetPos, oMonsterPos):
    oControlerPos = oControler.GetPos()
    fA, fB, fC = LineGeneralExpression(oControlerPos.m_X, oControlerPos.m_Z, oOldTargetPos.m_X, oOldTargetPos.m_Z)
    oNewTargetPos = CDVec3.Zero()
    oNewTargetPos.m_X, oNewTargetPos.m_Z = SymmetricalPointToLine(fA, fB, fC, oMonsterPos.m_X, oMonsterPos.m_Z)
    fDistOfMonsterToMoveLine = DistanceOfPointToLine(fA, fB, fC, oMonsterPos.m_X, oMonsterPos.m_Z)
    if fDistOfMonsterToMoveLine < MONSTER_TRIGGER_RADIUS / 2:
        oNewTargetPos.m_X += MONSTER_TRIGGER_RADIUS
        oNewTargetPos.m_Z += MONSTER_TRIGGER_RADIUS
    return oNewTargetPos


def WalkToWithDetour(oControler, oTargetPos):
    oScene = oControler.GetScene()
    if IsAvoidMonster(oControler, oScene, oTargetPos):
        oMonster = GetClosestMonster(oControler, oScene)
        oNewTargetPos = GetMoveTargetOfAvoidMonster(oControler, oTargetPos, oMonster.GetPos())
        oControler.WalkTo(oNewTargetPos.m_X, oNewTargetPos.m_Z)
    else:
        oControler.WalkTo(oTargetPos.m_X, oTargetPos.m_Z)
