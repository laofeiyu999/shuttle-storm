//chenjihui 2011-1-5
//商城-购物-服饰的物品list


importex("$./../../UI/Mall/Pop/ClassDef_ChargeCar_DBList.gml");

//一行显示类：图标+名称+有效期+金币+点券+索要+购买+赠送
class VColumn_ChargeCar_Logic item
{
	size = "600,35";
	var m_Gid = 0;
	var m_EntryID = 0;		//物品的ID
	var m_DisplayID = 0;		//物品的显示ID-Avatars
	var m_MoneyType = 0;		//购买所需金币类型 1,金币;2,点券;3,Pk点
	var m_PriceArr;			//价格的数组
	var m_Attribute = "";	//属性 "0,1,2,3,4,5"
	var m_Sex = 0;
	var m_GoldType = 0;
	var m_GoldValue = 0;
	var m_Sel = 0;
	var m_LimitTimeIndex = -1;
	var m_CardKindIndex = -1;
	var _arrcard = window.SplitStr2(window.g_AgioCard,",");
	//===========================与显示交互======================
	void Init()
	{
		//图标
		//参数 data1: 物品的识别ID
		//参数 sex: 是否为同性物品 1是 2不是
		staticvar s_GID = new VMyText{}

		//道具名称
		//参数 data1
		staticvar s_ItemName = new VMyText{pos = "50,0";border="#123456";}
		
		//道具价格
		//参数 data1:多少
		//参数 data2:类型 1,金币;2,点券;3,Pk点
		staticvar s_ItemGold = new VMyText{pos = "200,0";border="#123456";}

		//期限
		staticvar s_CB_Time = new VMyComboBox {m_sizeX = 98;pos = "300,0";border="#123456";}

		//选择
		staticvar s_CH_Sel = new VMyCheckBox
		{
			Init("选择");pos = "400,0"
		}
	}
	//需要被显示的类覆盖
	void OnMySelect(){bgcolor = "#FFEA99";alpha = 50;}	//选择的效果
	void OnMyUnSelect(){bgcolor = "-1";}				//不选择的效果
	inclass("VColumn_ChargeCar_Column_UI"); //界面显示类
	//===============================function==============================
	
	//设置响应事件
	void SetEvent()
	{
		//选择:CheckBox
		set s_CH_Sel
		{
			void OnCheck()
			{
				var type = parent.parent.parent.m_SelectType;//window.GetMallDLGType();
				if ( parent.m_Sex != 0 )
				{
					if ( parent.m_Sex != window.GetMySex() )
					{
						parent.m_Sel = 0;
						return;
					}
				}
				printf("s_CH_Sel-Success:"+parent.m_Gid);
				parent.m_Sel = 1;
				MouseCheck_UI();
				MouseCheck();
				parent.RefreshTotalMoney();
				parent.parent.parent.GetLuckyCardNum();
				parent.parent.parent.CheckCBBoxChkNum();
				window.find("ChargeCarRecord").Sel(parent.m_Gid,1);
			}
			void OnUnCheck()
			{
				parent.m_Sel = 0;
				MouseUnCheck_UI();
				MouseUnCheck();
				parent.RefreshTotalMoney();
				parent.parent.parent.GetLuckyCardNum();
				parent.parent.parent.CheckCBBoxChkNum();
				window.find("ChargeCarRecord").Sel(parent.m_Gid,0);
			}
		}

		set s_CB_Time
		{
			enableUpdate(1);
			var _timetype = 0;
			void WhichSelect(index)
			{
				parent.m_LimitTimeIndex = index;
				parent.SetPriceByTime(index);
				parent.RefreshTotalMoney();
			}
			void GetOffSetX()
			{
				return (parent.parent.parent.getViewX()+parent.parent.getViewX()+parent.getViewX()+parent.parent.parent.left+parent.parent.left+parent.left);
			}
			void GetOffSetY()
			{
				return (parent.parent.parent.getViewY()+parent.parent.getViewY()+parent.getViewY()+parent.parent.parent.top+parent.parent.top+parent.top);
			}
			void CheckDropMenuView()
			{
				var _top = top+parent.top+parent.parent.getViewY()+18;
//				printf("下拉框位置："+_top);
				if(_top<0 || _top>parent.parent.height){window.find("Menu"+m_DropMenuId).ShouldHide();}
				else{window.find("Menu"+_Menu.m_DropMenuId).ShouldShow();}
			}
			void setTimeMenuPos()
			{
				if(parent.parent.parent.m_CardState!=0)
				{SetPos(148,66);}
				else
				{SetPos(170,66);}
			}
			void SetPosFunc(data)
			{
				if(data){SetPos(148,66);}
				else{SetPos(170,66);}
			}
			void OnUpDate()
			{
				//效率问题 加上判断
				if(m_isListShow == false){return};
				setTimeMenuPos();
				//SetPos(170,66);
				CheckDropMenuView();
				sleep(1000);
			}
		}

		set s_CB_CardSelect
		{	
			enableUpdate(1);
			var _CardType =0;
			void WhichSelect(index)
			{
				_CardType = index;
				parent.m_CardKindIndex = index;
				parent.SetPriceByTime(index);
				parent.RefreshTotalMoney();
				parent.parent.parent.m_CardKind = index;
				parent.parent.parent.GetLuckyCardNum();
			}
			void GetOffSetX()
			{
				return (parent.parent.parent.getViewX()+parent.parent.getViewX()+parent.getViewX()+parent.parent.parent.left+parent.parent.left+parent.left);
			}
			void GetOffSetY()
			{
				return (parent.parent.parent.getViewY()+parent.parent.getViewY()+parent.getViewY()+parent.parent.parent.top+parent.parent.top+parent.top);
			}
			void CheckDropMenuView()
			{
				var _top = top+parent.top+parent.parent.getViewY()+18;
//				printf("下拉框位置："+_top);
				if(_top<0 || _top>parent.parent.height){window.find("Menu"+m_DropMenuId).ShouldHide();}
				else{window.find("Menu"+_Menu.m_DropMenuId).ShouldShow();}
			}
			void OnUpDate()
			{
				//效率问题 加上判断
				if(m_isListShow == false){return};
				SetPos(290,7);
				CheckDropMenuView();
				sleep(1000);
			}
		}

		set s_ItemGold
		{
			void SetGold(type,value)
			{
				parent.m_GoldType = type;
				parent.m_GoldValue = value;
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

	void OnMouseDownR()
	{
//		parent.checkselect(20,parent.mousey);
//		set window.find("TOPLAYER")
//		{
//			new VMyMouseR_BuyCar
//			{
//				void On_Del(data)
//				{
////					var _Row = window.find("VMall_BuyCar_Logic_NAME").curselectrow();
////					var _ID = window.find("VMall_BuyCar_Logic_NAME").fieldstr(_Row,0);
////					window.find("BuyCarRecord").Del(_ID);
////					window.find("MALL_Charge_LOGIC").RefreshTotalMoney();
////					window.find("MALL_Charge_LOGIC")._BuyCar.OnClick_DelCur();
//					window.find("UIController").LoadDLG(682);
//				}
//
//				void On_DelAll(data)
//				{
//					window.find("UIController").LoadDLG(632);
//				}
//			}
//		}
	}
	void OnSelect()
	{
		OnMySelect();
	};
	void OnUnSelect(){OnMyUnSelect();};

	void OnDataExchange(iRow,szData)
	{
		if(parent.parent.m_ExangeTimes<1)
		{
			parent._iRow = iRow;
			m_Gid = szData;
			m_EntryID = parent.fieldstr(iRow,window.GAMEUI_CHARGECARSELECT_CID);
			s_ItemName.SetData(parent.fieldstr(iRow,window.GAMEUI_CHARGECARSELECT_NAME),"",""); //名称
			m_MoneyType = parent.fieldstr(iRow,window.GAMEUI_CHARGECARSELECT_PRICETYPE);//购买所需金币类型1,金币;2,点券;3,Pk点
			var _Price = parent.fieldstr(iRow,window.GAMEUI_CHARGECARSELECT_PRICE);//购买价格
			var _Time = parent.fieldstr(iRow,window.GAMEUI_CHARGECARSELECT_TIME);//购买时间
			m_Sex = parent.fieldstr(iRow,window.GAMEUI_CHARGECARSELECT_SEX);	//性别 1男 3女
	//		m_Attribute = parent.fieldstr(iRow,window.M_G_GOODS_ITEMS_ATTVALUE);	//属性值
			
			var _Lv = window.GetIconLvByEnterID(m_EntryID);
			var _num = window.GetSubNumByItemID(m_EntryID);
//
			if (m_Sex == window.GetMySex())//是同性物品：可购买+赠送+索要
			{
				s_GID.SetIconEx(m_EntryID,_Lv,_num);
	//			parent.parent.s_CH_AllSelPH.SetState(window.BTN_STATE_LIGHT);
	//			parent.parent.s_CH_AllSel.SetState(window.BTN_STATE_LIGHT);
			}
			else//非同性物品：不可购买+只可赠送+不可索要
			{
				s_GID.SetIconEx(m_EntryID,_Lv,_num);
	//			parent.parent.s_CH_AllSelPH.SetState(window.BTN_STATE_GREY);
	//			parent.parent.s_CH_AllSel.SetState(window.BTN_STATE_GREY);
			}

			//var _limitTimeNum = window.GetSplitCount(_Price,","); //有效期的个数
			m_PriceArr = window.SplitStr2(_Price,",");//价格-返回一个数组
			var _arrTime = window.SplitStr2(_Time,",");
			var _num = window.GetSplitCount(_Time,",");
			var _index=0;
			var _Time2 = "";
			while(_index<_num)
			{
				if(toint(_arrTime[_index])!=0)
				{
					_arrTime[_index] = ""+_arrTime[_index]+"天";
				}
				if(_Time2 == "")
				{
					_Time2 += _arrTime[_index];
				}
				else
				{
					_Time2 += ","+_arrTime[_index];
				}
				_index+=1;
				
			}
			if ( m_LimitTimeIndex == - 1 )
			{
				m_LimitTimeIndex = 0;
			}
			s_CB_Time.SetID(szData);
			s_CB_Time.setTimeMenuPos();
			//s_CB_Time.SetPos(170,66);
			s_CB_Time.SetWidthAndType(140,0);
			s_CB_Time.SetData(_Time2);
			s_CB_Time.SetDefaultSrc(_arrTime[m_LimitTimeIndex]);
			s_CB_CardSelect.SetID(""+szData+"card");
			s_CB_CardSelect.SetPos(290,7);
			s_CB_CardSelect.SetWidthAndType(70,0);
			s_CB_CardSelect.SetData("无,折扣卡,幸运卡");

			if(parent.parent.m_CardState==3 || parent.parent.m_CardState==1)
			{
				s_CB_CardSelect.SetDefaultSrc("折扣卡");
				s_CB_CardSelect._CardType=1;
				s_CB_CardSelect.LightIndex(1);
				s_CB_CardSelect.LightIndex(2);
				if(parent.parent.m_CardState==1){s_CB_CardSelect.GreyIndex(2);}
				//else{s_CB_CardSelect.LightIndex(2);}
			}
			else
			{
				s_CB_CardSelect.SetDefaultSrc("无");
				s_CB_CardSelect._CardType=0;
				s_CB_CardSelect.GreyIndex(1);
				if(parent.parent.m_CardState==0)
				{
					SetBuycarListPos(0);
					s_CB_CardSelect.GreyIndex(2);
				}
				else{s_CB_CardSelect.LightIndex(2);}
			}
		}
		SetPriceByTime();

		var check = parent.fieldstr(iRow,window.GAMEUI_CHARGECARSELECT_SELECT);
		if ( check )
		{
			s_CH_Sel.Check();
		}
		else
		{
			s_CH_Sel.UnCheck();
		}
		RefreshTotalMoney();
	}

	void CheckCBChk()
	{
		SetPriceByTime();
		if(!s_CH_Sel.GetChecked()){return;}
		parent.parent.m_CBChkNum = 1;
	}

	//根据时间设置价格
	//参数 index：有效期的序号0-~
	void SetPriceByTime()
	{
//		s_ItemGold.SetData(m_PriceArr[index],m_MoneyType); //购买价格

		var _vipValue = window.GetVipTypeByUID()
		var _DeadORLive = window.CheckPackItemDeadLine(window.GOODS_CLASS_PropaLCard);
		
		if(s_CB_CardSelect._CardType!=0)
		{
			if( parent.parent.m_LukyCardNum !=0  || _DeadORLive == true)
			{
				s_ItemGold.SetData( toint(m_PriceArr[m_LimitTimeIndex]) ,m_MoneyType,1);
			//s_ItemGold.SetData( toint(toint(m_PriceArr[m_LimitTimeIndex]) * window.GetVipBuyAgio(_vipValue) * 100 / 100) ,m_MoneyType,1);
			}
			else
			{
				s_ItemGold.SetData(m_PriceArr[m_LimitTimeIndex],m_MoneyType,0);
			}
		}
		else
		{
			s_ItemGold.SetData(m_PriceArr[m_LimitTimeIndex],m_MoneyType,0);
		}
	}

	void CheckSuitMySex()
	{
//		alert("CheckSuitMySex m_Sex="+m_Sex+",window.GetMySex()="+window.GetMySex());
		if(m_Sex != window.GetMySex() && m_Sex!=0)
		{
			parent.parent.m_SlefSexSuit = 0;
		}
	}
	void CheckSuitOtherSex()
	{
//		alert("CheckSuitOtherSex m_Sex="+m_Sex+",arent.parent.s_CB_SelOther._SelectSex="+arent.parent.s_CB_SelOther._SelectSex);
		if(parent.parent.s_CB_SelOther._SelectSex==0)
		{
			parent.parent.m_OtherSexSuit = 0;
			return;
		}
		if(m_Sex != parent.parent.s_CB_SelOther._SelectSex && m_Sex!=0)
		{
			parent.parent.m_OtherSexSuit = 0;
		}
	}
	
	void CheckLuckyCardNum()
	{
		if(s_CB_CardSelect._CardType==2 && s_CH_Sel.GetChecked()){parent.parent.m_CanSelectNum -=1;}
		ReturnCardState();
	}
	void GreyMyMenu()
	{
		if(s_CB_CardSelect._CardType==2){return;}
		s_CB_CardSelect.GreyIndex(2);
	}
	void LightMyMenu()
	{
		s_CB_CardSelect.LightIndex(2);
	}
	void SetMyMenu()
	{
		if(parent.parent.m_CardState==1)
		{
			s_CB_CardSelect.LightIndex(1);
			s_CB_CardSelect.GreyIndex(2);
			return;
		}
		if(parent.parent.m_CardState==2)
		{
			s_CB_CardSelect.LightIndex(2);
			s_CB_CardSelect.GreyIndex(1);
			return;
		}
		if(parent.parent.m_CardState==3)
		{
			s_CB_CardSelect.LightIndex(1);
			s_CB_CardSelect.LightIndex(2);
			return;
		}

	}

	//调整位置
	void AdjustComBoxPos()
	{
		//timer
		//s_CB_Time.SetPos(170,66);
	}

	void AddMoney()
	{
		if ( m_Sel == 1 )
		{
			parent.parent.parent.AddMoney(m_GoldType,m_GoldValue);
		}
	}

	void BuyItem()
	{
		if ( m_Sel == 1 )
		{	
			var _Param = "-1,"+m_EntryID+",1,"+m_LimitTimeIndex+","+_arrcard[s_CB_CardSelect._CardType]
			parent.parent.AddBuyParam(_Param);
		}
	}

	void SendItem()
	{
		if ( m_Sel == 1 )
		{
			var _Param = "-1,"+m_EntryID+",1,"+m_LimitTimeIndex+","+_arrcard[s_CB_CardSelect._CardType]
			parent.parent.AddSendParam(_Param);
		}
	}

	void AskItem(jid)
	{
		if ( m_Sel == 1 )
		{
			var _Param = ""+m_EntryID+"."+m_LimitTimeIndex;
			parent.parent.AddAskParam(_Param);
		}
	}

	void RefreshTotalMoney()
	{
		parent.parent.parent.RefreshTotalMoney();
//		parent.parent.parent.parent.RefreshTotalMoney();
//		parent.parent.parent.parent.parent.RefreshTotalMoney();
	}

	void SetSelCheck()
	{
		s_CH_Sel.UnCheck();
		s_CH_Sel.Check();
	}
	void RefreshAsk()
	{
		s_ItemGold.SetData(m_PriceArr[m_LimitTimeIndex],m_MoneyType,0);
	}

	void PropContinueParam() //判断物品是否快到期，是则续费，否则购买。
	{	
		var _ItemsliveAB = window.CheckPackItemDeadLineByEntryID(m_EntryID);
		var _type = parent.parent.m_PropContinueType;
		if(m_Sel == 1 )
		{
			if(parent.parent.m_BuycarState == 2 && parent.parent.m_BtnLayerIndx == 0)
			{
				if (_ItemsliveAB != 1 && _ItemsliveAB != 0)
				{	
					var _Param = ""+_ItemsliveAB+","+m_EntryID+",1,"+m_LimitTimeIndex+","+_arrcard[s_CB_CardSelect._CardType];
					parent.parent.PropContinueParam(_Param);
//					window.Too_AddShopCar("-1,-1,,,"+_Param);
					var mParam = ""+_ItemsliveAB+",-1,,,"+_Param);
					window.Too_AddShopCar(mParam);
				}
				if(_ItemsliveAB == 0 || _ItemsliveAB == 1 ) //背包中无此物品
				{
					BuyItem();
					window.Too_AddShopCar("-1,-1,,,"+parent.parent.m_BuyParam);
					printf("_arrcard[s_CB_CardSelect._CardType]="+_arrcard[s_CB_CardSelect._CardType]);
				}
			}
			else
			{
				BuyItem();
				window.Too_AddShopCar("-1,-1,,,"+parent.parent.m_BuyParam);
			}
		}
		var _deaditemAB = window.CheckCIDItemDeadLine(m_EntryID);
		if ( m_Sel == 0 && _deaditemAB == 0 )
		{
			if ( parent.parent.m_deaditems != "")
			{
				parent.parent.m_deaditems += ","+tostring(m_EntryID);
			}
			else
			{
				parent.parent.m_deaditems += tostring(m_EntryID);
			}
			parent.parent.m_deaditemscont += 1;
		}

//		if(_Itemslive == 0)
//		{
//			window.g_MyItemsCheck.AddDeadItems(m_EntryGID);
//		}
	}
	void ReturnCardState()
	{
		if (!s_CH_Sel.GetChecked())
		{
			return;
		}
		switch(s_CB_CardSelect._CardType)
		{
			case 1:parent.parent.m_HaveCard1=1;break;
			case 2:parent.parent.m_HaveCard2=1;break;
		}
	}
};

//
//总的类：List
//
class VMall_ChargeCar_Logic_List VN2ListCtrl
{
	//需要显示时改变
	size="600,200";valign(15,0);halign(15,0);
	//
	selecttype="1";colfilter="0";//simpleshowmode="1,3";
	alpha = 70;bgcolor = "#FF0000";
	scroll = window.SCROLL_NOYES;

//	var _iRow = 0;
//	void ScrollToEnd()
//	{
//		var _targety = (_iRow.__Long__) * 35;
//		scrollto(0, _targety);
//	}
//	//移动到某个位置
//	void ScrollToIndex(index)
//	{
//		var _targety = index * 35;
//		scrollto(0, _targety);
//	}
	
	inclass("VMall_ChargeCar_UI_List"); //界面显示类

	var _RID = window.GetRIDByUID();//角色RoleID
	columclass="0,VColumn_ChargeCar_Logic"; //识别id
};