# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\base\btdata\bt10201.py
# Compiled at: 2023-04-06 17:07:41
# Size of source mod 2**32: 71399 bytes
import battlelogic.bot.agent.a5agent

def Func0(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsServePlayer(oAgent) == True


def Func1(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsGameState(3, oAgent) == True


def Func2(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsInTheArea(5, oAgent) == True


def Func3(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsGameState(4, oAgent) == True


def Func4(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsDefense(oAgent) == True


def Func5(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) <= 400.0


def Func6(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.CouldDoAction(oAgent) == True


def Func7(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.CouldHit(oAgent) == True


def Func8(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsTheCurveShapeType(4, oAgent) == True


def Func9(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) < 5.0


def Func10(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.CouldUseHitKey(4, oAgent) == True


def Func11(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 170.0


def Func12(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) < 50.0


def Func13(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 200.0


def Func14(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.CouldUseHitKey(4, oAgent) == True


def Func15(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsDropPosInFrontBackLine(oAgent) == True


def Func16(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsDropPosInFrontBackLine(oAgent) == True


def Func17(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) < 150.0


def Func18(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 200.0


def Func19(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) >= 150.0


def Func20(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 70.0


def Func21(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsDropPosInFrontBackLine(oAgent) == True


def Func22(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.HasStarMarkArea(oAgent) == True


def Func23(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsAttacker(oAgent) == True


def Func24(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsInTheArea(5, oAgent) == True


data = {'Name':"bt10201", 
 'ID':0, 
 'AgentType':"battlelogic.bot.agent.a5agent", 
 'IsFSM':False, 
 'Ver':27, 
 'Node':[
  {'ID':1, 
   'Class':"IfElse", 
   'Node':[
    {'ID':2, 
     'Class':"And", 
     'Node':[
      {'ID':5, 
       'Class':"Condition", 
       'Method':(
        Func0, ())},
      {'ID':6, 
       'Class':"Condition", 
       'Method':(
        Func1, ())}]},
    {'ID':394, 
     'Class':"Sequence", 
     'Node':[
      {'ID':395, 
       'Class':"IfElse", 
       'Node':[
        {'ID':397, 
         'Class':"Condition", 
         'Method':(
          Func2, ())},
        {'ID':398, 
         'Class':"Sequence", 
         'Node':[
          {'ID':402, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (20, 50)), 
           'ResultOption':0, 
           'ResultFunctor':None},
          {'ID':403, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
           'ResultOption':0, 
           'ResultFunctor':None}]},
        {'ID':399, 
         'Class':"Sequence", 
         'Node':[
          {'ID':404, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (-20, 50)), 
           'ResultOption':0, 
           'ResultFunctor':None},
          {'ID':405, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
           'ResultOption':0, 
           'ResultFunctor':None}]}]},
      {'ID':396, 
       'Class':"SelectorProbability", 
       'RandomGenerator':(
        battlelogic.bot.agent.a5agent.CAgent.Random,
        (0, 100)), 
       'Node':[
        {'ID':400, 
         'Class':"DecoratorWeight", 
         'DecorateWhenChildEnds':False, 
         'Weight':50, 
         'Node':[
          {'ID':406, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
           'ResultOption':0, 
           'ResultFunctor':None}]},
        {'ID':401, 
         'Class':"DecoratorWeight", 
         'DecorateWhenChildEnds':False, 
         'Weight':50, 
         'Node':[
          {'ID':407, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
           'ResultOption':0, 
           'ResultFunctor':None}]}]}]},
    {'ID':4, 
     'Class':"IfElse", 
     'Node':[
      {'ID':7, 
       'Class':"Condition", 
       'Method':(
        Func3, ())},
      {'ID':8, 
       'Class':"IfElse", 
       'Node':[
        {'ID':10, 
         'Class':"Condition", 
         'Method':(
          Func4, ())},
        {'ID':11, 
         'Class':"IfElse", 
         'Node':[
          {'ID':16, 
           'Class':"Condition", 
           'Method':(
            Func5, ())},
          {'ID':17, 
           'Class':"IfElse", 
           'Node':[
            {'ID':26, 
             'Class':"Condition", 
             'Method':(
              Func6, ())},
            {'ID':27, 
             'Class':"IfElse", 
             'Node':[
              {'ID':31, 
               'Class':"Condition", 
               'Method':(
                Func7, ())},
              {'ID':32, 
               'Class':"IfElse", 
               'Node':[
                {'ID':36, 
                 'Class':"Condition", 
                 'Method':(
                  Func8, ())},
                {'ID':37, 
                 'Class':"SelectorProbability", 
                 'RandomGenerator':(
                  battlelogic.bot.agent.a5agent.CAgent.Random,
                  (0, 100)), 
                 'Node':[
                  {'ID':41, 
                   'Class':"DecoratorWeight", 
                   'DecorateWhenChildEnds':False, 
                   'Weight':20, 
                   'Node':[
                    {'ID':46, 
                     'Class':"IfElse", 
                     'Node':[
                      {'ID':54, 
                       'Class':"Condition", 
                       'Method':(
                        Func9, ())},
                      {'ID':55, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                       'ResultOption':0, 
                       'ResultFunctor':None},
                      {'ID':56, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]}]},
                  {'ID':42, 
                   'Class':"DecoratorWeight", 
                   'DecorateWhenChildEnds':False, 
                   'Weight':80, 
                   'Node':[
                    {'ID':166, 
                     'Class':"IfElse", 
                     'Node':[
                      {'ID':167, 
                       'Class':"Condition", 
                       'Method':(
                        Func10, ())},
                      {'ID':241, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (4, 0)), 
                       'ResultOption':0, 
                       'ResultFunctor':None},
                      {'ID':350, 
                       'Class':"IfElse", 
                       'Node':[
                        {'ID':351, 
                         'Class':"Condition", 
                         'Method':(
                          Func11, ())},
                        {'ID':356, 
                         'Class':"SelectorProbability", 
                         'RandomGenerator':(
                          battlelogic.bot.agent.a5agent.CAgent.Random,
                          (0, 100)), 
                         'Node':[
                          {'ID':357, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':15, 
                           'Node':[
                            {'ID':366, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':358, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':16, 
                           'Node':[
                            {'ID':367, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':359, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':15, 
                           'Node':[
                            {'ID':368, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':360, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':9, 
                           'Node':[
                            {'ID':369, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':361, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':9, 
                           'Node':[
                            {'ID':370, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':362, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':9, 
                           'Node':[
                            {'ID':371, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':363, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':9, 
                           'Node':[
                            {'ID':372, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':364, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':9, 
                           'Node':[
                            {'ID':373, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':365, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':9, 
                           'Node':[
                            {'ID':374, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]}]},
                        {'ID':353, 
                         'Class':"Sequence", 
                         'Node':[
                          {'ID':354, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 30)), 
                           'ResultOption':0, 
                           'ResultFunctor':None},
                          {'ID':355, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]}]}]}]}]},
                {'ID':38, 
                 'Class':"IfElse", 
                 'Node':[
                  {'ID':43, 
                   'Class':"Condition", 
                   'Method':(
                    Func12, ())},
                  {'ID':44, 
                   'Class':"IfElse", 
                   'Node':[
                    {'ID':48, 
                     'Class':"Condition", 
                     'Method':(
                      Func13, ())},
                    {'ID':49, 
                     'Class':"SelectorProbability", 
                     'RandomGenerator':(
                      battlelogic.bot.agent.a5agent.CAgent.Random,
                      (0, 100)), 
                     'Node':[
                      {'ID':60, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':30, 
                       'Node':[
                        {'ID':75, 
                         'Class':"IfElse", 
                         'Node':[
                          {'ID':93, 
                           'Class':"Condition", 
                           'Method':(
                            Func14, ())},
                          {'ID':94, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (4, 0)), 
                           'ResultOption':0, 
                           'ResultFunctor':None},
                          {'ID':601, 
                           'Class':"IfElse", 
                           'Node':[
                            {'ID':602, 
                             'Class':"Condition", 
                             'Method':(
                              Func15, ())},
                            {'ID':603, 
                             'Class':"SelectorProbability", 
                             'RandomGenerator':(
                              battlelogic.bot.agent.a5agent.CAgent.Random,
                              (0, 100)), 
                             'Node':[
                              {'ID':605, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':26, 
                               'Node':[
                                {'ID':620, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':606, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':22, 
                               'Node':[
                                {'ID':621, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':607, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':13, 
                               'Node':[
                                {'ID':622, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':608, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':13, 
                               'Node':[
                                {'ID':623, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':609, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':13, 
                               'Node':[
                                {'ID':624, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':610, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':13, 
                               'Node':[
                                {'ID':625, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]}]},
                            {'ID':604, 
                             'Class':"SelectorProbability", 
                             'RandomGenerator':(
                              battlelogic.bot.agent.a5agent.CAgent.Random,
                              (0, 100)), 
                             'Node':[
                              {'ID':611, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':15, 
                               'Node':[
                                {'ID':626, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':612, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':16, 
                               'Node':[
                                {'ID':627, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':613, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':15, 
                               'Node':[
                                {'ID':628, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':614, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':9, 
                               'Node':[
                                {'ID':629, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':615, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':9, 
                               'Node':[
                                {'ID':630, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':616, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':9, 
                               'Node':[
                                {'ID':631, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':617, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':9, 
                               'Node':[
                                {'ID':632, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':618, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':9, 
                               'Node':[
                                {'ID':633, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':619, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':9, 
                               'Node':[
                                {'ID':634, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]}]}]}]}]},
                      {'ID':61, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':70, 
                       'Node':[
                        {'ID':567, 
                         'Class':"IfElse", 
                         'Node':[
                          {'ID':568, 
                           'Class':"Condition", 
                           'Method':(
                            Func16, ())},
                          {'ID':569, 
                           'Class':"SelectorProbability", 
                           'RandomGenerator':(
                            battlelogic.bot.agent.a5agent.CAgent.Random,
                            (0, 100)), 
                           'Node':[
                            {'ID':571, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':26, 
                             'Node':[
                              {'ID':586, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':572, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':22, 
                             'Node':[
                              {'ID':587, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':573, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':13, 
                             'Node':[
                              {'ID':588, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':574, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':13, 
                             'Node':[
                              {'ID':589, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':575, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':13, 
                             'Node':[
                              {'ID':590, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':576, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':13, 
                             'Node':[
                              {'ID':591, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]}]},
                          {'ID':570, 
                           'Class':"SelectorProbability", 
                           'RandomGenerator':(
                            battlelogic.bot.agent.a5agent.CAgent.Random,
                            (0, 100)), 
                           'Node':[
                            {'ID':577, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':15, 
                             'Node':[
                              {'ID':592, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':578, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':16, 
                             'Node':[
                              {'ID':593, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':579, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':15, 
                             'Node':[
                              {'ID':594, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':580, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':9, 
                             'Node':[
                              {'ID':595, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':581, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':9, 
                             'Node':[
                              {'ID':596, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':582, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':9, 
                             'Node':[
                              {'ID':597, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':583, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':9, 
                             'Node':[
                              {'ID':598, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':584, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':9, 
                             'Node':[
                              {'ID':599, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':585, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':9, 
                             'Node':[
                              {'ID':600, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]}]}]}]}]},
                    {'ID':50, 
                     'Class':"Sequence", 
                     'Node':[
                      {'ID':62, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 30)), 
                       'ResultOption':0, 
                       'ResultFunctor':None},
                      {'ID':63, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]}]},
                  {'ID':45, 
                   'Class':"IfElse", 
                   'Node':[
                    {'ID':51, 
                     'Class':"Condition", 
                     'Method':(
                      Func17, ())},
                    {'ID':52, 
                     'Class':"IfElse", 
                     'Node':[
                      {'ID':64, 
                       'Class':"And", 
                       'Node':[
                        {'ID':77, 
                         'Class':"Condition", 
                         'Method':(
                          Func18, ())},
                        {'ID':78, 
                         'Class':"Condition", 
                         'Method':(
                          Func19, ())}]},
                      {'ID':65, 
                       'Class':"SelectorProbability", 
                       'RandomGenerator':(
                        battlelogic.bot.agent.a5agent.CAgent.Random,
                        (0, 100)), 
                       'Node':[
                        {'ID':79, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':30, 
                         'Node':[
                          {'ID':99, 
                           'Class':"SelectorProbability", 
                           'RandomGenerator':(
                            battlelogic.bot.agent.a5agent.CAgent.Random,
                            (0, 100)), 
                           'Node':[
                            {'ID':127, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':25, 
                             'Node':[
                              {'ID':163, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':128, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':50, 
                             'Node':[
                              {'ID':164, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':129, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':25, 
                             'Node':[
                              {'ID':165, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]}]}]},
                        {'ID':80, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':70, 
                         'Node':[
                          {'ID':100, 
                           'Class':"Sequence", 
                           'Node':[
                            {'ID':130, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                             'ResultOption':0, 
                             'ResultFunctor':None},
                            {'ID':131, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]}]}]},
                      {'ID':408, 
                       'Class':"IfElse", 
                       'Node':[
                        {'ID':409, 
                         'Class':"Condition", 
                         'Method':(
                          Func20, ())},
                        {'ID':410, 
                         'Class':"IfElse", 
                         'Node':[
                          {'ID':411, 
                           'Class':"Condition", 
                           'Method':(
                            Func21, ())},
                          {'ID':454, 
                           'Class':"SelectorProbability", 
                           'RandomGenerator':(
                            battlelogic.bot.agent.a5agent.CAgent.Random,
                            (0, 100)), 
                           'Node':[
                            {'ID':455, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':26, 
                             'Node':[
                              {'ID':461, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':456, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':22, 
                             'Node':[
                              {'ID':462, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':457, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':13, 
                             'Node':[
                              {'ID':463, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':458, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':13, 
                             'Node':[
                              {'ID':464, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':459, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':13, 
                             'Node':[
                              {'ID':465, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':460, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':13, 
                             'Node':[
                              {'ID':466, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]}]},
                          {'ID':470, 
                           'Class':"SelectorProbability", 
                           'RandomGenerator':(
                            battlelogic.bot.agent.a5agent.CAgent.Random,
                            (0, 100)), 
                           'Node':[
                            {'ID':471, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':15, 
                             'Node':[
                              {'ID':480, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':472, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':16, 
                             'Node':[
                              {'ID':481, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':473, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':15, 
                             'Node':[
                              {'ID':482, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':474, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':9, 
                             'Node':[
                              {'ID':483, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':475, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':9, 
                             'Node':[
                              {'ID':484, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':476, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':9, 
                             'Node':[
                              {'ID':485, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':477, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':9, 
                             'Node':[
                              {'ID':486, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':478, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':9, 
                             'Node':[
                              {'ID':487, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':479, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':9, 
                             'Node':[
                              {'ID':488, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]}]}]},
                        {'ID':467, 
                         'Class':"Sequence", 
                         'Node':[
                          {'ID':468, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 30)), 
                           'ResultOption':0, 
                           'ResultFunctor':None},
                          {'ID':469, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]}]}]},
                    {'ID':53, 
                     'Class':"Sequence", 
                     'Node':[
                      {'ID':67, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 30)), 
                       'ResultOption':0, 
                       'ResultFunctor':None},
                      {'ID':68, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]}]}]}]},
              {'ID':33, 
               'Class':"Sequence", 
               'Node':[
                {'ID':39, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 30)), 
                 'ResultOption':0, 
                 'ResultFunctor':None},
                {'ID':40, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                 'ResultOption':0, 
                 'ResultFunctor':None}]}]},
            {'ID':28, 
             'Class':"Sequence", 
             'Node':[
              {'ID':34, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 30)), 
               'ResultOption':0, 
               'ResultFunctor':None},
              {'ID':35, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
               'ResultOption':0, 
               'ResultFunctor':None}]}]},
          {'ID':375, 
           'Class':"IfElse", 
           'Node':[
            {'ID':376, 
             'Class':"Condition", 
             'Method':(
              Func22, ())},
            {'ID':377, 
             'Class':"Sequence", 
             'Node':[
              {'ID':379, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
               'ResultOption':0, 
               'ResultFunctor':None},
              {'ID':380, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
               'ResultOption':0, 
               'ResultFunctor':None}]},
            {'ID':378, 
             'Class':"Action", 
             'Method':(
              battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
             'ResultOption':0, 
             'ResultFunctor':None}]}]},
        {'ID':12, 
         'Class':"IfElse", 
         'Node':[
          {'ID':19, 
           'Class':"Condition", 
           'Method':(
            Func23, ())},
          {'ID':343, 
           'Class':"SelectorProbability", 
           'RandomGenerator':(
            battlelogic.bot.agent.a5agent.CAgent.Random,
            (0, 100)), 
           'Node':[
            {'ID':344, 
             'Class':"DecoratorWeight", 
             'DecorateWhenChildEnds':False, 
             'Weight':90, 
             'Node':[
              {'ID':346, 
               'Class':"Sequence", 
               'Node':[
                {'ID':348, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (0, 50)), 
                 'ResultOption':0, 
                 'ResultFunctor':None},
                {'ID':349, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                 'ResultOption':0, 
                 'ResultFunctor':None}]}]},
            {'ID':345, 
             'Class':"DecoratorWeight", 
             'DecorateWhenChildEnds':False, 
             'Weight':10, 
             'Node':[
              {'ID':347, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
               'ResultOption':0, 
               'ResultFunctor':None}]}]},
          {'ID':21, 
           'Class':"Noop"}]}]},
      {'ID':9, 
       'Class':"IfElse", 
       'Node':[
        {'ID':13, 
         'Class':"Condition", 
         'Method':(
          Func24, ())},
        {'ID':14, 
         'Class':"Sequence", 
         'Node':[
          {'ID':22, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (125, 125)), 
           'ResultOption':0, 
           'ResultFunctor':None},
          {'ID':23, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
           'ResultOption':0, 
           'ResultFunctor':None}]},
        {'ID':15, 
         'Class':"Sequence", 
         'Node':[
          {'ID':24, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (-125, 125)), 
           'ResultOption':0, 
           'ResultFunctor':None},
          {'ID':25, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
           'ResultOption':0, 
           'ResultFunctor':None}]}]}]}]}]}
