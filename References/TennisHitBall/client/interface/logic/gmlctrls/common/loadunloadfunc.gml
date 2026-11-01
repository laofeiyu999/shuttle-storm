set window
{
	var LAYERNUMBER = 7;
	var _LayerNames = sysarray(LAYERNUMBER);

	void InitAllLayers()
	{
		_LayerNames[0]	=	window.BGLAYER;
		_LayerNames[1]	=	window.GAMELAYER;
		_LayerNames[2]	=	window.UILAYER;
		_LayerNames[3]	=	window.BTNLAYER;
		_LayerNames[4]	=	window.POPLAYER;
		_LayerNames[5]	=	window.DLGLAYER;
		_LayerNames[6]	=	window.TOPLAYER;
	}
	InitAllLayers();

	void ClearAllLayers(LayerNameStr)
	{
		var _loop = 0;
		while(true)
		{
			if (_loop >= LAYERNUMBER){break;}
			window.find(_LayerNames[_loop]).delallchild();
			_loop = _loop + 1;
		}
		window.find("VGuideCapture_Name").del();
	}

	void ClearAllLayersExcept(LayerNameStr)
	{
		var _loop = 0;
		var NameStr = LayerNameStr;
		while(true)
		{
			if (_loop >= LAYERNUMBER){break;}
			if (NameStr.Find(_LayerNames[_loop], 0) < 0)
			{
				window.find(_LayerNames[_loop]).delallchild();
			}
			_loop = _loop + 1;
		}
	}

	void HideAllLayers()
	{
		var _loop = 0;
		while(true)
		{
			if (_loop >= LAYERNUMBER){break;}
			window.find(_LayerNames[_loop]).show = false;
			_loop = _loop + 1;
		}
	}

	void HideAllLayersExcept(LayerNameStr)
	{
		var _loop = 0;
		while(true)
		{
			if (_loop >= LAYERNUMBER){break;}
			if (LayerNameStr.Find(_LayerNames[_loop], 0) < 0)
			{
				window.find(_LayerNames[_loop]).show = false;
			}
			_loop = _loop + 1;
		}
	}

	void ShowAllLayers()
	{
		var _loop = 0;
		while(true)
		{
			if (_loop >= LAYERNUMBER){break;}
			window.find(_LayerNames[_loop]).show = true;
			_loop = _loop + 1;
		}
	}

	//=========================================================================================

//未知界面->登录，如服务器连接断开时，直接返回登录
	void UnknownToLogin()
	{
		printf("B# [UIPOS]UnknownToLogin()-未知界面->登录\n");
		window.ShowAllLayers();
		window.ClearAllLayers();
		window.g_probablyPos = window.POS_PROBABLY_LOGIN;
		window.find("UIController").LoadUI("UI_LOGIN");
		window.PlayMusic(window.g_CSoundSet.GetBgMusic(window.eBgMusic_Login));
		window.MYDATA.SetDeskID(-1);//将房间号清空
		window.MYDATA.SetChannel("");//将频道名清空
		if (window.g_probablyPos == window.POS_PROBABLY_ROOM)
		{
			var _VNet2DBRow = new VNet2DBRow{};
			_VNet2DBRow.InitByInt(window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_UID,window.GetMyUID());
			if ( _VNet2DBRow.IsReady())
			{
				_VNet2DBRow.SetInt(window.M_G_SERVER_USERDT_READY,-1);
				_VNet2DBRow.UpdateEnd();
			}
			_VNet2DBRow.del();
		}
		
	}
//游戏Logo->登录
	void LogoToLogin()
	{
		printf("B# [UIPOS]LogoToLogin()-游戏Logo->登录\n");

		window.ClearAllLayers();
		window.g_probablyPos = window.POS_PROBABLY_LOGIN;
		window.find("UIController").LoadUI("UI_LOGIN");
		window.PlayMusic(window.g_CSoundSet.GetBgMusic(window.eBgMusic_Login));
	}

//登录->频道选择
	void LoginToChannelChoose()
	{
		printf("B# [UIPOS]LoginToChannelChoose()-登录->频道选择\n");

		window.ClearAllLayers();
		window.g_probablyPos = window.POS_PROBABLY_CHANNELCHOOSE;
		window.find("UIController").LoadUI("UI_CHANNEL_CHOOSE"); 
	}

//频道选择->登录
	void ChannelChooseToLogin()
	{
		printf("B# [UIPOS]ChannelChooseToLogin()-频道选择->登录\n");

		window.g_LoginType = 1;
		window.ClearAllLayers();
		window.g_probablyPos = window.POS_PROBABLY_LOGIN;
		window.find("UIController").LoadUI("UI_LOGIN");
		window.PlayMusic(window.g_CSoundSet.GetBgMusic(window.eBgMusic_Login));
		window.find("eventCounter").ResetAllEventCount();
	}
//频道选择->大厅
	void ChannelChooseToHall()
	{
		printf("B# [UIPOS]ChannelChooseToHall()-频道选择->大厅\n");
		
		window.ClearAllLayers();

		window.g_LoadingType = window.LOAD_TYPE_CHENNELTOHALL;
		window.find("UIController").LoadUI("UI_LOADING");
		window.g_probablyPos = window.POS_PROBABLY_HALL;
		window.find("UIController").LoadUI("UI_HALL");
	}
//其他界面->频道选择  (创建角色)
	void OtherToChannelChoose()
	{
		printf("B# [UIPOS]OtherToChannelChoose()-其他界面->频道选择  (创建角色)\n");
		VNETLOG(1133,"OtherToChannelChoose-GetMyState():"+window.GetMyState()+"\n");
		
		//(BUGID:0013436)：2010年5月4日 yxf
		window.SetMailRead();
		
		// chenjihui 2011-1-12
		window.find("ChargeCarRecord").DelTableRow();

		//2009年12月4日 han
		window.find("HALLGCMap").find("self").SendEventInfo();

		if (window.GetMyState() > 0) //确定是进大厅了
		{
			//以下做法是防止未进大厅(loading按ESC)即返回时取不到称号而加
			var _Qualify = window.GetQualifyByUID(window.GetMyUID());
			VNETLOG(1133,"OtherToChannelChoose-SetMyQualify:_Qualify:"+_Qualify+"\n");
			if (toint(_Qualify)>0)
			{
				window.SetMyQualify(_Qualify);//保存称号
			}
		}
		window.LMH1_DelCap();//强制引导
		window.ShowAllLayers();
		window.ClearAllLayers();
		window.g_probablyPos = window.POS_PROBABLY_CHANNELCHOOSE;
		window.find("UIController").LoadUI("UI_CHANNEL_CHOOSE"); 
		window.find("CSYSTEMAFFICHE_LOGIC")._VSysAffiche.InstancyDel();

		window.g_CArenaFunction.ClearPackTB();//清背包的数据 2010年4月21日 yxf
		window.g_CArenaFunction.ClearMailTB();//清邮件的数据 2010年4月28日 yxf
	}
//创建角色->大厅
	void CreateRoleToHall()
	{
		printf("B# [UIPOS]CreateRoleToHall()-创建角色->大厅\n");
		window.ClearAllLayersExcept(window.UILAYER);
		
		window.g_probablyPos = window.POS_PROBABLY_HALL;
		window.g_LoadingType = window.LOAD_TYPE_CREATEROLETOHALL;
		window.find("UIController").LoadUI("UI_LOADING");

		window.find("CREATE_ROLE_LOGIC").del();
		window.InitMyData();//初始化自己的变量
		//发出进入训练的消息 参数：训练ID
		window.Tos_EnterTrain("1");
	}
//大厅->频道选择
	void HallToChannelChoose()
	{
		printf("B# [UIPOS]HallToChannelChoose()-大厅->频道选择\n");
		
		//(BUGID:0013436)：2010年5月4日 yxf
		window.SetMailRead();

		//2009年12月4日 han
		window.find("HALLGCMap").find("self").SendEventInfo();

		window.MYDATA.SetDeskID(-1);//将房间号清空
		window.MYDATA.SetChannel("");//将频道名清空
		
		VNETLOG(1133,"HallToChannelChoose-GetMyState():"+window.GetMyState()+"\n");
		if (window.GetMyState() > 0) //确定是进大厅了
		{
			//以下做法是防止未进大厅(loading按ESC)即返回时取不到称号而加
			var _Qualify = window.GetQualifyByUID(window.GetMyUID());
			VNETLOG(1133,"HallToChannelChoose-SetMyQualify:_Qualify:"+_Qualify+"\n");
			if (toint(_Qualify)>0)
			{
				window.SetMyQualify(_Qualify);//保存称号
			}
		}

		window.find("CSYSTEMAFFICHE_LOGIC")._VSysAffiche.InstancyDel();
		window.find("HALL_CAFFICHEMGR_LOGIC").del();
		window.find("HALL_CAFFICHEMGR_EX_LOGIC").del();

		window.find("BuyCarRecord").SaveToINI();
		window.LMH1_DelCap();//强制引导
		window.ClearAllLayers();
		window.g_probablyPos = window.POS_PROBABLY_CHANNELCHOOSE;
		window.ShowAllLayers();
		window.find("UIController").LoadUI("UI_CHANNEL_CHOOSE"); 

		window.find("FamilyLevUpMonitor_Name").del();

		window.g_CArenaFunction.ClearPackTB();//清背包的数据 2010年4月21日 yxf
		window.g_CArenaFunction.ClearMailTB();//清邮件的数据 2010年4月28日 yxf
	}

//大厅->房间:房间ID,是否为竞技赛,报名iD（竞技有效）
	void HallToRoom(roomID,isArena,raceID)
	{
		printf("B# [UIPOS]大厅->房间:HallToRoom()："+roomID+",isArena:"+isArena+",raceID:"+raceID);
		
		//临时做法 - 2010年1月12日0:28
		window.find("RANDGAME_LOGIC").del();
		window.SetRaceStateByID(window.RANDOM_DOUBLE,window.g_QUEUE_CANCEL);

		window.g_ArenaJoinRoom = isArena;//是否为竞技加入房间
		window.find("HALL_LOGIC").DelHallFuckUser();	//删除大厅的快捷键用户
		window.ClearAllLayersExcept(window.UILAYER);
		window.find("CHAT_LOGIC").del();
		window.find("ROLEMODEL_LOGIC").del();
		window.find("VHall_HideUI_Logic_Name").del();
		window.find("ROOM_LOGIC").del();	//0013514: 活动场准备开始的时候出房间报错（湖卫提） 2010年5月7日 yxf
		window.ClearHallBtnUI();
		
		//将服务器返回的DeskID写入GameUI.mdb selfdt表
		window.MYDATA.SetDeskID(roomID);
		//初始设置游戏地图ID
		window.SetMyGameMapID(window.GetGameMapIDByRoomID(roomID));
		//初始设置房间地图ID
		window.SetMyRoomMapID(window.GetRoomMapIDByGameMapID(window.GetMyGameMapID()));
		
		window.g_probablyPos = window.POS_PROBABLY_ROOM;
		if(window.g_ArenaJoinRoom)
		{
			window.g_LoadingType = window.LOAD_TYPE_ARENATOGAME;
			window.find("UIController").LoadUI("UI_LOADING"); 
			window.find("LOADING_LOGIC")._VLoading_Logic.SetData(1,raceID,-1,-1,-1,-1);

			window.find("UIController").LoadUI("UI_ROOM"); 
			window.find("ROOM_LOGIC").SetMyRoomShow(false);
		}
		else
		{
			window.g_LoadingType = window.LOAD_TYPE_HALLTOROOM;
			window.find("UIController").LoadUI("UI_LOADING"); 

			window.find("UIController").LoadUI("UI_ROOM"); 
			window.find("UIController").LoadUI("UI_CHAT_ROOM");
			window.find("CHAT_LOGIC").show = false;
			window._charShowFlag = false;
		}
		
		set window
		{
			var _RoomUserHTR = new VRoomUserDT_Logic{}
		}
//		printf("wwwwwindow.GetMyUID()="+window.GetMyUID()+",window._RoomUser.m_UID2="+window._RoomUser.m_UID2+",window._RoomUser.m_UID3="+window._RoomUser.m_UID3+",window._RoomUser.m_UID4="+window._RoomUser.m_UID4);
		window.Tos_CheckLoverID(window.GetMyUID());//进游戏时发查询情侣消息
		window.Tos_CheckLoverID(window._RoomUserHTR.m_UID2);
		window.Tos_CheckLoverID(window._RoomUserHTR.m_UID3);
		window.Tos_CheckLoverID(window._RoomUserHTR.m_UID4);

		window.PlaySound(130);//当玩家进入房间时
	}

//房间->大厅
	void RoomToHall()
	{
		window.MYDATA.SetDeskID(-1);window.find("NAME_GCMap")._Room_Socket.tos("nf_leave_room",""+window.GetMyUID());
		//                           
		window.DeoxidizeGameSetUp();//当打开游戏设置被房主提出房间,回复修改前的设置
		window.ShowAllLayers();
		window.ClearAllLayersExcept(window.UILAYER);
		
		window.ClearRoomBtnUI();
		window.ClearOtherDragUI();

		window.find("HALL_LOGIC").AddHallFuckUser();	//添加大厅的快捷键用户
		window.find("GAME_OVER_LOGIC").del();	//删除结算界面
		window.find("GameOver_TurnCards_Logic").del();	//删除翻牌界面
		window.find("ROOM_LOGIC").del();
		window.find("GAME_LOGIC").del();		//删除游戏中界面(在结算时被踢到大厅)
		window.find("CHAT_LOGIC").del();		//删除游戏中聊天(在结算时被踢到大厅)

		window.g_probablyPos = window.POS_PROBABLY_HALL;
		window.find("HALL_LOGIC").ShowHallUI();		//显示大厅界面+加背景层+加按钮层
		
		window.MYDATA.SetDeskID(-1);//将房间号清空

		window.PlaySound(137);//当玩家离开房间时
		window.LMH_AnyWhereToHall(3);

		window.SetUIGameState(window.USER_UISTATE_NOTINANY);//2009年12月24日
	}

//房间->游戏
	void RoomToGame()
	{
		printf("B# [UIPOS]房间->游戏:RoomToGame");
		window.g_AlreadySaveVideo = false;
		window._IfCanShowVS = 0;	//2009年1月8日
		window.find("VRoom_UserList_Logic_NAME").DEL();//移除房间中玩家列表的绑定
		set window
		{
			var _RoomUser = new VRoomUserDT_Logic{}
		}
		
		if (window.g_ArenaJoinRoom)//竞技
		{
			window.SetUIGameState(window.USER_UISTATE_GAME_ARENA);//2009年12月24日

			window.g_LoadingType = window.LOAD_TYPE_ARENATOGAME;
			//保留loading
			window.ClearAllLayersExcept(""+window.UILAYER+","+window.GAMELAYER+","+window.DLGLAYER);
			window.find("LOADING_LOGIC")._VLoading_Logic.SetData(1,window.GetMyRaceID(),window.GetMyUID(),window._RoomUser.m_UID2,window._RoomUser.m_UID3,window._RoomUser.m_UID4);
			
			if (!window.IsRandomRace(window.GetMyRaceID()) && (window.GetQueueTypeByID(window.FamilyCompleteID) != window.FAMILY_COMPLETE_TYPE))
			{
				window.find("UIController").LoadUI("UI_ARENA_TOP");
			}
			else
			{
				window.find("FAMILY_ROOM_LOGIC").del();
				window.find("CHAT_LOGIC").del();
			}
		}
		else
		{
			window.SetUIGameState(window.USER_UISTATE_GAME_COMMON);//2009年12月24日
			window.ClearAllLayersExcept(""+window.UILAYER+","+window.GAMELAYER);

			window.g_LoadingType = window.LOAD_TYPE_ROOMTOGAME;
			window.find("UIController").LoadUI("UI_LOADING");
			var _roomType = window.find("ROOM_LOGIC")._VRoom_Logic.m_RoomType;
			if(_roomType == 1)
			{
				window.find("LOADING_LOGIC")._VLoading_Logic.SetData(0,0,window.GetMyUID(),window._RoomUser.m_UID2,0,0);
			}
			else
			{
				window.find("LOADING_LOGIC")._VLoading_Logic.SetData(0,0,window.GetMyUID(),window._RoomUser.m_UID2,window._RoomUser.m_UID3,window._RoomUser.m_UID4);
			}
			
		}
		window.ClearRoomBtnUI();
		window.ClearOtherDragUI();

		window.g_probablyPos = window.POS_PROBABLY_GAME;
		window.find("CHAT_LOGIC").del();				//删除房间聊天
		window.find("ROOM_LOGIC").SetMyRoomShow(false);
		window.SetUIPos(window.POS_GAME);//需要在此处设置-要不聊天不行
		window.find("UIController").LoadUI("UI_CHAT_GAME");//加载游戏聊天
		window.find("CHAT_LOGIC").show = false;				//不显示游戏中聊天
		window._charShowFlag = false;
		window.find("UIController").LoadUI("UI_GAME"); //游戏中界面
		var _RoomType = window.GetRoomType();//房间类型 0未知 1网球竞技单 2网球竞技双 
		window.find("NAME_GCMap").RoomToGame();
		window.find("GAME_LOGIC").Init(_RoomType,window.GetMyUID(),window._RoomUser.m_UID2,window._RoomUser.m_UID3,window._RoomUser.m_UID4); 

		window.Tos_CheckLoverID(window.GetMyUID());//进游戏时发查询情侣消息
		window.Tos_CheckLoverID(window._RoomUser.m_UID2);
		window.Tos_CheckLoverID(window._RoomUser.m_UID3);
		window.Tos_CheckLoverID(window._RoomUser.m_UID4);
		
		//设置游戏模式 add by hanshuo 5.12.2009
		window.tennisGameStatic.SetGameStyle( (_RoomType-1)%2 + 1);
		
	}
//游戏->房间
	void GameToRoom()
	{
		printf("B# [UIPOS]游戏->房间:GameToRoom");

		window._RoomUser.del();
		window._IfCanShowVS = 0;
		printf("B# GameToRoom停止播背景音乐");
		window.PlayMusic(window.g_CSoundSet.GetBgMusic(window.eBgMusic_Hall));	
		window.ClearAllLayersExcept(""+window.UILAYER+","+window.GAMELAYER);
		window.find("GAME_LOGIC").del();		//删除游戏中界面
		window.find("GAME_OVER_LOGIC").del();	//删除结算界面
		window.find("CHAT_LOGIC").del();		//删除游戏中聊天

		window.g_probablyPos = window.POS_PROBABLY_ROOM;
		window.SetUIPos(window.POS_ROOM);
		window.find("UIController").LoadUI("UI_CHAT_ROOM");//房间聊天
		window._charShowFlag = true;
		window.find("UIController").LoadUI("UI_ROOM_BTN"); 
		window.find("ROOM_LOGIC").SetMyRoomShow(true);	//显示房间的界面
		window.find("ROOM_LOGIC")._VRoom_Logic.OnConnected_Init();//防止hfz没有把玩家的状态改回来而加
		window.find("NAME_GCMap").GameToRoom();
		
		//解除角色锁定
		//window.find("gameinput").SetDirOnUse(1);//0是关闭方向,1是开启方向
	//	window.find("NAME_GCMap").KeyBoardEnable(1);//0锁定解锁按键 1解除锁定
		window.find("NAME_GCMap").ResetGame();// 重置游戏 add by hanshuo
		window.find("VRoom_UserList_Logic_NAME").ADD();//移除房间中玩家列表的绑定

		//因为p2p太慢而被强行返回房间时,用来得到用户名称,在房间内显示,为空时表示不是这个原因
		var _name = window.find("GAMELAYER").find("NAME_GCMap").find("GameInterface").GetP2PShowUserName();
		if (_name != 0 && _name != "")
		{
			window.WriteChat7(1010,""+_name);//因[%0]P2P太慢返回房间！
		}

		window.SetUIGameState(window.USER_UISTATE_NOTINANY);//2009年12月24日

//		window.g_CArenaFunction.ClearGameShowTB();	//体力不对的情况
	}
//游戏->大厅
	void GameToHall(_IsAllEnd)
	{
		printf("B# [UIPOS]游戏->大厅:GameToHall()：window.g_ArenaJoinRoom:"+window.g_ArenaJoinRoom+",window.GetMyRaceID():"+window.GetMyRaceID()+",_IsAllEnd:"+_IsAllEnd);
		window.find("ArenaGCMap")._ArenaIO.del();
		window._RoomUser.del();
		window._IfCanShowVS = 0;
		printf("B# GameToHall停止播背景音乐");
		window.StopPlay();	//停止背景音乐
		window.ClearAllLayersExcept(""+window.UILAYER);
		window.find("CHAT_LOGIC").del();		//删除游戏中聊天
		window.find("ROOM_LOGIC").del();		//删除房间界面
		window.find("GAME_LOGIC").del();		//删除游戏中界面
		window.find("GAME_OVER_LOGIC").del();	//删除结算界面
		window.find("ARENA_TOP_LOGIC").del();		//删除活动排行榜

		window.g_probablyPos = window.POS_PROBABLY_HALL;
		window.find("HALL_LOGIC").AddHallFuckUser();	//添加大厅的快捷键用户
		window.find("HALL_LOGIC").ShowHallUI();		//显示大厅界面+加背景层+加按钮层
		window.MYDATA.SetDeskID(-1);//将房间号清空
		
		//任何地方到大厅均调此函数
		//参数:1训练->大厅 2已做过强训->大厅 3房间->大厅 4游戏->大厅
		window.LMH_AnyWhereToHall(4);
		
		if (window.g_ArenaJoinRoom && window.GetMyRaceID() > 0)
		{
			if ( !window.IsRandomRace(window.GetMyRaceID()) )
			{	
				var _fallowtime = window.GetFallowTimeByID(window.GetMyRaceID());
				var _time = toint(_fallowtime)/60;
				if (_time > 0)
				{
					printf("B# [UIPOS]游戏->大厅:GameToHall()：_fallowtime:"+_fallowtime);
					window.find("UIController").LoadDLG(535);//你有%0的休整时间，休息一下吧！
					window.find("DLGLAYER").find("VMB_ArenaOverTip_Logic").ReplaceData(""+_time+"分钟");
				}
				window.find("HALL_LOGIC").m_ArenaFallowTime.SetData(_fallowtime);
			}
		}
		window.g_ArenaJoinRoom = false;//是否为竞技加入房间

		window.SetUIGameState(window.USER_UISTATE_NOTINANY);//2009年12月24日
	}
//游戏->训练外
	void GameToTrain()
	{
		printf("B# [UIPOS]游戏->训练外:GameToTrain：g_TrainID:"+window.g_TrainID+",g_TrainType:"+window.g_TrainType);

		window.g_ArenaJoinRoom = false;//是否为竞技加入房间
		window._RoomUser.del();
		window._IfCanShowVS = 0;

		window.StopPlay();	//停止背景音乐
		window.ClearAllLayersExcept(""+window.UILAYER);
		window.find("CHAT_LOGIC").del();		//删除游戏中聊天
		window.find("ROOM_LOGIC").del();		//删除房间界面
		window.find("GAME_LOGIC").del();		//删除游戏中界面
		window.find("GAME_OVER_LOGIC").del();	//删除结算界面
		window.find("GameOver_TurnCards_Logic").del();			//删除翻牌界面

		window.find("HALL_LOGIC").AddHallFuckUser();	//添加大厅的快捷键用户
		window.find("HALL_LOGIC").ShowHallUI();		//显示大厅界面+加背景层+加按钮层
		window.MYDATA.SetDeskID(-1);//将房间号清空
	}
//大厅->训练中
	//参数：训练的ID
	void HallToTraining(id)
	{
		printf("B# [UIPOS]大厅->训练中:HallToTraining：id:"+id+",g_TrainType:"+window.g_TrainType);
		
		if (toint(id) == window.ID_FORCETRAIN) //是强制训练
		{
			window.g_IsForceTrain = true;//是否由强制训练进的训练场景
			window.SetUIGameState(window.USER_UISTATE_TRAIN_FORCE);//2009年12月24日
		}
		else
		{
			window.SetUIGameState(window.USER_UISTATE_TRAIN);//2009年12月24日
		}
		window.g_TrainID = id;//记下当前的训练ID
		
		window.find(window.DLGLAYER).delallchild();
		window.find(window.TOPLAYER).delallchild();
		window.find(window.POPLAYER).delallchild();
		window.find("VHall_HideUI_Logic_Name").show = false;
		
		window.g_LoadingType = window.LOAD_TYPE_HALLTOTRAINING;
		window.find("UIController").LoadUI("UI_LOADING"); //Loading界面
		window.find("UIController").LoadUI("UI_TRAINING"); //加载训练中的界面

		//训练的类型：0强制训练 1正常(训练选择) 2(训练中弹出)
		if (window.g_TrainType == 1 || window.g_TrainType == 0) 
		{
			window.HideAllLayersExcept(""+window.GAMELAYER+","+window.DLGLAYER+","+window.POPLAYER+","+window.TOPLAYER);
			window.find("CHAT_LOGIC").show = false;//训练中不显示聊天
			window._charShowFlag = false;
		
			window.find("GAMELAYER").load("$./../../../../../client/designerscript/Train/TrainMap.gml");
		}

		window.find("GAMELAYER").find("NAME_GCMap").CreateTrain(id);
	}

//训练中->大厅
	void TrainingToHall()
	{
		printf("B# [UIPOS]训练中->大厅:TrainingToHall：g_TrainID:"+window.g_TrainID+",g_TrainType:"+window.g_TrainType);

		window.find("TRAINING_LOGIC").del();	//删除训练中的界面
		window.find("TRAINOVER_LOGIC").del();	//删除训练结算界面
		window.find("PLAYOVER_DLG_LOGIC").del();//删除结算选择条
		window.find("GAMELAYER").delallchild();
		window.find("DLGLAYER").delallchild();
		window.find("TOPLAYER").delallchild();
		window.ShowAllLayers();


		window.g_probablyPos = window.POS_PROBABLY_HALL;
		var _temp = 1;
		if (window.g_IsForceTrain)//是否由强制训练进的训练场景
		{
			window.find("HALL_LOGIC").ShowHallUI();//显示大厅界面
			window.find("LOADING_LOGIC").del();//删除loading界面

			//[功能]进入大厅时调用
			//[参数]type:1强制训练完成后进大厅 2直接进大厅
			window.CXF_ShowHallUI(1);

			_temp = 5;
		}
		else
		{
			window.find("CHAT_LOGIC").show = true;//显示大厅的聊天
			window._charShowFlag = true;
			window.find("VHall_HideUI_Logic_Name").show = true;
			window.OnClick_BTN_GameHall();
		}
		window.g_TrainID = -1;//清空当前的训练ID
		window.g_IsForceTrain = false;//是否由强制训练进的训练场景

		//任何地方到大厅均调此函数
		//参数:1普通训练->大厅 2已做过强训->大厅 3房间->大厅 4游戏->大厅 5强制训练->大厅
		window.LMH_AnyWhereToHall(_temp);

		window.SetUIGameState(window.USER_UISTATE_NOTINANY);//2009年12月24日
	}

//训练中->训练外
	void TrainingToTrain()
	{
		printf("B# [UIPOS]训练中->训练外:TrainingToTrain：g_TrainID:"+window.g_TrainID+",g_TrainType:"+window.g_TrainType);
		
		window.find("TRAINING_LOGIC").del();	//删除训练中的界面
		window.find("TRAINOVER_LOGIC").del();	//删除训练结算界面
		window.find("PLAYOVER_DLG_LOGIC").del();//删除结算选择条
		window.find("GAMELAYER").delallchild();
		window.find("DLGLAYER").delallchild();
		window.find("TOPLAYER").delallchild();
		window.ShowAllLayers();
		if (window.g_IsForceTrain)//是否由强制训练进的训练场景
		{
			window.find("HALL_LOGIC").ShowHallUI();//显示大厅界面
		}
		if (window.g_TrainType == 2)
		{
			window.find("CHAT_LOGIC").show = true;//显示大厅的聊天
			window._charShowFlag = true;
			window.find("VHall_HideUI_Logic_Name").show = true;
		}
		window.g_TrainID = -1;//清空当前的训练ID
		window.g_IsForceTrain = false;//是否由强制训练进的训练场景

		window.SetUIGameState(window.USER_UISTATE_NOTINANY);//2009年12月24日
	}
	
	//[功能]大厅->录像中
	//[参数]_type:是那种录像 1录像 2观战
	//		_FileName:文件名
	void HallToVideo(_type,_FileName)
	{
		printf("B# [UIPOS]大厅->录像中[观战]:HallToVideo:_type:"+_type+",_FileName:"+_FileName);
		window.g_IsLookOrReplay = _type;

//		//[功能]判断是否要提示取消报名
//		if (window.JudgeIsNeedCancelQueue(window.CANCELRACE_LOOKAT))
//		{
//			printf("B# JudgeIsNeedCancelQueue-HallToVideo():"+_FileName);
//			window.g_JionRoomParamArena = _FileName;
//			return;
//		}
		
//		if (window.g_IsLookOrReplay == window.VIDEO_TYPE_LOOKAT)
//		{
//			//临时做法 - 2010年1月12日0:28
//			window.find("RANDGAME_LOGIC").del();
//			window.SetRaceStateByID(window.RANDOM_DOUBLE,window.g_QUEUE_CANCEL);
//		}

		window.HallToVideoEx(_type,_FileName);
	}
	
	//[功能]大厅->录像中
	//[参数]_type:是那种录像 1录像 2观战
	//		_FileName:文件名
	void HallToVideoEx(_type,_FileName)
	{
		printf("B# [UIPOS]大厅->录像中[观战]:HallToVideoEx:_type:"+_type+",_FileName:"+_FileName);

		if(window.VIDEO_TYPE_DEFAULT == _type)
		{
			//观看录像，向服务器发送消息
			//参数：用户ID,任务ID,任务描述
			var _Param = ""+window.GetMyUID()+","+window.CLIENT_8_PLAY_VIDEO+","+window.CLIENT_8_PLAY_VIDEO_STR+",2";
			window.Tos_AddEvent(_Param);
		}

		window.find("GAMEVIDEO_LOGIC").del();
		window.find("GAMELAYER").find("GAMEVIDEO_SCENE").del();

		window.HideAllLayersExcept(""+window.GAMELAYER+","+window.POPLAYER+","+window.DLGLAYER+","+window.TOPLAYER);
		window.find("VHall_HideUI_Logic_Name").show = false;

		window.g_LoadingType = window.LOAD_TYPE_HALLTOVIDEO;
		window.find("UIController").LoadUI("UI_LOADING"); //Loading界面

		window.find("UIController").LoadUI("UI_GAMEVIDEO"); //加载录像
		window.find("GAMEVIDEO_LOGIC").SetData(_FileName);//设置录像路径
	}

	//录像中->大厅
	void VideoToHall()
	{
		printf("B# [UIPOS]录像中->大厅:VideoToHall:");
		
		window.PlayMusic(window.g_CSoundSet.GetBgMusic(window.eBgMusic_Hall));	

		window.find("BGLAYER").show=true;
		window.find("UILAYER").show=true;
		window.find("BTNLAYER").show=true;
		window.find("DLGLAYER").show=true;
		window.find("TOPLAYER").show=true;
		window.find("VHall_HideUI_Logic_Name").show = true;

		//隐藏发球箭头
		//window.find("GAMELAYER").find("NAME_GCMap").find("self").parent.Serve_BALL.show = false;
		window.find("GAMELAYER").find("NAME_GCMap").find("userFinder").RunScript("All.Serve_BALL.show("+false+")");
		window.find("POPLAYER").find("GAMEVIDEO_LOGIC").del();
		window.find("GAMELAYER").find("GAMEVIDEO_SCENE").del();

		window.g_probablyPos = window.POS_PROBABLY_HALL;
		
		printf("B# [UIPOS]录像中->大厅:VideoToHall:window.g_IsLookOrReplay:"+window.g_IsLookOrReplay);

		if(window.g_IsLookOrReplay == window.VIDEO_TYPE_LOOKAT)//观战
		{
			//退出观战
			var _param = ""+window.GetMyUID()+","+window.g_LookAtRoomID;
			window.Too_ExitLookerOn(_param);
		}
	}

	//大厅->自由训练
	void HallToFreeTrain()
	{
		printf("B# [UIPOS]大厅->自由训练:HallToFreeTrain:");
		//[功能]判断是否要提示取消报名
		if (window.JudgeIsNeedCancelQueue(window.CANCELRACE_FREETRAIN))
		{
			printf("B# JudgeIsNeedCancelQueue-HallToFreeTrain():");
			return;
		}

		var _aiid = window.GetTrainAIID(window.g_TrainID);
		window.HallToFreeTrain_Ex(_aiid);
	}

	//大厅->自由训练
	//[参数]aiid:AI的ID
	void HallToFreeTrain_Ex(aiid)
	{
		printf("B# [UIPOS]大厅->自由训练:HallToFreeTrain_Ex:aiid:"+aiid);
		
		window.find(window.TOPLAYER).delallchild();
		window.find(window.DLGLAYER).delallchild();
		window.find(window.POPLAYER).delallchild();
		window.find(window.GAMELAYER).delallchild();
		window.OnClick_BTN_RoleModel(1);
		window.ClearHallBtnUI();
		window.ClearOtherDragUI();
		window.find("VHall_HideUI_Logic_Name").show = false;
		window.find("CHAT_LOGIC").show = false;
		window._charShowFlag = false;
		window.HideAllLayersExcept("GAMELAYER,UILAYER,DLGLAYER,POPLAYER,TOPLAYER");
		
		window.g_LoadingType = window.LOAD_TYPE_HALLTOAI;
		window.g_probablyPos = window.POS_PROBABLY_TRAIN;
		window.find("UIController").LoadUI("UI_LOADING"); //Loading界面

		set window.find(window.GAMELAYER)
		{
			new VFreeTrain_Logic
			{
				_GCMap.InitAIGame(aiid);
			}
		}
	}

	//自由训练->大厅
	void FreeTrainToHall()
	{
		printf("B# [UIPOS]自由训练->大厅:FreeTrainToHall:window.g_TrainID:"+window.g_TrainID);
		
		window.PlayMusic(window.g_CSoundSet.GetBgMusic(window.eBgMusic_Hall));	
		
		window.find(window.POPLAYER).delallchild();
		window.find("GAME_LOGIC").del();
		window.find("GAME_OVER_LOGIC").del();

		window.g_probablyPos = window.POS_PROBABLY_HALL;
		window._IfCanShowVS =0;
		window.ShowAllLayers();
		window.find(window.GAMELAYER).delallchild();
		window.find("VHall_HideUI_Logic_Name").show = true;
		window.find("CHAT_LOGIC").show = true;
		window._charShowFlag = true;
		if (window.GetUIGameState() == window.USER_UISTATE_AI_RAND)
		{
			window.OnClick_BTN_GameHall();
		}
		else
		{
			window.OnClick_BTN_Train();
		}
		
		window.OnClick_BTN_RoleModel();

		window.SetUIGameState(window.USER_UISTATE_NOTINANY);//2009年12月24日
		window.find("VRoleModel_Info_Logic_Name_AIGCMap").del();
	}
	//家族大厅->家族房间
	void FamilyToRoom()
	{
		printf("B# [UIPOS]家族大厅->家族房间:FamilyToRoom()");

		window.find("HALL_LOGIC").DelHallFuckUser();	//删除大厅的快捷键用户
		window.ClearAllLayersExcept(window.UILAYER);
		window.find("CHAT_LOGIC").del();
		window.find("ROLEMODEL_LOGIC").del();
		window.find("VHall_HideUI_Logic_Name").del();
		window.ClearHallBtnUI();

		window.g_probablyPos = window.POS_PROBABLY_ROOM;
		window.g_LoadingType = window.LOAD_TYPE_FAMILYHALLTOFAMILYROOM;
		window.find("UIController").LoadUI("UI_LOADING");
		window.find("UIController").LoadUI("UI_FAMILYROOM");
		window.find("UIController").LoadUI("UI_CHAT_FAMILY");
		window.SetUIPos(window.POS_FAMILYROOM);
		window.FamilyCompleteID = window.FAMILY_ACTIVITY_ID;
		var _Param = ""+window.GetMyUID()+","+window.GetMyUID()+","+window.FAMILY_ACTIVITY_ID;
		window.Tos_ApplyArenaRace(_Param);
		
	}
	//家族房间->家族大厅
	void RoomToFamily()
	{
		printf("B# [UIPOS]家族房间->家族大厅:RoomToFamily()");

		window.ShowAllLayers();
		window.ClearAllLayersExcept(window.UILAYER);
		window.find("HALL_LOGIC").AddHallFuckUser();	//添加大厅的快捷键用户
		
		window.find("FAMILY_ROOM_LOGIC").del();
		window.find("CHAT_LOGIC").del();

		window.g_probablyPos = window.POS_PROBABLY_HALL;
		window.find("HALL_LOGIC").ShowHallUI();		//显示大厅界面+加背景层+加按钮层
		window.SetUIPos(window.POS_FAMILY);
		window.F_Family_enter(window.FAMILY_ENTER_IN);
		window.g_OnConfirm_QuitWait(window.FAMILY_ACTIVITY_ID);
		window.FamilyCompleteID = 0;
	}
	//游戏->家族房间
	void GameToFamilyRoom()
	{
		printf("B# [UIPOS]游戏->家族房间:GameToFamilyRoom()");

		window._RoomUser.del();
		window._IfCanShowVS = 0;
		printf("B# GameToRoom停止播背景音乐");
		window.PlayMusic(window.g_CSoundSet.GetBgMusic(window.eBgMusic_Hall));	
		window.ClearAllLayersExcept(""+window.UILAYER);
		window.find("ROOM_LOGIC").del();		//删除房间界面
		window.find("GAME_LOGIC").del();		//删除游戏中界面
		//window.find("GAME_OVER_LOGIC").del();	//删除结算界面
		window.find("CHAT_LOGIC").del();		//删除游戏中聊天

		var _familyActivityState = window.GetFamilyActivityState()
		if(_familyActivityState == window.g_QUEUE_CANCEL)
		{
			window.RoomToFamily();
		}
		else
		{
			window.g_probablyPos = window.POS_PROBABLY_ROOM;
			window.SetUIPos(window.POS_FAMILYROOM);
			window.find("UIController").LoadUI("UI_FAMILYROOM");
			window.find("UIController").LoadUI("UI_CHAT_FAMILY");
		}
		window.SetUIGameState(window.USER_UISTATE_NOTINANY);//2010年07月01日
	}
}

