//
//游戏内界面-UI+Logic
//yxf 2008年8月12日
//

import("$./ClassDef_BeginLogic_S.gml");
import("$./ClassDef_BeginLogic_D.gml");
import("$./ClassDef_PlayLogic_S.gml");
import("$./ClassDef_PlayLogic_D.gml");
import("$./ClassDef_PlayLogic_Sub.gml");
importex("$./../task/ClassDef_RandTaskTip.gml");

new item
{
	name = "GAME_LOGIC";size = "100%,100%";show = false;

	var _canbesend = 1; //1:可以发 0：不可以发
	var _msgcount = 0; //2秒内4条
	//==========================快捷键==================================
	//window.find("NAME_GCMap").KeyBoardEnable(0);//锁定解锁按键
	window.find("gameinput").AddExclusiveShortcutUser(this);	//添加快捷键用户
	window.find("gameinput").SetExclusiveUser(this);//设置独占用户
	//window.find("gameinput").SetDirOnUse(0);//0是关闭方向,1是开启方向

	void OnDelete()
	{
		//window.find("gameinput").SetDirOnUse(1);//0是关闭方向,1是开启方向
		window.find("gameinput").DeleteUser(this);
		window.find("gameinput").DelShortcutUser(this);
		//window.find("NAME_GCMap").KeyBoardEnable(1);//0锁定解锁按键 1解除锁定
		window.find("VRandTaskTip_Logic_Name").del();//随机任务提示删除
	}

	//重置
	void resetGameChatTag()
	{
		_canbesend = 1;
		_msgcount = 0;
	}
	//聊天限制
	void LimitChat()
	{
		if (_canbesend != 1){return false;}
		if (_msgcount == 0)
		{
			killtimer("Game_ResetTag");
			timer(2000,"resetGameChatTag","Game_ResetTag");
		}
		if (_msgcount >= 4)
		{
			window.WriteChat7(1001);

			_canbesend = 0;
			killtimer("Game_ResetTag");
			timer(2000,"resetGameChatTag","Game_ResetTag");
			return false;
		}
		_msgcount += 1;
		return true;
	}
	void DI_ShortcutKey(data)
	{
		if(toint(data)>=10 && toint(data)<=19)
		{
			// 比赛中,聊天框处于焦点时,不能用快捷键  add by ak
			if (window.GetChatTypeByPos()==2 && window.find("ChatMgr_Logic")._send._input.isFocus()==1) return;
			if (LimitChat())
			{
				var _shotcutChatType = window.g_CShotcutChat.GetShotcutChatType();
				var _sendmsg = window.GetShotcutContent(data,_shotcutChatType);
				var _Param = ""+window.CHAT_COMMON+","+window.CHAT_UIPOS_GAME+",\""+_sendmsg+"\","+window.GetMyName()+",0";
				window.Too_SendChatMsg(_Param,0,window.CHAT_UIPOS_GAME);
				return;
			}
		}
		switch (data)
		{
			case 3: //Esc
			{
				break;
			}
			case 4: //Enter
			{
				break;
			}
		}
	}
	//====================================================================
	var _ESkill = new VEquipSkill_Logic{}

	//以下变量具体怎么来的，需要后期修改
	var _RoomType = 0;		//房间的类型 0未知 1网球竞技单 2网球竞技双 
	var _P1UID = 0;			//P1的UserID - 自己的ID
	var _P2UID = 0;			//P2的UserID - 对手1号的ID
	var _P3UID = 0;			//P3的UserID - 自己队友的ID
	var _P4UID = 0;			//P4的UserID - 对手2号的ID
	var _GameNum = window.GetRoomGameNum();	//游戏局制
	var _GameMusicID = -1;	//游戏音乐ID

	//初始化UserID
	//参数 roomtype :房间类型 0未知 1网球竞技单 2网球竞技双
	//参数 SelfID:自己的UserID
	//参数 P2:对手1号的ID
	//参数 P3:自己队友的ID
	//参数 P4:对手2号的ID
	void Init(type,SelfID,P2,P3,P4)
	{
		//强制引导BUG补救，防止玩家因为触发强制引导而在比赛中打开背包
		window.LMH1_DelCap();
		
		if (window.g_DEBUG)
		{
			printf("B# GAME_LOGIC：type:"+type+",SelfID:"+SelfID+",p2:"+P2+",P3:"+P3+",P4:"+P4);
		}
		//错误类型
		if (type<1 && window.g_ArenaJoinRoom==true)
		{
			printf("B# GAME_LOGIC:房间类型错误,比赛无法继续,正确是类型是>1的。当前类型:"+type);
			//window.GameToHall();
			type = 3;
		}
		_RoomType = type;
		var _TempRoomType = type%2;
		_P1UID = SelfID;
		_P2UID = P2;
		_P3UID = P3;
		_P4UID = P4;
		
		if (_TempRoomType == 1)//单打
		{
			staticvar _User1 = new VUserDT_Logic{var _faqiu = 0;Init(parent._P1UID);}
			staticvar _User2 = new VUserDT_Logic{Init(parent._P2UID);}
			//开场界面
			staticvar _VGame_Begin_Logic = new VGame_Begin_S_Logic{}
			//游戏中界面
			staticvar _VGame_Playing_Logic = new VGame_Playing_S_Logic{show = false;}
		}
		if (_TempRoomType == 0)//双打
		{
			staticvar _User1 = new VUserDT_Logic{var _faqiu = 0;Init(parent._P1UID);}
			staticvar _User2 = new VUserDT_Logic{Init(parent._P2UID);}
			staticvar _User3 = new VUserDT_Logic{Init(parent._P3UID);}
			staticvar _User4 = new VUserDT_Logic{Init(parent._P4UID);}
			//开场界面
			staticvar _VGame_Begin_Logic = new VGame_Begin_D_Logic{}
			//游戏中界面
			staticvar _VGame_Playing_Logic = new VGame_Playing_D_Logic{show = false;}
		}

		_VGame_Playing_Logic.InitDBBinding();
		
		if (window.g_DEBUG)
		{
			printf("B# GAME_LOGIC:拆分后技能:1:"+_ESkill.GetID(0)+",2:"+_ESkill.GetID(1)+",3:"+_ESkill.GetID(2)+",4:"+_ESkill.GetID(3)+",5:"+_ESkill.GetID(4));
		}
		_User1.InitSkill(_ESkill.GetID(0),_ESkill.GetID(1),_ESkill.GetID(2),_ESkill.GetID(3),_ESkill.GetID(4));
		_VGame_Playing_Logic.Init_Skill();
		
		//推拽用
		new VGame_BtnLayer_Top_Logic{}
	}

	//[功能]设置游戏局制(目前适用于在不进房间但需要使用游戏界面需要调用)
	//[参数]_num:游戏局制 1 2 3
	void SetGameNum(_num)
	{
		printf("B# GAME_LOGIC：SetGameNum():_num:"+_num);
		_GameNum = _num;
	}
	//=====================================================================

	void ChangeDisplay()
	{
		if (window.g_DEBUG)
		{
			printf("B# VS显示完了:"+window.GetMyUID());
		}
		_VGame_Begin_Logic.del();
		
		//vs界面显示完了
		//发出地图加载完毕消息:自己的ID
		var _Param = ""+window.GetMyUID();
		window.Too_MapLoadEnd(_Param);
		
		//AI 2009年10月30日
		window.find("GAMELAYER").find("NAME_GCMap").FalseMapLoadEnd();
		
		_VGame_Playing_Logic.show = true;
		window.find("gameinput").DeleteUser(this);
		
		//活动 + 普通游戏
		if (window.GetUIGameState() == window.USER_UISTATE_GAME_COMMON || window.GetUIGameState() == window.USER_UISTATE_GAME_ARENA)
		{
			window._charShowFlag = true;
			window.find("CHAT_LOGIC").show = true;
		}
		
		if (window.g_ArenaJoinRoom && !window.IsRandomRace(window.GetMyRaceID()))
		{
			window.find("ARENA_TOP_LOGIC").SetMyShow();
		}
	}
	
	//地图加载完毕后，并且界面创建好，开始显示VS+计时
	void TimerBegin()
	{
		sleep(6000);
		if (window.g_ArenaJoinRoom)
		{
			window.find("LOADING_LOGIC").del();
			window.find("ROOM_LOGIC")._Monitor.del();
		}
		else
		{
			window.find("LOADING_LOGIC").del();
		}
		show = true;
		window.StopPlay();	//开始显示VS了就不要房间里的音乐了
		_VGame_Begin_Logic.Run();
		timer(window._Time_BeginAct,"ChangeDisplay","timer_VGame_Begin_Logic");
		window.User1LoverExp = window.GetLoverExtraExp(_P1UID);
		window.User2LoverExp = window.GetLoverExtraExp(_P2UID);
		window.User3LoverExp = window.GetLoverExtraExp(_P3UID);
		window.User4LoverExp = window.GetLoverExtraExp(_P4UID);
		//alert("_P1UID="+_P1UID+",_P2UID="+_P2UID+",_P3UID"+_P3UID+",_P4UID="+_P4UID);
	}
	
	var m_RaceData = -1;  //活动点数、连胜 
	void OnCreated()
	{
		window.SetUIPos(window.POS_GAME);

		window._IfCanShowVS += 1;
		if (window.g_DEBUG)
		{
			printf("B# 游戏界面已创建好："+window._IfCanShowVS);
		}
		if (window._IfCanShowVS == 2)
		{
			TimerBegin();
		}
		printf("B# 活动点：window.g_ArenaJoinRoom:"+window.g_ArenaJoinRoom+",window.g_ArenaRaceID:"+window.GetMyRaceID());
		//看看活动点
		if (window.g_ArenaJoinRoom==true && window.GetMyRaceID() == 3)
		{
			var _VNet2DBRow = new VNet2DBRow{}
			_VNet2DBRow.InitByInt(window.M_G_SERVER,window.ARENARACE,window.M_G_SERVER_ARENARACE_ID,window.GetMyRaceID());
			if (!_VNet2DBRow.IsReady())
			{
				_VNet2DBRow.del();
				printf("B# error-游戏界面看看活动是多少:DBname:"+window.M_G_SERVER+",TBName:"+window.ARENARACE+",window.g_ArenaRaceID:"+window.GetMyRaceID());
				return;
			}
			m_RaceData = _VNet2DBRow.GetData(window.M_G_SERVER_ARENARACE_RES1);
			printf("B# 活动点："+m_RaceData);
			_VNet2DBRow.del();
		}
		//随机任务提示
		set window.find("POPLAYER")
		{
			new VRandTaskTip_Logic{}
		}

		//每次比赛开始获得自己的前场后场属性
		window._getBackAttr =  window.GetUserAttriBackGrou();
		window._getfrontAttr =  window.GetUserAttriFrontGrou();
	}
}