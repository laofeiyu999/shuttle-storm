//家族房间界面
//夏洋洋 2010-3-16

class VFamily_Room_UI item
{
	size = "100%,100%";bgcolor = -1;
	void Init()
	{
		//等待游戏
		staticvar s_Img_WaitStart = new item
		{
			size="70%,70";
			halign(50,0);valign(10,0);
			var waitBK = new img
			{
				halign(50,0);valign(50,0);
				src = "$./imgs/zzdd-d.tga";
			}
			var waitWords = new img
			{
				halign(50,0);valign(50,0);
				src = "$./imgs/zzdd-text.tga";
			}
		}
		//退出：按钮
		staticvar s_Btn_Exit = new img
		{
			size = "82,32";
			valign(95,0);halign(85,0);
			src = "$./imgs/tc-text.tga";
			void OnMouseOver()
			{
				cursor = window.CURSOR_HAND;
			}

		}
	}

	//设置显示的信息
	//data:true为准备比赛；false为等待比赛
	void SetGameStateInfo(data)
	{
		if(data)
		{
			s_Img_WaitStart.show = false;

		}
		else
		{
			s_Img_WaitStart.show = true;
		}
	}
}