
bgcolor = "#123456";


new editpos
{
	size = "20,20";pos = "0,100";bgcolor = "#FF";alpha = 50;
	var _times = 0;
	void OnClick()
	{
		if (_times%2 == 0)
		{
			window.find("UIController").LoadUI("UI_TRAINING"); //加载训练中的界面
		}
		else
		{
			window.find("TRAINING_LOGIC").del();
		}
		_times += 1;
	}
}

new text
{
	src = "昵称+能量";pos = "0,130";
	void OnClick()
	{
		window.LMH_Hide_HeadName("xor");
	}
}

new text
{
	src = "技能";pos = "0,160";
	void OnClick()
	{
		window.LMH_Hide_Skill("xor");
	}
}

new text
{
	src = "进度";pos = "0,190";
	void OnClick()
	{
		window.LMH_Hide_Point("xor");
		window.LMH_Updata_Point(2,3);
	}
}

new text
{
	src = "对话框";pos = "0,220";
	void OnClick()
	{
		window.LMH_Hide_DLG("xor");
	}
}

new text
{
	src = "TipInfo";pos = "0,250";bkcolor="#ff";
	void OnClick()
	{
		window.LMH_Updata_TipInfo(2,1);
		window.LMH_Hide_TipInfo("xor");
	}
}