# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\base\btdata\bt2213.py
# Compiled at: 2023-04-06 17:07:41
# Size of source mod 2**32: 14114 bytes
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
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) < 120.0


def Func9(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) < 250.0


def Func10(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsAttacker(oAgent) == True


def Func11(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.CouldUseHitKey(128, oAgent) == True


def Func12(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.CouldUseActionType(4, oAgent) == True


data = {'Name':"bt2213", 
 'ID':0, 
 'AgentType':"battlelogic.bot.agent.a5agent", 
 'IsFSM':False, 
 'Ver':101, 
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
    {'ID':451, 
     'Class':"Sequence", 
     'Node':[
      {'ID':452, 
       'Class':"IfElse", 
       'Node':[
        {'ID':454, 
         'Class':"Condition", 
         'Method':(
          Func2, ())},
        {'ID':455, 
         'Class':"Sequence", 
         'Node':[
          {'ID':473, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (20, 50)), 
           'ResultOption':0, 
           'ResultFunctor':None},
          {'ID':474, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
           'ResultOption':0, 
           'ResultFunctor':None}]},
        {'ID':456, 
         'Class':"Sequence", 
         'Node':[
          {'ID':475, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (-20, 50)), 
           'ResultOption':0, 
           'ResultFunctor':None},
          {'ID':476, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
           'ResultOption':0, 
           'ResultFunctor':None}]}]},
      {'ID':453, 
       'Class':"SelectorProbability", 
       'RandomGenerator':(
        battlelogic.bot.agent.a5agent.CAgent.Random,
        (0, 100)), 
       'Node':[
        {'ID':457, 
         'Class':"DecoratorWeight", 
         'DecorateWhenChildEnds':False, 
         'Weight':50, 
         'Node':[
          {'ID':477, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
           'ResultOption':0, 
           'ResultFunctor':None}]},
        {'ID':458, 
         'Class':"DecoratorWeight", 
         'DecorateWhenChildEnds':False, 
         'Weight':50, 
         'Node':[
          {'ID':478, 
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
              {'ID':365, 
               'Class':"SelectorProbability", 
               'RandomGenerator':(
                battlelogic.bot.agent.a5agent.CAgent.Random,
                (0, 100)), 
               'Node':[
                {'ID':384, 
                 'Class':"DecoratorWeight", 
                 'DecorateWhenChildEnds':False, 
                 'Weight':45, 
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
                 'Weight':45, 
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
                 'Weight':10, 
                 'Node':[
                  {'ID':407, 
                   'Class':"Action", 
                   'Method':(
                    battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                   'ResultOption':0, 
                   'ResultFunctor':None}]}]},
              {'ID':324, 
               'Class':"IfElse", 
               'Node':[
                {'ID':343, 
                 'Class':"And", 
                 'Node':[
                  {'ID':361, 
                   'Class':"Condition", 
                   'Method':(
                    Func8, ())},
                  {'ID':362, 
                   'Class':"Condition", 
                   'Method':(
                    Func9, ())}]},
                {'ID':428, 
                 'Class':"SelectorProbability", 
                 'RandomGenerator':(
                  battlelogic.bot.agent.a5agent.CAgent.Random,
                  (0, 100)), 
                 'Node':[
                  {'ID':429, 
                   'Class':"DecoratorWeight", 
                   'DecorateWhenChildEnds':False, 
                   'Weight':45, 
                   'Node':[
                    {'ID':435, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                     'ResultOption':0, 
                     'ResultFunctor':None}]},
                  {'ID':430, 
                   'Class':"DecoratorWeight", 
                   'DecorateWhenChildEnds':False, 
                   'Weight':45, 
                   'Node':[
                    {'ID':436, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                     'ResultOption':0, 
                     'ResultFunctor':None}]},
                  {'ID':431, 
                   'Class':"DecoratorWeight", 
                   'DecorateWhenChildEnds':False, 
                   'Weight':10, 
                   'Node':[
                    {'ID':437, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                     'ResultOption':0, 
                     'ResultFunctor':None}]}]},
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
                   'ResultFunctor':None}]}]}]},
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
        {'ID':19, 
         'Class':"IfElse", 
         'Node':[
          {'ID':20, 
           'Class':"Condition", 
           'Method':(
            Func10, ())},
          {'ID':465, 
           'Class':"IfElse", 
           'Node':[
            {'ID':466, 
             'Class':"And", 
             'Node':[
              {'ID':467, 
               'Class':"Condition", 
               'Method':(
                Func11, ())},
              {'ID':468, 
               'Class':"Condition", 
               'Method':(
                Func12, ())}]},
            {'ID':469, 
             'Class':"Action", 
             'Method':(
              battlelogic.bot.agent.a5agent.CAgent.Hit, (4, 0)), 
             'ResultOption':0, 
             'ResultFunctor':None},
            {'ID':470, 
             'Class':"Sequence", 
             'Node':[
              {'ID':471, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (0, 50)), 
               'ResultOption':0, 
               'ResultFunctor':None},
              {'ID':472, 
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
