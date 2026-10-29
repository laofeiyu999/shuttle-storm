# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\base\btdata\bt2002.py
# Compiled at: 2023-04-06 17:07:41
# Size of source mod 2**32: 19005 bytes
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
    return battlelogic.bot.agent.a5agent.CAgent.CouldHit(oAgent) == True


def Func6(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) <= 70.0


def Func7(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetDropPosToNetDistance(oAgent) < 300.0


def Func8(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 120.0


def Func9(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 120.0


def Func10(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 120.0


def Func11(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) <= 150.0


def Func12(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetDropPosToNetDistance(oAgent) < 300.0


def Func13(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsAttacker(oAgent) == True


data = {'Name':"bt2002", 
 'ID':0, 
 'AgentType':"battlelogic.bot.agent.a5agent", 
 'IsFSM':False, 
 'Ver':106, 
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
    {'ID':411, 
     'Class':"Action", 
     'Method':(
      battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
     'ResultOption':0, 
     'ResultFunctor':None},
    {'ID':359, 
     'Class':"IfElse", 
     'Node':[
      {'ID':360, 
       'Class':"Condition", 
       'Method':(
        Func2, ())},
      {'ID':361, 
       'Class':"IfElse", 
       'Node':[
        {'ID':363, 
         'Class':"Condition", 
         'Method':(
          Func3, ())},
        {'ID':364, 
         'Class':"IfElse", 
         'Node':[
          {'ID':366, 
           'Class':"Condition", 
           'Method':(
            Func4, ())},
          {'ID':367, 
           'Class':"IfElse", 
           'Node':[
            {'ID':372, 
             'Class':"Condition", 
             'Method':(
              Func5, ())},
            {'ID':373, 
             'Class':"IfElse", 
             'Node':[
              {'ID':380, 
               'Class':"Condition", 
               'Method':(
                Func6, ())},
              {'ID':412, 
               'Class':"IfElse", 
               'Node':[
                {'ID':413, 
                 'Class':"Condition", 
                 'Method':(
                  Func7, ())},
                {'ID':414, 
                 'Class':"IfElse", 
                 'Node':[
                  {'ID':415, 
                   'Class':"Condition", 
                   'Method':(
                    Func8, ())},
                  {'ID':416, 
                   'Class':"SelectorProbability", 
                   'RandomGenerator':(
                    battlelogic.bot.agent.a5agent.CAgent.Random,
                    (0, 100)), 
                   'Node':[
                    {'ID':418, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':40, 
                     'Node':[
                      {'ID':424, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]},
                    {'ID':419, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':40, 
                     'Node':[
                      {'ID':425, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]},
                    {'ID':420, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':10, 
                     'Node':[
                      {'ID':426, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]},
                    {'ID':421, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':10, 
                     'Node':[
                      {'ID':427, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]}]},
                  {'ID':417, 
                   'Class':"Sequence", 
                   'Node':[
                    {'ID':422, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                     'ResultOption':0, 
                     'ResultFunctor':None},
                    {'ID':423, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                     'ResultOption':0, 
                     'ResultFunctor':None}]}]},
                {'ID':428, 
                 'Class':"IfElse", 
                 'Node':[
                  {'ID':429, 
                   'Class':"Condition", 
                   'Method':(
                    Func9, ())},
                  {'ID':430, 
                   'Class':"SelectorProbability", 
                   'RandomGenerator':(
                    battlelogic.bot.agent.a5agent.CAgent.Random,
                    (0, 100)), 
                   'Node':[
                    {'ID':432, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':40, 
                     'Node':[
                      {'ID':438, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]},
                    {'ID':433, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':40, 
                     'Node':[
                      {'ID':439, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]},
                    {'ID':434, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':10, 
                     'Node':[
                      {'ID':440, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]},
                    {'ID':435, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':10, 
                     'Node':[
                      {'ID':441, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]}]},
                  {'ID':431, 
                   'Class':"Sequence", 
                   'Node':[
                    {'ID':436, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                     'ResultOption':0, 
                     'ResultFunctor':None},
                    {'ID':437, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                     'ResultOption':0, 
                     'ResultFunctor':None}]}]}]},
              {'ID':382, 
               'Class':"IfElse", 
               'Node':[
                {'ID':390, 
                 'Class':"And", 
                 'Node':[
                  {'ID':398, 
                   'Class':"Condition", 
                   'Method':(
                    Func10, ())},
                  {'ID':399, 
                   'Class':"Condition", 
                   'Method':(
                    Func11, ())}]},
                {'ID':442, 
                 'Class':"IfElse", 
                 'Node':[
                  {'ID':443, 
                   'Class':"Condition", 
                   'Method':(
                    Func12, ())},
                  {'ID':444, 
                   'Class':"SelectorProbability", 
                   'RandomGenerator':(
                    battlelogic.bot.agent.a5agent.CAgent.Random,
                    (0, 100)), 
                   'Node':[
                    {'ID':447, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':40, 
                     'Node':[
                      {'ID':450, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]},
                    {'ID':487, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':30, 
                     'Node':[
                      {'ID':488, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]},
                    {'ID':489, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':30, 
                     'Node':[
                      {'ID':490, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]}]},
                  {'ID':451, 
                   'Class':"SelectorProbability", 
                   'RandomGenerator':(
                    battlelogic.bot.agent.a5agent.CAgent.Random,
                    (0, 100)), 
                   'Node':[
                    {'ID':453, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':35, 
                     'Node':[
                      {'ID':456, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]},
                    {'ID':454, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':35, 
                     'Node':[
                      {'ID':457, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]},
                    {'ID':491, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':30, 
                     'Node':[
                      {'ID':492, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]}]}]},
                {'ID':392, 
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
            {'ID':497, 
             'Class':"Action", 
             'Method':(
              battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
             'ResultOption':0, 
             'ResultFunctor':None}]},
          {'ID':498, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
           'ResultOption':0, 
           'ResultFunctor':None}]},
        {'ID':458, 
         'Class':"IfElse", 
         'Node':[
          {'ID':459, 
           'Class':"Condition", 
           'Method':(
            Func13, ())},
          {'ID':499, 
           'Class':"Sequence", 
           'Node':[
            {'ID':500, 
             'Class':"Action", 
             'Method':(
              battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (0, 0)), 
             'ResultOption':0, 
             'ResultFunctor':None},
            {'ID':501, 
             'Class':"Action", 
             'Method':(
              battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
             'ResultOption':0, 
             'ResultFunctor':None}]},
          {'ID':461, 
           'Class':"Noop"}]}]},
      {'ID':362, 
       'Class':"Action", 
       'Method':(
        battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
       'ResultOption':0, 
       'ResultFunctor':None}]}]}]}
