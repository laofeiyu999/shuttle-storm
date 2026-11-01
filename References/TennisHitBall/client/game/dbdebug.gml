new DBViewList
{
	var _LISTITEM = new WndDlgItem
	{
		pos="2,0";
		size="100%,160";
		buttonstyle("listctr");
	}

	new WndDlgItem
	{
		pos="0,180";
		size="100,40";
		buttonstyle="text";
		src="库名:";
	}

	var _DBName=new WndDlgItem
	{
		pos="40,180";
		size="140,20";
		buttonstyle="edit";
		src="m_g_server.mdb";
	}

	new WndDlgItem
	{
		pos="190,180";
		size="100,40";
		buttonstyle="text";
		src="表名:";
	}

	var _TableName=new WndDlgItem
	{
		pos="230,180";
		size="120,20";
		buttonstyle="edit";
		src="userdt";
	}

	new WndDlgItem
	{
		pos="360,180";
		size="80,22";
		buttonstyle="button";
		src="确定";

		void OnClick()
		{
			parent.ViewList(parent._DBName.src,parent._TableName.src);
		}
	}
}
