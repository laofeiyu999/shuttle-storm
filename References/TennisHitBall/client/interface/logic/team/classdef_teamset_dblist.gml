//组队设置-List类定义
//yxf 2009年10月20日

importex("$./../../UI/Team/ClassDef_TeamSet_DBList.gml");

//一行显示类：昵称+等级+关系+技术方向
class VColumn_TeamSet_Logic item
{
	size = "400,30";//bgcolor = "#FF00";
	//===========================与显示交互======================
	void Init()
	{
		//昵称
		//参数 data1: 昵称
		//参数 data2：状态 0离线 1空闲中 2房间内 3游戏中 4登陆中
		staticvar s_NKname = new VMyText{}
		
		//等级
		//参数 data1：等级
		//参数 data2：状态 0离线 1空闲中 2房间内 3游戏中 4登陆中
		staticvar s_Level = new VMyText{pos = "150,0";}
		
		//关系
		//参数 data1：1.好友 2.家族 3.夫妻...
		staticvar s_Relation = new VMyText{pos = "200,0";}

		//技术方向
		//参数 data1：
		staticvar s_TechnicType = new VMyText
		{
			pos = "250,0";

			void SetData(type)
			{
				src = window.GetTechnicByType(type);
			}
		}

	}
	inclass("VColumn_TeamSet_UI"); //界面显示类
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
	};
	void OnDataExchange(iRow,szData)
	{
		s_NKname.SetData(parent.fieldstr(iRow,window.GAMEUI_JIVETPINVITELIST_NKNAME),"");
		s_Level.SetData(parent.fieldstr(iRow,window.GAMEUI_JIVETPINVITELIST_LV),"");
		s_Relation.SetData(parent.fieldstr(iRow,window.GAMEUI_JIVETPINVITELIST_RELATION),"");
		s_TechnicType.SetData(parent.fieldstr(iRow,window.GAMEUI_JIVETPINVITELIST_SKILL),"");
	}
};

//
//总的类：List
//
class VTeamSet_List_Logic VN2ListCtrl
{
	//需要显示时改变
	size="324,164";valign(60,0);halign(55,0);
	//
	selecttype="1";colfilter="0";
	bgcolor = "#00FF00";
	scroll = window.SCROLL_NOYES;

	inclass("VTeamSet_List_UI"); //界面显示类

	columclass="0,VColumn_TeamSet_Logic"; //ID
};