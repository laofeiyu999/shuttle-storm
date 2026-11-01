//黄金联赛榜
//武文博 2010-8-31

importex("$./../../UI/TopStar/ClassDef_GoldenLMatch_DBList.gml");

//一行内容	排名-昵称-家族名称-等级-技术类型-胜率-胜利场次
class VColumn_GoldenLMatchDBList_Logic item
{
	var m_NKName = "";//昵称
	var m_rowID = 0;	//行ID
	//==================================
	void Init()
	{
		//排名
		staticvar m_Text_TopStar = new BaseText
		{}
		staticvar m_Text_UserName = new BaseText
		{}
		//家族名称
		staticvar m_Text_FamilyName = new BaseText
		{}
		//等级
		staticvar m_Text_Lev = new BaseText
		{}

		var m_lev = new BaseText				// 显示等级
		var m_Tech = new BaseText					// 显示技术特长
		var _ConfInVic = new img				// 胜率
		var _VicTimes = new img				// 胜利场次

	}
	inclass("VColumn_GoldenLMatchDBlist_UI");
	Init();
	//===========================================
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
	void OnSelect()
	{
		OnMySelect();
		if(window.GetMyName() != m_NKName)
		{
			parent.parent.s_Btn_PresentFlower.SetState(window.BTN_STATE_LIGHT);
		}else
		{
			parent.parent.s_Btn_PresentFlower.SetState(window.BTN_STATE_GREY);
		}
	};
	void OnUnSelect(){OnMyUnSelect();parent.parent.s_Btn_PresentFlower.SetState(window.BTN_STATE_GREY);};
	void OnDataExchange(iRow,szData)
	{
		_userID = szData;
		
		var _lv = "";
		var _familyName = "";
		var _technicType = "";
		var  _typeRes = "";
		var _typeRes1 = "";
		var _top = "";
		var _ConfInVic = 0;
		var _lastindex = "";
		m_NKName = parent.fieldstr(iRow,window.TOPSTAR_TS_A_GOLDNUM_NKNAME);	//昵称
		s_Nickname.SetData(m_NKName,"","");
		var _lv = parent.fieldstr(iRow,window.TOPSTAR_TS_A_GOLDNUM_LEVEL);
		s_Level.SetData(_lv,"","");	//等级
		//var _point = parent.fieldstr(iRow,window.TOPSTAR_TS_A_GOLDNUM_VALUE);
		//s_Point.SetData(_point,"","");//得分
		var _familyName = parent.fieldstr (iRow,window.TOPSTAR_TS_A_GOLDNUM_FAMILYNAME);
		s_familyName.SetData(_familyName);//家族名称
		var _technicType = parent.fieldstr(iRow,window.TOPSTAR_TS_A_GOLDNUM_TECHNIC);
		s_TechnicType.SetData(_technicType);//技术方向
		var _top = parent.fieldstr(iRow, window.TOPSTAR_TS_A_GOLDNUM_CURRINDEX);	// 排行
		s_Rank.SetData(_top,"","");
		var _typeRes = parent.fieldstr(iRow,window.TOPSTAR_TS_A_GOLDNUM_TYPERES);	//胜利场次
		m_Text_VicTimes.SetData(_typeRes);
		var _typeRes1 = parent.fieldstr(iRow,window.TOPSTAR_TS_A_GOLDNUM_TYPERES1);	//总场次
		var _ConfInVic = tofloat(_typeRes)/_typeRes1*100;
		m_Text_ConInVic.SetData(_ConfInVic);
		var _lastindex = parent.fieldstr(iRow,window.TOPSTAR_TS_A_GOLDNUM_LASTINDEX);  //上次排名
		var _VicTimes  = toint(_lastindex)-toint( _top);
		m_VicTimes.SetData(_VicTimes);
		var _TopUpDown = _VicTimes;
		m_TopUpDown.SetData(_VicTimes);
		

		// 自己高亮
		_MySelf.show = false;
		if (m_NKName == window.GetMyName())
		{
			_MySelf.show = true;
//			parent.parent.SetMyContent(m_NKName,_lv,_technicType);
		}
	}
};

//
//总的类：List
//
class VTopStar_GoldenLMatch_List_Logic VN2ListCtrl
{
	var curpage=1;
	var _pagenum = 9;
	//取得排名
	void GetIndex()
	{
		var _index = FindIndexByData(0,window.GetMyUID());//第一个字段
		return toint(_index)+1;
	}

	//需要显示时改变
	//size="400,400";valign(60,0);halign(50,0);//simpleshowmode="1,"+window.FAVOR_TOPSTAR_SHOW_NUM;
	//
	simpleshowmode="1,10";
	selecttype="1";colfilter="0";
	alpha = 70;bgcolor = "#FF";

	inclass("VTopStar_GoldenLMatch_List_UI"); //界面显示类

	columclass="0,VColumn_GoldenLMatchDBList_Logic"; //ID
}
