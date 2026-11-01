//
//修改密码
//yxf 2009年6月30日
//

import("$./ClassDef_Modify_Password.gml");

new item
{
	name = "MODIFY_PW_LOGIC";size = "100%,100%";
	//==========================快捷键==================================
	window.find("gameinput").AddExclusiveShortcutUser(this);
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
			case 4: //Enter
			{
				_VLogin_Logic.OnClick_BtnConfirm();
				break;
			}
			case 7://Tab
			{
				_VModify_PW_Logic.ChangeHot();
			}
		}
	}
	//====================================================================
	var _VModify_PW_Logic = new VModify_PW_Logic{}
}