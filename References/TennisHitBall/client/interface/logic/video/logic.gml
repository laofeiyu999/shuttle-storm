//
//录像界面-UI+Logic
//yxf 2009年10月18日
//

importex("$./ClassDef.gml");
import("$./ClassDef_MsgBox.gml");

new item
{
	name = "VIDEO_LOGIC";size = "100%,100%";

	window.SetHallHtn_Open(window.G_HALLBTN_VIDEO);
	var _LastPos = window.GetUIPos();	
	window.SetUIPos(window.POS_VIDEO);

	var _VVideo_Logic = new VVideo_Logic{}
	void OnCreated()
	{
		//zindex = "top";
	}
	void OnDelete()
	{
		window.SetUIPos(_LastPos);
		window.SetHallHtn_Close(window.G_HALLBTN_VIDEO);
	}
}