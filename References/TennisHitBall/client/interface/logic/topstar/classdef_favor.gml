//大厅-明星榜-人气 类定义（逻辑）
//安峰册 2009-12-4

importex("$./../../UI/TopStar/ClassDef_Favor.gml");
importex("$./ClassDef_Favor_DBList.gml");


class VTopStar_Favor_Logic item
{
	name="order_VTopStar_Favor_Logic";
	size = "100%,420";pos(0,30);bgcolor = "#FF00FF";alpha = 50;enableUpdate(1);

	var _myFavorRank = "- -";
	var _myFavorName = "";
	var _myFavorLevel = "";
	var _myFavorTechnicType = "";
	var _myFavorPoint = "- -";
	var _MaxPages = 1;	// 最大页数
	var _Type = 1; // 1：读 2：搜索
	var _Src = "";	 // 保存搜索内容

	//=============================与界面交互========================================
	void Init()
	{

		//翻页：
		staticvar s_Favor_PageCtrl = new VMyPageCtrl{valign(100,0);halign(50,0);}
		//献花
		staticvar s_Btn_PresentFlower =new item{};

//		//我的排名-总排行
//		staticvar s_My_Data = new item
//		{
//			size="561,28";pos = "45,400";bgcolor = "#F0F0F0";
//			new VListBG2_UI{size="100%,27";}
//			//排名
//			//参数 data1:
//			var _Rank = new BaseText
//			{}
//
//			//昵称
//			//参数 data1:
//			var _Nickname = new BaseText{}	
//			
//			//等级
//			//参数 data1:
//			var _Level = new BaseText{ }
//			
//			//技术类型
//			//参数 data1:1网前力量型,2底线力量型 3网前技巧型 4底线技巧型
//			var _TechnicType = new BaseText
//			{}	
//
//			//人气
//			//参数 data1:
//			var _Point = new BaseText
//			{}
//		}
	}
	inclass("VTopStar_Favor_UI");
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
			window._OrderDataGetter.Read(window.g_OrderList_Favor_DataId, _page-1);
		}
		// 搜索
		if (toint(_Type) == 2)
		{
			window._OrderDataGetter.Search(window.g_OrderList_Favor_DataId,window.GAMEUI_JIVEFLOWER_NKNAME,_Src, _page-1);	 // 搜索数据
		}
//		s_PageCtrl.setpageto(_page);
	}

	//设置响应事件
	void SetEvent()
	{
		//  点击了"搜索按钮"(段晓彤新加)
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
				window.find("VTopStar_Favor_List_Logic_1").SpecialDelAll2(1); // 清楚记录
				window._OrderDataGetter.Search(window.g_OrderList_Favor_DataId,window.GAMEUI_JIVEFLOWER_NKNAME,parent._Src , 0);	 // 搜索数据
			}
		}
		// 段晓彤添加 返回按钮
		set s_Btn_Back
		{
			void OnPressed()
			{
				parent.s_Srch.show = false;	// 显示结果提示字
				parent.s_Btn_Back.show = false;	// 返回按钮
				window._OrderDataGetter.Read(window.g_OrderList_Favor_DataId, 0);
			}
		}
		// 段晓彤修改
		set s_Btn_Go
		{
			void OnPressed(){parent.OnClick_Go();}
		}

		set s_Favor_PageCtrl//翻页：总排行-总场次
		{
			//targetname="VTopStar_Favor_List_Logic_1";
			//countperpage = window.FAVOR_TOPSTAR_SHOW_NUM;

			//window.find("G_DBMANAGE").GetRegDbTable(this,"Bind_VTopStar_Favor_List_Logic_1");// 获得已绑定的数据表
			void GetPageData(currpage)
			{
				if (toint(parent._Type) == 1)
				{
					window._OrderDataGetter.Read(window.g_OrderList_Favor_DataId, currpage-1);
				}
				if (toint(parent._Type) == 2)
				{
					window._OrderDataGetter.Search(window.g_OrderList_Favor_DataId,window.GAMEUI_JIVEFLOWER_NKNAME,parent._Src, currpage-1);	 // 搜索数据
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
					var _RoleRow = parent._TopStarList_1.curselectrow();
					var _NkName = parent._TopStarList_1.fieldstr(_RoleRow,window.GAMEUI_JIVEFLOWER_NKNAME);

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
	var _TopStarList_1 = new VTopStar_Favor_List_Logic
	{
		name = "VTopStar_Favor_List_Logic_1";
		_pagenum = window.g_OrderList_Favor_PageNum;
		window.find("G_DBMANAGE").RegDbTable(this,window.GAMEUI,window.JIVEFLOWER,"Bind_VTopStar_Favor_List_Logic_1");// 绑定数据表
		//通知服务器每页显示的行数
		//window.Too_GetSortData(1,-1);

		var _SQL = "SELECT * FROM "+window.JIVEFLOWER+" WHERE "+window.GAMEUI_JIVEFLOWER_USERNAME_STR+">=0 ORDER BY currindex ASC";
		printf("献花_SQL:"+_SQL);
		window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VTopStar_Favor_List_Logic_1",window.GAMEUI,_SQL);

		void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);} //移除绑定
		void PageviewEnd() // 翻页结束后调用
		{
			checkselect(-1,-1);
			parent.s_Btn_PresentFlower.SetState(window.BTN_STATE_GREY);
		}

		void MySelect()
		{
			var _SQL = "SELECT * FROM "+window.JIVEFLOWER+" WHERE "+window.GAMEUI_JIVEFLOWER_USERNAME_STR+">=0 ORDER BY currindex ASC";
			printf("献花_SQL:"+_SQL);
			window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VTopStar_Favor_List_Logic_1",window.GAMEUI,_SQL);
//			parent.s_Btn_PresentFlower.SetState(window.BTN_STATE_GREY);
		}


		
	}


	//======================end of List ===========================================
	SetEvent();//必须先有list再有翻页的事件-否则会不显示页数

	// 我的排行
//	void SetMyContent(_FavorName,_FavorLevel,_FavorTechnicType)
//	{
//		var _FavorRank = window.GetMyFavorIndex();
//		if(_FavorRank == -1)
//		{
//			_FavorRank = "- -";
//		}
//		s_My_Data._Rank.SetData(_FavorRank);
//		s_My_Data._Nickname.SetData(_FavorName);
//		s_My_Data._Level.SetData(_FavorLevel);
//		s_My_Data._TechnicType.SetData(_FavorTechnicType);
//		var _FavorPoint = window.GetMyFavorPoint(_FavorName);
//		if(_FavorPoint == -1)
//		{
//			_FavorPoint = "- -";
//		}
//		s_My_Data._Point.SetData(_FavorPoint);
//	}

	void OnCreated()
	{
		SetMyContent(window.GetMyName(),window.GetLVByUID(),window.GetRoleTypeByUID());
		MySelect();
		//window._OrderDataGetter.Read(window.g_OrderList_Favor_DataId, 0);
	}
	var _pageshownum = window.g_OrderList_Favor_PageNum;
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
		printf("favor:: id:"+id+" curpage:"+curpage+" maxpage:"+maxpage+" same:"+same+" type:"+type);
		if(toint(id)==window.g_OrderList_Favor_DataId)
		{
				s_Favor_PageCtrl.OnPageExchange2(1+curpage, _MaxPages);
				_TopStarList_1.SpecialDelAll(1);
				_TopStarList_1.curpage = 1+curpage;
				_TopStarList_1.scriptprcallsub("SetPage");
				_TopStarList_1.scriptprcallsub("OnMyUnSelect");
				ReSetBtnState();
				if(1==same)
				{
					window._OrderDataGetter.RefreshData(window.GAMEUI, "SELECT * FROM "+window.JIVEFLOWER+" WHERE "+window.GAMEUI_JIVEFLOWER_USERNAME_STR+">=0 ORDER BY currindex ASC", curpage, _pageshownum, window.GAMEUI_JIVEFLOWER_CURRINDEX);
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
		//alert("favor cur:"+s_Favor_PageCtrl.m_CurrPage);
		window._OrderDataGetter.Read(window.g_OrderList_Favor_DataId, s_Favor_PageCtrl.m_CurrPage-1);
	}

	void ClearData(_curpage)
	{
		var _VNet2DBRow = new VNet2DBRow{}
		var _index = toint(_curpage)*10+1;
		var _lastIndex  = (toint(_curpage)+1)*10;
		printf("C# ClearData：_curpage："+_curpage+",_index:"+_index+",_lastIndex:"+_lastIndex);
		while(_index<=_lastIndex)
		{
			_VNet2DBRow.InitByInt(window.GAMEUI,window.JIVEFLOWER,window.GAMEUI_JIVEFLOWER_CURRINDEX,_index);
			if(_VNet2DBRow.IsReady())
			{
				_VNet2DBRow.SetInt(window.GAMEUI_JIVEFLOWER_USERNAME,-1000);
				_VNet2DBRow.UpdateEnd();
			}
			_VNet2DBRow.Release();
			_index += 1;
		}
		_VNet2DBRow.del();
	}
};