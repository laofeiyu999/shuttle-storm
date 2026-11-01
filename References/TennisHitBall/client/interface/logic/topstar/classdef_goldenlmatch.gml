//黄金联赛榜 
//武文博 2010.8.31
importex("$./../../UI/TopStar/ClassDef_GoldenLMatch.gml");
importex("$./ClassDef_GoldenLMatch_DBList.gml");

class VTopStar_GoldenLMatch_Logic item
{    
	name="order_VTopStar_GoldenLMatch_Logic";
	size = "100%,460";pos(0,30);bgcolor = "#FFFF";alpha = 50;
	var m_TypeIndex = 0;	//类型 1本赛季，2总排行
	var m_rowID = 0;	//当前选中行
	
	var _myRank = "- -";
	var _myFamilyName = "";
	var _myLevel = "";
	var _myPeopleNum = "";
	var _MaxPages = 1;	// 最大页数
	var _Type = 1; // 1：读 2：搜索
	var _Src = "";	 // 保存搜索的内容
	var __ConfInVic = "";  //胜率

	void Init()
	{
		//翻页
		staticvar s_GoldenLMatch_PageCtrl = new VPageCtrl_Base_UI_UserDef{valign(100,0);halign(50,0);}
		//献花
		staticvar s_Btn_PresentFlower =new item{};
	}
	inclass("VTopStar_GoldenLMatch_UI");
	Init ();
//==============================function=========================================
	//点击了Go
	void OnClick_Go()
	{
		var _page = toint(s_Edit_Page.src);
		if (_page <= 0 || _page == "" || _page > toint(_MaxPages))
		{
			window.find("UIController").LoadDLG(390);//无效的页数
			return;
		}
		//alert("page: " + _page + " Type: " + _Type);
		//  读
		if (toint(_Type) == 1)
		{
			window._OrderDataGetter.Read(window.g_OrderList_GoldenLMatch_DataId, _page-1);
		}
		// 搜索
		if (toint(_Type) == 2)
		{
			window._OrderDataGetter.Search(window.g_OrderList_GoldenLMatch_DataId,window.TOPSTAR_TS_A_GOLDNUM_NKNAME,_Src, _page-1);	 // 搜索数据
		}
//		s_PageCtrl.setpageto(_page);
	}

	//设置响应事件
	void SetEvent()
	{
		//  点击了"搜索按钮"
		set s_Btn_Search
		{
			void OnPressed()
			{
				parent._Src = parent.s_Edit_SearchContent.GetSrc();
				if (parent._Src == "")
				{
					return	 ;
				}
				parent.s_Srch.show = true;	// 显示结果提示字
				parent.s_Btn_Back.show = true;	// 返回按钮
				window.find("VTopStar_GoldenLMatch_List_Logic_4").SpecialDelAll2(1); // 清楚记录
				window._OrderDataGetter.Search(window.g_OrderList_GoldenLMatch_DataId,window.TOPSTAR_TS_A_GOLDNUM_NKNAME,parent._Src , 0);	 // 搜索数据
			}
		}
		//  返回按钮
		set s_Btn_Back
		{
			void OnPressed()
			{
				parent.s_Srch.show = false;	// 显示结果提示字
				parent.s_Btn_Back.show = false;	// 返回按钮
				window._OrderDataGetter.Read(window.g_OrderList_GoldenLMatch_DataId, 0);
			}
		}
		set s_Btn_Go
		{
			void OnPressed(){parent.OnClick_Go();}
		}

		set s_GoldenLMatch_PageCtrl//翻页：总排行-总场次
		{
//			targetname="VTopStar_GoldenLMatch_List_Logic_4";
//			countperpage = 10;//window.FAVOR_TOPSTAR_SHOW_NUM;
//
//			window.find("G_DBMANAGE").GetRegDbTable(this,"Bind_VTopStar_GoldenLMatch_List_Logic_4");// 获得已绑定的数据表
			void GetPageData(currpage)
			{
				if (toint(parent._Type) == 1)
				{
					window._OrderDataGetter.Read(window.g_OrderList_GoldenLMatch_DataId, currpage-1);
				}
				if (toint(parent._Type) == 2)
				{
					window._OrderDataGetter.Search(window.g_OrderList_GoldenLMatch_DataId,window.TOPSTAR_TS_A_GOLDNUM_NKNAME,parent._Src, currpage-1);	 // 搜索数据
				}
			}
		}
		//单击献花
		set s_Btn_PresentFlower
		{
			void OnPressed()
			{
				if (GetState() == window.USER_STATE_REDAY)
				{
					var _RoleRow = parent._TopStarList_4.curselectrow();
					var _NkName = parent._TopStarList_4.fieldstr(_RoleRow,window.TOPSTAR_TS_A_GOLDNUM_NKNAME);

					if(window.GetMyName() != _NkName)
					{
						window.GamePresentFlower(_NkName);
					}
				}
			}
			this.SetState(window.BTN_STATE_GREY);
		}
	}

	Init();

	//重置按键状态
	void ReSetBtnState()
	{
		printf("xiayy:ReSetBtnState");
		s_Btn_PresentFlower.SetState(window.BTN_STATE_GREY);
	}

	//================================DBList=========================================
	//总排行-人气
	var _TopStarList_4 = new VTopStar_GoldenLMatch_List_Logic
	{
		name = "VTopStar_GoldenLMatch_List_Logic_4";
		_pagenum = window.g_OrderList_GoldenLMatch_PageNum;
		window.find("G_DBMANAGE").RegDbTable(this,window.TOPSTAR,window.TS_A_GOLDNUM,"Bind_VTopStar_GoldenLMatch_List_Logic_4");// 绑定数据表
		//通知服务器每页显示的行数
		//window.Too_GetSortData(1,-1);

		var _SQL = "SELECT * FROM "+window.TS_A_GOLDNUM+" WHERE "+window.TOPSTAR_TS_A_GOLDNUM_INDEX_STR+">=0 ORDER BY currindex ASC";
		printf("献花_SQL:"+_SQL);
		window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VTopStar_GoldenLMatch_List_Logic_4",window.TOPSTAR,_SQL);

		void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);} //移除绑定
		void PageviewEnd() // 翻页结束后调用
		{
			checkselect(-1,-1);
			parent.s_Btn_PresentFlower.SetState(window.BTN_STATE_GREY);
		}
	}

		void MySelect()
		{
			var _SQL = "SELECT * FROM "+window.TS_A_GOLDNUM+" WHERE "+window.TOPSTAR_TS_A_GOLDNUM_INDEX_STR+">=0 ORDER BY currindex ASC";
			printf("献花_SQL:"+_SQL);
			window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VTopStar_GoldenLMatch_List_Logic_4",window.TOPSTAR,_SQL);
//			parent.s_Btn_PresentFlower.SetState(window.BTN_STATE_GREY);
		}


	//======================end of List ===========================================
	SetEvent();//必须先有list再有翻页的事件-否则会不显示页数


	void OnCreated()
	{
		SetMyContent(window.GetMyName(),window.GetLVByUID(),window.GetRoleTypeByUID());
		MySelect();
		//window._OrderDataGetter.Read(window.g_OrderList_Favor_DataId, 0);
	}
	var _pageshownum = window.g_OrderList_GoldenLMatch_PageNum;    //g_OrderList_Favor_PageNum  Favor  JIVEFLOWER _TopStarList_1
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
		printf("golden:: id:"+id+" curpage:"+curpage+" maxpage:"+maxpage+" same:"+same+" type:"+type);
		if(toint(id)==window.g_OrderList_GoldenLMatch_DataId) 
		{
				s_GoldenLMatch_PageCtrl.OnPageExchange2(1+curpage, _MaxPages);
				_TopStarList_4.SpecialDelAll(1);
				_TopStarList_4.curpage = 1+curpage;
				_TopStarList_4.scriptprcallsub("SetPage");
				_TopStarList_4.scriptprcallsub("OnMyUnSelect");
				ReSetBtnState();
				if(1==same)
				{
					window._OrderDataGetter.RefreshData(window.TOPSTAR, "SELECT * FROM "+window.TS_A_GOLDNUM+" WHERE "+window.TOPSTAR_TS_A_GOLDNUM_INDEX_STR+">=0 ORDER BY currindex ASC", curpage, _pageshownum, window.TOPSTAR_TS_A_GOLDNUM_CURRINDEX);
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
		//alert(s_GoldenLMatch_PageCtrl.m_CurrPage-1);
		window._OrderDataGetter.Read(window.g_OrderList_GoldenLMatch_DataId,s_GoldenLMatch_PageCtrl.m_CurrPage-1);// s_GoldenLMatch_PageCtrl.m_CurrPage-1);
	}

	void ClearData(_curpage)
	{
		var _VNet2DBRow = new VNet2DBRow{}
		var _index = toint(_curpage)*10+1;
		var _lastIndex  = (toint(_curpage)+1)*10;
		printf("C# ClearData：_curpage："+_curpage+",_index:"+_index+",_lastIndex:"+_lastIndex);
		while(_index<=_lastIndex)
		{
			_VNet2DBRow.InitByInt(window.TOPSTAR,window.TS_A_GOLDNUM,TOPSTAR_TS_A_GOLDNUM_CURRINDEX,_index);
			if(_VNet2DBRow.IsReady())
			{
				_VNet2DBRow.SetInt(window.TOPSTAR_TS_A_GOLDNUM_INDEX,-1000);
				_VNet2DBRow.UpdateEnd();
			}
			_VNet2DBRow.Release();	
			_index += 1;
		}
		_VNet2DBRow.del();
	}
};

