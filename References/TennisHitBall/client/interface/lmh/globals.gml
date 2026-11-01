//
//全局函数（杂）
//2009年9月24日

set window
{
	//[游戏中界面]
	//设置能量球的数量
	//[参数]enterID:物品ID
	void LMH_SetItemNum(enterID)
	{
		//printf("B# 快捷栏-LMH_SetItemNum-enterID:"+enterID);
		window.find("VShortBarIcon_All_Logic_NAME").SetIconNum(enterID);
	}

	//[兑换界面]
	//[功能]得到兑换物品的名称
	//[参数]_entryid:物品ID
	void LMH_GetChangeName(_entryid)
	{
		if (_entryid == 40907)
		{
			var _name1 = "恭喜你获得法国浪漫3日游！";
			return _name1;
		}
		if (_entryid == 40908)
		{
			var _name2 = "恭喜你获得新款PSP！";
			return _name2;
		}
		if (_entryid == 40909)
		{
			var _name3 = "恭喜你获得网球运动4件套！";
			return _name3;
		}
		if (_entryid == 40910)
		{
			var _name4 = "恭喜你获得精美T恤一件！";
			return _name4;
		}
		if (_entryid == 40911)
		{
			var _name5 = "恭喜你获得精美T恤一件！";
			return _name5;
		}
		if (_entryid == 40914)
		{
			var _name6 = "恭喜你获得毛绒狗狗公仔一只！";
			return _name6;
		}
		if (_entryid == 40915)
		{
			var _name7 = "恭喜你获得毛绒狗狗公仔一只！";
			return _name7;
		}
	}
	
	//[活动结算界面]
	//[功能]得到15天实物大奖说明
	//[参数]index：名次
	//[返回值]奖励说明
	void GetActivityOverText(index)
	{
		if (index == 1)
		{
			return "恋恋风情 —— 网球起源地法国浪漫3日游";
		}
		if (index == 2)
		{
			return "酷炫 e族 —— 新款PSP（PSP-3000）";
		}
		if (index == 3)
		{
			return "网坛新星 —— 网球运动3件套（球拍、球、帽）";
		}
		if (index >= 4 && index <= 20)
		{
			return "游戏之星 —— 网球文化衫";
		}
	}


	//[功能]干掉弹出层+对话框层
	void LMH1_DelFucklayer()
	{
		if (window.GetPackOpenState() && window.GetUIPos() != window.POS_PACK)
		{
			window.find("PACK_LOGIC").del();
		}
//		else if (window.GetPackOpenState())
//		{
//			window.find("PACK_LOGIC").del();
//		}
		window.find(window.DLGLAYER).delallchild();
//		window.find(window.POPLAYER).delallchild();
	}

	//函数 LMH_UpDate_PromptInfo:更新提示信息，用于游戏中的各种提示信息的显示和隐藏
	//参数 ShowState:显示状态，true显示；false不显示
	//参数 InfoData :显示的信息其值为0-12的数字
	//InfoData:	0为发球，1为档球，2为截球，3为救球，4为削球，5为上旋球，6为放高球，7为发球技能，
	//			8为放高球技能，9为削球技能，10为上旋球技能，11为扣杀技能，12为扣杀
	void LMH_UpDate_PromptInfo(ShowState,InfoData)
	{
		window.find("GAME_LOGIC")._VGame_Playing_Logic.UpDate_PromptInfo(ShowState,InfoData);
	}

	//[功能]显示一个任务的帮助
	//[参数]id:帮助的ID
	void LMH_NewTaskHelp(id)
	{
		set window.find(window.TOPLAYER)
		{
			new VTaskHelp_Logic
			{
				SetDate(id);
			}
		}
	}

	//[功能]强制引导-点击活动报名
	void lmh_onclickarenabegin()
	{
		window.find("ARENA_LOGIC")._VArena_Logic.m_Class_ActivityList.OnClick_Apply();
	}
	//[功能]强制引导-查看活动
	void lmh_onclickarenalookover()
	{
		window.find("ARENA_LOGIC")._VArena_Logic.m_Class_ActivityList.OnClick_LookOver();
	}
}