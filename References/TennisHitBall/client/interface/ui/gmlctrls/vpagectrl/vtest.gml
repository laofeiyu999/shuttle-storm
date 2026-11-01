import("$./../../../Logic/Init.gml");
import("$./../include.gml");
import("$./ClassDef.gml");

bgcolor = "#CCCCCC";
new fmodel;
size = "800,600";
wndsize = "800,600";

//new PageCtrl_Num
//{
//	size = "300,33";
//}
//
//new VPGC_Change_Map_UI
//{
//	size = "38,90";
//	pos = "300,300";
//}
//
//new VPG_RacketList_UI
//{
//	pos = "200,200";
//}

//new VPageCtrl_ChangeCloth_UI
//{
//	size = "100,90";
//	pos = "0,400";
//}

new VPageCtrl_UserList_UI
{
	//pos = "0,400";

	void OnClickL_UserDef()
	{
		ShowLoad(true);
	}
	void OnClickR_UserDef()
	{
		ShowLoad(false);
	}


	//OnPageExchange_New(100,200);
}