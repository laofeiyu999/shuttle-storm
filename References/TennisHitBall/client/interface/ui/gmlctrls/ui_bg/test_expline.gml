import("$./../../../Logic/init.gml");
import("$./../../../Const.gml");
import("$./ClassDef_ExpLine.gml");
size = "800,600";
wndsize = "800,600";
//size = "1024,768";
//wndsize = "1024,768";
bgcolor = "#FF";
window.g_Sex = 1;
new VExpLine_UI
{
	pos = "100,100";
//	InitText();
	SetWidth(100);
	SetData(50,99);
}

new VExpLine2_UI
{
	pos = "100,200";
	SetData(0,9999);
}
new VExpLine2_UI
{
	pos = "100,230";
	SetData(4999,9999);
}
new VExpLine2_UI
{
	pos = "100,260";
	SetData(9998,9999);
}
new VExpLine2_UI
{
	pos = "100,290";
	SetData(9999,9999);
}