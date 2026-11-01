//好友 Logic+UI
//yxf 2009年10月14日
//

importex("$./ClassDef.gml");
importex("$./Pop/ClassDef_MsgBox.gml");

new item
{
	name = "FRIEND_LOGIC";size = "100%,100%";enableUpdate(1);

	window.SetHallHtn_Open(window.G_HALLBTN_FRIEND);
	var _LastPos = window.GetUIPos();	
	window.SetUIPos(window.POS_FRIEND);

	window.find("friendsys").SetPageNum(10);	//设置好友一页显示显示的记录条数
	var _VFriend_Logic = new VFriend_Logic{}
	
	void OnCreated()
	{
		//zindex = "top";
	}
	void OnDelete()
	{
		window.SetUIPos(_LastPos);
		window.SetHallHtn_Close(window.G_HALLBTN_FRIEND);
	}
}	