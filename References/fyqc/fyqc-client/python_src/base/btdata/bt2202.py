# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\base\btdata\bt2202.py
# Compiled at: 2023-04-06 17:07:41
# Size of source mod 2**32: 7375 bytes
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
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) < 250.0


def Func7(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsAttacker(oAgent) == True


data = {'Name':"bt2202", 
 'ID':0, 
 'AgentType':"battlelogic.bot.agent.a5agent", 
 'IsFSM':False, 
 'Ver':98, 
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
    {'ID':441, 
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
        Func2, ())},
      {'ID':14, 
       'Class':"IfElse", 
       'Node':[
        {'ID':18, 
         'Class':"Condition", 
         'Method':(
          Func3, ())},
        {'ID':161, 
         'Class':"IfElse", 
         'Node':[
          {'ID':162, 
           'Class':"Condition", 
           'Method':(
            Func4, ())},
          {'ID':160, 
           'Class':"IfElse", 
           'Node':[
            {'ID':448, 
             'Class':"And", 
             'Node':[
              {'ID':170, 
               'Class':"Condition", 
               'Method':(
                Func5, ())},
              {'ID':449, 
               'Class':"Condition", 
               'Method':(
                Func6, ())}]},
            {'ID':365, 
             'Class':"SelectorProbability", 
             'RandomGenerator':(
              battlelogic.bot.agent.a5agent.CAgent.Random,
              (0, 100)), 
             'Node':[
              {'ID':384, 
               'Class':"DecoratorWeight", 
               'DecorateWhenChildEnds':False, 
               'Weight':10, 
               'Node':[
                {'ID':405, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                 'ResultOption':0, 
                 'ResultFunctor':None}]},
              {'ID':385, 
               'Class':"DecoratorWeight", 
               'DecorateWhenChildEnds':False, 
               'Weight':10, 
               'Node':[
                {'ID':406, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                 'ResultOption':0, 
                 'ResultFunctor':None}]},
              {'ID':386, 
               'Class':"DecoratorWeight", 
               'DecorateWhenChildEnds':False, 
               'Weight':30, 
               'Node':[
                {'ID':407, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                 'ResultOption':0, 
                 'ResultFunctor':None}]},
              {'ID':390, 
               'Class':"DecoratorWeight", 
               'DecorateWhenChildEnds':False, 
               'Weight':10, 
               'Node':[
                {'ID':411, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                 'ResultOption':0, 
                 'ResultFunctor':None}]},
              {'ID':391, 
               'Class':"DecoratorWeight", 
               'DecorateWhenChildEnds':False, 
               'Weight':10, 
               'Node':[
                {'ID':412, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                 'ResultOption':0, 
                 'ResultFunctor':None}]},
              {'ID':392, 
               'Class':"DecoratorWeight", 
               'DecorateWhenChildEnds':False, 
               'Weight':30, 
               'Node':[
                {'ID':413, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                 'ResultOption':0, 
                 'ResultFunctor':None}]}]},
            {'ID':447, 
             'Class':"Action", 
             'Method':(
              battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
             'ResultOption':0, 
             'ResultFunctor':None}]},
          {'ID':446, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
           'ResultOption':0, 
           'ResultFunctor':None}]},
        {'ID':19, 
         'Class':"IfElse", 
         'Node':[
          {'ID':20, 
           'Class':"Condition", 
           'Method':(
            Func7, ())},
          {'ID':427, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (0, -200)), 
           'ResultOption':0, 
           'ResultFunctor':None},
          {'ID':445, 
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
       'ResultFunctor':None}]}]}]}
