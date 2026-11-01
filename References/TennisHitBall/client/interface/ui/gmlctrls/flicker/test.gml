import("$./../../../Logic/init.gml");
import("$./../../../Const.gml");
bgcolor = "#0";
size = "1024,768";
wndsize = "1024,768";

//var _f = new VFlicker_A_UI
var _f = new VFlicker_A_UI
{
	pos = "100,100";border = "#FF";
	SetState(window.FLICKER_FLICKER);
}
var _a = new VFlicker_Btn_A_UI
{
	pos = "100,150";
	SetState(window.FLICKER_FLICKER);
	
}
var _b = new VFlicker_Radio_A_UI
{
	pos = "100,200";
	SetState(window.FLICKER_FLICKER);
}
new item
{
	size = "50,50";bgcolor = "#FF";pos = "0,100";capturemouse = true;
	void OnMouseDownL()
	{
//		alert("OnMouseDownL");
		parent._f.SetState(window.FLICKER_FLICKER);
	}
	void OnMouseDownR()
	{
//		alert("OnMouseDownR");
		parent._f.SetState(window.FLICKER_GREY);
	}
}
<END>
new img
{
	var _src = "Prize";
	src = "$./imgs/"+_src+"1.tga";
		clipani(44,44,1,2);
		anispeed = 20;
//		aniindex = 0;
}