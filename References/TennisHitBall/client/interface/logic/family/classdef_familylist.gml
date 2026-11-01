//家族列表
//夏洋洋 2010-3-4

importex("$./../../UI/Family/ClassDef_FamilyList.gml");
importex("$./ClassDef_FamilyList_Content.gml");

class VFamilyList_Logic item
{
	var m_searchKey = 0;	//搜索方式：族长名称；家族名称
	var m_selectRowID = 0;	//当前选中的家族ID
	//===================
	void Init()
	{
		//族长名称 Radio
		staticvar s_R_HeaderName = new VRadio_Single_New_UI 
		{}
		staticvar s_Text_HeaderName = new BaseText
		{}
		//家族名称 Radio
		staticvar s_R_FamilyName = new VRadio_Single_New_UI 
		{}
		staticvar s_Text_FamilyName = new BaseText
		{}
		//查找
		staticvar s_EditBk_SearchContent = new VPic9_EditBK_UI
		{}
		staticvar s_Edit_SearchContent = new BaseEdit
		{}
		staticvar s_Btn_Search = new VBTN_43_New
		{}
		//刷新列表
		staticvar s_Btn_Flash = new VBTN_43_New
		{}
		//家族列表标志条
		staticvar s_FamilyListFlag = new VPic3_GreyTop_UI
		{}
		//查看信息
		staticvar s_Btn_LookupInfo = new VBTN_A_New
		{}
		//申请加入
		staticvar s_Btn_ApplyForFamily = new VBTN_A_New
		{}
	}
	inclass("VFamilyList_UI");
	//===================================
	void SetEvent()
	{
		set s_R_HeaderName
		{
			groupname = "VFamilyList_SearchKey";
			void OnCheck()
			{
				MouseCheck();
				parent.m_searchKey = window.GAMEUI_JIVECONSORTIAINISYN_USERNICK_STR;
			}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_R_FamilyName
		{
			groupname = "VFamilyList_SearchKey";startstate="1";
			void OnCheck()
			{
				MouseCheck();
				parent.m_searchKey = window.GAMEUI_JIVECONSORTIAINISYN_NAME_STR;
			}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_Btn_Search
		{
			void OnPressed()
			{
				var _searchContent = parent.s_Edit_SearchContent.GetSearchContent();
				if(_searchContent == "")
				{
					return;
				}
				parent.s_FamilyListConten.Reflash(parent.m_searchKey,_searchContent);
			}
		}
		//查看信息
		set s_Btn_LookupInfo
		{
			void OnPressed()
			{
				if(GetState() == window.BTN_STATE_LIGHT)
				{
					window.find("UIController").LoadUI("UI_LOOKUPFAMILYINFO");
					window.find("LOOKUPFAMILYINFO_LOGIC")._LookupFamilyInfo.SetFamilyInfo(parent.m_selectRowID);
				}		
			}
		}
		//申请加入
		set s_Btn_ApplyForFamily
		{
			void OnPressed()
			{
				if(GetState() == window.BTN_STATE_LIGHT)
				{
					window.F_Family_Apply(parent.m_selectRowID);
				}
			}
		}
		//刷新
		set s_Btn_Flash
		{
			void OnPressed()
			{
				window.F_Family_Getallteam();
				parent.FamilyListFlash();
			}
		}
	}
	Init();
	SetEvent();
	//=========================DBList=====================================
	var s_FamilyListConten = new VFamilyList_Content_All_Logic
	{
		SetSize("100%,75%");//bgcolor = "#ff";
		SetPos("0,50");
		name = "VFamilyList_Content_All_Logic_NAME";
		
		window.find("G_DBMANAGE").RegDbTable(this,window.GAMEUI,window.JIVECONSORTIAINISYN,"Bind_VFamilyList_Content_All_Logic");// 绑定数据表
		var _SQL = "SELECT * FROM "+window.JIVECONSORTIAINISYN+" WHERE "+window.GAMEUI_JIVECONSORTIAINISYN_STATE_STR+">0"+" ORDER BY "+window.GAMEUI_JIVECONSORTIAINISYN_SORT_STR+" DESC";
		window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VFamilyList_Content_All_Logic",window.GAMEUI,_SQL);
		checkselect(10,10);
		void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);} //移除绑定
		//[功能]刷新家族列表
		//[参数]data1：搜索字段；data2：搜索内容
		//[返回值]无
		void Reflash(data1,data2)
		{
			if(data2 == "")
			{
				ShowAll();
				return;
			}
			var _SQL = "SELECT * FROM "+window.JIVECONSORTIAINISYN+" WHERE "+window.GAMEUI_JIVECONSORTIAINISYN_STATE_STR+">0 AND "+data1+"="+data2+" ORDER BY "+window.GAMEUI_JIVECONSORTIAINISYN_CURRLV_STR+" DESC";
			window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VFamilyList_Content_All_Logic",window.GAMEUI,_SQL);
			checkselect(10,10);
		}
		//[功能]刷新家族列表
		//[参数]无
		//[返回值]无
		void ShowAll()
		{
			var _SQL = "SELECT * FROM "+window.JIVECONSORTIAINISYN+" WHERE "+window.GAMEUI_JIVECONSORTIAINISYN_STATE_STR+">0"+" ORDER BY "+window.GAMEUI_JIVECONSORTIAINISYN_SORT_STR+" DESC";
			window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VFamilyList_Content_All_Logic",window.GAMEUI,_SQL);
			checkselect(10,10);
		}
	}
	//============================================================
	//[功能]记录当前选择的家族
	//[参数]_selectRowID：选择的家族信息
	//[返回值]无
	void SaveSelectFamily(_selectRowID)
	{
		m_selectRowID = _selectRowID;
	}
	//[功能]列表所有内容
	//[参数]无
	//[返回值]无
	void FamilyListFlash()
	{
		s_FamilyListConten.ShowAll();
	}

	//[功能]设置按键状态
	void SetBtnState(_state)
	{
		if(_state)
		{
			s_Btn_LookupInfo.SetState(window.BTN_STATE_LIGHT);
			s_Btn_ApplyForFamily.SetState(window.BTN_STATE_LIGHT);
		}
		else
		{
			s_Btn_LookupInfo.SetState(window.BTN_STATE_GREY);
			s_Btn_ApplyForFamily.SetState(window.BTN_STATE_GREY);
		}
	}
}