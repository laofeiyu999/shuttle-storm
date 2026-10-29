# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\base\btdata\bt2003.py
# Compiled at: 2023-04-06 17:07:41
# Size of source mod 2**32: 18347 bytes
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


data = {'Name':"bt2003", 
 'ID':0, 
 'AgentType':"battlelogic.bot.agent.a5agent", 
 'IsFSM':False, 
 'Ver':116, 
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
            {'ID':20, 
             'Class':"IfElse", 
             'Node':[
              {'ID':25, 
               'Class':"Condition", 
               'Method':(
                Func6, ())},
              {'ID':26, 
               'Class':"IfElse", 
               'Node':[
                {'ID':31, 
                 'Class':"Condition", 
                 'Method':(
                  Func7, ())},
                {'ID':32, 
                 'Class':"IfElse", 
                 'Node':[
                  {'ID':44, 
                   'Class':"Condition", 
                   'Method':(
                    Func8, ())},
                  {'ID':45, 
                   'Class':"SelectorProbability", 
                   'RandomGenerator':(
                    battlelogic.bot.agent.a5agent.CAgent.Random,
                    (0, 100)), 
                   'Node':[
                    {'ID':63, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':50, 
                     'Node':[
                      {'ID':87, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]},
                    {'ID':65, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':50, 
                     'Node':[
                      {'ID':89, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]}]},
                  {'ID':46, 
                   'Class':"Sequence", 
                   'Node':[
                    {'ID':67, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                     'ResultOption':0, 
                     'ResultFunctor':None},
                    {'ID':68, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                     'ResultOption':0, 
                     'ResultFunctor':None}]}]},
                {'ID':33, 
                 'Class':"IfElse", 
                 'Node':[
                  {'ID':47, 
                   'Class':"Condition", 
                   'Method':(
                    Func9, ())},
                  {'ID':48, 
                   'Class':"SelectorProbability", 
                   'RandomGenerator':(
                    battlelogic.bot.agent.a5agent.CAgent.Random,
                    (0, 100)), 
                   'Node':[
                    {'ID':69, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':40, 
                     'Node':[
                      {'ID':91, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]},
                    {'ID':71, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':40, 
                     'Node':[
                      {'ID':93, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]},
                    {'ID':111, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':20, 
                     'Node':[
                      {'ID':112, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]}]},
                  {'ID':49, 
                   'Class':"Sequence", 
                   'Node':[
                    {'ID':73, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                     'ResultOption':0, 
                     'ResultFunctor':None},
                    {'ID':74, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                     'ResultOption':0, 
                     'ResultFunctor':None}]}]}]},
              {'ID':27, 
               'Class':"IfElse", 
               'Node':[
                {'ID':34, 
                 'Class':"And", 
                 'Node':[
                  {'ID':50, 
                   'Class':"Condition", 
                   'Method':(
                    Func10, ())},
                  {'ID':51, 
                   'Class':"Condition", 
                   'Method':(
                    Func11, ())}]},
                {'ID':35, 
                 'Class':"IfElse", 
                 'Node':[
                  {'ID':52, 
                   'Class':"Condition", 
                   'Method':(
                    Func12, ())},
                  {'ID':53, 
                   'Class':"SelectorProbability", 
                   'RandomGenerator':(
                    battlelogic.bot.agent.a5agent.CAgent.Random,
                    (0, 100)), 
                   'Node':[
                    {'ID':75, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':35, 
                     'Node':[
                      {'ID':95, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]},
                    {'ID':76, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':10, 
                     'Node':[
                      {'ID':96, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]},
                    {'ID':77, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':10, 
                     'Node':[
                      {'ID':97, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]},
                    {'ID':105, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':35, 
                     'Node':[
                      {'ID':106, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]},
                    {'ID':107, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':5, 
                     'Node':[
                      {'ID':108, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]},
                    {'ID':109, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':5, 
                     'Node':[
                      {'ID':110, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]}]},
                  {'ID':54, 
                   'Class':"SelectorProbability", 
                   'RandomGenerator':(
                    battlelogic.bot.agent.a5agent.CAgent.Random,
                    (0, 100)), 
                   'Node':[
                    {'ID':78, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':50, 
                     'Node':[
                      {'ID':98, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]},
                    {'ID':80, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':50, 
                     'Node':[
                      {'ID':100, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]}]}]},
                {'ID':36, 
                 'Class':"Sequence", 
                 'Node':[
                  {'ID':55, 
                   'Class':"Action", 
                   'Method':(
                    battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                   'ResultOption':0, 
                   'ResultFunctor':None},
                  {'ID':56, 
                   'Class':"Action", 
                   'Method':(
                    battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                   'ResultOption':0, 
                   'ResultFunctor':None}]}]}]},
            {'ID':21, 
             'Class':"Action", 
             'Method':(
              battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
             'ResultOption':0, 
             'ResultFunctor':None}]},
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
            Func13, ())},
          {'ID':113, 
           'Class':"Sequence", 
           'Node':[
            {'ID':114, 
             'Class':"Action", 
             'Method':(
              battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (0, 0)), 
             'ResultOption':0, 
             'ResultFunctor':None},
            {'ID':115, 
             'Class':"Action", 
             'Method':(
              battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
             'ResultOption':0, 
             'ResultFunctor':None}]},
          {'ID':18, 
           'Class':"Noop"}]}]},
      {'ID':9, 
       'Class':"Action", 
       'Method':(
        battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
       'ResultOption':0, 
       'ResultFunctor':None}]}]}]}
