import("$./user.gml")
import("$./GameClient.gml")
import("$./OtherUI.gml")
//wndsize = "1024,768";
//pos = "0,0"

void ToGame()
{
	var row = new VNet2DBRow{}
	row.InitByInt( window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_UID,window.g_userID );
	if ( row.IsReady() )
	{
		row.SetInt(window.M_G_SERVER_USERDT_RULESTATION,1);
	}
	row.del();
}

ToGame();

var map = new GCMap
{
	name="NAME_GCMap"; group=1;
	size="100%,100%"; 

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
		Init( "EventState");
	}

	var MySocket = new CGameSocket{name="MySocket"; };
	void MapAniStart(){_MapTimeCtrl.gamestart();}

	new MapCtrl
	{
		name = "mapCtrl"; 
		if( window.g_LogicTest == 0)
		{
			LoadMap(window.g_mapID);
		}
		else
		{
			LoadMap(99);
		}
	};

	var vmlBall = new VmlGCBall{find("Ball").show = true;};
	new VmlGCSelf{ SetUserId(window.g_userID);};
	new VmlGCNPC{LoadNPC();}

	Fov("0.55");

	new item
	{
		new CameraMg
		{
			name="mycamera"; 
			SetOrigDir(0,-0.35,-1);
			SetMyType(2);
			UIInit(2);
		}
	}

	void RoomToGame()
	{
		find("IAMISSELF").parent.find("FSM").clearset(1);
		find("IAMISAI").parent.find("FSM").clearset(1);
		if ( window.g_SingleMode == 1 )
		{
			SignUpHost();
		}
	}
	timer(1000,"RoomToGame");
}

//这个实例已经搬迁至   $./../interface/Logic/Init.gml   yxf 2008年8月14日15:55
//new GameInput{name = "gameinput";setNotUpdateDirTime(50);};// 游戏键盘0

void SetCharacter()
{
	var row = new VNet2DBRow{};
	row.InitByInt( window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_UID,window.g_userID );
	if ( !row.IsReady() )
	{
		row.del();
		return;
	}
	var rid = row.GetData( window.M_G_SERVER_USERDT_RID );
	row.InitByInt( window.M_G_SERVER,window.ROLEDT,window.M_G_SERVER_ROLEDT_RID,rid );
	if ( !row.IsReady() )
	{
		row.del();
		return;
	}
	row.SetInt( window.M_G_SERVER_ROLEDT_TCHARACTER,window.g_Character );
//	alert("g_userID:"+window.g_userID+"set:"+window.g_Character);
	row.del();
}

//new text
//{
//	pos = "30,145"
//	bkcolor = "#ff0000"
//	src = "点我,重新读入数据库"
//	var num = 0;
//	void OnClick()
//	{
//		var mdbname = window.selectmdb.src + ".mdb";
//		num += 1;
//		window.find("G_DBMANAGE").ReadDataToMem(mdbname,1);
//		src = "数据库:"+mdbname+" 次数:"+num;
//	}
//}
//
//var selectmdb = new edit
//{
//	pos = "30,120";size = "100,25";
//	src = "m_g_clinet";
//	border = "#ff0000";
//	maxsize = 100;
//}
//
//var cc1 = new text
//{
//	size = "150,30";pos = "30,210";bkcolor = "#00ff00";src = "阳光/可爱";
//	xcenter = true;ycenter = true;
//	font = "宋体,-1,20";
//	void OnClick()
//	{
//		window.g_Character = 1;
//		bkcolor = "#00ff00";
//		parent.cc2.bkcolor = "#aaaaaa";
//		parent.cc3.bkcolor = "#aaaaaa";
//		window.SetCharacter();
//	}
//}
//
//var cc2 = new text
//{
//	size = "150,30";pos = "30,250";bkcolor = "#aaaaaa";src = "俊朗/靓丽";
//	xcenter = true;ycenter = true;
//	font = "宋体,-1,20";
//	void OnClick()
//	{
//		window.g_Character = 2;
//		bkcolor = "#00ff00";
//		parent.cc1.bkcolor = "#aaaaaa";
//		parent.cc3.bkcolor = "#aaaaaa";
//		window.SetCharacter();
//	}
//}
//
//var cc3 = new text
//{
//	size = "150,30";pos = "30,290";bkcolor = "#aaaaaa";src = "冷酷/冷艳";
//	xcenter = true;ycenter = true;
//	font = "宋体,-1,20";
//	void OnClick()
//	{
//		window.g_Character = 3;
//		bkcolor = "#00ff00";
//		parent.cc1.bkcolor = "#aaaaaa";
//		parent.cc2.bkcolor = "#aaaaaa";
//		window.SetCharacter();
//	}
//}

//new item
//{
//	size = "20, 20";
//	pos = "500, 300";
//	bgcolor = "#ffffff";
//
//	void OnClick()
//	{
//		window.map.find("userFinder").RunScript("Me.Logic.MissHit();")
//	}
//}