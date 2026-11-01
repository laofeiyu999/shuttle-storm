//查找房间
//yxf 2009年10月20日

importex("$./../../../UI/Room/Invite/ClassDef_FindUser.gml");

class VFindUser_Logic item
{
	size = "400,500";bgcolor = "#FFFF";alpha = 50;
	var m_Type = 0;	//0房间名 2玩家昵称
	//=============================与界面交互========================================
	void Init()
	{
		//关闭：按钮
		staticvar s_Btn_Close = new VMyButton
		{
			Init("X");size = "30,30";halign(100,0);
		}	
		//帮助：按钮
		staticvar s_Btn_Help = new VMyButton
		{
			Init("？");size = "30,30";halign(90,0);
		}
		
		//输入:edit
		staticvar s_Edit_Input = new edit
		{
			size = "180,26";pos = "120,56";
			font = "宋体,-1,20";bgcolor = "#FF";color = "#FFFFFF";cursorcolor = "#FFFFFF";
			maxsize = 12;ycenter = true;xcenter = true;
		}

		//邀请：按钮
		staticvar s_Btn_Confirm = new VMyButton
		{
			Init("邀请");pos="23,429";
		}
		//取消：按钮
		staticvar s_Btn_Cancel = new VMyButton
		{
			Init("取消");pos="226,435";
		}
	}
	inclass("VFindUser_UI");//界面显示类
	//==============================function=========================================
	//点击了邀请
	void OnClick_Confirm()
	{
		var _NKName = s_Edit_Input.src;
		if (_NKName.Count < 4 || _NKName.Count > 12)
		{
			window.find("UIController").LoadDLG(331);//昵称长度应在4-12字符之间。
			s_Edit_Input.hot = 1;
			return;
		}
		var _res = window.JudgeAnyNameLicit(_NKName,"昵称");
		if (_res < 0)
		{
			s_Edit_Input.hot = 1;
			return;
		}
		
		var _UserID = window.GetInvitorUIDByName(_NKName);
		if (_UserID <= 0)
		{
			window.find("UIController").LoadDLG(300);//没有找到你想邀请的玩家！
			return;
		}
		//发出邀请某人加入房间消息:对方用户id
		window.Too_IRequestToRoom(_UserID);
		parent.del();
	}

	//设置响应事件
	void SetEvent()
	{
		set s_Btn_Close
		{
			void OnPressed(){parent.parent.del();}
		}
//		set s_Btn_Help
//		{
//			void OnPressed(){window.CallBack_Help(window.POS_WRITEMAIL);}
//		}

		set s_Btn_Confirm
		{
			void OnPressed()
			{
				if(GetState()==window.BTN_STATE_LIGHT){parent.OnClick_Confirm();}
			}
		}
		set s_Btn_Cancel
		{
			void OnPressed(){parent.parent.del();}
		}
	}
	
	//================================DBList=========================================
	Init();
	SetEvent();

	void OnCreated()
	{
		s_Edit_Input.timer(10,"hot=1");
		window.RemFindUser =1;
	}
	void OnDelete()
	{
		window.RemFindUser =0;
	}
};