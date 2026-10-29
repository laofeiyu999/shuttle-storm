# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\base\btdata\bt10103.py
# Compiled at: 2023-04-06 17:07:41
# Size of source mod 2**32: 73758 bytes
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
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) <= 400.0


def Func6(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.CouldDoAction(oAgent) == True


def Func7(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.CouldHit(oAgent) == True


def Func8(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.HasStarMarkArea(oAgent) == True


def Func9(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsInStarMarkArea(oAgent) == True


def Func10(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) <= 400.0


def Func11(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsTheCurveShapeType(4, oAgent) == True


def Func12(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) < 5.0


def Func13(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 170.0


def Func14(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) <= 50.0


def Func15(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 200.0


def Func16(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.CouldUseHitKey(4, oAgent) == True


def Func17(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsDropPosInFrontBackLine(oAgent) == True


def Func18(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) < 150.0


def Func19(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 200.0


def Func20(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) >= 150.0


def Func21(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.CouldUseHitKey(4, oAgent) == True


def Func22(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 70.0


def Func23(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsDropPosInFrontBackLine(oAgent) == True


def Func24(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.HasStarMarkArea(oAgent) == True


def Func25(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsAttacker(oAgent) == True


def Func26(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsInTheArea(5, oAgent) == True


data = {'Name':"bt10103", 
 'ID':0, 
 'AgentType':"battlelogic.bot.agent.a5agent", 
 'IsFSM':False, 
 'Ver':6, 
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
    {'ID':224, 
     'Class':"Sequence", 
     'Node':[
      {'ID':225, 
       'Class':"IfElse", 
       'Node':[
        {'ID':227, 
         'Class':"Condition", 
         'Method':(
          Func2, ())},
        {'ID':228, 
         'Class':"Sequence", 
         'Node':[
          {'ID':232, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (20, 50)), 
           'ResultOption':0, 
           'ResultFunctor':None},
          {'ID':233, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
           'ResultOption':0, 
           'ResultFunctor':None}]},
        {'ID':229, 
         'Class':"Sequence", 
         'Node':[
          {'ID':234, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (-20, 50)), 
           'ResultOption':0, 
           'ResultFunctor':None},
          {'ID':235, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
           'ResultOption':0, 
           'ResultFunctor':None}]}]},
      {'ID':226, 
       'Class':"SelectorProbability", 
       'RandomGenerator':(
        battlelogic.bot.agent.a5agent.CAgent.Random,
        (0, 100)), 
       'Node':[
        {'ID':230, 
         'Class':"DecoratorWeight", 
         'DecorateWhenChildEnds':False, 
         'Weight':50, 
         'Node':[
          {'ID':236, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
           'ResultOption':0, 
           'ResultFunctor':None}]},
        {'ID':231, 
         'Class':"DecoratorWeight", 
         'DecorateWhenChildEnds':False, 
         'Weight':50, 
         'Node':[
          {'ID':237, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
           'ResultOption':0, 
           'ResultFunctor':None}]}]}]},
    {'ID':4, 
     'Class':"IfElse", 
     'Node':[
      {'ID':7, 
       'Class':"Condition", 
       'Method':(
        Func3, ())},
      {'ID':8, 
       'Class':"IfElse", 
       'Node':[
        {'ID':10, 
         'Class':"Condition", 
         'Method':(
          Func4, ())},
        {'ID':11, 
         'Class':"IfElse", 
         'Node':[
          {'ID':16, 
           'Class':"Condition", 
           'Method':(
            Func5, ())},
          {'ID':17, 
           'Class':"IfElse", 
           'Node':[
            {'ID':26, 
             'Class':"Condition", 
             'Method':(
              Func6, ())},
            {'ID':27, 
             'Class':"IfElse", 
             'Node':[
              {'ID':34, 
               'Class':"Condition", 
               'Method':(
                Func7, ())},
              {'ID':53, 
               'Class':"IfElse", 
               'Node':[
                {'ID':57, 
                 'Class':"Condition", 
                 'Method':(
                  Func8, ())},
                {'ID':202, 
                 'Class':"IfElse", 
                 'Node':[
                  {'ID':203, 
                   'Class':"Condition", 
                   'Method':(
                    Func9, ())},
                  {'ID':204, 
                   'Class':"SelectorProbability", 
                   'RandomGenerator':(
                    battlelogic.bot.agent.a5agent.CAgent.Random,
                    (0, 100)), 
                   'Node':[
                    {'ID':208, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':50, 
                     'Node':[
                      {'ID':214, 
                       'Class':"SelectorProbability", 
                       'RandomGenerator':(
                        battlelogic.bot.agent.a5agent.CAgent.Random,
                        (0, 100)), 
                       'Node':[
                        {'ID':215, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':35, 
                         'Node':[
                          {'ID':218, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':216, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':30, 
                         'Node':[
                          {'ID':219, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':217, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':35, 
                         'Node':[
                          {'ID':220, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]}]}]},
                    {'ID':209, 
                     'Class':"DecoratorWeight", 
                     'DecorateWhenChildEnds':False, 
                     'Weight':50, 
                     'Node':[
                      {'ID':213, 
                       'Class':"Noop"}]}]},
                  {'ID':205, 
                   'Class':"Sequence", 
                   'Node':[
                    {'ID':206, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.MoveToStarMarkArea, ()), 
                     'ResultOption':0, 
                     'ResultFunctor':None},
                    {'ID':207, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                     'ResultOption':0, 
                     'ResultFunctor':None}]}]},
                {'ID':50, 
                 'Class':"IfElse", 
                 'Node':[
                  {'ID':51, 
                   'Class':"Condition", 
                   'Method':(
                    Func10, ())},
                  {'ID':67, 
                   'Class':"IfElse", 
                   'Node':[
                    {'ID':68, 
                     'Class':"Condition", 
                     'Method':(
                      Func11, ())},
                    {'ID':69, 
                     'Class':"SelectorProbability", 
                     'RandomGenerator':(
                      battlelogic.bot.agent.a5agent.CAgent.Random,
                      (0, 100)), 
                     'Node':[
                      {'ID':71, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':30, 
                       'Node':[
                        {'ID':76, 
                         'Class':"IfElse", 
                         'Node':[
                          {'ID':84, 
                           'Class':"Condition", 
                           'Method':(
                            Func12, ())},
                          {'ID':85, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                           'ResultOption':0, 
                           'ResultFunctor':None},
                          {'ID':86, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]}]},
                      {'ID':72, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':70, 
                       'Node':[
                        {'ID':77, 
                         'Class':"IfElse", 
                         'Node':[
                          {'ID':87, 
                           'Class':"Condition", 
                           'Method':(
                            Func13, ())},
                          {'ID':88, 
                           'Class':"SelectorProbability", 
                           'RandomGenerator':(
                            battlelogic.bot.agent.a5agent.CAgent.Random,
                            (0, 100)), 
                           'Node':[
                            {'ID':99, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':15, 
                             'Node':[
                              {'ID':119, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':100, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':16, 
                             'Node':[
                              {'ID':120, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':101, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':15, 
                             'Node':[
                              {'ID':121, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':102, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':9, 
                             'Node':[
                              {'ID':122, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':103, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':9, 
                             'Node':[
                              {'ID':123, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':104, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':9, 
                             'Node':[
                              {'ID':124, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':105, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':9, 
                             'Node':[
                              {'ID':125, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':106, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':9, 
                             'Node':[
                              {'ID':126, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':107, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':9, 
                             'Node':[
                              {'ID':127, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]}]},
                          {'ID':89, 
                           'Class':"Sequence", 
                           'Node':[
                            {'ID':108, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 30)), 
                             'ResultOption':0, 
                             'ResultFunctor':None},
                            {'ID':109, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]}]}]}]},
                    {'ID':315, 
                     'Class':"IfElse", 
                     'Node':[
                      {'ID':316, 
                       'Class':"Condition", 
                       'Method':(
                        Func14, ())},
                      {'ID':391, 
                       'Class':"IfElse", 
                       'Node':[
                        {'ID':392, 
                         'Class':"Condition", 
                         'Method':(
                          Func15, ())},
                        {'ID':393, 
                         'Class':"IfElse", 
                         'Node':[
                          {'ID':394, 
                           'Class':"Condition", 
                           'Method':(
                            Func16, ())},
                          {'ID':395, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (4, 0)), 
                           'ResultOption':0, 
                           'ResultFunctor':None},
                          {'ID':396, 
                           'Class':"IfElse", 
                           'Node':[
                            {'ID':397, 
                             'Class':"Condition", 
                             'Method':(
                              Func17, ())},
                            {'ID':398, 
                             'Class':"SelectorProbability", 
                             'RandomGenerator':(
                              battlelogic.bot.agent.a5agent.CAgent.Random,
                              (0, 100)), 
                             'Node':[
                              {'ID':400, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':5, 
                               'Node':[
                                {'ID':418, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':401, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':18, 
                               'Node':[
                                {'ID':419, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':402, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':19, 
                               'Node':[
                                {'ID':420, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':403, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':3, 
                               'Node':[
                                {'ID':421, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':404, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':13, 
                               'Node':[
                                {'ID':422, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':405, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':13, 
                               'Node':[
                                {'ID':423, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':406, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':3, 
                               'Node':[
                                {'ID':424, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':407, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':13, 
                               'Node':[
                                {'ID':425, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':408, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':13, 
                               'Node':[
                                {'ID':426, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]}]},
                            {'ID':399, 
                             'Class':"SelectorProbability", 
                             'RandomGenerator':(
                              battlelogic.bot.agent.a5agent.CAgent.Random,
                              (0, 100)), 
                             'Node':[
                              {'ID':409, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':15, 
                               'Node':[
                                {'ID':427, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':410, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':16, 
                               'Node':[
                                {'ID':428, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':411, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':15, 
                               'Node':[
                                {'ID':429, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':412, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':9, 
                               'Node':[
                                {'ID':430, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':413, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':9, 
                               'Node':[
                                {'ID':431, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':414, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':9, 
                               'Node':[
                                {'ID':432, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':415, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':9, 
                               'Node':[
                                {'ID':433, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':416, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':9, 
                               'Node':[
                                {'ID':434, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':417, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':9, 
                               'Node':[
                                {'ID':435, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]}]}]}]},
                        {'ID':436, 
                         'Class':"Sequence", 
                         'Node':[
                          {'ID':437, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                           'ResultOption':0, 
                           'ResultFunctor':None},
                          {'ID':438, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]}]},
                      {'ID':317, 
                       'Class':"IfElse", 
                       'Node':[
                        {'ID':318, 
                         'Class':"Condition", 
                         'Method':(
                          Func18, ())},
                        {'ID':319, 
                         'Class':"IfElse", 
                         'Node':[
                          {'ID':321, 
                           'Class':"And", 
                           'Node':[
                            {'ID':326, 
                             'Class':"Condition", 
                             'Method':(
                              Func19, ())},
                            {'ID':327, 
                             'Class':"Condition", 
                             'Method':(
                              Func20, ())}]},
                          {'ID':322, 
                           'Class':"SelectorProbability", 
                           'RandomGenerator':(
                            battlelogic.bot.agent.a5agent.CAgent.Random,
                            (0, 100)), 
                           'Node':[
                            {'ID':328, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':50, 
                             'Node':[
                              {'ID':333, 
                               'Class':"SelectorProbability", 
                               'RandomGenerator':(
                                battlelogic.bot.agent.a5agent.CAgent.Random,
                                (0, 100)), 
                               'Node':[
                                {'ID':340, 
                                 'Class':"DecoratorWeight", 
                                 'DecorateWhenChildEnds':False, 
                                 'Weight':25, 
                                 'Node':[
                                  {'ID':364, 
                                   'Class':"Action", 
                                   'Method':(
                                    battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                                   'ResultOption':0, 
                                   'ResultFunctor':None}]},
                                {'ID':341, 
                                 'Class':"DecoratorWeight", 
                                 'DecorateWhenChildEnds':False, 
                                 'Weight':50, 
                                 'Node':[
                                  {'ID':365, 
                                   'Class':"Action", 
                                   'Method':(
                                    battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                                   'ResultOption':0, 
                                   'ResultFunctor':None}]},
                                {'ID':342, 
                                 'Class':"DecoratorWeight", 
                                 'DecorateWhenChildEnds':False, 
                                 'Weight':25, 
                                 'Node':[
                                  {'ID':366, 
                                   'Class':"Action", 
                                   'Method':(
                                    battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                                   'ResultOption':0, 
                                   'ResultFunctor':None}]}]}]},
                            {'ID':329, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':50, 
                             'Node':[
                              {'ID':334, 
                               'Class':"IfElse", 
                               'Node':[
                                {'ID':343, 
                                 'Class':"Condition", 
                                 'Method':(
                                  Func21, ())},
                                {'ID':344, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (4, 0)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None},
                                {'ID':345, 
                                 'Class':"SelectorProbability", 
                                 'RandomGenerator':(
                                  battlelogic.bot.agent.a5agent.CAgent.Random,
                                  (0, 100)), 
                                 'Node':[
                                  {'ID':367, 
                                   'Class':"DecoratorWeight", 
                                   'DecorateWhenChildEnds':False, 
                                   'Weight':25, 
                                   'Node':[
                                    {'ID':388, 
                                     'Class':"Action", 
                                     'Method':(
                                      battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                                     'ResultOption':0, 
                                     'ResultFunctor':None}]},
                                  {'ID':368, 
                                   'Class':"DecoratorWeight", 
                                   'DecorateWhenChildEnds':False, 
                                   'Weight':50, 
                                   'Node':[
                                    {'ID':389, 
                                     'Class':"Action", 
                                     'Method':(
                                      battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                                     'ResultOption':0, 
                                     'ResultFunctor':None}]},
                                  {'ID':369, 
                                   'Class':"DecoratorWeight", 
                                   'DecorateWhenChildEnds':False, 
                                   'Weight':25, 
                                   'Node':[
                                    {'ID':390, 
                                     'Class':"Action", 
                                     'Method':(
                                      battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                                     'ResultOption':0, 
                                     'ResultFunctor':None}]}]}]}]}]},
                          {'ID':323, 
                           'Class':"IfElse", 
                           'Node':[
                            {'ID':330, 
                             'Class':"Condition", 
                             'Method':(
                              Func22, ())},
                            {'ID':331, 
                             'Class':"IfElse", 
                             'Node':[
                              {'ID':335, 
                               'Class':"Condition", 
                               'Method':(
                                Func23, ())},
                              {'ID':336, 
                               'Class':"SelectorProbability", 
                               'RandomGenerator':(
                                battlelogic.bot.agent.a5agent.CAgent.Random,
                                (0, 100)), 
                               'Node':[
                                {'ID':346, 
                                 'Class':"DecoratorWeight", 
                                 'DecorateWhenChildEnds':False, 
                                 'Weight':5, 
                                 'Node':[
                                  {'ID':370, 
                                   'Class':"Action", 
                                   'Method':(
                                    battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                                   'ResultOption':0, 
                                   'ResultFunctor':None}]},
                                {'ID':347, 
                                 'Class':"DecoratorWeight", 
                                 'DecorateWhenChildEnds':False, 
                                 'Weight':18, 
                                 'Node':[
                                  {'ID':371, 
                                   'Class':"Action", 
                                   'Method':(
                                    battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                                   'ResultOption':0, 
                                   'ResultFunctor':None}]},
                                {'ID':348, 
                                 'Class':"DecoratorWeight", 
                                 'DecorateWhenChildEnds':False, 
                                 'Weight':19, 
                                 'Node':[
                                  {'ID':372, 
                                   'Class':"Action", 
                                   'Method':(
                                    battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                                   'ResultOption':0, 
                                   'ResultFunctor':None}]},
                                {'ID':349, 
                                 'Class':"DecoratorWeight", 
                                 'DecorateWhenChildEnds':False, 
                                 'Weight':3, 
                                 'Node':[
                                  {'ID':373, 
                                   'Class':"Action", 
                                   'Method':(
                                    battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                                   'ResultOption':0, 
                                   'ResultFunctor':None}]},
                                {'ID':350, 
                                 'Class':"DecoratorWeight", 
                                 'DecorateWhenChildEnds':False, 
                                 'Weight':13, 
                                 'Node':[
                                  {'ID':374, 
                                   'Class':"Action", 
                                   'Method':(
                                    battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                                   'ResultOption':0, 
                                   'ResultFunctor':None}]},
                                {'ID':351, 
                                 'Class':"DecoratorWeight", 
                                 'DecorateWhenChildEnds':False, 
                                 'Weight':13, 
                                 'Node':[
                                  {'ID':375, 
                                   'Class':"Action", 
                                   'Method':(
                                    battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                                   'ResultOption':0, 
                                   'ResultFunctor':None}]},
                                {'ID':352, 
                                 'Class':"DecoratorWeight", 
                                 'DecorateWhenChildEnds':False, 
                                 'Weight':3, 
                                 'Node':[
                                  {'ID':376, 
                                   'Class':"Action", 
                                   'Method':(
                                    battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                                   'ResultOption':0, 
                                   'ResultFunctor':None}]},
                                {'ID':353, 
                                 'Class':"DecoratorWeight", 
                                 'DecorateWhenChildEnds':False, 
                                 'Weight':13, 
                                 'Node':[
                                  {'ID':377, 
                                   'Class':"Action", 
                                   'Method':(
                                    battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                                   'ResultOption':0, 
                                   'ResultFunctor':None}]},
                                {'ID':354, 
                                 'Class':"DecoratorWeight", 
                                 'DecorateWhenChildEnds':False, 
                                 'Weight':13, 
                                 'Node':[
                                  {'ID':378, 
                                   'Class':"Action", 
                                   'Method':(
                                    battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                                   'ResultOption':0, 
                                   'ResultFunctor':None}]}]},
                              {'ID':337, 
                               'Class':"SelectorProbability", 
                               'RandomGenerator':(
                                battlelogic.bot.agent.a5agent.CAgent.Random,
                                (0, 100)), 
                               'Node':[
                                {'ID':355, 
                                 'Class':"DecoratorWeight", 
                                 'DecorateWhenChildEnds':False, 
                                 'Weight':15, 
                                 'Node':[
                                  {'ID':379, 
                                   'Class':"Action", 
                                   'Method':(
                                    battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                                   'ResultOption':0, 
                                   'ResultFunctor':None}]},
                                {'ID':356, 
                                 'Class':"DecoratorWeight", 
                                 'DecorateWhenChildEnds':False, 
                                 'Weight':16, 
                                 'Node':[
                                  {'ID':380, 
                                   'Class':"Action", 
                                   'Method':(
                                    battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                                   'ResultOption':0, 
                                   'ResultFunctor':None}]},
                                {'ID':357, 
                                 'Class':"DecoratorWeight", 
                                 'DecorateWhenChildEnds':False, 
                                 'Weight':15, 
                                 'Node':[
                                  {'ID':381, 
                                   'Class':"Action", 
                                   'Method':(
                                    battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                                   'ResultOption':0, 
                                   'ResultFunctor':None}]},
                                {'ID':358, 
                                 'Class':"DecoratorWeight", 
                                 'DecorateWhenChildEnds':False, 
                                 'Weight':9, 
                                 'Node':[
                                  {'ID':382, 
                                   'Class':"Action", 
                                   'Method':(
                                    battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                                   'ResultOption':0, 
                                   'ResultFunctor':None}]},
                                {'ID':359, 
                                 'Class':"DecoratorWeight", 
                                 'DecorateWhenChildEnds':False, 
                                 'Weight':9, 
                                 'Node':[
                                  {'ID':383, 
                                   'Class':"Action", 
                                   'Method':(
                                    battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                                   'ResultOption':0, 
                                   'ResultFunctor':None}]},
                                {'ID':360, 
                                 'Class':"DecoratorWeight", 
                                 'DecorateWhenChildEnds':False, 
                                 'Weight':9, 
                                 'Node':[
                                  {'ID':384, 
                                   'Class':"Action", 
                                   'Method':(
                                    battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                                   'ResultOption':0, 
                                   'ResultFunctor':None}]},
                                {'ID':361, 
                                 'Class':"DecoratorWeight", 
                                 'DecorateWhenChildEnds':False, 
                                 'Weight':9, 
                                 'Node':[
                                  {'ID':385, 
                                   'Class':"Action", 
                                   'Method':(
                                    battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                                   'ResultOption':0, 
                                   'ResultFunctor':None}]},
                                {'ID':362, 
                                 'Class':"DecoratorWeight", 
                                 'DecorateWhenChildEnds':False, 
                                 'Weight':9, 
                                 'Node':[
                                  {'ID':386, 
                                   'Class':"Action", 
                                   'Method':(
                                    battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                                   'ResultOption':0, 
                                   'ResultFunctor':None}]},
                                {'ID':363, 
                                 'Class':"DecoratorWeight", 
                                 'DecorateWhenChildEnds':False, 
                                 'Weight':9, 
                                 'Node':[
                                  {'ID':387, 
                                   'Class':"Action", 
                                   'Method':(
                                    battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                                   'ResultOption':0, 
                                   'ResultFunctor':None}]}]}]},
                            {'ID':332, 
                             'Class':"Sequence", 
                             'Node':[
                              {'ID':338, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                               'ResultOption':0, 
                               'ResultFunctor':None},
                              {'ID':339, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]}]}]},
                        {'ID':320, 
                         'Class':"Sequence", 
                         'Node':[
                          {'ID':324, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                           'ResultOption':0, 
                           'ResultFunctor':None},
                          {'ID':325, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]}]}]}]},
                  {'ID':312, 
                   'Class':"Sequence", 
                   'Node':[
                    {'ID':313, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                     'ResultOption':0, 
                     'ResultFunctor':None},
                    {'ID':314, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                     'ResultOption':0, 
                     'ResultFunctor':None}]}]}]},
              {'ID':221, 
               'Class':"Sequence", 
               'Node':[
                {'ID':222, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                 'ResultOption':0, 
                 'ResultFunctor':None},
                {'ID':223, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                 'ResultOption':0, 
                 'ResultFunctor':None}]}]},
            {'ID':28, 
             'Class':"Sequence", 
             'Node':[
              {'ID':37, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
               'ResultOption':0, 
               'ResultFunctor':None},
              {'ID':38, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
               'ResultOption':0, 
               'ResultFunctor':None}]}]},
          {'ID':18, 
           'Class':"IfElse", 
           'Node':[
            {'ID':29, 
             'Class':"Condition", 
             'Method':(
              Func24, ())},
            {'ID':30, 
             'Class':"Sequence", 
             'Node':[
              {'ID':39, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
               'ResultOption':0, 
               'ResultFunctor':None},
              {'ID':40, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
               'ResultOption':0, 
               'ResultFunctor':None}]},
            {'ID':31, 
             'Class':"Action", 
             'Method':(
              battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
             'ResultOption':0, 
             'ResultFunctor':None}]}]},
        {'ID':12, 
         'Class':"IfElse", 
         'Node':[
          {'ID':19, 
           'Class':"Condition", 
           'Method':(
            Func25, ())},
          {'ID':20, 
           'Class':"SelectorProbability", 
           'RandomGenerator':(
            battlelogic.bot.agent.a5agent.CAgent.Random,
            (0, 100)), 
           'Node':[
            {'ID':32, 
             'Class':"DecoratorWeight", 
             'DecorateWhenChildEnds':False, 
             'Weight':80, 
             'Node':[
              {'ID':41, 
               'Class':"Sequence", 
               'Node':[
                {'ID':48, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (0, 0)), 
                 'ResultOption':0, 
                 'ResultFunctor':None},
                {'ID':49, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                 'ResultOption':0, 
                 'ResultFunctor':None}]}]},
            {'ID':33, 
             'Class':"DecoratorWeight", 
             'DecorateWhenChildEnds':False, 
             'Weight':20, 
             'Node':[
              {'ID':42, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
               'ResultOption':0, 
               'ResultFunctor':None}]}]},
          {'ID':21, 
           'Class':"Noop"}]}]},
      {'ID':9, 
       'Class':"IfElse", 
       'Node':[
        {'ID':13, 
         'Class':"Condition", 
         'Method':(
          Func26, ())},
        {'ID':14, 
         'Class':"Sequence", 
         'Node':[
          {'ID':22, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (125, 125)), 
           'ResultOption':0, 
           'ResultFunctor':None},
          {'ID':23, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
           'ResultOption':0, 
           'ResultFunctor':None}]},
        {'ID':15, 
         'Class':"Sequence", 
         'Node':[
          {'ID':24, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (-125, 125)), 
           'ResultOption':0, 
           'ResultFunctor':None},
          {'ID':25, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
           'ResultOption':0, 
           'ResultFunctor':None}]}]}]}]}]}
