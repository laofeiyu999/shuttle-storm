import("$./../../UI/Login/logo.gml");

//logo界面-逻辑
new item
{
	size="100%,100%"; name="SLOG";bgcolor="#FFFFFF"; capturemouse = true;
	inclass("VTENNIS_LOGO_UI");
	
	//显示完毕
	void endlogo()
	{
		del();
		window.LogoToLogin();
	}
}

