//
//录像的 DBlist
//

importex("$./../../UI/Video/ClassDef_DBList.gml");

//一行显示类：录像名称标题+录像日期+录像文件大小
class VColumn_VideoList_Logic item
{
	size = "500,60";
	
	//===========================与显示交互======================
	void Init()
	{
		//录像名称标题
		//参数 data1: 
		staticvar s_Title = new VMyText{}

		//录像日期
		//参数 data1:
		staticvar s_Date = new VMyText
		{
			pos = "0,30";
		}

		//录像文件大小
		//参数 data1:
		staticvar s_Size = new VMyText
		{
			pos = "400,30";
		}
	}
	inclass("VColumn_VideoList_UI"); //界面显示类
	Init();
	//需要被显示的类覆盖
	void OnMySelect(){bgcolor = "#FFEA99";alpha = 50;}	//选择的效果
	void OnMyUnSelect(){bgcolor = "-1";}				//不选择的效果
	//===========================================================
	void OnSelect()
	{
		OnMySelect();
		parent.parent.s_Btn_Look.SetState(window.BTN_STATE_LIGHT);
		parent.parent.s_Btn_Del.SetState(window.BTN_STATE_LIGHT);
	}
	void OnUnSelect()
	{
		OnMyUnSelect();
		parent.parent.s_Btn_Look.SetState(window.BTN_STATE_GREY);
		parent.parent.s_Btn_Del.SetState(window.BTN_STATE_GREY);
	}
	void OnDataExchange(iRow,szData)
	{
		s_Title.SetData(parent.fieldstr(iRow,window.GAMEUI_VIDEOINFO_TITLE),"","");
		s_Date.SetData(parent.fieldstr(iRow,window.GAMEUI_VIDEOINFO_DATA),"","");
		s_Size.SetData(parent.fieldstr(iRow,window.GAMEUI_VIDEOINFO_SIZE),"","");
	}
	void OnMouseDownR()
	{
		parent.checkselect(20,parent.mousey);
		set window.find("TOPLAYER")
		{
			new VMyMouseR_VideoDel
			{
				//点击了观看
				void On_Play(data)
				{
					window.find("VIDEO_LOGIC")._VVideo_Logic.OnClick_BtnLook();
				}		
				//删除录像
				void On_Del(data)
				{
					window.find("VIDEO_LOGIC")._VVideo_Logic.OnClick_BtnDel();
				}
			}
		}
	}
	void OnLBDClick()
	{
		parent.parent.OnClick_BtnLook();
	}
};

//
//总的类：List
//
class VVideoList_Logic VN2ListCtrl
{
	//需要显示时改变
	size="500,400";pos(100,10);
	//
	selecttype="1";colfilter="0";simpleshowmode="1,6";
	alpha = 70;bgcolor = "#FF";
	
	inclass("VVideoList_UI"); //界面显示类

	columclass="0,VColumn_VideoList_Logic"; //识别id
};