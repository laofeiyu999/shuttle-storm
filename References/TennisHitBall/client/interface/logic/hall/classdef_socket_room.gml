//
//网球-大厅界面的IO类定义 - 房间相关
//

//房间列表 同步完毕
void SynchroRoomFinish()
{
	printf("B# 房间列表同步完了！");
	if (window.IsHallHtnOpened(window.G_HALLBTN_GAMEHALL))
	{
		window.find("GAMEHALL_LOGIC")._VGameHall_Logic.m_Class_Common.SelectRoomByType();
	}
}

//创建房间：用户id 返回结果(>0的是房间号)
void CreateRoom(iUserId,iReturnCode)
{
	window.find("TOPLAYER").delallchild();
	if (iReturnCode == -1000)
	{
		VNETLOG(241,"创建房间反馈:没有找到用户\n");
		window.find("UIController").LoadDLG(241);//没有找到用户
		return;
	}
	if (iReturnCode == -1001)
	{
		VNETLOG(241,"创建房间反馈:没有找到房间\n");
		window.find("UIController").LoadDLG(242);//没有找到房间
		return;
	}
	if (iReturnCode == -1002)
	{
		VNETLOG(241,"创建房间反馈:创建房间时名称不正确\n");
		window.find("UIController").LoadDLG(243);//创建房间时房间名称不正确
		return;
	}
	if (iReturnCode == -1003)
	{
		VNETLOG(241,"创建房间反馈:创建房间时已有角色在房间内\n");
		window.find("UIController").LoadDLG(244);//创建房间时您已在该房间内了！
		return;
	}
	if (iReturnCode == -1004)
	{
		VNETLOG(241,"创建房间反馈:创建房间时房间状态不为空\n");
		window.find("UIController").LoadDLG(21);//创建房间失败！
		return;
	}
	if (iReturnCode == -1013)
	{
		VNETLOG(241,"创建房间反馈:错误的房间类型\n");
		if (window.g_DEBUG)
		{
			alert("创建房间反馈:错误的房间类型");
		}
		return;
	}
	if (iReturnCode == -1014)
	{
		VNETLOG(241,"房间数已满，不可创建房间\n");
		window.find("UIController").LoadDLG(24);//房间数已满，不可创建房间！
		return;
	}
	if (iReturnCode == -1015)
	{
		VNETLOG(241,"错误的地图ID\n");
		if (window.g_DEBUG)
		{
			alert("错误的地图ID！");
		}
		return;
	}
	if (iReturnCode == -1016)
	{
		VNETLOG(241,"错误的局数\n");
		if (window.g_DEBUG)
		{
			alert("错误的局数");
		}
		return;
	}
	if (iReturnCode == -1019)
	{
		VNETLOG(241,"押注资金不够\n");
		window.find("UIController").LoadDLG(158);//余额不足，无法创建房间！
		return;
	}
	if (iReturnCode == -1020)
	{
		VNETLOG(241,"押注资金不够\n");
		if (window.g_DEBUG)
		{
			alert("错误的押注金额");
		}
		return;
	}
	if (iReturnCode == -1021)
	{
		VNETLOG(241,"创建房间繁忙,请重试(在同时创建房间的请求过多的时候出)\n");
		window.find("UIController").LoadDLG(674);
		return;
	}
	if (iReturnCode >= 0)
	{
		VNETLOG(241,"创建房间反馈:创建房间成功!\n");
		//载入房间界面
		window.HallToRoom(iReturnCode,false);
		return;
	}
}

//快速加入房间：用户id 返回结果
void JoinRoom(iUserId,iReturnCode)
{
	if (iReturnCode == -1000)
	{
		VNETLOG(241,"加入房间反馈:没有找到用户\n");
		window.find("UIController").LoadDLG(241);//没有找到用户
		return;
	}
	if (iReturnCode == -1001)
	{
		VNETLOG(241,"加入房间反馈:没有找到房间\n");
		window.find("UIController").LoadDLG(242);//没有找到房间
		return;
	}
	if (iReturnCode == -1005)
	{
		VNETLOG(241,"加入房间反馈:加入房间时用户已在房间内\n");
		window.find("UIController").LoadDLG(245);//加入房间时您已在该房间内了！
		return;
	}
	if (iReturnCode == -1006)
	{
		VNETLOG(241,"加入房间反馈:加入房间时房间状态不为等待\n");
		window.find("UIController").LoadDLG(246);///加入房间时房间状态不为等待！
		return;
	}
	if (iReturnCode == -1007)
	{
		VNETLOG(241,"加入房间反馈:加入房间时人数已满\n");
		window.find("UIController").LoadDLG(247);//加入房间时人数已满。
		return;
	}
	if (iReturnCode == -1008)
	{
		VNETLOG(241,"加入房间反馈:加入房间时密码不正确\n");
		window.find("UIController").LoadDLG(248);//加入房间时密码不正确
		return;
	}
	if (iReturnCode == -1012)
	{
		VNETLOG(241,"加入房间反馈:被邀请 发现邀请者不在房间中\n");
		window.find("UIController").LoadDLG(240);//邀请者已不在房间中！
		return;
	}
	if (iReturnCode == -1023)// 加入情侣房间时男性玩家已满两人
	{
		VNETLOG(241,"加入情侣房间时男性玩家已满两人\n");
		window.find("UIController").LoadDLG(836);
		return;
	}
	if (iReturnCode == -1024)
	{
		VNETLOG(241,"加入情侣房间时女性玩家已满两人\n");
		window.find("UIController").LoadDLG(837);
		return;
	}
	if (iReturnCode >= 0)
	{
		VNETLOG(241,"加入房间反馈:加入房间成功!\n");
		//载入房间界面
		window.HallToRoom(iReturnCode,false,0);
		return;
	}
}

//加入房间是否需要密码:>>0:不需要 1:需要  
//1加入房间 2加入好友的房间
void IsNeedPassword(iUserId,iReturnCode)
{
	window.find("TOPLAYER").delallchild();
	if (iReturnCode == 0)
	{
		//发出快速加入消息：用户id 房间id 游戏类型 房间密码
		var _Param = ""+iUserId+ ","+window.g_JoinRoomID+",-1,"+"";
		window.Too_FastJoinRoom_Ex(_Param,window.g_JoinRoomID);
		break;
	}
	if (iReturnCode == 1)
	{
		window.find("UIController").LoadDLG2(22); //有密码 弹出输入密码 提示框
		break;
	}
}

//观战加入某个房间的反馈：
void JoinLookerOn(iUserId,iReturnCode,nk)
{
	if (iReturnCode == -1000)
	{
		if ( window.GetMyUID() == window.find("ROOM_LOGIC")._VRoom_Logic.m_Masterid)
		{
			return;
		}
		window.GameReplayToHall();
		window.find("UIController").LoadDLG(241);//没有找到用户
		return;
	}
	if (iReturnCode == -1001)
	{
		if ( window.GetMyUID() == window.find("ROOM_LOGIC")._VRoom_Logic.m_Masterid)
		{
			return;
		}
		window.GameReplayToHall();
		window.find("UIController").LoadDLG(242);//没有找到房间
		return;
	}
	if (iReturnCode == -1005)
	{
		if ( window.GetMyUID() == window.find("ROOM_LOGIC")._VRoom_Logic.m_Masterid)
		{
			return;
		}
		window.GameReplayToHall();
		window.find("UIController").LoadDLG(257);//观战时您已在该房间内了！
		return;
	}
	if (iReturnCode == -1007)
	{
		if ( window.GetMyUID() == window.find("ROOM_LOGIC")._VRoom_Logic.m_Masterid)
		{
			return;
		}
		window.GameReplayToHall();
		window.find("UIController").LoadDLG(258);//观战房间人数已满！
		return;
	}
	if (iReturnCode == -1009)
	{
		if ( window.GetMyUID() == window.find("ROOM_LOGIC")._VRoom_Logic.m_Masterid)
		{
			return;
		}
		window.GameReplayToHall();
		window.find("UIController").LoadDLG(239);//该房间不允许观战！
		return;
	}
	if (iReturnCode >= 0) //成功
	{	
		var _VNet2DBTable = new VNet2DBTable
		{
			var UID = 0;
			void GetMyData(_UID)
			{
				UID = _UID;
			}
		};
		var _sql = "SELECT * FROM "+window.USERDT+" WHERE "+window.M_G_SERVER_USERDT_DID_STR+"="+window.g_JoinRoomID+
			" AND "+window.M_G_SERVER_USERDT_CHAIRINDEX_STR+"=1";
		_VNet2DBTable.Select( window.M_G_SERVER,_sql);
		_VNet2DBTable.ReadData("GetMyData",""+window.M_G_SERVER_USERDT_UID);
		////有人观战GM创建的房间，通知房主
		if (toint(window.find("ROOM_LOGIC")._VRoom_Logic.m_Masterid) == 0 && _VNet2DBTable.GetSize()!=0 && _VNet2DBTable.UID == window.GetMyUID())
		{
			window.find("NAME_GCMap").somebodyLookUs();
		}
		_VNet2DBTable.del();		

		//有人观战，通知房主
		if (window.find("ROOM_LOGIC")._VRoom_Logic.m_Masterid == window.GetMyUID())
		{
			printf("7# 有人观战，通知房主");
			window.find("NAME_GCMap").somebodyLookUs();
		}

		if (window.GetMyUID()==iUserId)
		{
			window.g_LookAtRoomID = iReturnCode;
			var _param = "udp://"+window.GAMEREPLAYIP+":"+window.GAMEREPLAYIP_PORT_DOWN+"/"+window.MYDATA.GetChannel()+"_"+iReturnCode+".VRG";
//			var _param = "http://"+window.GAMEREPLAYIP+":"+window.GAMEREPLAYIP_PORT_DOWN+"/"+window.MYDATA.GetChannel()+"_"+iReturnCode+".VRG";
			printf("B# [观战]_param:"+_param);
			window.HallToVideo(window.VIDEO_TYPE_LOOKAT,_param);
			return;
		}
		else
		{
			window.WriteChat13("进入观战!",nk);
		}
	}
}

//别人邀请我去XX房间： 
void RequestMeToRoom(UID,NkName,RoomID)
{
	window.On_RequestMeToRoom(UID,NkName,RoomID);
}

//获得用户的房间号
//参数：用户ID,房间ID(正常的房间号从0开始)
void GetUserDID(iUserID, iDid)
{
	if (toint(iUserID) <= 0) //-1没有玩家
	{
		window.find("UIController").LoadDLG(241);//没有找到用户！
		return;
	}
	if (toint(iDid) < 0) //-1没有找到房间
	{
		window.find("UIController").LoadDLG(242);//没有找到房间！
		return;
	}
	//加入房间是否需要密码:房间id
	window.Too_NeedPassword(iDid);
}

//情侣房间模式的提示
void LoverDoubleMatch(iReturnID)
{
	if (iReturnID == -1)
	{
		window.find("UIController").LoadDLG(842);//-1表示失败“各队需要1男1女
		return;
	}
}
//使用概率物品的反馈函数
//add by chenjihui
//2011-3-3
void __UseOddsItem(uid,cid,oddsid)
{
	var _eventID = 0;
	var _message = "";

	window.g_Row.InitByInt(window.GAME,window.USEODDSITEM,window.GAME_USEODDSITEM_CID,cid);
	if (!window.g_Row.IsReady())
	{
		window.g_Row.Release();
		printf("B# error-OnClick_PackGoods:DBname:"+window.GAME+",TBName:"+window.USEODDSITEM+",_cid:"+cid);
		return;
	}
	if (cid == 50315)
	{
		switch (toint(oddsid))
		{
		case 1:
			_eventID = window.g_Row.GetData(window.GAME_USEODDSITEM_ODDS1DIALOG);
			_message = window.g_Row.GetData(window.GAME_USEODDSITEM_ODDS1MESSAGE);
			window.find("UIController").LoadDLG(toint(_eventID));
			window.WriteChat(7,_message);
			break;
		case 2:
			_eventID = window.g_Row.GetData(window.GAME_USEODDSITEM_ODDS2DIALOG);
			_message = window.g_Row.GetData(window.GAME_USEODDSITEM_ODDS2MESSAGE);
			window.find("UIController").LoadDLG(toint(_eventID));
			window.WriteChat(7,_message);
			break;
		}
	}
	if (cid == 50322)
	{
		window.g_Fool_GoodID = cid;

		switch (oddsid)
		{
		case 1:
			_eventID = window.g_Row.GetData(window.GAME_USEODDSITEM_ODDS1DIALOG);
			window.find("UIController").LoadDLG(toint(_eventID));
			window.find("VMB_HartBeat_Logic").m_EnterID = _eventID;	
			break;
		case 2:
			_eventID = window.g_Row.GetData(window.GAME_USEODDSITEM_ODDS2DIALOG);
			window.find("UIController").LoadDLG(toint(_eventID));
			window.find("VMB_HartBeat_Logic").m_EnterID = _eventID;
			break;
		case 3:
			_eventID = window.g_Row.GetData(window.GAME_USEODDSITEM_ODDS3DIALOG);
			window.find("UIController").LoadDLG(toint(_eventID));
			break;
		case 4:
			_eventID = window.g_Row.GetData(window.GAME_USEODDSITEM_ODDS4DIALOG);
			window.find("UIController").LoadDLG(toint(_eventID));
			break;
		}
	}
	if (cid == 846)//心跳概率虚拟ID
	{
		_message = window.g_Row.GetData(window.GAME_USEODDSITEM_ODDS1MESSAGE);
		window.WriteChat(7,_message);
	}
	if (cid == 847)//心碎概率虚拟ID
	{
		_message = window.g_Row.GetData(window.GAME_USEODDSITEM_ODDS1MESSAGE);
		window.WriteChat(7,_message);
	}
	if (cid == 850)//心动概率虚拟ID
	{
		_message = window.g_Row.GetData(window.GAME_USEODDSITEM_ODDS1MESSAGE);
		window.WriteChat(7,_message);
	}
	if (cid == 852)//心酸概率虚拟ID
	{
		_message = window.g_Row.GetData(window.GAME_USEODDSITEM_ODDS1MESSAGE);
		window.WriteChat(7,_message);
	}
	window.g_Row.Release();
}

void popcontinuewin()
{
	window.find("UIController").LoadDLG(691);
}
void ShowBackItemWnd()  //过期道具框
{
	window.g_MyItemsCheck.killtimer("StartCheck");
	timer(2000,"popcontinuewin");
}
