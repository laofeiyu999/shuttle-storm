
import("$./TrainClass.gml");
import("$./../../game/user.gml");

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

	new SampleGameTrain
	{
		name = "gameTrain";
	};

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
	new VmlGCSelf{ SetUserId(window.GetMyUID();)};

	Fov("0.55");

	new item
	{
		new CameraMg
		{
//			alert("");
			name="mycamera"; 
			SetOrigDir(0,-0.35,-1);
			UIInit(window.GetMyUID());
			SetMyType(1);
		}
	}

	//timer(1000,"RoomToGame");
}