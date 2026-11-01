import("$./../Init.gml");
import("$./../../Const.gml");
import("$./ClassDef_MainMenu.gml");
size = "1024,768";
wndsize = "1024,768";
bgcolor = "#123456";
window.autouiscale=true;
drag = "window";
new item
{
	size = "50%,10%";pos = "0,0";bgcolor = "#FF00";
	new text
	{
		font = "宋体,-1,40";src = "菜单-全部";valign(50,0);halign(50,0);
	}
	void OnMouseDownR()
	{
		set window
		{
			new VMainMenu_Hall_Logic
			{	
				void OnClick_Menu0(data){alert(data);}

//				SetState(1,0);
//				DelBub(0);
			}
		}
	}
};