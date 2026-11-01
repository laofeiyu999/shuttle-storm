//
//表情列表 List
//yxf 2008年12月11日
//

import("$./../../../UI/GmlCtrls/ChatBrow/ClassDef_DBlist.gml");

//一行显示类：表情图标
class VColumn_ChatBrow_Logic item
{
	size = "100,30";bgcolor = "#FFEA99";
	var m_MyMark = "";//符号
	//===========================与显示交互======================================
	void Init()
	{
		//表情图片
		//参数 data1：序号
		//参数 data2：文字
		//参数 data3: 符号
		//参数 data4: 帧数
		//参数 data5: 速度
		staticvar s_Brow = new VMyText{}
	}
	inclass("VColumn_ChatBrow_UI"); //界面显示类
	Init();
	//============================================================================
	void OnSelect()
	{
		if (parent.parent.m_Type == 1) //好友消息
		{
			window.find("SENDMSG_LOGIC")._SendMsg_Logic.AddFace(m_MyMark);
		}
		else //聊天
		{
			window.find("ChatMgr_Logic")._send.AddFace(m_MyMark);
		}
		parent.parent.del();
	};
	void OnUnSelect(){};
	void OnDataExchange(iRow,szData)
	{
		var _Text = parent.fieldstr(iRow,window.GAMEUI_CHAT_BROW_PROMPT);//文字
		m_MyMark = parent.fieldstr(iRow,window.GAMEUI_CHAT_BROW_MARK);	//符号
		var _frame = parent.fieldstr(iRow,window.GAMEUI_CHAT_BROW_FRAME);	//帧数
		var _speed = parent.fieldstr(iRow,window.GAMEUI_CHAT_BROW_SPEED);	//速度
		s_Brow.SetData(szData,_Text,m_MyMark,_frame,_speed);
	}
};

//
//总的类：List
//
class VChatBrow_List_Logic VN2ListCtrl
{
	size = "251,200";bgcolor = "#00FF00";alpha = 80;//需要显示时改变
	selecttype="1";colfilter="0";simpleshowmode="1,20";
	
	inclass("VChatBrow_List_UI"); //界面显示类

	columclass="0,VColumn_ChatBrow_Logic"; //服务器ID
};