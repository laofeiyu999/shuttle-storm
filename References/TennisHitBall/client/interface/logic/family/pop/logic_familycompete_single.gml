importex("$./ClassDef_FamilyCompete_Single.gml");

new item
{
	name = "FAMILYCOMPETE_SINGLE_LOGIC";
	size = "100%,100%";//bgcolor = "#ff";
	capturemouse = true;enableUpdate(1);
	var _LastPos = window.GetUIPos();
	window.SetUIPos(window.POS_FAMILY);
	
	new VGame_BtnLayer_Top_Logic{}

	var _FamilyBadgeSet = new VFamilyCompete_Single_Logic{}

	void OnDelete()
	{
		window.SetUIPos(_LastPos);
	}
}