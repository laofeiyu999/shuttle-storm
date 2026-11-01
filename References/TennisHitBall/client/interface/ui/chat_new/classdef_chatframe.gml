//陈晓聪2009年3月31日

class ChatFameSelectBtn_UI item
{
	valign(100,-22);size="100%,21";
	void Init()
	{
		// 全部
		staticvar s_R_Cur = new VRadio_BK37_UI
		{
			pos = "0,0";InitText("全部");
		}
		// 家族
		staticvar s_R_Social = new VRadio_BK37_UI
		{
			pos = "38,0";InitText("家族");
		}
		// 私聊
		staticvar s_R_Private = new VRadio_BK37_UI
		{
			pos = "76,0";InitText("私聊");
		}
	}
};

class ChatFrame_Scroll_UI iframe
{		
	size="100%,100%,-300,-193";valign(100,-43);//bgcolor = "#FF";alpha = 50;
	//需要显示重载
	void Init()
	{
	}
};
class ChatFrame_NoScroll_UI iframe
{		
	size="100%,32,0,0";pos = "3,-1";//bgcolor = "#FF0000";alpha = 50;
	//需要显示重载
	void Init()
	{
	}
};