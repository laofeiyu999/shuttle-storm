//各界面的socket定义

set window
{
	//这个是考虑登录服务器需要好几台而加，没有合适的位置，就放在这里吧
	//var _IndexOfLoginIP = 0;								//登录服务器IP的索引，最大值等于LOGINSERVERNUM的个数
	var g_GetIP_Time = 2000;									//登录服务器换ip的时间间隔
	var g_Login_TimeOut = 10000;							//登录超时
	var LOGINSERVERNUM = 1;									//登录服务器的数量

	var LOGINIP = "socket:://127.0.0.1:10050";			//登录
	var FRIENDIP = "socket://127.0.0.1:5200";				//好友 
	var CHANNELCHOOSEIP = "socket:://127.0.0.1:10051";	//频道选择
	var ARENAHALLIP = "socket:://127.0.0.1:10080";			//竞技场大厅
	var ARENAROOMIP = "socket:://127.0.0.1:10080";			//竞技场房间
	
	var GAMEREPLAYIP = "127.0.0.1";		//录像服务器的IP
	var GAMEREPLAYIP_PORT_DOWN = 80;				//录像服务器的IP 下行端口
	var GAMEREPLAYIP_PORT_UP = 81;				//录像服务器的IP 上行端口
	
	var GAMETOPSVIP = "udp://127.0.0.1:1300";		//排行榜的IP
	
	/*
	//意见提交:说明
	var OPINION = "http://download.joy-china.net/test/3.html";
	//有奖问答:说明
	var ANSWER = "http://download.joy-china.net/test/3.html";
	//频道选择:活动
	var AFFICHE = "http://download.joy-china.net/test/3.html";
	*/
}
