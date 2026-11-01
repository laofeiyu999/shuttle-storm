//下拉菜单
import("$./../../../Logic/Init.gml");
import("$./../../../Const.gml");
import("$./ClassDef_UpMenu.gml");
bgcolor = "#FF";
size = "800,600";

new item
{
	size = "500,500";bgcolor = "#FFFF00";
	new VMyUpMenu_UI
	{
		class MyText MyOption//用于对text的控制 需要时重载
		{
			xcenter = false;
		};
		valign(100,0);
		SetWidth(70);//SetType(0);
		SetData("小喇叭,实景喇叭,普通聊天");
	}
}
