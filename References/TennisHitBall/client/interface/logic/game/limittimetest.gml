import("$./ClassDef_LimitTimeTask.gml");

size = "800,600";
wndsize = "800,600";
bgcolor= "#123456";

new item
{
	size = "100%,100%";
	bgcolor= "#123456";
	staticvar _temp = new VGame_LimitTimeTaskFlag_Logic
	{
		SetData(300);
	}
}
