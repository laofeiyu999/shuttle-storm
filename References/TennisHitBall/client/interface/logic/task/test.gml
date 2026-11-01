new img3d{};
size="1024,768";
wndsize="1024,768";
bkcolor="#aaaaaa";

load("$./../init.gml");
//load("$./DBDebug.gml");
//import("$./ClassDef_Task_TaskFollow.gml");

//new VTask_TaskFollow_Logic{SetBind(1,"上山打老虎",10);};

/*new item
{
	pos="0,100";size="50,50";bgcolor="#ffff";
	void OnMouseDownL()
	{
		window._a.AddMission(1,"任务1",10);
	}
	void OnMouseDownR()
	{
		window._a.DelMission(1);
	}
}

new item
{
	pos="60,100";size="50,50";bgcolor="#ffff";
	void OnMouseDownL()
	{
//		window._a.AddMission(2,"任务2",10);
		window._a.SetOPCurState(13);
	}
	void OnMouseDownR()
	{
		window._a.DelMission(2);
	}
}

var _a = new VTask_TaskFollowMgr_Logic{halign = "50,0"};

new editpos{size="172,20";}*/

import("$./logic.gml");