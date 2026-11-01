//
//商城-购物-服饰的物品list
//同性物品可以购买+赠送+索要
//异性物品只能赠送给跟物品同性的人

importex("$./../../UI/Mall/ClassDef_RequestMsgMsg_DBList.gml");

//一行显示类：图标+名称+有效期+金币+点券+索要+购买+赠送
class VColumn_RequestMsg_Logic item
{
	size = "600,35";
	var m_Gid = 0;
	var m_EntryID = 0;		//物品的ID
	var m_DisplayID = 0;		//物品的显示ID-Avatars
	var m_MoneyType = 0;		//购买所需金币类型 1,金币;2,点券;3,Pk点
	var m_Price;				//价格
	var m_Attribute = "";	//属性 "0,1,2,3,4,5"
	var m_Sex = 0;
	var m_GoldType = 0;
	var m_GoldValue = 0;
	var m_Sel = 0;
	var m_LimitTimeIndex = 0;
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
		staticvar s_CB_Time = new VMyText {pos = "300,0";border="#123456";}

		//选择
		staticvar s_CH_Sel = new VMyCheckBox
		{
			Init("选择");pos = "400,0"
		}
	}
	//需要被显示的类覆盖
	void OnMySelect(){bgcolor = "#FFEA99";alpha = 50;}	//选择的效果
	void OnMyUnSelect(){bgcolor = "-1";}				//不选择的效果
	inclass("VColumn_RequestMsg_Column_UI"); //界面显示类
	//===============================function==============================
	//设置响应事件
	void SetEvent()
	{
		//选择:CheckBox
		set s_CH_Sel
		{
			void OnCheck()
			{
				if(!GetState()){return;}
				MouseCheck();
				parent.parent.m_Record.Sel(parent.m_Gid,1);
				parent.m_Sel = 1;
				window.find("MsgRequestSelect").Sel(parent.m_Gid,1);
			}
			void OnUnCheck()
			{
				if(!GetState()){return;}
				MouseUnCheck();
				parent.parent.m_Record.Sel(parent.m_Gid,0);
				parent.m_Sel = 0;
				window.find("MsgRequestSelect").Sel(parent.m_Gid,0);
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
				parent.SetPriceByTime();
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
	void OnSelect()
	{
		OnMySelect();
	};
	void OnUnSelect(){OnMyUnSelect();};
	void OnDataExchange(iRow,szData)
	{
		parent._iRow = iRow;
		m_Gid = szData;
		m_EntryID = parent.fieldstr(iRow,window.GAMEUI_BUYCARSELECT_CID);
		s_ItemName.SetData(parent.fieldstr(iRow,window.GAMEUI_BUYCARSELECT_NAME),"",""); //名称
		m_MoneyType = parent.fieldstr(iRow,window.GAMEUI_BUYCARSELECT_PRICETYPE);//购买所需金币类型1,金币;2,点券;3,Pk点
		var _Price = parent.fieldstr(iRow,window.GAMEUI_BUYCARSELECT_PRICE);//购买价格
		var _Time = parent.fieldstr(iRow,window.GAMEUI_BUYCARSELECT_TIME);//购买时间
		m_Sex = parent.fieldstr(iRow,window.GAMEUI_BUYCARSELECT_SEX);	//性别 1男 3女
		m_LimitTimeIndex = parent.fieldstr(iRow,window.GAMEUI_BUYCARSELECT_TIMEINDEX);

		var _Lv = window.GetIconLvByEnterID(m_EntryID);
		var _num = window.GetSubNumByItemID(m_EntryID);

		if (m_Sex == window.GetMySex())//是同性物品：可购买+赠送+索要
		{
			s_GID.SetIconEx(m_EntryID,_Lv,_num);
		}
		else//非同性物品：不可购买+只可赠送+不可索要
		{
			s_GID.SetIconEx(m_EntryID,_Lv,_num);
		}

		m_Price = _Price;//价格
		if (_Time!=0)
		{
			_Time += "天";
		}
		
		s_CB_Time.SetData(_Time);
//		if(window.g_ItemAgio != 100)
//		{
//			s_ItemGold.SetData(_Price,m_MoneyType,1);
//		}
//		else
//		{
//			s_ItemGold.SetData(_Price,m_MoneyType,0);
//		}
		s_CB_CardSelect.SetID(""+szData+"card");
		s_CB_CardSelect.SetPos(290,7);
		s_CB_CardSelect.SetWidthAndType(70,0);
		s_CB_CardSelect.SetData("无,折扣卡,幸运卡");
		//var _vipValue = window.GetVipTypeByUID()
		
		if(parent.parent.m_CardState==3 || parent.parent.m_CardState==1)
		{
			s_CB_CardSelect.SetDefaultSrc("折扣卡");
			s_CB_CardSelect._CardType=1;
			if(parent.parent.m_CardState==1){s_CB_CardSelect.GreyIndex(2);}
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
		}

		SetPriceByTime();

		var check = parent.fieldstr(iRow,window.GAMEUI_BUYCARSELECT_SELECT);
		if ( check )
		{
			s_CH_Sel.Check();
			m_Sel = 1;
		}
		else
		{
			s_CH_Sel.UnCheck();
			m_Sel = 0;
		}
		s_CH_Sel.SetGrey();
		RefreshTotalMoney();
	}

	void AddMoney()
	{
		if ( m_Sel == 1 )
		{
			parent.parent.parent.AddMoney(m_GoldType,m_GoldValue);
		}
	}

	void SendItem(sendname)
	{
		if ( m_Sel == 1 )
		{
			var _uid = window.GetUIDByName_KF(sendname);
			var _sex = window.GetSexByName_KF(sendname);
			var _cardid = window.SplitStr2(window.g_AgioCard,",",3);

//			var _Param = ""+m_EntryID+",1,"+m_LimitTimeIndex+",-1,"+_cardid[s_CB_CardSelect._CardType]+","+_uid+","+_sex+","+sendname+",索要物品,"+window.g_Present_Msg;
			var _Param = ""+_uid+","+_sex+","+sendname+","+window.g_Present_Msg+",-1,"+m_EntryID+",1,"+m_LimitTimeIndex+","+_cardid[s_CB_CardSelect._CardType];
			//发出赠送的消息
			//新参数：iEntryId,iNum,iLimitDayField,szToUserName,szTitle,szToMsg,iEquip,iEquipPos
			//新新参数：iEntryId,iNum,iLimitDayField,iToUserId,iToUserSex,szToUserName,szTitle,szToMsg
			window.Too_AddShopCar(_Param);
		}
	}

	void RefreshTotalMoney()
	{
		parent.parent.parent.RefreshTotalMoney();
//		parent.parent.parent.parent.RefreshTotalMoney();
//		parent.parent.parent.parent.parent.RefreshTotalMoney();
	}

	void SetPriceByTime()
	{
//		s_ItemGold.SetData(m_PriceArr[index],m_MoneyType); //购买价格

		var _vipValue = window.GetVipTypeByUID()
		var _DeadORLive = window.CheckPackItemDeadLine(window.GOODS_CLASS_PropaLCard);
		

		if(s_CB_CardSelect._CardType!=0)
		{
			if( parent.parent.m_LukyCardNum !=0  || _DeadORLive == true)
			{
				s_ItemGold.SetData( toint(m_Price) ,m_MoneyType,1);
			//s_ItemGold.SetData( toint(toint(m_PriceArr[m_LimitTimeIndex]) * window.GetVipBuyAgio(_vipValue) * 100 / 100) ,m_MoneyType,1);
			}
			else
			{
				s_ItemGold.SetData(m_Price,m_MoneyType,0);
			}
		}
		else
		{
			s_ItemGold.SetData(m_Price,m_MoneyType,0);
		}
	}

	void ReturnCardState()
	{
		switch(s_CB_CardSelect._CardType)
		{
			case 1:parent.parent.m_HaveCard1=1;break;
			case 2:parent.parent.m_HaveCard2=1;break;
		}
	}

	void CheckLuckyCardNum()
	{
		if(s_CB_CardSelect._CardType==2){parent.parent.m_CanSelectNum -=1;}
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
};

//
//总的类：List
//
class VMall_RequestMsg_Logic_List VN2ListCtrl
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
	
	inclass("VMall_RequestMsg_UI_List"); //界面显示类

	var _RID = window.GetRIDByUID();//角色RoleID
	columclass="0,VColumn_RequestMsg_Logic"; //识别id
};