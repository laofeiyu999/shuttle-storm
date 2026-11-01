//
//商城：购物-热销类定义
//段晓彤, 2010年5月28日

class VMall_Shopping_HotSale_UI item
{
	size = "100%,100%";pos = "0,0";alpha = -1;
	//=============================与界面交互========================================
	void Init()
	{
		//全部:Radio
		staticvar s_R_All = new VRadio_Mall_all_New{pos = "50,30";}
		//服饰:Radio
		staticvar s_R_Dress = new VRadio_Mall_Dress_New{pos = "110,34";}
		//美容:Radio
		staticvar s_R_Face = new VRadio_Mall_HairDressing_New{pos = "164,34";}
		//道具:Radio
		staticvar s_R_Item = new Vradio_Mall_Item_New{pos = "217,34";}

		new MallRadioLine{pos = "98,36";}
		new MallRadioLine{pos = "153,36";}
		new MallRadioLine{pos = "208,36";}
	}
};
