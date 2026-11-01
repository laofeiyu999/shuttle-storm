//引导事件脚本 2009-6-1
//环境：韩小白
//工具：流氓福
//内容：老虎
/*
所有散布在界面脚本中，与引导事件相关的语句都使用
"//引导事件"
格式开头，修改时可以用该格式快速搜索。
*/

import("$./../../../mdb/dbdef.gml");

/*--------韩硕给的计数功能--------
添加事件计数
tennisEvent.AddEventCount(0);
事件计数清0
tennisEvent.ResetEventCount(0);
事件计数全部清0
tennisEvent.ResetAllEventCount();
获得事件的计数
tennisEvent.GetEventCount(0);
组管理的函数
SetGroupState(0,1);//[输入值]1组ID 2开启状态  默认全部关闭
--------------------------------*/

class LMH_EventCounter EventCounter
{
//----------------------流程控制用变量------------------------
	//这些变量需要初始化
	var m_flow_mark = 0;
	var FLOW_RACKET = 1;
	var FLOW_SKILL = 2;
	var FLOW_ATTRIBUTE = 3;
	var FLOW_ARENA = 4;
	
	var m_flow_racket_1 = 0;
	var m_flow_racket_2 = 0;

	var m_flow_skill_1 = 0;
	var m_flow_skill_2 = 0;

	var m_flow_attribute_1 = 0;
	var m_flow_attribute_2 = 0;

	var m_flow_arena_1 = 0;
	var m_flow_arena_2 = 0;

	var Guide_Missionbegin = 0;
	var Guide_Trainbegin = 0;
	var Guide_Missionsec = 0;
	var Guide_Shopbegin = 0;
	var Guide_Pckracketon = 0;
//	var	Guide_Mailgiftget = 0;
//	var Guide_Mailbegin = 0;
//	var Guide_Packgift = 0;
	var Guide_Shoprocketbegin = 0;
	var Guide_Packskillon = 0;
	var Guide_Guideend = 0;

//------------------------初始化变量--------------------------
	void Init_EventCount()
	{
		m_flow_racket_1 = GetEventCount(window.EVENTCOUNT_FIN_enter_postbox_racket);
		m_flow_racket_2 = GetEventCount(window.EVENTCOUNT_FIN_accept_racket);

		m_flow_skill_1 = GetEventCount(window.EVENTCOUNT_FIN_enter_hall_skill);
		m_flow_skill_2 = GetEventCount(window.EVENTCOUNT_FIN_enter_postbox_skill);

		m_flow_attribute_1 = GetEventCount(window.EVENTCOUNT_FIN_enter_hall_attribute);
		m_flow_attribute_2 = GetEventCount(window.EVENTCOUNT_FIN_enter_postbox_attribute);

		m_flow_arena_1 = GetEventCount(window.EVENTCOUNT_FIN_enter_hall_arena);
		m_flow_arena_2 = GetEventCount(window.EVENTCOUNT_FIN_enter_arena);

		Guide_Missionbegin = window.find("eventCounter").GetEventCount(window.EVENTCOUNT_FIN_accept_mission);//未接任务
		Guide_Trainbegin = window.find("eventCounter").GetEventCount(window.EVENTCOUNT_FIN_enter_trainhall);//未完成训练
		Guide_Missionsec = window.find("eventCounter").GetEventCount(window.EVENTCOUNT_FIN_submit_mission);//未成功交任务
		Guide_Shopbegin = window.find("eventCounter").GetEventCount(window.EVENTCOUNT_FIN_buy_racket);//未成功购买球拍
		Guide_Shoprocketbegin = window.find("eventCounter").GetEventCount(window.EVENTCOUNT_FIN_buy_skill);//未成功购买技能
		Guide_Pckracketon = window.find("eventCounter").GetEventCount(window.EVENTCOUNT_FIN_equip_racket);//未装备成功球拍


//		Guide_Mailgiftget = window.find("eventCounter").GetEventCount(window.EVENTCOUNT_FIN_mail_getgift);//未接受礼包
//		Guide_Mailbegin = window.find("eventCounter").GetEventCount(window.EVENTCOUNT_FIN_mail_getgift);
//		Guide_Packgift = window.find("eventCounter").GetEventCount(window.EVENTCOUNT_FIN_pack_gitfopen);//未打开礼包
		Guide_Packskillon = window.find("eventCounter").GetEventCount(window.EVENTCOUNT_FIN_bind_skill);//未成功装备技能
		Guide_Guideend = window.find("eventCounter").GetEventCount(window.EVENTCOUNT_FIN_guidetrainover);//未完成强制引导
		printf("C# ====引导==================Init_EventCount()Guide_Missionbegin:" +Guide_Missionbegin);
		printf("C# ====引导==================Init_EventCount()Guide_Trainbegin:" +Guide_Trainbegin);
		printf("C# ====引导==================Init_EventCount()Guide_Missionsec:" +Guide_Missionsec);

		printf("C# ====引导==================Init_EventCount()Guide_Shopbegin:" +Guide_Shopbegin);
		printf("C# ====引导==================Init_EventCount()Guide_Shoprocketbegin:" +Guide_Shoprocketbegin);
		printf("C# ====引导==================Init_EventCount()Guide_Packskillon:" +Guide_Packskillon);
		printf("C# ====引导==================Init_EventCount()Guide_Pckracketon:" +Guide_Pckracketon);
		printf("C# ====引导==================Init_EventCount()Guide_Guideend:" +Guide_Guideend);
	}
//--------------------判断是否需要监视数据库的函数----------------------
	void Guide_CheckSPItem(_pos)
	{
//		var _temp;
//		switch (_pos)
//		{
//			case 1: _temp = Guide_CheckGiftRacket();break;
//			case 2: _temp = Guide_CheckPackRacket();break;
//			case 3: _temp = Guide_CheckGiftSkill();break;
//			case 4: _temp = Guide_CheckPackSkill();break;
//			case 5: _temp = Guide_CheckGiftAtt();break;
//			case 6: _temp = Guide_CheckPackAtt();break;
//		}
//		return _temp;
		return 1;
	}
	void Guide_CheckGiftRacket()
	{
		if (GetEventCount(window.EVENTCOUNT_EN_receive_racket) == 0){return 1;}
		else{return 0;};
	}
	void Guide_CheckPackRacket()
	{
		if (GetEventCount(window.EVENTCOUNT_EN_accept_racket) == 0){return 1;}
		else{return 0;};
	}
	void Guide_CheckGiftSkill()
	{
		if (GetEventCount(window.EVENTCOUNT_EN_receive_skill) == 0){return 1;}
		else{return 0;};
	}
	void Guide_CheckPackSkill()
	{
		if (GetEventCount(window.EVENTCOUNT_EN_accept_skill) == 0){return 1;}
		else{return 0;};
	}
	void Guide_CheckGiftAtt()
	{
		if (GetEventCount(window.EVENTCOUNT_EN_receive_attribute) == 0){return 1;}
		else{return 0;};
	}
	void Guide_CheckPackAtt()
	{
		if (GetEventCount(window.EVENTCOUNT_EN_accept_attribute) == 0){return 1;}
		else{return 0;};
	}

//--------------------每次进入大厅的事件触发检查函数----------------------
	void Guide_EnterHall(_flow)//参数:1普通训练->大厅 2已做过强训->大厅 3房间->大厅 4游戏->大厅 5强制训练->大厅
	{
//		printf("C# 数据检查: EN_receive_racket " + GetEventCount(window.EVENTCOUNT_EN_receive_racket));
//		printf("C# 数据检查: EN_accept_racket " + GetEventCount(window.EVENTCOUNT_EN_accept_racket));
//		printf("C# 数据检查: EN_receive_skill " + GetEventCount(window.EVENTCOUNT_EN_receive_skill));
//		printf("C# 数据检查: EN_accept_skill " + GetEventCount(window.EVENTCOUNT_EN_accept_skill));
//		printf("C# 数据检查: EN_receive_attribute " + GetEventCount(window.EVENTCOUNT_EN_receive_attribute));
//		printf("C# 数据检查: EN_accept_attribute " + GetEventCount(window.EVENTCOUNT_EN_accept_attribute));
//		printf("C# 数据检查: GetLVByUID() " + window.GetLVByUID());
//		printf("C# 数据检查: FIN_equip_racket " + GetEventCount(window.EVENTCOUNT_FIN_equip_racket));
//		printf("C# 数据检查: FIN_bind_skill " + GetEventCount(window.EVENTCOUNT_FIN_bind_skill));
//		printf("C# 数据检查: FIN_operate_attribute " + GetEventCount(window.EVENTCOUNT_FIN_operate_attribute));
//		printf("C# 数据检查: FIN_success_queue " + GetEventCount(window.EVENTCOUNT_FIN_success_queue));
		if (GetEventCount(window.EVENTCOUNT_EN_accept_mission) == 0 && GetEventCount(window.EVENTCOUNT_FIN_enter_hall_mission) == 0)
		{
			printf("C# =====引导===== 大厅多重路径:任务");
			AddEventCount(window.EVENTCOUNT_UI_enter_hall_mission);
			return;
		}
		
		if (GetEventCount(window.EVENTCOUNT_EN_receive_racket) > 0 || GetEventCount(window.EVENTCOUNT_EN_accept_racket) > 0)
		{
			if (GetEventCount(window.EVENTCOUNT_FIN_equip_racket) == 0)
			{
				printf("C# =====引导===== 大厅多重路径:球拍");
				m_flow_mark = FLOW_RACKET;
				AddEventCount(window.EVENTCOUNT_UI_enter_hall_racket);
				return;
			}
		}
		if (GetEventCount(window.EVENTCOUNT_EN_receive_skill) > 0 || GetEventCount(window.EVENTCOUNT_EN_accept_skill) > 0)
		{
			if (GetEventCount(window.EVENTCOUNT_FIN_bind_skill) == 0)
			{
//				printf("C# 数据检查: GetEquipRacketID " + window.GetEquipRacketID());
//				if (window.GetLVByUID() >= 6 && window.GetEquipRacketID() != -1)
				if (window.GetLVByUID() >= 6)
				{
					printf("C# =====引导===== 大厅多重路径:技能");
					
					//为了弥补玩家等级不足买入技能，等级足够时又无法触发引导的修补
					if (window.HasPackSkill_Topspin() > 0){AddEventCount(window.EVENTCOUNT_FIN_accept_skill);}
					
					m_flow_mark = FLOW_SKILL;
					AddEventCount(window.EVENTCOUNT_UI_enter_hall_skill);
					return;
				}
			}
		}
		if (GetEventCount(window.EVENTCOUNT_EN_receive_attribute) > 0 || GetEventCount(window.EVENTCOUNT_EN_accept_attribute) > 0)
		{
			if (GetEventCount(window.EVENTCOUNT_FIN_operate_attribute) == 0)
			{
				printf("C# =====引导===== 大厅多重路径:属性卡");
				m_flow_mark = FLOW_ATTRIBUTE;
				AddEventCount(window.EVENTCOUNT_UI_enter_hall_attribute);
				return;
			}
		}
		if (window.GetLVByUID() == 11 && GetEventCount(window.EVENTCOUNT_FIN_success_queue) == 0 && window.GetUIPos() != window.POS_ARENA)
		{
			printf("C# =====引导===== 大厅多重路径:活动场");
			m_flow_mark = FLOW_ARENA;
			AddEventCount(window.EVENTCOUNT_UI_enter_hall_arena);
			return;
		}
	}
	void Guide_EnterPacket()//进入背包界面，根据预想的顺序引导操作
	{
//		printf("C# 数据检查: EN_accept_racket " + GetEventCount(window.EVENTCOUNT_EN_accept_racket));
//		printf("C# 数据检查: EN_accept_skill " + GetEventCount(window.EVENTCOUNT_EN_accept_skill));
//		printf("C# 数据检查: EN_accept_attribute " + GetEventCount(window.EVENTCOUNT_EN_accept_attribute));
//		printf("C# 数据检查: FIN_equip_racket " + GetEventCount(window.EVENTCOUNT_FIN_equip_racket));
//		printf("C# 数据检查: FIN_bind_skill " + GetEventCount(window.EVENTCOUNT_FIN_bind_skill));
//		printf("C# 数据检查: FIN_operate_attribute " + GetEventCount(window.EVENTCOUNT_FIN_operate_attribute));
//		printf("C# 数据检查: m_flow_mark " + m_flow_mark);
		if (GetEventCount(window.EVENTCOUNT_EN_accept_racket) > 0 && GetEventCount(window.EVENTCOUNT_FIN_equip_racket) == 0)
		{
			if (m_flow_mark == FLOW_RACKET)
			{
				printf("C# =====引导===== 背包多重路径:球拍");
				AddEventCount(window.EVENTCOUNT_UI_enter_pack_racket);
				return;
			}
		}
		if (GetEventCount(window.EVENTCOUNT_EN_accept_skill) > 0 && GetEventCount(window.EVENTCOUNT_FIN_bind_skill) == 0)
		{
			if (m_flow_mark == FLOW_SKILL)
			{
				printf("C# =====引导===== 背包多重路径:技能");
				AddEventCount(window.EVENTCOUNT_UI_enter_pack_skill);
				return;
			}
		}
		if (GetEventCount(window.EVENTCOUNT_EN_accept_attribute) > 0 && GetEventCount(window.EVENTCOUNT_FIN_operate_attribute) == 0)
		{
			if (m_flow_mark == FLOW_ATTRIBUTE)
			{
				printf("C# =====引导===== 背包多重路径:属性卡");
				AddEventCount(window.EVENTCOUNT_UI_enter_pack_attribute);
				return;
			}
		}
	}
	void Guide_ReturnHall()//从背包返回主界面 如果想在完成操作后继续做一些事情就在这里触发
	{
		if (GetEventCount(window.EVENTCOUNT_FIN_equip_racket) == 1 && GetEventCount(window.EVENTCOUNT_FIN_return_hall_racket) == 0)
		{
			window.LMH_AddEvent(window.EVENTCOUNT_UI_return_hall_racket);
			return;
		}
		if (GetEventCount(window.EVENTCOUNT_FIN_bind_skill) == 1 && GetEventCount(window.EVENTCOUNT_FIN_return_hall_skill) == 0)
		{
			window.LMH_AddEvent(window.EVENTCOUNT_UI_return_hall_skill);
			return;
		}
		if (GetEventCount(window.EVENTCOUNT_FIN_operate_attribute) == 1 && GetEventCount(window.EVENTCOUNT_FIN_return_hall_attribute) == 0)
		{
			window.LMH_AddEvent(window.EVENTCOUNT_UI_return_hall_attribute);
			return;
		}
	}

//--------------------恶心的丢弃产生的问题----------------------
	
	void Guide_Abanden_Racket_Gift()
	{
		if (GetEventCount(window.EVENTCOUNT_FIN_equip_racket) == 0)
		{
			printf("C#  引导  变态丢弃球拍 邮箱部分");
//			alert("C#  引导  变态丢弃球拍 邮箱部分");
			ResetEventCount(window.EVENTCOUNT_EN_receive_racket);
			ResetEventCount(window.EVENTCOUNT_FIN_enter_hall_racket);
			ResetEventCount(window.EVENTCOUNT_FIN_enter_postbox_racket);
			ResetEventCount(window.EVENTCOUNT_EN_accept_racket);
			ResetEventCount(window.EVENTCOUNT_FIN_accept_racket);
	//		m_flow_racket_1 = GetEventCount(window.EVENTCOUNT_FIN_enter_postbox_racket);
			m_flow_racket_1 = 1;
		}
	}
	void Guide_Abanden_Skill_Gift()
	{
		if (GetEventCount(window.EVENTCOUNT_FIN_bind_skill) == 0)
		{
			printf("C#  引导  变态丢弃技能 邮箱部分");
			ResetEventCount(window.EVENTCOUNT_EN_receive_skill);
			ResetEventCount(window.EVENTCOUNT_FIN_enter_hall_skill);
			ResetEventCount(window.EVENTCOUNT_FIN_enter_postbox_skill);
			ResetEventCount(window.EVENTCOUNT_EN_accept_skill);
			ResetEventCount(window.EVENTCOUNT_FIN_accept_skill);
	//		m_flow_skill_1 = GetEventCount(window.EVENTCOUNT_FIN_enter_hall_skill);
			m_flow_skill_1 = 1;
		}
	}
	void Guide_Abanden_Attribute_Gift()
	{
		if (GetEventCount(window.EVENTCOUNT_FIN_operate_attribute) == 0)
		{
			printf("C#  引导  变态丢弃属性卡 邮箱部分");
			ResetEventCount(window.EVENTCOUNT_EN_receive_attribute);
			ResetEventCount(window.EVENTCOUNT_FIN_enter_hall_attribute);
			ResetEventCount(window.EVENTCOUNT_FIN_enter_postbox_attribute);
			ResetEventCount(window.EVENTCOUNT_EN_accept_attribute);
			ResetEventCount(window.EVENTCOUNT_FIN_accept_attribute);
	//		m_flow_attribute_1 = GetEventCount(window.EVENTCOUNT_FIN_enter_hall_attribute);
			m_flow_attribute_1 = 1;
		}
	}
	void Guide_Abanden_Racket_Pack()
	{
		if (GetEventCount(window.EVENTCOUNT_FIN_equip_racket) == 0)
		{
			printf("C#  引导  变态丢弃球拍 背包部分");
			Guide_Abanden_Racket_Gift();
			ResetEventCount(window.EVENTCOUNT_EN_buy_racket);
			ResetEventCount(window.EVENTCOUNT_FIN_enter_pack_racket);
			ResetEventCount(window.EVENTCOUNT_FIN_enter_racket);
			ResetEventCount(window.EVENTCOUNT_EN_equip_racket);
			ResetEventCount(window.EVENTCOUNT_FIN_equip_racket);
	//		m_flow_racket_2 = GetEventCount(window.EVENTCOUNT_FIN_accept_racket);
			m_flow_racket_2 = 1;
		}
	}
	void Guide_Abanden_Skill_Pack()
	{
		if (GetEventCount(window.EVENTCOUNT_FIN_bind_skill) == 0)
		{
			printf("C#  引导  变态丢弃技能 背包部分");
			Guide_Abanden_Skill_Gift();
			ResetEventCount(window.EVENTCOUNT_EN_buy_skill);
			ResetEventCount(window.EVENTCOUNT_FIN_enter_pack_skill);
			ResetEventCount(window.EVENTCOUNT_FIN_enter_skill);
			ResetEventCount(window.EVENTCOUNT_EN_bind_skill);
			ResetEventCount(window.EVENTCOUNT_FIN_bind_skill);
	//		m_flow_skill_2 = GetEventCount(window.EVENTCOUNT_FIN_enter_postbox_skill);
			m_flow_skill_2 = 1;
		}
	}
	void Guide_Abanden_Attribute_Pack()
	{
		if (GetEventCount(window.EVENTCOUNT_FIN_operate_attribute) == 0)
		{
			printf("C#  引导  变态丢弃属性卡 背包部分");
			Guide_Abanden_Attribute_Gift();
			ResetEventCount(window.EVENTCOUNT_EN_buy_attribute);
			ResetEventCount(window.EVENTCOUNT_FIN_enter_pack_attribute);
			ResetEventCount(window.EVENTCOUNT_FIN_enter_attribute);
			ResetEventCount(window.EVENTCOUNT_EN_operate_attribute);
			ResetEventCount(window.EVENTCOUNT_FIN_operate_attribute);
	//		m_flow_attribute_2 = GetEventCount(window.EVENTCOUNT_FIN_enter_postbox_attribute);
			m_flow_attribute_2 = 1;
		}
	}

//---------------第一次进频道选择界面引导---------------------
	void Guide_ChannelChoose()//自我介绍
	{
		//直到做完强制训练得到奖励才视为完成
		if (window.find("eventCounter").GetEventCount(window.EVENTCOUNT_UI_enter_channelchoose)<= 3)
//		if (GetEventCount(window.EVENTCOUNT_EN_receive_racket) == 0 && GetEventCount(window.EVENTCOUNT_FIN_enter_channelchoose) == 0)
//		if (GetEventCount(window.EVENTCOUNT_UI_enter_channelchoose) == 0 )
		{
			window.OpenHelp(10001);
		}
		else
		{
			//根据玩家级别引导去合适的阶段服务器
		}
	}

//---------------第一次创建角色的界面引导---------------------
	void Guide_CreatRole()//帮助创建角色
	{
		window.OpenHelp(10002);
	}

//---------------强制训练开始前的流程引导---------------------
	void Guide_ForcableTrain()//强制训练前的说明
	{
	}

//---------------第一次接受任务的引导-------------------------
//load("$./EC_FirstGetMission.gml");

//---------------第一次获得礼品的引导-------------------------
//load("$./EC_FirstGetRacket.gml");

//---------------第一次获得技能的引导-------------------------
//load("$./EC_FirstGetSkill.gml");

//---------------第一次获得属性的引导-------------------------
//load("$./EC_FirstGetAttribute.gml");

//---------------第一次获得小喇叭的引导-------------------------
	void Guide_Accept_Loudspeaker()
	{
		printf("C# =====引导=====EVENTCOUNT_FIN_accept_loudspeaker " + GetEventCount(window.EVENTCOUNT_FIN_accept_loudspeaker));
		if (GetEventCount(window.EVENTCOUNT_FIN_accept_loudspeaker) == 0)
		{
			window.OpenHelp(14001);
			AddEventCount(window.EVENTCOUNT_FIN_accept_loudspeaker);
			printf("C# =====引导=====小喇叭使用提示完成 ");
		}
	}

//---------------第一次进入排行榜的引导-----------------------
	void Guide_StarList()
	{
	}

//---------------第一次进入商城界面引导-----------------------
	void Guide_Mall()
	{
		if (GetEventCount(window.EVENTCOUNT_FIN_mall) == 0)
		{
			window.OpenHelp(10501);
			AddEventCount(window.EVENTCOUNT_FIN_mall);
			printf("C# =====引导=====商城界面帮助提示完成 " + GetEventCount(window.EVENTCOUNT_FIN_mall));
		}
	}

//---------------第一次进入好友界面引导-----------------------
	void Guide_Fellow()
	{
		if (GetEventCount(window.EVENTCOUNT_FIN_fellow) == 0)
		{
			window.OpenHelp(10601);
			AddEventCount(window.EVENTCOUNT_FIN_fellow);
			printf("C# =====引导=====社交界面帮助提示完成 " + GetEventCount(window.EVENTCOUNT_FIN_fellow));
		}
	}
	void Guide_Private_Message()
	{
		if (GetEventCount(window.EVENTCOUNT_EN_receive_message) ==1 && GetEventCount(window.EVENTCOUNT_FIN_enter_message) == 0)
		{
			window.OpenHelp(11101);
			AddEventCount(window.EVENTCOUNT_FIN_enter_message);
			printf("C# =====引导=====私聊信息引导完成次数 " + GetEventCount(window.EVENTCOUNT_FIN_enter_message));
		}
	}

//---------------第一次进入玩家列表引导-----------------------


//---------------第一次进入家族界面引导-----------------------


//---------------第一次进训练界面的引导-------------------------
	void Guide_Train_inHall()
	{
		printf("C# =====引导=====训练界面提示完成 " + GetEventCount(window.EVENTCOUNT_FIN_train));
		if (GetEventCount(window.EVENTCOUNT_FIN_train) == 0 && window.GetUIPos() == 20)
		{
			printf("C# =====引导=====背包内换装完成 " + GetEventCount(window.EVENTCOUNT_FIN_change_clothe) + " 技能绑定完成次数 " + GetEventCount(window.EVENTCOUNT_FIN_skill_band) == 1);
			if (GetEventCount(window.EVENTCOUNT_FIN_change_clothe) == 1 && GetEventCount(window.EVENTCOUNT_FIN_skill_band) == 1)
			{
				timer(500,"window.OpenHelp(11000)");
				AddEventCount(window.EVENTCOUNT_FIN_train);
				printf("C# =====引导=====在大厅引导去训练模式");
			}
		}
	}
	void Guide_Train()
	{
		if (GetEventCount(window.EVENTCOUNT_FIN_train) <= 1)
		{
			window.OpenHelp(11001);
			AddEventCount(window.EVENTCOUNT_FIN_train);
			printf("C# =====引导=====训练界面帮助提示完成 " + GetEventCount(window.EVENTCOUNT_FIN_train));
		}
	}

//---------------第一次进活动场界面引导-----------------------
load("$./EC_GuideJoinArena.gml");

//----------------------狂欢节遭淘汰--------------------------
	void Guide_Arena_Out()
	{
//		window.OpenHelp(30501);
	}

//---------------------普通比赛的引导-------------------------
load("$./EC_NormalMatchWin.gml");

//---------------升到3级日常任务的引导------------------------
	void Guide_Level6_UsualMission()
	{
		if (window.GetLVByUID() == 6)
		{
			window.OpenHelp(15001);
		}
	}

//---------------称号不符去晋级训练的引导---------------------
	void Guide_Promotion_Train()
	{	
		if (GetEventCount(window.EVENTCOUNT_FIN_click_zigesai) < 3 && window.GetLVByUID() < 6)
		{
			window.OpenHelp(15002);
			AddEventCount(window.EVENTCOUNT_FIN_click_zigesai);
		}
	}
//-----------------结算翻牌的奖品帮助提示---------------------
	void Guide_Turn_Card( EntryID)
	{
		var t_entryID = toint(EntryID);
		var t_helpID = 0;
		var t_goodsName = "";

		if ( t_entryID == 10000){t_helpID = 17001;}//金币奖励
		if ( t_entryID == 10001){t_helpID = 17002;}//奖券奖励
		if ( t_entryID > 10001)
		{
			t_goodsName = window.GetNameByEnterID( EntryID);
			t_helpID = 17003;
		}
//		window.OpenHelp(t_helpID);

		window.find("HELPLAYER").delallchild();
		window.find("UIController").LoadUI("UI_HELP");
		window.find("HELPLAYER").find("HELP_LOGIC").SetParam( t_goodsName);	//设置参数
		window.find("HELPLAYER").find("HELP_LOGIC").ReadDB( t_helpID);		//开始读数据库
		printf("E# 单场结算翻牌提示: EntryID: "+EntryID+"  t_goodsName: "+t_goodsName+"  t_helpID: "+t_helpID);
	}
};

