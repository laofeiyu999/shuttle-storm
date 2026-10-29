# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\base\btdata\bt10203.py
# Compiled at: 2023-04-06 17:07:41
# Size of source mod 2**32: 82874 bytes
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
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) <= 380.0


def Func6(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.CouldDoAction(oAgent) == True


def Func7(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.CouldHit(oAgent) == True


def Func8(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsTheCurveShapeType(4, oAgent) == True


def Func9(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) < 5.0


def Func10(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 170.0


def Func11(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) < 50.0


def Func12(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 200.0


def Func13(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.CouldUseHitKey(4, oAgent) == True


def Func14(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsInTheArea(5, oAgent) == True


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
    return battlelogic.bot.agent.a5agent.CAgent.CouldUseHitKey(4, oAgent) == True


def Func21(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsInTheArea(5, oAgent) == True


def Func22(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 70.0


def Func23(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsDropPosInFrontBackLine(oAgent) == True


def Func24(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.HasStarMarkArea(oAgent) == True


def Func25(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsAttacker(oAgent) == True


def Func26(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsInTheArea(5, oAgent) == True


data = {'Name':"bt10203", 
 'ID':0, 
 'AgentType':"battlelogic.bot.agent.a5agent", 
 'IsFSM':False, 
 'Ver':14, 
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
    {'ID':263, 
     'Class':"Sequence", 
     'Node':[
      {'ID':264, 
       'Class':"IfElse", 
       'Node':[
        {'ID':266, 
         'Class':"Condition", 
         'Method':(
          Func2, ())},
        {'ID':267, 
         'Class':"Sequence", 
         'Node':[
          {'ID':271, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (20, 50)), 
           'ResultOption':0, 
           'ResultFunctor':None},
          {'ID':272, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
           'ResultOption':0, 
           'ResultFunctor':None}]},
        {'ID':268, 
         'Class':"Sequence", 
         'Node':[
          {'ID':273, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (-20, 50)), 
           'ResultOption':0, 
           'ResultFunctor':None},
          {'ID':274, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
           'ResultOption':0, 
           'ResultFunctor':None}]}]},
      {'ID':265, 
       'Class':"SelectorProbability", 
       'RandomGenerator':(
        battlelogic.bot.agent.a5agent.CAgent.Random,
        (0, 100)), 
       'Node':[
        {'ID':269, 
         'Class':"DecoratorWeight", 
         'DecorateWhenChildEnds':False, 
         'Weight':50, 
         'Node':[
          {'ID':275, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
           'ResultOption':0, 
           'ResultFunctor':None}]},
        {'ID':270, 
         'Class':"DecoratorWeight", 
         'DecorateWhenChildEnds':False, 
         'Weight':50, 
         'Node':[
          {'ID':276, 
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
                {'ID':38, 
                 'Class':"Condition", 
                 'Method':(
                  Func8, ())},
                {'ID':39, 
                 'Class':"SelectorProbability", 
                 'RandomGenerator':(
                  battlelogic.bot.agent.a5agent.CAgent.Random,
                  (0, 100)), 
                 'Node':[
                  {'ID':45, 
                   'Class':"DecoratorWeight", 
                   'DecorateWhenChildEnds':False, 
                   'Weight':20, 
                   'Node':[
                    {'ID':50, 
                     'Class':"IfElse", 
                     'Node':[
                      {'ID':58, 
                       'Class':"Condition", 
                       'Method':(
                        Func9, ())},
                      {'ID':59, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                       'ResultOption':0, 
                       'ResultFunctor':None},
                      {'ID':60, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]}]},
                  {'ID':46, 
                   'Class':"DecoratorWeight", 
                   'DecorateWhenChildEnds':False, 
                   'Weight':80, 
                   'Node':[
                    {'ID':170, 
                     'Class':"IfElse", 
                     'Node':[
                      {'ID':171, 
                       'Class':"Condition", 
                       'Method':(
                        Func10, ())},
                      {'ID':172, 
                       'Class':"SelectorProbability", 
                       'RandomGenerator':(
                        battlelogic.bot.agent.a5agent.CAgent.Random,
                        (0, 100)), 
                       'Node':[
                        {'ID':174, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':15, 
                         'Node':[
                          {'ID':185, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':175, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':16, 
                         'Node':[
                          {'ID':186, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':176, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':15, 
                         'Node':[
                          {'ID':187, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':177, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':9, 
                         'Node':[
                          {'ID':188, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':178, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':9, 
                         'Node':[
                          {'ID':189, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':179, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':9, 
                         'Node':[
                          {'ID':190, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':180, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':9, 
                         'Node':[
                          {'ID':191, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':181, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':9, 
                         'Node':[
                          {'ID':192, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':182, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':9, 
                         'Node':[
                          {'ID':193, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]}]},
                      {'ID':173, 
                       'Class':"Sequence", 
                       'Node':[
                        {'ID':183, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 30)), 
                         'ResultOption':0, 
                         'ResultFunctor':None},
                        {'ID':184, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]}]}]}]},
                {'ID':40, 
                 'Class':"IfElse", 
                 'Node':[
                  {'ID':47, 
                   'Class':"Condition", 
                   'Method':(
                    Func11, ())},
                  {'ID':48, 
                   'Class':"IfElse", 
                   'Node':[
                    {'ID':52, 
                     'Class':"Condition", 
                     'Method':(
                      Func12, ())},
                    {'ID':53, 
                     'Class':"SelectorProbability", 
                     'RandomGenerator':(
                      battlelogic.bot.agent.a5agent.CAgent.Random,
                      (0, 100)), 
                     'Node':[
                      {'ID':64, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':20, 
                       'Node':[
                        {'ID':79, 
                         'Class':"IfElse", 
                         'Node':[
                          {'ID':97, 
                           'Class':"Condition", 
                           'Method':(
                            Func13, ())},
                          {'ID':426, 
                           'Class':"IfElse", 
                           'Node':[
                            {'ID':427, 
                             'Class':"Condition", 
                             'Method':(
                              Func14, ())},
                            {'ID':428, 
                             'Class':"SelectorProbability", 
                             'RandomGenerator':(
                              battlelogic.bot.agent.a5agent.CAgent.Random,
                              (0, 100)), 
                             'Node':[
                              {'ID':431, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':50, 
                               'Node':[
                                {'ID':432, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (4, 1)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':433, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':30, 
                               'Node':[
                                {'ID':434, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (4, 0)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':435, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':20, 
                               'Node':[
                                {'ID':436, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (4, 2)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]}]},
                            {'ID':437, 
                             'Class':"SelectorProbability", 
                             'RandomGenerator':(
                              battlelogic.bot.agent.a5agent.CAgent.Random,
                              (0, 100)), 
                             'Node':[
                              {'ID':438, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':20, 
                               'Node':[
                                {'ID':441, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (4, 1)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':439, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':30, 
                               'Node':[
                                {'ID':442, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (4, 0)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':440, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':50, 
                               'Node':[
                                {'ID':443, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (4, 2)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]}]}]},
                          {'ID':392, 
                           'Class':"IfElse", 
                           'Node':[
                            {'ID':393, 
                             'Class':"Condition", 
                             'Method':(
                              Func15, ())},
                            {'ID':394, 
                             'Class':"SelectorProbability", 
                             'RandomGenerator':(
                              battlelogic.bot.agent.a5agent.CAgent.Random,
                              (0, 100)), 
                             'Node':[
                              {'ID':396, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':26, 
                               'Node':[
                                {'ID':411, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':397, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':22, 
                               'Node':[
                                {'ID':412, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':398, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':13, 
                               'Node':[
                                {'ID':413, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':399, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':13, 
                               'Node':[
                                {'ID':414, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':400, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':13, 
                               'Node':[
                                {'ID':415, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':401, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':13, 
                               'Node':[
                                {'ID':416, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]}]},
                            {'ID':395, 
                             'Class':"SelectorProbability", 
                             'RandomGenerator':(
                              battlelogic.bot.agent.a5agent.CAgent.Random,
                              (0, 100)), 
                             'Node':[
                              {'ID':402, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':15, 
                               'Node':[
                                {'ID':417, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':403, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':16, 
                               'Node':[
                                {'ID':418, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':404, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':15, 
                               'Node':[
                                {'ID':419, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':405, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':9, 
                               'Node':[
                                {'ID':420, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':406, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':9, 
                               'Node':[
                                {'ID':421, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':407, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':9, 
                               'Node':[
                                {'ID':422, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':408, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':9, 
                               'Node':[
                                {'ID':423, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':409, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':9, 
                               'Node':[
                                {'ID':424, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':410, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':9, 
                               'Node':[
                                {'ID':425, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]}]}]}]}]},
                      {'ID':65, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':80, 
                       'Node':[
                        {'ID':358, 
                         'Class':"IfElse", 
                         'Node':[
                          {'ID':359, 
                           'Class':"Condition", 
                           'Method':(
                            Func16, ())},
                          {'ID':360, 
                           'Class':"SelectorProbability", 
                           'RandomGenerator':(
                            battlelogic.bot.agent.a5agent.CAgent.Random,
                            (0, 100)), 
                           'Node':[
                            {'ID':362, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':26, 
                             'Node':[
                              {'ID':377, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':363, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':22, 
                             'Node':[
                              {'ID':378, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':364, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':13, 
                             'Node':[
                              {'ID':379, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':365, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':13, 
                             'Node':[
                              {'ID':380, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':366, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':13, 
                             'Node':[
                              {'ID':381, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':367, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':13, 
                             'Node':[
                              {'ID':382, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]}]},
                          {'ID':361, 
                           'Class':"SelectorProbability", 
                           'RandomGenerator':(
                            battlelogic.bot.agent.a5agent.CAgent.Random,
                            (0, 100)), 
                           'Node':[
                            {'ID':368, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':15, 
                             'Node':[
                              {'ID':383, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':369, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':16, 
                             'Node':[
                              {'ID':384, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':370, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':15, 
                             'Node':[
                              {'ID':385, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':371, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':9, 
                             'Node':[
                              {'ID':386, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':372, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':9, 
                             'Node':[
                              {'ID':387, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':373, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':9, 
                             'Node':[
                              {'ID':388, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':374, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':9, 
                             'Node':[
                              {'ID':389, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':375, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':9, 
                             'Node':[
                              {'ID':390, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':376, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':9, 
                             'Node':[
                              {'ID':391, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]}]}]}]}]},
                    {'ID':54, 
                     'Class':"Sequence", 
                     'Node':[
                      {'ID':66, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                       'ResultOption':0, 
                       'ResultFunctor':None},
                      {'ID':67, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]}]},
                  {'ID':49, 
                   'Class':"IfElse", 
                   'Node':[
                    {'ID':55, 
                     'Class':"Condition", 
                     'Method':(
                      Func17, ())},
                    {'ID':56, 
                     'Class':"IfElse", 
                     'Node':[
                      {'ID':68, 
                       'Class':"And", 
                       'Node':[
                        {'ID':81, 
                         'Class':"Condition", 
                         'Method':(
                          Func18, ())},
                        {'ID':82, 
                         'Class':"Condition", 
                         'Method':(
                          Func19, ())}]},
                      {'ID':69, 
                       'Class':"SelectorProbability", 
                       'RandomGenerator':(
                        battlelogic.bot.agent.a5agent.CAgent.Random,
                        (0, 100)), 
                       'Node':[
                        {'ID':83, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':20, 
                         'Node':[
                          {'ID':103, 
                           'Class':"SelectorProbability", 
                           'RandomGenerator':(
                            battlelogic.bot.agent.a5agent.CAgent.Random,
                            (0, 100)), 
                           'Node':[
                            {'ID':131, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':25, 
                             'Node':[
                              {'ID':167, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':132, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':50, 
                             'Node':[
                              {'ID':168, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':133, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':25, 
                             'Node':[
                              {'ID':169, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]}]}]},
                        {'ID':84, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':80, 
                         'Node':[
                          {'ID':244, 
                           'Class':"IfElse", 
                           'Node':[
                            {'ID':245, 
                             'Class':"Condition", 
                             'Method':(
                              Func20, ())},
                            {'ID':444, 
                             'Class':"IfElse", 
                             'Node':[
                              {'ID':445, 
                               'Class':"Condition", 
                               'Method':(
                                Func21, ())},
                              {'ID':446, 
                               'Class':"SelectorProbability", 
                               'RandomGenerator':(
                                battlelogic.bot.agent.a5agent.CAgent.Random,
                                (0, 100)), 
                               'Node':[
                                {'ID':448, 
                                 'Class':"DecoratorWeight", 
                                 'DecorateWhenChildEnds':False, 
                                 'Weight':50, 
                                 'Node':[
                                  {'ID':454, 
                                   'Class':"Action", 
                                   'Method':(
                                    battlelogic.bot.agent.a5agent.CAgent.Hit, (4, 1)), 
                                   'ResultOption':0, 
                                   'ResultFunctor':None}]},
                                {'ID':449, 
                                 'Class':"DecoratorWeight", 
                                 'DecorateWhenChildEnds':False, 
                                 'Weight':30, 
                                 'Node':[
                                  {'ID':455, 
                                   'Class':"Action", 
                                   'Method':(
                                    battlelogic.bot.agent.a5agent.CAgent.Hit, (4, 0)), 
                                   'ResultOption':0, 
                                   'ResultFunctor':None}]},
                                {'ID':450, 
                                 'Class':"DecoratorWeight", 
                                 'DecorateWhenChildEnds':False, 
                                 'Weight':20, 
                                 'Node':[
                                  {'ID':456, 
                                   'Class':"Action", 
                                   'Method':(
                                    battlelogic.bot.agent.a5agent.CAgent.Hit, (4, 2)), 
                                   'ResultOption':0, 
                                   'ResultFunctor':None}]}]},
                              {'ID':447, 
                               'Class':"SelectorProbability", 
                               'RandomGenerator':(
                                battlelogic.bot.agent.a5agent.CAgent.Random,
                                (0, 100)), 
                               'Node':[
                                {'ID':451, 
                                 'Class':"DecoratorWeight", 
                                 'DecorateWhenChildEnds':False, 
                                 'Weight':20, 
                                 'Node':[
                                  {'ID':457, 
                                   'Class':"Action", 
                                   'Method':(
                                    battlelogic.bot.agent.a5agent.CAgent.Hit, (4, 1)), 
                                   'ResultOption':0, 
                                   'ResultFunctor':None}]},
                                {'ID':452, 
                                 'Class':"DecoratorWeight", 
                                 'DecorateWhenChildEnds':False, 
                                 'Weight':30, 
                                 'Node':[
                                  {'ID':458, 
                                   'Class':"Action", 
                                   'Method':(
                                    battlelogic.bot.agent.a5agent.CAgent.Hit, (4, 0)), 
                                   'ResultOption':0, 
                                   'ResultFunctor':None}]},
                                {'ID':453, 
                                 'Class':"DecoratorWeight", 
                                 'DecorateWhenChildEnds':False, 
                                 'Weight':50, 
                                 'Node':[
                                  {'ID':459, 
                                   'Class':"Action", 
                                   'Method':(
                                    battlelogic.bot.agent.a5agent.CAgent.Hit, (4, 2)), 
                                   'ResultOption':0, 
                                   'ResultFunctor':None}]}]}]},
                            {'ID':247, 
                             'Class':"Sequence", 
                             'Node':[
                              {'ID':248, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                               'ResultOption':0, 
                               'ResultFunctor':None},
                              {'ID':249, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]}]}]}]},
                      {'ID':277, 
                       'Class':"IfElse", 
                       'Node':[
                        {'ID':278, 
                         'Class':"Condition", 
                         'Method':(
                          Func22, ())},
                        {'ID':279, 
                         'Class':"IfElse", 
                         'Node':[
                          {'ID':280, 
                           'Class':"Condition", 
                           'Method':(
                            Func23, ())},
                          {'ID':326, 
                           'Class':"SelectorProbability", 
                           'RandomGenerator':(
                            battlelogic.bot.agent.a5agent.CAgent.Random,
                            (0, 100)), 
                           'Node':[
                            {'ID':327, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':26, 
                             'Node':[
                              {'ID':333, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':328, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':22, 
                             'Node':[
                              {'ID':334, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':329, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':13, 
                             'Node':[
                              {'ID':335, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':330, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':13, 
                             'Node':[
                              {'ID':336, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':331, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':13, 
                             'Node':[
                              {'ID':337, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':332, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':13, 
                             'Node':[
                              {'ID':338, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]}]},
                          {'ID':339, 
                           'Class':"SelectorProbability", 
                           'RandomGenerator':(
                            battlelogic.bot.agent.a5agent.CAgent.Random,
                            (0, 100)), 
                           'Node':[
                            {'ID':340, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':15, 
                             'Node':[
                              {'ID':349, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':341, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':16, 
                             'Node':[
                              {'ID':350, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':342, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':15, 
                             'Node':[
                              {'ID':351, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':343, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':9, 
                             'Node':[
                              {'ID':352, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':344, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':9, 
                             'Node':[
                              {'ID':353, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':345, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':9, 
                             'Node':[
                              {'ID':354, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':346, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':9, 
                             'Node':[
                              {'ID':355, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':347, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':9, 
                             'Node':[
                              {'ID':356, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':348, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':9, 
                             'Node':[
                              {'ID':357, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]}]}]},
                        {'ID':323, 
                         'Class':"Sequence", 
                         'Node':[
                          {'ID':324, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 30)), 
                           'ResultOption':0, 
                           'ResultFunctor':None},
                          {'ID':325, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]}]}]},
                    {'ID':57, 
                     'Class':"Sequence", 
                     'Node':[
                      {'ID':71, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                       'ResultOption':0, 
                       'ResultFunctor':None},
                      {'ID':72, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]}]}]}]},
              {'ID':33, 
               'Class':"Sequence", 
               'Node':[
                {'ID':41, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                 'ResultOption':0, 
                 'ResultFunctor':None},
                {'ID':42, 
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
                battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
               'ResultOption':0, 
               'ResultFunctor':None},
              {'ID':35, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
               'ResultOption':0, 
               'ResultFunctor':None}]}]},
          {'ID':194, 
           'Class':"IfElse", 
           'Node':[
            {'ID':195, 
             'Class':"Condition", 
             'Method':(
              Func24, ())},
            {'ID':196, 
             'Class':"Sequence", 
             'Node':[
              {'ID':198, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
               'ResultOption':0, 
               'ResultFunctor':None},
              {'ID':199, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
               'ResultOption':0, 
               'ResultFunctor':None}]},
            {'ID':197, 
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
            Func25, ())},
          {'ID':20, 
           'Class':"SelectorProbability", 
           'RandomGenerator':(
            battlelogic.bot.agent.a5agent.CAgent.Random,
            (0, 100)), 
           'Node':[
            {'ID':29, 
             'Class':"DecoratorWeight", 
             'DecorateWhenChildEnds':False, 
             'Weight':80, 
             'Node':[
              {'ID':36, 
               'Class':"Sequence", 
               'Node':[
                {'ID':43, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (0, 50)), 
                 'ResultOption':0, 
                 'ResultFunctor':None},
                {'ID':44, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                 'ResultOption':0, 
                 'ResultFunctor':None}]}]},
            {'ID':30, 
             'Class':"DecoratorWeight", 
             'DecorateWhenChildEnds':False, 
             'Weight':20, 
             'Node':[
              {'ID':37, 
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
          Func26, ())},
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
