class _Chat CGameBody
{
	SetHall(1);
//	printf("B# *****************_Chat Created*****************")
	AutoNetFunToAllSub(1);
	new GCChat{name="chat";InHall();};
	void BodyInitOk(){}
	void OnDelete()
	{
//		printf("B# *****************_Chat OnDelete*****************")
	}
};

// 用作网络初始化 简化类名
class _HC _Chat
{
};

class VmlGCSelf CGameBody
{
	SetHall(1);
//	printf("B# *****************VmlGCSelf Created*****************")
	AutoNetFunToAllSub(1);
	new GCSelf{name="self";InHall();};
	new item{name = "HallFuckSelf";}
	new RequestMonitor //普通商场
	{
		SetNetMsgMethod(2);								//定制发消息类型;1使用too()发消息，2使用tos()发消息
		SetMonitorTable(window.GAMEUI,window.REQUEST_SHOP);	//设置需要监视的数据表
	}
	new RequestMonitor
	{
		SetNetMsgMethod(2);//定制发消息类型;1使用too()发消息，2使用tos()发消息
		SetMonitorTable(window.GAMEUI,window.REQUEST_CHAT);	//设置需要监视的数据表
	}

	void InitTaskData()
	{
		find("self").InitTaskData();
	}
	
	//自己初始化后程序调用脚本的函数
	void SelfInit(userid)
	{
		timer(1000,"InitTaskData()");
		//NewMallMonitor();
		printf("B# <何方志>:SelfInit-大厅:"+userid);
	}
	void OnDelete()
	{
//		printf("B# *****************VmlGCSelf OnDelete*****************")
	}
};

class VmlRoomDesk RoomDesk
{
	new item{name="VmlRoomDesk";}
	new RequestMonitor
	{
		SetNetMsgMethod(2);//定制发消息类型;1使用too()发消息，2使用tos()发消息
		SetMonitorTable(window.GAMEUI,window.REQUEST_HALL);	//设置需要监视的数据表
	}
};

class VmlArenaDesk RoomDesk
{
	new RequestMonitor
	{
		SetNetMsgMethod(2);//定制发消息类型;1使用too()发消息，2使用tos()发消息
		SetMonitorTable(window.GAMEUI,window.REQUEST_ARENAHALL);	//设置需要监视的数据表
	}

	new item{name="VmlArenaDesk";}

	void OnCreated()
	{
		printf("B# 竞技场共享对象创建好了！");

		var _Param = ""+window.GetMyUID()+","+window.g_ArenaRoomID;
		//参数：用户id，房间id
		window.Tos_JoinArenaRoom(_Param);
	}
};
