//大厅-明星榜-家族 类定义
//yxf 2009年10月15日

importex("$./../../UI/TopStar/ClassDef_Family.gml");
importex("$./ClassDef_Family_DBList.gml");

class VTopStar_Family_Logic item
{
	name="order_VTopStar_Family_Logic";
	size = "100%,460";pos(0,30);bgcolor = "#FFFF";alpha = 50;
	var m_TypeIndex = 0;	//类型 1本赛季，2总排行
	var m_rowID = 0;	//当前选中行
	
	var _myRank = "- -";
	var _myFamilyName = "";
	var _myHeadName = "";
	var _myLevel = "";
	var _myFamilyPoint = "";
	var _myPeopleNum = "";
	var m_IndexSrch = 0;	// 0是家族名称, 1是族长名称
	var _MaxPages = 1;	// 最大页数
	var _Type = 1; // 1：读 2：搜索
	var _Src = "";	 // 保存搜索的内容

	void Init()
	{
		//家族排行榜标志横条
//		staticvar m_FamilyTopStarFlag = new VPic3_GreyTop_UI
//		{}
//		staticvar s_My_Data = new item
//		{
//			//排名
//			var _Rank = new BaseText
//			{}
//
//			//家族名称
//			var _FamilyName = new BaseText{}	
//			
//			//族长
//			var _HeadName = new BaseText{}
//
//			//等级
//			var _Level = new BaseText{}
//			
//			//积分
//			var _FamilyPoint = new BaseText
//			{}	
//
//			//人数
//			var _peopleNum = new BaseText
//			{}
//		}
		//翻页
		staticvar s_PageCtrl = new VPageCtrl_Base_UI{}
	}
	inclass("VTopStar_Family_UI");
	//================================================================================
	//点击了Go
	void OnClick_Go()
	{
		var _page = toint(s_Edit_Page.src);
		//alert("page:"+_page + " type:" + _Type + " m_IndexSrch:"+m_IndexSrch);
		if (_page <= 0 || _page == "" || _page > toint(_MaxPages))
		{
			window.find("UIController").LoadDLG(390);//无效的页数
			return;
		}
		//  读
		if (toint(_Type) == 1)
		{
			window._OrderDataGetter.Read(window.g_OrderList_Family_DataId, _page-1);
		}
		// 搜索
		if (toint(_Type) == 2)
		{
			switch(toint(m_IndexSrch))
			{
				case 0:		// 家族名称
				{
					window._OrderDataGetter.Search(window.g_OrderList_Family_DataId,window.GAMEUI_JIVECONSORTIAINISYN_NAME,_Src, _page-1);	 // 搜索数据
					break;
				}
				case 1:		// 族长名称
				{
					window._OrderDataGetter.Search(window.g_OrderList_Family_DataId,window.GAMEUI_JIVECONSORTIAINISYN_USERNICK,_Src, _page-1);	 // 搜索数据
					break;
				}
			}
		}
//		s_PageCtrl.setpageto(_page);
	}
	void SetEvent()
	{
		// 段晓彤新加 搜索按钮
		set s_Btn_Search
		{
			void OnPressed()
			{
				parent._Src = parent.s_Edit_SearchContent.GetSrc();
				if (parent._Src == "")
				{
					return;
				}
				parent.s_Srch.show = true;	// 显示结果提示字
				parent.s_Btn_Back.show = true;	// 返回按钮
				window.find("VTopStar_FamilyDBList_All_Logic_NAME").SpecialDelAll2(1); // 清楚记录
				switch(toint(parent.m_IndexSrch))
				{
					case 0:		// 家族名称
					{
						window._OrderDataGetter.Search(window.g_OrderList_Family_DataId,window.GAMEUI_JIVECONSORTIAINISYN_NAME,parent._Src, 0);	 // 搜索数据
						break;
					}
					case 1:		// 族长名称
					{
						window._OrderDataGetter.Search(window.g_OrderList_Family_DataId,window.GAMEUI_JIVECONSORTIAINISYN_USERNICK,parent._Src, 0);	 // 搜索数据
						break;
					}
				}
			}
		}
		// 段晓彤添加 返回按钮
		set s_Btn_Back
		{
			void OnPressed()
			{
				parent.s_Srch.show = false;	// 显示结果提示字
				parent.s_Btn_Back.show = false;	// 返回按钮
				window._OrderDataGetter.Read(window.g_OrderList_Family_DataId, 0);
			}
		}
		// 段晓彤添加 家族选择
		set s_CB_Family
		{
			void WhichSelect(index)
			{
				parent.m_IndexSrch = index;
			}
		}
		// 段晓彤修改
		set s_Btn_Go
		{
			void OnPressed(){parent.OnClick_Go();}
		}

		set s_PageCtrl
		{
			//targetname="VTopStar_FamilyDBList_All_Logic_NAME";
			//countperpage = 10;
			//window.find("G_DBMANAGE").GetRegDbTable(this,"Bind_VTopStar_FamilyDBList_All_Logic");// 获得已绑定的数据表
			void GetPageData(currpage)
			{
				if (toint(parent._Type) == 1)
				{
					window._OrderDataGetter.Read(window.g_OrderList_Family_DataId, currpage-1);
				}
				if (toint(parent._Type) == 2)
				{
					//alert("m_IndexSrch:"+parent.m_IndexSrch + " src:"+ parent._Src + " page: " + currpage);
					switch(toint(parent.m_IndexSrch))
					{
						case 0:		// 家族名称
						{
							window._OrderDataGetter.Search(window.g_OrderList_Family_DataId,window.GAMEUI_JIVECONSORTIAINISYN_NAME,parent._Src, currpage-1);	 // 搜索数据
							break;
						}
						case 1:		// 族长名称
						{
							window._OrderDataGetter.Search(window.g_OrderList_Family_DataId,window.GAMEUI_JIVECONSORTIAINISYN_USERNICK,parent._Src, currpage-1);	 // 搜索数据
							break;
						}
					}
					//window._OrderDataGetter.Search(window.g_OrderList_Family_DataId,window.GAMEUI_JIVECONSORTIAINISYN_USERNICK,parent._Src, currpage-1);	 // 搜索数据
				}
			}
		}
	}
	Init();
	
	//=================================DBList============================================
	var s_PageCtrl_FamilyList = new VTopStar_FamilyDBList_All_Logic
	{
		SetSize("94%,283");//bgcolor = "#ff";
		SetPos("24,115");
		name = "VTopStar_FamilyDBList_All_Logic_NAME";
		_pagenum = window.g_OrderList_Family_PageNum;
		
		window.find("G_DBMANAGE").RegDbTable(this,window.GAMEUI,window.JIVECONSORTIAINISYN,"Bind_VTopStar_FamilyDBList_All_Logic");// 绑定数据表
		//ReFlash();
		void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);} //移除绑定

		void ReFlash()
		{
			//var _SQL = "SELECT * FROM "+window.JIVECONSORTIAINISYN+" WHERE "+window.GAMEUI_JIVECONSORTIAINISYN_STATE_STR+">0 ORDER BY "+window.GAMEUI_JIVECONSORTIAINISYN_SORT_STR+" DESC";
			var _SQL = "SELECT * FROM "+window.JIVECONSORTIAINISYN+" WHERE "+window.GAMEUI_JIVECONSORTIAINISYN_ID_STR+">=0 ORDER BY currindex ASC";
			window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VTopStar_FamilyDBList_All_Logic",window.GAMEUI,_SQL);//alert(_SQL);
		}

		void OnCreated()
		{
			ReFlash();
		}
	}
	//==============================function=========================================
	void SaveSelectFamily(_rowId)
	{
		m_rowID=_rowId;
	}

//	// 家族榜中的"我的排名"
//	void SetMyData(_Rank,_FamilyName,_HeadName,_Level,_FamilyPoint,_PeopleNum)
//	{//printf("xiayy:SetMyData:_Rank:"+_Rank+",_FamilyName:"+_FamilyName+",_HeadName:"+_HeadName+",_Level:"+_Level+",_FamilyPoint:"+_FamilyPoint+",_PeopleNum:"+_PeopleNum);
//		s_My_Data._Rank.SetData(_Rank);
//		s_My_Data._FamilyName.SetData(_FamilyName);
//		s_My_Data._HeadName.SetData(_HeadName);
//		s_My_Data._Level.SetData(_Level);
//		s_My_Data._FamilyPoint.SetData(_FamilyPoint);
//		s_My_Data._peopleNum.SetData(_PeopleNum);
//	}
//	//初始化显示：所有都隐藏
//	void InitShow()
//	{
//		m_Class_All.show = false;
//		m_Class_Season.show = false;
//	}
//	//切换选项卡
//	//参数 type：类型 1本赛季，2总排行
//	void ChangeType(type)
//	{
//		m_TypeIndex = type;
//		InitShow();
//		switch (type)
//		{
//			case 1:{m_Class_Season.show = true;break;}
//			case 2:{m_Class_All.show = true;break;}
//		}
//	}
//	//设置响应事件
//	void SetEvent()
//	{
//		set s_R_Season
//		{
//			groupname="VTopStar_Group_Family";
//			void OnCheck()
//			{
//				if (GetChecked()){return;}
//				MouseCheck();
//				parent.ChangeType(1);
//			}
//			void OnUnCheck(){MouseUnCheck();}
//		}
//		set s_R_All
//		{
//			groupname="VTopStar_Group_Family";startstate="1";
//			void OnCheck()
//			{
//				if (GetChecked()){return;}
//				MouseCheck();
//				parent.ChangeType(2);
//			}
//			void OnUnCheck(){MouseUnCheck();}
//		}
//	}
//	//生成一些成员变量
//	void NewSubObj()
//	{
//		staticvar m_Class_Season = new VTopStar_Family_Season_Logic{}
//		staticvar m_Class_All = new VTopStar_Family_All_Logic{}
//	}
//	//重新排名
//	//参数 type:排名的方式(1-6)
//	void ReSelect(type)
//	{
//		if (type < 7)
//		{
//			m_Class_All.ReSelect(type);
//		}
//		else
//		{
//			m_Class_Season.ReSelect(type);
//		}
//	}
//	//================================DBList=========================================
	
	void OnCreated()
	{
		SetEvent();
//		s_My_Data._Rank.SetData(_myRank);
		_myFamilyName = window.GetFamilyName();
		if(_myFamilyName == -1)
		{
			_myFamilyName = "- -";
		}
//		s_My_Data._FamilyName.SetData(_myFamilyName);
		_myHeadName = window.GetFamilyHeadName();
		if(_myHeadName == -1)
		{
			_myHeadName = "- -";
		}
//		s_My_Data._HeadName.SetData(_myHeadName);
		_myLevel = window.GetFamilyLev();
		if(_myLevel == -1)
		{
			_myLevel = "- -";
		}
//		s_My_Data._Level.SetData(_myLevel);
		_myFamilyPoint = window.GetFamilyPoint();
		if(_myFamilyPoint == -1)
		{
			_myFamilyPoint = "- -";
		}
//		s_My_Data._FamilyPoint.SetData(_myFamilyPoint);
		_myPeopleNum = window.GetFamilyPeopleNum();
		if(_myPeopleNum == -1)
		{
			_myPeopleNum = "- -";
		}
//		s_My_Data._peopleNum.SetData(_myPeopleNum);
		
		
	}
	var _pageshownum = window.g_OrderList_Family_PageNum;
	void SetPage(id, curpage, maxpage, same, type)
	{
		if (toint(maxpage) == 0)
		{
			_MaxPages = 1;
			window.find("UIController").LoadDLG(685);	//  没有搜索到任何结果
		}
		else
		{
			_MaxPages = maxpage;
		}
		_Type = type;
		printf("family:: id:"+id+" curpage:"+curpage+" maxpage:"+maxpage+" same:"+same+" type:"+type);
		if(toint(id)==window.g_OrderList_Family_DataId)
		{
				s_PageCtrl.OnPageExchange2(1+curpage, _MaxPages);
				s_PageCtrl_FamilyList.SpecialDelAll(1);
				s_PageCtrl_FamilyList.curpage = 1+curpage;
				s_PageCtrl_FamilyList.scriptprcallsub("SetPage");
				if(1==same)
				{
					window._OrderDataGetter.RefreshData(window.GAMEUI, "SELECT * FROM "+window.JIVECONSORTIAINISYN+" WHERE "+window.GAMEUI_JIVECONSORTIAINISYN_ID_STR+">=0 ORDER BY currindex ASC", curpage, _pageshownum, window.GAMEUI_JIVECONSORTIAINISYN_CURRINDEX);
				}
				else
				{
					if(_Type ==1)
					{
						ClearData(curpage);
					}
				}
		}
	}
	void RefreshData()
	{
		//alert("fam cur:"+s_PageCtrl.m_CurrPage);
		window._OrderDataGetter.Read(window.g_OrderList_Family_DataId, s_PageCtrl.m_CurrPage-1);
	}

	void ClearData(_curpage)
	{
		var _VNet2DBRow = new VNet2DBRow{}
		var _index = toint(_curpage)*10+1;
		var _lastIndex  = (toint(_curpage)+1)*10;
		printf("C# ClearData：_curpage："+_curpage+",_index:"+_index+",_lastIndex:"+_lastIndex);
		while(_index<=_lastIndex)
		{
			_VNet2DBRow.InitByInt(window.GAMEUI,window.JIVECONSORTIAINISYN,window.GAMEUI_JIVECONSORTIAINISYN_CURRINDEX,_index);
			if(_VNet2DBRow.IsReady())
			{
				_VNet2DBRow.SetInt(window.GAMEUI_JIVECONSORTIAINISYN_ID,-1000);
				_VNet2DBRow.UpdateEnd();
			}
			_VNet2DBRow.Release();
			_index += 1;
		}
		_VNet2DBRow.del();
	}
};