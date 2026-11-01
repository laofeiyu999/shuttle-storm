//Combox-List显示类定义
//yxf 2009年10月26日

//一行显示类：昵称+性别
class VColumn_MallFriend_List_UI item
{
	size = "145,15";bgcolor = -1;cursor = window.CURSOR_HAND;
	//===========================与显示交互======================
	void Init()
	{
		staticvar _bg = new item
		{
			size = "100%,15";bgcolor = "#9ab9c6";
			show = false;
		}

		//昵称
		//参数 data1: 昵称
		staticvar s_NKname = new BaseText
		{
			pos = "15,0";ycenter = true;
			void SetData(data1)
			{
				src = data1;
			}
		}
		
		//性别为空时
		staticvar s_SexNull = new BaseText
		{
			src = "--";halign(85,0);show = false;
		}
		//性别
		//参数 data1：性别  0未知 1男 2女
		staticvar s_Sex = new img
		{
			halign(85,0);size(15,15);
			void SetData(data1)
			{
				parent.s_SexNull.show = false;
				src = "";
				if(data1 == window.USER_SEX_MAN)
				{
					src = "$./../../SelfInfo/imgs"+window.g_Sex+"/boy.tga";
					return;
				}
				if(data1 == window.USER_SEX_WOMAN)
				{
					src = "$./../../SelfInfo/imgs"+window.g_Sex+"/girl.tga";
					return;
				}
				parent.s_SexNull.show = true;
			}
		}
	}
	//选择的效果
	void OnMySelect(){_bg.show = true;s_NKname.color = "#ffffff";s_SexNull.color = "#ffffff";}
	//不选择的效果
	void OnMyUnSelect(){_bg.show = false;s_NKname.color = "#0";s_SexNull.color = "#0";}	
};

//
//总的类：List
//
class VMall_Friend_List_UI VN2ListCtrl
{
	//需要显示时改变
	pos(0,19);size="148,166";
	//bgcolor = "#c1e7f8";
	alpha = 5;
	scroll = window.SCROLL_NO;
	scroll = window.SCROLL_NOTENNIS;

	var m_dropmenu_bk = new VMenuBG_UI
	{
		size = "100%,100%";

		void SetSize(_count)
		{
			size="0%,0%";
			parent.m_RowCount = _count;
			var _height = toint(_count)*15;
			size = "100%,"+_height+",0,0";
		}
	}
};