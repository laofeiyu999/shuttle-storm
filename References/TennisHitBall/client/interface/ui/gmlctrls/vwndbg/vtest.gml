import("$./../../../Logic/Init.gml");
import("$./ClassDef.gml");


//new V_BG_UI{}
//new VLogin_BtnLayer_UI{};

size = "800,600";
wndsize = size;
bgcolor = "#123456";


new item
{
	size = "400,300";
	pos = "100,100";
	bgcolor = "#ff";
	var i = 2;
	void OnMouseDownL()
	{
		window.g_Bg = i;
		i += 1;
		staticvar _temp = new V_BG_UI
		{
		}
	}
	void OnMouseDownR()
	{
		_temp.del();
	}
}

//new item
//{
//	size = "50,50";
//	bgcolor = "#ff";
//	var i = 2;
//	void OnMouseDownL()
//	{
//		window.g_Bg = i;
//	}
//}