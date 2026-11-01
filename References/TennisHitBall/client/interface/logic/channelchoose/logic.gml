//
//频道界面-UI+Logic
//yxf 2008年8月18日
//

importex("$./ClassDef.gml");
//importex("$./ClassDef_ActivityAffiche.gml");
import("$./ClassDef_Socket.gml");
import("$./ClassDef_MsgBox.gml");
//import("$./ClassDef_NewEdition.gml");
//import("$./ClassDef_CloseEdition.gml");

new item
{	
	window.g_ItemOverdue = 1;
	name = "CHANNELCHOOSE_LOGIC";size = "100%,100%";show = false;
	window.SetUIPos(window.POS_CHANNELCHOOSE);
	window.g_ChannelServerID = 0;
	//==========================快捷键==================================
	window.find("gameinput").AddShortcutUser(this);
	void OnCreated()
	{
		window.SetMyState(0); //我的状态 0离线 1空闲 2房间 3游戏
		show = true;
		window.find("UIController").LoadUI("UI_CHANNEL_CHOOSE_BG");
		window.find("UIController").LoadUI("UI_CHANNEL_CHOOSE_BTN");
		
		window.LMH1_ChannelCreated();//引导事件
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
				window.find("UIController").LoadDLG(110);//你确定要返回登录吗？
				break;
			}
			case 4: //Enter
			{
				_VChannelChoose_Logic.OnClick_BtnEnter();
				break;
			}
		}
	}

	//====================================================================
	var _VChannelChoose_Logic = new VChannelChoose_Logic{}
//	var _VChannelChoose_R_Logic = new VChannelChoose_ActivityAff_Logic{}
//	var _NewEdition = new VChannelChoose_NewEdition_Logic{show = false;}
//	var _CloseEdition = new VChannelChoose_CloseEdition_Logic{show = false;}
	//=======================io===========================================
	new VChannelChoose_Socket_Logic{}

	void Fun_IfSevRes_ChannelChoose()
	{
		if (window.IsUIPos(window.POS_CHANNELCHOOSE))
		{
			window.find("TOPLAYER").delallchild();
			window.find("UIController").LoadDLG(19);//服务器长时间未响应
		}
	}
	//检查服务器是否反馈
	void Check_IfSevRes_ChannelChoose()
	{
		killtimer("Fun_IfSevRes_ChannelChoose_Timer");
		timer(30000,"Fun_IfSevRes_ChannelChoose", "Fun_IfSevRes_ChannelChoose_Timer");
	}
	
	void OnClick_NewEdition()
	{
		s_IMG_everyday.show = false;
		_VChannelChoose_R_Logic.show = false;
		_NewEdition.show = true;
		_CloseEdition.show = false;
	}
	
	void OnClick_CloseEdition()
	{
		s_IMG_everyday.show = false;
		_VChannelChoose_R_Logic.show = false;
		_NewEdition.show = false;
		_CloseEdition.show = true;
	}

	void OnClick_Edition_Close()
	{
		s_IMG_everyday.show = true;
		_VChannelChoose_R_Logic.show = true;
		_NewEdition.show = false;
		_CloseEdition.show = false;
	}

	window.BeginShotcutChatSet();
	
}