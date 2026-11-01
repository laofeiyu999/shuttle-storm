//组队设置-界面
//yxf 2009年10月20日

importex("$./ClassDef_TeamSet.gml");

new item
{
	name = "TEAMSET_LOGIC";size = "100%,100%";
	capturemouse = true;bgcolor = window.G_BGCOLOR;alpha = window.G_ALPHA;
	new VGame_BtnLayer_Top_Logic{}
	//==========================快捷键==================================
	void OnCreated()
	{
		window.find("gameinput").AddExclusiveShortcutUser(this);
		window.SetChatEnterFlag(window.CHAT_ENTER_NO,"TEAMSET_LOGIC");//不激活

		//得到临时组队信息(直接服务器)
		//参数：type,num
		window.F_getalluser("0,0,0,0,0,0,0,0,0,1",10);
	}
	void OnDelete()
	{
		window.g_CArenaFunction.ClearTempTeamTB(window.TEMPTEAM_DELETE_DELETE); //清数据
		window.find("gameinput").DelShortcutUser(this);
		window.SetChatEnterFlag(window.CHAT_ENTER_YES,"TEAMSET_LOGIC");//能激活
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
				_VTeamSet_Logic.OnClick_Confirm();
			}
		}
	}
	//==================================================================

	var _VTeamSet_Logic = new VTeamSet_Logic{}
}