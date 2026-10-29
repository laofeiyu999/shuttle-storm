# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\base\btdata\bt10102.py
# Compiled at: 2023-04-06 17:07:41
# Size of source mod 2**32: 51086 bytes
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
    return battlelogic.bot.agent.a5agent.CAgent.CouldUseHitKey(4, oAgent) == True


def Func13(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) < 150.0


def Func14(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 200.0


def Func15(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) >= 150.0


def Func16(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.CouldUseHitKey(4, oAgent) == True


def Func17(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 70.0


def Func18(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsDropPosInFrontBackLine(oAgent) == True


def Func19(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.HasStarMarkArea(oAgent) == True


def Func20(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsAttacker(oAgent) == True


def Func21(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsInTheArea(5, oAgent) == True


data = {'Name':"bt10102", 
 'ID':0, 
 'AgentType':"battlelogic.bot.agent.a5agent", 
 'IsFSM':False, 
 'Ver':19, 
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
                {'ID':36, 
                 'Class':"Condition", 
                 'Method':(
                  Func7, ())},
                {'ID':120, 
                 'Class':"SelectorProbability", 
                 'RandomGenerator':(
                  battlelogic.bot.agent.a5agent.CAgent.Random,
                  (0, 100)), 
                 'Node':[
                  {'ID':121, 
                   'Class':"DecoratorWeight", 
                   'DecorateWhenChildEnds':False, 
                   'Weight':30, 
                   'Node':[
                    {'ID':122, 
                     'Class':"IfElse", 
                     'Node':[
                      {'ID':123, 
                       'Class':"Condition", 
                       'Method':(
                        Func8, ())},
                      {'ID':124, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                       'ResultOption':0, 
                       'ResultFunctor':None},
                      {'ID':125, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]}]},
                  {'ID':126, 
                   'Class':"DecoratorWeight", 
                   'DecorateWhenChildEnds':False, 
                   'Weight':70, 
                   'Node':[
                    {'ID':247, 
                     'Class':"IfElse", 
                     'Node':[
                      {'ID':248, 
                       'Class':"Condition", 
                       'Method':(
                        Func9, ())},
                      {'ID':249, 
                       'Class':"SelectorProbability", 
                       'RandomGenerator':(
                        battlelogic.bot.agent.a5agent.CAgent.Random,
                        (0, 100)), 
                       'Node':[
                        {'ID':251, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':15, 
                         'Node':[
                          {'ID':262, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':252, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':16, 
                         'Node':[
                          {'ID':263, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':253, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':15, 
                         'Node':[
                          {'ID':264, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':254, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':9, 
                         'Node':[
                          {'ID':265, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':255, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':9, 
                         'Node':[
                          {'ID':266, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':256, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':9, 
                         'Node':[
                          {'ID':267, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':257, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':9, 
                         'Node':[
                          {'ID':268, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':258, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':9, 
                         'Node':[
                          {'ID':269, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':259, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':9, 
                         'Node':[
                          {'ID':270, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]}]},
                      {'ID':250, 
                       'Class':"Sequence", 
                       'Node':[
                        {'ID':260, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 30)), 
                         'ResultOption':0, 
                         'ResultFunctor':None},
                        {'ID':261, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]}]}]}]},
                {'ID':38, 
                 'Class':"IfElse", 
                 'Node':[
                  {'ID':44, 
                   'Class':"Condition", 
                   'Method':(
                    Func10, ())},
                  {'ID':45, 
                   'Class':"IfElse", 
                   'Node':[
                    {'ID':47, 
                     'Class':"Condition", 
                     'Method':(
                      Func11, ())},
                    {'ID':48, 
                     'Class':"SelectorProbability", 
                     'RandomGenerator':(
                      battlelogic.bot.agent.a5agent.CAgent.Random,
                      (0, 100)), 
                     'Node':[
                      {'ID':53, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':50, 
                       'Node':[
                        {'ID':110, 
                         'Class':"IfElse", 
                         'Node':[
                          {'ID':111, 
                           'Class':"Condition", 
                           'Method':(
                            Func12, ())},
                          {'ID':112, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (4, 0)), 
                           'ResultOption':0, 
                           'ResultFunctor':None},
                          {'ID':113, 
                           'Class':"SelectorProbability", 
                           'RandomGenerator':(
                            battlelogic.bot.agent.a5agent.CAgent.Random,
                            (0, 100)), 
                           'Node':[
                            {'ID':114, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':25, 
                             'Node':[
                              {'ID':117, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':115, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':50, 
                             'Node':[
                              {'ID':118, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':116, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':25, 
                             'Node':[
                              {'ID':119, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]}]}]}]},
                      {'ID':54, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':50, 
                       'Node':[
                        {'ID':103, 
                         'Class':"SelectorProbability", 
                         'RandomGenerator':(
                          battlelogic.bot.agent.a5agent.CAgent.Random,
                          (0, 100)), 
                         'Node':[
                          {'ID':104, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':25, 
                           'Node':[
                            {'ID':107, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':105, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':50, 
                           'Node':[
                            {'ID':108, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':106, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':25, 
                           'Node':[
                            {'ID':109, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]}]}]}]},
                    {'ID':49, 
                     'Class':"Sequence", 
                     'Node':[
                      {'ID':56, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                       'ResultOption':0, 
                       'ResultFunctor':None},
                      {'ID':57, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]}]},
                  {'ID':46, 
                   'Class':"IfElse", 
                   'Node':[
                    {'ID':50, 
                     'Class':"Condition", 
                     'Method':(
                      Func13, ())},
                    {'ID':51, 
                     'Class':"IfElse", 
                     'Node':[
                      {'ID':58, 
                       'Class':"And", 
                       'Node':[
                        {'ID':66, 
                         'Class':"Condition", 
                         'Method':(
                          Func14, ())},
                        {'ID':67, 
                         'Class':"Condition", 
                         'Method':(
                          Func15, ())}]},
                      {'ID':59, 
                       'Class':"SelectorProbability", 
                       'RandomGenerator':(
                        battlelogic.bot.agent.a5agent.CAgent.Random,
                        (0, 100)), 
                       'Node':[
                        {'ID':68, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':50, 
                         'Node':[
                          {'ID':73, 
                           'Class':"SelectorProbability", 
                           'RandomGenerator':(
                            battlelogic.bot.agent.a5agent.CAgent.Random,
                            (0, 100)), 
                           'Node':[
                            {'ID':86, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':25, 
                             'Node':[
                              {'ID':100, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':87, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':50, 
                             'Node':[
                              {'ID':101, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':88, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':25, 
                             'Node':[
                              {'ID':102, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]}]}]},
                        {'ID':69, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':50, 
                         'Node':[
                          {'ID':277, 
                           'Class':"IfElse", 
                           'Node':[
                            {'ID':278, 
                             'Class':"Condition", 
                             'Method':(
                              Func16, ())},
                            {'ID':279, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (4, 0)), 
                             'ResultOption':0, 
                             'ResultFunctor':None},
                            {'ID':280, 
                             'Class':"Sequence", 
                             'Node':[
                              {'ID':281, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                               'ResultOption':0, 
                               'ResultFunctor':None},
                              {'ID':282, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]}]}]}]},
                      {'ID':60, 
                       'Class':"IfElse", 
                       'Node':[
                        {'ID':70, 
                         'Class':"Condition", 
                         'Method':(
                          Func17, ())},
                        {'ID':207, 
                         'Class':"IfElse", 
                         'Node':[
                          {'ID':208, 
                           'Class':"Condition", 
                           'Method':(
                            Func18, ())},
                          {'ID':209, 
                           'Class':"SelectorProbability", 
                           'RandomGenerator':(
                            battlelogic.bot.agent.a5agent.CAgent.Random,
                            (0, 100)), 
                           'Node':[
                            {'ID':211, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':5, 
                             'Node':[
                              {'ID':229, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':212, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':18, 
                             'Node':[
                              {'ID':230, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':213, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':19, 
                             'Node':[
                              {'ID':231, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':214, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':3, 
                             'Node':[
                              {'ID':232, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':215, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':13, 
                             'Node':[
                              {'ID':233, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':216, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':13, 
                             'Node':[
                              {'ID':234, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':217, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':3, 
                             'Node':[
                              {'ID':235, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':218, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':13, 
                             'Node':[
                              {'ID':236, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':219, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':13, 
                             'Node':[
                              {'ID':237, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]}]},
                          {'ID':210, 
                           'Class':"SelectorProbability", 
                           'RandomGenerator':(
                            battlelogic.bot.agent.a5agent.CAgent.Random,
                            (0, 100)), 
                           'Node':[
                            {'ID':220, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':15, 
                             'Node':[
                              {'ID':238, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':221, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':16, 
                             'Node':[
                              {'ID':239, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':222, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':15, 
                             'Node':[
                              {'ID':240, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':223, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':9, 
                             'Node':[
                              {'ID':241, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':224, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':9, 
                             'Node':[
                              {'ID':242, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':225, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':9, 
                             'Node':[
                              {'ID':243, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':226, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':9, 
                             'Node':[
                              {'ID':244, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':227, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':9, 
                             'Node':[
                              {'ID':245, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':228, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':9, 
                             'Node':[
                              {'ID':246, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]}]}]},
                        {'ID':72, 
                         'Class':"Sequence", 
                         'Node':[
                          {'ID':84, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                           'ResultOption':0, 
                           'ResultFunctor':None},
                          {'ID':85, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]}]}]},
                    {'ID':52, 
                     'Class':"Sequence", 
                     'Node':[
                      {'ID':61, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                       'ResultOption':0, 
                       'ResultFunctor':None},
                      {'ID':62, 
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
                  battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
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
                battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
               'ResultOption':0, 
               'ResultFunctor':None},
              {'ID':35, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
               'ResultOption':0, 
               'ResultFunctor':None}]}]},
          {'ID':271, 
           'Class':"IfElse", 
           'Node':[
            {'ID':272, 
             'Class':"Condition", 
             'Method':(
              Func19, ())},
            {'ID':273, 
             'Class':"Sequence", 
             'Node':[
              {'ID':275, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
               'ResultOption':0, 
               'ResultFunctor':None},
              {'ID':276, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
               'ResultOption':0, 
               'ResultFunctor':None}]},
            {'ID':274, 
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
            Func20, ())},
          {'ID':200, 
           'Class':"SelectorProbability", 
           'RandomGenerator':(
            battlelogic.bot.agent.a5agent.CAgent.Random,
            (0, 100)), 
           'Node':[
            {'ID':201, 
             'Class':"DecoratorWeight", 
             'DecorateWhenChildEnds':False, 
             'Weight':80, 
             'Node':[
              {'ID':203, 
               'Class':"Sequence", 
               'Node':[
                {'ID':205, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (0, 0)), 
                 'ResultOption':0, 
                 'ResultFunctor':None},
                {'ID':206, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                 'ResultOption':0, 
                 'ResultFunctor':None}]}]},
            {'ID':202, 
             'Class':"DecoratorWeight", 
             'DecorateWhenChildEnds':False, 
             'Weight':20, 
             'Node':[
              {'ID':204, 
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
          Func21, ())},
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
