import("$./ClassDef_PropContinue.gml");

new item
{
	name = "Item_PropContinue_Logic";
	size = "100%,100%";
	capturemouse = true;bgcolor = window.G_BGCOLOR;alpha = window.G_ALPHA;
	var _LastPos = window.GetUIPos();
	window.SetUIPos(window.POS_PROPCONTINUE);
	new VGame_BtnLayer_Top_Logic{}

	//获取最新打折信息
	window.g_ItemAgio = window.GetAgio();
	window.g_LuckyCardAgio = window.GetLuckyCardAgio();
	//=============================================
	void OnCreated()
	{
		window.find("NAME_GCMap").KeyBoardEnable(0);//0锁定解锁按键 1解除锁定
		window.find("gameinput").AddExclusiveShortcutUser(this);
		window.find("gameinput").SetDirOnUse(0);//0是关闭方向,1是开启方向
		window.SetChatEnterFlag(window.CHAT_ENTER_NO,"Item_PropContinue_Logic");//不激活
	}
	void OnDelete()
	{
		window.SetUIPos(_LastPos);
		window.find("gameinput").SetDirOnUse(1);//0是关闭方向,1是开启方向
		window.find("gameinput").DelShortcutUser(this);
		window.find("NAME_GCMap").KeyBoardEnable(1);//0锁定解锁按键 1解除锁定
		window.SetChatEnterFlag(window.CHAT_ENTER_YES,"Item_PropContinue_Logic");//能激活
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
				break;
			}
		}
	}

	var _PropContinue = new VItem_PropContinue_Logic{}
}