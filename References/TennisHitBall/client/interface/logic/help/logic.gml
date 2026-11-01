//帮助
//yxf 2009年5月13日

importex("$./ClassDef.gml");

new item
{
	size = "100%,100%";name = "HELP_LOGIC";

	void OnDelete()
	{
		window.g_HelpID = -1;
	}

	//==========================快捷键==================================
	var m_Param = "";	//需要替换的参数
	var _VHelp_Logic = new VHelp_Logic{}
	
	var m_ID = 0;	//用来记住 删除
	var _VNet2DBRow = new VNet2DBRow{}
	var _VNet2DBTable=new VNet2DBTable
	{
		void GetMyData(helpid,_list,content)
		{
			//alert("helpid:"+helpid+",_title:"+_title);
			parent._VHelp_Logic.AddList(helpid,_list,"");
		}
	}
	
	//[功能]开始取数据库
	//[参数]helpid:帮助的ID
	void ReadDB(helpid)
	{
		printf("B# HELP_LOGIC:ReadDB():helpid:"+helpid);
		window.g_HelpID = helpid;

		//_VHelp_Logic.s_List._html._body.delallchild();
		_VNet2DBRow.InitByInt(window.GAMEUI,window.UIHELP,window.GAMEUI_UIHELP_ID,helpid);
		if (!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			printf("B# error-VHelp_Logic:DBname:"+window.GAMEUI+",TBName:"+window.UIHELP+",helpid:"+helpid);
			return;
		}
		_VHelp_Logic.m_ParentID = _VNet2DBRow.GetData(window.GAMEUI_UIHELP_PARENTID);
		var _content = _VNet2DBRow.GetData(window.GAMEUI_UIHELP_CONTENT);
		_VHelp_Logic.s_Sprite.SetData(_VNet2DBRow.GetData(window.GAMEUI_UIHELP_FACE));
		var _title = _VNet2DBRow.GetData(window.GAMEUI_UIHELP_TITLE);
		_VHelp_Logic.s_Btn_Back.SetData(_VNet2DBRow.GetData(window.GAMEUI_UIHELP_BTN_BACK));
		_VHelp_Logic.s_Btn_Close.SetData(_VNet2DBRow.GetData(window.GAMEUI_UIHELP_BTN_CLOSE));
		_VNet2DBRow.Release();
		_VHelp_Logic.AddTitle(_title);
		var _SQL = "SELECT * FROM UIHelp WHERE parentid="+helpid;
		_VNet2DBTable.Select( window.GAMEUI,_SQL);
		var _size = _VNet2DBTable.GetSize();
		if (_size > 0)
		{
			_VNet2DBTable.ReadData("GetMyData",""+window.GAMEUI_UIHELP_ID+","+window.GAMEUI_UIHELP_LIST);
		}
		else
		{

			_VHelp_Logic.AddList(-1,"",_content);
		}
	}
	
	//[功能]设置参数
	//[参数]param:使用逗号分开
	void SetParam(param)
	{
		m_Param = param;
	}
}