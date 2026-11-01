//游戏中快捷栏底 
class VShortBar_Bk_UI item
{
	size = "53,53";

	//底图1
	var _bk1 = new img{src = "$./../../PublicImage/Skill/skill_2_0.tga";}
	//底图2
	var _bk2 = new img{src = "$./../../PublicImage/Skill/skill_2_1.tga";show=false;}
	//底图3
	var _bk3 = new img{src = "$./../../PublicImage/imgs"+window.g_Sex+"/skill_2_2.tga";show=false;}

	void OnMouseDownL()
	{
		_bk2.show=false;
		_bk3.show=true;
	}
	void OnMouseUpL()
	{
		_bk2.show=true;
		_bk3.show=false;
	}
	void OnMouseOver()
	{
		_bk2.show=true;
		_bk3.show=false;
	}
	void OnMouseOut()
	{
		_bk2.show=false;
		_bk3.show=false;
	}
}