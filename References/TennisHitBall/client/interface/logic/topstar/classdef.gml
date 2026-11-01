//大厅-明星榜 类定义
//yxf 2009年10月14日

importex("$./ClassDef_Self.gml");
importex("$./ClassDef_Family.gml");
importex("$./ClassDef_Favor.gml");
importex("$./ClassDef_GoldenLMatch.gml")
importex("$./ClassDef_Lover.gml")
importex("$./ClassDef_Partner.gml")

importex("$./../../UI/TopStar/ClassDef.gml");

class VTopStar_Logic item
{
	size = "70%,65%";pos(0,50);bgcolor = "#FF";alpha = 50;
	var m_TypeIndex = 0;	//类型 1个人，2家族,3人气,4搭档 5情侣
	
	void Init()
	{
		//关闭：按钮
		staticvar s_Btn_Close = new VMyButton
		{
			pos = "600,0";Init("X");size = "30,30";
		}
		//帮助：按钮
		staticvar s_Btn_Help = new VMyButton
		{
			pos(550,0);Init("？");size = "30,30";
		}
		//人气
		staticvar s_R_Favor = new VMyRadio
		{
			Init("人气",0);pos = "35,0";size = "150,30";
		}
		//个人
		staticvar s_R_Self = new VMyRadio
		{
			Init("个人",0);pos = "200,0";size = "150,30";
		}
		//家族
		staticvar s_R_Family = new VMyRadio
		{
			Init("家族",0);pos = "375,0";size = "150,30";
		}
//		//黄金联赛
//		staticvar s_R_GlMatch = new VMyRadio
//		{
//			Init("黄金联赛",0);pos = "475,0";size = "150,30";
//		}
		//搭档
		staticvar s_R_GlMatch = new VMyRadio
		{
			Init("搭档",0);pos = "475,0";size = "150,30";
		}
		//情侣
		staticvar s_R_Lover = new VMyRadio
		{
			Init("情侣",0);pos = "475,0";size = "150,30";
		}
	}
	inclass("VTopStar_UI");
	//==============================function=========================================
	//点击了关闭
	void OnClick_BtnClose()
	{
		parent.del();
		window.find("VTS_LoverModel_Logic").OnClick_BtnClose();
	}
	//初始化显示：所有都隐藏
	void InitShow()
	{
		m_Class_Family.show = false;
		m_Class_Self.show = false;
		m_Class_Favor.show = false;		
		m_Class_Lover.show = false;
		m_Class_Partner.show = false;
		//m_Class_GoldenLMatch.show = false;
	}
	//切换选项卡
	//参数 type：类型 1个人，2家族,3人气,4搭档 5情侣
	void ChangeType(type)
	{
		m_TypeIndex = type;
		InitShow();
		switch (type)
		{
			case 1:{m_Class_Self.show = true;m_Class_Self.RefreshData();break;}
			case 2:{m_Class_Family.show = true;m_Class_Family.RefreshData();break;}
			case 3:{m_Class_Favor.show = true;m_Class_Favor.RefreshData();break;}
			case 4:{m_Class_Partner.show = true;m_Class_Partner.RefreshData();break;}
			case 5:{m_Class_Lover.show = true;m_Class_Lover.RefreshData();break;}
			//case 4:{m_Class_GoldenLMatch.show = true;m_Class_GoldenLMatch.RefreshData();break;}
		}
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
			void OnPressed(){window.CallBack_Help(window.POS_TOPSTAR,parent.m_TypeIndex);}
		}
//		set s_R_Favor
//		{
//			groupname="VTopStar_Group";//startstate="1";
//			void OnCheck()
//			{
//				if (GetChecked()){return;}
//				MouseCheck();
//				parent.ChangeType(3);
//				window.find("order_VTopStar_Favor_Logic").s_Btn_Back.OnPressed();
//			}
//			void OnUnCheck(){MouseUnCheck();}
//			//SetState(window.BTN_STATE_GREY);
//		}

		set s_R_Self
		{
			groupname="VTopStar_Group";
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();
				parent.ChangeType(1);
				window.find("order_VTopStar_Self_All_Logic").s_Btn_Back.OnPressed();
				window.find("VTS_LoverModel_Logic").OnClick_BtnClose();
			}
			void OnUnCheck(){MouseUnCheck();}
		}
//		set s_R_Family
//		{
//			groupname="VTopStar_Group";
//			void OnCheck()
//			{
//				if (GetChecked()){return;}
//				MouseCheck();
//				parent.ChangeType(2);
//				//window.F_Family_Getallteam();
//				window.find("order_VTopStar_Family_Logic").s_Btn_Back.OnPressed();
//			}
//			void OnUnCheck(){MouseUnCheck();}
//
//			//SetState(window.BTN_STATE_GREY);
//		}
//		set s_R_GlMatch//s_R_GlMatch
//		{
//			groupname="VTopStar_Group";
//			void OnCheck()
//			{
//				if (GetChecked()){return;}
//				MouseCheck();
//				parent.ChangeType(4);
//				window.find("order_VTopStar_GoldenLMatch_Logic").s_Btn_Back.OnPressed();
//			}
//			void OnUnCheck(){MouseUnCheck();}
//		}
		set s_R_Lover//情侣
		{
			groupname="VTopStar_Group";
			//SetState(window.BTN_STATE_GREY);//为版本去掉情侣
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();
				parent.ChangeType(5);
				window.find("order_VTopStar_Lover_Logic").s_Btn_Back.OnPressed();
				window.find("VTS_LoverModel_Logic").OnClick_BtnClose();
			}
			void OnUnCheck(){MouseUnCheck();}
		}
//		set s_R_Partner//搭档
//		{
//			groupname="VTopStar_Group";
//			void OnCheck()
//			{
//				if (GetChecked()){return;}
//				MouseCheck();
//				parent.ChangeType(4);
//				window.find("order_VTopStar_Partner_Logic").s_Btn_Back.OnPressed();
//			}
//			void OnUnCheck(){MouseUnCheck();}
//		}
	}
	//生成一些成员变量
	void NewSubObj()
	{
		//人气
		staticvar m_Class_Favor = new VTopStar_Favor_Logic{}

		//个人
		staticvar m_Class_Self = new VTopStar_Self_Logic{}

		//家族
		staticvar m_Class_Family = new VTopStar_Family_Logic{}

//		//黄金联赛
//		staticvar m_Class_GoldenLMatch =new VTopStar_GoldenLMatch_Logic{}

		//情侣
		staticvar m_Class_Lover =new VTopStar_Lover_Logic{}

//		//搭档
//		staticvar m_Class_Partner = new VTopStar_Partner_Logic{}
	}
	//重新排名
	//参数 type:排名的方式(1-6)
	void ReSelect(type,updown)
	{
		if (type < 7)
		{
			m_Class_Self.ReSelect(type,updown);
		}
		else
		{
			m_Class_Family.ReSelect(type,updown);
		}
	}
	void SetFavor()
	{
		set s_R_Favor
		{
			groupname="VTopStar_Group";startstate="1";
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();
				parent.ChangeType(3);
				window.find("order_VTopStar_Favor_Logic").s_Btn_Back.OnPressed();
				window.find("VTS_LoverModel_Logic").OnClick_BtnClose();
			}
			void OnUnCheck(){MouseUnCheck();}
			//SetState(window.BTN_STATE_GREY);
		}

		set s_R_Family
		{
			groupname="VTopStar_Group";
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();
				parent.ChangeType(2);
				//window.F_Family_Getallteam();
				window.find("order_VTopStar_Family_Logic").s_Btn_Back.OnPressed();
				window.find("VTS_LoverModel_Logic").OnClick_BtnClose();
			}
			void OnUnCheck(){MouseUnCheck();}

			//SetState(window.BTN_STATE_GREY);
		}
	}

	void SetFamily()
	{
		set s_R_Family
		{
			groupname="VTopStar_Group";startstate="1";
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();
				parent.ChangeType(2);
				//window.F_Family_Getallteam();
				window.find("order_VTopStar_Family_Logic").s_Btn_Back.OnPressed();
				window.find("VTS_LoverModel_Logic").OnClick_BtnClose();
			}
			void OnUnCheck(){MouseUnCheck();}

			//SetState(window.BTN_STATE_GREY);
		}

		set s_R_Favor
		{
			groupname="VTopStar_Group";
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();
				parent.ChangeType(3);
				window.find("order_VTopStar_Favor_Logic").s_Btn_Back.OnPressed();
				window.find("VTS_LoverModel_Logic").OnClick_BtnClose();
			}
			void OnUnCheck(){MouseUnCheck();}
			//SetState(window.BTN_STATE_GREY);
		}
	}
	//================================DBList=========================================
	void OnCreated()
	{
		Init();
		NewSubObj();
		SetEvent();
		if (window.g_SetFamily == 1)
			SetFamily();
		else
			SetFavor();
		window.g_SetFamily = 0;
	}
	void OnDelete()
	{
		window._OrderDataGetter.Close();
		window.find("VTS_LoverModel_Logic").OnClick_BtnClose();
	}
	//开始
	window._OrderDataGetter.Init(window.GAMETOPSVIP);	

	//循环刷新显示的处理
	void TimerUpDate()
	{
		while(1)
		{
			sleep(window.FAVOR_FLASHTIME);
			switch (m_TypeIndex)
			{
			case 1:{m_Class_Self.RefreshData();break;}
			case 2:{m_Class_Family.RefreshData();break;}
			case 3:{m_Class_Favor.RefreshData();break;}
			case 4:{m_Class_Partner.RefreshData();break;}
			case 5:{m_Class_Lover.RefreshData();break;}
			}
	  }
	TimerUpDate();
	}
};