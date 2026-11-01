//---------------第一次获得属性的引导-------------------------
	void Guide_Delay_Attribute(step)
	{
		switch (step)
		{
			case 1:
			{
				window.LMH1_NewCap("BtnName_Hall_Bottom_Pack");
				window.LMH1_SetBtnFlash("BtnName_Hall_Bottom_Pack",true);
				window.OpenHelp(10303);
				break;
			}
			case 2:
			{
				window.LMH1_NewCap("BtnName_Pack_Attribute");
				window.LMH1_SetBtnFlash("BtnName_Pack_Attribute",true);
				window.OpenHelp(10304);
				break;
			}
			default:break;
		}
	}
	//玩家从多种途径返回大厅触发调用
	void Guide_EnterHall_Attribute()//step 1-1
	{
		printf("C# 数据检查: EVENTCOUNT_EN_receive_attribute " + GetEventCount(window.EVENTCOUNT_EN_receive_attribute));
		printf("C# 数据检查: EVENTCOUNT_FIN_accept_attribute " + GetEventCount(window.EVENTCOUNT_FIN_accept_attribute));
//		if (GetEventCount(window.EVENTCOUNT_EN_receive_attribute) >= 1 && GetEventCount(window.EVENTCOUNT_FIN_accept_attribute) == 0)
		if (GetEventCount(window.EVENTCOUNT_EN_receive_attribute) >= 1 && GetEventCount(window.EVENTCOUNT_EN_accept_attribute) == 0)
		{
			printf("C# =====引导=====获得属性礼品引导去邮箱");
			timer(1000,"window.OpenHelp(10301)");
			AddEventCount(window.EVENTCOUNT_FIN_enter_hall_attribute);
			return;
		}
//		if (GetEventCount(window.EVENTCOUNT_FIN_accept_attribute) >= 1)
		if (GetEventCount(window.EVENTCOUNT_EN_accept_attribute) >= 1)
		{
			printf("C# =====引导=====未按照引导操作属性卡的补救措施");
			timer(1000,"Guide_Delay_Attribute(1)");
			AddEventCount(window.EVENTCOUNT_FIN_enter_hall_attribute);
			m_flow_attribute_1 = GetEventCount(window.EVENTCOUNT_FIN_enter_hall_attribute);//防止点击邮箱触发引导
			return;
		}
	}
	//玩家点击“邮箱”触发调用
	void Guide_EnterPostbox_Attribute()//step 1-2
	{
		var _temp = GetEventCount(window.EVENTCOUNT_FIN_enter_hall_attribute);
		if (_temp > m_flow_attribute_1 && GetEventCount(window.EVENTCOUNT_FIN_accept_attribute) == 0)
		{
			printf("C# =====引导=====在邮箱引导收礼品");
			m_flow_attribute_1 = _temp;
			timer(100,"window.OpenHelp(10302)");
			AddEventCount(window.EVENTCOUNT_FIN_enter_postbox_attribute);
		}
	}
	//物品进入背包触发
	void Guide_AcceptAttribute()//step 1-3
	{
		var _temp = GetEventCount(window.EVENTCOUNT_FIN_enter_postbox_attribute);
		if (_temp > m_flow_attribute_2 && GetEventCount(window.EVENTCOUNT_FIN_accept_attribute) == 0)
		{
			printf("C# =====引导=====在邮箱引导去背包");
			m_flow_mark = FLOW_ATTRIBUTE;
			m_flow_attribute_2 = _temp;
			timer(100,"Guide_Delay_Attribute(1)");
//			AddEventCount(window.EVENTCOUNT_FIN_accept_attribute);
		}
		//为了玩家在触发正轨引导流程前，因为收到赠送礼品而能够正常触发，把这句话从上面注释的位置搬到这里
		AddEventCount(window.EVENTCOUNT_FIN_accept_attribute);
	}

	//点击“背包”触发调用
	void Guide_EnterPack_Attribute()//step 2-1
	{
		if (GetEventCount(window.EVENTCOUNT_FIN_accept_attribute) >= 1 && GetEventCount(window.EVENTCOUNT_FIN_operate_attribute) == 0)
		{
			printf("C# =====引导=====在背包引导去属性分页");
			timer(100,"Guide_Delay_Attribute(2)");
			AddEventCount(window.EVENTCOUNT_FIN_enter_pack_attribute);
		}
	}
	//点击“属性”触发调用
	void Guide_EnterAttribute()//step 2-2
	{
		if (GetEventCount(window.EVENTCOUNT_FIN_enter_pack_attribute) >= 1 && GetEventCount(window.EVENTCOUNT_FIN_operate_attribute) == 0)
		{
			printf("C# =====引导=====在属性分页引导启用");
			timer(100,"window.OpenHelp(10305)");
			AddEventCount(window.EVENTCOUNT_FIN_enter_attribute);
		}
	}
	//启用属性触发
	void Guide_OperateAttribute()//step 2-3
	{
		//如果玩家压根就没跟着引导走，自己手动把所有关键物品全部装备了，则不再触发引导
		if (GetEventCount(window.EVENTCOUNT_FIN_enter_attribute) == 0 && GetEventCount(window.EVENTCOUNT_FIN_operate_attribute) == 0)
		{
			printf("C# =====引导=====未跟着引导就启用了属性卡");
			AddEventCount(window.EVENTCOUNT_FIN_operate_attribute);
			return;
		}
		
		if (GetEventCount(window.EVENTCOUNT_FIN_enter_attribute) >= 1 && GetEventCount(window.EVENTCOUNT_FIN_operate_attribute) == 0)
		{
			printf("C# =====引导=====启用属性后的说明");
			timer(100,"window.OpenHelp(10306)");
			AddEventCount(window.EVENTCOUNT_FIN_operate_attribute);
			window.LMH_DelDBMonitor_PackAtt();//关闭属性卡监听
			printf("C# =====引导=====启用属性引导完成");
		}
	}
	//启用完成关闭背包触发
	void Guide_ReturnHall_Attribute()
	{
		//弹出对话框拉到某个训练里
		printf("C# =====引导=====操作属性卡后从背包返回大厅");
		//引导训练事件——所有的训练交给任务处理，此处注掉
//		var t_trainID = window.GetMinTrainIDByType(1);//暂定会在资格赛发生这件事儿
//		if ( t_trainID != 0)
//		{
//			window.find("UIController").LoadDLG(407);
//			window.find("DLGLAYER").find("VMB_LMHToTrain_Logic").SetTrainID(t_trainID);
//		}
		AddEventCount(window.EVENTCOUNT_FIN_return_hall_attribute);
	}
	//从商城直接买入属性卡触发
	void Guide_Buy_Attribute()
	{
//		if (GetEventCount(window.EVENTCOUNT_FIN_accept_attribute) == 0)
		if (GetEventCount(window.EVENTCOUNT_FIN_operate_attribute) == 0 && GetEventCount(window.EVENTCOUNT_EN_buy_attribute) == 0)
		{
			printf("C# =====引导=====在商城界面引导去背包");
			m_flow_mark = FLOW_ATTRIBUTE;
			timer(200,"Guide_Delay_Attribute(1)");
			AddEventCount(window.EVENTCOUNT_EN_buy_attribute);
			//拿到本函数调用处，解决因同时购买3个关键物品只能在背包触发1个引导的问题
//			AddEventCount(window.EVENTCOUNT_FIN_accept_attribute);
		}
	}

