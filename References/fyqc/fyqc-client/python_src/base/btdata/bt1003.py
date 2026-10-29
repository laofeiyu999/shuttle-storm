# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\base\btdata\bt1003.py
# Compiled at: 2023-04-06 17:07:41
# Size of source mod 2**32: 8882 bytes
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
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) < 90.0


def Func7(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) < 250.0


def Func8(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsAttacker(oAgent) == True


data = {'Name':"bt1003", 
 'ID':0, 
 'AgentType':"battlelogic.bot.agent.a5agent", 
 'IsFSM':False, 
 'Ver':13, 
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
    {'ID':33, 
     'Class':"Sequence", 
     'Node':[
      {'ID':39, 
       'Class':"WaitFrame", 
       'Frames':50},
      {'ID':34, 
       'Class':"SelectorProbability", 
       'RandomGenerator':(
        battlelogic.bot.agent.a5agent.CAgent.Random,
        (0, 100)), 
       'Node':[
        {'ID':35, 
         'Class':"DecoratorWeight", 
         'DecorateWhenChildEnds':False, 
         'Weight':50, 
         'Node':[
          {'ID':37, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
           'ResultOption':0, 
           'ResultFunctor':None}]},
        {'ID':36, 
         'Class':"DecoratorWeight", 
         'DecorateWhenChildEnds':False, 
         'Weight':50, 
         'Node':[
          {'ID':38, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
           'ResultOption':0, 
           'ResultFunctor':None}]}]}]},
    {'ID':4, 
     'Class':"IfElse", 
     'Node':[
      {'ID':9, 
       'Class':"Condition", 
       'Method':(
        Func2, ())},
      {'ID':10, 
       'Class':"IfElse", 
       'Node':[
        {'ID':14, 
         'Class':"Condition", 
         'Method':(
          Func3, ())},
        {'ID':41, 
         'Class':"IfElse", 
         'Node':[
          {'ID':42, 
           'Class':"Condition", 
           'Method':(
            Func4, ())},
          {'ID':40, 
           'Class':"IfElse", 
           'Node':[
            {'ID':43, 
             'Class':"Condition", 
             'Method':(
              Func5, ())},
            {'ID':15, 
             'Class':"IfElse", 
             'Node':[
              {'ID':50, 
               'Class':"And", 
               'Node':[
                {'ID':51, 
                 'Class':"Condition", 
                 'Method':(
                  Func6, ())},
                {'ID':52, 
                 'Class':"Condition", 
                 'Method':(
                  Func7, ())}]},
              {'ID':18, 
               'Class':"SelectorProbability", 
               'RandomGenerator':(
                battlelogic.bot.agent.a5agent.CAgent.Random,
                (0, 100)), 
               'Node':[
                {'ID':23, 
                 'Class':"DecoratorWeight", 
                 'DecorateWhenChildEnds':False, 
                 'Weight':50, 
                 'Node':[
                  {'ID':31, 
                   'Class':"Action", 
                   'Method':(
                    battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                   'ResultOption':0, 
                   'ResultFunctor':None}]},
                {'ID':24, 
                 'Class':"DecoratorWeight", 
                 'DecorateWhenChildEnds':False, 
                 'Weight':50, 
                 'Node':[
                  {'ID':32, 
                   'Class':"Action", 
                   'Method':(
                    battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                   'ResultOption':0, 
                   'ResultFunctor':None}]}]},
              {'ID':19, 
               'Class':"Sequence", 
               'Node':[
                {'ID':25, 
                 'Class':"WaitFrame", 
                 'Frames':15},
                {'ID':26, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 0)), 
                 'ResultOption':0, 
                 'ResultFunctor':None},
                {'ID':27, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                 'ResultOption':0, 
                 'ResultFunctor':None}]}]},
            {'ID':44, 
             'Class':"Sequence", 
             'Node':[
              {'ID':46, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 0)), 
               'ResultOption':0, 
               'ResultFunctor':None},
              {'ID':48, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
               'ResultOption':0, 
               'ResultFunctor':None}]}]},
          {'ID':45, 
           'Class':"Sequence", 
           'Node':[
            {'ID':47, 
             'Class':"Action", 
             'Method':(
              battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 0)), 
             'ResultOption':0, 
             'ResultFunctor':None},
            {'ID':49, 
             'Class':"Action", 
             'Method':(
              battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
             'ResultOption':0, 
             'ResultFunctor':None}]}]},
        {'ID':16, 
         'Class':"IfElse", 
         'Node':[
          {'ID':20, 
           'Class':"Condition", 
           'Method':(
            Func8, ())},
          {'ID':21, 
           'Class':"Sequence", 
           'Node':[
            {'ID':28, 
             'Class':"WaitFrame", 
             'Frames':15},
            {'ID':29, 
             'Class':"Action", 
             'Method':(
              battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (0, 0)), 
             'ResultOption':0, 
             'ResultFunctor':None},
            {'ID':30, 
             'Class':"Action", 
             'Method':(
              battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
             'ResultOption':0, 
             'ResultFunctor':None}]},
          {'ID':22, 
           'Class':"Noop"}]}]},
      {'ID':11, 
       'Class':"Action", 
       'Method':(
        battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
       'ResultOption':0, 
       'ResultFunctor':None}]}]}]}
