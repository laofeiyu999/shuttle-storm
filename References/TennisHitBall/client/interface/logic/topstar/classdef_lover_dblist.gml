//情侣榜-Logic
//2010年9月27日

importex("$./../../UI/TopStar/ClassDef_Lover_DBList.gml");
importex("$./ClassDef_Lover_Model.gml");

//一行显示类：排名+昵称+等级+技术类型+得分
class VColumn_TopStar_Lover_Logic item
{
	size = "500,30";
	var m_NKName = "";//昵称
	//用来记住UID 用来取自己的排名
	var _userID;
	void GetValue()
	{
		return _userID;
	}
	
	var m_ava_1 = "";	//玩家1的换装(女)
	var m_ava_2 = "";	//玩家2的换装(男)
	//===========================与显示交互======================
	void Init()
	{
		//排名
		//参数 data1:
		staticvar s_Rank = new VMyText{}
		//排名升降
		staticvar s_RankChangeState = new img
		{}
		//昵称
		//参数 data1:
		staticvar s_Nickname = new VMyText{pos = "50,0";}

		//等级
		//参数 data1:
		staticvar s_Level = new VMyText{pos = "200,0";}

		//技术类型
		//参数 data1:1网前力量型,2底线力量型 3网前技巧型 4底线技巧型
		staticvar s_TechnicType = new VMyText
		{
			pos = "250,0";
			void SetData(type)
			{
				src = window.GetTechnicByType(type);
			}
		}

		//参数 data1:
		staticvar s_Nickname_1 = new VMyText{pos = "50,0";}

		//等级
		//参数 data1:
		staticvar s_Level_1 = new VMyText{pos = "200,0";}

		//技术类型
		//参数 data1:1网前力量型,2底线力量型 3网前技巧型 4底线技巧型
		staticvar s_TechnicType_1 = new VMyText
		{
			pos = "250,0";
			void SetData(type)
			{
				src = window.GetTechnicByType(type);
			}
		}

		//得分
		//参数 data1:
		staticvar s_Point = new VMyText{pos = "370,0";}
	}
	inclass("VColumn_TopStar_Lover_UI"); //界面显示类
	Init();
	//需要被显示的类覆盖
	void OnMySelect(){bgcolor = "#FFEA99";alpha = 50;}	//选择的效果
	void OnMyUnSelect(){bgcolor = "-1";}				//不选择的效果
	//===========================================================
	void OnMouseDownRbyname(_NKName)
	{
		window.g_TSMouseRName = _NKName;
		parent.checkselect(20,parent.mousey);
		set window.find("TOPLAYER")
		{
			new VMyMouseR_Msg_TS
			{
				if(window.GetMyName() == window.g_TSMouseRName)
				{
					SetState(m_Index_PresentFlower,0);
					SetState(m_Index_AskaddFamily,0);
				}
				//点击了加为好友
				void On_AddFriend(data)
				{
					window.AddFriend(window.g_TSMouseRName);
				}
				//点击了加入黑名单
				void On_AddBlacklist(data)
				{
					window.AddBlacklist(window.g_TSMouseRName);
				}
				//点击了复制昵称
				void On_CopyName(data)
				{
					window.setClipBoardData(window.g_TSMouseRName);
				}
				//点击了献花
				void On_PresentFlower(data)
				{
					window.GamePresentFlower(window.g_TSMouseRName);
				}
				//邀请加入家族
				void On_AskaddFamily()
				{
					window.F_Family_Askadd(window.g_TSMouseRName);
				}
			}
		}
	}
	void OnSelect(){OnMySelect();};
	void OnUnSelect(){OnMyUnSelect();};
	var _lastRank =0;
	var _singleindex = 0;
	void OnDataExchange(iRow,szData)
	{
		_userID = szData;
		//_singleindex = toint(iRow)+1;
		_singleindex = parent.fieldstr(iRow, window.TOPSTAR_TS_A_LOVER_CURRINDEX);	// 当前排名
		_lastRank = toint(parent.fieldstr(iRow,window.TOPSTAR_TS_A_LOVER_LASTINDEX));	//上次排名
		SetPage();

		m_NKName = parent.fieldstr(iRow,window.TOPSTAR_TS_A_LOVER_NKNAME);	//昵称
		s_Nickname.SetData(m_NKName,"","");
		s_Level.SetData(parent.fieldstr(iRow,window.TOPSTAR_TS_A_LOVER_LEVEL),"","");	//等级
		s_TechnicType.SetData(parent.fieldstr(iRow,window.TOPSTAR_TS_A_LOVER_TECHNIC));
		s_Point.SetData(parent.fieldstr(iRow,window.TOPSTAR_TS_A_LOVER_WLOVES),"","");//得分
		var _Sex = parent.fieldstr(iRow,window.TOPSTAR_TS_A_LOVER_SEX);
		var _Nickname1 = parent.fieldstr(iRow,window.TOPSTAR_TS_A_LOVER_NKNAME1);
		s_Nickname_1.SetData(_Nickname1,"","");
		s_Level_1.SetData(parent.fieldstr(iRow,window.TOPSTAR_TS_A_LOVER_LEVEL1),"","");	//等级
		s_TechnicType_1.SetData(parent.fieldstr(iRow,window.TOPSTAR_TS_A_LOVER_TECHNIC1));
		
		if(_Sex.__Long__ == window.USER_SEX_MAN)	//如果1是男的
		{
			m_ava_1 = parent.fieldstr(iRow,window.TOPSTAR_TS_A_LOVER_ROLESHOW1);
			m_ava_2 = parent.fieldstr(iRow,window.TOPSTAR_TS_A_LOVER_ROLESHOW);
		}
		else
		{
			m_ava_1 = parent.fieldstr(iRow,window.TOPSTAR_TS_A_LOVER_ROLESHOW);
			m_ava_2 = parent.fieldstr(iRow,window.TOPSTAR_TS_A_LOVER_ROLESHOW1);
		}
		// 自己高亮
		_MySelf.show = false;
		if (m_NKName == window.GetMyName() || _Nickname1 == window.GetMyName())
		{
			_MySelf.show = true;
		}
	}

	void SetPage()
	{
		var _NowRank = _singleindex;
		SetUpDown(_NowRank);
	}
	void SetUpDown(_NowRank)
	{
		s_Rank.SetData(_NowRank,"","");				//排名
		if(_lastRank <= 0)
		{
			s_RankChangeState.SetUpOrDown(3);
		}
		else
		{
			if(toint(_NowRank) > toint(_lastRank))
			{
				s_RankChangeState.SetUpOrDown(1);
				var _value = toint(_NowRank)-toint(_lastRank);
				s_RankChangeValue.SetData(_value);
			}
			if(toint(_NowRank) == toint(_lastRank))
			{
				s_RankChangeState.SetUpOrDown(2);
				s_RankChangeValue.SetData("--");		//modify by chenjihui 2011-1-21
			}
			if(toint(_NowRank) < toint(_lastRank))
			{
				s_RankChangeState.SetUpOrDown(3);
				var _value = toint(_lastRank)-toint(_NowRank);
				s_RankChangeValue.SetData(_value);
			}
		}
	}
};

//
//总的类：List
//
class VTopStar_Lover_List_Logic VN2ListCtrl
{
	var curpage=1;
	var _pagenum = 9;
	enableUpdate(1);
	//取得排名
	void GetIndex()
	{
		var _index = FindIndexByData(0,window.GetMyUID());//第一个字段
		alert("_index:"+_index);
		return toint(_index)+1;
	}

	//需要显示时改变
	size="400,400";valign(60,0);halign(50,0);simpleshowmode="1,5";
	//
	selecttype="1";colfilter="0";
	alpha = 70;bgcolor = "#FF";

	inclass("VTopStar_Lover_List_UI"); //界面显示类

	columclass="0,VColumn_TopStar_Lover_Logic"; //ID
}