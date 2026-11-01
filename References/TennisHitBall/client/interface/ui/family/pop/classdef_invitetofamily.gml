//邀请加入家族


class VInviteToFamily_UI VUIBG_UI
{
	size = "250,170";
	bgcolor = -1;alpha = 0;
	pos = ""+(window.width-width)/2 + "," +(window.height-height)/2;
	//================================与显示交互=============================
	void Init()
	{
		SetTitalPos("25,0");
		InitBG("$./imgs"+window.g_Sex+"/yqjr-bt-text.tga");
		InitBtnBG();

		new VPic9_BK2_UI
		{
			pos = "15,33";size = "215,70";
		}
		staticvar _Flag = new img
		{
			valign(30,0);halign(15,0);
			src = "$./imgs"+window.g_Sex+"/srwjnc-text.tga";
		}
		new VPic9_EditBK_UI{size = "146,19";left = parent._Flag.left+10;top=parent._Flag.top + parent._Flag.height + 10;}
		//昵称输入框
		staticvar s_Edit = new BaseEdit
		{
			size = "146,19";left = parent._Flag.left+10;top=parent._Flag.top + parent._Flag.height + 10;
			maxsize = 12;timer(10,"hot=1");ycenter = true;xcenter = true;
		}
		staticvar s_Btn_Ok = new VBTN_A_New
		{
			InitText("确定");
			valign(80,0);halign(15,0);
		}
		staticvar s_Btn_Cancle = new VBTN_A_New
		{
			InitText("取消");
			valign(80,0);halign(85,0);
		}
		staticvar s_Btn_Close = new VBTN_Close_New
		{
			pos = "215,8";
		}
	}
};