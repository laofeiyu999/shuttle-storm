//大厅-明星榜-个人 类定义
//yxf 2009年10月15日

importex("$./ClassDef_Self_Season.gml");
importex("$./ClassDef_Self_All.gml");

importex("$./../../UI/TopStar/ClassDef_Self.gml");

class VTopStar_Self_Logic item
{
	size = "100%,460";pos(0,30);bgcolor = "#FFFF";alpha = 50;
	var m_TypeIndex = 0;	//类型 1本赛季，2总排行
	void Init()
	{
		//本赛季
		staticvar s_R_Season = new VMyRadio
		{
			Init("本赛季",0);pos = "35,0";size = "60,30";
		}
		//总排行
		staticvar s_R_All = new VMyRadio
		{
			Init("总排行",0);pos = "200,0";size = "60,30";
		}
	}
	inclass("VTopStar_Self_UI");
	//==============================function=========================================
	//初始化显示：所有都隐藏
	void InitShow()
	{
		m_Class_All.show = false;
		m_Class_Season.show = false;
	}
	//切换选项卡
	//参数 type：类型 1本赛季，2总排行
	void ChangeType(type)
	{
		m_TypeIndex = type;
		InitShow();
		switch (type)
		{
			case 1:{m_Class_Season.show = true;break;}
			case 2:{m_Class_All.show = true;break;}
		}
	}
	//设置响应事件
	void SetEvent()
	{
		set s_R_Season
		{
			groupname="VTopStar_Group_Self";
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();
				parent.ChangeType(1);
			}
			void OnUnCheck(){MouseUnCheck();}

			SetState(window.BTN_STATE_GREY);
		}
		set s_R_All
		{
			groupname="VTopStar_Group_Self";startstate="1";
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();
				parent.ChangeType(2);
			}
			void OnUnCheck(){MouseUnCheck();}
		}
	}
	//生成一些成员变量
	void NewSubObj()
	{
		staticvar m_Class_Season = new VTopStar_Self_Season_Logic{}
		staticvar m_Class_All = new VTopStar_Self_All_Logic{}
	}
	//重新排名
	//参数 type:排名的方式(1-6)
	void ReSelect(type,updown)
	{
		if (type < 7)
		{
			m_Class_All.ReSelect(type,updown);
		}
		else
		{
			m_Class_Season.ReSelect(type,updown);
		}
	}
	//================================DBList=========================================
	void OnCreated()
	{
		Init();
		NewSubObj();
		SetEvent();
	}
	void RefreshData()
	{
		m_Class_All.RefreshData();
	}
};