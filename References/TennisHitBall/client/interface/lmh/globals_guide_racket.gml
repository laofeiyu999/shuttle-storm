//球拍装备的引导功能
//流氓福提供
//流氓虎使用

set window
{
	//监视礼品盒球拍======================================================================================
	//查询是否需要监视
	void LMH_IsNeedMonitor_GiftBoxRacket()
	{
		if (LMF_Call_LMH(1) == 0)
			{window.LMH_DelDBMonitor_GiftBoxRacket();return;}
		if (LMF_Call_LMH(1) == 1)
			{window.LMH_AddDBMonitor_GiftBoxRacket();return;}
	}
	//添加数据库监视(礼品盒)
	void LMH_AddDBMonitor_GiftBoxRacket()
	{
		set window
		{
			new VNet2DBTable
			{
				Init(window.M_G_GOODS,window.ITEMPRESENT);
				var _SQL = "SELECT * FROM ItemPresent WHERE State<="+window.MAIL_READED+" AND UserId="+window.GetMyUID();
				Select(window.M_G_GOODS,_SQL);
				name  = "LMH_DBMonitor_GiftBoxRacket_NAME";
				void OnAddData(p0,p1,p2,UserId,p4,p5,p6,ItemEntryId)
				{
					if (ItemEntryId.__Long__ < 0)
					{
						return;
					}

					var _class = window.GetClassByEnterId(ItemEntryId);
					if (toint(_class)==105)
					{
						window.LMH_GiftBoxHasRacket();
					}
				}
				printf("C# =====引导=====打开邮箱（球拍）监听");
			};
		}
	}
	//删除数据库监视(背包)
	void LMH_DelDBMonitor_GiftBoxRacket()
	{
		window.find("LMH_DBMonitor_GiftBoxRacket_NAME").del();
		printf("C# =====引导=====关闭邮箱（球拍）监听");
	}

	//邮箱里有球拍了
	void LMH_GiftBoxHasRacket()
	{
		window.LMH_DelDBMonitor_GiftBoxRacket();
		window.LMH_AddEvent(window.EVENTCOUNT_EN_receive_racket);
	}

	//监视背包球拍======================================================================================
	//查询是否需要监视
	void LMH_IsNeedMonitor_PackPacket()
	{
		if (LMF_Call_LMH(2) == 0)
			{window.LMH_DelDBMonitor_PackPacket();return;}
		if (LMF_Call_LMH(2) == 1)
			{window.LMH_AddDBMonitor_PackPacket();return;}
	}
	//添加数据库监视(背包-球拍)
	void LMH_AddDBMonitor_PackPacket()
	{
		set window
		{
			new VNet2DBTable
			{
				Init(window.M_G_GOODS,window.PLAYERITEMS);
				name  = "LMH_DBMonitor_PackPacket_NAME";
				void OnAddData(gid,cid,ownerid,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,packId)
				{
//					if (toint(ownerid) != window.GetMyUID())return;
//					if (window.GetUIPos() == window.POS_PACK)return;//擦阿福的屁股
//					packId = toint(packId);
//					if (packId == 105)
//						{window.LMH_PackHasPacket();}
				}
				printf("C# =====引导=====打开背包（球拍）监听");
			};
		}
	}
	//删除数据库监视(背包-球拍)
	void LMH_DelDBMonitor_PackPacket()
	{
		window.find("LMH_DBMonitor_PackPacket_NAME").del();
		printf("C# =====引导=====关闭背包（球拍）监听");
	}

	//背包有球拍了
	void LMH_PackHasPacket()
	{
//		window.LMH_DelDBMonitor_PackPacket();
		if (window.GetUIPos() == window.POS_MALL)//在商城界面
		{
			window.LMH_DelDBMonitor_GiftBoxRacket();
			printf("C# =====引导=====从商城买入球拍");
			window.find("eventCounter").Guide_Buy_Racket();
		}
		window.LMH_AddEvent(window.EVENTCOUNT_EN_accept_racket);
		printf("C# =====引导=====球拍进入背包");
	}


	//玩家操作的行为======================================================================================
	//[功能]玩家装备了球拍
	void LMH_EquipedTheRacket()
	{
		window.LMH_AddEvent(window.EVENTCOUNT_EN_equip_racket);//装备了球拍
		printf("C#  引导  装备球拍次数 " + window.find("eventCounter").GetEventCount(window.EVENTCOUNT_EN_equip_racket));
	}
	
	//[功能]点击了装备球拍按钮
	void LMH1_BtnEquip()
	{
		//有个变态第一次非得在技能分页装备球拍，搞得老子这么被动！
	}
}