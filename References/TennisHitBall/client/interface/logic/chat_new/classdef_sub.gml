//
//iframe 的类定义
//

//普通一行的类
class OneChatMsg_All font
{
	var _ChatNeedDel = 0;
	void NameChatMsg(_name)
	{
		name = "ONECHATNAME_"+_name;
		//printf("聊天左键测试 OneChatMsg_All-NameChatMsg（）：this.name:"+this.name);
		_ChatNeedDel = toint(_name)-window.CHAT_MAX_NUM;
		if (_ChatNeedDel >0)
		{
			//printf("聊天左键测试 OneChatMsg_All-NameChatMsg（大于150）：name:"+"ONECHATNAME_"+_ChatNeedDel);
			group.find("ONECHATNAME_"+_ChatNeedDel).del();
		}
	}
};

//小喇叭一行的类
class OneChatMsg_Bugle font
{
	var _ChatNeedDel = 0;
	void NameChatMsg(_name)
	{
		delaydel(window.MSGQUEUE_BUGLE);
	}

	void OnDelete()
	{
		group.parent.OnUnDisplayMsg();
	}
};

//私聊一行的类
/*
class OneChatMsg_P font
{
	var _ChatNeedDel = 0;
	void NameChatMsg(_name)
	{
		name = "OneChatMsg_P"+_name;
		_ChatNeedDel = toint(_name)-150;
		if (_ChatNeedDel >0)
		{
			window.find("OneChatMsg_P"+_ChatNeedDel).del();
		}
	}
};*/

//普通的玩家-有鼠标右键的菜单
class CharUser a
{
	var _USERNAME = "";cursor = window.CURSOR_HAND;
	//弹出右键 菜单
	void OnMouseDownR()
	{
		set window.find("TOPLAYER")
		{
			var _MRChat = new VMyMouseR_Chat
			{
				var _USER_NAME = "";
				//点击了私聊
				void On_Private(data)
				{
					window.OnClick_PrivateChat(_USER_NAME);
				}
				//点击了查看信息
				void On_LookInfo(data)
				{
					//[功能]设置要查看的个人信息数据(只设置昵称)
					//参数：昵称
					window.SetSelfInfoData_NkName(_USER_NAME);
				}
				//点击了加为好友
				void On_AddFriend(data)
				{
					window.AddFriend(_USER_NAME);
				}
				//点击了加入黑名单
				void On_AddBlacklist(data)
				{
					window.AddBlacklist(_USER_NAME);
				}
				//点击了复制昵称
				void On_CopyName(data)
				{
					window.setClipBoardData(_USER_NAME);
				}
				//点击了献花
				void On_PresentFlower(data)
				{
					window.GamePresentFlower(_USER_NAME);
				}
				//邀请加入家族
				void On_AskaddFamily()
				{
					window.F_Family_Askadd(_USER_NAME);
				}
			}
		}
		window.find("TOPLAYER")._MRChat._USER_NAME = _USERNAME;
	}
	//私聊
	void OnMouseDownL()
	{
		//printf("聊天左键测试 OnMouseDownL:_USERNAME="+_USERNAME);
		window.OnClick_PrivateChat(_USERNAME);
	}
	void username(_name)
	{
		//保存这个对象对应的名字
		_USERNAME = _name;
		//printf("聊天左键测试 设置名字 username：_name="+_name+",_USERNAME="+_USERNAME);
		appendString("["+_name+"]");
	}
};

//小喇叭的玩家-有鼠标右键的菜单
class CharUser_B a
{
	var _USERNAME = "";cursor = window.CURSOR_HAND;
	//弹出右键 菜单
	void OnMouseDownR()
	{
		set window.find("TOPLAYER")
		{
			var _MRChat = new VMyMouseR_Msg_TS
			{
				var _USER_NAME = "";
				//点击了加为好友
				void On_AddFriend(data)
				{
					window.AddFriend(_USER_NAME);
				}
				//点击了加入黑名单
				void On_AddBlacklist(data)
				{
					window.AddBlacklist(_USER_NAME);
				}
				//点击了复制昵称
				void On_CopyName(data)
				{
					window.setClipBoardData(_USER_NAME);
				}
				//点击了献花
				void On_PresentFlower(data)
				{
					window.GamePresentFlower(_USER_NAME);
				}
				//邀请加入家族
				void On_AskaddFamily(data)
				{
					window.F_Family_Askadd(_USER_NAME);
				}
			}
		}
		window.find("TOPLAYER")._MRChat._USER_NAME = _USERNAME;
	}
	//私聊
	void OnMouseDownL()
	{
		//printf("聊天左键测试 OnMouseDownL:_USERNAME="+_USERNAME);
		window.OnClick_PrivateChat(_USERNAME);
	}
	void username(_name)
	{
		//保存这个对象对应的名字
		_USERNAME = _name;
		//printf("聊天左键测试 设置名字 username：_name="+_name+",_USERNAME="+_USERNAME);
		appendString("["+_name+"]");
	}
};

//自己
class CharSelf font
{
	void username(_name)
	{
		appendString(_name);
	}
};

//2世界,3队伍,4频道,5系统,6GM,7提示,8公告,9小喇叭
class CharOther font
{
	void username(_name)
	{
		appendString("["+_name+"]");
	}
};

//物品
class CGoods font
{
	void goodsname(_name)
	{
		appendString("["+_name+"]");
	}
};

//邀请一行的类
class OneChatMsg_Invite font
{
	var m_UID = 0;//玩家UserID
	var m_RoomID = -1;	//房间号
	var m_Num = -1;		//信息的编号-用于删除倒计时
	var m_Type = 3;		//回复的类型(0拒绝 1同意 2超时 3不在空闲中)

	void Init(uid)
	{
		m_UID = uid;
		timer(15000,"AnswerInvite(2)","AnswerInvite_Name");
	}

	//点击接受或拒绝后调用此函数
	//参数 ：(0拒绝 1同意 2超时)
	void AnswerInvite(type)
	{
		m_Type = type;
		group.find("VInvite_Timer_"+m_Num).del();
		killtimer("AnswerInvite_Name");
		color = "#000000";
		find("VInvite_Accept").del();
		find("VInvite_Refuse").del();
		if (type == 1)
		{
			var _param = ""+window.GetMyUID()+","+m_RoomID+",-1,"+m_UID;
			//邀请加入房间绿色通道:用户id,房间id,游戏类型 邀请者ID
			window.Too_InviteJoinRoom(_param,m_RoomID);
		}
		var _param2 = ""+window.GetMyName()+ ","+m_UID+","+type;
		//回复邀请:"被邀请者昵称",邀请者ID,类型(0拒绝 1同意 2超时 3不在空闲中)
		window.Too_IRefuseToRoom(_param2);
	}

	void OnDelete()
	{
		if (m_Type == 3)
		{
			var _param3 = ""+window.GetMyName()+ ","+m_UID+",3";
			//回复邀请:"被邀请者昵称",邀请者ID,类型(0拒绝 1同意 2超时 3不在空闲中)
			window.Too_IRefuseToRoom(_param3);
		}
	}
};
//邀请-接受
class VInvite_Accept font
{
	name = "VInvite_Accept";
	var m_UID = 0;//玩家UserID
	void Init(uid)
	{
		m_UID = uid;
		appendString("&lt接受&gt");
	}
	color = "#02700A";
	void OnMouseOver(){color = "#0000FF";}
	void OnMouseOut(){color = "#02700A";}

	void OnClick()
	{
		parent.AnswerInvite(1);
	}
};

//邀请-拒绝
class VInvite_Refuse font
{
	name = "VInvite_Refuse";
	var m_UID = 0;//玩家UserID
	void Init(uid)
	{
		m_UID = uid;
		appendString("&lt拒绝&gt");
	}
	color = "#02700A";
	void OnMouseOver(){color = "#0000FF";}
	void OnMouseOut(){color = "#02700A";}

	void OnClick()
	{
		parent.AnswerInvite(0);
	}
};

//邀请-倒计时
class VInvite_Timer text
{
	var _Time = 15;//单位：秒
	void Init(num)
	{
		name = "VInvite_Timer_"+num;
		delaydel(15000);
		while(1)
		{
			src = ""+_Time;
			sleep(1000);
			_Time -= 1;
		}
	}
	color = "#02700A";
};