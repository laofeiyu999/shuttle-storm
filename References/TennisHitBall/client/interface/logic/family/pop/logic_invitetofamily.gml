importex("$./ClassDef_InviteToFamily.gml");
importex("$./ClassDef_MsgBox.gml");

new item
{
	name = "INVITETOFAMILY_LOGIC";
	size = "100%,100%";//bgcolor = "#ff";
	capturemouse = true;enableUpdate(1);
	var _LastPos = window.GetUIPos();
	window.SetUIPos(window.POS_FAMILY);
	new VGame_BtnLayer_Top_Logic{}
	var _InviteToFamily = new VInviteToFamily_Logic{}

	void OnDelete()
	{
		window.SetUIPos(_LastPos);
	}
}