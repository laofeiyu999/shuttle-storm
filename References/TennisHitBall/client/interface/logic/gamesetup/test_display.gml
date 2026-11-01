import("$./../Init.gml");
import("$./ClassDef_Display.gml");
import("$./ChannelChoose/Logic_BG.gml");

size = "1024,768";
wndsize = size;
pos = "100,100";
bgcolor = "#123456";
var a = 1;

staticvar _temp1 = new V_BG_UI
{

}

var _temp = new VGameSetUp_DisPlay_Logic
{
	_DeskBg = 3;
}


new item
{
	size = "200,200";
	pos = "400,100";
	bgcolor = "#ff";
	
	void OnMouseDownL()
	{
		//parent._temp.SaveDisPlaySet();
		parent._temp.ReSetSrc_Bg(2,3);
		//parent._temp1._tempBg.SetSrc();
		
	}
	void OnMouseDownR()
	{
		parent._temp.ReSetSrc_Bg(3,4);
	}
}