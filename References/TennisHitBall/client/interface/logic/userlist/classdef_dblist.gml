//玩家列表-List类定义


importex("$./../../UI/UserList/ClassDef_DBList.gml");

//一行显示类：昵称+等级+性别+位置
class VColumn_UserList_Logic item
{
	size = "500,30";//bgcolor = "#FF00";
	var m_UID = 0;	//玩家ID
	var m_State = 0;//玩家游戏状态 0断线 1空闲中 2房间内 3游戏中
	var m_Vip = -1;	//1代表Vip
	//===========================与显示交互======================
	void Init()
	{
		//昵称
		//参数 data1: 昵称
		staticvar s_NKname = new VMyText{}

		//等级
		//参数 data1：等级
		staticvar s_Level = new VMyText{pos = "150,0";}

		//性别
		//参数 data1：性别  0未知 1男 2女
		staticvar s_Sex = new VMyText{pos = "200,0";}

		//技术类型
		//参数 data1：
		staticvar s_TechnicType = new VMyText
		{
			pos = "250,0";
		}

		//位置
		//参数 data1：游戏状态 0断线 1空闲中 2房间内 3游戏中
		staticvar s_Pos = new VMyText{pos = "400,0";}

	}
	inclass("VColumn_UserList_UI"); //界面显示类
	Init();
	void OnMySelect(){bgcolor = "#FFEA99";alpha = 50;}	//选择的效果
	void OnMyUnSelect(){bgcolor = "-1";}				//不选择的效果
	//===========================================================
	void OnMouseDownR()
	{
		parent.checkselect(20,parent.mousey);
		set window.find("TOPLAYER")
		{
			new VMyMouseR_Social
			{
				var _list = window.find("VUserList_List_LogicNAME");
				var _RoleRow = _list.curselectrow();
				var _UserID = _list.fieldstr(_RoleRow,window.M_G_SERVER_USERDT_UID); //玩家ID
				var _NkName = _list.fieldstr(_RoleRow,window.M_G_SERVER_USERDT_NKNAME); //玩家昵称
				var _RoleID = _list.fieldstr(_RoleRow,window.M_G_SERVER_USERDT_RID); //玩家角色ID
				var _State = _list.fieldstr(_RoleRow,window.M_G_SERVER_USERDT_GAMESTA); //游戏状态 0断线 1空闲中 2房间内 3游戏中
				var _RoomID = _list.fieldstr(_RoleRow,window.M_G_SERVER_USERDT_DID); //房间ID

				if (_State != 2 || window.GetMyState() != 1 )
				{
					SetState(m_Index_GotoRoom,0);
				}

				if (_UserID == window.GetMyUID())//对自己的操作
				{
					SetState(m_Index_Private,0);
					SetState(m_Index_AddFriend,0);
					SetState(m_Index_GotoRoom,0);
					SetState(m_Index_AddBlacklist,0);
					SetState(m_Index_PresentFlower,0);
					SetState(m_Index_AskaddFamily,0);
				}
				var _relation = window.find("friendsys").CheckRelation(_NkName);//alert(_relation);
				if (toint(_relation) == window.FRIEND_BLACKLIST)
				{
					SetState(m_Index_Private,0);
					SetState(m_Index_PresentFlower,0);
					SetState(m_Index_GotoRoom,0);
					SetState(m_Index_AskaddFamily,0);
					SetState(m_Index_AddBlacklist,0);
				}
				//点击了私聊
				void On_Private(data)
				{
					window.OnClick_PrivateChat(_NkName);
				}
				//点击了查看信息
				void On_LookInfo(data)
				{
					//设置要查看的个人信息数据-打开个人信息界面前必须调用
					//参数：UID,昵称，RoleID
					window.SetSelfInfoData(_UserID,_NkName,_RoleID);
				}
				//点击了加为好友
				void On_AddFriend(data)
				{
					window.AddFriend(_NkName);
				}
				//点击了前往房间
				void On_GotoRoom(data)
				{
					//获得用户的房间号 2009年2月4日
					window.Too_GetUserDid(""+_NkName);
				}
				//点击了加入黑名单
				void On_AddBlacklist(data)
				{
					window.AddBlacklist(_NkName);
				}
				//点击了复制昵称
				void On_CopyName(data)
				{
					window.setClipBoardData(_NkName);
				}
				//点击了献花
				void On_PresentFlower(data)
				{
					window.GamePresentFlower(_NkName);
				}
				//邀请加入家族
				void On_AskaddFamily()
				{
					window.F_Family_Askadd(_NkName);
				}
			}
		}
	}
	void OnSelect()
	{
		OnMySelect();
		if (m_UID != window.GetMyUID())//不是自己时
		{
			parent.parent.s_Btn_AddFriend.SetState(window.USER_STATE_REDAY);//加为好友按钮为亮的

			window.LMH1_SelectOnePlayer();//引导事件
//			window.LMH_AddEvent(window.EVENTCOUNT_UI_change_addfriend);//点击了任意玩家名称
//			printf("B# =====引导测试===== 点击玩家名称次数 " + window.eventCounter.GetEventCount(window.EVENTCOUNT_UI_change_addfriend));

			if (m_State == 2 && window.GetMyState() == 1)//在房间内时且自己在房间外
			{
				parent.parent.s_Btn_GoRoom.SetState(window.USER_STATE_REDAY);//前往房间按钮为亮的
			}
		}
	};
	void OnUnSelect()
	{
		OnMyUnSelect();
		parent.parent.s_Btn_AddFriend.SetState(window.USER_STATE_WAIT);//加为好友按钮为灰的
		parent.parent.s_Btn_GoRoom.SetState(window.USER_STATE_WAIT);//前往房间按钮为灰的
	};
	void OnDataExchange(iRow,szData)
	{
		m_UID = szData;
		m_Vip = parent.fieldstr(iRow,window.M_G_SERVER_USERDT_VIPVALUE);
		var _NkName = parent.fieldstr(iRow,window.M_G_SERVER_USERDT_NKNAME);	//昵称
		var _Lv = parent.fieldstr(iRow,window.M_G_SERVER_USERDT_CULEVEL);		//等级
		var _Sex = parent.fieldstr(iRow,window.M_G_SERVER_USERDT_SEX);		//性别
		m_State = parent.fieldstr(iRow,window.M_G_SERVER_USERDT_GAMESTA);
		var _ArenaState = parent.fieldstr(iRow,window.M_G_SERVER_USERDT_ARENASTATE); //竞技赛状态 0.默认 1.报名了,等待消息回馈 2.已经报名了一个活动 3.进入竞技活动 4.活动结算

		//游戏状态
		var _technic = parent.fieldstr(iRow,window.M_G_SERVER_USERDT_TROLETYPE);
		s_NKname.SetData(_NkName,m_Vip);
		s_Level.SetData(_Lv,"");
		if (_Sex == "" || _Sex == 0)
		{
			_Sex = 0;
		}
		s_Sex.SetData(_Sex,"");
		s_Pos.SetData(m_State,_ArenaState);
		s_TechnicType.SetData(window.GetTechnicByType(_technic));
	}
};

//
//总的类：List
//
class VUserList_List_Logic VN2ListCtrl
{
	//需要显示时改变
	size="500,430";valign(30,0);halign(55,0);simpleshowmode="1,10";
	//
	selecttype="1";colfilter="0";bgcolor = "#00FF";

	inclass("VUserList_List_UI"); //界面显示类

	columclass="0,VColumn_UserList_Logic"; //ID
};