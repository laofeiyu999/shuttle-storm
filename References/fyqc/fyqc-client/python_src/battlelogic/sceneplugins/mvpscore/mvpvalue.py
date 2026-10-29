# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\sceneplugins\mvpscore\mvpvalue.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 3036 bytes


def GetPersonalMVPRecordByKey(oObject, iKey):
    oScene = oObject.GetScene()
    return oScene.m_MVPScore.GetMVPKeyRecord(oObject.m_ID, iKey)


def GetAllMVPRecordByKey(oObject, iKey):
    oScene = oObject.GetScene()
    return oScene.m_MVPScore.GetAllMVPKeyRecord(iKey)


def GetSelfMembersMVPRecordByKey(oObject, iKey):
    oScene = oObject.GetScene()
    return oScene.m_MVPScore.GetSelfMembersMVPKeyRecord(oObject.m_ID, iKey)


def GetEnemyMVPRecordByKey(oObject, iKey):
    oScene = oObject.GetScene()
    return oScene.m_MVPScore.GetEnemyMVPKeyRecord(oObject.m_ID, iKey)


def GetPlayerCnt(oObject):
    oScene = oObject.GetScene()
    return oScene.GetPlayerCnt()


def GetInsideHitScore(oObject, iQuarterIdx):
    oScene = oObject.GetScene()
    return oScene.m_MVPScore.GetInsideHitScore(oObject.m_ID, iQuarterIdx)


def GetOutsideHitScore(oObject, iQuarterIdx):
    oScene = oObject.GetScene()
    return oScene.m_MVPScore.GetOutsideHitScore(oObject.m_ID, iQuarterIdx)


def GetServeWinScore(oObject, iQuarterIdx):
    oScene = oObject.GetScene()
    return oScene.m_MVPScore.GetServeWinScore(oObject.m_ID, iQuarterIdx)


def GetCatchServeWinScore(oObject, iQuarterIdx):
    oScene = oObject.GetScene()
    return oScene.m_MVPScore.GetCatchServeWinScore(oObject.m_ID, iQuarterIdx)


def GetCatchStarScore(oObject, iQuarterIdx):
    oScene = oObject.GetScene()
    return oScene.m_MVPScore.GetCatchStarScore(oObject.m_ID, iQuarterIdx)


def GetJumpScore(oObject, iQuarterIdx):
    oScene = oObject.GetScene()
    return oScene.m_MVPScore.GetJumpScore(oObject.m_ID, iQuarterIdx)


def GetWinScore(oObject, iQuarterIdx):
    oScene = oObject.GetScene()
    return oScene.m_MVPScore.GetWinScore(oObject.m_ID, iQuarterIdx)


def GetScoreDifScore(oObject, iQuarterIdx):
    oScene = oObject.GetScene()
    return oScene.m_MVPScore.GetScoreDifScore(oObject.m_ID, iQuarterIdx)
