# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\base\btdata\bt2102.py
# Compiled at: 2023-04-06 17:07:41
# Size of source mod 2**32: 21361 bytes
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
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) > 250.0


def Func9(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) < 200.0


def Func10(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) < 150.0


def Func11(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) < 5.0


def Func12(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsAttacker(oAgent) == True


def Func13(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsPropertyPlay(oAgent) == True


def Func14(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.HasTeammatePropertyBox(oAgent) == True


def Func15(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.CouldUseHitKey(64, oAgent) == True


data = {'Name':"bt2102", 
 'ID':0, 
 'AgentType':"battlelogic.bot.agent.a5agent", 
 'IsFSM':False, 
 'Ver':95, 
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
       'Weight':0, 
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
       'Weight':100, 
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
          {'ID':383, 
           'Class':"IfElse", 
           'Node':[
            {'ID':384, 
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
                  {'ID':329, 
                   'Class':"DecoratorWeight", 
                   'DecorateWhenChildEnds':False, 
                   'Weight':50, 
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
                   'Weight':50, 
                   'Node':[
                    {'ID':346, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                     'ResultOption':0, 
                     'ResultFunctor':None}]}]},
                {'ID':389, 
                 'Class':"IfElse", 
                 'Node':[
                  {'ID':390, 
                   'Class':"Condition", 
                   'Method':(
                    Func8, ())},
                  {'ID':391, 
                   'Class':"SelectorProbability", 
                   'RandomGenerator':(
                    battlelogic.bot.agent.a5agent.CAgent.Random,
                    (0, 100)), 
                   'Node':[
                    {'ID':412, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':50, 
                     'Node':[
                      {'ID':414, 
                       'Class':"SelectorProbability", 
                       'RandomGenerator':(
                        battlelogic.bot.agent.a5agent.CAgent.Random,
                        (0, 100)), 
                       'Node':[
                        {'ID':415, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':50, 
                         'Node':[
                          {'ID':417, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':416, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':50, 
                         'Node':[
                          {'ID':418, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]}]}]},
                    {'ID':413, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':50, 
                     'Node':[
                      {'ID':419, 
                       'Class':"Sequence", 
                       'Node':[
                        {'ID':420, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                         'ResultOption':0, 
                         'ResultFunctor':None},
                        {'ID':421, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]}]}]},
                  {'ID':392, 
                   'Class':"IfElse", 
                   'Node':[
                    {'ID':393, 
                     'Class':"And", 
                     'Node':[
                      {'ID':396, 
                       'Class':"Condition", 
                       'Method':(
                        Func9, ())},
                      {'ID':397, 
                       'Class':"Condition", 
                       'Method':(
                        Func10, ())}]},
                    {'ID':394, 
                     'Class':"SelectorProbability", 
                     'RandomGenerator':(
                      battlelogic.bot.agent.a5agent.CAgent.Random,
                      (0, 100)), 
                     'Node':[
                      {'ID':398, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':22, 
                       'Node':[
                        {'ID':406, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]},
                      {'ID':399, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':23, 
                       'Node':[
                        {'ID':407, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]},
                      {'ID':400, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':12, 
                       'Node':[
                        {'ID':408, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]},
                      {'ID':401, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':18, 
                       'Node':[
                        {'ID':409, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]},
                      {'ID':402, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':18, 
                       'Node':[
                        {'ID':410, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]},
                      {'ID':403, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':7, 
                       'Node':[
                        {'ID':411, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]}]},
                    {'ID':395, 
                     'Class':"Sequence", 
                     'Node':[
                      {'ID':404, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                       'ResultOption':0, 
                       'ResultFunctor':None},
                      {'ID':405, 
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
            {'ID':385, 
             'Class':"IfElse", 
             'Node':[
              {'ID':386, 
               'Class':"Condition", 
               'Method':(
                Func11, ())},
              {'ID':387, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
               'ResultOption':0, 
               'ResultFunctor':None},
              {'ID':388, 
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
            Func12, ())},
          {'ID':366, 
           'Class':"IfElse", 
           'Node':[
            {'ID':368, 
             'Class':"Condition", 
             'Method':(
              Func13, ())},
            {'ID':369, 
             'Class':"Sequence", 
             'Node':[
              {'ID':371, 
               'Class':"IfElse", 
               'Node':[
                {'ID':375, 
                 'Class':"Condition", 
                 'Method':(
                  Func14, ())},
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
                  Func15, ())},
                {'ID':379, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.Hit, (64, 0)), 
                 'ResultOption':0, 
                 'ResultFunctor':None},
                {'ID':380, 
                 'Class':"Sequence", 
                 'Node':[
                  {'ID':381, 
                   'Class':"Action", 
                   'Method':(
                    battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (0, 0)), 
                   'ResultOption':0, 
                   'ResultFunctor':None},
                  {'ID':382, 
                   'Class':"Action", 
                   'Method':(
                    battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                   'ResultOption':0, 
                   'ResultFunctor':None}]}]}]},
            {'ID':370, 
             'Class':"Sequence", 
             'Node':[
              {'ID':373, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (0, 0)), 
               'ResultOption':0, 
               'ResultFunctor':None},
              {'ID':374, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
               'ResultOption':0, 
               'ResultFunctor':None}]}]},
          {'ID':367, 
           'Class':"Noop"}]}]},
      {'ID':15, 
       'Class':"Action", 
       'Method':(
        battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
       'ResultOption':0, 
       'ResultFunctor':None}]}]}]}
