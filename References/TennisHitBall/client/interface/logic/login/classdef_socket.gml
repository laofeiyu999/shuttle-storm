//
//网球-登录界面的IO类定义
//

class VLogin_Socket_Logic LoginSocket
{
	name = "LOGIN_SOCKET";

	void OnDelete()
	{
		window.g_IsLoginConnected = 0;
	}

	//用户请求监视器,监测到数据库中的数据有更新，发送网络消息到服务器
	new RequestMonitor
	{
		SetNetMsgMethod(1);								//定制发消息类型;1使用too()发消息，2使用tos()发消息
		SetMonitorTable(window.GAMEUI,window.REQUEST_LOGIN);	//设置需要监视的数据表
	}
	//网络消息监视器,根据数据库中存储的网络消息，回调脚本中的函数
	new NetMsgMonitor
	{
		SetMonitorTable(window.GAMEUI,window.EVENT_LOGIN);	//设置需要监视的数据表
	}

	//连接上
	void OnConnected()
	{
		VNETLOG(231,"登陆界面Socket已连接上\n");
		printf("B# 登陆界面Socket已连接上");   	
		window.g_IsLoginConnected = 1;//是否连接上 0没有 1已连接
		parent.SendLoginMsg_OpenModify();
	}

	//断开连接
	void OnDisconnected()
	{
		window.g_IsLoginConnected = 0;
		printf("B# 登录socket断开连接");
		parent.Error_MessageBox(7);//与服务器断开连接！
	}
	
	//登录的反馈
	//参数："标识操作","标识结果","用户ID","用户的称号","好友服务器IP","录像服务器IP","排行榜服务器IP",玩家等级
	void prc_login_res(iOP,iRCode,iUserID,iQualify,strNkName,friendIP,replayIP,topSvIP,iLv)
	{
		if (iOP == 1)//登陆服务器
		{
			switch (iRCode)
			{
				case 0://未知
				{
					printf("B# 登录的反馈：未知操作！\n");
					parent.Error_MessageBox(1);//未知操作！
					break;
				}
				case 1://没有用户
				{
					printf("B# 登录的反馈：没有用户！\n");
					parent.Error_MessageBox(2);//没有用户！
					break;
				}
				case 2://成功
				{
					LoginOK_ByAnyWay(iUserID,strNkName,friendIP,replayIP,topSvIP,iQualify,iLv);
					break;
				}
				case 3://数据库错误
				{
					printf("B# 登录的反馈：数据库错误！\n");
					parent.Error_MessageBox(3);//数据库错误！
					break;
				}
				case 4://密码错误
				{
					printf("B# 登录的反馈：密码错误！\n");
					parent.Error_MessageBox(15);//密码错误
					break;
				}
				case 5://获取令牌出错
				{
					printf("B# 登录的反馈：获取令牌出错！\n");
					parent.Error_MessageBox(676);//获取令牌出错 登录失败，强行终止！
					break;
				}
			}
			return;
		}
		if (iOP == 2)//网球简单注册
		{
			switch (iRCode)
			{
				case 2://成功
				{
					break;
				}
				case 3://昵称含有非法字符
				{
					printf("B# 登录的反馈：昵称含有非法字符\n");
					parent.Error_MessageBox(4);//昵称含有非法字符
					break;
				}
				case 4://昵称与别人的重复
				{
					printf("B# 登录的反馈：昵称与别人的重复\n");
					parent.Error_MessageBox(5);//昵称与别人的重复
					break;
				}
				case 5://获取令牌出错
				{
					printf("B# 登录的反馈：获取令牌出错！\n");
					parent.Error_MessageBox(676);//获取令牌出错 登录失败，强行终止！
					break;
				}
				case -5://写数据库失败
				{
					printf("B# 登录的反馈：写数据库失败\n");
					parent.Error_MessageBox(6);//写数据库失败
					break;
				}
			}
			return;
		}
		if (iOP == 3)//版本验证
		{
			parent.Error_MessageBox(100);//您的客户端不是最新版本，请检查更新！
			var _text = "您的客户端不是最新版本，请下载安装最新的客户端!";
			window.find("VMyMessageBox_1_Logic").SetData(_text);
			return;
		}
		if (iOP == 4)//芒果帐号验证
		{
			if (iRCode == -1)
			{
				parent.Error_MessageBox(1);//未知操作！
				return;
			}
			if (iRCode == 0)
			{
				parent.Error_MessageBox(98);//验证成功
				return;
			}
			if (iRCode == 1)
			{
				parent.Error_MessageBox(130);//账号信息读取失败，请稍候重试！
				return;
			}
			if (iRCode == 2)
			{
				parent.Error_MessageBox(132);//帐号或密码错误
				return;
			}
			if (iRCode == 3)
			{
				parent.Error_MessageBox(99);//您的账号已被停权！
				return;
			}
			if (iRCode == 4)
			{
				parent.Error_MessageBox(133);//帐号不存在
				return;
			}
			if (iRCode == -98)
			{
				parent.Error_MessageBox(3);//数据库连接失败
				return;
			}
			if (iRCode == -99)
			{
				parent.Error_MessageBox(1);//未知错误
				return;
			}
		}
	}

	//不管什么 方式登录成功 都调这个函数
	void LoginOK_ByAnyWay(_userID,_NKname,friendIP,replayIP,topSvIP,iQualify,iLv)
	{
		window.PlaySound(128);//登陆成功
		printf("B# 登录成功了！LoginOK_ByAnyWay:_NKname:"+_NKname+",replayIP:"+replayIP+",topSvIP:"+topSvIP+",friendIP:"+friendIP);
		
		//写好友IP
		window.FRIENDIP = "socket://"+friendIP;
	//退出原来的，登入现在的
		if("P"!=_NKname)
		{
			window.find("friendsys").Login(_userID,_NKname);
			window.g_EmptyRole=0;
		}
		else
		{
			window.g_EmptyRole=1;
		}
		
		//排行榜IP
		window.GAMETOPSVIP = topSvIP;

		//写录像IP
		var _tempIP = replayIP.Left(replayIP.Find(":"));
		var _tempPort = replayIP.Mid(replayIP.Find(":")+1,replayIP.Count); 
		
		window.GAMEREPLAYIP = _tempIP;
		window.GAMEREPLAYIP_PORT_DOWN = toint(_tempPort);
		window.GAMEREPLAYIP_PORT_UP = toint(_tempPort);// + 1;
		printf("B# 登录成功了！录像IP:"+window.GAMEREPLAYIP+",下行:"+window.GAMEREPLAYIP_PORT_DOWN+",上行:"+window.GAMEREPLAYIP_PORT_UP);

		VNETLOG(1133,"LoginOK_ByAnyWay-SetMyQualify:iQualify:"+iQualify+"\n");
		window.SetMyQualify(iQualify);		//保存称号
		window.SetMyUID(_userID);			//保存用户ID-New
		window.MYDATA.SetUID(_userID);		//保存用户ID-Old即将抛弃
		window.MYDATA.SetCurLevel(iLv);		//保存等级
		window.MYDATA.SetDegree(_degree);	//自己的身份
//		window.MYDATA.SetNKName(_NKname);	//昵称
//		window.MYDATA.SetSex(_Sex);			//性别

		parent._VLogin_Logic.LoginOkSaveAccount();//登录成功后保存用户名

		//引导事件
//		window.eventCounter.LoadHistory();
		window.find("gameinput").GetSelfInputConverse();
		window.find("eventCounter").Init_EventCount();
	
		window.LoginToChannelChoose();
		
		if (window.g_DEBUG)
		{
			window.title = "网球宝贝-ID:"+_userID;
		}
		
		window.find("BuyCarRecord").InitAccount(_NKname);
	}

	//修改密码
	void prc_modify_password(iRCode)
	{
		if (iRCode == 1000)
		{
			window.find("UIController").LoadDLG(435);//密码修改成功！
			window.find("MODIFY_PW_LOGIC").del();
			return;
		}
		if (iRCode == -1000)
		{
			window.find("UIController").LoadDLG(118);//原始密码错误,注意密码区分大小写！
			window.find("MODIFY_PW_LOGIC")._VModify_PW_Logic.OldPWErr();
			return;
		}
		if (iRCode == -1001)
		{
			window.find("UIController").LoadDLG(119);//用户名不存在,请注意检查！
			return;
		}
		if(iRCode == -5)
		{
			window.find("UIController").LoadDLG(677);//写数据库失败
			return;
		}
	}

	//[功能]服务器提示
	//[参数]iType：类型:1.弹出框 2.聊天框
	//		szInfo：显示的信息
	void SvInfo(iType,szInfo)
	{
		window.find("DLGLAYER").delallchild();
		if (iType == 1)
		{
			parent.Error_MessageBox(250);//?
			window.find("DLGLAYER").find("VMyMessageBox_1_Logic").ReplaceData2(""+szInfo);
			return;
		}
//		if (iType == 2)
//		{
//			window.WriteChat(7,szInfo);
//			return;
//		}
	}
};