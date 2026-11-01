//
//训练结算界面+游戏结算界面下面的一个选择条(包含说明文字+两个按钮)
//yxf 2009年1月15日
//

import("$./ClassDef_DLG.gml");

new item
{
	name = "PLAYOVER_DLG_LOGIC";size = "100%,100%";show = false;

	var _DLG = new VPlayOver_DLG_Logic{}

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
//				del();
				break;
			}
		}
	}
}