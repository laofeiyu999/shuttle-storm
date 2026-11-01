//
//消息管理器（好友消息+礼品+索要）
//yxf 2009年10月13日
importex("$./../../UI/Hall/ClassDef_MsgMgr.gml");

class VHall_MsgMgr_Logic CMsgMgr
{
	size = "150,50";pos(400,0);capturemouse = true;
	bgcolor = "#FF0000";alpha = 50;
	var m_ID_Gift		= 1;	//礼品的ID
	var m_ID_Request	= 2;	//索要的ID
	var m_ID_Msg		= 3;	//消息的ID
	//=========================与界面交互===========================
	void Init()
	{
		//礼品标识
		staticvar s_IMG_Gift = new VMyText_R
		{
			pos = "0,0";src = "礼品";
		}
		//索要
		staticvar s_IMG_Request = new VMyText_R
		{
			pos = "50,0";src = "索要";
		}
		//消息
		staticvar s_IMG_Msg = new VMyText_R
		{
			pos = "1000,0";src = "消息";
		}
	}
	inclass("VHall_MsgMgr_UI");//界面显示类
	//==============================function=========================================
	//设置响应事件
	void SetEvent()
	{
		set s_IMG_Gift//礼品标识
		{
			//Fun-消息管理器注册
			parent.RegMsg(parent.m_ID_Gift);

			show = false;
			name = "Hall_Show_Present";
			//显示与不显示
			void ShowFlare(param)
			{
				//show = param;
				var _myPos = window.GetProbablyPos();//printf("xiayy:ShowFlare:param:"+param+",_myPos:"+_myPos);
				if (param)
				{
					if (window.IsHallHtnOpened(window.G_HALLBTN_MAIL))
					{
						window.find("MAIL_LOGIC")._VMail_Logic.UpDataMail();
						return;
					}
					else
					{
						
						if(_myPos == window.POS_PROBABLY_HALL)
						{
							window.find("BtnName_Hall_Bottom_Mail").SetFlicker(true);
						}
						if(_myPos == window.POS_PROBABLY_ROOM)
						{
							window.find("BtnName_ROOM_Bottom_Mail").SetFlicker(true);
						}
						//Fun-消息管理器
						//parent.SetState(parent.m_ID_Gift,true);
					}
					window.PlaySound(146);//收到玩家邮件 或 系统邮件
				}
				else
				{
					if(_myPos == window.POS_PROBABLY_HALL)
					{
						window.find("BtnName_Hall_Bottom_Mail").SetFlicker(false);
					}
					if(_myPos == window.POS_PROBABLY_ROOM)
					{
						window.find("BtnName_ROOM_Bottom_Mail").SetFlicker(false);
					}
					//Fun-消息管理器
					//parent.SetState(parent.m_ID_Gift,false);
					//show = false;
				}
			}
			
//			void OnClick()
//			{
//				window.ClearPresentFlareData();
//
//				//发出得到接受赠送物品的列表消息:参数不清楚是什么（这里是NULL）
//				window.Too_GetNewPresent("");
//
//				if (window.IsHallHtnOpened(window.G_HALLBTN_MAIL))
//				{
//					window.find("MAIL_LOGIC")._VMail_Logic.UpDataMail();
//					return;
//				}
//				window.OnClick_BTN_Mail();
//			}

			//用来给礼物的数据库添加一个引用数据,以避免数据消失
			var _VNet2DBTable=new VNet2DBTable{};
			var _SQL = "SELECT * FROM ItemPresent WHERE UserId="+window.GetMyUID()+" AND Number>0 AND State=0";
			//var _SQL = "SELECT * FROM ItemPresent WHERE UserId="+window.GetMyUID()+" AND Number>0 AND State=0 OR UserId="+window.GetMyUID()+"AND Number>0 AND State=1";
			_VNet2DBTable.Select(window.M_G_GOODS,_SQL);

			//发出得到接受赠送物品的列表消息:参数不清楚是什么（这里是NULL）
			window.Too_GetNewPresent("");
		}
		set s_IMG_Request//索要
		{	
			//Fun-消息管理器注册
			parent.RegMsg(parent.m_ID_Request);

			show = false;
			name = "Hall_Show_Request";
			void OnClick()
			{
				VNETLOG(1131,"用户点击了 索要图标图片\n");
				printf("D# [动画图标]CRequestReport-OnClick()");
				window.Too_GetShopTime();	//add by chenjihui 2011-3-16
				show = false;
				//Fun-消息管理器
				parent.SetState(parent.m_ID_Request,false,"");

				//发出需要看消息的通知
				parent._requestreport.GetRequestMsg();
			}
			//你有新的消息
			//参数 param ：1新消息
			void NewMsgCome(param)
			{
				printf("D# [动画图标]CRequestReport-NewMsgCome:param:"+param);
				if (toint(param) == 1)
				{
					window.PlaySound(136);//收到玩家邮件 或 系统邮件
					parent.SetState(parent.m_ID_Request,true,"");
					return;
				}
			}
		}
		set s_IMG_Msg//消息标识
		{
			//Fun-消息管理器注册
			parent.RegMsg(parent.m_ID_Msg);

			name = "Hall_Show_Msg";
			show = false;
			void OnClick()
			{
				VNETLOG(1131,"用户点击了 小喇叭图片\n");
				printf("D# [动画图标]CFriendChatReport-OnClick()");
				
				ShowOver();

				//发出需要看消息的通知
				parent._friendchatreport.GetMsg();

				window.LMH1_OnClickFriendMsg();//引导事件
			}
			//你有新的消息
			//参数 param ：1新消息
			void NewMsgCome(param,JId)
			{
				printf("D# [动画图标]CFriendChatReport-NewMsgCome:param:"+param+",JId:"+JId);
				if (toint(param) == 1)
				{
					window.LMH1_OnReceiveFriendMsg();//引导事件
					window.PlaySound(136);//收到玩家邮件 或 系统邮件
					parent.SetState(parent.m_ID_Msg,true,JId);
					return;
				}
			}

			//显示完了
			void ShowOver()
			{
				show = false;
				//Fun-消息管理器
				parent.SetState(parent.m_ID_Msg,false,"");
			}
		}
	}
	
	Init();
	SetEvent();

	//[功能]排队显示
	//[参数]id:成员ID
	void ShowMsgByQueue(id)
	{
		printf("D# [动画图标]CFriendChatReport-CMsgMgr:ShowMsgByQueue:"+id);
		switch (id)
		{
			case 1:s_IMG_Gift.show = true;break;
			case 2:s_IMG_Request.show = true;break;
			case 3:s_IMG_Msg.show = true;break;
		}
	}

	var _friendchatreport = new CFriendChatReport //好友聊天消息监测
	{
		SetUID(window.GetMyUID()); //设置UID
		//有消息则打开界面并筛选
		void LoadRelationChat(NAME,SQL,JID)
		{
			window.find("UIController").LoadUI("UI_SENDMSG");
			window.find("SENDMSG_LOGIC")._SendMsg_Logic.UpAcceptName(NAME,SQL,JID);
		}

		var _VNet2DBTable = new VNet2DBTable
		{
			void OnAddData(id,content,senderName,reciveUID,JId)
			{
				printf("D# [动画图标]CFriendChatReport-OnAddData:id:"+id+",JId:"+JId+",window._MsgWhoJID:"+window._MsgWhoJID);
				if( toint(JId) != toint(window._MsgWhoJID) )
				{
					parent.parent.s_IMG_Msg.NewMsgCome(1,JId);
				}
			}
		}
		var SQL="SELECT * FROM MsgChatReceive WHERE reciveUID="+window.GetMyUID()+" ORDER BY id DESC";
		_VNet2DBTable.Select(window.GAMEUI,SQL);
		_VNet2DBTable.ReadData("OnAddData","0,1,2,3,4");
		//alert(SQL);
	}
	var _requestreport = new CRequestReport //好友索要消息监测
	{
		SetUID(window.GetMyUID()); //设置UID
		//有消息则打开界面并筛选
		void LoadRequestMsg(id)
		{
			window.find("UIController").LoadUI("UI_MALL_REQUEST_MSG");
			window.find("MALL_REQUEST_MSG_LOGIC")._Msg.NewMsgSelect(id);
		}
	}
	
	void OnCreated()
	{
	}

	void GetTB_MsgRequestNew_Size()
	{
		var _size = 0;
		var _VNet2DBTable=new VNet2DBTable{};
		var _SQL = "SELECT * FROM "+window.MSGREQUESTNEW+" WHERE reciveUID="+window.GetMyUID();
		_VNet2DBTable.Select(window.GAMEUI,_SQL);
		_size = _VNet2DBTable.GetSize();
		_VNet2DBTable.del();
		return _size;
	}
};
