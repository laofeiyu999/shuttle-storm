//
//游戏内界面的部分类定义
//

//昵称+能量+体力：逻辑>>单打
class VRole_Name_Energy_Logic item
{
	size = "300,50";bgcolor = "#cccccc";
	void Init()
	{	
		//昵称
		//参数 data2
		staticvar s_NickName = new VMyText{};	
		
		//能量
		//参数 data2:当前能量
		//参数 data3:总能量
		staticvar s_CurrEnergy = new VMyText{pos = "0,25";}	

		//体力
		//参数 data2:当前体力
		//参数 data3:总体力
		staticvar s_Stamina = new VMyText{pos = "0,50";}	
	}
};

//昵称1+昵称2+能量：逻辑>>双打
class VRole_Name_Energy_D_Logic item
{
	size = "300,50";bgcolor = "#cccccc";
	void Init()
	{	
		//昵称1(P1或P2)
		//参数 data2
		staticvar s_Name1 = new VMyText{};	
		
		//昵称2(P3或P4)
		//参数 data2
		staticvar s_Name2 = new VMyText{pos = "150,0";}	

		//能量
		//参数 data2:当前能量
		//参数 data3:总能量
		staticvar s_CurrEnergy = new VMyText{pos = "0,25";}	

		//体力
		//参数 data2:当前体力
		//参数 data3:总体力
		staticvar s_Stamina = new VMyText{pos = "0,50";}	
	}
};

//技能的图标：逻辑
class VRole_Skill_Icon_Logic item
{
	size = "150,110";//bgcolor = "#FF00";
	void Init()
	{
		//技能 的参数一致
		//参数 data2:技能ID
		//参数 data3:状态(0灰,1亮)

		staticvar s_Skill_Icon1 = new VMyText{src = "技能1";size = "150,20";bgcolor = "#EAD3CE";}
		staticvar s_Skill_Icon2 = new VMyText{src = "技能2";size = "150,20";pos = "0,21";bgcolor = "#EAD3CE";}
		staticvar s_Skill_Icon3 = new VMyText{src = "技能3";size = "150,20";pos = "0,42";bgcolor = "#EAD3CE";}
		staticvar s_Skill_Icon4 = new VMyText{src = "技能4";size = "150,20";;pos = "0,63";bgcolor = "#EAD3CE";}
		staticvar s_Skill_Icon5 = new VMyText{src = "技能5";size = "150,20";pos = "0,84";bgcolor = "#EAD3CE";}
	}
};

//基础提示信息：逻辑
//交换场地+局数+比分+局点+破发点
class VRole_BaseTipInfo_Logic item
{
	size = "400,200";bgcolor = "#A8FDB8";alpha = 60;
	void Init()
	{
		//交换场地
		//参数 data2: 0.没有交换场地 1.有
		 staticvar s_ChangeGround = new VMyText{src = "交换场地";halign(50,0);}

		//局数
		//参数 data2: 第几局 99.决胜局
		 staticvar s_GameNum = new VMyText{src = "第一局";halign(50,0);valign(15,0);}

		//比分
		//参数 data2:自己的比分
		//参数 data3:对方的比分
		staticvar s_Point = new VMyText{src = "15:30";halign(50,0);valign(30,0);}

		//局点 
		//参数 data2：0.默认状态 1.局点 
		staticvar s_GamePoint = new VMyText{src = "局点";halign(50,0);valign(45,0);}

		//破发点
		//参数 data2： 0.不是破发点 1.有
		staticvar s_BreakPoint = new VMyText{src = "破发点";halign(50,0);valign(60,0);}

		//赛点
		//参数 data2：0.默认状态 2.赛点
		staticvar s_SetPoint = new VMyText{src = "赛点";halign(50,0);valign(75,0);}		
	}
};

//特殊提示信息:逻辑
class VPlay_Special_Logic item
{
	size = "100%,100%";bgcolor = "#000000";alpha = 70;
	var _Text = new VMyText{valign(70,0);font = "宋体,-1,40";}
	//
	void SetData(RoleID,ActIndex,Sex)
	{
		var _Temp = "";
		switch (ActIndex)
		{
			case 1:{_Temp = "发球得分";break;}
			case 2:{_Temp = "扣杀";break;}
			case 3:{_Temp = "绝杀";break;}
			case 4:{_Temp = "反杀";break;}
		}
		_Text.SetData("RoleID:"+RoleID," "+_Temp,"ActIndex:"+ActIndex+",Sex:"+Sex);
	}
};

//自己装备的技能的类
class VEquipSkill_Logic CIfUser
{
	var m_SArr;		//技能数组
	var _str = GetUserSkillID(window.GetMyUID());//得到技能的字符串
	if (window.g_DEBUG)
	{
		printf("B# VEquipSkill_Logic-_str："+_str);
	}
	m_SArr = window.SplitStr2(_str,",",5);

	//返回技能的ID
	//参数：index 0-4
	void GetID(index)
	{
		return m_SArr[index];
	}

	//看看有没有技能
	void HasSkill()
	{
		var _i = 0;
		while (_i < 5)
		{
			if (toint(m_SArr[_i]) > 0)
			{
				return true;
			}
			_i += 1;
		}
		return false;
	}
};