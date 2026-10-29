# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\base\btdata\bt5003.py
# Compiled at: 2023-04-06 17:07:41
# Size of source mod 2**32: 48810 bytes
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
    return battlelogic.bot.agent.a5agent.CAgent.CouldDoAction(oAgent) == True


def Func6(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.CouldHit(oAgent) == True


def Func7(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.HasStarMarkArea(oAgent) != False


def Func8(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsInStarMarkArea(oAgent) != False


def Func9(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsAttackerInTheArea(5, oAgent) == False


def Func10(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) < 65.0


def Func11(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetDropPosToNetDistance(oAgent) < 350.0


def Func12(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsAttackerInTheArea(5, oAgent) == False


def Func13(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsAttackerInTheArea(5, oAgent) == False


def Func14(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetDropPosToNetDistance(oAgent) < 350.0


def Func15(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) < 90.0


def Func16(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) < 250.0


def Func17(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) < 100.0


def Func18(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsAttackerInTheArea(5, oAgent) == False


def Func19(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsAttackerInTheArea(5, oAgent) == False


def Func20(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) < 90.0


def Func21(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) < 280.0


def Func22(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) < 280.0


def Func23(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) > 250.0


def Func24(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsAttackerInTheArea(5, oAgent) == False


def Func25(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsAttackerInTheArea(5, oAgent) == False


def Func26(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsAttacker(oAgent) == True


def Func27(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.CouldUseHitKey(4, oAgent) != False


data = {'Name':"bt5003", 
 'ID':0, 
 'AgentType':"battlelogic.bot.agent.a5agent", 
 'IsFSM':False, 
 'Ver':105, 
 'Node':[
  {'ID':1, 
   'Class':"IfElse", 
   'Node':[
    {'ID':2, 
     'Class':"And", 
     'Node':[
      {'ID':3, 
       'Class':"Condition", 
       'Method':(
        Func0, ())},
      {'ID':4, 
       'Class':"Condition", 
       'Method':(
        Func1, ())}]},
    {'ID':5, 
     'Class':"Sequence", 
     'Node':[
      {'ID':308, 
       'Class':"IfElse", 
       'Node':[
        {'ID':310, 
         'Class':"Condition", 
         'Method':(
          Func2, ())},
        {'ID':311, 
         'Class':"Sequence", 
         'Node':[
          {'ID':315, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (20, 50)), 
           'ResultOption':0, 
           'ResultFunctor':None},
          {'ID':316, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
           'ResultOption':0, 
           'ResultFunctor':None}]},
        {'ID':312, 
         'Class':"Sequence", 
         'Node':[
          {'ID':317, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (-20, 50)), 
           'ResultOption':0, 
           'ResultFunctor':None},
          {'ID':318, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
           'ResultOption':0, 
           'ResultFunctor':None}]}]},
      {'ID':309, 
       'Class':"SelectorProbability", 
       'RandomGenerator':(
        battlelogic.bot.agent.a5agent.CAgent.Random,
        (0, 100)), 
       'Node':[
        {'ID':314, 
         'Class':"DecoratorWeight", 
         'DecorateWhenChildEnds':False, 
         'Weight':100, 
         'Node':[
          {'ID':320, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
           'ResultOption':0, 
           'ResultFunctor':None}]}]}]},
    {'ID':6, 
     'Class':"IfElse", 
     'Node':[
      {'ID':16, 
       'Class':"Condition", 
       'Method':(
        Func3, ())},
      {'ID':14, 
       'Class':"IfElse", 
       'Node':[
        {'ID':18, 
         'Class':"Condition", 
         'Method':(
          Func4, ())},
        {'ID':161, 
         'Class':"IfElse", 
         'Node':[
          {'ID':162, 
           'Class':"Condition", 
           'Method':(
            Func5, ())},
          {'ID':160, 
           'Class':"IfElse", 
           'Node':[
            {'ID':170, 
             'Class':"Condition", 
             'Method':(
              Func6, ())},
            {'ID':632, 
             'Class':"IfElse", 
             'Node':[
              {'ID':633, 
               'Class':"Condition", 
               'Method':(
                Func7, ())},
              {'ID':768, 
               'Class':"IfElse", 
               'Node':[
                {'ID':769, 
                 'Class':"Condition", 
                 'Method':(
                  Func8, ())},
                {'ID':770, 
                 'Class':"IfElse", 
                 'Node':[
                  {'ID':772, 
                   'Class':"Condition", 
                   'Method':(
                    Func9, ())},
                  {'ID':773, 
                   'Class':"SelectorProbability", 
                   'RandomGenerator':(
                    battlelogic.bot.agent.a5agent.CAgent.Random,
                    (0, 100)), 
                   'Node':[
                    {'ID':777, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':80, 
                     'Node':[
                      {'ID':781, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]},
                    {'ID':778, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':20, 
                     'Node':[
                      {'ID':782, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]}]},
                  {'ID':774, 
                   'Class':"SelectorProbability", 
                   'RandomGenerator':(
                    battlelogic.bot.agent.a5agent.CAgent.Random,
                    (0, 100)), 
                   'Node':[
                    {'ID':779, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':80, 
                     'Node':[
                      {'ID':783, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]},
                    {'ID':780, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':20, 
                     'Node':[
                      {'ID':784, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]}]}]},
                {'ID':771, 
                 'Class':"Sequence", 
                 'Node':[
                  {'ID':775, 
                   'Class':"Action", 
                   'Method':(
                    battlelogic.bot.agent.a5agent.CAgent.MoveToStarMarkArea, ()), 
                   'ResultOption':0, 
                   'ResultFunctor':None},
                  {'ID':776, 
                   'Class':"Action", 
                   'Method':(
                    battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                   'ResultOption':0, 
                   'ResultFunctor':None}]}]},
              {'ID':785, 
               'Class':"IfElse", 
               'Node':[
                {'ID':786, 
                 'Class':"Condition", 
                 'Method':(
                  Func10, ())},
                {'ID':787, 
                 'Class':"IfElse", 
                 'Node':[
                  {'ID':789, 
                   'Class':"Condition", 
                   'Method':(
                    Func11, ())},
                  {'ID':790, 
                   'Class':"IfElse", 
                   'Node':[
                    {'ID':795, 
                     'Class':"Condition", 
                     'Method':(
                      Func12, ())},
                    {'ID':796, 
                     'Class':"SelectorProbability", 
                     'RandomGenerator':(
                      battlelogic.bot.agent.a5agent.CAgent.Random,
                      (0, 100)), 
                     'Node':[
                      {'ID':807, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':40, 
                       'Node':[
                        {'ID':835, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]},
                      {'ID':808, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':40, 
                       'Node':[
                        {'ID':836, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]},
                      {'ID':809, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':20, 
                       'Node':[
                        {'ID':837, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]}]},
                    {'ID':797, 
                     'Class':"SelectorProbability", 
                     'RandomGenerator':(
                      battlelogic.bot.agent.a5agent.CAgent.Random,
                      (0, 100)), 
                     'Node':[
                      {'ID':810, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':40, 
                       'Node':[
                        {'ID':838, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]},
                      {'ID':811, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':40, 
                       'Node':[
                        {'ID':839, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]},
                      {'ID':812, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':20, 
                       'Node':[
                        {'ID':840, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]}]}]},
                  {'ID':791, 
                   'Class':"IfElse", 
                   'Node':[
                    {'ID':798, 
                     'Class':"Condition", 
                     'Method':(
                      Func13, ())},
                    {'ID':799, 
                     'Class':"SelectorProbability", 
                     'RandomGenerator':(
                      battlelogic.bot.agent.a5agent.CAgent.Random,
                      (0, 100)), 
                     'Node':[
                      {'ID':813, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':51, 
                       'Node':[
                        {'ID':841, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]},
                      {'ID':814, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':29, 
                       'Node':[
                        {'ID':842, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]},
                      {'ID':815, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':10, 
                       'Node':[
                        {'ID':843, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]},
                      {'ID':816, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':10, 
                       'Node':[
                        {'ID':844, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]}]},
                    {'ID':800, 
                     'Class':"SelectorProbability", 
                     'RandomGenerator':(
                      battlelogic.bot.agent.a5agent.CAgent.Random,
                      (0, 100)), 
                     'Node':[
                      {'ID':817, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':50, 
                       'Node':[
                        {'ID':845, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]},
                      {'ID':818, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':30, 
                       'Node':[
                        {'ID':846, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]},
                      {'ID':819, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':10, 
                       'Node':[
                        {'ID':847, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]},
                      {'ID':820, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':10, 
                       'Node':[
                        {'ID':848, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]}]}]}]},
                {'ID':788, 
                 'Class':"IfElse", 
                 'Node':[
                  {'ID':792, 
                   'Class':"Condition", 
                   'Method':(
                    Func14, ())},
                  {'ID':793, 
                   'Class':"IfElse", 
                   'Node':[
                    {'ID':801, 
                     'Class':"And", 
                     'Node':[
                      {'ID':821, 
                       'Class':"Condition", 
                       'Method':(
                        Func15, ())},
                      {'ID':822, 
                       'Class':"Condition", 
                       'Method':(
                        Func16, ())}]},
                    {'ID':802, 
                     'Class':"IfElse", 
                     'Node':[
                      {'ID':823, 
                       'Class':"Condition", 
                       'Method':(
                        Func17, ())},
                      {'ID':824, 
                       'Class':"IfElse", 
                       'Node':[
                        {'ID':849, 
                         'Class':"Condition", 
                         'Method':(
                          Func18, ())},
                        {'ID':850, 
                         'Class':"SelectorProbability", 
                         'RandomGenerator':(
                          battlelogic.bot.agent.a5agent.CAgent.Random,
                          (0, 100)), 
                         'Node':[
                          {'ID':863, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':70, 
                           'Node':[
                            {'ID':881, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':864, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':30, 
                           'Node':[
                            {'ID':882, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]}]},
                        {'ID':851, 
                         'Class':"SelectorProbability", 
                         'RandomGenerator':(
                          battlelogic.bot.agent.a5agent.CAgent.Random,
                          (0, 100)), 
                         'Node':[
                          {'ID':865, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':70, 
                           'Node':[
                            {'ID':883, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':866, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':30, 
                           'Node':[
                            {'ID':884, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]}]}]},
                      {'ID':825, 
                       'Class':"IfElse", 
                       'Node':[
                        {'ID':852, 
                         'Class':"Condition", 
                         'Method':(
                          Func19, ())},
                        {'ID':853, 
                         'Class':"SelectorProbability", 
                         'RandomGenerator':(
                          battlelogic.bot.agent.a5agent.CAgent.Random,
                          (0, 100)), 
                         'Node':[
                          {'ID':867, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':40, 
                           'Node':[
                            {'ID':885, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':868, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':40, 
                           'Node':[
                            {'ID':886, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':869, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':20, 
                           'Node':[
                            {'ID':887, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]}]},
                        {'ID':854, 
                         'Class':"SelectorProbability", 
                         'RandomGenerator':(
                          battlelogic.bot.agent.a5agent.CAgent.Random,
                          (0, 100)), 
                         'Node':[
                          {'ID':870, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':40, 
                           'Node':[
                            {'ID':888, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':871, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':40, 
                           'Node':[
                            {'ID':889, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':872, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':20, 
                           'Node':[
                            {'ID':890, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]}]}]}]},
                    {'ID':803, 
                     'Class':"Sequence", 
                     'Node':[
                      {'ID':826, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                       'ResultOption':0, 
                       'ResultFunctor':None},
                      {'ID':827, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]}]},
                  {'ID':794, 
                   'Class':"IfElse", 
                   'Node':[
                    {'ID':804, 
                     'Class':"And", 
                     'Node':[
                      {'ID':828, 
                       'Class':"Condition", 
                       'Method':(
                        Func20, ())},
                      {'ID':829, 
                       'Class':"Condition", 
                       'Method':(
                        Func21, ())}]},
                    {'ID':805, 
                     'Class':"IfElse", 
                     'Node':[
                      {'ID':830, 
                       'Class':"And", 
                       'Node':[
                        {'ID':855, 
                         'Class':"Condition", 
                         'Method':(
                          Func22, ())},
                        {'ID':856, 
                         'Class':"Condition", 
                         'Method':(
                          Func23, ())}]},
                      {'ID':831, 
                       'Class':"IfElse", 
                       'Node':[
                        {'ID':857, 
                         'Class':"Condition", 
                         'Method':(
                          Func24, ())},
                        {'ID':858, 
                         'Class':"SelectorProbability", 
                         'RandomGenerator':(
                          battlelogic.bot.agent.a5agent.CAgent.Random,
                          (0, 100)), 
                         'Node':[
                          {'ID':873, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':50, 
                           'Node':[
                            {'ID':891, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':874, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':50, 
                           'Node':[
                            {'ID':892, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]}]},
                        {'ID':859, 
                         'Class':"SelectorProbability", 
                         'RandomGenerator':(
                          battlelogic.bot.agent.a5agent.CAgent.Random,
                          (0, 100)), 
                         'Node':[
                          {'ID':875, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':50, 
                           'Node':[
                            {'ID':893, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':876, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':50, 
                           'Node':[
                            {'ID':894, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]}]}]},
                      {'ID':832, 
                       'Class':"IfElse", 
                       'Node':[
                        {'ID':860, 
                         'Class':"Condition", 
                         'Method':(
                          Func25, ())},
                        {'ID':861, 
                         'Class':"SelectorProbability", 
                         'RandomGenerator':(
                          battlelogic.bot.agent.a5agent.CAgent.Random,
                          (0, 100)), 
                         'Node':[
                          {'ID':877, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':50, 
                           'Node':[
                            {'ID':895, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':878, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':50, 
                           'Node':[
                            {'ID':896, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]}]},
                        {'ID':862, 
                         'Class':"SelectorProbability", 
                         'RandomGenerator':(
                          battlelogic.bot.agent.a5agent.CAgent.Random,
                          (0, 100)), 
                         'Node':[
                          {'ID':879, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':50, 
                           'Node':[
                            {'ID':897, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':880, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':50, 
                           'Node':[
                            {'ID':898, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]}]}]}]},
                    {'ID':806, 
                     'Class':"Sequence", 
                     'Node':[
                      {'ID':833, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                       'ResultOption':0, 
                       'ResultFunctor':None},
                      {'ID':834, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]}]}]}]}]},
            {'ID':765, 
             'Class':"Sequence", 
             'Node':[
              {'ID':766, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
               'ResultOption':0, 
               'ResultFunctor':None},
              {'ID':767, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
               'ResultOption':0, 
               'ResultFunctor':None}]}]},
          {'ID':165, 
           'Class':"Sequence", 
           'Node':[
            {'ID':167, 
             'Class':"Action", 
             'Method':(
              battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
             'ResultOption':0, 
             'ResultFunctor':None},
            {'ID':169, 
             'Class':"Action", 
             'Method':(
              battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
             'ResultOption':0, 
             'ResultFunctor':None}]}]},
        {'ID':19, 
         'Class':"IfElse", 
         'Node':[
          {'ID':20, 
           'Class':"Condition", 
           'Method':(
            Func26, ())},
          {'ID':622, 
           'Class':"IfElse", 
           'Node':[
            {'ID':623, 
             'Class':"Condition", 
             'Method':(
              Func27, ())},
            {'ID':624, 
             'Class':"Sequence", 
             'Node':[
              {'ID':625, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.Hit, (4, 2)), 
               'ResultOption':0, 
               'ResultFunctor':None},
              {'ID':626, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (0, 50)), 
               'ResultOption':0, 
               'ResultFunctor':None},
              {'ID':627, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
               'ResultOption':0, 
               'ResultFunctor':None}]},
            {'ID':628, 
             'Class':"Sequence", 
             'Node':[
              {'ID':630, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (0, 50)), 
               'ResultOption':0, 
               'ResultFunctor':None},
              {'ID':631, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
               'ResultOption':0, 
               'ResultFunctor':None}]}]},
          {'ID':22, 
           'Class':"Noop"}]}]},
      {'ID':15, 
       'Class':"Action", 
       'Method':(
        battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
       'ResultOption':0, 
       'ResultFunctor':None}]}]}]}
