//
//房间界面的提示框类定义
//yxf 2009年3月31日

//网速差的提示
//目前网络连接不稳定，确定要开始游戏吗？
class VMB_ConfirmBegin_Logic VMyMessageBox_2_Logic
{
	name = "VMB_ConfirmBegin_Logic";
	
	//construct
	function VMB_ConfirmBegin_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		window.find("ROOM_LOGIC")._VRoom_Logic.Confirm_BeginGame();
		del();
	}
};

//房主XX要将押注金额改为XX，是否同意  是/否”
//目前网络连接不稳定，确定要开始游戏吗？
class VMB_AgreeModify_Logic VMyMessageBox_2_Logic
{
	name = "VMB_AgreeModify_Logic";
	
	//construct
	function VMB_AgreeModify_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		//参数:用户ID，是否同意,0表示不同意,1表示同意
		var _param = ""+window.GetMyUID()+",1";
		window.Too_nf_wager_idea(_param);
		del();
	}
	//点击取消按钮或者按Esc时调用-继承时需要被覆盖
	void OnCancel()
	{
		//参数:用户ID，是否同意,0表示不同意,1表示同意
		var _param = ""+window.GetMyUID()+",0";
		window.Too_nf_wager_idea(_param);	
		del();
	}
	
	set _Box
	{
		void Init()
		{
			//密码输入框
			staticvar s_Edit = new edit
			{
				valign(50,0);halign(50,0);
				color = "#ffffff";bgcolor = "#FF";
				size = "200,50";maxsize = 10;
				hot = 1;
			}
			//确定按钮
			staticvar s_Btn_Confirm = new VMyButton
			{
				Init("确定");valign(96,0);halign(15,0);
			}
			//取消按钮
			staticvar s_Btn_Cancel = new VMyButton
			{
				Init("取消");valign(96,0);halign(95,0);
			}
		}
		HideAllObj();
		inclass("VMB_AgreeModify_UI");//界面显示类
		Init();
		SetEvent();
	}

	timer(window.g_ChangeWager_Time,"OnCancel");//10秒默认不同意
};