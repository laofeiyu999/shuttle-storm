/*
//带数字的
class PageCtrl_Num VN2PageCtrl
{
	var m_CurrPage = 1;//当前页数
	var m_AllPage = 1;	//总页数
	var _nameL = "";	//左边的文件名
	var _nameR = "";	//右边的文件名

	//翻页底
	new img{size = "100%,100%";src="$./imgs"+window.g_Sex+"/Background.tga";}

	void OnCreated()
	{
		set LTBTN{size = "57,25";valign(50,0);zindex = "top";halign = "2,0";}
		set RBBTN{size = "57,25";valign(50,0);zindex = "top";halign = "98,0";}
	}
	set LTBTN
	{
		staticvar _pageUp = new VBTN_Page_Up
		{
			capturemouse = false;
			void MouseDownL_Sound(){}
		}
		cursor = window.CURSOR_HAND;
		void OnClick(){OnClickL();OnClickL_Sound();}
		//翻页音效
		void OnClickL_Sound()
		{
			if (parent.m_CurrPage == 1)
			{
				window.PlaySound(113);//无效按键
			}
			else
			{
				window.PlaySound(118);
			}
		}
	}
	set RBBTN
	{
		staticvar _pageDown = new VBTN_Page_Down
		{
			capturemouse = false;
			void MouseDownL_Sound(){}
		}
		cursor = window.CURSOR_HAND;
		void OnClick(){OnClickR();OnClickR_Sound();}
		//翻页音效
		void OnClickR_Sound()
		{
			if (parent.m_CurrPage == parent.m_AllPage)
			{
				window.PlaySound(113);//无效按键
			}
			else
			{
				window.PlaySound(118);
			}
		}
	}

	var _leftNum = new text
	{
		valign(50,0);halign(42,0);font = "黑体,-1,20";color = "#FFFFFF";
		bold = true;//txtborder = "#000000";
	}
	var _rightNum = new text
	{
		valign(50,0);halign(58,0);font = "黑体,-1,20";color = "#FFFFFF";
		bold = true;//txtborder = "#000000";
	}
	var _temptext = new text
	{
		valign(50,0);halign(50,0);font = "黑体,-1,20"color = "#FFFFFF";
		bold = true;//txtborder = "#000000";
	}
	void OnPageExchange(nCurPage, nAllPage)		//当页数改变时,当前页和所有页都会告诉脚本
	{
		m_CurrPage = nCurPage;
		m_AllPage = nAllPage;

		set MTEXT {src="";}
		_temptext.src = "/";
		_leftNum.src = nCurPage;
		_rightNum.src = nAllPage;
		GetCurNum(nCurPage,nAllPage);//给好友使用的-yxf 2008年10月23日9:51
	}
	_temptext.src = "/";
	_leftNum.src = "1";
	_rightNum.src = "1";
};



//不带数字的,地图(上下)，技能镶嵌(左右)
class PageCtrl_Map VN2PageCtrl
{
	var m_CurrPage = 1;//当前页数
	var m_AllPage = 1;	//总页数
	var _nameL = "";	//左边的文件名
	var _nameR = "";	//右边的文件名
	var _VH = "";		//v纵向 h横向
	//参数 fname：图片名
	//参数 LR 0左边 1右边
	//参数 VH v纵向 h横向
	void Init(type,VH)
	{
		_VH = VH;
		if (type == 1)//left
		{
			new VBTN_PageCtrl_Map_Up{void MouseDownL_Sound(){}}
			return;
		}
		if (type == 2)//right
		{
			new VBTN_PageCtrl_Map_Down{pos(0,45);void MouseDownL_Sound(){}}
			return;
		}
		if (type == 3)//right
		{
			new VBTN_RacketList_Left{void MouseDownL_Sound(){}}
			return;
		}
		if (type == 4)//right
		{
			new VBTN_RacketList_Right{pos(263,0);void MouseDownL_Sound(){}}
			return;
		}
	}

	void OnCreated()
	{
		if (_VH == "v")
		{
			set LTBTN{size = "42,43";zindex = "top";}
			set RBBTN{size = "42,43";zindex = "top";valign = "100,0";}
		}
		if (_VH == "h")
		{
			set LTBTN{size = "28,37";zindex = "top";}
			set RBBTN{size = "28,37";zindex = "top";halign = "100,0";}
		}
	}

	set LTBTN
	{
		cursor = window.CURSOR_HAND;
		void OnClick(){parent.OnClickL();OnClickL_Sound();}
		//翻页音效
		void OnClickL_Sound()
		{
			if (parent.m_CurrPage == 1)
			{
				window.PlaySound(113);//无效按键
			}
			else
			{
				window.PlaySound(118);
			}
		}
	}
	set RBBTN
	{
		cursor = window.CURSOR_HAND;
		void OnClick(){parent.OnClickR();OnClickR_Sound();}
		//翻页音效
		void OnClickR_Sound()
		{
			if (parent.m_CurrPage == parent.m_AllPage)
			{
				window.PlaySound(113);//无效按键
			}
			else
			{
				window.PlaySound(118);
			}
		}
	}
	set MTEXT{show = false;}

	void OnPageExchange(nCurPage, nAllPage)		//当页数改变时,当前页和所有页都会告诉脚本
	{
		m_CurrPage = nCurPage;
		m_AllPage = nAllPage;
	}
	//void OnClickL(){}//点击了左边按钮-技能镶嵌循环翻页
	//void OnClickR(){}//点击了右边按钮
};

//地图的翻页
class VPGC_Change_Map_UI PageCtrl_Map
{
	size = "42,88";
	Init(1,"v");
	Init(2,"v");
};


//球拍的翻页
class VPG_RacketList_UI PageCtrl_Map
{
	size = "292,37";
	Init(3,"h");
	Init(4,"h");
};
*/