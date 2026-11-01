//快捷聊天
import("$./../../UI/GameSetUp/ClassDef_ShotcutChat.gml");
import("$./ClassDef_ShotcutChatKeyList.gml");

class VGameSetUp_ShotcutChat_Logic item//CShotcutChat
{
	var m_shotcutType = 0;

	void Init()
	{
		//默认：Radio
		staticvar s_R_Default1 = new VRadio_Single_New_UI 
		{}
		//自定义：Radio
		staticvar s_R_DIY = new VRadio_Single_New_UI 
		{}
	}
	inclass("VGameSetUp_ShotcutChat_UI");
	Init();
	//=======================================
	void SetEvent()
	{
		set s_R_Default1
		{
			groupname="VGameSetUp_ShotcutChatType_Group";
			if(parent.m_shotcutType == 0)
			{
				startstate="1";
			}
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();
				parent.ChangeType(0);
			}
			void OnUnCheck(){MouseUnCheck();}
		}

		set s_R_DIY
		{
			groupname="VGameSetUp_ShotcutChatType_Group";
			if(parent.m_shotcutType == 1)
			{
				startstate="1";
			}
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();
				parent.ChangeType(1);
			}
			void OnUnCheck(){MouseUnCheck();}
		}
	}
	//切换快捷聊天类型
	//_type：0为默认，1为自定义
	void ChangeType(_type)
	{
		m_shotcutType = _type;
		window.g_CShotcutChat.SetShotcutChatType(m_shotcutType);
		_ShotcutChatList.scriptprcallsub("OnUnSelect");
		ReFlash();
	}
	
	var _ShotcutChatList = new VGameSetUp_ShotcutChatKeyList_Logic
	{
		name = "VGameSetUp_ShotcutChatKeyList_Logic_NAME";

		window.find("G_DBMANAGE").RegDbTable(this,window.GAMEUI,window.SHOTCUTCHATCONTENT,"Bind_VGameSetUp_ShotcutChatKeyList_Logic");// 绑定数据表

		//parent.ReFlash();
		
		void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);}//移除绑定
	}

	void ReFlash()
	{
		var _SQL = "SELECT * FROM "+window.SHOTCUTCHATCONTENT;
		window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VGameSetUp_ShotcutChatKeyList_Logic",window.GAMEUI,_SQL);
	}

	void Cancel()
	{
		window.g_CShotcutChat.CancelShotcutCustomContent();
	}

	void SaveShotcutSet()
	{
		_ShotcutChatList.scriptprcallsub("OnUnSelect");
		window.g_CShotcutChat.SaveShotcutCustomContent();
	}

	void ResumeShotcutChat()
	{
		s_R_Default1.UnCheck();
		s_R_DIY.UnCheck();
		s_R_Default1.Check();
		window.g_CShotcutChat.ResumeShotcutCustomContent();
	}

	void OnCreated()
	{
		m_shotcutType = window.g_CShotcutChat.GetShotcutChatType();
		SetEvent();
		ReFlash();
	}
	
}