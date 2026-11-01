//
//训练的 考证或者任务list
//

importex("$./../../UI/Train/ClassDef_TrainList.gml");

//一行显示类：名称+是否通过
class VColumn_Train_Logic item
{
	size = "300,30";
	var m_ID = 0;	//训练的ID
	//===========================与显示交互======================
	void Init()
	{
		//名称
		//参数1 name: 名称
		staticvar s_Name = new VMyText{}

		//状态
		//参数1 state：是否通过  0未通过 1通过
		staticvar s_State = new VMyText{pos = "150,0";}

		//图标
		//参数1 id: 名称
		staticvar s_Icon = new VMyText{pos(200,0);}
	}
	inclass("VColumn_Train_UI"); //界面显示类
	Init();
	//需要被显示的类覆盖
	void OnMySelect(){bgcolor = "#FFEA99";alpha = 50;}	//选择的效果
	void OnMyUnSelect(){bgcolor = "-1";}				//不选择的效果
	//===========================================================
	void OnLBDClick()
	{
		if (!m_State) return;
		parent.parent.OnClick_BtnEnter();
	}
	void OnSelect()
	{
		if (!m_State) return;
		parent.parent.s_Btn_Enter.SetState(window.BTN_STATE_LIGHT);
		OnMySelect();
		window.g_TrainID = m_ID;	//训练ID
	};
	void OnUnSelect()
	{
		if (!m_State) return;
		parent.parent.s_Btn_Enter.SetState(window.BTN_STATE_GREY);
		OnMyUnSelect();
	};
	void OnDataExchange(iRow,szData)
	{
		m_ID = szData;
		name = "Name_VColumn_Train_"+m_ID;

		var _Name = parent.fieldstr(iRow,window.TENNIS_GAME_TRAIN_NAME);	//名称
		var _State = parent.fieldstr(iRow,window.TENNIS_GAME_TRAIN_STATE);	//状态 0未通过 1通过
		var _icon = parent.fieldstr(iRow,window.TENNIS_GAME_TRAIN_ICON);	//图标
		var _Type = parent.fieldstr(iRow,window.TENNIS_GAME_TRAIN_TYPE);	
		
		s_Icon.SetData(_icon,"","");
		s_Name.SetData(_Name,"","");
		s_State.SetData(_State,"","");
		
		var _needLv = toint(parent.fieldstr(iRow,window.TENNIS_GAME_TRAIN_NEEDLV));
		if (window.GetLVByUID() < _needLv)
		{
			SetState(false);
		}
	}
};

//
//总的类：List
//
class VTrain_CourseList_Logic VN2ListCtrl
{
	//需要显示时改变
	size="300,200";pos = "100,100";
	scroll = window.SCROLL_NOYES;
	//
	selecttype="1";colfilter="0";simpleshowmode="1,15";
	
	inclass("VTrain_CourseList_UI"); //界面显示类

	columclass="0,VColumn_Train_Logic"; //识别id
	
	//[功能]为了选中某一个子对象
	//[参数]trainid:训练ID
	void SelectSubObjBy(trainid)
	{
		var _left = find("Name_VColumn_Train_"+trainid).left;
		var _top = find("Name_VColumn_Train_"+trainid).top;
		checkselect(_left+5,_top+5);
	}
};