// modify by hanshuo   10.29.2009
import("$./../../../game/GameReplay.gml");
import("$./../../../game/GameEvent.gml");
import("$./../../../designerscript/Guide/ReckonToTrain.gml");

class GameGCMap GCMap
{
//	alert("GameGCMap!");
	printf("B# [场景BUG]:GameGCMap:OnCreated(1)");
	void OnDelete()
	{
		printf("B# [场景BUG]:GameGCMap:OnDelete()");
		EndSaveRecord()
	}
	
	void OnCreated()
	{
		printf("B# [场景BUG]:GameGCMap:OnCreated(2)");
	}

	SetRoomType( 1);
	SetGameID(window.GetMyRoomID());							// 得到DeskID
	size="100%,100%"; 
	name="NAME_GCMap";
	load("$./../../../game/user.gml");
	load("$./../../../game/GameClient.gml");
	group=1;
	var init_plugin = false;
	var ask_station = false;
	
//	alert("GameGCMap!!");

	var Serve_receive_BALL = new fmodel //接发球区域提示SXD
	{   
		name = "Serve_receive_BALL";
		src = "$./../../../effect/effect/kejifanwei.v3f";
		setShader("add_texture.fx");
		scale = "7,1,4.5";
		show = false;
	}

	new EventLog_T	// add by hanshuo	10.22.2008
	{
		name = "eventLog_t";
	}

	new UserFinder	// add by hanshuo	10.22.2008
	{
		name = "userFinder";
	}

	new SMA			// add by hanshuo	10.22.2008
	{
		name = "sma";
		Init("EventState.mdb", 22);	// add by hanshuo	10.27.2008		// 为sma塞入初始化状态
		UseLog( 1);
	}

//	alert("GameGCMap!!!");
//		staticvar __PSAVEGAME=new savegameclass{savegameclass(parent);};// 游戏录像

//	alert("GameGCMap!!!!");
	new GameInterface{name = "GameInterface";}
	new TrainStat{name = "GameStat";}
	new item
	{
		name = "WaitingRoom";
		new RequestMonitor
		{
			SetNetMsgMethod(2);										//定制发消息类型;1使用too()发消息，2使用tos()发消息
			SetMonitorTable(window.GAMEUI, window.REQUEST_ROOM);	//设置需要监视的数据表
		}
	}

	//P2P
//		var _p2p=new p2pManage//这是p2p的管理器
//		{
//			name = "P2PManager";
//			void Init(i)
//			{
//				//alert("p2plink:"+window.GAMESVP2PIP+" window.GameUPort:"+window.GameUPort);
//				SetUserId(i);
//				Login( window.GAMESVP2PIP,window.GameUPort );//先要连接服务器
//				var channelName = window.MYDATA.GetChannel();
//				if ( window.g_ArenaJoinRoom )
//				{
//					var arenaSvID = window.find("VmlArenaDesk").parent.GetSvID();
//					channelName = window.GetSevNameByID(arenaSvID);
//				}
//				var p2pGroupName = channelName + "GSMAP" + window.GetMyRoomID();
//				print("p2p加入的组名字:"+p2pGroupName);
//				JoinRoom(p2pGroupName);//加入的组
//			}
//
//			void OnLoginErr(r)
//			{
//				print("无法连接p2p服务器:"+r);
//			}
//		}
//	alert("GameGCMap Fuck!!!");
	new MapCtrl
	{
//			SaveRecord = true;
//			alert("?");
		name = "mapCtrl"; 
		ToRoomMap( window.GetMyGameMapID() );
		
		//游戏的地图加载完毕后调用
		void OnGameMapLoaded()
		{
			window._IfCanShowVS += 1;
			printf("B# 游戏的地图加载完毕后调用,显示分屏界面："+window._IfCanShowVS);
			if (window._IfCanShowVS == 2)
			{
				window.find("GAME_LOGIC").TimerBegin();	//显示VS界面
			}		
		}

		//房间的地图加载完毕后调用
		void OnRoomMapLoaded(){}
	};

	var vmlBall = new VmlGCBall{};
	Fov("0.55");
	window.eye.near=0.1;

	new item
	{
		new CameraMg
		{
			name="mycamera"; 
			var _replayclass="ReplayCamera";// 使用录像摄像机
			UIInit( window.GetMyUID());
			SetMyType(5);
		}
	}
	//镜头的移动-yxf
	var _CCameraTrack = new CCameraTrack{}
	//人到齐了可以开始游戏了
	void MapStartGame()
	{
		new VmlGCNPC{LoadNPC();}
	}

	//镜头开始移动-yxf
	void BeginMove(file,time)
	{
		find("mycamera").SetAvailable(0) //0关闭 1打开
		_CCameraTrack.Begin(file,time);
		timer(time,"StopMove","GameGCMap_BeginMove_TimerName");
	}

	//镜头停止移动 - yxf
	void StopMove()
	{
		find("mycamera").SetAvailable(1) //0关闭 1打开
	}
	
	void SetAllRoleStation()
	{
		//sleep(200)为临时解决进入GM房间站位问题有可能背对摄像机
		//若数据同步时间超过200ms站位将依然有问题
		//暂无好的解决方法
		//add by chenjihui
		//同Web版撮合返回房间一样的解决方法
		sleep(200);
		var _VNet2DBTable=new VNet2DBTable
		{
			var row = new VNet2DBRow{};
			void GetData(userid)
			{
				row.InitByInt( window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_UID,userid);
				if ( row.IsReady() )
				{
					row.SetInt(window.M_G_SERVER_USERDT_RULESTATION,5);
				}
			}
		};
		var sql = "SELECT * FROM userdt WHERE did="+window.GetMyRoomID();
		printf("B# SetAllRoleStation-sql:"+sql);
		_VNet2DBTable.Select( window.M_G_SERVER,sql);
		_VNet2DBTable.ReadData("GetData",""+window.M_G_SERVER_USERDT_UID);
		_VNet2DBTable.del();
	}

	//显示房间
	void ShowRoom()
	{
		printf("B# [场景BUG]>>1>>GCMAP-显示房间ShowRoom:window.g_ArenaJoinRoom:"+window.g_ArenaJoinRoom);
		if (!window.g_ArenaJoinRoom)//非竞技-竞技没有房间界面
		{
			printf("B# [场景BUG]>>2>>GCMAP-显示房间");
			//显示房间界面
			window.find("ROOM_LOGIC")._VRoom_Logic.show = true;
			window.find("LOADING_LOGIC").del();//删除loading界面
			window.find("CHAT_LOGIC").show = true;//显示聊天
			window._charShowFlag = true;
		}
	}

	//自己站位好了 程序调用
	void RoleStationOver(userid)
	{
		printf("B# RoleStationOver:"+userid);
		ask_station=false;
		printf("B# [场景BUG]RoleStationOver:自己站位好了:"+userid);
		SetCamera(window.GetMyUID());
		timer(1500,"ShowRoom");
	}

	//检查站位是否有返回
	void CheckAskStation()
	{
		printf("B# CheckAskStation");
		if (ask_station==false) 
		{
			printf("B# ask_station==false");
			return;
		}
		ask_station=false;
		GetStation();
	}

	void SetCamera(userid)
	{
		var id = toint(userid);
		find("mycamera").UIInit(id);
		var row = new VNet2DBRow{};
		row.InitByInt( window.TENNIS_GAME,window.MAPINFO,window.TENNIS_GAME_MAPINFO_MAPID,window.GetMyGameMapID() );
		if ( row.IsReady() )
		{
			var cameraid = row.GetData( window.TENNIS_GAME_MAPINFO_ROOMCAMERA );
			find("mycamera").SetMyType(cameraid);
		}
		row.del();
	}

	//得到自己的站位
	void GetStation()
	{
		var row = new VNet2DBRow{};
		row.InitByInt( window.M_G_SERVER,window.DESKDT,window.M_G_SERVER_DESKDT_DESKID,window.GetMyRoomID() );
		if ( row.IsReady() )
		{
			printf("B# window.g_ArenaJoinRoom:"+window.g_ArenaJoinRoom+"设置站位!")
			var masterid = row.GetData(window.M_G_SERVER_DESKDT_MASTERID);
			if (masterid == 0)
			{
				SetStation(rand(4)+1);
				parent.find("mycamera").Reset();
			}
			else
			{
				if ( window.g_ArenaJoinRoom == true || masterid == window.GetMyUID() || masterid == 0 )
				{//设置人物站位
					SetStation(1);
					parent.find("mycamera").Reset();
				}
				else
				{//询问人物站位
					printf("B# 询问人物站位");
					ask_station=true;
					AskStation();
					timer(2000,"CheckAskStation");
				}
			}
		}
		row.del();
	}

	//自己初始化后程序调用脚本的函数
	var _selfinit = false;
	void SelfInit(userid)
	{
		printf("B# 自己初始化后:SelfInit:"+userid+" init:"+_selfinit);
		SetCamera(userid);
		SetAllRoleStation();
		if ( _selfinit == false )
		{
			GetStation();
			_p2p.Init(userid);
		}
		_selfinit = true;
	}

	//chat初始化后程序调用脚本的函数
	void ChatInit(userid)
	{
		SetAllRoleStation();
	}

	//由脚本调用 房间进入游戏时
	void RoomToGame()
	{
		printf("B# GCMap:RoomToGame");
		find("mapCtrl").ToGameMap( window.GetMyGameMapID() );
		if ( init_plugin == false )
		{
			init_plugin = true;
		}
		//设置状态机
		find("IAMISSELF").parent.find("FSM").clearset(1);
		find("IAMISAI").parent.find("FSM").clearset(1);
		find("GameInterface").SetGameState(2);
		SetAllRoleShow(0);
	}

	//人物返回房间
	void RoleGameToRoom()
	{
		// 一场结束后的事件	 add by hanshuo 5.16.2010
		window.GameEvent_GameOver();
		RefreshGameToRoomData();
		find("GameStat").ShowTrackInfo();
		find("GameStat").GameToRoom();
		SetStation(-1);
	}

	//由脚本调用 游戏返回房间
	void GameToRoom()
	{
		SetAllRoleStation();
		find("mapCtrl").ToRoomMap( window.GetMyGameMapID() );
		find("self").parent.find("Serve_BALL").show = false;//对方强退后，隐藏发球标志
		find("userFinder").RunScript("All.Serve_BALL.visible(false)");	// 我的所有对手会调用此函数
		find("Serve_receive_BALL").visible = false;
	}

	//换房间的地图
	void ChangeRoomMap()
	{
		var _VNet2DBRow = new VNet2DBRow{};
		_VNet2DBRow.InitByInt( window.TENNIS_GAME,window.MAPINFO,window.TENNIS_GAME_MAPINFO_MAPID,window.GetMyGameMapID() );
		if ( _VNet2DBRow.IsReady())
		{
			var cameraid = _VNet2DBRow.GetData( window.TENNIS_GAME_MAPINFO_ROOMCAMERA );
			find("mycamera").SetMyType(cameraid);
			window.g_RoomMap = _VNet2DBRow.GetData( window.TENNIS_GAME_MAPINFO_ROOMMAPID);
			find("mapCtrl").ToRoomMap( window.GetMyGameMapID() );
			find("GCBall").find("RegionTest").SetCurrMap( window.GetMyGameMapID() );
			find("GCBall").find("RegionTest").LoadRegion(2);
		}
		_VNet2DBRow.del();

		SetAllRoleShow(1);
	}

	/* 录像系统 add by hanshuo*/
	// 保存录像开始
	void BeginSaveRecord()
	{
		printf("B# [观战]GameGCMap保存录像开始.BeginSaveRecord()\n");
		window.g_AlreadySaveVideo = true;
		staticvar __PSAVEGAME = new savegameclass{savegameclass(parent);};
//			__PSAVEGAME.init3prcid(7368563);
		// 保存人
		find("userFinder").RunScript( "All.Action.SaveRecord(1)");
		// 保存人的影子
		find("userFinder").RunScript( "All.playerShadow.SaveRecord(1)");
		// 保存人的箭头
		find("userFinder").RunScript( "All.Serve_BALL.SaveRecord(1)");
		// 保存人的光圈
		//find("userFinder").RunScript( "All._SXD.SaveRecord(1)");
		find("IAMISSELF").parent.find("_SXD").SaveRecord = 1;
		// 保存人的昵称
		//find("userFinder").RunScript( "All.nkname.SaveRecord(1)");

		// 保存球
		find("Ball").SaveRecord = 1;
		// 保存球的影子
		find("GCBall").find("shadow").SaveRecord = 1;
		// 保存镜头
//		find("mycamera").SaveRecord = 1;
		// 保存场景
		find("mapCtrl").SaveRecord = 1;
		// 保存界面
		find("GameInterface").SaveRecord = 1;
		__PSAVEGAME.start();


		//2009年12月18日 观战简单测试 yxf 
		//window.find("NAME_GCMap").somebodyLookUs();
	}

	// 停止保存录像
	void EndSaveRecord()
	{
		printf("B# [观战]GameGCMap保存录像结束.EndSaveRecord()\n");
		// 存储
		__PSAVEGAME.gameover();//游戏录像,谢成鸿
		__PSAVEGAME.del();
	}
	/* 录像系统 END*/
	
	//点选玩家模型用 add by yxf 2009年10月10日
	// 拾取管理器
	// 调用PickTryPicking()执行拾取。
	var __MgrPick = new PickingMgr
	{
		name="MgrPicking";
		PickInit(200.0,
				 0, 0, window.width, window.height,
				 0, 0 // 从引擎获取
				 );
		PickSwitchState(1);

		var m_CurrItem = 0;	//
	}
	// 触发拾取
	new item
	{
		size = "100%,100%";
		var __LastX = window.mousex;
		var __LastY = window.mousey;
		var __IsIn = 0;
		
		void OnMouseOver()
		{ __IsIn = 1; }
		
		void OnMouseOut()
		{ __IsIn = 0; }
		
		void OnUpdate()
		{
			if ((window.mousex - __LastX != 0) || (window.mousey - __LastY != 0))
			{
				//print("【Pick】script: " + window.mousex + ", " + window.mousey);
				parent.__MgrPick.PickTryPicking(1, 0);
				__LastX = window.mousex;
				__LastY = window.mousey;
			} // end if   
		}
		
		void OnMouseDownL()
		{ parent.__MgrPick.PickTryPicking(0, 11); }
		
		void OnMouseDownR()
		{ parent.__MgrPick.PickTryPicking(0, 12); }
		
		void OnMouseUpL()
		{ parent.__MgrPick.PickTryPicking(2, 11); }
		
		void OnMouseUpR()
		{ parent.__MgrPick.PickTryPicking(2, 12); }    
	}
	//end 点选玩家模型用

	// 从聊天中过滤出房间动作信息 add by hanshuo
	void CallBack_NewChat( str)
	{
		// 如果在游戏中, 直接忽略
		if( GetRoomState() == 4)
			return;

		var rs = 0;
		var rs = roomActFilter.FindKey( str);
		var _VNet2DBRow = new VNet2DBRow{};
		_VNet2DBRow.InitByString( window.M_G_CLINET,window.ROOMACT,window.M_G_CLINET_ROOMACT_DESCRIPTION,rs);
		if ( _VNet2DBRow.IsReady())
		{
//			find("IAMISSELF").parent.find("FSM").clearset( _VNet2DBRow.GetData( window.M_G_CLINET_ROOMACT_ID));
			find("IAMISSELF").parent.find("FSM").clearset( _VNet2DBRow.GetData( window.M_G_CLINET_ROOMACT_ID), window.g_ActBugleLimit_Time);

		}
		_VNet2DBRow.del();
	}

	// add by hanshuo  游戏中落点提示
	var dropEffect1 = new fmodel
	{
		name = "dropEffect1";
		src="$./../../../effect/effect/luodian.v3f";	
//		pos = "0, 0.1, 0";
		visible = false;
	}

	var dropEffect2 = new fmodel
	{
		name = "dropEffect2";
		src="$./../../../effect/effect/luodian.v3f";	
//		pos = "0, 0.1, 0";
		visible = false;
	}

	// 最后new这个 有个未知的bug, 注意保持队形
	var roomActFilter = new DirtyFilter
	{
		name = "RoomActFilter";
		NoCase= true;
		// 初始化
		var key = window.tennisGameStatic.GetAllStringData( window.M_G_CLINET, window.ROOMACT, window.M_G_CLINET_ROOMACT_DESCRIPTION);

//			alert( key); // 哈哈,^^,加油
		//var _array = sysarray( 1000);
		var _num = window.GetSplitCount(key, ",");
		var _array = window.SplitStr2( key, ",", _num);

		// 使用递归函数, 为了规避用while的一个未知问题
		void __AddKey( _i)
		{
			//alert("__AddKey: " + _i);
			if( _i == _num)
				return;

			if( -1 == toint( _array[_i]))
			{
				break;
			}
			AddKeyNoCase( _array[_i]);
			//alert("AddKeyNoCase: " + _array[_i]);
			__AddKey( _i + 1)
		}

		__AddKey( 0);
	}
};