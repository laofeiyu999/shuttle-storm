//家族 Logic+UI
//yxf 2009年9月10日15:34

importex("$./ClassDef.gml");
importex("$./pop/ClassDef_MsgBox.gml");

new item
{
	name = "FAMILY_LOGIC";size = "100%,100%";enableUpdate(1);

	window.SetHallHtn_Open(window.G_HALLBTN_FAMILY);
	var _LastPos = window.GetUIPos();
	window.SetUIPos(window.POS_FAMILY);

	var _VFamily_Logic = new VFamily_Logic{}

	void OnDelete()
	{
		window.SetUIPos(_LastPos);
		window.SetHallHtn_Close(window.G_HALLBTN_FAMILY);
	}
}