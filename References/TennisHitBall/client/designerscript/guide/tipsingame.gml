//功能：小何
//内容：老虎
/*
游戏中的操作提示
1、为了让玩家在对战中能够接到球，在第一次对手一击得分时，第二次提示不停按键
2、为了让玩家在得到技能并绑定后，不去训练也能使用，在第一次能量足够时提示按键
*/
class CGameGuide GameGuide
{
	name="CGameGuide";

	var serveUserID = 0;
	var curBout = 0;
	var level = 0;

	//得到游戏场次 
	//_GetGameNum(userid)

	//得到某个人某个回合是否一击得分,返回值:1是一击得分,其他不是一击得分
	//_GetUserAce(userid,bout);

	//得到某个人某个回合是否接球方,返回值:1是接球方,其他不是接球方
	//_GetUserRecServe(userid,bout);

	//得到对手id,index表示取第几个人
	//_GetOppUserID(userid,index)

	//当时是双打还是单打,返回值:1单打,2双打,其他错误值
	//_GetTeam()

	//某个人是否为接球方,返回值:1是接球方,其他不是接球方
	//_RecServe(userid)

	//某个人的能量是多少
	//_GetEnergy(userid)
	
	void Event_Serve(userid,bout)//发球触发事件,在某个人发球后触发 userid:用户id bout:当前回合
	{
		printf("C# ==恶心的按钮== 发球事件  第 " + bout + " 回合");
		serveUserID = userid;
		bout -= 1;
//		level = 0;
		var myID = window.GetMyUID();		//一定是当前控制的这个人
		var opp1ID = _GetOppUserID(myID,0);	//一定是当前控制的这个人的对手1
		var opp2ID = _GetOppUserID(myID,1);	//一定是当前控制的这个人的对手2
		printf("C# ==恶心的按钮== 发球方ID " + userid + "  对手1的ID " + opp1ID + "  对手2的ID " + opp2ID + "  我的ID " + myID);

		if ( _GetGameNum(myID) > 10 ) return;//只在新手比赛的前10场提示

		if ( userid == opp1ID || userid == opp2ID )//对手发球
		{
			printf("C# ==恶心的按钮== " + userid + " 发球");

			//如果上一分对手一击得分，那么这一分对手发球我接发球，则提示
			printf("C# ==恶心的按钮== 上一分 " + opp1ID + " 一击得分 " + _GetUserAce(opp1ID,bout) + "  " + opp2ID + " 一击得分 " + _GetUserAce(opp2ID,bout));
			if ( _GetUserAce(opp1ID,bout) != 0 || _GetUserAce(opp2ID,bout) != 0)//上一分对手一击得分
			{
				printf("C# ==恶心的按钮== 这一分接发球方是不是 " + myID + " " + _RecServe(myID));
				if ( _RecServe(myID) == 1 )//这一分我还是接发球方
				{
					printf("C# ==恶心的按钮== 上一分接发球方是 " + myID + " " + _GetUserRecServe(myID,bout) + " 是 " + opp1ID + " " + _GetUserRecServe(opp1ID,bout) + " 是 " + opp2ID + " " + _GetUserRecServe(opp2ID,bout));
					if ( _GetUserRecServe(myID,bout) != 0 || _GetUserRecServe(opp1ID,bout) != 0 || _GetUserRecServe(opp2ID,bout) != 0)//上一分接发球方不是我的队友
					{
						//调这个函数表示对方发球，立即提示按键
//						level = 1;//接球提示的优先级最高
						window.LMH_BigKeyOprt(1,1);
//						timer(2300,"window.LMH_BigKeyOprt(0,1)");
						return;
					}
				}
			}
		}
	}

	void Event_RecSever(userid,bout)//接发球事件,在某个人接发球后触发 userid:用户id bout:当前回合
	{
		printf("C# ==恶心的按钮== 接发球事件  第 " + bout + " 回合");
		bout -= 1;
//		level = 0;
		var myID = window.GetMyUID();		//一定是当前控制的这个人
		var opp1ID = _GetOppUserID(myID,0);	//一定是当前控制的这个人的对手1
		var opp2ID = _GetOppUserID(myID,1);	//一定是当前控制的这个人的对手2
		printf("C# ==恶心的按钮== 对手1的ID " + opp1ID + " 对手2的ID " + opp2ID + " 我的ID " + myID);

		if ( userid == myID )//我接发球
		{
			printf("C# ==恶心的按钮==  " + myID + " 接发球  啥也不做");
			return;
		}

		if ( _GetGameNum(myID) > 10 ) return;

		if ( userid == opp1ID || userid == opp2ID )//我的对手接发球
		{
			printf("C# ==恶心的按钮==  " + userid + " 接发球");
			//如果上一分对手一击得分，这一分是我发球，对手接球成功，则提示
			printf("C# ==恶心的按钮== 上一分 " + opp1ID + " 一击得分 " + _GetUserAce(opp1ID,bout) + "  " + opp2ID + " 一击得分 " + _GetUserAce(opp2ID,bout));
			if ( _GetUserAce(opp1ID,bout) != 0 || _GetUserAce(opp2ID,bout) != 0)//上一分对手一击得分
			{
				printf("C# ==恶心的按钮== 这一分发球方是 " + serveUserID);
				if ( serveUserID == myID )//这一分我发球
				{
					printf("C# ==恶心的按钮== 上一分接发球方是 " + myID + " " + _GetUserRecServe(myID,bout) + " 是 " + opp1ID + " " + _GetUserRecServe(opp1ID,bout) + " 是 " + opp2ID + " " + _GetUserRecServe(opp2ID,bout));
					if ( _GetUserRecServe(myID,bout) != 0 || _GetUserRecServe(opp1ID,bout) != 0 || _GetUserRecServe(opp2ID,bout) != 0)//上一分接发球不是我的队友
					{
						//调这个函数表示对方接发球，击球后提示按键
//						level = 1;//接球提示的优先级最高
						window.LMH_BigKeyOprt(1,1);
//						timer(2000,"window.LMH_BigKeyOprt(0,1)");
						return;
					}
				}
			}
		}
	}

	void Event_HitReady(userid,bout)//可以击球事件,在某个人回球后对方触发 userid:用户id bout:当前回合
	{
		var myID = window.GetMyUID();		//一定是当前控制的这个人
		if ( _GetGameNum(myID) > 10 ) return;
//		if ( level > 0) return;//如果提示接球，就不提示使用技能
		
		if ( window.HasSkillInGame() == 0) return;//如果没有技能就不触发

		if (curBout == 0 || curBout != bout)//这一分只提示一次
		{
			curBout = bout;

			//如果已经绑定了技能，却从来没有在比赛中使用过技能，当前能量又足以使用一次防御性技能时，提示按键
			printf("C# ==恶心的按钮== 绑定技能次数 " + window.eventCounter.GetEventCount(window.EVENTCOUNT_FIN_skill_band));
			if ( window.eventCounter.GetEventCount(window.EVENTCOUNT_FIN_skill_band) >= 1 )//绑定过技能
			{
				printf("C# ==恶心的按钮== 使用技能次数 " + window.eventCounter.GetEventCount(window.EVENTCOUNT_EN_skill_use));
				if ( window.eventCounter.GetEventCount(window.EVENTCOUNT_EN_skill_use) >= 1 )//使用过技能
				{
					printf("C# ==恶心的按钮== 这小子用过技能了");
					return;
				}
				if ( window.eventCounter.GetEventCount(window.EVENTCOUNT_EN_skill_use) == 0 )//没有使用过技能
				{
					printf("C# ==恶心的按钮== " + myID + "当前的能量 " + _GetEnergy(myID));
					if ( _GetEnergy(myID) >= 45 )//写死了，注意修改
					{
						window.LMH_BigKeyOprt(1,2);
						return;
					}
				}
			}
		}
	}
};