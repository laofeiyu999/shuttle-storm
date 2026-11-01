//
//网球-竞技场IO类定义
//

class VArena_Socket_Logic_Domain CDomainGameSocket//CGameSocket
{	
	SETID = window.GetMyUID();	//add by hfz
	SetGroupName = "ROOMGROUP1";
//	open(window.ARENAHALLIP);
	//printf("B# window.ARENAHALLIP:"+window.ARENAHALLIP)
	new NetMsgMonitor
	{
		printf("B# VArena_Socket_Logic_Domain->warning:NetMsgMonitor\n");
		SetMonitorTable(window.GAMEUI,window.EVENT_ARENAHALL);	//设置需要监视的数据表
	}
	//连接上
	void OnConnected()
	{
		VNETLOG(241,"VArena_Socket_Logic_Domain-ARENASocket已连接上\n");
		printf("B# ARENASocket已连接上");
		InitArenaDesk();
	}
	//断开连接:返回频道选择界面
	void OnDisConnected()
	{
		printf("B# VArena_Socket_Logic_Domain-ARENASocket断开连接！\n");
	}
	//连接不上
	void OnConnectErr()
	{
		printf("B# VArena_Socket_Logic_Domain-ARENASocket连接不上！\n");
	}
	//异常错误
	void prc_con_gs_err()
	{
		printf("B# 服务器人数已满，请稍候再试！\n");
		VNETLOG(233,"服务器人数已满，请稍候再试！\n");
		window.HallToChannelChoose();
		window.find("UIController").LoadDLG(13);//服务器人数已满，请稍候再试！
	}
	//服务器繁忙
	void OnWillLoadErr()
	{
		printf("B# 服务器繁忙，请稍候再试！\n");
		VNETLOG(233,"服务器繁忙，请稍候再试！\n");
		window.HallToChannelChoose();
		window.find("UIController").LoadDLG(9);//服务器繁忙，请稍候再试！
	}

	//快速加入房间：用户id 返回结果 报名ID
	//>=0为加入房间成功，其值为加入的房间id，<0为出现错误
	void JoinArenaRoom(iUserId,iReturnCode,raceID)
	{
		if (iReturnCode == -1000)
		{
			VNETLOG(241,"活动-加入房间反馈:没有找到用户\n");
			window.find("UIController").LoadDLG(241);//没有找到用户
			return;
		}
		if (iReturnCode == -1001)
		{
			VNETLOG(241,"活动-加入房间反馈:没有找到房间\n");
			window.find("UIController").LoadDLG(242);//没有找到房间
			return;
		}
		if (iReturnCode == -1005)
		{
			VNETLOG(241,"活动-加入房间反馈:加入房间时用户已在房间内\n");
			window.find("UIController").LoadDLG(245);//加入房间时您已在该房间内了！
			return;
		}
		if (iReturnCode == -1006)
		{
			VNETLOG(241,"活动-加入房间反馈:加入房间时房间状态不为等待\n");
			window.find("UIController").LoadDLG(246);///加入房间时房间状态不为等待！
			return;
		}
		if (iReturnCode == -1007)
		{
			VNETLOG(241,"活动-加入房间反馈:加入房间时人数已满\n");
			window.find("UIController").LoadDLG(247);//加入房间时人数已满。
			return;
		}
		if (iReturnCode == -1008)
		{
			VNETLOG(241,"活动-加入房间反馈:加入房间时密码不正确\n");
			window.find("UIController").LoadDLG(248);//加入房间时密码不正确
			return;
		}
		if (iReturnCode == -1013)
		{
			VNETLOG(241,"活动-加入房间反馈:错误的房间类型\n");
			window.find("UIController").LoadDLG(249);//错误的房间类型
			return;
		}
		if (iReturnCode >= 0)
		{
			VNETLOG(241,"活动-加入房间反馈:加入房间成功!\n");
			printf("B# 活动-加入房间反馈:加入房间成功!-有等待界面\n");
			if (window.GetMyRaceID() != raceID)
			{
				VNETLOG(241,"活动-加入房间反馈:->严重错误，不是同一个活动.报名:"+window.GetMyRaceID()+",配对:"+raceID+"\n");
				printf("活动-加入房间反馈:->严重错误，不是同一个活动.报名:"+window.GetMyRaceID()+",配对:"+raceID+"\n");
			}
			window.SetMyRaceID(toint(raceID));

			timer(window.g_JoinArenaRoom_Time,"RealJoin("+iReturnCode+")","Arena_Timer_Name");
			//等待界面
			set window.find("TOPLAYER")
			{
				new VHallWaiting_Logic{}
			}
			if(window.GetUIPos() == window.POS_FAMILYROOM)
			{
				window.find("FAMILY_ROOM_LOGIC")._familyRoom.SetGameStateInfo(true);
				window.find("TOPLAYER").find("VHallWaiting_Logic_Name").SetData(4);
				return;
			}
			window.find("TOPLAYER").find("VHallWaiting_Logic_Name").SetData(window.GetMyRaceID());
			//window.find("HALL_LOGIC").s_ArenaClew.ArenaClewShow(false);//报名提示图标
			return;
		}
	}

	//等待结束后真正加入
	void RealJoin(roomID)
	{
		printf("B# VArena_Socket_Logic:RealJoin:"+roomID+",raceID:"+window.GetMyRaceID());
		if(window.GetUIPos() == window.POS_FAMILYROOM)
		{
			window.find("FAMILY_ROOM_LOGIC").del();
			window.find("CHAT_LOGIC").del();
		}
		//载入房间界面
		window.HallToRoom(roomID,true,window.GetMyRaceID());
	}
};