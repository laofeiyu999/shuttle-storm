//商城-索要消息弹出界面
//yxf 2008年10月20日

importex("$./ClassDef_RequestMsg.gml");

new item
{
	name = "MALL_REQUEST_MSG_LOGIC";size = "100%,100%";capturemouse = true;
	var _LastPos = window.GetUIPos();
	window.SetUIPos(window.POS_REQUEST);
	new VGame_BtnLayer_Top_Logic{}

	//获取最新打折信息
	window.g_ItemAgio = window.GetAgio();
	//window.g_LuckyCardAgio = window.GetLuckyCardAgio();
	//==========================快捷键==================================
	void OnCreated()
	{
		window.find("NAME_GCMap").KeyBoardEnable(0);//0锁定解锁按键 1解除锁定
		window.find("gameinput").AddExclusiveShortcutUser(this);
		window.find("gameinput").SetDirOnUse(0);//0是关闭方向,1是开启方向
		window.SetChatEnterFlag(window.CHAT_ENTER_NO,"MALL_REQUEST_MSG_LOGIC");//不激活
	}
	void OnDelete()
	{	
		window.SetUIPos(_LastPos);
		window.find("gameinput").SetDirOnUse(1);//0是关闭方向,1是开启方向
		window.find("gameinput").DelShortcutUser(this);
		window.find("NAME_GCMap").KeyBoardEnable(1);//0锁定解锁按键 1解除锁定
		window.SetChatEnterFlag(window.CHAT_ENTER_YES,"MALL_REQUEST_MSG_LOGIC");//能激活
	}
	void DI_ShortcutKey(data)
	{
		switch (data)
		{
			case 3: //Esc
			{
				_Msg.OnClick_BtnClose();
				break;
			}
			case 4: //Enter
			{
				_Msg.OnClick_BtnBuy();
				break;
			}
		}
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
		if ( type == 3)
		{
			m_TotalToken += v;
		}
	}
	void RefreshTotalMoney()
	{
		m_TotalMoney = 0;
		m_TotalToken = 0;
		m_TotalQuan = 0;
		_Msg._MallRequestList.scriptprcallsub("AddMoney");
		_Msg.s_TotalPrice.SetValue(toint(m_TotalMoney),toint(m_TotalQuan),toint(m_TotalToken));
	}
	//==================================================================
	var _Msg = new VMall_RequestMsg_Logic{}
}