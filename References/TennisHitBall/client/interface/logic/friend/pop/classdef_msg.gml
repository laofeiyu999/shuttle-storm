//好友右键发送消息弹出框
//yxf 2008年10月21日

importex("$./ClassDef_Msgiframe.gml");
importex("$./../../../UI/Friend/Pop/ClassDef_Msg.gml");

class VPop_SendMsg_Logic item
{
	size = "400,500";bgcolor = "#FF";alpha = 50;
	valign(50,0);halign(50,0);
	var m_GMID = 0;		//GM的ID用来区分 是好友聊天 还是GM聊天
	var m_NkName = "";	//对话者的昵称
	//=========================与界面交互=========================
	void Init()
	{
		//收件人
		staticvar s_TEXT_Receiver = new VMyText
		{
			src = "发件人：";pos = "0,30";
		}
		//输入框
		staticvar s_EDIT_YourWord = new edit
		{
			pos = "10,300";size = "380,140";maxsize = 500;
			bgcolor = "#FFFF";
			autoenter = true;
			font = "宋体,-1,20";
		}
		//清楚记录：按钮
		staticvar s_Btn_Clear = new VMyButton
		{
			Init("清楚记录");pos = "10,270";
		}
		//表情：按钮
		staticvar s_Btn_Face = new VMyButton
		{
			Init("⊙");size = "30,30";pos = "110,270";
		}
		//发送：按钮
		staticvar s_Btn_Send = new VMyButton
		{
			Init("发送");valign(96,0);halign(15,0);
		}
		//关闭：按钮
		staticvar s_Btn_Close = new VMyButton
		{
			Init("关闭");valign(96,0);halign(85,0);
		}
		//关闭X：按钮
		staticvar s_Btn_CloseX = new VMyButton
		{
			halign(100,0);Init("X");size = "35,35";
		}
	}
	inclass("VPop_SendMsg_UI");//界面显示类
	//============================function===============================
	//设置响应事件
	void SetEvent()
	{
		set s_TEXT_Receiver//收件人
		{
//			cursor = window.CURSOR_HAND;
//			void OnMouseDownR()
//			{
//				parent.checkselect(20,parent.mousey);
//				set window.find("TOPLAYER")
//				{
//					new VMyMouseR_Msg_TS
//					{
//						//点击了加为好友
//						void On_AddFriend(data)
//						{
//							window.AddFriend(window._MsgWhoName);
//						}
//						//点击了加入黑名单
//						void On_AddBlacklist(data)
//						{
//							window.AddBlacklist(window._MsgWhoName);
//						}
//						//点击了复制昵称
//						void On_CopyName(data)
//						{
//							window.setClipBoardData(window._MsgWhoName);
//						}
//					}
//				}
//			}
		}
		set s_Btn_Send//发送：按钮
		{
			void OnPressed(){parent.SendRelationMsg();}
		}
		set s_Btn_Close//关闭：按钮
		{
			void OnPressed(){parent.parent.del();}
		}
		set s_Btn_CloseX//关闭X：按钮
		{
			void OnPressed(){parent.parent.del();}
		}
		set s_Btn_Clear//清楚记录：按钮
		{
			void OnPressed(){parent._iframe.ClearAll();}
		}
		set s_Btn_Face//表情：按钮
		{
			void OnPressed(){parent.OnClick_BtnFace();}
		}
		set s_EDIT_YourWord//输入框
		{
			setFocus = "true";
			timer(50,"hot=1");
			void OnEnter(){parent.SendRelationMsg();}
		}
	}
	//更新显示的昵称 和 当前聊天的玩家昵称
	void UpAcceptName(NKNAME,SQL,JID)
	{	
		printf("B# UpAcceptName()SQL:"+SQL);
		printf("B# UpAcceptName:NKNAME:"+NKNAME+",JID:"+JID);
		window._MsgWhoName = NKNAME;	//将当前的聊天对象昵称保存
		window._MsgWhoJID = JID;
		s_TEXT_Receiver.SetData(NKNAME);//+"进行对话";		//显示用的名字
		_iframe.NewMsgSelect(SQL);
		//_iframe.UpDataMsg();
	}
	//字符转换
	void StrTranslate(_str)
	{
		var _temp = _str;
		
		_temp = _temp.Replace("{","｛");
		_temp = _temp.Replace("}","｝");
		_temp = _temp.Replace("\"","“");
		_temp = _temp.Replace(";","；");
		_temp = _temp.Replace("=","＝");
		_temp = _temp.Replace("<","《");
		_temp = _temp.Replace(">","》");
		_temp = _temp.Replace("&","＆");
		return _temp;
	}
	//发送信息
	void SendRelationMsg()
	{
		//空信息不能发送 
		if (s_EDIT_YourWord.src.TrimLeft(" ") == "")
		{
			s_EDIT_YourWord.src = "";
			return;
		}
		
		s_EDIT_YourWord.src = StrTranslate(s_EDIT_YourWord.src);
		//看是不是GM聊天 2010年3月25日
		if (m_GMID > 0)
		{
			var _Param = ""+window.CHAT_GMTOOL+","+m_GMID+",\""+s_EDIT_YourWord.src+"\","+window.GetMyName()+","+m_NkName;
			//发出聊天消息：聊天类型，界面位置，聊天内容，自己的昵称，别人的昵称
			window.Too_SendChatMsg(_Param);
			_iframe.ReceiveMsgData(window.GetMyName(),s_EDIT_YourWord.src);
			s_EDIT_YourWord.src = "";
			TimerSetHot();
			return;
		}
		
		var _state = window.GetFriStateByJID(window._MsgWhoName);
//		if (toint(_state) <= window.USER_GAMESTATE_OFFLINE)
//		{
//			_iframe.ReceiveMsgData("消息系统","对方已下线，无法发送消息！");
//			return;
//		}
		if (toint(_state) == window.USER_GAMESTATE_GAME)
		{
			_iframe.ReceiveMsgData("消息系统","对方在游戏中，可能不能及时回复！");
			//return;
		}
		//发送好友即时消息
		//参数：JID，内容，我的昵称
		//alert("sendnow _MsgWhoJID"+window._MsgWhoJID);
		//参数：JID，内容，我的昵称,类型-2好友1v1聊天，0好友消息 1（拒绝索要）
		window.find("friendsys").SendMsg(window._MsgWhoJID,s_EDIT_YourWord.src,window.GetMyName(),"#ff",-2);
		_iframe.ReceiveMsgData(window.GetMyName(),s_EDIT_YourWord.src);

		//向好友发送了一条消息，由客户端向服务器发送
		//参数：用户ID,任务ID,任务描述
//		var _Param = ""+window.GetMyUID()+","+window.CLIENT_3_SENDMSG+","+window.CLIENT_3_SENDMSG_STR+",1";
//		window.Tos_AddEvent(_Param);
		var _Param1 = ""+window.GetMyUID()+","+window.CLIENT_3_SENDMSG1+","+window.CLIENT_3_SENDMSG_STR+",1";
		window.Tos_AddEvent(_Param1);
//		var _Param2 = ""+window.GetMyUID()+","+window.CLIENT_3_SENDMSG2+","+window.CLIENT_3_SENDMSG_STR+",1";
//		window.Tos_AddEvent(_Param2);
//		var _Param3 = ""+window.GetMyUID()+","+window.CLIENT_3_SENDMSG3+","+window.CLIENT_3_SENDMSG_STR+",1";
//		window.Tos_AddEvent(_Param3);

		s_EDIT_YourWord.src = "";
		TimerSetHot();
	}
	//计时设置焦点
	void TimerSetHot()
	{
		timer(300,"SetHotOfEdit","SetHotOfChatEdit");
	}
	//使用Enter等 激活输入框
	void SetHotOfEdit()
	{
		s_EDIT_YourWord.hot = 1;
		killtimer("SetHotOfChatEdit");
	}

	//添加表情
	void AddFace(mark)
	{
		s_EDIT_YourWord.setCursorIndex(_cursorPos);
		s_EDIT_YourWord.insertsrc(mark);
		TimerSetHot();
	}
	var _cursorPos = 0;	//鼠标在Edit的位置
	void OnClick_BtnFace()//点击了表情图标
	{
		_cursorPos = s_EDIT_YourWord.getCursorIndex();
		set window.find("TOPLAYER")
		{
			new VChat_Brow_Logic
			{
				m_Type = 1;//类型 0是聊天 1是好友消息
			}
		}
	}

	//GM的聊天接口 2010年3月25日
	//szInfo:发送来的消息
	//szGMName:GM的名字
	//iGMID:GM的ID
	void GMTalk(szInfo,szGMName,iGMID)
	{
		m_NkName = szGMName;
		m_GMID = iGMID;
		s_Btn_Face.show = false;
		SetGMMsgTitle();	//换显示标题
		s_TEXT_Receiver.SetData(szGMName);//+"进行对话";		//显示用的名字
		_iframe.ReceiveMsgData(szGMName,szInfo);
	}

	//============================================================================
	Init();
	var _iframe = new VFriendMsgiframe_Logic{}
	SetEvent();
};