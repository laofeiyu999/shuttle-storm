//
//大厅 Logic+UI
//yxf 2009年10月16日
//

importex("$./ClassDef_Socket.gml");
importex("$./ClassDef_Socket_Domain.gml");
import("$./ClassDef_ArenaSocket.gml");
import("$./ClassDef_ArenaSocket_Domain.gml");
importex("$./ClassDef_MsgBox.gml");
import("$./user.gml");
import("$./SaveDBRow.gml"); 
import("$./../Loading/ClassDef_HallWait.gml"); 
importex("$./ClassDef_OnLinePresent.gml"); 
importex("$./ClassDef_MsgMgr.gml"); 
import("$./../Training/ClassDef_MsgBox.gml");
importex("$./ClassDef_HideUI.gml");
importex("$./ClassDef_MainMenu.gml");
importex("$./../CreateRoom/ClassDef_Tennis.gml");
importex("$./../Train/ClassDef_AI.gml");
import("$./../Family/pop/ClassDef_MsgBox.gml");
importex("$./../Friend/pop/ClassDef_MsgBox.gml");

new item
{
	enableUpdate(1);
	size = "100%,100%";name = "HALL_LOGIC";show = false;
	
	new VNet2DBTable
	{
		SetSaveDBRow();
		Init(window.M_G_SERVER,window.USERDT);//玩家列表
	}
	new VNet2DBTable
	{
		SetSaveDBRow();
		Init(window.M_G_SERVER,window.ROLEDT);//角色表
	}

	new VNet2DBTable
	{
		SetSaveDBRow();
		Init(window.M_G_GOODS,window.AWARDCHANGE);//兑换信息
	}
	new VNet2DBTable
	{
		SetSaveDBRow();
		Init(window.M_G_GOODS,window.PLAYERITEMS);//玩家背包
	}	
	new VNet2DBTable
	{
		SetSaveDBRow();
		Init(window.M_G_GOODS,window.LIMITTIMEITEM);//
	}
	new VNet2DBTable
	{
		SetSaveDBRow();
		Init(window.M_G_GOODS,window.PLAYERCOLUMN);//快捷栏
	}
	new VNet2DBTable
	{
		SetSaveDBRow();
		Init(window.M_G_GOODS,window.ITEMPRESENT);//礼品和邮件
	}
	new VNet2DBTable
	{
		SetSaveDBRow();
		Init(window.M_G_SERVER,window.ARENARACE);//竞技赛	
	}
	new VNet2DBTable
	{
		SetSaveDBRow();
		Init(window.M_G_SERVER,window.ARENADATA);//竞技赛排名	
	}
	new VNet2DBTable
	{
		SetSaveDBRow();
		Init(window.M_G_SERVER,window.ACTIVITYGROUP);//组
	}
	new VNet2DBTable
	{
		SetSaveDBRow();
		Init(window.GAMEUI,window.JIVETPINVITELIST);//临时组队
	}
	new VNet2DBTable
	{
		SetSaveDBRow();
		Init(window.TENNIS_GAME,window.TRAIN);
	}
	new VNet2DBTable
	{
		SetSaveDBRow();
		Init(window.GAMEUI,window.MSGREQUESTSELECT);
	}
	new VNet2DBTable
	{
		SetSaveDBRow();
		Init(window.GAME,window.TASKSYNDATA);//任务
	}
	new VNet2DBTable
	{
		SetSaveDBRow();
		Init(window.GAMEUI,window.JIVETPGROUP);//组队-队伍
	}
	//家族排行榜
	new VNet2DBTable
	{
		SetSaveDNRow();
		Init(window.GAMEUI,window.JIVECONSORTIAINI);
	}
	//家族成员信息
	new VNet2DBTable
	{
		SetSaveDNRow();
		Init(window.GAMEUI,window.JIVECONSORTIA);
	}
	//家族申请信息
	new VNet2DBTable
	{
		SetSaveDNRow();
		Init(window.GAMEUI,window.JIVECONSORTIAAPPLY);
	}
	//关系： 情侣 搭档 密友
	new VNet2DBTable
	{
		SetSaveDBRow();
		Init(window.M_G_SERVER,window.RELATION);//组
	}

	//家族在线监视
	window.SetFamilyOnlinePeopleNum();
	
	//明星榜================================================================
	//var g_TopStar = new CTopStar{}//改在进大厅的时候new，出大厅的时候删除
	//GetVerID					返回版本号 0-11
	//SetVerID(type,verID)		设置版本号
	//ReadFile(0-12)			将配置文件的数据写到内存数据库
	//OnReadDBVersion(type,ver)	回调
	var m_TopStar = new CTopStar
	{
		void OnReadDBVersion(type,ver)
		{
			printf("B# 明星榜:OnReadDBVersion()type:"+type+",ver:"+ver);
		}
		void OnCreated()
		{
			//明星榜-发消息：界面调用
			//参数 index：排名方式(0-11),长度-要几条记录（小于0表示所有数据）
//			window.Too_GetSortData(3,10);
//			window.g_CArenaFunction.Begin(m_ID);


			//同步完成的训练,只需要发送一次
			window.Tos_SynAchieveTrain(""+window.GetMyUID());
		}
//		void OnDelete()
//		{
//			window.g_CArenaFunction.DelObj(m_ID);
//		}
//		var m_ID = window.g_CArenaFunction.AddObj(this);
//		name = "CArenaFunction_"+m_ID;
//		var m_Time = 0;
		
//		//程序调用
//		void OnCountTime(sec)
//		{	
//			//printf("B# 排行榜定时;OnCountTime():sec:"+sec+",m_Time:"+m_Time+",_temp:"+_temp);
//			if (sec % window.TOPSTAR_UPDATE_TIME == 0)
//			{
//				//alert("刷新");
//				window.Too_GetSortData(3,10);
//			}
//		}

	}//
	//==========================快捷键==================================
	void AddHallFuckUser()
	{
		window.find("gameinput").AddShortcutUser(this);
	}
	void DelHallFuckUser()
	{
		window.find("gameinput").DelShortcutUser(this);
	}
	AddHallFuckUser();
	void OnDelete()
	{
		window.CXF_OnHallUIDeleted();	//通知引导

		window.g_CArenaFunction.ClearRaceTB(); //清数据
		window.g_CArenaFunction.ClearGroupTB(); //清数据

		DelHallFuckUser();
		
		window.find("friendsys").SetInGame(0);// SendTypeMessage("fr","ingame",0);//scr_OffLine();//离线时通知好友

		//正常退出大厅
		window.Too_Out(""+window.GetMyUID());

		window.find("VHall_HideUI_Logic_Name").del();

		window.find("VSenceBugle_Mgr_Logic_Name").MustHide();
		window.FamilyDataHash = "";
		
		window.find("FamilyOnlinePeopleNum_NAME").del();

		window.g_CArenaFunction.ClearUserDtTB();
	}

	void OnCreated()
	{
		window.find("BuyCarRecord").InitAccount(window.GetMyName());
		window.find("ChargeCarRecord").InitAccount(window.GetMyName());		// add by chenjihui 2011-1-6
		window._charShowFlag = true;
		//活动休整时间倒计时
		staticvar m_ArenaFallowTime = new VArenaCountTime_Logic
		{
			//[功能]返回需要显示的字符串(实例可覆盖)
			//[参数]_str:显示的字符串 "00:12:34" 或 "--"
			void CallBack_SetSrc(_str)
			{
				//printf("B# m_ArenaFallowTime-VArenaCountTime_Logic-CallBack_SetSrc():"+_str);

				if (window.IsHallHtnOpened(window.G_HALLBTN_ARENA))
				{
					window.find("ARENA_LOGIC")._VArena_Logic.m_Class_MyActivity.s_FallowLeaveTime.SetData(_str);
				}
			}

			//[功能]结束时回调
			void CallBack_OnStop()
			{
				//printf("B# m_ArenaFallowTime-VArenaCountTime_Logic-CallBack_OnStop()");
				
				//参数：用户ID，报名ID
				var _Param = ""+window.GetMyUID()+","+window.GetMyRaceID();
				window.Tos_CancelRest(_Param);

				if (window.IsHallHtnOpened(window.G_HALLBTN_ARENA))
				{
					window.find("ARENA_LOGIC")._VArena_Logic.m_Class_MyActivity.s_Btn_BeginQueue.SetState(window.BTN_STATE_GREY);
				}
			}
		}

		//结算剩余时间
		staticvar m_FootLeaveTime = new VArenaCountTime_Logic
		{
			//[功能]返回需要显示的字符串(实例可覆盖)
			//[参数]_str:显示的字符串 "00:12:34" 或 "--"
			void CallBack_SetSrc(_str)
			{
				//printf("B# m_FootLeaveTime-VArenaCountTime_Logic-CallBack_SetSrc():"+_str);

				if (window.IsHallHtnOpened(window.G_HALLBTN_ARENA))
				{
					window.find("ARENA_LOGIC")._VArena_Logic.m_Class_MyActivity.s_FootLeaveTime.SetData(_str);
				}
			}

			//[功能]结束时回调
			void CallBack_OnStop()
			{
				//printf("B# m_FootLeaveTime-VArenaCountTime_Logic-CallBack_OnStop()");

				if (window.IsHallHtnOpened(window.G_HALLBTN_ARENA))
				{
					//window.find("ARENA_LOGIC")._VArena_Logic.m_Class_MyActivity.s_Btn_BeginQueue.SetState(window.BTN_STATE_GREY);
				}
			}
		}

		if (window.GetVipTypeByUID() > 0)
		{
			//Vip礼品
			window.Tos_VipPresent();
		}
	}

	void DI_ShortcutKey(data)
	{
		if (window.GetForceGuideState() == 1) 
		{
			printf("A# 变态-HALL_LOGIC强制引导中。。。。");
			return;//强制引导中
		}
		switch (data)
		{
			case 3: //Esc
			{
				window.OnClick_BTN_ReturnChannel();
				break;
			}
		}
	}

	//显示隐藏大厅的界面
	void ShowHallUI()
	{
		printf("B# 显示隐藏大厅的界面:ShowHallUI");
		window.SetUIPos(window.POS_HALL);

		window.PlayMusic(window.g_CSoundSet.GetBgMusic(window.eBgMusic_Hall));	
		show = true;
		window.find("UIController").LoadUI("UI_HALL_BTN"); 
		window.find("UIController").LoadUI("UI_CHAT_HALL");//大厅聊天
		window.find("UIController").LoadUI("UI_HALL_BG"); 
		
		set window.find(window.BTNLAYER)
		{
			new VHall_HideUI_Logic
			{
				
			}

			//在线礼品
			new VHall_OnLinePresent_Logic{}
		}
		
		//是否接受排队信息
		//参数：用户ID，是否接受:0不接受，其他表示接受
		var _param = ""+window.GetMyUID()+",1";
		window.Tos_ReceiveQueue(_param);
		
		//此处注释掉原因：活动界面暂不需要这个功能了 且活动界面没有new出来 2009年12月10日 yxf
		//看看活动情况
		//询问竞技赛的信息:用户ID
		//var _param = ""+window.GetMyUID();
		//window.Tos_EnterArena(_param);
	}

	///////////////////////////////////////////////GCMAP//////////////////////////////////////////////
	load("$./GCMap.gml");
}	

//因为隐藏不走Updata，所以放这
set window
{
	//系统公告
	new CAfficheMgr
	{
		name = "HALL_CAFFICHEMGR_EX_LOGIC";
		IsSample();

		/*程序调用*/
		//[功能]需要显示一条消息
		void DisplayMsgEx(id,type,msg)
		{
			printf("B# 公告-系统:CAfficheMgr:DisplayMsgEx,id:"+id+",type:"+type+",state:"+state+",msg:"+msg);
			type = toint(type);
			if (type == 0)
			{
				window.WriteChat8(msg);
			}
//			window.WriteChat5(msg);
		}
	}
}