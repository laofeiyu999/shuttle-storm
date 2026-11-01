import("$./../../../Logic/Init.gml");
import("$./ClassDef_Goods.gml");
bkcolor="#123456";
set window
{
	new text
	{
		capturemouse = true;cursor = window.CURSOR_HAND;
		size(400,400);font="宋体,-1,20";bkcolor="#ff0000";
		src="诡异";
	}
	new VGoodHangWnd_UI
	{
		Init();
		s_html.SetData();
	}
}