//隐藏界面的类定义

importex("$./../../UI/Hall/ClassDef_MainMenu.gml");

class VMainMenu_Sub_Logic item
{
	size = "100,20";bgcolor = "#FF";
	var m_State = window.BTN_STATE_LIGHT;				//状态 0不能点 1能点
	var m_Color_Normal = "#000000";	//正常颜色
	var m_Color_Over = "#FFFFFF";	//滑过颜色
	var m_Color_Grey = "#6B6463";	//不可点颜色

	void Init()
	{
		//文字
		staticvar s_Text = new text
		{
			color = parent.m_Color_Normal;size = "94,22";ycenter = true;
		}
	}

	void OnMouseOver(){if (m_State == window.BTN_STATE_LIGHT){s_Text.color = m_Color_Over;}}
	void OnMouseOut(){if (m_State == window.BTN_STATE_LIGHT){s_Text.color = m_Color_Normal;}}

	//[功能]设置状态
	//参数 state：0不能点 1能点
	void SetState(state)
	{
		m_State = state;
		if (m_State == window.BTN_STATE_GREY)s_Text.color = m_Color_Grey;
		if (m_State == window.BTN_STATE_LIGHT)s_Text.color = m_Color_Normal;
	}

	//[功能]得到状态
	void GetState(){return m_State;}

	//[功能]设置文字
	void SetData(_src)
	{
		s_Text.src = _src;
	}
	
	//[功能]得到文字
	void GetData(_src)
	{
		return ""+s_Text.src;
	}

	inclass("VMainMenu_Sub_UI");

	Init();
};

class VMainMenu_Logic item
{
	//==========================快捷键===================================
	window.find("gameinput").AddExclusiveShortcutUser(this);
	window.SetMainMenuOpenState(true);
	void OnDelete()
	{
		window.SetMainMenuOpenState(false);
		window.find("gameinput").DelShortcutUser(this);
	}
	void DI_ShortcutKey(data)
	{
		switch (data)
		{
			case 3: //Esc
			{
				del();break;
			}
		}
	}
	//===============================================================
	bgcolor = "#FF";movetocursor(1,1);//size = "100,180";
	capturemouse=true;//setFocus = true;

	void OnMouseDownL(){del();}
	//=============================核心脚本===========================
	var m_Num = -1;			//共有几个选项（初始）
	var m_NumUI = -1;		//共有几个选项（显示）
	var m_HeightSub = 20;	//子项高度
	var m_SizeX = 100;		//宽度
	var m_SizeY = 0;		//高度
	var m_OffSet = 0;		//偏移量
	var m_BubPosX = 0;		//子项的X坐标
	
	var m_LineNum = 0;		//分割线的数量
	var m_LineSizeY = 0;	//分割线高度

	//[功能]初始化右键菜单
	//[参数]subdata:子项内容文字
	//		subfun:子项自定义函数 为空则调用默认函数[OnClick_Menu+index()]
	//		subicon:子项图标
	//		subline:分割线
	void Init(subdata,subfun,subicon,subline)
	{
		m_Num = window.GetSplitCount(subdata,",");
		m_NumUI = toint(m_Num);

		var _arr = window.SplitStr2(subdata,",",m_Num);
		var _arrFun = window.SplitStr2(subfun,",",m_Num);
		var _arrIcon = window.SplitStr2(subicon,",",m_Num);
		var _arrLine = window.SplitStr2(subline,",",m_Num);

		var _index = 0;
		while (_index < m_Num)
		{
			new VMainMenu_Sub_Logic
			{
				var m_Index = _index;			//正在索引
				var m_IndexUI = m_Index;		//显示位置
				var m_Fun = _arrFun[m_Index];	//自定义函数
				
				name = "VMainMenu_Sub"+m_Index;
				pos(parent.m_BubPosX,this.height*m_IndexUI + parent.m_OffSet + (parent.m_LineNum * parent.m_LineSizeY)*2);
				SetData(""+_arrIcon[m_Index],""+_arr[m_Index],""+_arrLine[m_Index]);	//设置显示文字
			
				void OnMouseDownL()
				{
					if (GetState() == window.BTN_STATE_LIGHT)
					{
						if (m_Fun != -1 && m_Fun != 0)
							window.vml(""+m_Fun+"(\""+GetData()+"\");");
						else
							parent.vml("OnClick_Menu"+m_Index+"(\""+GetData()+"\");");
					}
				}
			}
			_index += 1;
		}

		AdjustSize();
	}

	inclass("VMainMenu_UI"); //与界面交互
	
	//[功能]调整大小
	void AdjustSize()
	{
		m_SizeY = m_NumUI * m_HeightSub + m_OffSet + (m_LineNum * m_LineSizeY)*2;
		size(m_SizeX,m_SizeY);

		//可以重设位置-调整高度
		InitOk();
	}

	//[功能]使之菜单无效
	//[参数]index：序号 从0开始
	//		state：0不能点 1能点
	void SetState(index,state)
	{
		if (index >= m_Num) return;
		find("VMainMenu_Sub"+index).SetState(state);
	}
};

class VMainMenu_Hall_Logic VMainMenu_Logic
{
	name = "VMainMenu_Hall_Logic_Name";

	var _Src = "商城,排行榜,玩家列表,家族,训练,任务,活动场,普通比赛,社交,邮件,录像,角色信息,背包,充值,设置,帮助,返回频道,退出游戏";
	
	var _Fun = "OnClick_BTN_Mall,OnClick_BTN_TopStar,OnClick_BTN_UserList,";
	_Fun += "OnClick_BTN_Family,OnClick_BTN_Train,OnClick_BTN_Task,OnClick_BTN_Arena,";
	_Fun += "OnClick_BTN_GameHall,OnClick_BTN_Friend,OnClick_BTN_Mail,OnClick_BTN_Video,";
	_Fun += "OnClick_BTN_RoleModel,OnClick_BTN_Pack,OnClick_Payment,OnClick_BtnGameSetUp,OnClick_BTN_Help,";
	_Fun += "OnClick_BTN_ReturnChannel,OnClick_BTN_ExitGame";

	var _Icon = "Mall,topStar,playerList,family,train,task,activity,hall,friend,mail,vedio,roleInfo,pack,addMoney,set,help,return,exit";

	var _line = "0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,0";

	Init(_Src,_Fun,_Icon,_line);


	//SetState(3,window.BTN_STATE_GREY);
	//SetState(5,window.BTN_STATE_GREY);
	SetState(15,window.BTN_STATE_GREY);
};

