//隐藏界面的类定义 - 显示


class VHall_HideUI_UI item
{
	size = "26,87";
	//pos="998,656";
	halign(100,0);valign(100,-113);
	bgcolor = -1;
	void Init()
	{
		//隐藏界面
		staticvar s_HideUI = new VBTN_ShowHide_New
		{
			InitText("隐藏界面");SetState(window.BTN_STATE_GREY);
		}
	}
};