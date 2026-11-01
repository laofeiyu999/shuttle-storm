//脑残玩家拯救措施
//老虎添加
//2009-12-2
//包含于\client\game\gameEvent.gml脚本

var BD_temp = 0;
var BD_app = 0;
var BD_HELP = 0;		//是否需要触发拯救措施的标记
var BD_MY_NEWFLY = 0;	//是否是自己的击球轨迹的标记

var BD_MY_ID = 0;
var BD_MY_TEAM_ID = 0;

var BD_TEAMMATE_CHECK = 0;
var BD_MY_TEAMMATE_ID = 0;



void BD_CheckUp()//查看是否需要帮助笨蛋
{
	BD_MY_ID = window.GetMyUID();
	BD_MY_TEAM_ID = window.BD_GetTeamID(BD_MY_ID);
	printf("C# ----拯救笨蛋---- BD_MY_ID " + BD_MY_ID + " BD_MY_TEAM_ID " + BD_MY_TEAM_ID);
	var t_raceAll = window.GetRaceAllNumByUID(BD_MY_ID);//比赛总场次
	var t_raceWin = window.GetRaceWinNumByUID(BD_MY_ID);//获胜场次
	
	if ( t_raceAll == 0)//一场比赛也没打过
	{
		if (BD_CheckState2(usegoods) == 1)
		{
			BD_HELP = 1;	
		}
		else 
		{	BD_HELP = 0;}
		printf("C# ----拯救笨蛋---- 比赛场次为 " + t_raceAll);
	}

	var t_myLevel = window.GetLVByUID();
	var t_winRate = tofloat(t_raceWin)/tofloat(t_raceAll);//胜率
	printf("C# ----拯救笨蛋---- Lv: " + t_myLevel + " 胜率: " + t_winRate);
//	if ( t_myLevel < 20 && t_winRate <= 0.5)//根据湖卫需求，将等级门槛改为20级，原先为6级
	if ( BD_CheckState(t_myLevel,t_winRate) == 1 )
	{
		BD_HELP = 1;		
	}
	else
	{	BD_HELP = 0;}
	printf("C#\\\\\拯救笨蛋/////BD_HELP: "+BD_HELP);
}

void BD_GameEnd()
{
	BD_HELP = 0;
	BD_MY_NEWFLY = 0;

	BD_MY_ID = 0;
	BD_MY_TEAM_ID = 0;

	BD_TEAMMATE_CHECK = 0;
	BD_MY_TEAMMATE_ID = 0;
	printf("C# ----拯救笨蛋---- 比赛结束 数据清零 BD_HELP: " + BD_HELP + " BD_MY_ID: " + BD_MY_ID + " BD_MY_TEAMMATE_ID: " + BD_MY_TEAMMATE_ID);
}

void BD_SomeoneHit( userID, hitAct)
{
	printf("C# ----拯救笨蛋---- BD_TEAMMATE_CHECK: " + BD_TEAMMATE_CHECK + " BD_MY_TEAM_ID: " + BD_MY_TEAM_ID + " BD_GetTeamID: " + window.BD_GetTeamID( userID));
	if ( BD_TEAMMATE_CHECK == 0 && window.BD_GetTeamID( userID) == BD_MY_TEAM_ID && userID != BD_MY_ID)
	{
		BD_MY_TEAMMATE_ID = userID;
		BD_TEAMMATE_CHECK = 1;
	}
	printf("C# ----拯救笨蛋---- userID: " + userID + " BD_MY_ID: " + BD_MY_ID + " BD_MY_TEAMMATE_ID: " + BD_MY_TEAMMATE_ID);
	if (BD_MY_ID == userID || BD_MY_TEAMMATE_ID == userID)//如果是自己或者队友击球，标记一下
	{
		BD_MY_NEWFLY = 1;
		window.LMH_UpDate_PromptInfo(false,0);
		window.BD_HideFallPoint();
	}
	else							//如果是对手击球，显示特效
	{
		BD_MY_NEWFLY = 0;
		window.BD_ShowAct( userID, hitAct);
	}
}

void BD_GetTeamID( userID)
{
	var TEAMID = new VNet2DBRow();
	TEAMID.InitByInt( window.M_G_SERVER, window.USERDT, window.M_G_SERVER_USERDT_UID, userID)
	if ( TEAMID.IsReady() == 0)
	{
		alert("M_G_SERVER_USERDT_TEAM 打开失败");
		TEAMID.del();
		return;
	}
	var teamID = TEAMID.GetData( window.M_G_SERVER_USERDT_TEAM);
	TEAMID.del();
	return teamID;
}

void BD_NewFly()
{
	if ( BD_MY_NEWFLY == 1) return;//自己的击球轨迹，什么也不做

	//对手的击球轨迹，写入数据库
	window.find("NAME_GCMap").find("GCBall").find("TRACKMGR").GetTrackInfoToDB();
	//取出第1、2落点的坐标
	window.BD_FirstPoint();
	window.BD_SecondPoint();
	//显示2个落点特效
	window.BD_ShowFallPoint();
}

void BD_ShowAct( userID, hitAct)//显示对手的击球动作
{
//	if (window.GetMyUID() == userID) return;
	
	var ActData = new VNet2DBRow();
	ActData.InitByInt(window.A001USER,window.HITACT,window.A001USER_HITACT_INDEX ,hitAct);
	if (ActData.IsReady() == 0)
	{
		alert("A001USER_HITACT_HITTYPE 打开失败");
		ActData.del();
		return;
	}
	var actType = ActData.GetData( window.A001USER_HITACT_HITTYPE);
	var isSkill = ActData.GetData( window.A001USER_HITACT_ISSKILL);
	ActData.del();
	printf("C# ----拯救笨蛋---- hitAct: " + hitAct + " actType: " + actType + " isSkill: " + isSkill);
	
	//InfoData:	0为发球，1为档球，2为截球，3为救球，4为削球，5为上旋球，6为放高球，7为发球技能，
	//			8为放高球技能，9为削球技能，10为上旋球技能，11为扣杀技能，12为扣杀
	var infoData = -1;
	//击球类型actType: 0.放高 1.削球 2.上旋 3.截击 4.发球(平击) 5.挡球 6.救球 7.扣杀 8.发球(外旋)
	switch ( actType)
	{
		case 0:
		{
			if (isSkill) infoData = 8;
			else infoData = 6;
			break;
		}
		case 1:
		{
			if (isSkill) infoData = 9;
			else infoData = 4;
			break;
		}
		case 2:
		{
			if (isSkill) infoData = 10;
			else infoData = 5;
			break;
		}
		case 3:infoData = 2;break;//目前所有的截击的actType都是2 上旋类型
		case 4:
		{
			if (isSkill) infoData = 7;
			else infoData = 0;
			break;
		}
		case 5:infoData = 1;break;
		case 6:infoData = 3;break;
		case 7:
		{
			if (isSkill) infoData = 11;
			else infoData = 12;
			break;
		}
		case 8:
		{
			if (isSkill) infoData = 7;
			else infoData = 0;
			break;
		}
	}
	printf("C# ----拯救笨蛋---- infoData: " + infoData);

	if ( infoData == 5 || infoData == 0) return;//不显示 上旋 发球 的动作提示

	window.LMH_UpDate_PromptInfo(true,infoData);
}

void BD_ShowFallPoint()//显示第1、2落地特效
{
	window.find("NAME_GCMap").dropEffect1.visible = true;
	window.find("NAME_GCMap").dropEffect2.visible = true;
}

void BD_HideFallPoint()//隐藏第1、2落地特效
{
	window.find("NAME_GCMap").dropEffect1.visible = false;
	window.find("NAME_GCMap").dropEffect2.visible = false;
}

void BD_FirstPoint()//获得第1落地坐标
{
	var FirstPoint_X = new VNet2DBRow{};
	FirstPoint_X.InitByInt("m_g_clinet.mdb","Alternation",window.M_G_CLINET_ALTERNATION_ID ,0);
	if ( FirstPoint_X.IsReady() == 0 )
	{
		alert("m_g_clinet.mdb Alternation打开失败");
		FirstPoint_X.del();
		return;
	}
	var x_1 =  FirstPoint_X.GetData( window.M_G_CLINET_ALTERNATION_FIRSTDROPPOINTX);

	var FirstPoint_Z = new VNet2DBRow{};
	FirstPoint_Z.InitByInt("m_g_clinet.mdb","Alternation",window.M_G_CLINET_ALTERNATION_ID ,0);
	if ( FirstPoint_Z.IsReady() == 0 )
	{
		alert("m_g_clinet.mdb Alternation打开失败");
		FirstPoint_Z.del();
		return;
	}
	var z_1 = FirstPoint_Z.GetData( window.M_G_CLINET_ALTERNATION_FIRSTDROPPOINTZ);
	printf("C# ----拯救笨蛋---- x_1: " + x_1 + " z_1: " + z_1);

	var FirstPoint_posStr = "" + x_1 + "," + 0.04 + "," + z_1;
	printf("C# ----拯救笨蛋---- FirstPoint_posStr: " + FirstPoint_posStr);
	window.find("NAME_GCMap").dropEffect1.pos = FirstPoint_posStr;
	FirstPoint_X.del();
	FirstPoint_Z.del();
}

void BD_SecondPoint()//获得第2落地坐标
{
	var SecondPoint_X = new VNet2DBRow{};
	SecondPoint_X.InitByInt("m_g_clinet.mdb","Alternation",window.M_G_CLINET_ALTERNATION_ID ,0);
	if ( SecondPoint_X.IsReady() == 0 )
	{
		alert("m_g_clinet.mdb Alternation打开失败");
		SecondPoint_X.del();
		return;
	}
	var x_2 = SecondPoint_X.GetData( window.M_G_CLINET_ALTERNATION_SECONDDROPPOINTX);

	var SecondPoint_Z = new VNet2DBRow{};
	SecondPoint_Z.InitByInt("m_g_clinet.mdb","Alternation",window.M_G_CLINET_ALTERNATION_ID ,0);
	if ( SecondPoint_Z.IsReady() == 0 )
	{
		alert("m_g_clinet.mdb Alternation打开失败");
		SecondPoint_Z.del();
		return;
	}
	var z_2 = SecondPoint_Z.GetData( window.M_G_CLINET_ALTERNATION_SECONDDROPPOINTZ);
	printf("C# ----拯救笨蛋---- x_2: " + x_2 + " z_2: " + z_2);

	var SecondPoint_posStr = "" + x_2 + "," + 0.04 + "," + z_2;
	printf("C# ----拯救笨蛋---- SecondPoint_posStr: " + SecondPoint_posStr);
	window.find("NAME_GCMap").dropEffect2.pos = SecondPoint_posStr;
	SecondPoint_X.del();
	SecondPoint_Z.del();
}

void BD_CheckState(t_myLevel,t_winRate)
{
	var BD_temp =window.GetPropItemEquipState(51001);
	var BD_temp2 =window.GetPropItemEquipState(51002);
	printf("C# ----拯救笨蛋---- BD_temp: " +BD_temp);
	if ( BD_temp == 1 || BD_temp2 == 1) return 1;//根据返回值判断是否使用落点提示道具。
	if ( t_myLevel < 20 && t_winRate <= 0.5) 
	{
		if ( window.find("eventCounter").GetEventCount(window.EVENTCOUNT_EN_help_brain_deformity) < 3)
		{
			window.OpenHelp(12001);
			window.LMH_AddEvent(window.EVENTCOUNT_EN_help_brain_deformity);
			timer(10000,"window.DelHelp()");
		}
		return 1;//根据湖卫需求，将等级门槛改为20级，原先为6级
	}
	else return 0;
}

void BD_CheckState2(usegoods)
{
	var BD_temp3 =window.GetPropItemEquipState(51001);
	var BD_temp4 =window.GetPropItemEquipState(51002);
	if ( BD_temp3 == 1 || BD_temp4 == 1) return 1;//根据返回值判断是否使用落点提示道具。
	else return 0;
}
