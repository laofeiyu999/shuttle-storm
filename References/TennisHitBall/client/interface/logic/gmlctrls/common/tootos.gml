//
//与服务器交互-按模块分（登录，频道，大厅，商城，房间）
//yxf	2008年10月27日
//

set window
{
	/*登录*/
	//发出登录请求-点击登录按钮后调用
	void Too_Login(_Param)
	{
		window.find("LOGIN_SOCKET").ReadyLoginToServer(_Param);

		//发出登录请求:"用户名,密码",机器的MAC,版本号
		//window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_LOGIN,"nf_sdpt_login", _Param);
	}

	//修改密码
	void Too_modify_password(_Param)
	{
		window.find("LOGIN_SOCKET").ReadyChangePassword(_Param);
		
		//参数:登陆用户名,登陆密码,修改后的密码
		//window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_LOGIN,"nf_modify_password", _Param);
	}


	/*频道选择*/
	//用户信息验证-频道选择io连接上后调用
	void Too_Verify(_Param)
	{
		//发出用户信息验证:"玩家ID，身份"
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_GAMECENTER,"nf_verify_user",_Param);
	}

	//发出取服务器信息消息-选择一个频道后调用
	void Too_GetServerInfo(_Param)
	{
		window.LoadInfoBoard(22,1,"");	//正在连接游戏服务器……

		//发出取服务器信息消息：服务器ID,玩家等级
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_GAMECENTER, "nf_get_info",_Param);
	}

	/*大厅*/
	//创建房间-创建房间点确定后调用
	void Too_CreateRoom(_Param)
	{
		// (!window.P2PReady()) return;

		//[功能]判断是否要提示取消报名
		if (0) //                                                       
		{
			printf("B# JudgeIsNeedCancelQueue-Too_CreateRoom():"+_Param);
			window.g_JionRoomParamArena = _Param;
			return;
		}
		window.Too_CreateRoom_Ex(_Param);
	}
	//创建房间-取消活动后调用
	void Too_CreateRoom_Ex(_Param)
	{
		// 段晓彤修改
		timer(20000,"CloseCreateRoom","CreateRoom");
		window.LoadInfoBoard(22,1,"");	//正在连接游戏服务器……

		//发出创建房间消息：用户id 房间id(-1) 房间名称 房间密码 游戏类型 游戏地图ID 局数(1,3,5) 是否允许观战,赌注,货币类型
		window.find("HALLGCMap")._HallIO.too("_CreateRoom",_Param);                                      
	}
	void CloseCreateRoom()
	{
		killtimer("CreateRoom");
		if (window.g_probablyPos == 3)
			window.find("TOPLAYER").delallchild();
	}

	//加入房间是否需要密码-社交（前往房间）/双击房间列表
	//参数 _Param:房间ID
	void Too_NeedPassword(RoomID)
	{
		if (!window.P2PReady()) return;

		window.g_JoinRoomID = RoomID;
		//加入房间是否需要密码:用户id,房间id
		var _Param = ""+window.GetMyUID()+ ","+RoomID;

		//[功能]判断是否要提示取消报名
		if (window.JudgeIsNeedCancelQueue(window.CANCELRACE_JOINROOMNEEDPW))
		{
			printf("B# JudgeIsNeedCancelQueue-Too_NeedPassword():"+_Param);
			window.g_JionRoomParamArena = _Param;
			return;
		}

		window.Too_NeedPassword_Ex(_Param);
	}
	//加入房间是否需要密码-取消活动后调用
	//参数 _Param:房间ID
	void Too_NeedPassword_Ex(_Param)
	{
		// 段晓彤修改
		timer(20000,"CloseJoinRoom","JoinRoom");
		window.LoadInfoBoard(22,1,"");	//正在连接游戏服务器……

		//加入房间是否需要密码:用户id,房间id
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_HALL,"_IsNeedPassword", _Param);
	}
	void CloseJoinRoom()
	{
		killtimer("JoinRoom");
		if (window.g_probablyPos == 3)
		{
			window.find("TOPLAYER").delallchild();
		}
	}

	//快速加入房间
	//_Param:加入房间参数
	//roomID:加入类型 -1普通快速 其他输入密码后加入(验证赌注)
	void Too_FastJoinRoom(_Param,roomID)
	{
		if (!window.P2PReady()) return;

		window.g_JoinRoomID = roomID;

		//[功能]判断是否要提示取消报名
		if (window.JudgeIsNeedCancelQueue(window.CANCELRACE_FASTJOINROOM))
		{
			printf("B# JudgeIsNeedCancelQueue-Too_FastJoinRoom():"+_Param);
			window.g_JionRoomParamArena = _Param;
			return;
		}

		window.Too_FastJoinRoom_Ex(_Param,roomID);
	}

	//快速加入房间-取消活动后调用
	//_Param:加入房间参数
	void Too_FastJoinRoom_Ex(_Param,roomID)
	{
		if (roomID > 0)
		{
			window.g_FastJionRoomParamWager = _Param;
			window.g_JionRoomType = 1;//加入房间类型(1普通 2邀请)
			window.JudgeMoneyByRoomID(roomID);
			return;
		}

		//发出快速加入消息：用户id 房间id 游戏类型 房间密码
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_HALL,"_JoinRoom", _Param);
	}

	//获得用户的房间号
	void Too_GetUserDid(_Param)
	{
		//发出获得用户的房间号消息：用户id
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_HALL,"_GetUserDid", _Param);
	}

	//观战加入房间
	void Too_JoinLookerOn(_Param)
	{
		//参数：玩家iD,房间ID
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_HALL,"_JoinLookerOn",_Param);
	}

	//观战退出房间
	void Too_ExitLookerOn(_Param)
	{
		//参数：玩家iD,房间ID
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_HALL,"_ExitLookerOn",_Param);
	}

	//明星榜-发消息：界面调用
	//参数 index：排名方式 1-6
	//参数 num：长度-要几条记录（小于0表示所有数据）
	void Too_GetSortData(index,num)
	{
		var _VerID = window.find("HALL_LOGIC").m_TopStar.GetVerID(index);
		var _Param = ""+window.GetMyUID()+","+index+","+_VerID+","+num;
		printf("B# 明星榜:_Param:"+_Param);
		//得到排行榜的数据：自己的UID，类型(1-6) 版本号 长度(小于0表示所有数据)
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_HALL,"_GetSortData", _Param);
	}

	//通过ID取玩家信息
	void Too_GetUserInfoByID(_Param)
	{
		//发出取玩家信息消息：玩家ID
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_HALL,"GetUserInfoByID",_Param);
	}

	//通过昵称取玩家信息
	void Too_GetUserInfoByNkName(_Param)
	{
		//发出取玩家信息消息：玩家昵称
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_HALL,"GetUserInfoByNkName",_Param);
	}

	//正常退出大厅
	void Too_Out(_Param)
	{
		//参数：用户ID
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_HALL,"_Out",_Param);
	}

	/*商城*/
	//发出打开商城的消息：点击商城按钮时调用
	void Too_IsMallOpen()
	{
		//发出商城是否打开的消息：NULL
		window.find("UIController").UserRequest( window.GAMEUI,window.REQUEST_SHOP,"IsValidShop","");
	}

	//获得商城时间
	void Too_GetShopTime()
	{
		//发出获得商城时间的消息：NULL
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_SHOP,"GetShopTime","");
	}

	//发出得到接受赠送物品的列表消息-马晨用的-收到礼品后
	void Too_GetNewPresent(_Param)
	{
		//发出得到接受赠送物品的列表消息:参数不清楚是什么
		window.find("UIController").UserRequest( window.GAMEUI,window.REQUEST_SHOP,"UpdatePresentList",_Param);
	}

	//设置赠送物品记录状态
	void Too_SetPresentState(param)
	{

		//发出设置赠送物品记录状态的消息：赠送物品记录id,状态(可不传,默认为已查收)(1:已读 2:删除)
		window.find("UIController").UserRequest( window.GAMEUI,window.REQUEST_SHOP,"SetPresentState",param);
	}

	//接受赠送物品
	void Too_GetPresentItem(_Param)
	{
		//发出接受赠送物品的消息：赠送id
		window.find("UIController").UserRequest( window.GAMEUI,window.REQUEST_SHOP,"GetPresentItem",_Param);
	}

	//发出创建角色消息-点击确定创建角色后调用
	void Too_CreateRole(_Param)
	{
		//发出创建角色消息
		//参数："昵称","性别"，"角色类型","1头发(UI);2五官(UI);3上装(UI);4裙/裤(UI);6袜(UI);7鞋(UI);"
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_SHOP,"RucruitRole",_Param);
	}

	//邀请某人加入房间-房间的邀请
	void Too_IRequestToRoom(_UserID)
	{
		if (toint(_UserID) <= 0)
		{
			window.find("UIController").LoadDLG(152);//无效的被邀请者！
			return;
		}
		var _Param = ""+_UserID+","+window.GetMyRoomID();

		//var _Param = ""+_UserID+","+window.GetMyUID();
		//发出邀请某人加入房间消息:对方用户id,自己的ID
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_SHOP,"_IRequestToRoom", _Param);
		window.find("VInvite_All_List_Logic_NAME").scriptprcallsub("OnUnSelect");
		window.find("VInvite_Friend_List_Logic_NAME").scriptprcallsub("OnUnSelect");
	}

	//同意别人的邀请加入房间
	//_RoomID:加入类型 -1不验证 其他验证赌注
	void Too_InviteJoinRoom(_param,_RoomID,_UID)
	{
		if (!window.P2PReady()) return;

		window.g_JoinRoomID = _RoomID;
		window.g_InviteUID = _UID;
		//[功能]判断是否要提示取消报名
		if (window.JudgeIsNeedCancelQueue(window.CANCELRACE_INVITEJOINROOM))
		{
			printf("B# JudgeIsNeedCancelQueue-Too_InviteJoinRoom():"+_param);
			window.g_JionRoomParamArena = _param;
			return;
		}

		window.Too_InviteJoinRoom_Ex(_param,_RoomID,_UID);
	}

	//同意别人的邀请加入房间 - 取消活动后调用
	//_RoomID:加入类型 -1不验证 其他验证赌注
	void Too_InviteJoinRoom_Ex(_param,_RoomID,_UID)
	{
		if (_RoomID > 0)
		{
			//判断押注金额够不够
			window.g_FastJionRoomParamWager = _param;
			window.g_JionRoomType = 2;//加入房间类型(1普通 2邀请)
			window.JudgeMoneyByRoomID(_RoomID,_UID);
			return;
		}

		if (_UID > 0)
		{
			var _param2 = ""+window.GetMyName()+ ","+_UID+",1";
			//回复邀请:"被邀请者昵称",邀请者ID,类型(0拒绝 1同意 2超时 3不在空闲中 4钱不够)
			window.Too_IRefuseToRoom(_param2);
		}

		//邀请加入房间绿色通道:用户id,房间id,游戏类型 邀请者ID
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_HALL,"_InviteJoinRoom", _param);
	}

	//拒绝别人的邀请加入房间
	void Too_IRefuseToRoom(_param)
	{
		//回复邀请:"被邀请者昵称",邀请者ID,类型(0拒绝 1同意 2超时 3不在空闲中 4钱不够)
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_SHOP,"_IRefuseToRoom", _param);
	}

	//发出购买的消息-点击购买后
	void Too_BuyItem(_Param)
	{
		/*
			参数
			int	iEntryId	// 购买物品id
			int	iNum		// 购买数量
			int	iLimitDayField	// 限制时间	(item表内定义,单位:天,参数:-1,为默认时间)
			int64	iGoods		// 物品唯一id -1可选
			int	iBuyUseEntryId	// 打折卡id 可选
			int	iToUserId	// 接受人id	可选
			int	iToUserSex	// 接受人性别	可选
			char*	szToUserName	// 接受人名称	可选
			char*	szTitle		// 赠送标题	可选
			char*	szToMsg		// 赠送信息	可选
		*/

		//发出购买的消息
		//新新参数：iEntryId,iNum,iLimitDayField,iToUserId,iToUserSex,szToUserName,szTitle,szToMsg
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_SHOP,"BuyItem",_Param);
	}

	//赠送物品-商城购买时赠送
	void Too_GiftItem(_Param)
	{
		window.Too_BuyItem(_Param);
	}

	// 加入到购物车
	void Too_AddShopCar(_Param)
	{
		/*
		参数
			int	iToUserId	// 接受人id	
			int	iToUserSex	// 接受人性别	
			char*	szToUserName	// 接受人名称	
			char*	szToMsg		// 赠送信息	
			int	iEntryId	// 购买物品id
			int	iNum		// 购买数量
			int	iLimitDayField	// 限制时间	(item表内定义,单位:天,参数:-1,为默认时间)
		*/

		//发出加入到购物车消息
		//新新参数：iToUserId,iToUserSex,szToUserName,szToMsg,iEntryId,iNum,iLimitDayField
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_SHOP,"AddShopCar",_Param);
	}

	//发出卖出物品消息-目前做删除物品用
	void Too_SellItem(_Param)
	{
		//发出卖出物品的消息
		//参数：物品唯一id(-1)，物品识别id,数量
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_SHOP,"SellItem",_Param);
	}

	//赠送物品(邮件)
	void Too_PresentItem(_Param)
	{
		/*
		参数
			int	iToUserId	接受人id	
			int	iToUserSex	接受人性别	
			char*	pszToUserName	接受人昵称
			char*	pszTitle	标题(暂无用)
			char *	pszToMsg	留言
			int	iGoodsId	附加物品唯一id			(填入背包内物品)
			int	iEntryId	附加物品识别
			int	iGoodsNum	附加物品数量			(暂时无效)	
		注释
			pszToMsg与(iGoodsId,iEntryId,iGoodsNum)中必须添其中之一
		*/

		//发出邮寄消息
		//新新参数：iToUserId,iToUserSex,pszToUserName,pszTitle,pszToMsg,iGoodsId,iEntryId,iGoodsNum
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_SHOP,"PresentItem",_Param);
	}

	//发送邮件
	void Too_Mail(_Param)
	{
		window.Too_PresentItem(_Param);
	}

	//装备物品-背包双击物品时调用
	void Too_EquipGoods(_Param)
	{
		//发出装备物品的消息
		//参数：物品唯一id(-1)，物品识别id,装备位置(-1),角色唯一id
		if(window.GetStateByUID() == 2)
		{
			window.find("NAME_GCMap").find("self").parent.tos("EquipGoods",_Param);
		}
		else
		{
			window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_SHOP,"EquipGoods",_Param);
		}
	}

	//解压礼包
	void Too_UnPackItem(_Param)
	{
		//发出装备物品的消息
		//参数： 礼包唯一id
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_SHOP,"UnPackItem",_Param);
	}

	//取玩家的详细信息
	void Too_GetUserInfo(_Param)
	{
		//发出取玩家信息的消息 参数：玩家ID
		window.find("UIController").UserRequest(window.GAMEUI, window.REQUEST_SHOP,"GetUserInfo",_Param);
	}

	//取得玩家装备的物品
	void Too_GetRoleEquipGoods(_Param)
	{
		//发出取玩家信息的消息 参数：玩家ID,角色ID
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_SHOP,"GetRoleEquipGoods",_Param);
	}

	//更新背包的物品
	void Too_UpdateItemList(_Param)
	{
		//发出更新背包的物品的消息 参数：物品唯一id,背包ID
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_SHOP,"UpdateItemList",_Param);
	}

	//打开宝箱(老虎鸡)
	void Too_OpenBox(_Param)
	{
		//参数：宝箱唯一id,宝箱id
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_SHOP,"OpenBox",_Param);
	}

	//镶嵌物品
	void Too_InlayItem(_Param)
	{
		//发出镶嵌物品的消息 参数：被镶嵌物品唯一id,镶嵌物品唯一id(可叠加物品-1)，镶嵌物品识别id,镶嵌位置(-1为默认位置)
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_SHOP,"InlayItem",_Param);
	}

	//加压礼品包
	void Too_UnPackItem(_Param)
	{
		//发出加压礼品包的消息 参数：物品唯一id
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_SHOP,"UnPackItem",_Param);
		return;
	}

	//领取奖品
	void Too_Award(_Param)
	{
		//参数：物品唯一id,姓名,地址,邮政编码,电话,e-mail
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_SHOP,"Award",_Param);
	}

	//获得奖品信息
	void Too_GetAwardChangeInfo(_Param)
	{
		//参数：物品唯一id
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_SHOP,"GetAwardChangeInfo",_Param);
	}

	//献花操作，向对方献花一次
	void Too_FavorFlower(_Param)
	{
		//参数：商品ID，商品数量，献给某人的昵称
		printf("B#  献花操作：Too_FavorFlower():_param"+_Param);
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_SHOP,"UseGoods",_Param);
	}
	void Too_ChangeName(_Param)
	{
		//参数：改名卡类型，要改的名字
		printf("B#  改名操作：Too_ChangeName():_param"+_Param);
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_SHOP,"UseGoods",_Param);
	}
	/*房间内*/
	//房主踢人
	void Too_KickSBOut(_Param)
	{
		//发出踢人消息踢人:自己的ID,对方用户id
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_ROOM,"nf_master_kick_user", _Param);
	}

	//地图加载完毕-vs界面显示完了
	void Too_MapLoadEnd(_Param)
	{
		//发出地图加载完毕消息:自己的ID
		window.find("UIController").UserRequest(window.GAMEUI, window.REQUEST_ROOM,"nf_game_map_loaded",_Param);
	}

	//更换队伍
	void Too_ChangeTeam(_Param)
	{
		//发出更换队伍消息:自己的ID
		window.find("UIController").UserRequest(window.GAMEUI, window.REQUEST_ROOM,"nf_user_chg_team",_Param);
	}

	//GM自动开始游戏
	void Too_AutoStart(_Param)
	{
		//发出开始游戏的消息：玩家ID
		window.find("UIController").UserRequest(window.GAMEUI, window.REQUEST_ROOM,"nf_gm_start_auto",_Param);
	}
	//开始游戏
	void Too_BeginGame(_Param)
	{
		//发出开始游戏的消息：玩家ID
		window.find("UIController").UserRequest(window.GAMEUI, window.REQUEST_ROOM,"nf_master_start",_Param);
	}

	//准备或取消准备
	void Too_ReadyOrNo(_Param)
	{
		//发出准备与取消准备的消息：玩家ID，状态(0未知 1等待状态 2准备状态)
		window.find("UIController").UserRequest(window.GAMEUI, window.REQUEST_ROOM,"nf_user_reday", _Param);
	}

	//选择地图
	void Too_SelectMap(_Param)
	{
		//发出选择地图的消息：玩家ID，地图ID
		window.find("UIController").UserRequest(window.GAMEUI, window.REQUEST_ROOM,"nf_master_select_map", _Param);
	}

	//返回房间-结算点返回房间或10秒后自动调用
	void Too_BackToRoom(_Param)
	{
		//发出返回房间消息:自己的ID
		window.find("UIController").UserRequest(window.GAMEUI, window.REQUEST_ROOM,"nf_to_room",_Param);
	}

	//房间设置
	void Too_RoomSet(_Param)
	{
		//发出房间设置消息:用户ID 房间类型 局数 房间名称 房间密码 是否允许观战,赌注，货币类型
		window.find("UIController").UserRequest(window.GAMEUI, window.REQUEST_ROOM,"nf_master_Setting",_Param);
	}

	//是否同意房主修改押注
	void Too_nf_wager_idea(_Param)
	{
		//参数:用户ID，是否同意,0表示不同意,1表示同意
		window.find("UIController").UserRequest(window.GAMEUI, window.REQUEST_ROOM,"nf_wager_idea",_Param);
	}

	/*聊天*/
	//[功能]发出聊天消息
	//[参数]_Param：发出消息的参数
	//		_labatype:喇叭的类型
	//		_chatuipos:聊天的界面位置
	void Too_SendChatMsg(_Param,_labatype,_chatuipos)
	{
		var _TbName = window.REQUEST_CHAT;
		if (_chatuipos == window.CHAT_UIPOS_GAME || _chatuipos == window.CHAT_UIPOS_ROOM)
		{
			if (_labatype == window.CHAT_LABATYPE_COMMON)
			{
				_TbName = window.REQUEST_CHAT_GAME;
			}
		}
		//发出聊天消息：聊天类型，界面位置，聊天内容，自己的昵称，别人的昵称
		window.find("UIController").UserRequest(window.GAMEUI,_TbName,"ChatReceive", _Param);
	}


	/*训练*/
	//[功能]发出进入训练的消息
	//[参数]_Param:训练ID
	//		style:1普通训练 2自由训练
	void Tos_EnterTrain(_Param,style)
	{
		printf("B# EnterTrain:发出进入训练的消息_Param:"+_Param+",g_TrainType:"+window.g_TrainType);
		if (_Param == "1")//新手强制训练
		{
			window.g_TrainType = 0;	//训练的类型：0强制训练 1正常(训练选择) 2(训练中弹出)
			//参数：训练ID
			window.find("HALLGCMap").find("self").parent.tos("EnterTrain",_Param);
			
		}
		else
		{
			if (style.__Long__ == window.TRAIN_TYPE_COMMON)
			{
				window.WaitEntryTrain(); //等待
			}

			//参数：训练ID
			window.find("HALLGCMap").find("self").parent.tos("EnterTrain",_Param);
		}
	}

	//发出完成训练的消息
	void Tos_AchieveTrain(_Param)
	{
		//参数：训练ID
		window.find("HALLGCMap").find("self").parent.tos("AchieveTrain",_Param);
	}

	//同步完成的训练,只需要发送一次
	void Tos_SynAchieveTrain(_Param)
	{
		window.tstatic.ClearTrainData();
		//参数：用户ID
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_HALL,"SynAchieveTrain", _Param);
	}

	/*竞技赛*/
	//发出报名的消息
	void Tos_ApplyArenaRace(_Param)
	{
		//参数：用户id，报名id(玩家ID或者队伍ID)，报名类型(活动ID)
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_HALL,"_ApplyArenaRace", _Param);
	}

	//发加入竞技场房间消息
	void Tos_JoinArenaRoom(_Param)
	{
		//参数：用户id，房间id
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_ARENAHALL,"_JoinArenaRoom", _Param);
	}

	//放弃加入竞技场等待的消息
	void Tos_CancelQueue(_Param)
	{
		//参数：用户ID，竞技ID
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_HALL,"_CancelQueue", _Param);
	}
	//重开排队的消息
	void Tos_RestartQueue(_Param)
	{
		//参数：用户ID，竞技ID
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_HALL,"_RestartQueue", _Param);
	}

	//取消修整,开始比赛
	void Tos_CancelRest(_Param)
	{
		//参数：用户ID，竞技ID
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_HALL,"_CancelRest", _Param);
	}

	//是否接受排队信息
	void Tos_ReceiveQueue(_Param)
	{
		//参数：用户ID，是否接受:0不接受，其他表示接受
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_HALL,"_ReceiveQueue", _Param);
	}

	//意见提交
	void Tos_SendIdea(_Param)
	{
		//参数：用户ID，消息
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_HALL,"SendIdea", _Param);
	}

	//得到在线礼物
	void Tos_InLinePresent(_Param)
	{
		//参数：用户ID，要领取的礼品ID(进入大厅时用0,表示得到当前可以领取的礼品)
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_HALL,"_InLinePresent", _Param);
	}

	//转换竞技场点数
	void Tos_AddArenaData(_Param)
	{
		//参数：用户ID，竞技类型，增加点数
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_HALL,"_AddArenaData", _Param);
	}

	//同步竞技场数据
	void Tos_SynArenaData(_Param)
	{
		//参数：用户ID，用户的竞技类型，用户所在的组ID,同步的最大长度
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_HALL,"_SynArenaData", _Param);
	}

	//同步竞技场数据使用字符串
	void Tos_SynArenaDataStr(_Param)
	{
		//参数：用户ID，用户的竞技类型，用户所在的组ID,同步的最大长度
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_HALL,"_SynArenaDataStr", _Param);
	}

	//询问竞技赛的信息
	void Tos_EnterArena(_Param)
	{
		printf("B# 公告Tos_EnterArena:"+_Param);
		//参数：用户ID
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_HALL,"_EnterArena", _Param);
	}

	//发送统计数据
	void Tos_SendGameStat(userid,data)
	{
		//参数：用户ID
		var _Param = ""+userid+","+data+","+window.g_ArenaJoinRoom;
		printf("Tos_SendGameStat:"+_Param);
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_HALL,"_SendGameStat",_Param );
	}

	//得到vip礼品
	void Tos_VipPresent()
	{
		//参数：用户ID
		var _Param = ""+window.GetMyUID();
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_HALL,"_VipPresent",_Param );
	}

	/*
	*	任务相关
	*/

	//存储个人配置信息
	void Tos_StoreInfo(_Param)
	{
		//参数：用户ID,个人信息
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_HALL,"_StoreInfo",_Param );
	}

	//接任务
	void Tos_InceptTask(_Param)
	{
		//参数：用户ID,任务ID
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_HALL,"_InceptTask",_Param );
	}

	//交任务
	void Tos_SubmitTask(_Param)
	{
		//参数：用户ID,任务ID
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_HALL,"_SubmitTask",_Param );
	}

	//任务事件完成
	void Tos_AddEvent(_Param)
	{
		var c=window.tennisGameStatic.CheckSendEvent(_Param);
		if (c==0)
		{
			return;
		}
		//参数：用户ID,任务ID,任务描述,显示提示索引
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_HALL,"_AddEvent",_Param );
	}

	//取消任务
	void Tos_TaskQuit(_Param)
	{
		//参数：用户ID,任务ID
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_HALL,"_TaskQuit",_Param );
	}

	//得到每日任务数量
	void Tos_GetEverydayTask()
	{
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_HALL,"_GetEverydayTask",""+window.GetMyUID() );
	}

	//创建家族
	void Tos_CreateFamily(_Param)
	{
		printf("xmpp:Tos_CreateFamily:"+_Param);
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_HALL,"_CreateFamily",_Param);
	}

	//刷新玩家列表
	void Tos_RefreshPlayList(_Param)
	{
		//参数：玩家ID,页数,当前页的哈希值
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_HALL,"_RefreshPlayList",_Param);
	}

	//刷新邀请列表
	void Tos_RefreshInviteList(_Param)
	{
		//参数：玩家ID,页数,当前页的哈希值
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_HALL,"_RefreshInviteList",_Param);
	}

	//检查修改的用户名称是否可用
	void Tos_CheckModifyUserNick(_Param)
	{	
		//参数：玩家ID,检查的昵称
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_HALL,"_CheckModifyUserNick",_Param);
	}

	/*
		关系系统
	*/

	//邀请某人发生关系
	void Tos_RelationInvite(_Param)
	{
		/*
		参数
		int	type		//类型,1:搭档 2:密友 3:情侣
		int	invitetype	//邀请的类型,1:邀请成为搭档 2:邀请成为当前搭档 3:邀请成为密友 4:邀请成为情侣  5:使用金币的取消情侣
		int	inviteid	//被邀请的用户id
		*/
		window.find("HALLGCMap").find("self").parent.tos("RelationInvite",_Param);
	}

	//回复某人对己发生关系的邀请
	void Tos_AnswerRelationInvite(_Param)
	{
		/*
		参数
		int		agree		//是否同意 1:同意 0:不同意 2:没反馈,在客户端的邀请框消失时自动发
		int		invitetype	//邀请类型 1:邀请成为搭档 2:邀请成为当前搭档 3:邀请成为密友 4:邀请成为情侣  5:使用金币的取消情侣
		int		randomid	//一个验证数据,来自"收到别人的邀请"的randomid
		*/
		window.find("HALLGCMap").find("self").parent.tos("ReceiveInvite",_Param);
	}

	//取消某种关系
	void Tos_CancelRelation(_Param)
	{
		/*
		参数
		int	type		//类型,1:搭档 2:密友 3:情侣
		int	cancelid	//被取消的用户id
		*/
		window.find("HALLGCMap").find("self").parent.tos("CancelRelation",_Param);
	}

	//取消某种关系
	void Tos_CancelCurrentPartner(_Param)
	{
		/*
		参数
		int	userid	//用户id
		*/
		window.find("HALLGCMap").find("self").parent.tos("CancelCurrentPartner",_Param);
	}

	//取消某种关系
	void Tos_TransLeader(_Param)
	{
		/*
		参数
		int	transid	//被转换的用户id
		*/
		window.find("HALLGCMap").find("self").parent.tos("TransLeader",_Param);
	}
	//查询搭档列表中能打开的条数
	void Tos_CanPartnerNum()
	{
		/*
		参数 无
		*/
		window.find("HALLGCMap").find("self").parent.tos("CanPartnerNum","");
	}

	//关系消耗物品
	void Too_RelationUseItem(_Param)
	{
		//参数：商品ID，商品数量，被使用者的UID
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_SHOP,"UseGoods",_Param);
	}

	//订婚
	void Too_BecameLover(_Param)
	{
		//参数：订婚对象的名字
		printf("B#  订婚操作：Too_ChangeName():_param"+_Param);
		//-----------------------------等待订婚消息借口-----------------//
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_SHOP,"UseGoods",_Param);
	}
	
	//查找
	void Tos_CheckLoverID (_Param)
	{
		//参数：要查询的用户ID
		printf("B#  查询情侣：Tos_CheckLoverID():_param"+_Param);
		window.find("HALLGCMap").find("self").parent.tos("GetLoverInfo",_Param);
	}

	
	
	//不续费就发消息，加入背包续费界面
	void Too_AddDeadProps( _param,_num,_itemsID )
	{	
		var num = _num;
		var itemsID = _itemsID;
		
		//参数：packid
		var Param =""+_param+","+num+","+itemsID;
		window.find("UIController").UserRequest( window.GAMEUI,window.REQUEST_SHOP,"ChangePackId",Param );
	}
}