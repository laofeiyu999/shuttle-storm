# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\clientlogic\badmintonhithint.py
# Compiled at: 2023-04-06 17:03:30
# Size of source mod 2**32: 1811 bytes
from base.protobufdata import BattleCmd_pb2
from battlelogic.common.defines import HITACTION_PREJUDGE_FRAME
from battlelogic.battlebase.dvec3 import CDVec3
from battlelogic.common.debug import Log, LogWarning, LogError, Profiler
from battlelogic.common.defines import BADMINTON_STARMARK_HEIGHT

class CBadmintonHitHint:

    def __init__(self):
        self.m_ShowHint = False
        self.m_LastPos = CDVec3(0, 0, 0)

    @Profiler
    def Update(self, oGame, oPlayer, iFrameNum):
        oBadminton = oGame.m_Scene.GetFirstBadminton()
        if self.CheckShowHint(oGame, oPlayer, oBadminton):
            if not self.m_ShowHint:
                self.m_ShowHint = True
                self.OnBadmintonHitHint(oGame, oBadminton, self.m_ShowHint)
        else:
            if self.m_ShowHint:
                self.m_ShowHint = False
                self.OnBadmintonHitHint(oGame, oBadminton, self.m_ShowHint)
        if oBadminton.m_StarMarkPos.IsZero() or oBadminton.m_Pos.m_Y < self.m_LastPos.m_Y:
            if oBadminton.m_Pos.m_Y < BADMINTON_STARMARK_HEIGHT:
                oBadminton.ResetStarMarkState()
        self.m_LastPos = CDVec3.CopyFrom(oBadminton.m_Pos)

    def CheckShowHint(self, oGame, oPlayer, oBadminton):
        if not oPlayer.m_Scene.m_CurPointServePlayerID:
            return False
        else:
            if not oPlayer.m_DoHitAction.CouldHitBadminton():
                return False
            oBadmintonPos = oBadminton.GetPreJudgePos(HITACTION_PREJUDGE_FRAME)
            oPos = oPlayer.GetPos()
            fDis = oPos.HorizontalDistance(oBadmintonPos)
            if oBadmintonPos.m_Y <= 250:
                if fDis <= 150:
                    return True
            return False

    def OnBadmintonHitHint(self, oGame, oBadminton, bIsShowHint):
        oMsg = BattleCmd_pb2.BadmintonHitHintMsg()
        oMsg.IsShowHint = bIsShowHint
        oGame.m_Scene.AddDelta(BattleCmd_pb2.BATTLE_BADMINTON_HIT_HINT_MSG, oMsg)
