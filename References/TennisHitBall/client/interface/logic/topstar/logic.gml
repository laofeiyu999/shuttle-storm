//明星榜 Logic+UI
//yxf 2009年10月14日

importex("$./ClassDef.gml");
importex("$./ClassDef_DBList.gml");

new item
{
	name = "TOPSTAR_LOGIC";size = "100%,100%";enableUpdate(1);

	window.SetHallHtn_Open(window.G_HALLBTN_TOPSTAR);
	var _LastPos = window.GetUIPos();
	window.SetUIPos(window.POS_TOPSTAR);

	var _VTopStar_Logic = new VTopStar_Logic{}

	//window.F_getallvalue(window.FAVOR_TOPSTAR_SHOW_NUM);
	void OnCreated()
	{
		//zindex = "top";
	}
	void OnDelete()
	{
		window.SetUIPos(_LastPos);
		window.SetHallHtn_Close(window.G_HALLBTN_TOPSTAR);
	}
}