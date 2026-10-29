# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\base\btdata\bt7001.py
# Compiled at: 2023-04-06 17:07:41
# Size of source mod 2**32: 11448 bytes
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
    return battlelogic.bot.agent.a5agent.CAgent.GetBadmintonHigh(oAgent) <= 200.0


def Func8(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetDropPosToNetDistance(oAgent) <= 200.0


def Func9(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetHorzDistFromBadminton(oAgent) <= 230.0


def Func10(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.CouldUseHitKey(4, oAgent) == True


def Func11(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsAttacker(oAgent) == True


def Func12(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsInTheArea(5, oAgent) == True


data = {'Name':"bt7001", 
 'ID':0, 
 'AgentType':"battlelogic.bot.agent.a5agent", 
 'IsFSM':False, 
 'Ver':33, 
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
    {'ID':69, 
     'Class':"Sequence", 
     'Node':[
      {'ID':70, 
       'Class':"IfElse", 
       'Node':[
        {'ID':72, 
         'Class':"Condition", 
         'Method':(
          Func2, ())},
        {'ID':73, 
         'Class':"Sequence", 
         'Node':[
          {'ID':77, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (20, 50)), 
           'ResultOption':0, 
           'ResultFunctor':None},
          {'ID':78, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
           'ResultOption':0, 
           'ResultFunctor':None}]},
        {'ID':74, 
         'Class':"Sequence", 
         'Node':[
          {'ID':79, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (-20, 50)), 
           'ResultOption':0, 
           'ResultFunctor':None},
          {'ID':80, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
           'ResultOption':0, 
           'ResultFunctor':None}]}]},
      {'ID':81, 
       'Class':"Action", 
       'Method':(
        battlelogic.bot.agent.a5agent.CAgent.Hit, (1, 0)), 
       'ResultOption':0, 
       'ResultFunctor':None}]},
    {'ID':19, 
     'Class':"IfElse", 
     'Node':[
      {'ID':20, 
       'Class':"Condition", 
       'Method':(
        Func3, ())},
      {'ID':21, 
       'Class':"IfElse", 
       'Node':[
        {'ID':23, 
         'Class':"Condition", 
         'Method':(
          Func4, ())},
        {'ID':24, 
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
            {'ID':82, 
             'Class':"IfElse", 
             'Node':[
              {'ID':83, 
               'Class':"Condition", 
               'Method':(
                Func7, ())},
              {'ID':87, 
               'Class':"IfElse", 
               'Node':[
                {'ID':88, 
                 'Class':"Condition", 
                 'Method':(
                  Func8, ())},
                {'ID':89, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                 'ResultOption':0, 
                 'ResultFunctor':None},
                {'ID':90, 
                 'Class':"IfElse", 
                 'Node':[
                  {'ID':91, 
                   'Class':"Condition", 
                   'Method':(
                    Func9, ())},
                  {'ID':96, 
                   'Class':"IfElse", 
                   'Node':[
                    {'ID':97, 
                     'Class':"Condition", 
                     'Method':(
                      Func10, ())},
                    {'ID':98, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.Hit, (4, 0)), 
                     'ResultOption':0, 
                     'ResultFunctor':None},
                    {'ID':99, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.Hit, (32, 0)), 
                     'ResultOption':0, 
                     'ResultFunctor':None}]},
                  {'ID':93, 
                   'Class':"Sequence", 
                   'Node':[
                    {'ID':94, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 30)), 
                     'ResultOption':0, 
                     'ResultFunctor':None},
                    {'ID':95, 
                     'Class':"Action", 
                     'Method':(
                      battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                     'ResultOption':0, 
                     'ResultFunctor':None}]}]}]},
              {'ID':84, 
               'Class':"Sequence", 
               'Node':[
                {'ID':85, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 30)), 
                 'ResultOption':0, 
                 'ResultFunctor':None},
                {'ID':86, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
                 'ResultOption':0, 
                 'ResultFunctor':None}]}]},
            {'ID':41, 
             'Class':"Sequence", 
             'Node':[
              {'ID':49, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 30)), 
               'ResultOption':0, 
               'ResultFunctor':None},
              {'ID':50, 
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
              battlelogic.bot.agent.a5agent.CAgent.MoveToDropPos, (0, 30)), 
             'ResultOption':0, 
             'ResultFunctor':None},
            {'ID':43, 
             'Class':"Action", 
             'Method':(
              battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
             'ResultOption':0, 
             'ResultFunctor':None}]}]},
        {'ID':25, 
         'Class':"IfElse", 
         'Node':[
          {'ID':32, 
           'Class':"Condition", 
           'Method':(
            Func11, ())},
          {'ID':33, 
           'Class':"Sequence", 
           'Node':[
            {'ID':44, 
             'Class':"Action", 
             'Method':(
              battlelogic.bot.agent.a5agent.CAgent.MoveToDefensePos, (0, 50)), 
             'ResultOption':0, 
             'ResultFunctor':None},
            {'ID':45, 
             'Class':"Action", 
             'Method':(
              battlelogic.bot.agent.a5agent.CAgent.StopMove, ()), 
             'ResultOption':0, 
             'ResultFunctor':None}]},
          {'ID':34, 
           'Class':"Noop"}]}]},
      {'ID':22, 
       'Class':"IfElse", 
       'Node':[
        {'ID':26, 
         'Class':"Condition", 
         'Method':(
          Func12, ())},
        {'ID':27, 
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
        {'ID':28, 
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
