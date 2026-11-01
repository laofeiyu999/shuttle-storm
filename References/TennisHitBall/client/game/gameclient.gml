//fps = 200;
//bgcolor = "#FFFFFF";

import("$./TextureID.gml")

//title = "TennisGameClient";
//bgcolor = "#0";
//window.title = "TennisGame UserID: "+window.g_userID;

mainDevice.TexturePath( window.SenceTextureID,"$./../../client/scene/texture/" );
mainDevice.TexturePath( window.ClientTextureID,"$./../../client/texture/" );
mainDevice.TexturePath( window.NPCTextrueID,"$./../../client/npc/texture/");

var tstatic = new TStatic{ SetGameRoot("$./../../client/")};

//这个实例已经搬迁至   $./../interface/Logic/Init.gml   yxf 2008年8月14日15:55
//new GameInput{name = "gameinput";setNotUpdateDirTime(50);};			// 游戏键盘0


void CreateTest1()
{
	new item
	{
		size = "80, 80";
		bgcolor = "#ffff00";

		void OnMouseDownL()
		{
			parent.find("FSM").SetFlags(1, 1);
		}
	}
}

void CreateTest2()
{
	new item
	{
		size = "80, 80";
		bgcolor = "#00ff00";
		pos = "300, 0";
	}
}
<END>