# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\base\btdata\bt2007.py
# Compiled at: 2023-04-06 17:07:41
# Size of source mod 2**32: 22588 bytes
import battlelogic.bot.agent.a5agent

def Func0(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.HasTheState(3134, oAgent) == True


def Func1(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.HasTheState(3217, oAgent) == True


def Func2(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsServePlayer(oAgent) == True


def Func3(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsGameState(3, oAgent) == True


def Func4(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsGameState(4, oAgent) == True


def Func5(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsDefense(oAgent) == True


def Func6(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.CouldDoAction(oAgent) == True


def Func7(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.CouldHit(oAgent) == True


def Func8(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) <= 70.0


def Func9(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetDropPosToNetDistance(oAgent) < 300.0


def Func10(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 120.0


def Func11(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 120.0


def Func12(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 120.0


def Func13(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) <= 150.0


def Func14(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetDropPosToNetDistance(oAgent) < 300.0


def Func15(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsAttacker(oAgent) == True


data = {'Name':"bt2007", 
 'ID':0, 
 'AgentType':"battlelogic.bot.agent.a5agent", 
 'IsFSM':False, 
 'Ver':110, 
 'Node':[
  {'ID':433, 
   'Class':"IfElse", 
   'Node':[
    {'ID':436, 
     'Class':"And", 
     'Node':[
      {'ID':434, 
       'Class':"Condition", 
       'Method':(
        Func0, ())},
      {'ID':437, 
       'Class':"Condition", 
       'Method':(
        Func1, ())}]},
    {'ID':1, 
     'Class':"IfElse", 
     'Node':[
      {'ID':2, 
       'Class':"And", 
       'Node':[
        {'ID':3, 
         'Class':"Condition", 
         'Method':(
          Func2, ())},
        {'ID':4, 
         'Class':"Condition", 
         'Method':(
          Func3, ())}]},
      {'ID':367, 
       'Class':"Action", 
       'Method':(
        battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
       'ResultOption':0, 
       'ResultFunctor':None},
      {'ID':6, 
       'Class':"IfElse", 
       'Node':[
        {'ID':16, 
         'Class':"Condition", 
         'Method':(
          Func4, ())},
        {'ID':14, 
         'Class':"IfElse", 
         'Node':[
          {'ID':18, 
           'Class':"Condition", 
           'Method':(
            Func5, ())},
          {'ID':161, 
           'Class':"IfElse", 
           'Node':[
            {'ID':162, 
             'Class':"Condition", 
             'Method':(
              Func6, ())},
            {'ID':160, 
             'Class':"IfElse", 
             'Node':[
              {'ID':170, 
               'Class':"Condition", 
               'Method':(
                Func7, ())},
              {'ID':370, 
               'Class':"IfElse", 
               'Node':[
                {'ID':371, 
                 'Class':"Condition", 
                 'Method':(
                  Func8, ())},
                {'ID':372, 
                 'Class':"IfElse", 
                 'Node':[
                  {'ID':374, 
                   'Class':"Condition", 
                   'Method':(
                    Func9, ())},
                  {'ID':375, 
                   'Class':"IfElse", 
                   'Node':[
                    {'ID':380, 
                     'Class':"Condition", 
                     'Method':(
                      Func10, ())},
                    {'ID':381, 
                     'Class':"SelectorProbability", 
                     'RandomGenerator':(
                      battlelogic.bot.agent.a5agent.CAgent.Random,
                      (0, 100)), 
                     'Node':[
                      {'ID':393, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':15, 
                       'Node':[
                        {'ID':411, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]},
                      {'ID':394, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':15, 
                       'Node':[
                        {'ID':412, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]},
                      {'ID':395, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':35, 
                       'Node':[
                        {'ID':413, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]},
                      {'ID':396, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':35, 
                       'Node':[
                        {'ID':414, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]}]},
                    {'ID':382, 
                     'Class':"Sequence", 
                     'Node':[
                      {'ID':397, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                       'ResultOption':0, 
                       'ResultFunctor':None},
                      {'ID':398, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]}]},
                  {'ID':376, 
                   'Class':"IfElse", 
                   'Node':[
                    {'ID':383, 
                     'Class':"Condition", 
                     'Method':(
                      Func11, ())},
                    {'ID':384, 
                     'Class':"SelectorProbability", 
                     'RandomGenerator':(
                      battlelogic.bot.agent.a5agent.CAgent.Random,
                      (0, 100)), 
                     'Node':[
                      {'ID':399, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':20, 
                       'Node':[
                        {'ID':415, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]},
                      {'ID':400, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':20, 
                       'Node':[
                        {'ID':416, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]},
                      {'ID':401, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':30, 
                       'Node':[
                        {'ID':417, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]},
                      {'ID':402, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':30, 
                       'Node':[
                        {'ID':418, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]}]},
                    {'ID':385, 
                     'Class':"Sequence", 
                     'Node':[
                      {'ID':403, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                       'ResultOption':0, 
                       'ResultFunctor':None},
                      {'ID':404, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]}]}]},
                {'ID':373, 
                 'Class':"IfElse", 
                 'Node':[
                  {'ID':377, 
                   'Class':"And", 
                   'Node':[
                    {'ID':386, 
                     'Class':"Condition", 
                     'Method':(
                      Func12, ())},
                    {'ID':387, 
                     'Class':"Condition", 
                     'Method':(
                      Func13, ())}]},
                  {'ID':378, 
                   'Class':"IfElse", 
                   'Node':[
                    {'ID':388, 
                     'Class':"Condition", 
                     'Method':(
                      Func14, ())},
                    {'ID':389, 
                     'Class':"SelectorProbability", 
                     'RandomGenerator':(
                      battlelogic.bot.agent.a5agent.CAgent.Random,
                      (0, 100)), 
                     'Node':[
                      {'ID':405, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':40, 
                       'Node':[
                        {'ID':419, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]},
                      {'ID':406, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':30, 
                       'Node':[
                        {'ID':420, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]},
                      {'ID':407, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':30, 
                       'Node':[
                        {'ID':421, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]}]},
                    {'ID':390, 
                     'Class':"SelectorProbability", 
                     'RandomGenerator':(
                      battlelogic.bot.agent.a5agent.CAgent.Random,
                      (0, 100)), 
                     'Node':[
                      {'ID':408, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':20, 
                       'Node':[
                        {'ID':422, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]},
                      {'ID':409, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':20, 
                       'Node':[
                        {'ID':423, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]},
                      {'ID':410, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':30, 
                       'Node':[
                        {'ID':424, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]},
                      {'ID':425, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':30, 
                       'Node':[
                        {'ID':426, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]}]}]},
                  {'ID':379, 
                   'Class':"Sequence", 
                   'Node':[
                    {'ID':391, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                     'ResultOption':0, 
                     'ResultFunctor':None},
                    {'ID':392, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                     'ResultOption':0, 
                     'ResultFunctor':None}]}]}]},
              {'ID':430, 
               'Class':"Sequence", 
               'Node':[
                {'ID':431, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (0, 50)), 
                 'ResultOption':0, 
                 'ResultFunctor':None},
                {'ID':432, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                 'ResultOption':0, 
                 'ResultFunctor':None}]}]},
            {'ID':427, 
             'Class':"Sequence", 
             'Node':[
              {'ID':428, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (0, 50)), 
               'ResultOption':0, 
               'ResultFunctor':None},
              {'ID':429, 
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
              Func15, ())},
            {'ID':440, 
             'Class':"Sequence", 
             'Node':[
              {'ID':441, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (0, 50)), 
               'ResultOption':0, 
               'ResultFunctor':None},
              {'ID':442, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
               'ResultOption':0, 
               'ResultFunctor':None}]},
            {'ID':22, 
             'Class':"Noop"}]}]},
        {'ID':15, 
         'Class':"Action", 
         'Method':(
          battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
         'ResultOption':0, 
         'ResultFunctor':None}]}]},
    {'ID':438, 
     'Class':"Sequence", 
     'Node':[
      {'ID':435, 
       'Class':"Action", 
       'Method':(
        battlelogic.bot.agent.a5agent.CAgent.AddState, (3134, )), 
       'ResultOption':0, 
       'ResultFunctor':None},
      {'ID':439, 
       'Class':"Action", 
       'Method':(
        battlelogic.bot.agent.a5agent.CAgent.AddState, (3217, )), 
       'ResultOption':0, 
       'ResultFunctor':None}]}]}]}
