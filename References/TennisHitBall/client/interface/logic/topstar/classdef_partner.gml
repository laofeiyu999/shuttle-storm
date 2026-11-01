//大厅-明星榜-家族 类定义
//yxf 2009年10月15日

importex("$./../../UI/TopStar/ClassDef_Partner.gml");
importex("$./ClassDef_Partner_DBList.gml");

class VTopStar_Partner_Logic item
{
	name="order_VTopStar_Partner_Logic";
	size = "100%,460";pos(0,30);bgcolor = "#FFFF";alpha = 50;

	var m_Num = 9;	//显示条目
	var m_TypeID = 100;	//Combox的排序方式
	var m_Index = 0	;	//排名的方式 - 给显示用
	var m_IndexSrch = 2;	// 默认搜索方式是"家族名称", 1是族长名称
	var idx = window.g_OrderList_Lover_Index_DataId;		// 搜索的数据库
	var _MaxPages = 1;	// 最大页数
	var _Type = 1; // 1：读 2：搜索
	var _Src = "";	 // 保存搜索内容
	void Init()
	{
		//翻页
		staticvar s_PageCtrl = new VPageCtrl_Base_UI{}
	}
	inclass("VTopStar_Partner_UI");
	//================================================================================
	//初始化显示
	void InitShow(param)
	{
		s_PageCtrl_1.show = param;
		_TopStarList_1.show = param;
	}

	//在不同排名方式之间切换
	void ChangeType(index)
	{
		m_Index = index;
		InitShow(false);
		switch (index)
		{
			case 1:
			{
				idx = window.g_OrderList_Lover_Index_DataId;
				_TopStarList_1.show = true;s_PageCtrl_1.show = true;break;
			}
		}
		RefreshData();
		ReSelect(index,0);//2009年12月30日
		OnChangeTypeUI(index);
	}
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
			window._OrderDataGetter.Read(window.g_OrderList_Partner_Index_DataId, _page-1);
		}
		// 搜索
		if (toint(_Type) == 2)
		{
			window._OrderDataGetter.Search(window.g_OrderList_Partner_Index_DataId,window.TOPSTAR_TS_A_PARTNER_NKNAME,_Src, _page-1);	 // 搜索数据
		}
	}
	void SetEvent()
	{
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
//				parent.s_TXT_Type.show = false;	// 排名方式提示字
//				parent.s_CB_Type.show = false;	// 排名方式list
				window.find("VTopStar_Favor_List_Logic_1").SpecialDelAll2(1); // 清楚记录
				window._OrderDataGetter.Search(window.g_OrderList_Partner_Index_DataId,window.TOPSTAR_TS_A_PARTNER_NKNAME,parent._Src , 0);	 // 搜索数据
			}
		}

		set s_Btn_Back
		{
			void OnPressed()
			{
				parent.s_Srch.show = false;	// 显示结果提示字
				parent.s_Btn_Back.show = false;	// 返回按钮
				//window.find("VTopStar_Self_UI_NAME").s_R_All.show = true;	// 总排行提示字
				parent.s_TXT_Type.show = true;	// 排名方式提示字
				parent.s_CB_Type.show = true;	// 排名方式list
				window._OrderDataGetter.Read(parent.idx , 0);
			}
		}
//		
//		set s_CB_Type
//		{
//			//接口函数 WhichSelect:
//			//参数：
//			void WhichSelect(index)
//			{
//				parent.m_IndexSrch = index;
//				parent.ChangeType(toint(index)+1);
//				parent.s_tital.SetData(toint(index)+parent.m_TypeID);
//			}
//			
//			void GetOffSetX()
//			{
//				return parent.parent.parent.left + parent.parent.left + parent.left;
//			}
//			void GetOffSetY()
//			{
//				return parent.parent.parent.top + parent.parent.top + parent.top;
//			}
//			
//			SetID(toint(window.POS_TOPSTAR)+parent.m_TypeID);
//			SetPos(460, 80);
//			SetWidthAndType(148,0);
//			SetData("爱情指数");
//			SetDefaultSrc("爱情指数");
//			parent.s_tital.SetData(parent.m_TypeID);//设置标题 
//		}

		// 段晓彤修改
		set s_Btn_Go
		{
			void OnPressed(){parent.OnClick_Go();}
		}

		set s_PageCtrl
		{
//			targetname="VTopStar_PartnerDBList_Logic_NAME";
//			countperpage = 7;
//			window.find("G_DBMANAGE").GetRegDbTable(this,"Bind_VTopStar_PartnerDBList_Logic");// 获得已绑定的数据表
//			void OnDelete()
//			{
//				window.find("G_DBMANAGE").RegDbTable(this,"Bind_VTopStar_PartnerDBList_Logic");// 删除已绑定的数据表
//			}
			void GetPageData(currpage)
			{
				if (toint(parent._Type) == 1)
				{
					window._OrderDataGetter.Read(window.g_OrderList_Partner_Index_DataId, currpage-1);
				}
				if (toint(parent._Type) == 2)
				{
					window._OrderDataGetter.Search(window.g_OrderList_Partner_Index_DataId,window.TOPSTAR_TS_A_PARTNER_NKNAME,parent._Src, currpage-1);	 // 搜索数据
				}
			}
		}
	}
	Init();

//	//重新排名
//	//参数 type:排名的方式(1-6)
//	void ReSelect(type,updown)
//	{
//		var _ListName = "";		//List的名字
//		var _tbName = "";		//表名
//		var _BindName = "";		//List绑定的表名
//
//		switch (type)
//		{
//			case 1:
//			{
//				_tbName = window.TS_A_LOVER;_BindName = "Bind_VTopStar_Lover_List_Logic_1";
//				_ListName = "VTopStar_Lover_List_Logic_1";break;
//			}
//		}
//		if (_tbName != "" && _BindName != "")
//		{
//			var _SQL = "SELECT * FROM "+_tbName+" ORDER BY currindex ASC";	
//			printf("B# 搭档榜——SQL："+_SQL);
//			window.find("G_DBMANAGE").SelectByRegDbTable(_BindName,window.TOPSTAR,_SQL);
//		}
//	}

	//=================================DBList============================================
	//搭档默契指数
	var s_PageCtrl_PartnerList = new VTopStar_PartnerDBList_All_Logic
	{
		name = "VTopStar_PartnerDBList_Logic_NAME";
		_pagenum = window.g_OrderList_Partner_Index_PageNum;
		window.find("G_DBMANAGE").RegDbTable(this,window.GAMEUI,window.TS_A_PARTNER,"Bind_VTopStar_PartnerDBList_Logic");// 绑定数据表
		void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);} //移除绑定

		void PageviewEnd() // 翻页结束后调用
		{
//			checkselect(-1,-1);
//			parent.s_Btn_PresentFlower.SetState(window.BTN_STATE_GREY);
		}
	}
	SetEvent();
	//==============================function=========================================

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
		printf("partner:: id:"+id+" curpage:"+curpage+" maxpage:"+maxpage+" same:"+same+" type:"+type);
		if(toint(id)==window.g_OrderList_Partner_Index_DataId) 
		{
			s_PageCtrl.OnPageExchange2(1+curpage, _MaxPages);
			s_PageCtrl_PartnerList.SpecialDelAll(1);
			s_PageCtrl_PartnerList.curpage = 1+curpage;
			if(1==same)
			{
				window._OrderDataGetter.RefreshData(window.TOPSTAR, "SELECT * FROM "+window.TS_A_PARTNER+" ORDER BY "+window.TOPSTAR_TS_A_PARTNER_LEVEL_STR+" ASC", curpage, _pageshownum, window.TOPSTAR_TS_A_PARTNER_CURRINDEX);
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
		window._OrderDataGetter.Read(window.g_OrderList_Partner_Index_DataId,s_PageCtrl.m_CurrPage-1);// s_GoldenLMatch_PageCtrl.m_CurrPage-1);
	}
	vvoid ClearData(_curpage)
	{
		var _VNet2DBRow = new VNet2DBRow{}
		var _index = toint(_curpage)*10+1;
		var _lastIndex  = (toint(_curpage)+1)*10;
		printf("C# ClearData：_curpage："+_curpage+",_index:"+_index+",_lastIndex:"+_lastIndex);
		while(_index<=_lastIndex)
		{
			_VNet2DBRow.InitByInt(window.TOPSTAR,window.TS_A_GOLDNUM,TOPSTAR_TS_A_PARTNER_CURRINDEX,_index);
			if(_VNet2DBRow.IsReady())
			{
				_VNet2DBRow.SetInt(window.TOPSTAR_TS_A_PARTNER_USERID,-1000);
				_VNet2DBRow.UpdateEnd();
			}
			_VNet2DBRow.Release();	
			_index += 1;
		}
		_VNet2DBRow.del();
	}

	void OnCreated()
	{
	}
};