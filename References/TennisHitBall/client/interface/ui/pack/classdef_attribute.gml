//背包类定义 - 属性
//yxf 2008年9月16日9:24

class VPack_Attribute_UI item
{
	size = "100%,100%";pos(0,0);bgcolor = "-1";alpha = -1;
	//=============================与界面交互========================================
	void Init()
	{	
		/*属性*/
		//全部
		staticvar s_R_AttributeAll = new VRadio_Mall_all_New{pos = "50,75";}
		//力量
		staticvar s_R_Strength	= new VRadio_Mall_strength_New{pos = "105,75";}
		//技术
		staticvar s_R_Skill		= new VRadio_Mall_Skill_New{pos = "160,75";}
		//前场
		staticvar s_R_ForceHand	= new VRadio_Mall_front_New{pos = "215,75";}
		//后场
		staticvar s_R_BackHand	= new VRadio_Mall_background_New{pos = "270,75";}
		//发球
		staticvar s_R_TServe	= new VRadio_Mall_start_New{pos = "325,75";}
		//能量
		staticvar s_R_Energy	= new VRadio_Mall_power_New{pos = "380,75";}
		//体力
		staticvar s_R_Thew		= new VRadio_Mall_stamina_New{pos = "435,75";}
		new MallRadioLine{pos = "98,81";}
		new MallRadioLine{pos = "153,81";}
		new MallRadioLine{pos = "208,81";}
		new MallRadioLine{pos = "263,81";}
		new MallRadioLine{pos = "318,81";}
		new MallRadioLine{pos = "373,81";}
		new MallRadioLine{pos = "428,81";}
	}
};