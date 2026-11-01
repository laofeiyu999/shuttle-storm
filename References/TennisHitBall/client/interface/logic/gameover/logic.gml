//
//游戏结算界面-UI+Logic
//yxf 2008年8月12日
//

import("$./ClassDef_Data.gml");
import("$./ClassDef_S.gml");
import("$./ClassDef_D.gml");

new item
{
	window._charShowFlag = false;
	window.find("CHAT_LOGIC").show = false;//enableUpdate(1);

	name = "GAME_OVER_LOGIC";size = "100%,100%";capturemouse = true;
	//var _LastPos = window.GetUIPos();
	window.SetUIPos(window.POS_GAMEOVER);
	
	void OnCreated()
	{
		window.find("GAME_LOGIC").del();		//删除游戏中界面
	}
	new VGame_BtnLayer_Top_Logic{}

	var _P1UID = 0;			//P1的UserID - 自己的ID
	var _P2UID = 0;			//P2的UserID - 对手1号的ID
	var _P3UID = 0;			//P3的UserID - 自己队友的ID
	var _P4UID = 0;			//P4的UserID - 对手2号的ID
	var _RoomType = 0;		//房间的类型 0未知 1网球竞技单 2网球竞技双 
	var m_Win = 0;			//胜利或者失败 0为默认 1表示输 2表示赢
	var m_TriggerTrainID = 0;	//是否需要再训练
	
	//初始化UserID
	//参数 roomtype :房间类型 0未知 1网球竞技单 2网球竞技双
	//参数 SelfID:自己的UserID
	//参数 P2:对手1号的ID
	//参数 P3:自己队友的ID
	//参数 P4:对手2号的ID
	//参数 Win ：胜利或失败 0为默认 1表示输 2表示赢
	//参数 TriggerTrainID ：触发的训练 
	void Init(type,SelfID,P2,P3,P4,Win,TriggerTrainID)
	{
		//保存录像
		window.find("GAMELAYER").find("NAME_GCMap").EndSaveRecord();
		
		if (window.g_DEBUG)
		{
			printf("B# !!GameOver：type:"+type+",SelfID:"+SelfID+",p2:"+P2+",P3:"+P3+",P4:"+P4+",Win:"+Win+",TriggerTrainID:"+TriggerTrainID);
		}
		_RoomType = type%2;
		_P1UID = SelfID;
		_P2UID = P2;
		_P3UID = P3;
		_P4UID = P4;
		m_Win = Win;
		m_TriggerTrainID = TriggerTrainID;

		if (_RoomType == 1)//单打
		{
			staticvar _User1 = new VUserDT_Logic
			{
				Init(parent._P1UID);
			}
			staticvar _User2 = new VUserDT_Logic
			{
				Init(parent._P2UID);
			}
			//结算界面
			staticvar _VGame_Over_Logic = new VGame_Over_S_Logic{}
		}
		if (_RoomType == 0)//双打
		{
			staticvar _User1 = new VUserDT_Logic
			{
				Init(parent._P1UID);
			}
			staticvar _User2 = new VUserDT_Logic
			{
				Init(parent._P2UID);
			}
			staticvar _User3 = new VUserDT_Logic
			{
				Init(parent._P3UID);
			}
			staticvar _User4 = new VUserDT_Logic
			{
				Init(parent._P4UID);
			}
			//结算界面
			staticvar _VGame_Over_Logic = new VGame_Over_D_Logic{}
		}
		
		printf("B# [游戏结算]:"+window.GetUIGameState());
		if (window.GetUIGameState() == window.USER_UISTATE_AI_RAND)
		{
			printf("B# [游戏结算]是AI");
			window.timer(window._Time_GameOver,"FreeTrainToHall");
			return;
		}

		
	}//end init

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
				timer(window._Time_GameOver,"OnClick_BtnBackToRoom");
			}
		}
	}

	//点击了 返回房间
	void OnClick_BtnBackToRoom()
	{
		window.find("Name_GCMap").find("mycamera").Reset();
		//发出返回房间消息:自己的ID
		window.Too_BackToRoom(window.GetMyUID());
		window.GameToRoom();
	}

	//获取是否需要再训练的值
	void GetTriggerTrainID()
	{
		return m_TriggerTrainID;
	}
	
	//点击了保存录像
	void MySaveVideo()
	{
		window.SaveVideo(1,m_Win);	
	}
}