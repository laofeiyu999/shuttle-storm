//游戏中自定义快捷键  武文博 2010.8.26

import ("$./../GmlCtrls/VRadio/ClassDef.gml");

class VGameSetUp_ShotcutChat_UI item
{
	
	size = "100%,100%";pos = "0,50";bgcolor = -1;

	void Init()
	{
		new VPic9_BK2_UI{pos = "15,12";size = "100%,45,-30,0";}
		//默认：Radio
		staticvar s_R_Default1 = new VRadio_Single_New_UI 
		{
			pos = "40,25";
		}
		new img{pos = "70,25";src  ="$./imgs"+window.g_Sex+"/mr-text.tga";}
		//自定义：Radio
		staticvar s_R_DIY = new VRadio_Single_New_UI 
		{
			pos = "240,25";
		}
		new img{pos = "270,25";src  ="$./imgs"+window.g_Sex+"/zdy-text.tga";}

		new VPic9_BK2_UI{pos = "15,59";size = "100%,100%,-30,-175";}

		//new img{pos = "88,120";src  ="$./imgs"+window.g_Sex+"/gn-text.tga";}
		//new img{pos = "220,120";src  ="$./imgs"+window.g_Sex+"/aj-text.tga";}
	}
}