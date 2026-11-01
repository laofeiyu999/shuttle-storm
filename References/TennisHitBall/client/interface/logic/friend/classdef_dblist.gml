//社交-好友-List类定义
//yxf 2009年10月20日

importex("$./../../UI/Friend/ClassDef_DBList.gml");

/*
位置显示逻辑：
0 离线
4 登录中
1 空闲中
	|____不在同一频道 5 显示频道名
	|____在同一频道   1空闲中
		|____2 房间中
		|____3 游戏中
*/
//一行显示类：昵称+等级+性别+位置
class VColumn_Friend_List_Logic item
{
	size = "500,30";//bgcolor = "#FF00";
	var m_CanToRoom = false;//是否可以前往房间
	var m_OnlineStateFlag = false;	//玩家是否在线标志，false为不在线，true为在线
	var m_NkName = "";		//昵称
	var m_UID = 0;			//UID	
	var m_Relation = 0;		//好友还是黑名单	
	//===========================与显示交互======================
	void Init()
	{
		//昵称
		//参数 data1: 昵称
		//参数 data2：状态 0离线 1空闲中 2房间内 3游戏中 4登陆中
		staticvar s_NKname = new VMyText{}

		//等级
		//参数 data1：等级
		//参数 data2：状态 0离线 1空闲中 2房间内 3游戏中 4登陆中
		staticvar s_Level = new VMyText{pos = "150,0";}

		//性别
		//参数 data1：性别  0未知 1男 2女
		//参数 data2：状态 0离线 1空闲中 2房间内 3游戏中 4登陆中
		staticvar s_Sex = new VMyText{pos = "200,0";}

		//技术类型
		//参数 data1：
		staticvar s_TechnicType = new VMyText
		{
			pos = "250,0";

			void SetData(type)
			{
				src = window.GetTechnicByType(type);
			}
		}


		//位置
		//参数 data1：位置
		//参数 data2：状态 0离线 1空闲中 2房间内 3游戏中 4登陆中
		staticvar s_Pos = new VMyText{pos = "400,0";}
	}
	inclass("VColumn_Friend_List_UI"); //界面显示类
	Init();
	void OnMySelect(){bgcolor = "#FFEA99";alpha = 50;}	//选择的效果
	void OnMyUnSelect(){bgcolor = "-1";}				//不选择的效果
	//===========================================================
	void OnMouseDownR()
	{
		parent.checkselect(20,parent.mousey);
		if (parent.parent.m_Relation == toint(window.FRIEND_FRIEND))	//好友
		{
			set window.find("TOPLAYER")
			{
				new VMyMouseR_Friend
				{
					var _list = window.find("VFriend_List_Logic_NAME");
					var _RoleRow = _list.curselectrow();
//					var _UserID = window.find("VFriend_List_Logic_NAME").fieldstr(_RoleRow,window.M_G_SERVER_FRIENDDT_USERID); //玩家ID
					var _NkName =_list.fieldstr(_RoleRow,window.M_G_SERVER_FRIENDDT_NKNAME); //玩家昵称
					var _State = _list.fieldstr(_RoleRow,window.M_G_SERVER_FRIENDDT_GAMESTATE); //游戏状态 0断线 1空闲中 2房间内 3游戏中 4登陆中
					var _RoomID = _list.fieldstr(_RoleRow,window.M_G_SERVER_FRIENDDT_ROOMID); //房间ID
					var _JID = _list.fieldstr(_RoleRow,window.M_G_SERVER_FRIENDDT_JID); //JID
					var _Channel = _list.fieldstr(_RoleRow,window.M_G_SERVER_FRIENDDT_CURRCHANNEL);	//频道名
					//alert("_JID:"+_JID+",_NkName:"+_NkName);
					SetState(m_Index_GotoRoom,0);
					SetState(m_Index_SendMsg,0);
					if (_State == 1 || _State == 2|| _State == 3)  //好友只有在在线的时候才会显示  
					{
						SetState(m_Index_PresentFlower,1);
						SetState(m_Index_AskaddFamily,1);
						SetState(m_Index_SendMsg,1);
						SetState(m_Index_AddToPartnerList,1);
					}
					if (_Channel == "" || _Channel == 0)
					{
						SetState(m_Index_Private,0);
						SetState(m_Index_PresentFlower,0);
						SetState(m_Index_AskaddFamily,0);
						SetState(m_Index_SendMsg,0);
						SetState(m_Index_AddToPartnerList,0);
						SetState(m_Index_LookInfo,0);
						SetState(m_Index_GotoRoom,0);
					}
					if (window.MYDATA.GetChannel() == _Channel)//好友和自己在同一频道
					{
						if (_State == 0 || _State == 4)
						{
							SetState(m_Index_Private,0);
							SetState(m_Index_LookInfo,0);
						}
						if (_State == 2 && window.GetMyState() == 1)//在房间中且自己在房间外
						{
							SetState(m_Index_GotoRoom,1);
						}
					}
					if (window.MYDATA.GetChannel() != _Channel && _Channel != "")//不在同一频道
					{
						SetState(m_Index_Private,0);
						SetState(m_Index_LookInfo,0);
						SetState(m_Index_GotoRoom,0);
					}

					//点击了私聊
					void On_Private(data)
					{
						window.OnClick_PrivateChat(_NkName);
					}
					//点击了发送消息
					void On_SendMsg(data)
					{
//						alert("name "+_NkName+" jid "+_JID);
						var __name = _NkName;
						var __jid = _JID;
						window.find("UIController").LoadUI("UI_SENDMSG");
						var _SQL = "SELECT * FROM MsgChatReceive WHERE senderName="+__name+" AND reciveUID="+window.GetMyUID()+" ORDER BY id ASC";
						//alert("name "+__name+" jid "+__jid);
						window.find("SENDMSG_LOGIC")._SendMsg_Logic.UpAcceptName(__name,_SQL,__jid);
					}
					//点击了查看信息
					void On_LookInfo(data)
					{
						var _RoleID = window.GetRIDByUID(_JID);
						//设置要查看的个人信息数据-打开个人信息界面前必须调用
						//参数：UID,昵称，RoleID
						window.SetSelfInfoData(_JID,_NkName,_RoleID);
					}
					//点击了删除好友
					void On_DelFriend(data)
					{
						//alert("Del:"+_NkName);
						window.DelFriend(_NkName);
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
			return;
		}
		if (parent.parent.m_Relation == toint(window.FRIEND_BLACKLIST))	//黑名单
		{
			set window.find("TOPLAYER")
			{
				new VMyMouseR_BlackList
				{
					var _list = window.find("VFriend_List_Logic_NAME");
					var _RoleRow = _list.curselectrow();
//					var _UserID = window.find("VFriend_List_Logic_NAME").fieldstr(_RoleRow,window.M_G_SERVER_FRIENDDT_USERID); //玩家ID
					var _NkName = _list.fieldstr(_RoleRow,window.M_G_SERVER_FRIENDDT_NKNAME); //玩家昵称
					var _State = _list.fieldstr(_RoleRow,window.M_G_SERVER_FRIENDDT_GAMESTATE); //游戏状态 0断线 1空闲中 2房间内 3游戏中 4登陆中
					var _RoomID = _list.fieldstr(_RoleRow,window.M_G_SERVER_FRIENDDT_ROOMID); //房间ID
					var _JID = _list.fieldstr(_RoleRow,window.M_G_SERVER_FRIENDDT_JID); //JID
					var _Channel = _list.fieldstr(_RoleRow,window.M_G_SERVER_FRIENDDT_CURRCHANNEL);	//频道名

					SetState(m_Index_GotoRoom,0);
					if (_Channel == "" || _Channel == 0)
					{
						SetState(m_Index_LookInfo,0);
						SetState(m_Index_GotoRoom,0);
					}
					if (window.MYDATA.GetChannel() == _Channel)//好友和自己在同一频道
					{
						if (_State == 0 || _State == 4)
						{
							SetState(m_Index_LookInfo,0);
						}
						if (_State == 2 && window.GetMyState() == 1)//在房间中且自己在房间外
						{
							SetState(m_Index_GotoRoom,1);
						}
					}
					if (window.MYDATA.GetChannel() != _Channel && _Channel != "")//不在同一频道
					{
						SetState(m_Index_LookInfo,0);
						SetState(m_Index_GotoRoom,0);
					}

					//点击了查看信息
					void On_LookInfo(data)
					{
						var _RoleID = window.GetRIDByUID(_JID);
						//设置要查看的个人信息数据-打开个人信息界面前必须调用
						//参数：UID,昵称，RoleID
						window.SetSelfInfoData(_JID,_NkName,_RoleID);
					}
					//点击了加为好友
					void On_AddFriend(data)
					{
						window.CLIENT_BLACK_TO_FRIEND_NKNAME = _NkName;
						window.AddFriend(_NkName);
					}
					//点击了前往房间
					void On_GotoRoom(data)
					{
						//获得用户的房间号 2009年2月4日
						window.Too_GetUserDid(""+_NkName);
					}
					//点击了删除黑名单
					void On_DelBlacklist(data)
					{
						window.DelFriend(_NkName);
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
			return;
		}
	}
	void OnSelect()
	{
		window.LMH1_Friend_AnyName();	//引导事件

		OnMySelect();
		if (m_CanToRoom && window.GetMyState() == 1)
		{
			parent.parent.s_Btn_GoRoom.SetState(window.USER_STATE_REDAY);//前往房间按钮为亮的
		}
		if (parent.parent.m_Relation == window.FRIEND_FRIEND)	//好友
		{
			parent.parent.s_Btn_AddFriend.show = false;
			parent.parent.s_Btn_DelFriend.show = true;
			parent.parent.s_Btn_GoRoom.show = true;
		}
		if (parent.parent.m_Relation == window.FRIEND_BLACKLIST)	//黑名单
		{
			parent.parent.s_Btn_AddBlackList.show = false;
			parent.parent.s_Btn_DelBlackList.show = true;
			parent.parent.s_Btn_GoRoom.show = false;
		}
	};
	void OnUnSelect()
	{
		OnMyUnSelect();
		parent.parent.s_Btn_GoRoom.SetState(window.USER_STATE_WAIT);//前往房间按钮为灰的
		if (parent.parent.m_Relation == window.FRIEND_FRIEND)	//好友
		{
			parent.parent.s_Btn_AddFriend.show = true;
			parent.parent.s_Btn_DelFriend.show = false;
			parent.parent.s_Btn_GoRoom.show = true;
		}
		if (parent.parent.m_Relation == window.FRIEND_BLACKLIST)	//黑名单
		{
			parent.parent.s_Btn_AddBlackList.show = true;
			parent.parent.s_Btn_DelBlackList.show = false;
			parent.parent.s_Btn_GoRoom.show = false;
		}
	};

	void OnDataExchange(iRow,szData)
	{
		//OnUnSelect();
		var _NkName = parent.fieldstr(iRow,window.M_G_SERVER_FRIENDDT_NKNAME);	//昵称
		var _Lv = parent.fieldstr(iRow,window.M_G_SERVER_FRIENDDT_ROLEMAXLV);		//等级
		var _Sex = parent.fieldstr(iRow,window.M_G_SERVER_FRIENDDT_SEX);		//性别
		var _State = toint(parent.fieldstr(iRow,window.M_G_SERVER_FRIENDDT_GAMESTATE));	//0离线 1空闲中 2房间内 3游戏中 4登陆中
		var _onlineState = toint(parent.fieldstr(iRow,window.M_G_SERVER_FRIENDDT_STATE));	//玩家在线状态，0为不在线，1为在线
		var _JID = parent.fieldstr(iRow,window.M_G_SERVER_FRIENDDT_JID);	//JID
		if(_onlineState == 0)
		{
			_State = 0;
			m_OnlineStateFlag = false;
		}
		if(_onlineState == 1)
		{
			if(m_OnlineStateFlag == false)
			{
				window.find("friendsys").SendGetFriendInfo(_JID,_NkName);
				m_OnlineStateFlag = true;
			}
			
			if(0==_State)
			{
				_State = 1;
			}
		}
		var _Channel = parent.fieldstr(iRow,window.M_G_SERVER_FRIENDDT_CURRCHANNEL);	//频道名
		var _RoomID = toint(parent.fieldstr(iRow,window.M_G_SERVER_FRIENDDT_ROOMID))+1;	//房间ID
		var _roletype = parent.fieldstr(iRow,window.M_G_SERVER_FRIENDDT_ROLETYPE);
		var _vip = window.GetVipByName(_NkName);
		m_CanToRoom = false;
		var _Pos = "--";
		if (window.MYDATA.GetChannel() == _Channel)//好友和自己在同一频道
		{
			if (_State == 0){_Pos = "--";}
			if (_State == 1){_Pos = "游戏大厅";}
			if (_State == 4){_Pos = "登录中";}
			if (_State == 2)
			{
				var _temp = toint(_RoomID)%1000;
				if (_temp <= 0)
				{
					_Pos = "房间内";
				}
				else
				{
					_Pos = ""+_temp+"号房间";m_CanToRoom = true;
				}
			}
			if (_State == 3){_Pos = "游戏中";}
		}
		if (window.MYDATA.GetChannel() != _Channel && _Channel != "")//不在同一频道
		{
			_Pos = _Channel;
		}
		s_NKname.SetData(_NkName,_vip,_State);
		s_Level.SetData(_Lv,_State);
		if (_State == 0){_Sex=" ";}      //在好友下线后性别显示立即改为“ ”, zyy   2011\1\14
		s_Sex.SetData(_Sex,_State);
		s_Pos.SetData(_Pos,_State);
		if (_State == 0)
		{
			_roletype = -1;
		}
		s_TechnicType.SetData(_roletype,_State);
	}
};

//
//总的类：List
//
class VFriend_List_Logic VN2ListCtrl
{
	//需要显示时改变
	size="500,370";valign(32,0);halign(55,0);//simpleshowmode="1,10";
	//
	selecttype="1";colfilter="0";
	bgcolor = "#00FF";

	inclass("VFriend_List_UI"); //界面显示类

	columclass="0,VColumn_Friend_List_Logic"; //ID
};