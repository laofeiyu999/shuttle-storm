//游戏设置中，背景音乐


//一行显示类：宽×高
class VColumn_Music_UI item
{
	size = "145,20";bgcolor = -1;cursor = window.CURSOR_HAND;

	void Init()
	{
		staticvar _bg = new item
		{
			pos = "3,3";
			size = "100%,17,-6,0";
			//bgcolor = "#CBC8FF";
			if(window.g_Sex == 1)
			{
				bgcolor = "#CBC8FF";//"#BFC1C8";
			}
			if(window.g_Sex == 2)
			{
				bgcolor = "#D194AB";
			}
			if(window.g_Sex == 3)
			{
				bgcolor = "#FF3547";
			}
			show = false;
		}

		//音乐名
		//参数 data1:
		staticvar s_Name = new BaseText
		{
			size = "125,20";xcenter = true;ycenter = true;//bgcolor = "#FF";
			void SetData(data1)
			{
				src = ""+data1;
			}
		}
	}
	//选择的效果
	void OnMySelect(){_bg.show = true;s_Name.color = "#0";}
	//不选择的效果
	void OnMyUnSelect(){_bg.show = false;s_Name.color = "#0";}	
}

//
//总的类：List
//
class VGameSetUp_MusicList_UI VN2ListCtrl
{
	//需要显示时改变
	size="145,40";
	pos="0,19";//bgcolor = "#c1e7f8";
	alpha = 5;
	scroll = window.SCROLL_NO;
	scroll = window.SCROLL_NOTENNIS;
	var m_RowCount = 0;
	
	var m_dropmenu_bk = new VMenuBG_UI
	{
		size = "100%,100%";

		void SetSize(_count)
		{
			parent.m_RowCount = _count;
			var _height = 0;
			var _moreHeight = 0;
			var _pageNum = toint(parent.m_RowCount)/3;
			var _moreNum = toint(parent.m_RowCount)%3;
			_height = _pageNum*100;
			if(_moreNum)
			{
				_moreHeight = _moreNum*25;
			}
			size = "100%,"+_height+"%,0,"+_moreHeight;
		}
	}
	
};