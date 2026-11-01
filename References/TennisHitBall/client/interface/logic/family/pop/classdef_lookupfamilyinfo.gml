//查看家族信息
//夏洋洋 2010-3-4

importex("$./../../../UI/Family/pop/ClassDef_LookupFamilyInfo.gml");

class VLookupFamilyInfo_Logic item
{
	void Init()
	{
		//家族名称
		staticvar s_Img_FamilyName = new img
		{}
		staticvar s_Text_FamilyName = new BKText
		{}
		//家族签名
		staticvar s_Img_FamilySlogan = new img
		{}
		staticvar s_Text_FamilySlogan = new BKText
		{}
		//家族族长
		staticvar s_Img_FamilyHeader = new img
		{}
		staticvar s_Text_FamilyHeader = new BKText
		{}
		//家族成员
		staticvar s_Img_FamilyPeople = new img
		{}
		staticvar s_Text_FamilyPeople = new BKText
		{}
		//男女人数
		staticvar s_Img_FamilyBoyAndGirlNum = new img
		{}
		staticvar s_Text_FamilyBoyAndGirlNum = new VListBG2_UI
		{}
		//家族等级
		staticvar s_Img_FamilyLev = new img
		{}
		staticvar s_Text_FamilyLev = new BKText
		{}
		//家族积分
		staticvar s_Img_FamilySorce = new img
		{}
		staticvar s_Text_FamilySorce = new BKText
		{}
		//家族排名
		staticvar s_Img_FamilyTopStar = new img
		{}
		staticvar s_Text_FamilyTopStar = new BKText
		{}
		//创建日期
		staticvar s_Img_FamilyCreateDate = new img
		{}
		staticvar s_Text_FamilyCreateDate = new BKText
		{}
		//家族徽章
		staticvar s_Img_FamilyBadge = new img
		{}
		staticvar s_BadgeDesignResult = new item
		{}
		//取消
		staticvar s_Btn_Cancle = new VBTN_A_New
		{}
	}
	inclass("VLookupFamilyInfo_UI");
	void SetEvent()
	{
		set s_Btn_Close
		{
			void OnPressed()
			{
				parent.parent.del();
			}
		}
		set s_Btn_Cancle
		{
			void OnPressed()
			{
				//parent.del();
				window.find("LOOKUPFAMILYINFO_LOGIC").del();
			}
			
		}

	}
	
	Init();
	SetEvent();
	//===================================
	//[功能]填充数据
	//[参数]_iRowID:家族ID
	//[返回值]
	void SetFamilyInfo(_iRowID)
	{
		window.g_Row.InitByInt(window.GAMEUI,window.JIVECONSORTIAINISYN,window.GAMEUI_JIVECONSORTIAINISYN_ID,_iRowID);
		if(!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			return window.DB_ERR;
		}
		var _FamilyName = window.g_Row.GetData(window.GAMEUI_JIVECONSORTIAINISYN_NAME);
		s_Text_FamilyName.SetData(_FamilyName);

		var _FamilySlogan = window.g_Row.GetData(window.GAMEUI_JIVECONSORTIAINISYN_SLOGAN);
		s_Text_FamilySlogan.SetData(_FamilySlogan);

		var _FamilyHeader = window.g_Row.GetData(window.GAMEUI_JIVECONSORTIAINISYN_USERNICK);
		s_Text_FamilyHeader.SetData(_FamilyHeader);

//		var _FamilyPeople = window.g_Row.GetData(window.GAMEUI_JIVECONSORTIAINISYN_CURRNUM);
//		s_Text_FamilyPeople.SetData(_FamilyPeople);

//		var _FamilyBoyAndGirlNum = window.g_Row.GetData(window.GAMEUI_JIVECONSORTIAINISYN_CURRMANNUM);
//		s_Text_FamilyBoyAndGirlNum.SetData(_FamilyBoyAndGirlNum,toint(_FamilyPeople-_FamilyBoyAndGirlNum));

		var _FamilyLev = window.g_Row.GetData(window.GAMEUI_JIVECONSORTIAINISYN_CURRLV);
		s_Text_FamilyLev.SetData(_FamilyLev);

		var _FamilySorce = window.g_Row.GetData(window.GAMEUI_JIVECONSORTIAINISYN_CURRPOINT);
		var _currLev = window.g_Row.GetData(window.GAMEUI_JIVECONSORTIAINISYN_CURRLV);
		var _needPoint = 0;
		if(toint(_currLev) == window.FAMILY_MAXLEV)
		{
			_needPoint = window.GetLevelUpNeedPoint(toint(window.FAMILY_MAXLEV));
		}
		else
		{
			_needPoint = window.GetLevelUpNeedPoint(_currLev+1);
		}
		s_Text_FamilySorce.SetData(_FamilySorce,_needPoint);

		var _VNet2DBTable = new VNet2DBTable
		{
			var _SQL = "SELECT * FROM "+window.JIVECONSORTIAINISYN;
			Select(window.GAMEUI,_SQL);
		}
		var _allPeopleCount = _VNet2DBTable.GetSize();
		_VNet2DBTable.del();
//		var _FamilyTopStar = _allPeopleCount-window.g_Row.GetData(window.GAMEUI_JIVECONSORTIAINISYN_SORT);
//		s_Text_FamilyTopStar.SetData(_FamilyTopStar);

		var _FamilyCreateDate = window.g_Row.GetData(window.GAMEUI_JIVECONSORTIAINISYN_CREATETM);
		s_Text_FamilyCreateDate.SetData(_FamilyCreateDate);

		var _BadgeData = window.g_Row.GetData(window.GAMEUI_JIVECONSORTIAINISYN_ICONID);
		window.g_Row.Release();
		var _parserBadgeData = window.parserBadgeData(_BadgeData);
		var _arrBadgeData = window.Splitstr2(_parserBadgeData,",",6);
		s_BadgeDesignResult.SetFamilyBadge(_arrBadgeData[0],_arrBadgeData[1],_arrBadgeData[2],_arrBadgeData[3],_arrBadgeData[4],_arrBadgeData[5]);
		
	}

	//设置家族口号
	void SetFamilySlogan(_data)
	{
		s_Text_FamilySlogan.SetData(_data);
	}

	//设置家族创建时间
	void SetFamilyTm(_tm)
	{
		s_Text_FamilyCreateDate.SetData(_tm);
	}
	//设置家族人数	
	void SetFamilyBoyAndGirlNum(_peopleNum)
	{
		var _num = window.GetSplitCount(_peopleNum,";");
		var _peopleNumArray = window.SplitStr2(_peopleNum,";",_num);
		var _allNum = toint(_peopleNumArray[0]);
		var _manNum = toint(_peopleNumArray[1]);
		var _girlNum = toint(_allNum - _manNum);
		s_Text_FamilyPeople.SetData(_allNum);
		s_Text_FamilyBoyAndGirlNum.SetData(_manNum,_girlNum);
	}
}