importex("$./GCMapClass.gml");

//window.g_GameMapID = 1;

class Test_GameGCMap GameGCMap
{

	//使人物能够移动
	void SetRoleModelCanMove()
	{
		window.g_Row.InitByInt(window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_UID,window.GetMyUID());
		if(!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			return window.DB_ERR;
		}
		window.g_Row.SetInt(window.M_G_SERVER_USERDT_RULESTATION,5);
		window.g_Row.UpdateEnd();
		window.g_Row.Release();
//		var _row = new VNet2DBRow{};
//		_row.InitByInt(window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_UID,window.GetMyUID());alert(window.GetMyUID());
//		_row.SetInt(window.M_G_SERVER_USERDT_RULESTATION,5);
//		_row.UpdateEnd();
//		_row.del();
	}
	
	new VmlGCSelf
	{
		void OnCreated()
		{
			parent.SetRoleModelCanMove();
			SetUserId( window.GetMyUID());
			SelfInit();
		}
		
	}
	SelfInit(window.GetMyUID());
}