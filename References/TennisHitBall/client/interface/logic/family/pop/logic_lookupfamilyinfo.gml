importex("$./ClassDef_LookupFamilyInfo.gml");
importex("$./ClassDef_MsgBox.gml");

new item
{
	name = "LOOKUPFAMILYINFO_LOGIC";
	size = "100%,100%";//bgcolor = "#ff";
	capturemouse = true;enableUpdate(1);
	var _LastPos = window.GetUIPos();
	window.SetUIPos(window.POS_FAMILY);
	new VGame_BtnLayer_Top_Logic{}
	var _LookupFamilyInfo = new VLookupFamilyInfo_Logic{}

	void OnDelete()
	{
		window.SetUIPos(_LastPos);
	}
}