//
//游戏大厅界面-UI+Logic
//yxf 2009年10月14日
//

importex("$./ClassDef_GameHall.gml");

new item
{
	name = "GAMEHALL_LOGIC";size = "100%,100%";enableUpdate(1);

	window.SetHallHtn_Open(window.G_HALLBTN_GAMEHALL);
	var _LastPos = window.GetUIPos();
	window.SetUIPos(window.POS_GAMEHALL);

	var _VGameHall_Logic = new VGameHall_Logic{}
	void OnCreated()
	{
		//zindex = "top";
	}
	void OnDelete()
	{
		window.SetUIPos(_LastPos);
		window.SetHallHtn_Close(window.G_HALLBTN_GAMEHALL);
	}
}