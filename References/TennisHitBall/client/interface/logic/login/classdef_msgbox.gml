//
//登录界面的提示框类定义
//

//退出游戏的提示
class VMyMB_ExitGame_Logic VMyMessageBox_2_Logic
{
	name = "VMyMB_ExitGame_Logic";
	
	//construct
	function VMyMB_ExitGame_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		window.del();
	}	
};

//登录服务器没有连接上需要重来
class VMyMB_Connet_Again_Logic VMyMessageBox_2_Logic
{
	name = "VMyMB_Connet_Again_Logic";
	
	//construct
	function VMyMB_Connet_Again_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		window.find("LOGIN_LOGIC")._VLogin_Logic.OnClick_BtnLogin();
		del();
	}
};

//您的机器配置不符合《网球宝贝》的配置要求，无法进行游戏！
class VMyMB_GRPZ_Logic VMyMessageBox_2_Logic
{
	name = "VMyMB_GRPZ_Logic";
	
	//construct
	function VMyMB_GRPZ_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		window.del();
	}	
};

//您的桌面分辨率不满足游戏最低的要求
class VMySystemResolutionCheck_Logic VMyMessageBox_1_Logic
{
	name = "VMySystemResolutionCheck_Logic";
	
	//construct
	function VMySystemResolutionCheck_Logic(id)
	{
		VMyMessageBox_1_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		window.del();
	}
	void OnCancel()
	{
		window.del();
	}
};

//帐号不存在
class VMyMB_Null_Accounts_Logic VMyMessageBox_1_Logic
{
	name = "VMyMB_Null_Accounts_Logic";
	
	//construct
	function VMyMB_Null_Accounts_Logic(id)
	{
		VMyMessageBox_1_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		window.g_CTennisUIInit.OpenIE("http://passport.mangogame.com/Account/GameActiveSelect");
		del();
	}

	void OnCreated()
	{
		set _Box.s_Btn_Confirm
		{	
			InitText("立即激活");
		}
	}
};