//鼠标右键菜单
//yxf 2009年9月27日

import("$./../VButton/ClassDef.gml");

//右键的选项的类
class VMouseR_Sub_UI item
{
	size = "112,22";bgcolor = -1;
	m_Color_Normal = "#000000";	//正常颜色
	m_Color_Over = "#FFFFFF";	//滑过颜色
	m_Color_Grey = "#6B6463";	//不可点颜色

	//设置文字
	void Init()
	{
		//选中图片
		staticvar s_Bk = new item
		{
			size = "110,100%";bgcolor = "#a1a1a2";show = false;halign(50,0);
		}
		//文字
		staticvar s_Text = new BaseText
		{
			color = parent.m_Color_Normal;size = "100,22";ycenter = true;pos = "10,0";
		}
	}

	void OnMouseOver()
	{
		if (m_State == 0){return;}
		s_Bk.show = true;
		cursor = window.CURSOR_HAND;
		s_Text.color = m_Color_Over;
	}
	void OnMouseOut()
	{
		if (m_State == 0){return;}
		s_Bk.show = false;
		s_Text.color = m_Color_Normal;
	}
};

//右键-基类
class VMouseR_UI item
{
	bgcolor = -1;
	m_HeightSub = 22;
	m_SizeX = 112;
	m_OffSet = 2;

	//可以重设位置-调整高度
	void InitOk()
	{
		//printf("右键:window.mousex:"+window.mousex+",window.mousey:"+window.mousey);
		//printf("右键:m_HeightSub:"+m_HeightSub+",m_SizeX:"+m_SizeX+",m_SizeY:"+m_SizeY);
		pos(window.mousex + m_HeightSub, window.mousey);
		if(window.mousex + m_HeightSub + m_SizeX > window.width)
		{
			//printf("右键-结果:左");
			pos(window.mousex - m_SizeX, window.mousey);
		}
		if(window.mousey + m_SizeY - m_HeightSub > window.height)
		{
			//printf("右键-结果:下");
			pos(window.mousex + m_HeightSub, window.mousey - m_SizeY - m_HeightSub);
		}
		if( (window.mousex + m_HeightSub + m_SizeX > window.width) 
			&& (window.mousey + m_SizeY - m_HeightSub > window.height) )
		{
			//printf("右键-结果:下右");
			pos(window.mousex - m_SizeX,window.mousey - m_SizeY);
		}
		//无奈而加 2009年12月30日 yxf 
		if (top + height > window.height)
		{
			top = window.height - height;
		}
		//printf("右键-结果:left:"+left+",top:"+top);

		_bk.SetSize(m_SizeX,m_SizeY);
	}
	
	//背景框
	var _bk = new VPic9_MouseRMenu_UI{}
};