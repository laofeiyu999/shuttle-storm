//背包类定义 - 过期道具

class VPack_DeadProps_UI item
{
	size = "100%,100%";pos(0,0);bgcolor = "-1";alpha = -1;
	//=============================与界面交互========================================
	void Init()
	{	
		/*道具*/
		//道具-全部：Radio
//		staticvar s_R_PropsAll = new VRadio_Mall_all_New{pos = "50,75";}
//		//辅助道具：Radio
//		staticvar s_R_Help_Items = new VRadio_HelpItem_New{pos = "105,75";}
//		//聊天工具：Radio
//		staticvar s_R_Chat_Tools = new VRadio_ChatItem_New{pos = "186,75";}
//		new MallRadioLine{pos = "98,81";}
//		new MallRadioLine{pos = "178,81";}

		staticvar s_remindtext = new BaseText{pos = "50,85";color = "#FF3366";src = "已到期物品会自动进入此页面（只保留10个物品）";}
		staticvar s_btn_rebuy	   = new VBTN_A_New{pos="520,430";InitText("购买"); SetSize(80,24); SetState(window.BTN_STATE_GREY)};
	}
};