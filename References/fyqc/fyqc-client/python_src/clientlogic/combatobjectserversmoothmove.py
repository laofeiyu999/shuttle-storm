# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\clientlogic\combatobjectserversmoothmove.py
# Compiled at: 2023-04-06 17:03:30
# Size of source mod 2**32: 1123 bytes
from base.protobufdata import BattleCmd_pb2
from battlelogic.common.debug import LogError

class CCombatObjectServerSmoothMove:

    def __init__(self):
        self.m_BeginFrame = 0
        self.m_IsSmoothing = False

    def BeginSmooth(self, oGame):
        self.m_BeginFrame = oGame.m_StepFrame.m_FrameNum
        self.m_IsSmoothing = True

    def EndSmooth(self, oGame):
        if oGame.m_ServerFrameNum <= self.m_BeginFrame:
            return
        self.m_IsSmoothing = False

    def Update(self, oGame, oPlayer, iFrameNum):
        if not self.m_IsSmoothing:
            return
        oMsg = BattleCmd_pb2.BattleClientPlayerPosMsg()
        oPreData = oGame.m_Prediction.GetHistoryPack(iFrameNum - 1)
        if oPreData:
            oMsg.PlayerLastPos.X = int(oPreData.Pos.X)
            oMsg.PlayerLastPos.Z = int(oPreData.Pos.Z)
        oPos = oPlayer.GetPos()
        oMsg.PlayerPos.X = int(oPos.m_X)
        oMsg.PlayerPos.Z = int(oPos.m_Z)
        oGame.L2SFrameCmd(iFrameNum, BattleCmd_pb2.BATTLE_CLIENT_PLAYER_POS_MSG, oMsg.SerializeToString())
