//
//大厅 界面的(普通模式)类定义
//

//房间列表+	创建房间+快速加入
class VGameHall_UI VUIBG_UI
{
	size = "0%,0%";size="648,375";pos=window.HALL_WND_POS;bgcolor=-1;alpha=-1;

	//=============================与界面交互========================================
	void Init()
	{
		SetTitalPos("25,0");
		InitBG("$./imgs"+window.g_Sex+"/yxs-bt-text.tga");
		size=window.HALL_WND_SIZE;
		InitHelp();
		InitClose();

		new VPic9_BK2_UI{pos="14,63";size="619,290";}

		//显示全部房间：Radio
		staticvar s_R_AllRoom = new VRadio_BK_UI{InitText("全部房间");pos = "20,45";}
		//只显示等待房间：Radio
		staticvar s_R_WaitRoom = new VRadio_BK_UI{InitText("等待房间");pos = "81,45";}
		//只显示观战房间：Radio
		staticvar s_R_LookRoom = new VRadio_BK_UI{InitText("观战房间");pos = "142,45";}

		staticvar s_PageCtrl = new VPageCtrl_Base_UI{pos="266,316";}					//房间列表:翻页

		new VPic9_BK1_UI{valign(100,0);size="100%,125,-4,0";}
		new VPic9_BK2_UI{pos="15,"+(parent.height-111)+"";size="100%,93,-35,0";}
		//创建房间：按钮
		new img{pos="363,393";src="$./imgs"+window.g_Sex+"/cjfj-text.tga";}
		staticvar s_Btn_CreateRoom = new VBTN_Hall_Create_New{pos = "388,385";SetHangID(40);}

		new img{pos="505,393";src="$./imgs"+window.g_Sex+"/czfj-text.tga";}				//查找房间：字
		staticvar s_Btn_FindRoom = new VBTN_Hall_find_New{pos = "528,385";SetHangID(42);}				//查找

		new img{pos="26,393";src="$./imgs"+window.g_Sex+"/ksjr-text.tga";}				//快速开始：字
		staticvar s_Btn_Competitive_Singles = new VBTN_Hall_One_New
		{
			pos = "52,387";
			SetState(window.BTN_STATE_GREY);
		}	//单打
		staticvar s_Btn_Competitive_Doubles = new VBTN_Hall_Two_New
		{
			pos = "150,387";
			SetState(window.BTN_STATE_GREY);
		}	//双打
	}
};