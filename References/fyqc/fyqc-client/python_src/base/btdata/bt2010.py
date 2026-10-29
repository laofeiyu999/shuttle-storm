# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\base\btdata\bt2010.py
# Compiled at: 2023-04-06 17:07:41
# Size of source mod 2**32: 10921 bytes
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
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) < 50.0


def Func7(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) < 200.0


def Func8(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) < 150.0


def Func9(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsAttacker(oAgent) == True


data = {'Name':"bt2010", 
 'ID':0, 
 'AgentType':"battlelogic.bot.agent.a5agent", 
 'IsFSM':False, 
 'Ver':100, 
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
            {'ID':170, 
             'Class':"Condition", 
             'Method':(
              Func5, ())},
            {'ID':321, 
             'Class':"IfElse", 
             'Node':[
              {'ID':322, 
               'Class':"Condition", 
               'Method':(
                Func6, ())},
              {'ID':324, 
               'Class':"SelectorProbability", 
               'RandomGenerator':(
                battlelogic.bot.agent.a5agent.CAgent.Random,
                (0, 100)), 
               'Node':[
                {'ID':325, 
                 'Class':"DecoratorWeight", 
                 'DecorateWhenChildEnds':False, 
                 'Weight':40, 
                 'Node':[
                  {'ID':344, 
                   'Class':"Action", 
                   'Method':(
                    battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                   'ResultOption':0, 
                   'ResultFunctor':None}]},
                {'ID':329, 
                 'Class':"DecoratorWeight", 
                 'DecorateWhenChildEnds':False, 
                 'Weight':40, 
                 'Node':[
                  {'ID':345, 
                   'Class':"Action", 
                   'Method':(
                    battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                   'ResultOption':0, 
                   'ResultFunctor':None}]},
                {'ID':326, 
                 'Class':"DecoratorWeight", 
                 'DecorateWhenChildEnds':False, 
                 'Weight':20, 
                 'Node':[
                  {'ID':346, 
                   'Class':"Action", 
                   'Method':(
                    battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                   'ResultOption':0, 
                   'ResultFunctor':None}]}]},
              {'ID':323, 
               'Class':"IfElse", 
               'Node':[
                {'ID':331, 
                 'Class':"And", 
                 'Node':[
                  {'ID':332, 
                   'Class':"Condition", 
                   'Method':(
                    Func7, ())},
                  {'ID':333, 
                   'Class':"Condition", 
                   'Method':(
                    Func8, ())}]},
                {'ID':334, 
                 'Class':"SelectorProbability", 
                 'RandomGenerator':(
                  battlelogic.bot.agent.a5agent.CAgent.Random,
                  (0, 100)), 
                 'Node':[
                  {'ID':338, 
                   'Class':"DecoratorWeight", 
                   'DecorateWhenChildEnds':False, 
                   'Weight':40, 
                   'Node':[
                    {'ID':347, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                     'ResultOption':0, 
                     'ResultFunctor':None}]},
                  {'ID':340, 
                   'Class':"DecoratorWeight", 
                   'DecorateWhenChildEnds':False, 
                   'Weight':20, 
                   'Node':[
                    {'ID':348, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                     'ResultOption':0, 
                     'ResultFunctor':None}]},
                  {'ID':360, 
                   'Class':"DecoratorWeight", 
                   'DecorateWhenChildEnds':False, 
                   'Weight':40, 
                   'Node':[
                    {'ID':363, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                     'ResultOption':0, 
                     'ResultFunctor':None}]}]},
                {'ID':387, 
                 'Class':"Sequence", 
                 'Node':[
                  {'ID':388, 
                   'Class':"Action", 
                   'Method':(
                    battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                   'ResultOption':0, 
                   'ResultFunctor':None},
                  {'ID':389, 
                   'Class':"Action", 
                   'Method':(
                    battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                   'ResultOption':0, 
                   'ResultFunctor':None}]}]}]},
            {'ID':369, 
             'Class':"Action", 
             'Method':(
              battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
             'ResultOption':0, 
             'ResultFunctor':None}]},
          {'ID':368, 
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
            Func9, ())},
          {'ID':380, 
           'Class':"SelectorProbability", 
           'RandomGenerator':(
            battlelogic.bot.agent.a5agent.CAgent.Random,
            (0, 100)), 
           'Node':[
            {'ID':381, 
             'Class':"DecoratorWeight", 
             'DecorateWhenChildEnds':False, 
             'Weight':30, 
             'Node':[
              {'ID':383, 
               'Class':"Sequence", 
               'Node':[
                {'ID':385, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (0, 50)), 
                 'ResultOption':0, 
                 'ResultFunctor':None},
                {'ID':386, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                 'ResultOption':0, 
                 'ResultFunctor':None}]}]},
            {'ID':382, 
             'Class':"DecoratorWeight", 
             'DecorateWhenChildEnds':False, 
             'Weight':70, 
             'Node':[
              {'ID':384, 
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
