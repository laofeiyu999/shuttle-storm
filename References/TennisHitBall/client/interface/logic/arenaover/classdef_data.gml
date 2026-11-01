//
//活动场-结算界面的类定义:逻辑>>单打+双打
//老虎修改2009-4-21

//数据的类
class VArena_Over_Data_Logic item
{
	size = "100%,100%";bgcolor = "#FFFFFF";alpha = 20;
	
	void Init()
	{
		//昵称
		//参数 data2
		staticvar s_NkName = new VMyText{}
		
		//经验
		//参数 data2
		staticvar s_Exp = new VMyText{pos = "0,20";}
		
		//金币
		//参数 data2
		staticvar s_Money = new VMyText{pos = "0,40";}
		
		//总得分
		//参数 data2:总得分
		staticvar s_TotalScore = new VMyText{pos = "0,60";}
		
		//使用技能次数
		//参数 data2:使用技能次数
		staticvar s_UseSkill = new VMyText{pos = "0,80";}
		
		//一击得分数
		//参数 data2：一击得分数
		staticvar s_ACEBall = new VMyText{pos = "0,100";}
		
		//受迫球次数
		//参数 data2：受迫球次数
		staticvar s_BadBall = new VMyText{pos = "0,120";}
		
		//满蓄力次数
		//参数 data2：满蓄力次数
		staticvar s_FullStoreBall = new VMyText{pos = "0,140";}

		//点券
		//参数 data2：点券
		staticvar s_WagerTaken = new VMyText{pos = "0,160";}

		//奖券
		//参数 data2：奖券
		staticvar s_Lottery = new VMyText{pos = "0,180";}
		
		//活动点
		//参数 data2：活动点
		staticvar s_ArenaPoint = new VMyText{pos = "0,200";}

		//积分
		//参数 data2：积分
		staticvar s_Integral = new VMyText{pos = "0,220";}

		//vip获奖图标
		staticvar s_vip = new img{pos = "40,365"};
		
//		//使用技能次数
//		//参数 data2:使用技能次数
//		staticvar s_UseSkill = new VMyText{pos = "0,80";}
//
//		//使用技能得分
//		//参数 data2:使用技能得分
//		staticvar s_UseSkillWinner = new VMyText{pos = "0,100";}
//		
//		//破解技能数
//		//参数 data2：破解技能
//		staticvar s_BreakSkill = new VMyText{pos = "0,120";}
//
//		//技能破技能
//		//参数 data2：技能破技能
//		staticvar s_BSkillUseSkill = new VMyText{pos = "0,140";}
//		
//		//ACE球
//		//参数 data2：ACE球
//		staticvar s_ACEBall = new VMyText{pos = "0,60";}
//
//		//破发成功率
//		//参数 data2：破发成功率
//		staticvar s_BreakPointWinner = new VMyText{pos = "0,160";}
	}
};