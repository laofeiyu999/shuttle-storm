//功能：小何
//内容：老虎
//鼓励玩家多打比赛，并对此提供奖励。于结算画面中，使用引导对话框实现。

class CGameEndGuide GameEndGuide
{
	name="CGameEndGuide";

	//普通比赛结算时触发的引导 老虎使用
	//[输入值]:iGuideID:TennisGame,GameEndPrasent表的guideid
	//iGuideID最好直接填写GameUI,UIHelp表的ID，免得转换
	void Result(iGuideID,gamenum,winnum)
	{	
		print("Result::iGuideID:"+iGuideID);
		//以下顺序按照优先级高低排列
		if (iGuideID == 10304)//获胜10场
		{
			//引导事件
			window.eventCounter.AddEventCount(window.EVENTCOUNT_EN_normal_win10);
			printf("C# =====引导=====普通比赛获胜10场次数 " + window.eventCounter.GetEventCount(window.EVENTCOUNT_EN_normal_win10));
			return;
		}
		if (iGuideID == 10303)//获胜6场
		{
			//引导事件
			window.eventCounter.AddEventCount(window.EVENTCOUNT_EN_normal_win6);
			printf("C# =====引导=====普通比赛获胜6场次数 " + window.eventCounter.GetEventCount(window.EVENTCOUNT_EN_normal_win6));
			return;
		}
		if (iGuideID == 10302)//比赛10场
		{
			//引导事件
			window.eventCounter.AddEventCount(window.EVENTCOUNT_EN_normal_game10);
			printf("C# =====引导=====普通比赛参加10场次数 " + window.eventCounter.GetEventCount(window.EVENTCOUNT_EN_normal_game10));
			return;
		}
		if (iGuideID == 10301)//比赛6场
		{
			//引导事件
			window.eventCounter.AddEventCount(window.EVENTCOUNT_EN_normal_game6);
			printf("C# =====引导=====普通比赛参加6场次数 " + window.eventCounter.GetEventCount(window.EVENTCOUNT_EN_normal_game6));
			return;
		}
	}
};