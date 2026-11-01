//封测活动总结算
//yxf 2009年6月10日


import("$./ClassDef.gml");
new item
{
	name = "ACTIVITY_OVER_LOGIC";size = "100%,100%";capturemouse = true;
	void OnCreated()
	{
		window.find("gameinput").AddExclusiveShortcutUser(this);
		//timer(window._Time_GameOver,"OnClick_BtnBackToHall");
		window.SetChatEnterFlag(window.CHAT_ENTER_NO,"ACTIVITY_OVER_LOGIC-OnCreated");//不激活
	}
	void OnDelete()
	{	
		window.find("gameinput").DelShortcutUser(this);
		window.SetChatEnterFlag(window.CHAT_ENTER_YES,"ACTIVITY_OVER_LOGIC-OnDelete");//能激活
	}
	void DI_ShortcutKey(data)
	{
		switch (data)
		{
			case 3: //Esc
			{
				del();
			}
		}
	}
	var _ActivityOver = new VActivityOver_Logic{}
}