//---------------第一次进活动场界面引导-----------------------
	void Guide_Delay_Arena(step)
	{
		switch (step)
		{
			case 1:
			{
				window.LMH1_NewCap("BtnName_Arena_LookOver");
				window.LMH1_SetBtnFlash("BtnName_Arena_LookOver",true);
				window.OpenHelp(11002);
				break;
			}
			case 2:
			{
				window.LMH1_NewCap("BtnName_Arena_LookOver_Apply");
				window.LMH1_SetBtnFlash("BtnName_Arena_LookOver_Apply",true);
				window.OpenHelp(11003);
				break;
			}
			default:break;
		}
	}
	//进入大厅触发
	void Guide_EnterHall_Arena()
	{
		printf("C# 数据检查: GetLVByUID " + window.GetLVByUID());
		if (window.GetLVByUID() == 11)
		{
			printf("C# =====引导=====级别满足要求引导去活动场");
			timer(500,"window.OpenHelp(11001)");
			AddEventCount(window.EVENTCOUNT_FIN_enter_hall_arena);
		}
	}
	//进入活动场触发
	void Guide_Arena()
	{
		var _temp = GetEventCount(window.EVENTCOUNT_FIN_enter_hall_arena);
		if (_temp > m_flow_arena_1 && GetEventCount(window.EVENTCOUNT_FIN_success_queue) == 0)
		{
			printf("C# =====引导=====在活动场引导查看活动信息");
			m_flow_arena_1 = _temp;
			timer(200,"Guide_Delay_Arena(1)");
//			window.OpenHelp(11002);
			AddEventCount(window.EVENTCOUNT_FIN_enter_arena);
		}
	}
	//点击查看信息触发
	void Guide_Arena_Info()
	{
		var _temp = GetEventCount(window.EVENTCOUNT_FIN_enter_arena);
		if (_temp > m_flow_arena_2 && GetEventCount(window.EVENTCOUNT_FIN_success_queue) == 0)
		{
			printf("C# =====引导=====在活动信息引导报名");
			m_flow_arena_2 = _temp
			timer(200,"Guide_Delay_Arena(2)");
//			window.OpenHelp(11003);
			AddEventCount(window.EVENTCOUNT_FIN_enter_info_arena);
		}
	}
	//报名成功触发
	void Guide_Arena_Queue()
	{
		if (GetEventCount(window.EVENTCOUNT_FIN_enter_info_arena) >= 1 && GetEventCount(window.EVENTCOUNT_FIN_success_queue) == 0)
		{
			printf("C# =====引导=====报名完成的说明");
			window.OpenHelp(11004);
			AddEventCount(window.EVENTCOUNT_FIN_success_queue);
		}
	}
