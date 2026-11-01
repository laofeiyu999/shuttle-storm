//
//商城：购物-服饰类定义
//yxf 2008年9月16日13:53
//


class VMall_Shopping_Face_UI item
{
	size = "100%,100%";pos = "0,0";alpha = 0;
	//=============================与界面交互========================================
	void Init()
	{
		//发型:Radio
		staticvar s_R_Hair = new VRadio_Mall_hair_New{pos = "50,30";}
		//容貌:Radio
		staticvar s_R_Face = new VRadio_Mall_face_New{pos = "105,30";}

		new MallRadioLine{pos = "98,36";}
	}
};