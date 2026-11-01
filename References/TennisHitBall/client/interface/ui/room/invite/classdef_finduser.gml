//查找玩家
//

class VFindUser_UI VUIBG_UI
{
	size = "0%,0%";size = "308,208";bgcolor = -1;alpha = -1;
	valign(0,0);halign(0,0);pos = ""+(window.width-width)/2 + "," +(window.height-height)/2;

	//=============================与界面交互========================================
	void Init()
	{
		SetTitalPos("25,0");
		InitBG("$./../imgs"+window.g_Sex+"/czwj-bt-text.tga");
		InitBtnBG();
		InitClose();

		new VPic9_BK2_UI
		{
			size(parent.width-30,110);pos = "13,30";
		}
		new img
		{
			pos="53,61";
			src = "$./../../GmlCtrls/VMessageBox/imgs"+window.g_Sex+"/srwjnc-text.tga";
		}
		
		new VPic9_EditBK_UI{size = "146,19";pos="87,88";}
		
		staticvar s_Edit_Input = new BaseEdit
		{
			size = "146,19";pos="87,88";
			maxsize = 12;ycenter = true;xcenter = true;
		}

		//邀请：按钮
		staticvar s_Btn_Confirm = new VBTN_A_New
		{
			InitText("邀请");pos="40,"+(parent.height-window.G_POP_BTN_POSY);
		}
		//取消：按钮
		staticvar s_Btn_Cancel = new VBTN_A_New
		{
			InitText("取消");pos=""+(parent.width-120)+","+(parent.height-window.G_POP_BTN_POSY);
		}
	}
};