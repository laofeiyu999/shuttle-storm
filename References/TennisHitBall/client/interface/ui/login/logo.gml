
//logo界面-显示
class VTENNIS_LOGO_UI item
{
	var _logoimg = new img
	{
		valign = "50,0";halign = "50,0";size="943,131"; 
		src="$./imgs/LOGO_JOYCHINA1.tga";
		alpha=100;
		void OnCreated()
		{
			setParamTimer("alpha",100,0,2000,800);
			setParamTimer("alpha",0,100,1000,3500,"endlogo");
		}
		void endlogo()
		{
			parent.endlogo();
		}
	}
}

