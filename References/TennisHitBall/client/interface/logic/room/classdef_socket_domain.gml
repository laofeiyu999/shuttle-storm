//
//==========================网络部分==房间 Socket ==================================//
//
class Room_Socket_Domain CDomainGameSocket//CGameSocket
{
	//设置需要监视的数据表
	new NetMsgMonitor
	{
		SetMonitorTable(window.GAMEUI, window.EVENT_ROOM);
	}	
	
	void OnDelete()
	{
		printf("B# 房间Room_Socket_Domain-OnDelete");
	}

	//连接上
	void OnConnected()
	{
		InitGame(); //important
		printf("B# >>房间界面Room_Socket_Domain已连接上");
        window.find("ROOM_LOGIC")._VRoom_Logic.OnConnected_Init();
	}
	//断开连接
	void OnDisconnected()
	{
		if(window.GetMyRoomID()<0){return;}
             
		window.RoomToHall();
		window.find("UIController").LoadDLG(7);//与服务器断开连接！
	}

	//游戏开始
	void prc_wr_gamestart(param)
	{
		printf("B# yxf:游戏开始!param:"+param);
		//设置主机前调用-yxf 2008年12月8日
		window.find("NAME_GCMap").ReadyPingSyn();
		window.tennisGameStatic.SetGameStyle();
		window.SetRolemodelInfoShowState(false);
		window.RoomToGame();
	}

	//游戏结束
	void prc_wr_gameover(param)
	{
		printf("B# yxf:游戏结束!param:"+param);
		window.find("GameInterface").SetGameState(4);
		window.find("GameInterface").SetGameState(5);
		// 设置房间状态 add by hanshuo 1.20.2009
		window.find("NAME_GCMap").SetRoomState(6);
	}

	//GM踢人:被踢着ID
	void prc_wr_Gmkicked(KickUserID)
	{
		if (KickUserID == window.GetMyUID())
		{
			window.RoomToHall();
			window.find("UIController").LoadDLG(71);//您被GM请出了房间。
		}
	}

	//有人被踢:房主ID，被踢着ID
	void prc_wr_kicked(MasterID, KickUserID)
	{
		if (KickUserID == window.GetMyUID())
		{
			window.RoomToHall();
			//房主被踢和房客被踢提示不一样，因为房主被踢是所有人准备，30秒不开始被踢得
			if (KickUserID == MasterID)
			{
				window.find("UIController").LoadDLG(73);//房主30秒不开始游戏，被系统请出房间！
			}
			else
			{
				window.find("UIController").LoadDLG(72);//您被房主请出了房间！
			}
		}
	}

	//所有人的地图都加载完毕
	//参数:无
	void prc_wr_game_allroleready()
	{
		printf("B# 所有人的地图都加载完毕:prc_wr_game_allroleready:");
		window.find("GAME_LOGIC")._VGame_Playing_Logic.End_ShowBegin();
		window.find("NAME_GCMap").RefreshEnergy();
	}

	//所有人准备，30秒不开始被踢倒计时
	void prc_wr_Countdown(MasterID)
	{
		killtimer("CountDownTimer");
		CountDownTimer(30);
	}
	//倒计时停止
	void prc_wr_CountdownStop(UserID)
	{
		killtimer("CountDownTimer");
	}

	//倒计时函数
	void CountDownTimer(leavingsec)
	{
		//如果游戏在%0内没有开始，房主将被踢出房间！
		switch(leavingsec)
		{
			case 30:
				window.WriteChat7(1016,"30秒");
				timer(25000, "CountDownTimer(5)", "CountDownTimer");
				break;
			case 5:
				window.WriteChat7(1016,"5秒");
				timer(1000, "CountDownTimer(4)", "CountDownTimer");
				break;
			case 4:
				window.WriteChat7(1016,"4秒");
				timer(1000, "CountDownTimer(3)", "CountDownTimer");
				break;
			case 3:
				window.WriteChat7(1016,"3秒");
				timer(1000, "CountDownTimer(2)", "CountDownTimer");
				break;
			case 2:
				window.WriteChat7(1016,"2秒");
				timer(1000, "CountDownTimer(1)", "CountDownTimer");
				break;
			case 1:
				window.WriteChat7(1016,"1秒");
				break;
		}
	}

	//房间提示信息
	//参数：提示信息，额外信息
	void prc_wr_RoomTipInfo(infoid,msg)
	{
		printf("B# prc_wr_RoomTipInfo-infoid:"+infoid+" msg:"+msg)
		var _isMaster = false;//自己是房主?
		if ( window.GetMyUID() == window.find("ROOM_LOGIC")._VRoom_Logic.m_Masterid) _isMaster = true;
		if (infoid == -1000)
		{
			if (_isMaster)
			{
				window.find("UIController").LoadDLG(153);//因人数过多无法把双打房间改成单打！
			}
			return;
		}
		if (infoid == -1001) //错误的局数
		{
			window.find("UIController").LoadDLG(156);//错误的局数！
			return;
		}
		if (infoid == -1002) //没有人同意修改押注金额
		{
			if (_isMaster)
			{
//				window.LoadInfoBoard(157,0,msg);
				window.find("UIController").LoadDLG(157);
				window.find("DLGLAYER").find("VMyMessageBox_1_Logic").ReplaceData(""+msg);
			}
			return;
		}
		if (infoid == -1003) //xx不同意,无法更改押注
		{
			if (_isMaster)
			{
				window.find("UIController").LoadDLG(157);
				window.find("DLGLAYER").find("VMyMessageBox_1_Logic").ReplaceData(""+msg);
			}
			return;
		}
		if (infoid == -1004) //所有人都同意修改押注金额
		{
			window.find("UIController").LoadDLG(157);
			window.find("DLGLAYER").find("VMyMessageBox_1_Logic").ReplaceData(""+msg);
			return;
		}
		if (infoid == -1005) //等待其他人同意修改押注金额
		{
			window.find("UIController").LoadDLG(157);
			window.find("DLGLAYER").find("VMyMessageBox_1_Logic").ReplaceData(""+msg);
			return;
		}
		if (infoid == -1006) // xx同意修改押注金额
		{
			window.WriteChat13("同意修改押注金额!",msg);
			if (_isMaster)
			{
				window.find("UIController").LoadDLG(157);
				window.find("DLGLAYER").find("VMyMessageBox_1_Logic").ReplaceData(""+msg);
			}
			return;
		}
		if (infoid == -1007) // xx进入房间
		{
			if (msg != window.GetMyName())
			{
				window.WriteChat13("进入房间!",msg);
			}
			return;
		}
		if (infoid == -1008) // xx退出房间
		{
			if (msg != window.GetMyName())
			{
				window.WriteChat13("退出房间!",msg);
			}
			return;
		}
		if (infoid == -1009) // xx余额不足,无法进行比赛
		{
			if (msg != window.GetMyName())
			{
				window.WriteChat13("余额不足,无法进行比赛!",msg);
			}
			return;
		}
		if (infoid == -1010) // XX退出了观战
		{
			if (msg != window.GetMyName())
			{
				window.WriteChat13("退出了观战！",msg);
			}
			return;
		}
	}

	//房主修改押注金额
	void prc_wr_ChgWager(wager)
	{
		printf("prc_wr_ChgWager:"+wager);
		if ( window.GetMyUID() == window.find("ROOM_LOGIC")._VRoom_Logic.m_Masterid)//自己是房主
		{
			window.LoadInfoBoard(162,1,"");	//正在等待其他玩家同意……
		}
		else
		{
			var _mastername = window.GetNameByUID(window.find("ROOM_LOGIC")._VRoom_Logic.m_Masterid);
			if ( wager <= 0 )
			{
				window.find("UIController").LoadDLG(79);//房主[%0]要去掉挑战金,是否同意？
				window.find("DLGLAYER").find("VMB_AgreeModify_Logic").ReplaceData(""+_mastername);
			}
			else
			{
				window.find("UIController").LoadDLG(76);//房主[%0]要将挑战金改为%1,是否同意？
				window.find("DLGLAYER").find("VMB_AgreeModify_Logic").ReplaceData(""+_mastername+","+wager);
			}
		}
	}
	
	//代理 1/0
	void IsProxy(param)
	{
		printf("B# IsProxy:"+param);
		if (toint(param) == 1)
		{
			window.WriteChat7(1018); //您的网络连接不稳定！
			window.find("GAME_LOGIC").find("IO_BAD_ING_NAME").show = true;
		}
		else
		{
			window.find("GAME_LOGIC").find("IO_BAD_ING_NAME").show = false;
		}	
	}
};