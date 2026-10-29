# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\base\btdata\bt10202.py
# Compiled at: 2023-04-06 17:07:41
# Size of source mod 2**32: 46879 bytes
import battlelogic.bot.agent.a5agent

def Func0(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsServePlayer(oAgent) == True


def Func1(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsGameState(3, oAgent) == True


def Func2(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsGameState(4, oAgent) == True


def Func3(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsDefense(oAgent) == True


def Func4(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) <= 350.0


def Func5(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.CouldDoAction(oAgent) == True


def Func6(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.CouldHit(oAgent) == True


def Func7(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsTheCurveShapeType(4, oAgent) == True


def Func8(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) < 5.0


def Func9(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 170.0


def Func10(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) < 50.0


def Func11(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 200.0


def Func12(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) < 150.0


def Func13(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 200.0


def Func14(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) >= 150.0


def Func15(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsDropPosInFrontBackLine(oAgent) == True


def Func16(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 70.0


def Func17(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 70.0


def Func18(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.HasStarMarkArea(oAgent) == True


def Func19(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsAttacker(oAgent) == True


def Func20(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsInTheArea(5, oAgent) == True


data = {'Name':"bt10202", 
 'ID':0, 
 'AgentType':"battlelogic.bot.agent.a5agent", 
 'IsFSM':False, 
 'Ver':6, 
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
    {'ID':3, 
     'Class':"Action", 
     'Method':(
      battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
     'ResultOption':0, 
     'ResultFunctor':None},
    {'ID':4, 
     'Class':"IfElse", 
     'Node':[
      {'ID':7, 
       'Class':"Condition", 
       'Method':(
        Func2, ())},
      {'ID':8, 
       'Class':"IfElse", 
       'Node':[
        {'ID':10, 
         'Class':"Condition", 
         'Method':(
          Func3, ())},
        {'ID':11, 
         'Class':"IfElse", 
         'Node':[
          {'ID':16, 
           'Class':"Condition", 
           'Method':(
            Func4, ())},
          {'ID':17, 
           'Class':"IfElse", 
           'Node':[
            {'ID':26, 
             'Class':"Condition", 
             'Method':(
              Func5, ())},
            {'ID':27, 
             'Class':"IfElse", 
             'Node':[
              {'ID':31, 
               'Class':"Condition", 
               'Method':(
                Func6, ())},
              {'ID':32, 
               'Class':"IfElse", 
               'Node':[
                {'ID':38, 
                 'Class':"Condition", 
                 'Method':(
                  Func7, ())},
                {'ID':147, 
                 'Class':"SelectorProbability", 
                 'RandomGenerator':(
                  battlelogic.bot.agent.a5agent.CAgent.Random,
                  (0, 100)), 
                 'Node':[
                  {'ID':148, 
                   'Class':"DecoratorWeight", 
                   'DecorateWhenChildEnds':False, 
                   'Weight':30, 
                   'Node':[
                    {'ID':150, 
                     'Class':"IfElse", 
                     'Node':[
                      {'ID':152, 
                       'Class':"Condition", 
                       'Method':(
                        Func8, ())},
                      {'ID':153, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                       'ResultOption':0, 
                       'ResultFunctor':None},
                      {'ID':154, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]}]},
                  {'ID':149, 
                   'Class':"DecoratorWeight", 
                   'DecorateWhenChildEnds':False, 
                   'Weight':70, 
                   'Node':[
                    {'ID':155, 
                     'Class':"IfElse", 
                     'Node':[
                      {'ID':156, 
                       'Class':"Condition", 
                       'Method':(
                        Func9, ())},
                      {'ID':157, 
                       'Class':"SelectorProbability", 
                       'RandomGenerator':(
                        battlelogic.bot.agent.a5agent.CAgent.Random,
                        (0, 100)), 
                       'Node':[
                        {'ID':159, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':15, 
                         'Node':[
                          {'ID':170, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':160, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':16, 
                         'Node':[
                          {'ID':171, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':161, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':15, 
                         'Node':[
                          {'ID':172, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':162, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':9, 
                         'Node':[
                          {'ID':173, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':163, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':9, 
                         'Node':[
                          {'ID':174, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':164, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':9, 
                         'Node':[
                          {'ID':175, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':165, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':9, 
                         'Node':[
                          {'ID':176, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':166, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':9, 
                         'Node':[
                          {'ID':177, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':167, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':9, 
                         'Node':[
                          {'ID':178, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]}]},
                      {'ID':158, 
                       'Class':"Sequence", 
                       'Node':[
                        {'ID':168, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 30)), 
                         'ResultOption':0, 
                         'ResultFunctor':None},
                        {'ID':169, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]}]}]}]},
                {'ID':40, 
                 'Class':"IfElse", 
                 'Node':[
                  {'ID':48, 
                   'Class':"Condition", 
                   'Method':(
                    Func10, ())},
                  {'ID':49, 
                   'Class':"IfElse", 
                   'Node':[
                    {'ID':51, 
                     'Class':"Condition", 
                     'Method':(
                      Func11, ())},
                    {'ID':52, 
                     'Class':"SelectorProbability", 
                     'RandomGenerator':(
                      battlelogic.bot.agent.a5agent.CAgent.Random,
                      (0, 100)), 
                     'Node':[
                      {'ID':57, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':25, 
                       'Node':[
                        {'ID':67, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]},
                      {'ID':58, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':50, 
                       'Node':[
                        {'ID':68, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]},
                      {'ID':59, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':25, 
                       'Node':[
                        {'ID':69, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]}]},
                    {'ID':53, 
                     'Class':"Sequence", 
                     'Node':[
                      {'ID':60, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                       'ResultOption':0, 
                       'ResultFunctor':None},
                      {'ID':61, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]}]},
                  {'ID':50, 
                   'Class':"IfElse", 
                   'Node':[
                    {'ID':54, 
                     'Class':"Condition", 
                     'Method':(
                      Func12, ())},
                    {'ID':55, 
                     'Class':"IfElse", 
                     'Node':[
                      {'ID':62, 
                       'Class':"And", 
                       'Node':[
                        {'ID':70, 
                         'Class':"Condition", 
                         'Method':(
                          Func13, ())},
                        {'ID':71, 
                         'Class':"Condition", 
                         'Method':(
                          Func14, ())}]},
                      {'ID':63, 
                       'Class':"SelectorProbability", 
                       'RandomGenerator':(
                        battlelogic.bot.agent.a5agent.CAgent.Random,
                        (0, 100)), 
                       'Node':[
                        {'ID':72, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':50, 
                         'Node':[
                          {'ID':77, 
                           'Class':"SelectorProbability", 
                           'RandomGenerator':(
                            battlelogic.bot.agent.a5agent.CAgent.Random,
                            (0, 100)), 
                           'Node':[
                            {'ID':90, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':25, 
                             'Node':[
                              {'ID':104, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':91, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':50, 
                             'Node':[
                              {'ID':105, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':92, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':25, 
                             'Node':[
                              {'ID':106, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]}]}]},
                        {'ID':73, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':50, 
                         'Node':[
                          {'ID':78, 
                           'Class':"Sequence", 
                           'Node':[
                            {'ID':93, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                             'ResultOption':0, 
                             'ResultFunctor':None},
                            {'ID':94, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]}]}]},
                      {'ID':185, 
                       'Class':"IfElse", 
                       'Node':[
                        {'ID':186, 
                         'Class':"Condition", 
                         'Method':(
                          Func15, ())},
                        {'ID':187, 
                         'Class':"IfElse", 
                         'Node':[
                          {'ID':189, 
                           'Class':"Condition", 
                           'Method':(
                            Func16, ())},
                          {'ID':229, 
                           'Class':"SelectorProbability", 
                           'RandomGenerator':(
                            battlelogic.bot.agent.a5agent.CAgent.Random,
                            (0, 100)), 
                           'Node':[
                            {'ID':230, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':6, 
                             'Node':[
                              {'ID':239, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':231, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':17, 
                             'Node':[
                              {'ID':240, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':232, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':17, 
                             'Node':[
                              {'ID':241, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':233, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':4, 
                             'Node':[
                              {'ID':242, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':234, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':13, 
                             'Node':[
                              {'ID':243, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':235, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':13, 
                             'Node':[
                              {'ID':244, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':236, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':4, 
                             'Node':[
                              {'ID':245, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':237, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':13, 
                             'Node':[
                              {'ID':246, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':238, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':13, 
                             'Node':[
                              {'ID':247, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]}]},
                          {'ID':191, 
                           'Class':"Sequence", 
                           'Node':[
                            {'ID':201, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 30)), 
                             'ResultOption':0, 
                             'ResultFunctor':None},
                            {'ID':202, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]}]},
                        {'ID':188, 
                         'Class':"IfElse", 
                         'Node':[
                          {'ID':192, 
                           'Class':"Condition", 
                           'Method':(
                            Func17, ())},
                          {'ID':193, 
                           'Class':"SelectorProbability", 
                           'RandomGenerator':(
                            battlelogic.bot.agent.a5agent.CAgent.Random,
                            (0, 100)), 
                           'Node':[
                            {'ID':203, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':15, 
                             'Node':[
                              {'ID':220, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':204, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':16, 
                             'Node':[
                              {'ID':221, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':205, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':15, 
                             'Node':[
                              {'ID':222, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':206, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':9, 
                             'Node':[
                              {'ID':223, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':207, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':9, 
                             'Node':[
                              {'ID':224, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':208, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':9, 
                             'Node':[
                              {'ID':225, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':209, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':9, 
                             'Node':[
                              {'ID':226, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':210, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':9, 
                             'Node':[
                              {'ID':227, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':211, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':9, 
                             'Node':[
                              {'ID':228, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]}]},
                          {'ID':194, 
                           'Class':"Sequence", 
                           'Node':[
                            {'ID':212, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 30)), 
                             'ResultOption':0, 
                             'ResultFunctor':None},
                            {'ID':213, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]}]}]}]},
                    {'ID':56, 
                     'Class':"Sequence", 
                     'Node':[
                      {'ID':65, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                       'ResultOption':0, 
                       'ResultFunctor':None},
                      {'ID':66, 
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
          {'ID':179, 
           'Class':"IfElse", 
           'Node':[
            {'ID':180, 
             'Class':"Condition", 
             'Method':(
              Func18, ())},
            {'ID':181, 
             'Class':"Sequence", 
             'Node':[
              {'ID':183, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
               'ResultOption':0, 
               'ResultFunctor':None},
              {'ID':184, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
               'ResultOption':0, 
               'ResultFunctor':None}]},
            {'ID':182, 
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
            Func19, ())},
          {'ID':20, 
           'Class':"SelectorProbability", 
           'RandomGenerator':(
            battlelogic.bot.agent.a5agent.CAgent.Random,
            (0, 100)), 
           'Node':[
            {'ID':29, 
             'Class':"DecoratorWeight", 
             'DecorateWhenChildEnds':False, 
             'Weight':70, 
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
             'Weight':30, 
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
          Func20, ())},
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
