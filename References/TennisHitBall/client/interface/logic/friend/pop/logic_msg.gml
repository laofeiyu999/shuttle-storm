//
//好友-发送消息-UI+Logic
//yxf 2008年10月21日
//

importex("$./ClassDef_Msg.gml");

new item
{
	size = "100%,100%";name = "SENDMSG_LOGIC";capturemouse = true;enableUpdate(1);
	new VGame_BtnLayer_Top_Logic{}
	window.g_FriendMsgID = "";
	window.g_RoomHangInfoYesOrNo = false;	//2010年9月21日 yxf
	//==========================快捷键==================================
	void OnCreated()
	{
		window.find("NAME_GCMap").KeyBoardEnable(0);//0锁定解锁按键 1解除锁定
		window.find("gameinput").AddExclusiveShortcutUser(this);
		window.find("gameinput").SetDirOnUse(0);//0是关闭方向,1是开启方向
		window.SetChatEnterFlag(window.CHAT_ENTER_NO,"SENDMSG_LOGIC");//不激活
	}
	void OnDelete()
	{	
		window.g_RoomHangInfoYesOrNo = true;	//2010年9月21日 yxf
		window.find("HELPLAYER").delallchild();//关闭引导层
		window.find("gameinput").SetDirOnUse(1);//0是关闭方向,1是开启方向
		window.find("gameinput").DelShortcutUser(this);
		window.find("NAME_GCMap").KeyBoardEnable(1);//0锁定解锁按键 1解除锁定
		
		window._MsgWhoName = "";	//清空一下 要不小喇叭不闪了
		window._MsgWhoJID = -1;

		window.SetChatEnterFlag(window.CHAT_ENTER_YES,"SENDMSG_LOGIC");//不激活

		//modify by yxf 2010年5月17日 BUGID:0013931
		window.FlagFriendMsgRead();
	}
	void DI_ShortcutKey(data)
	{
		switch (data)
		{
			case 3: //Esc
			{
				del();
				break;
			}
		}
	}
	//==================================================================
	var _SendMsg_Logic = new VPop_SendMsg_Logic{}
}