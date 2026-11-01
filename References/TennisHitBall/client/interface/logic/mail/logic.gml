//
//邮件界面-UI+Logic
//yxf 2009年10月18日
//

importex("$./ClassDef.gml");
importex("$./ClassDef_MsgBox.gml");

new item
{
	name = "MAIL_LOGIC";size = "100%,100%";enableUpdate(1);
	
	window.SelectMailAll(0,0);
	window.SetHallHtn_Open(window.G_HALLBTN_MAIL);
	var _LastPos = window.GetUIPos();
	window.SetUIPos(window.POS_MAIL);

	var _VMail_Logic = new VMail_Logic{}
	
	void OnCreated()
	{
		window.g_MailReadGIDStr = "";

		//zindex = "top";
		//发出得到接受赠送物品的列表消息:参数不清楚是什么（这里是NULL）
		window.Too_GetNewPresent("");
	}

	void OnDelete()
	{
		window.SetUIPos(_LastPos);
		window.SetHallHtn_Close(window.G_HALLBTN_MAIL);
		window.SetMailRead();
	}
}