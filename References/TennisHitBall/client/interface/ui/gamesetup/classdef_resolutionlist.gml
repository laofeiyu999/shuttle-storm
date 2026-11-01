//游戏设置中，分辨率List显示类定义


//一行显示类：宽×高
class VColumn_Width_Height_UI item
{
	size = "145,20";bgcolor = -1;cursor = window.CURSOR_HAND;

	void Init()
	{
		staticvar _bg = new item
		{
			pos = "3,3";
			size = "95%,20";
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

		//宽×高
		//参数 data1: 宽
		//参数 data2: 高
		staticvar s_Resolution = new BaseText
		{
			size = "87%,20";xcenter = true;ycenter = true;//bgcolor = "#FF";
			void SetData(data1,data2)
			{
				src = ""+data1+" × "+data2;
			}
		}
	}
	//选择的效果
	void OnMySelect(){_bg.show = true;s_Resolution.color = "#0";}
	//不选择的效果
	void OnMyUnSelect(){_bg.show = false;s_Resolution.color = "#0";}	
}

//
//总的类：List
//
class VGameSetUp_ResolutionList_UI VN2ListCtrl
{
	//需要显示时改变
	size="145,40";//valign(0,0);halign(0,0);
	pos="0,19";//bgcolor = "#c1e7f8";
	alpha = 5;
//	bgcolor = -1;
	scroll = window.SCROLL_NO;
	scroll = window.SCROLL_NOTENNIS;

	var m_dropmenu_bk = new VMenuBG_UI
	{
		size = "97%,100%";

		void SetSize(_count)
		{
			parent.m_RowCount = _count;
			var _height = (toint(parent.m_RowCount)/3)*100;
			size = "97%,"+_height+"%";
		}
	}
};