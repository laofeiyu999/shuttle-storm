//全局变量 + 函数>>房间

set window
{
	var g_Room_userNum = 0;		//暂时存储房间里的玩家的UID
	var g_Room_tempUserName = "";	//用来临时存储用户名字
	var g_AllPlayersNum = 0;	//玩家人数
	var g_AllPlayersUID = sysarray(4);	//玩家uid
	window.g_AllPlayersUID[0] = 0;
	window.g_AllPlayersUID[1] = 0;
	window.g_AllPlayersUID[2] = 0;
	window.g_AllPlayersUID[3] = 0;

	//[功能]通过RoomID看看自己的钱能不能进这个房间
	//[参数]RoomID:房间ID
	//		_UID:邀请者ID
	//[返回值]能 true，不能false,错误的参数-1
	void JudgeMoneyByRoomID(RoomID,_UID)
	{
		if (RoomID < 0)
		{
			return window.DB_ERR;
		}
		
		window.g_Row.InitByInt(window.M_G_SERVER,window.DESKDT,window.M_G_SERVER_DESKDT_DESKID,RoomID);
		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-JudgeMoneyByRoomID:DBname:"+window.M_G_SERVER+",TBName:"+window.DESKDT+",roomid:"+RoomID);
			return window.DB_ERR;
		}

		var _iWager = window.g_Row.GetData(window.M_G_SERVER_DESKDT_IWAGER);//押注金额
		var _iWagerType = window.g_Row.GetData(window.M_G_SERVER_DESKDT_IWAGERTYPE);//赌注类型 1表示金币 2点卷
		window.g_Row.Release();
		if (toint(_iWager) > 0) //要钱
		{
			if (window.GetValueByMoneyType(_iWagerType) >= toint(_iWager)) //够
			{
				window.find("UIController").LoadDLG(77);//挑战房间将会扣除您XXX金币最为挑战金,您确定要进入吗？
				window.find("DLGLAYER").find("VMB_WagerJoinRoom_Logic").ReplaceData(""+_iWager);
				return;
			}
			var _param2 = ""+window.GetMyName()+ ","+_UID+",4";
			//回复邀请:"被邀请者昵称",邀请者ID,类型(0拒绝 1同意 2超时 3不在空闲中 4钱不够)
			window.Too_IRefuseToRoom(_param2);

			window.find("UIController").LoadDLG(159);//余额不足，无法进入房间！
			return;
		}
		else
		{
			switch (window.g_JionRoomType)//加入房间类型(1普通 2邀请)
			{
				case 1:
				{
					window.Too_FastJoinRoom_Ex(window.g_FastJionRoomParamWager,-1);
					break;
				}
				case 2:
				{
					window.Too_InviteJoinRoom_Ex(window.g_FastJionRoomParamWager,-1,_UID);
					break;
				}
			}
		}
	}
	//根据房间号取得房间名称
	//参数 RoomID:
	//错误值：-1
	void GetRoomNameByRoomID(RoomID)
	{
		window.g_Row.InitByInt(window.M_G_SERVER,window.DESKDT,window.M_G_SERVER_DESKDT_DESKID,RoomID);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetRoomNameByRoomID:"+window.M_G_SERVER+",TBName:"+window.DESKDT+",RoomID:"+RoomID);
			return window.DB_ERR1;
		}

		var _Roomname = window.g_Row.GetData(window.M_G_SERVER_DESKDT_DESKNAME);//1字段
		window.g_Row.Release();
		return _Roomname;
	}
	
	//根据房间ID取得游戏地图ID
	//参数 RoomID:房间ID
	//错误值：-1
	void GetGameMapIDByRoomID(RoomID)
	{
		window.g_Row.InitByInt(window.M_G_SERVER,window.DESKDT,window.M_G_SERVER_DESKDT_DESKID,RoomID);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetGameMapIDByRoomID:"+window.M_G_SERVER+",TBName:"+window.DESKDT+",RoomID:"+RoomID);
			return window.DB_ERR;
		}

		var _RoomMapID = window.g_Row.GetData(window.M_G_SERVER_DESKDT_DMAPID);//10字段
		window.g_Row.Release();
		return _RoomMapID;
	}

	//根据游戏地图ID取得房间地图ID
	//参数 GameMapID:游戏地图ID
	//错误值：-1
	void GetRoomMapIDByGameMapID(GameMapID)
	{
		window.g_Row.InitByInt(window.TENNIS_GAME,window.MAPINFO,window.TENNIS_GAME_MAPINFO_MAPID,GameMapID);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetRoomMapIDByGameMapID:"+window.TENNIS_GAME+",TBName:"+window.MAPINFO);
			return window.DB_ERR;
		}

		var _RoomMapID = window.g_Row.GetData(window.TENNIS_GAME_MAPINFO_ROOMMAPID);//8字段
		window.g_Row.Release();
		return _RoomMapID;
	}

	//[功能]取房间的类型
	//[参数]_roomid:房间号,不传就是自己的房间
	//[返回值]错误值：-1
	//房间类型 0未知 1网球竞技单 2网球竞技双 
	void GetRoomType(roomid)
	{
		var _RoomID = roomid;
		if (_RoomID <= 0)
		{
			_RoomID = window.GetMyRoomID();
		}
		window.g_Row.InitByInt(window.M_G_SERVER,window.DESKDT,window.M_G_SERVER_DESKDT_DESKID,_RoomID);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetRoomType:"+window.M_G_SERVER+",TBName:"+window.DESKDT);
			return window.DB_ERR;
		}

		var _RoomType = window.g_Row.GetData(window.M_G_SERVER_DESKDT_DESKTYPE);//8字段
		window.g_Row.Release();
		return _RoomType;
	}

	//取房间的局制
	//错误值：-1
	//游戏局制 1,2,3 (1，3，5)
	void GetRoomGameNum()
	{
		var _RoomID = window.GetMyRoomID();
		window.g_Row.InitByInt(window.M_G_SERVER,window.DESKDT,window.M_G_SERVER_DESKDT_DESKID,_RoomID);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetRoomGameNum:"+window.M_G_SERVER+",TBName:"+window.DESKDT);
			return window.DB_ERR;
		}

		var _gamenum = window.g_Row.GetData(window.M_G_SERVER_DESKDT_SCORENUM);//9字段
		window.g_Row.Release();
		return _gamenum;
	}

	//根据地图索引取地图图片的名称
	//库：Tennis_Game.mdb	表：MapInfo
	//错误值：-1
	void GetMapIconName(ID)
	{
		window.g_Row.InitByInt(window.TENNIS_GAME,window.MAPINFO,window.TENNIS_GAME_MAPINFO_MAPID,ID);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetMapIconName:DBname:"+window.TENNIS_GAME+",TBName:"+window.MAPINFO);
			return window.DB_ERR;
		}

		var _MapIconName = window.g_Row.GetData(window.TENNIS_GAME_MAPINFO_MAPICON);
		window.g_Row.Release();
		return _MapIconName;
	}

	//[功能]将房间ID转换成显示ID::服务器ID*1000+房间号
	//[参数]roomid:真正的房间号
	//[返回值]显示的房间号
	void RoomIDToShowID(roomid)
	{
		return toint(roomid)%toint(window.ROOMID_BASE) + 1;
	}

	//[功能]将显示ID转换成房间ID::服务器ID*1000+房间号
	//[参数]showid:显示的房间号
	//[返回值]真正的房间号
	void ShowIDToRoomID(showid)
	{
		return toint(window.GetMySvID())*toint(window.ROOMID_BASE) + toint(showid) - 1;
	}

	//[功能]游戏结束-通知何方志
	void OnGameOver()
	{
		window.find("NPCMgr").del();
	}

	//[功能]检测p2p信息是否完整( 0无效, 1可用)
	void P2PReady()
	{
		return true;	// 大厅内p2p取消 5.11.2010
		if (window.tennisGameStatic.IsP2PInfoReady() == 0)
		{
			window.find(window.TOPLAYER).delallchild();
			window.find("UIController").LoadDLG(80);//p2p服务器尚未连接成功!
			return false;
		}
		return true;
	}

	//[功能]根据局制索引取得真正的局制
	//[参数]index:局制索引(1,2,3)
	//[返回值]真正的局制(1,3,5)
	void GetGameNumByIndex(index)
	{
		var _gamenum = 0;
		switch (index)
		{
		case 1:_gamenum = 1;break;
		case 2:_gamenum = 3;break;
		case 3:_gamenum = 5;break;
		default:break;
		}
		return _gamenum;
	}

	//[功能]别人邀请我去XX房间：收到消息
	//[参数]UID:邀请者ID
	//		NkName:邀请者昵称
	//		RoomID:要去的房间号
	void On_RequestMeToRoom(UID,NkName,RoomID)
	{
		//[返回值]0(合适) 1(黑名单) 2(状态不在空闲) 3(界面不合适)
		var _res = window.JudgeMyState(NkName);
		if (toint(_res) > window.JUDGE_MYSTATE_DEFAULT)
		{
			var _param = ""+window.GetMyName()+ ","+UID+",3";
			//拒绝邀请:"被邀请者昵称",邀请者ID,类型(0拒绝 1同意 2超时 3不在空闲中)
			window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_SHOP,"_IRefuseToRoom", _param);
			return;
		}
		
		var _roomID = window.RoomIDToShowID(RoomID);
		if (_roomID > 10 && _roomID < 100)
		{
			_roomID = "0"+_roomID;
		}
		if (_roomID < 10)
		{
			_roomID = "00"+_roomID;
		}
		window.find("UIController").LoadDLG(78);//[%0]邀请您去房间%1。
		window.find("DLGLAYER").find("VMB_InviteToRoom_Logic").ReplaceData(""+NkName+","+_roomID);
		window.find("DLGLAYER").find("VMB_InviteToRoom_Logic").InitData(UID,RoomID);
	}

	//根据邀请玩家的名字获取邀请玩家的UID
	void GetInvitorUIDByName(_name)
	{
		if (_name == 0 || _name == "")
		{
			return window.DB_ERR;
		}
		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByString(window.M_G_SERVER,window.USERDT_INVITE,window.M_G_SERVER_USERDT_INVITE_NKNAME,_name);

		if (!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			return window.DB_ERR;
		}

		var _uid = _VNet2DBRow.GetData(window.M_G_SERVER_USERDT_INVITE_UID);
		_VNet2DBRow.del();
		printf("C# GetInvitorUIDByName:_name:"+_name+",_uid:"+_uid);
		return _uid;
	}
}