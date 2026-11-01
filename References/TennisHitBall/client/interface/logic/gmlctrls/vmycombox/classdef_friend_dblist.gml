//ComBox-List类定义
//yxf 2009年10月26日

//一行显示类：昵称+性别
class VColumn_MallFriend_List_Logic item
{
	size = "200,30";bgcolor = "#FF00";
	var m_NkName = "";//昵称
	var m_JID = 0;	  //玩家的JID
	var m_Sex = 0;
	var m_State = 0;
	//===========================与显示交互======================
	void Init()
	{
		//昵称
		//参数 data1: 昵称
		staticvar s_NKname = new VMyText{}
		
		//性别
		//参数 data1：性别  0未知 1男 2女
		staticvar s_Sex = new VMyText{pos = "100,0";}
	}
	inclass("VColumn_MallFriend_List_UI"); //界面显示类
	Init();
	void OnMySelect(){bgcolor = "#FFEA99";alpha = 50;}	//选择的效果
	void OnMyUnSelect(){bgcolor = "-1";}				//不选择的效果
	//===========================================================
	void OnSelect()
	{
		OnMySelect();
		window.find("ComBoxList_"+parent.m_ListName).SetDefaultSrc(m_NkName);
		window.find("ComBoxList_"+parent.m_ListName).WhichSelect(m_JID,m_Sex);
		parent.SetShow(false);
	};

	void OnMouseOver(){OnMySelect();};
	void OnMouseOut(){OnMyUnSelect();};
	void OnDataExchange(iRow,szData)
	{
		m_Sex=0;
		m_NkName = parent.fieldstr(iRow,window.M_G_SERVER_FRIENDDT_NKNAME);
		m_Sex = parent.fieldstr(iRow,window.M_G_SERVER_FRIENDDT_SEX);	
		m_JID = parent.fieldstr(iRow,window.M_G_SERVER_FRIENDDT_JID);	
		m_State =  parent.fieldstr(iRow,window.M_G_SERVER_FRIENDDT_STATE);
		s_NKname.SetData(m_NkName,"");
		if (m_State ==1)
		{
			s_Sex.SetData(m_Sex,"");
		}
		else
			s_Sex.SetData(0,"");
	}
};

//
//总的类：List
//
class VMall_Friend_List_Logic VN2ListCtrl
{
	//需要显示时改变
	size="200,100";pos = "350,400";//simpleshowmode = "1,10";
	scroll = window.SCROLL_NOYES;
	//
	selecttype="1";colfilter="0";
	//bgcolor = "#00FF";
	alpha = 50;
	
	inclass("VMall_Friend_List_UI"); //界面显示类

	columclass="0,VColumn_MallFriend_List_Logic"; //ID
};