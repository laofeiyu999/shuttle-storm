# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\base\btdata\bt5001.py
# Compiled at: 2023-04-06 17:07:41
# Size of source mod 2**32: 31466 bytes
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
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) < 50.0


def Func8(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.CouldUseActionType(4, oAgent) == True


def Func9(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) > 150.0


def Func10(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetDropPosToNetDistance(oAgent) < 350.0


def Func11(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) < 90.0


def Func12(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) < 260.0


def Func13(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) < 125.0


def Func14(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetAttackerToNetDistanc(oAgent) < 400.0


def Func15(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) < 150.0


def Func16(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) < 265.0


def Func17(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetAttackerToNetDistanc(oAgent) < 400.0


def Func18(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsAttacker(oAgent) == True


def Func19(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsInTheArea(5, oAgent) == True


data = {'Name':"bt5001", 
 'ID':0, 
 'AgentType':"battlelogic.bot.agent.a5agent", 
 'IsFSM':False, 
 'Ver':52, 
 'Node':[
  {'ID':1, 
   'Class':"IfElse", 
   'Node':[
    {'ID':3, 
     'Class':"And", 
     'Node':[
      {'ID':2, 
       'Class':"Condition", 
       'Method':(
        Func0, ())},
      {'ID':4, 
       'Class':"Condition", 
       'Method':(
        Func1, ())}]},
    {'ID':67, 
     'Class':"Sequence", 
     'Node':[
      {'ID':130, 
       'Class':"IfElse", 
       'Node':[
        {'ID':132, 
         'Class':"Condition", 
         'Method':(
          Func2, ())},
        {'ID':133, 
         'Class':"Sequence", 
         'Node':[
          {'ID':137, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (20, 30)), 
           'ResultOption':0, 
           'ResultFunctor':None},
          {'ID':138, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
           'ResultOption':0, 
           'ResultFunctor':None}]},
        {'ID':134, 
         'Class':"Sequence", 
         'Node':[
          {'ID':139, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (-20, 30)), 
           'ResultOption':0, 
           'ResultFunctor':None},
          {'ID':140, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
           'ResultOption':0, 
           'ResultFunctor':None}]}]},
      {'ID':131, 
       'Class':"SelectorProbability", 
       'RandomGenerator':(
        battlelogic.bot.agent.a5agent.CAgent.Random,
        (0, 100)), 
       'Node':[
        {'ID':232, 
         'Class':"DecoratorWeight", 
         'DecorateWhenChildEnds':False, 
         'Weight':50, 
         'Node':[
          {'ID':234, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
           'ResultOption':0, 
           'ResultFunctor':None}]},
        {'ID':233, 
         'Class':"DecoratorWeight", 
         'DecorateWhenChildEnds':False, 
         'Weight':50, 
         'Node':[
          {'ID':235, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
           'ResultOption':0, 
           'ResultFunctor':None}]}]}]},
    {'ID':6, 
     'Class':"IfElse", 
     'Node':[
      {'ID':11, 
       'Class':"Condition", 
       'Method':(
        Func3, ())},
      {'ID':12, 
       'Class':"IfElse", 
       'Node':[
        {'ID':14, 
         'Class':"Condition", 
         'Method':(
          Func4, ())},
        {'ID':15, 
         'Class':"IfElse", 
         'Node':[
          {'ID':24, 
           'Class':"Condition", 
           'Method':(
            Func5, ())},
          {'ID':22, 
           'Class':"IfElse", 
           'Node':[
            {'ID':25, 
             'Class':"Condition", 
             'Method':(
              Func6, ())},
            {'ID':81, 
             'Class':"IfElse", 
             'Node':[
              {'ID':82, 
               'Class':"Condition", 
               'Method':(
                Func7, ())},
              {'ID':226, 
               'Class':"IfElse", 
               'Node':[
                {'ID':228, 
                 'Class':"And", 
                 'Node':[
                  {'ID':230, 
                   'Class':"Condition", 
                   'Method':(
                    Func8, ())},
                  {'ID':236, 
                   'Class':"Condition", 
                   'Method':(
                    Func9, ())}]},
                {'ID':254, 
                 'Class':"Sequence", 
                 'Node':[
                  {'ID':231, 
                   'Class':"Action", 
                   'Method':(
                    battlelogic.bot.agent.a5agent.CAgent.Hit, (4, 0)), 
                   'ResultOption':0, 
                   'ResultFunctor':None}]},
                {'ID':144, 
                 'Class':"SelectorProbability", 
                 'RandomGenerator':(
                  battlelogic.bot.agent.a5agent.CAgent.Random,
                  (0, 100)), 
                 'Node':[
                  {'ID':149, 
                   'Class':"DecoratorWeight", 
                   'DecorateWhenChildEnds':False, 
                   'Weight':48, 
                   'Node':[
                    {'ID':161, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                     'ResultOption':0, 
                     'ResultFunctor':None}]},
                  {'ID':150, 
                   'Class':"DecoratorWeight", 
                   'DecorateWhenChildEnds':False, 
                   'Weight':48, 
                   'Node':[
                    {'ID':162, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                     'ResultOption':0, 
                     'ResultFunctor':None}]},
                  {'ID':151, 
                   'Class':"DecoratorWeight", 
                   'DecorateWhenChildEnds':False, 
                   'Weight':4, 
                   'Node':[
                    {'ID':163, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                     'ResultOption':0, 
                     'ResultFunctor':None}]}]}]},
              {'ID':84, 
               'Class':"IfElse", 
               'Node':[
                {'ID':88, 
                 'Class':"Condition", 
                 'Method':(
                  Func10, ())},
                {'ID':89, 
                 'Class':"IfElse", 
                 'Node':[
                  {'ID':237, 
                   'Class':"And", 
                   'Node':[
                    {'ID':238, 
                     'Class':"Condition", 
                     'Method':(
                      Func11, ())},
                    {'ID':239, 
                     'Class':"Condition", 
                     'Method':(
                      Func12, ())}]},
                  {'ID':156, 
                   'Class':"IfElse", 
                   'Node':[
                    {'ID':167, 
                     'Class':"Condition", 
                     'Method':(
                      Func13, ())},
                    {'ID':168, 
                     'Class':"SelectorProbability", 
                     'RandomGenerator':(
                      battlelogic.bot.agent.a5agent.CAgent.Random,
                      (0, 100)), 
                     'Node':[
                      {'ID':180, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':48, 
                       'Node':[
                        {'ID':195, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]},
                      {'ID':181, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':48, 
                       'Node':[
                        {'ID':196, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]},
                      {'ID':182, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':4, 
                       'Node':[
                        {'ID':197, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]}]},
                    {'ID':211, 
                     'Class':"IfElse", 
                     'Node':[
                      {'ID':212, 
                       'Class':"Condition", 
                       'Method':(
                        Func14, ())},
                      {'ID':169, 
                       'Class':"SelectorProbability", 
                       'RandomGenerator':(
                        battlelogic.bot.agent.a5agent.CAgent.Random,
                        (0, 100)), 
                       'Node':[
                        {'ID':183, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':23, 
                         'Node':[
                          {'ID':198, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':184, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':23, 
                         'Node':[
                          {'ID':199, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':185, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':4, 
                         'Node':[
                          {'ID':200, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':220, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':23, 
                         'Node':[
                          {'ID':225, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':221, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':23, 
                         'Node':[
                          {'ID':224, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':222, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':4, 
                         'Node':[
                          {'ID':223, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]}]},
                      {'ID':213, 
                       'Class':"SelectorProbability", 
                       'RandomGenerator':(
                        battlelogic.bot.agent.a5agent.CAgent.Random,
                        (0, 100)), 
                       'Node':[
                        {'ID':186, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':50, 
                         'Node':[
                          {'ID':201, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':187, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':50, 
                         'Node':[
                          {'ID':202, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]}]}]}]},
                  {'ID':157, 
                   'Class':"Sequence", 
                   'Node':[
                    {'ID':170, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 30)), 
                     'ResultOption':0, 
                     'ResultFunctor':None},
                    {'ID':171, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                     'ResultOption':0, 
                     'ResultFunctor':None}]}]},
                {'ID':90, 
                 'Class':"IfElse", 
                 'Node':[
                  {'ID':243, 
                   'Class':"And", 
                   'Node':[
                    {'ID':241, 
                     'Class':"Condition", 
                     'Method':(
                      Func15, ())},
                    {'ID':240, 
                     'Class':"Condition", 
                     'Method':(
                      Func16, ())}]},
                  {'ID':204, 
                   'Class':"IfElse", 
                   'Node':[
                    {'ID':244, 
                     'Class':"Condition", 
                     'Method':(
                      Func17, ())},
                    {'ID':104, 
                     'Class':"SelectorProbability", 
                     'RandomGenerator':(
                      battlelogic.bot.agent.a5agent.CAgent.Random,
                      (0, 100)), 
                     'Node':[
                      {'ID':174, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':23, 
                       'Node':[
                        {'ID':189, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]},
                      {'ID':175, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':23, 
                       'Node':[
                        {'ID':190, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]},
                      {'ID':218, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':4, 
                       'Node':[
                        {'ID':219, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]},
                      {'ID':207, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':23, 
                       'Node':[
                        {'ID':208, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]},
                      {'ID':214, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':23, 
                       'Node':[
                        {'ID':215, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]},
                      {'ID':216, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':4, 
                       'Node':[
                        {'ID':217, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]}]},
                    {'ID':206, 
                     'Class':"SelectorProbability", 
                     'RandomGenerator':(
                      battlelogic.bot.agent.a5agent.CAgent.Random,
                      (0, 100)), 
                     'Node':[
                      {'ID':178, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':50, 
                       'Node':[
                        {'ID':193, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]},
                      {'ID':177, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':50, 
                       'Node':[
                        {'ID':192, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]}]}]},
                  {'ID':105, 
                   'Class':"Sequence", 
                   'Node':[
                    {'ID':128, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 30)), 
                     'ResultOption':0, 
                     'ResultFunctor':None},
                    {'ID':129, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                     'ResultOption':0, 
                     'ResultFunctor':None}]}]}]}]},
            {'ID':28, 
             'Class':"Sequence", 
             'Node':[
              {'ID':30, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 30)), 
               'ResultOption':0, 
               'ResultFunctor':None},
              {'ID':32, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
               'ResultOption':0, 
               'ResultFunctor':None}]}]},
          {'ID':27, 
           'Class':"Sequence", 
           'Node':[
            {'ID':31, 
             'Class':"Action", 
             'Method':(
              battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 30)), 
             'ResultOption':0, 
             'ResultFunctor':None},
            {'ID':29, 
             'Class':"Action", 
             'Method':(
              battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
             'ResultOption':0, 
             'ResultFunctor':None}]}]},
        {'ID':16, 
         'Class':"IfElse", 
         'Node':[
          {'ID':17, 
           'Class':"Condition", 
           'Method':(
            Func18, ())},
          {'ID':18, 
           'Class':"Sequence", 
           'Node':[
            {'ID':20, 
             'Class':"Action", 
             'Method':(
              battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (0, 30)), 
             'ResultOption':0, 
             'ResultFunctor':None},
            {'ID':21, 
             'Class':"Action", 
             'Method':(
              battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
             'ResultOption':0, 
             'ResultFunctor':None}]},
          {'ID':19, 
           'Class':"Noop"}]}]},
      {'ID':245, 
       'Class':"IfElse", 
       'Node':[
        {'ID':246, 
         'Class':"Condition", 
         'Method':(
          Func19, ())},
        {'ID':247, 
         'Class':"Sequence", 
         'Node':[
          {'ID':249, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (125, 125)), 
           'ResultOption':0, 
           'ResultFunctor':None},
          {'ID':251, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
           'ResultOption':0, 
           'ResultFunctor':None}]},
        {'ID':248, 
         'Class':"Sequence", 
         'Node':[
          {'ID':250, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (-125, 125)), 
           'ResultOption':0, 
           'ResultFunctor':None},
          {'ID':252, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
           'ResultOption':0, 
           'ResultFunctor':None}]}]}]}]}]}
