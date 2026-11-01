//技能绑定的引导功能
//流氓福提供
//流氓虎使用

set window
{
	//监视礼品盒技能======================================================================================
	//查询是否需要监视
	void LMH_IsNeedMonitor_GiftBoxSkill()
	{
		if (LMF_Call_LMH(3) == 0)
			{window.LMH_DelDBMonitor_GiftBoxSkill();return;}
		if (LMF_Call_LMH(3) == 1)
			{window.LMH_AddDBMonitor_GiftBoxSkill();return;}
	}
	//添加数据库监视(礼品盒)
	void LMH_AddDBMonitor_GiftBoxSkill()
	{
		set window
		{
			new VNet2DBTable
			{
				Init(window.M_G_GOODS,window.ITEMPRESENT);
				var _SQL = "SELECT * FROM ItemPresent WHERE State<="+window.MAIL_READED+" AND UserId="+window.GetMyUID();
				Select(window.M_G_GOODS,_SQL);

				name  = "LMH_DBMonitor_GiftBoxSkill_NAME";
				void OnAddData(p0,p1,p2,UserId,p4,p5,p6,ItemEntryId)
				{
					if (ItemEntryId.__Long__ < 0)
					{
						return;
					}

					var _class = window.GetClassByEnterId(ItemEntryId);
					if (toint(_class)<=404 && toint(_class)>=400)
						{window.LMH_GiftBoxHasSkill();}
				}
				printf("C# =====引导=====打开邮箱（技能）监听");
			};
		}
	}
	//删除数据库监视(背包)
	void LMH_DelDBMonitor_GiftBoxSkill()
	{
		window.find("LMH_DBMonitor_GiftBoxSkill_NAME").del();
		printf("C# =====引导=====关闭邮箱（技能）监听");
	}

	//礼品盒有技能了
	void LMH_GiftBoxHasSkill()
	{
		window.LMH_DelDBMonitor_GiftBoxSkill();
		window.LMH_AddEvent(window.EVENTCOUNT_EN_receive_skill);
	}

	//监视背包技能======================================================================================
	//查询是否需要监视
	void LMH_IsNeedMonitor_PackSkill()
	{
		if (LMF_Call_LMH(4) == 0)
			{window.LMH_DelDBMonitor_PackSkill();return;}
		if (LMF_Call_LMH(4) == 1)
			{window.LMH_AddDBMonitor_PackSkill();return;}
	}
	//添加数据库监视(背包)
	void LMH_AddDBMonitor_PackSkill()
	{
		set window
		{
			new VNet2DBTable
			{
				Init(window.M_G_GOODS,window.PLAYERITEMS);
				name  = "LMH_DBMonitor_PackSkill_NAME";
				void OnAddData(gid,cid,ownerid,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,packId)
				{
//					if (toint(ownerid) != window.GetMyUID())return;
//					if (window.GetUIPos() == window.POS_PACK)return;//擦阿福的屁股
//					packId = toint(packId);
//					if (packId<=404 && packId>=400)
//						{window.LMH_PackHasSkill();}
				}
				printf("C# =====引导=====打开背包（技能）监听");
			};
		}
	}
	//删除数据库监视(背包)
	void LMH_DelDBMonitor_PackSkill()
	{
		window.find("LMH_DBMonitor_PackSkill_NAME").del();
		printf("C# =====引导=====关闭背包（技能）监听");
	}

	//背包有技能了
	void LMH_PackHasSkill()
	{
//		window.LMH_DelDBMonitor_PackSkill();
		var t_UIpos = window.GetUIPos();
		printf("C# 数据检查: GetUIPos() " + t_UIpos);
		
		//这是一个纯保护机制，正常流程是不会走到这里的，但为了避免因为强制引导造成的不可操作，加此保护
		if (t_UIpos == window.POS_TRAINING || t_UIpos == window.POS_GAME)//在游戏中或者训练中
		{	return;}
		
		if (t_UIpos == window.POS_MALL)//在商城界面
		{
			window.LMH_DelDBMonitor_GiftBoxSkill();
			printf("C# =====引导=====从商城买入技能");
			window.find("eventCounter").Guide_Buy_Skill();
		}
		window.LMH_AddEvent(window.EVENTCOUNT_EN_accept_skill);
		printf("C# =====引导=====技能进入背包");
	}

	//玩家操作的行为======================================================================================
	//[功能]技能绑定时
	//[参数]reason:原因 0默认 1没球拍
	void LMH_BindSkill(reason)
	{
//		alert("reason: " + reason);
		if ( reason == 0)
		{
			window.LMH_AddEvent(window.EVENTCOUNT_EN_bind_skill);//绑定了技能
			printf("C# =====引导=====绑定技能次数 " + window.find("eventCounter").GetEventCount(window.EVENTCOUNT_EN_bind_skill));
		}
		else
		{
			printf("C# =====引导=====绑定技能时发现未装备球拍");
			window.find("eventCounter").Guide_BindSkill_withoutRacket();
		}
	}

}