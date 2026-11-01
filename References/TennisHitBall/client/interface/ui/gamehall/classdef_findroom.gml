//查找房间
//

class VFindRoom_UI VUIBG_UI
{
	size = "0%,0%";size = "308,208";bgcolor = -1;alpha = -1;
	valign(0,0);halign(0,0);pos = ""+(window.width-width)/2 + "," +(window.height-height)/2;

	//=============================与界面交互========================================
	void Init()
	{
		SetTitalPos("25,0");
		InitBG("$./imgs"+window.g_Sex+"/czfj-bt-text.tga");
		InitBtnBG();
		InitClose();

		new VPic9_BK2_UI{pos = "20,40";size = "100%,100%,-40,-110";}

		new img{pos="43,54";src="$./imgs"+window.g_Sex+"/cz-text.tga";}
		
		staticvar s_CB_Type = new VMyDropMenu_UI{}
		
		//输入:edit
		new img{pos="43,99";src="$./imgs"+window.g_Sex+"/sr-text.tga";}
		
		new VPic9_EditBK_UI{size = "146,19";pos = "100,97";}
		
		staticvar s_Edit_Input = new BaseEditNum
		{
			size = "146,19";pos = "100,97";
			maxsize = 4;ycenter = true;xcenter = true;
			SetOnlyNum(true);
		}

		//加入房间：按钮
		staticvar s_Btn_Confirm = new VBTN_A_New
		{
			InitText("加入房间");pos="40,"+(parent.height-window.G_POP_BTN_POSY);
		}
		//取消：按钮
		staticvar s_Btn_Cancel = new VBTN_A_New
		{
			InitText("取消");pos=""+(parent.width-120)+","+(parent.height-window.G_POP_BTN_POSY);
		}
	}
};