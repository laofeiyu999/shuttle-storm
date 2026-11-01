//房间-邀请类定义
//2008年10月28日

class VRoom_Invite_UI VUIBG_UI
{
	size = "0%,0%";size=window.HALL_WND_SIZE;pos=window.HALL_WND_POS;bgcolor=-1;alpha=-1;
	
	//=============================与界面交互========================================
	void Init()
	{
		SetTitalPos("25,0");
		InitBG("$./../imgs"+window.g_Sex+"/yqlb-bt-text.tga");
		InitClose()			// new个X关闭钮
		//InitHelp()			// new个帮助钮
		InitBtnBG();		// 按钮框
		
		new VPic9_BK2_UI{pos = "15,62";size = "100%,100%,-30,-129";}
		new Invite_TopTipes{size="100%,32,-101,0"; pos="52,82";}

		staticvar s_R_All = new VRadio_BK_UI
		{
			InitText("全部"); pos="20,40";
		}

		staticvar s_R_Friend = new VRadio_BK_UI
		{
			InitText("好友"); pos="81,40";
		}

		staticvar s_Btn_Find = new VBTN_A_New
		{
			InitText("查找玩家"); //pos="383,428";
			pos(parent.width - 200, parent.height-window.G_POP_BTN_POSY);
		}
	}
};