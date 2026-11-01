//无背景色的text
class BaseText text
{
	font = "宋体,-1,12";
	var COLOR_DEFAULT = "#0";
	color = COLOR_DEFAULT;

	void SetBorder(data)
	{
		switch (data)
		{
		case 1:
			border = "#FD7A7B";
			break;
		case 2:
			border = "#FFFFFF";
			break;
		}
	}

	//设置文字-只支持一个参数的-多个参数的请重写
	void SetData(param1)
	{
		src = param1;
	}
};

//有背景色的text
class BKText BaseText
{
	bgcolor = "-1";xcenter = true;ycenter = true;
	new VListBG2_UI{size = "100%,100%";}
};

//支持Vip的名字
class VipText BaseText
{
	//设置文字
	//param1:文字内容 
	//param2:Vip标示
	void SetData(param1,vip)
	{
		src = param1;
		color = COLOR_DEFAULT;
		if (vip == window.G_VIPVALUE)
		{
			//color = window.G_VIPCOLOR;
		}
	}
};

//支持Vip的名字-带底图
class VipText1 VipText
{
	bgcolor = "-1";xcenter = true;ycenter = true;
	new VPic3_MoneyBK_UI{size = "100%,100%";}
};


//支持Vip的名字-支持带前缀的昵称
class VipText2 VipText
{
	var m_Init = "";
	//设置文字
	//param1:文字内容 
	//param2:Vip标示
	void SetData(param1,vip)
	{
		src = m_Init + param1;
		color = "#FFFFFF";
		if (vip == window.G_VIPVALUE)
		{
			//color = window.G_VIPCOLOR;
		}
	}
};


//基本edit 
class BaseEdit edit
{
	font = "宋体,-1,12";color = "#0";xcenter = true;ycenter = true;
	color = "#0";choicebkcolor="#0";choicecolor="#FFFFFF";cursorcolor = "#0";
};

//可以在数字和非数字之间切换到输入框
class BaseEditNum BaseEdit
{
	var m_IsNum = true;
	onlynumber = m_IsNum; 
	function OnInsertChar(c)
	{
		if (!m_IsNum)
			return true;

		if (c=='-' || c=='.')
		{
			return false;
		}
		return true;
	}

	//[功能]设置是否只是数字输入框
	//[参数]param:true false
	void SetOnlyNum(param)
	{
		m_IsNum = param;
		onlynumber = m_IsNum; 
	}
};

////在输入框和非输入之间切换
//class EditText BaseEdit
//{
//	var m_IsEdit = true;
//
//	function OnInsertChar(c)
//	{
//		if (m_IsEdit) 
//			return true;
//	}
//
//	//[功能]设置是否为输入框
//	//[参数]param:true false
//	void SetIsEdit(param)
//	{
//		m_IsEdit = param;
//	}
//};

//小竖线
class MallRadioLine img
{
	src = "$./../../PublicImage/imgs"+window.g_Sex+"/new/st01.tga";
};

class VMenuOption BaseText
{
	color="#0";xcenter = true;ycenter = true;
	var _isGrey = 0;
	void OnMouseOver()
	{
		if(_isGrey){return;}
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
	}
	void OnMouseOut()
	{
		if(_isGrey){return;}
		bgcolor = -1;color="#0";
	}
	void SetColorGrey()
	{
		_isGrey=1;
		bgcolor = -1;color="#aaaaaa";
	}
	void SetColorLight()
	{
		_isGrey=0;
		bgcolor = -1;color="#0";
	}
	void GetGreyState()
	{
		return _isGrey;
	}
};
