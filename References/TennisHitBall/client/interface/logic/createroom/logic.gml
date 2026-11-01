//
//创建房间：Logic+UI
//包括：网球比赛
//yxf 2008年8月29日13:50
//

//importex("$./ClassDef_Tennis.gml");

new item
{
	name = "CREATEROOM_LOGIC";size = "100%,100%";capturemouse = true;enableUpdate(1);
	new VGame_BtnLayer_Top_Logic{}
	//==========================快捷键==================================
	window.find("gameinput").AddExclusiveShortcutUser(this);

	var _LastPos = window.GetUIPos();
	window.SetUIPos(window.POS_CREATEROOM);

	void OnCreated()
	{
		window.SetChatEnterFlag(window.CHAT_ENTER_NO,"CREATEROOM_LOGIC");//不激活
	}
	void OnDelete()
	{
		window.SetUIPos(_LastPos);
		window.find("gameinput").DelShortcutUser(this);
		window.SetChatEnterFlag(window.CHAT_ENTER_YES,"CREATEROOM_LOGIC");//能激活
	}
	void DI_ShortcutKey(data)
	{
		switch (data)
		{
			case 3: //Esc
			{
				del();
				break;
			}
			case 4: //Enter
			{
				_CreateRoom.SetRoomNameHot();
				break;
			}
			case 7://Tab
			{
				_CreateRoom.ChangeHot();
			}
		}
	}
	//====================================================================
	var _CreateRoom = new VHall_CreateRoom_Tennis_Logic
	{
		SetOpenType(1);
	}
}