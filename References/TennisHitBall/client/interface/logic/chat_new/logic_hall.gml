//
//大厅的聊天
//
importex("$./ClassDef_ChatMgr.gml");

new item
{
	size = "100%,100%";enableUpdate(1);
	name = "CHAT_LOGIC";
	var _chatMgr = new ChatMgr_Logic
	{
		valign(100,-70);pos(17,0);
		InitSize(1);
	}

	var m_ChatPos = window.CHAT_UIPOS_HALL;

	void OnCreated()
	{
		printf("B# Chat:大厅聊天:OnCreated");
		zindex = "top";
	}
	void OnDelete()
	{
		printf("B# Chat:大厅聊天:OnDelete");
	}
}