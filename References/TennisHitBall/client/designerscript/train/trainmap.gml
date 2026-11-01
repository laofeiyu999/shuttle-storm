//bgcolor = "#0";
//import("$./../../mdb/dbdef_ui.gml");
//import("$./../game/TextureID.gml");
//var tstatic = new TStatic{ SetGameRoot("$./../../client/")};
//new img3d{};
//mainDevice.TexturePath( window.SenceTextureID,"$./../../client/scene/texture/" );
//mainDevice.TexturePath( window.ClientTextureID,"$./../../client/texture/" );
//mainDevice.TexturePath( window.NPCTextrueID,"$./../../client/npc/texture/");
//
//load("$./MoveTrain/TrainReplayMap.gml");

var map = new GCMap
{
	SetRoomType( 2);
	name="NAME_GCMap"; group=1;
	size="100%,100%";
	load("$./../../game/user.gml");
	load("$./../../game/GameClient.gml");
	load("$./TrainCurrencySect_Def.gml");

	void OnCreated()
	{
		printf("E# NAME_GCMap OnCreated");
	}
	void OnDelete()
	{
		printf("E# NAME_GCMap OnDelete");
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
		Init( "EventState.mdb", 22);
	}

	void MapAniStart(){_MapTimeCtrl.gamestart();}
	new MapCtrl
	{
		name = "mapCtrl";

		//训练的地图加载完毕后调用
		void OnGameMapLoaded()
		{
			parent.find("gameTrain").GameEvent(6);
		}
	};

	var vmlBall = new VmlGCBall
	{
		find("Ball").show = true;
		find("ifuser").SetUserId( window.GetMyUID() );
	};

	new VmlGCSelf
	{
		SetUserId( window.GetMyUID());
		find("ifuser").SetUserId( window.GetMyUID() );
	};

	//gameshow
	new GameInterface{name = "GameInterface";SetGameState(2);}

	Fov("0.55");

	new item
	{
		new CameraMg
		{
			name="mycamera";
			SetOrigDir(0,-0.35,-1);
			UIInit(window.GetMyUID());
			SetMyType(1);
		}
	}

	//设置RegionTest的状态
	void SetRegionTest()
	{
		var row = new VNet2DBRow{};
		row.InitByInt( window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_UID,window.GetMyUID() );
		if ( !row.IsReady() )
		{
			row.del();
			return;
		}
		row.SetInt( window.M_G_SERVER_USERDT_RULESTATION,1 );
		row.UpdateEnd();
		row.del();
		find("IAMISSELF").parent.find("RegionTest").SetStation();
	}

	//设置人物状态
	void SetRoleState()
	{
		find("IAMISSELF").parent.find("FSM").clearset(1);

		var row = new VNet2DBRow{};
		row.InitByInt( window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_UID,window.GetMyUID() );
		if ( !row.IsReady() )
		{
			row.del();
			return;
		}
		row.SetInt( window.M_G_SERVER_USERDT_GAMESTATION,1 );
		row.UpdateEnd();
		row.del();
	}

	new SG_fmodel
	{
		SetFilePath("$./../../effect/effect/");
		SetSoundPath("$./../../effect/sound/");
		del();
	}

	//创建一个训练
	void CreateTrain(trainID)
	{
		printf("E# 创建训练: " + trainID);
		window.TStatic.SetReplaySound(0);//关闭音效，防止Loading时有杂音
		find("gameTrain").del();//删除上一个训练
		parent.find("Name_ReplayMap").del(); //删除录像

		parent.load("$./TrainReplayMap.gml");

		switch (trainID)
		{
			case 1: //新手强制训练
			{
				load("$./ForcibleTrain/TrainClass.gml");
//				parent.load("$./ForcibleTrain/TrainReplayMap.gml");
				staticvar gameTrain = new SampleGameTrain
				{
					name = "gameTrain";
					void OnCreated()
					{
						var _CKeySet = new CKeySet
						{
							void OnCreated()
							{
								// 设置键盘方案
								parent.SETKeyboardtype(GetUseKeyType());
								del();
							}
						}
						if ( window.GetMyRID() <= 0 )
							alert("Train OnCreated In Script. RID = " + window.GetMyRID());
						SetUserID( window.GetMyUID() );
						SETBODYID( window.GetMyRID() );
						// 设置单人模式
						window.tennisGameStatic.SetGameStyle( 1);
					}
				}
				break;
			}
			case 2:
			{
				load("$./Topspin/TopspinClass.gml");
				staticvar topspinTrain = new TopspinTrain
				{
					name = "gameTrain";
				}
				break;
			}
			case 3:
			{
				load("$./Volley/VolleyClass.gml");
				staticvar volleyTrain = new VolleyTrain
				{
					name = "gameTrain";
				}
				break;
			}
			case 4:
			{
				load("$./Killshot/KillshotClass.gml");
				staticvar killshotTrain = new KillshotTrain
				{
					name = "gameTrain";
				}
				break;
			}
			case 5:
			{
				load("$./Cumulate/CumulateClass.gml");
				staticvar cumulateTrain = new CumulateTrain
				{
					name = "gameTrain";
				}
				break;
			}
			case 6:
			{
				load("$./BreakIn/BreakInClass.gml");
				staticvar breakInTrain = new BreakInTrain
				{
					name = "gameTrain";
				}
				break;
			}
			case 8:
			{
				load("$./Lob/LobClass.gml");
				staticvar lobTrain = new LobTrain
				{
					name = "gameTrain";
				}
				break;
			}
			case 9:
			{
				load("$./Chip/ChipClass.gml");
				staticvar chipTrain = new ChipTrain
				{
					name = "gameTrain";
				}
				break;
			}
			case 10:
			{
				load("$./MaxCumulate/MaxCumulateClass.gml");
				staticvar maxCumulateTrain = new MaxCumulateTrain
				{
					name = "gameTrain";
				}
				break;
			}
			case 11:
			{
				load("$./MaxBreakIn/MaxBreakInClass.gml");
				staticvar maxBreakInTrain = new MaxBreakInTrain
				{
					name = "gameTrain";
				}
				break;
			}
			case 12:
			{
				load("$./MaxServe/MaxServeClass.gml");
				staticvar maxServeTrain = new MaxServeTrain
				{
					name = "gameTrain";
				}
				break;
			}
			case 13:
			{
				load("$./TopspinSkill/TopspinSkillClass.gml");
				staticvar topspinTrain = new TopspinSkillTrain
				{
					name = "gameTrain";
				}
				break;
			}
			case 14:
			{
				load("$./ChipSkill/ChipSkillClass.gml");
				staticvar chipSkillTrain = new ChipSkillTrain
				{
					name = "gameTrain";
				}
				break;
			}
			case 15:
			{
				load("$./KillshotSkill/KillshotSkillClass.gml");
				staticvar killshotSkillTrain = new KillshotSkillTrain
				{
					name = "gameTrain";
				}
				break;
			}
			case 16:
			{
				load("$./LobSkill/LobSkillClass.gml");
				staticvar lobSkillTrain = new LobSkillTrain
				{
					name = "gameTrain";
				}
				break;
			}
			case 17:
			{
				load("$./ServeSkill/ServeSkillClass.gml");
				staticvar serveSkillTrain = new ServeSkillTrain
				{
					name = "gameTrain";
				}
				break;
			}
			default: del();
		}

		find("mapCtrl").ToGameMap(9); //使用这个方法才不会重复载入地图

		SetRegionTest();
		SetRoleState();
		SignUpHost();
	}

	//========================================界面按钮的响应接口===========================
	//训练中按下了Esc
	void OnClick_Esc()
	{
//		alert("按下了Esc");
	}

	//强制训练-点击了确定
	void OnClick_Confirm()
	{
		find("gameTrain").Click_Accept();
	}
	//点击了跳过录像
	void OnClick_SkipVideo()
	{
		printf("E# NAME_GCMap 跳过录像");
		find("gameTrain").m_repeat = 1;
		find("gameTrain").Leap_Between_Video_and_Train();
	}
	//点击了重复训练
	void OnClick_RetryTrain()
	{
		printf("E# NAME_GCMap 重复训练");
		window.TStatic.SetReplaySound(0);//重复录像跳转时遮盖音效
		find("gameTrain").m_repeat = 2;
		find("gameTrain").Leap_Between_Video_and_Train();
	}
	//点击了播放下一步按钮
	void OnClick_NextVideo()
	{
		//alert("单击了下一步按钮");
		find("gameTrain").Next_Step();
	}

	//======================================================================================
}
