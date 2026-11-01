//家族个人赛
//夏洋洋 2010-3-4

import("$./../../../UI/Family/pop/ClassDef_FamilyCompete_Single.gml");

class VFamilyCompete_Single_Logic item
{
	var m_CanCancle = true;	//点了开始比赛后就不能取消了
	void Init()
	{
		//提示信息
		staticvar s_Text_GameContent = new BaseText
		{}
		//提示时间
		staticvar s_Text_GameTip = new VListBG2_UI
		{}

		//开始比赛
		staticvar s_Btn_StartGame = new VBTN_A_New
		{}
	}
	inclass("VFamilyCompete_Single_UI");
	//========================================================
	void SetEvent()
	{
		set s_Btn_Close
		{
			void OnPressed()
			{
				if (!parent.m_CanCancle) return;
				parent.parent.del();
			}
		}
		set s_Btn_StartGame
		{
			void OnPressed()
			{
				if(GetState()==window.BTN_STATE_GREY)
				{
					return;
				}
				//这样为了不让频繁点 0012547: 【家族赛】报名家族赛，报名后马上ESC退出，重复几次，会提示‘已报名，不要重复报名’（实际没有报名） 
				if (!parent.m_CanCancle) return;
				parent.m_CanCancle = false;
				window.FamilyToRoom();
				parent.parent.del();
				parent.timer(2000,"m_CanCancle=true");
			}
		}
	}

	void SetContentData()
	{
		window.g_Row.InitByInt(window.M_G_SERVER,window.ARENARACE,window.M_G_SERVER_ARENARACE_ID,window.FAMILY_ACTIVITY_ID);
		if(!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			return window.DB_ERR;
		}
		var _gameContent = window.g_Row.GetData(window.M_G_SERVER_ARENARACE_DES1);
		var _gameTip = window.g_Row.GetData(window.M_G_SERVER_ARENARACE_BEGINENDTIME_UI);
		window.g_Row.Release();
		s_Text_GameContent.SetData(window.TransHtmlform(_gameContent));
		s_Text_GameTip.SetData(_gameTip);
	}
	void OnCreated()
	{
		Init();
		SetEvent();
		SetContentData();
	}
}
