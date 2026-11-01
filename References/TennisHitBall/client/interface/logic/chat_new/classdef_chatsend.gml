
import("$./ClassDef_Brow_DBList.gml");
import("$./../../UI/Chat_New/ClassDef_ChatSend.gml");
import("$./ClassDef.gml");

class ChatEdit CTennisChatEdit //lredit
{
	name = "ChatEdit_Name";
	var _chatFace = "";
	var _chatType = window.CHAT_LABATYPE_COMMON;
	void Init()
	{
		pos="115,500";bgcolor="#ff00ff";size="100,30";maxsize=400;
	}
	inclass("ChatEdit_UI");
	Init();
	//cursor="input.ani";
	//快捷键的响应函数
	void DI_ShortcutKey(data)
	{
		switch (data)
		{
			case 0: //Ctrl + R
			{
				parent._iCurName = parent.GetLastPrivateName(parent._iCurName);
				//if (parent._iCurName <= parent._LastSpeakToNum){parent._iCurName += 1;}
				break;
			}
			case 1: //Ctrl + ↑
			{
				printf("B# Ctrl + ↑:"+parent.m_iWordIndex+","+parent.m_LastWordArray[parent.m_iWordIndex]);
				
				//alert(parent.m_iWordIndex);
				parent.m_iWordIndex += 1;
				if (parent.m_iWordIndex >= parent.m_iCurWordNum)
				{
					parent.m_iWordIndex = 0;
				}
				parent.GetLastWord(parent.m_iWordIndex);
				
				break;
			}
			case 2: //Ctrl + ↓
			{
				printf("B# Ctrl + ↓:"+parent.m_iWordIndex+","+parent.m_LastWordArray[parent.m_iWordIndex]);
				parent.m_iWordIndex -= 1;
				if (parent.m_iWordIndex < 0)
				{
					parent.m_iWordIndex = parent.m_iCurWordNum - 1;
				}
				parent.GetLastWord(parent.m_iWordIndex);
				break;
			}
		}
	}

	void OnFocus()
	{
		printf("B# + getfocus\n");
		//parent.m_iCurWordNum = 0; 因为会先失去焦点再得到焦点 故此法不行
		if(window.g_probablyPos != window.POS_PROBABLY_GAME || window.find("NAME_GCMap").IsUnLockKey() == 1)
		{
			window.find("gameinput").AddExclusiveShortcutUser(this);
			window.find("gameinput").SetExclusiveUser(this);
			window.find("gameinput").SetDirOnUse(0);//0是关闭方向,1是开启方向
			window.find("NAME_GCMap").KeyBoardEnable(0);//0锁定解锁按键 1解除锁定
		}
//		window.find("ChatMgr_Logic").ShowBG();
		//RecordLastTalk();
		
	}
//	//便捷私聊
//	void RecordLastTalk()
//	{
//		switch(window.charFlag)
//		{
//			case 0:
//			{
////				if(_chatType == window.CHAT_LABATYPE_PRIVATE)
////				{
////					if(window.lastPrivateName != "")
////					{
////						src += _chatFace;
////					}
////				}
////				else
////				{
////					src = ""+_chatFace;
////				}
//				break;
//			}
//			case 1:
//			{
//				window.charFlag = 0;
//				break;
//			}
//			default:break;
//		}
//		
//	}
	void OnEnter()
	{
		parent.SendMsg();
		hot = 0;
	}

	void OnLostFocus()
	{
		printf("B# +lostfocus\n");
		if(window.g_probablyPos != window.POS_PROBABLY_GAME || window.find("NAME_GCMap").IsUnLockKey() == 1)
		{
			if (window.RemFindUser == 0 || window.g_probablyPos == window.POS_PROBABLY_GAME)//判断邀请玩家输入框是否打开
			{
				window.find("NAME_GCMap").KeyBoardEnable(1);//0锁定解锁按键 1解除锁定
				window.find("gameinput").SetDirOnUse(1);//0是关闭方向,1是开启方向
			}
			window.find("gameinput").DeleteUser(this);
			window.find("gameinput").DelShortcutUser(this);
		}
//		window.find("ChatMgr_Logic").SetHideBG();
	}

	void OnCreated(){hot = 0;}
	void OnDelete()
	{
		window.find("gameinput").SetDirOnUse(1);//0是关闭方向,1是开启方向
		window.find("gameinput").DeleteUser(this);
		window.find("gameinput").DelShortcutUser(this);
		window.find("NAME_GCMap").KeyBoardEnable(1);//0锁定解锁按键 1解除锁定
	}

	void OnKeyChar()
	{
		parent.IsNkNameRight();
	}
};

class ChatSend_Logic ChatSend
{
	name = "ChatSend_Logic_name";	// (段晓彤添加)
	size="400,600";
	var _OtherName = "0";						//当前私聊的对象
	var _type = window.CHAT_COMMON;				//聊天类型

	var m_iCurWordNum = 0;						//当前说话的条数
	var m_iWordIndex =-1;						//丄 丅 的索引 发出一条信息后会还原
	var _iCurName = 0;							//当前私聊对象是最后一条

	var m_LastWordArrayNum = 5;
	var m_LastWordArray = sysarray(m_LastWordArrayNum);			//自己上次说的话

	var m_ChooseID = 0;	// (段晓彤修改) 保存玩家选择的动作ID;
	var m_Pos = 0;				// (段晓彤修改)滚动条位置
	
	var _i = 0;
	while (_i < m_LastWordArrayNum)
	{
		m_LastWordArray[_i] = "";
		_i += 1;
	}
	
	var _LastSpeakToNum = 5;
	var _LastSpeakTo = sysarray(_LastSpeakToNum);			//上次私聊的对象
	
	_i = 0;
	while (_i < _LastSpeakToNum)
	{
		_LastSpeakTo[_i] = "";
		_i += 1;
	}

	void Init()
	{
		//输入钮
		staticvar _enter = new VMyButton{pos="200,500";Init("输入");}
		//表情选择按钮
		staticvar _browbtn = new VMyButton{pos="220,500";Init("表情");};
		//互动表情选择按钮
		staticvar _actionbrowbtn = new VMyButton{pos="240,500";Init("动作");}
		staticvar _hide = new VMyButton{pos="260,500";Init("藏");show = true;}
		staticvar _show = new VMyButton(pos="260,500";Init("显");show = false;)
		//动作表情显示框
		staticvar s_actionBrowText = new VMyText{}
		//私聊对象显示框
		staticvar s_privatePeopleText = new BaseText{}
	}
	//显示部分重载
	void OnActionBugle(data){}
	inclass("ChatSend_UI");
	Init();

	//内容输入框
	staticvar _input = new ChatEdit{};
	
	void SetEvent()
	{
		set _enter
		{
			void OnPressed()
			{
				parent.SendMsg();
			}
		}
		set _browbtn
		{
			void OnPressed()
			{
				parent.OnClick_BtnFace();
			}
			var m_bMouseOver = false;
			void LogicMouseOverFunc()
			{
				m_bMouseOver = true;
			}
			void LogicMouseOutFunc()
			{
				m_bMouseOver = false;
			}
		}
		set _actionbrowbtn
		{
			void OnPressed()
			{
				
				if(window.BTN_STATE_GREY != this.GetState())
				{
					parent.OnClick_BtnActFace();
				}
			}
			var m_bMouseOver = false;
			void LogicMouseOverFunc()
			{
				m_bMouseOver = true;
			}
			void LogicMouseOutFunc()
			{
				m_bMouseOver = false;
			}
		}
		set _hide
		{
			
			void OnPressed()
			{
				window.g_HallBtnMgr.SetHallOpenUIHideState(0);
				parent._selectbrow.show = false;
				parent._selectbrowbk.show = false;
//				_hide.show = false;
//				parent._show.show = true;
				parent.parent.SetframeShow(false);
			}
		}
		set _show
		{
			
			void OnPressed()
			{
				window.g_HallBtnMgr.SetHallOpenUIHideState(0);
				parent._selectbrow.show = false;
				parent._selectbrowbk.show = false;
//				_show.show = false;
//				parent._hide.show = true;
				parent.parent.SetframeShow(true);
			}
		}
	}

	var _prechattime = sysarray(window.CHAT_CHANNEL_MAX);
	var _i=0;
	while(toint(_i)<toint(window.CHAT_CHANNEL_MAX))
	{
		_prechattime[_i] = 0;
		_i += 1;
	}

	void SetMyChatType(data)
	{
		switch (data)
		{
		case 0:
			_type = window.CHAT_COMMON;
			break;
		case 1:
			_type = window.CHAT_WORLD;
			break;
		case 2:
			_type = window.CHAT_PRIVATE;
			break;
		default:
			_type = window.CHAT_BUGLE;
			break;
		}
	}
	//聊天的时间限制变量
	var _canbesend = 1; //1:可以发 0：不可以发
	var _msgcount = 0; //2秒内4条
	var _wait = false;		// 等待n秒
	//重置
	void resetTag()
	{
		_canbesend = 1;
		_msgcount = 0;
	}
	void resetTag2()
	{
		_wait = false;
		_canbesend = 1;
		_msgcount = 0;
	}
	//发送聊天消息
	void SendMsg()
	{
		if(_input.src.TrimLeft(" ") == "")
		{
			_input.src = "";
			return;
		}
		
		/*策划突然又要限制聊天了*/
		if (_msgcount == 0)	 // 初次说话(重新计时)
		{
			killtimer("ResetTag");
			timer(5000,"resetTag","ResetTag");
		}
		if (_canbesend != 1){return;}
		if (_msgcount >= 3)
		{
			//window.WriteChat7(1001);
			_canbesend = 1;	// (看策划安排, 这个变量以后可能需要去掉了)
			_wait = true;
			killtimer("ResetTag");
			killtimer("ResetTag2");
			timer(5000,"resetTag2","ResetTag2");
		}
//		if (!_wait)
//			_msgcount += 1;
		
		if(parent.m_LaBaType == window.CHAT_LABATYPE_BUGLE){BugleChat();}
		if(parent.m_LaBaType == window.CHAT_LABATYPE_ACTBUGLE){SceneBugle();}
		if(parent.m_LaBaType == window.CHAT_LABATYPE_PRIVATE)
		{
			switch(IsPrivateChat())
			{
				case 0:
				{
					window.WriteChat(7,"请输入聊天对象");break;
				}
				case 1:
				{
					PrivateChat();break;
				}
				case 3:
				{
					window.WriteChat7(1002);break;
				}
//				case 5:
//				{
//					window.WriteChat7(2000);break;
//				}
			}
		}
		if(parent.m_LaBaType == window.CHAT_LABATYPE_FAMILY)
		{
			switch (IsPrivateChat())
			{
				case 1:
				{
					PrivateChat();break;
				}
				default:
				{
					FamilyChat();break;
				}
			}
		}
		if(parent.m_LaBaType == window.CHAT_LABATYPE_COMMON)
		{
			switch (IsPrivateChat())
			{
				case 0://普通聊天
				{
					if (_msgcount >= 3)
					{
						window.WriteChat7(1001);
						_msgcount = 0;
						break	 ;
					}
					if (!_wait)
						_msgcount += 1;
					if (_wait)
					{
						window.window.WriteChat(7,"您说话速度太快，请休息一会儿!");
						break ;
					}
					CommonChat();break;
				}
				case 1://私聊
				{
					window.lastPrivateName = _OtherName;
					PrivateChat();break;
				}
//				case 2://小喇叭
//				{
//					BugleChat();break;
//				}
				case 3://不在线提示
				{
					window.WriteChat7(1002);break;
				}
//				case 4://家族
//				{
//					FamilyChat();break;
//				}
//				case 5:
//				{
//					window.WriteChat7(2000);break;
//				}
			}
		}
		//发送结束的处理
		_input.src = "";
		_input._chatFace = "";
		_iCurWord = 0;
		_iCurName = 0;
	}

	//发送消息的子处理
	void SendMsgByTypeAndMsgAndColor(_sendType,_sendmsg)
	{
		//发送前先过滤脏话
		//_sendmsg = window.g_DirtyFilter_Chat.Trans(_sendmsg);
		
		if(_sendType == window.CHAT_COMMON || parent.m_LaBaType == window.CHAT_LABATYPE_COMMON)//是普通聊天才有动作
		{
			window.find("GAMELAYER").find("NAME_GCMap").CallBack_NewChat(_sendmsg);//这里传给韩硕
		}
	
		AddContent(_sendmsg);

		if(_sendType == window.CHAT_WORLD)
		{
			if(window.haveFamilyState())
			{
				if(window.GetFamilyPeopleCanChat() == window.FAMILY_PEOPLE_CANCHAT)
				{
					//参数：JID，内容，我的昵称,类型(家族为6)
					window.find("friendsys").SendMsgType("",_sendmsg,window.GetMyName(),6);
				}
				else
				{
					window.WriteToFamilyChat("您被屏蔽了，无法在家族中发言");
				}
			}
			else
			{
				window.WriteChat(7,"你还没有家族，无法使用家族聊天");
			}
		}
		else
		{
			var _Param = "";
			if(_sendType == window.CHAT_COMMON)
			{
				_Param = ""+_sendType+","+parent.parent.m_ChatPos+",\""+_sendmsg+"\","+window.GetMyName()+",0";
			}
			else
			{
				_Param = ""+_sendType+","+parent.parent.m_ChatPos+",\""+_sendmsg+"\","+window.GetMyName()+","+_OtherName;
			}
			printf("C# SendMsgByTypeAndMsgAndColor:_Param:"+_Param);

			//发出聊天消息：聊天类型，界面位置，聊天内容，自己的昵称，别人的昵称
			window.Too_SendChatMsg(_Param,parent.m_LaBaType,parent.parent.m_ChatPos);
		}
		
	}

	//设置聊天类型
	void SetType(type)
	{
		_type = type;
	}

	//添加表情
	void AddBrow(face)
	{
		_input.src = _input.src+face;
//		setTimer(200,"SetInputFocus");
	}

	void AddInput(content)
	{
		_input.src = _input.src+content;
	}

	void SetPreContentToInput(bPre)
	{
		var shouldsrc = GetPreContent(bPre);
		if(shouldsrc != "")
		{
			_input.src = shouldsrc;
		}
	}
	void SetPreNameToAcceptName()
	{
		var shouldname = GetUserName();
		if(shouldname != "")
		{
			_acceptname.src = shouldname;
		}
	}

	//循环改变类型，1为正循环，-1为负循环
	void CircleType(data)
	{
		var _index = 0;
		var _i=0;
		while(toint(_i)<toint(window._chat_typeidlistnum))
		{
			//alert("0 list_i "+_i+" "+window._chat_typeidlist[_i]);
			if(toint(window._chat_typeidlist[_i]) == toint(_type))
			{
				_index = _i;
			}
			_i += 1;
		}
		_index = (_index+data+window._chat_typeidlistnum)%window._chat_typeidlistnum;
//		SetType(window._chat_typeidlist[_index]);
	}

	SetEvent();

	//Logic-Function========================================================================
	//查询DB昵称是否正确 "/ 正确昵称 " -> [正确昵称]
	void IsNkNameRight()
	{
		if (_input.src.Find("/") == 0 && _input.src.Find(" ") == 1) //以"/ "开头
		{
			var _b = _input.src.Mid(2,_input.src.Count); //取出空格以后的字符串
			if (_b.Find(" ") > 0)
			{
				var _NkName_Temp = _b.Left(_b.Find(" ")); //取玩家昵称
				if (_NkName_Temp == window.GetMyName()){return;}
				//userdt
				window.g_Row.InitByString(window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_NKNAME,_NkName_Temp);
				var _Isready  = window.g_Row.IsReady();
				if (_Isready == 0){window.g_Row.Release();printf("B# 查找私聊对象 数据库失败\n");return;}
				_input.src = "["+window.g_Row.GetData(window.M_G_SERVER_USERDT_NKNAME)+"]";
				window.g_Row.Release();
			}
		}
	}
	//判断是否为私聊
	//返回值：0普通 1私聊 2小喇叭 3不在线提示 5私聊但不在同一服务器
	void IsPrivateChat()
	{
		var _privateTemp = "";
		if(s_privatePeopleText.src != "")
		{
			_privateTemp = s_privatePeopleText.src + _input.src;
		}
		else
		{
			_privateTemp = _input.src;
		}
		
		if (_privateTemp.Find("[") == 0) //以"["开头
		{
			var _b = _privateTemp.Mid(1,_privateTemp.Count); //取出[以后的字符串
			if (_b.Find("]") > 0)
			{
				_input.src = _b.Mid(_b.Find("]")+1,_b.Count); //取出聊天内容
				_OtherName = _b.Left(_b.Find("]")); //取玩家姓名
				if (_OtherName.Count < 4 || _OtherName.Count > 12)
				{
					_input.src = _privateTemp;
					return 0;
				}

				if (window.g_CStrFilter.Filter2(_OtherName) == 0)//判断是否是打印字符
				{
					_input.src = _privateTemp;
					return 0;
				}
				if (window.g_DirtyFilter_Name.IsDirty(_OtherName))
				{
					_input.src = _privateTemp;
					return 0;
				}
				
//				if (_OtherName == "小喇叭")
//				{
//					return 2;
//				}
				//userdt
//				window.g_Row.InitByString(window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_NKNAME,_OtherName);
//				if (!window.g_Row.IsReady())
//				{
//					_input.src = _privateTemp;
//					window.g_Row.Release();
//					if(window.GetFamilyIDByName(""+_OtherName) == window.GetFamilyIDByName())
//					{
//						var _isOnline = window.GetFamilyOnlineState(window.GetFamilyPeopleUIDByName(_OtherName));
//						if(_isOnline == 1)
//						{
//							return 5;
//						}
//					}
//					return 3; //提示不在线
//				}
//				window.g_Row.Release();

				if (_OtherName == window.GetMyName())
				{
					window.WriteChat7(1000);
					return -1; //自己给自己聊天
				}
				if(parent.m_LaBaType == window.CHAT_LABATYPE_PRIVATE)
				{
					window.lastPrivateName = _OtherName;
					OnPrivatePeople(""+window.lastPrivateName);
				}
				return 1; //是私聊
			}
			else
			{
				printf("B# 格式错误：名字后面没有]");
				if(_type == window.CHAT_WORLD){return 4;}//家族聊天
				return 0;//格式错误：名字后面没有]
			}
		}
		if(parent.m_LaBaType == window.CHAT_LABATYPE_COMMON)
		{
			return 0;
		}
		if(_type == window.CHAT_WORLD){return 4;}//家族聊天
		return 0;//格式错误：名字后面没有]
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

	//普通聊天
	void CommonChat()
	{
		_input.src = StrTranslate(_input.src);//
		_input.src = window.g_DirtyFilter_Chat.Trans(_input.src);
		SendMsgByTypeAndMsgAndColor(window.CHAT_COMMON,_input.src);

		var _tempSrc = toNormalHtml(_input.src);
		var _Is_Exit_Face = window.ParseFace(_tempSrc);
		if(_Is_Exit_Face != _tempSrc)
		{
			//使用全部频道并发送表情至少1次
			//参数：用户ID,任务ID,任务描述
			var _Param = ""+window.GetMyUID()+","+window.CLIENT_1_CHAT_ALL_BROW+","+window.CLIENT_1_CHAT_ALL_BROW_STR+",1";
			window.Tos_AddEvent(_Param);
		}
		SetLastWord(_input.src);
	}
	//家族聊天
	void FamilyChat()
	{
		_input.src = StrTranslate(_input.src);//
		_input.src = window.g_DirtyFilter_Chat.Trans(_input.src);
		SendMsgByTypeAndMsgAndColor(window.CHAT_WORLD,_input.src);

		SetLastWord(_input.src);
	}
	//私聊
	void PrivateChat()
	{
		_input.src = StrTranslate(_input.src);//
		_input.src = window.g_DirtyFilter_Chat.Trans(_input.src);
		//判断是否为黑名单 ：0好友,1黑名单,5陌生人
		if (window.find("friendsys").CheckRelation(_OtherName) == toint(window.FRIEND_BLACKLIST))
		{
			window.WriteChat7(1003);
			return;
		}

		SendMsgByTypeAndMsgAndColor(window.CHAT_PRIVATE,_input.src);

		SetLastWord("["+_OtherName+"]"+_input.src);
		SetLastPrivateName(_OtherName);
	}
	//小喇叭
	void BugleChat()
	{
		window.CheckBugleNum();
		if (window.GetItemNumByEnterID(window.BUGLE_ID) <= 0)
		{
			window.find("UIController").LoadDLG(255);	//您没有小喇叭，无法发言。是否马上购买？
			//数量,点券,钱
			var _num = window.GetSubNumByItemID(window.BUGLE_BUY_ID);
			var _moneytype = window.GetPriceNameByType(window.GetPriceTypeByID(window.BUGLE_BUY_ID));
			
			var _DeadORLive = window.CheckPackItemDeadLineByEntryID(window.g_agioEntry_ID);
			var _money = window.GetPriceByIndex(window.BUGLE_BUY_ID);
			if ( _DeadORLive >0)
			{
				_money = toint(_money)*0.8;
			}
			var _vip = window.GetVipTypeByUID(window.GetMyUID());
			if (_vip == window.G_VIPVALUE)
			{
				var _vipagio = window.GetVipBuyAgio(_vip);
				_money = ""+toint(_money) * _vipagio +"(Vip"+_vipagio+"折)";	
			}
			var _param = ""+_num+","+_moneytype+","+toint(_money);
			window.find("VMB_NoEnoughBugle_Logic").ReplaceData(_param);
			return;
		}
		_input.src = StrTranslate(_input.src);//
		_input.src = window.g_DirtyFilter_Chat.Trans(_input.src);
		SendMsgByTypeAndMsgAndColor(window.CHAT_BUGLE,_input.src);

		SetLastWord(_input.src);
	}
	//实景喇叭
	void SceneBugle()
	{
		if (window.GetItemNumByEnterID(window.ACTBUGLE_ID) <= 0)
		{
			window.find("UIController").LoadDLG(256);	//您没有动作喇叭，无法发言。是否马上购买？
			//数量,点券,钱
			var _num = window.GetSubNumByItemID(window.ACTBUGLE_BUY_ID);
			var _moneytype = window.GetPriceNameByType(window.GetPriceTypeByID(window.ACTBUGLE_BUY_ID));
			
			var _DeadORLive = window.CheckPackItemDeadLineByEntryID(window.g_agioEntry_ID);
			var _money = window.GetPriceByIndex(window.ACTBUGLE_BUY_ID);
			if ( _DeadORLive >0)
			{
				_money = toint(_money)*0.8;
			}
			var _vip = window.GetVipTypeByUID(window.GetMyUID());
			if (_vip == window.G_VIPVALUE)
			{
				var _vipagio = window.GetVipBuyAgio(_vip);
				_money = ""+toint(_money) * _vipagio +"(Vip"+_vipagio+"折)";	
			}
			var _param = ""+_num+","+_moneytype+","+toint(_money);
			window.find("VMB_NoEnoughActBugle_Logic").ReplaceData(_param);
			return;
		}
		_input.src = StrTranslate(_input.src);//
		_input.src = window.g_DirtyFilter_Chat.Trans(_input.src);
		var _str = ""+parent.m_actId+","+window.GetRoleStateStr()+";"+_input.src;//
		SendMsgByTypeAndMsgAndColor(window.CHAT_SCENEBUGLE,_str);

		SetLastWord(_input.src);
	}
	void GetLastWord(id)
	{
		if (0<=id && id<m_LastWordArrayNum)
		{
			_input.src = m_LastWordArray[id];
			if(parent.m_LaBaType == window.CHAT_LABATYPE_PRIVATE)
			{
				var _str = _input.src;
				var _pos = _str.Find("]");
				if(_pos>0)
				{
					_input.src = _str.Mid(_pos+1,_str.Count);
				}
			}
			TimerSetHot();
		}
	}
	//保存所说的话
	void SetLastWord(content)
	{
		m_iCurWordNum += 1;
		if (m_iCurWordNum >= m_LastWordArrayNum)
		{
			m_iCurWordNum = m_LastWordArrayNum;
		}
		m_iWordIndex = -1;

		var _i = m_iCurWordNum - 1;
		while (_i > 0)
		{
			m_LastWordArray[_i] = m_LastWordArray[_i-1];
			_i -= 1;
		}
		m_LastWordArray[0] = content;
	}
	//得到上次私聊对象
	void GetLastPrivateName(id)
	{
		var _loop = id;
		while(true)
		{
			var _temp = _LastSpeakTo[_loop];
			printf("xiayy:_temp:"+_temp);
			_loop += 1;
			if(_temp != "")
			{
				_input.src = "["+_temp+"]";
				TimerSetHot();
				break;
			}
			else
			{
				if(_loop >= _LastSpeakToNum)
				{
					_loop = 0;
				}
			}
			if(_loop == id)
			{
				break;
			}
		}
		return _loop;
	}
	//保存上次私聊对象
	void SetLastPrivateName(_Name)
	{
		_LastSpeakTo[4] = _LastSpeakTo[3];
		_LastSpeakTo[3] = _LastSpeakTo[2];
		_LastSpeakTo[2] = _LastSpeakTo[1];
		_LastSpeakTo[1] = _LastSpeakTo[0];
		_LastSpeakTo[0] = _Name;
	}
	var _cursorPos = 0;	//鼠标在Edit的位置
	void OnClick_BtnFace()//点击了表情图标
	{
		_cursorPos = _input.getCursorIndex();
		var _obj = window.find("TOPLAYER").find("VChat_Brow_Logic");
		if(_obj.m_isOpen==1){_obj.del();return;}
		set window.find("TOPLAYER")
		{
			new VChat_Brow_Logic
			{
				m_Type = 0;//类型 0是聊天 1是好友消息
			}
		}
	}
	
	//动作表情
	void OnClick_BtnActFace()
	{
		_cursorPos = _input.getCursorIndex();
		var _obj = window.find("TOPLAYER").find("VChat_Act_Brow_Logic_Name");
		if(_obj.m_isOpen==1){_obj.del();return;}
		set window.find("TOPLAYER")
		{
			new VChat_Act_Brow_Logic{}
			//m_ChooseID
			window.find("VChat_Act_Brow_Logic_Name").find("Brow_DBList_Logic_NAME").ScrollToIndex(toint(window.find("ChatSend_Logic_name").m_Pos));
		}
	}

	//添加表情
	void AddFace(mark)
	{
		_input.setCursorIndex(_cursorPos);
		_input.insertsrc(mark);
		_input._chatFace += mark;
		TimerSetHot();
	}
	//计时设置焦点
	void TimerSetHot(){timer(100,"_input.hot=1");}


	//在鼠标右键上点私聊
	//参数：_nkname 对方的昵称
	void Want_PrivateChat(_nkname)
	{
		printf("聊天左键测试 聊天函数 Want_PrivateChat：_nkName="+_nkname);
		_OtherName = _nkname;
		//_input.src = "["+_nkname+"]";
		//window.charFlag = 1;
		window.lastPrivateName = _nkname;
		parent.s_TypeSelect.WhichSelect(3);//把发送类型设置成私聊
		TimerSetHot();
	}
};
