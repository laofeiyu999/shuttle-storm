//物品续费
importex("$./../../../UI/Mall/Pop/ClassDef_PropContinue.gml");
importex("$./ClassDef_PropContinue_DBlist.gml");

class VItem_PropContinue_Logic item
{
	var m_itemIds = "";
	var m_items = "";
	var m_TotalMoney = 0;
	var m_TotalToken = 0;
	var m_TotalQuan = 0;
	var m_PropContinueParam = "";	//道具续费参数
	var m_SQL = "";
	var m_Type = 1;		//1为即将到期，2为已经到期
	
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
		//确定删除:按钮
		staticvar s_Btn_Del = new VBTN_A_New
		{}
		//取消:按钮
		staticvar s_Btn_Esc = new VBTN_A_New
		{}
	}
	inclass("VItem_PropContinue_UI");
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
		//帮助:按钮
		set s_Btn_Help
		{
			void OnPressed(){window.CallBack_Help(window.POS_PROPCONTINUE);}
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
		_PropContinueItemList.scriptprcallsub("PropContinueParam");
		printf("C# m_PropContinueParam："+m_PropContinueParam);
		if(window.g_LuckyCardAgio>0)
		{
			window.find("UIController").LoadUI("UI_Item_LuckyCard");

			//window.find("Item_LuckyCard_Logic")._LuckyCard.Reflash(m_SQL,4,m_itemIds);
			//parent.del();
			return;
		}
		window.Too_AddShopCar("-1,-1,,,"+m_PropContinueParam);
		parent.del();
	}
	//点击了取消-和关闭
	void OnClick_BtnEsc()
	{
		if(m_Type == 1)
		{
			window.g_MyItemsCheck.AddDeadItems(m_itemIds);
		}
		parent.del();
	}

	//==================================================
	var _listState = false;
	void CreateList()
	{
		_listState = true;
		staticvar _PropContinueItemList = new VItem_PropContinue_Logic_List
		{
			name = "VItem_PropContinue_Logic_List_NAME";
			if(parent.m_Type == 1)
			{
				window.find("G_DBMANAGE").RegDbTable(this,window.M_G_GOODS,window.PLAYERITEMS,"Bind_VItem_PropContinue_Logic_List_NAME");// 绑定数据表
			}
			else
			{
				window.find("G_DBMANAGE").RegDbTable(this,window.M_G_GOODS,window.ITEMS,"Bind_VItem_PropContinue_Logic_List_NAME");// 绑定数据表
			}
			
			void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);} //移除绑定
		}
	}
	
	void SetPropContinueItemList(_itemIds,_items,_type)
	{
		m_Type = _type;
		m_itemIds = _itemIds;
		m_items = _items;
		if(!_listState)
		{
			CreateList();
		}
		var _count = window.GetSplitCount(m_itemIds,",");
		var _itemsArray = window.SplitStr2(m_itemIds,",",_count);
		var _limitCondition = "";
		var _index = 0;
		if(_count == 0)
		{
			if(m_Type == 1)
			{
				_limitCondition = " WHERE "+window.M_G_GOODS_PLAYERITEMS_GID_STR +"=0";
			}
			else
			{
				_limitCondition = " WHERE "+window.M_G_GOODS_ITEMS_ENTRY_STR +"<0";
			}
			
		}
		while(_index<_count)
		{
			if(m_Type == 1)
			{
				if(_limitCondition == "")
				{
					_limitCondition += " WHERE "+window.M_G_GOODS_PLAYERITEMS_GID_STR +"="+_itemsArray[_index]+" AND "+window.M_G_GOODS_PLAYERITEMS_STATE_STR+">=1";
				}
				else
				{
					_limitCondition += " OR "+window.M_G_GOODS_PLAYERITEMS_GID_STR +"="+_itemsArray[_index]+" AND "+window.M_G_GOODS_PLAYERITEMS_STATE_STR+">=1";
				}
			}
			else
			{
				if(_limitCondition == "")
				{
					_limitCondition += " WHERE "+window.M_G_GOODS_ITEMS_ENTRY_STR +"="+_itemsArray[_index];
				}
				else
				{
					_limitCondition += " OR "+window.M_G_GOODS_ITEMS_ENTRY_STR +"="+_itemsArray[_index];
				}
			}
			
			_index +=1;
		}
		var _SQL = "";
		if(m_Type == 1)
		{
			_SQL = "SELECT * FROM "+window.PLAYERITEMS+_limitCondition;
		}
		else
		{
			_SQL = "SELECT * FROM "+window.ITEMS+_limitCondition;
		}
		printf("C# 续费物品列表_SQL:"+_SQL);
		m_SQL = _SQL;
		window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VItem_PropContinue_Logic_List_NAME",window.M_G_GOODS,_SQL);
	}

	void Reflash()
	{
		SetPropContinueItemList(m_itemIds,m_items,m_Type);
	}

	void ClearItemIDs(_data)
	{
		printf("C# ClearItemIDs:before:_data:"+_data+"m_itemIds:"+m_itemIds);
		m_itemIds = m_itemIds.Replace(""+_data,"");
		if(m_itemIds == ",")
		{
			m_itemIds = "";
		}
		printf("C# ClearItemIDs:after:m_itemIds:"+m_itemIds);
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
		_PropContinueItemList.scriptprcallsub("AddMoney");
		s_TotalPrice.SetValue(toint(m_TotalMoney),toint(m_TotalToken),toint(m_TotalQuan),window.GetVipTypeByUID());
	}

	//道具续费参数
	void PropContinueParam(_Param)
	{
		m_PropContinueParam +=  _Param + ",";
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
		s_MyGold.SetData(_VNet2DBRow.GetData(window.M_G_SERVER_USERDT_TOTALMONEY));//拥有金币
		s_MyLottery.SetData(_VNet2DBRow.GetData(window.M_G_SERVER_USERDT_TOKENMONEY));//拥有奖券
		s_MyMoney.SetData(_VNet2DBRow.GetData(window.M_G_SERVER_USERDT_TOTALTICKET));//拥有点券
		_VNet2DBRow.Release();
	}

	void OnCreated()
	{
		SetEvent();
		GetDataFromDB();
	}
}