//
//房间界面-UI+Logic
//yxf 2009年3月12日
//
import("$./../ArenaOver/ClassDef_Monitor.gml");
importex("$./ClassDef.gml");
import("$./ClassDef_MsgBox.gml");
importex("$./ClassDef_HangMsg.gml");

new item
{
	enableUpdate(1);

	name = "ROOM_LOGIC";size = "100%,100%";//show = false;
	window.g_AllPlayersNum = 0;
	window.g_AllPlayersUID[0] = 0;
	window.g_AllPlayersUID[1] = 0;
	window.g_AllPlayersUID[2] = 0;
	window.g_AllPlayersUID[3] = 0;

	var _otherSet = new COtherSet
	{
		if(GetOtherSet(window.OTHER_NKNAME) == 1)
		{
			window.SetRolemodel_UserNameShowState(true);
		}
		else
		{
			window.SetRolemodel_UserNameShowState(false);
		}
		if(GetOtherSet(window.OTHER_FAMILY) == 1)
		{
			window.SetRolemodel_FamilyNameShowState(true);
		}
		else
		{
			window.SetRolemodel_FamilyNameShowState(false);
		}
	}
	//==========================快捷键==================================
	window.find("gameinput").AddShortcutUser(this);
	window.SetUIPos(window.POS_ROOM);
	void OnCreated()
	{
		
		window.SetMyState(2);//房间中
	}
	void OnDelete()
	{
		window.SetMyState(1);//空闲中
		window._RoomUser.del();//同一房间玩家类 
		window.find("gameinput").DelShortcutUser(this);
		window.g_AllPlayersNum = 0;
		window.g_AllPlayersUID[0] = 0;
		window.g_AllPlayersUID[1] = 0;
		window.g_AllPlayersUID[2] = 0;
		window.g_AllPlayersUID[3] = 0;
		window.cursor = window.CURSOR_ARROW;
//		printf("xiayy:g_AllPlayersNum:Room:"+window.g_AllPlayersNum);

//		while(window.g_Room_userNum != 0)
//		{
//			window.find("VRoleModel_Info_Logic_Name_"+window.g_Room_userNum).del();
//			window.g_Room_userNum -= 1;
//		}
	}
	void DI_ShortcutKey(data)
	{
		if (!GetMyRoomShow())
		{
			return;
		}

		switch (data)
		{
			case 3: //Esc
			{
				window.RoomToHall();
				break;
			}
			case 9: //F1
			{
				_VRoom_Logic.OnClick_F1();
				break;
			}
		}
	}
	
	//2009年12月22日 yxf 
	var m_IsRoomShow = true;
	void SetMyRoomShow(param)
	{
		printf("B# >>房间SetMyRoomShow():param:"+param);
		m_IsRoomShow = param;
		show = m_IsRoomShow;
	}
	void GetMyRoomShow()
	{
		printf("B# >>房间GetMyRoomShow():m_IsRoomShow:"+m_IsRoomShow);
		return m_IsRoomShow;
	}

	if (window.g_ArenaJoinRoom)
	{
		staticvar _Monitor = new Varena_Monitor{}
	}
	else
	{
		window.find("UIController").LoadUI("UI_ROOM_BTN"); 
	}
	var _VRoom_Logic = new VRoom_Logic{}

	


	///////////////////////////////////////////////GCMAP//////////////////////////////////////////////
	load("$./GCMap.gml");
	window.find("GAMELAYER").find("NAME_GCMap").find("GCBall").SetVisible(0);
}