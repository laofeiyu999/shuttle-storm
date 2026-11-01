//老虎鸡
//yangxf 2009年5月26日

import("$./ClassDef.gml");

new item
{
	size = "100%,100%";name = "TIGERCHOOK_LOGIC";capturemouse = true;
	bgcolor = "#000000";alpha = 50;
	//==========================快捷键==================================
	void OnCreated()
	{
		window.find("gameinput").AddExclusiveShortcutUser(this);
	}
	void OnDelete()
	{	
		window.find("gameinput").DelShortcutUser(this);
	}
	void DI_ShortcutKey(data)
	{
		switch (data)
		{
			case 3: //Esc
			{
				//del();
				break;
			}
		}
	}
	//==================================================================
	var _VTigerChook_Logic = new VTigerChook_Logic{}
	
	//entryid
	void SetData(entryid)
	{
		_VTigerChook_Logic.GetNumFromDB(entryid);
	}
	
	//结果
	void SetResult(_str)
	{
		_VTigerChook_Logic.s_Goods.SetData(_str);
	}
}