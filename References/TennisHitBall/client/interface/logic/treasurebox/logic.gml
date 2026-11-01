//宝箱
//yangxf 2009年5月26日

import("$./ClassDef.gml");

new item
{
	size = "100%,100%";name = "TREASUREBOX_LOGIC";capturemouse = true;
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
	var _VTreasureBox_Logic = new VTreasureBox_Logic{}
	//==================================================================
	//entryid
	void SetData(entryid)
	{
		_VTreasureBox_Logic.GetNumFromDB(entryid);
	}
	
	//结果
	void SetResult(_str)
	{
		_VTreasureBox_Logic.s_Goods.SetData(_str);
	}
}