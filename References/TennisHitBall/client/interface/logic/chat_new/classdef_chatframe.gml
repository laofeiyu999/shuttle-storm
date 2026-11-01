importex("$./ClassDef_Sub.gml");
import("$./../../UI/Chat_New/ClassDef_ChatFrame.gml");

class ChatFameSelectBtn_Logic item
{
	pos(0,320);size="400,30";
	void Init()
	{
		// 全部
		staticvar s_R_Cur = new VMyRadio
		{
			pos = "36,0";Init("全部");
		}
		// 家族
		staticvar s_R_Social = new VMyRadio
		{
			pos = "92,0";Init("家族");
		}
		// 私聊
		staticvar s_R_Private = new VMyRadio
		{
			pos = "148,0";Init("队伍");
		}
	}
	inclass("ChatFameSelectBtn_UI");
	void SetEvent()
	{
		set s_R_Cur
		{
			groupname="chat_chance";
			startstate="1";
			var _first = false;//为音效而加
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();
				if (_first){OnCheck_Sound();}
				_first = true;
				parent.ChangeChatWindow(0);


			}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_R_Social
		{
			groupname="chat_chance";
			var _first = false;//为音效而加
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();
				if (_first){OnCheck_Sound();}
				_first = true;
				parent.ChangeChatWindow(1);


			}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_R_Private
		{
			groupname="chat_chance";
			var _first = false;//为音效而加
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();
				if (_first){OnCheck_Sound();}
				_first = true;
				parent.ChangeChatWindow(2);
			}
			void OnUnCheck(){MouseUnCheck();}
		}
	}
	void ChangeChatWindow(index)
	{
		parent.ChangeChatWindow(index);
	}
	//切换
	Init();
	SetEvent();
};

class ChatFrame_Scroll_Logic iframe
{
	var _end = 1;//是否滚动条在最下端
	pos(0,350);
	SmoothScroll=2;
	leftscrollbar=true;
	group = 1;
	scroll = "no;smallscroll";
//	src = "$./lrchat.htm";
	src = "chat.htm";
	inclass("ChatFrame_Scroll_UI");
	//普通：你说/谁说
	void ChatType0(num,sendername,content,senderid)
	{
		//泡泡
		window.OnChatPaopao(senderid,content,parent.parent.m_ChatPos);

		set BODY
		{
			content = window.g_DirtyFilter_Chat.Trans(content);
			content = window.ParseFace(content);//解析表情
			var _class="CHAT_OTHERSAY";
			var _user="CharUser";
			if (sendername == window.GetMyName())
			{
				sendername = "你";
				_class = "CHAT_ISAY";
				_user = "CharSelf";
			}
			appendHtml("<OneChatMsg_All class="+_class+" + NameChatMsg("+num+")>"+
						"<"+_user+" username("+sendername+")/>"+
						"<CharSelf class=CHAT_SAYTO username(说：)/>"+
						content+"<br></OneChatMsg_All>");
			starttypeset();
		}
	}
	//私聊：谁对你说/你对谁说
	void ChatType1(num,sendername,acceptname,content,senderid)
	{
		set BODY
		{
			content = window.g_DirtyFilter_Chat.Trans(content);
			content = window.ParseFace(content);//解析表情

			var _user = "CharUser";
			var _user2 = "CharUser";
			var _class = "CHAT_OTHERSAY";
			if (sendername == window.GetMyName())
			{
				sendername = "你";
				_class = "CHAT_ISAYTO";
				_user = "CharSelf";
				senderid = -1;
			}
			if (acceptname == window.GetMyName())
			{
				acceptname="你";
				_class="CHAT_OTHERSAYTOI";
				_user2="CharSelf";

				//音效
				window.PlaySound(143);
			}
			appendHtml("<OneChatMsg_All class="+_class+" + NameChatMsg("+num+")>"+
						"<"+_user+" username("+sendername+")/>"+
						"<CharSelf class=CHAT_SAYTO username(对)/>"+
						"<"+_user2+" username("+acceptname+")/>"+
						"<CharSelf class=CHAT_SAYTO username(说：)/>"+
						content+"<br></OneChatMsg_All>");
			starttypeset();
		}
	}
	//家族：
	void ChatType2(num,sendername,content)
	{
		set BODY
		{
			content = window.g_DirtyFilter_Chat.Trans(content);
			content = window.ParseFace(content);//解析表情
			var _class = "CHAT_WORLD";
			var _classPeople = "CHAT_OTHERSAYTOI";
			var _user = "CharUser"; 
			if (sendername == window.GetMyName())
			{
				sendername = "你";
				_user = "CharSelf";
				_classPeople = "CHAT_ISAYTO";
				senderid = -1;
			}
			if(sendername != "")
			{
				appendHtml("<OneChatMsg_All class="+_class+" + NameChatMsg("+num+")>[家族]"+
				"<CharSelf class=CHAT_SAYTO>"+
				"<"+_user+" username("+sendername+")/>"+
				"</CharSelf>"+
				"<CharSelf class=CHAT_SAYTO>说："+content+"<br></OneChatMsg_All>");
			}
			else
			{
				appendHtml("<OneChatMsg_All class="+_class+" + NameChatMsg("+num+")>[家族提示]："+content+"<br></OneChatMsg_All>");
			}
			starttypeset();
		}
	}
	//队伍：
	void ChatType3(num,content)
	{
		content = window.g_DirtyFilter_Chat.Trans(content);
		set BODY
		{
			var _class = "CHAT_TEAM";
			appendHtml("<OneChatMsg_All class="+_class+" + NameChatMsg("+num+")>
			队伍："+content+"<br></OneChatMsg_All>");
			starttypeset();
		}
	}
	//频道：
	void ChatType4(num,content)
	{
		content = window.g_DirtyFilter_Chat.Trans(content);
		set BODY
		{
			var _class = "CHAT_CHANNEL";
			appendHtml("<OneChatMsg_All class="+_class+" + NameChatMsg("+num+")>
			频道："+content+"<br></OneChatMsg_All>");
			starttypeset();
		}
	}
	//系统公告：
	void ChatType5(num,content)
	{
		//content = window.g_DirtyFilter_Chat.Trans(content);
		content = window.ParseFace(content);//解析表情
		set BODY
		{
			var _class = "CHAT_SYSTEM_POST";
			appendHtml("<OneChatMsg_All class="+_class+" + NameChatMsg("+num+")>
			系统公告："+content+"<br></OneChatMsg_All>");
			starttypeset();
		}
	}
	//GM
	void ChatType6(num,content)
	{
		set BODY
		{
			content = window.g_DirtyFilter_Chat.Trans(content);

			var _class = "CHAT_GM";
			appendHtml("<OneChatMsg_All class="+_class+" + NameChatMsg("+num+")>
			GM："+content+"<br></OneChatMsg_All>");
			starttypeset();
		}
	}
	//系统提示：
	void ChatType7(num,content,sendername)
	{
		//printf("B# ChatType7:sendername:"+sendername);
		set BODY
		{
			var _class="CHAT_SYSTEM_POINT";
			if (tostring(sendername) != "" && tostring(sendername) != "0")
			{
				var _user="CharUser";
				appendHtml("<OneChatMsg_All class="+_class+" + NameChatMsg("+num+")>
				系统提示：<"+_user+" username("+sendername+")/>"+content+"<br></OneChatMsg_All>");
			}
			else
			{
				appendHtml("<OneChatMsg_All class="+_class+" + NameChatMsg("+num+")>
				系统提示："+content+"<br></OneChatMsg_All>");
			}
			starttypeset();
		}
	}
	//小喇叭：你说/谁说
	void ChatType9(num,sendername,content,senderid)
	{
		set BODY
		{
			content = window.g_DirtyFilter_Chat.Trans(content);
			content = window.ParseFace(content);//解析表情

			var _class="CHAT_BUGLE_OTHER";
			var _user="CharUser_B";
			if (sendername == window.GetMyName())
			{
				sendername = "你";
				_class = "CHAT_BUGLE_I";
				_user = "CharSelf";
			}
			appendHtml("<OneChatMsg_All class="+_class+" + NameChatMsg("+num+")>"+
						"<VBugle_Img></VBugle_Img><"+_user+" username("+sendername+")/>"+
						"<CharSelf username(说：)/>"+
						content+"<br></OneChatMsg_All>");
			starttypeset();
		}
	}
	//物品
	void ChatType10(num,goodsname,quality,goodsID,goodsNum)
	{
		set BODY
		{
			var _color = "#FFFFFF";
			switch (quality)
			{
				case 1:{_color ="#00FF00";break;}
				case 2:{_color ="#0000FF";break;}
				case 3:{_color ="#FF00FF";break;}
				case 4:{_color ="#FF8000";break;}
				case 5:{_color ="#FFFF00";break;}	
			}
			var _class = "CHAT_GOODS";
			appendHtml("<OneChatMsg_All class="+_class+" + NameChatMsg("+num+")>
			系统：您获得了物品<CGoods + goodsname("+goodsname+") color="+_color+"></CGoods>
			×"+goodsNum+" <br></OneChatMsg_All>");
			starttypeset();
		}
	}
	//邀请消息
	void ChatType12(num,uid,nkname,roomid)
	{
		set BODY
		{
			var _user = "CharUser";
			var _class = "CHAT_INVITE";
			var _roomID = window.RoomIDToShowID(roomid);

			if (_roomID > 10 && _roomID < 100)
			{
				_roomID = "0"+_roomID;
			}
			if (_roomID < 10)
			{
				_roomID = "00"+_roomID;
			}
			new VInvite_Timer{Init(num);}
			appendHtml("<OneChatMsg_Invite class="+_class+" + Init("+uid+") m_RoomID="+roomid+" m_Num="+num+">
			<"+_user+" username("+nkname+")/>邀请您去房间"+_roomID+"。
			<VInvite_Accept + Init("+uid+") ></VInvite_Accept>&nbsp;
			<VInvite_Refuse + Init("+uid+") ></VInvite_Refuse>
			<br></OneChatMsg_Invite>");
			//&nbsp;&nbsp;
			starttypeset();
		}
	}
	var _TB = new VNet2DBTable//数据库视图
	{
		Init(window.M_G_SERVER,window.CHATRECEIVE);

		var _MsgNum = 0;//标记第及条聊天记录：例如最多保存100条
		new ChatScrollCtrl{name ="ChatScrollCtrl_Logic";}
		void WriteScrollEnd()
		{
			parent._end = window.find("ChatScrollCtrl_Logic").IsScrollEnd(parent.BODY);
		}
		void ScrollToEnd()
		{
			if(toint(parent._end)==1 )
			{
				window.find("ChatScrollCtrl_Logic").ScrollEnd(parent.BODY);
			}
		}
		//数据库增加记录会自动调此函数 type:0普通,1私聊,2家族,3队伍,4频道,5系统公告,6GM,
		//7系统提示,8滚动公告,9小喇叭,10实景喇叭，11最上层的系统公告 12邀请 13系统提示带昵称
		void OnAddData(id,type,type2,content,senderID,senderName,acceptname,_color,channlID,tm)
		{
			WriteScrollEnd();
			if ( parent._end == 1)
			{
				sendchatcontent(id,type,type2,content,senderID,senderName,acceptname,_color,channlID,tm);
				ScrollToEnd();
			}
			else
				sendchatcontent(id,type,type2,content,senderID,senderName,acceptname,_color,channlID,tm);

			//滚动到末尾
			//parent.timer(10,"scrolltoend","scrolltoend");
			

		}
			
		void sendchatcontent(id,type,type2,content,senderID,senderName,acceptname,_color,channlID,tm)
		{
			printf("B# chat:id:"+id+" type:"+type+" type2:"+type2+" content:"+content+" senderID:"+senderID+" senderName:"+senderName+",_color:"+_color+",channlID:"+channlID+",tm:"+tm);
				//type2:2游戏中 1房间中 0其他
				if (type == window.CHAT_COMMON && parent.parent.parent.m_ChatPos != type2){printf("B# YXF:严重错误,不是这个界面的聊天信息！");return;}
				
				window.find("CHAT_LOGIC").zindex = "top";

				if (type == window.CHAT_COMMON || type == window.CHAT_PRIVATE)
				{
					if (senderName != window.GetMyName()&& senderName != 0 && senderName != "")
					{
						if (window.find("friendsys").CheckRelation(senderName) == toint(window.FRIEND_BLACKLIST))
						{
							printf("B# 禁止聊天；发送者在你的黑名单或者对方在你的黑名单:"+type);
							return;
						}
					}
					if (acceptname != window.GetMyName() && acceptname != 0 && acceptname != "")
					{
						if (window.find("friendsys").CheckRelation(acceptname) == toint(window.FRIEND_BLACKLIST))
						{
							printf("B# 禁止聊天；接受者在你的黑名单或者对方在你的黑名单:"+type);
							return;
						}
					}
				}
				content=toNormalHtml(content);
				//content = content.Replace("<","&lt");
				//content = content.Replace(">","&gt");
				_MsgNum +=1;
				
				//此处不做屏蔽 防止系统消息被和谐
				//content = window.g_DirtyFilter_Chat.Trans(content);

				//var _channelID = window.GetChatChannelID(id);
				if(channlID.__Long__ == 1)
				{
					parent.ChatType2(_MsgNum,senderName,content);
				}
				else
				{
					switch(type)
					{
						case 0:{parent.ChatType0(_MsgNum,senderName,content,senderID);break;}
						case 1:
						{
							parent.ChatType1(_MsgNum,senderName,acceptname,content,senderID);
						}
	//					case 2:{parent.ChatType2(_MsgNum,senderName,content);break;}
						case 3:{parent.ChatType3(_MsgNum,content);break;}
						case 4:{parent.ChatType4(_MsgNum,content);break;}
						case 5:{parent.ChatType5(_MsgNum,content);break;}
						case 6:{parent.ChatType6(_MsgNum,content);break;}
		//				case 9:
		//				{
		//					parent.ChatType9(_MsgNum,senderName,content,senderID);
		//					if (window.GetMyName() == senderName)
		//					{
		//						window.CheckBugleNum();
		//					}
		//					break;
		//				}
						case 7:{parent.ChatType7(_MsgNum,content,"");break;}
						case 12:{parent.ChatType12(_MsgNum,senderID,senderName,acceptname);break;}
						case 13:{parent.ChatType7(_MsgNum,content,senderName);break;}
						//case 10:{parent.ChatType10(_MsgNum,content,senderID,senderName,acceptname);break;}
						default:break;
					}
				}
				if(parent.parent.GetFrameBkState())
				{
					window.find("ChatMgr_Logic").ShowBG();
				}
		}
	}
	void SetTableSql(data)
	{
		var _sql = "SELECT * FROM "+window.CHATRECEIVE;
		switch (data)
		{
			case 0:
			{
				_sql += " WHERE "+window.M_G_SERVER_CHATRECEIVE_TYPE_STR+"="+window.CHAT_COMMON+
						" OR "+window.M_G_SERVER_CHATRECEIVE_CHANNLID_STR+"=1"+
						" OR "+window.M_G_SERVER_CHATRECEIVE_TYPE_STR+"="+window.CHAT_PRIVATE+
						" OR "+window.M_G_SERVER_CHATRECEIVE_TYPE_STR+"="+window.CHAT_SYS_POST+
						" OR "+window.M_G_SERVER_CHATRECEIVE_TYPE_STR+"="+window.CHAT_GM+
						" OR "+window.M_G_SERVER_CHATRECEIVE_TYPE_STR+"="+window.CHAT_SYS_POINT+
						" OR "+window.M_G_SERVER_CHATRECEIVE_TYPE_STR+"="+window.CHAT_SYS_NICK;
				_TB.Select(window.M_G_SERVER,_sql);
				break;
			}
			case 1://家族
			{
				_sql += " WHERE "+window.M_G_SERVER_CHATRECEIVE_TYPE_STR+"="+window.CHAT_PRIVATE 
				+ " OR "+window.M_G_SERVER_CHATRECEIVE_CHANNLID_STR+"=1";
				_TB.Select(window.M_G_SERVER,_sql);
				break;
			}
			case 2://私聊
			{
				_sql += " WHERE "+window.M_G_SERVER_CHATRECEIVE_TYPE_STR+"="+window.CHAT_PRIVATE +" AND "+window.M_G_SERVER_CHATRECEIVE_CHANNLID_STR+"=0";
				_TB.Select(window.M_G_SERVER,_sql);
				break;
			}
		}
	}
//	void scrolltoend()
//	{
//		group.BODY.scrollto(0,99999999);
//	}
	
};

class ChatFrame_NoScroll_Logic iframe
{
	SmoothScroll=2;
	src = "$./chat.htm";
	group = 1;
	inclass("ChatFrame_NoScroll_UI");
	var _fontColor ="";

	//小喇叭：你说/谁说
	void ChatType9(num,type2,sendername,content,senderid,fontColor)
	{
		if(fontColor == "")
		{
			_fontColor = "#e20272";
		}
		else
		{
			_fontColor = ""+fontColor;
		}
		if(!window._charShowFlag)
		{
			return;
		}
		HideLaba();
		printf("[小喇叭]:num:"+num+",content:"+content+",_fontColor:"+_fontColor);
		set group.BODY
		{
			content = window.ParseFace(content);//解析表情

			var _class="CHAT_BUGLE_OTHER";
			var _user="CharUser_B";
			if (sendername == window.GetMyName())
			{
				sendername = "你";
				_class = "CHAT_BUGLE_I";
				_user = "CharSelf";
			}
//			appendHtml("<OneChatMsg_All class="+_class+" + NameChatMsg("+num+")>"+
//						"<VBugle_Img></VBugle_Img><"+_user+" username("+sendername+")/>"+
//						"<CharSelf username(说：)/>"+
//						content+"<br></OneChatMsg_All>");
			appendHtml("<OneChatMsg_Bugle class="+_class+" + NameChatMsg("+num+") COLOR=\""+group._fontColor+"\">
			<VBugle_Img></VBugle_Img><"+_user+" username("+sendername+")/>
			说："+content+"<br></OneChatMsg_Bugle>");
			group.ResetHeight();
		}
	}

	void ResetHeight()
	{
		BODY.starttypeset();
		var _height = BODY.DocumentHeight;
		if(window.g_probablyPos == window.POS_PROBABLY_GAME)
		{
			size("100%",_height);
		}
		else
		{
			size(630,_height);
		}
		parent.size(parent.width,height);
		parent.pos(parent.left,parent.m_top-(_height-parent.m_height));
	}

	var _TB = new VNet2DBTable//数据库视图
	{
		Init(window.M_G_SERVER,window.CHATRECEIVE);
		Select(window.M_G_SERVER,"SELECT * FROM "+window.CHATRECEIVE+" WHERE "+window.M_G_SERVER_CHATRECEIVE_TYPE_STR+"="+window.CHAT_BUGLE);

		var _MsgNum = 0;//标记第及条聊天记录：例如最多保存100条

		//数据库增加记录会自动调此函数 type:0普通,1私聊,2世界,3队伍,4频道,5系统公告,6GM,
		//7系统提示,8滚动公告,9小喇叭,10物品，11最上层的系统公告 12邀请
		void OnAddData(id,type,type2,content,senderID,senderName,acceptname,_color,channlID,tm)
		{
			//printf("B# 小喇叭:chat:id:"+id+" type:"+type+" type2:"+type2+" content:"+content+" senderID:"+senderID+" senderName:"+senderName);
			//type2:1GM 0其他玩家
			content=toNormalHtml(content);
//			content = content.Replace("<","&lt");
//			content = content.Replace(">","&gt");
			
			//此处不做屏蔽 防止系统消息被和谐
			//content = window.g_DirtyFilter_Chat.Trans(content);

			switch(type)
			{
				case 9:
				{
					//var _num = _MsgNum%3;
					_MsgNum +=1;
					//parent.parent.AddMsg(content,senderName,""+_MsgNum+","+type2+","+senderID);//程序函数
					parent.ChatType9(_MsgNum,type2,senderName,content,senderID,_color);

					if (window.GetMyName() == senderName)
					{
						window.CheckBugleNum();
					}
					break;
				}
				default:break;
			}
		}
	}
	void HideLaba()
	{
		HideFunc();
		window.find("CHAT_LOGIC").zindex = "top";
		parent.show = true;
		killtimer("HideLabaTime");
		setTimer(window.MSGQUEUE_BUGLE,"HideFunc","HideLabaTime");
	}
	void HideFunc()
	{
		BODY.delallchild();
		parent.show = false;
	}
};