//家族房间
//夏洋洋 2010-3-16

importex("$./ClassDef_FamilyRoom.gml");

new item
{
	name = "FAMILY_ROOM_LOGIC";
	size = "100%,100%";
	enableUpdate(1);

	new VGame_BtnLayer_Top_Logic{}

	window.g_GameMapID = 1;
	var _familyRoom = new Family_GameGCMap{ }

	var m_CanCancle = false;	//界面没创建好之前不能Esc

	window.find("gameinput").AddShortcutUser(this);
	void DI_ShortcutKey(data)
	{
		if (!m_CanCancle) return;
		switch (data)
		{
			case 3: //Esc
			{
				window.RoomToFamily();
			}
		}
	}

	void OnCreated()
	{
		sleep(3000);
		window.find("LOADING_LOGIC").del();
		m_CanCancle = true;
	}

	void OnDelete()
	{
		
		window.find("gameinput").DelShortcutUser(this);
		del();
	}

}