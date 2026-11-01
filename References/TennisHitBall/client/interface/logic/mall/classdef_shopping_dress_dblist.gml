//
//商城-购物-服饰的物品list
//同性物品可以购买+赠送+索要
//异性物品只能赠送给跟物品同性的人

importex("$./../../UI/Mall/ClassDef_Shopping_Dress_DBList.gml");

//一行显示类：图标+名称+有效期+金币+点券+索要+购买+赠送
class VColumn_Mall_DressList_Logic item
{
	name = "VColumn_Mall_DressList_Logic";
	size = "600,50";enableUpdate(1);
	var m_Class = 0;		//物品的种类
	var m_EntryID = 0;		//物品的ID
	var m_DisplayID = 0;	//物品的显示ID-Avatars
	var m_MoneyType = 0;	//购买所需金币类型 1,金币;2,点券;3,Pk点
	var m_PriceArr;			//价格的数组
	var m_Sex = 0;			//性别；1男 2女
	var m_Attribute = "";	//属性 "0,1,2,3,4,5"
	var m_SaleAttribute = 0;	// 热卖属性(0:正常, 1:限时, 2:限量, 3:新品, 4:折扣)
	var m_IsHotSale = 0;	// 热销
	var m_IsBuyDClick = 0;	//是否可以通过双击购买 0:不可以购买, 1:可以购买
	//===========================与显示交互======================
	void Init()
	{
		//图标
		//参数 data1: 物品的识别ID
		//参数 sex: 是否为同性物品 1是 2不是
		staticvar s_GID = new VMyText{}
		
		//道具价格
		//参数 data1:多少
		//参数 data2:类型 1,金币;2,点券;3,Pk点
		staticvar s_ItemGold = new VMyText{pos = "220,0";}
	
		//放入购物车:按钮
		staticvar s_Btn_ToBuyCar = new VMyButton
		{
			pos = "400,0";size = "50,30";Init("到购物车");
		}
	}
	//需要被显示的类覆盖
	void OnMySelect(){bgcolor = "#123457";}	//选择的效果
	void OnMyUnSelect(){bgcolor = "#FFFFFF";}				//不选择的效果
	inclass("VColumn_Mall_DressList_UI"); //界面显示类
	//===============================function==============================
	void OnClick_ToBuyCar(_ItemEntryID)
	{	
		var _EntryID = _ItemEntryID;
		if (_EntryID == 0)
			return;
		window.find("BuyCarRecord").Add(_EntryID,0,0);
	}
	void OnLBDClick()
	{
		if (window.find("VMall_Logic")._bIN == true)
		{
			window.find("VMall_Logic")._bIN = false;
			return;
		}
		if (m_IsBuyDClick == 1)
			window.find("VMall_Logic").OnClick_Buy();
	}
	void GetSaleAttribute()
	{
		return	 m_SaleAttribute;
	}
	
	void AddToShopCar(_ItemEntryID)
	{
		var _EntryID = _ItemEntryID;
		if (_EntryID == 0)
			return;
		var v = window.find("BuyCarRecord").IsItem(_EntryID,0);
//		if ( v == 1 )
//		{
//			window.find("UIController").LoadDLG(638);//你的购物车中已存在此物品，是否要放入购物车
//			window.find("VMB_ToBuyCar_Logic").m_EntryID = parent.m_EntryID;
//			return;
//		}
		if(window.GetCurClassID()/window.GOODS_CLASS_BASE == window.GOODS_CLASS_Suit)
		{
			var _data = GetSuitItemNum(_EntryID);
			if(window.find("BuyCarRecord").GetNum(0) + toint(_data) > window.MALL_BUYCAR_MAXNUM)
			{
				window.find("UIController").LoadDLG(641);
				return;
			}
			else
			{
				if ( v == 1 )
				{
					var _VNet2DBRow=new VNet2DBRow{}
					_VNet2DBRow.InitByInt( window.M_G_GOODS,window.ITEMS,window.M_G_GOODS_ITEMS_ENTRY,_EntryID);
					if(tostring(_VNet2DBRow.GetData(window.M_G_GOODS_ITEMS_TLIMITBUYTIME))=="0")
					{
						window.find("BuyCarRecord").Add(_EntryID,0,0);
						window.find("UIController").LoadDLG(631);
					}
					else
					{
						window.find("UIController").LoadDLG(638);//你的购物车中已存在此物品，是否要放入购物车
						window.find("VMB_ToBuyCar_Logic").m_EntryID = _EntryID;
					}
					_VNet2DBRow.del();
					return;
				}
				else
				{
					OnClick_ToBuyCar(_EntryID);
					window.find("UIController").LoadDLG(631);
				}
			}
		}
		else
		{
			if(window.find("BuyCarRecord").GetNum(0) >= window.MALL_BUYCAR_MAXNUM)
			{
				window.find("UIController").LoadDLG(641);
				return;
			}
			else
			{
				if ( v == 1 )
				{
					
					var _VNet2DBRow=new VNet2DBRow{}
					_VNet2DBRow.InitByInt( window.M_G_GOODS,window.ITEMS,window.M_G_GOODS_ITEMS_ENTRY,_EntryID);
					if(tostring(_VNet2DBRow.GetData(window.M_G_GOODS_ITEMS_TLIMITBUYTIME))=="0")
					{
						window.find("BuyCarRecord").Add(_EntryID,0,0);
						window.find("UIController").LoadDLG(631);
					}
					else
					{
						window.find("UIController").LoadDLG(638);//你的购物车中已存在此物品，是否要放入购物车
						window.find("VMB_ToBuyCar_Logic").m_EntryID = _EntryID;
					}
					_VNet2DBRow.del();
					return;
				}
				else
				{
					OnClick_ToBuyCar(_EntryID);
					window.find("UIController").LoadDLG(631);
				}
			}
		}
	}

	void Checkitempacknum(_ItemEntryID)
	{
		//需要对套装拆分 每个进行判断是否背包有此物品
		var data = window.find("BuyCarRecord").GetItem(_ItemEntryID);//alert("data:"+data);
		var num = window.GetSplitCount(data,",");
		var arr = window.SplitStr2(data,",",num);
		var i = 0;
		var bnofind = 1;
		while (i<num)
		{
			var entryid = toint(arr[i]);//alert("arr[i]="+arr[i]);
			i+=1;
//			if ( window.GetItemSexByID(entryid) != 0 )
//			{
				var packnum = window.GetItemNumByEnterID(entryid);//alert("entryid:"+entryid+" packnum:"+packnum)
				var packId = window.GetPackIDbyCIDInPack(entryid);
				if ( packnum == 1&&packId!=window.GOODS_CLASS_DeadProps )
				{
					bnofind = 0;
					break;
				}
//			}
		}
		return bnofind;
	}
	//设置响应事件
	void SetEvent()
	{
		set s_Btn_ToBuyCar//放入购物车
		{
			void OnPressed()
			{
				if ( parent.Checkitempacknum(parent.m_EntryID) != 1 )//检测背包中是否有此物品
				{
					window.find("UIController").LoadDLG(835);
					window.find("VMB_AddToShopCar_Logic").m_EntryID = parent.m_EntryID;
				}
				else
				{
					parent.AddToShopCar(parent.m_EntryID);
					parent.parent.parent.parent.s_Btn_ShoppCar.SetFlicker(1);
				}
			}
		}
	}
	Init();
	SetEvent();
	//====================================================================
//	void OnLBDClick()
//	{
//		if (m_Sex == window.GetMySex())//是同性物品：双击是购买
//		{
//			OnClick_Buy();
//		}
//		else//非同性物品：双击是赠送
//		{
//			OnClick_Gift();
//		}
//	}
	void OnSelect()
	{
		OnMySelect();

		parent.parent.parent.parent.SelectItem(m_EntryID);
	};
	void OnUnSelect()
	{
		OnMyUnSelect();
		parent.parent.parent.parent.UnSelectItem();
	};
	void OnDataExchange(iRow,szData)
	{
		var _Price = 0;
		m_EntryID = szData;
		name = "Name_VColumn_Mall_DressList_"+m_EntryID;
		m_Class = parent.fieldstr(iRow,window.M_G_GOODS_ITEMS_CLASS);	//Class
		m_DisplayID = parent.fieldstr(iRow,window.M_G_GOODS_ITEMS_DISPLAY);	//DisplayID
		m_MoneyType = parent.fieldstr(iRow,window.M_G_GOODS_ITEMS_USEPRICETYPE);//购买所需金币类型1,金币;2,点券;3,Pk点
		m_Sex = parent.fieldstr(iRow,window.M_G_GOODS_ITEMS_SEX);	//性别 1男 3女
		m_Attribute = parent.fieldstr(iRow,window.M_G_GOODS_ITEMS_ATTVALUE);	//属性值
		m_SaleAttribute = parent.fieldstr(iRow, window.M_G_GOODS_ITEMS_TSTATE); //TState, 68 网球：0.正常 1.限时、2.限量、3.新品、4.折扣、5.热销 
		m_IsHotSale = parent.fieldstr(iRow, window.M_G_GOODS_ITEMS_HOTSELL);	// 热销标志
		_Price = parent.fieldstr(iRow,window.M_G_GOODS_ITEMS_TBUYPRICE);//购买价格
		
		var _Lv = parent.fieldstr(iRow,window.M_G_GOODS_ITEMS_QUALITY);	
		var _Num = parent.fieldstr(iRow,window.M_G_GOODS_ITEMS_SUBNUM);	

		// 得到相关数据
		var _LimitBuyTimeCnt = parent.fieldstr(iRow, window.M_G_GOODS_ITEMS_LIMITBUYTIMECOUNT);//LimitBuyTimeCount, 46 网球：限时购买数量
		var _CurrTime = window.g_ShopTimeNow;// 当前时间, 从洋洋那里得到
		var _StartTime = window.find("CMallGoods").GetGoodsBeginTime(m_EntryID);// 得到毫秒级的时间
		var _EndTime = window.find("CMallGoods").GetGoodsEndTime(m_EntryID);// 得到毫秒级的时间

		s_Btn_ToBuyCar.show = true;
		m_IsBuyDClick = 1;
		switch(toint(m_SaleAttribute))
		{
			case 1:// 限时
				if (toint(_CurrTime) < toint(_StartTime) || toint(_CurrTime) > toint(_EndTime))// 如果物品未开始售卖 或物品已经截止
				{
					s_Btn_ToBuyCar.show = false;// "放入购物车"按钮
					m_IsBuyDClick = 0;
				}
				else
				{
					s_Btn_ToBuyCar.show = true;// "放入购物车"按钮
					m_IsBuyDClick = 1;
				}
			break;
			case 2:// 限量
				if (toint(_CurrTime) < toint(_StartTime) || toint(_CurrTime) > toint(_EndTime))// 如果物品未开始售卖 或物品已经截止
				{
					s_Btn_ToBuyCar.show = false;// "放入购物车"按钮
					m_IsBuyDClick = 0;
				}
				else
				{
					s_Btn_ToBuyCar.show = true;// "放入购物车"按钮
					m_IsBuyDClick = 1;
				
					// LimitTimeItem(当前频道物品卖掉的记录表)
					var _LimitItemDBRow = new VNet2DBRow{};
					_LimitItemDBRow.InitByInt(window.M_G_GOODS, window.LIMITTIMEITEM, window.M_G_GOODS_LIMITTIMEITEM_ENTRYID, toint(m_EntryID));
					if (_LimitItemDBRow.IsReady())
					{
						var _LimitCounted = _LimitItemDBRow.GetData(window.M_G_GOODS_LIMITTIMEITEM_NUM);// Num 当前频道该物品已经购买了的数量 
						if (toint(_LimitBuyTimeCnt) - toint(_LimitCounted) <= 0)// 当前频道物品总数 - 当前频道已经卖掉的物品数量 = 剩下多少个物品数量.
						{
							s_Btn_ToBuyCar.show = false;// "放入购物车"按钮
							m_IsBuyDClick = 0;
						}
						else
						{
							s_Btn_ToBuyCar.show = true;// "放入购物车"按钮
							m_IsBuyDClick = 1;
						}
						_LimitItemDBRow.del();// 释放
					}
					else
						_LimitItemDBRow.del();// 释放LimitTimeItem表对象
				}
				break;
			case 3:// 新品
				if (toint(_CurrTime) < toint(_StartTime))// 如果物品未开始售卖
				{
					s_Btn_ToBuyCar.show = false;// "放入购物车"按钮
					m_IsBuyDClick = 0;
				}
				else
				{
					s_Btn_ToBuyCar.show = true;// "放入购物车"按钮
					m_IsBuyDClick = 1;
				}
				break;
			case 4:// 打折
				if (toint(_CurrTime) >= toint(_StartTime) && toint(_CurrTime) <= toint(_EndTime))	 // 如果 开始时间 <= 当前时间 <= 结束时间
				{
					var _txtDis = parent.fieldstr(iRow, window.M_G_GOODS_ITEMS_TDISCOUNT);	// _DisCount;打折价钱
					var _arrDiscount = window.SplitStr2(_txtDis,',');
					_Price = _arrDiscount[0];// 显示第一个期限价格
				}
				else
				{
					var _txtNormal = parent.fieldstr(iRow,window.M_G_GOODS_ITEMS_TBUYPRICE);	// 正常售价
					var _arrNormal = window.SplitStr2(_txtNormal,',');
					_Price = _arrNormal[0];
				}
				break;
		}
		// VIP购买优惠(这个单另算, 因为如果是VIP, 无论什么是打折还是其他什么状态, 都走VIP价格)
		var _vipValue = window.GetVipTypeByUID()
		if (_vipValue >= 1)// 如果玩家是VIP
		{
			var _txtVIP = parent.fieldstr(iRow, window.M_G_GOODS_ITEMS_TPRICEVIP);	// 得到VIP价格
			var _arrPriceVIP = window.SplitStr2(_txtVIP,',');
			if (toint(_arrPriceVIP[0]) <= 0)// 如果VIP价钱是0,也走正常价钱
			{
				var _txtNormal = parent.fieldstr(iRow, window.M_G_GOODS_ITEMS_TBUYPRICE);	// 得到正常价格
				var _arrPriceNormal = window.SplitStr2(_txtNormal,',');// 得到正常价位的有效数字
				_Price = _arrPriceNormal[0]; // 正常价格
			}
			else	
				_Price = _arrPriceVIP[0];
		}

		// 增加热卖属性
		s_Img_SaleBG.show = false;
		s_Img_SaleFont.show = false;
		if (window.find("VMall_Shopping_Logic").m_CurHotSaleState == 0 || 
			window.find("VMall_Shopping_Logic").m_SearchState == true)	// 如果是非"热销"标签页 或者 是搜索标签页
		{
			if (toint(m_SaleAttribute) != 0)	  // 如果等于0,就是正常显示
			{
				if (m_SaleAttribute != 4)
				{
					// 背景
					s_Img_SaleBG.SetSrc(m_SaleAttribute);
					s_Img_SaleBG.show = true;

					// 提示字
					s_Img_SaleFont.SetSrc(m_SaleAttribute);
					s_Img_SaleFont.show = true;
				}
				else
				{
					// 打折销售中
					if (toint(_CurrTime) >= toint(_StartTime) && toint(_CurrTime) <= toint(_EndTime))	 // 如果 开始时间 <= 当前时间 <= 结束时间
					{
						// 背景
						s_Img_SaleBG.SetSrc(m_SaleAttribute);
						s_Img_SaleBG.show = true;

						// 提示字
						s_Img_SaleFont.SetSrc(m_SaleAttribute);
						s_Img_SaleFont.show = true;
					}
				}
			}
		}
		if (m_Sex == window.GetMySex())//是同性物品：可购买+赠送+索要
		{
			s_GID.SetIconEx(m_EntryID,_Lv,_Num);
			s_GID.SetOprtIndex(window.ICON_OPRT_BUY);//悬停
		}
		else//非同性物品：不可购买+只可赠送+不可索要
		{
			s_GID.SetIconEx(m_EntryID,_Lv,_Num);
			s_GID.SetOprtIndex(window.ICON_OPRT_NULL);//悬停
		}
		m_PriceArr = window.SplitStr2(_Price,",",_limitTimeNum);//价格-返回一个数组
		SetPriceByTime(0);
		printf("xiayy:m_EntryID:"+m_EntryID+",m_Class:"+m_Class+",m_DisplayID:"+m_DisplayID+
			",m_MoneyType:"+m_MoneyType+",_Price:"+_Price+",m_Sex:"+m_Sex+
			",m_Attribute:"+m_Attribute+",_Lv:"+_Lv+",_Num:"+_Num);
	}
	//根据时间设置价格
	//参数 index：有效期的序号0-~
	void SetPriceByTime(index)
	{
		s_ItemGold.SetData(m_PriceArr[index],m_MoneyType); //购买价格
	}

	//[功能]根据ENTRY获取套装里的装备数量	夏洋洋添加于2009-12-21
	//[参数值]enterID：entryID值
	//[返回值]套装里的装备数量
	void GetSuitItemNum(enterID)
	{
		window.g_Row.InitByInt(window.M_G_GOODS,window.ITEMS,window.M_G_GOODS_ITEMS_ENTRY,enterID);
		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			if (window.g_DEBUG)
			{
				printf("B# error-GetItemSexByID:DBname:"+window.M_G_GOODS+",TBName:"+window.ITEMS+",enterid:"+enterID);
			}
			return window.DB_ERR;
		}
		var _SuitList = ""+window.g_Row.GetData(window.M_G_GOODS_ITEMS_SUITLIST);
		window.g_Row.Release();
		var _SuitItemNum = window.GetSplitCount(_SuitList,",");
		return _SuitItemNum;
	}
};

//
//总的类：List
//
class VMall_DressList_Logic VN2ListCtrl
{
	//需要显示时改变
	size="500,380";valign(62,0);halign(70,0);
	//
	selecttype="1";colfilter="0";simpleshowmode="1,10";
	alpha = 70;bgcolor = "#FF0000";
	
//	var _RID = window.GetRIDByUID();//角色RoleID

	inclass("VMall_DressList_UI"); //界面显示类

	columclass="0,VColumn_Mall_DressList_Logic"; //识别id

	//[功能]为了选中某一个子对象
	//[参数]itemid：物品ID
	void SelectSubObjBy(itemid)
	{
		var _left = find("Name_VColumn_Mall_DressList_"+itemid).left;
		var _top = find("Name_VColumn_Mall_DressList_"+itemid).top;
		checkselect(_left+5,_top+5);
	}
};