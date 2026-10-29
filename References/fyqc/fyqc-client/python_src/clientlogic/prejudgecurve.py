# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\clientlogic\prejudgecurve.py
# Compiled at: 2023-04-06 17:03:30
# Size of source mod 2**32: 2511 bytes
from battlelogic.common.debug import Log, LogWarning, LogError, Profiler
from battlelogic.common.defines import Frame2Sec
from base.protobufdata import PlayerFrameData_pb2
from battlelogic.config.courtconfig import GetNetHeight

class CPrejudgeCurve:

    def __init__(self):
        self.m_PlayerHitRes = {}
        self.m_PlayerHitArgs = []

    def Clear(self):
        self.m_PlayerHitRes = {}
        self.m_PlayerHitArgs = []

    def SetHitRes(self, iPlayerID, iFrameNum, iActionSID):
        self.m_PlayerHitRes[iPlayerID] = (
         iFrameNum, iActionSID)

    def SetHitArgs(self, oGame, iPlayerID, iHitFrame, oHitArgs):
        if not oHitArgs or not oHitArgs.m_CurveID:
            return
        else:
            oPlayer = oGame.m_Scene.GetObject(iPlayerID)
            if not oPlayer:
                return
            iStartFrame = oGame.m_ServerData.m_FrameNum
            iFrameNum = iStartFrame + iHitFrame + 1
            oHitAction = oPlayer.m_HitActionManager.GetAction(oHitArgs.m_AtkActionSID)
            if oHitAction:
                oHitArgs.m_AtkSkillSID = oHitAction.GetSkillSID()
        self.m_PlayerHitArgs.append((iFrameNum, iPlayerID, oHitArgs))
        self.m_PlayerHitArgs.sort(key=(lambda a: a[0]))

    @Profiler
    def Update(self, oGame, oPlayer, iFrameNum):
        if not self.m_PlayerHitArgs:
            return
        else:
            iHitFrame, iPlayerID, oHitArgs = self.m_PlayerHitArgs[0]
            if iFrameNum < iHitFrame:
                return
            oPlayer = oGame.m_Scene.GetPlayer(iPlayerID)
            iDelta = iFrameNum + 1 - iHitFrame
            oBadminton = oGame.m_Scene.GetFirstBadminton()
            oBadminton.HitBadminton(oHitArgs)
            oBadminton.m_BulletTimeScaleMgr.OnSetBadmintonIsPrejudeHit(False)
            self.m_PlayerHitArgs.pop()
            if oBadminton.m_CurveData:
                iNetHeight = GetNetHeight(oGame.m_Scene.m_CourtSID)
                iMaxFrame = min(iDelta, 5)
                for i in range(iMaxFrame):
                    oPos = oBadminton.GetPreJudgePos(oBadminton.m_CurveData.m_PassTime + i)
                    oNextPos = oBadminton.GetPreJudgePos(oBadminton.m_CurveData.m_PassTime + i + 1)
                    if oPos.m_Z * oNextPos.m_Z <= 0 and oPos.m_Y + abs(oPos.m_Z / (oNextPos.m_Z - oPos.m_Z) * (oNextPos.m_Y - oPos.m_Y)) <= iNetHeight:
                        iDelta = i
                        break

                oBadminton.m_CurveData.AddPassTime(Frame2Sec(iDelta) * oBadminton.m_BulletTimeScaleMgr.m_BulletTimeScale / 100)
            oPlayer.m_HitNum += 1
            oPrediction = oGame.m_Prediction
            if oPlayer.m_ID == oPrediction.m_Owner.m_ID:
                oPrediction.InsertHistoryPack(int(iHitFrame), iFrameNum, PlayerFrameData_pb2.PLAYER_FRAME_DATA_HIT_NUM)
