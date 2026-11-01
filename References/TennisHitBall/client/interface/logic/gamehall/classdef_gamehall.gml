//
//大厅 界面的(普通模式)类定义
//

importex("$./../../UI/GameHall/ClassDef_GameHall.gml");

//房间列表+	
import("$./ClassDef_RoomList.gml");
importex("$./ClassDef_RandGame_DBList.gml");

//房间列表+	创建房间+快速加入
class VGameHall_Logic item
{
	//size = "70%,60%";pos(0,50);bgcolor = "#FF";alpha = 50;
	//valign(40,0);halign(50,0);

	var m_DisplayType = 0;	//显示的类型 0全部 1等待 2观战

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
//		//竞技单打：按钮
//		staticvar s_Btn_Competitive_Singles = new VMyButton
//		{
//			Init("竞技单打");pos = "50,0";
//		}
//		//竞技双打：按钮
//		staticvar s_Btn_Competitive_Doubles = new VMyButton
//		{
//			Init("竞技双打");pos = "150,0";
//		}
		//创建房间：按钮
		staticvar s_Btn_CreateRoom = new VMyButton
		{
			Init("创建房间");pos = "380,0";
		}
		//创建房间：按钮
		staticvar s_Btn_FindRoom = new VMyButton
		{
			Init("查找房间");pos = "480,0";
		}
		//房间列表:翻页
		staticvar s_PageCtrl = new VMyPageCtrl
		{
			valign(100,0);halign(50,0);
		}
		//显示全部房间：Radio
		staticvar s_R_AllRoom = new VMyRadio
		{
			Init("显示全部房间",0);pos = "35,50";size = "150,30";
		}
		//只显示等待房间：Radio
		staticvar s_R_WaitRoom = new VMyRadio
		{
			Init("只显示等待房间",0);pos = "200,50";size = "150,30";
		}
		//只显示观战房间：Radio
		staticvar s_R_LookRoom = new VMyRadio
		{
			Init("只显示观战房间",0);pos = "370,50";size = "150,30";
		}
	}
	inclass("VGameHall_UI");//界面显示类
	//==============================function=========================================
	//点击了关闭
	void OnClick_BtnClose()
	{
		parent.del();
	}
	//点击了快速加入
	//参数 type:1网球竞技单 2网球竞技双 3网球道具单 4网球道具双
	void OnClick_FastJoinRoom(type)
	{
		//发出快速加入消息：用户id 房间id 游戏类型 房间密码
		var _Param = ""+window.GetMyUID()+ ",-1,"+type+",";
		window.Too_FastJoinRoom(_Param,-1);
	}
	//点击了创建房间
	void OnClick_BtnCreateRoom()
	{
		window.find("UIController").LoadUI("UI_CREATEROOM"); 
	}
	//点击了查找房间
	void OnClick_BtnFindRoom()
	{
		window.find("UIController").LoadUI("UI_FINDROOM"); 
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
			void OnPressed(){window.CallBack_Help(window.POS_GAMEHALL);}
		}
//		set s_Btn_Competitive_Singles//竞技单打：按钮
//		{
//			void OnPressed(){parent.OnClick_FastJoinRoom(1);}
//		}
//		set s_Btn_Competitive_Doubles//竞技双打：按钮
//		{
//			void OnPressed(){parent.OnClick_FastJoinRoom(2);}
//		}
		set s_Btn_CreateRoom
		{
			void OnPressed(){parent.OnClick_BtnCreateRoom();}
		}
		set s_Btn_FindRoom
		{
			void OnPressed(){parent.OnClick_BtnFindRoom();}
		}
		set s_PageCtrl//房间列表:翻页
		{
			targetname="VHall_RoomList_Logic_NAME";
			countperpage = 12;
			window.find("G_DBMANAGE").GetRegDbTable(this,"Bind_VHall_RoomList_Logic");// 获得已绑定的数据表
		}
		set s_R_AllRoom//显示全部房间：Radio
		{
			groupname="VHall_RoomType_Group";
			startstate="1";
			void OnCheck()
			{
				MouseCheck();
				parent.m_DisplayType = 0;
				parent.SelectRoomByType();
			}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_R_WaitRoom//只显示等待房间：Radio
		{
			groupname="VHall_RoomType_Group";
			void OnCheck()
			{
				MouseCheck();
				parent.m_DisplayType = 1;
				parent.SelectRoomByType();
			}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_R_LookRoom//只显示观战房间：Radio
		{
			groupname="VHall_RoomType_Group";
			void OnCheck()
			{
				MouseCheck();
				parent.m_DisplayType = 2;
				parent.SelectRoomByType();
			}
			void OnUnCheck(){MouseUnCheck();}
		}
	}
	//Select条件：点击标签时调用
	//参数 type:
	//网球比赛：0未知 1网球竞技单 2网球竞技双 3网球道具单 4网球道具双
	//0全部房间：网球比赛
	//1只显示等待房间：desksta 0未知 1游戏中 2等待中 3结算中
	//2只显示观战房间：canlook gamestartlook
	void SelectRoomByType()
	{
		var _SQL = "";
		switch (m_DisplayType)
		{
			case 0:
			{
				_SQL = "SELECT * FROM deskdt WHERE desktype>=1 AND desktype<=2 AND deskid>="+toint(window.g_ChannelServerID)*1000+" AND deskid<="+(toint(window.g_ChannelServerID)*1000+999)+
					" OR desktype=10 AND deskid>="+toint(window.g_ChannelServerID)*1000+" AND deskid<="+(toint(window.g_ChannelServerID)*1000+999)+" ORDER BY deskid ASC";break;
			}
			case 1:
			{
				_SQL = "SELECT * FROM deskdt WHERE desktype>=1 AND desktype<=2 AND deskid>="+toint(window.g_ChannelServerID)*1000+" AND deskid<="+(toint(window.g_ChannelServerID)*1000+999)+" AND desksta=2"+
					" OR desktype=10 AND deskid>="+toint(window.g_ChannelServerID)*1000+" AND deskid<="+(toint(window.g_ChannelServerID)*1000+999)+" AND desksta=2 ORDER BY deskid ASC";break;
			}
			case 2:
			{
				_SQL = "SELECT * FROM deskdt WHERE desktype>=1 AND desktype<=2 AND deskid>="+toint(window.g_ChannelServerID)*1000+" AND deskid<="+(toint(window.g_ChannelServerID)*1000+999)+" AND desksta=1 AND canlook=1 AND gamestartlook=1 ORDER BY deskid ASC";break;
				//" OR desktype=10 AND deskid>="+toint(window.g_ChannelServerID)*1000+" AND deskid<="+(toint(window.g_ChannelServerID)*1000+999)+" AND desksta=1 AND canlook=1 AND gamestartlook=1 ORDER BY deskid ASC";break;//情侣房间的观战暂时不在游戏大厅中的观战列表中出现
			}
		}
		printf("yxf:HallRoom:"+_SQL);
		window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VHall_RoomList_Logic",window.M_G_SERVER,_SQL);

		s_PageCtrl.setpageto(1);//强制翻到第一页
	}
	//================================DBList=========================================
	Init();
	
	var _RoomList = new VHall_RoomList_Logic
	{
		name = "VHall_RoomList_Logic_NAME";
	
		window.find("G_DBMANAGE").RegDbTable(this,window.M_G_SERVER,window.DESKDT,"Bind_VHall_RoomList_Logic");// 绑定数据表

		void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);} //移除绑定

		void PageviewEnd(){}
	}	
	
	var _RandGameList = new VGameHall_RandGame_Logic
	{
		name = "VGameHall_RandGame_Logic_NAME";

		window.find("G_DBMANAGE").RegDbTable(this,window.M_G_SERVER,window.ARENARACE,"Bind_VGameHall_RandGame_Logic");// 绑定数据表
		
		void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);} //移除绑定
		
		var _SQL = "SELECT * FROM arenaRace WHERE pvpsv_num>0 and createRoomType=2 and queuetype<3 and activity_state>"+window.g_ACTIVITY_OPEN;
		window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VGameHall_RandGame_Logic",window.M_G_SERVER,_SQL);
	}

	SetEvent();//必须先有list再有翻页的事件-否则会不显示页数
};