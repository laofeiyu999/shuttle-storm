//
//Loading界面>>大厅进入竞技赛的等待界面>>逻辑类定义
//yxf 2009年3月5日

import("$./../../UI/Loading/ClassDef_HallWait.gml");

class VHallWaiting_Logic item
{
	size = "100%,100%";capturemouse = true;bgcolor = "#FFFFFF";alpha = 25;
	name = "VHallWaiting_Logic_Name";
	
	window.find("gameinput").AddExclusiveShortcutUser(this);
	window.SetChatEnterFlag(window.CHAT_ENTER_NO,"VHallWaiting_Logic");//不激活
	void OnDelete()
	{
		window.find("gameinput").DelShortcutUser(this);
		window.SetChatEnterFlag(window.CHAT_ENTER_YES,"VHallWaiting_Logic");//能激活
	}
	//===================================与显示交互部分========================================
	void Init()
	{
		//显示的文字>>
		staticvar s_TEXT = new text
		{
			valign(50,0);halign(50,0);
			font = "宋体,-1,40";
			
			//参数：比赛ID,1为活动赛，2为撮合赛
			void SetData(raceID)
			{
				src = "你即将进入的比赛是："+raceID;
			}
		}
	}
	inclass("VHallWaiting_UI");//界面显示类
	//=========================================================================================
	Init();
	
	//外部接口
	//参数：比赛ID,1为活动赛，2为撮合赛,4为家族赛
	void SetData(raceID)
	{
		if(raceID == 4)
		{
			s_TEXT.SetData(4);
			return;
		}
		if(window.IsRandomRace(raceID))
		{
			s_TEXT.SetData(2);
		}else
		{
			s_TEXT.SetData(1);
		}
	}
};