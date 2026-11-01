import("$./effect.gml");

bkcolor = "#123456"

load("$./../../mdb/dbdef.gml");							// 数据库统一定义

new item
{
	size = "30,30";bkcolor = "#ff"
	void OnClick()
	{
		new TEffect{name="SD";SetSrc("test100");}
		window.find("SD").del();
	}
}

new item
{
	size = "30,30";pos = "100,30";bkcolor = "#ff"
	void OnClick()
	{
		window.find("SD").del();
	}
}