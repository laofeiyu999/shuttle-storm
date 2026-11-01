//
//对话框的类定义
//yxf	2008年8月14日
//
import("$./../VMyButton/ClassDef.gml");

//只有一个确定按钮的提示框
class VMyMessageBox_1_Logic item
{
	window.PlaySound(112);//所有弹出对话框
	size = "100%,100%";bgcolor = window.G_BGCOLOR;alpha = window.G_ALPHA;capturemouse = true;
	new VGame_BtnLayer_Top_Logic{}
	
	name = "VMyMessageBox_1_Logic";
	window.g_RoomHangInfoYesOrNo = false;	//2010年9月21日 yxf
	window.find("gameinput").AddExclusiveShortcutUser(this);//添加快捷键独占用户
	var _lastChat =  window.GetChatEnterFlag();//0可以激活 1不激活
	window.SetChatEnterFlag(window.CHAT_ENTER_NO,"VMyMessageBox_1_Logic");//不激活
	void OnDelete()
	{
		window.SetChatEnterFlag(_lastChat,"VMyMessageBox_1_Logic-OnDelete");//0可以激活 1不激活
		window.find("gameinput").DelShortcutUser(this);//删除快捷键独占用户
		window.g_RoomHangInfoYesOrNo = true;	//2010年9月21日 yxf
	}

	void DI_ShortcutKey(data)
	{
		switch (data)
		{
			case 3: //Esc
			{
				OnCancel();break;
			}
			case 4: //Enter
			{
				OnConfirm();break;
			}
		}
	}
	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		del();
	}	
	//点击取消按钮或者按Esc时调用-继承时需要被覆盖
	void OnCancel()
	{
		del();
	}
	//construct
	function VMyMessageBox_1_Logic(id)
	{
		window.find("TOPLAYER").delallchild();

		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByInt(window.GAMEUI, window.DIALOG, window.GAMEUI_DIALOG_ID,id);
		var _Text = _VNet2DBRow.GetData( window.GAMEUI_DIALOG_DLGCONTENT );
		_VNet2DBRow.del();
		SetData(_Text);
	}

	//设置显示文字的内容
	void SetData(data)
	{
		_Box.s_Text_Cue.SetData(data,"");
	}
	
	//替换字符串数据
	//data:参数("1,2,3")
	void ReplaceData(data)
	{
		_Box.s_Text_Cue.SetData(window.ReplaceStr(_Box.s_Text_Cue.src,data),"");
	}

	//替换字符串数据
	void ReplaceData2(data)
	{
		_Box.s_Text_Cue.SetData(data,"");
	}

	var _Box = new item
	{
		size = "360,230";bgcolor = "#FF";valign(50,0);halign(50,0);
		//================================与显示交互=============================
		void Init()
		{
			//对话框内容
			staticvar s_Text_Cue = new VMyText
			{
				valign(50,0);halign(50,0);
				color = "#ffffff";
			}
			//确定按钮
			staticvar s_Btn_Confirm = new VMyButton
			{
				Init("确定");valign(96,0);halign(95,0);
			}
		}
		inclass("VMyMessageBox_1_UI");//界面显示类
		//======================================================================
		//设置响应事件
		void SetEvent()
		{
			set s_Btn_Confirm//确定按钮
			{
				void OnPressed(){parent.parent.OnConfirm();}
			}
			set s_BG.s_Btn_Close
			{
				void OnPressed(){parent.parent.parent.OnCancel();}
			}
		}
		Init();
		SetEvent();
	}
};

//含有两个按钮的提示框
class VMyMessageBox_2_Logic item
{
	window.PlaySound(112);//所有弹出对话框
	size = "100%,100%";bgcolor = window.G_BGCOLOR;alpha = window.G_ALPHA;capturemouse = true;
	new VGame_BtnLayer_Top_Logic{}

	name = "VMyMessageBox_2_Logic";
	window.g_RoomHangInfoYesOrNo = false;	//2010年9月21日 yxf
	window.find("gameinput").AddExclusiveShortcutUser(this);//添加快捷键独占用户
	var _lastChat =  window.GetChatEnterFlag();//0可以激活 1不激活
	window.SetChatEnterFlag(window.CHAT_ENTER_NO,"VMyMessageBox_2_Logic");//不激活
	void OnCreated()
	{
		OnCreated_EX();	//创建角色用
	}
	void OnDelete()
	{
		window.g_RoomHangInfoYesOrNo = true;	//2010年9月21日 yxf
		window.SetChatEnterFlag(window.CHAT_ENTER_YES,"VMyMessageBox_2_Logic-OnDelete");//0可以激活 1不激活
		window.find("gameinput").DelShortcutUser(this);//删除快捷键独占用户
		OnDelete_EX();	//创建角色用
	}

	void DI_ShortcutKey(data)
	{
		switch (data)
		{
			case 3: //Esc
			{
				OnCancel();break;
			}
			case 4: //Enter
			{
				OnConfirm(1);break;
			}
		}
	}
	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	//type:1回车快捷键 0点击按钮
	void OnConfirm(type)
	{
		del();
	}	
	//点击取消按钮或者按Esc时调用-继承时需要被覆盖
	void OnCancel()
	{
		del();
	}
	//construct
	function VMyMessageBox_2_Logic(id)
	{
		window.find("TOPLAYER").delallchild();

		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByInt(window.GAMEUI, window.DIALOG, window.GAMEUI_DIALOG_ID,id);
		var _Text = _VNet2DBRow.GetData( window.GAMEUI_DIALOG_DLGCONTENT );
		_VNet2DBRow.del();
		SetData(_Text);
	}

	//设置显示文字的内容
	void SetData(data)
	{
		_Box.s_Text_Cue.SetData(data,"");
	}

	//替换字符串数据
	//data:参数("1,2,3")
	void ReplaceData(data)
	{
		_Box.s_Text_Cue.SetData(window.ReplaceStr(_Box.s_Text_Cue.src,data),"");
	}
	var _Box = new item
	{
		size = "360,230";bgcolor = "#FF";valign(50,0);halign(50,0);
		//================================与显示交互=============================
		void Init()
		{
			//对话框内容
			staticvar s_Text_Cue = new VMyText
			{
				valign(50,0);halign(50,0);
				color = "#ffffff";
			}
			//确定按钮
			staticvar s_Btn_Confirm = new VMyButton
			{
				Init("确定");valign(96,0);halign(15,0);
			}
			//取消按钮
			staticvar s_Btn_Cancel = new VMyButton
			{
				Init("取消");valign(96,0);halign(95,0);
			}
		}
		inclass("VMyMessageBox_2_UI");//界面显示类
		//======================================================================
		//设置响应事件
		void SetEvent()
		{
			set s_Btn_Confirm//确定按钮
			{
				void OnPressed(){parent.parent.OnConfirm();}
			}
			set s_Btn_Cancel//取消按钮
			{
				void OnPressed(){parent.parent.OnCancel();}
			}
			set s_BG.s_Btn_Close
			{
				void OnPressed(){parent.parent.parent.OnCancel();}
			}
		}
		//隐藏父类的对象
		void HideAllObj()
		{
			s_Text_Cue.show = false;
			s_Btn_Confirm.show = false;
			s_Btn_Cancel.show = false;
		}
		Init();
		SetEvent();
	}
	//设置按钮的名字
	void SetBtn_ConfirmName(_name)
	{
		_Box.SetBtn_ConfirmName(_name);
	}
	void SetBtn_CancelName(_name)
	{
		_Box.SetBtn_CancelName(_name);
	}
};

//改名（家族，昵称）成功后弹框
//确定后程序将全部关闭
//add by chenjihui
class VMB_ModifyName_Suc VMyMessageBox_1_Logic
{
	name = "VMB_ModifyName_Suc";
	_Box.s_BG.s_Btn_Close.show = false;

	function VMB_ModifyName_Suc(id)
	{
		VMyMessageBox_1_Logic(id);
	}

	void OnConfirm()
	{
		window.del();
	}

	void DI_ShortcutKey(data)
	{
		switch (data)
		{
			case 4: //Enter
			{
				OnConfirm();break;
			}
		}
	}
}

//游戏强制退出（Alt-F4）弹出框
//add by chenjihui
//2011-5-18
class Enter_AltF4_Logic VMyMessageBox_2_Logic
{
	name = "Enter_AltF4_Logic";
	_Box.s_BG.s_Btn_Close.show = false;
	//construct
	function Enter_AltF4_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}
	void OnConfirm()
	{
		window.find("HALLGCMap").find("self").SendEventInfo();
		window.delaydel(500);
	}
	void OnCancel()
	{
		del();
	}
}
//连接类
class VLink_a a
{
	cursor = window.CURSOR_HAND;
	var _url = "";
	//私聊
	void OnMouseDownL()
	{
		window.g_CTennisUIInit.OpenIE("http://passport.mangogame.com/");
	}
	void savedata(_data)
	{
		_url = _data;
	}
};

//只有一个确定按钮的提示框<带链接的>
class VMyMessageBox_3_Logic item
{
	window.PlaySound(112);//所有弹出对话框
	size = "100%,100%";bgcolor = window.G_BGCOLOR;alpha = window.G_ALPHA;capturemouse = true;
	new VGame_BtnLayer_Top_Logic{}
	
	name = "VMyMessageBox_3_Logic";

	window.find("gameinput").AddExclusiveShortcutUser(this);//添加快捷键独占用户
	var _lastChat =  window.GetChatEnterFlag();//0可以激活 1不激活
	window.SetChatEnterFlag(window.CHAT_ENTER_NO,"VMyMessageBox_3_Logic");//不激活
	void OnDelete()
	{
		window.SetChatEnterFlag(_lastChat,"VMyMessageBox_3_Logic-OnDelete");//0可以激活 1不激活
		window.find("gameinput").DelShortcutUser(this);//删除快捷键独占用户
	}

	void DI_ShortcutKey(data)
	{
		switch (data)
		{
			case 3: //Esc
			{
				OnCancel();break;
			}
			case 4: //Enter
			{
				OnConfirm();break;
			}
		}
	}
	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		del();
	}	
	//点击取消按钮或者按Esc时调用-继承时需要被覆盖
	void OnCancel()
	{
		del();
	}
	//construct
	function VMyMessageBox_3_Logic(id)
	{
		window.find("TOPLAYER").delallchild();

		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByInt(window.GAMEUI, window.DIALOG, window.GAMEUI_DIALOG_ID,id);
		var _Text = _VNet2DBRow.GetData( window.GAMEUI_DIALOG_DLGCONTENT );
		_VNet2DBRow.del();
		SetData(_Text);
	}

	//设置显示文字的内容
	void SetData(data)
	{
		_Box.s_Text_Cue._html._body.appendHtml("<font size=12px><br><br>&nbsp;&nbsp;&nbsp;&nbsp;"+data+"</font>");
	}
	
	var _Box = new item
	{
		size = "360,230";bgcolor = "#FF";valign(50,0);halign(50,0);
		//================================与显示交互=============================
		void Init()
		{
			//对话框内容
			staticvar s_Text_Cue = new VMyText
			{
				valign(50,0);halign(50,0);
				color = "#ffffff";
			}
			//确定按钮
			staticvar s_Btn_Confirm = new VMyButton
			{
				Init("确定");valign(96,0);halign(95,0);
			}
		}
		inclass("VMyMessageBox_3_UI");//界面显示类
		//======================================================================
		//设置响应事件
		void SetEvent()
		{
			set s_Btn_Confirm//确定按钮
			{
				void OnPressed(){parent.parent.OnConfirm();}
			}
			set s_BG.s_Btn_Close
			{
				void OnPressed(){parent.parent.parent.OnCancel();}
			}
		}
		Init();
		SetEvent();
	}
};