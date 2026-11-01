import("$./../Room/GCMapClass.gml");
importex("$./../../UI/Family/ClassDef_Family_Room.gml");

class Family_GameGCMap GameGCMap
{
	void Init()
	{
		//等待游戏
		staticvar s_Img_WaitStart = new item
		{}
//		//比赛马上要开始
//		staticvar s_Img_ReadyGame = new item
//		{}
		//退出：按钮
		staticvar s_Btn_Exit = new img
		{}
	}
	inclass("VFamily_Room_UI");
	vmlBall.del();
	void SetEvent()
	{
		set s_Btn_Exit
		{
			void OnClick()
			{
				window.RoomToFamily();
			}
		}
	}
	//=======================
	//使人物能够移动
	void SetRoleModelCanMove()
	{
		window.g_Row.InitByInt(window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_UID,window.GetMyUID());
		if(!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			return window.DB_ERR;
		}
		window.g_Row.SetInt(window.M_G_SERVER_USERDT_RULESTATION,5);
		window.g_Row.UpdateEnd();
		window.g_Row.Release();
//		var _row = new VNet2DBRow{};
//		_row.InitByInt(window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_UID,window.GetMyUID());alert(window.GetMyUID());
//		_row.SetInt(window.M_G_SERVER_USERDT_RULESTATION,5);
//		_row.UpdateEnd();
//		_row.del();
	}

	new VmlGCSelf
	{
		void OnCreated()
		{
			parent.SetRoleModelCanMove();
			SetUserId( window.GetMyUID());
			SelfInit();
		}
		
	}
	SelfInit(window.GetMyUID());
	Init();
	SetEvent();
}