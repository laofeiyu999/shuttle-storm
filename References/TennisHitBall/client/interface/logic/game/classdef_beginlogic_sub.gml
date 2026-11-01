//
//游戏内界面的逻辑部分:开始-的子类定义
//

//角色的属性类-逻辑
class VRole_Attribute_Logic item
{
	size = "512,768";
	
	void Init()
	{
		//力量
		//参数 data2
		staticvar s_TStrength = new VMyText{}
		
		//技术
		//参数 data2
		staticvar s_TSkill = new VMyText{pos = "0,20";}
		
		//正手
		//参数 data2
		staticvar s_TForceHand = new VMyText{pos = "0,40";}
		
		//反手
		//参数 data2
		staticvar s_TBackHand = new VMyText{pos = "0,60";}
		
		//能量
		//参数 data2
		staticvar s_TEnergy = new VMyText{pos = "0,80";}

		//发球
		//参数 data2
		staticvar s_TServe = new VMyText{pos = "0,100";}

		//体力
		//参数 data2
		staticvar s_TPhysicalF = new VMyText{pos = "0,120";}
//		//等级
//		//参数 data2
//		staticvar s_CuLevel = new VMyText{pos = "10,200";}
		
		//昵称
		//参数 data2
		staticvar s_Nkname = new VMyText{pos = "10,230";}
		
		//称号
		//参数 data2:1新手 2资格赛选手 3巡回赛选手 4黄金赛选手 5大师赛选手
		staticvar s_Title = new VMyText{pos = "10,260";}
	}
};