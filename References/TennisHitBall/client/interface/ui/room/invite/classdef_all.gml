//房间-邀请-全部类定义

importex("$./ClassDef_Tipe.gml");
class VRoomInvite_All_UI item
{
	size = "100%,100%";pos="0,0"; bgcolor = "-1";

	//=============================与界面交互========================================
	void Init()
	{
		staticvar s_PageCtrl = new VPageCtrl_UserList_UI
		{
			valign(83,0);halign(50,0);
		}
		staticvar s_Btn_Invite = new VBTN_A_New
		{
			InitText("邀请玩家"); //pos="183,428";
			pos(parent.width - 110, parent.height-window.G_POP_BTN_POSY);
		}
	}
};