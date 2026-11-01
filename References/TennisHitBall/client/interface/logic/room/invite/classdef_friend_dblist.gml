//邀请-好友-List类定义
//yxf 2008年10月23日

import ("$./../../../UI/Room/Invite/ClassDef_Friend_DBList.gml");

//一行显示类：昵称+等级+性别+位置
class VColumn_InviteFriend_List_Logic item
{
	size = "400,30";//bgcolor = "#FF00";

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

		//称号
		//参数 data1：玩家的UID
		staticvar s_Title = new VMyText{pos = "300,0";}

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

	}
	inclass("VColumn_InviteFriend_List_UI"); //界面显示类
	Init();
	void OnMySelect(){bgcolor = "#FFEA99";alpha = 50;}	//选择的效果
	void OnMyUnSelect(){bgcolor = "-1";}				//不选择的效果
	//===========================================================
	void OnMouseDownR()
	{
		parent.checkselect(20,parent.mousey);
		set window.find("TOPLAYER")
		{
			new VMyMouseR_InviteFriend
			{
				var _list = window.find("VInvite_Friend_List_Logic_NAME");
				var _RoleRow = _list.curselectrow();
				var _NkName = _list.fieldstr(_RoleRow,window.M_G_SERVER_FRIENDDT_NKNAME); //玩家昵称
				var _State = _list.fieldstr(_RoleRow,window.M_G_SERVER_FRIENDDT_STATE); //游戏状态 0断线 1空闲中 2房间内 3游戏中 4登陆中
				var _RoomID = _list.fieldstr(_RoleRow,window.M_G_SERVER_FRIENDDT_ROOMID); //房间ID
				var _JID = _list.fieldstr(_RoleRow,window.M_G_SERVER_FRIENDDT_JID); //JID
				var _Channel = _list.fieldstr(iRow,window.M_G_SERVER_FRIENDDT_CURRCHANNEL);	//频道名

				if (_Channel == "" || _Channel == 0)
				{
					SetState(m_Index_Private,0);
					SetState(m_Index_LookInfo,0);
					SetState(m_Index_PresentFlower,0);
				}
				if (window.MYDATA.GetChannel() == _Channel)//好友和自己在同一频道
				{
					if (_State == 0 || _State == 4)
					{
						SetState(m_Index_Private,0);
						SetState(m_Index_LookInfo,0);
					}
				}
				if(_State!=1)
				{
					SetState(m_Index_Invite,0);
				}
				if (window.MYDATA.GetChannel() != _Channel && _Channel != "")//不在同一频道
				{
					SetState(m_Index_Private,0);
					SetState(m_Index_LookInfo,0);
				}
				//点击了邀请
				void On_Invite(data)
				{
					//发出邀请某人加入房间消息:对方用户id
					window.Too_IRequestToRoom(_JID);
				}
				//点击了私聊
				void On_Private(data)
				{
					window.OnClick_PrivateChat(_NkName);
				}
				//点击了发送消息
				void On_SendMsg(data)
				{
					var __name = _NkName;
					var __jid = _JID;
					window.find("UIController").LoadUI("UI_SENDMSG");
					var _SQL = "SELECT * FROM MsgChatReceive WHERE senderName="+__name+" AND reciveUID="+window.GetMyUID()+" ORDER BY id ASC";
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
				//点击了加为好友
				void On_AddFriend(data)
				{
					window.AddFriend(_NkName);
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
				void On_AskaddFamily(data)
				{
					window.F_Family_Askadd(_NkName);
				}
			}
		}
	}
	void OnSelect()
	{
		OnMySelect();
		parent.parent.s_Btn_Invite.SetState(window.USER_STATE_REDAY);
	}
	void OnUnSelect()
	{
		OnMyUnSelect();
		parent.parent.s_Btn_Invite.SetState(window.USER_STATE_WAIT);
	}
	void OnDataExchange(iRow,szData)
	{
		var _Vip = window.GetVipByName(parent.fieldstr(iRow,window.M_G_SERVER_FRIENDDT_NKNAME));
		s_NKname.SetData(parent.fieldstr(iRow,window.M_G_SERVER_FRIENDDT_NKNAME),_Vip);//昵称
		s_Level.SetData(parent.fieldstr(iRow,window.M_G_SERVER_FRIENDDT_ROLEMAXLV),"");//等级
		s_Sex.SetData(parent.fieldstr(iRow,window.M_G_SERVER_FRIENDDT_SEX),"");//性别
		s_Title.SetData(parent.fieldstr(iRow,window.M_G_SERVER_FRIENDDT_QUALIFY),"");//称号
		s_TechnicType.SetData(parent.fieldstr(iRow,window.M_G_SERVER_FRIENDDT_ROLETYPE));
	}
};

//
//总的类：List
//
class VInvite_Friend_List_Logic VN2ListCtrl
{
	//需要显示时改变
	size="400,500";valign(30,0);halign(55,0);simpleshowmode="1,10";
	//
	selecttype="1";colfilter="0";
	bgcolor = "#00FF";

	inclass("VInvite_Friend_List_UI"); //界面显示类

	columclass="0,VColumn_InviteFriend_List_Logic"; //ID
};