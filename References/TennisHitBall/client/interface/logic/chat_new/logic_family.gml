//
//家族比赛的聊天
//
import("$./ClassDef_ChatMgr.gml");

new item
{
	size = "100%,100%";enableUpdate(1);
	name = "CHAT_LOGIC";
	var _chatMgr = new ChatMgr_Logic
	{
		pos(17,0);
		valign(100,0);
		InitSize(4);
	}

	var m_ChatPos = window.CHAT_UIPOS_FAMILY;

	void OnCreated()
	{
		printf("B# Chat:家族聊天:OnCreated");
	}
	void OnDelete()
	{
		printf("B# Chat:家族聊天:OnDelete");
	}
}