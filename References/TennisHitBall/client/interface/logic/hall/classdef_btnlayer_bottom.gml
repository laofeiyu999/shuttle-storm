//
//大厅（商城+社区+大奖赛+训练+网球比赛）界面的按钮层-下 类定义
//

importex("$./../../UI/Hall/ClassDef_BtnLayer_Bottom.gml");

class VHall_BtnLayer_Bottom_Logic item
{
	size = "100%,5%";bgcolor = "#FF";alpha = 80;
	valign(100,0);
	//=========================与界面交互===========================
	void Init()
	{
		//主菜单：按钮
		staticvar s_BTN_MainMenu = new VMyButton
		{
			Init("主菜单");size(70,30);
		}

		//快捷方式1
		staticvar s_BTN_ShortCut_1 = new VMyButton
		{
			Init("^");size(30,30);pos(80,0);
		}
		//快捷方式2
		staticvar s_BTN_ShortCut_2 = new VMyButton
		{
			Init("^");size(30,30);pos(110,0);
		}
		//快捷方式3
		staticvar s_BTN_ShortCut_3 = new VMyButton
		{
			Init("^");size(30,30);pos(140,0);
		}

		//排行榜
		staticvar s_BTN_TopStar = new VMyButton
		{
			pos(180,0);Init("排行榜");size(70,30);
		}
		//商城
		staticvar s_BTN_Mall = new VMyButton
		{
			pos(255,0);Init("商城");size(50,30);
		}
		//好友
		staticvar s_BTN_Friend = new VMyButton
		{
			pos(310,0);Init("好友");size(50,30);
		}
		//玩家列表
		staticvar s_BTN_UserList = new VMyButton
		{
			pos(365,0);Init("玩家列表");size(80,30);
		}
		//家族
		staticvar s_BTN_Family = new VMyButton
		{
			pos(450,0);Init("家族");size(50,30);
		}

		//游戏室：Radio
		staticvar s_BTN_GameHall = new VMyButton
		{
			pos(585,0);Init("游戏室");size(70,30);
		}
		//训练：Radio
		staticvar s_BTN_Train = new VMyButton
		{
			pos(530,0);Init("训练");size(50,30);
		}
		//活动场：Radio
		staticvar s_BTN_Arena = new VMyButton
		{
			pos(660,0);Init("活动场");size(70,30);
		}
		//录像：Radio
		staticvar s_BTN_Video = new VMyButton
		{
			pos(730,0);Init("录像");size(50,30);
		}
		//邮件：Radio
		staticvar s_BTN_Mail = new VMyButton
		{
			pos(780,0);Init("邮件");size(50,30);
		}
		//任务：Radio
		staticvar s_BTN_Task = new VMyButton
		{
			pos(850,0);Init("任务");size(50,30);
		}

		//个人信息：按钮
		staticvar s_BTN_SelfInfo = new VMyButton
		{
			pos(885,0);Init("个人信息");size(80,30);
		}
		//背包：按钮
		staticvar s_BTN_Pack = new VMyButton
		{
			pos(970,0);Init("背包");size(50,30);
		}
	}
	inclass("VHall_BtnLayer_Bottom_UI");//界面显示类
	//==============================function=========================================
	//见Globals_UIMgr.gml
	//===============================================================================
	//设置响应事件
	void SetEvent()
	{
		set s_BTN_MainMenu
		{
			name = "BtnName_Hall_Bottom_MainMenu";
			staticvar _isOpen = false;
			void OnPressed()
			{
				window.g_HallBtnMgr.SetHallOpenUIHideState(0);
				if (GetState() == window.BTN_STATE_GREY){return;}
				window.OnClick_Btn_MainMenu();
			}
		}
		set s_BTN_ShortCut_1
		{
			void OnPressed(){if (GetState() == window.BTN_STATE_GREY){return;}window.OnClick_BTN_ShortCut_1();}
		}
		set s_BTN_ShortCut_2
		{
			void OnPressed(){if (GetState() == window.BTN_STATE_GREY){return;}window.OnClick_BTN_ShortCut_2();}
		}		
		set s_BTN_ShortCut_3
		{
			void OnPressed(){if (GetState() == window.BTN_STATE_GREY){return;}window.OnClick_BTN_ShortCut_3();}
		}
		
		set s_BTN_TopStar
		{
			name = "BtnName_Hall_Bottom_TopStar";
			window.SetHallBtnName(window.G_HALLBTN_TOPSTAR,this.name);
			void OnPressed()
			{
				window.g_HallBtnMgr.SetHallOpenUIHideState(0);
				if (GetState() == window.BTN_STATE_GREY){return;}window.OnClick_BTN_TopStar();
			}
		}
		set s_BTN_Mall
		{
			name = "BtnName_Hall_Bottom_Mall";
			window.SetHallBtnName(window.G_HALLBTN_MALL,this.name);
			void OnPressed()
			{
				window.g_HallBtnMgr.SetHallOpenUIHideState(0);
				if (GetState() == window.BTN_STATE_GREY){return;}
				window.OnClick_BTN_Mall();
			}
		}
		set s_BTN_Friend
		{
			name = "BtnName_Hall_Bottom_Friend";
			window.SetHallBtnName(window.G_HALLBTN_FRIEND,this.name);
			void OnPressed()
			{
				if(toint(window.find("friendsys")._loginok) == 1)
				{
					window.g_HallBtnMgr.SetHallOpenUIHideState(0);
					if (GetState() == window.BTN_STATE_GREY){return;}window.OnClick_BTN_Friend();
				}
				else
				{
					window.find("UIController").LoadDLG(675);
				}
				
			}
		}
		set s_BTN_UserList
		{
			name = "BtnName_Hall_Bottom_UserList";
			window.SetHallBtnName(window.G_HALLBTN_USERLIST,this.name);
			void OnPressed()
			{
				window.g_HallBtnMgr.SetHallOpenUIHideState(0);
				if (GetState() == window.BTN_STATE_GREY){return;}window.OnClick_BTN_UserList();
			}
		}
		set s_BTN_Family
		{
			name = "BtnName_Hall_Bottom_Family";
			window.SetHallBtnName(window.G_HALLBTN_FAMILY,this.name);
			//SetState(window.BTN_STATE_GREY);
			void OnPressed()
			{
				if(toint(window.find("friendsys")._loginok) == 1)
				{
					window.g_HallBtnMgr.SetHallOpenUIHideState(0);
					if (GetState() == window.BTN_STATE_GREY){return;}window.OnClick_BTN_Family();
				}
				else
				{
					window.find("UIController").LoadDLG(675);
				}
				
			}
		}
		set s_BTN_GameHall
		{
			name = "BtnName_Hall_Bottom_GameHall";
			window.SetHallBtnName(window.G_HALLBTN_GAMEHALL,this.name);
			void OnPressed()
			{
				window.g_HallBtnMgr.SetHallOpenUIHideState(0);
				if (GetState() == window.BTN_STATE_GREY){return;}window.OnClick_BTN_GameHall();
			}
		}
		set s_BTN_Train
		{
			name = "BtnName_Hall_Bottom_Train";
			window.SetHallBtnName(window.G_HALLBTN_TRAIN,this.name);
			void OnPressed()
			{
				window.g_HallBtnMgr.SetHallOpenUIHideState(0);
				if (GetState() == window.BTN_STATE_GREY){return;}window.OnClick_BTN_Train();
			}
		}
		set s_BTN_Arena
		{
			name = "BtnName_Hall_Bottom_Arena";
			window.SetHallBtnName(window.G_HALLBTN_ARENA,this.name);
			void OnPressed()
			{
				window.g_HallBtnMgr.SetHallOpenUIHideState(0);
				if (GetState() == window.BTN_STATE_GREY){return;}window.OnClick_BTN_Arena();
			}
		}
		set s_BTN_Video
		{
			name = "BtnName_Hall_Bottom_Video";
			window.SetHallBtnName(window.G_HALLBTN_VIDEO,this.name);
			void OnPressed(){window.g_HallBtnMgr.SetHallOpenUIHideState(0);if (GetState() == window.BTN_STATE_GREY){return;}window.OnClick_BTN_Video();}
		}
		set s_BTN_Mail
		{
			name = "BtnName_Hall_Bottom_Mail";
			window.SetHallBtnName(window.G_HALLBTN_MAIL,this.name);
			void OnPressed(){window.g_HallBtnMgr.SetHallOpenUIHideState(0);if (GetState() == window.BTN_STATE_GREY){return;}window.OnClick_BTN_Mail();}
		}
		set s_BTN_Task
		{
			name = "BtnName_Hall_Bottom_Task";
			window.SetHallBtnName(window.G_HALLBTN_TASK,this.name);
			//SetState(window.BTN_STATE_GREY);
			void OnPressed(){window.g_HallBtnMgr.SetHallOpenUIHideState(0);if (GetState() == window.BTN_STATE_GREY){return;}window.OnClick_BTN_Task();}
		}
		set s_BTN_SelfInfo
		{
			name = "BtnName_Hall_Bottom_SelfInfo";
			void OnPressed()
			{
				window.g_HallBtnMgr.SetHallOpenUIHideState(0);
				if (GetState() == window.BTN_STATE_GREY){return;}
				window.OnClick_BTN_RoleModel();
				
			}
		}
		set s_BTN_Pack
		{
			name = "BtnName_Hall_Bottom_Pack";
			void OnPressed()
			{
				window.g_HallBtnMgr.SetHallOpenUIHideState(0);
				if (GetState() == window.BTN_STATE_GREY){return;}
				window.g_MyItemsCheck.CheckChargeItemDeadLine();
				window.OnClick_BTN_Pack();
			}
		}
	}
	//================================DBList=========================================
	void OnCreated()
	{
		Init();
		SetEvent();
		window.OnClick_BTN_RoleModel();
		var _raceid = window.GetMyRaceID();
		if ( _raceid > 0 && !window.IsRandomRace(_raceid))
		{
			window.OnClick_BTN_Arena();
		}
		else
		{
			window.OnClick_BTN_GameHall();
		}
	}
};