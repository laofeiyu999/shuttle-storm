//-------------------普通比赛获胜的引导-------------------------
	void Guide_NormalMatch_Game6()
	{
		if (GetEventCount(window.EVENTCOUNT_EN_normal_game6) != GetEventCount(window.EVENTCOUNT_FIN_normal_game6))
		{
			timer(1000,"window.OpenHelp(20401)");
			AddEventCount(window.EVENTCOUNT_FIN_normal_game6);
			printf("C# =====引导=====普通比赛参赛6场引导完成次数 " + GetEventCount(window.EVENTCOUNT_FIN_normal_game6));
		}
	}
	void Guide_NormalMatch_Game10()
	{
		if (GetEventCount(window.EVENTCOUNT_EN_normal_game10) != GetEventCount(window.EVENTCOUNT_FIN_normal_game10))
		{
			timer(1000,"window.OpenHelp(20402)");
			AddEventCount(window.EVENTCOUNT_FIN_normal_game10);
			printf("C# =====引导=====普通比赛参赛10场引导完成次数 " + GetEventCount(window.EVENTCOUNT_FIN_normal_game10));
		}
	}
	void Guide_NormalMatch_Win6()
	{
		if (GetEventCount(window.EVENTCOUNT_EN_normal_win6) != GetEventCount(window.EVENTCOUNT_FIN_normal_win6))
		{
			timer(1000,"window.OpenHelp(20403)");
			AddEventCount(window.EVENTCOUNT_FIN_normal_win6);
			printf("C# =====引导=====普通比赛获胜6场引导完成次数 " + GetEventCount(window.EVENTCOUNT_FIN_normal_win6));
		}
	}
	void Guide_NormalMatch_Win10()
	{
		if (GetEventCount(window.EVENTCOUNT_EN_normal_win10) != GetEventCount(window.EVENTCOUNT_FIN_normal_win10))
		{
			timer(1000,"window.OpenHelp(20404)");
			AddEventCount(window.EVENTCOUNT_FIN_normal_win10);
			printf("C# =====引导=====普通比赛获胜10场引导完成次数 " + GetEventCount(window.EVENTCOUNT_FIN_normal_win10));
		}
	}