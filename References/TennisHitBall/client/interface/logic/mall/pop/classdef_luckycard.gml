//物品续费
importex("$./../../../UI/Mall/Pop/ClassDef_LuckyCard.gml");
importex("$./ClassDef_LuckyCard_DBlist.gml");

class VItem_LuckyCard_Logic item
{
	var m_itemIds = "";
	var m_items = "";
	var m_TotalMoney = 0;
	var m_TotalToken = 0;
	var m_TotalQuan = 0;
	var m_HaveTotalMoney = 0;
	var m_HaveTotalToke = 0;
	var m_HaveTotalQuan = 0;
	var m_LuckyCardParam = "";	//道具续费参数
	var m_UsePos = 1;	//指在哪里的使用，1为购物车-购买，2为购物车-赠送，3为索要，4为续费
	var m_Other = "";	//额外信息
	var m_ItemsCount = 0;	//物品个数
	var m_SelectBegin = false;	//初始时自动选择一项
	var m_SelectCount = 0;		//选中的数量

	void Init()
	{
		//总价格
		staticvar s_TotalPrice = new BaseText{}
		//拥有金币
		staticvar s_MyGold = new BaseText{}
		//我的奖券
		staticvar s_MyLottery = new BaseText
		{}
		//拥有点券
		staticvar s_MyMoney = new BaseText
		{}
		//确定:按钮
		staticvar s_Btn_Enter = new VBTN_A_New
		{}
//		//确定删除:按钮
//		staticvar s_Btn_Del = new VBTN_A_New
//		{}
		//取消:按钮
		staticvar s_Btn_Esc = new VBTN_A_New
		{}
	}
	inclass("VItem_LuckyCard_UI");
	Init();
	//==========================================
	//设置响应事件
	void SetEvent()
	{
		//点击确定续费
		set s_Btn_Enter
		{
			void OnPressed(){parent.OnClick_BtnConfirm();}
		}
		//取消:按钮
		set s_Btn_Esc
		{
			void OnPressed(){parent.OnClick_BtnEsc();}
		}
		//关闭:按钮
		set s_Btn_Close
		{
			void OnPressed(){parent.OnClick_BtnEsc();}
		}
	}

	//点击确定
	void OnClick_BtnConfirm()
	{
		printf("C# m_TotalMoney:"+m_TotalMoney+",m_HaveTotalMoney:"+m_HaveTotalMoney
			+",m_TotalToken:"+m_TotalToken+",m_HaveTotalToke:"+m_HaveTotalToke
			+",m_TotalQuan:"+m_TotalQuan+",m_HaveTotalQuan:"+m_HaveTotalQuan);
		
		CountSelectNum();
		if (m_SelectCount <= 0)
		{
			window.find("UIController").LoadDLG(695);//2010年9月10日22:02 yxf
			return;
		}

		if(m_TotalMoney>m_HaveTotalMoney)
		{
			window.find("UIController").LoadDLG(350);	//余额不足
			return	 ;
		}
		if(m_TotalToken>m_HaveTotalToke)
		{
			window.find("UIController").LoadDLG(350);	//余额不足
			return	 ;
		}
		if(m_TotalQuan>m_HaveTotalQuan)
		{
			window.find("UIController").LoadDLG(350);	//余额不足
			return	 ;
		}
		if(m_UsePos == 1 || m_UsePos == 2 || m_UsePos == 4)
		{
			_LuckyCardItemList.scriptprcallsub("LuckyCardParam");
		}
		if(m_UsePos == 3)
		{
			_LuckyCardItemList.scriptprcallsub("LuckyCardParam",m_Other);
		}

		printf("C# m_LuckyCardParam"+m_LuckyCardParam);
		
		if(m_UsePos == 1)
		{
			window.Too_AddShopCar("-1,-1,,,"+m_LuckyCardParam);
			//parent.del();
//			window.SetMallVar(window.MALL_OPT_BUYCAR);
//			window.find("UIController").LoadUI("UI_MALL_BUYCAR");
			window.find("MALL_BUY_LOGIC")._BuyCar.RefreshType(m_Other);
			//return;
		}
		if(m_UsePos == 2)
		{
			var _count = window.GetSplitCount(m_Other,";");
			var _Arr = window.SplitStr2(m_Other,";",_count);
			window.Too_AddShopCar(""+_Arr[0]+","+m_LuckyCardParam);
			//parent.del();
//			window.SetMallVar(window.MALL_OPT_GIFT);
//			window.find("UIController").LoadUI("UI_MALL_BUYCAR");
			window.find("MALL_BUY_LOGIC")._BuyCar.RefreshType(_Arr[1]);
			//return;
		}
		if(m_UsePos == 3)
		{
			//parent.del();
			window.find("MALL_REQUEST_MSG_LOGIC")._Msg.Inited();
			//return;
		}
		if(m_UsePos == 4)
		{
			window.Too_AddShopCar("-1,-1,,,"+m_LuckyCardParam);
			//parent.del();
			window.find("Item_PropContinue_Logic")._PropContinue.Reflash();
			//return;
		}
		//parent.del();
	}
	//点击了取消-和关闭
	void OnClick_BtnEsc()
	{
		if(m_UsePos == 1)
		{
			
//			window.SetMallVar(window.MALL_OPT_BUYCAR);
//			window.find("UIController").LoadUI("UI_MALL_BUYCAR"); 
			window.find("MALL_BUY_LOGIC")._BuyCar.RefreshType(m_Other);
//			return;
		}
		if(m_UsePos == 2)
		{
			var _count = window.GetSplitCount(m_Other,";");
			var _Arr = window.SplitStr2(m_Other,";",_count);
			window.find("MALL_BUY_LOGIC")._BuyCar.RefreshType(_Arr[1]);
//			parent.del();
//			return;
		}
		if(m_UsePos == 3)
		{
//			parent.del();
			window.find("MALL_REQUEST_MSG_LOGIC")._Msg.Inited();
			//return;
		}
		if(m_UsePos == 4)
		{
//			parent.del();
			window.find("Item_PropContinue_Logic")._PropContinue.Reflash();
			//return;
		}
		parent.del();
	}

	//==================================================
	void CreateList()
	{
		staticvar _LuckyCardItemList = new VItem_LuckyCard_Logic_List
		{
			name = "VItem_LuckyCard_Logic_List_NAME";
			if(parent.m_UsePos == 1 || parent.m_UsePos == 2)
			{
				window.find("G_DBMANAGE").RegDbTable(this,window.GAMEUI,window.BUYCARSELECT,"Bind_VItem_LuckyCard_Logic_List_NAME");// 绑定数据表
			}
			if(parent.m_UsePos == 3)
			{
				window.find("G_DBMANAGE").RegDbTable(this,window.GAMEUI,window.MSGREQUESTSELECT,"Bind_VItem_LuckyCard_Logic_List_NAME");// 绑定数据表
			}
			if(parent.m_UsePos == 4)
			{
				window.find("G_DBMANAGE").RegDbTable(this,window.M_G_GOODS,window.PLAYERITEMS,"Bind_VItem_LuckyCard_Logic_List_NAME");// 绑定数据表
			}
			void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);} //移除绑定

	//		var _SQL = "SELECT * FROM " + window.BUYCARSELECT + " WHERE state=1";
	//		printf("B# 幸运卡购物:_SQL："+_SQL);
	//		window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VItem_LuckyCard_Logic_List_NAME",window.GAMEUI,_SQL);
		}
	}
	
	
	//_SQL:要取的数据的SQL语句
	//_type：指在哪里的使用，1为购物车-购买，2为购物车-赠送，3为索要，4为续费
	//额外信息
	void Reflash(_SQL,_type,_other)
	{
		m_UsePos = _type;
		m_Other = _other;
		printf("B# 幸运卡购物:_type:"+_type+",_SQL："+_SQL);
		CreateList();
		if(m_UsePos == 1 || m_UsePos == 2 || m_UsePos == 3)
		{
			window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VItem_LuckyCard_Logic_List_NAME",window.GAMEUI,_SQL);
		}
		if(m_UsePos == 4)
		{
			window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VItem_LuckyCard_Logic_List_NAME",window.M_G_GOODS,_SQL);
		}
		var _VNet2DBTable = new VNet2DBTable{}
		if(m_UsePos == 1 || m_UsePos == 2 || m_UsePos == 3)
		{
			_VNet2DBTable.Select(window.GAMEUI,_SQL);
		}
		if(m_UsePos == 4)
		{
			_VNet2DBTable.Select(window.M_G_GOODS,_SQL);
		}
		m_ItemsCount = _VNet2DBTable.GetSize();
		_VNet2DBTable.del();
		if(m_ItemsCount == 1)
		{
			//m_SelectBegin = true; //默认不选中 2010年9月10日21:36 yxf
			if(m_UsePos == 1 || m_UsePos == 2 || m_UsePos == 3)
			{
				window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VItem_LuckyCard_Logic_List_NAME",window.GAMEUI,_SQL);
			}
			if(m_UsePos == 4)
			{
				window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VItem_LuckyCard_Logic_List_NAME",window.M_G_GOODS,_SQL);
			}
		}
		window.find("UIController").LoadDLG(695);
	}

	//统计价格
	void AddMoney(type,v)
	{
		if ( type == 1 )
		{
			m_TotalMoney += v;
		}
		if ( type == 2 )
		{
			m_TotalQuan += v;
		}
		if ( type == 3 )
		{
			m_TotalToken += v;
		}
	}

	//总价格统计
	void RefreshTotalMoney()
	{
		m_TotalMoney = 0;
		m_TotalToken = 0;
		m_TotalQuan= 0;
		_LuckyCardItemList.scriptprcallsub("AddMoney");
		s_TotalPrice.SetValue(toint(m_TotalMoney),toint(m_TotalToken),toint(m_TotalQuan),window.GetVipTypeByUID());
	}

	//道具续费参数
	void LuckyCardParam(_Param)
	{
		m_LuckyCardParam +=  _Param + ",";
	}

	void GetDataFromDB()
	{
		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByInt(window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_UID,window.GetMyUID());
		if (!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.Release();
			printf("B# error-购买框:DBname:"+window.M_G_SERVER+",TBName:"+window.USERDT);
			return;
		}
		m_HaveTotalMoney = _VNet2DBRow.GetData(window.M_G_SERVER_USERDT_TOTALMONEY);
		s_MyGold.SetData(m_HaveTotalMoney);//拥有金币
		m_HaveTotalToke = _VNet2DBRow.GetData(window.M_G_SERVER_USERDT_TOKENMONEY);
		s_MyLottery.SetData(m_HaveTotalToke);//拥有奖券
		m_HaveTotalQuan = _VNet2DBRow.GetData(window.M_G_SERVER_USERDT_TOTALTICKET);
		s_MyMoney.SetData(m_HaveTotalQuan);//拥有点券
		_VNet2DBRow.Release();
	}

	void OnCreated()
	{
		SetEvent();
		GetDataFromDB();
	}

	//计算选择的数量
	void CountSelectNum()
	{
		m_SelectCount = 0;
		_LuckyCardItemList.scriptprcallsub("CountSelectNum");
	}
}