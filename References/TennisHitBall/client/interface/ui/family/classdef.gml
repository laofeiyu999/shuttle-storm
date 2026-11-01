//家族界面
//夏洋洋 2010-3-2

class VFamily_UI VUIBG_UI
{
	size = "0%,0%";size=window.HALL_WND_SIZE;
	bgcolor=-1;alpha=-1;
	pos=window.HALL_WND_POS;

	void Init()
	{
		SetTitalPos("25,0");
		InitBG("$./imgs"+window.g_Sex+"/jz-bt-text.tga");	
		InitClose();
		InitHelp();

		// 内部白色背景。
		staticvar s_InternalBk = new VPic9_BK2_UI
		{
			left = 15;
			width = parent.width - 2 * left;
			top = 62;
			height = parent.height-top-20;
		}
		//我的家族：Radio
//		staticvar s_R_MyFamily = new VRadio_BK_UI
//		{
//			InitText("我的家族");
//			pos = "20,44";
//		}
		
		//家族列表:Radio
//		staticvar s_R_FamilyList = new VRadio_BK_UI
//		{
//			InitText("家族列表");
//			left = parent.s_R_MyFamily.left + parent.s_R_MyFamily.width + 1;
//			top = parent.s_R_MyFamily.top;
//		}
		
	}
}