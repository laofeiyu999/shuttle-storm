//
//引导
//2009年9月24日

set window
{
	//引导事件
	//eventID：事件ID
	void LMH_AddEvent(eventID)
	{
		window.eventCounter.AddEventCount(eventID);
	}

	//[输入值]1邮箱-球拍 2背包-球拍 3邮箱-技能 4背包-技能 5邮箱-属性卡 6背包-属性卡
	//[返回值]0不监视 1监视
	void LMF_Call_LMH(_pos)
	{
		return window.find("eventCounter").Guide_CheckSPItem(_pos);
	}

	//[功能]接收到一个礼品
	void LMH1_GetPresent(){}
	//[功能]点击了礼品接收按钮
	void LMH1_BtnReceive(){}


	//---------------比赛中按键操作的引导---------------
	//[大JJ引导]
	//[功能]大按键操作
	//[参数]_isShow:true/false
	//		_num:1/2
	void LMH_BigKeyOprt(_isShow,_num)
	{
		window.find("VTipBigKey_Name").SetData(_isShow,_num);
	}
	//[功能]是否装备了技能
	//[返回值]true/false
	void HasSkillInGame()
	{
		return window.find("GAME_LOGIC")._ESkill.HasSkill();
	}

	//---------------接收礼品的函数---------------
	void LMH_UserAcceptSomething(entryID)
	{
		var t_classID = window.GetClassByEnterId(entryID);
		t_classID = toint(t_classID);
		if (t_classID == 105)
		{
			printf("C# =====引导=====从邮箱接收球拍");
			window.LMH_AddEvent(window.EVENTCOUNT_EN_accept_racket);
		}
		if (t_classID <= 404 && t_classID >= 400)
		{
			printf("C# =====引导=====从邮箱接收技能");
			window.LMH_AddEvent(window.EVENTCOUNT_EN_accept_skill);
		}
		if (t_classID >= 600 && t_classID <= 606)
		{
			printf("C# =====引导=====从邮箱接收属性卡");
			window.LMH_AddEvent(window.EVENTCOUNT_EN_accept_attribute);
		}
		if (entryID >= 50001 && entryID <= 50004)//写死了，有风险
		{
			printf("C# =====引导=====从邮箱接收小喇叭");
//			window.LMH_AddEvent(window.EVENTCOUNT_EN_accept_loudspeaker);
			window.find("eventCounter").Guide_Accept_Loudspeaker();
		}
	}

	//---------------购买物品的函数---------------
	//为了能够让玩家单独购买和一起购买时，都触发引导，进行特殊处理
	var m_startTm_guide = 1000;//批量处理的等待时间
	var m_countTm_guide = 0;//开始计时的标志位
	var m_itemID_guide = 0;//买入关键物品的ID
	void LMH_UserBuySomething(entryID)
	{
		printf("C# =====引导=====m_countTm_guide: " + m_countTm_guide);
		if ( m_countTm_guide == 0)
		{
			m_countTm_guide = 1;
			timer(m_startTm_guide,"UserBuy_Guide");
		}

		var t_classID = window.GetClassByEnterId(entryID);
		t_classID = toint(t_classID);
		if (t_classID == 105)
		{
			window.LMH_DelDBMonitor_GiftBoxRacket();
			printf("C# =====引导=====从商城买入球拍");

			//玩家进邮箱触发引导，关闭，去商城买入，再进背包触发2次引导的补救
			window.find("eventCounter").ResetEventCount(window.EVENTCOUNT_FIN_enter_postbox_racket);

			AddEventCount(window.EVENTCOUNT_FIN_accept_racket);

			window.LMH_AddEvent(window.EVENTCOUNT_EN_accept_racket);
//			window.find("eventCounter").Guide_Buy_Racket();
			m_itemID_guide = 1;
		}
		if (t_classID <= 404 && t_classID >= 400)
		{
			window.LMH_DelDBMonitor_GiftBoxSkill();
			printf("C# =====引导=====从商城买入技能");

			//玩家进邮箱触发引导，关闭，去商城买入，再进背包触发2次引导的补救
			window.find("eventCounter").ResetEventCount(window.EVENTCOUNT_FIN_enter_postbox_skill);

			AddEventCount(window.EVENTCOUNT_FIN_accept_skill);

			window.LMH_AddEvent(window.EVENTCOUNT_EN_accept_skill);
//			window.find("eventCounter").Guide_Buy_Skill();
			m_itemID_guide = 2;
		}
		if (t_classID >= 600 && t_classID <= 606)
		{
			window.LMH_DelDBMonitor_GiftBoxAtt();
			printf("C# =====引导=====从商城买入属性");

			//玩家进邮箱触发引导，关闭，去商城买入，再进背包触发2次引导的补救
			window.find("eventCounter").ResetEventCount(window.EVENTCOUNT_FIN_enter_postbox_attribute);

			AddEventCount(window.EVENTCOUNT_FIN_accept_attribute);
			
			window.LMH_AddEvent(window.EVENTCOUNT_EN_accept_attribute);
//			window.find("eventCounter").Guide_Buy_Attribute();
			m_itemID_guide = 3;
		}
		if (entryID >= 50001 && entryID <= 50004)//写死了，有风险
		{
			printf("C# =====引导=====从商城买入小喇叭");
//			window.LMH_AddEvent(window.EVENTCOUNT_EN_accept_loudspeaker);
//			window.find("eventCounter").Guide_Accept_Loudspeaker();
			m_itemID_guide = 4;
		}
	}
	void UserBuy_Guide()
	{
		timer(5000,"Reset_Waiting_time");//如果之前等1秒钟仍不能使所有信息全部到位，只好在此延迟清零，避免多次弹出强制引导
//		m_countTm_guide = 0;
		printf("C# =====引导=====m_countTm_guide: " + m_countTm_guide + " m_itemID_guide " + m_itemID_guide);
		switch (m_itemID_guide)
		{
			case 1:
			{
				//window.find("MALL_BUY_LOGIC").del();
				window.find("eventCounter").Guide_Buy_Racket();
				window.find("eventCounter").m_flow_mark = 1;
				break;
			}
			case 2:
			{
				//window.find("MALL_BUY_LOGIC").del();
				window.find("eventCounter").Guide_Buy_Skill();
				window.find("eventCounter").m_flow_mark = 2;
				break;
			}
			case 3:
			{
				//window.find("MALL_BUY_LOGIC").del();
				window.find("eventCounter").Guide_Buy_Attribute();
				window.find("eventCounter").m_flow_mark = 3;
				break;
			}
			case 4:window.find("eventCounter").Guide_Accept_Loudspeaker();break;
		}
		m_itemID_guide = 0;
//		var temp = window.find("eventCounter").m_flow_mark;
//		printf("C# =====引导=====m_flow_mark: " + temp);
	}
	void Reset_Waiting_time()
	{
		m_countTm_guide = 0;
		printf("C# =====引导=====m_countTm_guide: " + m_countTm_guide);
	}

	//---------------丢弃物品的函数---------------
	void LMH_UserLostSomething(type,entryID)
	{
		if (entryID.__Long__ <= 0)
		{
			return;
		}

		var t_classID = window.GetClassByEnterId(entryID);
		t_classID = toint(t_classID);
		if (type == 3)//背包内丢弃
		{
			if (t_classID == 105)
			{
				window.find("eventCounter").Guide_Abanden_Racket_Pack();
			}
			if (t_classID <= 404 && t_classID >= 400)
			{
				window.find("eventCounter").Guide_Abanden_Skill_Pack();
			}
			if (t_classID >= 600 && t_classID <= 606)
			{
				window.find("eventCounter").Guide_Abanden_Attribute_Pack();
			}
		}
		else
		{
			if (t_classID == 105)
			{
				window.find("eventCounter").Guide_Abanden_Racket_Gift();
			}
			if (t_classID <= 404 && t_classID >= 400)
			{
				window.find("eventCounter").Guide_Abanden_Skill_Gift();
			}
			if (t_classID >= 600 && t_classID <= 606)
			{
				window.find("eventCounter").Guide_Abanden_Attribute_Gift();
			}
		}
	}

	//---------------到大厅之前的界面---------------
	//[功能]频道选择界面创建完成
	void LMH1_ChannelCreated()
	{
		window.LMH_AddEvent(window.EVENTCOUNT_UI_enter_channelchoose);//进入频道选择界面
		printf("C# =====引导=====进入频道选择界面次数 " + window.eventCounter.GetEventCount(window.EVENTCOUNT_UI_enter_channelchoose));
	}
	//[功能]创建角色界面显示角色模型
	void LMH1_CreateRoleShowModel()
	{
		window.LMH_AddEvent(window.EVENTCOUNT_UI_enter_creatrole);//进入创建角色界面
		printf("C# =====引导=====进入创建角色界面次数 " + window.eventCounter.GetEventCount(window.EVENTCOUNT_UI_enter_creatrole));
	}
	//[功能]创建角色界面点击了Avatar部件
	void LMH1_ClickCreateRole()
	{
	}
	//任何地方到大厅均调此函数
	//参数:1普通训练->大厅 2已做过强训->大厅 3房间->大厅 4游戏->大厅 5强制训练->大厅
	void LMH_AnyWhereToHall(param)
	{
		window.find("eventCounter").Guide_EnterHall(param);
	}

	//---------------大厅界面---------------
	//[功能]进入大厅-自己的数据有了
	void LMH1_InitMyData()
	{
		window.LMH_IsNeedMonitor_GiftBoxRacket();
		window.LMH_IsNeedMonitor_PackPacket();
		window.LMH_IsNeedMonitor_GiftBoxSkill();
		window.LMH_IsNeedMonitor_PackSkill();
		window.LMH_IsNeedMonitor_GiftBoxAtt();
		window.LMH_IsNeedMonitor_PackAtt();
	}

	//---------------邮箱界面---------------
	//[功能]大厅下面按钮-邮件
	void LMH1_Hall_Bottom_Mail()
	{
		printf("C# =====引导=====进入邮箱");
		window.LMH_AddEvent(window.EVENTCOUNT_UI_enter_postbox_racket);
		window.LMH_AddEvent(window.EVENTCOUNT_UI_enter_postbox_skill);
		window.LMH_AddEvent(window.EVENTCOUNT_UI_enter_postbox_attribute);
	}

	//---------------背包界面---------------
	//[功能]背包界面创建的时候
	void LMH1_PackCreated()
	{
		printf("C# =====引导=====进入背包");
		window.find("eventCounter").Guide_EnterPacket();
	}
	//[功能]背包-球拍
	void LMH1_Pack_Racket()
	{
		printf("C# =====引导=====进入背包-球拍");
		window.LMH_AddEvent(window.EVENTCOUNT_UI_enter_racket);
	}
	//[功能]背包-技能
	void LMH1_Pack_Skill()
	{
		printf("C# =====引导=====进入背包-技能");
		window.LMH_AddEvent(window.EVENTCOUNT_UI_enter_skill);
	}
	//[功能]背包-属性
	void LMH1_Pack_Attribute()
	{
		printf("C# =====引导=====进入背包-属性");
		window.LMH_AddEvent(window.EVENTCOUNT_UI_enter_attribute);
	}
	//[功能]背包界面删除的时候
	void LMH1_PackDel()
	{
		printf("C# =====引导=====从背包返回大厅");
		window.find("eventCounter").Guide_ReturnHall();
	}
	//[功能]点击了背包-服饰标签
	void LMH1_OnCheck_R_Dress(){}
	//[功能]点击了背包-服饰-全部标签
	void LMH1_OnCheck_R_Pack_Dress_All(){}
	//[功能]点击了背包-服饰-服装标签
	void LMH1_OnCheck_R_Pack_Dress_Clothing()
	{
		//如果你来回切换二级按钮，点回来还能出箭头				
	}
	//[功能]点击了背包-服饰-美容标签
	void LMH1_OnCheck_R_Pack_Dress_Hairdressing(){}
	//[功能]点击了背包-服饰-饰品标签
	void LMH1_OnCheck_R_Pack_Dress_Jewelry(){}
	//[功能]点击了背包-服饰-服装-球拍标签
	void LMH1_OnCheck_R_Pack_Dress_Clothing_Racket(){}
	//[功能]点击了背包-技能标签
	void LMH1_OnCheck_R_Skill(){}
	//[功能]点击了背包-道具标签
	void LMH1_OnCheck_R_Props(){}
	//[功能]点击了背包-礼品盒标签
	void LMH1_OnCheck_R_GiftBox(){}
	//[功能]点击了背包-录像标签
	void LMH1_OnCheck_R_Video(){}

	//---------------商城界面---------------
	//[功能]商城界面创建完成
	void LMH1_MallCreated()
	{
		window.LMH_AddEvent(window.EVENTCOUNT_UI_click_mall);//点击“商城”按钮
		printf("B# =====引导测试===== 点击“商城”按钮次数 " +  window.eventCounter.GetEventCount(window.EVENTCOUNT_UI_click_mall));
	}
	//[功能]点击了商城-技能标签
	void LMH1_OnCheck_R_Mall_Skill(){}
	//[功能]点击了商城-道具标签
	void LMH1_OnCheck_R_Mall_Props(){}
	//[功能]点击了商城-服饰-美容标签
	void LMH1_OnCheck_R_Mall_Hairdressing(){}
	//[功能]点击了商城-服饰-饰品标签
	void LMH1_OnCheck_R_Mall_Jewelry(){}
	//[功能]点击了商城-技能-削球标签
	void LMH1_OnCheck_R_Mall_Chip(){}
	//[功能]点击了商城-技能-削球标签
	void LMH1_OnCheck_R_Mall_Shot(){}
	//[功能]点击了商城-技能-放高球标签
	void LMH1_OnCheck_R_Mall_HighBall(){}
	//[功能]点击了商城-技能-发球标签
	void LMH1_OnCheck_R_Mall_Serve(){}
	
	//[功能]商城-技能
	void LMH1_Mall_Skill(){}
	//[功能]商城-属性
	void LMH1_Mall_Attribute(){}
	//[功能]商城-套装
	void LMH1_Mall_Suit(){}
	//[功能]商城-购买
	void LMH1_Mall_Buy(){}
	//[功能]商城-赠送
	void LMH1_Mall_Gift(){}
	//[功能]商城-购物车
	void LMH1_Mall_BuyCar(){}

	//---------------活动界面---------------
	//[功能]点击了活动场按钮
	void LMH1_OnClickArena()
	{
//		printf("C# =====引导=====进入活动场");
//		window.LMH_AddEvent(window.EVENTCOUNT_UI_enter_arena);//点击“活动场”按钮
	}
	//[功能]大厅下面按钮-活动场
	void LMH1_Hall_Bottom_Arena()
	{
		printf("C# =====引导=====进入活动场");
		window.LMH_AddEvent(window.EVENTCOUNT_UI_enter_arena);//点击“活动场”按钮
	}
	//[功能]活动查看
	void LMH1_Arena_LookOver()
	{
		printf("C# =====引导=====点击查看信息");
		window.LMH_AddEvent(window.EVENTCOUNT_UI_enter_info_arena);
	}
	//[功能]活动报名
	void LMH1_Arena_Apply(raceID)
	{
		printf("C# =====引导=====报名成功");
		/*活动报名类型
		var	g_eQUDT_NULL		= 0;	//未知
		var	g_eQUDT_USER		= 1;	//玩家ID
		var	g_eQUDT_TEAM		= 2;	//队伍
		var	g_eQUDT_FAMILY		= 3;	//家族*/
		var raceType = window.GetQueueTypeByID(raceID);
		var userLv = window.GetLVByUID();
		printf("C# =====引导=====raceType " + raceType + " realType " + window.g_eQUDT_TEAM + " userLv " + userLv);
		if ( raceType == window.g_eQUDT_TEAM || userLv < 11)
		{
			printf("C# =====引导=====报名组队活动，或者等级不足报名，之后不再不触发引导");
			window.LMH_AddEvent(window.EVENTCOUNT_FIN_success_queue);
			return;
		}
		window.LMH_AddEvent(window.EVENTCOUNT_EN_success_queue);
	}
	//[功能]活动中被淘汰
	//[参数]raceID:活动的ID
	void LMH1_OutTheArena(raceID)
	{
		window.find("eventCounter").AddEventCount(window.EVENTCOUNT_EN_arena_out);
		printf("C# =====引导=====活动场遭淘汰");
	}
	//[功能]定时活动单场结算的说明
	//[参数]raceID:活动的ID
	void LMH_Arena_Eliminate()
	{
		window.OpenHelp(16001);
		printf("C# =====引导=====定时淘汰赛单场结算");
	}

	//---------------任务界面---------------
	void LMH_Enter_Mission()
	{
		printf("C# =====引导=====进入任务界面");
		window.LMH_AddEvent(window.EVENTCOUNT_UI_enter_mission);
	}
	void LMH_Accept_Mission()
	{
		printf("C# =====引导=====成功接受任务");
		window.LMH_AddEvent(window.EVENTCOUNT_EN_accept_mission);
	}
	void LMH_Complete_Mission()
	{
		printf("C# =====引导=====成功完成任务");
		window.LMH_AddEvent(window.EVENTCOUNT_EN_complete_mission);
	}
	void LMH_Submit_Mission()
	{
		printf("C# =====引导=====提交任务");
		window.LMH_AddEvent(window.EVENTCOUNT_EN_submit_mission);
	}
	void LMH_Quit_Mission()
	{
		printf("C# =====引导=====退出任务界面");
		window.LMH_AddEvent(window.EVENTCOUNT_UI_return_hall_mission);
	}
	void LMH_Giveup_Mission()
	{
		printf("C# =====引导=====放弃任务");
		window.find("eventCounter").Guide_Giveup_Mission();
	}
	void LMH_Levelup_Mission()
	{
		window.find("eventCounter").Guide_Level6_UsualMission();
	}

	//---------------训练、比赛界面---------------
	//[功能]点击了普通模式按钮
	void LMH1_OnClickCommonMode(){}
	//[功能]大厅下面按钮-训练
	void LMH1_Hall_Bottom_Train()
	{
		printf("C# =====引导=====进入训练界面");
		window.LMH_AddEvent(window.EVENTCOUNT_UI_enter_train);
	}
	void LMH_Train_ZIGESAI()
	{
		window.LMH_AddEvent(window.EVENTCOUNT_UI_click_zigesai);
	}

	//---------------社交相关界面---------------
	//[功能]点击了社交按钮
	void LMH1_OnClick_BtnSocial()
	{
		window.LMH_AddEvent(window.EVENTCOUNT_UI_click_social);//点击“社交”按钮
		printf("B# =====引导测试===== 点击“社交”按钮次数 " +  window.eventCounter.GetEventCount(window.EVENTCOUNT_UI_click_social));
	}
	//[功能]点击了社交-加为好友
	void LMH1_ClickSocial_AddFriend(){}
	//[功能]点击了社交-好友标签
	void LMH1_OnCheck_R_Social_Friend(){}
	//[功能]点击了社交-黑名单标签
	void LMH1_OnCheck_R_Social_BlackList(){}
	//[功能]点击了好友消息按钮
	void LMH1_OnClickFriendMsg(){}
	//[功能]全部玩家里选中了一个玩家
	void LMH1_SelectOnePlayer(){}
	//[功能]点击了加为好友-任何地方
	void LMH1_ClickAddFriend(){}
	//[功能]收到了好友消息
	void LMH1_OnReceiveFriendMsg(){}
	//[功能]好友界面点击任意名称
	void LMH1_Friend_AnyName(){}

	//---------------游戏大厅界面---------------
	//[功能]大厅下面按钮-游戏大厅
	void LMH1_Hall_Bottom_GameHall()
	{
//		printf("C# =====引导=====进入游戏大厅");
//		window.LMH_AddEvent(window.EVENTCOUNT_UI_enter_hall_match);//进入游戏室
	}
	//[功能]游戏大厅-快速开始
	void LMH_GameHall_Rand()
	{
//		printf("C# =====引导=====点击快速开始");
//		window.LMH_AddEvent(window.EVENTCOUNT_UI_click_rand_match);//点击快速开始
	}

	//---------------底部各种按钮---------------
	//[功能]大厅下面按钮-排行版
	void LMH1_Hall_Bottom_TopStar(){}
	//[功能]大厅下面按钮-好友
	void LMH1_Hall_Bottom_Friend(){}
	//[功能]大厅下面按钮-玩家列表
	void LMH1_Hall_Bottom_UserList(){}
	//[功能]大厅下面按钮-家族
	void LMH1_Hall_Bottom_Family(){}
	//[功能]大厅下面按钮-录像
	void LMH1_Hall_Bottom_Video(){}
	//[功能]大厅下面按钮-背包
	void LMH1_Hall_Bottom_Pack(){}

	
	//[功能]所有该阶段训练全部完成
	void LMH1_AllTrain_Finish(){}


	//[功能]竞技赛组结束后调用
	//[参数]
	//		groupID 结算的组
	//		end 结算后是否退出组:1 是 0 否
	//		" " 奖励信息
	//			第一个字符:是否有奖励内容:1 是 0 否
	//			第二个字符:排名
	//			第三个字符:经验
	//			第四个字符:金币
	//			第五个字符:点券
	//			第六个字符:物品ID,数量,有效期:-1 0 1 2
	void LMH1_ArenaGroupEnd(userid,raceid,groupid,endgame,goods)
	{
		printf("E# 活动结算: userid: " + userid + "; raceid: " + raceid + "; groupid: " + groupid + "; endgame: " + endgame + "; goods: " + goods);
		//goods字符串顺序"是否有奖励;排名;奖励档次;经验;金币;点券;物品(ID,数量,有效期)
		//info:1;2;2;0;100;100;40003,10,02105009,1,0
		var _arr = window.SplitStr2(goods,";");//解析sendto的参数
		var _arrGoodsNum = window.GetSplitCount(_arr[6],":");//获得需要生成的奖品名称数量
		var _goodsArr1 = window.SplitStr2(""+_arr[6],":");//解析sendto中senditem的参数
//		var _goodsArr2 = window.SplitStr2(""+_arr[7],",");//如果有多个物品奖励，则照此顺序往下写

		var _Param = "";		//参数
		var _HelpID = -1;		//帮助的ID - 对应表UIHelps
		var _varNum = 0;		//参数数量，传参时使用
		var _varExp = 0;
		var _varGold = 0;
		var _varToken = 0;
		var _varItem = 0;

		if (toint(_arr[0]) == 1)//有奖励，下面开始解析
		{
			_Param += _arr[1];	//排名
			_varNum += 1;
			_Param += ",";
			_Param += _arr[2];	//奖励档次
			_varNum += 1;
			if ( toint(_arr[3]) != 0)//不常有经验奖励，有的话就在最后写，方便数据库填写
			{
				_Param += ",";
				_Param += _arr[3];	//经验
				_varNum += 1;
				_varExp = 1;
			}
			if ( toint(_arr[4]) != 0)
			{
				_Param += ",";
				_Param += _arr[4];	//金币
				_varNum += 1;
				_varGold = 1;
			}
			if ( toint(_arr[5]) != 0)
			{
				_Param += ",";
				_Param += _arr[5];	//点券
				_varNum += 1;
				_varToken = 1;
			}
			if ( tostring(_goodsArr1[0]) != "0")
			{
				_Param += ",";
				var _count = 0;
				while (_count < _arrGoodsNum)
				{
					var _goodsName = window.GetNameByEnterID(_goodsArr1[_count]);
					
					if (_goodsName == "-1")
					{
						_count += 1;
						continue;
					}
					
					_Param += _goodsName;
					_Param += "<br>/sp/sp";
					_count += 1;
				}
//				_Param += window.GetNameByEnterID(_goodsArr1[0]);		//物品1名称
//				_Param += _goodsArr1[0];		//物品1名称
				_varNum += 1;
				_varItem = 1;
			}
			printf("E# 活动结算: _Param: " + _Param + "; _varNum: " + _varNum);
			switch (_varNum)//根据参数数量判断
			{
				case 1:break;//只有排名，可能是出错了
				case 2:break;//只有排名+奖励档次，可能是出错了
				case 3:
				{
					if (_varExp == 1){_HelpID = 100001;}//只奖励经验
					if (_varGold == 1){_HelpID = 100002;}//只奖励金币
					if (_varToken == 1){_HelpID = 100003;}//只奖励点券
					if (_varItem == 1){_HelpID = 100004;}//只奖励物品1
					break;
				}
				case 4:
				{
					if (_varExp == 1 && _varGold == 1){_HelpID = 100005;}//经验+金币
					if (_varExp == 1 && _varToken == 1){_HelpID = 100006;}//经验+点券
					if (_varExp == 1 && _varItem == 1){_HelpID = 100007;}//经验+物品1
					if (_varGold == 1 && _varToken == 1){_HelpID = 100008;}//金币+点券
					if (_varGold == 1 && _varItem == 1){_HelpID = 100009;}//金币+物品1
					if (_varToken == 1 && _varItem == 1){_HelpID = 100010;}//点券+物品1
					break;
				}
				case 5:
				{
					if (_varExp == 1 && _varGold == 1 && _varToken == 1){_HelpID = 100011;}//经验+金币+点券
					if (_varExp == 1 && _varGold == 1 && _varItem == 1){_HelpID = 100012;}//经验+金币+物品1
					if (_varExp == 1 && _varToken == 1&& _varItem == 1){_HelpID = 100013;}//经验+点券+物品1
					if (_varGold == 1 && _varToken == 1&& _varItem == 1){_HelpID = 100014;}//金币+点券+物品1
					break;
				}
				case 6:_HelpID = 100015;break;//经验+金币+点券+物品1
			}
		}
		else//没有奖励
		{
			_HelpID = 100000;
		}
		
		//使用的帮助的窗口
		window.find("HELPLAYER").delallchild();
		window.find("UIController").LoadUI("UI_HELP");
		window.find("HELPLAYER").find("HELP_LOGIC").SetParam(_Param);	//设置参数
		window.find("HELPLAYER").find("HELP_LOGIC").ReadDB(_HelpID);	//开始读数据库
		printf("E# 活动结算: _param:"+_Param+",HelpID:"+_HelpID);

		//活动因为人数不足的暂停提示
		if ( endgame == 2)
			{timer(5000,"window.OpenHelp(100016)");}

		timer(15000,"window.DelHelp()");
	}
}