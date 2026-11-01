//
//登录界面的逻辑部分类定义
//

import("$./../../UI/Login/ClassDef.gml");

class VLogin_Logic item
{
	size = "380,420";bgcolor = "#FF00";alpha = 0;
	valign(50,0);halign(50,0);
	var m_IfRemember = 1;	//是否记住用户名 1记住 0不记住
	var m_ifFocusInNameEdit = false;//看看焦点在那里？-在用户名框里就切到密码，没有就切到用户名
	//=========================与界面交互=========================
	void Init()
	{
		//帐号:edit
		staticvar s_Edit_UserName = new edit
		{
			size = "220,26";pos = "110,56";
			font = "宋体,-1,20";bgcolor = "#FF";color = "#FFFFFF";cursorcolor = "#FFFFFF";
			maxsize = 16;ycenter = true;xcenter = true;
			timer(10,"hot=1");
		}
		//密码:edit
		staticvar s_Edit_PassWord = new edit
		{
			size = "220,26";pos = "110,91";
			font = "宋体,-1,20";bgcolor = "#FF";color = "#FFFFFF";cursorcolor = "#FFFFFF";
			maxsize = 16;ycenter = true;xcenter = true;
			password = true;
		}
	
		//复选框：记住密码
		staticvar s_CHK_RememberPW = new VMyCheckBox
		{
			size = "30,30";pos = "210,130";Init("√");
		}
		
		//忘记密码
//		staticvar s_ForgetPW = new VMyText2//带下划线的文字
//		{
//			valign(55,0);halign(20,0);
//			src = "忘记密码";
//		}

		//登陆：按钮
		staticvar s_Btn_Login = new VMyButton
		{
			valign(98,0);halign(20,0);
			Init("登陆");
		}
	}
	
	inclass("VLogin_UI");//界面显示类
	//============================function===============================
	//点击了登录
	void OnClick_BtnLogin()
	{
		var _vllVer = toint(window.tennisGameStatic.GetVar());
		var _gmlVer = toint(window.tennisclientVer);
		printf("_vllVer:"+_vllVer+",_gmlVer:"+_gmlVer);
		//验证配置
		if ( _vllVer != _gmlVer)
		{
			window.find("UIController").LoadDLG(100);//您的客户端不是最新版本，请检查更新！
			var _text = "您的客户端版本不匹配，请注意检查更新！";
			window.find("VMyMessageBox_1_Logic").SetData(_text);
			return;
		}

		//验证配置
		if (window.tennisGameStatic.CheckRenderCaps() == 0 || window.tennisGameStatic.CheckLogicCaps() == 0)
		{
			window.find("UIController").LoadDLG(117);//您的机器配置不符合《网球宝贝》的配置要求，无法进行游戏！
			return;
		}
		
		if (s_Edit_UserName.src == "")
		{
			window.find("UIController").LoadDLG(401);//用户名不能为空，请输入用户名！
			SetUserNameHot();
			return;
		}
//		if (window.g_CStrFilter.Filter3(s_Edit_UserName.src) == 0)//判断是否a-z A-Z 0-9
//		{
//			window.find("UIController").LoadDLG(403);//用户名只能是字母、数字！
//			SetUserNameHot();
//			return;
//		}
		if (s_Edit_PassWord.src == "")
		{
			window.find("UIController").LoadDLG(402);//密码不能为空，请输入密码！
			SetPassWordHot();
			return;
		}
		
		var _EthernetInFo = new EthernetInFo{};
		var _Param = ""+s_Edit_UserName.src+","+s_Edit_PassWord.src+","+_EthernetInFo.GetEthernetMac()+","+window.gmlEdition;
		parent.m_LoginParam = _Param; //记下登录参数
		
		s_Edit_UserName.hot=0;
		s_Btn_Login.SetState(window.BTN_STATE_GREY);//按钮为灰的
		
		window.find("DLGLAYER").delallchild();
		window.LoadInfoBoard(34,1,"");	//服务器连接中，请稍候……
		parent.OnClick_LoginOrModify(parent.TYPE_LOGIN);
	}
	//登录成功后保存用户名
	void LoginOkSaveAccount()
	{
		if (window.g_Login_IfRemember == 1)
		{
			window.g_CTennisUIInit.SetLoginUserName(s_Edit_UserName.src);
			return;
		}
		if (window.g_Login_IfRemember == 0)
		{
			window.g_CTennisUIInit.SetLoginUserName("");
			return;
		}
	}
	//设置焦点-用户名
	void SetUserNameHot()
	{
		timer(10,"s_Edit_UserName.hot=1");
	}
	//设置焦点-密码
	void SetPassWordHot()
	{
		timer(10,"s_Edit_PassWord.hot=1");
	}
	//点击了忘记密码
//	void OnClick_ForgetPW()
//	{
//		window.OnClick_ForgetPW();
//	}
	//点击了修改密码
	void OnClick_BtnReSetMM()
	{
		parent.OnClick_LoginOrModify(parent.TYPE_MODIFY);
	}

	//设置响应事件
	void SetEvent()
	{
		set s_Edit_UserName//帐号:edit
		{
			//void OnEnter(){parent.OnClick_BtnLogin();}
			void OnFocus()
			{
				window.find("gameinput").SetClipBoardData();
				parent.m_ifFocusInNameEdit = true;
			}
			void OnLostFocus()
			{
				parent.m_ifFocusInNameEdit = false;
			}
		}
		set s_Edit_PassWord//密码:edit
		{
			src = window.g_DEFAULT_PASSWORD;
			//void OnEnter(){parent.OnClick_BtnLogin();}
			void OnFocus()
			{
				window.find("gameinput").SetClipBoardData();
			}
		}
		set s_CHK_RememberPW//复选框：记住密码
		{
			if(window.g_Login_IfRemember == 1)
			{
				startstate = 1;
			}
			void OnCheck(){MouseCheck();parent.m_IfRemember = 1;window.g_Login_IfRemember = parent.m_IfRemember;}
			void OnUnCheck(){MouseUnCheck();parent.m_IfRemember = 0;window.g_Login_IfRemember = parent.m_IfRemember;}
		}
//		set s_ForgetPW
//		{
//			void OnClick()
//			{
//				parent.OnClick_ForgetPW();
//			}
//		}
		set s_Btn_Login//登陆：按钮
		{
			void OnPressed()
			{
				if (GetState() == window.BTN_STATE_LIGHT) //亮的时候才能点
				{
					parent.OnClick_BtnLogin();
				}
			}
		}
	}

	void OnCreated()
	{
		var _systemResolutionState = window.g_CDisplaySet.CheckSystemResolution();
		if(!_systemResolutionState)
		{
			window.find("UIController").LoadDLG(673);
		}
		Init();
		SetEvent();
		s_Edit_UserName.src = window.g_CTennisUIInit.GetLoginUserName();
		//退出原来的账号
		window.find("friendsys").scr_OffLine();
	}
};