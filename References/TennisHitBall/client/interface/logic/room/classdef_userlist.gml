//
//房间界面-玩家列表DB List类定义
//

importex("$./../../UI/Room/ClassDef_UserList.gml");

//一行显示类：P2Pping值+头像+昵称+状态(非房主：准备与否)+房主标识(房主：钥匙,非房主:踢)+个人信息(按钮)
class VColumn_RoomUser_Logic item
{
	size = "400,30";
	var m_UID = 0;//玩家ID
	var m_RID = 0;//RoleID
	var m_Name = "";//昵称
	var m_State = 0;//准备状态
	var m_RoleModelInfoState = 0;	//人物模型信息生成状态 0为未生成，1为生成
	//===========================与显示交互======================
	void Init()
	{
		//队伍标识
		//参数 data1 :1红 2蓝
		staticvar s_Team = new VMyText{}

		//P2Pping值
		//参数 data1 :
		staticvar s_Ping = new VMyText{pos = "10,0";}

		//家族徽章
		staticvar s_FamilyIcon = new item{}

		//昵称
		//参数 data1:
		staticvar s_NkName = new VMyText{pos = "150,0";}

		//状态
		//状态(房主：啥也没有。非房主：准备与否)
		//参数 data1:0未知 1等待 2准备
		staticvar s_State = new VMyText{pos = "250,0";}

		//房主标识
		//房主标识：(房主：钥匙,非房主:踢)
		//参数 data1：0不是 1是
		staticvar s_Sign = new item
		{
			pos = "280,0";size = "70,30";
			//房主：钥匙
			var _Img_Key = new VMyText{src = "Y";show = false;}
			//非房主：踢按钮
			var _Btn_Kick = new VMyButton{pos = "20,0";Init("踢");size = "40,30";show = false;}
		}

		//个人信息:按钮
		//参数：暂无
		staticvar s_Btn_Info = new VMyButton
		{
			Init("小人");pos = "350,0";size = "50,30";
		}

		//加为好友
		staticvar s_Btn_AddFriend = new VMyButton
		{
		}

		//私聊
		staticvar s_Btn_PrivateChat = new VMyButton
		{
		}

		//赠花
		staticvar s_Btn_PresentFlower = new VMyButton
		{
		}

		//动作
		staticvar s_Btn_Action = new VMyButton
		{
		}

		//性别
		//参数：1男 2女
		staticvar s_Sex = new VMyText
		{
			pos = "350,0";size = "50,30";
		}

		//等级
		//参数：
		staticvar s_Lv = new VMyText{}

		//技术类型
		//参数：
		staticvar s_Technic = new VMyText
		{
		}
	}
	inclass("VColumn_RoomUser_UI"); //界面显示类
	Init();
	//===============================function==============================

	//获取家族徽章信息
	void SendGetInfoMsg()
	{
		window.F_Family_GetOtherPlayerFamilyName(m_UID);
	}
	//点击了踢
	void OnClick_Kick()
	{
		//发出踢人消息踢人:自己的ID,对方用户id
		var _Param = ""+window.GetMyUID()+","+m_UID;
		window.Too_KickSBOut(_Param);
	}
	//点击了查看信息
	void OnClick_LookInfo()
	{
		//设置要查看的个人信息数据-打开个人信息界面前必须调用
		//参数：UID,昵称，RoleID
		window.SetSelfInfoData(m_UID,m_Name,m_RID);
	}
	//点击了加为好友
	void OnClick_AddFriend()
	{
		//参数：UID,昵称
		window.AddFriend(m_Name);
	}
	//点击了私聊
	void OnClick_PrivateChat()
	{
		//参数：UID,昵称
		window.OnClick_PrivateChat(m_Name);
	}
	//点击了赠花
	void OnClick_PresentFlower()
	{
		//参数：UID,昵称
		window.GamePresentFlower(m_Name);
	}
	//点击了动作
	void OnClick_Action()
	{
		//创建表情动作列表
		set window.find("TOPLAYER")
		{
			new VChat_Act_Brow_Logic
			{
				SetPos(window.mousex+10,window.mousey-100);
			}
			//m_ChooseID 暂时用途不明
			window.find("VChat_Act_Brow_Logic_Name").find("Brow_DBList_Logic_NAME").ScrollToIndex(toint(window.find("ChatSend_Logic_name").m_Pos));
		}	
	}
	//设置响应事件
	void SetEvent()
	{
		set s_Btn_Info//个人信息:按钮
		{
			SetHangID(56);
			void OnPressed(){parent.OnClick_LookInfo();}
		}
		set s_Btn_AddFriend//加为好友：按钮
		{
			SetHangID(52);
			void OnPressed(){parent.OnClick_AddFriend();}
		}
		set s_Btn_PrivateChat//私聊：按钮
		{
			SetHangID(53);
			void OnPressed(){parent.OnClick_PrivateChat();}
		}
		set s_Btn_PresentFlower//赠花：按钮
		{
			SetHangID(54);
			void OnPressed(){parent.OnClick_PresentFlower();}
		}
		set s_Btn_Action//动作：按钮
		{
			SetHangID(55);
			void OnPressed(){parent.OnClick_Action();}
		}

		set s_Sign._Btn_Kick//踢按钮
		{
			void OnPressed(){parent.parent.OnClick_Kick();}
		}
		set s_NkName//鼠标右键
		{
			void OnMouseDownR()
			{
				parent.parent.checkselect(10,parent.parent.mousey);
				set window.find("TOPLAYER")
				{
					new VMyMouseR_RoomUser
					{
						var _RoleRow = window.find("VRoom_UserList_Logic_NAME").curselectrow();
						var _UserID = window.find("VRoom_UserList_Logic_NAME").fieldstr(_RoleRow,window.M_G_SERVER_USERDT_UID); //玩家ID
						var _NkName = window.find("VRoom_UserList_Logic_NAME").fieldstr(_RoleRow,window.M_G_SERVER_USERDT_NKNAME); //玩家昵称
						var _RoleID = window.find("VRoom_UserList_Logic_NAME").fieldstr(_RoleRow,window.M_G_SERVER_USERDT_RID); //玩家角色ID

						if (_UserID == window.GetMyUID())//对自己的操作
						{
							SetState(m_Index_Private,0);
							SetState(m_Index_AddFriend,0);
							SetState(m_Index_AddBlacklist,0);
							SetState(m_Index_PresentFlower,0);
							SetState(m_Index_AskaddFamily,0);
						}
						var _relation = window.find("friendsys").CheckRelation(_NkName);//alert(_relation);
				        if (toint(_relation) == window.FRIEND_BLACKLIST)      //如果是在黑名单里的玩家献花为灰色，zyy
				        {
							SetState(m_Index_Private,0);
					        SetState(m_Index_AddBlacklist,0);
					        SetState(m_Index_PresentFlower,0);
					        SetState(m_Index_AskaddFamily,0);
				        }

						//点击了私聊
						void On_Private(data)
						{
							window.OnClick_PrivateChat(_NkName);
						}
						//点击了查看信息
						void On_LookInfo(data)
						{
							//设置要查看的个人信息数据-打开个人信息界面前必须调用
							//参数：UID,昵称，RoleID
							window.SetSelfInfoData(_UserID,_NkName,_RoleID);
						}

						//点击了加为好友
						void On_AddFriend(data)
						{
							window.AddFriend(_NkName);
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
				}//set
			}//mouseR
		}
	}
	SetEvent();
	//需要被显示的类覆盖
	void OnMySelect(){bgcolor = "#FFEA99";alpha = 50;}	//选择的效果
	void OnMyUnSelect(){bgcolor = "-1";}				//不选择的效果
	//======================================================================
	//更新房主标识+4个功能选项
	void UpDateByMaster()
	{
		//
		s_Sign._Img_Key.show = false;
		s_Sign._Btn_Kick.show = false;	//不显示踢
		s_State.show = false;

		if (window.GetMyUID() == parent.parent.m_Masterid) //我是房主
		{
			if (m_UID == window.GetMyUID())//这条记录是自己的
			{
				s_Sign._Img_Key.show = true;	//只显示钥匙

//				//只显示动作，屏蔽加为好友、私聊、赠花
//				s_Btn_AddFriend.show = false;
//				s_Btn_PrivateChat.show = false;
//				s_Btn_PresentFlower.show = false;
//				s_Btn_Action.show=true;
				

			}
			else
			{
				s_Sign._Img_Key.show = false;	//不显示显示钥匙
				s_Sign._Btn_Kick.show = true;	//显示踢 并且亮
				s_State.show = true;
				s_State.SetData(m_State);

//				//不显示动作，显示加为好友、私聊、赠花
//				s_Btn_AddFriend.show = true;
//				s_Btn_PrivateChat.show = true;
//				s_Btn_PresentFlower.show = true;
//				s_Btn_Action.show=false;
			}
		}
		else //我不是房主
		{
			if (m_UID == parent.parent.m_Masterid)//这条记录是房主的
			{
				s_Sign._Img_Key.show = true;	//只显示钥匙

//				//不显示动作，显示加为好友、私聊、赠花
//				s_Btn_AddFriend.show = true;
//				s_Btn_PrivateChat.show = true;
//				s_Btn_PresentFlower.show = true;
//				s_Btn_Action.show=false;
				
			}
			else //这条记录不是房主的
			{
				s_Sign._Img_Key.show = false;	//不显示显示钥匙
				s_State.show = true;
				s_State.SetData(m_State);

//				//只显示动作，屏蔽加为好友、私聊、赠花
//				s_Btn_AddFriend.show = false;
//				s_Btn_PrivateChat.show = false;
//				s_Btn_PresentFlower.show = false;
//				s_Btn_Action.show=true;

			}
		}
		
		//4个功能选项
		if(m_UID == window.GetMyUID())
		{
			//只显示动作，屏蔽加为好友、私聊、赠花
			s_Btn_AddFriend.show = false;
			s_Btn_PrivateChat.show = false;
			s_Btn_PresentFlower.show = false;
			s_Btn_Action.show=true;
		}
		else
		{
			//不显示动作，显示加为好友、私聊、赠花
			s_Btn_AddFriend.show = true;
			s_Btn_PrivateChat.show = true;
			s_Btn_PresentFlower.show = true;
			s_Btn_Action.show=false;
		}
	}
	//手动刷新网速
	var _VNet2DBRow = new VNet2DBRow{}
	void UpDataPing()
	{
		if(!window.IsUIPos(window.POS_ROOM)){return;}//不在房间界面
		if (m_UID == 0)
		{
			if (window.g_DEBUG)
			{
				//printf("B# error-UpDataPing:m_UID:"+m_UID);
			}
			return;
		}
		_VNet2DBRow.InitByInt(window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_UID,m_UID);
		if (!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.Release();
			if (window.g_DEBUG)
			{
				printf("B# error-UpDataPing:DBname:"+window.M_G_SERVER+",TBName:"+window.USERDT+",UID:"+m_UID);
			}
			return;
		}
		var _ping = _VNet2DBRow.GetData(window.M_G_SERVER_USERDT_P2PPING);//P2P ping
		_VNet2DBRow.Release();
		s_Ping.SetData(_ping,"","");
	}
	//计时器
	void TimerGetPing()
	{
		UpDataPing();
		killtimer("TimerGetPing_Name");
		timer(3000,"TimerGetPing","TimerGetPing_Name");
	}
	void OnSelect(){OnMySelect();};
	void OnUnSelect(){OnMyUnSelect();};
	void OnDataExchange(iRow,szData)
	{
		m_UID = szData;
		if (m_UID == window.GetMyUID())
		{
			s_Ping.show = false;
		}
		var _team = parent.fieldstr(iRow,window.M_G_SERVER_USERDT_TEAM);	//队伍 1红 2蓝
		m_Name = parent.fieldstr(iRow,window.M_G_SERVER_USERDT_NKNAME);	//昵称
		m_RID = parent.fieldstr(iRow,window.M_G_SERVER_USERDT_RID);	//RoleID
		m_State = parent.fieldstr(iRow,window.M_G_SERVER_USERDT_READY);	//准备状态
		var _Sex = parent.fieldstr(iRow,window.M_G_SERVER_USERDT_SEX);	//性别 1男 2女
		var _Vip = parent.fieldstr(iRow,window.M_G_SERVER_USERDT_VIPVALUE);
		s_Team.SetData(_team,"","");
		s_NkName.SetData(m_Name,_Vip);
		s_Sex.SetData(_Sex);
		UpDateByMaster();

		var _lv = parent.fieldstr(iRow,window.M_G_SERVER_USERDT_CULEVEL);
		var _technic = parent.fieldstr(iRow,window.M_G_SERVER_USERDT_TROLETYPE);
		s_Lv.SetData(_lv);
		s_Technic.SetData(_technic);

		

		if(m_RoleModelInfoState == 0)
		{
//			window.g_Room_userNum += 1;
//			window.g_Room_tempUserName = m_Name;

			SetUserListName(m_UID);
//			set window.find("GAMELAYER")
//			{
//				window.find("VRoleModel_Info_Logic_Name_"+window.g_Room_userNum).del();
//				new VRoleModel_Info_Logic
//				{
//					SetName(window.g_Room_userNum);
//					SetUserName(window.g_Room_tempUserName);
//				}
//			}
			m_RoleModelInfoState = 1;
		}
		
	}

	void SetUserListName(_index)
	{
		name = "VColumn_RoomUser_Logic_Name_"+_index;
	}

	void SetFamilyIcom(_data)
	{
		var _familyBadgeData = _data;
		if(_familyBadgeData == "")
		{
			s_FamilyIcon.SetData(false);
			return;
		}
		var _parserBadgeData = window.parserBadgeData(_familyBadgeData);
		var _arrBadgeData = window.Splitstr2(_parserBadgeData,",",6);
		s_FamilyIcon.SetData(true,_arrBadgeData[0],_arrBadgeData[1],_arrBadgeData[2],_arrBadgeData[3],_arrBadgeData[4],_arrBadgeData[5]);
	}

	void OnCreated()
	{
		TimerGetPing();
	}
};

//
//总的类：List
//
class VRoom_UserList_Logic VN2ListCtrl
{
	//需要显示时改变
	size="400,300";//valign(60,0);halign(50,0);
	//
	selecttype="1";colfilter="0";//simpleshowmode="1,4";
	bgcolor = "#FF";alpha = 50;

	inclass("VRoom_UserList_UI"); //界面显示类

	columclass="0,VColumn_RoomUser_Logic"; //ID
};