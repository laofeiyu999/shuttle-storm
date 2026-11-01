//陈晓聪 2009年3月31日
import("$./../GmlCtrls/VPopWnd/ClassDef.gml");

class ChatEdit_UI edit
{
	void Init()
	{
		valign(100,-6);halign(100,-405);size="100%,18,-482,0";
		font = "宋体,-1,12";bgcolor = -1;maxsize= 75;xcenter = false;ycenter = true;
		color = "#0";choicebkcolor="#0";choicecolor="#ffffff";cursorcolor = "#0";
	}
};

class ChatSend_UI item
{
	size="100%,100%";valign(100,0);
	var _bugleOrPrivateFlag = 0;
	void Init()
	{
//		//类型选择按钮
//		staticvar _typeselect = new VBTN_Chat_typeBase
//		{
//			valign(100,-6);
//			void SetData(data)
//			{
//				if (toint(data) == toint(window.CHAT_CHANNEL_CURRENT))
//				{
//					InitText("当前");
//					return;
//				}
//				if (toint(data)  == toint(window.CHAT_CHANNEL_ZONE))
//				{
//					InitText("区域");
//					return;
//				}
//				if (toint(data)  == toint(window.CHAT_CHANNEL_GROUP))
//				{
//					InitText("家族");
//					return;
//				}
//				if (toint(data)  == toint(window.CHAT_CHANNEL_TEAM))
//				{
//					InitText("队伍");
//					return;
//				}
//				if (toint(data)  == toint(window.CHAT_CHANNEL_XIAOLABA))
//				{
//					InitText("传音笛");
//					return;
//				}
//				if (toint(data)  == toint(window.CHAT_CHANNEL_PRIVATE))
//				{
//					InitText("私聊");
//					return;
//				}
//				if (toint(data)  == toint(window.CHAT_CHANNEL_BULUO))
//				{
//					InitText("部落");
//					return;
//				}
//			}
//		}
		//输入框背景
		staticvar _enterEditBK = new Pic9_EditBK2_UI
		{
			valign(100,-6);halign(100,-404);size="100%,18,-480,0";
		}
		//动作表情显示框
		staticvar s_actionBrowText = new BaseText{pos(78,parent.height-22);show = false;}//valign(100,-6);size = "40,18";ycenter = true;
		//私聊对象显示框
		staticvar s_privatePeopleText = new BaseText{pos(76,parent.height-22);show = false;}//size = "70,18";valign(100,-6);xcenter = true;ycenter = true;
		//玩家名输入框
//		staticvar s_private_bk = new img{pos = "47,172";src = "$./imgs/bk_PlayerName.tga";}
		//弹出私聊名称框的按钮
//		staticvar _privatenamebtn = new VBTN_DropSmall_New{pos = "162,174";};
		//输入钮
		staticvar _enter = new VBTN_43_New{valign(100,-6);halign(100,-360);InitText("←发送");};
		//表情选择按钮
		staticvar _browbtn = new VBTN_ChatBrow_New{valign(100,-6);halign(100,-340);SetHangID(15);};
		//互动表情选择按钮
		staticvar _actionbrowbtn = new VBTN_ChatActionBrow_New{valign(100,-6);halign(100,-320);SetHangID(27);};
		//隐藏按钮
		staticvar _hide = new VBTN_HideChat_New
		{
			valign(100,-6);halign(100,-300);SetHangID(28);
			show = true;
		};
		//显示按钮
		staticvar _show = new VBTN_ShowChat_New
		{
			valign(100,-6);halign(100,-300);SetHangID(29);
			show = false;
		};
		//选择私聊对象背景
//		staticvar _selectprivatenamebk = new imgm{pos = "48,112";size = "113,58";src = "$./imgs/bk_NameList.tga";};
	}
	//data:是否 true false
	//_actname:动作的名字
	void OnActionBugle(data,_actname)//是不是实景喇叭
	{
		if (data)
		{
			_bugleOrPrivateFlag = 1;
			if (_actname != 0 && _actname != "")
			{
				s_actionBrowText.SetData(_actname);
			}
			else
			{
				s_actionBrowText.SetData("打招呼");
			}
			s_actionBrowText.show = true;
			
			var _diff = -482;
			_diff -= s_actionBrowText.width;
			_input.size("100%",18,_diff,0);
			_input.maxsize = 60;//_input.size="100%,18,-522,0";
			if(parent.parent.m_ChatPos == window.CHAT_UIPOS_GAME)
			{
				_actionbrowbtn.SetState(window.BTN_STATE_LIGHT);
			}
		}
		else
		{
			_bugleOrPrivateFlag = 0;
			s_actionBrowText.show = false;
			_input.size = "100%,18,-482,0";_input.maxsize = 75;
			if(parent.parent.m_ChatPos == window.CHAT_UIPOS_GAME)
			{
				_actionbrowbtn.SetState(window.BTN_STATE_GREY);
			}
		}
	}
	//私聊对象显示
	void OnPrivatePeople(data)
	{
		if(data != "")
		{
			s_privatePeopleText.show = true;s_privatePeopleText.SetData("["+data+"]");
			if(_bugleOrPrivateFlag != 1)
			{
				var _diff = -482;
				_diff -= s_privatePeopleText.width;
				_input.size("100%",18,_diff,0);_input.maxsize = 50;
			}
		}
		else
		{
			s_privatePeopleText.show = false;s_privatePeopleText.SetData("");
			if(_bugleOrPrivateFlag != 1)
			{
				_input.size = "100%,18,-482,0";_input.maxsize = 75;
			}
			
		}
	}
};
