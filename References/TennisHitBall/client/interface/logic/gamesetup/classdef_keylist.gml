//
//游戏设置中，按键List类定义
//

importex("$./../../UI/GameSetUp/ClassDef_KeyList.gml");

//一行显示类：行动+按键
class VColumn_Action_Key_Logic item
{
	size = "300,30";//bgcolor = "#FF00";
	
	//===========================与显示交互======================
	void Init()
	{
		//行动
		//参数 data1: 行动名称
		staticvar s_Action = new VMyText
		{
			pos = "20,0";
		}
		//按键值
		//参数 data1：按键
		staticvar s_KeyValue = new VMyText
		{
			pos = "150,0";
		}
	}
	inclass("VColumn_Action_Key_UI"); //界面显示类
	Init();
	//需要被显示的类覆盖
	void OnMySelect(){bgcolor = "#FFEA99";alpha = 50;}	//选择的效果
	void OnMyUnSelect(){bgcolor = "-1";}				//不选择的效果
	//===========================================================
	void OnSelect(){OnMySelect();};
	void OnUnSelect(){OnMyUnSelect();};
	void OnDataExchange(iRow,szData)
	{
		var _Action = parent.fieldstr(iRow,window.GAMEUI_KEYSET_KEYIMG);
		var _Value = parent.fieldstr(iRow,window.GAMEUI_KEYSET_KEYVALUE);
		s_Action.SetData(_Action,"");
		s_KeyValue.SetData(_Value,"");
	}
};

//
//总的类：List
//
class VGameSetUp_KeyList_Logic VN2ListCtrl
{
	//需要显示时改变
	size="300,360";valign(50,0);halign(60,0);
	scroll = window.SCROLL_NOYES;
	//
	selecttype="1";colfilter="0";
	alpha = 70;bgcolor = "#FF";
	
	inclass("VGameSetUp_KeyList_UI"); //界面显示类

	columclass="0,VColumn_Action_Key_Logic"; //ID
};