//
//大厅界面的提示框类定义
//

//加入房间请输入密码
class VMB_RoomPassWord_Logic VMyMessageBox_2_Logic
{
	name = "VMB_RoomPassWord_Logic";

	//construct
	function VMB_RoomPassWord_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		var _PW = GetSrc();//密码
		if (_PW == "")
		{
			window.find("UIController").LoadDLG(302);//密码不能为空，请输入密码！
			return;
		}
		//发出快速加入消息：用户id 房间id 游戏类型 房间密码
		var _Param = ""+ window.GetMyUID()+","+window.g_JoinRoomID+",-1,"+_PW;
		window.Too_FastJoinRoom_Ex(_Param,window.g_JoinRoomID);
		del();
	}

	//得到输入框的内容
	void GetSrc()
	{
		return _Box.s_Edit.src;
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
		inclass("VMB_RoomPassWord_UI");//界面显示类
		Init();
		SetEvent();
	}
};


//欢迎来到网球宝贝，下面你将进行新手必选训练，准备好了吗？
class VMyMB_BeginTrain_Logic VMyMessageBox_1_Logic
{
	name = "VMyMB_BeginTrain_Logic";
	_Box.s_BG.s_Btn_Close.show = false;

	//construct
	function VMyMB_BeginTrain_Logic(id)
	{
		VMyMessageBox_1_Logic(id);
	}
	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{

		window.find("GAMELAYER").find("NAME_GCMap").OnClick_Confirm();
		del();
	}

	void OnCancel()
	{
		return;
	}
};


/*2、点击赠送后弹出提示框 内容为
   “XXX物品（xx天） xxx金币
确定要给[XX玩家]赠送礼物吗？ 确定  取消”
*/
class VMB_GiftRequest_Logic VMyMessageBox_2_Logic
{
	name = "VMB_GiftRequest_Logic";

	//construct
	function VMB_GiftRequest_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		window.find("MALL_REQUEST_MSG_LOGIC")._Msg.OnClick_BtnBuy();
		del();
	}
};

//竞技大厅放弃弹出界面
//放弃等待将不退还报名费，确定要放弃吗？ 30
//放弃等待将打断连胜次数，确定要放弃吗？ 31
//确定要放弃吗？ 33
class VMB_QuitWaite_Logic VMyMessageBox_2_Logic
{
	name = "VMB_QuitWaite1_Logic";
	
	var m_Type = 1;	//1在活动列表里点的 2在我的活动里给的
	
	void SetType(type)
	{
		m_Type = type;
	}
	//construct
	function VMB_QuitWaite_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		if (m_Type == 2)
		{
			window.find("ARENA_LOGIC")._VArena_Logic.m_Class_MyActivity.OnConfirm_QuitWait();
		}
		else
		{
			window.find("ARENA_LOGIC")._VArena_Logic.m_Class_ActivityList.OnConfirm_QuitWait();
		}
		del();
	}
};

//竞技大厅放弃弹出界面
//放弃等待将不退还报名费，确定要放弃所有等待吗？ 32
class VMB_QuitWaite_All_Logic VMyMessageBox_2_Logic
{
	name = "VMB_QuitWaite_All_Logic";

	//construct
	function VMB_QuitWaite_All_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		window.find("VHall_Arena_Logic_NAME").OnConfirm_QuitWait_All();
		del();
	}
};

//竞技大厅报名
//报名时将直接从您的帐户扣除100金币的报名费，您确定要报名吗？  确定   取消”
class VMB_ArenaApply_Logic VMyMessageBox_2_Logic
{
	name = "VMB_ArenaApply_Logic";

	//construct
	function VMB_ArenaApply_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		window.find("VHall_Arena_Logic_NAME").OnConfirm_ArenaApply();
		del();
	}
};

/*进入房间将被扣除金币XXX,确定要进入吗？
*/
class VMB_WagerJoinRoom_Logic VMyMessageBox_2_Logic
{
	name = "VMB_WagerJoinRoom_Logic";

	//construct
	function VMB_WagerJoinRoom_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		switch (window.g_JionRoomType)//加入房间类型(1普通 2邀请)
		{
			case 1:
			{
				window.Too_FastJoinRoom_Ex(window.g_FastJionRoomParamWager,-1);
				break;
			}
			case 2:
			{
				window.Too_InviteJoinRoom_Ex(window.g_FastJionRoomParamWager,-1,window.g_InviteUID);
				break;
			}
		}
		del();
	}
};

//别人邀请我去XX房间： 接受、拒绝
class VMB_InviteToRoom_Logic VMyMessageBox_2_Logic
{
	name = "VMB_InviteToRoom_Logic";
	var m_UID = 0;		//玩家UserID
	var m_RoomID = -1;	//房间号
	var m_Type = 3;		//回复的类型(0拒绝 1同意 2超时 3不在空闲中)
	//construct
	function VMB_InviteToRoom_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	void InitData(UID,RoomID)
	{
		m_UID = UID;
		m_RoomID = RoomID;
		timer(window.g_InviteMsg_Time,"AnswerInvite(2)","AnswerInvite_Name");
	}

	void OnDelete_EX()
	{
		if (m_Type == 3)
		{
			var _param3 = ""+window.GetMyName()+ ","+m_UID+",3";
			//回复邀请:"被邀请者昵称",邀请者ID,类型(0拒绝 1同意 2超时 3不在空闲中)
			window.Too_IRefuseToRoom(_param3);
		}
	}

	//点击接受或拒绝后调用此函数
	//参数 ：(0拒绝 1同意 2超时)
	void AnswerInvite(type)
	{
		m_Type = type;
		killtimer("AnswerInvite_Name");

		if (toint(m_Type) == 1)
		{
			var _param = ""+window.GetMyUID()+","+m_RoomID+",-1,"+m_UID;
			//邀请加入房间绿色通道:用户id,房间id,游戏类型 邀请者ID
			window.Too_InviteJoinRoom(_param,m_RoomID,m_UID);
		}
		else
		{
			var _param2 = ""+window.GetMyName()+ ","+m_UID+","+m_Type;
			//回复邀请:"被邀请者昵称",邀请者ID,类型(0拒绝 1同意 2超时 3不在空闲中 4钱不够)
			window.Too_IRefuseToRoom(_param2);
		}
		del();
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		AnswerInvite(1);
	}
	//点击取消按钮或者按Esc时调用-继承时需要被覆盖
	void OnCancel()
	{
		AnswerInvite(0);
	}

	set _Box
	{
		void Init()
		{
			//密码输入框
			staticvar s_Edit = new text
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
		inclass("VMB_InviteToRoom_UI");//界面显示类
		Init();
		SetEvent();
	}
};

//已报名还去创建房间
//你有正在等待的活动，参加普通比赛将自动放弃所有等待？ 108
//你有正在等待的活动，返回频道将自动放弃所有等待？ 109
//你有正在等待的活动，参加自由训练将自动放弃所有等待？ 104
class VMB_CancelRaceByAnyWay_Logic VMyMessageBox_2_Logic
{
	name = "VMB_CancelRaceByAnyWay_Logic";

	//construct
	function VMB_CancelRaceByAnyWay_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		if (window.g_JionRoomParamArenaType == window.CANCELRACE_RETURNCHENNEL)
		{
			window.g_OnConfirm_QuitWait(window.GetMyRaceID());//修改了玩家报名活动直接回到服务器列表不返回报名费的情况
			window.HallToChannelChoose();
			del();
			return;
		}
		if (window.g_JionRoomParamArenaType == window.CANCELRACE_CREATEROOM)
		{
			window.Too_CreateRoom_Ex(window.g_JionRoomParamArena);
			del();
			return;
		}
		if (window.g_JionRoomParamArenaType == window.CANCELRACE_JOINROOMNEEDPW)
		{
			window.Too_NeedPassword_Ex(window.g_JionRoomParamArena);
			del();
			return;
		}
		if (window.g_JionRoomParamArenaType == window.CANCELRACE_FASTJOINROOM)
		{
			window.Too_FastJoinRoom_Ex(window.g_JionRoomParamArena,window.g_JoinRoomID);
			del();
			return;
		}
		if (window.g_JionRoomParamArenaType == window.CANCELRACE_INVITEJOINROOM)
		{
			if(window.GetUIPos() == window.POS_FAMILYROOM)
			{
				window.find("FAMILY_ROOM_LOGIC").del();
				window.find("CHAT_LOGIC").del();
			}
			window.Too_InviteJoinRoom_Ex(window.g_JionRoomParamArena,window.g_JoinRoomID,window.g_InviteUID);
			del();
			return;
		}
		if (window.g_JionRoomParamArenaType == window.CANCELRACE_FREETRAIN)
		{
			var _aiid = window.GetTrainAIID(window.g_TrainID);
			window.g_OnConfirm_QuitWait(window.GetMyRaceID());
			//发出进入训练的消息,参数：训练ID
			window.Tos_EnterTrain(""+window.g_TrainID,window.TRAIN_TYPE_FREE);
			window.SetUIGameState(window.USER_UISTATE_AI_FREETRAIN);//2009年12月24日
			window.HallToFreeTrain_Ex(_aiid);
			del();
			return;
		}
		if (window.g_JionRoomParamArenaType == window.CANCELRACE_COMMONTRAIN)
		{
			window.g_OnConfirm_QuitWait(window.GetMyRaceID());
			window.Tos_EnterTrain(""+window.g_TrainID,window.TRAIN_TYPE_COMMON);
			del();
			return;
		}
		if (window.g_JionRoomParamArenaType == window.CANCELRACE_RANDGAME)
		{
//			if ( window.IsRandomRace( window.GetMyRaceID() ) )
//			{
//				window.g_OnConfirm_QuitWait( window.GetMyRaceID() );
//			}

			window.g_OnConfirm_QuitWait( window.GetMyRaceID() );

			window.Tos_ApplyArenaRace(window.g_JionRoomParamArena);
			window.find("RANDGAME_LOGIC").del();
			window.find("UIController").LoadUI("UI_RANDGAME");
			window.find("RANDGAME_LOGIC")._VRandGameTip_Logic.SetRaceID(window.g_RandRaceID);

			del();
			return;
		}
		if (window.g_JionRoomParamArenaType == window.CANCELRACE_TEAMINVITE)
		{
			window.g_OnConfirm_QuitWait(window.GetMyRaceID());

			//同意邀请加人战队(直接服务器)
			//参数：askid,raceid,isagree
			window.F_recinvite_Ex(window.g_ArenaTeamInviteUID,window.g_ArenaTeamRaceID,1);//直接同意

			del();
			return;
		}

		if (window.g_JionRoomParamArenaType == window.CANCELRACE_LOOKAT)
		{
			window.find("RANDGAME_LOGIC")._VRandGameTip_Logic.OnClick_Cancel();
			window.HallToVideoEx(window.g_IsLookOrReplay,window.g_JionRoomParamArena);
			del();
			return;
		}
	}

	//点击取消按钮或者按Esc时调用-继承时需要被覆盖
	void OnCancel()
	{
		if (window.g_JionRoomParamArenaType == window.CANCELRACE_TEAMINVITE)
		{
			//同意邀请加人战队(直接服务器)
			//参数：askid,raceid,isagree
			window.F_recinvite_Ex(window.g_ArenaTeamInviteUID,window.g_ArenaTeamRaceID,0);//拒绝
		}
		if (window.g_JionRoomParamArenaType == window.CANCELRACE_INVITEJOINROOM)
		{
			var _param2 = ""+window.GetMyName()+ ","+window.g_InviteUID+",0";
			//回复邀请:"被邀请者昵称",邀请者ID,类型(0拒绝 1同意 2超时 3不在空闲中 4钱不够)
			window.Too_IRefuseToRoom(_param2);
		}
		if (window.g_JionRoomParamArenaType == window.CANCELRACE_FREETRAIN)
		{
			window.Tos_AchieveTrain(""+window.g_TrainID+",0,0");
//			window.FreeTrainToHall();
		}
		del();
	}
};

//返回频道提示
class VMyMB_BackToChannel_Logic VMyMessageBox_2_Logic
{
	name = "VMyMB_BackToChannel_Logic";

	void OnCreated_EX()
	{
		window.SetChatEnterFlag(window.CHAT_ENTER_NO,"VMyMB_BackToChannel_Logic");//不激活
	}
	void OnDelete_EX()
	{
		window.SetChatEnterFlag(window.CHAT_ENTER_YES,"VMyMB_BackToChannel_Logic");//能激活
	}

	//construct
	function VMyMB_BackToChannel_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		window.HallToChannelChoose();
		del();
	}
};

//点我继续活动
class VMyMB_ContinueActi_Logic VMyMessageBox_2_Logic
{
	name = "VMyMB_ContinueActi_Logic";

	function VMyMB_ContinueActi_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}
	void OnConfirm()
	{
		window.find("HALL_LOGIC").m_ArenaFallowTime.StopRunTime();
		//参数：用户ID，报名ID
		var _Param = ""+window.GetMyUID()+","+m_iRaceID;
		window.Tos_CancelRest(_Param);
		del();
	}
};

//点我充点
class VMyMB_AddPoint_Logic VMyMessageBox_2_Logic
{
	name = "VMyMB_AddPoint_Logic";

	void OnCreated_EX()
	{
		window.SetChatEnterFlag(window.CHAT_ENTER_NO,"VMyMB_AddPoint_Logic");//不激活
	}
	void OnDelete_EX()
	{
		window.SetChatEnterFlag(window.CHAT_ENTER_YES,"VMyMB_AddPoint_Logic");//能激活
	}

	//construct
	function VMyMB_AddPoint_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	//替换字符串数据
	//data:参数("1,2,3")
	void ReplaceData(data)
	{
		_Box.s_Text_Cue.SetData(window.ReplaceStr(_Box.s_Text_Cue.src,data),"");
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		//参数：用户ID，竞技类型，增加点数
		var _param = ""+window.GetMyUID()+","+window.GetMyRaceID()+","+window.GetAddPointByID(window.GetMyRaceID());
		window.Tos_AddArenaData(_param);
		del();
	}
};


//是否与当前球拍绑定
class VMyMB_FastBindSkill_Logic VMyMessageBox_2_Logic
{
	name = "VMyMB_FastBindSkill_Logic";

	var _RacketID = 0;
	var _SkillID = 0;

	void SetID(rid,sid)
	{
		_RacketID = rid;
		_SkillID = sid;
	}

	//construct
	function VMyMB_FastBindSkill_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		window.SkillBindRacket(_RacketID,_SkillID);
		del();
	}
};


//
//活动场界面的提示框类定义
//

//[%0]邀请你加入队伍[%1]去参加[%2]同意吗？
class VMyMB_AraneInvite_Logic VMyMessageBox_2_Logic
{
	name = "VMyMB_AraneInvite_Logic";

	//construct
	function VMyMB_AraneInvite_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}
	
	var m_DelType = 0;		//删除类型 0默认 1主动
	var m_askid = 0;		//邀请人的id
	var m_raceid = 0;		//邀请加入的组队类型
	//保存服务器发来的相关数据
	void SetServerData(askid,raceid)
	{
		m_askid = askid;
		m_raceid = raceid;
		timer(window.g_InviteMsg_Time,"AnswerAreneInvite()","AnswerAreneInvite_Name");
	}
	//点击接受或拒绝后调用此函数
	void AnswerAreneInvite()
	{
		m_DelType = 1;
		killtimer("AnswerAreneInvite_Name");
		printf("B# 组队:VMyMB_AraneInvite_Logic:AnswerAreneInvite()");
		//同意邀请加人战队(直接服务器)
		//参数：askid,raceid,isagree
		window.F_recinvite(m_askid,m_raceid,0);//拒绝
		del();
	}


	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		m_DelType = 1;
		printf("B# 组队:VMyMB_AraneInvite_Logic:OnConfirm()");
		//同意邀请加人战队(直接服务器)
		//参数：askid,raceid,isagree
		window.F_recinvite(m_askid,m_raceid,1); //同意
		del();
	}

	void OnCancel()
	{
		m_DelType = 1;
		printf("B# 组队:VMyMB_AraneInvite_Logic:OnCancel()");
		//同意邀请加人战队(直接服务器)
		//参数：askid,raceid,isagree
		window.F_recinvite(m_askid,m_raceid,0);//拒绝
		del();
	}
	
	void OnDelete_EX()
	{
		printf("B# 组队:VMyMB_AraneInvite_Logic:OnDelete_EX()m_DelType:"+m_DelType);
		if (m_DelType == 0)
		{		
			//同意邀请加人战队(直接服务器)
			//参数：askid,raceid,isagree
			window.F_recinvite(m_askid,m_raceid,0);//拒绝
		}
	}

	set _Box
	{
		void Init()
		{
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
		inclass("VMB_InviteToArena_UI");//界面显示类
		Init();
		SetEvent();
	}
};

/*购物车删除全部物品
*/
class VMB_BuyCarDelGoods_Logic VMyMessageBox_2_Logic
{
	name = "VMB_BuyCarDelGoods_Logic";

	//construct
	function VMB_BuyCarDelGoods_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		var sel = window.GetMallBuyCarSelect();
		window.find("BuyCarRecord").DelByType(sel-1);
		window.find("MALL_BUY_LOGIC").RefreshTotalMoney();
		del();
	}
};
/*购物车删除单个物品
*/
class VMB_BuyCarDelOneGoods_Logic VMyMessageBox_2_Logic
{
	name = "VMB_BuyCarDelOneGoods_Logic";

	//construct
	function VMB_BuyCarDelOneGoods_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		window.find("MALL_BUY_LOGIC")._BuyCar.OnClick_DelCur();
		del();
	}
};


/*提示去频道-老虎
*/
class VMB_LMHToChannel_Logic VMyMessageBox_2_Logic
{
	name = "VMB_LMHToChannel_Logic";

	//construct
	function VMB_LMHToChannel_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		window.OtherToChannelChoose();
		del();
	}

	void OnCreated_EX()
	{
		_Box.s_Btn_Confirm.InitText("去资格赛");
//		_Box.s_Btn_Cancel.InitText("取消");
	}
};

/*提示去训练-老虎
*/
class VMB_LMHToTrain_Logic VMyMessageBox_2_Logic
{
	name = "VMB_LMHToTrain_Logic";

	//construct
	function VMB_LMHToTrain_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	void SetTrainID(id)
	{
		printf("B# [去训练]VMB_LMHToTrain_Logic:SetTrainID():"+id);
		window.g_TrainID = id;
		ReplaceData(window.GetTrianNameByID(window.g_TrainID));
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		window.OnClick_BTN_Train(1);
		window.g_TrainType = 1;		//训练的类型：0强制训练 1正常(训练选择) 2(训练中弹出)
		window.find("UIController").LoadUI("UI_TRAIN_POP");
		del();
	}

	void OnCreated_EX()
	{
		_Box.s_Btn_Confirm.InitText("去训练");
//		_Box.s_Btn_Cancel.InitText("取消");
	}

	void OnDelete_EX()
	{
		window.g_TrainID = -1;
	}
};

//当保存相同形象时，提示“您已保存过此形象，是否继续保存”，若选是则继续保存
class VMB_SaveVisual_Logic VMyMessageBox_2_Logic
{
	name = "VMB_SaveVisual_Logic";

	//construct
	function VMB_SaveVisual_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		var data = window.GetMallTryData();
		var num = window.GetSplitCount(data,","); //个数
		var type = window.find("BuyCarRecord").CheckFull(5);
		var arr = window.SplitStr2(data,",",num);//价格-返回一个数组
		var i = 0;
		while (i<num)
		{
			var entryid = toint(arr[i]);
			i+=1;
			window.find("BuyCarRecord").Add(entryid,type,0);
		}
		del();

		window.find("UIController").LoadDLG(431);//形象保存成功
	}
};

//当放入购物车相同物品时，提示“你的购物车中已存在此物品，是否要放入购物车”，选是则继续放入
class VMB_ToBuyCar_Logic VMyMessageBox_2_Logic
{
	name = "VMB_ToBuyCar_Logic";
	var m_EntryID = 0;

	//construct
	function VMB_ToBuyCar_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
//		window.ToBuyCarRecord(0,0,0,m_EntryID);
		window.find("BuyCarRecord").Add(m_EntryID,0,0);
		window.find("UIController").LoadDLG(631);
		del();
	}
};

//当放入购物车的物品在背包中有相同的并且期限为永久有效时，提示
//您背包中已经存在永久有效的此物品，是否继续添加到购物车？
class VMB_AddToShopCar_Logic VMyMessageBox_2_Logic
{
	name = "VMB_AddToShopCar_Logic";
	var m_EntryID = 0;

	//construct
	function VMB_AddToShopCar_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		window.find("VColumn_Mall_DressList_Logic").AddToShopCar(m_EntryID);
		del();
	}
};
//当放入购物车物品背包里已经存在，提示“您已拥有此物品，是否继续购买？”
class VMB_AddShopCar_Logic VMyMessageBox_2_Logic
{
	name = "VMB_AddShopCar_Logic";

	function VMB_ToBuyCar_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}
	void OnConfirm()
	{
		del();
	}
};

//当购买相同物品时，提示“您已拥有此物品，是否继续购买”，选是则继续购买
class VMB_BuyContinue_Logic VMyMessageBox_2_Logic
{
	name = "VMB_BuyContinue_Logic";
	var m_Select = 0;

	//construct
	function VMB_BuyContinue_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		var _VNet2DBRow=new VNet2DBRow{}
		_VNet2DBRow.InitByInt( window.M_G_GOODS,window.ITEMS,window.M_G_GOODS_ITEMS_ENTRY,m_Select);
		if(tostring(_VNet2DBRow.GetData(window.M_G_GOODS_ITEMS_TLIMITBUYTIME))=="0")
		{
			window.find("BuyCarRecord").Add(m_Select,0,0);
//			window.find("UIController").LoadDLG(631);
		// add by chenjihui
		// 
		// 2010-12-28
		window.find("BuyCarRecord").SelectBySex(window.GetMySex(),1,0);
		window.SetMallVar(window.MALL_OPT_BUY);
		window.find("UIController").LoadUI("UI_MALL_BUYCAR"); 
		window.find("MALL_BUY_LOGIC")._BuyCar.m_BuycarState = 1;
		}
		else
		{
			window.find("BuyCarRecord").ClearSelect();
			if ( m_Select > 0 )
			{
				window.find("BuyCarRecord").AddSelect(m_Select,0,1,1);
			}
			window.SetMallVar(window.MALL_OPT_BUY);
			window.find("UIController").LoadUI("UI_MALL_BUYCAR");
		}
		_VNet2DBRow.del();
		del();
	}
};

//当索要相同物品时，提示“您已拥有此物品，是否继续索要”，选是则继续索要
class VMB_AskContinue_Logic VMyMessageBox_2_Logic
{
	name = "VMB_AskContinue_Logic";
	var m_Select = 0;

	//construct
	function VMB_AskContinue_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
//		var _VNet2DBRow=new VNet2DBRow{}
//		_VNet2DBRow.InitByInt( window.M_G_GOODS,window.ITEMS,window.M_G_GOODS_ITEMS_ENTRY,parent.m_EntryID);
//		if(tostring(_VNet2DBRow.GetData(window.M_G_GOODS_ITEMS_TLIMITBUYTIME))=="0")
//		{
//			window.find("UIController").LoadDLG(706);
//			window.find("VMB_ToBuyCar_Logic").m_EntryID=parent.m_EntryID;
//		}
//		else
//		{
			window.find("BuyCarRecord").ClearSelect();
			if ( m_Select > 0 )
			{
				window.find("BuyCarRecord").AddSelect(m_Select,0,1,1);
			}
			window.SetMallVar(window.MALL_OPT_ASK);
			window.find("UIController").LoadUI("UI_MALL_BUYCAR");
//		}
//		_VNet2DBRow.del();
		del();
	}
};

//背包中没有献花提示对话框，如果单击是则进入快速购买，否则取消
class VMB_NoEnoughFlower_Logic VMyMessageBox_2_Logic
{
	name = "VMB_NoEnoughFlower_Logic";

	//construct
	function VMB_NoEnoughFlower_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		//发出购买的消息
		//新新参数：iEntryId,iNum,iLimitDayField,iToUserId,iToUserSex,szToUserName,szTitle,szToMsg
		var _Param = ""+window.FLOWER_BUY_ID+",1,0";
		var _DeadORLive = window.CheckPackItemDeadLineByEntryID(window.g_agioEntry_ID);//判断背包中是否有打折卡并且是否能用
		if (_DeadORLive>0)
		{
			window.Too_BuyItem(_Param+",-1,"+window.g_agioEntry_ID);
		}
		else
			window.Too_BuyItem(_Param);
		del();
	}
};

//您没有小喇叭，无法发言。是否马上购买？ 
class VMB_NoEnoughBugle_Logic VMyMessageBox_2_Logic
{
	name = "VMB_NoEnoughBugle_Logic";

	//为了防止在输入框里敲回车无奈而加 - 2009年12月12日 yxf
	var m_IsFirst = true;

	//construct
	function VMB_NoEnoughBugle_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}
	
	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	//type:1回车快捷键 0点击按钮
	void OnConfirm(type)
	{
		if (type == 1 && m_IsFirst)
		{
			m_IsFirst = false;
			return;
		}
		//发出购买的消息
		//新新参数：iEntryId,iNum,iLimitDayField,iToUserId,iToUserSex,szToUserName,szTitle,szToMsg
		var _Param = ""+window.BUGLE_BUY_ID+",1,0";
		var _DeadORLive = window.CheckPackItemDeadLineByEntryID(window.g_agioEntry_ID);//判断背包中是否有打折卡并且是否能用
		if (_DeadORLive>0)
		{
			window.Too_BuyItem(_Param+",-1,"+window.g_agioEntry_ID);
		}
		else
			window.Too_BuyItem(_Param);
		del();
	}
};

//您没有动作喇叭，无法发言。是否马上购买？ 
class VMB_NoEnoughActBugle_Logic VMyMessageBox_2_Logic
{
	name = "VMB_NoEnoughActBugle_Logic";
	
	//为了防止在输入框里敲回车无奈而加 - 2009年12月12日 yxf
	var m_IsFirst = true;

	//construct
	function VMB_NoEnoughActBugle_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	//type:1回车快捷键 0点击按钮
	void OnConfirm(type)
	{
		if (type == 1 && m_IsFirst)
		{
			m_IsFirst = false;
			return;
		}
		//发出购买的消息
		//新新参数：iEntryId,iNum,iLimitDayField,iToUserId,iToUserSex,szToUserName,szTitle,szToMsg
		var _Param = ""+window.ACTBUGLE_BUY_ID+",1,0";
		var _DeadORLive = window.CheckPackItemDeadLineByEntryID(window.g_agioEntry_ID);//判断背包中是否有打折卡并且是否能用
		if (_DeadORLive>0)
		{
			window.Too_BuyItem(_Param+",-1,"+window.g_agioEntry_ID);
		}
		else
			window.Too_BuyItem(_Param);
		del();
	}
};


//防沉迷的提示框
class VMyMB_FCMTip_Logic VMyMessageBox_1_Logic
{
	name = "VMyMB_FCMTip_Logic";

	//construct
	function VMyMB_FCMTip_Logic(id)
	{
		VMyMessageBox_1_Logic(id);
	}
};

//活动报名时防沉迷的提示框
class VMyMB_ArenaAppFCM_Logic VMyMessageBox_2_Logic
{
	name = "VMyMB_ArenaAppFCM_Logic";
	//construct
	function VMyMB_ArenaAppFCM_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}
	void OnConfirm()
	{
		window.find("VArena_Activity_Logic").OnClick_Apply();
		del();
	}
	void OnCancel()
	{
		del();
	}

};
//报名黄金联赛时防沉迷的提示框
class VMyMB_HJLSAppFCM_Logic VMyMessageBox_2_Logic
{
	name = "VMyMB_HJLSAppFCM_Logic";
	var _type = 0;
	//construct
	function VMyMB_HJLSAppFCM_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}
	void OnConfirm()
	{
		window.find("Column_RandGame_"+_type).OnClick_RandBtn();
		del();
	}
	void OnCancel()
	{
		del();
	}
};

//活动结算防沉迷的提示框
class VMyMB_ArenaOverFCM_Logic VMyMessageBox_1_Logic
{
	name = "VMyMB_ArenaOverFCM_Logic";
	//construct
	function VMyMB_ArenaOverFCM_Logic(id)
	{
		VMyMessageBox_1_Logic(id);
	}
};

//续费提示
class VMB_PropContinue_Logic VMyMessageBox_2_Logic
{
	name = "VMB_PropContinue_Logic";
	var _LastPos = window.GetUIPos();
	window.SetUIPos(window.POS_PROPCONTINUE);
	var m_itemIds = "";
	var m_items = "";
	var m_Type = 1;
	var m_entryID = 0;
//	var m_temp = 1;	//0:已到期，1:即将到期

	function VMB_PropContinue_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	void SetItemIds(_ids,_items,_type,_entryID)
	{
		m_itemIds = _ids;
		m_items = _items;
		m_Type = _type;
		m_entryID = _entryID;
//		m_temp = _temp;
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		window.SetUIPos(_LastPos);
//		window.PropContinue(m_itemIds,m_items,m_Type,m_entryID);
//window.SetMallVar(window.MALL_OPT_BUY);
//		window.find("UIController").LoadUI("UI_MALL_CHARGECAR");
//		window.find("MALL_Charge_LOGIC")._ChargeCar.m_BuycarState = 2;
		window.g_MyItemsCheck.CheckChargeItemDeadLine();
		window.Too_GetShopTime();
		window.find("UIController").LoadUI("UI_MALL_CHARGECAR");
		del();
	}

	void OnCancel()
	{
		window.SetUIPos(_LastPos);
		//window.Too_AddDeadProps(window.g_DeadPropsPackID);
//		if(m_Type == 1)
//		{
//			window.g_MyItemsCheck.AddDeadItems(m_itemIds);
//		}
//		else
//			window.ToChargeCarRecord(m_itemIds,m_items,1,m_entryID);
		del();
	}
	void DI_ShortcutKey(data)
	{
		return;
	}
}

//[%0]为你买了%1，您愿意与[%2]成为密友吗？
class VMB_WillBeBuddy_Logic VMyMessageBox_2_Logic
{
	name = "VMB_WillBeBuddy_Logic";

	//construct
	function VMB_WillBeBuddy_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}
	
	void OnCreated_EX()
	{
		SetBtn_ConfirmName("愿意");
		SetBtn_CancelName("拒绝");
	}
	//记下参数
	var m_Name = "";
	var m_UID = 0;
	var m_ExData = 0;
	void SetParam(_name,_uid,_exdata)
	{
		m_Name = _name;
		m_UID = _uid;
		m_ExData = _exdata;
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		//回复某人对己发生关系的邀请(同意-密友)
		var _Param = ""+window.RELATION_BUDDY+","+m_UID+",1,"+window.RELATION_OPT_BUDDY+","+m_ExData;
		window.Tos_AnswerRelationInvite(_Param);
		del();
	}
	//点击取消按钮或者按Esc时调用-继承时需要被覆盖
	void OnCancel()
	{
		//回复某人对己发生关系的邀请(拒绝-密友)
		var _Param = ""+window.RELATION_BUDDY+","+m_UID+",0,"+window.RELATION_OPT_BUDDY+","+m_ExData;
		window.Tos_AnswerRelationInvite(_Param);
		del();
	}
};

//[%0]送你了华丽的[%1]定情信物，请求你与他结为情侣，您愿意吗？
class VMB_WillBeLover_Logic VMyMessageBox_2_Logic
{
	name = "VMB_WillBeLover_Logic";

	//construct
	function VMB_WillBeLover_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}
	
	void OnCreated_EX()
	{
		SetBtn_ConfirmName("同意");
		SetBtn_CancelName("拒绝");
	}
	//记下参数
	var m_Name = "";
	var m_UID = 0;
	var m_ExData = 0;
	var m_randomid = 0;
	void SetParam(_name,_exdata,_randomid)
	{
		m_Name = _name;
		m_UID = _uid;
		m_ExData = _exdata;
		m_randomid = _randomid;

	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		//回复某人对己发生关系的邀请(同意-情侣)
//		var _Param = ""+window.RELATION_LOVER+","+m_UID+",1,"+window.RELATION_OPT_LOVER+","+m_ExData;
		var _Param = ""+"1,"+window.RELATION_OPT_LOVER+","+m_randomid;
		window.Tos_AnswerRelationInvite(_Param);
		del();
	}
	//点击取消按钮或者按Esc时调用-继承时需要被覆盖
	void OnCancel()
	{
		//回复某人对己发生关系的邀请(拒绝-情侣)
//		var _Param = ""+window.RELATION_LOVER+","+m_UID+",0,"+window.RELATION_OPT_LOVER+","+m_ExData;
		var _Param = ""+"0,"+window.RELATION_OPT_LOVER+","+m_randomid;
		window.Tos_AnswerRelationInvite(_Param);
		del();
	}
	void OnCancelW()
	{
		//结成情侣没反应
		var _Param = ""+"2,"+window.RELATION_OPT_LOVER+","+m_randomid;
		window.Tos_AnswerRelationInvite(_Param);
		del();
	}
	timer(window.g_InviteLoverMsg_Time,"OnCancelW");

	set _Box
	{
		void Init()
		{
			//密码输入框
			staticvar s_Edit = new text
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
		inclass("VMB_InviteToBeLover_UI");//界面显示类
		Init();
	}
};

//[%0]要与你解除情侣关系，是否同意？
class VMB_WillPartLover_Logic VMyMessageBox_2_Logic
{
	name = "VMB_WillPartLover_Logic";

	//construct
	function VMB_WillPartLover_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}
	
	void OnCreated_EX()
	{
		SetBtn_ConfirmName("是");
		SetBtn_CancelName("否");
	}
	//记下参数
	var m_Name = "";
	var m_UID = 0;
	var m_ExData = 0;
	void SetParam(_name,_uid,_exdata)
	{
		m_Name = _name;
		m_UID = _uid;
		m_ExData = _exdata;
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		//回复某人对己发生关系的邀请(同意-情侣分手)
		var _Param = ""+window.RELATION_LOVER+","+m_UID+",1,"+window.RELATION_OPT_DELLOVER+","+m_ExData;
		window.Tos_AnswerRelationInvite(_Param);
		del();
	}
	//点击取消按钮或者按Esc时调用-继承时需要被覆盖
	void OnCancel()
	{
		//回复某人对己发生关系的邀请(拒绝-情侣分手)
		var _Param = ""+window.RELATION_LOVER+","+m_UID+",0,"+window.RELATION_OPT_DELLOVER+","+m_ExData;
		window.Tos_AnswerRelationInvite(_Param);
		del();
	}
};

////反外挂提示
//class VMB_ClientSecurity_Logic VMyMessageBox_1_Logic
//{
//	name = "VMB_ArenaOverTip_Logic";
//	function VMB_ClientSecurity_Logic(id)
//	{
//		VMyMessageBox_1_Logic(id);
//	}
//
//	void OnConfirm()
//	{
//		del();
//		
//	}
//}
