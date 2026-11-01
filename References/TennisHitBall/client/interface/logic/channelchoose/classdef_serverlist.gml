//
//游戏服务器列表 List
//2008年8月19日
//

importex("$./../../UI/ChannelChoose/ClassDef_ServerList.gml");

//一行显示类：名称+状态
class VColumn_SevName_State_Logic item
{
	size = "480,30";//bgcolor = "#FFEA99";
	
	//===========================与显示交互======================================
	void Init()
	{
		//服务器类型
		//参数 data1: 1新手赛,2资格赛,3巡回赛,4黄金赛,5大师赛,6大满贯 7大奖赛
		staticvar s_Type = new VMyText
		{
		}

		//服务器名
		//参数 data1: 服务器名
		staticvar s_Name = new VMyText
		{
			pos = "100,0";
		}

		//等级限制
		//参数 data1:
		staticvar s_LimitLv = new VMyText
		{
			pos = "250,0";
		}

		//状态
		//参数1 data1：在线人数
		//参数2 data2: 限制总人数
		staticvar s_State = new VMyText
		{
			pos = "300,0";
		}
	}
	inclass("VColumn_SevName_State_UI"); //界面显示类
	Init();
	//需要被显示的类覆盖
	void OnMySelect(){bgcolor = "#FFEA99";alpha = 50;}	//选择的效果
	void OnMyUnSelect(){bgcolor = "-1";}				//不选择的效果
	//============================================================================
	void OnLBDClick()
	{
		parent.parent.OnClick_BtnEnter();
	}
	void OnSelect()
	{
		parent.parent.s_Btn_Enter.SetState(window.USER_STATE_REDAY);//进入按钮为亮的
		OnMySelect();
	};
	void OnUnSelect()
	{
		parent.parent.s_Btn_Enter.SetState(window.BTN_STATE_GREY);//进入按钮为灰的
		OnMyUnSelect();
	};
	void OnDataExchange(iRow,szData)
	{
		var _name = parent.fieldstr(iRow,window.GAMEUI_GAMESERVER_SVRNAME);	//服务器名
		var _OLNum = parent.fieldstr(iRow,window.GAMEUI_GAMESERVER_OLNUM);	//在线人数
		var _LimitNum = parent.fieldstr(iRow,window.GAMEUI_GAMESERVER_LIMITNUM);	//限制人数
		s_Type.SetData(parent.fieldstr(iRow,window.GAMEUI_GAMESERVER_SVRTYPE),"","");
		s_LimitLv.SetData(parent.fieldstr(iRow,window.GAMEUI_GAMESERVER_LIMITLEVEL),"","");
		s_Type.SetData(parent.fieldstr(iRow,window.GAMEUI_GAMESERVER_SVRTYPE));
		s_Name.SetData(_name,"","");
		s_State.SetData(toint(_OLNum),toint(_LimitNum));
	}
};

//
//总的类：List
//
class VChannelChoose_ServerList_Logic VN2ListCtrl
{
	size="480,525";pos = "50,20";//需要显示时改变
	selecttype="1";colfilter="0";simpleshowmode="1,13";
	scroll = window.SCROLL_NOYES;

	inclass("VChannelChoose_ServerList_UI"); //界面显示类

	columclass="0,VColumn_SevName_State_Logic"; //服务器ID
};