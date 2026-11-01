//随机游戏
//yxf 2009年11月25日

importex("$./ClassDef_RandGameTip.gml");

new item
{
	name = "RANDGAME_LOGIC";size = "100%,100%";
	bgcolor = window.G_BGCOLOR;alpha = window.G_ALPHA;enableUpdate(1);capturemouse = true;
	new VGame_BtnLayer_Top_Logic{}
	//==========================快捷键==================================
	void OnCreated()
	{
		window.find("gameinput").AddExclusiveShortcutUser(this);
		//window.SetChatEnterFlag(window.CHAT_ENTER_NO,"RANDGAME_LOGIC");//不激活
		timer(2000,"capturemouse=false");
	}
	void OnDelete()
	{
		window.find("gameinput").DelShortcutUser(this);
		//window.SetChatEnterFlag(window.CHAT_ENTER_YES,"RANDGAME_LOGIC");//能激活
	}
	void DI_ShortcutKey(data)
	{
		switch (data)
		{
			case 3: //Esc
			{
				_VRandGameTip_Logic.OnClick_Cancel();
				break;
			}
		}
	}
	//==================================================================
	var _VRandGameTip_Logic = new VRandGameTip_Logic{}
}