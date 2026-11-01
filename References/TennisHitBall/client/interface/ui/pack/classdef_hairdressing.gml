//背包类定义 - 美容
//yxf 2009年11月1日

class VPack_Hairdressing_UI item
{
	size = "100%,100%";pos(0,0);bgcolor = "-1";alpha = -1;
	//=============================与界面交互========================================
	void Init()
	{	
		/*美容*/
		//美容-全部：Radio
		staticvar s_R_HairdressingAll	= new VRadio_Mall_all_New{pos = "50,75";}
		//头发：Radio
		staticvar s_R_Hair				= new VRadio_Mall_hair_New{pos = "105,75";}
		//五官：Radio
		staticvar s_R_Facial			= new VRadio_Mall_face_New{pos = "160,75";}

		new MallRadioLine{pos = "98,81";}
		new MallRadioLine{pos = "153,81";}
	}
};