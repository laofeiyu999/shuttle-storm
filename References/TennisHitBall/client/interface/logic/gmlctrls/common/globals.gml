//全局变量 + 函数
importex("$./Globals_MyData.gml");
importex("$./Globals_Other.gml");
importex("$./Globals_UIMgr.gml");
importex("$./Globals_CheXin.gml");
importex("$./Globals_Pack.gml");
importex("$./Globals_Mall.gml");
importex("$./Globals_Arena.gml");
importex("$./Globals_Mail.gml");
importex("$./Globals_Video_Train.gml");
importex("$./Globals_Room.gml");
importex("$./Globals_Chat.gml");
importex("$./Globals_Task.gml");
importex("$./ClassDef_QualifyLv.gml");
importex("$./Globals_Family.gml");
importex("$./Globals_Game.gml");
importex("$./Globals_EquipState.gml");
importex("$./../../task/ClassDef_TaskEvent.gml");


set window
{
	//是否为新号1为新号===========================================================
	var g_EmptyRole	=	0;

	//全局使用的VNET2DBROW和TABLE===========================================================
	var g_Row		=	new VNet2DBRow{}
	var g_Table		=	new VNet2DBTable{}

	//是否是沉迷状态===========================================================
	var g_FCM		=  0;
	//个人数据类
	var MYDATA = new VMyData{}
	
	//模特数据操作==========================================================
	//模特-男 记住Roledt数据
	//var g_CTAvatar1 = new CTennisAvatar{}
	//模特-女 记住Roledt数据
	//var g_CTAvatar2 = new CTennisAvatar{} 
	//GetAvatarData(RID);	// 保存数据库默认的模型数据
	//SetAvatarData(RID);	// 将默认数据设置到数据表中
	//SetDefaultModel(RID);	// 设置两个默认的模型 1男 2女
	
	//一些全局变量==========================================================
	var g_ChatController = 0;	//0可以激活 1不激活   //是否可以激活聊天框
	var g_IsLookOrReplay = -1;	//录像类型
	var g_IsLoginConnected = 0;	//标志登录服务器是否已经连上，1连上  没连上则换IP再连
	var g_Sex = 2;				//界面主题 1男版 2女版
	var g_Bg = 1;				//桌面背景 
	var g_AntialiasingLevel = 1;	//反锯齿
	var g_JoinRoomID = -1;		//要加入的房间ID
	var g_InviteUID = -1;		//邀请我的UID
	var g_RandRaceID = -1;		//撮合ID
	var g_LookAtRoomID = -1;		//观战的房间ID
	var g_AlreadySaveVideo = false;	//已经开始保存录像了
	var g_Login_IfRemember = 1;	//登陆时是否记住用户名 1记住 0不记住

	//人物模型信息==============================================================
	var g_RoleModel_FamilyNameShowState = true;	//人物模型中家族名称显示状态
	var g_RoleModel_UserNameShowState = true;	//人物模型中玩家昵称显示状态
	var g_RoleModel_LoverNameShowState = true;	//人物模型中玩家情侣昵称显示状态

	//0默认 1(频道->大厅) 2(大厅->房间) 3(房间->游戏）4(大厅->训练中) 5(大厅->录像) 6(活动->游戏)
	var g_LoadingType = window.LOAD_TYPE_DEFAULT;		//Loading的类型 
	//玩家大概位置
	var g_probablyPos = 0;	//1登陆界面 2频道选择界面 3大厅界面 4房间界面 5游戏界面

	var g_TSMouseRName = "";		//排行榜的右键名字
	var g_MouseROnly = false;		//右键菜单唯一
	var g_WagerValue = -1;			//房间的赌注
	var g_FastJionRoomParamWager = "";	//因判断赌注而记得的加入房间参数
	var g_JionRoomType = 0;				//因判断赌注而记得的加入房间类型(1普通 2邀请)
	var g_LoginType = 0;				//登入类型类型(0启动器 1返回)
	var g_HelpID = -1;				//帮助ID(为了唯一而加)
	
	var g_HallIoType = 0;		//Io连接的类型 0默认 1域名连接
	var g_ArenaIoType = 0;		//Arena Io连接的类型 0默认 1域名连接

	//竞技场=====================================================================
	var g_ArenaRoomID = -1;			//竞技场的房间ID
	var g_ArenaJoinRoom = false;	//是否为竞技加入房间
	var g_ArenaWinOrLost = 0;		//比赛的输赢 0为默认 1表示输 2表示赢
	var g_ArenaSlogan = "我就是传说中的高手！";	//胜利口号
	var g_ArenaRaceID = -1;				//成功的报名ID
	var g_ArenaSelectRaceID = 0;		//选中的报名ID
	var g_ArenaSloganName = "";			//报名活动名字(单人为自己昵称,队伍为队伍名)

	var g_JionRoomParamArena = "";	//因判断活动报名而记得的各种进房间参数
	var g_JionRoomParamArenaType = -1;	//因判断活动报名而记得的各种进房间类型
	
	var g_ArenaTeamInviteUID = -1;	//组队活动的邀请者ID
	var g_ArenaTeamRaceID = -1;		//组队活动ID
	
	//全局使用的自己的变量===========================================================
	var g_MyUID = 0;	//我的玩家ID
	var g_MySex = 0;	//我的性别 1男 2女
	var g_MyName = "";	//我的昵称
	var g_MyRID = 0;	//我的角色ID
	var g_GameMapID = 0;	//自己的游戏地图ID
	var g_RoomMapID = 0;	//自己的房间地图ID
	var g_MyState = 0;		//我的状态 0离线 1空闲 2房间 3游戏
	var g_Qualify = 0;		//我的称号 1-7 对应服务器类型
	var g_SvID = -1;		//当前频道ID
	var g_UIGameState = window.USER_UISTATE_NOTINANY;	//玩家进游戏的界面状态
	var g_GlobalsTM = 0;	//服务器当前时间

	var g_UserGetCardNUM = 0; //记录玩家翻牌的总数。

	//[观战和录像]======================================================================================
	var g_CGameVideo = new CGameVideo{}
	var g_GameVedioAutoOver = 5000;	//游戏结束后，自动退出观战的时间
	
	//商城的类型=============================================================
	var g_MallOpenType = -1;			//商城打开的类型 1大厅打开 2房间打开
	var G_MALLOPENTYPE_HALL = 1;		
	var G_MALLOPENTYPE_ROOM = 2;		
	var g_RelationOpenMallType = 0;				//通过关系系统打开商城的类型
	var g_RelationOpenMallType_Default = 0;		//0正常打开(非关系打开)
	var g_RelationOpenMallType_ToBeLover = 1;	//1成为情侣
	var g_RelationOpenMallType_UpLvLover = 2;	//2情侣升级
	var g_RelationOpenMallType_UpLvBuddy = 3;	//3密友升级
	var g_RelationOpenMallType_AddListNum = 4;	//4扩充搭档列表
	var g_RelationOpenMallType_AddLovePoint = 5;	//5提升爱情指数

	//商城的一些变量====点击购买+赠送+索要时记住的变量=======================
	var g_Mall_DLG_Type = 0;			//1:购买 2:赠送 3:索要 4:购物车
	var g_BuyCar_Select = 0;			//1:全部 2:保存1 3:保存2 ...
	var g_BuyCar_Send_Sex = 0;			//赠送选择的性别

	//同步商城时间对象
	var g_MallTool = new ShopToolItem{name = "SHOPTOOLITEM";}

	//频道=============================================================
	var g_GC_WhichCheck = 1;	//标识服务器类型：1新手赛,2资格赛,3巡回赛,4黄金赛,5大师赛,6大满贯 7大奖赛
	var g_ChannelServerID = 0;		//记下服务器ID

	//脏话过滤系列=========================================================================
	//聊天 创建房间 时使用
	var g_DirtyFilter_Chat = new DirtyFilter
	{
		NoCase = true;
		AddKeyFile("$./Chat.txt",2);
	}

	//创建角色取昵称时使用
	var g_DirtyFilter_Name = new DirtyFilter
	{
		NoCase = true;
		AddKeyFile("$./Name.txt",2);
	}
	//判断是否是打印字符
	var g_CStrFilter = new CStrFilter{}
	//函数接口：0不是 1是
	//Filter()	//过滤火星文字符
	//Filter2()	//过滤非打印字符
	//Filter3()	//是否为字母和数字

	//音效与背景音乐=======================================================================
	var g_Sound = "type1";	//音效类型
	var g_Music = "type1";	//音乐类型

	//好友相关操作的提示===========================================================
	var _MsgWhoName = "";	//好友：谁跟我聊天的昵称
	var _MsgWhoJID	= -1;	//好友：谁跟我聊天的JID
	var g_FriendMsgID = "";//记录需要清楚的好友消息序列

	var g_TrainID = -1;		//训练的ID-打开单个训练界面前赋值-删除界面时清空
	var g_TrainType = -1;	//训练的类型：0强制训练 1正常(训练选择) 2(训练中弹出)
	var g_IsForceTrain = false;//是否由强制训练进的训练场景
	
	//光光版的音效播放
	new MusicCtrl{name = "musicctrl";}

	//清数据(ActivityGroup),倒计时
	/*
	清数据的接口
	1:ClearRaceTB()		//M_G_SERVER, ARENARACE
	2:ClearGroupTB()		//M_G_SERVER, ACTIVITYGROUP
	3:ClearTempTeamTB(int _state=1)	//GAMEUI, JIVETPINVITELIST
	4:ClearArenaTopTB(int _state=0)	//M_G_SERVER, ARENADATA
	5:ClearTeamGroupTB(int _state=0)	//GAMEUI, JIVETPGROUP
	6.ClearApplyInfoTB()	//GAMEUI,JIVECONSORTIAAPPLY
	7.ClearGameShowTB()		//M_G_CLINET,GAMESHOW 
	8.ClearPackTB()		//M_G_GOODS,PLAYERITEMS
	9.ClearMailTB()		//M_G_GOODS,ITEMPRESENT
	10.ClearUserDtTB()	//M_G_SERVER,USERDT
	11.ClearGameServerTB()//GAMEUI,GAMESERVER
	*/
	var g_CArenaFunction = new CArenaFunction{name = "CArenaFunction_name";}

	//频道选择-io======================================================================
	var HALLIP = "";		//"socket:://127.0.0.1:2008";
	var ROOMIP = "";		//"socket:://127.0.0.1:2008";
	var ROOMUDPIP = "";
//	var GameSvrIPAddr = SvrIPAddr;
	var GameUPort = 0;
	
	//背包====================================================================
	var g_Pack_SellItem = "";	//要删除的物品参数
	var g_CurrSelectRackeGID = 0;	//当前选中的球拍
	//技能镶嵌====================================================================
	var g_SkillEnterID = 0;	//当前选中的技能EnterID
	var g_SkillGID = 0;		//当前选中的技能的GID（即背包ID）
	var g_SkillLastEnterID = 0;		//当前替换的技能的GID（即背包ID）

	var g_TigerOrBox = 0;				//是宝箱还是老虎鸡
	
	/*邮件*/
	var g_MailReadGIDStr = "";	//邮件的已读字符串组 eg:"1000,1002"

	//分辨率变化的位置偏差比例
	var g_UIOffSetRate = 1;

	//训练频道 1新手赛,2资格赛,3巡回赛,4黄金赛,5大师赛,6大满贯
	var g_TrainChannel = 1;	
	
	//普通任务最大数量
	var g_NormalTaskNum = 25;

	//悬停位置标识
	var g_HangType = window.ICON_DEFAUIT;	//悬停类型 0默认(热销+训练) 1背包 2礼品盒 3商城
	
	//新加的房间鼠标悬停的提示是否能出的标记
	var g_RoomHangInfoYesOrNo = true;

	//全局唯一监测自己的数据-UserDt===============================================================
	var g_MyUserDBRow = new VNet2DBRow
	{
		void InitDB()
		{
			InitByInt(window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_UID,window.GetMyUID());
			AddDBEvent("OnMyDataChange",0,6,7,57,58,59,67,68,104,130);
			window.find("VQualifyLv_Logic_NAME_Item").m_LastLv = window.GetLVByUID();
		}
		//索引，
		//uid				0UID,
		//gamestate			6当前游戏状态 0断线 1空闲中 2房间内 3游戏中
		//did				7所在桌子ID
		//totalMoney		57游戏币(金币)
		//totalticket		58点券
		//TokenMoney		59代金券
		//CuLevel			67当前等级
		//CuExp				68当前经验
		//ReceiveQualify	104 获得的称号 1.新手 2.资格赛 3巡回 4黄金 5大师
		//TRoleType			130 网球的角色类型id
		void OnMyDataChange(index,uid,gamestate,did,totalMoney,totalticket,TokenMoney,CuLevel,CuExp,ReceiveQualify,TRoleType)
		{
			
			if (window.g_DEBUG)
			{
				printf("B# xmpp1:g_MyUserDBRow::index:"+index+",uid:"+uid+",gamestate:"+gamestate+",did:"+did
					+",totalMoney:"+totalMoney+",totalticket:"+totalticket+",TokenMoney:"+TokenMoney
					+",CuLevel:"+CuLevel+",CuExp:"+CuExp+",ReceiveQualify:"+ReceiveQualify+",TRoleType:"+TRoleType);
			}
			switch (index)
			{
				case 6:
				{
					//向所有人发送自己的详细描述信息
					window.find("friendsys").SendUserInfo();
					break;
				}
				case 7:
				{
					window.MYDATA.SetDeskID(did);
					//向所有人发送自己的详细描述信息
					window.find("friendsys").SendUserInfo();
					break;
				}
				case 57:
				{
					window.find("ROLEMODEL_LOGIC")._VModelMgr_Logic.s_Money.s_Gold.SetData(totalMoney);
					if (toint(totalMoney) <= 0)
					{
						window.WriteChat7(1013);	//您没有金币了，可以通过训练或普通比赛获得金币！
					}
					break;
				}
				case 58:				
				{
					window.find("ROLEMODEL_LOGIC")._VModelMgr_Logic.s_Money.s_Ticket.SetData(totalticket);
					if (toint(totalticket) <= 0)
					{
						window.WriteChat7(1022);	//您没有点券了！
					}
					break;
				}
				case 59:
				{
					window.find("ROLEMODEL_LOGIC")._VModelMgr_Logic.s_Money.s_Token.SetData(TokenMoney);
					if (toint(TokenMoney) <= 0)
					{
						window.WriteChat7(1014);	//您没有代金券了！
					}
					break;
				}
				case 67:
					if (window.IsHallHtnOpened(window.G_HALLBTN_TRAIN))
					{
						window.find("TRAIN_LOGIC")._VTrain_Logic.SelectCourseByCertificate();
					}
					if (window.GetSelfInfoOpenState())
					{
						window.find("SELFINFO_LOGIC").UpDateSeleInfoData_Me();
					}
					window.find("ROLEMODEL_LOGIC")._VModelMgr_Logic.s_Info.s_Lv.SetData(CuLevel);
					window.find("ROLEMODEL_LOGIC")._VModelMgr_Logic.SetAttValueOnLvChg();
					window.find("VQualifyLv_Logic_NAME_Item").Init();
					window.find("VQualifyLv_Logic_NAME_Item").ShowAtt(CuLevel);
					window.find("VQualifyLv_Logic_NAME_Item").s_LvUp.showLvUp(CuLevel);
					window.find("VQualifyLv_Logic_NAME_Item").DelAllShow();
					window.find("VQualifyLv_Logic_NAME_Item").m_LastLv = window.GetLVByUID();
					window.LMH_Levelup_Mission();
					window.timer(500,"TaskFresh");
					break;
				case 68:
					if (window.GetSelfInfoOpenState())
					{
						window.find("SELFINFO_LOGIC").UpDateSeleInfoData_Me();
					}
					break;
				case 104:
					if (window.GetSelfInfoOpenState())
					{
						window.find("SELFINFO_LOGIC").UpDateSeleInfoData_Me();
					}
					window.find("ROLEMODEL_LOGIC")._VModelMgr_Logic.s_Info.s_Qualify.SetData(ReceiveQualify);
					window.find("VQualifyLv_Logic_NAME_Item").s_Qualify.SetData(ReceiveQualify);
					window.find("VQualifyLv_Logic_NAME_Item").DelAllShow();
					break;
				case 130:
					window.find("ROLEMODEL_LOGIC")._VModelMgr_Logic.s_Info.s_Technic.SetData(TRoleType);
					break;
			}
		}
	}
	//得到排行榜数据的类
	var _OrderDataGetter = new OrderDataGetter
	{
		void SetPage(id, curpage, maxpage, same, type)
		{
			window.find("order_VTopStar_Family_Logic").SetPage(id, curpage, maxpage, same, type);
			window.find("order_VTopStar_Favor_Logic").SetPage(id, curpage, maxpage, same, type);
			window.find("order_VTopStar_Self_All_Logic").SetPage(id, curpage, maxpage, same, type));
			window.find("order_VTopStar_GoldenLMatch_Logic").SetPage(id, curpage, maxpage, same, type));
			window.find("order_VTopStar_Lover_Logic").SetPage(id, curpage, maxpage, same, type));
		}
		void OnDelete()
		{
			Close();
		}
		new VNet2DBTable
		{
			SetSaveDBRow();
			Init(window.TOPSTAR,window.TS_A_ALLBOUT);//总排行-总场次
		}
		new VNet2DBTable
		{
			SetSaveDBRow();
			Init(window.TOPSTAR,window.TS_A_WINNUM);//总排行-胜利场次
		}
		new VNet2DBTable
		{
			SetSaveDBRow();
			Init(window.TOPSTAR,window.TS_A_ALLSCORE);//总排行-总得分
		}
		new VNet2DBTable
		{
			SetSaveDBRow();
			Init(window.TOPSTAR,window.TS_A_ACE);//总排行-一击得分总数
		}
		new VNet2DBTable
		{
			SetSaveDBRow();
			Init(window.TOPSTAR,window.TS_A_SKILLNUM);//总排行-技能总数
		}
		new VNet2DBTable
		{
			SetSaveDBRow();
			Init(window.TOPSTAR,window.TS_A_FULLSTORE);//总排行-满蓄力次数
		}
		new VNet2DBTable
		{
			SetSaveDBRow();
			Init(window.GAMEUI,window.JIVEFLOWER);//总排行-人气榜
		}
		new VNet2DBTable
		{
			SetSaveDBRow();
			Init(window.GAMEUI,window.JIVECONSORTIAINISYN);//总排行-家族榜
		}
		new VNet2DBTable
		{
			SetSaveDNRow();
			Init(window.TOPSTAR,window.TS_A_GOLDNUM);
		}
		new VNet2DBTable
		{
			SetSaveDNRow();
			Init(window.TOPSTAR,window.TS_A_LOVER);	//情侣-爱情指数
		}
		//new VNet2DBTable
		//{
			//SetSaveDNRow();
			//Init(window.TOPSTAR,window.TS_A_PARTNER);	//搭档
		//}
	};

	//对即将到期物品或已到期物品的检查
	var g_MyItemsCheck = new item
	{
		var _DeadItemRecord = "";	//对所有已接提示过的物品进行记录

		var _VNet2DBTable = new VNet2DBTable
		{
			Init(window.M_G_GOODS,window.PLAYERITEMS);
			var _VNet2DBRow = new VNet2DBRow{}
			var _deadItem = "";
			var _deadItemId = "";
			var _deadItemGID = "";

			void CheckData(_itemGID,_itemId,_deadline)
			{
				var _deadlineTime = window.g_MallTool.GetDeadLine(_deadline);//alert("_itemId="+_itemId+",deadtime="+_deadlineTime);
				if(_deadlineTime<window.g_MyItemTellDead && _deadlineTime>0)
				{
					//排除一些不需要续费的物品 2010年9月9日 yxf 
					if ( window.IsDebarContinueItems( toint(_itemId) ) )
						return;

					var _itemName = "";
					_VNet2DBRow.InitByInt(window.M_G_GOODS,window.ITEMS,window.M_G_GOODS_ITEMS_ENTRY,_itemId);
					if(_VNet2DBRow.IsReady())
					{
						_itemName = _VNet2DBRow.GetData(window.M_G_GOODS_ITEMS_NAME);
						var _findState = parent._DeadItemRecord.Find(_itemGID);
						printf("C# 物品到期-快了1:_DeadItemRecord:"+parent._DeadItemRecord+",_deadItem:"+_deadItem+",_itemName:"+_itemName+",_findState:"+toint(_findState));
						if(toint(_findState) == -1)
						{
							if(_deadItem == "")
							{
								_deadItem += _itemName;
								_deadItemId += _itemId;
								_deadItemGID += _itemGID;
							}
							else
							{
								_deadItem += ","+_itemName;
								_deadItemId += "," +_itemId;
								_deadItemGID += "," + _itemGID;
							}
							//parent._DeadItemRecord += _deadItem;
						}
						
					}
					_VNet2DBRow.Release();
				}
			}

		};

		void StartCheck()
		{
			
			CheckItemDeadLine();
//			ReadData("CheckData",""+window.M_G_GOODS_PLAYERITEMS_CID+","+window.M_G_GOODS_PLAYERITEMS_DEADLINE);
		}

		void StartCheckCharge()
		{
			CheckChargeItemDeadLine();
		}
		void CheckItemDeadLine()
		{
			if(window.g_ItemOverdue <1)
			return ;
			var _sql = "SELECT * FROM "+window.PLAYERITEMS+" WHERE "+window.M_G_GOODS_PLAYERITEMS_OWNERID_STR+"="+window.GetMyUID()
				+" AND "+window.M_G_GOODS_PLAYERITEMS_DEADLINE_STR+">0"
				+" AND "+window.M_G_GOODS_PLAYERITEMS_STATE_STR+"=1 AND "+window.M_G_GOODS_PLAYERITEMS_PACKID_STR+"<"+window.GOODS_CLASS_DeadProps;
			_VNet2DBTable.Select(window.M_G_GOODS,_sql);
			printf("C# 到期:g_MyItemsCheck：_sql："+_sql+",count:"+_VNet2DBTable.GetSize());
			_VNet2DBTable._deadItem = "";
			_VNet2DBTable._deadItemId = "";
			_VNet2DBTable._deadItemGID = "";
			killtimer("CheckItemDeadLineTimer");
			var _pos = window.GetUIPos();
//			if(_pos != window.POS_BUYCAR && _pos != window.POS_REQUEST && _pos != window.POS_PROPCONTINUE)
//			{
				if(window.g_probablyPos == window.POS_PROBABLY_HALL || window.g_probablyPos == window.POS_PROBABLY_ROOM)
				{
					var _count = _VNet2DBTable.GetSize();
					if(_count != 0)
					{
						_VNet2DBTable.ReadData("CheckData",""+window.M_G_GOODS_PLAYERITEMS_GID+","+window.M_G_GOODS_PLAYERITEMS_CID+","+window.M_G_GOODS_PLAYERITEMS_DEADLINE);
						var _deadItems = _VNet2DBTable._deadItem;
						var _deadItemIds = _VNet2DBTable._deadItemGID;
						var _cid = _VNet2DBTable._deadItemId;
						printf("C# 物品到期-快了2:"+_deadItems+",已接提示过的物品_DeadItemRecord："+_DeadItemRecord+",快到期或到期的物品ID:"+_deadItemIds);
						if(_deadItems != "")
						{
//							if(_DeadItemRecord == "")
//							{
//								_DeadItemRecord += _deadItemIds;
//							}
//							else
//							{
//								_DeadItemRecord += "," + _deadItemIds;
//							}
//							if (window.g_PopWindTimes == 0)
//							{

//							staticvar _VNet2DBTable2 = new VNet2DBTable
//							{
//								var m_deadItemIds = "";
//								var m_items = "";
//								void getDeadItems(itemsIds,items)
//								{
//									if (m_deadItemIds=="" && m_items=="")
//									{
//										m_deadItemIds =""+itemsIds;
//										m_items = ""+items;
//									}else
//									{
//										m_deadItemIds = m_deadItemIds+","+itemsIds;
//										m_items = m_items+","+items;
//									}
//								}
//							};
//							var sql2 = "SELECT * FROM "+window.CHARGECARSELECT+" WHERE "+window.GAMEUI_CHARGECARSELECT_STATE_STR+"=1 AND "+window.GAMEUI_CHARGECARSELECT_TYPE_STR+"=0";
//							_VNet2DBTable2.Select( window.GAMEUI,sql2);
//							if(_VNet2DBTable2.GetSize() != 0)
//							{
//								_VNet2DBTable2.ReadData("getDeadItems",""+window.GAMEUI_CHARGECARSELECT_CID,GAMEUI_CHARGECARSELECT_NAME);
//								var mm_itemids = _VNet2DBTable2.m_deadItemIds;
//								var mm_items = _VNet2DBTable2.m_items;
////								window.find("UIController").LoadDLG(691);
////								window.g_ItemOverdue -=1;
////								window.find("VMB_PropContinue_Logic").SetItemIds(mm_itemids,mm_items,1,0);							
////								var _content = window.findGClassbyCID(0);//alert("cont="+_content);
////								window.find("VMB_PropContinue_Logic").ReplaceData(_content);
//								_deadItemIds =  _deadItemIds+","+mm_itemids;
//								_deadItems = _deadItems+","+mm_items;
//
//							}
							window.find("UIController").LoadDLG(691);
							window.g_ItemOverdue -=1;
							window.find("VMB_PropContinue_Logic").SetItemIds(_deadItemIds,_deadItems,1,0);							
							var _content = window.findGClassbyCID(_cid);//alert("cont="+_content);
							window.find("VMB_PropContinue_Logic").ReplaceData(_content);
							_VNet2DBTable2.del();
//							}							
						}
						//else
						//{
							//staticvar _VNet2DBTable2 = new VNet2DBTable
							//{
								//var m_deadItemIds = "";
								//var m_items = "";
								//void getDeadItems(itemsIds,items)
								//{
									//if (m_deadItemIds=="" && m_items=="")
									//{
										//m_deadItemIds =""+itemsIds;
										//m_items = ""+items;
									//}else
									//{
										//m_deadItemIds = m_deadItemIds+","+itemsIds;
										//m_items = m_items+","+items;
									//}
								//}
							//};
							//var sql2 = "SELECT * FROM "+window.CHARGECARSELECT+" WHERE "+window.GAMEUI_CHARGECARSELECT_STATE_STR+"=1 AND "+window.GAMEUI_CHARGECARSELECT_TYPE_STR+"=0";
							//_VNet2DBTable2.Select( window.GAMEUI,sql2);
							//if(_VNet2DBTable2.GetSize() != 0)
							//{
								//_VNet2DBTable2.ReadData("getDeadItems",""+window.GAMEUI_CHARGECARSELECT_CID,GAMEUI_CHARGECARSELECT_NAME);
								//var mm_itemids = _VNet2DBTable2.m_deadItemIds;
								//var mm_items = _VNet2DBTable2.m_items;
								//window.find("UIController").LoadDLG(691);
////								window.g_ItemOverdue -=1;
								//window.find("VMB_PropContinue_Logic").SetItemIds(mm_itemids,mm_items,1,0);							
								//var _content = window.findGClassbyCID(0);//alert("cont="+_content);
								//window.find("VMB_PropContinue_Logic").ReplaceData(_content);
							//}
							//_VNet2DBTable2.del();
						//}
					}
					//else
					//{
						//var _sql2 = "SELECT * FROM "+window.PLAYERITEMS+" WHERE "+window.M_G_GOODS_PLAYERITEMS_OWNERID_STR+"="+window.GetMyUID()
						//+" AND "+window.M_G_GOODS_PLAYERITEMS_DEADLINE_STR+">0"
						//+" AND "+window.M_G_GOODS_PLAYERITEMS_STATE_STR+"=1 ";
						//_VNet2DBTable.Select(window.M_G_GOODS,_sql2);
						//var _count2 = _VNet2DBTable.GetSize();
						//if (_count2 == 0)
						//{
							//staticvar _VNet2DBTable2 = new VNet2DBTable
							//{
								//var m_deadItemIds = "";
								//var m_items = "";
								//void getDeadItems(itemsIds,items)
								//{
									//if (m_deadItemIds=="" && m_items=="")
									//{
										//m_deadItemIds =""+itemsIds;
										//m_items = ""+items;
									//}else
									//{
										//m_deadItemIds = m_deadItemIds+","+itemsIds;
										//m_items = m_items+","+items;
									//}
								//}
							//};
							//var sql2 = "SELECT * FROM "+window.CHARGECARSELECT+" WHERE "+window.GAMEUI_CHARGECARSELECT_STATE_STR+"=1 AND "+window.GAMEUI_CHARGECARSELECT_TYPE_STR+"=0";
							//_VNet2DBTable2.Select( window.GAMEUI,sql2);
							//if(_VNet2DBTable2.GetSize() != 0)
							//{
								//_VNet2DBTable2.ReadData("getDeadItems",""+window.GAMEUI_CHARGECARSELECT_CID+","+window.GAMEUI_CHARGECARSELECT_NAME);
								//var mm_itemids = _VNet2DBTable2.m_deadItemIds;
								//var mm_items = _VNet2DBTable2.m_items;
								//window.find("UIController").LoadDLG(691);
	////								window.g_ItemOverdue -=1;
								//window.find("VMB_PropContinue_Logic").SetItemIds(mm_itemids,mm_items,1,0);							
								//var _content = window.findGClassbyCID(0);//alert("cont="+_content);
								//window.find("VMB_PropContinue_Logic").ReplaceData(_content);
							//}
						//}
						
						//_VNet2DBTable2.del();
					//}
				}
//			}
//			else
//			{
////alert("66666666666666666");
//				staticvar _VNet2DBTable2 = new VNet2DBTable
//				{
//					var m_deadItemIds = "";
//					var m_items = "";
//					void getDeadItems(itemsIds,items)
//					{
//						if (m_deadItemIds=="" && m_items=="")
//						{
//							m_deadItemIds =""+itemsIds;
//							m_items = ""+items;
//						}else
//						{
//							m_deadItemIds = m_deadItemIds+","+itemsIds;
//							m_items = m_items+","+items;
//						}
//					}
//				};
//				var sql2 = "SELECT * FROM "+window.CHARGECARSELECT+" WHERE "+window.GAMEUI_CHARGECARSELECT_STATE_STR+"=1 AND "+window.GAMEUI_CHARGECARSELECT_TYPE_STR+"=0";
//				_VNet2DBTable2.Select( window.GAMEUI,sql2);
//				if(_VNet2DBTable2.GetSize() != 0)
//				{
//					_VNet2DBTable2.ReadData("getDeadItems",""+window.GAMEUI_CHARGECARSELECT_CID+","+window.GAMEUI_CHARGECARSELECT_NAME);
//					var mm_itemids = _VNet2DBTable2.m_deadItemIds;
//					var mm_items = _VNet2DBTable2.m_items;
//					window.find("UIController").LoadDLG(691);
//	//								window.g_ItemOverdue -=1;
//					window.find("VMB_PropContinue_Logic").SetItemIds(mm_itemids,mm_items,1,0);							
//					var _content = window.findGClassbyCID(0);//alert("cont="+_content);
//					window.find("VMB_PropContinue_Logic").ReplaceData(_content);
//				}
//				_VNet2DBTable2.del();
//			}
		}

		// 点击续费按钮时调用
		// chenjihui 2011-1-7
		void CheckChargeItemDeadLine()
		{
//			if(window.g_SelectCahrgeGoodsCont>1 && window.g_IsEmpty==1)
//				return ;
			var _sql = "SELECT * FROM "+window.PLAYERITEMS+" WHERE "+window.M_G_GOODS_PLAYERITEMS_OWNERID_STR+"="+window.GetMyUID()
				+" AND "+window.M_G_GOODS_PLAYERITEMS_DEADLINE_STR+">0"
				+" AND "+window.M_G_GOODS_PLAYERITEMS_STATE_STR+"=1";
			_VNet2DBTable.Select(window.M_G_GOODS,_sql);//alert("sql="+_sql);
			printf("C# 到期:g_MyItemsCheck：_sql："+_sql+",count:"+_VNet2DBTable.GetSize());
			_VNet2DBTable._deadItem = "";
			_VNet2DBTable._deadItemId = "";
			_VNet2DBTable._deadItemGID = "";
			window.g_IsEmpty = 1;
			killtimer("CheckChargeItemDeadLine");
			var _pos = window.GetUIPos();
//			if(_pos != window.POS_PROPCONTINUE && _pos != window.POS_REQUEST && _pos != window.POS_PROPCONTINUE)
//			{
				if(window.g_probablyPos == window.POS_PROBABLY_HALL || window.g_probablyPos == window.POS_PROBABLY_ROOM)
				{
					var _count = _VNet2DBTable.GetSize();
//alert("coutt="+_count);
					if(_count != 0)
					{
//alert("deadcharge0000000000");
						_VNet2DBTable.ReadData("CheckData",""+window.M_G_GOODS_PLAYERITEMS_GID+","+window.M_G_GOODS_PLAYERITEMS_CID+","+window.M_G_GOODS_PLAYERITEMS_DEADLINE);
						var _deadItems = _VNet2DBTable._deadItem;
						var _deadItemIds = _VNet2DBTable._deadItemGID;
						var _cid = _VNet2DBTable._deadItemId;
						printf("C# 物品到期-快了2:"+_deadItems+",已接提示过的物品_DeadItemRecord："+_DeadItemRecord+",快到期或到期的物品ID:"+_deadItemIds);
						if(_deadItems != "")
						{
//alert("deadcharge111111111");
							window.ToChargeCarRecord(_deadItemIds,_deadItems,1,0);
							window.g_IsEmpty = 0;
						}
					}
					if (window.g_DeadItemsIDs != "")
					{
						var deadItemIds = window.g_DeadItemsIDs;
						window.ToChargeCarRecord(0,0,1,deadItemIds);
						window.g_IsEmpty = 0;
						window.g_DeadItemsIDs = "";
					}
					else
					{
						staticvar _VNet2DBTable2 = new VNet2DBTable{};
						var sql2 = "SELECT * FROM "+window.CHARGECARSELECT+" WHERE "+window.GAMEUI_CHARGECARSELECT_STATE_STR+"=1 AND "+window.GAMEUI_CHARGECARSELECT_TYPE_STR+"=0";
						_VNet2DBTable2.Select( window.GAMEUI,sql2);
						if(_VNet2DBTable2.GetSize() != 0)
							window.g_IsEmpty = 0;
						else
							window.g_IsEmpty = 1;
						_VNet2DBTable2.del();
					}
				}
//			}
		}
		void AddDeadItems(_data)
		{
			if(_DeadItemRecord == "")
			{
				_DeadItemRecord += _data;
			}
			else
			{
				_DeadItemRecord += "," + _data;
			}
		}

		void ClearDeadItems(_data)
		{
			printf("C# ClearDeadItems:before:_data:"+_data+"，_DeadItemRecord:"+_DeadItemRecord);
			_DeadItemRecord = _DeadItemRecord.Replace(","+_data,"");
			if(_DeadItemRecord == ",")
			{
				_DeadItemRecord = "";
			}
			printf("C# ClearDeadItems:after:_DeadItemRecord:"+_DeadItemRecord);
		}
	}

	//快捷聊天
	new VNet2DBTable
	{
		SetSaveDNRow();
		Init(window.GAMEUI,window.SHOTCUTCHATCONTENT);
	}

	//情侣
	new VNet2DBTable
	{
		SetSaveDNRow();
		Init(window.M_G_SERVER,window.RELATION);	//搭档
	}

	//登陆到频道时快捷聊天设置启动
	void BeginShotcutChatSet()
	{
		set window
		{
			staticvar g_CShotcutChat = new CShotcutChat{name = "CShotcutChat";}
		}
	}
	
	//购买物品的折扣
	var g_ItemAgio = 100;
	//幸运卡折扣,0为没有装备，大于0为折扣
	var g_LuckyCardAgio = 0;

	//收到有新邮件或赠送的消息邮件GID
	var g_NewMailGiftGID_ForTask = 0;	//为孙小东的任务做的

	//点击加入家族按钮
	var g_SetFamily = 0;

	//情侣查询结果
	var g_LoverSearchResult = 0;
	//排行榜情侣模型是否打开
	var POS_PROBABLY_TSLovMod = 0; 
	//保存分辨率供引导使用
	var CurDisplaySet = 0;
	//记录房间中查找玩家界面是否打开/0为关闭1为打开
	var RemFindUser = 0;
	//愚人盒物品ID
	var g_Fool_GoodID = 0;
	//临时提示信息
	var g_Message = "";
	//add by chenjihui
	var g_cardtype = 0;	//改名卡类型
	var g_nkName = ""; //名称
	var g_changingTime = 24;//改名中的倒计时时间：秒
	var g_sendMsgTime = 4000//改名向服务器发消息时间间隔：毫秒
	var g_roomenu = 0;//房间中右键单击人人物菜单状态
	//背包过期物品打开商城相关变量
	var g_PackToMall = 0;		//从背包打开商城 0不是  1是
	var g_GoodsPriceType = 0;		//物品价格类型 1:精品   2:休闲
	var g_DeadGoodId = -1;		//要续费的过期物品ID
	var g_DeadGoodsNum = 0;		//过期物品在商城里的编号
	var g_MainLabel = -1;		//主标签页
}