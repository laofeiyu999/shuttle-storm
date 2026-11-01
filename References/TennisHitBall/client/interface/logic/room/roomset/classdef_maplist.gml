//
//房间设置中，地图List类定义
//

importex("$./../../../UI/Room/RoomSet/ClassDef_MapList.gml");

//一行显示类：图标+名称
class VColumn_MapIcon_Name_Logic item
{
	size = "200,40";bgcolor = "#FFEA99";
	
	//===========================与显示交互======================
	void Init()
	{
		//地图小图标
		//参数 data1: 图标文件名称
		staticvar s_Icon = new VMyText
		{
			
		}
		//地图名称
		//参数 data1：地图名
		staticvar s_Name = new VMyText
		{
			pos = "100,0";
		}
	}
	inclass("VColumn_MapIcon_Name_UI"); //界面显示类
	Init();
	//需要被显示的类覆盖
	void OnMySelect(){bgcolor = "#FFEA99";alpha = 50;}	//选择的效果
	void OnMyUnSelect(){bgcolor = "-1";}				//不选择的效果
	//===========================================================
	void OnSelect(){OnMySelect();};
	void OnUnSelect(){OnMyUnSelect();};
	void OnDataExchange(iRow,szData)
	{
		var _icon = parent.fieldstr(iRow,window.TENNIS_GAME_MAPINFO_MAPICON);
		var _name = parent.fieldstr(iRow,window.TENNIS_GAME_MAPINFO_MAPNAME);
		s_Icon.SetData(_icon,"");
		s_Name.SetData(_name,"");
	}
};

//
//总的类：List
//
class VRoomSet_MapList_Logic VN2ListCtrl
{
	size = "200,80";valign(76,0);halign(50,0);//需要显示时改变
	selecttype="1";colfilter="0";simpleshowmode="1,2";
	//alpha = 70;bgcolor = "#FF";
	
	inclass("VRoomSet_MapList_UI"); //界面显示类

	columclass="0,VColumn_MapIcon_Name_Logic"; //ID
};