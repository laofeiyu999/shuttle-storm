//家族 - 成员列表
//yxf 2009年9月11日

import("$./../../UI/Family/ClassDef_MemberList.gml");

//一行显示类：符号+昵称+等级+贡献度+职位
class VColumn_All_List_Logic item
{
	size = "200,30";//bgcolor = "#FF00";
	var m_UID = 0;	//玩家ID
	var m_State = 0;//玩家游戏状态 0断线 1空闲中 2房间内 3游戏中
	//===========================与显示交互======================
	void Init()
	{
		//符号
		//参数 data1: 
		staticvar s_Symbol = new VMyText{}

		//昵称
		//参数 data1: 昵称
		staticvar s_NKname = new VMyText{pos = "50,0";}

		//等级
		//参数 data1：等级
		staticvar s_Level = new VMyText{pos = "150,0";}

		//贡献度
		//参数 data1：贡献度
		staticvar s_Offer = new VMyText{pos = "200,0";}
		
		//职位
		//参数 data1：
		staticvar s_Post = new VMyText{pos = "300,0";}

	}
	inclass("VColumn_All_List_UI"); //界面显示类
	Init();
	void OnMySelect(){bgcolor = "#FFEA99";alpha = 50;}	//选择的效果
	void OnMyUnSelect(){bgcolor = "-1";}				//不选择的效果
	//===========================================================
	void OnSelect()
	{
		OnMySelect();
	};
	void OnUnSelect()
	{
		OnMyUnSelect();
		parent.parent.s_Btn_AddFriend.SetState(window.USER_STATE_WAIT);//加为好友按钮为灰的
		parent.parent.s_Btn_GoRoom.SetState(window.USER_STATE_WAIT);//前往房间按钮为灰的
	};
	void OnDataExchange(iRow,szData)
	{
		m_UID = szData;
		var _NkName = parent.fieldstr(iRow,window.M_G_SERVER_USERDT_NKNAME);	//昵称
		var _Lv = parent.fieldstr(iRow,window.M_G_SERVER_USERDT_CULEVEL);		//等级
		var _Sex = parent.fieldstr(iRow,window.M_G_SERVER_USERDT_SEX);		//性别
		m_State = parent.fieldstr(iRow,window.M_G_SERVER_USERDT_GAMESTA);		//游戏状态
		s_NKname.SetData(_NkName,"");
		s_Level.SetData(_Lv,"");
		if (_Sex == "" || _Sex == 0)
		{
			_Sex = 0;
		}
		s_Sex.SetData(_Sex,"");
		s_Pos.SetData(m_State,"");
	}
};

//
//总的类：List
//
class VFamily_MemberList_Logic VN2ListCtrl
{
	//需要显示时改变
	size="400,500";valign(30,0);halign(55,0);simpleshowmode="1,10";
	//
	selecttype="1";colfilter="0";bgcolor = "#00FF";
	
	inclass("VFamily_MemberList_UI"); //界面显示类

	columclass="0,VColumn_All_List_Logic"; //ID
};