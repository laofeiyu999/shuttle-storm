//兑换
//yangxf 2009年5月26日

import("$./ClassDef.gml");

new item
{
	size = "100%,100%";name = "CHANGE_LOGIC";capturemouse = true;enableUpdate(1);
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
				del();
				break;
			}
			case 7://Tab
			{
				_VChange_Logic.ChangeHot();
				break;
			}
		}
	}
	//==================================================================
	var _VChange_Logic = new VChange_Logic{}

	//
	void SetData(gid,entryid,ischange)
	{
		printf("B# 兑换:SetData:gid:"+gid+",entryid:"+entryid+",ischange:"+ischange);
		_VChange_Logic.m_gid = gid;
		_VChange_Logic.m_entryid = entryid;

//		if (toint(ischange) == 1)
//		{
//			GetDataFromDB();
//		}
	}
}