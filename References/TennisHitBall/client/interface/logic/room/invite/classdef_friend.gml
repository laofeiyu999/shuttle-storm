//社交-好友黑名单类定义
//yxf 2008年10月16日

importex("$./../../../UI/Room/Invite/ClassDef_Friend.gml");
importex("$./ClassDef_Friend_DBList.gml");

class VRoomInvite_Friend_Loigc item
{
	size = "100%,100%";
	//=============================与界面交互========================================
	void Init()
	{
		//邀请-好友:翻页
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
	inclass("VRoomInvite_Friend_UI");//界面显示类
	//==============================function=========================================
	//点击了邀请
	void OnClick_Invite()
	{
		var _RoleRow = _FriendList.curselectrow();
		var _JID = _FriendList.fieldstr(_RoleRow,window.M_G_SERVER_FRIENDDT_JID); //玩家ID
		
		if (_JID <= 0 || _JID == "")
		{
			window.find("UIController").LoadDLG(151);//您未选择任何一个邀请对象！
			return;
		}
		
		//发出邀请某人加入房间消息:对方用户id
		window.Too_IRequestToRoom(_JID);

		//parent.parent.del();
	}
	//设置响应事件
	void SetEvent()
	{
		set s_PageCtrl//邀请-好友:翻页
		{
			targetname="VInvite_Friend_List_Logic_NAME";
			countperpage = 10;
			window.find("G_DBMANAGE").GetRegDbTable(this,"Bind_VInvite_Friend_List_Logic");// 获得已绑定的数据表
		}
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
	}
	//================================DBList=========================================
	Init();
	var _FriendList = new VInvite_Friend_List_Logic
	{
		name = "VInvite_Friend_List_Logic_NAME";
	
		window.find("G_DBMANAGE").RegDbTable(this,window.M_G_SERVER,window.FRIENDDT,"Bind_VInvite_Friend_List_Logic");// 绑定数据表

		var _SQL = "SELECT * FROM FriendDT WHERE Relation="+window.FRIEND_FRIEND+" AND delete=0 AND CurrChannel="+window.MYDATA.GetChannel();
		
		printf("房间邀请-好友：SQL："+_SQL);

		window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VInvite_Friend_List_Logic",window.M_G_SERVER,_SQL);

		void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);} //移除绑定

		void PageviewEnd() // 翻页结束后调用
		{
			//printf("邀请-好友列表，PageviewEnd\n");
			checkselect(-1,-1);
		}
	}

	SetEvent(); //必须先有list再有翻页的事件-否则会不显示页数
};