//
//竞技赛结算弹出界面
//2009年11月22日

importex("$./ClassDef_S.gml");
importex("$./ClassDef_D.gml");

new item
{
	name = "ARENAOVER_LOGIC";size = "100%,100%";capturemouse = true;enableUpdate(1);
	
	new VGame_BtnLayer_Top_Logic{}

	//var _LastPos = window.GetUIPos();
	window.SetUIPos(window.POS_GAMEOVER);
	void OnCreated()
	{
		window.find("gameinput").AddExclusiveShortcutUser(this);
		timer(window._Time_GameOver,"OnClick_BtnBackToHall");
		window.SetChatEnterFlag(window.CHAT_ENTER_NO,"ARENAOVER_LOGIC");//不激活
	}
	void OnDelete()
	{	
		//window.SetUIPos(_LastPos);
		window.find("gameinput").DelShortcutUser(this);
		window.SetChatEnterFlag(window.CHAT_ENTER_YES,"ARENAOVER_LOGIC");//能激活
	}
	void DI_ShortcutKey(data)
	{
		switch (data)
		{
			case 3: //Esc
			{
				//OnClick_BtnBackToHall();
			}
		}
	}

	var _P1UID = 0;			//P1的UserID - 自己的ID
	var _P2UID = 0;			//P2的UserID - 对手1号的ID
	var _P3UID = 0;			//P3的UserID - 自己队友的ID
	var _P4UID = 0;			//P4的UserID - 对手2号的ID
	var _RoomType = 0;		//房间的类型 0未知 1网球竞技单 2网球竞技双 
	var _Win = 0;			//胜利或者失败 0为默认 1表示输 2表示赢
	var _RaceID =0;			//比赛ID

/**
	var _User1 = new VUserDT_Logic
	{
		Init(window.GetMyUID());
	}
	var _arenaOver = new VArenaOver_Logic{}
	*/
	var m_IsAllEnd = false;

	//返回大厅
	void OnClick_BtnBackToHall()
	{
		if(window.GetQueueTypeByID(window.FamilyCompleteID) == window.FAMILY_COMPLETE_TYPE)
		{
			window.GameToFamilyRoom();
		}
		else
		{
			window.GameToHall(m_IsAllEnd);
		}
		
	}

	//清除所有用户的数据
	void RemoveAllUserData(deskid)
	{
		var _VNet2DBTable=new VNet2DBTable{};
		var sql = "SELECT * FROM userdt WHERE did="+deskid;
		_VNet2DBTable.Select( window.M_G_SERVER,sql);
		_VNet2DBTable.SetIntAllData(window.M_G_SERVER_USERDT_DID,-1,true);
		_VNet2DBTable.SetIntAllData(window.M_G_SERVER_USERDT_GAMESTATION,0,true);
		_VNet2DBTable.del();
	}

	//外部接口
	//参数 raceID:比赛ID
	//参数 roomtype :房间类型 0未知 1网球竞技单 2网球竞技双
	//参数 SelfID:自己的UserID
	//参数 P2:对手1号的ID
	//参数 P3:自己队友的ID
	//参数 P4:对手2号的ID
	//参数 Win ：胜利或失败 0为默认 1表示输 2表示赢 3活动特殊
	//参数 TriggerTrainID ：触发的训练 

	void SetData(raceID,type,SelfID,P2,P3,P4,Win)
	{
		printf("B# 活动结算:raceID:"+raceID+",type:"+type+",SelfID:"+SelfID+",P2:"+P2+",P3:"+P3+",P4:"+P4+",win:"+Win);
		if (Win == 3)
		{
			window.LMH_Arena_Eliminate();
		}
		//保存录像
		window.find("GAMELAYER").find("NAME_GCMap").EndSaveRecord();
		
		if (window.g_DEBUG)
		{
			printf("B# !!GameOver：type:"+type+",SelfID:"+SelfID+",p2:"+P2+",P3:"+P3+",P4:"+P4+",Win:"+Win+",TriggerTrainID:"+TriggerTrainID);
		}

		_RaceID = raceID;
		_RoomType = type%2;
		_P1UID = SelfID;
		_P2UID = P2;
		_P3UID = P3;
		_P4UID = P4;
		_Win = Win;

		if (_RoomType == 1)//单打
		{
			staticvar _User1 = new VUserDT_Logic
			{
				Init(parent._P1UID);
			}
			staticvar _User2 = new VUserDT_Logic
			{
				Init(parent._P2UID);
			}
			//活动场结算界面
			staticvar _VArena_Over_Logic = new VArena_Over_S_Logic{}
		}
		if (_RoomType == 0)//双打
		{
			staticvar _User1 = new VUserDT_Logic
			{
				Init(parent._P1UID);
			}
			staticvar _User2 = new VUserDT_Logic
			{
				Init(parent._P2UID);
			}
			staticvar _User3 = new VUserDT_Logic
			{
				Init(parent._P3UID);
			}
			staticvar _User4 = new VUserDT_Logic
			{
				Init(parent._P4UID);
			}
			//活动场结算界面
			staticvar _VArena_Over_Logic = new VArena_Over_D_Logic{}
		}

		RemoveAllUserData(window.GetMyRoomID());
		window.find("GAMELAYER").delallchild();//在此断开IO

		window.g_ArenaWinOrLost = Win;//比赛的输赢 0为默认 1表示输 2表示赢

		//_arenaOver.GetDataFromDB(raceID);
	}

//	//点击了保存录像
//	void MySaveVideo()
//	{
//		window.SaveVideo(1,_Win);	
//	}

}