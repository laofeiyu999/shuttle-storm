//搭档排行榜

importex("$./../../UI/TopStar/ClassDef_Partner_DBList.gml");

//一行内容	名次+家族名称+族长+等级+积分+人数
class VColumn_PartnerDBList_Logic item
{
	var m_rowID = 0;	//行ID
	//==================================
	void Init()
	{
		//s_icon是排名数字对应的奖牌图标，出现在排名数字之前
		staticvar s_icon = new img{}
		//排名数字
		//参数 data1:
		staticvar s_Rank = new TopText{}
		//昵称
		//参数 data1:
		staticvar s_name = new TopText{}
		staticvar s_name1 = new TopText{}		
		//等级
		//参数 data1:
		staticvar s_lv = new TopText{}
		staticvar s_lv1 = new TopText{}
		//技术类型
		//参数 data1:1网前力量型,2底线力量型 3网前技巧型 4底线技巧型
		staticvar s_type = new TopText{}
		staticvar s_type1 = new TopText{}
		//胜率
		staticvar s_win = new TopText{}

		//搭档等级
		//参数 data1:
		staticvar s_PartnerLv = new TopText{}

		//默契度
		staticvar s_pprivity = new TopText{}
		//排名变化的数字
		staticvar s_IndexChg = new TopText{}
		//排名变化相应的图标
		staticvar s_IndexChgImg = new img {}
	}
	inclass("VColumn_PartnerDBList_UI");
	Init();
	//===========================================
	void OnSelect(){OnMySelect();};
	void OnUnSelect(){OnMyUnSelect();};
	
	var _index = 0;
	var _lastIndex = 0;
	void OnDataExchange(iRow,szData)
	{
		 _index = parent.fieldstr(iRow,window.TOPSTAR_TS_A_PARTNER_CURRINDEX);			// 排名当前
		 _lastIndex = parent.fieldstr(iRow,window.TOPSTAR_TS_A_PARTNER_LASTINDEX);		// 上次排名
		var _PartnerLv = parent.fieldstr(iRow,window.TOPSTAR_TS_A_PARTNER_LEVEL);	// 搭档等级
		var _name = parent.fieldstr(iRow,window.TOPSTAR_TS_A_PARTNER_NKNAME);			// 昵称
		var _name1 = parent.fieldstr(iRow,window.TOPSTAR_TS_A_PARTNER_NKNAME1);			// 昵称1
		var _Lv = parent.fieldstr(iRow,window.TOPSTAR_TS_A_PARTNER_LEVEL);			// 等级
		var _Lv1  = parent.fieldstr(iRow,window.TOPSTAR_TS_A_PARTNER_LEVEL1);		// 等级1
		var _type = parent.fieldstr(iRow,window.TOPSTAR_TS_A_PARTNER_TECHNIC);			// 技术
		var _type1 = parent.fieldstr(iRow,window.TOPSTAR_TS_A_PARTNER_TECHNIC1);		// 技术1
		var _win = parent.fieldstr(iRow,window.TOPSTAR_TS_A_PARTNER_TYPERES);		// 胜利次数
		var _all = parent.fieldstr(iRow,window.TOPSTAR_TS_A_PARTNER_TYPERES1);		// 总次数
		var _pprivity = parent.fieldstr(iRow,window.TOPSTAR_TS_A_PARTNER_PPRIVITY);		// 默契度

		s_Rank.SetData(_index);	// 当前排名
		s_icon.SetData(_index);	//图标
		s_name.SetData(_name);		// 昵称
		s_name1.SetData(_name1);	// 昵称1
		s_lv.SetData(_Lv);		// 等级
		s_lv1.SetData(_Lv1);	// 等级1
		s_type.SetData(_type);		// 技术
		s_type1.SetData(_type1);	// 技术1
		s_win.SetData(toint(_win*100/_all));	// 胜率
		s_PartnerLv.SetData(_PartnerLv);			// 搭档等级
		s_pprivity.SetData(_pprivity);				// 默契度
		s_IndexChg.SetData(toint(_lastIndex)-toint(_index));	//排名变化

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
				s_RankChangeValue.SetData(0);
			}
			if(toint(_NowRank) < toint(_lastRank))
			{
				s_RankChangeState.SetUpOrDown(3);
				var _value = toint(_lastRank)-toint(_NowRank);
				s_RankChangeValue.SetData(_value);
			}
		}
	}
}
//总的类
class VTopStar_PartnerDBList_Logic VN2ListCtrl
{
	var curpage=1;
	var _pagenum = 9;
	//需要显示时改变
	size="600,200";valign(15,0);halign(15,0);
	selecttype="1";colfilter="0";simpleshowmode="1,5";
	alpha = 70;bgcolor = "#FF0000";
	inclass("VTopStar_PartnerDBList_UI");
	columclass="0,VColumn_PartnerDBList_Logic"; //识别id
}