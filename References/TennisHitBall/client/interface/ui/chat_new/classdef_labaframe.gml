import("$./ClassDef_ChatFrame.gml");

//class LabaFram_BTN_UI item
//{
//	size = "20,43";valign(100,0);
//	void Init()
//	{
//		staticvar _add = new VBTN_Chat_add{};
//		staticvar _sub = new VBTN_Chat_sub{pos = "0,22";};
//	}
//};

class LabaFram_UI item
{
	var m_top = 110;//记录着初始y坐标 用于自动大小
	var m_height = 40;//记录着初始高度 用于自动大小
	pos = "0,"+m_top;
	if(window.g_probablyPos == window.POS_PROBABLY_GAME)
	{
		size="100%,"+m_height+",-300,0";
	}
	else
	{
		size="630,"+m_height+",-300,0";
	}
	bgcolor="#cacaca";alpha = 50;
	zindex = "top";

	new Pic9_LittleBugleBK_UI
	{
		pos = "0,0";
		size = "100%,100%";
	}
	
	//显示重载
	void Init()
	{
//		staticvar s_LabaBK = new item{size = "100%,100%";bgcolor="#cacaca";alpha = 50;}
	}
	//显示重载,这里显示要做的是将喇叭的framesize设为5个的
	void SetShowSize(linenum)
	{
		//printf("changesize num"+linenum+"\n");
//		size="100%,"+24*toint(linenum)+",-300,0";
//		pos = "0,"+(5-toint(linenum))*24;
//		_frame.size = ""+width+","+height;
	}
};

class VBugle_Img img
{
	src = "$./imgs"+window.g_Sex+"/litle_bugle.tga";//zindex = "top";
};