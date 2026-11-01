//声音 设置显示类定义
//@刘高辰
//08年8月27日

import("$./../GmlCtrls/VCheckbox/ClassDef.gml");

class VGameSetUp_Sound_UI item
{
	size = "100%,100%";pos = "0,0";bgcolor = -1;

	void Init()
	{
		// 上白底 
		new VPic9_BK2_UI{pos = "15,62";size = "100%,105,-30,0";}
		// 中白底 
		new VPic9_BK2_UI{pos = "15, 172";size = "100%,105,-30,0";}
		// 下白底 
		new VPic9_BK2_UI{pos = "15, 281";size = "100%,115,-30,0";}

		// 背景音乐
		new img
		{
			src = "$./imgs" + window.g_Sex + "/bjyy-text.tga";
			pos="30,77";
		}

		// 音量1
		new img
		{
			src = "$./imgs" + window.g_Sex + "/yl-text.tga";
			pos="61,105";
		}

		// 静音1
		new img
		{
			src = "$./imgs" + window.g_Sex + "/jy-text.tga";
			pos="272,137";
		}
		// 静音1
		new img
		{
			src = "$./imgs" + window.g_Sex + "/jy-text.tga";
			pos="272,248";
		}
		// 背景音效
		new img
		{
			src = "$./imgs" + window.g_Sex + "/bjyx-text.tga";
			pos="30,185";
		}

		// 音量2
		new img
		{
			src = "$./imgs" + window.g_Sex + "/yl-text.tga";
			pos="61,217";
		}		

		// 背景音乐设置
		new img
		{
			src = "$./imgs" + window.g_Sex + "/bjyysz-text.tga";
			pos="28,289";
		}

		// 登陆音乐
		new img
		{
			src = "$./imgs" + window.g_Sex + "/dlyy-text.tga";
			pos="61,316";
		}

		// 大厅音乐
		new img
		{
			src = "$./imgs" + window.g_Sex + "/dtyy-text.tga";
			pos="61,344";
		}

		// 游戏音乐
		new img
		{
			src = "$./imgs" + window.g_Sex + "/yxyy-text.tga";
			pos="61,372";
		}

		//复选框：背景音乐
		staticvar s_CHK_Music = new VCK_CK_New
		{
			pos="252,137";
		}
		//音乐大小
		staticvar s_Music_Volume = new VDragLine_UI
		{
			pos="100,106";SetWidth(215);
			void GetOffSet()
			{
				return parent.left+parent.parent.left;
			}
		}
		//复选框：背景音效
		staticvar s_CHK_Sound = new VCK_CK_New
		{
			pos="252,249";
		}
		//音效大小
		staticvar s_Sound_Volume = new VDragLine_UI
		{
			pos="100,218";SetWidth(215);
			void GetOffSet()
			{
				return parent.left+parent.parent.left;
			}
		}

		//登录音乐
		staticvar s_CB_LoginMusic = new VCombox_BgMusic_UI_Ex 
		{
		}
		//大厅音乐
		staticvar s_CB_HallMusic = new VCombox_BgMusic_UI_Ex 
		{
		}
		//游戏音乐
		staticvar s_CB_GameMusic = new VCombox_BgMusic_UI_Ex 
		{
		}
	}
}