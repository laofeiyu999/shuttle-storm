import("$./../../interface/logic/room/aimapclass.gml");
import("$./AIImport.gml");
import("$./../../interface/Logic/Room/ClassDef_UserModelName.gml");

class AIGCMap GameAIMap
{

	window.g_AllPlayersNum = 0;
	window.g_AllPlayersUID[0] = 0;
	window.g_AllPlayersUID[1] = 0;
	window.g_AllPlayersUID[2] = 0;
	window.g_AllPlayersUID[3] = 0;

	// 初始化玩家角色
	void ProgramCall_AIScriptInit_Self()
	{
		var mapID = 2;
		var roleStamina = window.GetRoleStamina();
		find("mapCtrl").LoadMap( mapID);
		window.SetMyGameMapID(mapID);
		staticvar tmp = new VmlGCSelf
		{
			find("self").InitID_Test( window.GetMyUID());
			SetUserId(window.GetMyUID());		
			SelfInit( window.GetMyUID());
		}

		SetAllRoleShow( 0);

		find("mycamera").UIInit(window.GetMyUID());
		find("mycamera").SetMyType(1);

		timer(100, "GameInit");
//		timer(10000, "GameInit2");

		set window.find("GAMELAYER")
		{
			window.find("VRoleModel_Info_Logic_Name_"+window.GetMyUID()).del();
			new VRoleModel_Info_Logic
			{
				SetName(window.GetMyUID());
				SetUserName(window.GetMyName());
			}
		}
		window.SetRolemodelInfoShowState(false);
	}

	void OnDelete()
	{
		window.find("VRoleModel_Info_Logic_Name_"+window.GetMyUID()).del();
		window.g_AllPlayersNum = 0;
		window.g_AllPlayersUID[0] = 0;
		window.g_AllPlayersUID[1] = 0;
		window.g_AllPlayersUID[2] = 0;
		window.g_AllPlayersUID[3] = 0;
	}

	// 初始化AI角色
	void ProgramCall_AIScriptInit_User( userID)
	{
		var _VNet2DBRow = new VNet2DBRow{};
		_VNet2DBRow.InitByInt( window.M_G_CLINET,window.AIUSER,window.M_G_CLINET_AIUSER_AIID,userID);
		if ( _VNet2DBRow.IsReady())
		{
			staticvar tmp = new VmlGCAI
			{
				window.tennisGameStatic.DynamicNew( this, _VNet2DBRow.GetData( window.M_G_CLINET_AIUSER_AIGMLCLASS) );
				find("self").InitID_Test( userID);
				SetUserId( userID);
				SelfInit( userID);
				ChatInit( userID);
			};
			set window.find("GAMELAYER")
			{
				window.find("VRoleModel_Info_Logic_Name_"+userID).del();
				new VRoleModel_Info_Logic
				{
					left = ;bgcolor = "#ffff00";
					SetName(userID);
					SetUserName("   "+window.GetNameByUID(userID));
				}
			}
		}
		_VNet2DBRow.del();		
		
		SetAllRoleShow( 0);

		window.find("UIController").LoadUI("UI_GAME"); //游戏中界面
		window.find("GAME_LOGIC").Init( 1, window.GetMyUID(), userID); 
		window.find("GAME_LOGIC").SetGameNum(window.GAMENUM_3); //需要设置局制 2009年12月12日 yxf
		window._IfCanShowVS +=1;
	}

	// AI部分的基础初始化, 只涉及底层的构建, 游戏逻辑相关的初始化还没有开始
	void GameInit()
	{
		SignUpHost();
		StartGame_AI();
//		KeyBoardEnable( 0);
//		ServeBallReady( 0, 3, 1);
//		ServeBall( );
	}
	void FalseMapLoadEnd()
	{
		find("userFinder").RunScript("Me.self.StartGame()");
		window.find("GAME_LOGIC")._VGame_Playing_Logic.End_ShowBegin();
	}

	// 训练结束
	// 参数: 胜利队伍	1: 首先发球的队伍( 目前是玩家队伍)  2: 与1相对
	void ProgramCall_GameEnd_AI( winTeam)
	{
		// 通知界面游戏结束
		//find("GameInterface").SetGameState( 4);

		printf("B# 客户消息测试 winTeam:"+winTeam+",GetMyTeamID:"+window.GetGameTeamByUID(window.GetMyUID()));
		var bWin = 0;
		if (winTeam == window.GetGameTeamByUID(window.GetMyUID()))
		{

			//参数：用户ID,任务ID,任务描述
			/*
			window.GetSerType();  得到在哪个频道
			var G_SERVERTYPE_1_YOUNG			= 1;		//1新手赛
			var G_SERVERTYPE_2_QUALIFICATION	= 2;		//2资格赛
			var G_SERVERTYPE_3_TOUR				= 3;		//3巡回赛
			var G_SERVERTYPE_4_GOLD				= 4;		//4黄金赛
			var G_SERVERTYPE_5_MASTERS			= 5;		//5大师赛
			var G_SERVERTYPE_6_SLAM				= 6;		//6大满贯
			var G_SERVERTYPE_7_PRIX				= 7;		//7大奖赛
			*/
			if (window.GetUIGameState() == window.USER_UISTATE_AI_FREETRAIN)  //如果玩家的状态是自由训练
			{
				if (window.GetSerType()== window.G_SERVERTYPE_1_YOUNG) //新手频道
				{
					var _Param = ""+window.GetMyUID()+","+window.CLIENT_6_FREETRAIN_WIN+","+window.CLIENT_6_FREETRAIN_WIN_STR+",1";
					window.Tos_AddEvent(_Param);
				}
				if (window.GetSerType()== window.G_SERVERTYPE_2_QUALIFICATION)//资格赛频道
				{
					var _Param = ""+window.GetMyUID()+","+window.CLIENT_10_QUALIFICATIONS_WIN+","+window.CLIENT_10_QUALIFICATIONS_WIN_STR+",1";
					window.Tos_AddEvent(_Param);
				}
			}
			
			
			bWin = 1;
		}
		timer( 1000, "DestroyMap("+bWin+")");
	}

	// 参数: 我是否胜利了 1: 胜利  0: 败北
	void DestroyMap( isWin)
	{
		parent.DestroyMap( isWin);
	}
};