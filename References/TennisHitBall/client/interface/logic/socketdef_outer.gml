//各界面的socket定义

set window
{
	//这个是考虑登录服务器需要好几台而加，没有合适的位置，就放在这里吧
	//var _IndexOfLoginIP = 0;								//登录服务器IP的索引，最大值等于LOGINSERVERNUM的个数
	var g_GetIP_Time = 2000;									//登录服务器换ip的时间间隔
	var g_Login_TimeOut = 10000;							//登录超时
	var LOGINSERVERNUM = 1;									//登录服务器的数量

	//国际网
	var LOGINIP = "socket:://61.55.135.168:10050";			//登录
	var FRIENDIP = "socket://127.0.0.1:5200";				//好友 
	var CHANNELCHOOSEIP = "socket:://61.55.135.168:10051";	//频道选择

	//局域网
//	var LOGINIP = "socket:://192.168.0.101:10050";			//登录
//	var FRIENDIP = "socket://192.168.0.101:5200";				//好友 
//	var CHANNELCHOOSEIP = "socket:://192.168.0.101:10051";	//频道选择

	//意见提交:说明
	var OPINION = "http://download.joy-china.net/test/3.html";
	//有奖问答:说明
	var ANSWER = "http://download.joy-china.net/test/3.html";
	//频道选择:活动
	var AFFICHE = "http://download.joy-china.net/test/3.html";
}
