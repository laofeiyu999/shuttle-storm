//游戏结算后的的翻牌界面
//夏洋洋 2010-6-5

importex("$./../../UI/GameOver/ClassDef_TurnCards.gml");

class VGame_Over_TurnCards_Logic item
{
	size = "100%,100%";//alpha = 30;
	var m_ID = window.g_CArenaFunction.AddObj(this);
	name = "CArenaFunction_"+m_ID;
	var i = 0;

	void Init()
	{
		//金币卡部分
		staticvar m_MoneyCardsBk = new item
		{}
		staticvar m_Text_MoneyCards = new BaseText
		{}

		//点券卡部分
		staticvar m_TokenCardsBk = new item
		{}
		staticvar m_Text_TokenCards = new BaseText
		{}

		//倒计时
		staticvar m_TimeCount = new BaseText()
		{}
		staticvar m_TimeNum = new VN2NumShow
		{}

		//返回房间-按钮
		staticvar s_BackToRoom = new VMyButton
		{}
	}
	inclass("VGame_Over_TurnCards_UI");
	
	void SetEvent()
	{
		set s_BackToRoom
		{
			show =false;
			void OnPressed()
			{
				parent.parent.OnClick_BtnBackToRoom();
			}
		}
	}

	//创建卡牌
	void CreateCards()
	{
		while(i<10)
		{
			if(i<5)
			{
				new VGame_Over_Cards_Logic
				{
					SetName(parent.i);
					top = parent.m_MoneyCardsBk.top +30;
					left = parent.m_MoneyCardsBk.left + 70 + (30+width)*(parent.i);
				}
			}
			else
			{
				new VGame_Over_Cards_Logic
				{
					SetName(parent.i);
					top = parent.m_TokenCardsBk.top +30;
					left = parent.m_TokenCardsBk.left + 70 + (30+width)*(parent.i-5);
					SetCardsText();
				}
			}
			i+=1;
		}
	}

	//[功能]设置时间
	//[参数]time：总时间
	void SetTimeCount(time)
	{
		window.PlaySound(150);//倒计时音效
		m_TimeNum.SetData(time);
		window.g_CArenaFunction.Begin(m_ID,time);
	}
	//停止倒计时
	void StopTimeCount()
	{
		window.g_CArenaFunction.Stop(m_ID);
		//m_TimeNum.SetData(0);
		window.g_UserGetCardNUM =0;
	}

	//程序调用
	void OnCountTime(sec,total)
	{
		var _restTime = toint(total)-toint(sec);
		if(_restTime<=0 || window.g_UserGetCardNUM>=10) 
		{
			StopTimeCount();
			parent.NeedToTrain();
			window.g_UserGetCardNUM =0;
			return;
		}
		m_TimeNum.SetData(_restTime);
	}

	Init();
	SetEvent();
	CreateCards();
	void OnCreated()
	{
	}

	void OnDelete()
	{
		window.g_CArenaFunction.DelObj(m_ID);
	}
}

//单张卡
class VGame_Over_Cards_Logic item
{
	var m_CardsIndex = -1;	//卡牌索引，-1为未知，索引从0-9，共10张
	var m_CardsType = 0;	//卡牌类型，0为未知，1为金币，2为点券
	var m_CardsState = false;	//卡牌状态，true为翻开，false为未翻开
	var m_OpenCardUID = 0;		//打开牌的用户id
//	var m_CardsMaskState = false;	//卡牌遮罩状态

	void Init()
	{
		//底框
		staticvar m_BkFrame = new img
		{}

		//卡牌内容
		staticvar m_CardsFront = new img
		{}
		//物品数量
		staticvar m_ItemNum = new VN2NumShow
		{}
		//卡牌背面
		staticvar m_CardsBack = new img3d
		{}
		//卡牌文字
		staticvar m_CardsText = new BaseText
		{}
//		//遮罩层
//		staticvar m_CardsMask = new item
//		{}
	}
	inclass("VGame_Over_Cards_UI");
	//==================================================

	//设置name
	void SetName(_index)
	{
		name = "VGame_Over_Cards_"+_index;
		m_cardsIndex = _index;
		
		if(m_cardsIndex<5)
		{
			m_CardsType = 1;
			m_CardsFrontBk.SetSrc(m_CardsType);
			m_CardsBack.SetSrc(m_CardsType);
		}
		else
		{
			m_CardsType = 2;
			m_CardsFrontBk.SetSrc(m_CardsType);
			m_CardsBack.SetSrc(m_CardsType);
//			SetCardsMaskState(true);
		}
	}
	//设置卡牌内容
	//_entryID:物品的entryID
	void SetCardsFront(_entryID)
	{
		var _lv = 0;
		var _ItemName = "";
		if(toint(_entryID) == 10000 || toint(_entryID) == 10001)
		{
			if(toint(_entryID) == 10000)
			{
				_ItemName = "jb";
			}
			if(toint(_entryID) == 10001)
			{
				_ItemName = "jq";
			}
			
		}
		else
		{
			var _VNet2DBRow = new VNet2DBRow{}
			_VNet2DBRow.InitByInt(window.M_G_GOODS,window.ITEMS,window.M_G_GOODS_ITEMS_ENTRY,toint(_entryID));
			if(!_VNet2DBRow.IsReady())
			{
				_VNet2DBRow.del();
				return;
			}
			_lv = _VNet2DBRow.GetData(window.M_G_GOODS_ITEMS_QUALITY);
			_ItemName = _VNet2DBRow.GetData(window.M_G_GOODS_ITEMS_ITENICON);
			_VNet2DBRow.del();
		}
		
		m_CardsFront.SetSrc(_ItemName,_lv);
//		SetCardsState(true);
	}
	//设置卡牌背面动画
	void SetCardsBack()
	{
		
		m_TurnCardEffect.show = true;
		m_TurnCardEffect.anispeed = 15;
		sleep(300);
		m_CardsBack.anispeed = 12;
		m_TurnCardEffect.show = false;
		sleep(700);
		m_CardsBack.show = false;
		m_CardsFrontBk.show = true;

		SetBkFrame();//设置底框 - 显示部分函数
	}
	//设置卡牌文字内容
	//_userID：玩家ID
	void SetCardsText()
	{
		if(m_CardsState)
		{
			var _userName = "";
			if (m_OpenCardUID.__Long__ == -1) //是系统翻牌 不显示昵称
				_userName = "";
			else
				_userName = window.GetNameByUID(m_OpenCardUID);

			m_CardsText.SetData(_userName);
		}
		else
		{
			var _price = "";
			if(m_CardsType == 1)
			{
				_price = ""+window.g_MoneyCardPrice+"金币";
			}
			if(m_CardsType == 2)
			{
				_price = ""+window.g_TokenCardPrice+"奖券";
			}
			m_CardsText.SetData(_price);
		}
	}
	//设置物品数量
	void SetItemNum(_num)
	{
		m_ItemNum.SetData(_num);
	}
	//设置卡牌翻开状态
	//_state：true为翻开，false为未翻开
	void SetCardsState(_state,_uid)
	{
		m_CardsState = _state;
		m_OpenCardUID = _uid;

		if (m_CardsState)
		{
			window.g_UserGetCardNUM = window.g_UserGetCardNUM+1 ;
		}

		if (window.g_UserGetCardNUM>=10)       //当玩家翻牌数量等于10 退出翻牌界面
		{ 
			window.find("GameOver_TurnCards_Logic").m_TurnCards.StopTimeCount();
			window.find("GameOver_TurnCards_Logic").NeedToTrain();
			window.g_UserGetCardNUM = 0;
		}

		if(_state)
		{
			SetCardsBack();
		}
	}

//	//设置卡牌遮罩状态
//	//_state：true为遮罩打开，false为遮罩未打开
//	void SetCardsMaskState(true)
//	{
//		m_CardsMaskState = _state;
//		m_CardsMask.show = _state;
//	}
//
//	//获取卡牌遮罩状态
//	void GetCardsMaskState()
//	{
//		return m_CardsMaskState;
//	}

	void SetEvent()
	{
		set m_CardsBack
		{
			void OnClick()
			{
//				if(parent.GetCardsMaskState())
//				{
//					window.find("UIController").LoadDLG(678);
//					return;
//				}
				window.OpenCard(parent.m_cardsIndex);
				window.PlaySound(148);
			}
		}
//		set m_CardsMask
//		{
//			void OnClick()
//			{
//				window.find("UIController").LoadDLG(678);
//			}
//		}
	}
	Init();
	SetEvent();
}