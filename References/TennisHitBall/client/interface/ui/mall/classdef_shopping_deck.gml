//
//商城：购物-服饰类定义
//yxf 2008年9月16日13:53
//


class VMall_Shopping_Deck_UI item
{
	size = "100%,100%";pos = "0,0";alpha = 0;
	//=============================与界面交互========================================
	void Init()
	{
		//项链:Radio
		staticvar s_R_Deck1 = new VRadio_Mall_neck_New{pos = "50,30";}
		//眼镜:Radio
		staticvar s_R_Deck2 = new VRadio_Mall_glass_New{pos = "105,30";}
		//背饰:Radio
		staticvar s_R_Deck3 = new VRadio_Mall_back_New{pos = "160,30";}

		new MallRadioLine{pos = "98,36";}
		new MallRadioLine{pos = "153,36";}
	}
};