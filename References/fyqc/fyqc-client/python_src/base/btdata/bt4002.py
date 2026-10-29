# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\base\btdata\bt4002.py
# Compiled at: 2023-04-06 17:07:41
# Size of source mod 2**32: 13513 bytes
import battlelogic.bot.agent.a5agent

def Func0(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetCurMoveTargetIdx(oAgent) == 0


def Func1(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsInPos(400, -150, oAgent) == True


def Func2(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsInPos(-400, -150, oAgent) == True


def Func3(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsInPos(400, -350, oAgent) == True


def Func4(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsInPos(-400, -350, oAgent) == True


def Func5(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsInPos(400, -550, oAgent) == True


def Func6(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.IsInPos(-400, -550, oAgent) == True


def Func7(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetCurMoveTargetIdx(oAgent) == 2


def Func8(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.HasTheState(7009, oAgent) == False


def Func9(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetCurMoveTargetIdx(oAgent) == 4


def Func10(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.HasTheState(7009, oAgent) == False


def Func11(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetCurMoveTargetIdx(oAgent) == 6


def Func12(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.HasTheState(7009, oAgent) == False


def Func13(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetCurMoveTargetIdx(oAgent) == 8


def Func14(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.HasTheState(7009, oAgent) == False


def Func15(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetCurMoveTargetIdx(oAgent) == 10


def Func16(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.HasTheState(7009, oAgent) == False


def Func17(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.GetCurMoveTargetIdx(oAgent) == 12


def Func18(oAgent):
    return battlelogic.bot.agent.a5agent.CAgent.HasTheState(7009, oAgent) == False


data = {'Name':"bt4002", 
 'ID':0, 
 'AgentType':"battlelogic.bot.agent.a5agent", 
 'IsFSM':False, 
 'Ver':100, 
 'Node':[
  {'ID':1, 
   'Class':"IfElse", 
   'Node':[
    {'ID':2, 
     'Class':"Condition", 
     'Method':(
      Func0, ())},
    {'ID':38, 
     'Class':"Sequence", 
     'Node':[
      {'ID':7, 
       'Class':"IfElse", 
       'Node':[
        {'ID':5, 
         'Class':"Condition", 
         'Method':(
          Func1, ())},
        {'ID':6, 
         'Class':"Action", 
         'Method':(
          battlelogic.bot.agent.a5agent.CAgent.InitCurMoveTargetIndex, (1, )), 
         'ResultOption':0, 
         'ResultFunctor':None},
        {'ID':8, 
         'Class':"IfElse", 
         'Node':[
          {'ID':9, 
           'Class':"Condition", 
           'Method':(
            Func2, ())},
          {'ID':10, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.InitCurMoveTargetIndex, (3, )), 
           'ResultOption':0, 
           'ResultFunctor':None},
          {'ID':16, 
           'Class':"IfElse", 
           'Node':[
            {'ID':17, 
             'Class':"Condition", 
             'Method':(
              Func3, ())},
            {'ID':18, 
             'Class':"Action", 
             'Method':(
              battlelogic.bot.agent.a5agent.CAgent.InitCurMoveTargetIndex, (5, )), 
             'ResultOption':0, 
             'ResultFunctor':None},
            {'ID':22, 
             'Class':"IfElse", 
             'Node':[
              {'ID':23, 
               'Class':"Condition", 
               'Method':(
                Func4, ())},
              {'ID':26, 
               'Class':"Action", 
               'Method':(
                battlelogic.bot.agent.a5agent.CAgent.InitCurMoveTargetIndex, (7, )), 
               'ResultOption':0, 
               'ResultFunctor':None},
              {'ID':27, 
               'Class':"IfElse", 
               'Node':[
                {'ID':28, 
                 'Class':"Condition", 
                 'Method':(
                  Func5, ())},
                {'ID':29, 
                 'Class':"Action", 
                 'Method':(
                  battlelogic.bot.agent.a5agent.CAgent.InitCurMoveTargetIndex, (9, )), 
                 'ResultOption':0, 
                 'ResultFunctor':None},
                {'ID':30, 
                 'Class':"IfElse", 
                 'Node':[
                  {'ID':31, 
                   'Class':"Condition", 
                   'Method':(
                    Func6, ())},
                  {'ID':32, 
                   'Class':"Action", 
                   'Method':(
                    battlelogic.bot.agent.a5agent.CAgent.InitCurMoveTargetIndex, (11, )), 
                   'ResultOption':0, 
                   'ResultFunctor':None},
                  {'ID':33, 
                   'Class':"Noop"}]}]}]}]}]}]},
      {'ID':39, 
       'Class':"Action", 
       'Method':(
        battlelogic.bot.agent.a5agent.CAgent.AddState, (7008, )), 
       'ResultOption':0, 
       'ResultFunctor':None}]},
    {'ID':88, 
     'Class':"Parallel", 
     'FailurePolicy':0, 
     'SuccessPolicy':1, 
     'ExitPolicy':0, 
     'ChildFinishPolicy':1, 
     'Node':[
      {'ID':82, 
       'Class':"Parallel", 
       'FailurePolicy':0, 
       'SuccessPolicy':1, 
       'ExitPolicy':0, 
       'ChildFinishPolicy':1, 
       'Node':[
        {'ID':13, 
         'Class':"Action", 
         'Method':(
          battlelogic.bot.agent.a5agent.CAgent.MoveToTargetPos, (1, 2, -400, -150)), 
         'ResultOption':0, 
         'ResultFunctor':None},
        {'ID':46, 
         'Class':"IfElse", 
         'Node':[
          {'ID':52, 
           'Class':"And", 
           'Node':[
            {'ID':70, 
             'Class':"Condition", 
             'Method':(
              Func7, ())},
            {'ID':76, 
             'Class':"Condition", 
             'Method':(
              Func8, ())}]},
          {'ID':58, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.AddState, (7009, )), 
           'ResultOption':0, 
           'ResultFunctor':None},
          {'ID':65, 
           'Class':"Noop"}]}]},
      {'ID':83, 
       'Class':"Parallel", 
       'FailurePolicy':0, 
       'SuccessPolicy':1, 
       'ExitPolicy':0, 
       'ChildFinishPolicy':1, 
       'Node':[
        {'ID':15, 
         'Class':"Action", 
         'Method':(
          battlelogic.bot.agent.a5agent.CAgent.MoveToTargetPos, (3, 4, 400, -150)), 
         'ResultOption':0, 
         'ResultFunctor':None},
        {'ID':47, 
         'Class':"IfElse", 
         'Node':[
          {'ID':53, 
           'Class':"And", 
           'Node':[
            {'ID':71, 
             'Class':"Condition", 
             'Method':(
              Func9, ())},
            {'ID':77, 
             'Class':"Condition", 
             'Method':(
              Func10, ())}]},
          {'ID':59, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.AddState, (7009, )), 
           'ResultOption':0, 
           'ResultFunctor':None},
          {'ID':64, 
           'Class':"Noop"}]}]},
      {'ID':84, 
       'Class':"Parallel", 
       'FailurePolicy':0, 
       'SuccessPolicy':1, 
       'ExitPolicy':0, 
       'ChildFinishPolicy':1, 
       'Node':[
        {'ID':20, 
         'Class':"Action", 
         'Method':(
          battlelogic.bot.agent.a5agent.CAgent.MoveToTargetPos, (5, 6, -400, -350)), 
         'ResultOption':0, 
         'ResultFunctor':None},
        {'ID':48, 
         'Class':"IfElse", 
         'Node':[
          {'ID':54, 
           'Class':"And", 
           'Node':[
            {'ID':72, 
             'Class':"Condition", 
             'Method':(
              Func11, ())},
            {'ID':78, 
             'Class':"Condition", 
             'Method':(
              Func12, ())}]},
          {'ID':60, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.AddState, (7009, )), 
           'ResultOption':0, 
           'ResultFunctor':None},
          {'ID':66, 
           'Class':"Noop"}]}]},
      {'ID':85, 
       'Class':"Parallel", 
       'FailurePolicy':0, 
       'SuccessPolicy':1, 
       'ExitPolicy':0, 
       'ChildFinishPolicy':1, 
       'Node':[
        {'ID':24, 
         'Class':"Action", 
         'Method':(
          battlelogic.bot.agent.a5agent.CAgent.MoveToTargetPos, (7, 8, 400, -350)), 
         'ResultOption':0, 
         'ResultFunctor':None},
        {'ID':49, 
         'Class':"IfElse", 
         'Node':[
          {'ID':55, 
           'Class':"And", 
           'Node':[
            {'ID':73, 
             'Class':"Condition", 
             'Method':(
              Func13, ())},
            {'ID':79, 
             'Class':"Condition", 
             'Method':(
              Func14, ())}]},
          {'ID':61, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.AddState, (7009, )), 
           'ResultOption':0, 
           'ResultFunctor':None},
          {'ID':67, 
           'Class':"Noop"}]}]},
      {'ID':86, 
       'Class':"Parallel", 
       'FailurePolicy':0, 
       'SuccessPolicy':1, 
       'ExitPolicy':0, 
       'ChildFinishPolicy':1, 
       'Node':[
        {'ID':34, 
         'Class':"Action", 
         'Method':(
          battlelogic.bot.agent.a5agent.CAgent.MoveToTargetPos, (9, 10, -400, -550)), 
         'ResultOption':0, 
         'ResultFunctor':None},
        {'ID':50, 
         'Class':"IfElse", 
         'Node':[
          {'ID':56, 
           'Class':"And", 
           'Node':[
            {'ID':74, 
             'Class':"Condition", 
             'Method':(
              Func15, ())},
            {'ID':80, 
             'Class':"Condition", 
             'Method':(
              Func16, ())}]},
          {'ID':62, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.AddState, (7009, )), 
           'ResultOption':0, 
           'ResultFunctor':None},
          {'ID':68, 
           'Class':"Noop"}]}]},
      {'ID':87, 
       'Class':"Parallel", 
       'FailurePolicy':0, 
       'SuccessPolicy':1, 
       'ExitPolicy':0, 
       'ChildFinishPolicy':1, 
       'Node':[
        {'ID':36, 
         'Class':"Action", 
         'Method':(
          battlelogic.bot.agent.a5agent.CAgent.MoveToTargetPos, (11, 12, 400, -550)), 
         'ResultOption':0, 
         'ResultFunctor':None},
        {'ID':51, 
         'Class':"IfElse", 
         'Node':[
          {'ID':57, 
           'Class':"And", 
           'Node':[
            {'ID':75, 
             'Class':"Condition", 
             'Method':(
              Func17, ())},
            {'ID':81, 
             'Class':"Condition", 
             'Method':(
              Func18, ())}]},
          {'ID':63, 
           'Class':"Action", 
           'Method':(
            battlelogic.bot.agent.a5agent.CAgent.AddState, (7009, )), 
           'ResultOption':0, 
           'ResultFunctor':None},
          {'ID':69, 
           'Class':"Noop"}]}]}]}]}]}
