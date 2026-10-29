# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\bridge.py
# Compiled at: 2023-04-06 17:03:31
# Size of source mod 2**32: 8766 bytes
from base.protobufdata import DCmd_pb2
from base.protobufdata import PyBridgeCmd_pb2
from base.protobufdata import BattleCmd_pb2
from base.protobufdata import Common_pb2
from base.data import GetCourtData
from battlelogic.battlebase.dvec3 import CDVec3
from battlelogic.common.debug import Log, LogWarning, LogError
from C_net import *
import debug, phys, C_data
if "g_Scene" not in globals():
    g_Scene = None

def GetScene():
    global g_Scene
    if not g_Scene:
        g_Scene = phys.Scene()
        oCourtData = GetCourtData(1001)
        dMoveAble = oCourtData.m_MoveableCornerPosDict[2]["MaxPos"]
        iMoveAbleX = dMoveAble["X"]
        iMoveAbleZ = dMoveAble["Z"]
        iNetHeight = oCourtData.m_NetHeight
        iServeFrontZ = oCourtData.m_FrontServeLine
        iServeX = oCourtData.m_SingleQuarterSizeDict["iLength"]
        iServeBackZ = oCourtData.m_SingleQuarterSizeDict["iWidth"]
        g_Scene.InitCourt(iMoveAbleX, iMoveAbleZ, iServeX, iServeFrontZ, iServeBackZ, iNetHeight)
    return g_Scene


def PY2CCurveRes(pointLst, pointTimeList, shapeType):
    oCurveResMsg = PyBridgeCmd_pb2.PyBridgeCurveResMsg()
    oCurveResMsg.ShapeType = shapeType
    for x, y, z in pointLst:
        oCurveResMsg.PosLst.append(CDVec3(x, y, z).PackVec3())

    for fTime in pointTimeList:
        oCurveResMsg.PointTime.append(fTime)

    sBuffer = oCurveResMsg.SerializeToString()
    PacketPrepare(DCmd_pb2.CMD_PY_BRIDGE)
    PacketAddI(PyBridgeCmd_pb2.PY_BRIDGE_CURVE_RES_MSG, 1)
    PacketAddBinaryS(sBuffer, len(sBuffer))
    PacketSend(0)


def PyBridgeCalcNormalCurve(sBuffer):
    oCalcCurveMsg = PyBridgeCmd_pb2.PyBridgeCalcNormalCurveMsg()
    oCalcCurveMsg.ParseFromString(sBuffer)
    oStartPos = CDVec3.UnpackCDVec3(oCalcCurveMsg.BaseData.StartPos)
    oDropPos = CDVec3.UnpackCDVec3(oCalcCurveMsg.BaseData.DropPos)
    iCourtSID = oCalcCurveMsg.BaseData.CourtSID
    fSpeedMul = 1.0
    iCurveId = oCalcCurveMsg.BaseData.ShapeID
    if iCurveId == 0:
        return
    dShapeData = {'shapeId':(oCalcCurveMsg.BaseData).ShapeID, 
     'crossNetFix':(oCalcCurveMsg.BaseData).CrossNetFix, 
     'angle':oCalcCurveMsg.Angle, 
     'fixAmplitude':oCalcCurveMsg.FixAmplitude, 
     'spPerform':oCalcCurveMsg.SpPerform, 
     'minChangeThreshold':oCalcCurveMsg.MinChangeThreshold, 
     'firstHalfSegmentTime':oCalcCurveMsg.FirstHalfSegmentTime, 
     'lastHalfSegmentTime':oCalcCurveMsg.LastHalfSegmentTime, 
     'speedLerpFactor':oCalcCurveMsg.SpeedLerpFactor}
    C_data.Register2OSNormalCurveData({iCurveId: dShapeData})
    oCurve = GetScene().CreateCurve(oStartPos.m_X, oStartPos.m_Y, oStartPos.m_Z, oDropPos.m_X, oDropPos.m_Y, oDropPos.m_Z, iCurveId, fSpeedMul)
    pointLst = oCurve.GetPointList()
    if pointLst is None:
        return
    PY2CCurveRes(pointLst, oCurve.GetPointTimeCache(), iCurveId // 1000)


def PyBridgeCalcTurnAroundCurve(sBuffer):
    oCalcCurveMsg = PyBridgeCmd_pb2.PyBridgeCalcTurnAroundCurveMsg()
    oCalcCurveMsg.ParseFromString(sBuffer)
    oStartPos = CDVec3.UnpackCDVec3(oCalcCurveMsg.normalData.BaseData.StartPos)
    oDropPos = CDVec3.UnpackCDVec3(oCalcCurveMsg.normalData.BaseData.DropPos)
    iCourtSID = oCalcCurveMsg.normalData.BaseData.CourtSID
    fSpeedMul = 1.0
    iCurveId = oCalcCurveMsg.normalData.BaseData.ShapeID
    if iCurveId == 0:
        return
    dShapeData = {'shapeId':(oCalcCurveMsg.normalData.BaseData).ShapeID, 
     'crossNetFix':(oCalcCurveMsg.normalData.BaseData).CrossNetFix, 
     'angle':(oCalcCurveMsg.normalData).Angle, 
     'fixAmplitude':(oCalcCurveMsg.normalData).FixAmplitude, 
     'spPerform':(oCalcCurveMsg.normalData).SpPerform, 
     'minChangeThreshold':(oCalcCurveMsg.normalData).MinChangeThreshold, 
     'firstHalfSegmentTime':(oCalcCurveMsg.normalData).FirstHalfSegmentTime, 
     'lastHalfSegmentTime':(oCalcCurveMsg.normalData).LastHalfSegmentTime, 
     'speedLerpFactor':(oCalcCurveMsg.normalData).SpeedLerpFactor, 
     'offset':oCalcCurveMsg.Offset, 
     'backTime':oCalcCurveMsg.BackTime}
    C_data.Register2OSTurnAroundCurveData({iCurveId: dShapeData})
    oCurve = GetScene().CreateCurve(oStartPos.m_X, oStartPos.m_Y, oStartPos.m_Z, oDropPos.m_X, oDropPos.m_Y, oDropPos.m_Z, iCurveId, fSpeedMul)
    pointLst = oCurve.GetPointList()
    if pointLst is None:
        return
    PY2CCurveRes(pointLst, oCurve.GetPointTimeCache(), iCurveId // 1000)


def PyBridgeCalcParabolaDownCurve(sBuffer):
    oCalcCurveMsg = PyBridgeCmd_pb2.PyBridgeCalcParabolaDownCurveMsg()
    oCalcCurveMsg.ParseFromString(sBuffer)
    oStartPos = CDVec3.UnpackCDVec3(oCalcCurveMsg.BaseData.StartPos)
    oDropPos = CDVec3.UnpackCDVec3(oCalcCurveMsg.BaseData.DropPos)
    iCourtSID = oCalcCurveMsg.BaseData.CourtSID
    fSpeedMul = 1.0
    iCurveId = oCalcCurveMsg.BaseData.ShapeID
    if iCurveId == 0:
        return
    dShapeData = {'shapeId':(oCalcCurveMsg.BaseData).ShapeID, 
     'crossNetFix':oCalcCurveMsg.CrossNetFix, 
     'dropPosFix':oCalcCurveMsg.DropPosFix, 
     'parabolaMinA':oCalcCurveMsg.ParabolaMinA, 
     'parabolaMaxA':oCalcCurveMsg.ParabolaMaxA, 
     'velocity':oCalcCurveMsg.Velocity}
    C_data.Register2OSParabolaDownCurveData({iCurveId: dShapeData})
    oCurve = GetScene().CreateCurve(oStartPos.m_X, oStartPos.m_Y, oStartPos.m_Z, oDropPos.m_X, oDropPos.m_Y, oDropPos.m_Z, iCurveId, fSpeedMul)
    pointLst = oCurve.GetPointList()
    if pointLst is None:
        return
    PY2CCurveRes(pointLst, oCurve.GetPointTimeCache(), iCurveId // 1000)


def PyBridgeCalcFallingCurve(sBuffer):
    oCalcCurveMsg = PyBridgeCmd_pb2.PyBridgeCalcFallingCurveMsg()
    oCalcCurveMsg.ParseFromString(sBuffer)
    oStartPos = CDVec3.UnpackCDVec3(oCalcCurveMsg.BaseData.StartPos)
    oDropPos = CDVec3.UnpackCDVec3(oCalcCurveMsg.BaseData.DropPos)
    iCourtSID = oCalcCurveMsg.BaseData.CourtSID
    fSpeedMul = 1.0
    iCurveId = oCalcCurveMsg.BaseData.ShapeID
    if iCurveId == 0:
        return
    dShapeData = {'shapeId':(oCalcCurveMsg.BaseData).ShapeID, 
     'startHeight':oCalcCurveMsg.StartHeight, 
     'startVelocity':oCalcCurveMsg.StartVelocity, 
     'gravity':oCalcCurveMsg.Gravity}
    C_data.Register2OSFallingCurveData({iCurveId: dShapeData})
    oCurve = GetScene().CreateCurve(oStartPos.m_X, oStartPos.m_Y, oStartPos.m_Z, oDropPos.m_X, oDropPos.m_Y, oDropPos.m_Z, iCurveId, fSpeedMul)
    pointLst = oCurve.GetPointList()
    if pointLst is None:
        return
    PY2CCurveRes(pointLst, oCurve.GetPointTimeCache(), iCurveId // 1000)


def PyBridgeCalcNormalFakeDropCurve(sBuffer):
    oCalcCurveMsg = PyBridgeCmd_pb2.PyBridgeCalcNormalFakeDropCurveMsg()
    oCalcCurveMsg.ParseFromString(sBuffer)
    oStartPos = CDVec3.UnpackCDVec3(oCalcCurveMsg.normalData.BaseData.StartPos)
    oDropPos = CDVec3.UnpackCDVec3(oCalcCurveMsg.normalData.BaseData.DropPos)
    iCourtSID = oCalcCurveMsg.normalData.BaseData.CourtSID
    fSpeedMul = 1.0
    iCurveId = oCalcCurveMsg.normalData.BaseData.ShapeID
    if iCurveId == 0:
        return
    dShapeData = {'shapeId':(oCalcCurveMsg.normalData.BaseData).ShapeID, 
     'crossNetFix':(oCalcCurveMsg.normalData.BaseData).CrossNetFix, 
     'angle':(oCalcCurveMsg.normalData).Angle, 
     'fixAmplitude':(oCalcCurveMsg.normalData).FixAmplitude, 
     'spPerform':(oCalcCurveMsg.normalData).SpPerform, 
     'minChangeThreshold':(oCalcCurveMsg.normalData).MinChangeThreshold, 
     'firstHalfSegmentTime':(oCalcCurveMsg.normalData).FirstHalfSegmentTime, 
     'lastHalfSegmentTime':(oCalcCurveMsg.normalData).LastHalfSegmentTime, 
     'speedLerpFactor':(oCalcCurveMsg.normalData).SpeedLerpFactor, 
     'offset':oCalcCurveMsg.Offset, 
     'backTime':oCalcCurveMsg.BackTime}
    C_data.Register2OSNormalFakeDropCurveData({iCurveId: dShapeData})
    oCurve = GetScene().CreateCurve(oStartPos.m_X, oStartPos.m_Y, oStartPos.m_Z, oDropPos.m_X, oDropPos.m_Y, oDropPos.m_Z, iCurveId, fSpeedMul)
    pointLst = oCurve.GetPointList()
    if pointLst is None:
        return
    PY2CCurveRes(pointLst, oCurve.GetPointTimeCache(), iCurveId // 1000)


g_PyBridgeHandler = {(PyBridgeCmd_pb2.PY_BRIDGE_CALC_NORMAL_CURVE_MSG): PyBridgeCalcNormalCurve, 
 (PyBridgeCmd_pb2.PY_BRIDGE_CALC_TURN_AROUND_CURVE_MSG): PyBridgeCalcTurnAroundCurve, 
 (PyBridgeCmd_pb2.PY_BRIDGE_CALC_PARABOLA_DOWN_CURVE_MSG): PyBridgeCalcParabolaDownCurve, 
 (PyBridgeCmd_pb2.PY_BRIDGE_CALC_FALLING_CURVE_MSG): PyBridgeCalcFallingCurve, 
 (PyBridgeCmd_pb2.PY_BRIDGE_CALC_NORMAL_FAKE_DROP_MSG): PyBridgeCalcNormalFakeDropCurve}

def OnPyBridgeCmd(iMsgID, sBuffer):
    if iMsgID not in g_PyBridgeHandler:
        return
    g_PyBridgeHandler[iMsgID](sBuffer)


g_Handler = {(DCmd_pb2.CMD_PY_BRIDGE): OnPyBridgeCmd}

def OnCmd(lstCmds):
    for iCmdID, iMsgID, sBuffer in lstCmds:
        if iCmdID in g_Handler:
            g_Handler[iCmdID](iMsgID, sBuffer)
