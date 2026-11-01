importex("$./ClassDef_ChatFrame.gml");
importex("$./ClassDef_ChatSend.gml");
importex("$./../../UI/Chat_New/ClassDef_ChatMgr.gml");
importex("$./ClassDef_LabaFrame.gml");

class ChatMgr_Logic item
{
	size(400,600);halign="0,0";valign="100,-40";

	name = "ChatMgr_Logic";
//	var _autoanswer = 0;
//	var _autoanswerstr = "";

	var m_actId = 0;//记录了 动作喇叭要发送的 动作表情id
	var m_LaBaType = window.CHAT_LABATYPE_COMMON;//0普通、家族等 1小喇叭 2实景喇叭
	var _windownum = 3;
	//锁定标志，0为不锁定，1为锁定
	var _locktag = 0;
	//需要重载
	void InitBG()
	{
		//staticvar s_FrameBK = new item{show = true;}
	}
	//需要重载
	void Init()
	{
//		staticvar s_btn_Loudspeaker = new VMyButton{Init("喇叭");valign(100,-28);halign(100,-45);}
		staticvar s_TypeSelect = new VMyUpMenu_UI
		{
			class MyText MyOption//用于对text的控制 需要时重载
			{
				xcenter = false;
			};
			valign(100,-6);SetWidth(75);
			SetData("小喇叭,实景喇叭,普通聊天,私聊,家族聊天");
		}
		staticvar s_Btn_drag = new VMyButton{halign(100,0);Init("拖");};
	}
	inclass("ChatMgr_UI");

	void OnDragFunc()
	{
		_labaframe._bugle.ResetHeight();//重新排版喇叭
	}
	void SetEvent()
	{
//		//小喇叭
//		set s_btn_Loudspeaker
//		{
//			name = "s_btn_Loudspeaker_Name";
//			//发出更新背包的物品的消息 参数：物品唯一id,背包ID
			var _Param = "-1,500";
			window.Too_UpdateItemList(_Param);
//			
//			var _num = 0;
//			void InitLaba()
//			{
//				_num = window.GetItemNumByEnterID(window.BUGLE_ID);
//				if (_num > 999)
//				{
//					_num = 999;
//				}
//				if(_num<1)
//				{
//					SetState(window.BTN_STATE_GREY);
//				}
//				else
//				{
//					SetState(window.BTN_STATE_LIGHT);
//				}
//				InitText("x"+_num);
//			}
//			
//			void OnCreated()
//			{
//				InitLaba();
//			}
//			void LogicMouseUpL()
//			{
//				if(_num<1){return;}
//				parent._send._input.src = "[小喇叭]";
//			}
//		}

		set s_TypeSelect
		{
			SetDefaultSrc("普通聊天");
			void WhichSelect(_index)
			{
				switch (_index)
				{
					case 0://小喇叭
					{
						parent.m_LaBaType = window.CHAT_LABATYPE_BUGLE;parent._send.OnActionBugle(false);
						parent._send.OnPrivatePeople("");
						break;
					}
					case 1://实景喇叭
					{
						parent.m_LaBaType = window.CHAT_LABATYPE_ACTBUGLE;parent._send.OnActionBugle(true);
						parent._send.OnPrivatePeople("");
						parent.m_actId = 0;//把默认的动作id还原
						break;
					}
					case 2://普通聊天
					{
						parent.m_LaBaType = window.CHAT_LABATYPE_COMMON;parent._send.OnActionBugle(false);
						parent._send.OnPrivatePeople("");
						break;
					}
					case 3://私聊
					{
						parent.m_LaBaType = window.CHAT_LABATYPE_PRIVATE;parent._send.OnActionBugle(false);
						parent._send.OnPrivatePeople(""+window.lastPrivateName);
						SetDefaultSrc("私聊");
						break;
					}
					case 4://家族聊天
					{
						parent.m_LaBaType = window.CHAT_LABATYPE_FAMILY;parent._send.OnActionBugle(false);
						parent._send.OnPrivatePeople("");
						break;
					}
				}
				parent._send._input._chatType = parent.m_LaBaType;
				parent._send.TimerSetHot();
				
			}
		}
	}
	
	InitBG();
	//聊天的显示
	var arrchatshow = sysarray(_windownum);
	var _i=0;
	while(toint(_i)<toint(_windownum))
	{
		var _show0 = new ChatFrame_Scroll_Logic{};
		arrchatshow[_i] = _show0;
		_i+=1;
	}
	SetAllIndex();
	//传音笛专区
	var _labaframe = new LabaFram_Logic{};
	
	//切换聊天窗口的按钮
	var _SelectBtn = new ChatFameSelectBtn_Logic{};
	Init();
	SetEvent();
	//聊天的输入
	var _send = new ChatSend_Logic{};
	

	//获取聊天界面是否隐藏 夏洋洋添加于2009-12-7
	void GetFrameBkState()
	{
		return _IsFrameShow;
	}
	var _IsFrameShow = 1;
	void SetframeShow(data)
	{
		_IsFrameShow = data;
		s_Btn_drag.show = data;
		_ChatFrame.show = data;
		s_FrameBK.show = data;
//		_labaframe.show = data;
		_SelectBtn.show = data;
		if(data==true)
		{
			_send._hide.show=true;
			_send._show.show = false;
			ShowBG();
		}
		else
		{
			_send._hide.show=false;
			_send._show.show = true;
		}
		if(_SelectBtn.s_R_Cur.GetChecked() == true)
		{
			arrchatshow[0].show = data;
		}
		else if(_SelectBtn.s_R_Social.GetChecked() == true)
		{
			arrchatshow[1].show = data;
		}
		else if(_SelectBtn.s_R_Private.GetChecked() == true)
		{
			arrchatshow[2].show = data;
		}
		printf("BTNEX:_hide_ShowState:"+_send._hide._ShowState+",data:"+data);
	}
	//用于外部调用  设置显示隐藏状态
	void SetMyShowState(data)
	{
//		if(data==true)
//		{
//			_send._hide.show=true;
//			_send._show.show = false;
//		}
//		else
//		{
//			_send._hide.show=false;
//			_send._show.show = true;
//		}
		SetframeShow(data);
	}
	//设置选中的 动作表情
	void SetActionBrow(_ActID,_text)
	{
//		alert(""+_ActID+","+_text);
		m_actId = _ActID;
		_send.OnActionBugle(true,_text);
		//_send.s_actionBrowText.SetData(_text);
		_send.TimerSetHot();
	}

	//给所有的chatframe设置索引位置并应用相应的配置
	void SetAllIndex()
	{
		var _i=0;
		while(toint(_i)<toint(_windownum))
		{
			arrchatshow[_i].SetTableSql(_i);
			_i+=1;
		}
	}

	void ChangeChatWindow(index)
	{
		if(toint(index)<0 || toint(index)>=_windownum)
		{
			return;
		}
		var circle=0;
		while(toint(circle)<toint(_windownum))
		{
			arrchatshow[circle].show =false;
			circle += 1;
		}
		//如果是换窗口，将锁定标志重置
		if(!arrchatshow[index].isVisible())
		{
			SetLock(0);
			arrchatshow[index].ScrollToEnd();
		}
		arrchatshow[index].show = true;
		//设置 说活的类型				偷懒 在这里设置一下
		_send.SetMyChatType(index);
	}
	void SetLock(islock)
	{
//		_btn_lock.Init(islock);
		_locktag = islock;
		var circle=0;
		while(toint(circle)<toint(_windownum))
		{
//			arrchatshow[circle].SetDispose(_locktag);
			circle += 1;
		}
	}
//	//物品变化通知的函数
//	void GoodsChange(data)
//	{
//		printf("chat::GoodsChange data "+data+"\n");
//		if(toint(data)==toint(window.ENTRYID_XIAOLABA) || toint(data)==0)
//		{
//			var num = _NumTeller.GetGoodsNun(window.GetMyRoleId() , window.ENTRYID_XIAOLABA);
//			if(toint(num) < 1){s_btn_Loudspeaker.SetState(window.BTN_STATE_GREY);}
//			else{s_btn_Loudspeaker.SetState(window.BTN_STATE_LIGHT);}
//			s_btn_Loudspeaker.InitText("x"+num);
//			//alert(num);
//		}
//	}
//	void SetId(index , id)
//	{
//		if(toint(index)==0)
//		{
//			GoodsChange(window.ENTRYID_XIAOLABA);
//			var _Param = "-1,"+window.ENTRYID_XIAOLABA+",1";
//			window.Too_SyncItemList(_Param);
//		}
//	}
//	//自动回复
//	void AutoAnswer(acceptname)
//	{
//		if(_autoanswerstr == "")
//		{
//			return;
//		}
//
//		if(toint(_autoanswer)==1)
//		{
//			_send.SendMsgByTypeAndMsgAndColor(window.CHAT_CHANNEL_PRIVATE , _autoanswerstr , _send._color , acceptname , 1);
//		}
//	}
};