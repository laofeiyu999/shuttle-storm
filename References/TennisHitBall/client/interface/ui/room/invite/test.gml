import("$./../../../Logic/Init.gml");
import("$./ClassDef.gml");
import("$./ClassDef_All.gml");
import("$./ClassDef_All_DBList.gml");
//import("$./ClassDef_Friend.gml");
window.size="866,600"
window.g_Sex = 1;
bkcolor="#123456";
new VRoom_Invite_UI
{
	Init();
//	s_State.SetData("",1400,2000);

	new VRoomInvite_All_UI{
		Init();
		new TSVInvite_All_List_UI{};
	}
}