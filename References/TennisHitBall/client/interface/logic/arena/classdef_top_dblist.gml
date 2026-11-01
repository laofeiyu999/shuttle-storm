//
//活动排名逻辑类定义
//

importex("$./../../UI/Arena/ClassDef_Top_DBList.gml");

//一行显示类：排名+昵称+积分
class VColumn_ArenaTop_Logic item
{
	size = "287,30";//bgcolor = "#FF00";
	var _FlashLaterPlayParam = 0;	//延迟播放参数
	//===========================与显示交互======================
	void Init()
	{
		//排名
		//参数 data1：排名
		staticvar s_Index = new VMyText{}

		//昵称
		//参数 data1: 昵称
		staticvar s_NKname = new VMyText{pos = "50,0";}

		//积分
		//参数 data1: 
		staticvar s_AreneData = new VMyText{pos = "220,0";}
	}
	inclass("VColumn_ArenaTop_UI"); //界面显示类

	if(window.m_ListShowNameNum==2)
	{Init(2);}
	else
	{Init(1);}
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
	if(window.m_ListShowNameNum==2)
	{
		SetSize2();
		m_Bg.SetSize2();
//		s_Index.SetPos2();
//		s_AreneData.SetPos2();
	}
	else
	{
		SetSize1();
		m_Bg.SetSize1();
//		s_Index.SetPos1();
//		s_AreneData.SetPos1();
	}
	void OnDataExchange(iRow,szData)
	{
		var _nameStr = parent.fieldstr(iRow,window.M_G_SERVER_ARENADATA_NKNAME);
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
		s_Index.SetData(parent.fieldstr(iRow,window.M_G_SERVER_ARENADATA_SORT));	
		s_AreneData.SetData(parent.fieldstr(iRow,window.M_G_SERVER_ARENADATA_DATA));
		_FlashLaterPlayParam = parent.parent.m_laterPlayFlash;
		parent.parent.m_laterPlayFlash += 1;
		if(window.m_ListShowNameNum==2){FlashTopBG2(_FlashLaterPlayParam);}
		else{FlashTopBG(_FlashLaterPlayParam);}
	}
};

//
//总的类：List
//
class VArena_TopList_Logic VN2ListCtrl
{
	//需要显示时改变
	size="287,300";pos(400,0);scroll = window.SCROLL_NOYES;
	//
	selecttype="1";colfilter="0";bgcolor = "#00FF";
	
	inclass("VArena_TopList_UI"); //界面显示类

	columclass="0,VColumn_ArenaTop_Logic"; //ID
};