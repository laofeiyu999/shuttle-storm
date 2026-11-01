//
//保存录像的类
//
import("$./../datainit.gml");

class savegameclass item
{
	var _svgroup=0;

	size="100%,100%";

	parent.find("__SAVEGAME").del();
	name="__SAVEGAME";

	var _saveobj=new GameReplaySave
	{
		//alert("path="+path);
		//src="$./../../gamereplay/测试录像.VRG";//不写文件名就是不打开
		src=""+window.getbinpath()+"../gamereplay/测试录像.VRG";//不写文件名就是不打开
		init3prcid(7368563);
//		SavePosTimeDelay( 10);
		//CHECKUPDATEDELAY=true;
	}
	
	//[功能]开始上传录像-程序调用(GCMap)
	void startsave(_name)
	{
		//ip = "192.168.0.131";
		printf("B# [观战]savegameclass-startsave():_name:"+_name);
		printf("B# [观战]savegameclass-startsave():ip:"+window.GAMEREPLAYIP);
		printf("B# [观战]savegameclass-startsave():port:"+window.GAMEREPLAYIP_PORT_UP);
		if (window.GAMEREPLAYIP == "" || window.GAMEREPLAYIP_PORT_UP == "")
		{
			alert("class savegameclass void startsave(_name) 录像IP错误！");
			return;
		}
	 	_saveobj.posttoserver(_name,window.GAMEREPLAYIP,window.GAMEREPLAYIP_PORT_UP);
	}
	
	//[功能]保存了parent
	void savegameclass(svgroup)
	{
		_svgroup=svgroup;
		//_saveobj.startsave(_svgroup);
	}

	//[功能]开始保存录像-脚本调用(GameGCMap)
	void start()
	{
		printf("[观战]savegameclass-start():hanshuo ========Save Replay Start========");
		_saveobj.startsave(_svgroup);
	}
	
	//[功能]游戏结束-脚本调用(GameGCMap)
	void gameover()
	{
		_saveobj.gameover();
	}
}