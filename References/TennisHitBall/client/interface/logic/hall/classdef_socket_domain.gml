//
//网球-大厅界面的IO类定义[域名连接]
//

class VHall_Socket_Domain_Logic CDomainGameSocket//CGameSocket
{	
	load("$./ClassDef_Socket_Mall.gml");
	load("$./ClassDef_Socket_Room.gml");

	SETID = window.GetMyUID();	//add by hfz
	SetGroupName = "ROOMGROUP1";
	open(window.HALLIP);
	printf("B# VHall_Socket_Domain_Logic-window.HALLIP:"+window.HALLIP);
	//setReConnectDelay(-1);//2008-8-3 add by yxf
	//网络消息监视器,根据数据库中存储的网络消息，回调脚本中的函数
	new NetMsgMonitor
	{
		printf("B# >warning:NetMsgMonitor\n");
		SetMonitorTable(window.GAMEUI,window.EVENT_HALL);	//设置需要监视的数据表
	}
	new NetMsgMonitor
	{
		SetMonitorTable(window.GAMEUI,window.EVENT_SHOP);	//设置需要监视的数据表
	}
	void OnDelete()
	{
		window.SetMyRaceID(-1);
	}
	//连接上
	void OnConnected()
	{
		VNETLOG(241,"大厅界面Socket已连接上\n");
		printf("B# 大厅界面Socket已连接上");
		InitGame();//程序的函数
		too("Init",window.GetMyUID());   
	}
	//断开连接:返回频道选择界面
	void OnDisConnected()
	{
		printf("B# 大厅Socket断开连接！\n");
		window.HallToChannelChoose();
		window.find("UIController").LoadDLG(7);//与服务器断开连接！
	}
	//连接不上
	void OnConnectErr()
	{
		printf("B# 大厅Socket连接不上！\n");
		window.HallToChannelChoose();
		window.find("UIController").LoadDLG(8);//连接服务器失败！
	}
	//异常错误
	void prc_con_gs_err()
	{
		printf("B# 服务器人数已满，请稍候再试！\n");
		VNETLOG(233,"服务器人数已满，请稍候再试！\n");
		window.HallToChannelChoose();
		window.find("UIController").LoadDLG(13);//服务器人数已满，请稍候再试！
	}
	//服务器繁忙
	void OnWillLoadErr()
	{
		printf("B# 服务器繁忙，请稍候再试！\n");
		VNETLOG(233,"服务器繁忙，请稍候再试！\n");
		//ndow.HallToChannelChoose();
		//ndow.find("UIController").LoadDLG(9);//服务器繁忙，请稍候再试！
	}

	var _Temp = false;	//临时保护措施-需要招募
	var _Temp2 = false;	//临时保护措施-不需要招募
	//是否需要招募角色:1需要 0不需要
	void IsNeedRucruitRole(YesOrNo)
	{
		printf("B# 是否需要招募角色,1需要 0不需要:"+YesOrNo);
		switch (YesOrNo)
		{
			case 0:
			{
				if (!_Temp2)
				{
					window.Tos_EnterTrain("1");//再问是否需要做强制训练
					window.InitMyData();//初始化自己的变量
					_Temp2 = true;
				}
				break;
			}
			case 1:
			{
				if (!_Temp)
				{
					window.find("UIController").LoadUI("UI_CREATE_ROLE");//创建角色
					_Temp = true;
				}
				break;
			}
		}
	}

	//训练的反馈
	//iTrainid:训练ID,
	//iCanEnter：能否进入这个训练 0不能 1能
	//iAchieve：是否完成过这个训练 0没有 1完成
	void TrainResult(iTrainid,iCanEnter,iAchieve)
	{
		window.killtimer("WaitEntryTrainErr_Name");
		window.find("TOPLAYER").delallchild();
		if (iCanEnter == 0)//不能进
		{
			if (iTrainid == window.ID_FORCETRAIN && iAchieve == 1)
			{
				window.find("HALL_LOGIC").ShowHallUI();//不需要做强制训练-直接显示大厅界面
				window.find("LOADING_LOGIC").del();//删除loading界面

				//任何地方到大厅均调此函数
				//参数:1训练->大厅 2已做过强训->大厅 3房间->大厅 4游戏->大厅
				window.LMH_AnyWhereToHall(2);
				
				//[功能]进入大厅时调用
				//[参数]type:1强制训练完成后进大厅 2直接进大厅
				window.CXF_ShowHallUI(2);
				return;//强制训练已完成
			}
			else
			{
				window.find("UIController").LoadDLG(165);//进入训练失败
				return;
			}
		}
		else
		{
			if (iTrainid == window.ID_FORCETRAIN)
			{
				//同步完成的训练,只需要发送一次(这是第二个地方发，主要解决换角色的问题)
				window.Tos_SynAchieveTrain(""+window.GetMyUID());
				//window.StopPlay();	//停止背景音乐
			}
			//window.find("LOADING_LOGIC").del();//删除loading界面
			window.HallToTraining(iTrainid);//大厅到训练中		
		}
	}

	//完成训练的反馈：训练ID，1
	void AchieveTrain(iTrainid,iAchieve)
	{
		
		if (toint(iTrainid) == window.ID_FORCETRAIN)
		{
			return;
		}
		window.killtimer("Timer_NormalTrainOver");
		var _CTrianLogic = new CTrianLogic{}
		//在此计算下边的选择条ID
		var _NextID = _CTrianLogic.GetNextID(iTrainid);
		var _isfinish = _CTrianLogic.IsAllFinish(iTrainid);
		printf("B# 当前训练ID:"+window.g_TrainID+"，下一个ID："+_NextID+",完成："+_isfinish);
		window.find("UIController").LoadUI("UI_PLAYOVER_DLG"); 
		window.find("PLAYOVER_DLG_LOGIC")._DLG.GetDataFromDB(1,iTrainid,_NextID,_isfinish);
	}
	
	void SynAchieveTrainFinish(userid)
	{
		printf("SynAchieveTrainFinish:"+userid);
	}

	//得到排行榜的数据:用户id,版本号,类型(1-12),用户排行名次(当给客户端更新时有效),无效时为-1,返回值
	//updown:升降 <0降 =0未 >0升
	void SortDataFinish(iUserId,iVersion,iType,iIndex,returnid,updown)
	{
		printf("B# 明星榜:SortDataFinish():iVersion:"+iVersion+",iType:"+iType+",iIndex:"+iIndex+",returnid:"+returnid+",updown:"+updown);
		if (returnid == -1001)
		{
			printf("B# 明星榜:错误的排行榜类型!");VNETLOG(1131,"错误的排行榜类型\n");
			return;
		}
		if (returnid == -1002)
		{
			printf("B# 明星榜:排行榜版本号相同!");VNETLOG(1131,"排行榜版本号相同\n");
			var _Type = toint(iType);
			window.find("HALL_LOGIC").m_TopStar.ReadFile(_Type);	//取配置文件的数据
			if (window.IsUIPos(window.POS_TOPSTAR))
			{
				printf("B# 明星榜:打开了明星榜界面");
				//打开了明星榜界面
				window.find("TOPSTAR_LOGIC")._VTopStar_Logic.ReSelect(_Type,updown);
				return;
			}
		}
		if (returnid == 1)
		{
			printf("B# 明星榜:完成排行榜数据同步!");VNETLOG(1131,"完成排行榜数据同步\n");
			var _Type = toint(iType);
			window.find("HALL_LOGIC").m_TopStar.SetVerID(_Type,iVersion);
			if (window.IsUIPos(window.POS_TOPSTAR))
			{
				printf("B# 明星榜:打开了明星榜界面");
				//打开了明星榜界面
				window.find("TOPSTAR_LOGIC")._VTopStar_Logic.ReSelect(_Type,updown);
				return;
			}
		}
	}
	
	//申请排队反馈
	//参数：用户id,竞技类型,返回值
	void ApplyArenaRace(iUserId,iRaceType,iReturnId)
	{
		/*报名排队*/
		if (iReturnId == 1000)
		{
			window.OnBeginRaceSuccess(iRaceType);
			return;
		}
		if (iReturnId == -1000)
		{
			window.find("UIController").LoadDLG(504);//没有此竞技ID
			return;
		}
		if (iReturnId == -1001)
		{
			window.find("UIController").LoadDLG(505);//错误的竞技类型
			return;
		}		
		if (iReturnId == -1002)
		{
			window.find("UIController").LoadDLG(506);//不满足竞技条件
			return;
		}
		if (iReturnId == -1003)
		{
			window.find("UIController").LoadDLG(507);//没有找到用户
			return;
		}
		if (iReturnId == -1004)
		{
			window.find("UIController").LoadDLG(508);//错误的限制条件
			return;
		}
		if (iReturnId == -1005)
		{
			window.find("UIController").LoadDLG(509);//无法连接到竞技场服务器
			return;
		}
		if (iReturnId == -1006)
		{
			window.find("UIController").LoadDLG(510);//已经在竞技场游戏中
			return;
		}
		if (iReturnId == -1007)
		{
			window.find("UIController").LoadDLG(511);//重复报名
			return;
		}
		if (iReturnId == -1010)
		{
			window.find("UIController").LoadDLG(502);//钱不够
			return;
		}
		if (iReturnId == -1011)
		{
			window.find("UIController").LoadDLG(503);//等级不符
			return;
		}
		if (iReturnId == -1012)
		{
			window.find("UIController").LoadDLG(499);//没这种关系
			return;
		}
		if (iReturnId == -1013)
		{
			window.find("UIController").LoadDLG(498);//性别不符
			return;
		}
		if (iReturnId == -1014)
		{
			window.find("UIController").LoadDLG(497);//物品不够
			return;
		}
		if (iReturnId == -1015)
		{
			window.find("UIController").LoadDLG(496);//点卷不够
			return;
		}
		if (iReturnId == -1101)
		{
			window.find("UIController").LoadDLG(512);
			printf("B# 添加组失败，达到最大组数量\n");
			return;
		}
		if (iReturnId == -1102)
		{
			window.find("UIController").LoadDLG(513);
			printf("B# 添加组失败，添加超时\n");
			return;
		}
		if (iReturnId == -1103)
		{
			window.find("UIController").LoadDLG(514);
			printf("B# 报名失败,参数错误\n");return;
		}
		if (iReturnId == -1104)
		{
			window.find("UIController").LoadDLG(515);
			printf("B# 开始排队失败，指定组满员\n");
			return;
		}
		if (iReturnId == -1105)
		{
			window.find("UIController").LoadDLG(516);
			printf("B# 添加玩家失败，未找到指定的组\n");
			return;
		}
		if (iReturnId == -1106)
		{
			window.find("UIController").LoadDLG(517);
			printf("B# 开始排队失败，时间未到\n");
			return;
		}
		if (iReturnId == -1107)
		{
			window.find("UIController").LoadDLG(518);
			printf("B# 开始排队失败，活动未开启\n");
			return;
		}
		if (iReturnId == -1108)
		{
			window.find("UIController").LoadDLG(513);
			printf("B# 开始排队失败，报名时间已结束\n");
			return;
		}
		if (iReturnId == -1110)
		{
			window.find("UIController").LoadDLG(514);
			printf("B# 开始排队失败，未在配置文件找到所报名的类型\n");
			return;
		}
		if (iReturnId == -1111)
		{
			window.find("UIController").LoadDLG(514);
			printf("B# 数据库创建组失败\n");
			return;
		}
		if (iReturnId == -1112)
		{
			window.find("UIController").LoadDLG(519);
			printf("B# 开始排队失败，组状态不在报名中\n");
			return;
		}
		
		/*取消排队*/
		if (iReturnId == 2000)
		{
			window.OnCancelRaceSuccess(toint(iRaceType),iReturnId);
			printf("B# 取消排队成功\n");
			return;
		}
		if (iReturnId == -2000)
		{
			window.find("UIController").LoadDLG(521);
			printf("B# 取消排队失败，参数错误\n");
			return;
		}
		if (iReturnId == -2001)
		{
			window.find("UIController").LoadDLG(522);
			printf("B# 取消排队失败，错误的组ID\n");
			return;
		}
		if (iReturnId == -2002)
		{
			window.find("UIController").LoadDLG(523);
			printf("B# 取消排队失败，未找到指定的活动\n");
			return;
		}
		if (iReturnId == -2003)
		{
			window.find("UIController").LoadDLG(524);
			printf("B# 取消排队失败，没有找到玩家\n");
			return;
		}
		if (iReturnId == -2004)
		{
			window.find("UIController").LoadDLG(525);
			printf("B# 取消排队失败，错误的服务器ID\n");
			return;
		}
		if (iReturnId == 8000)
		{
			printf("B# 失去活动资格\n");
			window.OnCancelRaceSuccess(toint(iRaceType),iReturnId);
			return;
		}
		if (iReturnId == 8001)
		{
			if (!window.IsRandomRace(toint(iRaceType)))
			{
				window.OnDismissTeamRaceSuccess(toint(iRaceType));
				printf("B# 失去活动资格-不是撮合\n");
				window.find("UIController").LoadDLG(124);//因队伍解散而失去活动资格！
			}
			printf("B# 因队伍解散而失去活动资格\n");
			return;
		}
		if (iReturnId == 9001)
		{
			window.find("GameInterface").NoEnd();//何要做点事，我只是通知她2010年1月7日
			window.OnCancelRaceSuccess(toint(iRaceType),iReturnId);
			printf("B# 表示时间到，正常结算，无弹出框显示\n");
			return;
		}
		if (iReturnId == 9002)
		{
			window.find("UIController").LoadDLG(430);//由于当前人数过低，活动已结算。
			printf("B# 表示人数剩一个，被迫结算，弹出框显示\n");
			return;
		}
		if (iReturnId == 9003)
		{
			window.OnCancelRaceSuccess(toint(iRaceType),iReturnId);
			window.find("UIController").timer(1500,"LoadDLG(692)");
//			window.find("UIController").LoadDLG(692);//由于人数不足，活动未开启，已自动取消报名
			printf("B# 表示时间到，报名的组未开启，弹出框显示\n");
			return;
		}
	}

	//配对成功反馈函数
	//参数：用户id,房间id,竞技大厅服务器IP，竞技房间服务器IP,AI的ID
	void QueueResult(iUserId,iRoomId,szHallIP,szRoomIP,AIID)
	{
		if (window.GetUIPos() == window.POS_TRAINING || window.GetUIPos() == window.POS_TRAINOVER)
		{
			//window.g_TrainType = 2;		//训练的类型：0强制训练 1正常(训练选择) 2(训练中弹出)
			window.TrainingToTrain();
		}

		if (window.GetUIPos() == window.POS_VIDEOING)
		{
			window.VideoToHall();
		}

		if (toint(AIID) > 0)	//是AI
		{
			//等待界面
			set window.find("TOPLAYER")
			{
				new VHallWaiting_Logic{}
			}
			window.find("TOPLAYER").find("VHallWaiting_Logic_Name").SetData(window.GetMyRaceID());
			sleep(2000);
			
			window.g_TrainID = window.GeAIIDByTrainID(AIID);
			//发出进入训练的消息,参数：训练ID
			window.Tos_EnterTrain(""+window.g_TrainID);
			
			window.SetUIGameState(window.USER_UISTATE_AI_RAND);//2009年12月24日
			window.HallToFreeTrain_Ex(AIID);
			return;
		}

		window.ARENAHALLIP = ""+szHallIP;
		window.ARENAROOMIP = ""+szRoomIP;
	
		var _temp = szHallIP.Left(10);
		if (_temp == "socket:://")
		{
			window.g_ArenaIoType = 0;
		}
		else
		{
			window.g_ArenaIoType = 1;
		}

		window.g_ArenaRoomID = iRoomId;	//竞技场的房间ID
		//去连接竞技场服务器
		window.find("ArenaGCMap")._ArenaIO.del();
		set parent.parent._GCMap1
		{
			if (window.g_ArenaIoType == 0)
			{
				staticvar _ArenaIO = new VArena_Socket_Logic{}
			}
			if (window.g_ArenaIoType == 1)
			{
				staticvar _ArenaIO = new VArena_Socket_Logic_Domain{}
			}
		}
		parent.parent._GCMap1._ArenaIO.open(window.ARENAHALLIP);
	}

	//我要充点:用户ID,返回值,当前点数
	void AddArenaData(iUserID,iReturnId,currPoint)
	{
		if (iReturnId == 1000)
		{
			printf("B# 充点成功\n");
			window.WriteChat7(1011);//充点成功
			return;
		}
		if (iReturnId == -1001)
		{
			printf("B# 充点不是竞技场状态\n");
			window.find("UIController").LoadDLG(501);//充点不是竞技场状态
			return;
		}
		if (iReturnId == -1002)
		{
			printf("B# 充点没用足够的(钱或者其他的)\n");
			window.find("UIController").LoadDLG(500);//充点失败，金币不足！
			return;
		}
	}

	//竞技赛组结束
	//[参数]userid 玩家ID
	//		raceid 报名ID
	//		groupID 结算的组
	//		end 结算后是否退出组:1 是 0 否
	//		" " 奖励信息
	//			第一个字符:是否有奖励内容:1 是 0 否
	//			第二个字符:排名
	//			第三个字符:经验
	//			第四个字符:金币
	//			第五个字符:点券
	//			第六个字符:物品ID,数量,有效期:-1 0 1 2
	void ArenaGroupEnd(userid,raceid,groupid,endgame,goods)
	{
		//return;
		var _footleavetime = window.GetFootLeaveTimeByID(raceid);
		window.find("HALL_LOGIC").m_FootLeaveTime.SetData(_footleavetime);

		//parent.parent._GCMap1._ArenaIO.killtimer("Arena_Timer_Name");
		//window.find("TOPLAYER").find("VHallWaiting_Logic_Name").del();
//		if (window.g_LoadingType == window.LOAD_TYPE_ARENATOGAME)
//		{
//			//window.RoomToHall();
//		}
		window.LMH1_ArenaGroupEnd(userid,raceid,groupid,endgame,goods);

		//取排行榜数据
		window.GetArenaTopData();
	}

	//同步竞技数据:用户ID,竞技类型,组ID,自己的排名位置(-1表示没有进入排名)
	void SynArenaData(userid,raceid,groupid,mypos)
	{
		window.find("VArena_MyActivity_Top_Logic_Name").SetMyIndex(mypos);
	}

	//同步竞技数据字符串:用户ID,竞技类型,组ID,自己的排名位置(-1表示没有进入排名),前几名的昵称
	void SynArenaDataStr(userid,raceid,groupid,mypos,nkname)
	{
		
	}

	//询问竞技赛的返回:用户ID,能报名的活动数,开启的剩余时间 <0已开启 >=0有效剩余时间
	void EnterArena(userid,canSignNum,openLeaveTime,strTime)
	{
		if (userid != window.GetMyUID()) return;
		var _temp = ""+tostring(strTime);
		window.find("VHall_Logic_NAME").ResActivityInfo(canSignNum,openLeaveTime,_temp);
	}
	
	//本时间段所有的活动都结束了
	void ActivityArenaOver(iUserID)
	{
		var _RaceTable = new VNet2DBTable{}
		var _SQL = "SELECT * FROM arenaRace WHERE pvpsv_num>0 and activity_state>"+window.g_ACTIVITY_CLOSE+" and race_state="+window.g_QUEUE_QUEUEWAIT+"or pvpsv_num>0 and activity_state>"+window.g_ACTIVITY_CLOSE+" and race_state="+window.g_QUEUE_PAUSE;
		_RaceTable.Select(window.M_G_SERVER,_SQL);
		var _size = _RaceTable.GetSize();
		printf("B# ActivityArenaOver():_SQL:"+_SQL+",_size:"+_size);
		_RaceTable.del();
		if (_size > 0)
			return;
		
		printf("B# 公告ActivityArenaOver:本时间段所有的活动都结束了");

		//看看活动情况
		//询问竞技赛的信息:用户ID
		var _param = ""+window.GetMyUID();
		window.Tos_EnterArena(_param);
	}
	
	//活动状态
	//[参数]iState:1,有活动开启 2.所有的活动都关闭了
	void ActivityRaceState(iUserID,iState)
	{
		if (userid != window.GetMyUID()) return;
		window.find("VHall_Logic_NAME").ResActivityState(toint(iState));
	}
	
	//出师未捷身先死 
	//[参数]用户ID,竞技ID,信息ID,特殊的文字
	void ArenaExInfo(iUserID,iRaceID,iInfo,szText)
	{
		iInfo = toint(iInfo);
		if (iInfo == 1000)
		{
			window.find("UIController").LoadDLG(107);//活动结束，报名费用已返还！
		}
	}
	
	//相关的活动逻辑消息
	void ActivityLogicMsg(userid,raceid,reason,exdata)
	{
		if (reason == window.ACTIVITYLOGICMSG_PAUSEBALANCE)
		{
			//暂停结算
			window.find("HALL_LOGIC").m_FootLeaveTime.StopRunTime();
		}
	}

	//游戏结束
	void prc_wr_gameover(param)
	{
		printf("B# yxf:hall游戏结束!param:"+param);
		window.find("GameInterface").SetGameState(4);
		window.find("GameInterface").SetGameState(5);
		// 设置房间状态 add by hanshuo 1.20.2009
		window.find("NAME_GCMap").SetRoomState(6);
	}
	
	//意外退出
	void UserGoOut(why)
	{
		if (why == 1001)//是由于有其他人用相同的帐号进入大厅造成的
		{
			window.UnknownToLogin();
			window.find("UIController").LoadDLG(40);//因相同账号重复登陆强制下线！
			return;
		}
		if (why == 1002)//是由于在房间内赌钱钱不够押注
		{
			window.RoomToHall();
			window.find("UIController").LoadDLG(75);//余额不足，无法进行比赛！
		}
		if (why == 1003)//服务器繁忙
		{
			window.HallToChannelChoose();
			window.find("UIController").LoadDLG(684);//服务器繁忙
			return;
		}
		if (why == 1004)//由于本帐号在其他服务器登录这个无法登录
		{
			window.HallToChannelChoose();
			window.find("UIController").LoadDLG(670);//因相同账号重复登陆强制下线！
			return;
		}
		if (why == 1005)//怀疑使用变速齿轮
		{
			window.UnknownToLogin();
			window.find("UIController").LoadDLG(686);	 // 怀疑是外挂
			return;
		}
		if (why == 1006)//怀疑是内存修改工具
		{
			window.UnknownToLogin();
			window.find("UIController").LoadDLG(827);	 // 怀疑是内存修改工具
			return;
		}
		if (why == 9999)//芒果帐号已停权
		{
			window.HallToChannelChoose();
			window.find("UIController").LoadDLG(99);//您的账号已被停权！
		}
	}

	//在线礼品:用户ID,礼品ID(0表示没有可以领取的礼品),这个礼品可以领取的时间,错误返回
	void InLinePresent(iUserID,iID,iTm,iReturnId)
	{
		if (iUserID != window.GetMyUID())
		{
			printf("B# 在线礼品 UID错误\n");
			return;
		}
		if (iReturnId == -1000)
		{
			printf("B# 在线礼品 时间还没到\n");
			return;
		}
		window.find("VHall_OnLinePresent_Logic_Name").SetOLPresentData(iID,iTm);
	}

	//15天总奖品
	void FinalAward15()
	{
		window.find("UIController").LoadUI("UI_ACTIVITY_OVER");
	}

	//[功能]服务器提示
	//[参数]iType：类型:1.弹出框 2.聊天框
	//		szInfo：显示的信息
	void SvInfo(iType,szInfo)
	{
		window.find("TOPLAYER").delallchild();
		window.find("DLGLAYER").delallchild();
		if (iType == 1)
		{
			window.find("UIController").LoadDLG(250);//?
			window.find("DLGLAYER").find("VMyMessageBox_1_Logic").ReplaceData2(""+szInfo);
			return;
		}
		if (iType == 2)
		{
			window.WriteChat(7,szInfo);
			return;
		}
	}

	/*
	*	任务相关
	*/
	
	//[功能]存储个人配置信息
	//[参数]iUserID:用户ID
	//		iReturnId:错误返回(负数为错误)
	void StoreInfo(iUserID,iReturnId)
	{
		
	}

	//[功能]接任务
	//[参数]iUserID:用户ID
	//		iTaskID:任务ID
	/*
	const int TaskErr_TaskFull				= -40000;		// 任务接满了
	const int TaskErr_TaskExist				= -40001;		// 任务已经接了
	const int TaskErr_TaskNotExist			= -40002;		// 任务不存在
	const int TaskErr_TaskNot				= -40003;		// 接任务不满足条件
	const int TaskErr_EverydayTaskComplete	= -40023;		// 日常任务今天已经完成了
	const int TaskErr_Tm	= -40030;		// 任务的时间不符,导致无法接任务
	-40004;		// 您已经进入了防沉迷阶段，无法接取任务
	*/
	void InceptTask(iUserID,iTaskID,iReturnId)
	{
		if(iReturnId == -40000)
		{
			window.find("UIController").LoadDLG(645);
		}
		if(iReturnId == -40030)
		{
			window.find("UIController").LoadDLG(689);
		}
		if(iReturnId == -40004)
		{
			window.find("UIController").LoadDLG(694);
		}
	}

	//[功能]交任务
	//[参数]iUserID:用户ID
	//		iReturnId:返回
	void SubmitTask(iUserID,iTaskID,iReturnId)
	{
		if(iReturnId == -40004)
		{
			window.find("UIController").LoadDLG(818);
		}
	}

	/*撮合*/
	//[功能]撮合队列变化
	//[参数]iUserID:用户ID
	//		iReturnId:原因ID
	//		iRaceID:活动ID
	void WaitQueue(iUserID, iReturnId,iRaceID)
	{
		if (iReturnId == 1)//进入等待撮合等待队列
		{
			window.SetMyRaceID(iRaceID);
			window.SetRaceStateByID(iRaceID,window.g_QUEUE_QUEUEWAIT);

			return;
		}
		if (iReturnId == 2)//报名活动退出撮合等待队列
		{
			
			return;
		}
		if (iReturnId == 3)//主动取消退出撮合等待队列
		{
			window.SetMyRaceID(-1);
			var _racename = window.GetRaceNameByID(iRaceID);
			window.WriteChat7(520,_racename);
			window.SetRaceStateByID(iRaceID,window.g_QUEUE_CANCEL);
			return;
		}
	}

	//创建家族反馈函数
	//iUserID 用户;IDiReturnID 返回值
	void CreateFamily(iUserID,iReturnID)
	{
		//创建家族所需等级不够
//		if(iReturnID == window.ERR_FAMILY_CREATE_LEV)
//		{} 
//		//创建家族所需钱不够
//		if(iReturnID == window.ERR_FAMILY_CREATE_MONEY)
//		{}
//		//无法创建(一般因为无法连接好友)
//		if(iReturnID == window.ERR_FAMLIY_CREATE_WRONG)
//		{}
		window.ShowFamilyTipInfo(iReturnID);
	}
};
