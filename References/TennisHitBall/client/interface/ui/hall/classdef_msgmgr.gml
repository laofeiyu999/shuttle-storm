//
//消息管理器（好友消息+礼品+索要）
//

class VHall_MsgMgr_UI item
{
	size = "44,44";
	//pos(840,0);
	halign(100,-195+width);
	bgcolor = -1;alpha = 0;
	
	//=========================与界面交互===========================
	void Init()
	{
		//礼品标识
		staticvar s_IMG_Gift = new img
		{
			pos = "0,0";cursor = window.CURSOR_HAND;
			src = "$./../PublicImage/imgs"+window.g_Sex+"/xx.tga";
			clipani(44,44,1,2);anispeed = 4;
			//悬停
			var _btnhover = new VBTN_HOVER{};
			_btnhover.SetHangID(138);
		}
		//索要
		staticvar s_IMG_Request = new img
		{
			pos = "0,0";cursor = window.CURSOR_HAND;
			src = "$./../PublicImage/imgs"+window.g_Sex+"/sy.tga";
			clipani(44,44,1,2);anispeed = 4;
			//悬停
			var _btnhover = new VBTN_HOVER{};
			_btnhover.SetHangID(32);
			
		}
		//消息标识
		staticvar s_IMG_Msg = new img
		{
			pos = "0,0";cursor = window.CURSOR_HAND;
			src = "$./../PublicImage/imgs"+window.g_Sex+"/xx.tga";
			clipani(44,44,1,2);anispeed = 4;
			//悬停
			var _btnhover = new VBTN_HOVER{};
			_btnhover.SetHangID(31);
		
		}
	}
};
