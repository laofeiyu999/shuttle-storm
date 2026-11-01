//
//活动场>我的活动
//

importex("$./../../UI/Arena/ClassDef_MyActivity.gml");
importex("$./ClassDef_MyActivity_top.gml");
importex("$./ClassDef_Team_DBList.gml");

class VArena_MyActivity_Logic item
{
	size = "98%,90%";pos(0,40);bgcolor = "#00FF00";alpha = 50;
	var m_iRaceID = -1;
	//var m_ListShowNameNum = 1;
	//=============================与界面交互========================================
	void Init()
	{
		//活动说明与奖励
		//[参数]param1:说明
		//[参数]param:物品奖励
		staticvar s_Desc_Award = new VMyText
		{
			size = "380,270";border = "#FF";autoenter = true;src = "活动说明";
		}

		//活动总人数
		//[参数]param1:
		staticvar s_AllNum = new VMyText
		{
			pos(0,280);src = "总人数";
		}
		//结算剩余时间
		//[参数]param1:(单位：秒)
		staticvar s_FootLeaveTime = new VMyText
		{
			pos(0,300);src = "结算剩余时间";
		}
		//活动剩余时间
		//[参数]param1:(单位：秒)
		staticvar s_ActivityLeaveTime = new VMyText
		{
			pos(0,320);src = "活动剩余时间";
		}
		//休整剩余时间
		//[参数]param1:(单位：秒)
		staticvar s_FallowLeaveTime = new VMyText
		{
			pos(0,340);src = "休整剩余时间";
		}

		//配对：按钮
		staticvar s_Btn_BeginQueue = new VMyButton
		{
			Init("配对");size = "50,30";pos(180,340);
		}

		//当前积分
		//[参数]param1
		staticvar s_CurrMark = new VMyText
		{
			pos(200,280);src = "当前积分";
		}
		//当前活动点数
		//[参数]param1
		staticvar s_CurrPoint = new VMyText
		{
			pos(200,300);src = "当前活动点数";
		}
		//充点：按钮
		staticvar s_Btn_AddPoint = new VMyButton
		{
			Init("充点");size = "50,30";pos(350,300);
		}

		//获胜感言
		staticvar s_E_WinSlogan = new VMyText
		{
			size = "400,30";bgcolor = "#FF00";valign(100,0);
			src = "获胜口号";
		}		
		//设置：按钮
		staticvar s_Btn_SetSlogan = new VMyButton
		{
			Init("设置");size = "50,30";valign(100,0);halign(50,0);
		}
		//退出：按钮
		staticvar s_Btn_Exit = new VMyButton
		{
			Init("退出");size = "50,30";valign(100,0);halign(100,0);
		}
	}
	inclass("VArena_MyActivity_UI");//界面显示类
	//==============================function=========================================
	Init();

	//确定要放弃等待-一个
	void OnConfirm_QuitWait()
	{
		window.g_OnConfirm_QuitWait(m_iRaceID);
	}

	//点击了放弃等待,双击了这条数据
	void OnClick_QuitWait()
	{
		var _raceID =  window.GetMyRaceID();
		if (_raceID<500)
		{
			window.find("UIController").LoadDLG(693);
		}
		if (_raceID>=500)
		{
			window.find("UIController").LoadDLG(30);//放弃等待将不退还报名费，确定要放弃吗？
		}
		window.find("VMB_QuitWaite1_Logic").SetType(2);
		//OnConfirm_QuitWait();
	}
	
	//点击了设置获奖感言
	void OnClick_SetSlogan()
	{
		window.find("UIController").LoadDLG2(529);//设置获胜口号
		window.find("VMB_SetSlogan_Logic").SetSrc(s_E_WinSlogan.src);
	}
	
	//点击了充点
	void OnClick_AddPoint()
	{
		window.g_Row.InitByInt(window.M_G_SERVER,window.ARENARACE,window.M_G_SERVER_ARENARACE_ID,window.GetMyRaceID());

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-OnClick_AddPoint:DBname:"+window.M_G_SERVER+",TBName:"+window.ARENARACE+",raceid:"+window.GetMyRaceID());
			return;
		}

		var _getpoint = window.g_Row.GetData(window.M_G_SERVER_ARENARACE_UI_ADDPOINTGET);
		var _paymoney = window.g_Row.GetData(window.M_G_SERVER_ARENARACE_UI_ADDPOINTMONEY);
		window.g_Row.Release();

		window.find("UIController").LoadDLG(112);//点我充点！
		window.find("VMyMB_AddPoint_Logic").ReplaceData(""+_paymoney+"金币,"+_getpoint);
	}
	
	//点击了配对
	void OnClick_BeginQueue()
	{
		window.find("UIController").LoadDLG(806);
//		//取消休整成功，请耐心等待配对！
//		window.find("UIController").LoadDLG(534);
	}

	//设置响应事件
	void SetEvent()
	{
		set s_Btn_BeginQueue
		{
			void OnPressed()
			{
				if(GetState()==window.BTN_STATE_LIGHT){parent.OnClick_BeginQueue();}
			}
			SetState(window.BTN_STATE_GREY);
		}

		set s_Btn_AddPoint
		{
			void OnPressed()
			{
				if(GetState()==window.BTN_STATE_LIGHT){parent.OnClick_AddPoint();}
			}
		}

		set s_Btn_SetSlogan
		{
			void OnPressed()
			{
				if(GetState()==window.BTN_STATE_LIGHT){parent.OnClick_SetSlogan();}
			}
		}

		set s_Btn_Exit
		{
			void OnPressed(){if(GetState()==window.BTN_STATE_LIGHT){parent.OnClick_QuitWait();}}
		}
	}

	//================================DBList=========================================
	var _Top = new VArena_MyActivity_Top_Logic
	{
		pos="429,64";s_BG.show = false;size = "195,390";//bgcolor="#ff";
		SetRegDbTable("MyActivity_Top")
	}


//	//队友
//	var _TeamList = new VArena_TeamList_Logic
//	{
//		name = "VArena_TeamList_Logic_NAME";
//		
//		window.find("G_DBMANAGE").RegDbTable(this,window.GAMEUI,window.JIVETPGROUP,"Bind_VArena_TeamList_Logic");// 绑定数据表
//		
//		void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);}//移除绑定
//		
//		var _SQL = "SELECT * FROM jiveTpGroup WHERE state=1 AND raceid>0";
//		window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VArena_TeamList_Logic",window.GAMEUI,_SQL);
//	}

	SetEvent();//必须先有list再有翻页的事件-否则会不显示页数
	
	//用一个一直存在的就行
	var _VNet2DBRow = new VNet2DBRow{}
	//[功能]外部调用
	//[参数]raceid:报名ID
	void SetRaceID(raceid)
	{
		m_iRaceID = raceid.__Long__;
		if (raceid <= 0)
		{
			printf("C# VArena_MyActivity_Logic-SetRaceID()参数错误！"+m_iRaceID);
			return;
		}

		_VNet2DBRow.InitByInt(window.M_G_SERVER,window.ARENARACE,window.M_G_SERVER_ARENARACE_ID,m_iRaceID);
		if (!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.Release();
			if (window.g_DEBUG)
			{
				printf("C# error-VArena_MyActivity_Logic,SetRaceID():DBname:"+window.M_G_SERVER+",TBName:"+window.ARENARACE+",m_iRaceID:"+m_iRaceID);
			}
			return;
		}
		
		if(toint(_VNet2DBRow.GetData(window.M_G_SERVER_ARENARACE_QUEUETYPE))==2){window.m_ListShowNameNum=2;}
		else{window.m_ListShowNameNum = 1;}

		var _cansetslogan = _VNet2DBRow.GetData(window.M_G_SERVER_ARENARACE_CHECK_SLOGAN);
		if (_cansetslogan == 1)
		{
			if (window.GetMyLeaderState())
			{
				s_Btn_SetSlogan.SetState(window.BTN_STATE_LIGHT);
			}
			else
			{
				s_Btn_SetSlogan.SetState(window.BTN_STATE_GREY);
			}
		}
		else
		{
			s_Btn_SetSlogan.SetState(window.BTN_STATE_LIGHT);
		}
		
		if(window.m_ListShowNameNum==2) //这种活动排行榜的图片宽度和位置
		{
			_Top.s_MyIndex.SetSize2();
			_Top.s_MyIndex.m_Bg.SetSize2();
			//_Top.s_MyIndex.m_index.SetPos2();
			_Top.s_MyIndex.m_data.SetPos2();
			_Top._line.setpos();
			_Top._TopList.SetSize2();
			_Top._TopList.SetPos2();
		}
		else
		{
			_Top.s_MyIndex.SetSize1();
			_Top.s_MyIndex.m_Bg.SetSize1();
			//_Top.s_MyIndex.m_index.SetPos1();
			_Top.s_MyIndex.m_data.SetPos1();
			_Top._line.setpos();
			_Top._TopList.SetSize1();
			_Top._TopList.SetPos1();
		}
		s_Btn_BeginQueue.SetState(window.BTN_STATE_GREY);
		var _racestate = _VNet2DBRow.GetData(window.M_G_SERVER_ARENARACE_RACE_STATE);
		if (_racestate == window.g_QUEUE_QUEUEWAIT || _racestate == window.g_QUEUE_PAUSE)
		{
			s_Btn_Exit.show = true;
		}
		else
		{
			s_Btn_Exit.show = false;
		}
		
		var _queuetype = _VNet2DBRow.GetData(window.M_G_SERVER_ARENARACE_QUEUETYPE);
		//
		OnUserRaceStateChange(_racestate,m_iRaceID,_queuetype);

		var _desc = _VNet2DBRow.GetData(window.M_G_SERVER_ARENARACE_DES1)
		var _award = "";
		if (window.GetMySex() == window.USER_SEX_MAN)
		{
			_award = _VNet2DBRow.GetData(window.M_G_SERVER_ARENARACE_VMANGOODS1);
		}
		else
		{
			_award = _VNet2DBRow.GetData(window.M_G_SERVER_ARENARACE_VWOMANGOODS1);
		}
		s_Desc_Award.SetData(_desc,_award);
		
		var _groupid = _VNet2DBRow.GetData(window.M_G_SERVER_ARENARACE_GROUP_ID);
		
		var _teamnum = _VNet2DBRow.GetData(window.M_G_SERVER_ARENARACE_TEAMNUM);
		var _allnum = _VNet2DBRow.GetData(window.M_G_SERVER_ARENARACE_ALLNUM);
		s_AllNum.SetData(toint(_teamnum)*toint(_allnum),"","");
		//s_FallowLeaveTime.SetData(_VNet2DBRow.GetData(window.M_G_SERVER_ARENARACE_FALLOW_TIME),"","");
		s_CurrPoint.SetData(_VNet2DBRow.GetData(window.M_G_SERVER_ARENARACE_RES1),"","");
		s_CurrMark.SetData(_VNet2DBRow.GetData(window.M_G_SERVER_ARENARACE_RES2),"","");
		s_ActivityLeaveTime.SetData(_VNet2DBRow.GetData(window.M_G_SERVER_ARENARACE_SIGNLEAVETIME),"","");
		//s_FootLeaveTime.SetData(_VNet2DBRow.GetData(window.M_G_SERVER_ARENARACE_UI_BALANCELEAVETIME));
		
		var _ui_addpointget = _VNet2DBRow.GetData(window.M_G_SERVER_ARENARACE_UI_ADDPOINTGET);
		if (toint(_ui_addpointget) < 0)
		{
			s_Btn_AddPoint.SetState(window.BTN_STATE_GREY);
		}
		else
		{
			s_Btn_AddPoint.SetState(window.BTN_STATE_LIGHT);
		}
		_VNet2DBRow.Release();

		_VNet2DBRowRaced.InitDB(m_iRaceID);

		//取活动排行
		window.GetArenaTopData();

		_VNet2DBRow.InitByInt(window.M_G_SERVER,window.ARENADATA,window.M_G_SERVER_ARENADATA_USERID,_myUID);
		if(_VNet2DBRow.IsReady())
		{
			var _nameStr = _VNet2DBRow.GetData(window.M_G_SERVER_ARENADATA_NKNAME);
			var _num = window.GetSplitCount(_nameStr,":");
			//alert("SetRaceID   _nameStr="+_nameStr);
			if(_num==2)
			{
				var _nameArr = window.SplitStr2(_nameStr,":");
				_Top.s_MyIndex.m_name1.SetData(_nameArr[0]);
				_Top.s_MyIndex.m_name2.SetData(_nameArr[1]);
				//alert("SetRaceID   _nameStr="+_nameStr+",_nameArr[0]="+_nameArr[0]+",_nameArr[1]="+_nameArr[1]);
			}
			else
			{
				_Top.s_MyIndex.m_name1.SetData(_nameStr);
				_Top.s_MyIndex.m_name2.SetData("");
			}
		}
		_VNet2DBRow.Release();

		//设置排行的标题
		//_Top.s_Title._value.SetData(window.GetTopTitleByID(window.GetMyRaceID()));
	}

	//[功能]当状态变化的时候
	//[参数]race_state:配对服务器同步：玩家此活动的状态： 1初始状态 2等待排队中 3暂停中 4已取消排队
	//		raceid:活动ID
	//		queuetype:配对类型：0未知 1玩家 2队伍 3家族
	void OnUserRaceStateChange(race_state,raceid,queuetype)
	{
		if (race_state == window.g_QUEUE_PAUSE)
		{
			//需要对组队活动单独处理
			if (queuetype == window.g_eQUDT_TEAM)
			{
				//自己是队长
				//if ( window.JudgeSBisCaptaim( raceid,window.GetMyUID() ) )
				if(window.GetMyLeaderState())
				{
					s_Btn_BeginQueue.SetState(window.BTN_STATE_LIGHT);
				}
				else
				{
					s_Btn_BeginQueue.SetState(window.BTN_STATE_GREY);
				}
			}
			else
			{
				s_Btn_BeginQueue.SetState(window.BTN_STATE_LIGHT);
			}
		}
		else
		{
			s_Btn_BeginQueue.SetState(window.BTN_STATE_GREY);
			window.find("HALL_LOGIC").m_ArenaFallowTime.StopRunTime_Ex();//0017689: 【搭档】打完一场活动队长点继续活动，队员的剩余时间还在倒数，应该和队长一样倒计时归零才对 
		}	
	}

	//已报名的活动
	var _VNet2DBRowRaced = new VNet2DBRow
	{	
		void InitDB(raceid)
		{
			InitByInt(window.M_G_SERVER,window.ARENARACE,window.M_G_SERVER_ARENARACE_ID,raceid);
			AddDBEvent("OnMyDataChange",0,2,8,13,22,26,27);	
		}
		//索引
		//0 id 报名ID
		//2 queuetype 配对类型：0未知 1玩家 2队伍 3家族
		//8 race_state 配对服务器同步：玩家此活动的状态： 1初始状态 2等待排队中 3暂停中 4已取消排队
		//13 allnum			配对服务器同步：活动的总人数
		//22 teamnum		队伍成员数
		//26 res1			大厅服务器填写：此类型的保留数据1 活动点
		//27 res2			此类型的保留数据2 积分
		void OnMyDataChange(index,id,queuetype,race_state,allnum,teamnum,res1,res2)
		{		
			if (window.g_DEBUG)
			{
				printf("C# [活动]_VNet2DBRowRaced-index:"+index+",id:"+id+",queuetype:"+queuetype+",race_state:"+race_state+",allnum:"+allnum+",teamnum:"+teamnum+",res1:"+res1+",res2:"+res2+"\n");
			}
			switch (index)
			{
				case 8:
				{
					parent.OnUserRaceStateChange(race_state,id,queuetype);
					break;
				}
				case 13:
				{
					//取活动排行
					window.GetArenaTopData();
					parent.s_AllNum.SetData(toint(teamnum)*toint(allnum),"","");					
					break;
				}
				case 26://活动点
				{
					parent.s_CurrPoint.SetData(res1,"","");					
					break;
				}
				case 27://积分
				{
					parent.s_CurrMark.SetData(res2,"","");					
					break;
				}
			}
		}//OnMyDataChange
	}//_VNet2DBRowRaced

	//获胜口号输入完毕
	void SetSloganOver(_str)
	{
		window.g_ArenaSlogan = _str;
		s_E_WinSlogan.src = _str;
	}

	void OnCreated()
	{
		SetSloganOver(window.g_ArenaSlogan);
	}
};