//
//游戏设置：Logic+UI
//包括：声音+显示+按键
//yxf 2009年10月21日
//

importex("$./ClassDef.gml");

new item
{
	name = "GAMESETUP_LOGIC";size = "100%,100%";enableUpdate(1);
	capturemouse = true;bgcolor = window.G_BGCOLOR;alpha = window.G_ALPHA;
	new VGame_BtnLayer_Top_Logic{}

	var _LastPos = window.GetUIPos();
	window.SetUIPos(window.POS_GAMESETUP);
	window.SetGameSetUpOpenState(true);
	//==========================快捷键==================================
	void OnCreated()
	{
//		window.find("NAME_GCMap").KeyBoardEnable(0);//0锁定解锁按键 1解除锁定
		window.find("gameinput").AddExclusiveShortcutUser(this);
//		window.find("gameinput").SetExclusiveUser(this);
//		window.find("gameinput").SetDirOnUse(0);//0是关闭方向,1是开启方向
		window.SetChatEnterFlag(window.CHAT_ENTER_NO,"GAMESETUP_LOGIC");//不激活
	}
	void OnDelete()
	{
		window.SetUIPos(_LastPos);
//		window.find("gameinput").SetDirOnUse(1);//0是关闭方向,1是开启方向
//		window.find("gameinput").DeleteUser(this);
		window.find("gameinput").DelShortcutUser(this);
//		window.find("NAME_GCMap").KeyBoardEnable(1);//0锁定解锁按键 1解除锁定
		window.SetChatEnterFlag(window.CHAT_ENTER_YES,"GAMESETUP_LOGIC");//能激活
		window.SetGameSetUpOpenState(false);
	}
	void DI_ShortcutKey(data)
	{
		switch (data)
		{
			case 3: //Esc
			{
				_VGameSetUp_Logic.OnClick_BtnCancel();
				break;
			}
			case 4: //Enter
			{
				_VGameSetUp_Logic.OnClick_BtnSave();
				break;
			}
		}
	}
	//====================================================================
	var _VGameSetUp_Logic = new VGameSetUp_Logic{}

	void OnMouseDownL()
	{
		window.find("ComBoxList_Login").SetMyHide(false);
		window.find("ComBoxList_Hall").SetMyHide(false);
		window.find("ComBoxList_Game").SetMyHide(false);
	}
}