//查找玩家
//yxf 2009年10月20日

importex("$./ClassDef_FindUser.gml");

new item
{
	name = "FINDUSER_LOGIC";size = "100%,100%";enableUpdate(1);
	capturemouse = true;bgcolor = window.G_BGCOLOR;alpha = window.G_ALPHA;
	new VGame_BtnLayer_Top_Logic{}
	//==========================快捷键==================================
	void OnCreated()
	{
		window.find("NAME_GCMap").KeyBoardEnable(0);//0锁定解锁按键 1解除锁定
		window.find("gameinput").AddExclusiveShortcutUser(this);
		window.find("gameinput").SetDirOnUse(0);//0是关闭方向,1是开启方向

//		window.SetChatEnterFlag(window.CHAT_ENTER_NO,"FINDUSER_LOGIC");//不激活
	}
	void OnDelete()
	{
		window.find("gameinput").SetDirOnUse(1);//0是关闭方向,1是开启方向
		window.find("gameinput").DelShortcutUser(this);
		window.find("NAME_GCMap").KeyBoardEnable(1);//0锁定解锁按键 1解除锁定

//		window.SetChatEnterFlag(window.CHAT_ENTER_YES,"FINDUSER_LOGIC");//能激活
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
			case 4://回车
			{
				_VFindUser_Logic.OnClick_Confirm();
			}
		}
	}
	//==================================================================
	var _VFindUser_Logic = new VFindUser_Logic{}
}