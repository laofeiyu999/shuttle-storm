import("$./../../../Logic/Init.gml");
import("$./../../../Const.gml");
import("$./ClassDef.gml");
//size = "800,600";
//wndsize = "800,600";
drag = "window";
//size = "1024,768";
//wndsize = "1024,768";
bgcolor = "#FFFF00";

set window.find("UILAYER")
{
	new VUIBG_UI
	{
		bgcolor = "#FF";//alpha = 80;
		size = "300,300";
		InitBG("");
	//	InitBG("$./cjfj-text.tga");
		InitBtnBG();
		OpenDrag();
		pos = "200,100";
	}
}

set window.find("UILAYER")
{
	new VUIBG_UI
	{
		bgcolor = "#FFFF";//alpha = 80;
		size = "300,300";
		InitBG("");
	//	InitBG("$./cjfj-text.tga");
		InitBtnBG();
		OpenDrag();
		pos = "200,400";
	}
}
/*
	----------------背景类使用方法-----------------
	1。继承 VUIBG_UI	设置size
	2。调用 InitBG("");		参数为标题的路径
	3。InitClose()			//new个X关闭钮
	4。InitHelp()			//new个帮助钮
	5.如果下面有大按钮，那么需要调用  InitBtnBG();		//来初始化大按钮的背景
	6.如需拖拽 调用   OpenDrag();
	7.关闭拖拽  调用   CloseDrag();
	8.如果想让背景只占一部分，设置size并调用InitBG("")后再设置一次size就好了
*/