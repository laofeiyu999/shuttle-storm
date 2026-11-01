//
//商城：购物-服饰类定义
//yxf 2008年9月16日13:53
//

class VMall_Shopping_Dress_UI item
{
	size = "100%,100%";pos = "0,0";alpha = 0;
	//=============================与界面交互========================================
	void Init()
	{
		//上装：Radio
		staticvar s_R_Clothing	= new VRadio_Mall_cloth_New{pos = "50,30";}
		//裙/裤：Radio
		staticvar s_R_Trousers	= new VRadio_Mall_trousers_New{pos = "100,30";}
		//手套:Radio
		staticvar s_R_Glove		= new VRadio_Mall_glove_New{pos = "160,30";}
		//袜子:Radio
		staticvar s_R_Stocking	= new VRadio_Mall_sock_New{pos = "215,30";}
		//鞋:Radio
		staticvar s_R_Shoe		= new VRadio_Mall_shoes_New{pos = "270,30";}

		new MallRadioLine{pos = "98,36";}
		new MallRadioLine{pos = "153,36";}
		new MallRadioLine{pos = "208,36";}
		new MallRadioLine{pos = "263,36";}
	}
};