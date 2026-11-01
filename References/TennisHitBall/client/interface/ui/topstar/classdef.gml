//大厅-明星榜 类定义
//
class VTopStar_UI VUIBG_UI
{
	size = "0%,0%";size=window.HALL_WND_SIZE;pos=window.HALL_WND_POS;bgcolor=-1;alpha=-1;

	void Init()
	{
		SetTitalPos("25,0");
		InitBG("$./imgs"+window.g_Sex+"/top_title.tga");
		InitClose();		// new个X关闭钮
		InitHelp();			// new个帮助钮
		InitBtnBG();		// 按钮框

		new VPic9_BK2_UI
		{
			pos = "14,62";size = "619,415";
		}
		//人气
		staticvar s_R_Favor = new VRadio_BK_UI
		{
			InitText("人气"); pos="20,44";
		}

		//个人
		staticvar s_R_Self = new VRadio_BK_UI
		{
			InitText("个人"); pos="80,44";
		}
		//家族
		staticvar s_R_Family = new VRadio_BK_UI
		{
			InitText("家族"); pos="140,44";
		}
//		//黄金联赛 
//		staticvar s_R_GlMatch = new VRadio_BK_UI
//		{
//			InitText("搭档"); pos="200,44";
//		}
//		//搭档 
//		staticvar s_R_Partner = new VRadio_BK_UI
//		{
//			InitText("搭档"); pos="200,44";
//		}
		//情侣
		staticvar s_R_Lover = new VRadio_BK_UI
		{
			InitText("情侣"); pos="200,44";
		}
	}
};