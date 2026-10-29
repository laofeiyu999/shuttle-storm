# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\base\btdata\bt5011.py
# Compiled at: 2023-04-06 17:07:41
# Size of source mod 2**32: 110986 bytes
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
    return battlelogic.bot.agent.a5agent.CAgent.HasStarMarkArea(oAgent) == True


def Func8(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsInStarMarkArea(oAgent) == True


def Func9(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsAttackerInTheArea(5, oAgent) == True


def Func10(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) < 65.0


def Func11(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 250.0


def Func12(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) > 150.0


def Func13(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 200.0


def Func14(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.CouldUseHitKey(4, oAgent) == True


def Func15(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetDropPosToNetDistance(oAgent) < 300.0


def Func16(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetDropPosToNetDistance(oAgent) < 300.0


def Func17(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetDropPosToNetDistance(oAgent) < 300.0


def Func18(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetDropPosToNetDistance(oAgent) < 300.0


def Func19(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) <= 150.0


def Func20(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 130.0


def Func21(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.CouldUseHitKey(4, oAgent) == True


def Func22(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 190.0


def Func23(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) <= 230.0


def Func24(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 130.0


def Func25(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) <= 300.0


def Func26(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 90.0


def Func27(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) >= 270.0


def Func28(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsAttackerInTheArea(5, oAgent) == True


def Func29(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) <= 150.0


def Func30(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 110.0


def Func31(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) <= 190.0


def Func32(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 190.0


def Func33(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.CouldUseHitKey(4, oAgent) == True


def Func34(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) <= 250.0


def Func35(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 250.0


def Func36(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsAttacker(oAgent) == True


def Func37(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsInTheArea(5, oAgent) == True


data = {'Name':"bt5011", 
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
    {'ID':3, 
     'Class':"Sequence", 
     'Node':[
      {'ID':7, 
       'Class':"IfElse", 
       'Node':[
        {'ID':12, 
         'Class':"Condition", 
         'Method':(
          Func2, ())},
        {'ID':13, 
         'Class':"Sequence", 
         'Node':[
          {'ID':23, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (20, 50)), 
           'ResultOption':0, 
           'ResultFunctor':None},
          {'ID':24, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
           'ResultOption':0, 
           'ResultFunctor':None}]},
        {'ID':14, 
         'Class':"Sequence", 
         'Node':[
          {'ID':25, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (-20, 50)), 
           'ResultOption':0, 
           'ResultFunctor':None},
          {'ID':26, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
           'ResultOption':0, 
           'ResultFunctor':None}]}]},
      {'ID':8, 
       'Class':"SelectorProbability", 
       'RandomGenerator':(
        battlelogic.bot.agent.a5agent.CAgent.Random,
        (0, 100)), 
       'Node':[
        {'ID':15, 
         'Class':"DecoratorWeight", 
         'DecorateWhenChildEnds':False, 
         'Weight':50, 
         'Node':[
          {'ID':27, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
           'ResultOption':0, 
           'ResultFunctor':None}]},
        {'ID':16, 
         'Class':"DecoratorWeight", 
         'DecorateWhenChildEnds':False, 
         'Weight':50, 
         'Node':[
          {'ID':28, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
           'ResultOption':0, 
           'ResultFunctor':None}]}]}]},
    {'ID':4, 
     'Class':"IfElse", 
     'Node':[
      {'ID':9, 
       'Class':"Condition", 
       'Method':(
        Func3, ())},
      {'ID':10, 
       'Class':"IfElse", 
       'Node':[
        {'ID':17, 
         'Class':"Condition", 
         'Method':(
          Func4, ())},
        {'ID':18, 
         'Class':"IfElse", 
         'Node':[
          {'ID':29, 
           'Class':"Condition", 
           'Method':(
            Func5, ())},
          {'ID':30, 
           'Class':"IfElse", 
           'Node':[
            {'ID':39, 
             'Class':"Condition", 
             'Method':(
              Func6, ())},
            {'ID':40, 
             'Class':"IfElse", 
             'Node':[
              {'ID':44, 
               'Class':"Condition", 
               'Method':(
                Func7, ())},
              {'ID':45, 
               'Class':"IfElse", 
               'Node':[
                {'ID':49, 
                 'Class':"Condition", 
                 'Method':(
                  Func8, ())},
                {'ID':50, 
                 'Class':"SelectorProbability", 
                 'RandomGenerator':(
                  battlelogic.bot.agent.a5agent.CAgent.Random,
                  (0, 100)), 
                 'Node':[
                  {'ID':55, 
                   'Class':"DecoratorWeight", 
                   'DecorateWhenChildEnds':False, 
                   'Weight':50, 
                   'Node':[
                    {'ID':65, 
                     'Class':"IfElse", 
                     'Node':[
                      {'ID':78, 
                       'Class':"Condition", 
                       'Method':(
                        Func9, ())},
                      {'ID':79, 
                       'Class':"SelectorProbability", 
                       'RandomGenerator':(
                        battlelogic.bot.agent.a5agent.CAgent.Random,
                        (0, 100)), 
                       'Node':[
                        {'ID':108, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':50, 
                         'Node':[
                          {'ID':169, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':109, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':35, 
                         'Node':[
                          {'ID':170, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':110, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':15, 
                         'Node':[
                          {'ID':171, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]}]},
                      {'ID':80, 
                       'Class':"SelectorProbability", 
                       'RandomGenerator':(
                        battlelogic.bot.agent.a5agent.CAgent.Random,
                        (0, 100)), 
                       'Node':[
                        {'ID':111, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':50, 
                         'Node':[
                          {'ID':172, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':112, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':35, 
                         'Node':[
                          {'ID':173, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':113, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':15, 
                         'Node':[
                          {'ID':174, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]}]}]}]},
                  {'ID':56, 
                   'Class':"DecoratorWeight", 
                   'DecorateWhenChildEnds':False, 
                   'Weight':50, 
                   'Node':[
                    {'ID':66, 
                     'Class':"Noop"}]}]},
                {'ID':51, 
                 'Class':"Sequence", 
                 'Node':[
                  {'ID':57, 
                   'Class':"Action", 
                   'Method':(
                    battlelogic.bot.agent.a5agent.CAgent.MoveToStarMarkArea, ()), 
                   'ResultOption':0, 
                   'ResultFunctor':None},
                  {'ID':58, 
                   'Class':"Action", 
                   'Method':(
                    battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                   'ResultOption':0, 
                   'ResultFunctor':None}]}]},
              {'ID':46, 
               'Class':"IfElse", 
               'Node':[
                {'ID':52, 
                 'Class':"Condition", 
                 'Method':(
                  Func10, ())},
                {'ID':53, 
                 'Class':"IfElse", 
                 'Node':[
                  {'ID':59, 
                   'Class':"Condition", 
                   'Method':(
                    Func11, ())},
                  {'ID':60, 
                   'Class':"IfElse", 
                   'Node':[
                    {'ID':67, 
                     'Class':"And", 
                     'Node':[
                      {'ID':81, 
                       'Class':"Condition", 
                       'Method':(
                        Func12, ())},
                      {'ID':82, 
                       'Class':"Condition", 
                       'Method':(
                        Func13, ())}]},
                    {'ID':68, 
                     'Class':"IfElse", 
                     'Node':[
                      {'ID':83, 
                       'Class':"Condition", 
                       'Method':(
                        Func14, ())},
                      {'ID':84, 
                       'Class':"SelectorProbability", 
                       'RandomGenerator':(
                        battlelogic.bot.agent.a5agent.CAgent.Random,
                        (0, 100)), 
                       'Node':[
                        {'ID':114, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':80, 
                         'Node':[
                          {'ID':175, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (4, 0)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':115, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':20, 
                         'Node':[
                          {'ID':509, 
                           'Class':"IfElse", 
                           'Node':[
                            {'ID':510, 
                             'Class':"Condition", 
                             'Method':(
                              Func15, ())},
                            {'ID':511, 
                             'Class':"SelectorProbability", 
                             'RandomGenerator':(
                              battlelogic.bot.agent.a5agent.CAgent.Random,
                              (0, 100)), 
                             'Node':[
                              {'ID':513, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':17, 
                               'Node':[
                                {'ID':525, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':514, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':22, 
                               'Node':[
                                {'ID':526, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':515, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':17, 
                               'Node':[
                                {'ID':527, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':516, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':22, 
                               'Node':[
                                {'ID':528, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':517, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':22, 
                               'Node':[
                                {'ID':529, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]}]},
                            {'ID':512, 
                             'Class':"SelectorProbability", 
                             'RandomGenerator':(
                              battlelogic.bot.agent.a5agent.CAgent.Random,
                              (0, 100)), 
                             'Node':[
                              {'ID':518, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':12, 
                               'Node':[
                                {'ID':530, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':519, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':14, 
                               'Node':[
                                {'ID':531, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':520, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':12, 
                               'Node':[
                                {'ID':532, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':521, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':14, 
                               'Node':[
                                {'ID':533, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':522, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':16, 
                               'Node':[
                                {'ID':534, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':523, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':16, 
                               'Node':[
                                {'ID':535, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]},
                              {'ID':524, 
                               'Class':"DecoratorWeight", 
                               'DecorateWhenChildEnds':False, 
                               'Weight':16, 
                               'Node':[
                                {'ID':536, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]}]}]}]}]},
                      {'ID':85, 
                       'Class':"IfElse", 
                       'Node':[
                        {'ID':116, 
                         'Class':"Condition", 
                         'Method':(
                          Func16, ())},
                        {'ID':117, 
                         'Class':"SelectorProbability", 
                         'RandomGenerator':(
                          battlelogic.bot.agent.a5agent.CAgent.Random,
                          (0, 100)), 
                         'Node':[
                          {'ID':177, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':17, 
                           'Node':[
                            {'ID':237, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':178, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':22, 
                           'Node':[
                            {'ID':238, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':179, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':17, 
                           'Node':[
                            {'ID':239, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':180, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':22, 
                           'Node':[
                            {'ID':240, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':181, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':22, 
                           'Node':[
                            {'ID':241, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]}]},
                        {'ID':118, 
                         'Class':"SelectorProbability", 
                         'RandomGenerator':(
                          battlelogic.bot.agent.a5agent.CAgent.Random,
                          (0, 100)), 
                         'Node':[
                          {'ID':182, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':12, 
                           'Node':[
                            {'ID':242, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':183, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':14, 
                           'Node':[
                            {'ID':243, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':184, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':12, 
                           'Node':[
                            {'ID':244, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':185, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':14, 
                           'Node':[
                            {'ID':245, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':186, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':16, 
                           'Node':[
                            {'ID':246, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':187, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':16, 
                           'Node':[
                            {'ID':247, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':188, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':16, 
                           'Node':[
                            {'ID':248, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]}]}]}]},
                    {'ID':69, 
                     'Class':"IfElse", 
                     'Node':[
                      {'ID':86, 
                       'Class':"Condition", 
                       'Method':(
                        Func17, ())},
                      {'ID':87, 
                       'Class':"SelectorProbability", 
                       'RandomGenerator':(
                        battlelogic.bot.agent.a5agent.CAgent.Random,
                        (0, 100)), 
                       'Node':[
                        {'ID':119, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':17, 
                         'Node':[
                          {'ID':189, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':120, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':22, 
                         'Node':[
                          {'ID':190, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':121, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':17, 
                         'Node':[
                          {'ID':191, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':122, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':22, 
                         'Node':[
                          {'ID':192, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':123, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':22, 
                         'Node':[
                          {'ID':193, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]}]},
                      {'ID':88, 
                       'Class':"SelectorProbability", 
                       'RandomGenerator':(
                        battlelogic.bot.agent.a5agent.CAgent.Random,
                        (0, 100)), 
                       'Node':[
                        {'ID':124, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':12, 
                         'Node':[
                          {'ID':194, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':125, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':14, 
                         'Node':[
                          {'ID':195, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':126, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':12, 
                         'Node':[
                          {'ID':196, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':127, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':14, 
                         'Node':[
                          {'ID':197, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':128, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':16, 
                         'Node':[
                          {'ID':198, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':129, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':16, 
                         'Node':[
                          {'ID':199, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':130, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':16, 
                         'Node':[
                          {'ID':200, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]}]}]}]},
                  {'ID':61, 
                   'Class':"Sequence", 
                   'Node':[
                    {'ID':70, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                     'ResultOption':0, 
                     'ResultFunctor':None},
                    {'ID':71, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                     'ResultOption':0, 
                     'ResultFunctor':None}]}]},
                {'ID':54, 
                 'Class':"IfElse", 
                 'Node':[
                  {'ID':62, 
                   'Class':"Condition", 
                   'Method':(
                    Func18, ())},
                  {'ID':63, 
                   'Class':"IfElse", 
                   'Node':[
                    {'ID':72, 
                     'Class':"Condition", 
                     'Method':(
                      Func19, ())},
                    {'ID':73, 
                     'Class':"IfElse", 
                     'Node':[
                      {'ID':89, 
                       'Class':"Condition", 
                       'Method':(
                        Func20, ())},
                      {'ID':90, 
                       'Class':"SelectorProbability", 
                       'RandomGenerator':(
                        battlelogic.bot.agent.a5agent.CAgent.Random,
                        (0, 100)), 
                       'Node':[
                        {'ID':131, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':17, 
                         'Node':[
                          {'ID':201, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':132, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':22, 
                         'Node':[
                          {'ID':202, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':133, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':17, 
                         'Node':[
                          {'ID':203, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':134, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':22, 
                         'Node':[
                          {'ID':204, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':135, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':22, 
                         'Node':[
                          {'ID':205, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]}]},
                      {'ID':91, 
                       'Class':"IfElse", 
                       'Node':[
                        {'ID':504, 
                         'Class':"And", 
                         'Node':[
                          {'ID':136, 
                           'Class':"Condition", 
                           'Method':(
                            Func21, ())},
                          {'ID':505, 
                           'Class':"Condition", 
                           'Method':(
                            Func22, ())}]},
                        {'ID':137, 
                         'Class':"SelectorProbability", 
                         'RandomGenerator':(
                          battlelogic.bot.agent.a5agent.CAgent.Random,
                          (0, 100)), 
                         'Node':[
                          {'ID':206, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':20, 
                           'Node':[
                            {'ID':249, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (4, 0)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':207, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':80, 
                           'Node':[
                            {'ID':250, 
                             'Class':"Sequence", 
                             'Node':[
                              {'ID':280, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                               'ResultOption':0, 
                               'ResultFunctor':None},
                              {'ID':281, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]}]}]},
                        {'ID':506, 
                         'Class':"Sequence", 
                         'Node':[
                          {'ID':507, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                           'ResultOption':0, 
                           'ResultFunctor':None},
                          {'ID':508, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]}]}]},
                    {'ID':74, 
                     'Class':"IfElse", 
                     'Node':[
                      {'ID':92, 
                       'Class':"And", 
                       'Node':[
                        {'ID':139, 
                         'Class':"Condition", 
                         'Method':(
                          Func23, ())},
                        {'ID':140, 
                         'Class':"Condition", 
                         'Method':(
                          Func24, ())}]},
                      {'ID':93, 
                       'Class':"SelectorProbability", 
                       'RandomGenerator':(
                        battlelogic.bot.agent.a5agent.CAgent.Random,
                        (0, 100)), 
                       'Node':[
                        {'ID':141, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':9, 
                         'Node':[
                          {'ID':210, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':142, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':11, 
                         'Node':[
                          {'ID':211, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':143, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':9, 
                         'Node':[
                          {'ID':212, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':144, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':14, 
                         'Node':[
                          {'ID':213, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':145, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':14, 
                         'Node':[
                          {'ID':214, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':146, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':14, 
                         'Node':[
                          {'ID':215, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':147, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':9, 
                         'Node':[
                          {'ID':216, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':148, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':11, 
                         'Node':[
                          {'ID':217, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':149, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':9, 
                         'Node':[
                          {'ID':218, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]}]},
                      {'ID':377, 
                       'Class':"Sequence", 
                       'Node':[
                        {'ID':378, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                         'ResultOption':0, 
                         'ResultFunctor':None},
                        {'ID':379, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]}]}]},
                  {'ID':380, 
                   'Class':"IfElse", 
                   'Node':[
                    {'ID':381, 
                     'Class':"And", 
                     'Node':[
                      {'ID':384, 
                       'Class':"Condition", 
                       'Method':(
                        Func25, ())},
                      {'ID':385, 
                       'Class':"Condition", 
                       'Method':(
                        Func26, ())},
                      {'ID':386, 
                       'Class':"Condition", 
                       'Method':(
                        Func27, ())}]},
                    {'ID':382, 
                     'Class':"IfElse", 
                     'Node':[
                      {'ID':387, 
                       'Class':"Condition", 
                       'Method':(
                        Func28, ())},
                      {'ID':388, 
                       'Class':"SelectorProbability", 
                       'RandomGenerator':(
                        battlelogic.bot.agent.a5agent.CAgent.Random,
                        (0, 100)), 
                       'Node':[
                        {'ID':393, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':24, 
                         'Node':[
                          {'ID':418, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':394, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':13, 
                         'Node':[
                          {'ID':419, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':395, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':13, 
                         'Node':[
                          {'ID':420, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':396, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':13, 
                         'Node':[
                          {'ID':421, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':397, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':13, 
                         'Node':[
                          {'ID':422, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':398, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':24, 
                         'Node':[
                          {'ID':423, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]}]},
                      {'ID':389, 
                       'Class':"SelectorProbability", 
                       'RandomGenerator':(
                        battlelogic.bot.agent.a5agent.CAgent.Random,
                        (0, 100)), 
                       'Node':[
                        {'ID':399, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':13, 
                         'Node':[
                          {'ID':424, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':400, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':24, 
                         'Node':[
                          {'ID':425, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':401, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':13, 
                         'Node':[
                          {'ID':426, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':402, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':13, 
                         'Node':[
                          {'ID':427, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':403, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':24, 
                         'Node':[
                          {'ID':428, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':404, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':13, 
                         'Node':[
                          {'ID':429, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]}]}]},
                    {'ID':383, 
                     'Class':"IfElse", 
                     'Node':[
                      {'ID':390, 
                       'Class':"And", 
                       'Node':[
                        {'ID':405, 
                         'Class':"Condition", 
                         'Method':(
                          Func29, ())},
                        {'ID':406, 
                         'Class':"Condition", 
                         'Method':(
                          Func30, ())}]},
                      {'ID':391, 
                       'Class':"SelectorProbability", 
                       'RandomGenerator':(
                        battlelogic.bot.agent.a5agent.CAgent.Random,
                        (0, 100)), 
                       'Node':[
                        {'ID':407, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':10, 
                         'Node':[
                          {'ID':430, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':408, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':13, 
                         'Node':[
                          {'ID':431, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':409, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':10, 
                         'Node':[
                          {'ID':432, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':410, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':19, 
                         'Node':[
                          {'ID':433, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':411, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':13, 
                         'Node':[
                          {'ID':434, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':412, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':10, 
                         'Node':[
                          {'ID':435, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':413, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':15, 
                         'Node':[
                          {'ID':436, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':414, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':10, 
                         'Node':[
                          {'ID':437, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]}]},
                      {'ID':392, 
                       'Class':"IfElse", 
                       'Node':[
                        {'ID':415, 
                         'Class':"And", 
                         'Node':[
                          {'ID':438, 
                           'Class':"Condition", 
                           'Method':(
                            Func31, ())},
                          {'ID':439, 
                           'Class':"Condition", 
                           'Method':(
                            Func32, ())}]},
                        {'ID':416, 
                         'Class':"IfElse", 
                         'Node':[
                          {'ID':440, 
                           'Class':"Condition", 
                           'Method':(
                            Func33, ())},
                          {'ID':441, 
                           'Class':"SelectorProbability", 
                           'RandomGenerator':(
                            battlelogic.bot.agent.a5agent.CAgent.Random,
                            (0, 100)), 
                           'Node':[
                            {'ID':446, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':20, 
                             'Node':[
                              {'ID':456, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (4, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':447, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':80, 
                             'Node':[
                              {'ID':457, 
                               'Class':"SelectorProbability", 
                               'RandomGenerator':(
                                battlelogic.bot.agent.a5agent.CAgent.Random,
                                (0, 100)), 
                               'Node':[
                                {'ID':460, 
                                 'Class':"DecoratorWeight", 
                                 'DecorateWhenChildEnds':False, 
                                 'Weight':25, 
                                 'Node':[
                                  {'ID':473, 
                                   'Class':"SelectorProbability", 
                                   'RandomGenerator':(
                                    battlelogic.bot.agent.a5agent.CAgent.Random,
                                    (0, 100)), 
                                   'Node':[
                                    {'ID':484, 
                                     'Class':"DecoratorWeight", 
                                     'DecorateWhenChildEnds':False, 
                                     'Weight':10, 
                                     'Node':[
                                      {'ID':495, 
                                       'Class':"Action", 
                                       'Method':(
                                        battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                                       'ResultOption':0, 
                                       'ResultFunctor':None}]},
                                    {'ID':485, 
                                     'Class':"DecoratorWeight", 
                                     'DecorateWhenChildEnds':False, 
                                     'Weight':14, 
                                     'Node':[
                                      {'ID':496, 
                                       'Class':"Action", 
                                       'Method':(
                                        battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                                       'ResultOption':0, 
                                       'ResultFunctor':None}]},
                                    {'ID':486, 
                                     'Class':"DecoratorWeight", 
                                     'DecorateWhenChildEnds':False, 
                                     'Weight':10, 
                                     'Node':[
                                      {'ID':497, 
                                       'Class':"Action", 
                                       'Method':(
                                        battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                                       'ResultOption':0, 
                                       'ResultFunctor':None}]},
                                    {'ID':487, 
                                     'Class':"DecoratorWeight", 
                                     'DecorateWhenChildEnds':False, 
                                     'Weight':10, 
                                     'Node':[
                                      {'ID':498, 
                                       'Class':"Action", 
                                       'Method':(
                                        battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                                       'ResultOption':0, 
                                       'ResultFunctor':None}]},
                                    {'ID':488, 
                                     'Class':"DecoratorWeight", 
                                     'DecorateWhenChildEnds':False, 
                                     'Weight':13, 
                                     'Node':[
                                      {'ID':499, 
                                       'Class':"Action", 
                                       'Method':(
                                        battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                                       'ResultOption':0, 
                                       'ResultFunctor':None}]},
                                    {'ID':489, 
                                     'Class':"DecoratorWeight", 
                                     'DecorateWhenChildEnds':False, 
                                     'Weight':10, 
                                     'Node':[
                                      {'ID':500, 
                                       'Class':"Action", 
                                       'Method':(
                                        battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                                       'ResultOption':0, 
                                       'ResultFunctor':None}]},
                                    {'ID':490, 
                                     'Class':"DecoratorWeight", 
                                     'DecorateWhenChildEnds':False, 
                                     'Weight':10, 
                                     'Node':[
                                      {'ID':501, 
                                       'Class':"Action", 
                                       'Method':(
                                        battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                                       'ResultOption':0, 
                                       'ResultFunctor':None}]},
                                    {'ID':491, 
                                     'Class':"DecoratorWeight", 
                                     'DecorateWhenChildEnds':False, 
                                     'Weight':13, 
                                     'Node':[
                                      {'ID':502, 
                                       'Class':"Action", 
                                       'Method':(
                                        battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                                       'ResultOption':0, 
                                       'ResultFunctor':None}]},
                                    {'ID':492, 
                                     'Class':"DecoratorWeight", 
                                     'DecorateWhenChildEnds':False, 
                                     'Weight':10, 
                                     'Node':[
                                      {'ID':503, 
                                       'Class':"Action", 
                                       'Method':(
                                        battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                                       'ResultOption':0, 
                                       'ResultFunctor':None}]}]}]},
                                {'ID':461, 
                                 'Class':"DecoratorWeight", 
                                 'DecorateWhenChildEnds':False, 
                                 'Weight':75, 
                                 'Node':[
                                  {'ID':474, 
                                   'Class':"Sequence", 
                                   'Node':[
                                    {'ID':493, 
                                     'Class':"Action", 
                                     'Method':(
                                      battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                                     'ResultOption':0, 
                                     'ResultFunctor':None},
                                    {'ID':494, 
                                     'Class':"Action", 
                                     'Method':(
                                      battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                                     'ResultOption':0, 
                                     'ResultFunctor':None}]}]}]}]}]},
                          {'ID':442, 
                           'Class':"Sequence", 
                           'Node':[
                            {'ID':448, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                             'ResultOption':0, 
                             'ResultFunctor':None},
                            {'ID':449, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]}]},
                        {'ID':417, 
                         'Class':"IfElse", 
                         'Node':[
                          {'ID':443, 
                           'Class':"And", 
                           'Node':[
                            {'ID':450, 
                             'Class':"Condition", 
                             'Method':(
                              Func34, ())},
                            {'ID':451, 
                             'Class':"Condition", 
                             'Method':(
                              Func35, ())}]},
                          {'ID':444, 
                           'Class':"SelectorProbability", 
                           'RandomGenerator':(
                            battlelogic.bot.agent.a5agent.CAgent.Random,
                            (0, 100)), 
                           'Node':[
                            {'ID':452, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':20, 
                             'Node':[
                              {'ID':458, 
                               'Class':"SelectorProbability", 
                               'RandomGenerator':(
                                battlelogic.bot.agent.a5agent.CAgent.Random,
                                (0, 100)), 
                               'Node':[
                                {'ID':462, 
                                 'Class':"DecoratorWeight", 
                                 'DecorateWhenChildEnds':False, 
                                 'Weight':10, 
                                 'Node':[
                                  {'ID':475, 
                                   'Class':"Action", 
                                   'Method':(
                                    battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                                   'ResultOption':0, 
                                   'ResultFunctor':None}]},
                                {'ID':463, 
                                 'Class':"DecoratorWeight", 
                                 'DecorateWhenChildEnds':False, 
                                 'Weight':14, 
                                 'Node':[
                                  {'ID':476, 
                                   'Class':"Action", 
                                   'Method':(
                                    battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                                   'ResultOption':0, 
                                   'ResultFunctor':None}]},
                                {'ID':464, 
                                 'Class':"DecoratorWeight", 
                                 'DecorateWhenChildEnds':False, 
                                 'Weight':10, 
                                 'Node':[
                                  {'ID':477, 
                                   'Class':"Action", 
                                   'Method':(
                                    battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                                   'ResultOption':0, 
                                   'ResultFunctor':None}]},
                                {'ID':465, 
                                 'Class':"DecoratorWeight", 
                                 'DecorateWhenChildEnds':False, 
                                 'Weight':10, 
                                 'Node':[
                                  {'ID':478, 
                                   'Class':"Action", 
                                   'Method':(
                                    battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                                   'ResultOption':0, 
                                   'ResultFunctor':None}]},
                                {'ID':466, 
                                 'Class':"DecoratorWeight", 
                                 'DecorateWhenChildEnds':False, 
                                 'Weight':13, 
                                 'Node':[
                                  {'ID':479, 
                                   'Class':"Action", 
                                   'Method':(
                                    battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                                   'ResultOption':0, 
                                   'ResultFunctor':None}]},
                                {'ID':467, 
                                 'Class':"DecoratorWeight", 
                                 'DecorateWhenChildEnds':False, 
                                 'Weight':10, 
                                 'Node':[
                                  {'ID':480, 
                                   'Class':"Action", 
                                   'Method':(
                                    battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                                   'ResultOption':0, 
                                   'ResultFunctor':None}]},
                                {'ID':468, 
                                 'Class':"DecoratorWeight", 
                                 'DecorateWhenChildEnds':False, 
                                 'Weight':10, 
                                 'Node':[
                                  {'ID':481, 
                                   'Class':"Action", 
                                   'Method':(
                                    battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                                   'ResultOption':0, 
                                   'ResultFunctor':None}]},
                                {'ID':469, 
                                 'Class':"DecoratorWeight", 
                                 'DecorateWhenChildEnds':False, 
                                 'Weight':13, 
                                 'Node':[
                                  {'ID':482, 
                                   'Class':"Action", 
                                   'Method':(
                                    battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                                   'ResultOption':0, 
                                   'ResultFunctor':None}]},
                                {'ID':470, 
                                 'Class':"DecoratorWeight", 
                                 'DecorateWhenChildEnds':False, 
                                 'Weight':10, 
                                 'Node':[
                                  {'ID':483, 
                                   'Class':"Action", 
                                   'Method':(
                                    battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                                   'ResultOption':0, 
                                   'ResultFunctor':None}]}]}]},
                            {'ID':453, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':80, 
                             'Node':[
                              {'ID':459, 
                               'Class':"Sequence", 
                               'Node':[
                                {'ID':471, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None},
                                {'ID':472, 
                                 'Class':"Action", 
                                 'Method':(
                                  battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                                 'ResultOption':0, 
                                 'ResultFunctor':None}]}]}]},
                          {'ID':445, 
                           'Class':"Sequence", 
                           'Node':[
                            {'ID':454, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                             'ResultOption':0, 
                             'ResultFunctor':None},
                            {'ID':455, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]}]}]}]}]}]}]}]},
            {'ID':41, 
             'Class':"Sequence", 
             'Node':[
              {'ID':47, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
               'ResultOption':0, 
               'ResultFunctor':None},
              {'ID':48, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
               'ResultOption':0, 
               'ResultFunctor':None}]}]},
          {'ID':31, 
           'Class':"Sequence", 
           'Node':[
            {'ID':42, 
             'Class':"Action", 
             'Method':(
              battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
             'ResultOption':0, 
             'ResultFunctor':None},
            {'ID':43, 
             'Class':"Action", 
             'Method':(
              battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
             'ResultOption':0, 
             'ResultFunctor':None}]}]},
        {'ID':19, 
         'Class':"IfElse", 
         'Node':[
          {'ID':32, 
           'Class':"Condition", 
           'Method':(
            Func36, ())},
          {'ID':537, 
           'Class':"Sequence", 
           'Node':[
            {'ID':538, 
             'Class':"Action", 
             'Method':(
              battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (0, 70)), 
             'ResultOption':0, 
             'ResultFunctor':None},
            {'ID':539, 
             'Class':"Action", 
             'Method':(
              battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
             'ResultOption':0, 
             'ResultFunctor':None}]},
          {'ID':34, 
           'Class':"Noop"}]}]},
      {'ID':11, 
       'Class':"IfElse", 
       'Node':[
        {'ID':20, 
         'Class':"Condition", 
         'Method':(
          Func37, ())},
        {'ID':21, 
         'Class':"Sequence", 
         'Node':[
          {'ID':35, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (125, 125)), 
           'ResultOption':0, 
           'ResultFunctor':None},
          {'ID':36, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
           'ResultOption':0, 
           'ResultFunctor':None}]},
        {'ID':22, 
         'Class':"Sequence", 
         'Node':[
          {'ID':37, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (-125, 125)), 
           'ResultOption':0, 
           'ResultFunctor':None},
          {'ID':38, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
           'ResultOption':0, 
           'ResultFunctor':None}]}]}]}]}]}
