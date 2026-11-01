//界面引导管理类 Logic+UI
import("$./../Init.gml");
//import("$./ClassDef.gml");

bgcolor = "#FFFFFF";

new VGuideMgr_Logic
{
	size = "50,50";bgcolor = "#FF";
	valign(100,0);
	void OnClick()
	{
		SetData(rand(1,5));
	}
}

