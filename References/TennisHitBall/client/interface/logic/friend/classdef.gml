//好友类定义
//yxf 2009年10月20日

importex("$./../../UI/Friend/ClassDef.gml");
importex("$./ClassDef_DBList.gml");

class VFriend_Logic item
{
	size = "70%,65%";pos(0,50);bgcolor = "#F0F0";alpha = 50;
	var m_Relation = 0;	//关系 1好友 2黑名单
	//=============================与界面交互========================================
	void Init()
	{
		//好友：Radio
		staticvar s_R_Friend = new VMyRadio
		{
			Init("好友");pos="8,18";
		}
		//黑名单:Radio
		staticvar s_R_Blacklist = new VMyRadio
		{
			Init("黑名单");pos="110,18";
		}
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

		//社交-好友:翻页
		staticvar s_PageCtrl = new VMyPageCtrl
		{
			pos="260,418";
		}
		//前往房间：按钮
		staticvar s_Btn_GoRoom = new VMyButton
		{
			Init("前往房间");pos="13,449";
		}
		//添加好友：按钮
		staticvar s_Btn_AddFriend = new VMyButton
		{
			Init("添加好友");pos="166,454";
		}
		//添加黑名单：按钮
		staticvar s_Btn_AddBlackList = new VMyButton
		{
			Init("添加黑名单");pos="301,454";
		}
		//删除好友：按钮
		staticvar s_Btn_DelFriend = new VMyButton
		{
			Init("删除好友");pos="432,454";
		}
		//删除黑名单：按钮
		staticvar s_Btn_DelBlackList = new VMyButton
		{
			Init("删除黑名单");pos="562,451";
		}
	}
	inclass("VFriend_UI");//界面显示类
	//==============================function=========================================
	//点击了关闭
	void OnClick_BtnClose()
	{
		parent.del();
	}
	//点击了前往房间
	void OnClick_GoRoom()
	{
		var _RoleRow = _FriendList.curselectrow();
		//var _JID = _FriendList.fieldstr(_RoleRow,window.M_G_SERVER_FRIENDDT_JID); //UserID
		var _NkName = _FriendList.fieldstr(_RoleRow,window.M_G_SERVER_FRIENDDT_NKNAME); //UserID

		//获得用户的房间号 2009年2月4日
		window.Too_GetUserDid(""+_NkName);
	}
	//点击了添加好友
	void OnClick_AddFriend()
	{
		window.find("UIController").LoadDLG2(81);//添加好友
	}
	//点击了添加黑名单
	void OnClick_AddBlackList()
	{
		window.find("UIController").LoadDLG2(82);//添加黑名单
	}
	//点击了删除好友 或者黑名单
	void OnClick_DelFriendBlack()
	{
		var _RoleRow = _FriendList.curselectrow();
		var _NkName = _FriendList.fieldstr(_RoleRow,window.M_G_SERVER_FRIENDDT_NKNAME); //昵称

		window.DelFriend(_NkName);
		_FriendList.scriptprcallsub("OnUnSelect");
		//SetBtnState();
	}
	//点击删除好友 或者黑名单操作后按钮的状态变化
	void SetBtnState()
	{
		switch (m_Relation)
		{
			case 1:
			{
				s_Btn_AddFriend.show = true;
				s_Btn_DelFriend.show = false;
				break;
			}
			case 2:
			{
				s_Btn_AddBlackList.show = true;
				s_Btn_DelBlackList.show = false;
				break;
			}
		}
	}
	//初始化显示：所有都隐藏
	void InitShow()
	{
		s_Btn_AddFriend.show = false;
		s_Btn_AddBlackList.show = false;
		s_Btn_DelFriend.show = false;
		s_Btn_DelBlackList.show = false;
	}

	//好友，黑名单 的切换
	//参数 type：类型 1好友，2黑名单
	void ChangeType(type)
	{
		m_Relation = type;
		InitShow();
		/*switch (type)
		{
			case 0:{s_Btn_AddFriend.show = true;break;}
			case 1:{s_Btn_AddBlackList.show = true;break;}
		}*/
		if(toint(type)==toint(window.FRIEND_FRIEND))
		{
			window.LMH1_OnCheck_R_Social_Friend();//引导事件
			s_Btn_AddFriend.show = true;
		}
		if(toint(type)==toint(window.FRIEND_BLACKLIST))
		{
			window.LMH1_OnCheck_R_Social_BlackList(); //引导事件
			s_Btn_AddBlackList.show = true;
		}
		RelationSelect();
		UI_ShowPage();
		s_PageCtrl.setpageto(1);//强制翻到第一页
	}

	//设置响应事件
	void SetEvent()
	{
		set s_PageCtrl//翻页：好友黑名单
		{
			targetname="VFriend_List_Logic_NAME";
			countperpage = 10;
			window.find("G_DBMANAGE").GetRegDbTable(this,"Bind_VFriend_List_Logic");// 获得已绑定的数据表

			var _CurPage = 0;
			void GetCurNum(num)
			{
				if (_CurPage == num){return;}
				_CurPage = num;
//				alert("yxf:好友的翻页：ShowPage:"+_CurPage+",m_Relation:"+parent.m_Relation);
				//参数1：当前页数
				//参数2 m_Relation 0好友 1黑名单
				//参数3 1显示离线玩家 0不显示离线玩家
				//window.find("friendsys").ShowPage(num, parent.GetSql());
			}
		}
		set s_Btn_GoRoom//前往房间：按钮
		{
			void OnPressed()
			{
				if (GetState() == window.USER_STATE_REDAY) //亮的时候才能点
				{
					parent.OnClick_GoRoom();
				}
			}
			SetState(window.USER_STATE_WAIT);//按钮为灰的
		}
		set s_Btn_AddFriend//添加好友：按钮
		{
			void OnPressed(){parent.OnClick_AddFriend();}
		}
		set s_Btn_AddBlackList//添加黑名单：按钮
		{
			void OnPressed(){parent.OnClick_AddBlackList();}
		}
		set s_Btn_DelFriend//删除好友：按钮
		{
			void OnPressed(){parent.OnClick_DelFriendBlack();}
		}
		set s_Btn_DelBlackList//删除黑名单：按钮
		{
			void OnPressed(){parent.OnClick_DelFriendBlack();}
		}

		set s_R_Friend//好友：Radio
		{
			groupname="VSocial_Type_Group";startstate="1";
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();
				parent.ChangeType(1);
			}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_R_BlackList//黑名单：Radio
		{
			groupname="VSocial_Type_Group";
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();
				parent.ChangeType(2);
			}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_Btn_Close
		{
			void OnPressed(){parent.OnClick_BtnClose();}
		}
		set s_Btn_Help
		{
			void OnPressed()
			{
				window.CallBack_Help(window.POS_FRIEND,parent.m_Relation);
			}
		}
	}
	//================================DBList=========================================
	void GetSql()
	{
		var _SQL = "SELECT * FROM FriendDT WHERE Relation="+m_Relation+" AND delete=0 ORDER BY State DESC";
		return _SQL;
	}
	//关系 
	void RelationSelect()
	{
		var _SQL = GetSql();
		//printf("B# 好友-黑名单:_SQL："+_SQL);
		window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VFriend_List_Logic",window.M_G_SERVER,_SQL);
		_FriendList.scriptprcallsub("OnUnSelect");
	}
	//点击好友或黑名单后调ShowPage
	void UI_ShowPage()
	{
		var _pagenum = toint(s_PageCtrl._CurPage);
		if (_pagenum <= 0)
		{
			_pagenum = 1;
		}
		//window.find("friendsys").ShowPage(_pagenum, GetSql());
	}
	//定时刷新-好友列表
	void TimerUpDate()
	{
		while(1)
		{
			RelationSelect();
			sleep(10000);
		}
	}
	
	Init();

	var _FriendList = new VFriend_List_Logic
	{
		SetNeedReport = 1;//是否需要通知其他数据-当其中一条数据删除时
		name = "VFriend_List_Logic_NAME";
	
		window.find("G_DBMANAGE").RegDbTable(this,window.M_G_SERVER,window.FRIENDDT,"Bind_VFriend_List_Logic");// 绑定数据表

		void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);} //移除绑定

		void PageviewEnd() // 翻页结束后调用
		{
			//printf("B# 社交-好友黑名单列表，PageviewEnd\n");
			checkselect(-1,-1);
		}
	}

	SetEvent(); //必须先有list再有翻页的事件-否则会不显示页数

	TimerUpDate();	//定时刷新
};