//
//聊天表情 界面:逻辑类定义
//
importex("$./ClassDef_DBlist.gml")
importex("$./../../../UI/GmlCtrls/ChatBrow/ClassDef.gml");

class VChat_Brow_Logic item
{
	var m_Type = 0;	//类型 0是聊天 1是好友消息
	var m_isOpen = 1;
	//==========================快捷键===============================
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
				del();break;
			}
		}
	}
	//===============================================================
	name = "VChat_Brow_Logic";
	capturemouse="true";//drag = "self";
	size = "251,200";
	setFocus = "true";
	bgcolor = "#FF";alpha = 50;
	
	void OnLostFocus()
	{
		if (updatecount>1)
		{
			if(_ChatBrow.m_bMouseOver || window.find("ChatMgr_Logic")._send._browbtn.m_bMouseOver){setFocus = "true";return;}
			del();
		}
		else setFocus = "true";
	}

	inclass("VChat_Brow_UI");//显示的类
	
	//数据库List
	var _ChatBrow = new VChatBrow_List_Logic
	{
		name="VChatBrow_List_Logic_Name";
		window.find("G_DBMANAGE").RegDbTable(this,window.GAMEUI,window.CHAT_BROW,"bind_VChatBrow_List_Logic");// 绑定数据表
		window.find("G_DBMANAGE").SelectByRegDbTable("bind_VChatBrow_List_Logic",window.GAMEUI, "SELECT * FROM CHAT_BROW");
		void OnDelete()
		{
			//window._FaceText.del();
			window.find("G_DBMANAGE").ReMoveRegDbTable(this);
		} //移除绑定
		var m_bMouseOver = false;
		void OnMouseOver()
		{
			m_bMouseOver = true;
		}
		void OnMouseOut()
		{
			m_bMouseOver = false;
		}
	}
};