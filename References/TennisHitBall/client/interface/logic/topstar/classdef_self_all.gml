//大厅-明星榜-个人-总排行 类定义（逻辑）
//yxf 2009年10月14日

importex("$./../../UI/TopStar/ClassDef_Self_All.gml");

//总排行-总场次			1	TS_A_AllBout
//总排行-胜利场次		2	TS_A_WinNum
//总排行-总得分			3	TS_A_AllScore
//总排行-一击得分总数	4	TS_A_ACE
//总排行-技能总数		5	TS_A_SkillNum
//总排行-满蓄力次数		6	TS_A_FullStore

class VTopStar_Self_All_Logic item
{
	name="order_VTopStar_Self_All_Logic";
	size = "100%,420";pos(0,30);bgcolor = "#FF00FF";alpha = 50;enableUpdate(1);
	
	var m_Num = 9;	//显示条目
	var m_TypeID = 2;	//Combox的排序方式
	var m_Index = 0	;	//排名的方式 - 给显示用
	var _iFinish_1 = false;	//排行方式2 是否已经同步过了
	var _iFinish_2 = false;	//排行方式3 是否已经同步过了
	var _iFinish_3 = false;	//排行方式4 是否已经同步过了
	var _iFinish_4 = false;	//排行方式5 是否已经同步过了
	var _iFinish_5 = false;	//排行方式6 是否已经同步过了
	var _iFinish_6 = false;	//排行方式7 是否已经同步过了
	var m_IndexSrch = 2;	// 默认搜索方式是"家族名称", 1是族长名称
	var idx = window.g_OrderList_AllScore_DataId;		// 搜索的数据库
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
		//翻页：总排行-总场次
		staticvar s_PageCtrl_1 = new VMyPageCtrl{valign(100,0);halign(50,0);}	
		//翻页：总排行-胜利场次
		staticvar s_PageCtrl_2 = new VMyPageCtrl{valign(100,0);halign(50,0);}	
		//翻页：总排行-总得分
		staticvar s_PageCtrl_3 = new VMyPageCtrl{valign(100,0);halign(50,0);}
		//翻页：总排行-一击得分总数
		staticvar s_PageCtrl_4 = new VMyPageCtrl{valign(100,0);halign(50,0);}
		//翻页：总排行-技能总数
		staticvar s_PageCtrl_5 = new VMyPageCtrl{valign(100,0);halign(50,0);}
		//翻页：总排行-满蓄力次数
		staticvar s_PageCtrl_6 = new VMyPageCtrl{valign(100,0);halign(50,0);}
	
//		//我的排名-总排行
//		staticvar s_My_Data_2 = new item
//		{
//			size = "415,37";pos = "300,650";bgcolor = "#F0F0F0";
//			//排名 参数 data1:
//			var _Rank = new VMyText{size = "80,37";color = "#FFFFFF";ycenter = true;xcenter = true;src = "1";}		
//			//昵称 参数 data1:
//			var _Nickname = new VMyText{pos = "80,0";size = "140,37";color = "#FFFFFF";ycenter = true;xcenter = true;src = "昵称";}	
//			//等级 参数 data1:
//			var _Level = new VMyText{pos = "220,0";size = "70,37";color = "#FFFFFF";xcenter = true;ycenter = true;src = "12";}
//			//得分 参数 data1:
//			var _Point = new VMyText{pos = "290,0";size = "125,37";color = "#FFFFFF";xcenter = true;ycenter = true;src = "100";}
//		}
	}
	inclass("VTopStar_Self_All_UI");
	//==============================function=========================================
	//初始化显示
	void InitShow(param)
	{
		s_PageCtrl_1.show = param;
		_TopStarList_1.show = param;
		s_PageCtrl_2.show = param;
		_TopStarList_2.show = param;
		s_PageCtrl_3.show = param;
		_TopStarList_3.show = param;
		s_PageCtrl_4.show = param;
		_TopStarList_4.show = param;
		s_PageCtrl_5.show = param;
		_TopStarList_5.show = param;
		s_PageCtrl_6.show = param;
		_TopStarList_6.show = param;
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
				idx = window.g_OrderList_AllBout_DataId;
				/*if (!_iFinish_1)
				{
					//明星榜-发消息：界面调用
					//参数 index：排名方式(1-6),长度-要几条记录（小于0表示所有数据）
					//默认是第1种排名方式
					window.Too_GetSortData(1,-1);_iFinish_1 = true;
				}*/
				_TopStarList_1.show = true;s_PageCtrl_1.show = true;break;
			}
			case 2:
			{
					idx  = window.g_OrderList_WinNum_DataId;
				//if (!_iFinish_2){window.Too_GetSortData(2,-1);_iFinish_2 = true;}
				_TopStarList_2.show = true;s_PageCtrl_2.show = true;break;
			}
			case 3:
			{
					idx  = window.g_OrderList_AllScore_DataId;
				//if (!_iFinish_3){window.Too_GetSortData(3,-1);_iFinish_3 = true;}
				_TopStarList_3.show = true;s_PageCtrl_3.show = true;break;
			}
			case 4:
			{
				idx  = window.g_OrderList_ACE_DataId;
				//if (!_iFinish_4){window.Too_GetSortData(4,-1);_iFinish_4 = true;}
				_TopStarList_4.show = true;s_PageCtrl_4.show = true;break;
			}
			case 5:
			{
				idx  = window.g_OrderList_SkillNum_DataId;
				//if (!_iFinish_5){window.Too_GetSortData(5,-1);_iFinish_5 = true;}
				_TopStarList_5.show = true;s_PageCtrl_5.show = true;break;
			}
			case 6:
			{
				idx  = window.g_OrderList_FullStore_DataId;
				//if (!_iFinish_6){window.Too_GetSortData(6,-1);_iFinish_6 = true;}
				_TopStarList_6.show = true;s_PageCtrl_6.show = true;break;
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
			window._OrderDataGetter.Search(idx,window.TOPSTAR_TS_A_ACE_NKNAME,_Src, _page-1);	 // 搜索数据
		}
//		s_PageCtrl.setpageto(_page);
	}
	//设置响应事件
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
					return	 ;
				}
				parent.s_Srch.show = true;	// 显示结果提示字
				parent.s_Btn_Back.show = true;	// 返回按钮
				window.find("VTopStar_Self_UI_NAME").s_R_All.show = false;	// 总排行提示字
				parent.s_TXT_Type.show = false;	// 排名方式提示字
				parent.s_CB_Type.show = false;	// 排名方式list
				//window.find("VTopStar_List_Logic_1").SpecialDelAll(1);	 // 删除记录
				// 根据搜索方案不同, 执行不同的搜索方式(暂时保留 以后修改)
				switch(toint(parent.m_IndexSrch ))
				{
					case 0:	//总场次
					{
						window.find("VTopStar_List_Logic_1").SpecialDelAll2(1);	 // 删除记录
						//parent.idx = window.g_OrderList_AllBout_DataId;
						break;
					}
					case 1:	//胜利场次
					{
						window.find("VTopStar_List_Logic_2").SpecialDelAll2(1);	 // 删除记录
						//parent.idx  = window.g_OrderList_WinNum_DataId;
						break;
					}
					case 2:	//总得分
					{
						window.find("VTopStar_List_Logic_3").SpecialDelAll2(1);	 // 删除记录
						//parent.idx  = window.g_OrderList_AllScore_DataId;
						break;
					}
					case 3:	//一击得分总数
					{
						window.find("VTopStar_List_Logic_4").SpecialDelAll2(1);	 // 删除记录
						//parent.idx  = window.g_OrderList_ACE_DataId;
						break;
					}
					case 4:	//技能总数
					{
						window.find("VTopStar_List_Logic_5").SpecialDelAll2(1);	 // 删除记录
						//parent.idx  = window.g_OrderList_SkillNum_DataId;
						break;
					}
					case 5:	//满蓄力次数
					{
						window.find("VTopStar_List_Logic_6").SpecialDelAll2(1);	 // 删除记录
						//parent.idx  = window.g_OrderList_FullStore_DataId;
						break;
					}
				}
				window._OrderDataGetter.Search(parent.idx,window.TOPSTAR_TS_A_ACE_NKNAME,parent._Src, 0);	 // 搜索数据
			}
		}
		// 段晓彤添加 返回按钮
		set s_Btn_Back
		{
			void OnPressed()
			{
				parent.s_Srch.show = false;	// 显示结果提示字
				parent.s_Btn_Back.show = false;	// 返回按钮
				window.find("VTopStar_Self_UI_NAME").s_R_All.show = true;	// 总排行提示字
				parent.s_TXT_Type.show = true;	// 排名方式提示字
				parent.s_CB_Type.show = true;	// 排名方式list
				window._OrderDataGetter.Read(parent.idx , 0);
			}
		}
		// 段晓彤添加, 选择搜索方式
		set s_CB_Type
		{
			//接口函数 WhichSelect:
			//参数：
			void WhichSelect(index)
			{
				parent.m_IndexSrch = index;
				parent.ChangeType(toint(index)+1);
				parent.s_tital.SetData(toint(index));
			}
			
			void GetOffSetX()
			{
				return parent.parent.parent.left + parent.parent.left + parent.left;
			}
			void GetOffSetY()
			{
				return parent.parent.parent.top + parent.parent.top + parent.top;
			}
			
			SetID(toint(window.POS_TOPSTAR)+parent.m_TypeID);
			SetPos(460, 80);
			SetWidthAndType(148,0);
			SetData("总场次,胜利场次,总得分,一击得分总数,技能总数,满蓄力次数");
			SetDefaultSrc("总得分");
			parent.s_tital.SetData(2);//设置标题 
		}
		// 段晓彤修改
		set s_Btn_Go
		{
			void OnPressed(){parent.OnClick_Go();}
		}

		set s_PageCtrl_1//翻页：总排行-总场次
		{
			//targetname="VTopStar_List_Logic_1";
			//countperpage = parent.m_Num;
			//window.find("G_DBMANAGE").GetRegDbTable(this,"Bind_VTopStar_List_Logic_1");// 获得已绑定的数据表
			void GetPageData(currpage)
			{
				if (toint(parent._Type) == 1)
				{
					window._OrderDataGetter.Read(window.g_OrderList_AllBout_DataId, currpage-1);
				}
				if (toint(parent._Type) == 2)
				{
					window._OrderDataGetter.Search(window.g_OrderList_AllBout_DataId,window.TOPSTAR_TS_A_ACE_NKNAME,parent._Src, currpage-1);	 // 搜索数据
				}
			}
		}
		set s_PageCtrl_2//翻页：总排行-胜利场次
		{
//			targetname="VTopStar_List_Logic_2";
//			countperpage = parent.m_Num;
//			window.find("G_DBMANAGE").GetRegDbTable(this,"Bind_VTopStar_List_Logic_2");// 获得已绑定的数据表
			void GetPageData(currpage)
			{
				if (toint(parent._Type) == 1)
				{
					window._OrderDataGetter.Read(window.g_OrderList_WinNum_DataId, currpage-1);
				}
				if (toint(parent._Type) == 2)
				{
					window._OrderDataGetter.Search(window.g_OrderList_WinNum_DataId,window.TOPSTAR_TS_A_ACE_NKNAME,parent._Src, currpage-1);	 // 搜索数据
				}
			}
		}
		set s_PageCtrl_3//翻页：总排行-总得分
		{
//			targetname="VTopStar_List_Logic_3";
//			countperpage = parent.m_Num;
//			window.find("G_DBMANAGE").GetRegDbTable(this,"Bind_VTopStar_List_Logic_3");// 获得已绑定的数据表
			void GetPageData(currpage)
			{
				if (toint(parent._Type) == 1)
				{
					window._OrderDataGetter.Read(window.g_OrderList_AllScore_DataId, currpage-1);
				}
				if (toint(parent._Type) == 2)
				{
					window._OrderDataGetter.Search(window.g_OrderList_AllScore_DataId,window.TOPSTAR_TS_A_ACE_NKNAME,parent._Src, currpage-1);	 // 搜索数据
				}
			}
		}
		set s_PageCtrl_4//翻页：总排行-一击得分总数
		{
//			targetname="VTopStar_List_Logic_4";
//			countperpage = parent.m_Num;
//			window.find("G_DBMANAGE").GetRegDbTable(this,"Bind_VTopStar_List_Logic_4");// 获得已绑定的数据表
			void GetPageData(currpage)
			{
				if (toint(parent._Type) == 1)
				{
					window._OrderDataGetter.Read(window.g_OrderList_ACE_DataId, currpage-1);
				}
				if (toint(parent._Type) == 2)
				{
					window._OrderDataGetter.Search(window.g_OrderList_ACE_DataId,window.TOPSTAR_TS_A_ACE_NKNAME,parent._Src, currpage-1);	 // 搜索数据
				}
			}
		}
		set s_PageCtrl_5//翻页：总排行-技能总数
		{
//			targetname="VTopStar_List_Logic_5";
//			countperpage = parent.m_Num;
//			window.find("G_DBMANAGE").GetRegDbTable(this,"Bind_VTopStar_List_Logic_5");// 获得已绑定的数据表
			void GetPageData(currpage)
			{
				if (toint(parent._Type) == 1)
				{
					window._OrderDataGetter.Read(window.g_OrderList_SkillNum_DataId, currpage-1);
				}
				if (toint(parent._Type) == 2)
				{
					window._OrderDataGetter.Search(window.g_OrderList_SkillNum_DataId,window.TOPSTAR_TS_A_ACE_NKNAME,parent._Src, currpage-1);	 // 搜索数据
				}
			}
		}
		set s_PageCtrl_6//翻页：总排行-满蓄力次数
		{
//			targetname="VTopStar_List_Logic_6";
//			countperpage = parent.m_Num;
//			window.find("G_DBMANAGE").GetRegDbTable(this,"Bind_VTopStar_List_Logic_6");// 获得已绑定的数据表
			void GetPageData(currpage)
			{
				if (toint(parent._Type) == 1)
				{
					window._OrderDataGetter.Read(window.g_OrderList_FullStore_DataId, currpage-1);
				}
				if (toint(parent._Type) == 2)
				{
					window._OrderDataGetter.Search(window.g_OrderList_FullStore_DataId,window.TOPSTAR_TS_A_ACE_NKNAME,parent._Src, currpage-1);	 // 搜索数据
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
				_tbName = window.TS_A_ALLBOUT;_BindName = "Bind_VTopStar_List_Logic_1";
				_ListName = "VTopStar_List_Logic_1";break;
			}
			case 2:
			{
				_tbName = window.TS_A_WINNUM;_BindName = "Bind_VTopStar_List_Logic_2";
				_ListName = "VTopStar_List_Logic_2";break;
			}
			case 3:
			{
				_tbName = window.TS_A_ALLSCORE;_BindName = "Bind_VTopStar_List_Logic_3";
				_ListName = "VTopStar_List_Logic_3";break;
			}
			case 4:
			{
				_tbName = window.TS_A_ACE;_BindName = "Bind_VTopStar_List_Logic_4";
				_ListName = "VTopStar_List_Logic_4";break;
			}
			case 5:
			{
				_tbName = window.TS_A_SKILLNUM;_BindName = "Bind_VTopStar_List_Logic_5";
				_ListName = "VTopStar_List_Logic_5";break;
			}
			case 6:
			{
				_tbName = window.TS_A_FULLSTORE;_BindName = "Bind_VTopStar_List_Logic_6";
				_ListName = "VTopStar_List_Logic_6";break;
			}
		}
		if (_tbName != "" && _BindName != "")
		{
			var _SQL = "SELECT * FROM "+_tbName+" ORDER BY currindex ASC";	
			printf("B# 明星榜——SQL："+_SQL);
			window.find("G_DBMANAGE").SelectByRegDbTable(_BindName,window.TOPSTAR,_SQL);
		}
		var _Temp = window.GetMyIndexInTopStar(_tbName);//自己的排名
		if (_Temp.__Long__ <= 0){_Temp = "--";}
		//更新自己的数据
//		s_My_Data_2._Rank.SetData(_Temp,"","");
//		s_My_Data_2._Point.SetData(window.GetTSDataByType(type),"","");
//		var _myLastRank = window.GetMyLastRank(_tbName);
//		if(_myLastRank <= 0)
//		{
//			s_My_Data_2._UpDown.SetData(-1);
//			return;
//		}
//		else
//		{
//			if(_Temp > _myLastRank)
//			{
//				s_My_Data_2._UpDown.SetData(1);
//				return;
//			}
//			if(_Temp == _myLastRank)
//			{
//				s_My_Data_2._UpDown.SetData(2);
//				return;
//			}
//			if(_Temp<_myLastRank)
//			{
//				s_My_Data_2._UpDown.SetData(3);
//				return;
//			}
//		}
		
	}
	//================================DBList=========================================
	//总排行-总场次		1	TS_A_AllBout
	var _TopStarList_1 = new VTopStar_List_Logic
	{
		name = "VTopStar_List_Logic_1";
		_pagenum = window.g_OrderList_AllBout_PageNum;
		window.find("G_DBMANAGE").RegDbTable(this,window.TOPSTAR,window.TS_A_ALLBOUT,"Bind_VTopStar_List_Logic_1");// 绑定数据表
		void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);} //移除绑定
		void PageviewEnd() // 翻页结束后调用
		{
			//printf("B# 排行榜-总排行-胜利场次，PageviewEnd\n");
		}
	}
	// 总排行-胜利场次		2	TS_A_WinNum
	var _TopStarList_2 = new VTopStar_List_Logic
	{
		name = "VTopStar_List_Logic_2";
		_pagenum = window.g_OrderList_WinNum_PageNum;
		window.find("G_DBMANAGE").RegDbTable(this,window.TOPSTAR,window.TS_A_WINNUM,"Bind_VTopStar_List_Logic_2");// 绑定数据表
		void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);} //移除绑定
		void PageviewEnd() // 翻页结束后调用
		{
			//printf("B# 排行榜-总排行-胜利场次，PageviewEnd\n");
		}
	}	
	// 总排行-总得分			3	TS_A_AllScore
	var _TopStarList_3 = new VTopStar_List_Logic
	{
		name = "VTopStar_List_Logic_3";
		_pagenum = window.g_OrderList_AllScore_PageNum;
		window.find("G_DBMANAGE").RegDbTable(this,window.TOPSTAR,window.TS_A_ALLSCORE,"Bind_VTopStar_List_Logic_3");// 绑定数据表
		void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);} //移除绑定
		void PageviewEnd() // 翻页结束后调用
		{
			//printf("B# 排行榜-总排行-总得分，PageviewEnd\n");
		}
	}	
	//总排行-一击得分总数		4	TS_A_ACE
	var _TopStarList_4 = new VTopStar_List_Logic
	{// SpecialDelAll(1);
		name = "VTopStar_List_Logic_4";
		_pagenum = window.g_OrderList_ACE_PageNum;
		window.find("G_DBMANAGE").RegDbTable(this,window.TOPSTAR,window.TS_A_ACE,"Bind_VTopStar_List_Logic_4");// 绑定数据表
		void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);} //移除绑定
		void ReFresh()
		{
			//var _SQL = "SELECT * FROM "+window.TS_A_ACE+" ORDER BY "+window.TOPSTAR_TS_A_ACE_TYPERES_STR+" DESC";
			var _SQL = "SELECT * FROM "+window.TS_A_ACE+" WHERE index>=0 ORDER BY currindex ASC";

			window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VTopStar_List_Logic_4",window.TOPSTAR,_SQL);
			//checkselect(10,10);
		}
		void OnCreated()
		{
			//ReFresh();
		}
		void PageviewEnd() // 翻页结束后调用
		{
			//printf("B# 排行榜-总排行-Ace球总数，PageviewEnd\n");
		}
	}
	//总排行-技能总数		5	TS_A_SkillNum
	var _TopStarList_5 = new VTopStar_List_Logic
	{
		name = "VTopStar_List_Logic_5";
		_pagenum = window.g_OrderList_SkillNum_PageNum;
		window.find("G_DBMANAGE").RegDbTable(this,window.TOPSTAR,window.TS_A_SKILLNUM,"Bind_VTopStar_List_Logic_5");// 绑定数据表
		void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);} //移除绑定
		void PageviewEnd() // 翻页结束后调用
		{
			//printf("B# 排行榜-总排行-技能得分数，PageviewEnd\n");
		}
	}
	//总排行-满蓄力次数		6	TS_A_FullStore
	var _TopStarList_6 = new VTopStar_List_Logic
	{
		name = "VTopStar_List_Logic_6";
		_pagenum = window.g_OrderList_FullStore_PageNum;
		window.find("G_DBMANAGE").RegDbTable(this,window.TOPSTAR,window.TS_A_FULLSTORE,"Bind_VTopStar_List_Logic_6");// 绑定数据表
		void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);} //移除绑定
		void PageviewEnd() // 翻页结束后调用
		{
			//printf("B# 排行榜-总排行-技能总数，PageviewEnd\n");
		}
	}
	
	//======================end of List ===========================================
	SetEvent();//必须先有list再有翻页的事件-否则会不显示页数
	ChangeType(3);
	//s_LB_Rank.WhichSelect(2);
	void OnCreated()
	{
//		s_My_Data_2._Nickname.SetData(window.GetMyName(),"","");
//		s_My_Data_2._Level.SetData(window.GetLVByUID(),"","");
//		s_My_Data_2._TechnicType.SetData(window.GetRoleTypeByUID(),"","");
	}
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
		printf("self_All:: id:"+id+" curpage:"+curpage+" _MaxPages:"+_MaxPages+" same:"+same+" type:"+type);
		if(toint(id)==window.g_OrderList_AllBout_DataId)
		{
			// 段晓彤修改
				s_PageCtrl_1.OnPageExchange2(1+curpage, _MaxPages);
				_TopStarList_1.SpecialDelAll(1);
				_TopStarList_1.curpage = 1+curpage;
				_TopStarList_1.scriptprcallsub("SetPage");
				if(1==same)
				{
					window._OrderDataGetter.RefreshData(window.TOPSTAR, "SELECT * FROM "+window.TS_A_ALLBOUT+" WHERE index>=0 ORDER BY currindex ASC", curpage, window.g_OrderList_AllBout_PageNum, 6);
				}
				else
				{
					if(_Type ==1)
					{
						ClearData(curpage);
					}
				}
		}
		if(toint(id)==window.g_OrderList_WinNum_DataId)
		{
			s_PageCtrl_2.OnPageExchange2(1+curpage, _MaxPages);
			_TopStarList_2.SpecialDelAll(1);
			_TopStarList_2.curpage = 1+curpage;
			_TopStarList_2.scriptprcallsub("SetPage");
			if(1==same)
			{
				window._OrderDataGetter.RefreshData(window.TOPSTAR, "SELECT * FROM "+window.TS_A_WINNUM+" WHERE index>=0 ORDER BY currindex ASC", curpage, window.g_OrderList_WinNum_PageNum, 6);
				
			}
			else
			{
				if(_Type ==1)
				{
					ClearData(curpage);
				}
			}
		}
		if(toint(id)==window.g_OrderList_AllScore_DataId)
		{
			s_PageCtrl_3.OnPageExchange2(1+curpage, _MaxPages);
			_TopStarList_3.SpecialDelAll(1);
			_TopStarList_3.curpage = 1+curpage;
			_TopStarList_3.scriptprcallsub("SetPage");
			if(1==same)
			{
				window._OrderDataGetter.RefreshData(window.TOPSTAR, "SELECT * FROM "+window.TS_A_ALLSCORE+" WHERE index>=0 ORDER BY currindex ASC", curpage, window.g_OrderList_AllScore_PageNum, 6);
			}
			else
			{
				if(_Type ==1)
				{
					ClearData(curpage);
				}
			}
		}
		if(toint(id)==window.g_OrderList_ACE_DataId)
		{
			s_PageCtrl_4.OnPageExchange2(1+curpage, _MaxPages);
			_TopStarList_4.SpecialDelAll(1);
			_TopStarList_4.curpage = 1+curpage;
			_TopStarList_4.scriptprcallsub("SetPage");
			if(1==same)
			{
				window._OrderDataGetter.RefreshData(window.TOPSTAR, "SELECT * FROM "+window.TS_A_ACE+" WHERE index>=0 ORDER BY currindex ASC", curpage, window.g_OrderList_ACE_PageNum, 6);

			}
			else
			{
				if(_Type ==1)
				{
					ClearData(curpage);
				}
			}
		}
		if(toint(id)==window.g_OrderList_SkillNum_DataId)
		{
			s_PageCtrl_5.OnPageExchange2(1+curpage, _MaxPages);
			_TopStarList_5.SpecialDelAll(1);
			_TopStarList_5.curpage = 1+curpage;
			_TopStarList_5.scriptprcallsub("SetPage");
			if(1==same)
			{
				window._OrderDataGetter.RefreshData(window.TOPSTAR, "SELECT * FROM "+window.TS_A_SKILLNUM+" WHERE index>=0 ORDER BY currindex ASC", curpage, window.g_OrderList_SkillNum_PageNum, 6);
			
			}
			else
			{
				if(_Type ==1)
				{
					ClearData(curpage);
				}
			}
		}
		if(toint(id)==window.g_OrderList_FullStore_DataId)
		{
			s_PageCtrl_6.OnPageExchange2(1+curpage, _MaxPages);
			_TopStarList_6.SpecialDelAll(1);
			_TopStarList_6.curpage = 1+curpage;
			_TopStarList_6.scriptprcallsub("SetPage");
			if(1==same)
			{
				window._OrderDataGetter.RefreshData(window.TOPSTAR, "SELECT * FROM "+window.TS_A_FULLSTORE+" WHERE index>=0 ORDER BY currindex ASC", curpage, window.g_OrderList_FullStore_PageNum, 6);
			
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
				window._OrderDataGetter.Read(window.g_OrderList_AllBout_DataId, s_PageCtrl_1.m_CurrPage-1);
				break;
			}
			case 2:
			{
				//alert("self m_Index:"+m_Index+" currpage:"+s_PageCtrl_2.m_CurrPage);
				window._OrderDataGetter.Read(window.g_OrderList_WinNum_DataId, s_PageCtrl_2.m_CurrPage-1);
				break;
			}
			case 3:
			{
				//alert("self m_Index:"+m_Index+" currpage:"+s_PageCtrl_3.m_CurrPage);
				window._OrderDataGetter.Read(window.g_OrderList_AllScore_DataId, s_PageCtrl_3.m_CurrPage-1);
				break;
			}
			case 4:
			{
				//alert("self m_Index:"+m_Index+" currpage:"+s_PageCtrl_4.m_CurrPage);
				window._OrderDataGetter.Read(window.g_OrderList_ACE_DataId, s_PageCtrl_4.m_CurrPage-1);
				break;
			}
			case 5:
			{
				//alert("self m_Index:"+m_Index+" currpage:"+s_PageCtrl_5.m_CurrPage);
				window._OrderDataGetter.Read(window.g_OrderList_SkillNum_DataId, s_PageCtrl_5.m_CurrPage-1);
				break;
			}
			case 6:
			{
				//alert("self m_Index:"+m_Index+" currpage:"+s_PageCtrl_6.m_CurrPage);
				window._OrderDataGetter.Read(window.g_OrderList_FullStore_DataId, s_PageCtrl_6.m_CurrPage-1);
				break;
			}
		}
	}

	void ClearData(_curpage)
	{
		var _VNet2DBRow = new VNet2DBRow{}
		var _index = toint(_curpage)*10+1;
		var _lastIndex  = (toint(_curpage)+1)*10;
		var _table;
		switch(m_Index)
		{
			case 1:
			{
				_table = window.TS_A_ALLBOUT;
				break;
			}
			case 2:
			{
				_table = window.TS_A_WINNUM;
				break;
			}
			case 3:
			{
				_table = window.TS_A_ALLSCORE;
				break;
			}
			case 4:
			{
				_table = window.TS_A_ACE;
				break;
			}
			case 5:
			{
				_table = window.TS_A_SKILLNUM;
				break;
			}
			case 6:
			{
				_table = window.TS_A_FULLSTORE;
				break;
			}
		}
		printf("C# ClearData：_table:"+_table+",_curpage："+_curpage+",_index:"+_index+",_lastIndex:"+_lastIndex);
		while(_index<=_lastIndex)
		{
			_VNet2DBRow.InitByInt(window.TOPSTAR,_table,window.TOPSTAR_TS_A_FULLSTORE_CURRINDEX,_index);
			if(_VNet2DBRow.IsReady())
			{
				_VNet2DBRow.SetInt(window.TOPSTAR_TS_A_FULLSTORE_INDEX,-1000);
				_VNet2DBRow.UpdateEnd();
			}
			_VNet2DBRow.Release();
			_index += 1;
		}
		_VNet2DBRow.del();
	}
};