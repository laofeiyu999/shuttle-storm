//
//活动场类定义
//
importex("$./../../UI/Arena/ClassDef.gml");
importex("$./ClassDef_Activity.gml");
importex("$./ClassDef_MyActivity.gml");

class VArena_Logic item
{
	size = "70%,65%";pos(0,50);bgcolor = "#00FF";alpha = 50;
	
	//=============================与界面交互========================================
	void Init()
	{
		//活动列表
		staticvar s_R_List = new VMyRadio
		{
			Init("活动列表");size = "100,30";pos(0,10);
		}
		//当前活动
		staticvar s_R_My = new VMyRadio
		{
			Init("当前活动");size = "100,30";pos(110,10);
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
	}
	inclass("VArena_UI");//界面显示类
	//==============================function=========================================
	//点击了关闭
	void OnClick_BtnClose()
	{
		parent.del();
	}
	//初始化显示：所有都隐藏
	void InitShow()
	{
		m_Class_ActivityList.show = false;
		m_Class_MyActivity.show = false;
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
			void OnPressed(){window.CallBack_Help(window.POS_ARENA);}
		}
		set s_R_List
		{
			groupname="VArena_Group";
//			startstate="1";
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();
				parent.ChangeType(1);
			}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_R_My
		{
			groupname="VArena_Group";
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();
				parent.ChangeType(2);
			}
			void OnUnCheck(){MouseUnCheck();}
			//SetState(window.BTN_STATE_GREY);
		}
	}
	//生成一些成员变量
	void NewSubObj()
	{
		//活动列表
		staticvar m_Class_ActivityList = new VArena_Activity_Logic{}

		//我的活动
		staticvar m_Class_MyActivity = new VArena_MyActivity_Logic{}
	}
	//切换选项卡
	//参数 type：类型 1活动列表，2我的活动
	void ChangeType(type)
	{
		InitShow();
		switch (type)
		{
			case 1:{m_Class_ActivityList.show = true;break;}
			case 2:
			{
				m_Class_MyActivity.SetRaceID(window.GetMyRaceID());
				m_Class_MyActivity.show = true;
				break;
			}
		}
	}
	//模拟点选
	//参数 type：类型 1活动列表，2我的活动
	void CheckRadio(type)
	{
		printf("B# VArena_Logic:CheckRadio()_Type:"+type);
		switch (type)
		{
			case 1:
			{
				s_R_List.UnCheck();
				s_R_My.UnCheck();
				s_R_List.Check();
				s_R_My.SetState(window.BTN_STATE_GREY);
				window.find("VMB_ArenaOverTip_Logic").del();
				break;
			}
			case 2:
			{
				s_R_My.SetState(window.BTN_STATE_LIGHT);
				s_R_List.UnCheck();
				s_R_My.UnCheck();
				s_R_My.Check();
				break;
			}
		}
	}

	//[功能]报名成功后调用
	void BeginQueueOk(raceid)
	{
		printf("B# VArena_Logic:BeginQueueOk:"+window.GetMyRaceID());
		m_Class_MyActivity.SetRaceID(window.GetMyRaceID());

		m_Class_ActivityList.s_Btn_Apply.show = false;
		m_Class_ActivityList.s_Btn_Apply.SetState(window.BTN_STATE_GREY);
		m_Class_ActivityList.s_Btn_Cancel.show = true;
		
		CheckRadio(2);
	}

	//[功能]取消报名成功后调用
	void CancelQueueOk(raceid)
	{
		printf("B# VArena_Logic:CancelQueueOk:"+window.GetMyRaceID());
		CheckRadio(1);
		m_Class_ActivityList._ActivityList.checkselect(-1,-1);
	}

	//================================DBList=========================================
	NewSubObj();
	Init();
	SetEvent();

	void OnCreated()
	{
		printf("window.g_ArenaRaceID:"+window.GetMyRaceID());
		if (window.GetMyRaceID() > 0 && !window.IsRandomRace(window.GetMyRaceID()))
		{
			CheckRadio(2);
			//s_R_My.startstate="1";
		}
		else
		{
			//s_R_List.startstate="1";
			CheckRadio(1);
		}
	}
};