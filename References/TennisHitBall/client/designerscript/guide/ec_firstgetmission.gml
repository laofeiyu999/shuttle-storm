//---------------第一次接受任务的引导---------------------
/*
完成强制训练，进入大厅后，先强制引导接任务，完成后触发接球拍礼品的引导，此引导只触发一次
*/

	//应该为线性流程，但脚本代码执行顺序的未知原因干掉了引导框，此形式存在不显示的风险
	void Guide_Delay_Mission(step)
	{
		switch (step)
		{
			case 1:
			{
				window.LMH1_NewCap("BtnName_Hall_Bottom_Task");
				window.LMH1_SetBtnFlash("BtnName_Hall_Bottom_Task",true);
				window.OpenHelp(13001);
				break;
			}
			//临时改为新手进入任务界面后提示去训练
			case 2:
			{
//				window.LMH1_NewCap("BtnName_Hall_Bottom_GameHall");
//				window.LMH1_SetBtnFlash("BtnName_Hall_Bottom_GameHall",true);
//				window.OpenHelp(13003);
				window.LMH1_NewCap("BtnName_Hall_Bottom_Train");
				window.LMH1_SetBtnFlash("BtnName_Hall_Bottom_Train",true);
				window.OpenHelp(13010);
				break;
			}
			case 3:
			{
//				window.LMH1_NewCap("BtnName_Hall_Bottom_GameHall");
//				window.LMH1_SetBtnFlash("BtnName_Hall_Bottom_GameHall",true);
//				window.OpenHelp(13007);
				window.LMH1_NewCap("BtnName_Hall_Bottom_Train");
				window.LMH1_SetBtnFlash("BtnName_Hall_Bottom_Train",true);
				window.OpenHelp(13011);
				break;
			}
			default:break;
		}
	}
	//玩家点击“去比赛”，或者从别的途径返回大厅触发调用
	void Guide_EnterHall_Mission()//step 1-1
	{
		printf("C# =====引导=====强制训练之前引导流程结束 开始接受任务的引导");
		AddEventCount(window.EVENTCOUNT_FIN_enter_channelchoose);//强制训练之前的引导以收到奖励为终结
//		if (GetEventCount(window.EVENTCOUNT_EN_accept_mission) == 0 && GetEventCount(window.EVENTCOUNT_FIN_enter_hall_mission) == 0)
//		{
			printf("C# =====引导=====新手第一次进大厅引导接任务");
			timer(1000,"Guide_Delay_Mission(1)");
//			timer(1000,"window.OpenHelp(13001)");
			AddEventCount(window.EVENTCOUNT_FIN_enter_hall_mission);
//		}
	}
	//玩家进入任务界面触发
	void Guide_EnterMission()
	{
		if (GetEventCount(window.EVENTCOUNT_FIN_enter_hall_mission) >= 1 && GetEventCount(window.EVENTCOUNT_FIN_accept_mission) == 0)
		{
			printf("C# =====引导=====在任务引导接任务");
			timer(100,"window.OpenHelp(13002)");
			AddEventCount(window.EVENTCOUNT_FIN_enter_mission);
			return;
		}
		if (GetEventCount(window.EVENTCOUNT_EN_complete_mission) >= 1 && GetEventCount(window.EVENTCOUNT_FIN_submit_mission) == 0)
		{
			printf("C# =====引导=====在任务引导交任务");
			timer(100,"window.OpenHelp(13005)");
			AddEventCount(window.EVENTCOUNT_FIN_complete_mission);
		}
	}
	//玩家接受任务成功触发
	void Guide_AcceptMission()
	{
//		if (GetEventCount(window.EVENTCOUNT_FIN_enter_mission) >= 1 && GetEventCount(window.EVENTCOUNT_FIN_accept_mission) == 0)
		if (GetEventCount(window.EVENTCOUNT_FIN_enter_hall_match) == 0 && GetEventCount(window.EVENTCOUNT_FIN_accept_mission) == 0)
		{
			printf("C# =====引导=====接任务成功引导去游戏室");
//			timer(100,"window.OpenHelp(13003)");
			timer(100,"Guide_Delay_Mission(2)");
			AddEventCount(window.EVENTCOUNT_FIN_accept_mission);
		}
	}
	//退出任务界面触发
	void Guide_Del_Mission()
	{
//		printf("C# =====引导=====确实退出任务界面");
		//不管跟没跟着引导接任务，出了任务界面就提示去比赛
//		if (GetEventCount(window.EVENTCOUNT_FIN_enter_hall_match) == 0)
		//临时改为新手进入任务界面后提示去训练
		if (GetEventCount(window.EVENTCOUNT_FIN_enter_train) == 0)
		{
			AddEventCount(window.EVENTCOUNT_FIN_return_hall_mission);
			timer(200,"Guide_ReturnHall_Mission");
		}
	}
	void Guide_ReturnHall_Mission()
	{
		printf("C# 数据检查: GetUIPos() " + window.GetUIPos());
		if (GetEventCount(window.EVENTCOUNT_FIN_return_hall_mission) >= 1)
		{
			if (window.GetUIPos() != window.POS_GAMEHALL || window.GetUIPos() != window.POS_CHANNELCHOOSE)
			{
				printf("C# =====引导=====在其他界面引导去游戏室");
//				timer(200,"Guide_Delay_Mission(3)");
				Guide_Delay_Mission(3);
			}
		}
	}

	//临时添加-进入训练界面
	void Guide_Train()
	{
		if (GetEventCount(window.EVENTCOUNT_FIN_enter_mission) >= 1 && GetEventCount(window.EVENTCOUNT_FIN_enter_train) == 0)
		{
			printf("C# =====引导=====在游戏室引导去快速单打");
			timer(200,"window.OpenHelp(13012)");
			AddEventCount(window.EVENTCOUNT_FIN_enter_train);
		}
	}

	//进入游戏室触发
	void Guide_Match()
	{
//		if (GetEventCount(window.EVENTCOUNT_FIN_enter_mission) >= 1 && GetEventCount(window.EVENTCOUNT_FIN_return_hall_mission) >= 1)
		if (GetEventCount(window.EVENTCOUNT_FIN_enter_mission) >= 1 && GetEventCount(window.EVENTCOUNT_FIN_enter_hall_match) == 0)
		{
			printf("C# =====引导=====在游戏室引导去快速单打");
			timer(200,"window.OpenHelp(13008)");
			AddEventCount(window.EVENTCOUNT_FIN_enter_hall_match);
		}
	}
	//点击快速开始触发
	void Guide_Match_Rand()
	{
		if (GetEventCount(window.EVENTCOUNT_FIN_enter_hall_match) >= 1 && GetEventCount(window.EVENTCOUNT_FIN_click_rand_match) == 0)
		{
			printf("C# =====引导=====点击快速单打提示等待");
			timer(200,"window.OpenHelp(13009)");
			AddEventCount(window.EVENTCOUNT_FIN_click_rand_match);
		}
	}

	//完成任务触发
	void Guide_Complete_Mission()
	{
		if (GetEventCount(window.EVENTCOUNT_EN_complete_mission) >= 1 && GetEventCount(window.EVENTCOUNT_FIN_complete_mission) == 0)
		{
			printf("C# =====引导=====完成一个任务");
			timer(100,"window.OpenHelp(13004)");
			AddEventCount(window.EVENTCOUNT_FIN_complete_mission);
		}
	}
	//交任务触发
	void Guide_Submit_Mission()
	{
		if (GetEventCount(window.EVENTCOUNT_FIN_complete_mission) >= 1 && GetEventCount(window.EVENTCOUNT_FIN_submit_mission) == 0)
		{
			printf("C# =====引导=====交任务成功");
			timer(100,"window.OpenHelp(13006)");
			AddEventCount(window.EVENTCOUNT_FIN_submit_mission);
		}
	}
	//放弃任务触发——用来应付一个变态完成了任务，不交付却放弃的问题
	void Guide_Giveup_Mission()
	{
		//如果第一次接了任务马上就放弃，什么也不触发
		//如果完成任务却放弃，再进入任务界面不能有交任务的提示
		printf("C# 数据检查: EVENTCOUNT_FIN_accept_mission " + GetEventCount(window.EVENTCOUNT_FIN_accept_mission));
		printf("C# 数据检查: EVENTCOUNT_FIN_complete_mission " + GetEventCount(window.EVENTCOUNT_FIN_complete_mission));
		if (GetEventCount(window.EVENTCOUNT_FIN_accept_mission) >= 1 && GetEventCount(window.EVENTCOUNT_FIN_complete_mission) >= 1)
		{
			printf("C# =====引导=====一个变态放弃了已完成的任务");
			AddEventCount(window.EVENTCOUNT_FIN_submit_mission);//视作交付过了
		}

	}
