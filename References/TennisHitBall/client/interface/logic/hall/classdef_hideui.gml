//隐藏界面的类定义

importex("$./../../UI/Hall/ClassDef_HideUI.gml");

class VHall_HideUI_Logic item
{
	size = "100,100";bgcolor = "#FF";
	name = "VHall_HideUI_Logic_Name";
	var m_State = true;	//界面的状态 显示与否
	var m_UIName = "PACK_LOGIC,FRIEND_LOGIC";
	void Init()
	{
		//隐藏界面
		staticvar s_HideUI = new VMyButton
		{
			void InitText(_src)
			{
				Init(_src);
			}
			InitText("显示背景");
		}
	}

	inclass("VHall_HideUI_UI");

	Init();

	void SetEvent()
	{
		set s_HideUI
		{
			void OnPressed()
			{
				if(GetState()==window.BTN_STATE_LIGHT)
				{
					parent.OnClick_HideUI();
				}
				
			}
		}
	}

	void OnClick_HideUI()
	{
//		if (m_State)
//		{
//			m_State = false;
//			s_HideUI.InitText("显示界面");
//			//window.HideAllLayersExcept(""+window.BGLAYER+","+window.BTNLAYER);
//			//window.find("CHAT_LOGIC")._chatMgr.SetMyShowState(false);
//		}
//		else
//		{
//			m_State = true;
//			s_HideUI.InitText("隐藏界面");
//			//window.ShowAllLayers();
//			//window.find("CHAT_LOGIC")._chatMgr.SetMyShowState(true);
//		}
		window.g_HallBtnMgr.ClickHideHallOpenUI();
	}

	SetEvent();
};