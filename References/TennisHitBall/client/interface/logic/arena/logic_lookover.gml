//活动说明-界面
//yxf 2009年10月17日

importex("$./ClassDef_LookOver.gml");

new item
{
	name = "ARENA_LOOKOVER_LOGIC";size = "100%,100%";enableUpdate(1);
	capturemouse = true;bgcolor = window.G_BGCOLOR;alpha = window.G_ALPHA;
	new VGame_BtnLayer_Top_Logic{}
	//==========================快捷键==================================
	void OnCreated()
	{
		window.find("gameinput").AddExclusiveShortcutUser(this);
		window.SetChatEnterFlag(window.CHAT_ENTER_NO,"ARENA_LOOKOVER_LOGIC");//不激活
	}
	void OnDelete()
	{
		window.find("gameinput").DelShortcutUser(this);
		window.SetChatEnterFlag(window.CHAT_ENTER_YES,"ARENA_LOOKOVER_LOGIC");//能激活
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
				_LookOver.OnClick_Apply();
			}
		}
	}
	//==================================================================
	var _LookOver = new VArena_LookOver_Logic{}
}