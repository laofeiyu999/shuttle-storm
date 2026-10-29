# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\sceneplugins\mvpscore\mvpscore.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 9800 bytes
from base.protobufdata import BattleCmd_pb2
from base.data.mvpscore import CalcMVPScore

class CMVPScore(object):

    def __init__(self, oScene):
        self.m_Scene = oScene
        self.m_MVPKeyRecord = {}
        self.m_HitBadmintonRecord = []
        self.m_Winner = 0
        self.m_Assister = 0

    def AddMVPKeyRecord(self, pid, iKey, iValue):
        oPlayer = self.m_Scene.GetPlayer(pid)
        if oPlayer.m_AbnormalStatus:
            return
        iQuarterIdx = self.m_Scene.GetQuarterIndex()
        if iQuarterIdx not in self.m_MVPKeyRecord:
            self.m_MVPKeyRecord[iQuarterIdx] = {}
        dMVPKeyRecord = self.m_MVPKeyRecord[iQuarterIdx]
        if pid not in dMVPKeyRecord:
            dMVPKeyRecord[pid] = {}
        dRecord = dMVPKeyRecord[pid]
        if iKey not in dRecord:
            dRecord[iKey] = 0
        dRecord[iKey] += iValue

    def GetCurQuarterMVPKeyRecord(self, pid, iKey, iQuarterIdx):
        dMVPKeyRecord = self.m_MVPKeyRecord.get(iQuarterIdx, {})
        dRecord = dMVPKeyRecord.get(pid, {})
        return dRecord.get(iKey, 0)

    def GetMVPKeyRecord(self, pid, iKey):
        iRecord = 0
        for iQuarterIdx, dMVPKeyRecord in self.m_MVPKeyRecord.items():
            dRecord = dMVPKeyRecord.get(pid, {})
            iRecord += dRecord.get(iKey, 0)

        return iRecord

    def GetCurQuarterAllMVPKeyRecord(self, iKey, iQuarterIdx):
        iRecord = 0
        dMVPKeyRecord = self.m_MVPKeyRecord.get(iQuarterIdx, {})
        for pid, dRecord in dMVPKeyRecord.items():
            iRecord += dRecord.get(iKey, 0)

        return iRecord

    def GetAllMVPKeyRecord(self, iKey):
        iRecord = 0
        for iQuarterIdx, dMVPKeyRecord in self.m_MVPKeyRecord.items():
            for pid, dRecord in dMVPKeyRecord.items():
                iRecord += dRecord.get(iKey, 0)

        return iRecord

    def GetCQSelfMembersMVPKeyRecord(self, pid, iKey, iQuarterIdx):
        oPlayer = self.m_Scene.GetPlayer(pid)
        iMemberType = oPlayer.GetMemberType()
        iRecord = 0
        dMVPKeyRecord = self.m_MVPKeyRecord.get(iQuarterIdx, {})
        for pid, dRecord in dMVPKeyRecord.items():
            oPlayer = self.m_Scene.GetPlayer(pid)
            if iMemberType != oPlayer.GetMemberType():
                continue
            iRecord += dRecord.get(iKey, 0)

        return iRecord

    def GetSelfMembersMVPKeyRecord(self, pid, iKey):
        oPlayer = self.m_Scene.GetPlayer(pid)
        iMemberType = oPlayer.GetMemberType()
        iRecord = 0
        for iQuarterIdx, dMVPKeyRecord in self.m_MVPKeyRecord.items():
            for pid, dRecord in dMVPKeyRecord.items():
                oPlayer = self.m_Scene.GetPlayer(pid)
                if iMemberType != oPlayer.GetMemberType():
                    continue
                iRecord += dRecord.get(iKey, 0)

        return iRecord

    def GetCQEnemyMVPKeyRecord(self, pid, iKey, iQuarterIdx):
        oPlayer = self.m_Scene.GetPlayer(pid)
        iMemberType = oPlayer.GetMemberType()
        iRecord = 0
        dMVPKeyRecord = self.m_MVPKeyRecord.get(iQuarterIdx, {})
        for pid, dRecord in dMVPKeyRecord.items():
            oPlayer = self.m_Scene.GetPlayer(pid)
            if iMemberType == oPlayer.GetMemberType():
                continue
            iRecord += dRecord.get(iKey, 0)

        return iRecord

    def GetEnemyMVPKeyRecord(self, pid, iKey):
        oPlayer = self.m_Scene.GetPlayer(pid)
        iMemberType = oPlayer.GetMemberType()
        iRecord = 0
        for iQuarterIdx, dMVPKeyRecord in self.m_MVPKeyRecord.items():
            for pid, dRecord in dMVPKeyRecord.items():
                oPlayer = self.m_Scene.GetPlayer(pid)
                if iMemberType == oPlayer.GetMemberType():
                    continue
                iRecord += dRecord.get(iKey, 0)

        return iRecord

    def CalcPlayerMVPScore(self, pid):
        oPlayer = self.m_Scene.GetPlayer(pid)
        return CalcMVPScore(oPlayer, None)

    def CalcCurQuarterPlayerMVPScore(self, pid, iQuarterIdx):
        oPlayer = self.m_Scene.GetPlayer(pid)
        return CalcMVPScore(oPlayer, iQuarterIdx)

    def AddHitBadmintonRecord(self, pid):
        self.m_HitBadmintonRecord.append(pid)

    def OnRoundEnd(self, iScoreTeam):
        self.m_Winner = 0
        self.m_Assister = 0
        for iMaxNum in range(4):
            if not len(self.m_HitBadmintonRecord):
                break
            pid = self.m_HitBadmintonRecord.pop()
            oPlayer = self.m_Scene.GetPlayer(pid)
            if oPlayer.GetMemberType() != iScoreTeam:
                pass
            elif not self.m_Winner:
                self.m_Winner = pid
            else:
                if self.m_Winner != pid:
                    self.m_Assister = pid

        self.m_HitBadmintonRecord = []

    def GetWinner(self):
        return self.m_Winner

    def GetAssister(self):
        return self.m_Assister

    def GetInsideHitScore(self, pid, iQuarterIdx):
        if iQuarterIdx is None:
            iPersonalInsideHit = self.GetMVPKeyRecord(pid, BattleCmd_pb2.BATTLE_MVP_RECORD_INSIDE_HIT)
            iTotalInsideHit = self.GetAllMVPKeyRecord(BattleCmd_pb2.BATTLE_MVP_RECORD_INSIDE_HIT)
        else:
            iPersonalInsideHit = self.GetCurQuarterMVPKeyRecord(pid, BattleCmd_pb2.BATTLE_MVP_RECORD_INSIDE_HIT, iQuarterIdx)
            iTotalInsideHit = self.GetCurQuarterAllMVPKeyRecord(BattleCmd_pb2.BATTLE_MVP_RECORD_INSIDE_HIT, iQuarterIdx)
        iPlayerCnt = self.m_Scene.GetPlayerCnt()
        iDivision = 11 * iTotalInsideHit + 1
        if iDivision == 0:
            iDivision = 1
        return 20 * iPlayerCnt * iPersonalInsideHit / iDivision

    def GetOutsideHitScore(self, pid, iQuarterIdx):
        if iQuarterIdx is None:
            iPersonalOutsideHit = self.GetMVPKeyRecord(pid, BattleCmd_pb2.BATTLE_MVP_RECORD_OUTSIDE_HIT)
            iTotalOutsideHit = self.GetAllMVPKeyRecord(BattleCmd_pb2.BATTLE_MVP_RECORD_OUTSIDE_HIT)
            iPersonalScore = self.GetMVPKeyRecord(pid, BattleCmd_pb2.BATTLE_MVP_RECORD_WIN_SCORE)
            iTotalScore = self.GetAllMVPKeyRecord(BattleCmd_pb2.BATTLE_MVP_RECORD_WIN_SCORE)
        else:
            iPersonalOutsideHit = self.GetCurQuarterMVPKeyRecord(pid, BattleCmd_pb2.BATTLE_MVP_RECORD_OUTSIDE_HIT, iQuarterIdx)
            iTotalOutsideHit = self.GetCurQuarterAllMVPKeyRecord(BattleCmd_pb2.BATTLE_MVP_RECORD_OUTSIDE_HIT, iQuarterIdx)
            iPersonalScore = self.GetCurQuarterMVPKeyRecord(pid, BattleCmd_pb2.BATTLE_MVP_RECORD_WIN_SCORE, iQuarterIdx)
            iTotalScore = self.GetCurQuarterAllMVPKeyRecord(BattleCmd_pb2.BATTLE_MVP_RECORD_WIN_SCORE, iQuarterIdx)
        return 2 * iPersonalScore * iTotalOutsideHit / (iPersonalOutsideHit * iTotalScore + 0.01)

    def GetServeWinScore(self, pid, iQuarterIdx):
        if iQuarterIdx is None:
            iServeWin = self.GetMVPKeyRecord(pid, BattleCmd_pb2.BATTLE_MVP_RECORD_SERVE_WIN)
        else:
            iServeWin = self.GetCurQuarterMVPKeyRecord(pid, BattleCmd_pb2.BATTLE_MVP_RECORD_SERVE_WIN, iQuarterIdx)
        return 0.2 * iServeWin

    def GetCatchServeWinScore(self, pid, iQuarterIdx):
        if iQuarterIdx is None:
            iCatchServeWin = self.GetMVPKeyRecord(pid, BattleCmd_pb2.BATTLE_MVP_RECORD_CATCH_SERVE_WIN)
        else:
            iCatchServeWin = self.GetCurQuarterMVPKeyRecord(pid, BattleCmd_pb2.BATTLE_MVP_RECORD_CATCH_SERVE_WIN, iQuarterIdx)
        return 0.2 * iCatchServeWin

    def GetCatchStarScore(self, pid, iQuarterIdx):
        if iQuarterIdx is None:
            iCatchStar = self.GetMVPKeyRecord(pid, BattleCmd_pb2.BATTLE_MVP_RECORD_CATCH_STAR)
        else:
            iCatchStar = self.GetCurQuarterMVPKeyRecord(pid, BattleCmd_pb2.BATTLE_MVP_RECORD_CATCH_STAR, iQuarterIdx)
        return 0.15 * iCatchStar

    def GetJumpScore(self, pid, iQuarterIdx):
        if iQuarterIdx is None:
            iJump = self.GetMVPKeyRecord(pid, BattleCmd_pb2.BATTLE_MVP_RECORD_JUMP)
        else:
            iJump = self.GetCurQuarterMVPKeyRecord(pid, BattleCmd_pb2.BATTLE_MVP_RECORD_JUMP, iQuarterIdx)
        return 0.2 * iJump

    def GetWinScore(self, pid, iQuarterIdx):
        if iQuarterIdx is None:
            iPersonalScore = self.GetMVPKeyRecord(pid, BattleCmd_pb2.BATTLE_MVP_RECORD_WIN_SCORE)
            iPersonalAssistScore = self.GetMVPKeyRecord(pid, BattleCmd_pb2.BATTLE_MVP_RECORD_ASSIST)
            iTotalScore = self.GetAllMVPKeyRecord(BattleCmd_pb2.BATTLE_MVP_RECORD_WIN_SCORE)
            iTotalAssistScore = self.GetAllMVPKeyRecord(BattleCmd_pb2.BATTLE_MVP_RECORD_ASSIST)
        else:
            iPersonalScore = self.GetCurQuarterMVPKeyRecord(pid, BattleCmd_pb2.BATTLE_MVP_RECORD_WIN_SCORE, iQuarterIdx)
            iPersonalAssistScore = self.GetCurQuarterMVPKeyRecord(pid, BattleCmd_pb2.BATTLE_MVP_RECORD_ASSIST, iQuarterIdx)
            iTotalScore = self.GetCurQuarterAllMVPKeyRecord(BattleCmd_pb2.BATTLE_MVP_RECORD_WIN_SCORE, iQuarterIdx)
            iTotalAssistScore = self.GetCurQuarterAllMVPKeyRecord(BattleCmd_pb2.BATTLE_MVP_RECORD_ASSIST, iQuarterIdx)
        iPlayerCnt = self.m_Scene.GetPlayerCnt()
        iDivision = 1.5 * iTotalScore + iTotalAssistScore
        if iDivision == 0:
            iDivision = 1
        return 4 * iPlayerCnt * (1.5 * iPersonalScore + iPersonalAssistScore) / iDivision

    def GetScoreDifScore(self, pid, iQuarterIdx):
        bWin = False
        oPlayer = self.m_Scene.GetPlayer(pid)
        iMemberType = oPlayer.GetMemberType()
        if iQuarterIdx is None:
            iSelfMemberScore = self.GetSelfMembersMVPKeyRecord(pid, BattleCmd_pb2.BATTLE_MVP_RECORD_WIN_SCORE)
            iEnemyMemberScore = self.GetEnemyMVPKeyRecord(pid, BattleCmd_pb2.BATTLE_MVP_RECORD_WIN_SCORE)
            if self.m_Scene.GetWinTeam() == iMemberType:
                bWin = True
        else:
            iSelfMemberScore = self.GetCQSelfMembersMVPKeyRecord(pid, BattleCmd_pb2.BATTLE_MVP_RECORD_WIN_SCORE, iQuarterIdx)
            iEnemyMemberScore = self.GetCQEnemyMVPKeyRecord(pid, BattleCmd_pb2.BATTLE_MVP_RECORD_WIN_SCORE, iQuarterIdx)
            lstMemberWinQuarterIdx = self.m_Scene.GetMemberWinQuarterIdx(iMemberType)
        if self.m_Scene.GetQuarterIndex() in lstMemberWinQuarterIdx:
            bWin = True
        elif bWin:
            iNumerator = 6
            iMaxScore = 3
        else:
            iNumerator = 4
            iMaxScore = 2
        iScoreDif = abs(iSelfMemberScore - iEnemyMemberScore)
        return min(iNumerator / (iScoreDif + 1), iMaxScore)

    def DoRelease(self):
        self.m_Scene = None
