//背包类定义 - 饰品
//yxf 2009年11月1日

class VPack_Jewelry_UI item
{
	size = "100%,100%";pos(0,0);bgcolor = "-1";alpha = -1;
	//=============================与界面交互========================================
	void Init()
	{	
		//全部：Radio
		staticvar s_R_JewelryAll	= new VRadio_Mall_all_New{pos = "50,75";}
		//项链：Radio
		staticvar s_R_Necklace		= new VRadio_Mall_neck_New{pos = "105,75";}
		//眼镜:Radio
		staticvar s_R_Glasses		= new VRadio_Mall_glass_New{pos = "160,75";}
		//背饰:Radio
		staticvar s_R_Back			= new VRadio_Mall_back_New{pos = "215,75";}
//		//护腕/手链：Radio
//		staticvar s_R_Cuff			= new VRadio_Mall_hand_New{pos = "270,75";}

		new MallRadioLine{pos = "98,81";}
		new MallRadioLine{pos = "153,81";}
		new MallRadioLine{pos = "208,81";}
//		new MallRadioLine{pos = "263,81";}
	}
};