# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\base\btdata\bt10204.py
# Compiled at: 2023-04-06 17:07:41
# Size of source mod 2**32: 44723 bytes
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
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) <= 350.0


def Func5(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.CouldDoAction(oAgent) == True


def Func6(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.CouldHit(oAgent) == True


def Func7(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsTheCurveShapeType(4, oAgent) == True


def Func8(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) < 5.0


def Func9(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 170.0


def Func10(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) < 50.0


def Func11(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 200.0


def Func12(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) < 150.0


def Func13(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 200.0


def Func14(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) >= 150.0


def Func15(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsDropPosInFrontBackLine(oAgent) == True


def Func16(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 70.0


def Func17(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 70.0


def Func18(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.HasStarMarkArea(oAgent) == True


def Func19(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsAttacker(oAgent) == True


def Func20(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsInTheArea(5, oAgent) == True


data = {'Name':"bt10204", 
 'ID':0, 
 'AgentType':"battlelogic.bot.agent.a5agent", 
 'IsFSM':False, 
 'Ver':4, 
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
          {'ID':16, 
           'Class':"Condition", 
           'Method':(
            Func4, ())},
          {'ID':17, 
           'Class':"IfElse", 
           'Node':[
            {'ID':26, 
             'Class':"Condition", 
             'Method':(
              Func5, ())},
            {'ID':27, 
             'Class':"IfElse", 
             'Node':[
              {'ID':34, 
               'Class':"Condition", 
               'Method':(
                Func6, ())},
              {'ID':35, 
               'Class':"IfElse", 
               'Node':[
                {'ID':43, 
                 'Class':"Condition", 
                 'Method':(
                  Func7, ())},
                {'ID':44, 
                 'Class':"SelectorProbability", 
                 'RandomGenerator':(
                  battlelogic.bot.agent.a5agent.CAgent.Random,
                  (0, 100)), 
                 'Node':[
                  {'ID':50, 
                   'Class':"DecoratorWeight", 
                   'DecorateWhenChildEnds':False, 
                   'Weight':30, 
                   'Node':[
                    {'ID':55, 
                     'Class':"IfElse", 
                     'Node':[
                      {'ID':63, 
                       'Class':"Condition", 
                       'Method':(
                        Func8, ())},
                      {'ID':64, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                       'ResultOption':0, 
                       'ResultFunctor':None},
                      {'ID':65, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]}]},
                  {'ID':51, 
                   'Class':"DecoratorWeight", 
                   'DecorateWhenChildEnds':False, 
                   'Weight':70, 
                   'Node':[
                    {'ID':56, 
                     'Class':"IfElse", 
                     'Node':[
                      {'ID':66, 
                       'Class':"Condition", 
                       'Method':(
                        Func9, ())},
                      {'ID':67, 
                       'Class':"SelectorProbability", 
                       'RandomGenerator':(
                        battlelogic.bot.agent.a5agent.CAgent.Random,
                        (0, 100)), 
                       'Node':[
                        {'ID':79, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':15, 
                         'Node':[
                          {'ID':100, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':80, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':16, 
                         'Node':[
                          {'ID':101, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':81, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':15, 
                         'Node':[
                          {'ID':102, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':82, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':9, 
                         'Node':[
                          {'ID':103, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':83, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':9, 
                         'Node':[
                          {'ID':104, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':84, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':9, 
                         'Node':[
                          {'ID':105, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':85, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':9, 
                         'Node':[
                          {'ID':106, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':86, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':9, 
                         'Node':[
                          {'ID':107, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':87, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':9, 
                         'Node':[
                          {'ID':108, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]}]},
                      {'ID':68, 
                       'Class':"Sequence", 
                       'Node':[
                        {'ID':88, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 30)), 
                         'ResultOption':0, 
                         'ResultFunctor':None},
                        {'ID':89, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]}]}]}]},
                {'ID':45, 
                 'Class':"IfElse", 
                 'Node':[
                  {'ID':52, 
                   'Class':"Condition", 
                   'Method':(
                    Func10, ())},
                  {'ID':53, 
                   'Class':"IfElse", 
                   'Node':[
                    {'ID':57, 
                     'Class':"Condition", 
                     'Method':(
                      Func11, ())},
                    {'ID':58, 
                     'Class':"SelectorProbability", 
                     'RandomGenerator':(
                      battlelogic.bot.agent.a5agent.CAgent.Random,
                      (0, 100)), 
                     'Node':[
                      {'ID':69, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':25, 
                       'Node':[
                        {'ID':90, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]},
                      {'ID':70, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':50, 
                       'Node':[
                        {'ID':91, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]},
                      {'ID':71, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':25, 
                       'Node':[
                        {'ID':92, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]}]},
                    {'ID':59, 
                     'Class':"Sequence", 
                     'Node':[
                      {'ID':72, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                       'ResultOption':0, 
                       'ResultFunctor':None},
                      {'ID':73, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]}]},
                  {'ID':54, 
                   'Class':"IfElse", 
                   'Node':[
                    {'ID':60, 
                     'Class':"Condition", 
                     'Method':(
                      Func12, ())},
                    {'ID':61, 
                     'Class':"IfElse", 
                     'Node':[
                      {'ID':74, 
                       'Class':"And", 
                       'Node':[
                        {'ID':93, 
                         'Class':"Condition", 
                         'Method':(
                          Func13, ())},
                        {'ID':94, 
                         'Class':"Condition", 
                         'Method':(
                          Func14, ())}]},
                      {'ID':75, 
                       'Class':"SelectorProbability", 
                       'RandomGenerator':(
                        battlelogic.bot.agent.a5agent.CAgent.Random,
                        (0, 100)), 
                       'Node':[
                        {'ID':95, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':50, 
                         'Node':[
                          {'ID':109, 
                           'Class':"SelectorProbability", 
                           'RandomGenerator':(
                            battlelogic.bot.agent.a5agent.CAgent.Random,
                            (0, 100)), 
                           'Node':[
                            {'ID':117, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':25, 
                             'Node':[
                              {'ID':144, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':118, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':50, 
                             'Node':[
                              {'ID':145, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':119, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':25, 
                             'Node':[
                              {'ID':146, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]}]}]},
                        {'ID':96, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':50, 
                         'Node':[
                          {'ID':110, 
                           'Class':"Sequence", 
                           'Node':[
                            {'ID':120, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                             'ResultOption':0, 
                             'ResultFunctor':None},
                            {'ID':121, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]}]}]},
                      {'ID':76, 
                       'Class':"IfElse", 
                       'Node':[
                        {'ID':97, 
                         'Class':"Condition", 
                         'Method':(
                          Func15, ())},
                        {'ID':98, 
                         'Class':"IfElse", 
                         'Node':[
                          {'ID':111, 
                           'Class':"Condition", 
                           'Method':(
                            Func16, ())},
                          {'ID':112, 
                           'Class':"SelectorProbability", 
                           'RandomGenerator':(
                            battlelogic.bot.agent.a5agent.CAgent.Random,
                            (0, 100)), 
                           'Node':[
                            {'ID':123, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':24, 
                             'Node':[
                              {'ID':148, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':124, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':16, 
                             'Node':[
                              {'ID':149, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':126, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':20, 
                             'Node':[
                              {'ID':151, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':127, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':10, 
                             'Node':[
                              {'ID':152, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':129, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':20, 
                             'Node':[
                              {'ID':154, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':130, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':10, 
                             'Node':[
                              {'ID':155, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]}]},
                          {'ID':113, 
                           'Class':"Sequence", 
                           'Node':[
                            {'ID':131, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 30)), 
                             'ResultOption':0, 
                             'ResultFunctor':None},
                            {'ID':132, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]}]},
                        {'ID':99, 
                         'Class':"IfElse", 
                         'Node':[
                          {'ID':114, 
                           'Class':"Condition", 
                           'Method':(
                            Func17, ())},
                          {'ID':115, 
                           'Class':"SelectorProbability", 
                           'RandomGenerator':(
                            battlelogic.bot.agent.a5agent.CAgent.Random,
                            (0, 100)), 
                           'Node':[
                            {'ID':133, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':13, 
                             'Node':[
                              {'ID':156, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':134, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':20, 
                             'Node':[
                              {'ID':157, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':135, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':13, 
                             'Node':[
                              {'ID':158, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':136, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':7, 
                             'Node':[
                              {'ID':159, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':137, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':13, 
                             'Node':[
                              {'ID':160, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':138, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':7, 
                             'Node':[
                              {'ID':161, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':139, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':7, 
                             'Node':[
                              {'ID':162, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':140, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':13, 
                             'Node':[
                              {'ID':163, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':141, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':7, 
                             'Node':[
                              {'ID':164, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]}]},
                          {'ID':116, 
                           'Class':"Sequence", 
                           'Node':[
                            {'ID':142, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 30)), 
                             'ResultOption':0, 
                             'ResultFunctor':None},
                            {'ID':143, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]}]}]}]},
                    {'ID':62, 
                     'Class':"Sequence", 
                     'Node':[
                      {'ID':77, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                       'ResultOption':0, 
                       'ResultFunctor':None},
                      {'ID':78, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]}]}]}]},
              {'ID':36, 
               'Class':"Sequence", 
               'Node':[
                {'ID':46, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                 'ResultOption':0, 
                 'ResultFunctor':None},
                {'ID':47, 
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
              Func18, ())},
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
            Func19, ())},
          {'ID':20, 
           'Class':"SelectorProbability", 
           'RandomGenerator':(
            battlelogic.bot.agent.a5agent.CAgent.Random,
            (0, 100)), 
           'Node':[
            {'ID':32, 
             'Class':"DecoratorWeight", 
             'DecorateWhenChildEnds':False, 
             'Weight':70, 
             'Node':[
              {'ID':41, 
               'Class':"Sequence", 
               'Node':[
                {'ID':48, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (0, 50)), 
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
             'Weight':30, 
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
          Func20, ())},
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
