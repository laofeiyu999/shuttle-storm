bgcolor = "#FFFFFF";
size = "1024,768";
wndsize = "1024,768";

importex("$./ClassDef_BigKey.gml");

var g_Sex = 1;

var _VTipBigKey = new VTipBigKey
{
	
}

new text
{
	src = "显示1个";
	void OnClick()
	{
		window._VTipBigKey.SetData(true,1);
	}
}

new text
{
	src = "显示2个";pos= "0,30";
	void OnClick()
	{
		window._VTipBigKey.SetData(true,2);
	}
}

new text
{
	src = "隐藏";pos= "0,60";
	void OnClick()
	{
		window._VTipBigKey.SetData(false);
	}
}