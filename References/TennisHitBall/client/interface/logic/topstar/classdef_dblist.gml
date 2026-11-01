//明星榜列表大奖赛DB List类定义
//yxf 2008年10月17日15:59

/*排名方式*/

/*排行榜的类型
enum TS_TOP_TYPE
{
	TS_PRIXALL = 1,		//总排行-总场次			1	TS_A_AllBout
	TS_RACEWINNUM,		//总排行-胜利场次		2	TS_A_WinNum
	TS_RACEALLSCORE,	//总排行-总得分			3	TS_A_AllScore
	TS_RACEACE,			//总排行-一击得分总数	4	TS_A_ACE
	TS_RACESKILLNUM,	//总排行-技能总数		5	TS_A_SkillNum
	TS_FullStoreBall	//总排行-满蓄力次数		6	TS_A_FullStore
};
*/

importex("$./../../UI/TopStar/ClassDef_DBList.gml");

//一行显示类：排名+昵称+等级+得分
class VColumn_TopStar_Logic item
{
	size = "500,30";
	var m_NKName = "";//昵称
	//用来记住UID 用来取自己的排名
	var _userID;
	void GetValue()
	{
		return _userID;
	}

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

		//得分
		//参数 data1:
		staticvar s_Point = new VMyText{pos = "370,0";}
	}
	inclass("VColumn_TopStar_UI"); //界面显示类
	Init();
	//需要被显示的类覆盖
	void OnMySelect(){bgcolor = "#FFEA99";alpha = 50;}	//选择的效果
	void OnMyUnSelect(){bgcolor = "-1";}				//不选择的效果
	//===========================================================
	void OnMouseDownR()
	{
		window.g_TSMouseRName = m_NKName;
		parent.checkselect(20,parent.mousey);
		set window.find("TOPLAYER")
		{
			new VMyMouseR_Msg_TS
			{
				if(window.GetMyName() == window.g_TSMouseRName)
				{
					SetState(m_Index_AddFriend,0);
					SetState(m_Index_AddBlacklist,0);
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
		_singleindex = parent.fieldstr(iRow, window.TOPSTAR_TS_A_ACE_CURRINDEX);	// 当前排名
		_lastRank = toint(parent.fieldstr(iRow,window.TOPSTAR_TS_A_ACE_LASTINDEX));	//上次排名
		SetPage();

		m_NKName = parent.fieldstr(iRow,window.TOPSTAR_TS_A_ACE_NKNAME);	//昵称
		s_Nickname.SetData(m_NKName,"","");
		s_Level.SetData(parent.fieldstr(iRow,window.TOPSTAR_TS_A_ACE_LEVEL),"","");	//等级
		s_Point.SetData(parent.fieldstr(iRow,window.TOPSTAR_TS_A_ACE_TYPERES),"","");//得分
		s_TechnicType.SetData(parent.fieldstr(iRow,window.TOPSTAR_TS_A_ACE_TECHNIC));

		// 自己高亮
		_MySelf.show = false;
		if (m_NKName == window.GetMyName())
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
class VTopStar_List_Logic VN2ListCtrl
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
	size="400,400";valign(60,0);halign(50,0);simpleshowmode="1,10";
	//
	selecttype="1";colfilter="0";
	alpha = 70;bgcolor = "#FF";

	inclass("VTopStar_List_UI"); //界面显示类

	columclass="0,VColumn_TopStar_Logic"; //ID
}