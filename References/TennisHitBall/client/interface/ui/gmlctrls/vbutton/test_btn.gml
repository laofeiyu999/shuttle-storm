//
//测试按钮闪
//

import("$./../../../Logic/Init.gml");
//import("ClassDef.gml");
bkcolor = "#123456";

var _btn = new VBTN_Invite
{
	pos(160,0);
}

var _flag = 0;
void Run()
{
	var _index = 1;
	while(_flag)
	{
		_btn.SetState(_index);
		sleep(10);
		if (_index == 1)
		{
			_index = 2;
		}
		else
		{
			_index = 1;
		}
	}
}

new item
{
	size = "50,50";bgcolor = "#FF";
	void OnClick()
	{
		parent._flag = 1;
		parent.Run();
	}
}

new item
{
	size = "50,50";pos = "60,0";bgcolor = "#FF";
	void OnClick()
	{
		parent._flag = 0;
		parent.Run();
	}
}

new item
{
	size = "50,50";pos = "120,30";bgcolor = "#FF";
	var _index = 1;
	void OnClick()
	{
		parent._btn.SetState(_index);
		if (_index == 1)
		{
			_index = 2;
		}
		else
		{
			_index = 1;
		}
	}
}