//主菜单的类定义

class VMainMenu_Sub_UI item
{
	size = "100%,32";bgcolor = -1;
	m_Color_Normal = "#0";		//正常颜色
	m_Color_Over = "#0";	//滑过颜色
	m_Color_Grey = "#676767";	//不可点颜色
	
	//设置文字
	void Init()
	{
		staticvar s_OverBk = new VPic3_MainMenuSelect_UI{size = "100%,32,-30,0";halign(50,0);show = false;}

		staticvar s_icon = new img
		{
			valign(50,0);halign(20,0);
			var _name = "";
			void SetData(data)
			{
				_name = data;
				src = "$./imgs"+window.g_Sex+"/Icon/"+data+".tga";
			}
			void SetGrey(){src = "$./imgs"+window.g_Sex+"/Icon/"+_name+"4.tga";}
			void SetLight(){src = "$./imgs"+window.g_Sex+"/Icon/"+_name+".tga";}
		}

		//文字
		staticvar s_Text = new BaseText
		{
			color = parent.m_Color_Normal;size = "100%,29,-50,0";
			ycenter = true;pos = "70,0";
		}
	}
	
	//[功能]设置状态
	//参数 state：0不能点 1能点
	void SetState(state)
	{
		m_State = state;
		if (m_State == window.BTN_STATE_GREY){s_Text.color = m_Color_Grey;s_icon.SetGrey();}
		if (m_State == window.BTN_STATE_LIGHT){s_Text.color = m_Color_Normal;s_icon.SetLight();}
	}

	//[功能]设置文字
	//[参数]icon:图标
	//		_src:文字
	//		_line:线
	void SetData(icon,_src,_line)
	{
		s_icon.SetData(icon);
		s_Text.SetData(_src);
		if (_line.__Long__ == 1)
		{
			//bgcolor = "#FF0000";alpha = 50;
			new img
			{
				src = "$./imgs"+window.g_Sex+"/fgx.tga";valign(100,0);halign(50,0);
			}
			height += parent.m_LineSizeY;
			parent.m_LineNum += 1;
			s_icon.valign(50,-4);
		}
	}

	void OnMouseOver()
	{
		if (m_State == window.BTN_STATE_GREY){return;}
		cursor = window.CURSOR_HAND;
		s_Text.color = m_Color_Over;
		s_OverBk.show = true;
	}
	void OnMouseOut()
	{
		if (m_State == window.BTN_STATE_GREY){return;}
		s_Bk.show = false;
		s_Text.color = m_Color_Normal;
		s_OverBk.show = false;
	}
};

class VMainMenu_UI item
{
	bgcolor = -1;
	m_HeightSub = 32;
	m_SizeX = 136;
	m_OffSet = 18;
	m_LineSizeY = 4;
	pos = "16,0";valign(100,-75);
	
	//可以重设位置-调整高度
	void InitOk()
	{
		_bk.SetSize(m_SizeX,m_SizeY);
	}
	
	//背景框
	var _bk = new item
	{
		var _bk1 = new VPic9_MainMenu1_UI{size="100%,100%";}
		var _bk2 = new VPic9_MainMenu1_UI{pos = "5,5";size="100%,100%,-10,-10";}

		void SetSize(x,y)
		{
			parent.size(x+20,y+20);
			size = "100%,100%";
			_bk1.size="100%,100%";
			_bk2.size="100%,100%,-10,-10";
		}
	}
};