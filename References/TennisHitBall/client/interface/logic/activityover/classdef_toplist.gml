//
//活动15天排名逻辑类定义
//

importex("$./../../UI/ActivityOver/ClassDef_TopList.gml");

//一行显示类：排名+昵称 + 文字
class VColumn_ActivityOverTop_Logic item
{
	size = "287,30";//bgcolor = "#FF00";
	//===========================与显示交互======================
	void Init()
	{
		//排名
		//参数 data1：排名
		staticvar s_Index = new VMyText{}

		//昵称
		//参数 data1: 昵称
		staticvar s_NKname = new VMyText{pos = "150,0";}

		//说明
		//参数 data1: 
		staticvar s_Text = new VMyText{pos = "150,0";}
	}
	inclass("VColumn_ActivityOverTop_UI"); //界面显示类
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
		s_NKname.SetData(parent.fieldstr(iRow,window.M_G_SERVER_ACTIVITYOVER_NKNAME));	
		s_Index.SetData(parent.fieldstr(iRow,window.M_G_SERVER_ACTIVITYOVER_SORT));	
		s_Text.SetData(parent.fieldstr(iRow,window.M_G_SERVER_ACTIVITYOVER_AWARDNAME));	
	}
};

//
//总的类：List
//
class VActivityOver_TopList_Logic VN2ListCtrl
{
	//需要显示时改变
	size="287,500";scroll = window.SCROLL_NOYES;
	//
	selecttype="1";colfilter="0";bgcolor = "#00FF";
	
	inclass("VActivityOver_TopList_UI"); //界面显示类

	columclass="0,VColumn_ActivityOverTop_Logic"; //ID
};