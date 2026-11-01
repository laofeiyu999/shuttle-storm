//商城的屏风
//夏洋洋 2010-5-28

class VMall_ShoppingScreen_UI item
{
	size = "690,100%";
	pos = "0,0";
	void Init()
	{
		staticvar s_Img_Screen = new img
		{
			size = "690,100%";
			src = "$./imgs"+window.g_Sex+"/screen.tga";
		}
	}
}