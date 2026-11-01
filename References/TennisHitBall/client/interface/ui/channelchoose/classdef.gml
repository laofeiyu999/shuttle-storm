//服务器选择界面的显示部分脚本
//yxf 

class VChannelChoose_UI VUIBG_UI
{
	size = "0%,0%";size=window.HALL_WND_SIZE;pos=window.HALL_WND_POS;bgcolor=-1;alpha=-1;

	void Init()
	{
		SetTitalPos("25,0");
		InitBG("$./imgs"+window.g_Sex+"/pdxz-bt-text.tga");
		InitClose()			// new个X关闭钮
		InitHelp()			// new个帮助钮
		InitBtnBG();		// 按钮框
		
		s_Btn_Close.SetState(window.BTN_STATE_GREY);

		//进入：按钮
		staticvar s_Btn_Enter = new VBTN_A_New
		{
			pos(parent.width-110,parent.height-window.G_POP_BTN_POSY); InitText("进入");
		}
	}
};