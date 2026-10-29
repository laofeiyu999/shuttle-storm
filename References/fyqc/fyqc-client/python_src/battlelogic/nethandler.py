# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\nethandler.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 3476 bytes
from base.protobufdata import BattleCmd_pb2
from battlelogic.common.debug import Profiler, LogWarning, LogError, DevelopOnly
from battlelogic.battlebase.dvec3 import CDVec3, UnpackSintVec3
from . import gmhandler
from battlelogic.common.decorator import NoPrediction

class CNetHandler(object):

    def __init__(self):
        self.InitHandler()

    def InitHandler(self):
        self.m_Handlers = {(BattleCmd_pb2.BATTLE_HIT_MSG): (self.Hit), 
         (BattleCmd_pb2.BATTLE_HIT_DIR_MSG): (self.HitDir), 
         (BattleCmd_pb2.BATTLE_JOYSTICK_DIR_MSG): (self.JoystickDir), 
         (BattleCmd_pb2.BATTLE_GM_COMMAND): (self.GMCommand), 
         (BattleCmd_pb2.BATTLE_ABANDON_EXCHANGE_SKILL_MSG): (self.AbandonExchangeSkill), 
         (BattleCmd_pb2.BATTLE_FIRE_EMOJI): (self.FireEmoji), 
         (BattleCmd_pb2.BATTLE_EXCHANGE_SKILL_SCHEME_MSG): (self.ExchangeSkillScheme), 
         (BattleCmd_pb2.BATTLE_CLIENT_PLAYER_POS_MSG): (self.ClientPlayerPos)}

    @Profiler
    def OnCmd(self, oPlayer, iMsgID, sBuffer):
        if iMsgID not in self.m_Handlers:
            return
        self.m_Handlers[iMsgID](oPlayer, sBuffer)

    @Profiler
    def Hit(self, oPlayer, sBuffer):
        oHitMsg = BattleCmd_pb2.BattleHitMsg()
        oHitMsg.ParseFromString(sBuffer)
        oDir = oHitMsg.Dir
        oHitDir = CDVec3.GetDVec3FromCmdVec3(oDir)
        iHitKey = oHitMsg.HitKey
        oPlayerPos = UnpackSintVec3(oHitMsg.PlayerPos)
        oBadmintonPos = UnpackSintVec3(oHitMsg.BadmintonPos)
        oPlayer.Hit(oHitDir, oHitMsg.HitKey, oHitMsg.HitActionID, UnpackSintVec3(oHitMsg.MoveScale) / 1000, oPlayerPos, oBadmintonPos)
        oPlayer.LogActive()

    @Profiler
    def JoystickDir(self, oPlayer, sBuffer):
        oDirMsg = BattleCmd_pb2.BattleJoystickDirMsg()
        if sBuffer:
            oDirMsg.ParseFromString(sBuffer)
        oPlayer.HandleJoystickDir(oDirMsg.X, 0, oDirMsg.Z)
        oPlayer.LogActive(oDirMsg.X, oDirMsg.Z)

    @DevelopOnly
    def GMCommand(self, oPlayer, sBuffer):
        oMsg = BattleCmd_pb2.BattleGMCommandMsg()
        oMsg.ParseFromString(sBuffer)
        gmhandler.OnCmd(oPlayer, oMsg.Command)

    def HitDir(self, oPlayer, sBuffer):
        oMsg = BattleCmd_pb2.BattleHitDirMsg()
        oMsg.ParseFromString(sBuffer)
        oDir = oMsg.Dir
        oHitDir = CDVec3.GetDVec3FromCmdVec3(oDir)
        oPlayer.m_DoHitAction.m_HitDirMgr.SetLastHitDir(oHitDir)

    def AbandonExchangeSkill(self, oPlayer, sBuffer):
        oPlayer.AbandonExchangeSkill()

    def FireEmoji(self, oPlayer, sBuffer):
        oMsg = BattleCmd_pb2.BattleFireEmojiMsg()
        oMsg.ParseFromString(sBuffer)
        oPlayer.FireEmoji(oMsg.EmojiID)

    def ExchangeSkillScheme(self, oPlayer, sBuffer):
        oMsg = BattleCmd_pb2.BattleExchangeSkillSchemeMsg()
        oMsg.ParseFromString(sBuffer)
        oPlayer.ExchangeSkillScheme(oMsg.SchemeIdx)

    def ClientPlayerPos(self, oPlayer, sBuffer):
        oMsg = BattleCmd_pb2.BattleClientPlayerPosMsg()
        oMsg.ParseFromString(sBuffer)
        oClientPos = UnpackSintVec3(oMsg.PlayerPos)
        oClientLastPos = UnpackSintVec3(oMsg.PlayerLastPos)
        if not hasattr(oPlayer, "m_SmoothMgr"):
            return
        oPlayer.m_SmoothMgr.SetClientPos(oClientPos, oClientLastPos)


if "g_NetHandler" not in globals():
    g_NetHandler = CNetHandler()

def GetNetHandler():
    return g_NetHandler
