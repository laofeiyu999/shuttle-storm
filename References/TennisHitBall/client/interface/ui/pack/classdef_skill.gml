//背包类定义 - 技能
//yxf 2009年11月1日

class VPack_Skill_UI item
{
	size = "100%,100%";pos(0,0);bgcolor = "-1";alpha = -1;
	//=============================与界面交互========================================
	void Init()
	{	
		/*技能*/
		//技能全部：Radio
		staticvar s_R_SkillAll 		= new VRadio_Mall_all_New{pos = "50,75";}
		//上旋：Radio
		staticvar s_R_First_quarter	= new VRadio_Mall_up_New{pos = "105,75";}
		//削球：Radio
		staticvar s_R_Chip 			= new VRadio_Mall_cut_New{pos = "160,75";}
		//扣杀:Radio
		staticvar s_R_Kill_shot 	= new VRadio_down_down_New{pos = "215,75";}
		//放高球:Radio
		staticvar s_R_HighBall 		= new VRadio_Mall_high_New{pos = "265,75";}
		//发球:Radio
		staticvar s_R_Serve 		= new VRadio_Mall_start_New{pos = "325,75";}
		new MallRadioLine{pos = "98,81";}
		new MallRadioLine{pos = "153,81";}
		new MallRadioLine{pos = "208,81";}
		new MallRadioLine{pos = "263,81";}
		new MallRadioLine{pos = "318,81";}
	}
};