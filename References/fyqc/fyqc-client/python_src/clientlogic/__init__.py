# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\clientlogic\__init__.py
# Compiled at: 2023-04-06 17:03:30
# Size of source mod 2**32: 1257 bytes
from .badmintonhithint import CBadmintonHitHint
from .badmintonsmoothmove import CBadmintonSmoothMove
from .combatobjectsmoothmove import CCombatObjectSmoothMove
from .curvedropposhandler import CCurveDropPosHandler
from .prejudgecurve import CPrejudgeCurve
from .combatobjectserversmoothmove import CCombatObjectServerSmoothMove

class CClientLogic:

    def __init__(self):
        self.m_BadmintonHintHit = CBadmintonHitHint()
        self.m_BadmintonSmoothMove = CBadmintonSmoothMove()
        self.m_CombatObjectSmoothMove = CCombatObjectSmoothMove()
        self.m_CurveDropPosHandler = CCurveDropPosHandler()
        self.m_PrejudgeCurve = CPrejudgeCurve()
        self.m_CombatObjectServerSmoothMove = CCombatObjectServerSmoothMove()

    def Update(self, oGame, iFrameNum):
        oPlayer = oGame.m_Scene.GetPlayer(oGame.m_HeroId)
        self.m_BadmintonHintHit.Update(oGame, oPlayer, iFrameNum)
        self.m_BadmintonSmoothMove.Update(oGame, oPlayer, iFrameNum)
        self.m_CombatObjectSmoothMove.Update(oGame, oPlayer, iFrameNum)
        self.m_CurveDropPosHandler.Update(oGame, oPlayer, iFrameNum)
        self.m_PrejudgeCurve.Update(oGame, oPlayer, iFrameNum)
        self.m_CombatObjectServerSmoothMove.Update(oGame, oPlayer, iFrameNum)
