//游戏结算后的翻牌界面
//夏洋洋 2010-6-5

importex("$./ClassDef_TurnCards.gml");

new item
{
	name = "GameOver_TurnCards_Logic";
	size = "100%,100%";capturemouse = true;
	window.SetUIPos(window.POS_GAMEOVER_TURNCARDS);
	window.g_FirstTurnCard = false;
	window._charShowFlag = false;
	window.find("CHAT_LOGIC").show = false;
	new VGame_BtnLayer_Top_Logic{}

	var m_TriggerTrainID = 0;	//是否需要再训练

	var m_TurnCards = new VGame_Over_TurnCards_Logic{}

	//看看我是否需要再训练
	void NeedToTrain()
	{
		printf("B# [游戏结算]看看我是否需要再训练:"+m_TriggerTrainID);
		if (toint(m_TriggerTrainID) > 1 && tostring(m_TriggerTrainID) != "")
		{
			window.find("UIController").LoadUI("UI_PLAYOVER_DLG"); 
			window.find("PLAYOVER_DLG_LOGIC")._DLG.GetDataFromDB(2,toint(m_TriggerTrainID),-1,-1);
		}
		else
		{
			printf("B# [游戏结算]-判断高手是否在低级服务器！sev:"+window.GetSerType()+",称号："+window.GetQualifyByUID(window.GetMyUID()));
			if (window.GetSerType() < window.GetQualifyByUID(window.GetMyUID()))
			{
				window.find("UIController").LoadUI("UI_PLAYOVER_DLG"); 
				window.find("PLAYOVER_DLG_LOGIC")._DLG.GetDataFromDB(2,window.GetSerType(),-1,99);
			}
			else
			{
				printf("B# [游戏结算]OnClick_BtnBackToRoom");
				//OnClick_BtnBackToRoom();
				//timer(window._Time_GameOver_TurnCard,"OnClick_BtnBackToRoom");
				m_TurnCards.s_BackToRoom.show = true;	//翻牌结束显示“返回房间”按钮
			}
		}
	}

	//点击了 返回房间
	void OnClick_BtnBackToRoom()
	{
		del();
		window.find("Name_GCMap").find("mycamera").Reset();
		//发出返回房间消息:自己的ID
		window.Too_BackToRoom(window.GetMyUID());
		window.GameToRoom();
	}

	void OnCreated()
	{
		m_TriggerTrainID = window.find("GAME_OVER_LOGIC").GetTriggerTrainID();
		window.find("GAME_OVER_LOGIC").del();
	}

	void OnDelete()
	{
		window.g_FirstTurnCard = false;
	}
}