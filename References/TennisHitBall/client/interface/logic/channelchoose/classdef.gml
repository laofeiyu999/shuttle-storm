//
//频道界面左边服务器的逻辑部分类定义
//

import("$./ClassDef_ServerList.gml");
importex("$./../../UI/ChannelChoose/ClassDef.gml");

class VChannelChoose_Logic item
{
	window.g_FCM = 0;//清除当前是否进入不健康游戏时间状态
	size = "420,600";bgcolor = "#FF00";alpha = 65;
	var m_SvID = -1;	//几下这个服务器ID
	var m_CanClick = false; //是否能点击按钮
	//=========================与界面交互=========================
	void Init()
	{
		//进入：按钮
		staticvar s_Btn_Enter = new VMyButton
		{
			valign(98,0);halign(50,0);
			Init("进入");
		}
		//翻页：换服务器
		staticvar s_PageCtrl = new VMyPageCtrl
		{
			valign(90,0);halign(50,0);
		}
	}
	
	inclass("VChannelChoose_UI");//界面显示类
	//============================function===============================
	Init();
	//点击了进入-或者双击服务器
	void OnClick_BtnEnter()
	{
//		if (!m_CanClick)
//		{	
//			printf("B# 还没有服务器列表呢，就按回车，变态！");
//			return;
//		}
		
		//判断是否连上好友服务器 2010年5月11日 yxf
		//0为没有登陆成功，1为登陆成功
		/*if (window.g_EmptyRole==0 && toint(window.find("friendsys")._loginok) == 0)
		{
			window.find("UIController").LoadDLG(126); //未连接到好友服务器，不能进入游戏！
			return;
		}*/

		var _irow = _ServerList.curselectrow();
		var _svType = _ServerList.fieldstr(_irow,window.GAMEUI_GAMESERVER_SVRTYPE);
		window.SetSerType(_svType);	//记下服务器类型
		m_SvID = _ServerList.fieldstr(_irow,window.GAMEUI_GAMESERVER_SVRID);
		window.g_ChannelServerID = m_SvID;
		var _SevName = _ServerList.fieldstr(_irow,window.GAMEUI_GAMESERVER_SVRNAME);  //name
		
		if (_SevName == 0 || _SevName == "")
		{
			window.find("UIController").LoadDLG(321); //请选择服务器！
			return;
		}

		//发出取服务器信息消息：服务器ID，用户的称号
		var _Param = m_SvID+","+window.GetMyQualify();
		window.Too_GetServerInfo(_Param);
		parent.Check_IfSevRes_ChannelChoose();
	}
	//设置响应事件
	void SetEvent()
	{
		set s_Btn_Enter//进入：按钮
		{
			void OnPressed()
			{
				if (GetState() == window.BTN_STATE_LIGHT) //亮的时候才能点
				{
					parent.OnClick_BtnEnter();
				}	
			}
			SetState(window.BTN_STATE_GREY);//进入按钮为灰的
		}
		set s_Btn_Help
		{
			void OnPressed(){window.CallBack_Help(window.POS_CHANNELCHOOSE);}
		}
//		set s_PageCtrl//翻页：换服务器
//		{
//			targetname="VChannelChoose_ServerList_Logic_NAME";
//			countperpage = 13;
//			window.find("G_DBMANAGE").GetRegDbTable(this,"Bind_VChannelChoose_ServerList_Logic");// 获得已绑定的数据表
//
//			void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);} //移除绑定
//		}
	}
	//Select条件：点击标签时调用
	//1新手,2资格赛,3巡回赛,4黄金赛,5大师赛,6大满贯,7大奖赛
	void SelectServerByType()
	{
		var _SQL = "SELECT * FROM "+window.GAMESERVER+" WHERE SvrType<="+window.G_SERVERTYPE_7_PRIX+" AND OLNum>=0 AND ShowSv>0 ORDER BY SvrID ASC";
		printf("B# GC:"+_SQL);
		window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VChannelChoose_ServerList_Logic",window.GAMEUI,_SQL);
		
//		s_PageCtrl.setpageto(1);//强制翻到第一页

		_ServerList.checkselect(10,10);
	}
	//=====================================DBList======================================

	var _ServerList = new VChannelChoose_ServerList_Logic
	{
		name = "VChannelChoose_ServerList_Logic_NAME";
	
		window.find("G_DBMANAGE").RegDbTable(this,window.GAMEUI,window.GAMESERVER,"Bind_VChannelChoose_ServerList_Logic");// 绑定数据表

		void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);} //移除绑定

		void PageviewEnd() // 翻页结束后调用
		{
			//printf("B# 服务器列表，PageviewEnd\n");
			checkselect(10,10);
		}
	}

	SetEvent(); //必须先有list再有翻页的事件-否则会不显示页数
	SelectServerByType();

		var _VNet2DBRow = new VNet2DBRow{};
		_VNet2DBRow.InitByInt(window.M_G_SERVER,window.RELATION,window.M_G_SERVER_RELATION_BID,window.GetMyUID());
		if ( _VNet2DBRow.IsReady())
		{
			_VNet2DBRow.SetInt(window.M_G_SERVER_RELATION_WCOUPLE,0);
			_VNet2DBRow.UpdateEnd();
		}
		else
		{
			_VNet2DBRow.InitByInt(window.M_G_SERVER,window.RELATION,window.M_G_SERVER_RELATION_SID,window.GetMyUID());
			if (_VNet2DBRow.IsReady())
			{
				_VNet2DBRow.SetInt(window.M_G_SERVER_RELATION_WCOUPLE,0);
				_VNet2DBRow.UpdateEnd();
			}
		}
		_VNet2DBRow.del();
};