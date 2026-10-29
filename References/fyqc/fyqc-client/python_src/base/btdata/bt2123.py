# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\base\btdata\bt2123.py
# Compiled at: 2023-04-06 17:07:41
# Size of source mod 2**32: 38456 bytes
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
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) < 65.0


def Func8(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.CouldUseHitKey(128, oAgent) != False


def Func9(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) < 260.0


def Func10(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetDropPosToNetDistance(oAgent) < 350.0


def Func11(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsAttackerInTheArea(5, oAgent) == False


def Func12(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsAttackerInTheArea(5, oAgent) == False


def Func13(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetDropPosToNetDistance(oAgent) < 350.0


def Func14(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) < 90.0


def Func15(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) < 250.0


def Func16(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) < 100.0


def Func17(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsAttackerInTheArea(5, oAgent) == False


def Func18(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsAttackerInTheArea(5, oAgent) == False


def Func19(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) < 150.0


def Func20(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) < 250.0


def Func21(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsAttackerInTheArea(5, oAgent) == False


def Func22(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsAttacker(oAgent) == True


def Func23(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsPropertyPlay(oAgent) == True


def Func24(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.HasTeammatePropertyBox(oAgent) == True


def Func25(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.CouldUseHitKey(64, oAgent) == True


data = {'Name':"bt2123", 
 'ID':0, 
 'AgentType':"battlelogic.bot.agent.a5agent", 
 'IsFSM':False, 
 'Ver':93, 
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
        {'ID':313, 
         'Class':"DecoratorWeight", 
         'DecorateWhenChildEnds':False, 
         'Weight':50, 
         'Node':[
          {'ID':319, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
           'ResultOption':0, 
           'ResultFunctor':None}]},
        {'ID':314, 
         'Class':"DecoratorWeight", 
         'DecorateWhenChildEnds':False, 
         'Weight':50, 
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
            {'ID':321, 
             'Class':"IfElse", 
             'Node':[
              {'ID':322, 
               'Class':"Condition", 
               'Method':(
                Func7, ())},
              {'ID':429, 
               'Class':"IfElse", 
               'Node':[
                {'ID':431, 
                 'Class':"And", 
                 'Node':[
                  {'ID':432, 
                   'Class':"Condition", 
                   'Method':(
                    Func8, ())},
                  {'ID':434, 
                   'Class':"Condition", 
                   'Method':(
                    Func9, ())}]},
                {'ID':430, 
                 'Class':"SelectorProbability", 
                 'RandomGenerator':(
                  battlelogic.bot.agent.a5agent.CAgent.Random,
                  (0, 100)), 
                 'Node':[
                  {'ID':435, 
                   'Class':"DecoratorWeight", 
                   'DecorateWhenChildEnds':False, 
                   'Weight':40, 
                   'Node':[
                    {'ID':438, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.Hit, (4, 2)), 
                     'ResultOption':0, 
                     'ResultFunctor':None}]},
                  {'ID':436, 
                   'Class':"DecoratorWeight", 
                   'DecorateWhenChildEnds':False, 
                   'Weight':40, 
                   'Node':[
                    {'ID':439, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.Hit, (4, 1)), 
                     'ResultOption':0, 
                     'ResultFunctor':None}]},
                  {'ID':437, 
                   'Class':"DecoratorWeight", 
                   'DecorateWhenChildEnds':False, 
                   'Weight':20, 
                   'Node':[
                    {'ID':440, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.Hit, (4, 0)), 
                     'ResultOption':0, 
                     'ResultFunctor':None}]}]},
                {'ID':323, 
                 'Class':"IfElse", 
                 'Node':[
                  {'ID':325, 
                   'Class':"Condition", 
                   'Method':(
                    Func10, ())},
                  {'ID':414, 
                   'Class':"IfElse", 
                   'Node':[
                    {'ID':415, 
                     'Class':"Condition", 
                     'Method':(
                      Func11, ())},
                    {'ID':326, 
                     'Class':"SelectorProbability", 
                     'RandomGenerator':(
                      battlelogic.bot.agent.a5agent.CAgent.Random,
                      (0, 100)), 
                     'Node':[
                      {'ID':332, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':50, 
                       'Node':[
                        {'ID':350, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]},
                      {'ID':335, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':50, 
                       'Node':[
                        {'ID':353, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]}]},
                    {'ID':416, 
                     'Class':"SelectorProbability", 
                     'RandomGenerator':(
                      battlelogic.bot.agent.a5agent.CAgent.Random,
                      (0, 100)), 
                     'Node':[
                      {'ID':331, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':50, 
                       'Node':[
                        {'ID':349, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]},
                      {'ID':334, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':50, 
                       'Node':[
                        {'ID':352, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]}]}]},
                  {'ID':417, 
                   'Class':"IfElse", 
                   'Node':[
                    {'ID':418, 
                     'Class':"Condition", 
                     'Method':(
                      Func12, ())},
                    {'ID':327, 
                     'Class':"SelectorProbability", 
                     'RandomGenerator':(
                      battlelogic.bot.agent.a5agent.CAgent.Random,
                      (0, 100)), 
                     'Node':[
                      {'ID':338, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':70, 
                       'Node':[
                        {'ID':356, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]},
                      {'ID':341, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':30, 
                       'Node':[
                        {'ID':359, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]}]},
                    {'ID':419, 
                     'Class':"SelectorProbability", 
                     'RandomGenerator':(
                      battlelogic.bot.agent.a5agent.CAgent.Random,
                      (0, 100)), 
                     'Node':[
                      {'ID':337, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':70, 
                       'Node':[
                        {'ID':355, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]},
                      {'ID':340, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':30, 
                       'Node':[
                        {'ID':358, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]}]}]}]}]},
              {'ID':324, 
               'Class':"IfElse", 
               'Node':[
                {'ID':328, 
                 'Class':"Condition", 
                 'Method':(
                  Func13, ())},
                {'ID':329, 
                 'Class':"IfElse", 
                 'Node':[
                  {'ID':343, 
                   'Class':"And", 
                   'Node':[
                    {'ID':361, 
                     'Class':"Condition", 
                     'Method':(
                      Func14, ())},
                    {'ID':362, 
                     'Class':"Condition", 
                     'Method':(
                      Func15, ())}]},
                  {'ID':344, 
                   'Class':"IfElse", 
                   'Node':[
                    {'ID':363, 
                     'Class':"Condition", 
                     'Method':(
                      Func16, ())},
                    {'ID':420, 
                     'Class':"IfElse", 
                     'Node':[
                      {'ID':421, 
                       'Class':"Condition", 
                       'Method':(
                        Func17, ())},
                      {'ID':364, 
                       'Class':"SelectorProbability", 
                       'RandomGenerator':(
                        battlelogic.bot.agent.a5agent.CAgent.Random,
                        (0, 100)), 
                       'Node':[
                        {'ID':379, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':70, 
                         'Node':[
                          {'ID':400, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':382, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':30, 
                         'Node':[
                          {'ID':403, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]}]},
                      {'ID':422, 
                       'Class':"SelectorProbability", 
                       'RandomGenerator':(
                        battlelogic.bot.agent.a5agent.CAgent.Random,
                        (0, 100)), 
                       'Node':[
                        {'ID':378, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':70, 
                         'Node':[
                          {'ID':399, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':381, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':30, 
                         'Node':[
                          {'ID':402, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]}]}]},
                    {'ID':423, 
                     'Class':"IfElse", 
                     'Node':[
                      {'ID':424, 
                       'Class':"Condition", 
                       'Method':(
                        Func18, ())},
                      {'ID':365, 
                       'Class':"SelectorProbability", 
                       'RandomGenerator':(
                        battlelogic.bot.agent.a5agent.CAgent.Random,
                        (0, 100)), 
                       'Node':[
                        {'ID':385, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':40, 
                         'Node':[
                          {'ID':406, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':388, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':40, 
                         'Node':[
                          {'ID':409, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':391, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':20, 
                         'Node':[
                          {'ID':412, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]}]},
                      {'ID':425, 
                       'Class':"SelectorProbability", 
                       'RandomGenerator':(
                        battlelogic.bot.agent.a5agent.CAgent.Random,
                        (0, 100)), 
                       'Node':[
                        {'ID':384, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':40, 
                         'Node':[
                          {'ID':405, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':387, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':40, 
                         'Node':[
                          {'ID':408, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':390, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':20, 
                         'Node':[
                          {'ID':411, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]}]}]}]},
                  {'ID':345, 
                   'Class':"Sequence", 
                   'Node':[
                    {'ID':366, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                     'ResultOption':0, 
                     'ResultFunctor':None},
                    {'ID':367, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                     'ResultOption':0, 
                     'ResultFunctor':None}]}]},
                {'ID':330, 
                 'Class':"IfElse", 
                 'Node':[
                  {'ID':346, 
                   'Class':"And", 
                   'Node':[
                    {'ID':368, 
                     'Class':"Condition", 
                     'Method':(
                      Func19, ())},
                    {'ID':369, 
                     'Class':"Condition", 
                     'Method':(
                      Func20, ())}]},
                  {'ID':426, 
                   'Class':"IfElse", 
                   'Node':[
                    {'ID':427, 
                     'Class':"Condition", 
                     'Method':(
                      Func21, ())},
                    {'ID':347, 
                     'Class':"SelectorProbability", 
                     'RandomGenerator':(
                      battlelogic.bot.agent.a5agent.CAgent.Random,
                      (0, 100)), 
                     'Node':[
                      {'ID':371, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':50, 
                       'Node':[
                        {'ID':394, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]},
                      {'ID':374, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':50, 
                       'Node':[
                        {'ID':397, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]}]},
                    {'ID':428, 
                     'Class':"SelectorProbability", 
                     'RandomGenerator':(
                      battlelogic.bot.agent.a5agent.CAgent.Random,
                      (0, 100)), 
                     'Node':[
                      {'ID':370, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':50, 
                       'Node':[
                        {'ID':393, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]},
                      {'ID':373, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':50, 
                       'Node':[
                        {'ID':396, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]}]}]},
                  {'ID':348, 
                   'Class':"Sequence", 
                   'Node':[
                    {'ID':376, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                     'ResultOption':0, 
                     'ResultFunctor':None},
                    {'ID':377, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                     'ResultOption':0, 
                     'ResultFunctor':None}]}]}]}]},
            {'ID':164, 
             'Class':"Sequence", 
             'Node':[
              {'ID':166, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
               'ResultOption':0, 
               'ResultFunctor':None},
              {'ID':168, 
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
        {'ID':441, 
         'Class':"IfElse", 
         'Node':[
          {'ID':442, 
           'Class':"Condition", 
           'Method':(
            Func22, ())},
          {'ID':443, 
           'Class':"IfElse", 
           'Node':[
            {'ID':445, 
             'Class':"Condition", 
             'Method':(
              Func23, ())},
            {'ID':446, 
             'Class':"Sequence", 
             'Node':[
              {'ID':448, 
               'Class':"IfElse", 
               'Node':[
                {'ID':452, 
                 'Class':"Condition", 
                 'Method':(
                  Func24, ())},
                {'ID':453, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.MoveToPropertyBox, ()), 
                 'ResultOption':0, 
                 'ResultFunctor':None},
                {'ID':454, 
                 'Class':"Noop"}]},
              {'ID':449, 
               'Class':"IfElse", 
               'Node':[
                {'ID':455, 
                 'Class':"Condition", 
                 'Method':(
                  Func25, ())},
                {'ID':456, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.Hit, (64, 0)), 
                 'ResultOption':0, 
                 'ResultFunctor':None},
                {'ID':457, 
                 'Class':"Sequence", 
                 'Node':[
                  {'ID':458, 
                   'Class':"Action", 
                   'Method':(
                    battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (0, 0)), 
                   'ResultOption':0, 
                   'ResultFunctor':None},
                  {'ID':459, 
                   'Class':"Action", 
                   'Method':(
                    battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                   'ResultOption':0, 
                   'ResultFunctor':None}]}]}]},
            {'ID':447, 
             'Class':"Sequence", 
             'Node':[
              {'ID':450, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (0, 0)), 
               'ResultOption':0, 
               'ResultFunctor':None},
              {'ID':451, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
               'ResultOption':0, 
               'ResultFunctor':None}]}]},
          {'ID':444, 
           'Class':"Noop"}]}]},
      {'ID':15, 
       'Class':"Action", 
       'Method':(
        battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
       'ResultOption':0, 
       'ResultFunctor':None}]}]}]}
