# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\base\btdata\bt2104.py
# Compiled at: 2023-04-06 17:07:41
# Size of source mod 2**32: 18493 bytes
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
    return battlelogic.bot.agent.a5agent.CAgent.IsTheCurveShapeType(4, oAgent) == False


def Func6(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.CouldHit(oAgent) == True


def Func7(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) < 50.0


def Func8(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) < 200.0


def Func9(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) < 150.0


def Func10(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) < 5.0


def Func11(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsAttacker(oAgent) == True


def Func12(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsPropertyPlay(oAgent) == True


def Func13(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.HasTeammatePropertyBox(oAgent) == True


def Func14(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.CouldUseHitKey(64, oAgent) == True


data = {'Name':"bt2104", 
 'ID':0, 
 'AgentType':"battlelogic.bot.agent.a5agent", 
 'IsFSM':False, 
 'Ver':90, 
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
    {'ID':350, 
     'Class':"SelectorProbability", 
     'RandomGenerator':(
      battlelogic.bot.agent.a5agent.CAgent.Random,
      (0, 100)), 
     'Node':[
      {'ID':351, 
       'Class':"DecoratorWeight", 
       'DecorateWhenChildEnds':False, 
       'Weight':100, 
       'Node':[
        {'ID':353, 
         'Class':"Action", 
         'Method':(
          battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
         'ResultOption':0, 
         'ResultFunctor':None}]},
      {'ID':352, 
       'Class':"DecoratorWeight", 
       'DecorateWhenChildEnds':False, 
       'Weight':0, 
       'Node':[
        {'ID':354, 
         'Class':"Action", 
         'Method':(
          battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
         'ResultOption':0, 
         'ResultFunctor':None}]}]},
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
          {'ID':382, 
           'Class':"IfElse", 
           'Node':[
            {'ID':383, 
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
                      Func8, ())},
                    {'ID':333, 
                     'Class':"Condition", 
                     'Method':(
                      Func9, ())}]},
                  {'ID':334, 
                   'Class':"SelectorProbability", 
                   'RandomGenerator':(
                    battlelogic.bot.agent.a5agent.CAgent.Random,
                    (0, 100)), 
                   'Node':[
                    {'ID':338, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':16, 
                     'Node':[
                      {'ID':347, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]},
                    {'ID':339, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':16, 
                     'Node':[
                      {'ID':327, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]},
                    {'ID':358, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':8, 
                     'Node':[
                      {'ID':361, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]},
                    {'ID':340, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':16, 
                     'Node':[
                      {'ID':348, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]},
                    {'ID':341, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':16, 
                     'Node':[
                      {'ID':330, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]},
                    {'ID':359, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':8, 
                     'Node':[
                      {'ID':362, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]},
                    {'ID':342, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':8, 
                     'Node':[
                      {'ID':349, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]},
                    {'ID':343, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':8, 
                     'Node':[
                      {'ID':328, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]},
                    {'ID':360, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':4, 
                     'Node':[
                      {'ID':363, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]}]},
                  {'ID':335, 
                   'Class':"Sequence", 
                   'Node':[
                    {'ID':336, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                     'ResultOption':0, 
                     'ResultFunctor':None},
                    {'ID':337, 
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
            {'ID':384, 
             'Class':"IfElse", 
             'Node':[
              {'ID':385, 
               'Class':"Condition", 
               'Method':(
                Func10, ())},
              {'ID':386, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
               'ResultOption':0, 
               'ResultFunctor':None},
              {'ID':387, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
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
        {'ID':364, 
         'Class':"IfElse", 
         'Node':[
          {'ID':365, 
           'Class':"Condition", 
           'Method':(
            Func11, ())},
          {'ID':366, 
           'Class':"IfElse", 
           'Node':[
            {'ID':368, 
             'Class':"Condition", 
             'Method':(
              Func12, ())},
            {'ID':369, 
             'Class':"Sequence", 
             'Node':[
              {'ID':371, 
               'Class':"IfElse", 
               'Node':[
                {'ID':375, 
                 'Class':"Condition", 
                 'Method':(
                  Func13, ())},
                {'ID':376, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.MoveToPropertyBox, ()), 
                 'ResultOption':0, 
                 'ResultFunctor':None},
                {'ID':377, 
                 'Class':"Noop"}]},
              {'ID':372, 
               'Class':"IfElse", 
               'Node':[
                {'ID':378, 
                 'Class':"Condition", 
                 'Method':(
                  Func14, ())},
                {'ID':379, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.Hit, (64, 0)), 
                 'ResultOption':0, 
                 'ResultFunctor':None},
                {'ID':380, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                 'ResultOption':0, 
                 'ResultFunctor':None}]}]},
            {'ID':381, 
             'Class':"Action", 
             'Method':(
              battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
             'ResultOption':0, 
             'ResultFunctor':None}]},
          {'ID':367, 
           'Class':"Noop"}]}]},
      {'ID':15, 
       'Class':"Action", 
       'Method':(
        battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
       'ResultOption':0, 
       'ResultFunctor':None}]}]}]}
