# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\base\btdata\bt2106.py
# Compiled at: 2023-04-06 17:07:41
# Size of source mod 2**32: 29116 bytes
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
    return battlelogic.bot.agent.a5agent.CAgent.CouldDoAction(oAgent) == True


def Func5(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsTheCurveShapeType(4, oAgent) == False


def Func6(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.CouldHit(oAgent) == True


def Func7(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) <= 400.0


def Func8(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) >= 350.0


def Func9(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 70.0


def Func10(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.CouldUseHitKey(4, oAgent) == True


def Func11(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) >= 250.0


def Func12(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 250.0


def Func13(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) >= 150.0


def Func14(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) <= 150.0


def Func15(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) < 5.0


def Func16(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsAttacker(oAgent) == True


def Func17(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.CouldUseHitKey(4, oAgent) == True


data = {'Name':"bt2106", 
 'ID':0, 
 'AgentType':"battlelogic.bot.agent.a5agent", 
 'IsFSM':False, 
 'Ver':28, 
 'Node':[
  {'ID':1, 
   'Class':"IfElse", 
   'Node':[
    {'ID':5, 
     'Class':"And", 
     'Node':[
      {'ID':6, 
       'Class':"Condition", 
       'Method':(
        Func0, ())},
      {'ID':7, 
       'Class':"Condition", 
       'Method':(
        Func1, ())}]},
    {'ID':8, 
     'Class':"Action", 
     'Method':(
      battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
     'ResultOption':0, 
     'ResultFunctor':None},
    {'ID':9, 
     'Class':"IfElse", 
     'Node':[
      {'ID':10, 
       'Class':"Condition", 
       'Method':(
        Func2, ())},
      {'ID':13, 
       'Class':"IfElse", 
       'Node':[
        {'ID':14, 
         'Class':"Condition", 
         'Method':(
          Func3, ())},
        {'ID':162, 
         'Class':"IfElse", 
         'Node':[
          {'ID':163, 
           'Class':"Condition", 
           'Method':(
            Func4, ())},
          {'ID':164, 
           'Class':"IfElse", 
           'Node':[
            {'ID':166, 
             'Class':"Condition", 
             'Method':(
              Func5, ())},
            {'ID':167, 
             'Class':"IfElse", 
             'Node':[
              {'ID':171, 
               'Class':"Condition", 
               'Method':(
                Func6, ())},
              {'ID':219, 
               'Class':"IfElse", 
               'Node':[
                {'ID':220, 
                 'Class':"And", 
                 'Node':[
                  {'ID':223, 
                   'Class':"Condition", 
                   'Method':(
                    Func7, ())},
                  {'ID':224, 
                   'Class':"Condition", 
                   'Method':(
                    Func8, ())}]},
                {'ID':221, 
                 'Class':"IfElse", 
                 'Node':[
                  {'ID':225, 
                   'Class':"Condition", 
                   'Method':(
                    Func9, ())},
                  {'ID':226, 
                   'Class':"SelectorProbability", 
                   'RandomGenerator':(
                    battlelogic.bot.agent.a5agent.CAgent.Random,
                    (0, 100)), 
                   'Node':[
                    {'ID':228, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':40, 
                     'Node':[
                      {'ID':233, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]},
                    {'ID':229, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':20, 
                     'Node':[
                      {'ID':234, 
                       'Class':"Sequence", 
                       'Node':[
                        {'ID':236, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                         'ResultOption':0, 
                         'ResultFunctor':None},
                        {'ID':237, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]}]},
                    {'ID':230, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':40, 
                     'Node':[
                      {'ID':235, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]}]},
                  {'ID':227, 
                   'Class':"Sequence", 
                   'Node':[
                    {'ID':231, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                     'ResultOption':0, 
                     'ResultFunctor':None},
                    {'ID':232, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                     'ResultOption':0, 
                     'ResultFunctor':None}]}]},
                {'ID':238, 
                 'Class':"IfElse", 
                 'Node':[
                  {'ID':239, 
                   'Class':"Condition", 
                   'Method':(
                    Func10, ())},
                  {'ID':240, 
                   'Class':"SelectorProbability", 
                   'RandomGenerator':(
                    battlelogic.bot.agent.a5agent.CAgent.Random,
                    (0, 100)), 
                   'Node':[
                    {'ID':242, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':70, 
                     'Node':[
                      {'ID':247, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (4, 0)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]},
                    {'ID':243, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':30, 
                     'Node':[
                      {'ID':248, 
                       'Class':"Sequence", 
                       'Node':[
                        {'ID':254, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 0)), 
                         'ResultOption':0, 
                         'ResultFunctor':None},
                        {'ID':255, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]}]}]},
                  {'ID':271, 
                   'Class':"IfElse", 
                   'Node':[
                    {'ID':272, 
                     'Class':"Condition", 
                     'Method':(
                      Func11, ())},
                    {'ID':273, 
                     'Class':"SelectorProbability", 
                     'RandomGenerator':(
                      battlelogic.bot.agent.a5agent.CAgent.Random,
                      (0, 100)), 
                     'Node':[
                      {'ID':275, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':60, 
                       'Node':[
                        {'ID':280, 
                         'Class':"SelectorProbability", 
                         'RandomGenerator':(
                          battlelogic.bot.agent.a5agent.CAgent.Random,
                          (0, 100)), 
                         'Node':[
                          {'ID':289, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':30, 
                           'Node':[
                            {'ID':301, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':290, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':30, 
                           'Node':[
                            {'ID':302, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':291, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':40, 
                           'Node':[
                            {'ID':303, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]}]}]},
                      {'ID':276, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':40, 
                       'Node':[
                        {'ID':281, 
                         'Class':"Sequence", 
                         'Node':[
                          {'ID':292, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                           'ResultOption':0, 
                           'ResultFunctor':None},
                          {'ID':293, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]}]}]},
                    {'ID':274, 
                     'Class':"IfElse", 
                     'Node':[
                      {'ID':277, 
                       'Class':"And", 
                       'Node':[
                        {'ID':282, 
                         'Class':"Condition", 
                         'Method':(
                          Func12, ())},
                        {'ID':283, 
                         'Class':"Condition", 
                         'Method':(
                          Func13, ())}]},
                      {'ID':278, 
                       'Class':"SelectorProbability", 
                       'RandomGenerator':(
                        battlelogic.bot.agent.a5agent.CAgent.Random,
                        (0, 100)), 
                       'Node':[
                        {'ID':284, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':60, 
                         'Node':[
                          {'ID':294, 
                           'Class':"SelectorProbability", 
                           'RandomGenerator':(
                            battlelogic.bot.agent.a5agent.CAgent.Random,
                            (0, 100)), 
                           'Node':[
                            {'ID':304, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':30, 
                             'Node':[
                              {'ID':315, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':305, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':30, 
                             'Node':[
                              {'ID':316, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':306, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':40, 
                             'Node':[
                              {'ID':317, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]}]}]},
                        {'ID':285, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':40, 
                         'Node':[
                          {'ID':295, 
                           'Class':"Sequence", 
                           'Node':[
                            {'ID':307, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                             'ResultOption':0, 
                             'ResultFunctor':None},
                            {'ID':308, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]}]}]},
                      {'ID':279, 
                       'Class':"IfElse", 
                       'Node':[
                        {'ID':286, 
                         'Class':"Condition", 
                         'Method':(
                          Func14, ())},
                        {'ID':318, 
                         'Class':"SelectorProbability", 
                         'RandomGenerator':(
                          battlelogic.bot.agent.a5agent.CAgent.Random,
                          (1, 100)), 
                         'Node':[
                          {'ID':319, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':33, 
                           'Node':[
                            {'ID':322, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':320, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':33, 
                           'Node':[
                            {'ID':323, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':321, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':34, 
                           'Node':[
                            {'ID':324, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]}]},
                        {'ID':288, 
                         'Class':"Sequence", 
                         'Node':[
                          {'ID':299, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                           'ResultOption':0, 
                           'ResultFunctor':None},
                          {'ID':300, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]}]}]}]}]}]},
              {'ID':268, 
               'Class':"Sequence", 
               'Node':[
                {'ID':269, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 0)), 
                 'ResultOption':0, 
                 'ResultFunctor':None},
                {'ID':270, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                 'ResultOption':0, 
                 'ResultFunctor':None}]}]},
            {'ID':168, 
             'Class':"IfElse", 
             'Node':[
              {'ID':174, 
               'Class':"Condition", 
               'Method':(
                Func15, ())},
              {'ID':175, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
               'ResultOption':0, 
               'ResultFunctor':None},
              {'ID':176, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
               'ResultOption':0, 
               'ResultFunctor':None}]}]},
          {'ID':165, 
           'Class':"Sequence", 
           'Node':[
            {'ID':169, 
             'Class':"Action", 
             'Method':(
              battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 0)), 
             'ResultOption':0, 
             'ResultFunctor':None},
            {'ID':170, 
             'Class':"Action", 
             'Method':(
              battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
             'ResultOption':0, 
             'ResultFunctor':None}]}]},
        {'ID':208, 
         'Class':"IfElse", 
         'Node':[
          {'ID':209, 
           'Class':"Condition", 
           'Method':(
            Func16, ())},
          {'ID':210, 
           'Class':"IfElse", 
           'Node':[
            {'ID':212, 
             'Class':"Condition", 
             'Method':(
              Func17, ())},
            {'ID':213, 
             'Class':"SelectorProbability", 
             'RandomGenerator':(
              battlelogic.bot.agent.a5agent.CAgent.Random,
              (0, 100)), 
             'Node':[
              {'ID':215, 
               'Class':"DecoratorWeight", 
               'DecorateWhenChildEnds':False, 
               'Weight':30, 
               'Node':[
                {'ID':217, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.Hit, (4, 0)), 
                 'ResultOption':0, 
                 'ResultFunctor':None}]},
              {'ID':216, 
               'Class':"DecoratorWeight", 
               'DecorateWhenChildEnds':False, 
               'Weight':70, 
               'Node':[
                {'ID':218, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                 'ResultOption':0, 
                 'ResultFunctor':None}]}]},
            {'ID':214, 
             'Class':"Action", 
             'Method':(
              battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
             'ResultOption':0, 
             'ResultFunctor':None}]},
          {'ID':211, 
           'Class':"Noop"}]}]},
      {'ID':12, 
       'Class':"Action", 
       'Method':(
        battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
       'ResultOption':0, 
       'ResultFunctor':None}]}]}]}
