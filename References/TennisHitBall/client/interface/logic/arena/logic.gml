//
//活动场界面-UI+Logic
//yxf 2009年10月14日
//

importex("$./ClassDef.gml");
importex("$./ClassDef_MsgBox.gml");

new item
{
	name = "ARENA_LOGIC";size = "100%,100%";enableUpdate(1);

	window.SetHallHtn_Open(window.G_HALLBTN_ARENA);
	var _LastPos = window.GetUIPos();	
	window.SetUIPos(window.POS_ARENA);

	var _VArena_Logic = new VArena_Logic{}
	
	void OnCreated()
	{
		//zindex = "top";
		window.LMH1_Hall_Bottom_Arena();	//引导事件
	}
	void OnDelete()
	{
		window.SetUIPos(_LastPos);
		window.SetHallHtn_Close(window.G_HALLBTN_ARENA);
	}
}