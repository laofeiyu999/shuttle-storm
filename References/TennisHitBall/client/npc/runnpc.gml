title="演示";
size="800,600";
wndsize="800,600";

new img3d{};
bgcolor="#123456";

mainDevice.TexturePath(0,"$./texture");
mainDevice.TexturePath(1,"$./../../client/scene/texture");
mainDevice.TexturePath(2,"$./../../client/texture");
import("$./../../mdb/dbdef.gml")
var tstatic = new TStatic{ SetGameRoot("$./../../client/")};

var s = new scene
{
	camera.src="keyboard";
	camera.pos = "0,3.5,-20";
	camera.dir = "0, -0.15, 1";
	new MapCtrl{name = "mapCtrl";LoadMap(1);};

	new CSNPCMgr
	{
		name = "NPCMgr";
		LoadScriptFile("$./net.gml");		//载入运行的脚本
	};
}