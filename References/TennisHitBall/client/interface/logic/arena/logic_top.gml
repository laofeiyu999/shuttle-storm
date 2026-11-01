//活动说明-排行-游戏中显示
//yxf 2009年11月1日

importex("$./ClassDef_MyActivity_top.gml");

new item
{
	name = "ARENA_TOP_LOGIC";size = "100%,100%";bgcolor = window.G_BGCOLOR;alpha = window.G_ALPHA;
	show = false;enableUpdate(1);
	//==========================快捷键==================================
	var _MyActivity_Top = new VArena_MyActivity_Top_Logic{pos="10,64";valign(50,0);m_isInGame=1;SetRegDbTable("ARENA_TOP_IN_GAME");}
	
	void OnCreated()
	{
		window.GetArenaTopData();//取活动排行
	
		//_MyActivity_Top.s_Title._value.SetData(window.GetTopTitleByID(window.GetMyRaceID()));
	}

	void SetMyShow()
	{
		show = true;
		s_Btn_Hide.show = true;
	}
}