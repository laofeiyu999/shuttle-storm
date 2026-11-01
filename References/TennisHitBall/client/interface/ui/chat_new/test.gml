import("$./ClassDef_Chat_SenceBugle.gml");
import("$./../GmlCtrls/VPopWnd/ClassDef.gml");
import("$./ClassDef_ChatFrame.gml");
import("$./../../Logic/Chat_New/ClassDef_Sub.gml");

size = "800,600";

new item
{
	size = "31.8,20";bgcolor ="#ff";
}
new item
{
	size = "50,50";bgcolor= "#ff";
	pos = "300,300";
	void OnClick()
	{
		parent._temp.InitType(2);
	}
}

var _temp = new VSenceBugle_Froth_UI
{
	
	//show = true;
	SetData("hahaahah","");pos = "100,100";
}