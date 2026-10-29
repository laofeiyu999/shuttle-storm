# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\base\btdata\bt6001.py
# Compiled at: 2023-04-06 17:07:41
# Size of source mod 2**32: 6616 bytes
import battlelogic.bot.agent.a5agent

def Func0(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsServePlayer(oAgent) == True


def Func1(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsGameState(3, oAgent) == True


def Func2(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.CouldMove(oAgent) != False


def Func3(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsInTheArea(5, oAgent) == True


data = {'Name':"bt6001", 
 'ID':0, 
 'AgentType':"battlelogic.bot.agent.a5agent", 
 'IsFSM':False, 
 'Ver':148, 
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
    {'ID':322, 
     'Class':"IfElse", 
     'Node':[
      {'ID':471, 
       'Class':"Condition", 
       'Method':(
        Func2, ())},
      {'ID':472, 
       'Class':"IfElse", 
       'Node':[
        {'ID':473, 
         'Class':"Condition", 
         'Method':(
          Func3, ())},
        {'ID':474, 
         'Class':"Sequence", 
         'Node':[
          {'ID':519, 
           'Class':"Sequence", 
           'Node':[
            {'ID':520, 
             'Class':"Action", 
             'Method':(
              battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (50, 140)), 
             'ResultOption':0, 
             'ResultFunctor':None},
            {'ID':521, 
             'Class':"Action", 
             'Method':(
              battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
             'ResultOption':0, 
             'ResultFunctor':None},
            {'ID':522, 
             'Class':"SelectorProbability", 
             'RandomGenerator':(
              battlelogic.bot.agent.a5agent.CAgent.Random,
              (0, 100)), 
             'Node':[
              {'ID':523, 
               'Class':"DecoratorWeight", 
               'DecorateWhenChildEnds':False, 
               'Weight':50, 
               'Node':[
                {'ID':525, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                 'ResultOption':0, 
                 'ResultFunctor':None}]},
              {'ID':524, 
               'Class':"DecoratorWeight", 
               'DecorateWhenChildEnds':False, 
               'Weight':50, 
               'Node':[
                {'ID':526, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                 'ResultOption':0, 
                 'ResultFunctor':None}]}]}]}]},
        {'ID':475, 
         'Class':"Sequence", 
         'Node':[
          {'ID':527, 
           'Class':"Sequence", 
           'Node':[
            {'ID':528, 
             'Class':"Action", 
             'Method':(
              battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (-50, 140)), 
             'ResultOption':0, 
             'ResultFunctor':None},
            {'ID':529, 
             'Class':"Action", 
             'Method':(
              battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
             'ResultOption':0, 
             'ResultFunctor':None},
            {'ID':530, 
             'Class':"SelectorProbability", 
             'RandomGenerator':(
              battlelogic.bot.agent.a5agent.CAgent.Random,
              (0, 100)), 
             'Node':[
              {'ID':531, 
               'Class':"DecoratorWeight", 
               'DecorateWhenChildEnds':False, 
               'Weight':50, 
               'Node':[
                {'ID':533, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                 'ResultOption':0, 
                 'ResultFunctor':None}]},
              {'ID':532, 
               'Class':"DecoratorWeight", 
               'DecorateWhenChildEnds':False, 
               'Weight':50, 
               'Node':[
                {'ID':534, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                 'ResultOption':0, 
                 'ResultFunctor':None}]}]}]}]}]},
      {'ID':514, 
       'Class':"SelectorProbability", 
       'RandomGenerator':(
        battlelogic.bot.agent.a5agent.CAgent.Random,
        (0, 100)), 
       'Node':[
        {'ID':515, 
         'Class':"DecoratorWeight", 
         'DecorateWhenChildEnds':False, 
         'Weight':50, 
         'Node':[
          {'ID':517, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
           'ResultOption':0, 
           'ResultFunctor':None}]},
        {'ID':516, 
         'Class':"DecoratorWeight", 
         'DecorateWhenChildEnds':False, 
         'Weight':50, 
         'Node':[
          {'ID':518, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
           'ResultOption':0, 
           'ResultFunctor':None}]}]}]},
    {'ID':470, 
     'Class':"Noop"}]}]}
