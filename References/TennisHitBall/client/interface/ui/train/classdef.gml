//
//训练
//

class VTrain_UI VUIBG_UI
{
	size = "0%,0%";size=window.HALL_WND_SIZE;pos=window.HALL_WND_POS;bgcolor=-1;alpha=-1;

	void Init()
	{
		SetTitalPos("25,0");
		InitBG("$./imgs"+window.g_Sex+"/xl-bt-text.tga");
		InitClose();
		InitHelp();
		InitBtnBG();

		new VPic9_BK2_UI{size = ""+(parent.width-30)+","+(parent.height-130);pos = "15, 62";}

		//新手赛:Radio
		staticvar s_R_Young = new VRadio_BK_UI
		{
			InitText("新手赛");pos="20,44";
		}
		//资格赛:Radio
		staticvar s_R_Qualification = new VRadio_BK_UI
		{
			InitText("资格赛");pos="81,44";
		}
		//巡回赛:Radio
		staticvar s_R_Tour = new VRadio_BK_UI
		{
			InitText("巡回赛");pos = "142,44";
		}
		//黄金赛:Radio
		staticvar s_R_Gold = new VRadio_BK_UI
		{
			InitText("黄金赛");pos = "203,44";
		}
		//大师赛:Radio
		staticvar s_R_Masters = new VRadio_BK_UI
		{
			InitText("大师赛");pos = "264,44";
		}
		//大满贯:Radio
		staticvar s_R_Grand_Slam = new VRadio_BK_UI
		{
			InitText("大满贯");pos = "325,44";
		}
		//翻页：邮件
		staticvar s_PageCtrl = new VPageCtrl_Base_UI
		{
			valign(100,-80);halign(50,0);
		}
		//开始训练
		staticvar s_Btn_Enter = new VBTN_A_New
		{
			pos=""+(parent.width-110)+","+(parent.height-window.G_POP_BTN_POSY);InitText("开始训练");
//			valign(50,0);halign(50,0);
		}
	}
};