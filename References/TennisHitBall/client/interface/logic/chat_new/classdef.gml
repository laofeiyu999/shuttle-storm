//
//聊天动作表情 界面:逻辑类定义
//安峰册
//2009-12-3
//
import("$./ClassDef_Brow_DBList.gml");

class VChat_Act_Brow_Logic item
{
	pos(window.mousex+10,window.mousey-240);
	size="98,236";bgcolor = -1;alpha = 0;
	name = "VChat_Act_Brow_Logic_Name";
	capturemouse="true";//drag = "self";
	setFocus = "true";

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
	void OnLostFocus()
	{
		if (updatecount>1)
		{
			if(_selectbrow.m_bMouseOver || window.find("ChatMgr_Logic")._send._actionbrowbtn.m_bMouseOver){setFocus = "true";return;}
			del();
		}
		else setFocus = "true";
	}

	//选择表情背景
	new VPic9_ChatFaceAlternation_UI{size = "100%,100%";}
	
	//选择表情动作框
	var _selectbrow = new Brow_DBList_Logic
	{
		name = "Brow_DBList_Logic_NAME";
		window.find("G_DBMANAGE").RegDbTable(this,window.GAMEUI,window.CHAT_ACTION,"Brow_DBList_Logic");// 绑定数据表
		var sql = "SELECT * FROM "+window.CHAT_ACTION;
		window.find("G_DBMANAGE").SelectByRegDbTable("Brow_DBList_Logic",window.GAMEUI,sql);
		void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);} //移除绑定

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