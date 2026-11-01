//个人信息:战绩统计类定义
//@刘高辰 08年9月4号
//yxf 2008年11月4日

importex("$./../../UI/SelfInfo/ClassDef_Record.gml");

class VSelfInfo_Record_Logic item
{
	size = "100%,100%";bgcolor = "#FF";alpha = 50;

	//=============================与界面交互========================================
	void Init()
	{
		//总比赛场次
		//参数 data1
		staticvar s_All_MatchDates = new VMyText{pos = "15,0";}
		//胜利场次
		//参数 data1
		staticvar s_Win_MatchDates = new VMyText{pos = "120,0";}
		//总得分
		//参数 data1
		staticvar s_All_Point = new VMyText{pos = "15,30";}
		//胜率
		//参数 data2:胜利场次 data3:总比赛场次
		staticvar s_Winning = new VMyText{pos = "15,60";}
		//ACE球总数
		//参数 data1
		staticvar s_ACE_Total = new VMyText{pos = "15,100";}
		//破发成功率
		//参数 data1
		staticvar s_Break_Point = new VMyText{pos = "15,250";}
		//破发局数
		//参数 data1
		staticvar s_Break_Num = new VMyText{pos = "120,250";}

		//技能总数
		//参数 data1
		staticvar s_Skill_Total = new VMyText{pos = "15,140";}
		//技能得分数
		//参数 data1
		staticvar s_Skill_PointNum = new VMyText{pos = "120,160";}
		//技能得分率
		//参数 data2 技能得分数
		//参数 data3 技能总数
		staticvar s_Skill_Point = new VMyText{pos = "120,140";}
		//普通破解技能数
		//参数 data1
		staticvar s_General_Skill = new VMyText{pos = "15,180";}
		//技能破解技能数
		//参数 data1
		staticvar s_Skill_Skill = new VMyText{pos = "15,210";}
	}
	inclass("VSelfInfo_Record_UI");//界面显示类
	//================================DBList=========================================
	//取数据库的数据
	void ReadDataFromDB()
	{
		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByInt(window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_UID,window.g_SelfInfo_UID);
		if (!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			window.find("UIController").LoadDLG(148);//玩家已离线，战绩统计信息错误！
			printf("B# error:DBname:"+window.M_G_SERVER+",TBName1:"+window.USERDT+",window.g_SelfInfo_UID:"+window.g_SelfInfo_UID);
			return;
		}
		var _WinMatch = _VNet2DBRow.GetData(window.M_G_SERVER_USERDT_TS_RACEWINNUM);
		var _AllMatch = _VNet2DBRow.GetData(window.M_G_SERVER_USERDT_TS_RACEALLNUM);
		//总比赛场次
		s_All_MatchDates.SetData(_AllMatch,"","");
		//胜利场次
		s_Win_MatchDates.SetData(_WinMatch,"","");
		//胜率
		s_Winning.SetData("",_WinMatch,_AllMatch);
		//总得分
		s_All_Point.SetData(_VNet2DBRow.GetData(window.M_G_SERVER_USERDT_TS_RACEALLSCORE),"","");
		//ACE球总数
		s_ACE_Total.SetData(_VNet2DBRow.GetData(window.M_G_SERVER_USERDT_TS_RACEACE),"","");
		//破发成功率
		s_Break_Point.SetData(_VNet2DBRow.GetData(window.M_G_SERVER_USERDT_TS_RACEBREAKSUCCESS),"","");
		//破发局数
		s_Break_Num.SetData(_VNet2DBRow.GetData(window.M_G_SERVER_USERDT_TS_RACEBREAKNUM),"","");
		
		var _skillnum = _VNet2DBRow.GetData(window.M_G_SERVER_USERDT_TS_RACESKILLNUM);
		var _skillscrore = _VNet2DBRow.GetData(window.M_G_SERVER_USERDT_TS_RACESKILLSCORE);
		//技能总数
		s_Skill_Total.SetData(_skillnum,"","");
		//技能得分数
		s_Skill_PointNum.SetData(_skillscrore,"","");
		//技能得分率//_VNet2DBRow.GetData(window.M_G_SERVER_USERDT_TS_RACESKILLRATE)
		s_Skill_Point.SetData("",_skillscrore,_skillnum);
		//普通破解技能总数
		s_General_Skill.SetData(_VNet2DBRow.GetData(window.M_G_SERVER_USERDT_TS_RACEBREAKSKILL),"","");
		//技能破解技能总数
		s_Skill_Skill.SetData(_VNet2DBRow.GetData(window.M_G_SERVER_USERDT_TS_RACESKILLBREAKSKILL),"","");
		
		_VNet2DBRow.del();
	}

	void OnCreated()
	{
		Init();
		ReadDataFromDB();
	}
};