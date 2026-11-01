//商城的屏风
//夏洋洋 2010-5-28

importex("$./../../UI/Mall/ClassDef_Shoping_Screen.gml");

class VMall_ShoppingScreen_Logic item
{
	size = "655,440";
	pos = "20,33";
	void Init()
	{
		staticvar s_Img_Screen = new img
		{}
	}
	inclass("VMall_ShoppingScreen_UI");
	Init();

	void PlayFlash()
	{
		s_Img_Screen.setParamTimer("width","0","690",400,0);
		s_Img_Screen.setParamTimer("width","690","0",400,1000);
		timer(1400,"show=false");
	}
}