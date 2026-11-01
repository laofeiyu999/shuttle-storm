//
//iframe 的类定义
//

//一行消息显示的类
class VOneChatMsg_Friend font
{
	var _ChatNeedDel = 0;
	void NameChatMsg(_name)
	{
		name = "ONECHATNAME_FRIEND_"+_name;
		_ChatNeedDel = toint(_name)-300;
		if (_ChatNeedDel >0)
		{
			window.find("ONECHATNAME_FRIEND_"+_ChatNeedDel).del();
		}
	}
};

//普通的玩家-有鼠标右键的菜单
class MsgCharUser a
{
	var _USERNAME = "";
	//弹出右键 菜单
	void OnMouseDownR()
	{
		set window.find("TOPLAYER")
		{
			var _MRMsg = new VMyMouseR_Msg_TS
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
				void On_AskaddFamily()
				{
					window.F_Family_Askadd(_USER_NAME);
				}
			}
		}
		window.find("TOPLAYER")._MRMsg._USER_NAME = _USERNAME;
	}
	void username(_name)
	{
		//保存这个对象对应的名字
		_USERNAME = _name;
		appendString("["+_name+"]");
	}
};