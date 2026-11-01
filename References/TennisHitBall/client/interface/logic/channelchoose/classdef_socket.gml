//
//网球-频道选择界面的IO类定义
//

class VChannelChoose_Socket_Logic LoginSocket
{
	open(window.CHANNELCHOOSEIP);

	new RequestMonitor
	{
		SetNetMsgMethod(1);									//定制发消息类型;1使用too()发消息，2使用tos()发消息
		SetMonitorTable(window.GAMEUI,window.REQUEST_GAMECENTER);	//设置需要监视的数据表
	}

	new NetMsgMonitor
	{
		SetMonitorTable(window.GAMEUI,window.EVENT_GAMECENTER);	//设置需要监视的数据表
	}

	//连接上：发出验证消息
	void OnConnected()
	{
		VNETLOG(233,"频道选择 Socket 连接上\n");
		printf("B# 频道选择 Socket 连接上\n");
		//用户信息验证
//		var _Param = ""+window.GetMyUID()+","+window.MYDATA.GetDegree();
//		window.Too_Verify(_Param);
		TimerSelect();
	}

	//断开连接：返回登录界面
	void OnDisconnected()
	{
		printf("B# 频道选择socket断开！\n");
		window.ChannelChooseToLogin();
		window.find("UIController").LoadDLG(7);//与服务器断开连接！
	}

	//连接不上
	void OnConnectErr()
	{
		printf("B# 频道选择Socket连接不上！\n");
		window.ChannelChooseToLogin();
		window.find("UIController").LoadDLG(8);//连接服务器失败！
	}

	//发送GM公告反馈
	//参数：未知
	void prc_gm_affiche_res(param)
	{
		printf("B# 发送GM公告:"+param+"\n");return;
	}
	
	//用户验证反馈
	//参数：用户ID,请求结果
	void prc_verify_user_res(UserID,Res_Result)
	{
		parent.killtimer("Fun_IfSevRes_ChannelChoose_Timer");
		window.find("TOPLAYER").delallchild();
		if (Res_Result == 3)//正常用户 登陆成功
		{
			printf("B# 有效的普通用户,同步数据库\n");
			VNETLOG(233,"请求结果 有效的普通用户,同步数据库\n");
			TimerSelect();
			return;
		}
	}

	//取服务器信息:正确反馈
	//参数:服务器名字，服务器IP地址，大厅端口，房间端口，房间UDP端口，是否为称号限制,是否为域名(1是 0不是)
	void prc_get_info(_SerName,SvrIPAddr,RPort,GPort,UPort,QualifyLimit,iDomainName)
	{
		if (iDomainName == 0)
		{
			window.HALLIP = "socket:://"+SvrIPAddr+":"+RPort;	//"socket:://127.0.0.1:2008";
			window.ROOMIP = "socket:://"+SvrIPAddr+":"+GPort;	
			window.ROOMUDPIP = "udp:://"+SvrIPAddr+":"+UPort;	
		}
		if (iDomainName == 1)
		{
			window.HALLIP = ""+SvrIPAddr+":"+RPort;	//"sv19.dawawa.com:2008";
			window.ROOMIP = ""+SvrIPAddr+":"+GPort;	
			window.ROOMUDPIP = ""+SvrIPAddr+":"+UPort;	
		}

//		window.GameSvrIPAddr = SvrIPAddr;
		window.GameUPort = UPort;

		printf("B# 改变Socket--------window.HALLIP:"+window.HALLIP);
		printf("B# 改变Socket--------window.ROOMIP:"+window.ROOMIP);
		printf("B# 改变Socket--------window.ROOMUDPIP:"+window.ROOMUDPIP);
		
		//将选择的服务器名称 写近GameUI。mbd 的Selfdt表
		window.MYDATA.SetChannel(_SerName);

		window.SetMySvID(parent._VChannelChoose_Logic.m_SvID);

		if (QualifyLimit == 0)	//0称号符合要求  1称号不符合要求
		{
			window.g_HallIoType = iDomainName;
			window.ChannelChooseToHall();
			VNETLOG(232,"离开频道选择界面\n");
		}
		else
		{
			window.find("TOPLAYER").delallchild();
			window.find("UIController").LoadDLG(11);//您的称号不符合服务器称号限制，不能进入！
		}
	}

	//取服务器信息:错误反馈			
	// 0 服务器ID错误 1 服务器人数满了3	无效的用户
	void prc_get_info_err(Res_Result)
	{
		window.find("TOPLAYER").delallchild();
		if (Res_Result==0)
		{
			window.find("UIController").LoadDLG(12);//服务器ID错误
			return;
		}
		if (Res_Result==1)
		{
			window.find("UIController").LoadDLG(13);//服务器人数已满
			return;
		}
		if (Res_Result==3)
		{
			window.find("UIController").LoadDLG(14);//无效的用户
			return;
		}
	}

	//网络select完毕后调用
	void NetSelectEnd(mdbName,mtableName,Time)
	{
		if (mdbName == window.GAMEUI && mtableName == window.GAMESERVER)
		{
			parent._VChannelChoose_Logic.SelectServerByType();
			parent._VChannelChoose_Logic.m_CanClick = true;
		}
	}

	//定时 Select
	void TimerSelect()
	{
		//window.g_CArenaFunction.ClearGameServerTB();
		killtimer("TimerSelect_Name");
		timer(10000,"TimerSelect","TimerSelect_Name");
		// 函数名 本地库名 本地表名 目标库名 SQL语句 结果开始 结果数量 字段号
//		too("NetSelect","0,"+window.GAMEUI+","+window.GAMESERVER+",GameCenterDB.mdb,SELECT * FROM "+window.GAMESERVER+" WHERE "+window.GAMEUI_GAMESERVER_SVRID_STR+">=0,-1,-1,0,1,9,10,11,14,15");
		too("SelectSv",window.GAMEUI+","+window.GAMESERVER);//+",GameCenterDB.mdb,SELECT * FROM "+window.GAMESERVER+" WHERE "+window.GAMEUI_GAMESERVER_SVRID_STR+">=0,-1,-1,0,1,9,10,11,14,15");
	}

	//[功能]服务器提示
	//[参数]iType：类型:1.弹出框 2.聊天框
	//		szInfo：显示的信息
	void SvInfo(iType,szInfo)
	{
		window.find("TOPLAYER").delallchild();
		window.find("DLGLAYER").delallchild();
		if (iType == 1)
		{
			window.find("UIController").LoadDLG(250);//?
			window.find("DLGLAYER").find("VMyMessageBox_1_Logic").ReplaceData2(""+szInfo);
			return;
		}
		if (iType == 2)
		{
			window.WriteChat(7,szInfo);
			return;
		}
	}
};
