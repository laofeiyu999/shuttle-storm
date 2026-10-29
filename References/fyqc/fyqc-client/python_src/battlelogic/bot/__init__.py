# uncompyle6 version 3.9.3
# Python bytecode version base 3.6 (3379)
# Decompiled from: Python 3.12.13 (main, Mar  3 2026, 15:01:35) [MSC v.1944 64 bit (AMD64)]
# Embedded file name: .\battlelogic\bot\__init__.py
# Compiled at: 2023-04-06 17:07:53
# Size of source mod 2**32: 2243 bytes
from __future__ import absolute_import
from _functools import partial
from battlelogic.common.debug import LogError
from pubbehaviorc import workspace
from pubbehaviorc import tools
import os, importlib
if "g_AgentMoudle" not in globals():
    g_AgentMoudle = {}

class Functor(partial):

    def __getattr__(self, sAttr):
        if sAttr == "m_Type":
            return
        raise AttributeError("'Functor object has no attribute '%s'" % sAttr)

    def Type(self):
        return self.m_Type

    def SetType(self, a):
        self.m_Type = a


class CCustomProductFunc(tools.CProductFunc):

    def Functor(self, *args):
        return Functor(*args)

    def GetProjectTreePath(self):
        return "base.btdata"

    def CanHotReload(self):
        return True


def BaseStart():
    oProductFunc = CCustomProductFunc()
    tools.SetProductFunc(oProductFunc)


def GetWorkSpace():
    return workspace.GetInstance()


def NewGameSpace():
    return workspace.NewGame()


def HotReload(sTree):
    workspace.GetInstance().HotReload(sTree)


def MyInit():
    BaseStart()


def GetAgentClass(sAgent):
    global g_AgentMoudle
    if sAgent not in g_AgentMoudle:
        try:
            sImport = "%s" % sAgent
            mod = importlib.import_module(sImport)
            g_AgentMoudle[sAgent] = mod
        except:
            return

    return g_AgentMoudle[sAgent].CAgent


def CreateBOTAgent(iConfID, oAIManager):
    sTree = "bt%d" % iConfID
    oInstance = workspace.GetInstance()
    oTree = oInstance.LoadBehaviorTree(sTree)
    if not oTree:
        LogError("create bot agent %d tree data not found" % (iConfID,))
        return
    else:
        sAgent = oTree.GetAgentType()
        oAgent = oAIManager.CreateAgent(GetAgentClass(sAgent), "%s%s" % (sAgent, 1), 0, 0)
        oAgent.BTSetCurrent(sTree)
        return oAgent
