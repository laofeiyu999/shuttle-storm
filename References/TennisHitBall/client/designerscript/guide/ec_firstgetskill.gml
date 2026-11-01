//---------------第一次获得技能的引导-------------------------
	/*
	因为现在只有升到6级获得资格赛称号的时候才能获得技能，
	也就是说不会随时随地的触发技能礼品的引导，
	所以流程最开始的Guide_EnterHall_Skill()函数只有在回到大厅的时候触发。
	*/
	
	void Guide_Delay_Skill(step)
	{
		switch (step)
		{
			case 1:
			{
				window.LMH1_NewCap("BtnName_Hall_Bottom_Pack");
				window.LMH1_SetBtnFlash("BtnName_Hall_Bottom_Pack",true);
				window.OpenHelp(10203);
				break;
			}
			case 2:
			{
				window.LMH1_NewCap("BtnName_Pack_Skill");
				window.LMH1_SetBtnFlash("BtnName_Pack_Skill",true);
				window.OpenHelp(10204);
				break;
			}
			default:break;
		}
	}
	//玩家点击从多种途径返回大厅触发调用
	void Guide_EnterHall_Skill()//step 1-1
	{
		printf("C# 数据检查: EVENTCOUNT_EN_receive_skill " + GetEventCount(window.EVENTCOUNT_EN_receive_skill));
		printf("C# 数据检查: EVENTCOUNT_FIN_accept_skill " + GetEventCount(window.EVENTCOUNT_FIN_accept_skill));
//		if (GetEventCount(window.EVENTCOUNT_EN_receive_skill) >= 1 && GetEventCount(window.EVENTCOUNT_FIN_accept_skill) == 0)
		if (GetEventCount(window.EVENTCOUNT_EN_receive_skill) >= 1 && GetEventCount(window.EVENTCOUNT_EN_accept_skill) == 0)
		{
			printf("C# =====引导=====获得技能礼品引导去邮箱");
			timer(1000,"window.OpenHelp(10201)");
			AddEventCount(window.EVENTCOUNT_FIN_enter_hall_skill);
			return;
		}
//		if (GetEventCount(window.EVENTCOUNT_FIN_accept_skill) >= 1)
		if (GetEventCount(window.EVENTCOUNT_EN_accept_skill) >= 1)
		{
			printf("C# =====引导=====未按照引导绑定技能的补救措施");
			timer(1000,"Guide_Delay_Skill(1)");
			AddEventCount(window.EVENTCOUNT_FIN_enter_hall_skill);
			m_flow_skill_1 = GetEventCount(window.EVENTCOUNT_FIN_enter_hall_skill);//防止点击邮箱触发引导
			return;
		}
	}
	//玩家点击“邮箱”触发调用
	void Guide_EnterPostbox_Skill()//step 1-2
	{
		var _temp = GetEventCount(window.EVENTCOUNT_FIN_enter_hall_skill);
		if (_temp > m_flow_skill_1 && GetEventCount(window.EVENTCOUNT_FIN_accept_skill) == 0)
		{
			printf("C# =====引导=====在邮箱引导收礼品");
			m_flow_skill_1 = _temp;
			timer(100,"window.OpenHelp(10202)");
			AddEventCount(window.EVENTCOUNT_FIN_enter_postbox_skill);
		}
	}
	//物品进入背包触发
	void Guide_AcceptSkill()//step 1-3
	{
		var _temp = GetEventCount(window.EVENTCOUNT_FIN_enter_postbox_skill);
		if (_temp > m_flow_skill_2 && GetEventCount(window.EVENTCOUNT_FIN_accept_skill) == 0)
		{
			printf("C# =====引导=====在邮箱引导去背包");
			m_flow_mark = FLOW_SKILL;
			m_flow_skill_2 = _temp;
			timer(100,"Guide_Delay_Skill(1)");
//			AddEventCount(window.EVENTCOUNT_FIN_accept_skill);
		}
		//为了玩家在触发正轨引导流程前，因为收到赠送礼品而能够正常触发，把这句话从上面注释的位置搬到这里
		AddEventCount(window.EVENTCOUNT_FIN_accept_skill);
	}

	//点击“背包”触发调用
	void Guide_EnterPack_Skill()//step 2-1
	{
		if (GetEventCount(window.EVENTCOUNT_FIN_accept_skill) >= 1 && GetEventCount(window.EVENTCOUNT_FIN_bind_skill) == 0)
//		//为了玩家在等级不足时买入造成反复强制引导，改变判断条件
//		if (GetEventCount(window.EVENTCOUNT_FIN_accept_skill) >= 1 && GetEventCount(window.EVENTCOUNT_FIN_enter_pack_skill) == 0)
		{
			printf("C# =====引导=====在背包引导去技能分页");
			timer(100,"Guide_Delay_Skill(2)");
			AddEventCount(window.EVENTCOUNT_FIN_enter_pack_skill);
		}
	}
	//点击“技能”触发调用
	void Guide_EnterSkill()//step 2-2
	{
		if (GetEventCount(window.EVENTCOUNT_FIN_enter_pack_skill) >= 1 && GetEventCount(window.EVENTCOUNT_FIN_bind_skill) == 0)
		{
			printf("C# =====引导=====在技能分页引导绑定");
			timer(100,"window.OpenHelp(10205)");
			AddEventCount(window.EVENTCOUNT_FIN_enter_skill);
		}
	}
	//绑定技能触发
	void Guide_BindSkill()//step 2-3
	{
		//如果玩家压根就没跟着引导走，自己手动把所有关键物品全部装备了，则不再触发引导
		if (GetEventCount(window.EVENTCOUNT_FIN_enter_skill) == 0 && GetEventCount(window.EVENTCOUNT_FIN_bind_skill) == 0)
		{
			printf("C# =====引导=====未跟着引导就绑定了技能");
			AddEventCount(window.EVENTCOUNT_FIN_bind_skill);
			return;
		}
		
		if (GetEventCount(window.EVENTCOUNT_FIN_enter_skill) >= 1 && GetEventCount(window.EVENTCOUNT_FIN_bind_skill) == 0)
		{
			printf("C# =====引导=====绑定技能后的说明");
			timer(100,"window.OpenHelp(10206)");
			AddEventCount(window.EVENTCOUNT_FIN_bind_skill);
			window.LMH_DelDBMonitor_PackSkill();//关闭技能监听
			printf("C# =====引导=====绑定技能引导完成");
		}
	}
	void Guide_BindSkill_withoutRacket()//玩家等级满足，技能进入背包，从大厅到技能分页都有提示，最好虽然未绑定成功，但默认玩家已学会流程
	{
		if (GetEventCount(window.EVENTCOUNT_FIN_enter_skill) >= 1 && GetEventCount(window.EVENTCOUNT_FIN_bind_skill) == 0)
		{
			printf("C# =====引导=====提示需要装备球拍，在绑定技能");
			timer(100,"window.OpenHelp(10209)");
			AddEventCount(window.EVENTCOUNT_FIN_bind_skill);
			window.LMH_DelDBMonitor_PackSkill();//关闭技能监听
			printf("C# =====引导=====绑定技能引导完成");
		}
	}
	//绑定完成关闭背包触发
	void Guide_ReturnHall_Skill()//
	{
		//弹出对话框拉到某个训练里
		printf("C# =====引导=====绑定技能后从背包返回大厅");
		//引导训练事件——所有的训练交给任务处理，此处注掉
//		var t_trainID = window.GetMinTrainIDByType(2);
//		if ( t_trainID != 0)
//		{
//			window.find("UIController").LoadDLG(407);
//			window.find("DLGLAYER").find("VMB_LMHToTrain_Logic").SetTrainID(t_trainID);
//		}
		AddEventCount(window.EVENTCOUNT_FIN_return_hall_skill);
	}
	//从商城直接买入技能触发
	void Guide_Buy_Skill()
	{
		//拿到本函数调用处，解决因同时购买3个关键物品只能在背包触发1个引导的问题
//		AddEventCount(window.EVENTCOUNT_FIN_accept_skill);
		if (window.GetLVByUID() < 6)//如果等级不足，提示等级不足，不继续提示绑定
		{
			printf("C# =====引导=====玩家等级不足");
			timer(200,"window.OpenHelp(10208)");
			//等级不足时，进入背包不触发技能引导，将计数置零
			ResetEventCount(window.EVENTCOUNT_FIN_accept_skill);
			return;
		}
//		if (GetEventCount(window.EVENTCOUNT_FIN_accept_skill) == 0)
		if (GetEventCount(window.EVENTCOUNT_FIN_bind_skill) == 0 && GetEventCount(window.EVENTCOUNT_EN_buy_skill) == 0)
		{
			printf("C# =====引导=====在商城界面引导去背包");
			m_flow_mark = FLOW_SKILL;
			timer(200,"Guide_Delay_Skill(1)");
			AddEventCount(window.EVENTCOUNT_EN_buy_skill);
		}
	}

	
