//和游戏相关的全局信息
//夏洋洋 2010-6-5

set window
{
	var g_FirstTurnCard = false;
	
	//作用:开始翻牌
	//参数lastTm:翻牌持续的时间
	void _Result_GetItemBegin(lastTm)
	{
		if(toint(lastTm) < 0)
		{
			window.find("GAME_OVER_LOGIC").NeedToTrain();
			return;
		}
		window.find("DLGLAYER").delallchild();	//翻牌界面弹出前删除“保存录像成功”的弹出框。2010年9月21日 13:29 yxf
		window.find("UIController").LoadUI("UI_TURNCARDS");
		var _secTm = toint(lastTm)/1000;
		window.find("GameOver_TurnCards_Logic").m_TurnCards.SetTimeCount(_secTm);
	}

	
	//作用:翻开第cardIndex张牌
	//参数:userID:翻牌玩家的ID,cardIndex:翻得第几张牌,itemID:翻得的物品
	void _Result_GetItem( userID, cardIndex, itemID)
	{
		window.find("VGame_Over_Cards_"+cardIndex).SetCardsState(true,userID);
		window.find("VGame_Over_Cards_"+cardIndex).SetCardsText();
		var _num = window.GetSplitCount(itemID, ",");
		var _itemInfo = window.SplitStr2(itemID,",",_num);
		sleep(1000);
		window.find("VGame_Over_Cards_"+cardIndex).SetCardsFront(_itemInfo[0]);
		window.find("VGame_Over_Cards_"+cardIndex).SetItemNum(_itemInfo[1]);
		if(window.GetNameByUID(userID) == window.GetMyName())
		{
			window.find("eventCounter").Guide_Turn_Card(_itemInfo[0]);
		}
		if((window.g_FirstTurnCard == false) && (window.GetNameByUID(userID) == window.GetMyName()) && (toint(cardIndex)<5))
		{
			window.g_FirstTurnCard = true;
			var i = 0;
			while(i<5)
			{
				if(i == cardIndex)
				{
					i+=1;
					continue;
				}
				//window.find("VGame_Over_Cards_"+i).SetCardsText(); //2010年9月19日 翻牌界面上面5张卡免费卡下方不再显示“100金币”
//				window.find("VGame_Over_Cards_"+i).SetCardsMaskState(false);
				i+=1;
			}
		}
	}

	//作用:结束翻牌
	void _Result_GetItemEnd()
	{
		window.find("GameOver_TurnCards_Logic").m_TurnCards.StopTimeCount();
		window.find("GameOver_TurnCards_Logic").NeedToTrain();
	}

	//客户端发送翻牌消息
	void OpenCard(_index)
	{
		window.find("GAMELAYER").find("NAME_GCMap").find("self").Result_GetItem(_index);
	}

	//游戏结算时的评价显示
	//_data:评价的值
	void SetGameOverAppraise(_data)
	{
		printf("C# 系统评价:_data:"+_data);
		window.find("GAME_OVER_LOGIC")._VGame_Over_Logic.s_Appraise.SetData("系统评价:",_data);
	}

	//接受翻牌的错误信息
	//nErrorCode：错误信息的索引,
	//		-1：金币不足,
	//		-2：奖券不足
	//		-3: 翻牌保护的提示
	//		-4: 防沉迷阶段
	//		-5: 只能翻一张牌
	void _Result_GetItemFailed(nErrorCode)
	{
		if(nErrorCode == -1)
		{
			window.find("UIController").LoadDLG(679);
			return;
		}
		if(nErrorCode == -2)
		{
			window.find("UIController").LoadDLG(680);
			return;
		}
		if(nErrorCode == -3)
		{
			window.find("UIController").LoadDLG(683);
			return;
		}
		if(nErrorCode == -4)
		{
			window.find("UIController").LoadDLG(690);
			return;
		}
		if(nErrorCode == -5)
		{
			window.find("UIController").LoadDLG(705);
			return;
		}
	}
	var _getBackAttr = 0;  //后场属性
	var _getfrontAttr =0;	//前场属性
	void GetUserAttriBackGrou() //获得后场属性
	{
		var _VNet2DBRow = new VNet2DBRow{};
		_VNet2DBRow.InitByInt( window.M_G_SERVER,window.ROLEDT,window.M_G_SERVER_ROLEDT_UID,window.GetMyUID());
		if ( !_VNet2DBRow.IsReady())
		{
			return 0;
		}
		var _tbackhand = _VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_TBACKHAND);
		_VNet2DBRow.del();	
		return _tbackhand;
	}
	void GetUserAttriFrontGrou()  //获得前场属性
	{
		var _VNet2DBRow = new VNet2DBRow{};
		_VNet2DBRow.InitByInt( window.M_G_SERVER,window.ROLEDT,window.M_G_SERVER_ROLEDT_UID,window.GetMyUID());
		if ( !_VNet2DBRow.IsReady())
		{
			return 0;
		}
		var _tforcehand = _VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_TFORCEHAND);
		_VNet2DBRow.del();	
		return _tforcehand;
	}
}