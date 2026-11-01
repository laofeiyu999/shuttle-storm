//
//登录界面-UI+Logic
//yxf 2008年8月15日
//

importex("$./ClassDef.gml");
import("$./ClassDef_Socket.gml");
import("$./ClassDef_MsgBox.gml");

new item
{
	name = "LOGIN_LOGIC";size = "100%,100%";

	void PlayLoginMusic()
	{
		window.PlayMusic(window.g_CSoundSet.GetBgMusic(window.eBgMusic_Login));	//主题曲.ogg
		sleep(500); //不睡一会儿会非法
		
		window.find("CDisplaySet").SaveDisPlaySet(0);

		_VLogin_Logic.SetUserNameHot();
	}

	//==========================快捷键==================================
	window.find("gameinput").AddShortcutUser(this);
	window.SetUIPos(window.POS_LOGIN);
	void OnCreated()
	{
		window._IsLoginConnected = 0;	//标识没有连接上login的socket
		//window._IndexOfLoginIP = 0;		//从0开始取IP
		window.find("UIController").LoadUI("UI_LOGIN_BG");
		window.find("UIController").LoadUI("UI_LOGIN_BTN");

		//引导
		window.find("eventCounter").SaveHistory();
		window.g_CTennisUIInit.SaveConfig();
	}
	void OnDelete()
	{
		window.find("gameinput").DelShortcutUser(this);
	}
	void DI_ShortcutKey(data)
	{
		switch (data)
		{
			case 3: //Esc
			{
				window.find("UIController").LoadDLG(10);//确定要退出游戏吗？
				_VLogin_Logic.s_Edit_PassWord.setFocus(false);
				_VLogin_Logic.s_Edit_UserName.hot = 0;
				//_VLogin_Logic.OnClick_BtnExit();
				break;
			}
			case 4: //Enter
			{
				_VLogin_Logic.OnClick_BtnLogin();
				break;
			}
			case 7://Tab
			{
				if (_VLogin_Logic.m_ifFocusInNameEdit)
				{
					_VLogin_Logic.SetPassWordHot();
				}
				else
				{
					_VLogin_Logic.SetUserNameHot();
				}
			}
		}
	}
	//====================================================================
	var _VLogin_Logic = new VLogin_Logic{}
	
	var m_LoginIO = new VLogin_Socket_Logic{}

	//版本号
	new text
	{
		font = "黑体,-1,20";bold = true;color = "#FFFFFF";
		valign(6,0);halign(95,0);
		src = "版本号："+window.gmlEdition_UI;
	}

	//=======================io===========================================
	var m_LoginParam = "";	//用户名+密码等信息
	var m_IoType = 0;		//1点登录 2点修改密码
	var TYPE_LOGIN = 1;		//登录
	var TYPE_MODIFY = 2;	//修改密码
	var m_GetIPIndex = 0;	//序号
	var m_IsTiped = false;	//是否已经提示过了

	//[功能]点击了登录或修改密码
	//[参数]_type:1点登录 2点修改密码
	void OnClick_LoginOrModify(_type)
	{	
		m_IsTiped = false;
		m_IoType = _type;
		m_GetIPIndex = 0;
		window.find("CTennisUIInit").InitLoginIP();	//从0开始

		if (window.g_IsLoginConnected == 0)
		{
			OpenIoLink(); //打开Socket
		}
		else
		{
			SendLoginMsg_OpenModify();
		}
	}

	//[功能]发送登录消息/打开修改密码界面
	void SendLoginMsg_OpenModify()
	{
		//1点登录 2点修改密码
		switch (m_IoType)
		{
			case 0:break;
			case 1:
			{
				//发出登录请求:"用户名,密码","机器的MAC"
				window.Too_Login(m_LoginParam);
				killtimer("Fun_IfSevRes_login_Timer");
				timer(window.g_Login_TimeOut,"Error_MessageBox(19)", "Fun_IfSevRes_login_Timer");//服务器长时间未响应
				break;
			}
			case 2:			
			{
				window.find("UIController").LoadUI("UI_MODIFY_PW");
				break;
			}
			default:break;
		}
	}

	//打开连接 
	void OpenIoLink()
	{
		if (window.g_IsLoginConnected == 1)
		{
			printf("6# 登录：OpenIoLink()已经连接上了！m_GetIPIndex:"+m_GetIPIndex+);
			return;
		}

		m_GetIPIndex += 1;
		window.g_IsLoginConnected = 0;
		window.LOGINIP = window.find("CTennisUIInit").GetLoginIP();
		
		printf("6# 登录：OpenIoLink()m_GetIPIndex:"+m_GetIPIndex+",window.LOGINIP:"+window.LOGINIP);
		
		killtimer("LOGIN_TIMER_GETIP");

		if (window.LOGINIP == "-1")
		{
			//尊敬的网球宝贝玩家：因服务器关闭或网络连接问题，暂时不能登录。请稍候点击确定重试！
			//VMyMB_Connet_Again_Logic
			Error_MessageBox(18);
			return;
		}

		m_LoginIO.close();
		m_LoginIO.open(window.LOGINIP);
		
		timer(window.g_GetIP_Time,"OpenIoLink","LOGIN_TIMER_GETIP");
	}

	//[功能]弹框提示统一接口
	//[参数]id:对话框的ID
	void Error_MessageBox(id)
	{
		killtimer("LOGIN_TIMER_GETIP");
		killtimer("Fun_IfSevRes_login_Timer");

		if (m_IsTiped)
		{
			printf("6# Error_MessageBox()已经提示过了！");
			return;
		}

		window.find("TOPLAYER").delallchild();
		window.find("UIController").LoadDLG(id);

		_VLogin_Logic.s_Btn_Login.SetState(window.USER_STATE_REDAY);//按钮为亮的
		_VLogin_Logic.s_Edit_UserName.hot=0;
		_VLogin_Logic.s_Edit_PassWord.hot=0;
		
		m_IsTiped = true;
		m_LoginIO.close();
	}
}