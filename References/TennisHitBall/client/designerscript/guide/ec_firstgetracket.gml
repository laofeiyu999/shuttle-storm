//---------------第一次进入大厅界面的引导---------------------
	//在强制引导接受任务后触发
	void Guide_Delay_Racket(step)
	{
		switch (step)
		{
			case 1:
			{
				window.LMH1_NewCap("BtnName_Hall_Bottom_Mail");
				window.LMH1_SetBtnFlash("BtnName_Hall_Bottom_Mail",true);
				window.OpenHelp(10101);
				break;
			}
			case 2:
			{
				window.LMH1_NewCap("BtnName_Hall_Bottom_Pack");
				window.LMH1_SetBtnFlash("BtnName_Hall_Bottom_Pack",true);
				window.OpenHelp(10103);
				break;
			}
			case 3:
			{
				window.LMH1_NewCap("BtnName_Pack_Racket");
				window.LMH1_SetBtnFlash("BtnName_Pack_Racket",true);
				window.OpenHelp(10104);
				break;
			}
			default:break;
		}
	}
	//玩家点击“去比赛”，或者从别的途径返回大厅触发调用
	void Guide_EnterHall_Racket()//step 1-1
	{
//		printf("C# =====引导=====强制训练之前引导流程结束 开始装备球拍的引导");
//		AddEventCount(window.EVENTCOUNT_FIN_enter_channelchoose);//强制训练之前的引导以收到奖励为终结
		if (GetEventCount(window.EVENTCOUNT_EN_receive_racket) >= 1 && GetEventCount(window.EVENTCOUNT_FIN_accept_racket) == 0)
		{
			printf("C# =====引导=====在大厅引导去邮箱接球拍");
			timer(1000,"Guide_Delay_Racket(1)");
			AddEventCount(window.EVENTCOUNT_FIN_enter_hall_racket);
			return;
		}
		if (GetEventCount(window.EVENTCOUNT_FIN_accept_racket) >= 1)
		{
			printf("C# =====引导=====未按照引导装备球拍的补救措施");
			timer(1000,"Guide_Delay_Racket(2)");
			AddEventCount(window.EVENTCOUNT_FIN_enter_hall_racket);
			return;
		}
	}
	
	//玩家点击“邮箱”触发调用
	void Guide_EnterPostbox_Racket()//step 1-2
	{
		printf("C# 数据检查: EVENTCOUNT_EN_receive_racket " + GetEventCount(window.EVENTCOUNT_EN_receive_racket));
		printf("C# 数据检查: EVENTCOUNT_FIN_accept_racket " + GetEventCount(window.EVENTCOUNT_FIN_accept_racket));
		if (GetEventCount(window.EVENTCOUNT_EN_receive_racket) >= 1 && GetEventCount(window.EVENTCOUNT_FIN_accept_racket) == 0)
		{
			printf("C# =====引导=====在邮箱引导收礼品");
			timer(100,"window.OpenHelp(10102)");
			AddEventCount(window.EVENTCOUNT_FIN_enter_postbox_racket);
		}
	}
	//物品进入背包触发
	void Guide_AcceptRacket()//step 1-3
	{
		var _temp = GetEventCount(window.EVENTCOUNT_FIN_enter_postbox_racket);
		if (_temp > m_flow_racket_1 && GetEventCount(window.EVENTCOUNT_FIN_accept_racket) == 0)
		{
			//跟着引导接收了球拍
			printf("C# =====引导=====在邮箱引导去背包");
			m_flow_mark = FLOW_RACKET;
			m_flow_racket_1 = _temp;
			timer(100,"Guide_Delay_Racket(2)");
//			AddEventCount(window.EVENTCOUNT_FIN_accept_racket);
		}
		//为了玩家在触发正轨引导流程前，因为收到赠送礼品而能够正常触发，把这句话从上面注释的位置搬到这里
		AddEventCount(window.EVENTCOUNT_FIN_accept_racket);
	}

	//点击“背包”触发调用
	void Guide_EnterPack_Racket()//step 2-1
	{
		if (GetEventCount(window.EVENTCOUNT_FIN_accept_racket) >= 1 && GetEventCount(window.EVENTCOUNT_FIN_equip_racket) == 0)
		{
			printf("C# =====引导=====在背包引导去球拍");
			timer(100,"Guide_Delay_Racket(3)");
			AddEventCount(window.EVENTCOUNT_FIN_enter_pack_racket);
		}
	}
	//点击“球拍”触发调用
	void Guide_EnterRacket()//step 2-2
	{
//		var _temp = GetEventCount(window.EVENTCOUNT_FIN_accept_racket);
////		if (_temp >= m_flow_racket_2 && GetEventCount(window.EVENTCOUNT_FIN_equip_racket) == 0)
//		if (_temp > m_flow_racket_2 && GetEventCount(window.EVENTCOUNT_FIN_equip_racket) == 0)
//		{
//			printf("C# =====引导=====在球拍引导装备");
//			m_flow_racket_2 = _temp;
//			timer(200,"window.OpenHelp(10105)");
//			AddEventCount(window.EVENTCOUNT_FIN_enter_racket);
//		}

		if (GetEventCount(window.EVENTCOUNT_FIN_enter_pack_racket) >= 1 && GetEventCount(window.EVENTCOUNT_FIN_equip_racket) == 0)
		{
			printf("C# =====引导=====在球拍引导装备");
			timer(100,"window.OpenHelp(10105)");
			AddEventCount(window.EVENTCOUNT_FIN_enter_racket);
		}
	}
	//装备球拍触发
	void Guide_EquipRacket()//step 2-3
	{
		//如果玩家压根就没跟着引导走，自己手动把所有关键物品全部装备了，则不再触发引导
		if (GetEventCount(window.EVENTCOUNT_FIN_enter_racket) == 0 && GetEventCount(window.EVENTCOUNT_FIN_equip_racket) == 0)
		{
			printf("C# =====引导=====未跟着引导就装备了球拍");
			AddEventCount(window.EVENTCOUNT_FIN_equip_racket);
			return;
		}
		
		if (GetEventCount(window.EVENTCOUNT_FIN_enter_racket) >= 1 && GetEventCount(window.EVENTCOUNT_FIN_equip_racket) == 0)
		{
			printf("C# =====引导=====装备球拍后的说明");
			timer(100,"window.OpenHelp(10106)");
			AddEventCount(window.EVENTCOUNT_FIN_equip_racket);
			window.LMH_DelDBMonitor_PackPacket();//关闭球拍监听
			printf("C# =====引导=====装备球拍引导完成");
		}
	}
	//装备完成关闭背包触发
	void Guide_ReturnHall_Racket()//
	{
		//弹出对话框拉到某个训练里
		printf("C# =====引导=====装备球拍后从背包返回大厅");
		//引导训练事件——所有的训练交给任务处理，此处注掉
//		var t_trainID = window.GetMinTrainIDByType(1);
//		if ( t_trainID != 0)
//		{
//			window.find("UIController").LoadDLG(407);
//			window.find("DLGLAYER").find("VMB_LMHToTrain_Logic").SetTrainID(t_trainID);
//		}
		AddEventCount(window.EVENTCOUNT_FIN_return_hall_racket);
	}
	//从商城直接买入球拍触发
	void Guide_Buy_Racket()
	{
//		if (GetEventCount(window.EVENTCOUNT_FIN_accept_racket) == 0)
		if (GetEventCount(window.EVENTCOUNT_FIN_equip_racket) == 0 && GetEventCount(window.EVENTCOUNT_EN_buy_racket) == 0)
		{
			printf("C# =====引导=====在商城界面引导去背包");
			m_flow_mark = FLOW_RACKET;
			timer(200,"Guide_Delay_Racket(2)");
			AddEventCount(window.EVENTCOUNT_EN_buy_racket);
			//拿到本函数调用处，解决因同时购买3个关键物品只能在背包触发1个引导的问题
//			AddEventCount(window.EVENTCOUNT_FIN_accept_racket);
		}
	}
