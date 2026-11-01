importex("$./../../UI/Family/ClassDef_FamilyInfo.gml");

class VFamilyInfo_Logic item
{
	void Init()
	{
		//家族名称
		staticvar s_Img_FamilyName = new img
		{}
		staticvar s_Text_FamilyName = new BKText
		{}
		//家族等级
		staticvar s_Img_FamilyLev = new img
		{}
		staticvar s_Text_FamilyLev = new BKText
		{}
		//家族签名
		staticvar s_Img_FamilySlogan = new img
		{}
		staticvar s_Text_FamilySlogan = new BKText
		{}
		//家族积分
		staticvar s_Img_FamilySorce = new img
		{}
		staticvar s_Text_FamilySorce = new BKText
		{}
		//家族族长
		staticvar s_Img_FamilyHeader = new img
		{}
		staticvar s_Text_FamilyHeader = new BKText
		{}
		//家族排名
//		staticvar s_Img_FamilyTopStar = new img
//		{}
//		staticvar s_Text_FamilyTopStar = new BKText
//		{}
		//家族徽章
		staticvar s_Img_FamilyBadge = new img
		{}
		staticvar s_BadgeDesignResult = new item
		{}
		//创建日期
		staticvar s_Img_FamilyCreateDate = new img
		{}
		staticvar s_Text_FamilyCreateDate = new BKText
		{}
		//所属俱乐部
		staticvar s_Img_FamilyClub = new img
		{}
		staticvar s_Text_FamilyClub = new BKText
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
	}
	inclass("VFamilyInfo_UI");
	//=======================================================
	//[功能]填充数据
	//[参数]无
	//[返回值]无
	void SetFamilyInfo()
	{
		window.g_Row.InitByInt(window.GAMEUI,window.JIVECONSORTIAINI,window.GAMEUI_JIVECONSORTIAINI_ID,window.GetFamilyIDByName());
		if(!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			return window.DB_ERR;
		}
		s_Text_FamilyName.SetData(window.g_Row.GetData(window.GAMEUI_JIVECONSORTIAINI_NAME));
		var _currLev = window.g_Row.GetData(window.GAMEUI_JIVECONSORTIAINI_CURRLV);
		s_Text_FamilyLev.SetData(_currLev);
		s_Text_FamilySlogan.SetData(window.g_Row.GetData(window.GAMEUI_JIVECONSORTIAINI_SLOGAN));
		var _curPoint = window.g_Row.GetData(window.GAMEUI_JIVECONSORTIAINI_CURRPOINT);
		var _needPoint = 0;
		if(toint(_currLev) == window.FAMILY_MAXLEV)
		{
			_needPoint = window.GetLevelUpNeedPoint(toint(window.FAMILY_MAXLEV));
		}
		else
		{
			_needPoint = window.GetLevelUpNeedPoint(_currLev+1);
		}
		s_Text_FamilySorce.SetData(_curPoint,_needPoint);
		s_Text_FamilyHeader.SetData(window.g_Row.GetData(window.GAMEUI_JIVECONSORTIAINI_USERNICK));
//		s_Text_FamilyTopStar.SetData(window.g_Row.GetData(window.GAMEUI_JIVECONSORTIAINI_SORT));		// 家族排名
		var _badgeData = window.g_Row.GetData(window.GAMEUI_JIVECONSORTIAINI_ICONID);
		var _parserBadgeData = window.parserBadgeData(_badgeData);
		var _arrBadgeData = window.Splitstr2(_parserBadgeData,",",6);
		s_BadgeDesignResult.SetFamilyBadge(_arrBadgeData[0],_arrBadgeData[1],_arrBadgeData[2],_arrBadgeData[3],_arrBadgeData[4],_arrBadgeData[5]);
		s_Text_FamilyCreateDate.SetData(window.g_Row.GetData(window.GAMEUI_JIVECONSORTIAINI_CREATETM));
		s_Text_FamilyClub.SetData("");
		var _FamilyPeopleNum = window.g_Row.GetData(window.GAMEUI_JIVECONSORTIAINI_CURRNUM);
		var _FamilyMaxPeopleNum = window.GetFamilyMaxPeopleNum(_currLev);
		s_Text_FamilyPeople.SetData(_FamilyPeopleNum,_FamilyMaxPeopleNum);
		var _manPeopleNum = window.g_Row.GetData(window.GAMEUI_JIVECONSORTIAINI_CURRMANNUM);
		s_Text_FamilyBoyAndGirlNum.SetData(_manPeopleNum,toint(_FamilyPeopleNum-_manPeopleNum));

		window.g_Row.Release();
	}
	
	void SetEvent()
	{
		SetFamilyInfo();
	}
	Init();
	SetEvent();

}
