//大厅-明星榜-情侣排行榜 类定义（逻辑）
//yxf 2010年9月27日

importex("$./../../UI/TopStar/ClassDef_Lover.gml");
importex("$./ClassDef_Lover_DBList.gml");

//总排行-总场次			1	TS_A_AllBout
//总排行-胜利场次		2	TS_A_WinNum
//总排行-总得分			3	TS_A_AllScore
//总排行-一击得分总数	4	TS_A_ACE
//总排行-技能总数		5	TS_A_SkillNum
//总排行-满蓄力次数		6	TS_A_FullStore

class VTopStar_Lover_Logic item
{
	name="order_VTopStar_Lover_Logic";
	size = "100%,420";pos(0,30);bgcolor = "#FF00FF";alpha = 50;enableUpdate(1);
	
	var m_Num = 9;	//显示条目
	var m_TypeID = 100;	//Combox的排序方式
	var m_Index = 0	;	//排名的方式 - 给显示用
	var m_IndexSrch = 2;	// 默认搜索方式是"家族名称", 1是族长名称
	var idx = window.g_OrderList_Lover_Index_DataId;		// 搜索的数据库
	var _MaxPages = 1;	// 最大页数
	var _Type = 1; // 1：读 2：搜索
	var _Src = "";	 // 保存搜索内容
	//=============================与界面交互========================================
	void Init()
	{
		//排名方式
		//LISTBOX
		staticvar s_CB_Type = new VMyComboBox 
		{
			m_sizeX = 98;halign(100,0);
		}
		//翻页：爱情指数
		staticvar s_PageCtrl_1 = new VMyPageCtrl{valign(100,0);halign(50,0);}	
	}
	inclass("VTopStar_Lover_UI");
	//==============================function=========================================
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
		//alert("type:"+ _Type + " page:"+_page + " MaxPgaes:"+_MaxPages + " idx:" + idx);
		if (_page <= 0 || _page == "" || _page > toint(_MaxPages))
		{
			window.find("UIController").LoadDLG(390);//无效的页数
			return;
		}
		//  读
		if (toint(_Type) == 1)
		{
			window._OrderDataGetter.Read(idx, _page-1);
		}
		// 搜索
		if (toint(_Type) == 2)
		{
			window._OrderDataGetter.Search(idx,window.TOPSTAR_TS_A_LOVER_NKNAME,_Src, _page-1);	 // 搜索数据
		}
//		s_PageCtrl.setpageto(_page);
	}
	//设置响应事件
	void SetEvent()
	{
		// 段晓彤新加 搜索按钮
		//set s_Btn_Search
		//{
			//void OnPressed()
			//{
				//parent._Src = parent.s_Edit_SearchContent.GetSrc();
				//if (parent._Src == "")
				//{
					//return;
				//}
				//parent.s_Srch.show = true;	// 显示结果提示字
				//parent.s_Btn_Back.show = true;	// 返回按钮
				////window.find("VTopStar_Self_UI_NAME").s_R_All.show = false;	// 总排行提示字
				//parent.s_TXT_Type.show = false;	// 排名方式提示字
				//parent.s_CB_Type.show = false;	// 排名方式list
				////window.find("VTopStar_List_Logic_1").SpecialDelAll(1);	 // 删除记录
				//// 根据搜索方案不同, 执行不同的搜索方式(暂时保留 以后修改)
				//switch(toint(parent.m_IndexSrch ))
				//{
					//case 0:	//爱情指数
					//{
						//window.find("Bind_VTopStar_Lover_List_Logic_1").SpecialDelAll2(1);	 // 删除记录
						////parent.idx = window.g_OrderList_AllBout_DataId;
						//break;
					//}
				//}
				//window._OrderDataGetter.Search(parent.idx,window.TOPSTAR_TS_A_LOVER_NKNAME,parent._Src, 0);	 // 搜索数据
			//}
		//}
		// 段晓彤添加 返回按钮
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
		//// 段晓彤添加, 选择搜索方式
		//set s_CB_Type
		//{
			////接口函数 WhichSelect:
			////参数：
			//void WhichSelect(index)
			//{
				//parent.m_IndexSrch = index;
				//parent.ChangeType(toint(index)+1);
				//parent.s_tital.SetData(toint(index)+parent.m_TypeID);
			//}
			
			//void GetOffSetX()
			//{
				//return parent.parent.parent.left + parent.parent.left + parent.left;
			//}
			//void GetOffSetY()
			//{
				//return parent.parent.parent.top + parent.parent.top + parent.top;
			//}
			
			//SetID(toint(window.POS_TOPSTAR)+parent.m_TypeID);
			//SetPos(460, 80);
			//SetWidthAndType(148,0);
			//SetData("爱情指数");
			//SetDefaultSrc("爱情指数");
			//parent.s_tital.SetData(parent.m_TypeID);//设置标题 
		//}
		// 段晓彤修改
		set s_Btn_Go
		{
			void OnPressed(){parent.OnClick_Go();}
		}

		set s_PageCtrl_1//翻页：总排行-总场次
		{
			void GetPageData(currpage)
			{
				if (toint(parent._Type) == 1)
				{
					window._OrderDataGetter.Read(window.g_OrderList_Lover_Index_DataId, currpage-1);
				}
				if (toint(parent._Type) == 2)
				{
					window._OrderDataGetter.Search(window.g_OrderList_Lover_Index_DataId,window.TOPSTAR_TS_A_LOVER_NKNAME,parent._Src, currpage-1);	 // 搜索数据
				}
			}
		}
	}
	Init();
	//重新排名
	//参数 type:排名的方式(1-6)
	void ReSelect(type,updown)
	{
		var _ListName = "";		//List的名字
		var _tbName = "";		//表名
		var _BindName = "";		//List绑定的表名

		switch (type)
		{
			case 1:
			{
				_tbName = window.TS_A_LOVER;_BindName = "Bind_VTopStar_Lover_List_Logic_1";
				_ListName = "VTopStar_Lover_List_Logic_1";break;
			}
		}
		if (_tbName != "" && _BindName != "")
		{
			var _SQL = "SELECT * FROM "+_tbName+" ORDER BY currindex ASC";	
			printf("B# 情侣榜——SQL："+_SQL);
			window.find("G_DBMANAGE").SelectByRegDbTable(_BindName,window.TOPSTAR,_SQL);
		}
	}
	//================================DBList=========================================
	//爱情指数		1	TS_A_AllBout
	var _TopStarList_1 = new VTopStar_Lover_List_Logic
	{
		name = "VTopStar_Lover_List_Logic_1";
		_pagenum = window.g_OrderList_Lover_Index_PageNum;
		window.find("G_DBMANAGE").RegDbTable(this,window.TOPSTAR,window.TS_A_LOVER,"Bind_VTopStar_Lover_List_Logic_1");// 绑定数据表
		void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);} //移除绑定
		void PageviewEnd() // 翻页结束后调用
		{
			//printf("B# 排行榜-总排行-胜利场次，PageviewEnd\n");
		}
	}
	//======================end of List ===========================================
	SetEvent();//必须先有list再有翻页的事件-否则会不显示页数
	ChangeType(1);
	
	//var _pageshownum = 9;
	void SetPage(id, curpage, maxpage, same, type)
	{
		if (toint(maxpage) == 0)
		{
			_MaxPages = 1;
			//window.find("UIController").LoadDLG(685);	//  没有搜索到任何结果
		}
		else
		{
			_MaxPages = maxpage;
		}
		_Type = type;
		printf("LoverTop:: id:"+id+" curpage:"+curpage+" _MaxPages:"+_MaxPages+" same:"+same+" type:"+type);
		if(toint(id)==window.g_OrderList_Lover_Index_DataId)
		{
			// 段晓彤修改
			s_PageCtrl_1.OnPageExchange2(1+curpage, _MaxPages);
			_TopStarList_1.SpecialDelAll(1);
			_TopStarList_1.curpage = 1+curpage;
			_TopStarList_1.scriptprcallsub("SetPage");
			if(1==same)
			{
				window._OrderDataGetter.RefreshData(window.TOPSTAR, "SELECT * FROM "+window.TS_A_LOVER+" ORDER BY currindex ASC",  curpage, window.g_OrderList_Lover_Index_PageNum, window.TOPSTAR_TS_A_LOVER_CURRINDEX);
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
		switch (m_Index)
		{
			case 1:
			{
				//alert("self m_Index:"+m_Index+" currpage:"+s_PageCtrl_1.m_CurrPage);
				window._OrderDataGetter.Read(window.g_OrderList_Lover_Index_DataId, s_PageCtrl_1.m_CurrPage-1);
				break;
			}
		}
	}

	void ClearData(_curpage)
	{
		var _VNet2DBRow = new VNet2DBRow{}
		var _index = toint(_curpage)*5+1;
		var _lastIndex  = (toint(_curpage)+1)*5;
		var _table;
		switch(m_Index)
		{
			case 1:
			{
				_table = window.TS_A_LOVER;
				break;
			}
		}
		printf("C# LoverTop-ClearData：_table:"+_table+",_curpage："+_curpage+",_index:"+_index+",_lastIndex:"+_lastIndex);
		while(_index<=_lastIndex)
		{
			_VNet2DBRow.InitByInt(window.TOPSTAR,_table,window.TOPSTAR_TS_A_LOVER_CURRINDEX,_index);
			if(_VNet2DBRow.IsReady())
			{
				_VNet2DBRow.SetInt(window.TOPSTAR_TS_A_LOVER_USERID,-1000);
				_VNet2DBRow.UpdateEnd();
			}
			_VNet2DBRow.Release();
			_index += 1;
		}
		_VNet2DBRow.del();
	}
};