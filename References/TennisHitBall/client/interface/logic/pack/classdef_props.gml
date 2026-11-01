//背包类定义 - 道具
//yxf 2009年11月1日

importex("$./../../UI/Pack/ClassDef_Props.gml");

class VPack_Props_Logic item
{
	size = "70%,65%";pos(0,50);bgcolor = "#FF";alpha = 50;
	var m_PropsIndex		= -1;	//道具 全部-1 辅助道具1,聊天工具0
	//=============================与界面交互========================================
	void Init()
	{	
		/*道具*/
		//道具-全部：Radio
		staticvar s_R_PropsAll = new VMyRadio
		{
			Init("全部");size = "50,30";pos = "60,30";
		}
		//辅助道具：Radio
		staticvar s_R_Help_Items = new VMyRadio
		{
			Init("辅助");size = "50,30";pos = "120,30";
		}
		//聊天工具：Radio
		staticvar s_R_Chat_Tools = new VMyRadio
		{
			Init("聊天");size = "50,30";pos = "180,30";
		}
	}
	inclass("VPack_Props_UI");//界面显示类
	//==============================function=========================================
	//切换选项卡
	//道具 全部-1 辅助道具1,聊天工具0
	void ChangeType(type)
	{
		m_PropsIndex = type;
		parent.OnMySelect(m_PropsIndex);
	}
	
	//设置响应事件
	void SetEvent()
	{
		//
//		set s_R_PropsAll
//		{
//			groupname="VPack_Props_Group";startstate="1";
//			void OnCheck(){if (GetChecked()){return;}MouseCheck();parent.ChangeType(-1);}
//			void OnUnCheck(){MouseUnCheck();}
//		}
//		set s_R_Help_Items
//		{
//			groupname="VPack_Props_Group";
//			void OnCheck(){if (GetChecked()){return;}MouseCheck();parent.ChangeType(1);}
//			void OnUnCheck(){MouseUnCheck();}
//		}
//		set s_R_Chat_Tools
//		{
//			groupname="VPack_Props_Group";
//			void OnCheck(){if (GetChecked()){return;}MouseCheck();parent.ChangeType(0);}
//			void OnUnCheck(){MouseUnCheck();}
//		}
	}

	void OnCreated()
	{
		Init();
		SetEvent();
	}
};

// add by chenjihui
// 2010-12-29
// 吃糖果结果扣金币
///////////////
class VMB_EateCandyResualtBad_Logic VMyMessageBox_1_Logic
{
	name = "VMB_EateCandyResualtBad_Logic";
	_Box.s_BG.s_Btn_Close.show = false;

	//construct
	function VMB_EateCandyResualtBad_Logic(id)
	{
		VMyMessageBox_1_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		
		del();
	}

	void OnCancel()
	{
		return;
	}

	set _Box
	{
		void Init()
		{	
			//对话框内容
			staticvar s_Text_Cue = new VMyText
			{
				valign(50,0);halign(50,0);
				color = "#ffffff";
			}
			//吃糖果：按钮
			staticvar s_Btn_Confirm = new VMyButton
			{
				Init("hehehe唉~为嘴伤身啊");valign(96,0);halign(15,0);
			}
		}
		HideAllObj();
		inclass("VEateCandyResult_UI");//界面显示类		
//		s_Btn_Confirm.SetSize(94,24);
		Init();
		s_Btn_Confirm.SetSize(94,24);
		SetEvent();
	}
};

// add by chenjihui
// 2010-12-30
// 吃糖果结果获经验
///////////////
class VMB_EateCandyResualtGetEx_Logic VMyMessageBox_1_Logic
{
	name = "VMB_EateCandyResualtGetEx_Logic";
	_Box.s_BG.s_Btn_Close.show = false;

	//construct
	function VMB_EateCandyResualtGetEx_Logic(id)
	{
		VMyMessageBox_1_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		
		del();
	}

	void OnCancel()
	{
		return;
	}

	set _Box
	{
		void Init()
		{	
			//对话框内容
			staticvar s_Text_Cue = new VMyText
			{
				valign(50,0);halign(50,0);
				color = "#ffffff";
			}
			//吃糖果：按钮
			staticvar s_Btn_Confirm = new VMyButton
			{
				Init("唉~为嘴伤身啊");valign(96,0);halign(15,0);
			}
		}
		HideAllObj();
		inclass("VEateCandyResult_UI");//界面显示类		
		Init();
		s_Btn_Confirm.InitText("吃嘛嘛香！");
		SetEvent();
	}
};

// add by chenjihui
// 2010-12-30
// 吃糖果结果无操作
///////////////
class VMB_EateCandyResualtNo_Logic VMyMessageBox_1_Logic
{
	name = "VMB_EateCandyResualtNo_Logic";
	_Box.s_BG.s_Btn_Close.show = false;

	//construct
	function VMB_EateCandyResualtNo_Logic(id)
	{
		VMyMessageBox_1_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		
		del();
	}

	void OnCancel()
	{
		return;
	}

	set _Box
	{
		void Init()
		{	
			//对话框内容
			staticvar s_Text_Cue = new VMyText
			{
				valign(50,0);halign(50,0);
				color = "#ffffff";
			}
			//吃糖果：按钮
			staticvar s_Btn_Confirm = new VMyButton
			{
				Init("唉~为嘴伤身啊");valign(96,0);halign(15,0);
			}
		}
		HideAllObj();
		inclass("VEateCandyResult_UI");//界面显示类		
		Init();
		s_Btn_Confirm.InitText("真纠结啊！");
		SetEvent();
	}
};

// 愚人节版---心跳的感觉 
// add by chenjihui
// 2011-3-1
///////////////
class VMB_HartBeat_Logic VMyMessageBox_1_Logic
{
	name = "VMB_HartBeat_Logic";
	_Box.s_BG.s_Btn_Close.show = false;
	var m_EnterID = 0;

	//construct
	function VMB_HartBeat_Logic(id)
	{
		VMyMessageBox_1_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		var param1 = ""+m_EnterID+",1";
		var param2 = ""+window.g_Fool_GoodID+",1";
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_SHOP,"UseGoodsTrick",param1);//发送使用虚拟物品消息
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_SHOP,"UseGoodsFinish",param2);//发送消耗物品完成消息
		del();
	}

	void OnCancel()
	{
		return;
	}

	set _Box
	{
		void Init()
		{	
			//对话框内容
			staticvar s_Text_Cue = new VMyText
			{
				valign(50,0);halign(50,0);
				color = "#ffffff";
			}
			//吃糖果：按钮
			staticvar s_Btn_Confirm = new VMyButton
			{
				Init("hart_bit");valign(96,0);halign(15,0);
			}
		}
		HideAllObj();
		inclass("VEateCandyResult_UI");//界面显示类		
		Init();
		s_Btn_Confirm.InitText("杯具了...");
		SetEvent();
	}
};

// 愚人节版---心碎的感觉 
// add by chenjihui
// 2011-3-1
class VMB_BrokenHart_Logic VMyMessageBox_2_Logic
{
	name = "VMB_BrokenHart_Logic";

	var m_EntryID = 0;

	window.g_Row.Release();

	//construct
	function VMB_BrokenHart_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		window.find("UIController").LoadDLG(848);
		del();
	}

	//点击取消按钮或者敲回车时调用-继承时需要被覆盖
	void OnCancel()
	{	
		del();
	}
	
	void DI_ShortcutKey(data)
	{
		return;
	}
	set _Box
	{
		void Init()
		{	
			//对话框内容
			staticvar s_Text_Cue = new VMyText
			{
				valign(50,0);halign(50,0);
				color = "#ffffff";
			}
			//吃糖果：按钮
			staticvar s_Btn_Confirm = new VMyButton
			{
				Init("玩的就是心跳");valign(96,0);halign(15,0);
			}
			//不吃：按钮
			staticvar s_Btn_Cancel = new VMyButton
			{
				Init("再想想");valign(96,0);halign(95,0);
			}
		}
		HideAllObj();
		inclass("VMB_EateCandyOrNot_UI");//界面显示类
		Init();
		s_BG.s_Btn_Close.show = false;
		s_Btn_Confirm.InitText("玩的就是心跳");
		s_Btn_Cancel.InitText("再想想");
		SetEvent();
	}
};

// 愚人节版---心碎的感觉1 
// add by chenjihui
// 2011-3-1
///////////////
class VMB_BrokenHart_Logic1 VMyMessageBox_1_Logic
{
	name = "VMB_BrokenHart_Logic1";
	_Box.s_BG.s_Btn_Close.show = false;

	//construct
	function VMB_BrokenHart_Logic1(id)
	{
		VMyMessageBox_1_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		window.find("UIController").LoadDLG(849);
		del();
	}

	void OnCancel()
	{
		return;
	}

	set _Box
	{
		void Init()
		{	
			//对话框内容
			staticvar s_Text_Cue = new VMyText
			{
				valign(50,0);halign(50,0);
				color = "#ffffff";
			}
			//吃糖果：按钮
			staticvar s_Btn_Confirm = new VMyButton
			{
				Init("确定");valign(96,0);halign(15,0);
			}
		}
		HideAllObj();
		inclass("VEateCandyResult_UI");//界面显示类		
		Init();
		s_Btn_Confirm.InitText("确定");
		SetEvent();
	}
};

// 愚人节版---心碎的感觉2 
// add by chenjihui
// 2011-3-1
///////////////
class VMB_BrokenHart_Logic2 VMyMessageBox_1_Logic
{
	name = "VMB_BrokenHart_Logic2";
	_Box.s_BG.s_Btn_Close.show = false;

	//construct
	function VMB_BrokenHart_Logic2(id)
	{
		VMyMessageBox_1_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		var param1 = "847,1";
		var param2 = ""+window.g_Fool_GoodID+",1";
	
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_SHOP,"UseGoodsTrick",param1);//发送使用虚拟物品消息
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_SHOP,"UseGoodsFinish",param2);//发送消耗物品完成消息	
		del();
	}

	void OnCancel()
	{
		return;
	}

	set _Box
	{
		void Init()
		{	
			//对话框内容
			staticvar s_Text_Cue = new VMyText
			{
				valign(50,0);halign(50,0);
				color = "#ffffff";
			}
			//吃糖果：按钮
			staticvar s_Btn_Confirm = new VMyButton
			{
				Init("吓死了...");valign(96,0);halign(15,0);
			}
		}
		HideAllObj();
		inclass("VEateCandyResult_UI");//界面显示类		
		Init();
		s_Btn_Confirm.InitText("吓死了...");
		SetEvent();
	}
};

//愚人节版---心动感觉1
//add by chenjihui
//2011-3-1
class VMB_Touched_Logic1 VMyMessageBox_1_Logic
{
	name = "VMB_Touched_Logic1";
	_Box.s_BG.s_Btn_Close.show = false;

	//construct
	function VMB_Touched_Logic1(id)
	{
		VMyMessageBox_1_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		var _NKName = GetSrc();
		if (_NKName.Count == 0)
		{
			window.find("NAME_GCMap").KeyBoardEnable(1);//0锁定解锁按键 1解除锁定
			window.find("UIController").LoadDLG(237);//昵称长度应在4-12字符之间。
			return;
		}
		else if (_NKName.Count < 4 || _NKName.Count > 12)
		{
			window.find("NAME_GCMap").KeyBoardEnable(1);//0锁定解锁按键 1解除锁定
			window.find("UIController").LoadDLG(331);//昵称长度应在4-12字符之间。
			_Box.s_Edit.hot = 1;
			return;
		}
		var _res = window.JudgeAnyNameLicit(_NKName,"昵称");
		if (_res < 0)
		{
			window.find("NAME_GCMap").KeyBoardEnable(1);//0锁定解锁按键 1解除锁定
			_Box.s_Edit.hot = 1;
			return;
		}
		window.find("UIController").LoadDLG(851);
		del();
	}

	void OnCancel()
	{
		return;
	}

	//得到输入框的内容
	void GetSrc()
	{
		return _Box.s_Edit.src;
	}

	set _Box
	{
		void Init()
		{	
			//对话框内容
			staticvar s_Text_Cue = new VMyText
			{
				valign(50,0);halign(50,0);
				color = "#ffcc66";
			}
			//昵称输入框
			staticvar s_Edit = new edit
			{
				size = "146,19";//pos="440,370";
				halign(50,0);valign(50,0);
				maxsize = 12;timer(10,"hot=1");ycenter = true;xcenter = true;
			}
			//吃糖果：按钮
			staticvar s_Btn_Confirm = new VMyButton
			{
				Init("求婚");valign(96,0);halign(15,0);
			}
		}
		HideAllObj();
		inclass("VMB_Touched_UI");//界面显示类		
		Init();
		SetEvent();
	}
}

//愚人节版---心动感觉2
// add by chenjihui
// 2011-3-1
///////////////
class VMB_Touched_Logic2 VMyMessageBox_1_Logic
{
	name = "VMB_Touched_Logic2";
	_Box.s_BG.s_Btn_Close.show = false;

	//construct
	function VMB_Touched_Logic2(id)
	{
		VMyMessageBox_1_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		var param1 = "850,1";
		var param2 = ""+window.g_Fool_GoodID+",1";
	
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_SHOP,"UseGoodsTrick",param1);//发送使用物品消息
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_SHOP,"UseGoodsFinish",param2);//发送消耗物品完成消息
		del();
	}

	void OnCancel()
	{
		return;
	}

	set _Box
	{
		void Init()
		{	
			//对话框内容
			staticvar s_Text_Cue = new VMyText
			{
				valign(50,0);halign(50,0);
				color = "#ffffff";
			}
			//吃糖果：按钮
			staticvar s_Btn_Confirm = new VMyButton
			{
				Init("真要来了");valign(96,0);halign(15,0);
			}
		}
		HideAllObj();
		inclass("VEateCandyResult_UI");//界面显示类		
		Init();
		s_Btn_Confirm.InitText("真要来了");
		SetEvent();
	}
};

//愚人节版---心酸感觉1
// add by chenjihui
// 2011-3-1
///////////////
class VMB_BadFeel_Logic1 VMyMessageBox_1_Logic
{
	name = "VMB_BadFeel_Logic1";
	_Box.s_BG.s_Btn_Close.show = false;

	//construct
	function VMB_BadFeel_Logic1(id)
	{
		VMyMessageBox_1_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		window.find("UIController").LoadDLG(853);
		del();
	}

	void OnCancel()
	{
		return;
	}

	set _Box
	{
		void Init()
		{	
			//对话框内容
			staticvar s_Text_Cue = new VMyText
			{
				valign(50,0);halign(50,0);
				color = "#ffffff";
			}
			//吃糖果：按钮
			staticvar s_Btn_Confirm = new VMyButton
			{
				size = "100,35";
				Init("真的假的？");valign(96,0);halign(15,0);
			}
		}
		HideAllObj();
		inclass("VEateCandyResult_UI");//界面显示类		
		Init();
		s_Btn_Confirm.InitText("真的假的？");
		SetEvent();
	}
};

//愚人节版---心酸感觉2
// add by chenjihui
// 2011-3-1
///////////////
class VMB_BadFeel_Logic2 VMyMessageBox_1_Logic
{
	name = "VMB_BadFeel_Logic2";
	_Box.s_BG.s_Btn_Close.show = false;

	//construct
	function VMB_BadFeel_Logic2(id)
	{
		VMyMessageBox_1_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		var param1 = "852,1";
		var param2 = ""+window.g_Fool_GoodID+",1";
	
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_SHOP,"UseGoodsTrick",param1);//发送使用虚拟物品消息
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_SHOP,"UseGoodsFinish",param2);//发送消耗物品完成消息
		del();
	}

	void OnCancel()
	{
		return;
	}

	set _Box
	{
		void Init()
		{	
			//对话框内容
			staticvar s_Text_Cue = new VMyText
			{
				valign(50,0);halign(50,0);
				color = "#ffffff";
			}
			//吃糖果：按钮
			staticvar s_Btn_Confirm = new VMyButton
			{
				Init("囧");valign(96,0);halign(15,0);
			}
		}
		HideAllObj();
		inclass("VEateCandyResult_UI");//界面显示类		
		Init();
		s_Btn_Confirm.InitText("囧");
		SetEvent();
	}
};
