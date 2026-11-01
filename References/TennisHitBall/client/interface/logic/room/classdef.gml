//
//房间界面的逻辑部分类定义
//
import("$./ClassDef_Socket.gml");
import("$./ClassDef_Socket_Domain.gml");
importex("$./../../UI/Room/ClassDef.gml");
importex("$./ClassDef_UserModelName.gml");
importex("$./ClassDef_UserList.gml");

//
//房间界面：逻辑
//
class VRoom_Logic item
{
	size = "100%,100%";show = false;

	var m_Masterid = 0;			//房主id
	var m_RoomType = 0;			//房间类型 0未知 1网球竞技单 2网球竞技双
	var m_Ready = 1;			//准备状态 0未知 1等待 2准备
	var m_RoomID = 0;			//房间ID
	//GM自动开始房间
	var m_GMType = 0;			//1：GM手动开始房间   2：GM自动开始房间
	var m_GMMasterID = 0;		//GM房间中的虚拟房主，即m_g_server,userdt,waituser1
	var m_StartTime = 3;		//GM房间开始倒计时总时间 单位：秒
	var m_EndTime = true;		//是否结束计时
	var m_canCheck = true;			//防止_ReadTable OnAddData方法在循环调用时频繁发起GM计时消息
	var m_UserTime = 15000;		//GM房间开始条件满足，倒计时开始之前玩家缓冲时间 单位：毫秒
	//===================================与显示交互部分========================================
	void Init()
	{
		//房间设置：按钮
		staticvar s_Btn_RoomSet = new VMyButton
		{
			valign(85,0);halign(75,0);Init("房间设置");
		}
		//邀请：按钮
		staticvar s_Btn_Invite = new VMyButton
		{
			valign(90,0);halign(75,0);Init("邀请");
		}
		//商城：按钮
		staticvar s_Btn_Mall = new VMyButton
		{
			pos="808,626";Init("商城");
		}
		//观战列表：按钮
		staticvar s_Btn_LookList = new VMyButton
		{
			pos="808,660";Init("观战列表");
		}

		//邮件：按钮
		staticvar s_Btn_Mail = new VMyButton
		{
			pos="808,360";Init("邮件");
		}
//		//任务：按钮
//		staticvar s_Btn_Task = new VMyButton
//		{
//			pos="808,460";Init("任务");
//		}
		//背包：按钮
		staticvar s_Btn_Pack = new VMyButton
		{
			pos="808,560";Init("背包");
		}

		//更换队伍:：按钮
		staticvar s_Btn_ChangeTeam = new VMyButton
		{
			valign(95,0);halign(75,0);Init("更换队伍");
		}
		//开始游戏：按钮
		staticvar s_Btn_StartGame = new VMyButton
		{
			valign(80,0);halign(80,0);Init("开始游戏");
		}
		//准备：按钮
		//参数：0未知 1等待状态 2准备状态 
		staticvar s_Btn_Ready = new VMyButton
		{
			valign(90,0);halign(90,0);Init("准备");
		}
		//取消准备：按钮
		//参数：0未知 1等待状态 2准备状态 
		staticvar s_Btn_CancelReady = new VMyButton
		{
			valign(100,0);halign(100,0);Init("取消准备");
		}

		//当前选择的地图
		//data1:ID
		//data2:地图的名字
		staticvar s_Item_CurrMap = new item
		{
			valign(100,0);halign(53,0);
			size = "280,150";bgcolor = "#FF";alpha = 20;
			//名字
			var _name = new VMyText{}
			//ID
			var _ID = new VMyText{pos = "0,50";}
			//局制
			//data1:几局制 1，2，3
			var _GameNum = new VMyText{pos = "10,70";}

			void SetData(data1,data2,data3)
			{
				_ID.SetData("ID:",data1,"");
				_name.SetData("地图名称：",data2,"");
				//_GameNum.SetData("局制：",data3,"");
			}
		}

		//押注金额
		//value:-1,不显示 
		staticvar s_Wager = new VMyText{}
	}
	inclass("VRoom_UI");//界面显示类
	Init();
	//=========================================================================================
	//点击了F1 - 准备/取消准备/开始游戏
	void OnClick_F1()
	{
		if ( window.GetMyUID() == m_Masterid)	//自己是房主
		{
			s_Btn_StartGame.OnPressed();
		}
		else//自己不是房主
		{
			if (s_Btn_Ready.GetMyShow())
			{
				s_Btn_Ready.OnPressed();
			}
			else
			{
				if (s_Btn_CancelReady.GetMyShow())
				{
					s_Btn_CancelReady.OnPressed();
				}
			}
		}
	}

	//点击了开始游戏-判断网速
	void OnClick_BtnStartGame()
	{
		var _res = Judge_Ping();//[返回值]正常1,有人差0,有人不通-1
		printf("B# OnClick_BtnStartGame-网速情况:"+_res);
		if (_res == -1)
		{
			window.find("UIController").LoadDLG(155);//有玩家网络不通，无法开始游戏！
			return;
		}
		if (_res == 0)
		{
			window.find("UIController").LoadDLG(74);//目前网络连接不稳定，确定要开始游戏吗？
			return;
		}
		Confirm_BeginGame();
	}
	//可以开始游戏消息了
	void Confirm_BeginGame()
	{
		//发出开始游戏的消息：玩家ID
		var _Param = ""+window.GetMyUID();
		window.Too_BeginGame(_Param);
	}
	//点击了准备或取消准备
	//参数 state：0未知 1等待状态 2准备状态 
	void OnClick_BtnReady(state)
	{
		//发出准备与取消准备的消息：玩家ID，状态(0未知 1等待状态 2准备状态)
		var _Param = ""+window.GetMyUID()+","+state;
		window.Too_ReadyOrNo(_Param);
	}
	//点击了更换队伍
	void OnClick_ChangeTeam()
	{
		//发出更换队伍消息:自己的ID
		var _Param = ""+window.GetMyUID();
		window.Too_ChangeTeam(_Param);
	}

	//点击了观战列表
	void OnClick_LookList()
	{
		printf("B# 此版本不开放");
	}

	//设置响应事件
	void SetEvent()
	{
		set s_Btn_RoomSet
		{
			name = "BtnName_ROOM_Bottom_RoomSet";
			void OnPressed()
			{
				if (GetState() == window.USER_STATE_REDAY){window.OnClick_Room_RoomSet();}
			}
		}
		set s_Btn_StartGame
		{
			//name = "RoomBTN_s_Btn_StartGame";
			void OnPressed()
			{
				if (GetState() == window.USER_STATE_REDAY){parent.OnClick_BtnStartGame();}
			}
		}
		set s_Btn_Ready
		{
			//name = "RoomBTN_s_Btn_Ready";
			void OnPressed(){parent.OnClick_BtnReady(window.USER_STATE_REDAY);}

			var m_IsShow = true;
			void SetMyShow(param)
			{
				m_IsShow = param;show = m_IsShow;
				//printf("B# >>>>s_Btn_Ready:SetMyShow():"+param);
			}
			void GetMyShow(){return m_IsShow;}
		}
		set s_Btn_CancelReady
		{
			//name = "RoomBTN_s_Btn_CancelReady";
			void OnPressed(){parent.OnClick_BtnReady(window.USER_STATE_WAIT);}

			var m_IsShow = true;
			void SetMyShow(param)
			{
				m_IsShow = param;show = m_IsShow;
				//printf("B# >>>>s_Btn_CancelReady:SetMyShow():"+param);
			}
			void GetMyShow(){return m_IsShow;}
		}
		set s_Btn_Invite
		{
			name = "BtnName_ROOM_Bottom_Invite";
			window.SetHallBtnName(window.G_HALLBTN_INVITE,this.name);
			void OnPressed()
			{
				if (GetState() == window.USER_STATE_REDAY) {window.OnClick_Room_Invite();}	
			}
		}
		set s_Btn_ChangeTeam
		{
			void OnPressed()
			{
				if (GetState() == window.USER_STATE_REDAY) {parent.OnClick_ChangeTeam();}	
			}
		}
		
		set s_Btn_LookList
		{
			void OnPressed()
			{
				if (GetState() == window.USER_STATE_REDAY) {parent.OnClick_LookList();}	
			}
			SetState(window.BTN_STATE_GREY);
		}
		set s_Btn_Mall
		{
			name = "BtnName_ROOM_Bottom_Mall";
			window.SetHallBtnName(window.G_HALLBTN_MALL,this.name);
			void OnPressed()
			{
				if (GetState() == window.USER_STATE_REDAY){window.OnClick_Room_Mall();}	
			}
		}
		set s_BTN_Task
		{
			name = "BtnName_ROOM_Bottom_Task";
			window.SetHallBtnName(window.G_HALLBTN_TASK,this.name);
			void OnPressed()
			{
				if (GetState() == window.USER_STATE_REDAY){window.OnClick_BTN_Task();}	
			}
			
		}
		set s_Btn_Mail
		{
			name = "BtnName_ROOM_Bottom_Mail";
			window.SetHallBtnName(window.G_HALLBTN_MAIL,this.name);
			void OnPressed()
			{
				if (GetState() == window.USER_STATE_REDAY){window.OnClick_Room_Mail();}	
			}
		}
		set s_Btn_Pack
		{
			name = "BtnName_Hall_Bottom_Pack";
			void OnPressed()
			{
				if (GetState() == window.USER_STATE_REDAY){window.OnClick_Room_Pack();}	
			}
		}
	}
	//================================DBList=====================================================
	var _UserList = new VRoom_UserList_Logic
	{
		name = "VRoom_UserList_Logic_NAME";
	
		var _SQL = "SELECT * FROM userdt WHERE did=" + window.GetMyRoomID()+" AND gamesta="+window.USER_GAMESTATE_ROOM; 
		
		void OnDelete(){DEL();} //移除绑定
		void ADD()
		{
			printf("B# >>>>房间列表添加绑定～！\n");
			window.find("G_DBMANAGE").RegDbTable(this,window.M_G_SERVER,window.USERDT,"Bind_VRoom_UserList_Logic");// 绑定数据表
			window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VRoom_UserList_Logic", window.M_G_SERVER,_SQL);
			scriptprcallsub("SendGetInfoMsg");
			printf("B# >>>>房间玩家List_SQL:"+_SQL);
		}
		void DEL()
		{
			printf("B# >>>>房间列表移除绑定～！\n");
			window.find("G_DBMANAGE").ReMoveRegDbTable(this);
		}
		ADD();

		void PageviewEnd() // 翻页结束后调用
		{
			//printf("B# 房间玩家列表，PageviewEnd\n");
		}
	}
	
	//================================End of DBList===============================================
	SetEvent();
	void OnCreated()
	{
		printf("VRoom_Logic-OnCreated()");
		
	}
	void OnDelete()
	{
		printf("VRoom_Logic-OnDelete()");
	}
	//无可奈何加了这个，否则出现BUG：[0010538] 2009年12月23日 yxf
	void InitBtnState()
	{
		s_Btn_StartGame.show = false;
		s_Btn_Ready.show = false;
		s_Btn_CancelReady.show = false;
	}

	//根据自己是否是房主，对房间界面做一些改变
	void ChangeByMaster()
	{
		printf("B# >>>>ChangeByMaster根据自己是否是房主，对房间界面做一些改变:m_Masterid:"+m_Masterid);
		InitBtnState();
		if ( window.GetMyUID() == m_Masterid)	//自己是房主
		{
			//printf("B# >>ChangeByMaster自己是房主");
			s_Btn_StartGame.show = true;
			s_Btn_Ready.SetMyShow(false);
			s_Btn_CancelReady.SetMyShow(false);

			s_Btn_RoomSet.SetState(window.USER_STATE_REDAY);//房间设置按钮为亮的
			s_Btn_StartGame.SetState(window.USER_STATE_WAIT);//开始按钮为灰的
		}
		else//自己不是房主
		{
			//printf("B# >>ChangeByMaster自己不是房主");
			s_Btn_StartGame.show = false;
			if (toint(m_GMType) == 0)
			{
				s_Btn_Ready.SetMyShow(true);
			}
			s_Btn_CancelReady.SetMyShow(false);
			
			s_Btn_RoomSet.SetState(window.USER_STATE_WAIT);//房间设置按钮为灰的
		}
		//ChangeByRoomType();
	}
	
	//根据玩家的准备状态，对房间界面按钮做是否变灰处理
	//参数 uid：UserID
	//参数 did：房间ID
	//参数 readystate：0未知 1等待状态 2准备状态 
	void ChangeByReady(uid, did, readystate)
	{	
		if (window.g_DEBUG)
		{
			//printf("B# >>>>ChangeByReady:uid:"+uid+",did:"+did+",readystate:"+readystate+",m_Masterid:"+m_Masterid);
		}

		//自己且不是房主
		//准备后，除"取消准备"外所有按钮变灰
		if ((window.GetMyUID() != m_Masterid) && (window.GetMyUID() == uid) && (toint(m_GMType) == 0))
		{
			m_Ready = readystate;//准备后就不可以换队伍了
			ChangeByRoomType();

			if (m_Ready == window.USER_STATE_REDAY)
			{
				//printf("B# >>ChangeByReady自己不是房主,邀请变灰-准备");
				s_Btn_CancelReady.SetMyShow(true);
				s_Btn_Ready.SetMyShow(false);
				
				if (window.IsHallHtnOpened(window.G_HALLBTN_INVITE))
				{
					window.find("INVITE_LOGIC").del();
				}
				s_Btn_Invite.SetState(window.USER_STATE_WAIT);//邀请按钮为灰的
			}
			if (m_Ready == window.USER_STATE_WAIT)
			{
				//printf("B# >>ChangeByReady自己不是房主,邀请变亮-取消准备");
				s_Btn_CancelReady.SetMyShow(false);
				s_Btn_Ready.SetMyShow(true);
				s_Btn_Invite.SetState(window.USER_STATE_REDAY);//邀请按钮为亮的
			}
			return;
		}
		
		//自己是房主
		//并且别人在这个房间的人准备或取消准备，开始游戏按钮，亮与灰
		if ((window.GetMyUID() == m_Masterid) && (uid != window.GetMyUID()) && (did == window.GetMyRoomID()))
		{
			if (IsAllReady())
			{
				//printf("B# >>ChangeByReady自己是房主,所有人都准备-开始变亮");
				s_Btn_StartGame.SetState(window.USER_STATE_REDAY);
			}
			else
			{
				//printf("B# >>ChangeByReady自己是房主,有人没准备-开始变灰");
				s_Btn_StartGame.SetState(window.USER_STATE_WAIT);
			}
			return;
		}
	}
	
	//根据房间类型-对界面按钮做些变化
	//单打：不能更换队伍 双打：可以更换队伍
	//房间类型 0未知 1网球竞技单 2网球竞技双 3网球道具单 4网球道具双 
	void ChangeByRoomType()
	{
		printf("B# >>>>ChangeByRoomType根据房间类型-对界面按钮做些变化:m_Masterid:"+m_Masterid);
		if (m_RoomType == 0)
		{
			if (window.g_DEBUG){printf("B# ChangeByRoomType:无效的房间类型");}
			return;
		}
		//开始按钮
		if (window.GetMyUID() == m_Masterid)//自己是房主
		{
			if (IsAllReady())
			{
				//printf("B# >>ChangeByRoomType自己是房主,所有人都准备-开始变亮");
				s_Btn_StartGame.SetState(window.USER_STATE_REDAY);
			}
			else
			{
				//printf("B# >>ChangeByRoomType自己是房主,有人没准备-开始变灰");
				s_Btn_StartGame.SetState(window.USER_STATE_WAIT);
			}
		}
		var _Temp = toint(m_RoomType)%2;
		//printf("B# 看是单打或双打："+_Temp);
		if (_Temp == 1)//单打
		{
			var _SQL_2 = "SELECT * FROM userdt WHERE did=" + window.GetMyRoomID()+" AND usersta=2 AND team="+window.TEAM_RED; 
			window.g_Table.Select(window.M_G_SERVER,_SQL_2);
			var _redteam = window.g_Table.GetSize();//红队人数
			window.g_Table.Release();
			// del by chenjihui 2011-1-27
			//printf("B# >>ChangeByRoomType单打！");
//			if (_redteam ==0 || _redteam ==2)    //如果房主与单打玩家同一队，就能再次更换队伍  zyy  2011\1\12
//			{
//            s_Btn_ChangeTeam.SetState(window.USER_STATE_REDAY);//更换队伍按钮为亮的
//				return;
//			}
			s_Btn_ChangeTeam.SetState(window.USER_STATE_WAIT);//更换队伍按钮为灰的
			return;
		}
		if (_Temp == 0)//双打
		{
			//printf("B# >>ChangeByRoomType双打！");
			if (window.GetMyUID() == m_Masterid)//自己是房主
			{
				s_Btn_ChangeTeam.SetState(window.USER_STATE_REDAY);//更换队伍按钮为亮的
				return;
			}
			else
			{
				if (m_Ready == window.USER_STATE_REDAY)
				{
					s_Btn_ChangeTeam.SetState(window.USER_STATE_WAIT);//更换队伍按钮为灰的
					return;
				}
				if (m_Ready == window.USER_STATE_WAIT)
				{
					s_Btn_ChangeTeam.SetState(window.USER_STATE_REDAY);//更换队伍按钮为亮的
					return;
				}
			}
		}
	}

	//是否所有人都准备了
	//返回值 ：true or false
	void IsAllReady()
	{
		//取得已准备的人数
		var _SQL_1 = "SELECT * FROM userdt WHERE did=" + window.GetMyRoomID()+" AND ready="+window.USER_STATE_REDAY+" AND usersta=2"; 
		window.g_Table.Select(window.M_G_SERVER,_SQL_1);
		var _readycount = window.g_Table.GetSize();
		window.g_Table.Release();

		//单打或者双打
		var _Temp = toint(m_RoomType)%2;
		if (_Temp == 1)//单打
		{
			if (_readycount == 1)
			{
				return true;
			}
			else
			{
				return false;
			}	
		}
		if (_Temp == 0)//双打-红队2人==蓝队2人 且有3人准备才可点击
		{
			//取得红队和蓝队的人数
			var _SQL_2 = "SELECT * FROM userdt WHERE did=" + window.GetMyRoomID()+" AND usersta=2 AND team="+window.TEAM_RED; 
			window.g_Table.Select(window.M_G_SERVER,_SQL_2);
			var _redteam = window.g_Table.GetSize();//红队人数
			window.g_Table.Release();

			var _SQL_3 = "SELECT * FROM userdt WHERE did=" + window.GetMyRoomID()+" AND usersta=2 AND team="+window.TEAM_BLUE; 
			window.g_Table.Select(window.M_G_SERVER,_SQL_3);
			var _blueteam = window.g_Table.GetSize();//蓝队人数
			window.g_Table.Release();
			if (window.g_DEBUG)
			{
				printf("B# _redteam:"+_redteam+",_blueteam:"+_blueteam);
			}	
			if (_readycount == 3 && _redteam == _blueteam)
			{
				return true;
			}
			else
			{
				return false;
			}	
		}
	}
	
	//得到一些房间信息，在房间socket和服务器端连接建立后调用
	void GetRoomData()
	{
		window.g_Row.InitByInt(window.M_G_SERVER, window.DESKDT, window.M_G_SERVER_DESKDT_DESKID,window.GetMyRoomID());
		if (!window.g_Row.IsReady()) 
		{
			printf("B# >>>>房间-Error-GetRoomData()：if (!window.g_Row.IsReady()) ");
			window.g_Row.Release();
			return;
		}
		//获得房主ID
		m_Masterid = window.g_row.GetData(window.M_G_SERVER_DESKDT_MASTERID);
		//房间类型
		m_RoomType = window.g_row.GetData(window.M_G_SERVER_DESKDT_DESKTYPE);
		//游戏局制
		var _GameNum = window.g_row.GetData(window.M_G_SERVER_DESKDT_SCORENUM);//9字段
		
		window.g_WagerValue = window.g_row.GetData(window.M_G_SERVER_DESKDT_IWAGER);
		s_Wager.SetData(window.g_WagerValue);//赌注

		SetGameNum(_GameNum);
		m_GMType = window.g_row.GetData(window.M_G_SERVER_DESKDT_GMROOMTYPE);
		m_GMMasterID = window.g_row.GetData(window.M_G_SERVER_DESKDT_WAITUSER1);
		if (toint(m_GMType) == 2)
		{
			s_Btn_Ready.SetMyShow(false);
			s_Btn_Invite.SetState(window.USER_STATE_WAIT);
			StartReady();
//			timer(10000,"GmUIStateChange","GmUIStateChange");
		}
		window.g_Row.Release();
	}
	
	//设置地图的信息
	//参数：ID 游戏地图ID
	void SetMapSrc(MapID)
	{
		var _name = "";//地图的名称
		var _RoomMapID = 0;//房间的地图ID
		var _VNet2DBRowTemp = new VNet2DBRow{};
		_VNet2DBRowTemp.InitByInt(window.TENNIS_GAME,window.MAPINFO,window.TENNIS_GAME_MAPINFO_MAPID,MapID);
		if ( _VNet2DBRowTemp.IsReady())
		{
			_name = _VNet2DBRowTemp.GetData( window.TENNIS_GAME_MAPINFO_MAPNAME);//1字段
			_RoomMapID = _VNet2DBRowTemp.GetData( window.TENNIS_GAME_MAPINFO_ROOMMAPID );//8字段
			window.SetMyRoomMapID(_RoomMapID);
		}
		_VNet2DBRowTemp.del();
		s_Item_CurrMap.SetData(MapID,_name);
	}
	
	//设置游戏局制
	//参数：num 1,2,3
	void SetGameNum(num)
	{
		s_Item_CurrMap._GameNum.SetData(num);
	}

	//设置要监视的数据表，在房间socket和服务器端连接建立后调用
	void MonitorTable()
	{
		_VNet2DBRow.InitDB();
		if (toint(window.g_IsFirstRoomIn) == 1)
		{
			timer(1000,"GmInitUserdt","GmInitUserdt_name");
		}
		else
		{
				_GMVNet2DBRow.InitDB();
		}
		var _SQL = "SELECT * FROM userdt WHERE did=" + window.GetMyRoomID()+" AND usersta=2 AND "+window.M_G_SERVER_USERDT_RID_STR+">0";
		_ReadyTable.Select(window.M_G_SERVER, _SQL);
		//printf("B# >>>>房间MonitorTable():_SQL:"+_SQL);
		_ReadyTable.ReadData("OnAddData","" + window.M_G_SERVER_USERDT_UID + "," + window.M_G_SERVER_USERDT_DID + "," + window.M_G_SERVER_USERDT_READY);
	}
	//定时执行函数
	//客户端第一次进房间不延时的话，userdt里did将不能及时写进，这样将无法设置对其监视
	//add by chenjihui
	void GmInitUserdt()
	{
		killtimer("GmInitUserdt_name");
		window.g_IsFirstRoomIn = 0;
		if (toint(m_GMType) == 2)
		{
			_GMVNet2DBRow.InitDB();
		}
	}

	//总的函数：在socket连接上后调用
	void OnConnected_Init()
	{
		GetRoomData();
		MonitorTable();		
		ChangeByMaster();
		ChangeByRoomType();
		SetMapSrc(window.GetMyGameMapID());
	}

	//监测玩家的准备状态
	var _ReadyTable = new VNet2DBTable
	{
		//当userdt表数据发生变化时，此函数被调用，有以下情况
		//  。用户点了/取消了 准备
		//参数 uid：UserID
		//参数 did：房间ID
		//参数 readystate：0未知 1等待状态 2准备状态 
		void OnAddData(uid, did, ready)
		{
			//printf("B# >>>>监测玩家的准备状态:OnAddData:uid:"+uid+",did:"+did+",ready:"+ready);
			if(window.GetUIPos() >= window.POS_GAME)
			{
				//printf("B# >>>>监测玩家的准备状态:位置不对:"+window.GetUIPos());
				return;
			}
			if (toint(uid) < 0)
			{
				//printf("B# >>>>监测玩家的准备状态:玩家ID不对:uid:"+uid);
				return;
			}

			if (toint(did) < 0 || toint(did) != window.GetMyRoomID())
			{
				//printf("B# >>>>监测玩家的准备状态:房间ID不对:did:"+did);
				return;
			}

			if (toint(ready) <= 0)
			{
				//printf("B# >>>>监测玩家的准备状态:状态不对:ready:"+ready);
				return;
			}

			parent.m_RoomID = did;

			//用户准备状态变化时的界面变化
			parent.ChangeByReady(uid, did, ready);
			if (toint(parent.m_GMType) == 2 && parent.m_canCheck)
			{
				parent.CheckGmIsAllready();
				if (toint(ready) == 2)
				{
					parent.s_Btn_ChangeTeam.SetState(window.USER_STATE_WAIT);
				}
			}
		}
	}
	//GM监测用户数据
	var _GMVNet2DBRow = new VNet2DBRow
	{
		void InitDB()
		{
			print("C# chjh gm initdb roomid="+window.GetMyRoomID());
			//printf("B# >>>>用户数据_GMVNet2DBRow：InitDB():window.GetMyRoomID():"+window.GetMyRoomID());
			InitByInt(window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_DID,window.GetMyRoomID(),1);
			AddDBEvent("OnUserDataChange",0,7,11,12);
		}
		//索引，0UID,7did 11所属队伍 12准备状态
		void OnUserDataChange(index,uid,did,team,ready)
		{
			if (toint(parent.m_GMType) != 2)
			{
				return;
			}
			switch (index)
			{
				case 11:
				{
					parent.m_EndTime = true;
					parent.CheckGmIsAllready();
					break;
				}
				case 12:
				{
					parent.m_EndTime = true;
					if (ready != 2)
					{
						break;
					}
					parent.CheckGmIsAllready();
				}
			}
		}
	}

	//定时执行函数
	//GM房间满足开始条件后延时倒计时，给玩家退出房间的缓冲时间
	void RunTiming()
	{
		print("C# chjh runtiming usertime="+m_UserTime+",isallready:"+GMIsAllReady());
		killtimer("RunTiming_name");
		if (GMIsAllReady())
		{
			m_canCheck = false;
			m_EndTime = false;

			RunStart(m_StartTime);
			window.find("POPLAYER").find("VHallWaiting_Logic_Name").del();//POPLAYER,TOPLAYER
			set window.find("POPLAYER")
			{
				new VHallWaiting_Logic{}
			}
			window.find("POPLAYER").find("VHallWaiting_Logic_Name").s_TEXT.SetData(4);
		}
		else
		{
			window.find("POPLAYER").find("VHallWaiting_Logic_Name").del();
			m_EndTime = true;
		}
		s_GMInfo.show = false;
	}
	//Gm房间达到开始条件提示信息
	void MyTipinfo()
	{
		killtimer("MyTipinfo_name");
		window.WriteChat(7,"比赛马上开始，请稍等片刻！");
	}

	//GM房间是否满足开始条件
	//当玩家进房间时作为定时执行函数，其它情况不作为时间函数
	//GM房间当有人进来时由于时间差，不能立即去查询该玩家状态
	//add by chenjihui
	void CheckGmIsAllready()
	{
		print("C# chjh==checkGmIsAllready() m_EndTime="+m_EndTime);
		killtimer("CheckGmIsAllready_name");
		if (GMIsAllReady())
		{
			m_canCheck = false;
			m_EndTime = false;
			s_Btn_ChangeTeam.SetState(window.USER_STATE_WAIT);
			s_GMInfo.show = true;
			timer(m_UserTime,"RunTiming","RunTiming_name");
			timer(1000,"MyTipinfo","MyTipinfo_name");
		}
		else
		{
			s_GMInfo.show = false;
			window.find("POPLAYER").find("VHallWaiting_Logic_Name").del();
			m_EndTime = true;
		}
	}
	
	//GM倒计时
	void RunStart(_time)
	{
		_time = toint(_time);
		if (m_EndTime)		//是否终止计时
		{
			return;
		}
		killtimer("runstart");
		if (toint(_time) == 0)
		{
			if (window.GetMyUID() == m_GMMasterID)
			{
				var param = ""+m_GMMasterID;
				window.Too_AutoStart(param);
			}
			timer(2000,"m_canCheck=true");
			return;			//发开始游戏
		}
		window.WriteChat(7,"距开始游戏还有："+_time+"s");
		_time -= 1;
		timer(1000,"RunStart("+_time+")","runstart");
	}

	//GM是否可以开始游戏
	void GMIsAllReady()
	{
		var _SQL_1 = "SELECT * FROM userdt WHERE did=" + window.GetMyRoomID()+" AND ready="+window.USER_STATE_REDAY+" AND usersta=2"; 
		window.g_Table.Select(window.M_G_SERVER,_SQL_1);
		var _readycount = window.g_Table.GetSize();

		//单打或者双打
		var _Temp = toint(m_RoomType)%2;
		if (_Temp == 1)//单打
		{
			if (_readycount == 2)
			{
				return true;//计时开始进入游戏
			}
			else
			{
				return false;
			}	
		}
		if (_Temp == 0)//双打-红队2人==蓝队2人 且有3人准备才可点击
		{
			//取得红队和蓝队的人数
			var _SQL_2 = "SELECT * FROM userdt WHERE did=" + window.GetMyRoomID()+" AND usersta=2 AND team="+window.TEAM_RED; 
			window.g_Table.Select(window.M_G_SERVER,_SQL_2);
			var _redteam = window.g_Table.GetSize();//红队人数
			window.g_Table.Release();

			var _SQL_3 = "SELECT * FROM userdt WHERE did=" + window.GetMyRoomID()+" AND usersta=2 AND team="+window.TEAM_BLUE; 
			window.g_Table.Select(window.M_G_SERVER,_SQL_3);
			var _blueteam = window.g_Table.GetSize();//蓝队人数
			window.g_Table.Release();
			if (window.g_DEBUG)
			{
				printf("B# _redteam:"+_redteam+",_blueteam:"+_blueteam);
			}	
			if (_readycount == 4 && _redteam == _blueteam)
			{
				return true;//计时开始进入游戏
			}
			else
			{
				return false;
			}	
		}
	}
	//房间的数据
	var _VNet2DBRow = new VNet2DBRow
	{
		void InitDB()
		{
			//printf("B# >>>>房间_VNet2DBRow：InitDB():window.GetMyRoomID():"+window.GetMyRoomID());
			InitByInt(window.M_G_SERVER,window.DESKDT,window.M_G_SERVER_DESKDT_DESKID,window.GetMyRoomID(),1);
			AddDBEvent("OnDeskDataChange",0,5,8,9,10,11,25,35,36);
		}
		//索引，0房间ID,5当前人数 8房间类型 9局制 10地图ID,11房主ID,25等待用户1，35赌注,36 赌注类型 1表示金币 2点卷
		void OnDeskDataChange(index,deskid,currnum,desktype,gamenum,dmapid,masterid,waituser1,iWager,iWagerType)
		{
			if (window.g_DEBUG)
			{
				printf("B# >>>>Desk:index:"+index+",deskid:"+deskid+",currnum:"+currnum+",desktype:"+desktype
					+",gamenum:"+gamenum+",dmapid:"+dmapid+",masterid:"+masterid+",iWager:"
				+iWager+",iWagerType:"+iWagerType);
			}
			switch (index)
			{
				case 5:
				{
					parent.s_GMInfo.show = false;
					parent.m_EndTime = true;
					parent.m_canCheck = true;
					parent.m_RoomMatch = 0;
					parent.m_MessageMark = false;
					if (toint(parent.m_GMType) == 2)
					{
						window.find("POPLAYER").find("VHallWaiting_Logic_Name").del();
					}
					//单打-有人走了-房主的开始按钮变灰
					if (currnum < 2 && desktype == window.ROOM_TYPE_SINGLE && window.GetMyUID() == masterid)
					{
						//printf("B# >>单打-有人走了");
						parent.s_Btn_Invite.SetState(window.USER_STATE_REDAY);//邀请按钮为亮的
						parent.s_Btn_StartGame.SetState(window.USER_STATE_WAIT);
					}
					if (currnum < 4 && desktype == window.ROOM_TYPE_DOUBLE) //双打
					{
						//printf("B# >>双打-有人走了");
						if (window.GetMyUID() == masterid) //自己是房主了
						{
							//printf("B# >>双打-有人走了,自己是房主");
							parent.s_Btn_Invite.SetState(window.USER_STATE_REDAY);//邀请按钮为亮的
							parent.s_Btn_StartGame.SetState(window.USER_STATE_WAIT);
						}
						else
						{
							//printf("B# >>双打-有人走了,自己是房客");
							//根据自己的准备状态改变下界面
							parent.ChangeByReady(window.GetMyUID(),deskid,parent.m_Ready);
						}
					}
				}
				case 8:
				{
					parent.m_RoomType = desktype;
					parent.ChangeByRoomType(); 
					var _text = "";
					var _tempType = toint(desktype);
					if (_tempType == window.ROOM_TYPE_SINGLE) _text = "普通单打";
					if (_tempType == window.ROOM_TYPE_DOUBLE) _text = "普通双打";
					if (_tempType == window.ROOM_TYPE_LOVERDOUBLE) _text = "情侣模式"
					if (_tempType == window.ROOM_TYPE_SINGLE_MATCH) _text = "随机单打";
					if (_tempType == window.ROOM_TYPE_DOUBLE_MATCH) _text = "随机双打";

					if (toint(iWager) > 0 )
					{
						_text = "挑战金";
						if (_tempType != window.ROOM_TYPE_LOVERDOUBLE)
						{
							if (_tempType%2 == 0)
								_text += "双打";
							else
								_text += "单打";
						}
						else
							_text = "情侣挑战金"
					}	
					window.WriteChat7(1015,""+_text);
					break;
				}
				case 9:
				{
					parent.SetGameNum(gamenum);
					if (gamenum == window.GAMENUM_1){window.WriteChat7(1015,"一局制");}
					if (gamenum == window.GAMENUM_3){window.WriteChat7(1015,"三局制");}
					if (gamenum == window.GAMENUM_5){window.WriteChat7(1015,"五局制");}
					break;
				}
				case 10:
				{
					window.SetMyGameMapID(dmapid);//游戏地图变化了
					window.find("NAME_GCMap").ChangeRoomMap();
					parent.SetMapSrc(dmapid);	//改变界面的显示
					break;
				}
				case 11:
				{
					parent.m_Masterid = masterid;
					parent.ChangeByMaster();
					parent._UserList.scriptprcallsub("UpDateByMaster");
					break;
				}
				case 25:
				{
					parent.m_GMMasterID = waituser1;
				}
				case 35:
				{
					var _text = ""+iWager+","+window.GetPriceNameByType(iWagerType);
					if (toint(iWager) > 0)
					{
						window.WriteChat7(1021,""+_text);//挑战金已修改为%0%1！
					}
					
					window.g_WagerValue = iWager;
					parent.s_Wager.SetData(iWager);
					break;
				}
				case 36:
				{
					break;
				}
			}
		}
	}

	//自动准备是否成功，失败将继续准备直到准备成功
	void CheckReady()
	{
		killtimer("checkReady");
		window.g_Row.InitByInt(window.M_G_SERVER, window.USERDT, window.M_G_SERVER_USERDT_UID,window.GetMyUID());
		if (!window.g_Row.IsReady()) 
		{
			printf("B# >>>>房间-Error-CheckReady()：if (!window.g_Row.IsReady()) ");
			window.g_Row.Release();
			return;
		}
		var _ready = window.g_row.GetData(window.M_G_SERVER_USERDT_READY);
		if (toint(_ready) != 2)
		{
			StartReady();
		}
	}

	//GM自动开始房间中有人进来就自动准备
	void StartReady()
	{
		OnClick_BtnReady(2);
		timer(2000,"CheckReady","checkReady");
	}

	//[功能]判断网速情况
	//[返回值]正常1,有人差0,有人不通-1
	void Judge_Ping()
	{
		var _VNet2DBTable = new VNet2DBTable{}
		var _SQL = "SELECT * FROM userdt WHERE did=" + window.GetMyRoomID()+" AND usersta=2 AND p2pping<"+window.g_Ping_01;
		_VNet2DBTable.Select(window.M_G_SERVER, _SQL);
		var _size = _VNet2DBTable.GetSize();
		printf("B# Judge_Ping:网络不通的有:"+_size);
		if (_size > 0) 
		{
			_VNet2DBTable.del(); 
			return -1;
		}
		_SQL = "SELECT * FROM userdt WHERE did=" + window.GetMyRoomID()+" AND usersta=2 AND p2pping>"+window.g_Ping_45;
		_VNet2DBTable.Select(window.M_G_SERVER, _SQL);
		_size = _VNet2DBTable.GetSize();
		_VNet2DBTable.del();
		printf("B# Judge_Ping:网络差的有:"+_size);
		if (_size > 0) return 0;
		return 1;
	}
};