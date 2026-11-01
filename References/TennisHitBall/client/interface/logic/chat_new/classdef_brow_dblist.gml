
import("$./../../UI/Chat_New/ClassDef_Brow_DBList.gml");

///------------------------------表情-------------------------------
// 表情的一行显示类
class Column_Brow_DBList_Logic item
{
	size = "60,20";border = "#234324";bgcolor = "#FF00FF";alpha = 50;
	//var _RowBrow = "";var _mean="";
	//表情
	//var s_Brow = new ChatBrowImg{};

	var m_MyText = "";//文字
	var m_MyMark = "";//符号
	var m_ActID = "";//动作ID
	var m_ID = "";//ID

	//===========================与显示交互======================
	void Init()
	{
		
	}
	//需要被显示的类覆盖
	void OnMySelect(){}	//选择的效果
	void OnMyUnSelect(){}				//不选择的效果
	inclass("Column_Brow_DBList_UI"); //界面显示类
	Init();

	//============================================================

	//选中了再选就不能触发onselect，所以不能用onselect
	void OnMouseDownL()
	{
		window.find("ChatSend_Logic_name").m_Pos = window.find("VChat_Act_Brow_Logic_Name").find("Brow_DBList_Logic_NAME").getViewY();
		window.find("ChatSend_Logic_name").m_ChooseID = m_ID;
		//需要设个变量，以便让parent知道是谁被选中了
		//window.g_Mall_EntryID = m_EntryID;
		//先后顺序不能乱
		parent.scriptprcallsub("OnUnSelect");
		OnMySelect();
		var _obj = window.find("ChatMgr_Logic");
		if(_obj.m_LaBaType != window.CHAT_LABATYPE_ACTBUGLE && _obj.parent.m_ChatPos != window.CHAT_UIPOS_GAME)
		{
			//window.find("FSM").clearset(m_ActID);
			window.find("FSM").Clear_set_timelock(m_ActID,window.g_ActBugleLimit_Time);
		}//只有在非游戏中的非动作喇叭时才直接做动作
		else
		{
			_obj.SetActionBrow(m_ID,m_MyText);
		}
		parent.parent.del();
	}
	void OnUnSelect()
	{
		OnMyUnSelect();
	}
	void OnDataExchange(iRow,szData)
	{
		var _Text = parent.fieldstr(iRow,window.GAMEUI_CHAT_ACTION_PROMPT);	//文字
		m_MyMark = parent.fieldstr(iRow,window.GAMEUI_CHAT_ACTION_MARK);	//符号
		m_ID = parent.fieldstr(iRow,window.GAMEUI_CHAT_ACTION_ID);			//id
		
		s_Brow.SetData(szData,_Text,m_MyMark);

		//alert("m_ID: "+m_ID + " m_ChooseID: "+window.find("ChatSend_Logic_name").m_ChooseID);
		if (toint(m_ID) == toint(window.find("ChatSend_Logic_name").m_ChooseID))
		{
			_Over.show = true;
		}
	}
};

//
//总的类：List
//
class Brow_DBList_Logic VN2ListCtrl
{
	//需要显示时改变
	size="60,100";pos = "0,0";bgcolor="#aa";
	//如果选择的id被删了，会有什么情况，测试下
	
//	scroll = "no;yes";
	
	selecttype="1";colfilter="3";//simpleshowmode="1,20";
	alpha = 50;bgcolor = "#FF";//border = "#FFFF";
	//需要显示重载
	void Init()
	{
	}
	inclass("Brow_DBList_UI"); //界面显示类
	//移动到某个位置
	void ScrollToIndex(index)
	{
		var _targety = index * (-1);
		scrollto(0, _targety);
	}
	void SetEvent()
	{
	}
	columclass="3,Column_Brow_DBList_Logic"; //识别id
	Init();
	SetEvent();
};

/////------------------------------私聊对象-------------------------------
//// 私聊对象的一行显示类
//class Column_PrivateName_DBList_Logic item
//{
//	size = "60,20";border = "#234324";bgcolor = "#FF00FF";alpha = 50;
//	//var _RowBrow = "";
//	//===========================与显示交互======================
//	void Init()
//	{
//		//表情
//		staticvar s_text = new VMyText{size="60,20";};
//	}
//	//需要被显示的类覆盖
//	void OnMySelect(){}		//选择的效果
//	void OnMyUnSelect(){}	//不选择的效果
//	inclass("Column_PrivateName_DBList_UI"); //界面显示类
//	//============================================================
//	//设置响应事件
//	void SetEvent()
//	{
//		
//	}
//
//	//选中了再选就不能触发onselect，所以不能用onselect
//	void OnMouseDownL()
//	{
//		//需要设个变量，以便让parent知道是谁被选中了
//		//window.g_Mall_EntryID = m_EntryID;
//		//先后顺序不能乱
//		parent.scriptprcallsub("OnUnSelect");
//		OnMySelect();
//		parent.show=false;
//		parent.parent._selectprivatenamebk.show=false;
//		parent.parent.AddPrivateName(s_text.src);
//
//	}
//	void OnUnSelect()
//	{
//		OnMyUnSelect();
//	}
//	void OnDataExchange(iRow,szData)
//	{
//		s_text.src=szData;
//	}
//
//	Init();
//	SetEvent();
//};
//
////
////总的类：List
////
//class PrivateName_DBList_Logic VN2ListCtrl
//{
//	//需要显示时改变
//	size="60,100";pos = "105,400";
//	var _SelectBrow = "";
//	scroll = "no;yes";
//	//
//	selecttype="1";colfilter="0";
//	alpha = 50;bgcolor = "#FF";//border = "#FFFF";
//	//需要显示重载
//	void Init()
//	{
//	}
//	inclass("PrivateName_DBList_UI"); //界面显示类
//
//	void SetEvent()
//	{
//	}
//
//	columclass="0,Column_PrivateName_DBList_Logic"; //识别id
//	Init();
//	SetEvent();
//};
