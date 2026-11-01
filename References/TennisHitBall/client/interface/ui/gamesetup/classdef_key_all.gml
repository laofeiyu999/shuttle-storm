//按键设置界面
//夏洋洋 2010-3-20

class VGameSetUp_Key_All_UI item
{
	size = "100%,100%";pos = "0,0";bgcolor = -1;
	void Init()
	{
		new VPic9_BK2_UI{pos = "15,62";size = "100%,45,-30,0";}
		staticvar m_R_KeyBoard = new VRadio_Single_New_UI
		{
			pos = "40,75";
		}
		staticvar m_Img_KeyBoard = new img 
		{
			left = parent.m_R_KeyBoard.left+parent.m_R_KeyBoard.width+7;
			top = parent.m_R_KeyBoard.top;
			src = "$./imgs"+window.g_Sex+"/syjpcz-text.tga";
		}
		staticvar m_R_Hand = new VRadio_Single_New_UI
		{
			left = parent.m_Img_KeyBoard.left+parent.m_Img_KeyBoard.width+20;
			top = parent.m_Img_KeyBoard.top;
		}
		staticvar m_Img_Hand = new img 
		{
			left = parent.m_R_Hand.left+parent.m_R_Hand.width+7;
			top = parent.m_R_Hand.top;
			src = "$./imgs"+window.g_Sex+"/sysbcz-text.tga";
		}
	}
}