# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\base\btdata\bt3007.py
# Compiled at: 2023-04-06 17:07:41
# Size of source mod 2**32: 131979 bytes
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
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) <= 50.0


def Func8(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 210.0


def Func9(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.CouldUseHitKey(4, oAgent) == True


def Func10(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetAttackerToNetDistanc(oAgent) >= 335.0


def Func11(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsAttackerInTheArea(5, oAgent) == True


def Func12(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetDropPosToNetDistance(oAgent) < 335.0


def Func13(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 210.0


def Func14(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsDropPosInTheArea(5, oAgent) == True


def Func15(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 210.0


def Func16(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetDropPosToNetDistance(oAgent) < 586.0


def Func17(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsDropPosInTheArea(5, oAgent) == True


def Func18(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsDropPosInTheArea(5, oAgent) == True


def Func19(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetDropPosToNetDistance(oAgent) < 335.0


def Func20(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 150.0


def Func21(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) <= 150.0


def Func22(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsAttackerInTheArea(5, oAgent) == True


def Func23(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) <= 270.0


def Func24(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsDropPosInTheArea(5, oAgent) == True


def Func25(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) <= 300.0


def Func26(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsDropPosInTheArea(5, oAgent) == True


def Func27(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 150.0


def Func28(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetDropPosToNetDistance(oAgent) < 586.0


def Func29(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) <= 270.0


def Func30(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsDropPosInTheArea(5, oAgent) == True


def Func31(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) <= 300.0


def Func32(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsDropPosInTheArea(5, oAgent) == True


def Func33(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) <= 270.0


def Func34(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsDropPosInTheArea(5, oAgent) == True


def Func35(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) <= 300.0


def Func36(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsDropPosInTheArea(5, oAgent) == True


def Func37(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsAttacker(oAgent) == True


data = {'Name':"bt3007", 
 'ID':0, 
 'AgentType':"battlelogic.bot.agent.a5agent", 
 'IsFSM':False, 
 'Ver':12, 
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
          {'ID':20, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (20, 50)), 
           'ResultOption':0, 
           'ResultFunctor':None},
          {'ID':21, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
           'ResultOption':0, 
           'ResultFunctor':None}]},
        {'ID':14, 
         'Class':"Sequence", 
         'Node':[
          {'ID':22, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (-20, 50)), 
           'ResultOption':0, 
           'ResultFunctor':None},
          {'ID':23, 
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
          {'ID':24, 
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
          {'ID':25, 
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
          {'ID':26, 
           'Class':"Condition", 
           'Method':(
            Func5, ())},
          {'ID':27, 
           'Class':"IfElse", 
           'Node':[
            {'ID':32, 
             'Class':"Condition", 
             'Method':(
              Func6, ())},
            {'ID':44, 
             'Class':"IfElse", 
             'Node':[
              {'ID':45, 
               'Class':"Condition", 
               'Method':(
                Func7, ())},
              {'ID':46, 
               'Class':"IfElse", 
               'Node':[
                {'ID':48, 
                 'Class':"Condition", 
                 'Method':(
                  Func8, ())},
                {'ID':49, 
                 'Class':"IfElse", 
                 'Node':[
                  {'ID':54, 
                   'Class':"Condition", 
                   'Method':(
                    Func9, ())},
                  {'ID':56, 
                   'Class':"IfElse", 
                   'Node':[
                    {'ID':68, 
                     'Class':"Condition", 
                     'Method':(
                      Func10, ())},
                    {'ID':69, 
                     'Class':"IfElse", 
                     'Node':[
                      {'ID':89, 
                       'Class':"Condition", 
                       'Method':(
                        Func11, ())},
                      {'ID':90, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (4, 1)), 
                       'ResultOption':0, 
                       'ResultFunctor':None},
                      {'ID':91, 
                       'Class':"Action", 
                       'Method':(
                        battlelogic.bot.agent.a5agent.CAgent.Hit, (4, 2)), 
                       'ResultOption':0, 
                       'ResultFunctor':None}]},
                    {'ID':70, 
                     'Class':"SelectorProbability", 
                     'RandomGenerator':(
                      battlelogic.bot.agent.a5agent.CAgent.Random,
                      (0, 100)), 
                     'Node':[
                      {'ID':92, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':50, 
                       'Node':[
                        {'ID':128, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (4, 1)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]},
                      {'ID':93, 
                       'Class':"DecoratorWeight", 
                       'DecorateWhenChildEnds':False, 
                       'Weight':50, 
                       'Node':[
                        {'ID':129, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.Hit, (4, 2)), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]}]}]},
                  {'ID':1192, 
                   'Class':"IfElse", 
                   'Node':[
                    {'ID':1193, 
                     'Class':"Condition", 
                     'Method':(
                      Func12, ())},
                    {'ID':1194, 
                     'Class':"IfElse", 
                     'Node':[
                      {'ID':1196, 
                       'Class':"Condition", 
                       'Method':(
                        Func13, ())},
                      {'ID':1197, 
                       'Class':"IfElse", 
                       'Node':[
                        {'ID':1202, 
                         'Class':"Condition", 
                         'Method':(
                          Func14, ())},
                        {'ID':1203, 
                         'Class':"SelectorProbability", 
                         'RandomGenerator':(
                          battlelogic.bot.agent.a5agent.CAgent.Random,
                          (0, 100)), 
                         'Node':[
                          {'ID':1214, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':17, 
                           'Node':[
                            {'ID':1242, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':1215, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':6, 
                           'Node':[
                            {'ID':1243, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':1216, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':28, 
                           'Node':[
                            {'ID':1244, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':1217, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':17, 
                           'Node':[
                            {'ID':1245, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':1218, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':15, 
                           'Node':[
                            {'ID':1246, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':1219, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':17, 
                           'Node':[
                            {'ID':1247, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]}]},
                        {'ID':1204, 
                         'Class':"SelectorProbability", 
                         'RandomGenerator':(
                          battlelogic.bot.agent.a5agent.CAgent.Random,
                          (0, 100)), 
                         'Node':[
                          {'ID':1220, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':28, 
                           'Node':[
                            {'ID':1248, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':1221, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':6, 
                           'Node':[
                            {'ID':1249, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':1222, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':17, 
                           'Node':[
                            {'ID':1250, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':1223, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':17, 
                           'Node':[
                            {'ID':1251, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':1224, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':15, 
                           'Node':[
                            {'ID':1252, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':1225, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':17, 
                           'Node':[
                            {'ID':1253, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]}]}]},
                      {'ID':1396, 
                       'Class':"Sequence", 
                       'Node':[
                        {'ID':1397, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                         'ResultOption':0, 
                         'ResultFunctor':None},
                        {'ID':1398, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]}]},
                    {'ID':1195, 
                     'Class':"IfElse", 
                     'Node':[
                      {'ID':1199, 
                       'Class':"Condition", 
                       'Method':(
                        Func15, ())},
                      {'ID':1200, 
                       'Class':"IfElse", 
                       'Node':[
                        {'ID':1208, 
                         'Class':"Condition", 
                         'Method':(
                          Func16, ())},
                        {'ID':1209, 
                         'Class':"IfElse", 
                         'Node':[
                          {'ID':1231, 
                           'Class':"Condition", 
                           'Method':(
                            Func17, ())},
                          {'ID':1232, 
                           'Class':"SelectorProbability", 
                           'RandomGenerator':(
                            battlelogic.bot.agent.a5agent.CAgent.Random,
                            (0, 100)), 
                           'Node':[
                            {'ID':1266, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':15, 
                             'Node':[
                              {'ID':1314, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1267, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':8, 
                             'Node':[
                              {'ID':1315, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1268, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':4, 
                             'Node':[
                              {'ID':1316, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1269, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':27, 
                             'Node':[
                              {'ID':1317, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1270, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':8, 
                             'Node':[
                              {'ID':1318, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1271, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':15, 
                             'Node':[
                              {'ID':1319, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1272, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':8, 
                             'Node':[
                              {'ID':1320, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1273, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':7, 
                             'Node':[
                              {'ID':1321, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1274, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':8, 
                             'Node':[
                              {'ID':1322, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]}]},
                          {'ID':1233, 
                           'Class':"SelectorProbability", 
                           'RandomGenerator':(
                            battlelogic.bot.agent.a5agent.CAgent.Random,
                            (0, 100)), 
                           'Node':[
                            {'ID':1275, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':4, 
                             'Node':[
                              {'ID':1323, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1276, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':8, 
                             'Node':[
                              {'ID':1324, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1277, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':15, 
                             'Node':[
                              {'ID':1325, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1278, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':15, 
                             'Node':[
                              {'ID':1326, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1279, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':8, 
                             'Node':[
                              {'ID':1327, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1280, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':27, 
                             'Node':[
                              {'ID':1328, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1281, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':8, 
                             'Node':[
                              {'ID':1329, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1282, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':7, 
                             'Node':[
                              {'ID':1330, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1283, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':8, 
                             'Node':[
                              {'ID':1331, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]}]}]},
                        {'ID':1210, 
                         'Class':"IfElse", 
                         'Node':[
                          {'ID':1234, 
                           'Class':"Condition", 
                           'Method':(
                            Func18, ())},
                          {'ID':1235, 
                           'Class':"SelectorProbability", 
                           'RandomGenerator':(
                            battlelogic.bot.agent.a5agent.CAgent.Random,
                            (0, 100)), 
                           'Node':[
                            {'ID':1284, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':35, 
                             'Node':[
                              {'ID':1332, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1285, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':12, 
                             'Node':[
                              {'ID':1333, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1286, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':24, 
                             'Node':[
                              {'ID':1334, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1287, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':12, 
                             'Node':[
                              {'ID':1335, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1288, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':5, 
                             'Node':[
                              {'ID':1336, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1289, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':12, 
                             'Node':[
                              {'ID':1337, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]}]},
                          {'ID':1236, 
                           'Class':"SelectorProbability", 
                           'RandomGenerator':(
                            battlelogic.bot.agent.a5agent.CAgent.Random,
                            (0, 100)), 
                           'Node':[
                            {'ID':1290, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':24, 
                             'Node':[
                              {'ID':1338, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1291, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':12, 
                             'Node':[
                              {'ID':1339, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1292, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':35, 
                             'Node':[
                              {'ID':1340, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1293, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':12, 
                             'Node':[
                              {'ID':1341, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1294, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':5, 
                             'Node':[
                              {'ID':1342, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1295, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':12, 
                             'Node':[
                              {'ID':1343, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]}]}]}]},
                      {'ID':1399, 
                       'Class':"Sequence", 
                       'Node':[
                        {'ID':1400, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                         'ResultOption':0, 
                         'ResultFunctor':None},
                        {'ID':1401, 
                         'Class':"Action", 
                         'Method':(
                          battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                         'ResultOption':0, 
                         'ResultFunctor':None}]}]}]}]},
                {'ID':1402, 
                 'Class':"Sequence", 
                 'Node':[
                  {'ID':1403, 
                   'Class':"Action", 
                   'Method':(
                    battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                   'ResultOption':0, 
                   'ResultFunctor':None},
                  {'ID':1404, 
                   'Class':"Action", 
                   'Method':(
                    battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                   'ResultOption':0, 
                   'ResultFunctor':None}]}]},
              {'ID':768, 
               'Class':"IfElse", 
               'Node':[
                {'ID':769, 
                 'Class':"Condition", 
                 'Method':(
                  Func19, ())},
                {'ID':770, 
                 'Class':"IfElse", 
                 'Node':[
                  {'ID':772, 
                   'Class':"Condition", 
                   'Method':(
                    Func20, ())},
                  {'ID':773, 
                   'Class':"IfElse", 
                   'Node':[
                    {'ID':778, 
                     'Class':"Condition", 
                     'Method':(
                      Func21, ())},
                    {'ID':1101, 
                     'Class':"IfElse", 
                     'Node':[
                      {'ID':1102, 
                       'Class':"Condition", 
                       'Method':(
                        Func22, ())},
                      {'ID':1103, 
                       'Class':"SelectorProbability", 
                       'RandomGenerator':(
                        battlelogic.bot.agent.a5agent.CAgent.Random,
                        (0, 100)), 
                       'Node':[
                        {'ID':1105, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':19, 
                         'Node':[
                          {'ID':1117, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':1106, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':16, 
                         'Node':[
                          {'ID':1118, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':1107, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':50, 
                         'Node':[
                          {'ID':1119, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':1108, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':6, 
                         'Node':[
                          {'ID':1120, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':1109, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':3, 
                         'Node':[
                          {'ID':1121, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':1110, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':6, 
                         'Node':[
                          {'ID':1122, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]}]},
                      {'ID':1104, 
                       'Class':"SelectorProbability", 
                       'RandomGenerator':(
                        battlelogic.bot.agent.a5agent.CAgent.Random,
                        (0, 100)), 
                       'Node':[
                        {'ID':1111, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':50, 
                         'Node':[
                          {'ID':1123, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':1112, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':16, 
                         'Node':[
                          {'ID':1124, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':1113, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':19, 
                         'Node':[
                          {'ID':1125, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':1114, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':6, 
                         'Node':[
                          {'ID':1126, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':1115, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':3, 
                         'Node':[
                          {'ID':1127, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]},
                        {'ID':1116, 
                         'Class':"DecoratorWeight", 
                         'DecorateWhenChildEnds':False, 
                         'Weight':6, 
                         'Node':[
                          {'ID':1128, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]}]}]},
                    {'ID':1129, 
                     'Class':"IfElse", 
                     'Node':[
                      {'ID':1130, 
                       'Class':"Condition", 
                       'Method':(
                        Func23, ())},
                      {'ID':1131, 
                       'Class':"IfElse", 
                       'Node':[
                        {'ID':1133, 
                         'Class':"Condition", 
                         'Method':(
                          Func24, ())},
                        {'ID':1134, 
                         'Class':"SelectorProbability", 
                         'RandomGenerator':(
                          battlelogic.bot.agent.a5agent.CAgent.Random,
                          (0, 100)), 
                         'Node':[
                          {'ID':1139, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':4, 
                           'Node':[
                            {'ID':1156, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':1140, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':4, 
                           'Node':[
                            {'ID':1157, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':1141, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':25, 
                           'Node':[
                            {'ID':1158, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':1142, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':21, 
                           'Node':[
                            {'ID':1159, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':1143, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':13, 
                           'Node':[
                            {'ID':1160, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':1144, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':33, 
                           'Node':[
                            {'ID':1161, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]}]},
                        {'ID':1135, 
                         'Class':"SelectorProbability", 
                         'RandomGenerator':(
                          battlelogic.bot.agent.a5agent.CAgent.Random,
                          (0, 100)), 
                         'Node':[
                          {'ID':1145, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':25, 
                           'Node':[
                            {'ID':1162, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':1146, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':4, 
                           'Node':[
                            {'ID':1163, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':1147, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':4, 
                           'Node':[
                            {'ID':1164, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':1148, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':33, 
                           'Node':[
                            {'ID':1165, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':1149, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':13, 
                           'Node':[
                            {'ID':1166, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':1150, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':21, 
                           'Node':[
                            {'ID':1167, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]}]}]},
                      {'ID':1132, 
                       'Class':"IfElse", 
                       'Node':[
                        {'ID':1136, 
                         'Class':"Condition", 
                         'Method':(
                          Func25, ())},
                        {'ID':1137, 
                         'Class':"IfElse", 
                         'Node':[
                          {'ID':1151, 
                           'Class':"Condition", 
                           'Method':(
                            Func26, ())},
                          {'ID':1152, 
                           'Class':"SelectorProbability", 
                           'RandomGenerator':(
                            battlelogic.bot.agent.a5agent.CAgent.Random,
                            (0, 100)), 
                           'Node':[
                            {'ID':1168, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':15, 
                             'Node':[
                              {'ID':1180, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1169, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':6, 
                             'Node':[
                              {'ID':1181, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1170, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':29, 
                             'Node':[
                              {'ID':1182, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1171, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':29, 
                             'Node':[
                              {'ID':1183, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1172, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':6, 
                             'Node':[
                              {'ID':1184, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1173, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':15, 
                             'Node':[
                              {'ID':1185, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]}]},
                          {'ID':1153, 
                           'Class':"SelectorProbability", 
                           'RandomGenerator':(
                            battlelogic.bot.agent.a5agent.CAgent.Random,
                            (0, 100)), 
                           'Node':[
                            {'ID':1174, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':29, 
                             'Node':[
                              {'ID':1186, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1175, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':6, 
                             'Node':[
                              {'ID':1187, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1176, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':15, 
                             'Node':[
                              {'ID':1188, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1177, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':15, 
                             'Node':[
                              {'ID':1189, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1178, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':6, 
                             'Node':[
                              {'ID':1190, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1179, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':29, 
                             'Node':[
                              {'ID':1191, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]}]}]},
                        {'ID':1138, 
                         'Class':"Sequence", 
                         'Node':[
                          {'ID':1154, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                           'ResultOption':0, 
                           'ResultFunctor':None},
                          {'ID':1155, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]}]}]}]},
                  {'ID':774, 
                   'Class':"Sequence", 
                   'Node':[
                    {'ID':781, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                     'ResultOption':0, 
                     'ResultFunctor':None},
                    {'ID':782, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                     'ResultOption':0, 
                     'ResultFunctor':None}]}]},
                {'ID':771, 
                 'Class':"IfElse", 
                 'Node':[
                  {'ID':775, 
                   'Class':"Condition", 
                   'Method':(
                    Func27, ())},
                  {'ID':776, 
                   'Class':"IfElse", 
                   'Node':[
                    {'ID':783, 
                     'Class':"Condition", 
                     'Method':(
                      Func28, ())},
                    {'ID':784, 
                     'Class':"IfElse", 
                     'Node':[
                      {'ID':794, 
                       'Class':"Condition", 
                       'Method':(
                        Func29, ())},
                      {'ID':795, 
                       'Class':"IfElse", 
                       'Node':[
                        {'ID':812, 
                         'Class':"Condition", 
                         'Method':(
                          Func30, ())},
                        {'ID':813, 
                         'Class':"SelectorProbability", 
                         'RandomGenerator':(
                          battlelogic.bot.agent.a5agent.CAgent.Random,
                          (0, 100)), 
                         'Node':[
                          {'ID':865, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':11, 
                           'Node':[
                            {'ID':953, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':866, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':5, 
                           'Node':[
                            {'ID':954, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':867, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':7, 
                           'Node':[
                            {'ID':955, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':868, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':27, 
                           'Node':[
                            {'ID':956, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':869, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':14, 
                           'Node':[
                            {'ID':957, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':870, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':18, 
                           'Node':[
                            {'ID':958, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':871, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':5, 
                           'Node':[
                            {'ID':959, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':872, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':4, 
                           'Node':[
                            {'ID':960, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':873, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':9, 
                           'Node':[
                            {'ID':961, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]}]},
                        {'ID':814, 
                         'Class':"SelectorProbability", 
                         'RandomGenerator':(
                          battlelogic.bot.agent.a5agent.CAgent.Random,
                          (0, 100)), 
                         'Node':[
                          {'ID':874, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':7, 
                           'Node':[
                            {'ID':962, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':875, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':5, 
                           'Node':[
                            {'ID':963, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':876, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':11, 
                           'Node':[
                            {'ID':964, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':877, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':18, 
                           'Node':[
                            {'ID':965, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':878, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':14, 
                           'Node':[
                            {'ID':966, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':879, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':27, 
                           'Node':[
                            {'ID':967, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':880, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':9, 
                           'Node':[
                            {'ID':968, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':881, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':4, 
                           'Node':[
                            {'ID':969, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':882, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':5, 
                           'Node':[
                            {'ID':970, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]}]}]},
                      {'ID':1405, 
                       'Class':"IfElse", 
                       'Node':[
                        {'ID':1406, 
                         'Class':"Condition", 
                         'Method':(
                          Func31, ())},
                        {'ID':1407, 
                         'Class':"IfElse", 
                         'Node':[
                          {'ID':1409, 
                           'Class':"Condition", 
                           'Method':(
                            Func32, ())},
                          {'ID':1410, 
                           'Class':"SelectorProbability", 
                           'RandomGenerator':(
                            battlelogic.bot.agent.a5agent.CAgent.Random,
                            (0, 100)), 
                           'Node':[
                            {'ID':1414, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':15, 
                             'Node':[
                              {'ID':1426, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1415, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':6, 
                             'Node':[
                              {'ID':1427, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1416, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':29, 
                             'Node':[
                              {'ID':1428, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1417, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':29, 
                             'Node':[
                              {'ID':1429, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1418, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':6, 
                             'Node':[
                              {'ID':1430, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1419, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':15, 
                             'Node':[
                              {'ID':1431, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]}]},
                          {'ID':1411, 
                           'Class':"SelectorProbability", 
                           'RandomGenerator':(
                            battlelogic.bot.agent.a5agent.CAgent.Random,
                            (0, 100)), 
                           'Node':[
                            {'ID':1420, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':29, 
                             'Node':[
                              {'ID':1432, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1421, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':6, 
                             'Node':[
                              {'ID':1433, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1422, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':15, 
                             'Node':[
                              {'ID':1434, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1423, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':15, 
                             'Node':[
                              {'ID':1435, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1424, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':6, 
                             'Node':[
                              {'ID':1436, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1425, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':29, 
                             'Node':[
                              {'ID':1437, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]}]}]},
                        {'ID':1408, 
                         'Class':"Sequence", 
                         'Node':[
                          {'ID':1412, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                           'ResultOption':0, 
                           'ResultFunctor':None},
                          {'ID':1413, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]}]}]},
                    {'ID':785, 
                     'Class':"IfElse", 
                     'Node':[
                      {'ID':797, 
                       'Class':"Condition", 
                       'Method':(
                        Func33, ())},
                      {'ID':798, 
                       'Class':"IfElse", 
                       'Node':[
                        {'ID':818, 
                         'Class':"Condition", 
                         'Method':(
                          Func34, ())},
                        {'ID':819, 
                         'Class':"SelectorProbability", 
                         'RandomGenerator':(
                          battlelogic.bot.agent.a5agent.CAgent.Random,
                          (0, 100)), 
                         'Node':[
                          {'ID':888, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':30, 
                           'Node':[
                            {'ID':983, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':889, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':15, 
                           'Node':[
                            {'ID':984, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':890, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':20, 
                           'Node':[
                            {'ID':985, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':891, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':10, 
                           'Node':[
                            {'ID':986, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':892, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':10, 
                           'Node':[
                            {'ID':987, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':893, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':15, 
                           'Node':[
                            {'ID':988, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]}]},
                        {'ID':820, 
                         'Class':"SelectorProbability", 
                         'RandomGenerator':(
                          battlelogic.bot.agent.a5agent.CAgent.Random,
                          (0, 100)), 
                         'Node':[
                          {'ID':894, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':20, 
                           'Node':[
                            {'ID':989, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':895, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':15, 
                           'Node':[
                            {'ID':990, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':896, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':30, 
                           'Node':[
                            {'ID':991, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':897, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':15, 
                           'Node':[
                            {'ID':992, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 2)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':898, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':10, 
                           'Node':[
                            {'ID':993, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]},
                          {'ID':899, 
                           'Class':"DecoratorWeight", 
                           'DecorateWhenChildEnds':False, 
                           'Weight':10, 
                           'Node':[
                            {'ID':994, 
                             'Class':"Action", 
                             'Method':(
                              battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 1)), 
                             'ResultOption':0, 
                             'ResultFunctor':None}]}]}]},
                      {'ID':1438, 
                       'Class':"IfElse", 
                       'Node':[
                        {'ID':1439, 
                         'Class':"Condition", 
                         'Method':(
                          Func35, ())},
                        {'ID':1440, 
                         'Class':"IfElse", 
                         'Node':[
                          {'ID':1442, 
                           'Class':"Condition", 
                           'Method':(
                            Func36, ())},
                          {'ID':1443, 
                           'Class':"SelectorProbability", 
                           'RandomGenerator':(
                            battlelogic.bot.agent.a5agent.CAgent.Random,
                            (0, 100)), 
                           'Node':[
                            {'ID':1447, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':15, 
                             'Node':[
                              {'ID':1459, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1448, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':6, 
                             'Node':[
                              {'ID':1460, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1449, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':29, 
                             'Node':[
                              {'ID':1461, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1450, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':29, 
                             'Node':[
                              {'ID':1462, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1451, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':6, 
                             'Node':[
                              {'ID':1463, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1452, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':15, 
                             'Node':[
                              {'ID':1464, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]}]},
                          {'ID':1444, 
                           'Class':"SelectorProbability", 
                           'RandomGenerator':(
                            battlelogic.bot.agent.a5agent.CAgent.Random,
                            (0, 100)), 
                           'Node':[
                            {'ID':1453, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':29, 
                             'Node':[
                              {'ID':1465, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1454, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':6, 
                             'Node':[
                              {'ID':1466, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1455, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':15, 
                             'Node':[
                              {'ID':1467, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1456, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':15, 
                             'Node':[
                              {'ID':1468, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 2)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1457, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':6, 
                             'Node':[
                              {'ID':1469, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 0)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]},
                            {'ID':1458, 
                             'Class':"DecoratorWeight", 
                             'DecorateWhenChildEnds':False, 
                             'Weight':29, 
                             'Node':[
                              {'ID':1470, 
                               'Class':"Action", 
                               'Method':(
                                battlelogic.bot.agent.a5agent.CAgent.Hit, (2, 1)), 
                               'ResultOption':0, 
                               'ResultFunctor':None}]}]}]},
                        {'ID':1441, 
                         'Class':"Sequence", 
                         'Node':[
                          {'ID':1445, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                           'ResultOption':0, 
                           'ResultFunctor':None},
                          {'ID':1446, 
                           'Class':"Action", 
                           'Method':(
                            battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                           'ResultOption':0, 
                           'ResultFunctor':None}]}]}]}]},
                  {'ID':777, 
                   'Class':"Sequence", 
                   'Node':[
                    {'ID':786, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
                     'ResultOption':0, 
                     'ResultFunctor':None},
                    {'ID':787, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                     'ResultOption':0, 
                     'ResultFunctor':None}]}]}]}]},
            {'ID':765, 
             'Class':"Sequence", 
             'Node':[
              {'ID':766, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
               'ResultOption':0, 
               'ResultFunctor':None},
              {'ID':767, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
               'ResultOption':0, 
               'ResultFunctor':None}]}]},
          {'ID':28, 
           'Class':"Sequence", 
           'Node':[
            {'ID':35, 
             'Class':"Action", 
             'Method':(
              battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 50)), 
             'ResultOption':0, 
             'ResultFunctor':None},
            {'ID':36, 
             'Class':"Action", 
             'Method':(
              battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
             'ResultOption':0, 
             'ResultFunctor':None}]}]},
        {'ID':19, 
         'Class':"IfElse", 
         'Node':[
          {'ID':29, 
           'Class':"Condition", 
           'Method':(
            Func37, ())},
          {'ID':30, 
           'Class':"Sequence", 
           'Node':[
            {'ID':37, 
             'Class':"Action", 
             'Method':(
              battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (0, -20)), 
             'ResultOption':0, 
             'ResultFunctor':None},
            {'ID':38, 
             'Class':"Action", 
             'Method':(
              battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
             'ResultOption':0, 
             'ResultFunctor':None}]},
          {'ID':31, 
           'Class':"Noop"}]}]},
      {'ID':11, 
       'Class':"Action", 
       'Method':(
        battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
       'ResultOption':0, 
       'ResultFunctor':None}]}]}]}
