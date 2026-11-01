//
//其他 设置类定义
//


class VGameSetUp_Other_UI item
{
	size = "100%,100%";pos = "0,0";bgcolor = -1;
	//=============================与界面交互========================================
	void Init()
	{
		new VPic9_BK2_UI{pos = "15,62";size = "100%,100%,-30,-128";}
		//复选框：允许邀请游戏
		staticvar s_CHK_Invite = new VCK_CK_New
		{
			pos = "80,117";
		}
		new img{pos = "104,117";src = "$./imgs"+window.g_Sex+"/rxyqyx-text.tga";}
		//复选框：好友上下线
		staticvar s_R_FriendTip =  new VCK_CK_New
		{
			pos = "80,147";
		}
		new img{pos = "104,147";src = "$./imgs"+window.g_Sex+"/hysxx-text.tga";}
		//复选框：显示游戏中的聊天泡泡
//		staticvar s_R_ChatPP =  new VCK_CK_New
//		{
//			pos = "80,177";
//		}
//		new img{pos = "104,177";src = "$./imgs"+window.g_Sex+"/xsyxzltpp-text.tga";}

		//复选框：玩家昵称
		staticvar s_R_NkName =  new VCK_CK_New
		{
			pos = "80,177";
		}
		new img{pos = "104,177";src = "$./imgs"+window.g_Sex+"/xswjnc-text.tga";}

		//复选框：家族名称
		staticvar s_R_Family =  new VCK_CK_New
		{
			pos = "80,207";
		}
		new img{pos = "104,207";src = "$./imgs"+window.g_Sex+"/xswjmc-text.tga";}
	}
};