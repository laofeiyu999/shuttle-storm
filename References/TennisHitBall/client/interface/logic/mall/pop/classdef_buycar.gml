//商城-购买框类定义

importex("$./../../../UI/Mall/Pop/ClassDef_BuyCar.gml");
//importex("$./../../../UI/GmlCtrls/VListOld/ClassDef_Friend_DropMenu.gml");
//importex("$./../../../UI/GmlCtrls/VButton/ClassDef.gml");
//importex("$./../../../UI/GmlCtrls/VScroll/ClassDef.gml");
importex("$./ClassDef_BuyCar_DBList.gml");
//importex("$./ClassDef_PropContinue_DBlist.gml");


class VMall_BuyCar_Logic item
{
	size = "100%,100%";bgcolor = "#FFFFFF";
	var m_SelectType = 0;
	var m_Init = false;
//	var m_Jid = "";
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
	var m_BuycarState = 1;//1购买，2续费
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
		//赠送:RADIO
		staticvar s_R_Send = new VMyRadio
		{
			Init("赠送");pos = "230,300";
		}
		//索要:RADIO
		staticvar s_R_Ask = new VMyRadio
		{
			Init("索要");pos = "330,300";
		}

		//选他人支付时出现可支付人的下拉列表
		staticvar s_CB_SelOther = new VDROPMENU_Friend_UI 
		{
			m_sizeX = 98;pos = "150,330";
		}

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
			Init("购买");pos = "50,450";
		}
		//确定删除:按钮
		staticvar s_Btn_Del = new VMyButton
		{
			Init("删除");pos = "150,450";
		}
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
	inclass("VMall_BuyCar_UI");//界面显示类
	Init();
	//==============================function=========================================

	void OnDelete(){window.InitMallVar();}

	void AddAskParam(_Param)
	{
		var _tempParam = m_AskParam+";" + _Param
		if(_tempParam.Count>=255)
		{
			Mall_Ask_SendRequestMsg(_Param);
		}
		m_AskParam += ";" + _Param;
	}
	void AddBuyParam(_Param)
	{
		m_BuyParam =  _Param + ",";
	}
	void AddSendParam(_Param)
	{
		m_SendParam +=  _Param + ",";
	}
	//点击了取消-和关闭
	void OnClick_BtnEsc()
	{
		parent.del();
	}
	//点击了确定
	void OnClick_BtnConfirm()
	{
		printf("OnClick_BtnConfirm:"+m_SelectType)
		if ( m_SelectType == window.MALL_OPT_BUY )
		{
			m_BuyParam = "";
			//_MallBuyCarList.scriptprcallsub("BuyItem");
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
			if (toint(window.find("MALL_BUY_LOGIC").m_TotalMoney) != 0)
			{
				var _Price = toint(window.find("MALL_BUY_LOGIC").m_TotalMoney);
				var _needPrice = _Price;
//				if(window.g_LuckyCardAgio>0)
//				{
//					_needPrice = toint(toint(_Price)*window.g_LuckyCardAgio/100);
//				}
				if (toint(_needPrice) > toint(_MyMoney))
				{
					window.find("UIController").LoadDLG(350);	//余额不足
					return	 ;
				}
			}
			// 奖券
			if (toint(window.find("MALL_BUY_LOGIC").m_TotalToken) != 0)
			{
				var _Price = toint(window.find("MALL_BUY_LOGIC").m_TotalToken);
				var _needPrice = _Price;
//				if(window.g_LuckyCardAgio>0)
//				{
//					_needPrice = toint(toint(_Price)*window.g_LuckyCardAgio/100);
//				}
				if (toint(_needPrice) > toint(_MyToken))
				{
					window.find("UIController").LoadDLG(350);	//余额不足
					return	 ;
				}
			}
			// 点券
			if (toint(window.find("MALL_BUY_LOGIC").m_TotalQuan) != 0)
			{
				var _Price = toint(window.find("MALL_BUY_LOGIC").m_TotalQuan);
				var _needPrice = _Price;
//				if(window.g_LuckyCardAgio>0)
//				{
//					_needPrice = toint(toint(_Price)*window.g_LuckyCardAgio/100);
//				}
				if (toint(_needPrice) > toint(_MyQuan))
				{
					window.find("UIController").LoadDLG(350);	//余额不足
					return	 ;
				}
			}
				_MallBuyCarList.scriptprcallsub("PropContinueParam");
				printf("C# m_PropContinueParam："+m_PropContinueParam);
		}
		
		if ( m_SelectType == window.MALL_OPT_GIFT )
		{
			if(!window.find("BuyCarRecord").GetSelectNum())
			{
				window.find("UIController").LoadDLG(648);
				//return;
			}
			var sendname = s_CB_SelOther.GetText();
			if (sendname == "")
			{
				window.find("UIController").LoadDLG(358);//请选择一个赠送的对象！
				return;
			}

			if (sendname.Count < 4 || sendname.Count > 12)
			{
				window.find("UIController").LoadDLG(331);//昵称长度应在4-12字符之间。
				return;
			}
			var _res = window.JudgeAnyNameLicit(sendname,"昵称");
			if (_res < 0)
			{
				return;
			}

			var jid = window.GetUIDByName_KF(sendname);
			if ( jid <= 0 )
			{
				window.find("UIController").LoadDLG(636);//无法找到赠送对象
				return;
			}

			m_SendParam = "";
			var msg = s_LeaveWord.src;
			if (msg != "")
			{
				var _res = window.JudgeAnyNameLicit(msg,"留言内容");
				if (_res < 0)
				{
					s_LeaveWord.timer(10,"hot=1");
					return;
				}
			}

			printf("OnClick_BtnConfirm sendname:"+sendname+" msg:"+msg)
			_MallBuyCarList.scriptprcallsub("SendItem");
			printf("B# 赠送参数："+m_SendParam);

			var _uid = window.GetUIDByName_KF(sendname);
			var _sex = window.GetSexByName_KF(sendname);
//			if(window.g_LuckyCardAgio>0)
//			{
//				var _other = ""+_uid+","+_sex+","+sendname +","+msg+";"+m_Type;
//				window.find("UIController").LoadUI("UI_Item_LuckyCard");
//				//window.find("Item_LuckyCard_Logic")._LuckyCard.Reflash(m_SQL,2,_other);
//				//parent.del();
//				return;
//			}
			//新新参数：iToUserId,iToUserSex,szToUserName,szToMsg,iEntryId,iNum,iLimitDayField
			window.Too_AddShopCar(""+_uid+","+_sex+","+sendname +","+msg+","+m_SendParam);
		}

		if ( m_SelectType == window.MALL_OPT_ASK )//是否选择了赠送
		{
			var askname = s_CB_SelOther.GetText();
			if (askname == "")
			{
				window.find("UIController").LoadDLG(359);//请选择一个索要的对象！
				return;
			}
			if(askname == window.GetNameByUID())
			{
				window.find("UIController").LoadDLG(644);	//自己不能赠送自己	夏洋洋添加于2009-12-18
				return ;
			}
			
			var _res = window.JudgeAnyNameLicit(askname,"昵称");
			if (_res < 0)
			{
				return;
			}

			var jid = window.GetUIDByName_KF(askname);
			_tempJID = jid;
			if ( jid <= 0 )
			{
				window.find("UIController").LoadDLG(635);//无法找到索要对象
				return;
			}
			m_AskParam = "";
			var msg = s_LeaveWord.src;
			
			if (msg != "")
			{
				var _res = window.JudgeAnyNameLicit(msg,"留言内容");
				if (_res < 0)
				{
					s_LeaveWord.timer(10,"hot=1");
					return;
				}
			}

			if(m_haveLeaveWordFlag == 0)
			{
				msg = "玩家["+window.GetMyName()+"]向您索要物品";
			}
			_tempMsg = msg;

			_MallBuyCarList.scriptprcallsub("AskItem",jid);
			if(m_AskParam=="")
			{
				window.find("UIController").LoadDLG(687);
				return;
			}

			printf("B# xmpp2[索要]参数：jid:"+jid+",m_AskParam:"+m_AskParam+",msg:"+msg);
			//发送索要消息
			//参数：JID，我的昵称，物品内容(物品EnterID_时间限制_价格),留言内容
			window.find("friendsys").SendRequestMsg(jid,window.GetMyName(),m_AskParam,msg);

			window.find("UIController").LoadDLG(361);//索要消息已发出！
		}
		window.find("BuyCarRecord").DelSelect();
		parent.del();
	}

	//当索要的物品的字段长度大于最大值时调用
	void Mall_Ask_SendRequestMsg(_Param)
	{
		window.find("friendsys").SendRequestMsg(_tempJID,window.GetMyName(),m_AskParam,_tempMsg);
		m_AskParam = "";
	}
	//点击了右键菜单删除
	void OnClick_DelCur()
	{
		var _Row = window.find("VMall_BuyCar_Logic_NAME").curselectrow();
		var _ID = window.find("VMall_BuyCar_Logic_NAME").fieldstr(_Row,0);
		window.find("BuyCarRecord").Del(_ID);
		window.find("MALL_BUY_LOGIC").RefreshTotalMoney();
		GetLuckyCardNum();
		DelayCheck();
		CheckCBBoxChkNum();
	}
	//点击了删除按钮
	void OnClick_Del()
	{
		window.find("BuyCarRecord").DelSelect();
		window.find("MALL_BUY_LOGIC").RefreshTotalMoney();
		GetLuckyCardNum();
		DelayCheck();
		CheckCBBoxChkNum();
	}
	//刷新玩家的物品列表 type: 1:所有 2:保存1 3:保存2...
	void RefreshSelect(type)
	{
//		if ( m_Init == false ) return;
		s_TotalPrice.SetValue(0,0,0,0);
		var sort = GetSortIndex(type);
		var _SQL = "SELECT * FROM " + window.BUYCARSELECT + sort;
		printf("B# 商城购物车:_SQL："+_SQL);
		m_SQL = _SQL;
		m_Type = type;
		m_ExangeTimes = 0;
		window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VMall_BuyCar_Logic",window.GAMEUI,_SQL);
		s_PageCtrl.setpageto(1);//强制翻到第一页
		m_ExangeTimes = 1;
		_MallBuyCarList.ScrollToEnd();
		window.SetMallBuyCarSelect(type);
		DelayCheck();
		CheckCBBoxChkNum();
		GetLuckyCardNum();
		s_CH_AllSel.UnCheck();
		s_CH_AllSel.MouseUnCheck();
//		window.find("BuyCarRecord").SelectBySex(window.GetMySex(),type,1);	//del by chenjihui  2011-2-22
	}

	void RefreshAll()
	{
		s_MaskWord.show = true;
		s_MaskBuy.show = true;
		s_MaskSend.show = true;
		s_MaskAsk.show = true;
		s_CB_SelOther.SetState(window.BTN_STATE_GREY);
	}

	void RefreshBuy()
	{
		s_MaskBuy.show = false;
		s_CB_SelOther.SetState(window.BTN_STATE_GREY);
		_MallBuyCarList.scriptprcallsub("SetPriceByTime");
		window.find("MALL_BUY_LOGIC").RefreshTotalMoney();
	}

	void RefreshSend()
	{
		s_MaskSend.show = false;
		s_CB_SelOther.SetState(window.BTN_STATE_LIGHT);
		_MallBuyCarList.scriptprcallsub("SetPriceByTime");
		window.find("MALL_BUY_LOGIC").RefreshTotalMoney();
	}

	void RefreshAsk(all)
	{
		s_MaskAsk.show = false;
		s_CB_SelOther.SetState(window.BTN_STATE_LIGHT);
		_MallBuyCarList.scriptprcallsub("SetPriceByTime");
		window.find("MALL_BUY_LOGIC").RefreshTotalMoney();
	}

	//刷新购买方式 type: 1:购买 2:赠送 3:索要
	void RefreshType(type)
	{
		if (m_Init == false) return;
		RefreshAll();
//		window.find("BuyCarRecord").ClearSelect();
		window.SetMallBuyCarSendSex(-1);
		m_SelectType = type;
		switch (type)
		{
		case 1:
			RefreshBuy();
			_MallBuyCarList.scriptprcallsub("SetBuycarListPos",m_CardState);
			s_captureItem.show=true;
			s_LeaveWord.src = "留言";
//			window.find("BuyCarRecord").SelectBySex(window.GetMySex(),1,0);
			RefreshSelect(m_Type);
//			GetLuckyCardNum();
			CheckSuitMySex();
			s_CH_AllSel.UnCheck();
			s_CH_AllSel.MouseUnCheck();
			break;
		case 2:
			RefreshSend();
			_MallBuyCarList.scriptprcallsub("SetBuycarListPos",m_CardState);
			s_captureItem.show=false;
			s_CH_AllSel.UnCheck();
//			window.find("BuyCarRecord").SelectBySex(window.GetMySex(),1,0);
			RefreshSelect(m_Type);
//			GetLuckyCardNum();
			CheckSuitOtherSex();
			s_CH_AllSel.UnCheck();
			s_CH_AllSel.MouseUnCheck();
			break;
		case 3:
			_MallBuyCarList.scriptprcallsub("SetBuycarListPos",0);
//			window.find("BuyCarRecord").SelectBySex(window.GetMySex(),1,0);
			RefreshSelect(m_Type);
			RefreshAsk();
			CheckSuitMySex();
			SetBuycarPos(0,0);
			s_captureItem.show=false;
			s_CH_AllSel.UnCheck();
			s_CH_AllSel.MouseUnCheck();
			break;
		}
	}
	void GetSortIndex(type)
	{
		type -= 1;
//		if ( type >= 1 )
		{
			return " WHERE type=" + type + " AND state=1";
		}
		return " WHERE state=1";
	}

	void OnCheckRadio0()
	{
		RefreshSelect(1);
		m_BtnLayerIndx = 0;
		if (toint(m_arrBtnCheckAll[m_BtnLayerIndx]) == 1)
			s_CH_AllSel.Check();
		else
			s_CH_AllSel.UnCheck();
//		GetLuckyCardNum();
	}
	void OnCheckRadio1()
	{
		RefreshSelect(2);
		m_BtnLayerIndx = 1;
		if (toint(m_arrBtnCheckAll[m_BtnLayerIndx]) == 1)
			s_CH_AllSel.Check();
		else
			s_CH_AllSel.UnCheck();
//		GetLuckyCardNum();
	}
	void OnCheckRadio2()
	{
		RefreshSelect(3);
		m_BtnLayerIndx = 2;
		if (toint(m_arrBtnCheckAll[m_BtnLayerIndx]) == 1)
			s_CH_AllSel.Check();
		else
			s_CH_AllSel.UnCheck();
//		GetLuckyCardNum();
	}
	void OnCheckRadio3()
	{
		RefreshSelect(4);
		m_BtnLayerIndx = 3;
		if (toint(m_arrBtnCheckAll[m_BtnLayerIndx]) == 1)
			s_CH_AllSel.Check();
		else
			s_CH_AllSel.UnCheck();
//		GetLuckyCardNum();
	}
	void OnCheckRadio4()
	{
		RefreshSelect(5);
		m_BtnLayerIndx = 4;
		if (toint(m_arrBtnCheckAll[m_BtnLayerIndx]) == 1)
			s_CH_AllSel.Check();
		else
			s_CH_AllSel.UnCheck();
//		GetLuckyCardNum();
	}
	void OnCheckRadio5()
	{
		RefreshSelect(6);
		m_BtnLayerIndx = 5;
		if (toint(m_arrBtnCheckAll[m_BtnLayerIndx]) == 1)
			s_CH_AllSel.Check();
		else
			s_CH_AllSel.UnCheck();
//		GetLuckyCardNum();
	}
	//设置响应事件
	void SetEvent()
	{
//		//确定:按钮
//		set s_R_All
//		{
//			groupname="VMall_Shopping_BuyCar_Sel";
//			startstate="1";
//			var m_Value = 1;
//			void OnCheck(){if (GetChecked()){return;}MouseCheck();parent.RefreshSelect(m_Value);}
//			void OnUnCheck(){MouseUnCheck();}
//		}
//		//保存1:按钮
//		set s_R_Save1
//		{
//			groupname="VMall_Shopping_BuyCar_Sel";
//			var m_Value = 2;
//			void OnCheck(){if (GetChecked()){return;}MouseCheck();parent.RefreshSelect(m_Value);}
//			void OnUnCheck(){MouseUnCheck();}
//		}
//		//保存2:按钮
//		set s_R_Save2
//		{
//			groupname="VMall_Shopping_BuyCar_Sel";
//			var m_Value = 3;
//			void OnCheck(){if (GetChecked()){return;}MouseCheck();parent.RefreshSelect(m_Value);}
//			void OnUnCheck(){MouseUnCheck();}
//		}
//		//保存3:按钮
//		set s_R_Save3
//		{
//			groupname="VMall_Shopping_BuyCar_Sel";
//			var m_Value = 4;
//			void OnCheck(){if (GetChecked()){return;}MouseCheck();parent.RefreshSelect(m_Value);}
//			void OnUnCheck(){MouseUnCheck();}
//		}
//		//保存4:按钮
//		set s_R_Save4
//		{
//			groupname="VMall_Shopping_BuyCar_Sel";
//			var m_Value = 5;
//			void OnCheck(){if (GetChecked()){return;}MouseCheck();parent.RefreshSelect(m_Value);}
//			void OnUnCheck(){MouseUnCheck();}
//		}
//		//保存5:按钮
//		set s_R_Save5
//		{
//			groupname="VMall_Shopping_BuyCar_Sel";
//			var m_Value = 6;
//			void OnCheck(){if (GetChecked()){return;}MouseCheck();parent.RefreshSelect(m_Value);}
//			void OnUnCheck(){MouseUnCheck();}
//		}
		
		set s_LeaveWord
		{
			void OnKeyChar()
			{
				parent.m_haveLeaveWordFlag = 1;
			}
		}
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
				window.find("BuyCarRecord").ClearSelect();
				if ( parent.m_SelectType == 2 )
				{
					if(parent.s_CB_SelOther.GetIsDefaultText())
					{
						window.find("BuyCarRecord").SelectBySex(1,1);
						window.find("BuyCarRecord").SelectBySex(2,1);
					}
					else
					{
						var askname = parent.s_CB_SelOther.GetText();
						var sex = window.GetSexByName_KF(askname);
						window.find("BuyCarRecord").SelectBySex(sex,1);	
					}
					
				}
				else
				{
					parent._MallBuyCarList.scriptprcallsub("SetSelCheck");
					//window.find("BuyCarRecord").SelectBySex(window.GetMySex(),1);
				}
				parent.CheckCBBoxChkNum();
				parent.GetLuckyCardNum();
			}
			void OnUnCheck()
			{
				if(!GetState()){return;}
				parent.m_arrBtnCheckAll[parent.m_BtnLayerIndx] = 0;
				MouseUnCheck();
				window.find("BuyCarRecord").ClearSelect();
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
			if ( window.GetMallDLGType() != 2 && window.GetMallDLGType() != 3 ) startstate="1";
			var m_Value = 1;
			void OnCheck(){if (GetChecked()){return;}MouseCheck();parent.RefreshType(m_Value);}
			void OnUnCheck(){MouseUnCheck();}
		}
		//赠送:RADIO
		set s_R_Send
		{
			groupname="VMall_Shopping_BuyCar_Type1111";
			if ( window.GetMallDLGType() == 2 ) startstate="1";
			var m_Value = 2;
			void OnCheck(){if (GetChecked()){return;}MouseCheck();parent.RefreshType(m_Value);}
			void OnUnCheck(){MouseUnCheck();}
		}
		//索要:RADIO
		set s_R_Ask
		{
			groupname="VMall_Shopping_BuyCar_Type1111";
			if ( window.GetMallDLGType() == 3 ) startstate="1";
			var m_Value = 3;
			void OnCheck(){if (GetChecked()){return;}MouseCheck();parent.RefreshType(m_Value);}
			void OnUnCheck(){MouseUnCheck();}
		}

		//确定:按钮
		set s_Btn_Enter{void OnPressed(){if(GetState()==window.BTN_STATE_GREY){return;}parent.OnClick_BtnConfirm();}}
		//删除：按钮
		set s_Btn_Del{void OnPressed(){if(GetState()==window.BTN_STATE_GREY){return;}parent.OnClick_Del();}}
		//取消:按钮
		set s_Btn_Esc{void OnPressed(){parent.OnClick_BtnEsc();}}
		//帮助:按钮
		set s_Btn_Help{void OnPressed(){window.CallBack_Help(window.POS_BUYCAR);}}
		//关闭:按钮
		set s_Btn_Close{void OnPressed(){parent.OnClick_BtnEsc();}}
		//选中其他人:LISTBOX
		set s_CB_SelOther
		{
			//接口函数 WhichSelect:
			//参数：jid 好友用
			//		sex 性别
			var _SelectSex =0;
			void WhichSelect(jid,sex)
			{
				_SelectSex = sex;
				parent.DelayCheck();
//				window.SetMallBuyCarSendSex(-1);
//				if ( parent.m_SelectType == 2 )
//				{
//					window.find("BuyCarRecord").SelectBySex(sex,1);
//					window.SetMallBuyCarSendSex(sex);
//				}
//				if ( parent.m_SelectType == 3 || parent.m_SelectType == 1 )
//				{
//					window.find("BuyCarRecord").SelectBySex(window.GetMySex(),1);
//				}
//				parent.m_Jid = jid;
			}

			void OnNameChange()
			{
				if ( parent.m_SelectType == 2 )
				{
					parent.RefreshType(parent.m_SelectType);
					var askname = GetText();
				//	var sex = window.GetSexByName_KF(askname);
					window.find("BuyCarRecord").ClearSelect();
					if (_SelectSex)					// modify by chenjihui 2011-1-25
					{
						window.find("BuyCarRecord").SelectBySex(_SelectSex,1);
					}else
						window.find("BuyCarRecord").SelectBySex(_SelectSex,0);	
				}
			}

			SetID("BuyCar",2); //全部
			SetPos(174,456);
			SetSize(145,166);
			SetSelectType(2);
		}
	}


//	var _listState = false;
//	void CreateList()
//	{
//		_listState = true;
//		staticvar _BCPropContinueItemList = new VMall_BuyCar_Logic_List
//		{
//			name = "VItem_BCPropContinue_Logic_List_NAME";
//			if(parent.m_PropContinueType == 1)
//			{
//				window.find("G_DBMANAGE").RegDbTable(this,window.M_G_GOODS,window.PLAYERITEMS,"Bind_VItem_BCPropContinue_Logic_List_NAME");// 绑定数据表
//			}
//			else
//			{
//				window.find("G_DBMANAGE").RegDbTable(this,window.M_G_GOODS,window.ITEMS,"Bind_VItem_BCPropContinue_Logic_List_NAME");// 绑定数据表
//			}
//			
//			void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);} //移除绑定
//		}
//	}
//	
	
	
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
		m_PropContinueParam =  _Param + ",";
	}


	//================================DBList=========================================
	var _MallBuyCarList = new VMall_BuyCar_Logic_List
	{
		name = "VMall_BuyCar_Logic_NAME";
		window.find("G_DBMANAGE").RegDbTable(this,window.GAMEUI,window.BUYCARSELECT,"Bind_VMall_BuyCar_Logic");// 绑定数据表
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
		_MallBuyCarList.scriptprcallsub("CheckCBChk");
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
		if (m_SelectType == window.MALL_OPT_ASK)
			return ;
//		_MallBuyCarList.SetMyMenu();
		m_CanSelectNum=m_LukyCardNum;
		m_HaveCard1=0;
		m_HaveCard2=0;
		_MallBuyCarList.scriptprcallsub("CheckLuckyCardNum");
		SetBuycarPos(m_HaveCard1,m_HaveCard2);
		if(m_CanSelectNum<1){_MallBuyCarList.scriptprcallsub("GreyMyMenu");return;}
		if(m_CanSelectNum==1){_MallBuyCarList.scriptprcallsub("LightMyMenu");return;}
	}

	void CheckSuitMySex()
	{
		m_SlefSexSuit=1;
		_MallBuyCarList.scriptprcallsub("CheckSuitMySex");
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
		_MallBuyCarList.scriptprcallsub("CheckSuitOtherSex");
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
		if(m_SelectType != window.MALL_OPT_GIFT)
		{
			CheckSuitMySex();
//			setTimer(200,"CheckSuitMySex");
		}
		else
		{
			CheckSuitOtherSex();
//			setTimer(200,"CheckSuitOtherSex");
		}
	}


	void Inited()
	{
		m_Init = true;
		parent.RefreshTotalMoney();
//		RefrestSelect();
		_MallBuyCarList.scriptprcallsub("SetPriceByTime");
	}

	void OnCreated()
	{
		SetEvent();
		GetDataFromDB();

		var type = window.GetMallDLGType();
		switch (type)
		{
		case 1:RefreshBuy();m_SelectType=1;break;
		case 2:RefreshSend();m_SelectType=2;break;
		case 3:RefreshAsk();m_SelectType=3;break;
		case 4:RefreshBuy();m_SelectType=1;break;
		}
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