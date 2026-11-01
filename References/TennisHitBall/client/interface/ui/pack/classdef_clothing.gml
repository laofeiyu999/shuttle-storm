//背包类定义 - 服装
//yxf 2009年11月1日

class VPack_Clothing_UI item
{
	size = "100%,100%";pos(0,0);bgcolor = "-1";alpha = -1;
	//=============================与界面交互========================================
	void Init()
	{	
		//全部：Radio
		staticvar s_R_ClothingAll = new VRadio_Mall_all_New{pos = "50,75";}
		//上装：Radio
		staticvar s_R_Jacket	= new VRadio_Mall_cloth_New{pos = "105,75";}
		//裙/裤：Radio
		staticvar s_R_Trouser	= new VRadio_Mall_trousers_New{pos = "155,75";}
		//手套：Radio
		staticvar s_R_Glove		= new VRadio_Mall_glove_New{pos = "215,75";}
		//袜:Radio
		staticvar s_R_Socks		= new VRadio_Mall_sock_New{pos = "270,75";}
		//鞋:Radio
		staticvar s_R_Shoes		= new VRadio_Mall_shoes_New{pos = "325,75";}

		new MallRadioLine{pos = "98,81";}
		new MallRadioLine{pos = "153,81";}
		new MallRadioLine{pos = "208,81";}
		new MallRadioLine{pos = "263,81";}
		new MallRadioLine{pos = "318,81";}
	}
};