//帮助系统的显示类定义
//yxf 2009年5月24日
//

class VHelp_UI item
{
	size = "370,350";//pos = "1024,364";//pos = "0,443";
	halign(100,width);valign(100,-50);
	bgcolor = -1;alpha = 0;

	//=============================与界面交互========================================
	void Init()
	{	
		//教练形象
		//data: 1一只手 2两只手
		staticvar s_Sprite = new img
		{
			pos = "170,0";
			void SetData(_src){src = "$./imgs/"+_src;}
		}
		new VPic9_ListBG2_UI
		{
			size = "370,128";pos = "0,200";alpha = 20;//bgcolor = "#000000";
		}

		//返回按钮
		//data:1显示 0不显示
		staticvar s_Btn_Back = new VBTN_37_New
		{
			InitText("返回");pos="286,207";
		}
		//关闭按钮
		//data:1显示 0不显示
		staticvar s_Btn_Close = new VBTN_37_New
		{
			InitText("关闭");pos="328,207";
		}
		//条目列表显示区
		staticvar s_List = new iframe
		{
			size = "360,95";//bgcolor = "#FFFF";alpha = 80;
			pos="5,227";
			scroll = window.SCROLL_NOTENNIS;
			var _html = new html
			{
				var _body = new body{}
			}
		}
	}//Init

	void OnCreated()
	{
		//setParamTimer("pos","1024,364","654,364",300,0);	halign(100,0);valign(100,-100);
		setParamTimer("halign","100,"+width,"100,0",300,0);

//		var _rand = rand(2);
//		if (_rand == 1)
//		{
//			setParamTimer("pos","-370,443","0,443",300,0);	
//		}
//		else
//		{
//			setParamTimer("pos","0,768","0,443",300,0);	
//		}
	}
};