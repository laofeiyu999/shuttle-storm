//家族排行榜
//夏洋洋 2010-3-8

importex("$./../../UI/TopStar/ClassDef_Family_DBList.gml");

//一行内容	名次+家族名称+族长+等级+积分+人数
class VColumn_FamilyDBList_Logic item
{
	var m_rowID = 0;	//行ID
	//==================================
	void Init()
	{
		//名次
		staticvar m_Text_FamilyTopStar = new BaseText
		{}
		staticvar m_Img_FamilyTopStarNum = new img
		{}
		//家族徽章
		staticvar m_Img_FamilyBadge = new item
		{}
		//家族名称
		staticvar m_Text_FamilyName = new BaseText
		{}
		//族长
		staticvar m_Text_HeaderName = new BaseText
		{}
		//等级
		staticvar m_Text_FamilyLev = new BaseText
		{}
		//积分
		staticvar m_Text_FamilyScore = new BaseText
		{}
		//人数
		staticvar m_Text_FamilyPeopleNum = new BaseText
		{}
	}
	inclass("VColumn_FamilyDBList_UI");
	Init();
	//===========================================
	void OnSelect(){OnMySelect();parent.parent.SaveSelectFamily(m_rowID);};
	void OnUnSelect(){OnMyUnSelect();};
	var _topStarNum=0;var _familyName="";var _headName="";var _lv=1;var _familyScore=0;var _peopleNum=1;
	var _singleindex = 0;
	var _lastRank =0;
	void OnDataExchange(iRow,szData)
	{
		_singleindex = parent.fieldstr(iRow, window.GAMEUI_JIVECONSORTIAINISYN_CURRINDEX);	// 当前排名
		_lastRank = toint(parent.fieldstr(iRow,window.GAMEUI_JIVECONSORTIAINISYN_LASTINDEX));	//上次排名
		SetPageT();
		//_singleindex = toint(iRow)+1;
		_singleindex = parent.fieldstr(iRow,window.GAMEUI_JIVECONSORTIAINISYN_CURRINDEX);	// 排行
		var _familyBadgeData = parent.fieldstr(iRow,window.GAMEUI_JIVECONSORTIAINISYN_ICONID);
		var _parserBadgeData = window.parserBadgeData(_familyBadgeData);
		var _arrBadgeData = window.Splitstr2(_parserBadgeData,",",6);//alert(_parserBadgeData);
		m_Img_FamilyBadge.SetFamilyBadge(_arrBadgeData[0],_arrBadgeData[1],_arrBadgeData[2],_arrBadgeData[3],_arrBadgeData[4],_arrBadgeData[5]);
		
		_familyName = parent.fieldstr(iRow,window.GAMEUI_JIVECONSORTIAINISYN_NAME);
		m_Text_FamilyName.SetData(_familyName);
		_headName = parent.fieldstr(iRow,window.GAMEUI_JIVECONSORTIAINISYN_USERNICK);
		m_Text_HeaderName.SetData(_headName);
		_lv = parent.fieldstr(iRow,window.GAMEUI_JIVECONSORTIAINISYN_CURRLV);
		m_Text_FamilyLev.SetData(_lv);
		_familyScore = parent.fieldstr(iRow,window.GAMEUI_JIVECONSORTIAINISYN_CURRPOINT);
		m_Text_FamilyScore.SetData(_familyScore);
		_peopleNum = parent.fieldstr(iRow,window.GAMEUI_JIVECONSORTIAINISYN_CURRNUM);
		m_Text_FamilyPeopleNum.SetData(_peopleNum);
		m_rowID = parent.fieldstr(iRow,window.GAMEUI_JIVECONSORTIAINISYN_ID);

		// 判断如果是自己的家族高亮显示
		_MySelf.show = false;
		if (_familyName == window.GetMyName())
		{
			_MySelf.show = true;
		}

		SetPage();
	}

	void SetPage()
	{
		_topStarNum = _singleindex;
		if(_topStarNum<=window.FAMILY_TOPSTAR_SORTLIMIT)
		{
			m_Img_FamilyTopStarNum.SetSrc(_topStarNum);
		}
		else
		{
			m_Img_FamilyTopStarNum.show = false;
		}
		m_Text_FamilyTopStar.SetData(_topStarNum);
		var _myFamilyName = window.GetFamilyName();
		if(_myFamilyName != -1)
		{
			if(_myFamilyName == _familyName)
			{
//				parent.parent._myRank = ""+_topStarNum;
//				parent.parent._myFamilyName = ""+_familyName;
//				parent.parent._myHeadName = ""+_headName;
//				parent.parent._myLevel = ""+_lv;
//				parent.parent._myFamilyPoint = ""+_familyScore;
//				parent.parent._myPeopleNum = ""+_peopleNum;
				parent.parent.SetMyData(_topStarNum,_familyName,_headName,_lv,_familyScore,_peopleNum);
			}
		}
	}
	void SetPageT()
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
	void OnMouseDownR()
	{
		parent.checkselect(20,parent.mousey);
		
		set window.find("TOPLAYER")
		{
			new VMyMouseR_FamilyTopStar
			{
				var _list = window.find("VTopStar_FamilyDBList_All_Logic_NAME");
				var _RoleRow = _list.curselectrow();
				var _selectRowID = _list.fieldstr(_RoleRow,window.GAMEUI_JIVECONSORTIAINISYN_ID);
				//申请加入
				void On_Apply()
				{	
					window.F_Family_Apply(_selectRowID);
				}
				//查看信息
				void On_Lookup()
				{
					window.F_Family_GetFamilyInfo(_selectRowID);
//					window.find("UIController").LoadUI("UI_LOOKUPFAMILYINFO");
//					window.find("LOOKUPFAMILYINFO_LOGIC")._LookupFamilyInfo.SetFamilyInfo(_selectRowID);
				}
			}
		}
	}
}
//总的类
class VTopStar_FamilyDBList_All_Logic VN2ListCtrl
{
	var curpage=1;
	var _pagenum = 9;
	//需要显示时改变
	size="600,200";valign(15,0);halign(15,0);
	selecttype="1";colfilter="0";simpleshowmode="1,10";
	alpha = 70;bgcolor = "#FF0000";
	inclass("VTopStar_FamilyDBList_All_UI");
	columclass="0,VColumn_FamilyDBList_Logic"; //识别id
}