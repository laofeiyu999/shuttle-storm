//
//商城：购物-技能类定义
//yxf 2008年9月16日15:59
//

class VMall_Shopping_Attribute_UI item
{
	size = "100%,100%";pos = "0,0";alpha = -1;
	//=============================与界面交互========================================
	void Init()
	{
		//力量:Radio
		staticvar s_R_Attribute1 = new VRadio_Mall_strength_New{pos = "50,30";}
		//技巧:Radio
		staticvar s_R_Attribute2 = new VRadio_Mall_Skill_New{pos = "105,30";}
		//前场:Radio
		staticvar s_R_Attribute3 = new VRadio_Mall_front_New{pos = "160,30";}
		//后场:Radio
		staticvar s_R_Attribute4 = new VRadio_Mall_background_New{pos = "215,30";}
		//发球:Radio
		staticvar s_R_Attribute5 = new VRadio_Mall_start_New{pos = "270,30";}
		//能量:Radio
		staticvar s_R_Attribute6 = new VRadio_Mall_power_New{pos = "325,30";}
		//体力:Radio
		staticvar s_R_Attribute7 = new VRadio_Mall_stamina_New{pos = "380,30";}

		new MallRadioLine{pos = "98,36";}
		new MallRadioLine{pos = "153,36";}
		new MallRadioLine{pos = "208,36";}
		new MallRadioLine{pos = "263,36";}
		new MallRadioLine{pos = "318,36";}
		new MallRadioLine{pos = "373,36";}
	}
};