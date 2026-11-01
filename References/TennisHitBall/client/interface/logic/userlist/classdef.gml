//玩家列表 类定义
//yxf 2009年10月15日

importex("$./ClassDef_DBList.gml");
importex("$./../../UI/UserList/ClassDef.gml");

class VUserList_Logic item
{
	size = "70%,65%";pos(0,50);bgcolor = "#FF";alpha = 50;
	var m_IsMsgReturn = 1;	//消息是否返回 决定是否可以继续发消息
	//=============================与界面交互========================================
	void Init()
	{
		//关闭：按钮
		staticvar s_Btn_Close = new VMyButton
		{
			pos = "680,0";Init("X");size = "30,30";
		}	
		//帮助：按钮
		staticvar s_Btn_Help = new VMyButton
		{
			pos(640,0);Init("？");size = "30,30";
		}
		//社交-全部:翻页
		staticvar s_PageCtrl = new VMyPageCtrl
		{
			valign(100,0);halign(50,0);
		}
	}
	inclass("VUserList_UI");//界面显示类
	//==============================function=========================================
	//点击了关闭
	void OnClick_BtnClose()
	{
		parent.del();
	}
	//点击了前往房间
	void OnClick_GoRoom()
	{
		var _RoleRow = _AllList.curselectrow();
		//var _RoomID = _AllList.fieldstr(_RoleRow,window.M_G_SERVER_USERDT_DID); //房间ID
		//var _UserID = _AllList.fieldstr(_RoleRow,window.M_G_SERVER_USERDT_UID); //UserID
		var _NkName = _AllList.fieldstr(_RoleRow,window.M_G_SERVER_USERDT_NKNAME); //玩家昵称

		//获得用户的房间号 2009年2月4日
		window.Too_GetUserDid(_NkName);
	}
	//点击了加为好友
	void OnClick_AddFriend()
	{
		window.LMH1_ClickSocial_AddFriend();//引导事件

		var _RoleRow = _AllList.curselectrow();
		var _NkName = _AllList.fieldstr(_RoleRow,window.M_G_SERVER_USERDT_NKNAME); //玩家昵称

		window.AddFriend(_NkName);
	}
	//设置响应事件
	void SetEvent()
	{
		set s_Btn_Close
		{
			void OnPressed(){parent.OnClick_BtnClose();}
		}
		set s_Btn_Help
		{
			void OnPressed(){window.CallBack_Help(window.POS_USERLIST);}
		}
		set s_PageCtrl//翻页：全部
		{
			//targetname="VUserList_List_LogicNAME";
			//countperpage = 10;
			//window.find("G_DBMANAGE").GetRegDbTable(this,"Bind_VUserList_List_Logic");// 获得已绑定的数据表
			
			void OnClickL_UserDef()
			{
				var _Page = toint(m_CurrPage) - 1;
				if (_Page >= 0)
				{
					SendNetMsg(_Page);
				}
			}
			void OnClickR_UserDef()
			{
				var _Page = toint(m_CurrPage) + 1;
				if (_Page < m_AllPage)
				{
					SendNetMsg(_Page);
				}
			}
			
			//发出消息
			void SendNetMsg(_MsgPage)
			{
				//printf("RefreshPlayList:SendNetMsg(1):_MsgPage:"+_MsgPage);
				killtimer("Hall_AllUserList_timer");
				timer(5000,"TimerUpdate","Hall_AllUserList_timer");

				ShowLoad(false);
				if (parent.m_IsMsgReturn == 0)
				{
					printf("RefreshPlayList:SendNetMsg(2):消息未返回，请求失败！_MsgPage:"+_MsgPage);
					return;
				}

				parent.m_IsMsgReturn = 0;
				ShowLoad(true);

				//取玩家列表
				var _param = ""+window.GetMyUID()+","+_MsgPage+","+window.GetUserListHash(_MsgPage);
				window.Tos_RefreshPlayList(_param);
			}

			void TimerUpdate()
			{
				SendNetMsg(m_CurrPage);
			}
		}
	}
	//================================DBList=========================================

	Init();

	var _userList = new VUserList_List_Logic
	{
		SetNeedReport = 1;//是否需要通知其他数据-当其中一条数据删除时
		name = "VUserList_List_LogicNAME";
	
		window.find("G_DBMANAGE").RegDbTable(this,window.M_G_SERVER,window.USERDT_USER,"Bind_VUserList_List_Logic");// 绑定数据表

		void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);} //移除绑定

		void PageviewEnd() // 翻页结束后调用
		{
			//printf("B# 社交-全部玩家列表，PageviewEnd\n");
			//checkselect(-1,-1);
		}
		//定时刷新-玩家列表
		void TimerSelect()
		{
			var _SQL = "SELECT * FROM "+window.USERDT_USER+" WHERE rid>0 AND gamesta>0 AND UserType=0";// AND uid<>"+window.GetMyUID();
			//var _SQL = "SELECT * FROM userdt_user WHERE rid>0 AND gamesta>0 AND UserType=0 AND uid<"+window.GetMyUID()+" OR rid>0 AND gamesta>0 AND UserType=0 AND uid>"+window.GetMyUID();
			window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VUserList_List_Logic",window.M_G_SERVER,_SQL);
			scriptprcallsub("OnUnSelect");
		}
		TimerSelect();
	}

	SetEvent(); //必须先有list再有翻页的事件-否则会不显示页数

	//刷新结束
	void OnUpDateListFinish(askpage,AllPage,result)
	{
		//printf("RefreshPlayList::SendNetMsg(3)刷新结束:askpage:"+askpage+",AllPage:"+AllPage+",result:"+result);

		m_IsMsgReturn = 1;
		s_PageCtrl.ShowLoad(false);
		
		_userList.checkselect(-1,-1);
		if (toint(result) == -2)	//请求间隔过快
		{	
			s_PageCtrl.ShowLoad(true);
			s_PageCtrl.SetLoadSrc("操作太频繁");
			return;
		}
		
		s_PageCtrl.OnPageExchange_New(askpage,AllPage);
	}
	
	void OnCreated()
	{
		s_PageCtrl.SendNetMsg(0);
	}
};