# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\sceneplugins\gameai\defines.py
# Compiled at: 2023-04-06 17:07:52
# Size of source mod 2**32: 784 bytes
from base.data import GetMatchRuledata
import random
GAME_DIFFICULTY_LEVEL_MAX = 20
GAME_DIFFICULTY_RANGE = 3

def CalcGameAIDifficultyLevel(iElo, iDifficultyFluctuation=0):
    dMatchRuleData = GetMatchRuledata()
    iGameAIEloMin = dMatchRuleData["AIMinElo"]
    iGameAIEloMax = dMatchRuleData["AIMaxElo"]
    iLevel = int(GAME_DIFFICULTY_LEVEL_MAX * (iElo - iGameAIEloMin) / (iGameAIEloMax - iGameAIEloMin))
    iLevelRight = max(1, iLevel + iDifficultyFluctuation)
    if iLevelRight == 1:
        return iLevelRight
    else:
        iLevelLeft = max(1, iLevelRight - GAME_DIFFICULTY_RANGE)
        iLevel = random.randint(iLevelLeft, iLevelRight)
        iLevel = max(1, iLevel)
        iLevel = min(GAME_DIFFICULTY_LEVEL_MAX, iLevel)
        return iLevel
