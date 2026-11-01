//随机游戏的List
//yxf 2009年11月25日

importex("$./../../UI/GameHall/ClassDef_RandGame_DBList.gml");

//一行显示类：
class VColumn_RandGame_Logic item
{
	size(239,50);bgcolor = "#FF00";
	var m_iRow=0;
	var m_RaceID = 0;		//报名ID
	var m_queueType = -1;	//单位类型
	var m_RaceState = 0;	//玩家此活动的状态： 1初始状态 2等待排队中 3暂停中 4已取消排队
	//===========================与显示交互======================
	void Init()
	{
		//按钮
		staticvar s_Btn_Rand = new VMyButton
		{
			//参数1:ID
			void SetData(id)
			{
				Init("随机:"+id);
			}
		}
		//玩家的活动状态
		//参数：data 1初始状态 2等待排队中 3暂停中 4已取消排队
		staticvar s_RaceState = new VMyText
		{
			src = "活动状态";bgcolor = "#FFFF";
		}
	}

	inclass("VColumn_RandGame_UI"); //界面显示类

	Init();
	
	void SetEvent()
	{
		set s_Btn_Rand
		{
			name = "BtnName_Hall_Rand_"+parent.m_RaceID;
			void OnPressed()
			{
				if (GetState() == window.BTN_STATE_LIGHT)
				{
//					window.LMH_GameHall_Rand();//引导事件
					if (window.g_FCM == 1)
					{
						window.find("UIController").LoadDLG(823);
						window.find("VMyMB_HJLSAppFCM_Logic")._type=parent.m_iRow;
					}
					else
						parent.OnClick_RandBtn();
				}
			}
		}
	}
	
	SetEvent();
	
	void OnClick_RandBtn()
	{
		if (m_RaceState == window.g_QUEUE_QUEUEWAIT || m_RaceState == window.g_QUEUE_PAUSE)
		{
			window.find("UIController").LoadDLG(511);//重复报名
			//window.WriteChat7(511);
//			window.find("RANDGAME_LOGIC").del();
//			window.find("UIController").LoadUI("UI_RANDGAME"); 
//			window.find("RANDGAME_LOGIC")._VRandGameTip_Logic.SetRaceID(m_RaceID);
			return;
		}

		//参数：用户id，报名id(玩家ID或者队伍ID)，报名类型(活动ID)
		var _Param = ""+window.GetMyUID()+","+m_queueType+","+m_RaceID;
	
		//[功能]判断是否要提示取消报名
		if (window.JudgeIsNeedCancelQueue(window.CANCELRACE_RANDGAME))
		{
			printf("B# JudgeIsNeedCancelQueue-OnClick_RandBtn():"+_Param);
			window.g_JionRoomParamArena = _Param;
			return;
		}

//		window.Tos_ApplyArenaRace(_Param);
		window.find("RANDGAME_LOGIC").del();
		window.find("UIController").LoadUI("UI_RANDGAME");
		window.find("RANDGAME_LOGIC")._VRandGameTip_Logic.SetMsgParam(_Param);
		window.find("RANDGAME_LOGIC")._VRandGameTip_Logic.SetRaceID(m_RaceID);
	}

	void OnDataExchange(iRow,szData)
	{
		m_RaceID = szData;
		m_iRow = iRow;
		name="Column_RandGame_"+m_iRow;
		s_Btn_Rand.SetData(m_RaceID);
		m_queueType = parent.fieldstr(iRow,window.M_G_SERVER_ARENARACE_QUEUETYPE);
		m_RaceState = parent.fieldstr(iRow,window.M_G_SERVER_ARENARACE_RACE_STATE);
		s_RaceState.SetData(m_RaceState);
		if(m_RaceState == window.g_QUEUE_QUEUEWAIT || m_RaceState == window.g_QUEUE_PAUSE)
		{
			window.find("RANDGAME_LOGIC").del();
			window.find("UIController").LoadUI("UI_RANDGAME");
			window.find("RANDGAME_LOGIC")._VRandGameTip_Logic.SetRaceID(m_RaceID);
			window.find("RANDGAME_LOGIC")._VRandGameTip_Logic.ApplyArenaRaceOk();
		}
	}
};

//
//总的类：List
//
class VGameHall_RandGame_Logic VN2ListCtrl
{
	//需要显示时改变
	size="239,97";//simpleshowmode="1,1";
	pos(0,10);
	//
	selecttype="1";colfilter="0";
	alpha = 70;
	bgcolor = "#123456";

	inclass("VGameHall_RandGame_UI"); //界面显示类
	columclass="0,VColumn_RandGame_Logic"; //ID
};