//
//活动场 > 活动列表
//yxf 2009年10月16日

importex("$./../../UI/Arena/ClassDef_Activity.gml");
importex("$./ClassDef_Activity_DBList.gml");

class VArena_Activity_Logic item
{
	name = "VArena_Activity_Logic";
	size = "98%,90%";
	pos(0,40);bgcolor = "#00F0F0";alpha = 50;
	//=============================与界面交互========================================
	void Init()
	{
		//查看活动
		staticvar s_Btn_LookOver = new VMyButton
		{
			Init("查看活动");valign(100,0);halign(100,0);
		}

		//报名
		staticvar s_Btn_Apply = new VMyButton
		{
			Init("报名");valign(100,0);halign(80,0);
		}
		//取消
		staticvar s_Btn_Cancel = new VMyButton
		{
			Init("取消");valign(100,0);halign(60,0);
		}
	}
	inclass("VArena_Activity_UI");//界面显示类
	//==============================function=========================================
	Init();
	
	//点击了查看活动-双击了活动
	void OnClick_LookOver()
	{
		window.LMH1_Arena_LookOver();	//引导事件
		
		var _RaceRow = _ActivityList.curselectrow();
		window.g_ArenaSelectRaceID = _ActivityList.fieldstr(_RaceRow,window.M_G_SERVER_ARENARACE_ID);

		window.find("UIController").LoadUI("UI_ARENA_LOOKOVER");
		window.find("ARENA_LOOKOVER_LOGIC")._LookOver.GetDataFromDB(window.g_ArenaSelectRaceID);
	}

	//点击了报名按钮
	void OnClick_Apply()
	{
		var _RaceRow = _ActivityList.curselectrow();
		window.g_ArenaSelectRaceID = _ActivityList.fieldstr(_RaceRow,window.M_G_SERVER_ARENARACE_ID);
		
		OnConfirm_Apply();
	}
	
	//确认要报名
	void OnConfirm_Apply()
	{	
		if (window.g_ArenaSelectRaceID <= 0)
		{
			printf("B# error-活动:OnConfirm_Apply()ID错误:"+window.g_ArenaSelectRaceID);
			return;
		}
		printf("B# 活动:OnConfirm_Apply()ID:"+window.g_ArenaSelectRaceID);

		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByInt(window.M_G_SERVER,window.ARENARACE,window.M_G_SERVER_ARENARACE_ID,window.g_ArenaSelectRaceID);
		if (!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			printf("B# error-活动:OnConfirm_Apply()DBname:"+window.M_G_SERVER+",TBName:"+window.ARENARACE+",raceID:"+window.g_ArenaSelectRaceID);
			return;
		}
		var _queueType = _VNet2DBRow.GetData(window.M_G_SERVER_ARENARACE_QUEUETYPE);
		var _condition = _VNet2DBRow.GetData(window.M_G_SERVER_ARENARACE_CONDITION);
		var _MinLv = _VNet2DBRow.GetData(window.M_G_SERVER_ARENARACE_MINLV_UI);
	
		if (_MinLv.__Long__ > window.GetLVByUID())
		{
			window.find("UIController").LoadDLG(503);//等级不够
			_VNet2DBRow.del();
			return;
		}
		_VNet2DBRow.del();
		
		/*
		var _res = window.find("HALLGCMap").find("self").parent.vml(_condition);
		printf("B# 我要报名 _res:"+_res);
		_res = _res.__Long__;
		if (_res == -1)
		{
			window.find("UIController").LoadDLG(502);//金币不足！
			return;
		}
		if(_res == -2)
		{
			window.find("UIController").LoadDLG(503); //等级不足！
			return;
		}*/

		/*活动报名类型
		var	g_eQUDT_NULL		= 0;	//未知
		var	g_eQUDT_USER		= 1;	//玩家ID
		var	g_eQUDT_TEAM		= 2;	//队伍
		var	g_eQUDT_FAMILY		= 3;	//家族*/
		var _UnitID = 0;
		switch (_queueType)
		{
			case 0:break;
			case 1:_UnitID = window.GetMyUID();break;
			case 2:_UnitID = window.GetMyUID();break;
			case 3:_UnitID = window.GetMyUID();break;
		}
		if (_UnitID <= 0)
		{
			window.find("UIController").LoadUI("UI_TEAMSET");
			return;
		}

		//参数：用户id，报名id(玩家ID或者队伍ID)，报名类型(活动ID)
		var _Param = ""+window.GetMyUID()+","+_UnitID+","+window.g_ArenaSelectRaceID;
		window.Tos_ApplyArenaRace(_Param);
	}

	//确定要放弃等待-一个
	void OnConfirm_QuitWait()
	{
		var _RaceRow = _ActivityList.curselectrow();
		var _RaceID = _ActivityList.fieldstr(_RaceRow,window.M_G_SERVER_ARENARACE_ID);
		window.g_OnConfirm_QuitWait(_RaceID);
	}
	//点击了放弃等待,双击了这条数据
	void OnClick_QuitWait()
	{
		var _raceID =  window.GetMyRaceID();
		if (_raceID<500)
		{
			window.find("UIController").LoadDLG(693);//放弃等待将退还一定的报名费，确定要放弃吗？
		}
		else
		{
			window.find("UIController").LoadDLG(30);//放弃等待将不退还报名费，确定要放弃吗？
		}
	}

	//设置响应事件
	void SetEvent()
	{
		set s_Btn_Apply
		{
			name = "BtnName_Arena_Apply";
			void OnPressed()
			{
				if(GetState()==window.BTN_STATE_LIGHT)
				{
					if (window.g_FCM == 1)
						window.find("UIController").LoadDLG(819);
					else
						parent.OnClick_Apply();
				}
			}
			//显示隐藏-查看活动的报名按钮受此影响
			void SetShowOrHide(param)
			{
				show = param;
				if (param)
				{
					SetState(window.BTN_STATE_LIGHT);
				}
				else
				{
					SetState(window.BTN_STATE_GREY);
				}
			}
			
			SetShowOrHide(false);
		}
		set s_Btn_Cancel
		{
			name = "BtnName_Arena_Cancel";
			void OnPressed()
			{
				if(GetState()==window.BTN_STATE_LIGHT){parent.OnClick_QuitWait();}
			}
			show = false;
		}
		set s_Btn_LookOver
		{
			name = "BtnName_Arena_LookOver";
			void OnPressed()
			{
				if(GetState()==window.BTN_STATE_LIGHT)
				{
					parent.OnClick_LookOver();
				}
			}
			SetState(window.BTN_STATE_GREY);
		}
	}

	//报名排序
	void SortRaceList(index)
	{
		var _SQL = "SELECT * FROM arenaRace WHERE pvpsv_num>0 and createRoomType=1 and activity_state>"+window.g_ACTIVITY_OPEN;
		
		//2010年4月27日 yxf 
		//修正BUG 0012974: 【活动】报名单打撮合，然后到活动场，取消报名。活动场中会显示出所有影藏活动的信息。 
//		var _sort = "DESC"; //"ASC","DESC" false 升序 true降序
//		//var _SQL = "SELECT * FROM arenaRace WHERE pvpsv_num>0 and activity_state>="+window.g_ACTIVITY_SIGNING_NORACE+" AND activity_state<="+window.g_ACTIVITY_SIGNING_RACEING;
//		switch (index)
//		{
//			case 0:{break;}
//			case 1:{_SQL += " ORDER BY racemoney "+_sort;break;}
//			case 2:{_SQL += " ORDER BY peoplenum "+_sort;break;}
//			case 3:{_SQL += " ORDER BY Vmoney "+_sort;break;}
//		}
		printf("B# 竞技排序:SortRaceList:"+_SQL);
		window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VArena_ActivityDBList_Logic",window.M_G_SERVER,_SQL);
	}
	//================================DBList=========================================
	var _ActivityList = new VArena_ActivityDBList_Logic
	{
		SetNeedReport = 1;//是否需要通知其他数据-当其中一条数据删除时
		SetNeedSelectOnChange = 0;	// 一行数据改变后是否需要选中最后一行

		name = "VArena_ActivityDBList_Logic_NAME";

		window.find("G_DBMANAGE").RegDbTable(this,window.M_G_SERVER,window.ARENARACE,"Bind_VArena_ActivityDBList_Logic");// 绑定数据表
		
		void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);} //移除绑定
		
		var _SQL = "SELECT * FROM arenaRace WHERE pvpsv_num>0 and createRoomType=1 and activity_state>"+window.g_ACTIVITY_OPEN;
		window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VArena_ActivityDBList_Logic",window.M_G_SERVER,_SQL);
		
		var m_MySize = -1;
		void OnChgSize(listsize)
		{
			if (m_MySize != listsize)
			{
				if (m_MySize != -1)
				{
					//checkselect(-1,-1);
					parent.s_Btn_Apply.SetShowOrHide(false);
					parent.s_Btn_Cancel.show = false;
					parent.s_Btn_LookOver.SetState(window.BTN_STATE_GREY);
				}
				m_MySize = listsize;
			}
		}
	}
	
	SetEvent();//必须先有list再有翻页的事件-否则会不显示页数

	//(监视是否已报名)
	var _RaceTable = new VNet2DBTable{}
	//[功能]得到某个状态的活动数量
	//[参数]_state:活动状态 1-6
	void GetNumByState(state)
	{
		printf("B# GetNumByState():state:"+state);
		var _SQL = "SELECT * FROM arenaRace WHERE pvpsv_num>0 and activity_state>"+window.g_ACTIVITY_CLOSE+" and race_state="+state;
		_RaceTable.Select(window.M_G_SERVER,_SQL);
		return _RaceTable.GetSize();
	}

	void OnCreated()
	{
		_ActivityList.checkselect(50,20);
		OnCreated_UI();
	}
};