# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\base\robot\bot.py
# Compiled at: 2023-04-06 17:07:51
# Size of source mod 2**32: 1043 bytes
from base.data import GetMatchBOTData
from functools import cmp_to_key
import random

def CmdEloDiff(t1, t2):
    return t1[1] - t2[1]


def GetBOTPlayerLst(iNeedAICnt, fAvgElo, iWinRate):
    lstMatch = []
    dMatchAIData = GetMatchBOTData()
    iMatchGroupID = 0
    for iMatchID, dData in dMatchAIData.items():
        if dData["EloDownLimit"] <= fAvgElo:
            if fAvgElo <= dData["EloUpLimit"]:
                if dData["WinRateDownLimit"] <= iWinRate:
                    if iWinRate <= dData["WinRateUpLimit"]:
                        iMatchGroupID = iMatchID
                        break
        lstMatch.append((iMatchID, min((abs(dData["EloUpLimit"] - fAvgElo), abs(dData["EloDownLimit"] - fAvgElo)))))

    if not iMatchGroupID:
        if not lstMatch:
            return []
        lstMatch.sort(key=(cmp_to_key(CmdEloDiff)))
        iMatchGroupID = lstMatch[0][0]
    dData = dMatchAIData[iMatchGroupID]
    if not len(dData["BOTPlayerLst"]):
        return []
    else:
        lstBOTPlayerID = []
        for i in range(iNeedAICnt):
            lstBOTPlayerID.append(random.choice(dData["BOTPlayerLst"]))

        return lstBOTPlayerID
