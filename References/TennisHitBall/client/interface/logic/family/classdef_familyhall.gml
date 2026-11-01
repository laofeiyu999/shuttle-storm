//家族大厅
//夏洋洋 2010-3-3

importex("$./../../UI/Family/ClassDef_FamilyHall.gml");
importex("$./ClassDef_FamilyHall.gml");
importex("$./ClassDef_FamilyPeopleList_Content.gml");

class VFamilyHall_Logic item
{
	var m_SelectType = 0;	//排序方式
	var m_SelectName = window.GAMEUI_JIVECONSORTIA_POINT_STR;	//排序名称
	var m_SortIndex = 0;	//玩家在贡献度排序中的位置
	//========================
	void Init()
	{
		//家族名称及家族签名
		staticvar s_Text_FamilyInfo = new BKText
		{}
		//家族公告
		staticvar s_FamilyAffiche = new VListBG2_UI
		{}
		//我的信息
		staticvar s_MyInfo = new VListBG2_UI
		{}
		//家族成员列表
		staticvar s_Family_PeopleList = new VFamily_PeopleList
		{}
		//排列方式
		staticvar s_topStar = new VMyDropMenu_UI
		{}
		//在线人数
		staticvar s_Text_OnlineNum = new BaseText
		{}
		//邀请加入
		staticvar s_apply = new VBTN_A_New
		{}
	}
	inclass("VFamilyHall_UI");
	//===================================

	void SetEvent()
	{
		set s_topStar
		{
			void WhichSelect(index)
			{
				parent.m_SelectType = index;
				parent.m_SelectName = _searchTypeArr[index];
				if(parent.m_SelectName == window.GAMEUI_JIVECONSORTIA_POINT_STR)
				{
					parent.s_Family_PeopleList.SetSignShowState(true);
				}
				else
				{
					parent.s_Family_PeopleList.SetSignShowState(false);
				}
				parent.s_FamilyPeopleList_Content_All.Reflash(parent.m_SelectName);
			}
			
			void GetOffSetX()
			{
				return parent.parent.parent.left + parent.parent.left + parent.left;
			}
			void GetOffSetY()
			{
				return parent.parent.parent.top + parent.parent.top + parent.top;
			}

			var _data = "贡献度,在线成员";
			var _searchTypeData = ""+window.GAMEUI_JIVECONSORTIA_POINT_STR+","+window.GAMEUI_JIVECONSORTIA_ONLINE_STR;
			var _arr = window.SplitStr2(_data,",");
			var _searchTypeArr = window.SplitStr2(_searchTypeData,",");
			SetID(toint(window.POS_FAMILY)+parent.m_SelectType);
			SetPos(230,250);
			SetWidthAndType(100,0);
			SetData(_data);
			SetDefaultSrc(_arr[0]);
		}
		set s_apply
		{
			void OnPressed()
			{
				window.find("UIController").LoadUI("UI_INVITETOFAMILY");
			}
		}
	}


	//=================DBList=====================
	var s_FamilyPeopleList_Content_All = new VFamilyPeopleList_Content_All_Logic
	{
		SetSize("405,190");//bgcolor = "#ff";
		SetPos("185,50");
		name = "VFamilyPeopleList_Content_All_Logic_NAME";
		window.find("G_DBMANAGE").RegDbTable(this,window.GAMEUI,window.JIVECONSORTIA,"Bind_VFamilyPeopleList_Content_All_Logic");// 绑定数据表
		var _SQL = "SELECT * FROM "+window.JIVECONSORTIA+" WHERE "+window.GAMEUI_JIVECONSORTIA_CONSORTIAID_STR+"="+window.GetFamilyIDByName()+" AND "+window.GAMEUI_JIVECONSORTIA_STATE_STR+">0 ORDER BY "+window.GAMEUI_JIVECONSORTIA_POINT_STR+" DESC";
		window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VFamilyPeopleList_Content_All_Logic",window.GAMEUI,_SQL);
		void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);} //移除绑定

		//[功能]刷新家族成员列表
		//[参数]data：排行方式
		//[返回值]无
		void Reflash(data)
		{
			var _SQL = "SELECT * FROM "+window.JIVECONSORTIA+" WHERE "+window.GAMEUI_JIVECONSORTIA_CONSORTIAID_STR+"="+window.GetFamilyIDByName()+" AND "+window.GAMEUI_JIVECONSORTIA_STATE_STR+">0 ORDER BY "+data+" DESC";
			window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VFamilyPeopleList_Content_All_Logic",window.GAMEUI,_SQL);		
		}
	}
	//==================================================
	//[功能]设置在线人数
	void SetOnlinePeopleNum()
	{
		var m_TotalPeopleNum= window.GetFamilyPeopleNum();
		var _VNet2DBTable = new VNet2DBTable
		{
			var _SQL = "SELECT * FROM "+window.JIVECONSORTIA+" WHERE "+window.GAMEUI_JIVECONSORTIA_STATE_STR+"=1 AND "+window.GAMEUI_JIVECONSORTIA_ONLINE_STR+"="+window.FAMILY_PEOPLE_ONLINE+" AND "+window.GAMEUI_JIVECONSORTIA_CONSORTIAID_STR+"="+window.GetFamilyIDByName();
			Select(window.GAMEUI,_SQL);
		}
		var  m_onlinePeopleNum = _VNet2DBTable.GetSize();
		_VNet2DBTable.del();
		SetOnlineNum(m_onlinePeopleNum,m_TotalPeopleNum);
	}
	//[功能]填充数据
	//[参数]无
	//[返回值]无
	void SetFamilyHallContent()
	{
		if(window.GetFamilyPotence() == window.FAMILY_POTENCE_NORMAL)
		{
			s_apply.show = false;
		}
		else
		{
			s_apply.show = true;
		}
		SetFamilyInfo(window.GetFamilyName(),window.GetFamilySlogan());
		var _badgeData = window.GetFamilyBadgeData();
		var _parserBadgeData = window.parserBadgeData(_badgeData);
		var _arrBadgeData = window.Splitstr2(_parserBadgeData,",");
		SetFamilyBadge(_arrBadgeData[0],_arrBadgeData[1],_arrBadgeData[2],_arrBadgeData[3],_arrBadgeData[4],_arrBadgeData[5]);
		SetFamilyAffiche(window.GetFamilyAffiche());
		var _potence = 0;
		if(window.GetFamilyPotence() == window.FAMILY_POTENCE_HEADER)
		{
			_potence = window.FAMILY_POTENCE_HEADER_STR;
		}
		else if(window.GetFamilyPotence() == window.FAMILY_POTENCE_ASSISTANT)
		{
			_potence = window.FAMILY_POTENCE_ASSISTANT_STR;
		}
		else
		{
			_potence = window.FAMILY_POTENCE_NORMAL_STR;
		}
		SetMyInfo(_potence,window.GetFamilyPoint(),m_SortIndex);
		s_FamilyPeopleList_Content_All.Reflash(m_SelectName);
	}
	

	
	Init();
	SetEvent();
	SetFamilyHallContent();
	
}