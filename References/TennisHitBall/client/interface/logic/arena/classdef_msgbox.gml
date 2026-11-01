
//设置宣言
class VMB_SetSlogan_Logic VMyMessageBox_2_Logic
{
	name = "VMB_SetSlogan_Logic";

	//construct
	function VMB_SetSlogan_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		var _msg = GetSrc();
		if(_msg.TrimLeft(" ") == "")
		{
			_Box.s_Edit.src = "";
			_Box.s_Edit.hot = 1;
			window.find("UIController").LoadDLG(259);//获胜感言不能为空！
			return;
		}

		var _res = window.JudgeAnyNameLicit(_msg,"获胜感言");
		if (_res < 0)
		{
			_Box.s_Edit.hot = 1;
			return;
		}
		window.find("ARENA_LOGIC")._VArena_Logic.m_Class_MyActivity.SetSloganOver(_msg);
		
		del();
	}	
	// 设置输入框内容
	void SetSrc(data)
	{
		_Box.s_Edit.src = data;
		_Box.s_Edit.selectall = true;
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
			//昵称输入框
			staticvar s_Edit = new edit
			{
				valign(50,0);halign(50,0);
				color = "#ffffff";bgcolor = "#FF";
				size = "200,50";maxsize = 10;hot = 1;
			}
			//确定按钮
			staticvar s_Btn_Confirm = new VMyButton
			{
				Init("L加");valign(96,0);halign(15,0);
			}
			//取消按钮
			staticvar s_Btn_Cancel = new VMyButton
			{
				Init("L不加");valign(96,0);halign(95,0);
			}
		}

		HideAllObj();
		inclass("VMB_SetSlogan_UI");//界面显示类
		Init();
		SetEvent();
	}
};

class VMB_ArenaOverTip_Logic VMyMessageBox_1_Logic
{
	name = "VMB_ArenaOverTip_Logic";
	function VMB_ArenaOverTip_Logic(id)
	{
		VMyMessageBox_1_Logic(id);
	}

	//替换字符串数据
	//data:参数("1,2,3")
	void ReplaceData(data)
	{
		_Box.s_Text_Cue.SetData(window.ReplaceStr(_Box.s_Text_Cue.src,data),"");
	}
}