//房间-邀请
//yxf 2008年10月23日

import("$./ClassDef.gml");

new item
{
	size = "100%,100%";name = "INVITE_LOGIC";enableUpdate(1);//capturemouse = true;
	new VGame_BtnLayer_Top_Logic{}
	var _LastPos = window.GetUIPos();	
	window.SetUIPos(window.POS_ROOM_INVITE);
	window.SetHallHtn_Open(window.G_HALLBTN_INVITE);
	//==========================快捷键==================================
	void OnCreated()
	{
		//window.find("NAME_GCMap").KeyBoardEnable(0);//0锁定解锁按键 1解除锁定
		//window.find("gameinput").AddExclusiveShortcutUser(this);
		//window.find("gameinput").SetDirOnUse(0);//0是关闭方向,1是开启方向
//		window.SetChatEnterFlag(window.CHAT_ENTER_NO,"INVITE_LOGIC");//不激活
		zindex = "top";
	}
	void OnDelete()
	{	
		window.SetHallHtn_Close(window.G_HALLBTN_INVITE);
		window.SetUIPos(_LastPos);
		//window.find("gameinput").SetDirOnUse(1);//0是关闭方向,1是开启方向
	//	window.find("gameinput").DelShortcutUser(this);
		//window.find("NAME_GCMap").KeyBoardEnable(1);//0锁定解锁按键 1解除锁定
//		window.SetChatEnterFlag(window.CHAT_ENTER_YES,"INVITE_LOGIC");//能激活
	}
//	void DI_ShortcutKey(data)
//	{
//		switch (data)
//		{
//			case 3: //Esc
//			{
//				del();
//				break;
//			}
//		}
//	}
	//==================================================================
	window.find("friendsys").SetPageNum(10);	//设置好友一页显示显示的记录条数
	var _VRoom_Invite_Logic = new VRoom_Invite_Logic{}
}