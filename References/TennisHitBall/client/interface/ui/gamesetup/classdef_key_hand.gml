//手柄按键 设置类定义
//夏洋洋 2010-3-20

import("$./../GmlCtrls/VRadio/ClassDef.gml");

class VGameSetUp_Key_Hand_UI item
{
	size = "100%,100%";pos = "0,50";bgcolor = -1;

	void Init()
	{
		new VPic9_BK2_UI{pos = "15,62";size = "100%,45,-30,0";}
		//默认1：Radio
		staticvar s_R_Default1 = new VRadio_Single_New_UI 
		{
			pos = "40,75";
		}
		new img{pos = "70,75";src  ="$./imgs"+window.g_Sex+"/mr1-text.tga";}
		//自定义：Radio
		staticvar s_R_DIY = new VRadio_Single_New_UI 
		{
			pos = "240,75";
		}
		new img{pos = "270,75";src  ="$./imgs"+window.g_Sex+"/zdy-text.tga";}

		new VPic9_BK2_UI{pos = "15,109";size = "100%,100%,-30,-230";}

		new img{pos = "68,120";src  ="$./imgs"+window.g_Sex+"/gn-text.tga";}
		new img{pos = "200,120";src  ="$./imgs"+window.g_Sex+"/aj-text.tga";}
	}

}