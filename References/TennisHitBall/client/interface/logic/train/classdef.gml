//
//训练界面的类定义
//

importex("$./ClassDef_TrainList.gml");
importex("$./../../UI/Train/ClassDef.gml");

class VTrain_Logic item
{
	size = "70%,65%";pos(0,50);bgcolor = "#FF";alpha = 50;
	var m_Type = 0;	//类型 1新手赛,2资格赛,3巡回赛,4黄金赛,5大师赛,6大满贯
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
		//进入：按钮
		staticvar s_Btn_Enter = new VMyButton
		{
			pos(1,300);Init("进入");
		}

		//新手赛:Radio
		staticvar s_R_Young = new VMyRadio
		{
			Init("新手赛");pos = "1,60";
		}
		//资格赛:Radio
		staticvar s_R_Qualification = new VMyRadio
		{
			Init("资格赛");pos = "1,100";
		}
		//巡回赛:Radio
		staticvar s_R_Tour = new VMyRadio
		{
			Init("巡回赛");pos = "1,140";
		}
		//黄金赛:Radio
		staticvar s_R_Gold = new VMyRadio
		{
			Init("黄金赛");pos = "1,180";
		}
		//大师赛:Radio
		staticvar s_R_Masters = new VMyRadio
		{
			Init("大师赛");pos = "1,220";
		}
		//大满贯:Radio
		staticvar s_R_Grand_Slam = new VMyRadio
		{
			Init("大满贯");pos = "1,260";
		}

		//翻页
		staticvar s_PageCtrl = new VMyPageCtrl
		{
			valign(100,0);halign(50,0);
		}
	}
	inclass("VTrain_UI");//界面显示类
	//==============================function=========================================
	//点击了关闭
	void OnClick_BtnClose()
	{
		parent.del();
	}
	//点击了进入
	void OnClick_BtnEnter()
	{
		//清空上次的赌注金额
		window.g_WagerValue = 0;
		window.g_TrainType = 1;		//训练的类型：0强制训练 1正常(训练选择) 2(训练中弹出)
		window.find("UIController").LoadUI("UI_TRAIN_POP");
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
			void OnPressed(){window.CallBack_Help(window.POS_TRAIN);}
		}
		set s_Btn_Enter
		{
			void OnPressed()
			{
				if (GetState() == window.BTN_STATE_LIGHT){parent.OnClick_BtnEnter();}
			}
			SetState(window.BTN_STATE_GREY);
		}
		set s_R_Young//新手赛:Radio
		{
			groupname="VTrainCertificate_Logic_Group";
			if (window.GetTrainChannel() == window.G_TRAINCHANNEL_1_YOUNG)
			{
				startstate = 1;
			}
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();
				window.SetTrainChannel(window.G_TRAINCHANNEL_1_YOUNG);
				parent.m_Type = 1;
				parent.SelectCourseByCertificate();
			}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_R_Qualification//资格赛:Radio
		{
			//SetHangID(43);
			groupname="VTrainCertificate_Logic_Group";
			if (window.GetTrainChannel() == window.G_TRAINCHANNEL_2_QUALIFICATION)
			{
				startstate = 1;
			}
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();
				window.SetTrainChannel(window.G_TRAINCHANNEL_2_QUALIFICATION);
				parent.m_Type = 2;
				parent.SelectCourseByCertificate();
				if (window.GetSerType() == window.G_TRAINCHANNEL_1_YOUNG)
				{
					window.LMH_Train_ZIGESAI();
				}
			}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_R_Tour//巡回赛:Radio
		{
			SetHangID(44);
			groupname="VTrainCertificate_Logic_Group";
			if (window.GetTrainChannel() == window.G_TRAINCHANNEL_3_TOUR)
			{
				startstate = 1;
			}
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();
				window.SetTrainChannel(window.G_TRAINCHANNEL_3_TOUR);
				parent.m_Type = 3;
				parent.SelectCourseByCertificate();
			}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_R_Gold//黄金赛:Radio
		{
			SetHangID(45);
			groupname="VTrainCertificate_Logic_Group";
			if (window.GetTrainChannel() == window.G_TRAINCHANNEL_4_GOLD)
			{
				startstate = 1;
			}
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();
				window.SetTrainChannel(window.G_TRAINCHANNEL_4_GOLD);
				parent.m_Type = 4;
				parent.SelectCourseByCertificate();
			}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_R_Masters//大师赛:Radio
		{
			SetHangID(46);
			groupname="VTrainCertificate_Logic_Group";
			if (window.GetTrainChannel() == window.G_TRAINCHANNEL_5_MASTERS)
			{
				startstate = 1;
			}
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();
				window.SetTrainChannel(window.G_TRAINCHANNEL_5_MASTERS);
				parent.m_Type = 5;
				parent.SelectCourseByCertificate();
			}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_R_Grand_Slam//大满贯:Radio
		{
			SetHangID(47);
			groupname="VTrainCertificate_Logic_Group";
			if (window.GetTrainChannel() == window.G_TRAINCHANNEL_6_SLAM)
			{
				startstate = 1;
			}
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();
				window.SetTrainChannel(window.G_TRAINCHANNEL_6_SLAM);
				parent.m_Type = 6;
				parent.SelectCourseByCertificate();
			}
			void OnUnCheck(){MouseUnCheck();}
		}

		set s_PageCtrl//翻页
		{
			targetname="VTrain_CourseList_Logic_NAME";
			countperpage = 15;
			window.find("G_DBMANAGE").GetRegDbTable(this,"Bind_VTrain_CourseList_Logic");// 获得已绑定的数据表
		}
	}
	//Select条件：点击标签时调用
	void SelectCourseByCertificate()
	{
		s_Btn_Enter.SetState(window.BTN_STATE_GREY);

		var _SQL = "SELECT * FROM "+window.TRAIN+" WHERE Type="+m_Type+" AND ForceTrain=0";
		printf("B# Train:_SQL："+_SQL);
		window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VTrain_CourseList_Logic",window.TENNIS_GAME,_SQL);
	}
	//================================DBList=========================================
	Init();
	//UpdataRadio();
	var _TrainList = new VTrain_CourseList_Logic
	{
		name = "VTrain_CourseList_Logic_NAME";
	
		window.find("G_DBMANAGE").RegDbTable(this,window.TENNIS_GAME,window.TRAIN,"Bind_VTrain_CourseList_Logic");// 绑定数据表
		
		void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);}//移除绑定
	}

	SetEvent();

	void OnCreated()
	{
		s_R_Tour.SetState(window.BTN_STATE_GREY);
		s_R_Gold.SetState(window.BTN_STATE_GREY);
		s_R_Masters.SetState(window.BTN_STATE_GREY);
		s_R_Grand_Slam.SetState(window.BTN_STATE_GREY);
	}
};