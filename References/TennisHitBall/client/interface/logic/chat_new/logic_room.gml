//
//房间的聊天
//
import("$./ClassDef_ChatMgr.gml");

new item
{
	size = "100%,100%";enableUpdate(1);
	name = "CHAT_LOGIC";
	var _chatMgr = new ChatMgr_Logic
	{
		valign(100,0);halign(0,0);//alert("sdfasd");
		InitSize(2);
	}

	var m_ChatPos = window.CHAT_UIPOS_ROOM;

	void OnCreated()
	{
		printf("B# Chat:房间聊天:OnCreated");
	}
	void OnDelete()
	{
		printf("B# Chat:房间聊天:OnDelete");
	}
}