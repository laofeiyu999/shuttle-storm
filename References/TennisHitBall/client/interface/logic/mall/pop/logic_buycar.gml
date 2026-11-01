//商城-购买弹出界面
//yxf 2008年10月20日

importex("$./ClassDef_BuyCar.gml");

new item
{
	name = "MALL_BUY_LOGIC";size = "100%,100%";
	capturemouse = true;bgcolor = window.G_BGCOLOR;alpha = window.G_ALPHA;
	new VGame_BtnLayer_Top_Logic{}

	var _LastPos = window.GetUIPos();
	window.SetUIPos(window.POS_BUYCAR);
	//获取玩家打折卡信息
	window.g_ItemAgio = window.GetAgio();
	window.g_LuckyCardAgio = window.GetLuckyCardAgio();
	//==========================快捷键==================================
	void OnCreated()
	{
		window.Too_GetShopTime();
		window.find("NAME_GCMap").KeyBoardEnable(0);//0锁定解锁按键 1解除锁定
		window.find("gameinput").AddExclusiveShortcutUser(this);
		window.find("gameinput").SetDirOnUse(0);//0是关闭方向,1是开启方向
		window.SetChatEnterFlag(window.CHAT_ENTER_NO,"MALL_BUY_LOGIC");//不激活
	}
	void OnDelete()
	{	
		window.SetUIPos(_LastPos);

		window.find("gameinput").SetDirOnUse(1);//0是关闭方向,1是开启方向
		window.find("gameinput").DelShortcutUser(this);
		window.find("NAME_GCMap").KeyBoardEnable(1);//0锁定解锁按键 1解除锁定
		window.SetChatEnterFlag(window.CHAT_ENTER_YES,"MALL_BUY_LOGIC");//能激活
		window.find("BuyCarRecord").DelTemp();
	}
	void DI_ShortcutKey(data)
	{
		if (window.GetForceGuideState() == 1) 
		{
			printf("A# 变态-MALL_BUY_LOGIC强制引导中。。。。");
			return;//强制引导中
		}

		switch (data)
		{
			case 3: //Esc
			{
				del();
				break;
			}
			case 4: //Enter
			{
				_Buy.OnClick_BtnConfirm();
				break;
			}
		}
	}

	void DelAllEntryID(type)
	{
		window.find("BuyCarRecord").DelByType(type);
	}

	void DelEntryID(id)
	{
		window.find("BuyCarRecord").Del(id);
	}

	void AddEntryID(entryid,type)
	{
		alert("hfz:这个不应该出现!!!")
		window.find("BuyCarRecord").Add(entryid,type);
	}

	var m_TotalMoney = 0;
	var m_TotalToken = 0;
	var m_TotalQuan = 0;

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
	void RefreshTotalMoney()
	{
		m_TotalMoney = 0;
		m_TotalToken = 0;
		m_TotalQuan = 0;
		_BuyCar._MallBuyCarList.scriptprcallsub("AddMoney");
		_BuyCar.s_TotalPrice.SetValue(toint(m_TotalMoney),toint(m_TotalToken),toint(m_TotalQuan),window.GetVipTypeByUID());
	}
	//==================================================================
	var _BuyCar = new VMall_BuyCar_Logic{}

	void OnClick()
	{
		_BuyCar.s_CB_SelOther.SetMyHide(false);
	}
}