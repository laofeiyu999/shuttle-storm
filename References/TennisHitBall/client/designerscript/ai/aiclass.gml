class NPCInfo item
{
	//轨迹相关 数据
	var NpcAIrow = new VNet2DBRow{}
	NpcAIrow.InitByInt("m_g_clinet.mdb","Alternation",window.M_G_CLINET_ALTERNATION_ID ,0);
	if ( NpcAIrow.IsReady() == 0 )
	{ 
		alert("m_g_clinet.mdb Alternation打开失败");
		NpcAIrow.del();
		return;
	}
	//读取击球范围相关数据
	var MYHitRow = new VNet2DBRow{};
	MYHitRow.InitByInt("Tennis_Game.mdb","GameArgs",window.TENNIS_GAME_GAMEARGS_GAMEARGS ,0);
	if ( MYHitRow.IsReady() == 0 )
	{ 
		alert("Tennis_Game.mdb打开失败");
		MYHitRow.del();
		return;
	}		
	// 初始化自己的数据库
	var MYUserRow = new VNet2DBRow{};
	void InitMyUserRow()
	{
		
		MYUserRow.InitByInt("m_g_clinet.mdb","AlternationUser",window.M_G_CLINET_ALTERNATIONUSER_GAMESTATION ,parent.parent.find("AIController").GetMyIndex());
		if ( MYUserRow.IsReady() == 0 )
		{ 
			alert("InitMyUserRow()    m_g_clinet.mdb AlternationUser打开失败");
			MYUserRow.del();
			return;
		}			
	}

	// 初始化别人的数据库
	var OtherUserRow = new VNet2DBRow{};
	void InitOtherPlayerUserRow()
	{
		myindex = parent.parent.find("AIController").GetMyIndex()) ;   //得到自己的ID
		if (myindex == 0)
		{
			otherindex = 2;
		}
		if (myindex == 1)
		{
			otherindex = 3;
		}
		if (myindex == 2)
		{
			otherindex = 0;
		}
		if (myindex == 3)
		{
			otherindex = 1;
		}
		
		OtherUserRow.InitByInt("m_g_clinet.mdb","AlternationUser",window.M_G_CLINET_ALTERNATIONUSER_GAMESTATION ,otherindex);
		if ( OtherUserRow.IsReady() == 0 )
		{ 
			alert("InitOtherPlayerUserRow()    m_g_clinet.mdb AlternationUser打开失败");
			OtherUserRow.del();
			return;
		}			
	}
	var xulifanwei = MYHitRow.GetData(window.TENNIS_GAME_GAMEARGS_NORHITDIS) - 0.3;  //蓄力击球的范围
	print("CHEXIN=========xulifanwei "  +xulifanwei);
	var jieqiufanwei = MYHitRow.GetData(window.TENNIS_GAME_GAMEARGS_MAXHITDIS) - 0.3;  //最远击球的范围
	var aireadyposX1 = 0.01 ; // ai击球后准备接下个球的X坐标
	var aireadyposX2 = 0.01 ; // ai击球后准备接下个球的X坐标
	var aireadyposZ =  0.01;// ai击球后准备接下个球的Z坐标
	var faqiuxulishijian = 1300; //AI发球的蓄力时间
	var myindex = -1; //自己的ID
	var otherindex = -2; //对手的ID
		
	
};