//主要是大厅的下边按钮层
set window
{
	//界面是否打开============================================================================
	var g_HallBtnMgr = new item
	{
		var m_Num = window.G_HALLBTN_MAX;			//大厅的按钮数
		var m_ArrHallBtnState = sysarray(m_Num);	//按钮代表的界面位置状态
		var m_ArrHallBtnUIName = sysarray(m_Num);	//按钮代表的界面Name
		var m_ArrHallBtnName = sysarray(m_Num);		//按钮Name
		
		var m_BeforeHideHallOpenUIName = sysarray(m_Num+4);	//隐藏界面前记录打开状态的界面名
		var m_HallOpenUIHideState = 0;	//0为非隐藏状态，1为隐藏状态
		void Init()
		{
			var _loop = 0;
			while(true)
			{
				if (_loop >= m_Num){break;}
				m_ArrHallBtnState[_loop] = window.G_HALLBTNSTATE_CLOSE;
				m_ArrHallBtnUIName[_loop] = "";
				_loop = _loop + 1;
			}
		}

		//清理之前的记录，用来记录当前状态
		void ClearHallAllUIState()
		{
			var _loop = 0;
			while(_loop < m_Num +3)
			{
				m_BeforeHideHallOpenUIName[_loop] = 0;
				_loop +=1;
			}
		}
		//点击隐藏界面之前，检查大厅所有UI的状态，1为打开状态，0为关闭状态
		void CheckHallAllUIState()
		{
			var _loop = 0;
			while (_loop < m_Num)
			{
				if (toint(m_ArrHallBtnState[_loop]) == window.G_HALLBTNSTATE_OPEN)
				{
					m_BeforeHideHallOpenUIName[_loop] = 1;
				}
				else
				{
					m_BeforeHideHallOpenUIName[_loop] = 0;
				}
				_loop += 1;
			}
			if(window.GetMainMenuOpenState())
			{
				m_BeforeHideHallOpenUIName[_loop] = 1;
			}
			else
			{
				m_BeforeHideHallOpenUIName[_loop] = 0;
			}
			_loop += 1;
			if(window.GetPackOpenState())
			{
				m_BeforeHideHallOpenUIName[_loop] = 1;
			}
			else
			{
				m_BeforeHideHallOpenUIName[_loop] = 0;
			}
			_loop += 1;
			if(window.GetRoleModelOpenState())
			{
				m_BeforeHideHallOpenUIName[_loop] = 1;
			}
			else
			{
				m_BeforeHideHallOpenUIName[_loop] = 0;
			}
			_loop += 1;
			if (window.find("CHAT_LOGIC")._chatMgr.GetFrameBkState() != 0)
			{
				m_BeforeHideHallOpenUIName[_loop] = 1;
			}
			else
			{
				m_BeforeHideHallOpenUIName[_loop] = 0;
			}
		}

		//设置是否处于隐藏状态
		void SetHallOpenUIHideState(_IsHide)
		{
			m_HallOpenUIHideState = _IsHide;
			//printf("xiayy:m_HallOpenUIHideState:"+m_HallOpenUIHideState);
		}
		void GetHallOpenUIHideState()
		{
			return m_HallOpenUIHideState;
		}

		void ClickHideHallOpenUI()
		{
			
			if(GetHallOpenUIHideState() == 1)
			{
				SetHallOpenUIHideState(0);
				var _loop = 0;
				while (_loop < m_Num)
				{
					if (toint(m_BeforeHideHallOpenUIName[_loop]) == 1)
					{
						var _temp = m_ArrHallBtnUIName[_loop];
						window.g_Row.InitByString(window.GAMEUI,window.UI,window.GAMEUI_UI_NAME,_temp);
						var _uiName = window.g_Row.GetData(window.GAMEUI_UI_UICODE);
						window.g_Row.Release();
						//printf("xiayy:"+_uiName);
						window.find("UIController").LoadUI(""+_uiName);
					}
					_loop += 1;
				}
				if(toint(m_BeforeHideHallOpenUIName[_loop]) == 1)
				{
					set window.find("TOPLAYER")
					{
						new VMainMenu_Hall_Logic{}
					}
				}
				_loop += 1;
				if(toint(m_BeforeHideHallOpenUIName[_loop]) == 1)
				{
					window.find("UIController").LoadUI("UI_PACK");
				}
				_loop += 1;
				if(toint(m_BeforeHideHallOpenUIName[_loop]) == 1)
				{
					window.find("UIController").LoadUI("UI_ROLEMODEL");
				}
				_loop += 1;
				if(toint(m_BeforeHideHallOpenUIName[_loop]) == 1)
				{
					window.find("CHAT_LOGIC")._chatMgr.SetMyShowState(true);
				}
			}
			else
			{
				SetHallOpenUIHideState(1);
				ClearHallAllUIState();
				CheckHallAllUIState();
				//Show();
				var _loop = 0;
				while (_loop < m_Num)
				{
					
					if(toint(m_BeforeHideHallOpenUIName[_loop]) == 1)
					{
						var _temp = m_ArrHallBtnUIName[_loop];
						window.find(""+_temp).del();
					}
					_loop += 1;
				}
				if(toint(m_BeforeHideHallOpenUIName[_loop]) == 1)
				{
					window.find("VMainMenu_Hall_Logic_Name").del();
				}
				_loop += 1;
				if(toint(m_BeforeHideHallOpenUIName[_loop]) == 1)
				{
					window.find("PACK_LOGIC").del();
				}
				_loop += 1;
				if(toint(m_BeforeHideHallOpenUIName[_loop]) == 1)
				{
					window.find("ROLEMODEL_LOGIC").del();
				}
				_loop += 1;
				if(toint(m_BeforeHideHallOpenUIName[_loop]) == 1)
				{
					window.find("CHAT_LOGIC")._chatMgr.SetMyShowState(false);
				}
			}
		}

		//测试用，用来查看数据
		void Show()
		{
			var _loop = 0;
			while(_loop < m_Num + 4)
			{
				var _temp = m_BeforeHideHallOpenUIName[_loop];
				printf("xiayy:"+_temp);
				_loop += 1;
			}
		}

		//[功能]打开/关闭 某个界面
		//[参数]_index:各个序号
		//		_state:状态
		void SetState(_index,_state)
		{
			if (_index < 0 || _index >= m_Num)
			{
				printf("B# g_HallBtnMgr:SetState:参数错误:_index:"+_index);
				return;
			}
			if (toint(_state) == window.G_HALLBTNSTATE_OPEN)
			{
				var _loop = 0;
				while(true)
				{
					if (_loop >= m_Num){break;}
					if (toint(m_ArrHallBtnState[_loop]) == window.G_HALLBTNSTATE_OPEN)
					{
						if (tostring(m_ArrHallBtnUIName[_loop]) != "")
						{
							window.find(""+m_ArrHallBtnUIName[_loop]).del();
						}
//						if (tostring(m_ArrHallBtnName[_loop]) != "")
//						{
//							window.find(""+m_ArrHallBtnName[_loop]).ClearBtnTextState(window.G_HALLBTNSTATE_CLOSE);
//						}
					}
					_loop = _loop + 1;
				}
			}
			
			if (tostring(m_ArrHallBtnName[_index]) != "")
			{
				window.find(""+m_ArrHallBtnName[_index]).ClearBtnTextState(_state);
			}

			m_ArrHallBtnState[_index] = _state;
		}
		
		//[功能]清除所有
		void ClearAll()
		{
			var _loop = 0;
			while(true)
			{
				if (_loop >= m_Num){break;}
				if (toint(m_ArrHallBtnState[_loop]) == window.G_HALLBTNSTATE_OPEN)
				{
					if (tostring(m_ArrHallBtnUIName[_loop]) != "")
					{
						window.find(""+m_ArrHallBtnUIName[_loop]).del();
					}
				}
				_loop = _loop + 1;
			}
		}

		//[功能]得到状态
		//[参数]_index:各个序号
		void GetState(_index)
		{
			if (toint(m_ArrHallBtnState[_index]) == window.G_HALLBTNSTATE_OPEN)
			{
				return true;
			}
			return false;
		}

		//[功能]设置界面的，名字
		//[参数]_index:各个序号
		//		_name:按钮代表界面的名字
		void SetUIName(_index,_name)
		{
			if (_index < 0 || _index >= m_Num)
			{
				printf("B# g_HallBtnMgr:SetUIName:参数错误:_index:"+_index);
				return;
			}
			m_ArrHallBtnUIName[_index] = _name;
		}

		void OnCreated()
		{
			Init();
			/*Begin*/
			SetUIName(window.G_HALLBTN_TOPSTAR,"TOPSTAR_LOGIC");//排行榜
			SetUIName(window.G_HALLBTN_MALL,"MALL_LOGIC");//商城
			SetUIName(window.G_HALLBTN_FRIEND,"FRIEND_LOGIC");//好友
			SetUIName(window.G_HALLBTN_USERLIST,"USERLIST_LOGIC");//玩家列表
			SetUIName(window.G_HALLBTN_FAMILY,"FAMILY_LOGIC");//家族
			SetUIName(window.G_HALLBTN_GAMEHALL,"GAMEHALL_LOGIC");//游戏大厅
			SetUIName(window.G_HALLBTN_TRAIN,"TRAIN_LOGIC");//训练
			SetUIName(window.G_HALLBTN_ARENA,"ARENA_LOGIC");//活动场
			SetUIName(window.G_HALLBTN_VIDEO,"VIDEO_LOGIC");//录像
			SetUIName(window.G_HALLBTN_MAIL,"MAIL_LOGIC");//邮件
			SetUIName(window.G_HALLBTN_TASK,"TASK_LOGIC");//任务
			SetUIName(window.G_HALLBTN_INVITE,"INVITE_LOGIC");//邀请
			/*End*/
		}
	}
	
	//[功能]设置大厅按钮名字
	//[参数]_index:序号
	//		_name:按钮代表界面的名字
	void SetHallBtnName(_index,_name)
	{
		g_HallBtnMgr.m_ArrHallBtnName[_index] = _name;
	}

	//[功能]设置大厅按钮打开状态
	//[参数]_index:序号
	//		_name:按钮代表界面的名字
	void SetHallBtn_UIName(_index,_name)
	{
		g_HallBtnMgr.SetUIName(_index,_name);
	}

	//[功能]设置大厅按钮打开状态
	//[参数]_index:序号
	void SetHallHtn_Open(_index)
	{
		g_HallBtnMgr.SetState(_index,window.G_HALLBTNSTATE_OPEN);
	}
	//[功能]设置大厅按钮关闭状态
	//[参数]_index:序号
	void SetHallHtn_Close(_index)
	{
		g_HallBtnMgr.SetState(_index,window.G_HALLBTNSTATE_CLOSE);
	}
	//[功能]大厅按钮的状态（打开与否）
	//[参数]_index:序号
	void IsHallHtnOpened(_index)
	{
		return g_HallBtnMgr.GetState(_index);
	}

	//[功能]清除其他按钮的选中状态
	//[参数]_index:序号
	void ClearOtherBtnState(_index)
	{
		//return g_HallBtnMgr.GetState(_index);
	}

	//清除大厅的界面
	void ClearHallBtnUI()
	{
		g_HallBtnMgr.ClearAll();
	}

	//清除房间的界面
	void ClearRoomBtnUI()
	{
		g_HallBtnMgr.ClearAll();
	}
	
	//清除其他可拖拽的界面
	void ClearOtherDragUI()
	{
		if (window.GetPackOpenState())
		{
			window.find("PACK_LOGIC").del();
		}
		if (window.GetSelfInfoOpenState())
		{
			window.find("SELFINFO_LOGIC").del();
		}
		if (window.GetRoomSetOpenState())
		{
			window.find("ROOM_SET_LOGIC").del();
		}
	}

	//商城==============================================================================
	var g_WantToOpenMall = false;//是否想要打开商城-有时间控制4秒后-即提示错误不打开
//	var g_IsOpenMalling = false;//是否正在打开商城-其他按钮不可点

	//[功能]点击打开商城后(全局唯一入口)
	//[参数]_type:打开方式  G_MALLOPENTYPE_HALL G_MALLOPENTYPE_ROOM
	void OnClick_Mall(_type)
	{
		//发出商城是否打开的消息：NULL
		window.Too_IsMallOpen();

		window.g_MallOpenType = _type;
	
		window.g_WantToOpenMall = true;
//		window.g_IsOpenMalling = true;
		killtimer("OpenMallErr_Name");
		timer(window._Time_OpenMallWait,"OpenMallErr","OpenMallErr_Name");
		window.LoadInfoBoard(351,window._Time_OpenMallWait);//正在打开商城……
	}
	//打开商城失败
	void OpenMallErr()
	{
		window.g_MallOpenType = -1;
		window.g_WantToOpenMall = false;
//		window.g_IsOpenMalling = false;
		window.find("UIController").LoadDLG(252);//打开商城失败，请稍候再试！
	}

	//背包==============================================================================
	var g_WantToOpenPack = false;//是否想要打开背包-有时间控制4秒后-即提示错误不打开
	
	/*
	//[功能]点击打开背包后(全局唯一入口)
	void OnConfirmOpenPack()
	{
		window.g_WantToOpenPack = true;
		window.killtimer("OpenPackErr_Name");
		timer(window._Time_OpenMallWait,"OpenPackErr","OpenPackErr_Name");
		window.LoadInfoBoard(251,window._Time_OpenPackWait);//正在打开背包……

		window.find("UIController").LoadUI("UI_PACK"); 	
	}
	//打开背包失败
	void OpenPackErr()
	{
		window.find("TOPLAYER").delallchild();
		window.find("PACK_LOGIC").del();
		window.g_WantToOpenPack = false;
		window.find("UIController").LoadDLG(199);//打开商城失败，请稍候再试！
	}
	*/
	//训练==================================================================
	void WaitEntryTrain()
	{
		//弹出提示框-正在同步数据
		window.LoadInfoBoard(164,window._Time_EntryTrainWait,"");//服务器处理中......
		window.timer(window._Time_EntryTrainWait,"WaitEntryTrainErr","WaitEntryTrainErr_Name");
	}
	//进入训练失败错误
	void WaitEntryTrainErr()
	{
		window.killtimer("WaitEntryTrainErr_Name");
		window.find("UIController").LoadDLG(165);//进入训练失败
	}

	//个人信息================================================================
	var g_WantToOpenSelfInfo = false;//是否想要打开个人信息-有时间控制4秒后-即提示错误不打开
	//var g_IsOpenSelfInfoing = false;//是否正在打开个人信息-不再打开其他的个人信息

	var g_SelfInfo_UID = -1;	//需要查看信息的玩家的UID
	var g_SelfInfo_Name = "";	//需要查看信息的玩家的昵称
	var g_SelfInfo_RID = -1;	//需要查看信息玩家的RoleID
	
	//[功能]设置要查看的个人信息数据-打开个人信息界面前必须调用(统一接口)
	//[参数]：UID，昵称，RoleID
	void SetSelfInfoData(UID,nkName,roleID)
	{
		printf("5# 个人信息:SetSelfInfoData()-UID:"+UID+",nkName:"+nkName+",roleID:"+roleID);

		if (window.GetSelfInfoOpenState() && window.g_SelfInfo_Name == nkName)
		{
			window.find("SELFINFO_LOGIC").del();
			return;
		}
		//防止在自己/别人详细信息弹框未关闭下又查看别人/自己的信息，造成页面信息位置错误
		//add by chenjihui
		//2010-12-20
		if (window.GetSelfInfoOpenState())
		{
			window.find("SELFINFO_LOGIC").del();
		}

//		if (window.GetStateByUID(UID) < 1)//离线
//		{
//			printf("D# 个人信息:SetSelfInfoData()-GetStateByUID():"+window.GetStateByUID(UID));
//			if(window.haveFamilyStateByUID(UID))
//			{
//				window.find("UIController").LoadDLG(666);
//				window.find("DLGLAYER").find("VMB_FamilyPopUpTipInfo_Logic").ReplaceData("查看信息失败，玩家不在此服务器");
//				return;
//			}
//			window.find("UIController").LoadDLG(145);//查看信息失败,玩家已离线！
//			return;
//		}
//		if (UID == "" || UID <= 0 || nkName == "" || nkName <= 0 || roleID == "" || roleID <= 0)
//		{
//			printf("D# 个人信息:SetSelfInfoData()-if (UID == window.DB_ERR || nkName == window.DB_ERR || roleID == window.DB_ERR)");
//			window.ClearSelfInfoData();//清除信息
//			window.find("UIController").LoadDLG(149);//查看玩家个人信息失败！
//			return;
//		}

		//发出取玩家信息的消息 参数：玩家ID
		window.Too_GetUserInfo(nkName);
		//发出取玩家信息的消息 参数：玩家ID,角色ID
		window.Too_GetRoleEquipGoods(nkName);
		//发出取玩家信息消息：玩家ID
		window.Too_GetUserInfoByID(nkName);
		//发出取玩家情侣信息的消息 参数：玩家ID
		window.Tos_CheckLoverID(UID);

		//window.g_IsOpenSelfInfoing = true;
		window.g_WantToOpenSelfInfo = true;

		window.g_SelfInfo_UID = UID;
		window.g_SelfInfo_Name = nkName;
		window.g_SelfInfo_RID = roleID;

		//弹出提示框-正在同步数据
		window.LoadInfoBoard(150,window._Time_OpenSelfInfoWait,"");//正在同步玩家数据……
		window.timer(window._Time_OpenSelfInfoWait,"LookSelfINfoErr","LookSelfINfoErr_Name");
	}

	//[功能]设置要查看的个人信息数据(只设置昵称)
	//[参数]：昵称
	void SetSelfInfoData_NkName(nkName)
	{
		printf("5# 个人信息:SetSelfInfoData_NkName();nkName:"+nkName);

		//var _UserID = window.GetUIDByName(nkName);
		//var _RoleID = window.GetRIDByName(nkName);

		window.SetSelfInfoData(_UserID,nkName,_RoleID);
	}

	//查看玩家个人信息错误
	void LookSelfINfoErr()
	{
		printf("5# 个人信息:LookSelfINfoErr()");

		window.killtimer("LookSelfINfoErr_Name");
		window.ClearSelfInfoData();//清除信息
		window.find("UIController").LoadDLG(149);//查看玩家个人信息失败！
	}

	//判断数据是否已设置
	//返回值 true 有效 false 无效
	void JudgeSelfInfoData()
	{
		printf("5# 个人信息:JudgeSelfInfoData()");
		
		return true;

//		window.g_Row.InitByInt(window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_UID,window.g_SelfInfo_UID);
//		if (!window.g_Row.IsReady())
//		{
//			window.g_Row.Release();
//			printf("B# error-JudgeSelfInfoData:"+window.M_G_SERVER+",TBName:"+window.USERDT);
//			return false;
//		}
//		window.g_Row.Release();
//
//		if (g_SelfInfo_Name != "" && toint(g_SelfInfo_RID) >0 && toint(g_SelfInfo_UID) >0)
//		{
//			return true;
//		}
//		else
//		{
//			return false;
//		}
	}
	//清空要查看的个人信息数据-关闭个人信息界面前必须调用
	void ClearSelfInfoData()
	{
		printf("5# 个人信息:ClearSelfInfoData()");

		window.g_SelfInfo_UID = -1;
		window.g_SelfInfo_Name = "";
		window.g_SelfInfo_RID = -1;

		//window.g_IsOpenSelfInfoing = false;
		window.g_WantToOpenSelfInfo = false;
	}
	
	//同步数据完成
	void IoSynchSelfInfo_Ok(ThirdParam)
	{
		printf("5# 个人信息:IoSynchSelfInfo_Ok()ThirdParam:"+ThirdParam);

		if (!window.g_WantToOpenSelfInfo)
		{
			printf("5# 个人信息:if (!window.g_WantToOpenSelfInfo)");

			window.ClearSelfInfoData();//清除信息
			window.find("UIController").LoadDLG(149);//查看玩家个人信息失败！
			if (window.g_DEBUG){printf("B# 查看个人信息的时间到了");}	
			return;
		}
		if (window.JudgeSelfInfoData())
		{
			window.killtimer("LookSelfINfoErr_Name");
			window.find("TOPLAYER").delallchild();
			
			if (window.GetSelfInfoOpenState())
			{
				window.find("SELFINFO_LOGIC").UpDateSeleInfoData();
				return;
			}
			window.g_SelfInfo_UID = toint(ThirdParam);

			window.find("UIController").LoadUI("UI_SELFINFO"); 
		}
		else
		{
			window.ClearSelfInfoData();//清除信息
			window.find("UIController").LoadDLG(149);//查看玩家个人信息失败！
		}
	}

	//背包==============================================================================
	var g_IsPackOpened = false;
	//[功能]设置背包界面是打开状态
	//[参数]param:true false 
	void SetPackOpenState(param)
	{
		window.find("BtnName_Hall_Bottom_Pack").ClearBtnTextState(param);
		g_IsPackOpened = param;
	}
	//[功能]得到背包界面是打开状态
	//[返回值]param:true false 
	void GetPackOpenState()
	{
		return g_IsPackOpened;
	}

	//个人信息==============================================================================
	var g_IsSelfInfoOpened = false;
	//[功能]设置个人信息界面是打开状态
	//[参数]param:true false 
	void SetSelfInfoOpenState(param)
	{
		g_IsSelfInfoOpened = param;
	}
	//[功能]得到个人信息界面是打开状态
	//[返回值]param:true false 
	void GetSelfInfoOpenState()
	{
		return g_IsSelfInfoOpened;
	}
	//角色模型==============================================================================
	var g_IsRoleModelOpened = false;
	//[功能]设置角色模型是打开状态
	//[参数]param:true false 
	void SetRoleModelOpenState(param)
	{
		window.find("BtnName_Hall_Bottom_SelfInfo").ClearBtnTextState(param);
		g_IsRoleModelOpened = param;
	}
	//[功能]得到角色模型是打开状态
	//[返回值]param:true false 
	void GetRoleModelOpenState()
	{
		return g_IsRoleModelOpened;
	}

	//主菜单============================================================================
	var g_IsMainMenuOpened = false;
	//[功能]设置主菜单是打开状态
	//[参数]param:true false 
	void SetMainMenuOpenState(param)
	{
		window.find("BtnName_Hall_Bottom_MainMenu").ClearBtnTextState(param);
		g_IsMainMenuOpened = param;
	}
	//[功能]得到主菜单是打开状态
	//[返回值]param:true false 
	void GetMainMenuOpenState()
	{
		return g_IsMainMenuOpened;
	}

	//房间设置============================================================================
	var g_IsRoomSetOpened = false;
	//[功能]设置房间设置是打开状态
	//[参数]param:true false 
	void SetRoomSetOpenState(param)
	{
		window.find("BtnName_ROOM_Bottom_RoomSet").ClearBtnTextState(param);
		g_IsRoomSetOpened = param;
	}
	//[功能]得到房间设置
	//[返回值]param:true false 
	void GetRoomSetOpenState()
	{
		return g_IsRoomSetOpened;
	}

	//GM工具聊天============================================================================
	var g_IsGMTOOLMsgOpened = false;
	//[功能]设置GM工具聊天是打开状态
	//[参数]param:true false 
	void SetGMTOOLOpenState(param)
	{
		g_IsGMTOOLMsgOpened = param;
	}
	//[功能]得到GM工具聊天
	//[返回值]param:true false 
	void GetGMTOOLOpenState()
	{
		return g_IsGMTOOLMsgOpened;
	}

	//游戏设置============================================================================
	var g_IsGameSetUpOpened = false;
	//[功能]设置游戏设置是打开状态
	//[参数]param:true false 
	void SetGameSetUpOpenState(param)
	{
		g_IsGameSetUpOpened = param;
	}
	//[功能]得到游戏设置
	//[返回值]param:true false 
	void GetGameSetUpOpenState()
	{
		return g_IsGameSetUpOpened;
	}

	//按钮的事件触发====================================================================
	//点击了主菜单
	void OnClick_Btn_MainMenu()
	{
		if (window.GetMainMenuOpenState())
		{
			window.find("VMainMenu_Hall_Logic_Name").del();
			return;
		}
		set window.find("TOPLAYER")
		{
			new VMainMenu_Hall_Logic{}
		}
	}
	
	//点击了快捷方式1
	void OnClick_BTN_ShortCut_1()
	{
		//alert("快捷方式1");
	}
	//点击了快捷方式1
	void OnClick_BTN_ShortCut_2()
	{
		//alert("快捷方式2");
	}
	//点击了快捷方式1
	void OnClick_BTN_ShortCut_3()
	{
		//alert("快捷方式3");
	}

	//点击了明星榜
	void OnClick_BTN_TopStar()
	{
		if (window.IsHallHtnOpened(window.G_HALLBTN_TOPSTAR))
		{
			window.find("TOPSTAR_LOGIC").del();
			return;
		}
		window.LMH1_Hall_Bottom_TopStar();	//引导事件
		window.find("UIController").LoadUI("UI_TOPSTAR"); 
	}
	//点击了商城
	void OnClick_BTN_Mall()
	{
		if (window.IsHallHtnOpened(window.G_HALLBTN_MALL))
		{
			window.find("MALL_LOGIC").del();
			return;
		}

		window.OnClick_Mall(window.G_MALLOPENTYPE_HALL);

		if (!window.GetRoleModelOpenState())
		{
			window.find("ROLEMODEL_LOGIC").del();
			window.find("UIController").LoadUI("UI_ROLEMODEL");
		}
	}

	//在背包到商城
	void OnClick_BTN_PackToMall()
	{
		if (window.IsHallHtnOpened(window.G_HALLBTN_MALL))
		{
			window.find("MALL_LOGIC").del();
		}

		window.OnClick_Mall(window.G_MALLOPENTYPE_HALL);

	}
	//点击了商城-房间
	void OnClick_Room_Mall()
	{
		if (window.IsHallHtnOpened(window.G_HALLBTN_MALL))
		{
			window.find("MALL_LOGIC").del();
			return;
		}
		window.OnClick_Mall(window.G_MALLOPENTYPE_ROOM);
	}

	//点击了好友
	void OnClick_BTN_Friend()
	{
		if (window.IsHallHtnOpened(window.G_HALLBTN_FRIEND))
		{
			window.find("FRIEND_LOGIC").del();
			return;
		}
		window.LMH1_Hall_Bottom_Friend();	//引导事件
		window.find("UIController").LoadUI("UI_FRIEND"); 
	}
	//点击了玩家列表
	void OnClick_BTN_UserList()
	{
		if (window.IsHallHtnOpened(window.G_HALLBTN_USERLIST))
		{
			window.find("USERLIST_LOGIC").del();
			return;
		}
		window.LMH1_Hall_Bottom_UserList();	//引导事件
		window.find("UIController").LoadUI("UI_USERLIST"); 
	}
	//点击了家族
	void OnClick_BTN_Family()
	{
		//return;
		var _isFamilyOpen = window.IsHallHtnOpened(window.G_HALLBTN_FAMILY);
		if(_isFamilyOpen)
		{
			window.F_Family_enter(window.FAMILY_ENTER_OUT);
		}
		else
		{
			window.F_Family_enter(window.FAMILY_ENTER_IN);
		}
//		sleep(5000);
//		var _isFamilyMsgBack = window.IsHallHtnOpened(window.G_HALLBTN_FAMILY);
//		if(!_isFamilyMsgBack)
//		{
//			window.find("UIController").LoadDLG(665);
//			return;
//		}
	}

	//点击了游戏大厅
	void OnClick_BTN_GameHall()
	{
		if (window.IsHallHtnOpened(window.G_HALLBTN_GAMEHALL))
		{
			window.find("GAMEHALL_LOGIC").del();
			return;
		}
		window.find("UIController").LoadUI("UI_GAMEHALL");
		window.LMH1_Hall_Bottom_GameHall();	//引导事件
	}
	//点击了训练
	//[参数]_isDel:==1时 如果有界面不删除 ==2时有只删除
	void OnClick_BTN_Train(_isDel)
	{
		if (window.IsHallHtnOpened(window.G_HALLBTN_TRAIN))
		{
			if (_isDel == 1)
			{
				return;
			}
			window.find("TRAIN_LOGIC").del();
			return;
		}

		window.LMH1_Hall_Bottom_Train();	//引导事件

		//同步完成的训练,只需要发送一次
		window.Tos_SynAchieveTrain(""+window.GetMyUID());
		window.find("UIController").LoadUI("UI_TRAIN"); 
	}
	//点击了活动场
	void OnClick_BTN_Arena()
	{
		if (window.IsHallHtnOpened(window.G_HALLBTN_ARENA))
		{
			window.find("ARENA_LOGIC").del();
			return;
		}
		window.find("UIController").LoadUI("UI_ARENA");
	}
	//点击了录像
	void OnClick_BTN_Video()
	{
		if (window.IsHallHtnOpened(window.G_HALLBTN_VIDEO))
		{
			window.find("VIDEO_LOGIC").del();
			return;
		}
		window.LMH1_Hall_Bottom_Video();	//引导事件
		window.find("UIController").LoadUI("UI_VIDEO");
	}
	//点击了邮件
	void OnClick_BTN_Mail()
	{
		if (window.IsHallHtnOpened(window.G_HALLBTN_MAIL))
		{
			window.find("MAIL_LOGIC").del();
			return;
		}
		window.LMH1_Hall_Bottom_Mail();	//引导事件
		window.find("UIController").LoadUI("UI_MAIL");
	}
	//点击了邮件-房间
	void OnClick_Room_Mail()
	{
		if (window.IsHallHtnOpened(window.G_HALLBTN_MAIL))
		{
			window.find("MAIL_LOGIC").del();
			return;
		}
		window.LMH1_Hall_Bottom_Mail();	//引导事件
		window.find("UIController").LoadUI("UI_MAIL");
	}

	//点击了任务
	void OnClick_BTN_Task()
	{
		if (window.IsHallHtnOpened(window.G_HALLBTN_TASK))
		{
			window.find("TASK_LOGIC").del();
			return;
		}
		window.find("UIController").LoadUI("UI_TASK");
	}

	//[功能]点击了角色模型
	//[参数]_isdel:是否只是删除;
	void OnClick_BTN_RoleModel(_isdel)
	{
		if (window.GetRoleModelOpenState())
		{
			window.find("ROLEMODEL_LOGIC").del();
			return;
		}
		if (_isdel == 1)
		{
			return;
		}
		window.find("UIController").LoadUI("UI_ROLEMODEL"); 
	}

	//点击了个人信息
	void OnClick_BTN_SelfInfo()
	{
		if (window.GetSelfInfoOpenState())
		{
			window.find("SELFINFO_LOGIC").del();
			return;
		}

		//设置要查看的个人信息数据
		//参数：UID,昵称，RoleID
		window.SetSelfInfoData(window.GetMyUID(),window.GetMyName(),window.GetMyRID());
	}

	//点击了背包
	void OnClick_BTN_Pack()
	{
		printf("B# UIMgr:OnClick_BTN_Pack()");
		if (window.g_WantToOpenPack)
		{
			printf("B# UIMgr:OnClick_BTN_Pack()正在打开!");
			return;
		}
		if (window.GetPackOpenState())
		{
			printf("B# UIMgr:OnClick_BTN_Pack()已打开");
			window.find("PACK_LOGIC").del();
			return;
		}
		printf("B# UIMgr:OnClick_BTN_Pack()未打开");
		
		window.g_WantToOpenPack = true;
		//window.OnConfirmOpenPack();
		window.LMH1_Hall_Bottom_Pack();	//引导事件
		window.find("UIController").LoadUI("UI_PACK"); 
		// add by chenjihui
		window.Too_GetShopTime();
	}
	//点击了背包-房间
	void OnClick_Room_Pack()
	{
		window.OnClick_BTN_Pack();
	}
	
	//点击了邀请
	void OnClick_Room_Invite()
	{
		if (window.IsHallHtnOpened(window.G_HALLBTN_INVITE))
		{
			window.find("INVITE_LOGIC").del();
			return;
		}
		window.find("UIController").LoadUI("UI_ROOM_INVITE");
	}

	//点击了房间设置
	void OnClick_Room_RoomSet()
	{
		if (window.GetRoomSetOpenState())
		{
			window.find("ROOM_SET_LOGIC").del();
			return;
		}
		window.find("UIController").LoadUI("UI_ROOM_SET"); //房间设置
	}

	//点击了设置
	void OnClick_BtnGameSetUp()
	{
		window.find("UIController").LoadUI("UI_GAMESETUP"); 
	}

	//点击了帮助
	void OnClick_BTN_Help()
	{
		window.find("UIController").LoadDLG(20);//暂无此功能
	}
	//点击了返回频道
	void OnClick_BTN_ReturnChannel()
	{
		//[功能]判断是否要提示取消报名 type:1进房间 2返回频道
		if (window.JudgeIsNeedCancelQueue(window.CANCELRACE_RETURNCHENNEL))
		{
			printf("B# JudgeIsNeedCancelQueue-OnClick_BTN_ReturnChannel()");
			return;
		}
		window.delChargCarSelect();
		window.OtherToChannelChoose();
//			window.find("UIController").LoadDLG(111);//你确定要返回频道选择吗？
	}
	//点击了退出游戏
	void OnClick_BTN_ExitGame()
	{
		window.find("UIController").LoadDLG(10);//确定要退出游戏吗？
	}

	//点击了帮助层-主要解决各种新new在window下界面残留
	void OnClick_HELPLAYER()
	{
//		if (window.GetUIPos() == window.POS_GAMESETUP)
//		{
//			window.find("ComBoxList_Login").SetMyHide(false);
//			window.find("ComBoxList_Hall").SetMyHide(false);
//			window.find("ComBoxList_Game").SetMyHide(false);
//		}
//		if (window.GetUIPos() == window.POS_WRITEMAIL)
//		{
//			window.find("ComBoxList_WriteMail").SetMyHide(false);
//		}
//		if (window.GetUIPos() == window.POS_BUYCAR)
//		{
//			window.find("ComBoxList_BuyCar").SetMyHide(false);
//		}
	}

	//点击了事件层
	void OnClick_EVENTLAYER()
	{
		if (window.GetMainMenuOpenState())
		{
			window.find("VMainMenu_Hall_Logic_Name").del();
		}
	}
	
	//还原游戏设置-当来不及保存界面被删除时
	void DeoxidizeGameSetUp()
	{
		if (window.GetGameSetUpOpenState())
		{
			window.find("GAMESETUP_LOGIC")._VGameSetUp_Logic.OnClick_BtnCancel();
		}
	}
	//HNTV==============================================================================
	//充值
	void OnClick_Payment()
	{
		OpenWeb("http://passport.mangogame.com/Payment/SelectGate?game=TBB");
		//window.find("UIController").LoadDLG(20);//暂无此功能
	}

	//忘记密码
//	void OnClick_ForgetPW()
//	{
//		window.find("UIController").LoadDLG(20);//暂无此功能
//	}

	//修改密码(暂时不要了)
//	void OnClick_ModifyPW()
//	{
//		window.find("LOGIN_LOGIC")._VLogin_Logic.OnClick_BtnReSetMM();
//		//window.find("UIController").LoadUI("UI_MODIFY_PW");
//		//window.find("UIController").LoadDLG(20);//暂无此功能
//	}

	//注册帐号
	void OnClick_Register()
	{
		OpenWeb("http://passport.mangogame.com/Account/Register");
		//window.find("UIController").LoadDLG(20);//暂无此功能
	}
	//HNTV-End=========================================================================
}