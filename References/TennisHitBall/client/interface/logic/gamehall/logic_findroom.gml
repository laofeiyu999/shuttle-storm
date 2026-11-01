//查找房间
//yxf 2009年10月20日

importex("$./ClassDef_FindRoom.gml");

new item
{
	name = "FINDROOM_LOGIC";size = "100%,100%";
	capturemouse = true;bgcolor = window.G_BGCOLOR;alpha = window.G_ALPHA;enableUpdate(1);
	new VGame_BtnLayer_Top_Logic{}
	//==========================快捷键==================================
	void OnCreated()
	{
		window.find("gameinput").AddExclusiveShortcutUser(this);
		window.SetChatEnterFlag(window.CHAT_ENTER_NO,"FINDROOM_LOGIC");//不激活
	}
	void OnDelete()
	{
		window.find("gameinput").DelShortcutUser(this);
		window.SetChatEnterFlag(window.CHAT_ENTER_YES,"FINDROOM_LOGIC");//能激活
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
				_VFindRoom_Logic.OnClick_Confirm();
			}
		}
	}
	//==================================================================
	var _VFindRoom_Logic = new VFindRoom_Logic{}
}