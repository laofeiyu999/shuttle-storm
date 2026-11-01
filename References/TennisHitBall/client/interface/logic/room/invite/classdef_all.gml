//房间-邀请-全部类定义
//yxf 2008年10月23日

importex("$./../../../UI/Room/Invite/ClassDef_All.gml");
importex("$./ClassDef_All_DBList.gml");

class VRoomInvite_All_Loigc item
{
	size = "100%,100%";alpha = 50;bgcolor = "#FF00";
	var m_IsMsgReturn = 1;	//消息是否返回 决定是否可以继续发消息
	//=============================与界面交互========================================
	void Init()
	{
		//邀请-全部:翻页
		staticvar s_PageCtrl = new VMyPageCtrl
		{
			valign(100,0);halign(50,0);
		}
		//邀请：按钮
		staticvar s_Btn_Invite = new VMyButton
		{
			Init("邀请");valign(80,0);halign(40,0);
		}
	}
	inclass("VRoomInvite_All_UI");//界面显示类
	//==============================function=========================================
	//点击了邀请
	void OnClick_Invite()
	{
		var _RoleRow = _AllList.curselectrow();
		var _UserID = _AllList.fieldstr(_RoleRow,window.M_G_SERVER_USERDT_UID); //玩家ID
		
		if (_UserID <= 0)
		{
			window.find("UIController").LoadDLG(151);//您未选择任何一个邀请对象！
			return;
		}
		//发出邀请某人加入房间消息:对方用户id
		window.Too_IRequestToRoom(_UserID);

		//parent.parent.del();
	}

	//设置响应事件
	void SetEvent()
	{
		set s_Btn_Invite//邀请：按钮
		{
			void OnPressed()
			{
				if (GetState() == window.USER_STATE_REDAY) //亮的时候才能点
				{
					parent.OnClick_Invite();
				}
			}
			SetState(window.USER_STATE_WAIT);//按钮为灰的
		}

		set s_PageCtrl//邀请-全部:翻页
		{
			//targetname="VInvite_All_List_Logic_NAME";
			//countperpage = 10;
			//window.find("G_DBMANAGE").GetRegDbTable(this,"Bind_VInvite_All_List_Logic");// 获得已绑定的数据表
			
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
				killtimer("Room_InviteList_timer");
				timer(5000,"TimerUpdate","Room_InviteList_timer");

				ShowLoad(false);
				if (parent.m_IsMsgReturn == 0)
				{
					printf("RefreshInviteList:SendNetMsg(2):消息未返回，请求失败！_MsgPage:"+_MsgPage);
					return;
				}

				parent.m_IsMsgReturn = 0;
				ShowLoad(true);

				//取邀请列表
				var _param = ""+window.GetMyUID()+","+_MsgPage+","+window.GetInviteListHash(_MsgPage);
				window.Tos_RefreshInviteList(_param);
			}

			void TimerUpdate()
			{
				SendNetMsg(m_CurrPage);
			}
		}

	}
	//================================DBList=========================================

	Init();

	var _AllList = new VInvite_All_List_Logic
	{
		name = "VInvite_All_List_Logic_NAME";
	
		window.find("G_DBMANAGE").RegDbTable(this,window.M_G_SERVER,window.USERDT_INVITE,"Bind_VInvite_All_List_Logic");// 绑定数据表

		void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);} //移除绑定

		void PageviewEnd() // 翻页结束后调用
		{
			//checkselect(-1,-1);
		}

		//定时刷新-玩家列表
		void TimerSelect()
		{
			var _SQL = "SELECT * FROM "+window.USERDT_INVITE+" WHERE uid>"+window.GetMyUID()+" AND rid>0 AND UserType=0 AND gamesta=1 OR uid<"+window.GetMyUID()+" AND rid>0 AND UserType=0 AND gamesta=1";
			window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VInvite_All_List_Logic",window.M_G_SERVER,_SQL);
			scriptprcallsub("OnUnSelect");
		}
		TimerSelect();
	}

	SetEvent(); //必须先有list再有翻页的事件-否则会不显示页数

	//刷新结束
	void OnUpDateListFinish(askpage,AllPage,result)
	{
		//printf("RefreshInviteList::SendNetMsg(3)刷新结束:askpage:"+askpage+",AllPage:"+AllPage+",result:"+result);

		m_IsMsgReturn = 1;
		s_PageCtrl.ShowLoad(false);
		
		_AllList.checkselect(-1,-1);
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