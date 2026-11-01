//属性启用的引导功能
//流氓福提供
//流氓虎使用

set window
{
	//监视礼品盒属性======================================================================================
	//查询是否需要监视
	void LMH_IsNeedMonitor_GiftBoxAtt()
	{
		if (LMF_Call_LMH(5) == 0)
			{window.LMH_DelDBMonitor_GiftBoxAtt();return;}
		if (LMF_Call_LMH(5) == 1)
			{window.LMH_AddDBMonitor_GiftBoxAtt();return;}
	}
	//添加数据库监视(礼品盒)
	void LMH_AddDBMonitor_GiftBoxAtt()
	{
		set window
		{
			new VNet2DBTable
			{
				Init(window.M_G_GOODS,window.ITEMPRESENT);
				var _SQL = "SELECT * FROM ItemPresent WHERE State<="+window.MAIL_READED+" AND UserId="+window.GetMyUID();
				Select(window.M_G_GOODS,_SQL);

				name  = "LMH_DBMonitor_GiftBoxAtt_NAME";
				void OnAddData(p0,p1,p2,UserId,p4,p5,p6,ItemEntryId)
				{
					if (ItemEntryId.__Long__ < 0)
					{
						return;
					}

					var _class = window.GetClassByEnterId(ItemEntryId);
					if (toint(_class) >= 600 && toint(_class) <= 606)
						{window.LMH_GiftBoxHasAtt();}
				}
				printf("C# =====引导=====打开邮箱（属性）监听");
			};
		}
	}
	//删除数据库监视(邮箱)
	void LMH_DelDBMonitor_GiftBoxAtt()
	{
		window.find("LMH_DBMonitor_GiftBoxAtt_NAME").del();
		printf("C# =====引导=====关闭邮箱（属性）监听");
	}

	//礼品盒有属性了
	void LMH_GiftBoxHasAtt()
	{
		window.LMH_DelDBMonitor_GiftBoxAtt();
		window.LMH_AddEvent(window.EVENTCOUNT_EN_receive_attribute);
	}

	//监视背包技能======================================================================================
	//查询是否需要监视
	void LMH_IsNeedMonitor_PackAtt()
	{
		if (LMF_Call_LMH(6) == 0)
			{window.LMH_DelDBMonitor_PackAtt();return;}
		if (LMF_Call_LMH(6) == 1)
			{window.LMH_AddDBMonitor_PackAtt();return;}
	}
	//添加数据库监视(背包)
	void LMH_AddDBMonitor_PackAtt()
	{
		set window
		{
			new VNet2DBTable
			{
				Init(window.M_G_GOODS,window.PLAYERITEMS);
				name  = "LMH_DBMonitor_PackAtt_NAME";
				void OnAddData(gid,cid,ownerid,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,packId)
				{
//					if (toint(ownerid) != window.GetMyUID())return;
//					if (window.GetUIPos() == window.POS_PACK)return;//擦阿福的屁股
//					packId = toint(packId);
//					if (packId >= 600 && packId <= 606)
//						{window.LMH_PackHasAtt();}
				}
				printf("C# =====引导=====打开背包（属性）监听");
			};
		}
	}
	//删除数据库监视(背包)
	void LMH_DelDBMonitor_PackAtt()
	{
		window.find("LMH_DBMonitor_PackAtt_NAME").del();
		printf("C# =====引导=====关闭背包（属性）监听");
	}

	//背包有技能了
	void LMH_PackHasAtt()
	{
//		window.LMH_DelDBMonitor_PackAtt();
		printf("C# 数据检查: GetUIPos() " + window.GetUIPos());
		if (window.GetUIPos() == window.POS_MALL)//在商城界面
		{
			window.LMH_DelDBMonitor_GiftBoxAtt();
			printf("C# =====引导=====从商城买入属性");
			window.find("eventCounter").Guide_Buy_Attribute();
		}
		window.LMH_AddEvent(window.EVENTCOUNT_EN_accept_attribute);
		printf("C# =====引导=====属性卡进入背包");
	}

	//玩家操作的行为======================================================================================
	//[功能]技能绑定时
	void LMH_OperateAtt()
	{
		window.LMH_AddEvent(window.EVENTCOUNT_EN_operate_attribute);//启用了属性
		printf("C#  引导  操作属性次数 " + window.find("eventCounter").GetEventCount(window.EVENTCOUNT_EN_operate_attribute));
	}

}