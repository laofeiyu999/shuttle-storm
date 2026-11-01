import("$./../../mdbdef/ScriptDbDef.gml");
/*
使用到的程序脚本调用
	根据物品ID查询背包中物品的数量
		window.GetItemNumByEnterID( gID);
	获得技能的攻防类型, 返回值: 0.无技能 1.攻击性技能 2.防御性技能 **注意无法获得发球技能的类型**
		parent.find("Logic").GetSkillType();
	获得当前拥有的能量
		parent.find("Logic").GetEnergy();
	对能量进行操作
		parent.find("Logic").AddEnergy_Tennis( energy);
	使用物品
		parent.find("self").UseGoods( entryID, useNum);
	修改体力相关
		parent.find("Logic").SetStamina();
		parent.find("Logic").SetMaxStamina();
		parent.find("Logic").GetStamina();
		parent.find("Logic").AddStamina_Tennis();
*/

class TennisSkill CSkillBuffMgr
{
	//-----------------------
	var energyBallID = 50101;//写死的变量 这个打死不能改！务必与数据库序号保持一致！！！
	//-----------------------
	
	var skillNum = 0;		//技能数量
	var energyBallNum = 0;	//能量球数量
	var mode = 0;			//技能触发方式:1 技能+能量 2 技能+能量球
	var reason = 0;			//能量不足的原因:1 进攻型 2 防守型

	//----------------------------------------程序调用----------------------------------------
	
	//--------------------技能触发判断--------------------
	/*
	用途: 技能使用的条件(数据库协议调用)
	参数: 
		skillID: 使用技能的ID
		deffEnergy: 防御技能需要的能量
		aggrEnergy: 进攻技能需要的能量
		gID: 技能物品的ID
	返回值: 0为失败, 1为成功
	*/
	void SkillCondition( skillID, deffEnergy, aggrEnergy, gID)
	{
		skillNum = window.GetItemNumByEnterID( gID);
		energyBallNum = window.GetItemNumByEnterID( energyBallID);
		VNETLOG(1089,"SkillCondition called. 技能ID:" + skillID + "\n");
		VNETLOG(1089,"查询物品[" + gID + "]数量为: " + skillNum + "\n");
		VNETLOG(1089,"查询物品[" + energyBallID + "]数量为: " + energyBallNum + "\n");
		printf("6# SkillCondition 触发技能判断");

		if ( window.LMH_IsInTraining() )//在训练里的触发机制，随便用
		{	return 1;}
		else//否则就是在普通比赛，检查能量和技能数
		{
			return NormalMatchCondition( skillID, deffEnergy, aggrEnergy, gID);
		}
	}
	void NormalMatchCondition( skillID, deffEnergy, aggrEnergy, gID)//在比赛里的触发机制
	{
		printf("6# SkillCondition 在比赛中使用");
		if( GetSkillType(skillID) == 0)//查找出错
		{
			VNETLOG(1089,"SkillCondition ERR! 无法查找技能类型.\n");
			return 0;
		}
		
		if ( CheckStamina( skillID, aggrEnergy, deffEnergy) == 0)//体力不足
		{
			window.WriteChat(7,"您的体力不足，无法使用技能");//往聊天框写 提示信息
			return 0;
		}

		if( skillNum > 0)//有技能
		{
			if( CheckEnergy( skillID, aggrEnergy, deffEnergy) == 1)//能量足够
			{
				mode = 1;
				return 1;
			}
			else//能量不足,检测是否能使用能量球
			{
				var temp = CheckEnergyBall();
				if ( temp == 1)//可以使用能量球
				{return 1;}
				else//不能用，也就是说到此判断出玩家能量不足，要根据具体情况打印出原因
				{
					if (reason == 1)//进攻型技能 能量不足
					{window.WriteChat(7,"进攻姿态触发技能，能量不足无法使用");}
					if (reason == 2)//防守型技能 能量不足
					{window.WriteChat(7,"防守姿态触发技能，能量不足无法使用");}
					return 0;
				}
			}
		}
		else
		{
			VNETLOG(1089,"SkillCondition 技能耗尽.\n");
			return 0;
		}
	}
	void CheckEnergyBall()
	{
		printf("6# SkillCondition 检查能量球数量: " + energyBallNum);
		if( EnergyBallPermit() == 1)//可以使用能量球
		{
			if( energyBallNum > 0)//背包中有能量球
			{
				mode = 2;
				return 1;
			}
			else//背包中没有能量球
			{
				VNETLOG(1089,"SkillCondition 能量球耗尽.\n");
				return 0;
			}
		}
		else//不能使用能量球
		{
			VNETLOG(1089,"SkillCondition 规则不允许使用能量球.\n");
			return 0;
		}
	}
	// SkillCondition end

	//--------------------技能使用结果--------------------
	/*
	用途: 技能使用(数据库协议调用)
	参数: 
		skillID: 使用技能的ID
		deffEnergy: 防御技能需要的能量
		aggrEnergy: 进攻技能需要的能量
		gID: 技能物品的ID
	*/
	void SkillUse( skillID, aggrEnergy, deffEnergy, gID)
	{
		if ( window.LMH_IsInTraining() == 0)//不是在训练里
		{
			NormalMatchUse(skillID, deffEnergy, aggrEnergy, gID);
		}
	}
	void NormalMatchUse( skillID, aggrEnergy, deffEnergy, gID)//在比赛里的使用技能，相应扣数量
	{
		printf("6# SkillUse 比赛中消耗技能");
		var _skillNum = window.GetItemNumByEnterID( gID);
		VNETLOG(1089,"SkillUse called.\n");
		VNETLOG(1089,"查询物品[" + gID + "]数量为: " + skillNum + "\n");
		if ( _skillNum != skillNum)//安全性检查
		{
			alert("SkillUse ERR! 技能触发前后的数量不符");
			return;
		}

		ConsumeStamina( skillID);//扣除体力
		if ( mode == 1)//技能+能量
		{
			var _energy = ConsumeEnergy( skillID, aggrEnergy, deffEnergy);
			parent.find("Logic").AddEnergy_Tennis( _energy);
			UseItem( gID, 1);
			VNETLOG(1089,"SkillUse 扣除能量, 扣除技能, 使用技能成功.\n");
			return;
		}
		if ( mode == 2)//技能+能量球
		{
			UseItem( energyBallID, 1);
			UseItem( gID, 1);

			Mission_Event()//调用任务的事件函数

			VNETLOG(1089,"SkillUse 扣除能量球, 扣除技能, 使用技能成功.\n");
			return;
		}
		
		//引导事件 提示如何使用技能
		window.eventCounter.AddEventCount(window.EVENTCOUNT_EN_skill_use);//每次成功使用后都计数
	}
	void ConsumeStamina( skillID)
	{
		var _requirement = StaminaDemand( GetSkillLevel( skillID));
		_requirement *= (-1)
		parent.find("Logic").AddStamina_Tennis( _requirement);
	}
	void ConsumeEnergy( skillID, aggrEnergy, deffEnergy)
	{
		var _skillType = GetSkillType(skillID);
		var _useEnergy = 0;
		if( _skillType == 0)//查找出错
		{	VNETLOG(1089,"SkillUse ERR! 技能类型无法查找.\n");}
		
		if( _skillType == 1)
		{
			_useEnergy = (-1) * aggrEnergy;
		}
		else if( _skillType == 2)
		{
			_useEnergy = (-1) * deffEnergy;
		}
		else
		{
			alert("ConsumeEnergy ERR! SkillType = " + parent.find("Logic").GetSkillType());
		}
		printf("6# ConsumeEnergy 技能类型: " + _skillType + ", 能量消耗" + _useEnergy);
		return _useEnergy;
	}
	// SkillUse end

	//----------------------------------------私有函数----------------------------------------
	
	//--------------------基础数据处理--------------------
	//获得技能类型
	//返回:1 攻击型技能 其他 防御型技能
	void GetSkillType( skillID)
	{
		var skillRow = new VNet2DBRow{}
		skillRow.InitByInt("a001user.mdb","skill", window.A001USER_SKILL_SKILLID, skillID);
		if ( skillRow.IsReady() == 0 )
		{
			skillRow.del();
			printf("=========skillRow打开失败=======================");
			return;
		}

		var skillType = skillRow.GetData(window.A001USER_SKILL_SKILLTYPE);
		skillRow.del();
		if( skillType == 4/*发球*/)
			{return 1;}
		else
			{return parent.find("Logic").GetSkillType();}
	}

	//获得技能等级
	//返回:等级
	void GetSkillLevel( skillID)
	{
		var _temp = toint(skillID) % 100;
		printf("6# GetSkillLevel 技能等级: " + _temp);
		return _temp;
	}
	
	//技能所需体力
	//返回:消耗量
	void StaminaDemand( skillLv)
	{
		var _temp = 0;
		switch (skillLv)
		{
			case 1:_temp = 20;break;
			case 2:_temp = 18;break;
			case 3:_temp = 16;break;
			case 4:_temp = 14;break;
		}
		printf("6# StaminaDemand 技能等级: " + skillLv + ", 所需体力: " + _temp);
		return _temp;
	}

	//--------------------条件参数判断--------------------
	//体力是否足够
	//返回:-1 出错 0 不足 1 充足
	void CheckStamina( skillID, aggrEnergy, deffEnergy)
	{
		var _curStamina = parent.find("Logic").GetStamina();
		var _requirement = StaminaDemand( GetSkillLevel( skillID));
		printf("6# CheckStamina 当前体力: " + _curStamina + ", 体力需求: " + _requirement);
		VNETLOG(1089,"CheckStamina 当前体力: " + _curStamina + ", 体力需求: " + _requirement "\n");
		if ( _requirement == 0)
		{
			VNETLOG(1089,"CheckStamina ERR! 未得到需要的体力消耗量");
			return -1;
		}
		if ( _requirement > _curStamina){return 0;}
		if ( _requirement <= _curStamina){return 1;}
	}

	//能量是否足够
	//返回:0 不足 1 充足
	void CheckEnergy( skillID, aggrEnergy, deffEnergy)
	{
		var _type = GetSkillType( skillID);
		var _curEnerge = parent.find("Logic").GetEnergy();
		var _requirement = 0;
		if( _type == 1)//攻击性技能
		{
			_requirement = aggrEnergy;
			reason = 1;
		}
		if( _type == 2)//防御性技能
		{
			_requirement = deffEnergy;
			reason = 2;
		}
		printf("CheckEnergy 当前能量: " + _curenerge + ", 能量需求: " + _requirement);
		VNETLOG(1089,"CheckEnergy 当前能量: " + _curenerge + ", 能量需求: " + _requirement + "\n");
		if( _curEnerge < _requirement)
			{return 0;}
		else
			{return 1;}
	}

	//是否能使用能量球(玩家是否开启了能量球开关)
	//返回:0 不能 1 能
	void EnergyBallPermit()
	{
		if (window.LMH_IsUsePower())
			{return 1;}
		else
			{return 0;}
	}

	//--------------------结果处理函数--------------------
	//使用物品(物品ID,数量)
	void UseItem( entryID, num)
	{
		printf("6# UseItem 消耗物品[" + entryID + "][" + num + "]个");
		VNETLOG(1089,"UseItem 消耗物品[" + entryID + "][" + num + "]个.\n");
//		parent.find("self").UseGoods( entryID, num);
		var _Param = ""+entryID+","+num;
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_SHOP,"UseGoods",_Param);
		window.LMH_SetItemNum( entryID);

		// add by hanshuo 添加物品使用的计数
		parent.find("Logic").AddItemCount( entryID, num);
	}

	void Mission_Event()
	{
		//任务第一次使用能量球
		var _Param = ""+window.GetMyUID()+","+window.CLIENT_12_ENERGY_BALL+","+window.CLIENT_12_ENERGY_BALL_STR+",1";
		window.Tos_AddEvent(_Param);
	}
};
