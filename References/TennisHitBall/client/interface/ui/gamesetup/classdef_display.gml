//显示 设置显示类定义
//@刘高辰
//08年8月26日

class VGameSetUp_DisPlay_UI item
{
	size = "100%,100%";pos = "0,0";bgcolor = -1;

	void Init()
	{
		new VPic9_BK2_UI{pos = "15,62";size = "100%,100%,-30,-128";}					//白色背景

		new img{pos = "47,89";src = "$./imgs"+window.g_Sex+"/jmzt-text.tga";}
		//界面主题
		staticvar s_CB_Style = new VMyDropMenu_UI{}

		new img{pos = "47,119";src = "$./imgs"+window.g_Sex+"/zmbj-text.tga";}
		//桌面背景
		staticvar s_CB_DeskBg = new VMyDropMenu_UI{}

		new img{pos = "47,149";src = "$./imgs"+window.g_Sex+"/kjc-text.tga";}
		//反锯齿
		staticvar s_CB_Antialiasing = new VMyDropMenu_UI{}

		new img{pos = "47,177";src = "$./imgs"+window.g_Sex+"/fbl-text.tga";}

		new img{pos = "44,249";src = "$./imgs"+window.g_Sex+"/xsms-text.tga";}		//显示模式
		//窗口模式：Radio
		staticvar s_R_Window = new VRadio_Single_New_UI 
		{
			pos="125,248";
		}
		new img{pos = "148,249";src = "$./imgs"+window.g_Sex+"/ckms-text.tga";}
		//全屏模式：Radio
		staticvar s_R_FullScreen = new VRadio_Single_New_UI 
		{
			pos="234,248";//show = false;
		}
		new img{pos = "259,249";src = "$./imgs"+window.g_Sex+"/qpms-text.tga";}

		new img{pos = "44,293";src = "$./imgs"+window.g_Sex+"/hmzl-text.tga";}		//画面画质

		//画面质量：速度优先-Radio
		staticvar s_R_Speed = new VRadio_Single_New_UI 
		{
			pos="125,292";
		}
		new img{pos = "148,293";src = "$./imgs"+window.g_Sex+"/sdyx-text.tga";}
		//画面质量：普通-Radio
		staticvar s_R_Common = new VRadio_Single_New_UI 
		{
			pos="125,325";
		}
		new img{pos = "148,326";src = "$./imgs"+window.g_Sex+"/pt-text.tga";}
		//画面质量：品质优先-Radio
		staticvar s_R_Quality = new VRadio_Single_New_UI 
		{
			pos="125,361";
		}
		new img{pos = "148,362";src = "$./imgs"+window.g_Sex+"/pzyx-text.tga";}

		//分辨率
		staticvar s_CB_Resolution = new VCombox_Resolution_UI
		{
			pos(126,176);
		}
	}

	void OnDragFunc()
	{
		s_CB_Style.SetPos(126,88);
		s_CB_DeskBg.SetPos(126,132);
	}
};