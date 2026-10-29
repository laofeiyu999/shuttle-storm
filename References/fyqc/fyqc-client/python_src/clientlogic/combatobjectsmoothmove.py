# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\clientlogic\combatobjectsmoothmove.py
# Compiled at: 2023-04-06 17:03:30
# Size of source mod 2**32: 2038 bytes
from base.protobufdata import BattleCmd_pb2
from battlelogic.common.defines import HITACTION_PREJUDGE_FRAME
from battlelogic.battlebase.dvec3 import CDVec3
from battlelogic.common.debug import Log, LogWarning, LogError, Profiler
from battlelogic.common.defines import FRAME

class CCombatObjectSmoothMove:
    SMOOTH_FRAME = 25

    def __init__(self):
        self.m_SmoothInfo = {}
        self.m_LastPos = {}

    def BeginSmooth(self, oGame, iObjectID, oSrcPos):
        obj = oGame.m_Scene.GetObject(iObjectID)
        if not obj:
            return
        elif iObjectID in self.m_SmoothInfo:
            self.m_SmoothInfo[iObjectID]["Frame"] = self.SMOOTH_FRAME
        else:
            self.m_SmoothInfo[iObjectID] = {'SrcPos':CDVec3.CopyFrom(oSrcPos), 
             'Frame':self.SMOOTH_FRAME}

    def EndSmooth(self, iObjectID):
        if iObjectID in self.m_SmoothInfo:
            del self.m_SmoothInfo[iObjectID]

    @Profiler
    def Update(self, oGame, oPlayer, iFrameNum):
        for iObjectID, x, y, z in oGame.m_Scene.m_Phys.GetMovedControllers():
            obj = oGame.m_Scene.GetObject(iObjectID)
            if obj.GetSceneObjectType() == BattleCmd_pb2.SCENE_OBJECT_TYPE_BADMINTON:
                pass
            else:
                oDesPos = CDVec3(x, y, z)
                if iObjectID in self.m_SmoothInfo:
                    dInfo = self.m_SmoothInfo[iObjectID]
                    oSrcPos = CDVec3.CopyFrom(dInfo["SrcPos"])
                    iDist = oDesPos.HorizontalDistance(oSrcPos)
                    if iDist <= 1 or iDist >= 150:
                        oPos = oDesPos
                        self.EndSmooth(iObjectID)
                    else:
                        fPercent = (self.SMOOTH_FRAME + 1 - dInfo["Frame"]) / self.SMOOTH_FRAME
                        oPos = oSrcPos.Lerp(oDesPos, fPercent)
                        dInfo["Frame"] -= 1
                        if dInfo["Frame"] <= 0:
                            self.EndSmooth(iObjectID)
                        oMoveDir = obj.GetMoveDir()
                        oDelta = oPos - oSrcPos
                        if oMoveDir.m_X * oDelta.m_X < 0:
                            oPos.m_X = oSrcPos.m_X
                        if oMoveDir.m_Z * oDelta.m_Z < 0:
                            oPos.m_Z = oSrcPos.m_Z
                        dInfo["SrcPos"] = oPos
                else:
                    oPos = oDesPos
                obj.OnPosDelta(oPos)
