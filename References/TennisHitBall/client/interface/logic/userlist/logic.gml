//玩家列表 Logic+UI
//yxf 2009年10月14日
//

importex("$./ClassDef.gml");

new item
{
	name = "USERLIST_LOGIC";size = "100%,100%";enableUpdate(1);

	window.SetHallHtn_Open(window.G_HALLBTN_USERLIST);
	var _LastPos = window.GetUIPos();	
	window.SetUIPos(window.POS_USERLIST);

	var _VUserList_Logic = new VUserList_Logic{}
	void OnCreated()
	{
		//zindex = "top";
	}
	void OnDelete()
	{
		window.SetUIPos(_LastPos);
		window.SetHallHtn_Close(window.G_HALLBTN_USERLIST);
	}
}