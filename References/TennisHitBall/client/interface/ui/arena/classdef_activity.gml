//
//活动场 > 活动列表 :显示部分
//
importex("$./ClassDef_Tipe.gml");

class VArena_Activity_UI item
{
	pos = "0,0";size = "100%,100%";bgcolor=-1;alpha=-1;
	//=============================与界面交互========================================
	void Init()
	{
		new VPic9_BK2_UI{pos = "15,62";size(parent.width-30,parent.height-130);}
		new VPic3_ButtonBK_UI{pos = "15,"+(parent.height-62);size(parent.width-34,64);};

		staticvar s_ActivityTital = new ActivityTopTipes{}

		//查看活动
		staticvar s_Btn_LookOver = new VBTN_A_New
		{
			InitText("查看活动");pos(parent.width-110,parent.height-window.G_POP_BTN_POSY);
		}
		//报名
		staticvar s_Btn_Apply = new VBTN_A_New
		{
			InitText("报名");pos(parent.width-200,parent.height-window.G_POP_BTN_POSY);
		}
		//取消
		staticvar s_Btn_Cancel = new VBTN_A_New
		{
			InitText("取消");pos(parent.width-200,parent.height-window.G_POP_BTN_POSY);
		}
	}
};