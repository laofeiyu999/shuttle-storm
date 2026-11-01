//
//录像界面的显示类定义
//

class VVideo_UI VUIBG_UI
{
	size = "0%,0%";size=window.HALL_WND_SIZE;pos=window.HALL_WND_POS;bgcolor=-1;alpha=-1;
	void Init()
	{
		SetTitalPos("25,0");
		InitBG("$./imgs"+window.g_Sex+"/video_title.tga");
		InitClose()			// new个X关闭钮
		InitHelp()			// new个帮助钮
		InitBtnBG();		// 按钮框

		new VPic9_BK2_UI{pos = "15,38";size(parent.width-30,parent.height-105);}
		//观看：按钮
		staticvar s_Btn_Look = new VBTN_A_New
		{
			pos(parent.width-200,parent.height-window.G_POP_BTN_POSY);InitText("观看");
		}
		//删除：按钮
		staticvar s_Btn_Del = new VBTN_A_New
		{
			pos(parent.width-110,parent.height-window.G_POP_BTN_POSY); InitText("删除");
		}
		//翻页：录像
		staticvar s_PageCtrl = new VPageCtrl_Base_UI
		{
			pos="259,394";
		}
	}
};