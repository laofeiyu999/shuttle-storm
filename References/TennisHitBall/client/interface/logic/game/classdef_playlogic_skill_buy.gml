//游戏中快速购买逻辑类
//吴楠

importex("$./../../UI/Game/ClassDef_PlayUI_Skill_Buy.gml");

class VRole_Skill_Buy_Logic item
{
	size(237,200);bkcolor="#ff0000";
	name="Skill_Buy_Logic_NAME";
	capturemouse=true;
	var _EntryID = 0;	//打包物品数量ID
	//==========================快捷键==================================
	window.find("gameinput").AddExclusiveShortcutUser(this);	//添加快捷键用户
	window.SetChatEnterFlag(window.CHAT_ENTER_NO,"VRole_Skill_Buy_Logic");//不激活

	void OnDelete()
	{
		window.find("gameinput").DelShortcutUser(this);
		window.SetChatEnterFlag(window.CHAT_ENTER_YES,"VRole_Skill_Buy_Logic");//能激活
		window.find("VShortBarIcon_All_Logic_NAME").m_CanOpen = true;
	}
	void DI_ShortcutKey(data)
	{
		switch (data)
		{
			case 3: //Esc
			{
				OnClick_Cancle();
				break;
			}
			case 4: //Enter
			{
				OnClick_Buy();
				break;
			}
		}
	}

	//=======================与显示交互========================
	void Init()
	{
		//物品图标
		staticvar s_Icon = new text
		{
			size(53,53);bkcolor="#00ff00";
			void SetData(data){src=data;}
		}
		//说明
		staticvar _Explain = new text
		{
			size(160,156);pos(55,0);bkcolor="#0000ff";
			src="点击“确定”后完成快速购买,可以立即使用!";
		}
		//价格
		staticvar _Money = new text
		{
			size(80,20);pos(0,145);
			void SetData(data,index)
			{
				src=window.GetPriceByIndex(data,index);
			}
		}
		//购买
		staticvar _Buy = new VMyButton
		{
			Init("购买");pos(10,125);
		}
		//取消
		staticvar _Canel = new VMyButton
		{
			Init("取消");pos(100,125);
		}
	}
	inclass("VRole_Skill_Buy_UI");
	//=======================================================
	Init();
	void SetSkillID(id)
	{
		_EntryID = window.GetItemIdBySubEntryID(id,10);
		var _lv = window.GetIconLvByEnterID(_EntryID);
		s_Icon.SetIconEx(_EntryID,_lv,10);
		//_Icon.SetData(_ID);
		//_Num.SetData(_EntryID);
		_Money.SetData(_EntryID,0);
	}

	//点击了购买
	void OnClick_Buy()
	{
		var _Param = ""+_EntryID+",1,0";
		//发出购买的消息
		//新新参数：iEntryId,iNum,iLimitDayField,iToUserId,iToUserSex,szToUserName,szTitle,szToMsg
		var _DeadORLive = window.CheckPackItemDeadLineByEntryID(window.g_agioEntry_ID);//判断背包中是否有打折卡并且是否能用
		if (_DeadORLive>0)
		{
			window.Too_BuyItem(_Param+",-1,"+window.g_agioEntry_ID);
		}
		else
			window.Too_BuyItem(_Param);

		OnShowfalse();
		delaydel(100);
	}
	//点击了取消
	void OnClick_Cancle()
	{
		OnShowfalse();
		delaydel(100);
	}
	void SetEvent()
	{
		set _Buy
		{
			void OnPressed(){parent.OnClick_Buy();}
		}
		set _Canel
		{
			void OnPressed(){parent.OnClick_Cancle();}
		}
		set s_Btn_Close
		{
			void OnPressed(){parent.OnClick_Cancle();}
		}
	}
	SetEvent();
};