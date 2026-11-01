//商城：购物类定义

importex("$./ClassDef_Shopping_Dress.gml");
importex("$./ClassDef_Shopping_Face.gml");
importex("$./ClassDef_Shopping_Deck.gml");
importex("$./ClassDef_Shopping_Skill.gml");
importex("$./ClassDef_Shopping_Attribute.gml");
importex("$./ClassDef_Shopping_Props.gml");
importex("$./ClassDef_Shopping_Dress_DBList.gml");
import("$./ClassDef_Shopping_HotSale.gml");
importex("$./../../UI/Mall/ClassDef_Shopping.gml");

/*
商城物品的分类：
其他0:如金钱，点券

	服饰
		|_____服装1: 上装0 裙/裤1 手套2 袜3 鞋4 球拍5
		|_____美容2: 头发0 五官1  
		|_____饰品3: 护腕/手链0 项链1 眼镜2 背饰3 附件4
	技能4：上旋0  削球1 扣杀2 放高球3 发球4
	道具5: 辅助道具0,聊天工具1
	属性6: 力量0,技巧1,前场2,后场3,发球4,能量5,体力6
	套装7:
	热销8: 全部, 服饰, 美容, 道具
*/

class VMall_Shopping_Logic item
{
	name = "VMall_Shopping_Logic";
	size = "80%,60%";bgcolor = "#123456";alpha = 50;
	var m_Select_Sex = 0;		//选择的性别
	var m_Select_Column = 1;	//选择的大标签
	var m_Init = false;
	var m_Zone = 2;		// 普通区, 精品区, 休闲区
	var m_SearchState = false;	//搜索模式 true为搜索状态，false为非搜索状态
	var m_SearchContent = "";	//搜索内容
	var m_CurHotSaleState = 0;	// 是否在"热销"标签状态下
	var m_SearchDataNum = 0;	//搜索后的记录数
	var m_DataNum = 0;	//物品数量
	var m_ClassID = 0;
	//=============================与界面交互========================================
	void Init()
	{
		// 关闭搜索按钮
		staticvar s_Btn_CloseSearch = new VBTN_A_New
		{}
		// 热卖 RADIO
		staticvar s_R_HotSale = new VMyRadio
		{
			Init("热销", 1); pos = "0,0";
		}
		//套装:RADIO
		staticvar s_R_Suit = new VMyRadio
		{
			Init("套装",1);pos = "50,0";
		}
		//服饰:RADIO
		staticvar s_R_Dress = new VMyRadio
		{
			Init("服饰",1);pos = "100,0";
		}
		//美容:RADIO
		staticvar s_R_Face = new VMyRadio
		{
			Init("美容",1);pos = "150,0";
		}
		//饰品:RADIO
		staticvar s_R_Deck = new VMyRadio
		{
			Init("饰品",1);pos = "200,0";
		}
		//球拍:RADIO
		staticvar s_R_Racket = new VMyRadio
		{
			Init("球拍",1);pos = "250,0";
		}
		//技能:RADIO
		staticvar s_R_Skill = new VMyRadio
		{
			Init("技能",1);pos = "300,0";
		}
		//技能:RADIO
		staticvar s_R_Attribute = new VMyRadio
		{
			Init("属性",1);pos = "350,0";
		}
		//道具:RADIO
		staticvar s_R_Props = new VMyRadio
		{
			Init("道具",1);pos = "400,0";
		}

		//翻页：服饰物品
		staticvar s_PageCtrl = new VMyPageCtrl
		{
			valign(100,0);halign(50,0);
		}

		//页数:edit
		staticvar s_Edit_Page = new edit
		{
			size = "100,26";pos="478,462";maxsize = 3;color = "#FFFFFF";cursorcolor = "#FFFFFF";
			//autoenter = "true";selectall = "true";
			font = "宋体,-1,30";xcenter = "true";
			bold = "true";onlynumber = "true"; 

			function OnInsertChar(c)
			{
				if (c=='-' || c=='.')
				{
					return false;
				}
				return true;
			}

			void OnEnter()
			{
				parent.JoinInputRoom();
			}
		}

		//Go：按钮
		staticvar s_Btn_Go = new VMyButton
		{
			pos="597,460";Init("GO");size = "30,30";
		}
	}
	inclass("VMall_Shopping_UI");//界面显示类
	//==============================function=========================================
	Init();
	//初始化显示：所有都隐藏
	void InitShow()
	{
		m_Class_Dress.show = false;
		m_Class_Face.show = false;
		m_Class_Deck.show = false;
		m_Class_Skill.show = false;
		m_Class_Attribute.show = false;
		m_Class_Props.show = false;
		m_Class_HotSale.show = false;
	}

	void OnCheckRadio0()
	{//热销
		m_CurHotSaleState = 1;
		ChangeType(9); RefrestSelect();
	}
	void OnCheckRadio1()
	{//套装
		m_CurHotSaleState = 0;
		ChangeType(8);RefrestSelect();
	}
	void OnCheckRadio2()
	{//服饰:RADIO
		m_CurHotSaleState = 0;
		ChangeType(1);RefrestSelect();
	}
	void OnCheckRadio3()
	{//美容:RADIO
		m_CurHotSaleState = 0;
		ChangeType(2);RefrestSelect();
	}
	void OnCheckRadio4()
	{//饰品:RADIO
		m_CurHotSaleState = 0;
		ChangeType(3);RefrestSelect();
	}
	void OnCheckRadio5()
	{//球拍:RADIO
		m_CurHotSaleState = 0;
		ChangeType(4);RefrestSelect();
	}
	void OnCheckRadio6()
	{//技能:RADIO
		m_CurHotSaleState = 0;
		ChangeType(5);RefrestSelect();
	}
	void OnCheckRadio7()
	{//属性:RADIO
		m_CurHotSaleState = 0;
		ChangeType(6);RefrestSelect();
	}
	void OnCheckRadio8()
	{//道具:RADIO
		m_CurHotSaleState = 0;
		ChangeType(7);RefrestSelect();
	}
	
	//模拟选中
	//参数 index : 0-8
	void Check_UnCheck(index)
	{
		s_RadioCtrl_Mall.find("BtnName_Mall_Hot").UnCheck();
		s_RadioCtrl_Mall.find("BtnName_Mall_Suit").UnCheck();
		s_RadioCtrl_Mall.find("BtnName_Mall_Clothing").UnCheck();
		s_RadioCtrl_Mall.find("BtnName_Mall_Hairdressing").UnCheck();
		s_RadioCtrl_Mall.find("BtnName_Mall_Jewelry").UnCheck();
		s_RadioCtrl_Mall.find("BtnName_Mall_Racket").UnCheck();
		s_RadioCtrl_Mall.find("BtnName_Mall_Skill").UnCheck();
		s_RadioCtrl_Mall.find("BtnName_Mall_Attribute").UnCheck();
		s_RadioCtrl_Mall.find("BtnName_Mall_Props").UnCheck();

		switch (index)
		{
		case 0:s_RadioCtrl_Mall.find("BtnName_Mall_Hot").Check();break;
		case 1:s_RadioCtrl_Mall.find("BtnName_Mall_Suit").Check();break;
		case 2:s_RadioCtrl_Mall.find("BtnName_Mall_Clothing").Check();break;
		case 3:s_RadioCtrl_Mall.find("BtnName_Mall_Hairdressing").Check();break;
		case 4:s_RadioCtrl_Mall.find("BtnName_Mall_Jewelry").Check();break;
		case 5:s_RadioCtrl_Mall.find("BtnName_Mall_Racket").Check();break;
		case 6:s_RadioCtrl_Mall.find("BtnName_Mall_Skill").Check();break;
		case 7:s_RadioCtrl_Mall.find("BtnName_Mall_Attribute").Check();break;
		case 8:s_RadioCtrl_Mall.find("BtnName_Mall_Props").Check();break;
		}
	}

	// 接口: 选取(普通区, 精品区, 休闲区)
	void SetZone(zone)
	{
		m_Zone = zone;
	}

	//切换选项卡
	//参数 type：类型 1服饰，2美容，3饰品，5技能，6属性，7道具，9热销
	void ChangeType(type)
	{
		InitShow();
		switch (type)
		{
			case 1:{m_Class_Dress.show = true;break;}
			case 2:{m_Class_Face.show = true;break;}
			case 3:{m_Class_Deck.show = true;break;}
			case 5:{m_Class_Skill.show = true;break;}
			case 6:{m_Class_Attribute.show = true;break;}
			case 7:{m_Class_Props.show = true;break;}
			case 9:{m_Class_HotSale.show = true;break;}
		}
		m_Select_Column = type;
	}
	//点击了Go
	void OnClick_Go()
	{
		var _page = toint(s_Edit_Page.src);
		if (_page <= 0 || _page == "" || _page > s_PageCtrl.m_AllPage)
		{
			window.find("UIController").LoadDLG(390);//无效的页数
			return;
		}
		s_PageCtrl.setpageto(_page);
	}
	//设置响应事件
	void SetEvent()
	{
		set s_Btn_CloseSearch
		{
			void OnPressed()
			{
				parent.m_SearchState = false;
				parent.RefrestSelect();
				parent.ClickSearch(true);
				if (window.find("VMall_Control").m_Zone == 2)// 休闲区
				{
					window.find("VMall_Control").s_Btn_GoNiceShopping.show = true;
				}
				if (window.find("VMall_Control").m_Zone == 1)// 精品区
				{
					window.find("VMall_Control").s_Btn_GoComfortShopping.show = true;	
				}
			}
		}
		
		set s_PageCtrl//翻页：背包物品
		{
			targetname="VMall_DressList_Logic_NAME";
			countperpage = 10;
			window.find("G_DBMANAGE").GetRegDbTable(this,"Bind_VMall_DressList_Logic");// 获得已绑定的数据表

			void GetCurNum(nCurPage,nAllPage)
			{
				parent._MallDressList.checkselect(-1,-1);
			}
		}

		set s_Btn_Go
		{
			void OnPressed(){parent.OnClick_Go();}
		}
	}
	//生成一些成员变量
	void NewSubObj()
	{
		staticvar m_Class_Dress = new VMall_Shopping_Dress_Logic{}
		staticvar m_Class_Face = new VMall_Shopping_Face_Logic{}
		staticvar m_Class_Deck = new VMall_Shopping_Deck_Logic{}
		staticvar m_Class_Skill = new VMall_Shopping_Skill_Logic{}
		staticvar m_Class_Attribute = new VMall_Shopping_Attribute_Logic{}
		staticvar m_Class_Props = new VMall_Shopping_Props_Logic{}
		staticvar m_Class_HotSale = new VMall_Shopping_HotSale_Logic{}
	}

	void Inited()
	{
		m_Init = true;
		RefrestSelect();
	}

	void GetClassID()
	{
		switch (m_Select_Column)
		{
		case 1: {return m_Class_Dress.GetClassID();}
		case 2: {return m_Class_Face.GetClassID();}
		case 3: {return m_Class_Deck.GetClassID();}
		case 4: {return 105;}
		case 5: {return m_Class_Skill.GetClassID();}
		case 6: {return m_Class_Attribute.GetClassID();}
		case 7: {return m_Class_Props.GetClassID();}
		case 8: {return 700;}
		case 9: {return m_Class_HotSale.GetClassID();}
		}
		return 0;
	}

	void GetSexCondition()
	{
		// 注释掉的是道具, 因为老虎说, 道具也需要性别之分了.
		if ( m_Select_Column == 5 || m_Select_Column == 6 /*|| m_Select_Column == 7*/ )
		{
			return "";
		}
		return " AND Sex=" + m_Select_Sex;
	}

	void RefrestSelect2()
	{
		if ( m_Init == false ) return;
		var sexcondition = GetSexCondition();

		m_DataNum = 0;
		var _SQL = "SELECT * FROM " + window.ITEMS + " WHERE " + sexcondition + " AND " + window.M_G_GOODS_ITEMS_TZONE_STR +"="+ m_Zone +" AND FreeTry=0 ORDER BY MallBuyIndex ASC";
		window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VMall_DressList_Logic",window.M_G_GOODS,_SQL);
		var _pageNum = 0;
		var _pageNumRest = toint(m_DataNum)%10;
		if(_pageNumRest == 0)
		{
			_pageNum = toint(m_DataNum)/10;
		}
		else
		{
			_pageNum = toint(m_DataNum)/10+1;
		}
		m_DataNum = 0;
		if(_pageNum == 0)
		{
			s_PageCtrl.setcountpage(1);
		}
		else
		{
			s_PageCtrl.setcountpage(_pageNum);
		}
		s_PageCtrl.setpageto(1);//强制翻到第一页
	}

	void RefrestSelect()
	{
		if ( m_Init == false ) return;
		var classid = 0;
		if (toint(m_ClassID) == 0)
		{
			classid = GetClassID();
		}else
		{
			classid = m_ClassID;
			m_ClassID = 0;
		}
		var sexcondition = GetSexCondition();
		if ( classid == 0 )
		{
			printf("B# 商城:RefrestSelect 错误的子类id");
			return;
		}
		// 热销界面
		var _TSQL = "";
		switch(classid)
		{
		case 901:// 全部
			_TSQL = "SELECT * FROM " + window.ITEMS + 
				" WHERE " + window.M_G_GOODS_ITEMS_TSTATE_STR + "=5 " + " AND " + window.M_G_GOODS_ITEMS_TZONE_STR +"="+ m_Zone +" AND FreeTry=0 " + sexcondition + " OR " + 
				"Sex=\"" + "\"" + " AND " + window.M_G_GOODS_ITEMS_TSTATE_STR + "=5 " + " AND " + window.M_G_GOODS_ITEMS_TZONE_STR +"="+ m_Zone +" AND FreeTry=0"  + " ORDER BY MallBuyIndex ASC";
			break;
		case 902:// 服饰
			_TSQL = "SELECT * FROM " + window.ITEMS + 
				" WHERE Class>=300 AND Class<=399 "  + sexcondition + " AND " + window.M_G_GOODS_ITEMS_TSTATE_STR + "=5 AND " + window.M_G_GOODS_ITEMS_TZONE_STR +"="+ m_Zone +" AND FreeTry=0 "+
			"OR Class>=100 AND Class<=199 " + sexcondition + " AND " + window.M_G_GOODS_ITEMS_TSTATE_STR + "=5 AND " + window.M_G_GOODS_ITEMS_TZONE_STR +"="+ m_Zone +" AND FreeTry=0 ORDER BY MallBuyIndex ASC";
			break;
		case 903:.// 美容
			_TSQL = "SELECT * FROM " + window.ITEMS + 
				" WHERE Class>=200 AND Class<=299 " + sexcondition + " AND " + window.M_G_GOODS_ITEMS_TSTATE_STR + "=5 AND " + window.M_G_GOODS_ITEMS_TZONE_STR +"="+ m_Zone +" AND FreeTry=0 ORDER BY MallBuyIndex ASC";
			break;
		case 904:// 道具
			_TSQL = "SELECT * FROM " + window.ITEMS + 
				" WHERE Class>=400 AND Class<=404 AND FreeTry=0 AND " +window.M_G_GOODS_ITEMS_TSTATE_STR + "=" + "5 AND " + window.M_G_GOODS_ITEMS_TZONE_STR + "=" + m_Zone + " AND Sex="+m_Select_Sex+
					" OR Class>=400 AND Class<=404 AND FreeTry=0 AND " +window.M_G_GOODS_ITEMS_TSTATE_STR+"="+"5 AND "+window.M_G_GOODS_ITEMS_TZONE_STR+"="+m_Zone+" AND Sex=0 "+
				" OR Class>=600 AND Class<=606 AND FreeTry=0 AND " +window.M_G_GOODS_ITEMS_TSTATE_STR + "=" + "5 AND " + window.M_G_GOODS_ITEMS_TZONE_STR + "=" + m_Zone + " AND Sex="+m_Select_Sex+
					" OR Class>=600 AND Class<=606 AND FreeTry=0 AND "+window.M_G_GOODS_ITEMS_TSTATE_STR +"="+"5 AND "+window.M_G_GOODS_ITEMS_TZONE_STR+"="+m_Zone+" AND Sex=0 "+
				" OR Class>=500 AND Class<=599 " + " AND " + window.M_G_GOODS_ITEMS_TSTATE_STR + "=5 AND " + window.M_G_GOODS_ITEMS_TZONE_STR +"="+ m_Zone +" AND Sex="+m_Select_Sex+
					" OR Class>=500 AND Class<=599" + " AND "+window.M_G_GOODS_ITEMS_TSTATE_STR+"=5 AND "+window.M_G_GOODS_ITEMS_TZONE_STR+"="+m_Zone+" AND Sex=0 "+
				" AND FreeTry=0 ORDER BY MallBuyIndex ASC";
			break;
		}
		if (_TSQL != "")
		{
			window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VMall_DressList_Logic",window.M_G_GOODS,_TSQL);
			s_PageCtrl.setpageto(1);//强制翻到第一页
			return;
		}

		//夏洋洋	添加并修改SQL语句部分	于2009-12-10
		if(toint(classid)/window.GOODS_CLASS_BASE == window.GOODS_CLASS_Props)
		{
			classid = "Class>=500 AND Class<=599";
		}
		else
		{
			classid = "Class="+classid;
		}
		if (m_Select_Column == 7)	 // 道具
		{
			var _SQL = "SELECT * FROM " + window.ITEMS + " WHERE " + classid + " AND Sex="+ m_Select_Sex + " AND " + window.M_G_GOODS_ITEMS_TZONE_STR +"="+ m_Zone +
			" OR "+classid+" AND Sex=0 AND "+window.M_G_GOODS_ITEMS_TZONE_STR +"="+ m_Zone +
			" AND FreeTry=0 ORDER BY MallBuyIndex ASC";
			printf("B# 道具:_SQL："+_SQL);
			m_DataNum = 0;
			window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VMall_DressList_Logic",window.M_G_GOODS,_SQL);
			printf("xiayy:m_DataNum:"+m_DataNum);
			var _pageNum = 0;
			var _pageNumRest = toint(m_DataNum)%10;
			if(_pageNumRest == 0)
			{
				_pageNum = toint(m_DataNum)/10;
			}
			else
			{
				_pageNum = toint(m_DataNum)/10+1;
			}
			m_DataNum = 0;
			if(_pageNum == 0)
			{
				s_PageCtrl.setcountpage(1);
			}
			else
			{
				s_PageCtrl.setcountpage(_pageNum);
			}
			s_PageCtrl.setpageto(1);//强制翻到第一页
			return	 ;
		}
		var _SQL = "SELECT * FROM " + window.ITEMS + " WHERE " + classid + sexcondition + " AND " + window.M_G_GOODS_ITEMS_TZONE_STR +"="+ m_Zone +" AND FreeTry=0 ORDER BY MallBuyIndex ASC";
		printf("B# 商城:_SQL："+_SQL);
		m_DataNum = 0;
		window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VMall_DressList_Logic",window.M_G_GOODS,_SQL);
		var _pageNum = 0;
		var _pageNumRest = toint(m_DataNum)%10;
		if(_pageNumRest == 0)
		{
			_pageNum = toint(m_DataNum)/10;
		}
		else
		{
			_pageNum = toint(m_DataNum)/10+1;
		}
		m_DataNum = 0;
		if(_pageNum == 0)
		{
			s_PageCtrl.setcountpage(1);
		}
		else
		{
			s_PageCtrl.setcountpage(_pageNum);
		}
		s_PageCtrl.setpageto(1);//强制翻到第一页
	}

	void SearchRefrestSelect(_name)
	{
		if ( m_Init == false ) return;
		//add by chenjihui 2011-1-24
		//解决BUG 0020657
		RefrestSelect();
		m_SearchState = true;
		m_SearchContent = _name;
//		var _SQL = "SELECT * FROM " + window.ITEMS + " WHERE " + classid + sexcondition + " AND " + window.M_G_GOODS_ITEMS_TZONE_STR +"="+ +m_Zone +" AND FreeTry=0 AND "+window.M_G_GOODS_ITEMS_NAME_STR+" LIKE \'%"+_name+"%\' ORDER BY Entry ASC";
		var _SQL = "SELECT * FROM " + window.ITEMS + " WHERE Sex=" + m_Select_Sex + " AND " + window.M_G_GOODS_ITEMS_TZONE_STR +"="+ +m_Zone + " FreeTry=0 OR " + 
			"Sex=0" + " AND " + window.M_G_GOODS_ITEMS_TZONE_STR +"="+ +m_Zone + " AND FreeTry=0 ORDER BY MallBuyIndex ASC";
		printf("B# 商城:SearchRefrestSelect:_SQL："+_SQL);
		m_DataNum = 0;
		window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VMall_DressList_Logic",window.M_G_GOODS,_SQL);
		var _pageNum = 0;
		var _pageNumRest = toint(m_SearchDataNum)%10;
		if(_pageNumRest == 0)
		{
			_pageNum = toint(m_SearchDataNum)/10;
		}
		else
		{
			_pageNum = toint(m_SearchDataNum)/10+1;
		}
		m_SearchDataNum = 0;
		if(_pageNum == 0)
		{
			s_PageCtrl.setcountpage(1);
		}
		else
		{
			s_PageCtrl.setcountpage(_pageNum);
		}
		s_PageCtrl.setpageto(1);//强制翻到第一页
		ClickSearch(false);
	}

	void ClickSearch(_state)
	{
		s_Btn_CloseSearch.show = !_state;
		s_RadioCtrl_Mall.show = _state;
		switch(m_Select_Column)
		{
			case 1:{m_Class_Dress.show = _state;break;}
			case 2:{m_Class_Face.show = _state;break;}
			case 3:{m_Class_Deck.show = _state;break;}
			case 5:{m_Class_Skill.show = _state;break;}
			case 6:{m_Class_Attribute.show = _state;break;}
			case 7:{m_Class_Props.show = _state;break;}
			case 9:{m_Class_HotSale.show = _state;break;}
		}
	}
	//================================DBList=========================================
	var _MallDressList = new VMall_DressList_Logic
	{
		
		name = "VMall_DressList_Logic_NAME";
	
		window.find("G_DBMANAGE").RegDbTable(this,window.M_G_GOODS,window.ITEMS,"Bind_VMall_DressList_Logic");// 绑定数据表
		
		void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);} //移除绑定

		void PageviewEnd() // 翻页结束后调用
		{
//			checkselect(-1,-1);
		}

		void OnCreated()
		{
			SetCheckData(1, window.M_G_GOODS_ITEMS_ENTRY);
		}
		// index:当前字段索引
		// data:字段的值
		void CheckData(index,data)
		{
			//对限时物品若未在规定时间中就不显示
			window.g_Row.InitByInt(window.M_G_GOODS, window.ITEMS, window.M_G_GOODS_ITEMS_ENTRY, toint(data));
			if(!window.g_Row.IsReady())
			{
				window.g_Row.Release();
				return false;
			}
			var _SaleAttribute = window.g_Row.GetData(window.M_G_GOODS_ITEMS_TSTATE);
			var _Class = window.g_Row.GetData(window.M_G_GOODS_ITEMS_CLASS);
			window.g_Row.Release();
			var _CurrTime = window.g_ShopTimeNow;
			var _StartTime = window.find("CMallGoods").GetGoodsBeginTime(data);// 得到毫秒级的时间
			var _EndTime = window.find("CMallGoods").GetGoodsEndTime(data);// 得到毫秒级的时间
			if(toint(_Class)/window.GOODS_CLASS_BASE == window.GOODS_CLASS_Props)
			{
				if(toint(_SaleAttribute) == 1 || toint(_SaleAttribute) == 2)
				{
					if(toint(_CurrTime) < toint(_StartTime) || toint(_CurrTime) > toint(_EndTime))
					{
						return false;
					}
				}
			}
			else
			{
				if(toint(_SaleAttribute) == 1 || toint(_SaleAttribute) == 2)
				{
					var _startTM = toint(_StartTime) - 7*24*60*60;
					var _endTM = toint(_EndTime) + 7*24*60*60;
//					printf("C# 非道具限时限量data:"+data+",_startTM:"+_startTM+",_endTM:"+_endTM+",_CurrTime:"+_CurrTime);
					if(toint(_CurrTime) < _startTM || toint(_CurrTime) > _endTM)
					{
						return false;
					}
				}
			}
			
			
			//搜索模式走这里
			if(parent.m_SearchState)
			{
				return SearchCheckData(index,data);
			}
			

			parent.m_DataNum += 1;
			
			if (toint(window.g_DeadGoodId) == toint(data))
			{
				window.g_DeadGoodsNum = parent.m_DataNum;
				printf("E# chjh window.g_DeadGoodId="+window.g_DeadGoodId + ",window.g_DeadGoodsNum="+window.g_DeadGoodsNum);
				window.g_DeadGoodId = -1;
			}
			return true;
		}

		//搜索模式下的筛选
		void SearchCheckData(index,data)
		{
			var _VNet2DBRow = new VNet2DBRow{};
			_VNet2DBRow.InitByInt(window.M_G_GOODS, window.ITEMS, window.M_G_GOODS_ITEMS_ENTRY, toint(data));
			if(!_VNet2DBRow.IsReady())
			{
				_VNet2DBRow.del();
				return false;
			}
			var _itemName = _VNet2DBRow.GetData(window.M_G_GOODS_ITEMS_NAME);//printf("xiayy:_itemName:"+_itemName);
			_VNet2DBRow.del();
			var _pos = _itemName.Find(""+parent.m_SearchContent);
			if(_pos<0 || _pos>= _itemName.Count)
			{
				return false;
			}
			parent.m_SearchDataNum += 1;
			return true;
		}
	}

	void OnCreated()
	{
		// 检查数据
		NewSubObj();
		SetEvent();
		timer(200,"Inited");
	}
};