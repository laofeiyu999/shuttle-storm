//
//商城：购物-技能类定义
//yxf 2008年9月16日15:59
//


class VMall_Shopping_Skill_UI item
{
	size = "100%,100%";pos = "0,0";alpha = 0;
	//=============================与界面交互========================================
	void Init()
	{
		//上旋:Radio
		staticvar s_R_Skill1 = new VRadio_Mall_up_New{pos = "50,30";}
		//削球:Radio
		staticvar s_R_Skill2 = new VRadio_Mall_cut_New{pos = "105,30";}
		//扣杀:Radio
		staticvar s_R_Skill3 = new VRadio_down_down_New{pos = "160,30";}
		//放高球:Radio
		staticvar s_R_Skill4 = new VRadio_Mall_high_New{pos = "210,30";}
		//发球:Radio
		staticvar s_R_Skill5 = new VRadio_Mall_start_New{pos = "270,30";}

		new MallRadioLine{pos = "98,36";}
		new MallRadioLine{pos = "153,36";}
		new MallRadioLine{pos = "208,36";}
		new MallRadioLine{pos = "263,36";}
	}
};