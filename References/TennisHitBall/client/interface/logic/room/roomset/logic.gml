//
//房间设置界面-UI+Logic
//yxf 2008年8月13日
//

new item
{
	name = "ROOM_SET_LOGIC";size = "100%,100%";enableUpdate(1);//capturemouse = true;
	new VGame_BtnLayer_Top_Logic{}
	
	var _LastPos = window.GetUIPos();
	window.SetUIPos(window.POS_ROOM_ROOMSET);
	//==========================快捷键==================================
	void OnCreated()
	{
		window.find("NAME_GCMap").KeyBoardEnable(0);//0锁定解锁按键 1解除锁定
		window.find("gameinput").AddExclusiveShortcutUser(this);
		window.find("gameinput").SetExclusiveUser(this);
		window.find("gameinput").SetDirOnUse(0);//0是关闭方向,1是开启方向
		window.SetChatEnterFlag(window.CHAT_ENTER_NO,"ROOM_SET_LOGIC");//不激活
		window.SetRoomSetOpenState(true);
		zindex = "top";
	}
	void OnDelete()
	{	
		window.SetUIPos(_LastPos);

		window.find("gameinput").SetDirOnUse(1);//0是关闭方向,1是开启方向
		window.find("gameinput").DeleteUser(this);
		window.find("gameinput").DelShortcutUser(this);
		window.find("NAME_GCMap").KeyBoardEnable(1);//0锁定解锁按键 1解除锁定
		window.SetChatEnterFlag(window.CHAT_ENTER_YES,"ROOM_SET_LOGIC");//能激活
		window.SetRoomSetOpenState(false);
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
				_RoomSet.SetRoomNameHot();
				break;
			}
			case 7://Tab
			{
				_RoomSet.ChangeHot();
			}
		}
	}
	//====================================================================
	var _RoomSet = new VHall_CreateRoom_Tennis_Logic
	{
		SetOpenType(2);
	}
}