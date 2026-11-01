//随机游戏
//yxf 2009年11月25日

importex("$./../../UI/GameHall/ClassDef_RandGameTip.gml");

class VRandGameTip_Logic item
{
	size = "400,500";bgcolor = "#FFFF";alpha = 50;
	var m_RaceID  = 0;	//随机活动ID
	var m_desc = 0;		//倒计时
	var m_Param = "";	//消息内容
	var m_ApplyArenaRaceFlag = false;	//配对是否成功的标志，true为配对成功，false未配对
	//=============================与界面交互========================================
	void Init()
	{
		//关闭：按钮
		staticvar s_Btn_Close = new VMyButton
		{
			Init("X");size = "30,30";halign(100,0);
		}	

		//提示内容
		staticvar s_Content = new VMyText{}

		//持续等待时间
		staticvar s_timer = new BaseText{}

		//加入房间：按钮
		staticvar s_Btn_Confirm = new VMyButton
		{
			Init("加入房间");pos="23,429";
		}
		//取消：按钮
		staticvar s_Btn_Cancel = new VMyButton
		{
			Init("取消");pos="226,435";
		}
		//确定：按钮
		staticvar s_Btn_Ok = new VBTN_A_New{}
		//取消：按钮
		staticvar s_Btn_Cancel2 = new VBTN_A_New{}
	}
	inclass("VRandGameTip_UI");//界面显示类
	//==============================function=========================================
	//点击了关闭或取消
	void OnClick_Cancel()
	{
		window.g_OnConfirm_QuitWait(m_RaceID);
		window.find("ARENA_LOGIC")._VArena_Logic.m_Class_ActivityList.SortRaceList();
		parent.del();
	}

	void OnClick_Ok()
	{
		window.Tos_ApplyArenaRace(m_Param);
		parent.del();
	}

	//报名成功后调用
	void ApplyArenaRaceOk()
	{
		if(m_ApplyArenaRaceFlag)
		{
			return;
		}
		m_ApplyArenaRaceFlag = true;
		s_Btn_Ok.show = false;
		s_Btn_Cancel2.show = false;
		s_Btn_Cancel.show = true;
		s_timer.StartTimer();
	}

	void OnClick_Cancel2()
	{
		parent.del();
	}

	//设置响应事件
	void SetEvent()
	{
		set s_Btn_Close{void OnPressed(){parent.OnClick_Cancel();}}

		set s_Btn_Cancel{void OnPressed(){parent.OnClick_Cancel();}}

		set s_Btn_Ok
		{
			void OnPressed(){parent.OnClick_Ok();}
		}

		set s_Btn_Cancel2
		{
			void OnPressed(){parent.OnClick_Cancel2();}
		}
	}

	//记录报名的消息内容
	void SetMsgParam(_Param)
	{
		m_Param = _Param;
	}
	
	//报名成功 - 记下ID
	void SetRaceID(raceid)
	{
		printf("B# VRandGameTip_Logic:SetRaceID()raceid:"+raceid);
		m_RaceID = raceid;
		window.g_RandRaceID = m_RaceID;

		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByInt(window.M_G_SERVER,window.ARENARACE,window.M_G_SERVER_ARENARACE_ID,m_RaceID);
		if (!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			printf("B# error-VRandGameTip_Logic:SetRaceID()DBname:"+window.M_G_SERVER+",TBName:"+window.ARENARACE+",m_RaceID:"+m_RaceID);
			return;
		}
		var _desc = _VNet2DBRow.GetData(window.M_G_SERVER_ARENARACE_DES1);
		s_Content.SetData(_desc);
	}
	//================================DBList=========================================
	Init();
	SetEvent();
};