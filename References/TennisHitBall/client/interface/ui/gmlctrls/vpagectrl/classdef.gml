//翻页控件

//=============================================new===============================================
//带数字的
class VPageCtrl_Base_UI VN2PageCtrl
{
	IsCirclePage = 1;	//默认循环翻页
	var m_CurrPage = 1;//当前页数
	var m_AllPage = 1;	//总页数
	var _nameL = "";	//左边的文件名
	var _nameR = "";	//右边的文件名
	size="105,19";
	//翻页底背景
	var _bk = new VPic9_PageCtrl_UI{size = "100%,100%";}

	void SetSize(_x,_y)
	{
		size(_x,_y);
		_bk.size="100%,100%";
	}

	void OnCreated()
	{
		set LTBTN{size = "19,19";valign(50,0);zindex = "top";halign = "0,0";}
		set RBBTN{size = "19,19";valign(50,0);zindex = "top";halign = "100,0";}
	}
	set LTBTN
	{
		staticvar _pageUp = new VBTN_forward_New
		{
			capturemouse = false;
			void MouseDownL_Sound(){}
		}
		cursor = window.CURSOR_HAND;
		void OnClick(){OnClickL();OnClickL_Sound();parent.OnClickL_UserDef();}
		//翻页音效
		void OnClickL_Sound()
		{
			window.PlaySound(118);
//			if (parent.m_CurrPage == 1)
//			{
//				window.PlaySound(113);//无效按键
//			}
//			else
//			{
//				window.PlaySound(118);
//			}
		}
	}
	set RBBTN
	{
		staticvar _pageDown = new VBTN_next_New
		{
			capturemouse = false;
			void MouseDownL_Sound(){}
		}
		cursor = window.CURSOR_HAND;
		void OnClick(){OnClickR();OnClickR_Sound();parent.OnClickR_UserDef();}
		//翻页音效
		void OnClickR_Sound()
		{
			window.PlaySound(118);

//			if (parent.m_CurrPage == parent.m_AllPage)
//			{
//				window.PlaySound(113);//无效按键
//			}
//			else
//			{
//				window.PlaySound(118);
//			}
		}
	}

	class VPageCtrlFont text
	{
		font = "宋体,-1,12";color = "#0";//bold = true;
	};

	var _leftNum = new VPageCtrlFont
	{
		valign(50,0);halign(35,0);
		//txtborder = "#000000";
	}
	var _rightNum = new VPageCtrlFont
	{
		valign(50,0);halign(65,0);
		//txtborder = "#000000";
	}
	var _temptext = new VPageCtrlFont
	{
		valign(50,0);halign(50,0);
		//txtborder = "#000000";
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

class VPageCtrl_Base_UI_UserDef VPageCtrl_Base_UI
{
	void OnClickL_UserDef()
	{
		if(1==m_AllPage)
			return;
		if(1>=m_CurrPage)
			return;
		m_CurrPage = toint(m_CurrPage)-1;
//		if(0>=m_CurrPage)
//			m_CurrPage = m_AllPage;
		GetPageData(m_CurrPage);
	}
	void OnClickR_UserDef()
	{
		if(1==m_AllPage)
			return;
		if(m_CurrPage==m_AllPage)
			return;
		m_CurrPage = toint(m_CurrPage)+1;
//		if(toint(m_CurrPage)>m_AllPage)
//			m_CurrPage = 1;
		GetPageData(m_CurrPage);
	}
	void GetPageData(currpage)
	{
	}
	void OnPageExchange()
	{
	}
	void OnPageExchange2(nCurPage, nAllPage)		//当页数改变时,当前页和所有页都会告诉脚本
	{
		m_CurrPage = nCurPage;
		m_AllPage = nAllPage;

		set MTEXT {src="";}
		_temptext.src = "/";
		_leftNum.src = nCurPage;
		_rightNum.src = nAllPage;
		GetCurNum(nCurPage,nAllPage);//给好友使用的-yxf 2008年10月23日9:51
	}
};

//创建房间 房间选择翻页
class VPageCtrl_CreateRoom_UI VN2PageCtrl
{
	IsCirclePage = 1;	//默认循环翻页

	void OnCreated()
	{
		set LTBTN{size = "11,13";zindex = "top";}
		set RBBTN{size = "11,13";zindex = "top";halign = "100,0";}
	}
	set LTBTN
	{
		new VBTN_RadioLeft_New
		{
			capturemouse = false;
			void MouseDownL_Sound()
			{
				window.PlaySound(118);

//				if (parent.m_CurrPage == parent.m_AllPage)
//				{
//					window.PlaySound(113);//无效按键
//				}
//				else
//				{
//					window.PlaySound(118);
//				}
			}
		}
	}
	set RBBTN
	{
		new VBTN_RadioRight_New
		{
			capturemouse = false;
			void MouseDownL_Sound()
			{
				window.PlaySound(118);

//				if (parent.m_CurrPage == parent.m_AllPage)
//				{
//					window.PlaySound(113);//无效按键
//				}
//				else
//				{
//					window.PlaySound(118);
//				}
			}
		}
	}
	set MTEXT{show = false;}
};
//创建角色 服装翻页
class VPageCtrl_ChangeCloth_UI VN2PageCtrl
{
	IsCirclePage = 1;	//默认循环翻页

	void OnCreated()
	{
		set LTBTN{size = "20,21";zindex = "top";}
		set RBBTN{size = "20,21";zindex = "top";halign = "100,0";}
	}
	set LTBTN
	{
		new VBTN_smallForward_New
		{
			capturemouse = false;
			void MouseDownL_Sound()
			{
				window.PlaySound(118);

//				if (parent.m_CurrPage == parent.m_AllPage)
//				{
//					window.PlaySound(113);//无效按键
//				}
//				else
//				{
//					window.PlaySound(118);
//				}
			}
		}
	}
	set RBBTN
	{
		new VBTN_smallNext_New
		{
			capturemouse = false;
			void MouseDownL_Sound()
			{
				window.PlaySound(118);

//				if (parent.m_CurrPage == parent.m_AllPage)
//				{
//					window.PlaySound(113);//无效按键
//				}
//				else
//				{
//					window.PlaySound(118);
//				}
			}
		}
	}
	set MTEXT{show = false;}
};

//创建家族 徽章翻页
class VPageCtrl_ChangeFamilyBadge_UI VN2PageCtrl
{
	IsCirclePage = 1;	//默认循环翻页

	void OnCreated()
	{
		set LTBTN{size = "20,21";zindex = "top";}
		set RBBTN{size = "20,21";zindex = "top";halign = "100,0";}
	}
	set LTBTN
	{
		new VBTN_RadioLeft_New
		{
			capturemouse = false;
			void MouseDownL_Sound()
			{
				window.PlaySound(118);

//				if (parent.m_CurrPage == parent.m_AllPage)
//				{
//					window.PlaySound(113);//无效按键
//				}
//				else
//				{
//					window.PlaySound(118);
//				}
			}
		}
	}
	set RBBTN
	{
		new VBTN_RadioRight_New
		{
			capturemouse = false;
			void MouseDownL_Sound()
			{
				window.PlaySound(118);

//				if (parent.m_CurrPage == parent.m_AllPage)
//				{
//					window.PlaySound(113);//无效按键
//				}
//				else
//				{
//					window.PlaySound(118);
//				}
			}
		}
	}
	set MTEXT{show = false;}
};

//玩家列表- 2010年5月15日 yxf
class VPageCtrl_UserList_UI item//VPageCtrl_Base_UI
{
	size="105,19";//bgcolor = "#FF";

	var m_CurrPage = 0;//当前页数
	var m_AllPage = 1;	//总页数

	//翻页底背景
	var _bk = new VPic9_PageCtrl_UI{size = "100%,100%";}

	var _pageUp = new VBTN_forward_New
	{
		void MouseDownL_Sound()
		{
			window.PlaySound(118);
		}
		void OnPressed()
		{
			parent.OnClickL_UserDef();
		}
	}

	var _pageDown = new VBTN_next_New
	{
		halign(100,0);
		void MouseDownL_Sound()
		{
			window.PlaySound(118);
		}
		void OnPressed()
		{
			parent.OnClickR_UserDef();
		}
	}

	var _Num = new text
	{
		valign(50,0);halign(50,0);font = "宋体,-1,12";color = "#0";
	}

	//读取中
	var _loading = new text
	{
		valign(50,0);halign(50,0);font = "宋体,-1,12";color = "#0";src = "数据读取中";show = false;
	}

	//显示/隐藏 loading
	void ShowLoad(state)
	{
		_loading.src = "数据读取中";
		_Num.show = !state;
		_loading.show = state;
	}

	//显示的内容
	void SetLoadSrc(_src)
	{
		_loading.src = _src;
		timer(1000,"ShowLoad(false)");
	}
	
	//新的状态通知
	void OnPageExchange_New(nCurPage, nAllPage)
	{
		//printf("OnPageExchange_New:nCurPage:"+nCurPage+",nAllPage:"+nAllPage);
		ShowLoad(false);
		
		m_CurrPage = nCurPage;
		m_AllPage = nAllPage;
		
		nCurPage = toint(nCurPage) + 1;
		if (toint(nCurPage) >= toint(nAllPage))
		{
			nCurPage = nAllPage;
		}
		_Num.src = ""+nCurPage+" / "+nAllPage;
	}

	void OnCreated()
	{
		_Num.src = "1 / 1";
	}
};