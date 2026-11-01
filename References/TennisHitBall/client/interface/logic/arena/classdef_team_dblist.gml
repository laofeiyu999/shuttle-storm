//
//活动队友逻辑类定义
//

importex("$./../../UI/Arena/ClassDef_Team_DBList.gml");

//一行显示类：昵称
class VColumn_ArenaTeam_Logic item
{
	size = "287,30";//bgcolor = "#FF00";
	//===========================与显示交互======================
	void Init()
	{
		//昵称
		//参数 data1: 昵称
		staticvar s_NKname = new VMyText{pos = "10,0";}
	}
	inclass("VColumn_ArenaTeam_UI"); //界面显示类
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
		var _nameStr = parent.fieldstr(iRow,window.GAMEUI_JIVETPGROUP_NICKNAME);
		var _num = window.GetSplitCount(_nameStr,":");
		if(_num==2)
		{
			var _nameArr = window.SplitStr2(_nameStr,":",_num);
			s_NKname1.SetData(_nameArr[0]);
			s_NKname2.SetData(_nameArr[1]);
		}
		else
		{
			s_NKname1.SetData(_nameStr);
			s_NKname2.SetData("");
		}
	}
};

//
//总的类：List
//
class VArena_TeamList_Logic VN2ListCtrl
{
	//需要显示时改变
	size="287,300";pos(400,0);scroll = window.SCROLL_NOYES;
	//
	selecttype="1";colfilter="0";bgcolor = "#00FF";
	
	inclass("VArena_TeamList_UI"); //界面显示类

	columclass="0,VColumn_ArenaTeam_Logic"; //ID
};