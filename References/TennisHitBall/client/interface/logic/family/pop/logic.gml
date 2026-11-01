importex("$./ClassDef_CreateFamily.gml");
importex("$./ClassDef_MsgBox.gml");

new item
{
	name = "CREATEFAMILY_LOGIC";
	size = "100%,100%";//bgcolor = "#ff";
	capturemouse = true;enableUpdate(1);
	var _LastPos = window.GetUIPos();
	window.SetUIPos(window.POS_FAMILY);
	new VGame_BtnLayer_Top_Logic{}
	window.find("gameinput").AddExclusiveShortcutUser(this);


	var _CreateFamily = new VCreateFamily_Logic{}
	void DI_ShortcutKey(data)
	{
		switch (data)
		{
			case 3: //Esc
			{
				del();
				break;
			}
			case 7://Tab
			{
				_CreateFamily.ChangeHot();
			}
		}
	}

	void OnDelete()
	{
		window.SetUIPos(_LastPos);
		window.find("gameinput").DelShortcutUser(this);
	}
}