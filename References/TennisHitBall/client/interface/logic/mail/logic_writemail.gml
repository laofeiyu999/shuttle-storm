//邮件 - 写邮件
//yxf 2009年10月20日

importex("$./ClassDef_WriteMail.gml");

new item
{
	name = "WRITEMAIL_LOGIC";size = "100%,100%";enableUpdate(1);
	capturemouse = true;bgcolor = window.G_BGCOLOR;alpha = window.G_ALPHA;
	new VGame_BtnLayer_Top_Logic{}
	var _LastPos = window.GetUIPos();
	window.SetUIPos(window.POS_WRITEMAIL);
	//==========================快捷键==================================
	void OnCreated()
	{
		window.find("NAME_GCMap").KeyBoardEnable(0);//0锁定解锁按键 1解除锁定
		window.find("gameinput").AddExclusiveShortcutUser(this);
		window.find("gameinput").SetExclusiveUser(this);
		window.find("gameinput").SetDirOnUse(0);//0是关闭方向,1是开启方向
		window.SetChatEnterFlag(window.CHAT_ENTER_NO,"WRITEMAIL_LOGIC");//不激活
	}
	void OnDelete()
	{
		window.SetUIPos(_LastPos);

		window.find("gameinput").SetDirOnUse(1);//0是关闭方向,1是开启方向
		window.find("gameinput").DeleteUser(this);
		window.find("gameinput").DelShortcutUser(this);
		window.find("NAME_GCMap").KeyBoardEnable(1);//0锁定解锁按键 1解除锁定
		window.SetChatEnterFlag(window.CHAT_ENTER_YES,"WRITEMAIL_LOGIC");//能激活
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
//				_VWriteMail_Logic.OnClick_Confirm();
			}
			case 7://Tab
			{
				_VWriteMail_Logic.ChangeHot();
			}
		}
	}
	
	//==================================================================
	var _VWriteMail_Logic = new VWriteMail_Logic
	{
	}

	void OnClick()
	{
		_VWriteMail_Logic.s_CB_FriendList.SetMyHide(false);
	}
}