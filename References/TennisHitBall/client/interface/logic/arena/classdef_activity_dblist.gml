//活动列表 ；DB
//yxf 2009年10月16日

importex("$./../../UI/Arena/ClassDef_Activity_DBList.gml");

//一行显示类：
class VColumn_ArenaActivity_Logic item
{
	size(665,50);//bgcolor = "#FF00";
	var m_RaceID = 0;		//报名ID
	var m_RaceState = 0;	//玩家此活动的状态： 1初始状态 2等待排队中 3暂停中 4已取消排队
	//===========================与显示交互======================
	void Init()
	{
		//活动状态
		//参数：data 1热门 2新开 3其他
		staticvar s_ActivityState = new VMyText{}

		//活动名
		//参数:data(活动名)
		staticvar s_Name = new VMyText{pos(20,0);}
		
		//报名队伍人数
		//参数1
		staticvar s_TeamNum = new VMyText
		{
			pos(150,0);src = "1人";bgcolor = "#FFFF";
		}
		
		//报名需要等级
		//参数1 最小等级
		//参数2 最高等级 -1代表 最低等级以上
		staticvar s_Lv = new VMyText
		{
			pos(160,0);bgcolor = "#FFFF";
		}

		//活动时间段
		//参数：data(如：11:00 - 11:12)
		staticvar s_Time = new VMyText
		{
			pos(200,0);
		}

		//报名费用
		//param1:数值(100等) 免费时 值为0
		//param2:钱的类型文字(金币，点券，免费)
		staticvar s_Fare = new VMyText
		{
			src = "报名费用";pos(350,0);
		}

		//总人数
		//参数：data
		staticvar s_AllNum = new VMyText
		{
			pos(450,0);
		}

		//玩家的活动状态
		//参数：data 1初始状态 2等待排队中 3暂停中 4已取消排队
		staticvar s_RaceState = new VMyText
		{
			pos(550,0);src = "活动状态";bgcolor = "#FFFF";
		}
	}
	inclass("VColumn_ArenaActivity_UI"); //界面显示类

	Init();

	//需要被显示的类覆盖
	void OnMySelect(){bgcolor = "#FFEA99";alpha = 50;}	//选择的效果
	void OnMyUnSelect(){bgcolor = "-1";}				//不选择的效果
	//===========================================================
	void OnLBDClick()
	{
		parent.parent.OnClick_LookOver();
	}
	void OnSelect()
	{
		OnMySelect();
		parent.parent.s_Btn_LookOver.SetState(window.BTN_STATE_LIGHT);
		
		//[原则]同时只能报名一个活动
		if (toint(m_RaceState) == window.g_QUEUE_QUEUEWAIT || toint(m_RaceState) == window.g_QUEUE_PAUSE)
		{
			//已经报名
			parent.parent.s_Btn_Apply.SetShowOrHide(false);
			parent.parent.s_Btn_Cancel.show = true;
		}
		else//此活动未报名
		{
			//其他活动已报名
			if (toint(parent.parent.GetNumByState(window.g_QUEUE_QUEUEWAIT)) > 0 || toint(parent.parent.GetNumByState(window.g_QUEUE_PAUSE)) > 0)
			{
				parent.parent.s_Btn_Apply.SetShowOrHide(false);
				parent.parent.s_Btn_Cancel.show = false;
			}
			else
			{
				parent.parent.s_Btn_Apply.SetShowOrHide(true);
				parent.parent.s_Btn_Cancel.show = false;
			}
		}
	}
	void OnUnSelect()
	{
		OnMyUnSelect();
		parent.parent.s_Btn_Apply.SetShowOrHide(false);
		parent.parent.s_Btn_Cancel.show = false;
		parent.parent.s_Btn_LookOver.SetState(window.BTN_STATE_GREY);
	}

	void OnDataExchange(iRow,szData)
	{
		m_RaceID = szData;
		m_RaceState = parent.fieldstr(iRow,window.M_G_SERVER_ARENARACE_RACE_STATE);
		s_Name.SetData(parent.fieldstr(iRow,window.M_G_SERVER_ARENARACE_TITLE),"","");
		s_Time.SetData(parent.fieldstr(iRow,window.M_G_SERVER_ARENARACE_BEGINENDTIME_UI),"","");
		var _teamnum = parent.fieldstr(iRow,window.M_G_SERVER_ARENARACE_TEAMNUM);
		var _allnum = parent.fieldstr(iRow,window.M_G_SERVER_ARENARACE_ALLNUM);
		s_AllNum.SetData(toint(_teamnum)*toint(_allnum),"","");
		s_RaceState.SetData(m_RaceState,"","");
		s_ActivityState.SetData(parent.fieldstr(iRow,window.M_G_SERVER_ARENARACE_HOT),"","");
		s_TeamNum.SetData(_teamnum,"","");
		var _moneytype = parent.fieldstr(iRow,window.M_G_SERVER_ARENARACE_UIRACETYPE);
		var _moneyvalue = parent.fieldstr(iRow,window.M_G_SERVER_ARENARACE_RACEMONEY);
		s_Fare.SetData(_moneyvalue,_moneytype,"");
		var _minLv = parent.fieldstr(iRow,window.M_G_SERVER_ARENARACE_MINLV_UI);
		var _maxLv = parent.fieldstr(iRow,window.M_G_SERVER_ARENARACE_MAXLV_UI);
		s_Lv.SetData(_minLv,_maxLv);
	}
};

//
//总的类：List
//
class VArena_ActivityDBList_Logic VN2ListCtrl
{
	//需要显示时改变
	size="665,400";//simpleshowmode="1,1";
	pos(0,10);
	//
	selecttype="1";colfilter="0";
	alpha = 70;
	bgcolor = "#123456";

	scroll = window.SCROLL_NOYES;
	inclass("VArena_ActivityDBList_UI"); //界面显示类
	columclass="0,VColumn_ArenaActivity_Logic"; //ID
};