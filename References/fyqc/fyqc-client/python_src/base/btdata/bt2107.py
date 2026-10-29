# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\base\btdata\bt2107.py
# Compiled at: 2023-04-06 17:07:41
# Size of source mod 2**32: 36151 bytes
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
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) <= 400.0


def Func5(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.CouldDoAction(oAgent) == True


def Func6(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsTheCurveShapeType(4, oAgent) == False


def Func7(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.CouldHit(oAgent) == True


def Func8(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) <= 400.0


def Func9(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) >= 350.0


def Func10(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 70.0


def Func11(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.CouldUseHitKey(4, oAgent) != False


def Func12(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) >= 250.0


def Func13(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 250.0


def Func14(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) >= 150.0


def Func15(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) <= 150.0


def Func16(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) <= 90.0


def Func17(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsAttackerInTheArea(5, oAgent) == False


def Func18(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsAttackerInTheArea(5, oAgent) == False


def Func19(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) < 5.0


def Func20(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsAttacker(oAgent) == True


def Func21(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.CouldUseHitKey(4, oAgent) == True


data = {'Name':"bt2107", 
 'ID':0, 
 'AgentType':"battlelogic.bot.agent.a5agent", 
 'IsFSM':False, 
 'Ver':21, 
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
          {'ID':13, 
           'Class':"Condition", 
           'Method':(
            Func4, ())},
          {'ID':14, 
           'Class':"IfElse", 
           'Node':[
            {'ID':19, 
             'Class':"Condition", 
             'Method':(
              Func5, ())},
            {'ID':314, 
             'Class':"IfElse", 
             'Node':[
              {'ID':315, 
               'Class':"Condition", 
               'Method':(
                Func6, ())},
              {'ID':338, 
               'Class':"IfElse", 
               'Node':[
                {'ID':339, 
                 'Class':"Condition", 
                 'Method':(
                  Func7, ())},
                {'ID':415, 
                 'Class':"IfElse", 
                 'Node':[
                  {'ID':416, 
                   'Class':"And", 
                   'Node':[
                    {'ID':419, 
                     'Class':"Condition", 
                     'Method':(
                      Func8, ())},
                    {'ID':420, 
                     'Class':"Condition", 
                     'Method':(
                      Func9, ())}]},
                  {'ID':417, 
                   'Class':"IfElse", 
                   'Node':[
                    {'ID':421, 
                     'Class':"Condition", 
                     'Method':(
                      Func10, ())},
                    {'ID':422, 
                     'Class':"SelectorProbability", 
                     'RandomGenerator':(
                      battlelogic.bot.agent.a5agent.CAgent.Random,
                      (0, 100)), 
                     'Node':[
                      {'ID':427, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':40, 
                       'Node':[
                        {'ID':437, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]},
                      {'ID':428, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':20, 
                       'Node':[
                        {'ID':438, 
                         'Class':"Sequence", 
                         'Node':[
                          {'ID':447, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                           'ResultOption':0, 
                           'ResultFunctor':None},
                          {'ID':448, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]}]},
                      {'ID':429, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':40, 
                       'Node':[
                        {'ID':439, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]}]},
                    {'ID':423, 
                     'Class':"Sequence", 
                     'Node':[
                      {'ID':430, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                       'ResultOption':0, 
                       'ResultFunctor':None},
                      {'ID':431, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]}]},
                  {'ID':418, 
                   'Class':"IfElse", 
                   'Node':[
                    {'ID':424, 
                     'Class':"Condition", 
                     'Method':(
                      Func11, ())},
                    {'ID':425, 
                     'Class':"SelectorProbability", 
                     'RandomGenerator':(
                      battlelogic.bot.agent.a5agent.CAgent.Random,
                      (0, 100)), 
                     'Node':[
                      {'ID':432, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':60, 
                       'Node':[
                        {'ID':440, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (4, 2)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]},
                      {'ID':433, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':40, 
                       'Node':[
                        {'ID':441, 
                         'Class':"Sequence", 
                         'Node':[
                          {'ID':449, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                           'ResultOption':0, 
                           'ResultFunctor':None},
                          {'ID':450, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]}]}]},
                    {'ID':426, 
                     'Class':"IfElse", 
                     'Node':[
                      {'ID':434, 
                       'Class':"Condition", 
                       'Method':(
                        Func12, ())},
                      {'ID':435, 
                       'Class':"SelectorProbability", 
                       'RandomGenerator':(
                        battlelogic.bot.agent.a5agent.CAgent.Random,
                        (0, 100)), 
                       'Node':[
                        {'ID':442, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':60, 
                         'Node':[
                          {'ID':451, 
                           'Class':"SelectorProbability", 
                           'RandomGenerator':(
                            battlelogic.bot.agent.a5agent.CAgent.Random,
                            (0, 100)), 
                           'Node':[
                            {'ID':460, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':30, 
                             'Node':[
                              {'ID':472, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':461, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':30, 
                             'Node':[
                              {'ID':473, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':462, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':40, 
                             'Node':[
                              {'ID':474, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]}]}]},
                        {'ID':443, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':40, 
                         'Node':[
                          {'ID':452, 
                           'Class':"Sequence", 
                           'Node':[
                            {'ID':463, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                             'ResultOption':0, 
                             'ResultFunctor':None},
                            {'ID':464, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]}]}]},
                      {'ID':436, 
                       'Class':"IfElse", 
                       'Node':[
                        {'ID':444, 
                         'Class':"And", 
                         'Node':[
                          {'ID':453, 
                           'Class':"Condition", 
                           'Method':(
                            Func13, ())},
                          {'ID':454, 
                           'Class':"Condition", 
                           'Method':(
                            Func14, ())}]},
                        {'ID':445, 
                         'Class':"SelectorProbability", 
                         'RandomGenerator':(
                          battlelogic.bot.agent.a5agent.CAgent.Random,
                          (0, 100)), 
                         'Node':[
                          {'ID':455, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':60, 
                           'Node':[
                            {'ID':465, 
                             'Class':"SelectorProbability", 
                             'RandomGenerator':(
                              battlelogic.bot.agent.a5agent.CAgent.Random,
                              (0, 100)), 
                             'Node':[
                              {'ID':475, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':30, 
                               'Node':[
                                {'ID':486, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':476, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':30, 
                               'Node':[
                                {'ID':487, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':477, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':40, 
                               'Node':[
                                {'ID':488, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]}]}]},
                          {'ID':456, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':40, 
                           'Node':[
                            {'ID':466, 
                             'Class':"Sequence", 
                             'Node':[
                              {'ID':478, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                               'ResultOption':0, 
                               'ResultFunctor':None},
                              {'ID':479, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]}]}]},
                        {'ID':446, 
                         'Class':"IfElse", 
                         'Node':[
                          {'ID':457, 
                           'Class':"Condition", 
                           'Method':(
                            Func15, ())},
                          {'ID':458, 
                           'Class':"IfElse", 
                           'Node':[
                            {'ID':467, 
                             'Class':"Condition", 
                             'Method':(
                              Func16, ())},
                            {'ID':468, 
                             'Class':"IfElse", 
                             'Node':[
                              {'ID':480, 
                               'Class':"Condition", 
                               'Method':(
                                Func17, ())},
                              {'ID':481, 
                               'Class':"SelectorProbability", 
                               'RandomGenerator':(
                                battlelogic.bot.agent.a5agent.CAgent.Random,
                                (0, 100)), 
                               'Node':[
                                {'ID':489, 
                                 'Class':"DecoratorWeight", 
                                 'DecorateWhenChildEnds':False, 
                                 'Weight':40, 
                                 'Node':[
                                  {'ID':495, 
                                   'Class':"Action", 
                                   'Method':(
                                    battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                                   'ResultOption':0, 
                                   'ResultFunctor':None}]},
                                {'ID':490, 
                                 'Class':"DecoratorWeight", 
                                 'DecorateWhenChildEnds':False, 
                                 'Weight':40, 
                                 'Node':[
                                  {'ID':496, 
                                   'Class':"Action", 
                                   'Method':(
                                    battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                                   'ResultOption':0, 
                                   'ResultFunctor':None}]},
                                {'ID':491, 
                                 'Class':"DecoratorWeight", 
                                 'DecorateWhenChildEnds':False, 
                                 'Weight':20, 
                                 'Node':[
                                  {'ID':497, 
                                   'Class':"Action", 
                                   'Method':(
                                    battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                                   'ResultOption':0, 
                                   'ResultFunctor':None}]}]},
                              {'ID':482, 
                               'Class':"SelectorProbability", 
                               'RandomGenerator':(
                                battlelogic.bot.agent.a5agent.CAgent.Random,
                                (0, 100)), 
                               'Node':[
                                {'ID':492, 
                                 'Class':"DecoratorWeight", 
                                 'DecorateWhenChildEnds':False, 
                                 'Weight':40, 
                                 'Node':[
                                  {'ID':498, 
                                   'Class':"Action", 
                                   'Method':(
                                    battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                                   'ResultOption':0, 
                                   'ResultFunctor':None}]},
                                {'ID':493, 
                                 'Class':"DecoratorWeight", 
                                 'DecorateWhenChildEnds':False, 
                                 'Weight':40, 
                                 'Node':[
                                  {'ID':499, 
                                   'Class':"Action", 
                                   'Method':(
                                    battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                                   'ResultOption':0, 
                                   'ResultFunctor':None}]},
                                {'ID':494, 
                                 'Class':"DecoratorWeight", 
                                 'DecorateWhenChildEnds':False, 
                                 'Weight':20, 
                                 'Node':[
                                  {'ID':500, 
                                   'Class':"Action", 
                                   'Method':(
                                    battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                                   'ResultOption':0, 
                                   'ResultFunctor':None}]}]}]},
                            {'ID':469, 
                             'Class':"IfElse", 
                             'Node':[
                              {'ID':483, 
                               'Class':"Condition", 
                               'Method':(
                                Func18, ())},
                              {'ID':484, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None},
                              {'ID':485, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]}]},
                          {'ID':459, 
                           'Class':"Sequence", 
                           'Node':[
                            {'ID':470, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                             'ResultOption':0, 
                             'ResultFunctor':None},
                            {'ID':471, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]}]}]}]}]}]},
                {'ID':501, 
                 'Class':"Sequence", 
                 'Node':[
                  {'ID':502, 
                   'Class':"Action", 
                   'Method':(
                    battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                   'ResultOption':0, 
                   'ResultFunctor':None},
                  {'ID':503, 
                   'Class':"Action", 
                   'Method':(
                    battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                   'ResultOption':0, 
                   'ResultFunctor':None}]}]},
              {'ID':411, 
               'Class':"IfElse", 
               'Node':[
                {'ID':412, 
                 'Class':"Condition", 
                 'Method':(
                  Func19, ())},
                {'ID':413, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                 'ResultOption':0, 
                 'ResultFunctor':None},
                {'ID':414, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                 'ResultOption':0, 
                 'ResultFunctor':None}]}]},
            {'ID':21, 
             'Class':"Sequence", 
             'Node':[
              {'ID':208, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
               'ResultOption':0, 
               'ResultFunctor':None}]}]},
          {'ID':15, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
           'ResultOption':0, 
           'ResultFunctor':None}]},
        {'ID':12, 
         'Class':"IfElse", 
         'Node':[
          {'ID':16, 
           'Class':"Condition", 
           'Method':(
            Func20, ())},
          {'ID':329, 
           'Class':"IfElse", 
           'Node':[
            {'ID':330, 
             'Class':"Condition", 
             'Method':(
              Func21, ())},
            {'ID':331, 
             'Class':"SelectorProbability", 
             'RandomGenerator':(
              battlelogic.bot.agent.a5agent.CAgent.Random,
              (0, 100)), 
             'Node':[
              {'ID':332, 
               'Class':"DecoratorWeight", 
               'DecorateWhenChildEnds':False, 
               'Weight':30, 
               'Node':[
                {'ID':334, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.Hit, (4, 2)), 
                 'ResultOption':0, 
                 'ResultFunctor':None}]},
              {'ID':333, 
               'Class':"DecoratorWeight", 
               'DecorateWhenChildEnds':False, 
               'Weight':70, 
               'Node':[
                {'ID':335, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                 'ResultOption':0, 
                 'ResultFunctor':None}]}]},
            {'ID':336, 
             'Class':"Action", 
             'Method':(
              battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
             'ResultOption':0, 
             'ResultFunctor':None}]},
          {'ID':337, 
           'Class':"Noop"}]}]},
      {'ID':9, 
       'Class':"Action", 
       'Method':(
        battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
       'ResultOption':0, 
       'ResultFunctor':None}]}]}]}
