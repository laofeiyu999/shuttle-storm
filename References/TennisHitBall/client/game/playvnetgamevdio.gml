//如果要播放录像，请在此目录下放置此播放文件，必须是这个文件名
bgcolor="#123456"
import("$./../../mdb/dbdef_ui.gml");
import("$./../effect/effect.gml");
import("$./timer.gml");
//load("itemclass.gml");

fps=100

mainDevice.TexturePath( 0,"$./../scene/texture/" );
mainDevice.TexturePath( 1,"$./../texture/" );
mainDevice.TexturePath( 2,"$./../npc/texture/");
mainDevice.TexturePath( 3,"$./../effect/texture/");

var g_EffectLV = 10;
var tennisGameStatic = new TStatic			// 11.3.2008 添个名给车新用
{
	name = "tennisGameStatic";
   
	SetGameRoot("$./../");
};

new SG_fmodel
{
	SetFilePath("$./../effect/effect/");
	SetSoundPath("$./../effect/sound/");
	del();
}

new scene
{
	name = "RepMap";
	group = 1;
	camera.pos = "0, 1, -30";
	camera.dir = "0, 0, 1";

	new GameReplayLoad
	{
		size="100%,100%";
		name="GAMEMAP";

		setPlay(0);
	}

	//@PLAYGAMEVDIO是系统的名字
//	new text
//	{
//		src="TIME 00:00:00";
//		alpha=50;
//		pos="2,2";
//		font="宋体,-1,12";
//		color="#FFFFFF";
//		name="GAMEREPLAYTIME"
//	}

//	new MapCtrl
//	{
//		name = "mapCtrl"; 
//
//		LoadMap(9);
//	};

	void SetReplaySrc( src)
	{
		find("GAMEMAP").src= src;
	}

	void LoadMap( id)
	{
		find("mapCtrl").LoadMap( id);
	}
}

new item
{
	size = "50, 50"
	pos = "20, 20"
	bgcolor = "#ffffff"

	void OnClick()
	{
		parent.find("GAMEMAP").setPlaySpeed(2.0);	// 设置播放速度
		parent.find("GAMEMAP").setPlay(1);
		parent.goon = 1;
		parent.UpdateUITimer();
	}
}

new item
{
	size = "50, 50"
	pos = "110, 20"
	bgcolor = "#ffffff"

	void OnClick()
	{
//		parent.find("RepMap").visible = false;
		parent.find("GAMEMAP").setPlay(0);
		parent.goon = 0;
		parent.UpdateUITimer();
	}
}

new item
{
	size = "50, 50"
	pos = "200, 20"
	bgcolor = "#ff00"

	void OnClick()
	{
		parent.find("GAMEMAP").setAutoToEnd(true);
		parent.find("GAMEMAP").src="$./../../GameReplay/ForcibleTrain.vrg";//不写文件名就是不打开
		parent.find("GAMEMAP").replayto(0);
		parent.curTime = 0;
		parent._Min = 0;
		parent._Sec = 0;
		parent._Persec = 0;
	}
}

var videoTime = new UITimer
{
	pos="100%, 100%, -300, -60";
};
