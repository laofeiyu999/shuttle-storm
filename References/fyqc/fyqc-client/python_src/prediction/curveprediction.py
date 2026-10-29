# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\prediction\curveprediction.py
# Compiled at: 2023-04-06 17:03:30
# Size of source mod 2**32: 4189 bytes
from battlelogic.common.defines import IsServer, Frame2Sec
from base.protobufdata import BattleCmd_pb2
from battlelogic.battlebase.dvec3 import CDVec3
from battlelogic.battlebase.dmath import Lerp
from battlelogic.common.logicdelegate import Register
from battlelogic.common.debug import Log, LogWarning, LogError
from base.data import GetHitActionData
import copy

class CCurvePrediction:

    def __init__(self, oBadminton):
        self.m_Badminton = oBadminton

    def OnServerCurve(self, oMsg):
        oOwner = self.m_Badminton.m_Scene.GetPlayer(oMsg.OwnerID)
        if oOwner:
            self.m_Badminton.SetOwner(oOwner)
        oCurveData = self.m_Badminton.m_CurveData
        if oCurveData:
            if oCurveData.m_OwnerID == oMsg.OwnerID:
                return
        oStartPos = CDVec3.UnpackCDVec3(oMsg.StartPos)
        oDropPos = CDVec3.UnpackCDVec3(oMsg.DropPos)
        if oStartPos.m_Y <= 0:
            oStartPos.m_Y = 0.1
        oCurveData = self.m_Badminton.m_Scene.m_Phys.CreateCurve(oStartPos.m_X, oStartPos.m_Y, oStartPos.m_Z, oDropPos.m_X, oDropPos.m_Y, oDropPos.m_Z, oMsg.CurveID, oMsg.AverageSpeedMul / 10000)
        oCurveData.m_OwnerID = oMsg.OwnerID
        iPassFrame = self.m_Badminton.m_Scene.GetCurFrame() - oMsg.StartFrame
        if iPassFrame < 0:
            iPassFrame = 0
        oCurveData.AddPassTime(Frame2Sec(iPassFrame))
        self.m_Badminton.SetCurveData(oCurveData)
        self.m_Badminton.InitHitData()
        self.m_Badminton.SetSimulateFinished(False)
        self.m_Badminton.SetIsServe(oMsg.IsServe)
        oStartPos = CDVec3()
        oStartPos.UnpackVec3(oMsg.StartPos)
        oDropPos = CDVec3()
        oDropPos.UnpackVec3(oMsg.DropPos)
        oTipsPos = self.m_Badminton.GetTipsPos()
        self.OnHitBadminton(oMsg.HitKey, oMsg.CurveID, oStartPos, oDropPos, oTipsPos)

    def OnHitBadminton(self, iHitKey, iCurveId, oStartPos, oDropPos, oTipsPos):
        iType, dCurveData = self.m_Badminton.GetCurveTypeAndData(iCurveId)
        if iType == BattleCmd_pb2.SHAPE_TYPE_FALLING:
            oStartPos = CDVec3.CopyFrom(oDropPos)
            oStartPos.m_Y = dCurveData["startHeight"]
        else:
            oDelta = BattleCmd_pb2.BattleHitBadmintonMsg()
            oDelta.ID = self.m_Badminton.m_ID
            oDelta.CurveShapeId = iCurveId
            oDelta.HitKey = iHitKey
            oDelta.StartPos = oStartPos.PackVec3()
            oDelta.DropPos = oDropPos.PackVec3()
            oDelta.TipsPos = oTipsPos.PackVec3()
            if self.m_Badminton.m_Owner:
                pid = self.m_Badminton.m_Owner.m_ID
            else:
                pid = 0
        self.m_Badminton.GetScene().AddFrameMsg(pid, BattleCmd_pb2.BATTLE_HIT_BADMINTON_MSG, oDelta)

    def OnServerBodyShot(self, oMsg):
        self.m_Badminton.m_Pos.UnpackVec3(oMsg.Pos)
        if not self.m_Badminton.m_CurveData:
            return
        self.m_Badminton.m_CurveData.m_Hited = True

    def OnServerNetShot(self, oMsg):
        self.m_Badminton.m_Pos.UnpackVec3(oMsg.Pos)
        if not self.m_Badminton.m_CurveData:
            return
        self.m_Badminton.m_CurveData.m_Hited = True

    def OnHitBegin(self, iCurveId):
        oHitArgs = self.m_Badminton.m_HitBadmintonArgs
        iHitKey = self.m_Badminton.GetHitKey()
        oStartPos = self.m_Badminton.GetStartPos()
        oDropPos = self.m_Badminton.GetDropPos()
        oTipsPos = self.m_Badminton.GetTipsPos()
        self.OnHitBadminton(iHitKey, iCurveId, oStartPos, oDropPos, oTipsPos)

    def ExecuteLoop(self, iFrameNum):
        return
        if self.m_Badminton.m_CurveData:
            oCurveData = self.m_Badminton.m_CurveData
            fPassTime = Frame2Sec(self.m_Badminton.GetPassFrame(iFrameNum - 1, iFrameNum))
            oPos = self.GetPointBySecond(oCurveData, fPassTime)
            oCurveData.AddPassTime(fPassTime)
            if oPos != CDVec3.Zero():
                self.m_Badminton.SetPos(oPos)
                self.m_Badminton.OnPosDelta(oPos)

    def GetPointBySecond(self, oCurveData, fPassTime):
        if not oCurveData:
            return CDVec3.Zero()
        else:
            x, y, z = oCurveData.GetPointBySecond(fPassTime)
            return CDVec3(x, y, z)
