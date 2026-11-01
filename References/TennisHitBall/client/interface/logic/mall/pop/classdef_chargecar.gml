//商城-续费类定义
// chenjihui  2011-1-5

importex("$./../../../UI/Mall/Pop/ClassDef_ChargeCar.gml");
//importex("$./../../../UI/GmlCtrls/VListOld/ClassDef_Friend_DropMenu.gml");
//importex("$./../../../UI/GmlCtrls/VButton/ClassDef.gml");
//importex("$./../../../UI/GmlCtrls/VScroll/ClassDef.gml");
importex("$./ClassDef_ChargeCar_DBList.gml");
//importex("$./ClassDef_PropContinue_DBlist.gml");


class VMall_ChargeCar_Logic item
{
	size = "100%,100%";bgcolor = "#FFFFFF";
	var m_SelectType = 0;
	var m_Init = false;
//	var m_Init = false;
	var m_Jid = "";
	var m_BuyParam = "";
	var m_SendParam = "";
	var m_AskParam = "";
	var m_haveLeaveWordFlag = 0;	//是否有留言的标志，0为没有留言，1为有留言
	var _tempJID = 0;
	var _tempMsg = "";
	var m_BtnLayerIndx = 0;	 // 初始标签
	var m_arrBtnCheckAll = sysarray(6);	// 检测"全选"状态 0:未选中, 1:选中
	var m_SQL = "";		//当前SQL
	var m_Type = 1;	//1:所有 2:保存1 3:保存2...
	var m_ContinueItems = 0;
	var m_PropContinueType = 1; //快到期“1”，已到期“2”
	var	m_itemIds = "";
	var	m_items = "";
	var m_PCSQL = ""; //当前续费的SQL
	var m_PropContinueParam = "";	//道具续费参数
	var m_BuycarState = 2;//1购买，2续费
	var m_CardState = window.CheckPackCard();//记录背包中是否有卡
	var m_CardKind = 0;
	var m_HaveCard1=0;
	var m_HaveCard2=0;
	var m_LukyCardNum =window.GetPackLuckCardNum();//幸运卡数量
	var m_CanSelectNum = 0; //剩余的幸运卡数量
	var m_SlefSexSuit = 1;	//和自己的性别匹配
	var m_OtherSexSuit = 1;	//和赠送人的性别匹配
	var m_CBChkNum = 0;
	var m_ExangeTimes = 0;//记录list的初始化次数
	var m_deaditems  = "";//记录过期并且未续费的物品ID
	var m_deaditemscont = 0;//记录有几个未续费物品

	//=============================与界面交互========================================
	void Init()
	{
		//全部:RADIO
		staticvar s_R_All = new VMyRadio
		{
			Init("全部");pos = "0,0";
		}
		//保存1:RADIO
		staticvar s_R_Save1 = new VMyRadio
		{
			Init("保存1");pos = "100,0";
		}
		//保存2:RADIO
		staticvar s_R_Save2 = new VMyRadio
		{
			Init("保存2");pos = "200,0";
		}
		//保存3:RADIO
		staticvar s_R_Save3 = new VMyRadio
		{
			Init("保存3");pos = "300,0";
		}
		//保存4:RADIO
		staticvar s_R_Save4 = new VMyRadio
		{
			Init("保存4");pos = "400,0";
		}
		//保存5:RADIO
		staticvar s_R_Save5 = new VMyRadio
		{
			Init("保存5");pos = "500,0";
		}

		//全部选择:CheckBox
		staticvar s_CH_AllSel = new VMyCheckBox
		{
			Init("全部选择",0);pos = "550,40";
		}

		staticvar s_TotalPrice = new VMyText{pos = "40,260";src = "总价格:";}

		//购买:RADIO
		staticvar s_R_Buy = new VMyRadio
		{
			Init("购买");pos = "120,300";
		}
//		//赠送:RADIO
//		staticvar s_R_Send = new VMyRadio
//		{
//			Init("赠送");pos = "230,300";
//		}
//		//索要:RADIO
//		staticvar s_R_Ask = new VMyRadio
//		{
//			Init("索要");pos = "330,300";
//		}
//
//		//选他人支付时出现可支付人的下拉列表
//		staticvar s_CB_SelOther = new VDROPMENU_Friend_UI 
//		{
//			m_sizeX = 98;pos = "150,330";
//		}

		//留言
		//参数 data1:
		//staticvar s_LeaveWord = new edit{pos = "100,350";src ="留言测试!!!!!!!!"}
		//拥有金币
		//参数 data1:
		staticvar s_MyGold = new VMyText{src = "拥有金币:";pos = "50,400";}
		//我的奖券
		staticvar s_MyLottery = new BaseText{}
		//拥有点券
		//参数 data1:
		staticvar s_MyMoney = new VMyText{src = "拥有点券:";pos = "350,400";}

		//确定购买:按钮
		staticvar s_Btn_Enter = new VMyButton
		{
			Init("续费");pos = "50,450";
		}
//		//确定删除:按钮
//		staticvar s_Btn_Del = new VMyButton
//		{
//			Init("删除");pos = "150,450";
//		}
		//取消:按钮
		staticvar s_Btn_Esc = new VMyButton
		{
			Init("取消");pos = "350,450";
		}

		//帮助:按钮
		staticvar s_Btn_Help = new VMyButton
		{
			Init("?");halign(90,0);
		}
		//关闭:按钮
		staticvar s_Btn_Close = new VMyButton
		{
			Init("X");halign(100,0);
		}
	}
	inclass("VMall_ChargeCar_UI");//界面显示类
	Init();
	//==============================function=========================================

	void OnDelete(){window.InitMallVar();}

//	void AddAskParam(_Param)
//	{
//		var _tempParam = m_AskParam+";" + _Param
//		if(_tempParam.Count>=255)
//		{
//			Mall_Ask_SendRequestMsg(_Param);
//		}
//		m_AskParam += ";" + _Param;
//	}
	void AddBuyParam(_Param)
	{
		m_BuyParam =  _Param + ",";
	}
//	void AddSendParam(_Param)
//	{
//		m_SendParam +=  _Param + ",";
//	}
	//点击了取消-和关闭
	void OnClick_BtnEsc()
	{
		//window.Too_AddDeadProps(window.g_DeadPropsPackID);
		parent.del();
	}
	void adddeaditemstopack()
	{
		//window.Too_AddDeadProps(window.GOODS_CLASS_DeadProps,m_deaditemscont,m_deaditems);
		window.find("ChargeCarRecord").DelSelect();
		parent.del();
	}
	//点击了确定
	void OnClick_BtnConfirm()
	{
		printf("OnClick_BtnConfirm:"+m_SelectType)
//		if ( m_SelectType == window.MALL_OPT_BUY )
//		{
			m_BuyParam = "";
			//_MallChargeCarList.scriptprcallsub("BuyItem");
			printf("B# 购买参数："+m_BuyParam);
			//新新参数：iToUserId,iToUserSex,szToUserName,szToMsg,iEntryId,iNum,iLimitDayField

			

			// (段晓彤)需要增加一个判断, 是否可以买, 然后再发送消息
			window.g_Row.InitByInt(window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_UID,window.GetMyUID());
			if (!window.g_Row.IsReady())
			{
				window.g_Row.Release();
				printf("B# error-购买框:DBname:"+window.M_G_SERVER+",TBName:"+window.USERDT);
				return;
			}
			var _MyMoney = window.g_Row.GetData(window.M_G_SERVER_USERDT_TOTALMONEY);	// 拥有金币
			var _MyToken = window.g_Row.GetData(window.M_G_SERVER_USERDT_TOKENMONEY);//拥有奖券
			var _MyQuan = window.g_Row.GetData(window.M_G_SERVER_USERDT_TOTALTICKET);//拥有点券
			window.g_Row.Release();
			// 金币
			if (toint(window.find("MALL_Charge_LOGIC").m_TotalMoney) != 0)
			{
				var _Price = toint(window.find("MALL_Charge_LOGIC").m_TotalMoney);
				var _needPrice = _Price;

				if (toint(_needPrice) > toint(_MyMoney))
				{
					window.find("UIController").LoadDLG(350);	//余额不足
					return;
				}
			}
			// 奖券
			if (toint(window.find("MALL_Charge_LOGIC").m_TotalToken) != 0)
			{
				var _Price = toint(window.find("MALL_Charge_LOGIC").m_TotalToken);
				var _needPrice = _Price;

				if (toint(_needPrice) > toint(_MyToken))
				{
					window.find("UIController").LoadDLG(350);	//余额不足
					return;
				}
			}
			// 点券
			if (toint(window.find("MALL_Charge_LOGIC").m_TotalQuan) != 0)
			{
				var _Price = toint(window.find("MALL_Charge_LOGIC").m_TotalQuan);
				var _needPrice = _Price;

				if (toint(_needPrice) > toint(_MyQuan))
				{
					window.find("UIController").LoadDLG(350);	//余额不足
					return;
				}
			}
			_MallChargeCarList.scriptprcallsub("PropContinueParam");
			printf("C# m_PropContinueParam："+m_PropContinueParam);
//		}
			//timer(50,"adddeaditemstopack");
			window.find("ChargeCarRecord").DelSelect();
			parent.del();
	}

	//点击了右键菜单删除
	void OnClick_DelCur()
	{
		var _Row = window.find("VMall_ChargeCar_Logic_NAME").curselectrow();
		var _ID = window.find("VMall_ChargeCar_Logic_NAME").fieldstr(_Row,0);
		window.find("ChargeCarRecord").Del(_ID);
		window.find("MALL_Charge_LOGIC").RefreshTotalMoney();
		GetLuckyCardNum();
		DelayCheck();
		CheckCBBoxChkNum();
	}
	//点击了删除按钮
	void OnClick_Del()
	{
		window.find("ChargeCarRecord").DelSelect();
		window.find("MALL_Charge_LOGIC").RefreshTotalMoney();
		GetLuckyCardNum();
		DelayCheck();
		CheckCBBoxChkNum();
	}
//	//刷新玩家的物品列表 type: 1:所有 2:保存1 3:保存2...
	void RefreshSelect(type)
	{
//		if ( m_Init == false ) return;
		s_TotalPrice.SetValue(0,0,0,0);
		var sort = GetSortIndex(type);
		var _SQL = "SELECT * FROM " + window.CHARGECARSELECT + sort;
		printf("B# 商城购物车:_SQL："+_SQL);
		m_SQL = _SQL;
		m_Type = type;
		m_ExangeTimes = 0;
		window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VMall_ChargeCar_Logic",window.GAMEUI,_SQL);
		s_PageCtrl.setpageto(1);//强制翻到第一页
		m_ExangeTimes = 1;
		_MallChargeCarList.ScrollToEnd();
		window.SetMallBuyCarSelect(type);
		DelayCheck();
		CheckCBBoxChkNum();
		GetLuckyCardNum();
		s_CH_AllSel.UnCheck();
		s_CH_AllSel.MouseUnCheck();
		window.find("ChargeCarRecord").SelectBySex(window.GetMySex(),type,1);
	}

	void RefreshAll()
	{
		s_MaskWord.show = true;
		s_MaskBuy.show = true;
//		s_MaskSend.show = true;
//		s_MaskAsk.show = true;
		s_CB_SelOther.SetState(window.BTN_STATE_GREY);
	}

	void RefreshBuy()
	{
		s_MaskBuy.show = false;
		s_CB_SelOther.SetState(window.BTN_STATE_GREY);
		_MallChargeCarList.scriptprcallsub("SetPriceByTime");
		window.find("MALL_Charge_LOGIC").RefreshTotalMoney();
	}

//	void RefreshSend()
//	{
//		s_MaskSend.show = false;
//		s_CB_SelOther.SetState(window.BTN_STATE_LIGHT);
//		_MallChargeCarList.scriptprcallsub("SetPriceByTime");
//		window.find("MALL_BUY_LOGIC").RefreshTotalMoney();
//	}
//
//	void RefreshAsk(all)
//	{
//		s_MaskAsk.show = false;
//		s_CB_SelOther.SetState(window.BTN_STATE_LIGHT);
//		_MallChargeCarList.scriptprcallsub("SetPriceByTime");
//		window.find("MALL_BUY_LOGIC").RefreshTotalMoney();
//	}

	//刷新购买方式 type: 1:购买 2:赠送 3:索要
	void RefreshType(type)
	{ 
//		if (m_Init == false) return;
		RefreshAll();
//		window.find("BuyCarRecord").ClearSelect();
		window.SetMallBuyCarSendSex(-1);
		m_SelectType = type;

		RefreshBuy();
		_MallChargeCarList.scriptprcallsub("SetBuycarListPos",m_CardState);
		s_captureItem.show=true;
		s_LeaveWord.src = "续费享受9折优惠，并能与各类打折卡叠加，实现超低折扣\n"
+"（只有3天时限内的物品才能续费，并由系统自动放入此界面。已到期物品会自动进入您的背包“过期物品”中，可以随时购买，但不享受折扣，所以请抓住续费机会哦）";

		RefreshSelect(m_Type);
		CheckSuitMySex();
		s_CH_AllSel.UnCheck();
		s_CH_AllSel.MouseUnCheck();
//alert("refresh");
	}
	void GetSortIndex(type)
	{
		type -= 1;
		if ( type >= 1 )
		{
			return " WHERE type=" + type + " AND state=1";
		}
		return " WHERE state=1";
	}

	//设置响应事件
	void SetEvent()
	{
		//全部选择:CheckBox
		set s_CH_AllSel
		{
			var m_CheckNum = 0;
			void OnCheck()
			{
				if(!GetState()){return;}
				parent.m_arrBtnCheckAll[parent.m_BtnLayerIndx] = 1;
				MouseCheck();
//				m_CheckNum += 1;
//				if ( m_CheckNum == 1 )
//				{
//					return;
//				}
				window.find("ChargeCarRecord").ClearSelect();

				parent._MallChargeCarList.scriptprcallsub("SetSelCheck");
					
				parent.CheckCBBoxChkNum();
				parent.GetLuckyCardNum();
			}
			void OnUnCheck()
			{
				if(!GetState()){return;}
				parent.m_arrBtnCheckAll[parent.m_BtnLayerIndx] = 0;
				MouseUnCheck();
				window.find("ChargeCarRecord").ClearSelect();
				parent.CheckCBBoxChkNum();
				parent.GetLuckyCardNum();
			}

//			var select = window.find("BuyCarRecord").GetAllSelect();
//			startstate=select;
		}
		//购买:RADIO
		set s_R_Buy
		{
			groupname="VMall_Shopping_BuyCar_Type1111";
			startstate="1";
			var m_Value = 1;
			void OnCheck(){if (GetChecked()){return;}MouseCheck();parent.RefreshType(m_Value);}
			void OnUnCheck(){MouseUnCheck();}
		}
//		//赠送:RADIO
//		set s_R_Send
//		{
//			groupname="VMall_Shopping_BuyCar_Type1111";
//			if ( window.GetMallDLGType() == 2 ) startstate="1";
//			var m_Value = 2;
//			void OnCheck(){if (GetChecked()){return;}MouseCheck();parent.RefreshType(m_Value);}
//			void OnUnCheck(){MouseUnCheck();}
//		}
//		//索要:RADIO
//		set s_R_Ask
//		{
//			groupname="VMall_Shopping_BuyCar_Type1111";
//			if ( window.GetMallDLGType() == 3 ) startstate="1";
//			var m_Value = 3;
//			void OnCheck(){if (GetChecked()){return;}MouseCheck();parent.RefreshType(m_Value);}
//			void OnUnCheck(){MouseUnCheck();}
//		}

		//确定:按钮
		set s_Btn_Enter{void OnPressed(){if(GetState()==window.BTN_STATE_GREY){return;}parent.OnClick_BtnConfirm();}}
//		//删除：按钮
//		set s_Btn_Del{void OnPressed(){if(GetState()==window.BTN_STATE_GREY){return;}parent.OnClick_Del();}}
		//取消:按钮
		set s_Btn_Esc{void OnPressed(){parent.OnClick_BtnEsc();}}
		//帮助:按钮
//		set s_Btn_Help{void OnPressed(){window.CallBack_Help(window.POS_BUYCAR);}}
		//关闭:按钮
		set s_Btn_Close{void OnPressed(){parent.OnClick_BtnEsc();}}
		//选中其他人:LISTBOX
//		set s_CB_SelOther
//		{
//			//接口函数 WhichSelect:
//			//参数：jid 好友用
//			//		sex 性别
//			var _SelectSex =0;
//			void WhichSelect(jid,sex)
//			{
//				_SelectSex = sex;
//				parent.DelayCheck();
////				window.SetMallBuyCarSendSex(-1);
////				if ( parent.m_SelectType == 2 )
////				{
////					window.find("BuyCarRecord").SelectBySex(sex,1);
////					window.SetMallBuyCarSendSex(sex);
////				}
////				if ( parent.m_SelectType == 3 || parent.m_SelectType == 1 )
////				{
////					window.find("BuyCarRecord").SelectBySex(window.GetMySex(),1);
////				}
////				parent.m_Jid = jid;
//			}
//
//			void OnNameChange()
//			{
//				if ( parent.m_SelectType == 2 )
//				{
//					parent.RefreshType(parent.m_SelectType);
//					var askname = GetText();
//				//	var sex = window.GetSexByName_KF(askname);
//					window.find("BuyCarRecord").ClearSelect();
//					window.find("BuyCarRecord").SelectBySex(_SelectSex,1);	
//				}
//			}
//
//			SetID("BuyCar",2); //全部
//			SetPos(174,456);
//			SetSize(145,166);
//			SetSelectType(2);
//		}
	}


	var _listState = false;
	void CreateList()
	{
		_listState = true;
		staticvar _BCPropContinueItemList = new VMall_ChargeCar_Logic_List
		{
			name = "VItem_BCPropContinue_Logic_List_NAME";
			if(parent.m_PropContinueType == 1)
			{
				window.find("G_DBMANAGE").RegDbTable(this,window.M_G_GOODS,window.PLAYERITEMS,"Bind_VItem_BCPropContinue_Logic_List_NAME");// 绑定数据表
			}
			else
			{
				window.find("G_DBMANAGE").RegDbTable(this,window.M_G_GOODS,window.ITEMS,"Bind_VItem_BCPropContinue_Logic_List_NAME");// 绑定数据表
			}
			
			void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);} //移除绑定
		}
	}
	
	
	
	void SetPropContinueItemList(_itemIds,_items,_type)
	{
		m_PropContinueType = _type;
		m_itemIds = _itemIds;
		m_items = _items;

//		if(!_listState)
//		{
//			CreateList();
//		}
		var _count = window.GetSplitCount(m_itemIds,",");
		var _itemsArray = window.SplitStr2(m_itemIds,",",_count);
		var _limitCondition = "";
		var _index = 0;
		if(_count == 0)
		{
			if(m_PropContinueType == 1)
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
			if(m_PropContinueType == 1)
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
		if(m_PropContinueType == 1)
		{
			_SQL = "SELECT * FROM "+window.PLAYERITEMS+_limitCondition;
		}
		else
		{
			_SQL = "SELECT * FROM "+window.ITEMS+_limitCondition;
		}
		printf("C# 续费物品列表_SQL:"+_SQL);
		m_PCSQL = _SQL;
		window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VItem_BCPropContinue_Logic_List_NAME",window.M_G_GOODS,_SQL);
	}

	void Reflash()
	{
		SetPropContinueItemList(m_itemIds,m_items,m_Type);
	}

	//道具续费参数
	void PropContinueParam(_Param)
	{
//		alert("param="+_Param);
		m_PropContinueParam =  _Param + ",";
	}


	//================================DBList=========================================
	var _MallChargeCarList = new VMall_ChargeCar_Logic_List
	{
		name = "VMall_ChargeCar_Logic_NAME";
		window.find("G_DBMANAGE").RegDbTable(this,window.GAMEUI,window.CHARGECARSELECT,"Bind_VMall_ChargeCar_Logic");// 绑定数据表
		void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);} //移除绑定
		void PageviewEnd() // 翻页结束后调用
		{
			//printf("B# 商城-购物-服饰物品列表，PageviewEnd\n");
		}
		void OnChgSize(data)
		{
			if(data==0){parent.SetBuycarPos(0,0);}
		}
	}
	//================================DB-Opt=========================================
	//从数据库中取相关数据 
	void GetDataFromDB()
	{
		window.g_Row.InitByInt(window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_UID,window.GetMyUID());
		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-购买框:DBname:"+window.M_G_SERVER+",TBName:"+window.USERDT);
			return;
		}
		s_MyGold.SetData(window.g_Row.GetData(window.M_G_SERVER_USERDT_TOTALMONEY));//拥有金币
		s_MyLottery.SetData(window.g_Row.GetData(window.M_G_SERVER_USERDT_TOKENMONEY));//拥有奖券
//		s_MyMoney.SetData(window.g_Row.GetData(window.M_G_SERVER_USERDT_TOTALTICKET));//拥有点券
		s_MyMoney.SetData(window.g_Row.GetData(window.M_G_SERVER_USERDT_TOTALTICKET));//拥有点券
		window.g_Row.Release();
	}
	//检查选中的数量
	void CheckCBBoxChkNum()
	{
		m_CBChkNum=0;
		_MallChargeCarList.scriptprcallsub("CheckCBChk");
		if(m_CBChkNum>0)
		{
			s_Btn_Enter.SetState(window.BTN_STATE_LIGHT);
			s_Btn_Del.SetState(window.BTN_STATE_LIGHT);
		}
		else
		{
			s_Btn_Enter.SetState(window.BTN_STATE_GREY);
			s_Btn_Del.SetState(window.BTN_STATE_GREY);
		}
	}

	void GetLuckyCardNum()
	{
//		if (m_SelectType == window.MALL_OPT_ASK)
//			return ;
//		_MallChargeCarList.SetMyMenu();
		m_CanSelectNum=m_LukyCardNum;
		m_HaveCard1=0;
		m_HaveCard2=0;
		_MallChargeCarList.scriptprcallsub("CheckLuckyCardNum");
		SetBuycarPos(m_HaveCard1,m_HaveCard2);
		if(m_CanSelectNum<1){_MallChargeCarList.scriptprcallsub("GreyMyMenu");return;}
		if(m_CanSelectNum==1){_MallChargeCarList.scriptprcallsub("LightMyMenu");return;}
	}

	void CheckSuitMySex()
	{
		m_SlefSexSuit=1;
		_MallChargeCarList.scriptprcallsub("CheckSuitMySex");
		if(m_SlefSexSuit)
		{
			s_CH_AllSelPH.SetState(window.BTN_STATE_LIGHT);
			s_CH_AllSel.SetLight();
		}
		else
		{
			s_CH_AllSelPH.SetState(window.BTN_STATE_GREY);
			s_CH_AllSel.SetGrey();
		}
	}
	void CheckSuitOtherSex()
	{
		m_OtherSexSuit=1;
		_MallChargeCarList.scriptprcallsub("CheckSuitOtherSex");
		if(m_OtherSexSuit)
		{
			s_CH_AllSelPH.SetState(window.BTN_STATE_LIGHT);
			s_CH_AllSel.SetLight();
		}
		else
		{
			s_CH_AllSelPH.SetState(window.BTN_STATE_GREY);
			s_CH_AllSel.SetGrey();
		}
	}

	void DelayCheck()
	{
		CheckSuitMySex();
	}


	void Inited()
	{
		m_Init = true;
		parent.RefreshTotalMoney();
//		RefrestSelect();
		_MallChargeCarList.scriptprcallsub("SetPriceByTime");
	}

	void OnCreated()
	{
		SetEvent();
		GetDataFromDB();

		var type = window.GetMallDLGType();
		RefreshBuy();
		m_SelectType=1;

		timer(200,"Inited");

		if(m_CardState==1 || m_CardState==3)
		{
			SetBuycarPos(1,0);
		}
		else
		{
			SetBuycarPos(0,0);
		}
		//timer(500,"CheckSuitMySex");
	}
};