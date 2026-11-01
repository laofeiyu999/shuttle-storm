//
//游戏内界面的逻辑部分:游戏中>>双打
//yxf 2008年11月19日
//

import("$./ClassDef_PlayLogic_Sub.gml");
import("$./../../UI/Game/ClassDef_PlayUI_D.gml");
import("$./ClassDef_PlayLogic_Skill_Icon.gml");
import("$./ClassDef_LimitTimeTask.gml");

//
//游戏中的界面-逻辑
//
class VGame_Playing_D_Logic item
{
	size = "100%,100%";
	var m_iGameNum = 1;					//游戏的局数
	var m_iP1GameScore = 0;				//p1的赢的局数
	var m_iP2GameScore = 0;				//p2的赢的局数
	var m_iP1Point = 0;					//P1的当前得分-打完一球就变化
	var m_iP2Point = 0;					//P2的当前得分-打完一球就变化

	var m_iP1Character = 1;				//P1角色的性格 1 2 3
	var m_iP1Sex = 1;					//P1性别 1男 2女
	var m_iP2Character = 1;				//P2角色的性格 1 2 3
	var m_iP2Sex = 1;					//P2性别 1男 2女
	var m_iP3Character = 1;				//P3角色的性格 1 2 3
	var m_iP3Sex = 1;					//P3性别 1男 2女
	var m_iP4Character = 1;				//P4角色的性格 1 2 3
	var m_iP4Sex = 1;					//P5性别 1男 2女
	
	var m_GameState = 0;				//游戏状态 2:开始 3:正中进行 4:结束 5:结束后
	
	var m_LoverOrNot = window.GetRoomType();//获得房间类型
//	var m_iT1KillShotNum = 0;		//情侣模式各种球所得的比分
//	var m_iT1BadBallNum = 0;
//	var m_iT1HighBallNum = 0;
//	var m_iT1SnickBallNum = 0;
//	var m_iT1CutBallNum = 0;
//	var m_iT1ALLKillShotNum = 0;	//情侣模式所需各种类型球的个数
//	var m_iT1ALLBadBallNum = 0;
//	var m_iT1ALLHighBallNum = 0;
//	var m_iT1ALLSnickBallNum = 0;
//	var m_iT1ALLCutBallNum = 0;

	//===================================与显示交互部分========================================
	void Init()
	{
		//p1昵称+P3昵称+能量
		//参数：见类定义
		staticvar s_P1_P3_Head = new VRole_Name_Energy_D_Logic{valign = "100,0";}	

		//p2昵称+P4昵称+能量
		//参数：见类定义
		staticvar s_P2_P4_Head = new VRole_Name_Energy_D_Logic{valign = "100,0";halign = "100,0";}	

		//p1的快捷栏
		//参数：见类定义
		staticvar s_P1_Skill = new VShortBarIcon_All_Logic
		{
			//pos(400,600);
			halign(60,0);valign(100,0);
		}	
		
		//游戏中辅助信息提示
		staticvar s_PromptInfo = new item{}; 

		//右上角比分
		//参数 data2:p1的分
		//参数 data3:P2的分
		staticvar s_P1vsP2Point = new VMyText{pos = "10,30";bgcolor = "#FFFFFF";}

		//基础提示信息
		staticvar s_BaseTipInfo = new VRole_BaseTipInfo_Logic{valign(50,0);halign(50,0);}
		//情侣基础提示信息
		staticvar s_LoverBaseTipInfo =new VRole_LoverBaseTipInfo_UIText{valign(50,0);halign(50,0);}

		//p1一球结束：特殊提示信息
		//参数 RoleID:角色的ID
		//参数 ActIndex: 动作的类型:1发球得分 2扣杀 3绝杀 4反杀 此处添加规则 1*100+性格 -1:为无效值
		//参数 Sex：性别
		staticvar s_TipSpecial_1 = new VPlay_Special_Logic{}

		//p2一球结束：特殊提示信息
		//参数 RoleID:角色的ID
		//参数 ActIndex: 动作的类型:1发球得分 2扣杀 3绝杀 4反杀 此处添加规则 1*100+性格 -1:为无效值
		//参数 Sex：性别
		staticvar s_TipSpecial_2 = new VPlay_Special_Logic{}
		
		//p3一球结束：特殊提示信息
		//参数 RoleID:角色的ID
		//参数 ActIndex: 动作的类型:1发球得分 2扣杀 3绝杀 4反杀 此处添加规则 1*100+性格 -1:为无效值
		//参数 Sex：性别
		staticvar s_TipSpecial_3 = new VPlay_Special_Logic{}

		//p4一球结束：特殊提示信息
		//参数 RoleID:角色的ID
		//参数 ActIndex: 动作的类型:1发球得分 2扣杀 3绝杀 4反杀 此处添加规则 1*100+性格 -1:为无效值
		//参数 Sex：性别
		staticvar s_TipSpecial_4 = new VPlay_Special_Logic{}

		//一球结束：普通的提示信息
		//参数：无
		staticvar s_TipCommon = new item
		{
			size = "100%,100%";
			var _top = new item
			{
				size = "100%,200";bgcolor = "#000000";alpha = 30;pos = "0,-200";
			}
			var _bottom = new item
			{
				size = "100%,200";bgcolor = "#000000";alpha = 30;pos = "0,780";
			}
			//开始
			void SetStart()
			{
				show = true;
				_top.alpha = 30;_bottom.alpha = 30;
				//在这里做动画的时间控制
				_top.setParamTimer("pos","0,-160","0,0",800,200);
				_bottom.setParamTimer("pos","0,780","0,620",800,200);
			}
			//结束
			void SetEnd(){show = false;}
		}

		//一局比赛结束提示
		//P1RID,P1point,P2point,P1Name,P2Name,P1Act,P1Sex,P3RID,P3Name,P3Act,P3Sex,P4Name
		//参数 P1RID:我自己的角色ID
		//参数 P1point: 胜利局数
		//参数 P2point: 失败局数
		//参数 P1Name: 自己的昵称
		//参数 P2Name: 对方P2的昵称
		//参数 P1Act: 我的动作的索引
		//参数 P1Sex：我的性别
		//参数 P3RID：我的队友P3的RID
		//参数 P3Name：我的队友P3的昵称
		//参数 P3Act：我的队友P3的动作的索引
		//参数 P3Sex：我的队友P3的性别
		//参数 P4Name：对方P4的昵称
		staticvar s_BoardEnd = new item
		{
			size = "100%,100%";bgcolor = "#000000";alpha = 70;
			//显示 局数比
			var _Text = new VMyText{valign(50,0);halign(70,0);font = "宋体,-1,40";}
			//昵称 
			var _name = new VMyText{valign(60,0);halign(70,0);font = "宋体,-1,40";}
			//动作索引
			var _actindex = new VMyText{valign(70,0);halign(70,0);font = "宋体,-1,40";}
			//
			void SetData(RoleID,Spoint,Fpoint,MyName,OtherName,ActIndex,Sex)
			{
				_Text.SetData("RoleID:"+RoleID+"  ","局数比："+Spoint,Fpoint);
				_name.SetData(MyName,","+OtherName);
				_actindex.SetData("动作索引："+ActIndex,"","性别："+Sex);
			}
		}

		//蓄力条
		//参数 data1: 0:默认 1:开始发球 2:发球结束
		staticvar s_StorePower = new VMyText{valign(90,0);halign(50,0);}

		//局分情况显示
		//参数 gamenum:总局数 1-n
		//参数 currnum:当前局 1-n,0为初始值
		//参数 winorlost:输赢 1表示输 2表示赢
		staticvar s_GameNum = new VMyText{}

		//押注金额
		//value:-1,不显示 
		staticvar s_Wager = new VMyText{}

		//活动点数
		staticvar s_RaceData = new VMyText{}

		//点我充点
		staticvar s_Btn_AddPoint = new VMyButton{Init("点我充点");}

	}//end init
	inclass("VGame_Playing_D_UI");//界面显示类
	//======================================================================================
	
	void SetEvent()
	{
		set s_ShowAngle
		{
			void OnPressed()
			{
				parent.s_BallAngle.show = true;
				parent.s_SectorTime.show = true;
				parent.s_MaxSpeed.show = true;
				parent.s_MaxSpeed.s_MaxSectorSpeed.show = true;
				parent.s_Angle.show = true;
				parent.s_Speed.show = true;
				parent.s_ShowAngle.show = false;
				parent.s_HideAngle.show = true;
			}
		}
		set s_HideAngle
		{
			void OnPressed()
			{
				parent.s_BallAngle.show = false;
				parent.s_SectorTime.show = false;
				parent.s_MaxSpeed.show = false;
				parent.s_MaxSpeed.s_MaxSectorSpeed.show = false;
				parent.s_Angle.show = false;
				parent.s_Speed.show = false;
				parent.s_HideAngle.show = false;
				parent.s_ShowAngle.show = true;
			}
		}
	}

	//初始化:技能显示
	void Init_Skill()
	{
		//UserID，序号,状态(0灰,1亮)
		SetSkillState(parent._P1UID,1,0);
		SetSkillState(parent._P1UID,2,0);
		SetSkillState(parent._P1UID,3,0);
		SetSkillState(parent._P1UID,4,0);
		SetSkillState(parent._P1UID,5,0);
		//SetSkillState(parent._P2UID,5,0);
	}

	//初始化道具
	void Init_Item()
	{
		s_P1_Skill.s_Item1.s_Skill_Icon.SetData("",window.POWERBALL_ID,1);
	}

	//初始化：昵称+能量
	void Init_Name_Energy()
	{
		s_P1_P3_Head.s_Name1.SetData("1昵称:",parent._User1.GetNkName(),"");
		s_P1_P3_Head.s_Name2.SetData("3昵称:",parent._User3.GetNkName(),"");
		//s_P1_P3_Head.s_CurrEnergy.SetData("当前能量:",0,parent._User1.GetEnergy());

		s_P2_P4_Head.s_Name1.SetData("昵称:",parent._User2.GetNkName(),"");
		s_P2_P4_Head.s_Name2.SetData("昵称:",parent._User4.GetNkName(),"");
		//s_P2_P4_Head.s_CurrEnergy.SetData("当前能量:",0,parent._User2.GetEnergy());
	}
	
	//初始化:左上角比分
	void Init_Point()
	{
		s_P1vsP2Point.SetData("比分:",0,0);
	}
	
	void Init_LoverPoint()
	{
		s_LoverBaseTipInfo.Init(parent._User1.GetUID());
		s_LoverPointInfo.Init(parent._User1.GetUID());
	}

	//初始化：基础提示信息
	void Init_BaseTipInfo()
	{
		s_BaseTipInfo.s_ChangeGround.show = false;
		s_BaseTipInfo.s_GamePoint.show = false;
		s_BaseTipInfo.s_BreakPoint.show = false;
		s_BaseTipInfo.s_SetPoint.show = false;
	}
	
	void GetTeambyUID(UserID)
	{
		var team = window.GetTeamByUID(UserID);
		if ( team == 1)
			team = 2;
		else
			team = 1;
		return team;
	}
	void Init_LoverPointInfo()
	{
		s_LoverPointInfo.P1_kqnum.show = true;
		s_LoverPointInfo.P1_hqnum.show = true;
		s_LoverPointInfo.P1_fgqnum.show = true;
		s_LoverPointInfo.P1_xqnum.show = true;
		s_LoverPointInfo.P1_jjqnum.show = true;
		s_LoverPointInfo.P2_kqnum.show = true;
		s_LoverPointInfo.P2_hqnum.show = true;
		s_LoverPointInfo.P2_fgqnum.show = true;
		s_LoverPointInfo.P2_xqnum.show = true;
		s_LoverPointInfo.P2_jjqnum.show = true;

		s_LoverPointInfo.P1_kqnumFinish.show = false;
		s_LoverPointInfo.P1_hqnumFinish.show = false;
		s_LoverPointInfo.P1_fgqnumFinish.show = false;
		s_LoverPointInfo.P1_xqnumFinish.show = false;
		s_LoverPointInfo.P1_jjqnumFinish.show = false;
		s_LoverPointInfo.P2_kqnumFinish.show = false;
		s_LoverPointInfo.P2_hqnumFinish.show = false;
		s_LoverPointInfo.P2_fgqnumFinish.show = false;
		s_LoverPointInfo.P2_xqnumFinish.show = false;
		s_LoverPointInfo.P2_jjqnumFinish.show = false;
	}
	//初始化情侣模式比分信息
	void UpData_LoverPointInfo(UserID,KillShotNum,BadBallNum,HighBallNum,SnickBallNum,CutBallNum,ALLKillShotNum,
			ALLBadBallNum,ALLHighBallNum,ALLSnickBallNum,ALLCutBallNum)
	{
		if (window.g_DEBUG)
		{
			printf("wwwUpData_LoverPointInfo-D:UserID："+UserID+",KillShotNum:"+KillShotNum+",BadBallNum:"+BadBallNum+",HighBallNum:"+HighBallNum
				+",SnickBallNum:"+SnickBallNum+",CutBallNum:"+CutBallNum+", ALLKillShotNum:"+ALLKillShotNum+",ALLBadBallNum:"+ALLBadBallNum
				+",ALLHighBallNum:"+ALLHighBallNum+",ALLSnickBallNum:"+ALLSnickBallNum+",ALLCutBallNum:"+ALLCutBallNum);
		}
		Init_LoverPointInfo();
		if ( UserID == parent._P1UID )
		{
			var _team = GetTeambyUID(UserID);
			s_LoverPointInfo.P1_kqnum.s_LoverPoint.SetData(KillShotNum,0,_team,""+15+","+8);//情侣一对比分
			s_LoverPointInfo.P1_kqnum.pmaxnum_2.setNum(ALLKillShotNum);
			s_LoverPointInfo.P1_hqnum.s_LoverPoint.SetData(BadBallNum,0,_team,""+15+","+8);//情侣一对比分
			s_LoverPointInfo.P1_hqnum.pmaxnum_2.setNum(ALLBadBallNum);
			s_LoverPointInfo.P1_fgqnum.s_LoverPoint.SetData(HighBallNum,0,_team,""+15+","+8);//情侣一对比分
			s_LoverPointInfo.P1_fgqnum.pmaxnum_2.setNum(ALLHighBallNum);
			s_LoverPointInfo.P1_xqnum.s_LoverPoint.SetData(SnickBallNum,0,_team,""+15+","+8);//情侣一对比分
			s_LoverPointInfo.P1_xqnum.pmaxnum_2.setNum(ALLSnickBallNum);
			s_LoverPointInfo.P1_jjqnum.s_LoverPoint.SetData(CutBallNum,0,_team,""+15+","+8);//情侣一对比分
			s_LoverPointInfo.P1_jjqnum.pmaxnum_2.setNum(ALLCutBallNum);
		}
		if (UserID == parent._P2UID)
		{
			var _team = GetTeambyUID(UserID);
			s_LoverPointInfo.P2_kqnum.s_LoverPoint.SetData(KillShotNum,0,_team,""+15+","+8);//情侣一对比分
			s_LoverPointInfo.P2_kqnum.pmaxnum_2.setNum(ALLKillShotNum);
			s_LoverPointInfo.P2_hqnum.s_LoverPoint.SetData(BadBallNum,0,_team,""+15+","+8);//情侣一对比分
			s_LoverPointInfo.P2_hqnum.pmaxnum_2.setNum(ALLBadBallNum);
			s_LoverPointInfo.P2_fgqnum.s_LoverPoint.SetData(HighBallNum,0,_team,""+15+","+8);//情侣一对比分
			s_LoverPointInfo.P2_fgqnum.pmaxnum_2.setNum(ALLHighBallNum);
			s_LoverPointInfo.P2_xqnum.s_LoverPoint.SetData(SnickBallNum,0,_team,""+15+","+8);//情侣一对比分
			s_LoverPointInfo.P2_xqnum.pmaxnum_2.setNum(ALLSnickBallNum);
			s_LoverPointInfo.P2_jjqnum.s_LoverPoint.SetData(CutBallNum,0,_team,""+15+","+8);//情侣一对比分
			s_LoverPointInfo.P2_jjqnum.pmaxnum_2.setNum(ALLCutBallNum);
		}
	}

	//更新基础提示信息
	//参数：交换场地，局数, 破发点，局点/赛点 
	void UpData_BaseTipInfo(TipState1,GameNum,TipState2,TipState3)
	{
		if (window.g_DEBUG)
		{
			printf("B# 基础提示-D：UpData_BaseTipInfo-TipState1:"+TipState1+",GameNum:"+GameNum+",TipState2:"+TipState2+",TipState3:"+TipState3);
		}
		
		Hide_BaseTipInfo(true);
		Init_BaseTipInfo();

		if (TipState1 == 1)
		{
			s_BaseTipInfo.s_ChangeGround.show = true;
		}
		s_BaseTipInfo.s_GameNum.SetData("局数:",GameNum);
		s_BaseTipInfo.s_Point.SetData("",m_iP1Point,m_iP2Point);
		if (TipState2 == 1)
		{
			s_BaseTipInfo.s_BreakPoint.show = true;
			s_BaseTipInfo.s_BreakPoint.SetData();
		}
		if (TipState3 == 1)
		{
			s_BaseTipInfo.s_GamePoint.show = true;
			s_BaseTipInfo.s_GamePoint.SetData();
		}
		if (TipState3 == 2)
		{
			s_BaseTipInfo.s_GameNum.show = false;
			s_BaseTipInfo.s_Point.show = false;
			s_BaseTipInfo.s_SetPoint.show = true;
			s_BaseTipInfo.s_SetPoint.SetData();
		}

		timer(window._Time_BaseTipInfo,"Hide_BaseTipInfo(false)");
	}
	//显示/隐藏:基础提示信息
	void Hide_BaseTipInfo(param)
	{
		s_BaseTipInfo.show = param;
		if (!param)
		{
			s_TipCommon.SetEnd();
			window.find("GameInterface").ShowOver_Start();//新的一球开始提示结束了
			//window.SetChatEnterFlag(window.CHAT_ENTER_YES,"VGame_Playing_S_Logic");//能激活
			//window.find("gameinput").SetDirOnUse(1);//0是关闭方向,1是开启方向
			//window.find("NAME_GCMap").KeyBoardEnable(1);//0锁定解锁按键 1解除锁定
			window.find("NAME_GCMap").UnlockServe ();//新解锁函数
		}
	}
	
	void Init_LoverBaseTipInfo()
	{
		s_LoverBaseTipInfo.P1_kqnum.show = true;
		s_LoverBaseTipInfo.P1_hqnum.show = true;
		s_LoverBaseTipInfo.P1_fgqnum.show = true;
		s_LoverBaseTipInfo.P1_xqnum.show = true;
		s_LoverBaseTipInfo.P1_jjqnum.show = true;
		s_LoverBaseTipInfo.P2_kqnum.show = true;
		s_LoverBaseTipInfo.P2_hqnum.show = true;
		s_LoverBaseTipInfo.P2_fgqnum.show = true;
		s_LoverBaseTipInfo.P2_xqnum.show = true;
		s_LoverBaseTipInfo.P2_jjqnum.show = true;

		s_LoverBaseTipInfo.P1_kqnumFinish.show = false;
		s_LoverBaseTipInfo.P1_hqnumFinish.show = false;
		s_LoverBaseTipInfo.P1_fgqnumFinish.show = false;
		s_LoverBaseTipInfo.P1_xqnumFinish.show = false;
		s_LoverBaseTipInfo.P1_jjqnumFinish.show = false;
		s_LoverBaseTipInfo.P2_kqnumFinish.show = false;
		s_LoverBaseTipInfo.P2_hqnumFinish.show = false;
		s_LoverBaseTipInfo.P2_fgqnumFinish.show = false;
		s_LoverBaseTipInfo.P2_xqnumFinish.show = false;
		s_LoverBaseTipInfo.P2_jjqnumFinish.show = false;
	}

	void UpData_LoverBaseTipInfo(UserID,KillShotNum,BadBallNum,HighBallNum,SnickBallNum,CutBallNum,ALLKillShotNum,
			ALLBadBallNum,ALLHighBallNum,ALLSnickBallNum,ALLCutBallNum)
	{
		if (window.g_DEBUG)
		{
			printf(" wwww情侣双打数据-D:UserID："+UserID+",KillShotNum:"+KillShotNum+",BadBallNum:"+BadBallNum+",HighBallNum:"+HighBallNum
				+",SnickBallNum:"+SnickBallNum+",CutBallNum:"+CutBallNum+", ALLKillShotNum:"+ALLKillShotNum+",ALLBadBallNum:"+ALLBadBallNum
				+",ALLHighBallNum:"+ALLHighBallNum+",ALLSnickBallNum:"+ALLSnickBallNum+",ALLCutBallNum:"+ALLCutBallNum);
		}
		Hide_LoverBaseTipInfo(true);
		
		if ( UserID == parent._P1UID )
		{
			if ( KillShotNum == ALLKillShotNum)
			{
				s_LoverBaseTipInfo.P1_kqnum.show = false;
				s_LoverBaseTipInfo.P1_kqnumFinish.show = true;
			}
			if ( BadBallNum == ALLBadBallNum)
			{
				s_LoverBaseTipInfo.P1_hqnum.show = false;
				s_LoverBaseTipInfo.P1_hqnumFinish.show = true;
			}
			if ( HighBallNum == ALLHighBallNum)
			{
				s_LoverBaseTipInfo.P1_fgqnum.show = false;
				s_LoverBaseTipInfo.P1_fgqnumFinish.show = true;
			}
			if ( SnickBallNum == ALLSnickBallNum)
			{
				s_LoverBaseTipInfo.P1_xqnum.show = false;
				s_LoverBaseTipInfo.P1_xqnumFinish.show = true;
			}
			if ( CutBallNum == ALLCutBallNum)
			{
				s_LoverBaseTipInfo.P1_jjqnum.show = false;
				s_LoverBaseTipInfo.P1_jjqnumFinish.show = true;
			}
			s_LoverBaseTipInfo.P1_kqnum._pnum.setNum(KillShotNum);
			s_LoverBaseTipInfo.P1_hqnum._pnum.setNum(BadBallNum);
			s_LoverBaseTipInfo.P1_fgqnum._pnum.setNum(HighBallNum);
			s_LoverBaseTipInfo.P1_xqnum._pnum.setNum(SnickBallNum);
			s_LoverBaseTipInfo.P1_jjqnum._pnum.setNum(CutBallNum);
			s_LoverBaseTipInfo.P1_kqnum._pmaxnum_2.setNum(ALLKillShotNum);
			s_LoverBaseTipInfo.P1_hqnum._pmaxnum_2.setNum(ALLBadBallNum);
			s_LoverBaseTipInfo.P1_fgqnum._pmaxnum_2.setNum(ALLHighBallNum);
			s_LoverBaseTipInfo.P1_xqnum._pmaxnum_2.setNum(ALLSnickBallNum);
			s_LoverBaseTipInfo.P1_jjqnum._pmaxnum_2.setNum(ALLCutBallNum);
		}
		if ( UserID == parent._P2UID )
		{
			if ( KillShotNum == ALLKillShotNum)
			{
				s_LoverBaseTipInfo.P2_kqnum.show = false;
				s_LoverBaseTipInfo.P2_kqnumFinish.show = true;
			}
			if ( BadBallNum == ALLBadBallNum)
			{
				s_LoverBaseTipInfo.P2_hqnum.show = false;
				s_LoverBaseTipInfo.P2_hqnumFinish.show = true;
			}
			if ( HighBallNum == ALLHighBallNum)
			{
				s_LoverBaseTipInfo.P2_fgqnum.show = false;
				s_LoverBaseTipInfo.P2_fgqnumFinish.show = true;
			}
			if ( SnickBallNum == ALLSnickBallNum)
			{
				s_LoverBaseTipInfo.P2_xqnum.show = false;
				s_LoverBaseTipInfo.P2_xqnumFinish.show = true;
			}
			if ( CutBallNum == ALLCutBallNum)
			{
				s_LoverBaseTipInfo.P2_jjqnum.show = false;
				s_LoverBaseTipInfo.P2_jjqnumFinish.show = true;
			}
			s_LoverBaseTipInfo.P2_kqnum._pnum.setNum(KillShotNum);
			s_LoverBaseTipInfo.P2_hqnum._pnum.setNum(BadBallNum);
			s_LoverBaseTipInfo.P2_fgqnum._pnum.setNum(HighBallNum);
			s_LoverBaseTipInfo.P2_xqnum._pnum.setNum(SnickBallNum);
			s_LoverBaseTipInfo.P2_jjqnum._pnum.setNum(CutBallNum);
			s_LoverBaseTipInfo.P2_kqnum._pmaxnum_2.setNum(ALLKillShotNum);
			s_LoverBaseTipInfo.P2_hqnum._pmaxnum_2.setNum(ALLBadBallNum);
			s_LoverBaseTipInfo.P2_fgqnum._pmaxnum_2.setNum(ALLHighBallNum);
			s_LoverBaseTipInfo.P2_xqnum._pmaxnum_2.setNum(ALLSnickBallNum);
			s_LoverBaseTipInfo.P2_jjqnum._pmaxnum_2.setNum(ALLCutBallNum);
		}
		
		timer(window._Time_BaseTipInfo,"Hide_LoverBaseTipInfo(false)");
	}
	void Hide_LoverBaseTipInfo(param)
	{
		s_LoverBaseTipInfo.show = param;
		//if (!param)
		//{
			//s_TipCommon.SetEnd();
			//window.find("GameInterface").ShowOver_Start();//新的一球开始提示结束了
			//window.find("NAME_GCMap").UnlockServe ();//新解锁函数
		//}
	}

	//更新右上角的比分
	void UpData_PointScore()
	{	
		if (window.g_DEBUG)
		{
			printf("B# S-UpData_PointScore：1:10秒后假的站位:"+window._Time_False_HFZ);
		}
		if (m_GameState == 3)
		{
			//10秒后假的站位
			timer(window._Time_False_HFZ,"Hide_CommonTip(false)","Timer_False_HFZ_Name");
		}

		s_P1vsP2Point.SetData("比分:",m_iP1Point,m_iP2Point);
	}

	//更新右上角局分情况显示
	//参数 currnum:当前局 1-n,0为初始值
	//参数 winorlost:输赢 1表示输 2表示赢
	void UpData_GameNum(currnum,winorlost)
	{
		//if (window.g_DEBUG)
		//{
			printf("B# D-UpData_GameNum:gamenum:"+parent._GameNum+",currnum:"+currnum+",winorlost:"+winorlost);
		//}
		s_GameNum.SetData(parent._GameNum,currnum,winorlost);
	}

	//更新右上角比分
	void UpData_LoverPointScore()
	{
		if (window.g_DEBUG)
		{
			printf("B# S-UpData_PointScore：1:10秒后假的站位:"+window._Time_False_HFZ);
		}
		if (m_GameState == 3)
		{
			//10秒后假的站位
			timer(window._Time_False_HFZ,"Hide_CommonTip(false)","Timer_False_HFZ_Name");
		}
	}

	//设置局的比分
	//参数 iUserID:用户ID	GameScroe：局的比分
	void SetGameScore(iUserID,GameScore)
	{	
		if (iUserID == parent._P1UID){m_iP1GameScore = GameScore;}
		if (iUserID == parent._P2UID){m_iP2GameScore = GameScore;}
		UpData_PointScore();
	}
	//设置球的比分
	//参数 iUserID:用户ID	Point:比分
	void SetPoint(iUserID,Point)
	{
		if (iUserID == parent._P1UID){m_iP1Point = Point;}
		if (iUserID == parent._P2UID){m_iP2Point = Point;}
		UpData_PointScore();
	}
	
	//更新 游戏一局结束 提示
	//参数 WinOrLost ；1表示输 2表示赢
	void UpData_OneGameEnd(WinOrLost)
	{	
		window.GetArenaTopData();//取活动排行
		
		if (window.g_DEBUG)
		{
			printf("B# 游戏一局结束-D:UpData_OneGameEnd:"+WinOrLost);
		}
		s_TipCommon.SetEnd();
		var _P1Act = -1;//P1动作索引 胜利8 9 10
		var _P3Act = -1;//P3动作索引 胜利8 9 10
		switch (m_iP1Character)
		{
			case 1:
			{
				if (WinOrLost == 2){_P1Act = 8;}
				if (WinOrLost == 1){_P1Act = -1;}break;
			}
			case 2:
			{
				if (WinOrLost == 2){_P1Act = 9;}
				if (WinOrLost == 1){_P1Act = -1;}break;
			}
			case 3:
			{
				if (WinOrLost == 2){_P1Act = 10;}
				if (WinOrLost == 1){_P1Act = -1;}break;
			}
		}
		switch (m_iP3Character)
		{
			case 1:
			{
				if (WinOrLost == 2){_P3Act = 8;}
				if (WinOrLost == 1){_P3Act = -1;}break;
			}
			case 2:
			{
				if (WinOrLost == 2){_P3Act = 9;}
				if (WinOrLost == 1){_P3Act = -1;}break;
			}
			case 3:
			{
				if (WinOrLost == 2){_P3Act = 10;}
				if (WinOrLost == 1){_P3Act = -1;}break;
			}
		}
		Hide_OneGameEnd(true);
		//P1RID,P1point,P2point,P1Name,P2Name,P1Act,P1Sex,P3RID,P3Name,P3Act,P3Sex,P4Name
		s_BoardEnd.SetData(parent._User1.GetRID(),m_iP1GameScore,m_iP2GameScore,
			parent._User1.GetNkName(),parent._User2.GetNkName(),_P1Act,m_iP1Sex,
			parent._User3.GetRID(),parent._User3.GetNkName(),_P3Act,m_iP3Sex,parent._User4.GetNkName());
		timer(window._Time_OneGameEnd,"Hide_OneGameEnd(false)");
	}
	//显示/隐藏:游戏一局提示
	void Hide_OneGameEnd(param)
	{
		s_BoardEnd.show = param;
		if (!param)
		{
			window.find("GameInterface").ShowOver_Inning();//局的提示结束了
		}
	}


	//函数 LMH_UpDate_PromptInfo:更新提示信息，用于游戏中的各种提示信息的显示
	//参数 ShowState:显示状态，true显示；false不显示
	//参数 InfoData :显示的信息其值为0-12的数字
	//InfoData:0为发球，1为档球，2为截球，3为救球，4为削球，5为上旋球，6为放高球，7为发球技能，8为放高球技能，9为削球技能，10为上旋球技能，11为扣杀技能，12为扣杀
	void UpDate_PromptInfo(ShowState,InfoData)
	{
		s_PromptInfo.setData(ShowState,InfoData);
	}
	
	//p1显示/隐藏:特殊提示信息
	void Hide_SpecTip_1(param){s_TipSpecial_1.show = param;}
	//p2显示/隐藏:特殊提示信息
	void Hide_SpecTip_2(param){s_TipSpecial_2.show = param;}
	//p3显示/隐藏:特殊提示信息
	void Hide_SpecTip_3(param){s_TipSpecial_3.show = param;}
	//p4显示/隐藏:特殊提示信息
	void Hide_SpecTip_4(param){s_TipSpecial_4.show = param;}

	//p1特殊提示信息更新
	//HandsomeAction:帅气的动作 -1.默认值 0.普通结束 1.发球得分 2.扣杀 3.绝杀 4.反杀
	void UpData_SpecTip_1(HandsomeAction)
	{
		killtimer("Timer_False_HFZ_Name"); //有真的站位了-杀了假的站位

		if (window.g_DEBUG)
		{
			printf("C# GameShow:一球结束：帅不帅都有,自己(-1.默认值 0.普通结束 1.发球得分 2.扣杀 3.绝杀 4.反杀)！UpData_SpecTip_1-双打:"+HandsomeAction);
		}
		if (HandsomeAction == -1 || HandsomeAction == "")
		{
			if (window.g_DEBUG){printf("B# UpData_SpecTip_1-D：没有改变:HandsomeAction"+HandsomeAction);}
			return;
		}
		//window.SetChatEnterFlag(window.CHAT_ENTER_NO,"VGame_Playing_S_Logic");//不激活
		window.LMH_BigKeyOprt(false);
		if (HandsomeAction == 0)	//普通的结束
		{
			s_TipCommon.SetStart();
			timer(window._Time_TipCommon,"Hide_CommonTip(false)");
			return;
		}
		else
		{
//			s_TipCommon.SetStart();
			timer(window._Time_SpecTip,"Hide_CommonTip(false)");

			Hide_SpecTip_1(true);
			//RoleID,ActIndex
			var _temp = toint(HandsomeAction)*100+toint(m_iP1Character);//此处添加规则 1*100+性格
			s_TipSpecial_1.SetData(parent._User1.GetRID(),_temp,m_iP1Sex);
			timer(window._Time_SpecTip,"Hide_SpecTip_1(false)");
			return;
		}
	}
	//p2特殊提示信息更新
	//HandsomeAction:帅气的动作 -1.默认值 0.普通结束 1.发球得分 2.扣杀 3.绝杀 4.反杀
	void UpData_SpecTip_2(HandsomeAction)
	{
		if (window.g_DEBUG)
		{
			printf("C# GameShow:一球结束：帅不帅都有,队友(-1.默认值 0.普通结束 1.发球得分 2.扣杀 3.绝杀 4.反杀)！UpData_SpecTip_2-双打:"+HandsomeAction);
		}

		if (HandsomeAction == -1 || HandsomeAction == "")
		{
			if (window.g_DEBUG){printf("B# UpData_SpecTip_2-D：没有改变:HandsomeAction"+HandsomeAction);}return;
		}
		//window.SetChatEnterFlag(window.CHAT_ENTER_NO,"VGame_Playing_S_Logic");//不激活
		window.LMH_BigKeyOprt(false);
		if (HandsomeAction == 0)//普通的结束
		{
			return;
		}
		else
		{
			s_TipCommon.show = false;//隐藏上下的小黑边
			Hide_SpecTip_2(true);
			//RoleID,ActIndex
			var _temp = toint(HandsomeAction)*100+toint(m_iP2Character);//此处添加规则 1*100+性格
			s_TipSpecial_2.SetData(parent._User2.GetRID(),_temp,m_iP2Sex);
			timer(window._Time_SpecTip,"Hide_SpecTip_2(false)");
			return;
		}
	}
	//p3特殊提示信息更新
	//HandsomeAction:帅气的动作 -1.默认值 0.普通结束 1.发球得分 2.扣杀 3.绝杀 4.反杀
	void UpData_SpecTip_3(HandsomeAction)
	{
		if (window.g_DEBUG)
		{
			printf("C# GameShow:一球结束：帅不帅都有,对手1(-1.默认值 0.普通结束 1.发球得分 2.扣杀 3.绝杀 4.反杀)！UpData_SpecTip_3-双打:"+HandsomeAction);
		}

		if (HandsomeAction == -1 || HandsomeAction == "")
		{
			if (window.g_DEBUG){printf("B# UpData_SpecTip_3-D：没有改变:HandsomeAction"+HandsomeAction);}return;
		}
		//window.SetChatEnterFlag(window.CHAT_ENTER_NO,"VGame_Playing_S_Logic");//不激活
		window.LMH_BigKeyOprt(false);
		if (HandsomeAction == 0)//普通的结束
		{
			return;
		}
		else
		{
			s_TipCommon.show = false;//隐藏上下的小黑边
			Hide_SpecTip_3(true);
			//RoleID,ActIndex
			var _temp = toint(HandsomeAction)*100+toint(m_iP3Character);//此处添加规则 1*100+性格
			s_TipSpecial_3.SetData(parent._User3.GetRID(),_temp,m_iP3Sex);
			timer(window._Time_SpecTip,"Hide_SpecTip_3(false)");
			return;
		}
	}
	//p4特殊提示信息更新
	//HandsomeAction:帅气的动作 -1.默认值 0.普通结束 1.发球得分 2.扣杀 3.绝杀 4.反杀
	void UpData_SpecTip_4(HandsomeAction)
	{
		if (window.g_DEBUG)
		{
			printf("C# GameShow:一球结束：帅不帅都有,对手2(-1.默认值 0.普通结束 1.发球得分 2.扣杀 3.绝杀 4.反杀)！UpData_SpecTip_4-双打:"+HandsomeAction);
		}

		if (HandsomeAction == -1 || HandsomeAction == "")
		{
			if (window.g_DEBUG){printf("B# UpData_SpecTip_4-D：没有改变:HandsomeAction"+HandsomeAction);}return;
		}
		//window.SetChatEnterFlag(window.CHAT_ENTER_NO,"VGame_Playing_S_Logic");//不激活
		window.LMH_BigKeyOprt(false);
		if (HandsomeAction == 0)//普通的结束
		{
			return;
		}
		else
		{
			s_TipCommon.show = false;//隐藏上下的小黑边
			Hide_SpecTip_4(true);
			//RoleID,ActIndex
			var _temp = toint(HandsomeAction)*100+toint(m_iP4Character);//此处添加规则 1*100+性格
			s_TipSpecial_4.SetData(parent._User4.GetRID(),_temp,m_iP4Sex);
			timer(window._Time_SpecTip,"Hide_SpecTip_4(false)");
			return;
		}
	}

	//显示/隐藏：一球的普通结束:目前显示放在了UI做了，这里只做消失
	void Hide_CommonTip(param)
	{
		if (!param)
		{
			if (window.g_DEBUG){printf("B# 帅的动作显示完了-通知韩硕发球-D");}

//			window.find("NAME_GCMap").KeyBoardEnable(0);//0锁定解锁按键 1解除锁定
//			window.find("gameinput").SetDirOnUse(0);//0是关闭方向,1是开启方向

			window.find("NAME_GCMap").ServeBall();//通知韩硕发球
			
			window.find("GAMELAYER")._ImgSaver.SaveScreen("NAME_GCMap");
			window.find("GAMELAYER")._Img3D.SetVisible(true);
			
			timer(window._Time_WaitBase,"Msg_BaseTipInfo");
		}
	}
	//显示完分屏挑衅动作后调用
	void End_ShowBegin()
	{
		window.find("NAME_GCMap").BeginMove(window._Dir_FileGame,window._Time_CameraMoveGame);//开始镜头移动
		if (window.g_DEBUG)
		{
			printf("B# yxf:显示完分屏挑衅动作后调用,通知韩硕发球,镜头切换！-D");
		}
		//window.SetChatEnterFlag(window.CHAT_ENTER_NO,"VGame_Playing_S_Logic");//不激活

		window.find("NAME_GCMap").find("Ball").show = true;
		window.find("NAME_GCMap").find("GameInterface").SetGameState(3);	//设置游戏状态为已经开始了
		window.find("NAME_GCMap").find("GameStat").SetGameState(3);			//设置游戏状态为已经开始了

		window.find("NAME_GCMap").ServeBall();//通知韩硕发球
		window.find("NAME_GCMap").SetAllRoleShow(1);
		window.find("GAMELAYER")._ImgSaver.SaveScreen("NAME_GCMap");
		window.find("GAMELAYER")._Img3D.SetVisible(true);
		//设置主机-yxf 2008年12月8日
		window.find("NAME_GCMap").SignUpHost();
		//开始录像 2009年3月10日
		window.find("NAME_GCMap").BeginSaveRecord();

		//初始化技能 add by hanshuo 1.16.2009 
		window.find("NAME_GCMap").InitSkill();
		UpData_BaseTipInfo(0,1,0,0);

		//录像用-保存一些数据
		//回调函数名,_RoomType,RID1,NkName1,RID2,NkName2,RID3,NkName3,RID4,NkName4
		window.find("NAME_GCMap").find("GameInterface").ScriptSaveChar("InitVideo",
			""+parent._RoomType+","+parent._User1.GetRID()+","+parent._User1.GetNkName()+","+parent._User2.GetRID()+","
			+parent._User2.GetNkName()+","+parent._User3.GetRID()+","+parent._User3.GetNkName()+","
			+parent._User4.GetRID()+","+parent._User4.GetNkName()+","+parent._GameNum);
		window.SetRolemodelInfoShowState(true);
		printf("wunan-回调双打:"+parent._RoomType);
	}
	//通知何方志发球，在人站位后一秒
	void Msg_BaseTipInfo()
	{
		if (window.g_DEBUG)
		{
			printf("B# 帅的动作显示完了-通知何方志发球ShowOver_HAction-D");
		}
		window.find("GameInterface").ShowOver_HAction();//普通动作结束了
	}
	
	//蓄力条：操作
	//参数: 0:默认 1:开始发球 2:发球结束 3准备发球
	void UpData_StorePower(param,time,rid)
	{
		//s_StorePower.show = true;
		if (window.g_DEBUG)
		{
			printf("B# 蓄力条-D：1:开始发球 2:发球结束 3准备发球："+param+",time:"+time+",rid:"+rid);
		}
		s_StorePower.SetData(param,time,rid);
	}

	//函数	SetSkillState：改变技能的状态
	//参数1	iUserID：玩家UID
	//参数2	index：索引1-5
	//参数3	state：0默认状态 1改变后的状态
	//modify by chenjihui
	void SetSkillState(iUserID,index,state,m_faqiu)
	{
		if (iUserID == parent._P1UID)
		{
			switch (index)
			{
				case 1:
				{
					if (toint(m_faqiu) > 0)
					{
						state = 0;
					}
					s_P1_Skill.s_Skill1.s_Skill_Icon.SetData("技能1ID:",parent._User1.GetSkillEntryID(index),state);
//					s_P1_Skill.s_Skill1Key.SetState(parent._User1.GetSkillEntryID(index),state);//add by chenjihui
					break;
				}
				case 2:
				{
					if (toint(m_faqiu) > 0)
					{
						state = 0;
					}
					s_P1_Skill.s_Skill2.s_Skill_Icon.SetData("技能2ID:",parent._User1.GetSkillEntryID(index),state);
//					s_P1_Skill.s_Skill2Key.SetState(parent._User1.GetSkillEntryID(index),state);//add by chenjihui
					break;
				}
				case 3:
				{
					if (toint(m_faqiu) > 0)
					{
						state = 0;
					}
					s_P1_Skill.s_Skill3.s_Skill_Icon.SetData("技能3ID:",parent._User1.GetSkillEntryID(index),state);
//					s_P1_Skill.s_Skill3Key.SetState(parent._User1.GetSkillEntryID(index),state);//add by chenjihui
					break;
				}
				case 4:
				{
					if (toint(m_faqiu) > 0)
					{
						state = 0;
					}
					s_P1_Skill.s_Skill4.s_Skill_Icon.SetData("技能4ID:",parent._User1.GetSkillEntryID(index),state);
//					s_P1_Skill.s_Skill4Key.SetState(parent._User1.GetSkillEntryID(index),state);//add by chenjihui
					break;
				}
				case 5:
				{
					if (toint(m_faqiu) == 0)
					{
						state = 0;
					}
					s_P1_Skill.s_Skill5.s_Skill_Icon.SetData("技能5ID:",parent._User1.GetSkillEntryID(index),state);
//					s_P1_Skill.s_Skill5Key.SetState(parent._User1.GetSkillEntryID(index),state);//add by chenjihui
					break;
				}
			}
		}
	}
	
	//函数 UpData_CurrEnergy:更新当前能量/技能
	//参数 iUserID:用户ID
	//参数 CurrEnergy:当前能量
	//参数 BallInSelf：球的前后场位置
	//参数 MaxEnergy：最大能量
	//modify by chenjihui
	void UpData_CurrEnergy(iUserID,CurrEnergy,BallInSelf,MaxEnergy,m_faqiu)
	{
		if (window.g_DEBUG)
		{
			printf("B# 双打能量改变-D:iUserID："+iUserID+",CurrEnergy:"+CurrEnergy+",BallInSelf:"+BallInSelf+",MaxEnergy:"+MaxEnergy);
		}
		var _Int_CurrEnergy = toint(CurrEnergy);
		var _BorF_Energy = 0;		//能量:根据球在前场 还是后场改变
		if (iUserID == parent._P1UID)
		{
			s_P1_P3_Head.s_CurrEnergy.SetData("能量:",_Int_CurrEnergy,MaxEnergy,1);
			Init_Skill();
			//判断当前技能-决定技能图片亮与灰

			_BorF_Energy = toint(parent._User1.GetSkillBackEnergy(5));
			if (_Int_CurrEnergy > _BorF_Energy && _BorF_Energy > 0){SetSkillState(iUserID,5,1,m_faqiu);}

			if (BallInSelf == 1){_BorF_Energy = toint(parent._User1.GetSkillBackEnergy(4));}
			else{_BorF_Energy = toint(parent._User1.GetSkillFrontEnergy(4));}
			if (_Int_CurrEnergy > _BorF_Energy && _BorF_Energy > 0){SetSkillState(iUserID,4,1,m_faqiu);}

			if (BallInSelf == 1){_BorF_Energy = toint(parent._User1.GetSkillBackEnergy(3));}
			else{_BorF_Energy = toint(parent._User1.GetSkillFrontEnergy(3));}
			if (_Int_CurrEnergy > _BorF_Energy && _BorF_Energy > 0){SetSkillState(iUserID,3,1,m_faqiu);}

			if (BallInSelf == 1){_BorF_Energy = toint(parent._User1.GetSkillBackEnergy(2));}
			else{_BorF_Energy = toint(parent._User1.GetSkillFrontEnergy(2));}
			if (_Int_CurrEnergy > _BorF_Energy && _BorF_Energy > 0){SetSkillState(iUserID,2,1,m_faqiu);}

			if (BallInSelf == 1){_BorF_Energy = toint(parent._User1.GetSkillBackEnergy(1));}
			else{_BorF_Energy = toint(parent._User1.GetSkillFrontEnergy(1));}
			if (_Int_CurrEnergy > _BorF_Energy && _BorF_Energy > 0){SetSkillState(iUserID,1,1,m_faqiu);}
		}
		if (iUserID == parent._P2UID)
		{
			s_P2_P4_Head.s_CurrEnergy.SetData("能量:",CurrEnergy,MaxEnergy,2);
		}
		if (iUserID == parent._P3UID)
		{
			s_P1_P3_Head.s_CurrEnergy.SetData("能量:",CurrEnergy,MaxEnergy,3);
		}
		if (iUserID == parent._P4UID)
		{
			s_P2_P4_Head.s_CurrEnergy.SetData("能量:",CurrEnergy,MaxEnergy,4);
		}
	}
	
	void OnCreated()
	{
		Init();

		s_P1_P3_Head.Init(parent._User1.GetUID());
		s_P2_P4_Head.Init(parent._User2.GetUID());

		s_P1_Skill.Init();
		s_P2_Skill.Init();

		Init_Item();

		//s_P1_Point.Init();
		//s_P2_Point.Init();

		if ( m_LoverOrNot != window.ROOM_TYPE_LOVERDOUBLE)
		{
			s_P1vsP2Point.show = true;
			s_BaseTipInfo.Init();
			Init_Point();
		}
		else
		{
			s_P1vsP2Point.show = false;
			Init_LoverPointInfo();
			Init_LoverPoint();
		}

		Init_Skill();
		Init_Name_Energy(); 
		
		UpData_GameNum(0,0);

		s_LoverBaseTipInfo.show = false;//情侣基础信息提示
		s_BaseTipInfo.show = false; //基础提示信息
		s_BoardEnd.show = false;	//游戏一局结束提示
		s_TipSpecial_1.show = false;	//P1一球结束：特殊
		s_TipSpecial_2.show = false;	//P2一球结束：特殊
		s_TipCommon.show = false;	//一球结束：普通
		s_StorePower.show = false;	//蓄力条

		s_Wager.SetData(window.g_WagerValue);
		
		if (parent.m_RaceData > 0)
		{
			s_RaceData.SetData(parent.m_RaceData);
			s_Btn_AddPoint.show = true;
		}
		SetEvent();

		if(window.g_UIGameState == window.USER_UISTATE_AI_FREETRAIN)
		{
			return;
		}
		var _eightLimitTaskNum = 0;
		var _VNet2DBTable=new VNet2DBTable
		{
			var _eightLimitTaskNumTemp = 0;
			var _SQL = "SELECT * FROM "+window.TASKSYNDATA;
			Select(window.GAME,_SQL);
			
			void GetData(id)
			{
				var _row = new VNet2DBRow{};
				_row.InitByInt(window.GAME,window.TASK,window.GAME_TASK_TASKID,id);
				if(_row.IsReady())
				{
					var _typeName = _row.GetData(window.GAME_TASK_TASKTYPENAME);
					if(_typeName == window.g_TaskType_EightLimit)
					{
						_eightLimitTaskNumTemp += 1;
					}
				}
				_row.del();
			}
		}
		_VNet2DBTable.ReadData("GetData",window.GAME_TASKSYNDATA_TASKID);
		_eightLimitTaskNum = _VNet2DBTable._eightLimitTaskNumTemp;
		_VNet2DBTable.del();
		if(_eightLimitTaskNum>0)
		{
			new VGame_LimitTimeTaskFlag_Logic
			{
				valign(20,0);
				halign(90,0);
				SetData(480);
			}
		}
	}

	///////////////////////////////////////DB//////////////////////////////////////////
	//己方P1的记录
	var _VNet2DBRow1 = new VNet2DBRow
	{
		void InitDB()
		{
			InitByInt(window.M_G_CLINET,window.GAMESHOW,0,parent.parent._User1.GetRID(),1);
			AddDBEvent("OnP1DataChange",0,1,3,5,6,7,8,9,11,12,13,14,15,26,27,28,30,32,33,41,42,49,50,51,52,53,54,55,56,57,58,59);		
			SetInt(8,-1);
			SetInt(32,-1);
			SetInt(41,-1);
			SetInt(42,-1);
		}
		//索引，0角色ID,1用户ID,3游戏状态,5第几局,6局的分数,7比分,8当前能量,9球的前后场,11提示状态1,12提示状态2,13提示状态3,14帅气的动作,15改变的索引,26发球事件
		//3 GameState:游戏状态 2:开始 3:正中进行 4:结束 5:结束后
		//11 TipState1:提示 0:没有交换场地 1.有
		//12 TipState2:提示 0:不是破发点 1.有
		//13 TipState3:提示 0:默认状态 1.局点 2.赛点
		//14 HandsomeAction:帅气的动作 -1.默认值 0.普通结束 1.发球得分 2.扣杀 3.绝杀 4.反杀
		//15 RefreshIndex:改变的索引 1.帅气的动作 2.局分 3.比赛前的数据 4:游戏开始 5:游戏结束
		//26 ServeEvent: 发球事件 0:默认 1:开始发球 2:发球结束 3准备发球
		//27 WinOrLost	一局输或者赢 1表示输 2表示赢 只通知自己那行记录 在RefreshIndex==2后清除
		//28 EndWinOrLost 一场比赛的输赢 0为默认 1表示输 2表示赢 在RefreshIndex==5后有效
		//30 TriggerTrainID:触发的训练 在新手服务器有效 2上旋 3截击 4扣杀 5蓄力 6落点 7技能 在RefreshIndex==5后有效 只自己那行记录
		//32 MaxEnergy	最大的能量
		void OnP1DataChange(index,RoleID,UserID,GameState,GameNum,GameScore,Point,CurrEnergy,
			BallInSelf,TipState1,TipState2,TipState3,HandsomeAction,RefreshIndex,ServeEvent,
			WinOrLost,EndWinOrLost,TriggerTrainID,MaxEnergy,ServeTime,CurrStamina,MaxStamina
			,KillShotNum,BadBallNum,HighBallNum,SnickBallNum,CutBallNum,ALLKillShotNum,
			ALLBadBallNum,ALLHighBallNum,ALLSnickBallNum,ALLCutBallNum,IsOverGame)
		{		
			if (window.g_DEBUG)
			{
				printf("B# P1:index:"+index+",RoleID:"+RoleID+",UserID:"+UserID+",GameState:"+GameState
				+",GameNum:"+GameNum+",GameScore:"+GameScore+",Point:"+Point
				+",CurrEnergy:"+CurrEnergy+",BallInSelf:"+BallInSelf
				+",TipState1:"+TipState1+",TipState2:"+TipState2+",TipState3:"+TipState3
				+",HandsomeAction:"+HandsomeAction+",RefreshIndex:"+RefreshIndex+",ServeEvent:"+ServeEvent
				+",WinOrLost:"+WinOrLost+",EndWinOrLost:"+EndWinOrLost+",MaxEnergy:"+MaxEnergy);
			}
			var _team = parent.GetTeambyUID(UserID);
			switch (index)
			{
				case 3:{parent.m_GameState = GameState;break;}
				case 6:{parent.SetGameScore(UserID,GameScore);break;}
				case 7:{parent.SetPoint(UserID,Point);break;}
				case 8:{parent.UpData_CurrEnergy(UserID,CurrEnergy,BallInSelf,MaxEnergy,ServeEvent);break;}
				case 9:{parent.UpData_CurrEnergy(UserID,CurrEnergy,BallInSelf,MaxEnergy,ServeEvent);break;}
				case 15:
				{
					if (RefreshIndex == 1)//1.帅气的动作
					{
						parent.UpData_SpecTip_1(HandsomeAction);
						if ( parent.m_LoverOrNot == window.ROOM_TYPE_LOVERDOUBLE)
						{
							parent.UpData_LoverBaseTipInfo(UserID,KillShotNum,BadBallNum,HighBallNum,SnickBallNum,CutBallNum,ALLKillShotNum,
							ALLBadBallNum,ALLHighBallNum,ALLSnickBallNum,ALLCutBallNum);
						}
						break;
					}
					if (RefreshIndex == 2)//2.局分
					{
						parent.UpData_OneGameEnd(WinOrLost);
						parent.UpData_GameNum(GameNum,WinOrLost);
						if ( parent.m_LoverOrNot == window.ROOM_TYPE_LOVERDOUBLE)
						{
							parent.UpData_SpecTip_1(HandsomeAction);
							parent.UpData_LoverBaseTipInfo(UserID,KillShotNum,BadBallNum,HighBallNum,SnickBallNum,CutBallNum,ALLKillShotNum,
																ALLBadBallNum,ALLHighBallNum,ALLSnickBallNum,ALLCutBallNum);
							parent.Init_LoverBaseTipInfo();
							parent.UpData_LoverPointInfo(UserID,KillShotNum,BadBallNum,HighBallNum,SnickBallNum,CutBallNum,ALLKillShotNum,
																ALLBadBallNum,ALLHighBallNum,ALLSnickBallNum,ALLCutBallNum);
						}
						break;
					}
					if (RefreshIndex == 3)//3.比赛前的数据
					{
						parent.UpData_BaseTipInfo(TipState1,GameNum,TipState2,TipState3);
						break;
					}
					if (RefreshIndex == 4)//4:游戏开始
					{
						if ( parent.m_LoverOrNot != window.ROOM_TYPE_LOVERDOUBLE)
							parent.UpData_BaseTipInfo(TipState1,GameNum,TipState2,TipState3);
						else
						{
							parent.UpData_LoverBaseTipInfo(UserID,KillShotNum,BadBallNum,HighBallNum,SnickBallNum,CutBallNum,ALLKillShotNum,
															ALLBadBallNum,ALLHighBallNum,ALLSnickBallNum,ALLCutBallNum);
							parent.UpData_LoverPointInfo(UserID,KillShotNum,BadBallNum,HighBallNum,SnickBallNum,CutBallNum,ALLKillShotNum,
														ALLBadBallNum,ALLHighBallNum,ALLSnickBallNum,ALLCutBallNum);
						}
						
//						window.find("NAME_GCMap").ServeBall();//通知韩硕发球
						break;
					}
					if (RefreshIndex == 5)//5:游戏结束
					{
						//比赛结束后清除所有锁键盘的状态
						window.find("keylockstate").ClearState();

//						window.find("NAME_GCMap").KeyBoardEnable(0);//0锁定解锁按键 1解除锁定
//						window.find("gameinput").SetDirOnUse(0);//0是关闭方向,1是开启方向

						if (window.g_DEBUG){	printf("B# D停止播背景音乐");}

						window.StopPlay();	//停止背景音乐
						set window.find("NAME_GCMap")
						{
							SetAllRoleShow(1);
							find("Ball").show = false;
							RoleGameToRoom();
						}
						window.OnGameOver();	//游戏结束-通知何方志

						printf("B# D-比赛结束了,EndWinOrLost:"+EndWinOrLost+",g_ArenaJoinRoom:"+window.g_ArenaJoinRoom);
						if (window.g_ArenaJoinRoom)//竞技
						{
							window.find("UIController").LoadUI("UI_ARENAOVER");
							window.find("ARENAOVER_LOGIC").SetData(window.GetMyRaceID(),parent.parent._RoomType,parent.parent._P1UID,parent.parent._P2UID,parent.parent._P3UID,parent.parent._P4UID,EndWinOrLost);
						}
						else//普通比赛
						{
							window.find("UIController").LoadUI("UI_GAME_OVER");
							//type,SelfID,P2,P3,P4,Win，TriggerTrainID
							if (parent.parent._RoomType == window.ROOM_TYPE_DOUBLE_TIMER)
							{
								window.find("GAME_OVER_LOGIC").Init(parent.parent._RoomType,parent.parent._P1UID,parent.parent._P2UID,
								parent.parent._P3UID,parent.parent._P4UID,2,TriggerTrainID);
							}
							else
							{
								window.find("GAME_OVER_LOGIC").Init(parent.parent._RoomType,parent.parent._P1UID,parent.parent._P2UID,
								parent.parent._P3UID,parent.parent._P4UID,EndWinOrLost,TriggerTrainID);
							}
						}
						break;
					}
				}
				case 26:
				{
					parent.UpData_StorePower(ServeEvent,ServeTime,RoleID);
					parent.parent._User1._faqiu = ServeEvent;
					parent.UpData_CurrEnergy(UserID,CurrEnergy,BallInSelf,MaxEnergy,ServeEvent);
					break;
				}
				case 32:
				{
					parent.s_P1_P3_Head.s_CurrEnergy.SetData("最大能量:",0,MaxEnergy,1);
					break;
				}
				case 41:
				{
					window.LMD_SbStrengthChg(parent.parent._P1UID,parent.parent._P2UID,parent.parent._P3UID,parent.parent._P4UID,CurrStamina,2,1);//孙小东任务事件 2010年9月29日
					parent.s_P1_P3_Head.s_Stamina.SetData("当前体力:",CurrStamina,MaxStamina,1);
					break;
				}
				case 42:
				{
					parent.s_P1_P3_Head.s_Stamina.SetData("当前体力:",CurrStamina,MaxStamina,1);
					break;
				}
				case 49:
				{
					parent.s_LoverPointInfo.P1_kqnum.s_LoverPoint.del();
					parent.s_LoverPointInfo.P1_kqnum.Init2();
					parent.s_LoverPointInfo.P1_kqnum.s_LoverPoint.SetData(KillShotNum,0,_team,""+22+","+15);//情侣一对比分
					parent.s_LoverPointInfo.P1_kqnum.pmaxnum_2.setNum(ALLKillShotNum);
					if (KillShotNum == ALLKillShotNum)
					{
						parent.s_LoverPointInfo.P1_kqnum.show = false;
						parent.s_LoverPointInfo.P1_kqnumFinish.show = true;

					}
					break;
				}
				case 50:
				{
					parent.s_LoverPointInfo.P1_hqnum.s_LoverPoint.del();
					parent.s_LoverPointInfo.P1_hqnum.Init2();
					parent.s_LoverPointInfo.P1_hqnum.s_LoverPoint.SetData(BadBallNum,0,_team,""+22+","+15);//情侣一对比分
					parent.s_LoverPointInfo.P1_hqnum.pmaxnum_2.setNum(ALLBadBallNum);
					if (BadBallNum == ALLBadBallNum)
					{
						parent.s_LoverPointInfo.P1_hqnum.show = false;
						parent.s_LoverPointInfo.P1_hqnumFinish.show = true;

					}
					break;
				}
				case 51:
				{
					parent.s_LoverPointInfo.P1_fgqnum.s_LoverPoint.del();
					parent.s_LoverPointInfo.P1_fgqnum.Init2();
					parent.s_LoverPointInfo.P1_fgqnum.s_LoverPoint.SetData(HighBallNum,0,_team,""+22+","+15);//情侣一对比分
					parent.s_LoverPointInfo.P1_fgqnum.pmaxnum_2.setNum(ALLHighBallNum);
					if (HighBallNum == ALLHighBallNum)
					{
						parent.s_LoverPointInfo.P1_fgqnum.show = false;
						parent.s_LoverPointInfo.P1_fgqnumFinish.show = true;

					}
					break;
				}
				case 52:
				{
					parent.s_LoverPointInfo.P1_xqnum.s_LoverPoint.del();
					parent.s_LoverPointInfo.P1_xqnum.Init2();
					parent.s_LoverPointInfo.P1_xqnum.s_LoverPoint.SetData(SnickBallNum,0,_team,""+22+","+15);//情侣一对比分
					parent.s_LoverPointInfo.P1_xqnum.pmaxnum_2.setNum(ALLSnickBallNum);
					if (SnickBallNum == ALLSnickBallNum)
					{
						parent.s_LoverPointInfo.P1_xqnum.show = false;
						parent.s_LoverPointInfo.P1_xqnumFinish.show = true;

					}
					break;
				}
				case 53:
				{
					parent.s_LoverPointInfo.P1_jjqnum.s_LoverPoint.del();
					parent.s_LoverPointInfo.P1_jjqnum.Init2();
					parent.s_LoverPointInfo.P1_jjqnum.s_LoverPoint.SetData(CutBallNum,0,_team,""+22+","+15);//情侣一对比分
					parent.s_LoverPointInfo.P1_jjqnum.pmaxnum_2.setNum(ALLCutBallNum);
					if (CutBallNum == ALLCutBallNum)
					{
						parent.s_LoverPointInfo.P1_jjqnum.show = false;
						parent.s_LoverPointInfo.P1_jjqnumFinish.show = true;
					}
					break;
				}
				case 59://游戏一局结束时延时让其播放完动画
				{
//					if ( IsOverGame == 1)
//					{sleep(3000);}
				}
			}
		}
	}
	//他方P2的记录
	var _VNet2DBRow2 = new VNet2DBRow
	{
		void InitDB()
		{

			InitByInt(window.M_G_CLINET,window.GAMESHOW,0,parent.parent._User2.GetRID(),1);
			AddDBEvent("OnP2DataChange",0,1,6,7,8,9,14,15,26,32,33,41,42,49,50,51,52,53,54,55,56,57,58,59);
			SetInt(8,-1);
			SetInt(32,-1);
			SetInt(41,-1);
			SetInt(42,-1);
		}		
		//索引，0角色ID,1用户ID,6局的分数,7比分,8当前能量,9球的前后场,14帅气的动作,15改变的索引
		void OnP2DataChange(index,RoleID,UserID,GameScore,Point,CurrEnergy,BallInSelf,
			HandsomeAction,RefreshIndex,ServeEvent,MaxEnergy,ServeTime,CurrStamina,MaxStamina
			,KillShotNum,BadBallNum,HighBallNum,SnickBallNum,CutBallNum,ALLKillShotNum,
			ALLBadBallNum,ALLHighBallNum,ALLSnickBallNum,ALLCutBallNum,IsOverGame)
		{
			if (window.g_DEBUG)
			{
				printf("B# P2:index:"+index+",RoleID:"+RoleID+",UserID:"+UserID
				+",GameScore:"+GameScore+",Point:"+Point+",CurrEnergy:"+CurrEnergy
				+",BallInSelf:"+BallInSelf+",HandsomeAction:"+HandsomeAction
				+",RefreshIndex:"+RefreshIndex+",ServeEvent:"+ServeEvent+",MaxEnergy:"+MaxEnergy);
			}
			var _team = parent.GetTeambyUID(UserID);
			switch (index)
			{
				case 6:{parent.SetGameScore(UserID,GameScore);break;}
				case 7:{parent.SetPoint(UserID,Point);break;}
				case 8:{parent.UpData_CurrEnergy(UserID,CurrEnergy,BallInSelf,MaxEnergy);break;}
				case 9:{parent.UpData_CurrEnergy(UserID,CurrEnergy,BallInSelf,MaxEnergy);break;}
				case 15:
				{
					if (RefreshIndex == 1)//1.帅气的动作
					{
						parent.UpData_SpecTip_2(HandsomeAction);
						if ( parent.m_LoverOrNot == window.ROOM_TYPE_LOVERDOUBLE)
						{
							parent.UpData_LoverBaseTipInfo(UserID,KillShotNum,BadBallNum,HighBallNum,SnickBallNum,CutBallNum,ALLKillShotNum,
							ALLBadBallNum,ALLHighBallNum,ALLSnickBallNum,ALLCutBallNum);
						}
						break;
					}
					if (RefreshIndex == 2)//2.局分
					{
						if ( parent.m_LoverOrNot == window.ROOM_TYPE_LOVERDOUBLE)
						{
							parent.UpData_SpecTip_2(HandsomeAction);
							parent.UpData_LoverBaseTipInfo(UserID,KillShotNum,BadBallNum,HighBallNum,SnickBallNum,CutBallNum,ALLKillShotNum,
																ALLBadBallNum,ALLHighBallNum,ALLSnickBallNum,ALLCutBallNum);
							parent.UpData_LoverPointInfo(UserID,KillShotNum,BadBallNum,HighBallNum,SnickBallNum,CutBallNum,ALLKillShotNum,
																ALLBadBallNum,ALLHighBallNum,ALLSnickBallNum,ALLCutBallNum);
						}						
						break;
					}
					if (RefreshIndex == 4)//4:游戏开始
					{
						if ( parent.m_LoverOrNot == window.ROOM_TYPE_LOVERDOUBLE)
						{
							parent.UpData_LoverBaseTipInfo(UserID,KillShotNum,BadBallNum,HighBallNum,SnickBallNum,CutBallNum,ALLKillShotNum,
															ALLBadBallNum,ALLHighBallNum,ALLSnickBallNum,ALLCutBallNum);
							parent.UpData_LoverPointInfo(UserID,KillShotNum,BadBallNum,HighBallNum,SnickBallNum,CutBallNum,ALLKillShotNum,
														ALLBadBallNum,ALLHighBallNum,ALLSnickBallNum,ALLCutBallNum);
						}
						
//						window.find("NAME_GCMap").ServeBall();//通知韩硕发球
						break;
					}
				}
				case 26:
				{
					parent.UpData_StorePower(ServeEvent,ServeTime,RoleID);
					break;
				}
				case 32:
				{
					parent.s_P2_P4_Head.s_CurrEnergy.SetData("最大能量:",0,MaxEnergy,2);
					break;
				}
				case 41:
				{
					window.LMD_SbStrengthChg(parent.parent._P1UID,parent.parent._P2UID,parent.parent._P3UID,parent.parent._P4UID,CurrStamina,2,2);//孙小东任务事件 2010年9月29日
					parent.s_P2_P4_Head.s_Stamina.SetData("当前体力:",CurrStamina,MaxStamina,2);
					break;
				}
				case 42:
				{
					parent.s_P2_P4_Head.s_Stamina.SetData("最大体力:",CurrStamina,MaxStamina,2);break;
				}
				case 49:
				{
					parent.s_LoverPointInfo.P2_kqnum.s_LoverPoint.del();
					parent.s_LoverPointInfo.P2_kqnum.Init2();
					parent.s_LoverPointInfo.P2_kqnum.s_LoverPoint.SetData(KillShotNum,0,_team,""+22+","+15);//情侣一对比分
					parent.s_LoverPointInfo.P2_kqnum.pmaxnum_2.setNum(ALLKillShotNum);
					if (KillShotNum == ALLKillShotNum)
					{
						parent.s_LoverPointInfo.P2_kqnum.show = false;
						parent.s_LoverPointInfo.P2_kqnumFinish.show = true;
					}
					break;
				}
				case 50:
				{
					parent.s_LoverPointInfo.P2_hqnum.s_LoverPoint.del();
					parent.s_LoverPointInfo.P2_hqnum.Init2();
					parent.s_LoverPointInfo.P2_hqnum.s_LoverPoint.SetData(BadBallNum,0,_team,""+22+","+15);//情侣一对比分
					parent.s_LoverPointInfo.P2_hqnum.pmaxnum_2.setNum(ALLBadBallNum);
					if (BadBallNum == ALLBadBallNum)
					{
						parent.s_LoverPointInfo.P2_hqnum.show = false;
						parent.s_LoverPointInfo.P2_hqnumFinish.show = true;
					}
					break;
				}
				case 51:
				{
					parent.s_LoverPointInfo.P2_fgqnum.s_LoverPoint.del();
					parent.s_LoverPointInfo.P2_fgqnum.Init2();
					parent.s_LoverPointInfo.P2_fgqnum.s_LoverPoint.SetData(HighBallNum,0,_team,""+22+","+15);//情侣一对比分
					parent.s_LoverPointInfo.P2_fgqnum.pmaxnum_2.setNum(ALLHighBallNum);
					if (HighBallNum == ALLHighBallNum)
					{
						parent.s_LoverPointInfo.P2_fgqnum.show = false;
						parent.s_LoverPointInfo.P2_fgqnumFinish.show = true;

					}
					break;
				}
				case 52:
				{
					parent.s_LoverPointInfo.P2_xqnum.s_LoverPoint.del();
					parent.s_LoverPointInfo.P2_xqnum.Init2();
					parent.s_LoverPointInfo.P2_xqnum.s_LoverPoint.SetData(SnickBallNum,0,_team,""+22+","+15);//情侣一对比分
					parent.s_LoverPointInfo.P2_xqnum.pmaxnum_2.setNum(ALLSnickBallNum);
					if (SnickBallNum == ALLSnickBallNum)
					{
						parent.s_LoverPointInfo.P2_xqnum.show = false;
						parent.s_LoverPointInfo.P2_xqnumFinish.show = true;
					}
					break;
				}
				case 53:
				{
					parent.s_LoverPointInfo.P2_jjqnum.s_LoverPoint.del();
					parent.s_LoverPointInfo.P2_jjqnum.Init2();
					parent.s_LoverPointInfo.P2_jjqnum.s_LoverPoint.SetData(CutBallNum,0,_team,""+22+","+15);//情侣一对比分
					parent.s_LoverPointInfo.P2_jjqnum.pmaxnum_2.setNum(ALLCutBallNum);
					if (CutBallNum == ALLCutBallNum)
					{
						parent.s_LoverPointInfo.P2_jjqnum.show = false;
						parent.s_LoverPointInfo.P2_jjqnumFinish.show = true;
					}
					break;
				}
				case 59://游戏一局结束时延时让其播放完动画
				{
//					if ( IsOverGame == 1)
//					{sleep(3000);}
				}
			}
		}
	}
	//己方P3的记录
	var _VNet2DBRow3 = new VNet2DBRow
	{
		void InitDB()
		{
			InitByInt(window.M_G_CLINET,window.GAMESHOW,0,parent.parent._User3.GetRID(),1);
			AddDBEvent("OnP3DataChange",0,1,6,7,8,9,14,15,26,32,33,41,42,49,50,51,52,53,54,55,56,57,58);
			SetInt(8,-1);
			SetInt(32,-1);
			SetInt(41,-1);
			SetInt(42,-1);
		}		
		//索引，14帅气的动作,15改变的索引
		void OnP3DataChange(index,RoleID,UserID,GameScore,Point,CurrEnergy,BallInSelf,
			HandsomeAction,RefreshIndex,ServeEvent,MaxEnergy,ServeTime,CurrStamina,MaxStamina
			,KillShotNum,BadBallNum,HighBallNum,SnickBallNum,CutBallNum,ALLKillShotNum,
			ALLBadBallNum,ALLHighBallNum,ALLSnickBallNum,ALLCutBallNum)
		{
			if (window.g_DEBUG)
			{
				printf("B# P3:index:"+index+",HandsomeAction:"+HandsomeAction+",RefreshIndex:"+RefreshIndex+",ServeEvent:"+ServeEvent);
			}
			switch (index)
			{
				case 8:
				{
					parent.UpData_CurrEnergy(UserID,CurrEnergy,BallInSelf,MaxEnergy);
					break;
				}
				case 15:
				{
					if (RefreshIndex == 1)//1.帅气的动作
					{
						parent.UpData_SpecTip_3(HandsomeAction);break;
					}
				}
				case 26:
				{
					parent.UpData_StorePower(ServeEvent,StorePowerTime,parent.parent._User3.GetRID());
					break;
				}
				case 32:
				{
					parent.s_P1_P3_Head.s_CurrEnergy.SetData("最大能量:",0,MaxEnergy,3);
					break;
				}
				case 41:
				{
					window.LMD_SbStrengthChg(parent.parent._P1UID,parent.parent._P2UID,parent.parent._P3UID,parent.parent._P4UID,CurrStamina,2,3);//孙小东任务事件 2010年9月29日
					parent.s_P1_P3_Head.s_Stamina.SetData("当前体力:",CurrStamina,MaxStamina,3);
					break;
				}
				case 42:
				{
					parent.s_P1_P3_Head.s_Stamina.SetData("最大体力:",CurrStamina,MaxStamina,3);
					break;
				}
			}
		}
	}
	//对方P4的记录
	var _VNet2DBRow4 = new VNet2DBRow
	{
		void InitDB()
		{
			InitByInt(window.M_G_CLINET,window.GAMESHOW,0,parent.parent._User4.GetRID(),1);
			AddDBEvent("OnP4DataChange",0,1,6,7,8,9,14,15,26,32,33,41,42,49,50,51,52,53,54,55,56,57,58);
			SetInt(8,-1);
			SetInt(32,-1);
			SetInt(41,-1);
			SetInt(42,-1);
		}		
		//索引，14帅气的动作,15改变的索引
		void OnP4DataChange(index,RoleID,UserID,GameScore,Point,CurrEnergy,BallInSelf,
			HandsomeAction,RefreshIndex,ServeEvent,MaxEnergy,ServeTime,CurrStamina,MaxStamina
			,KillShotNum,BadBallNum,HighBallNum,SnickBallNum,CutBallNum,ALLKillShotNum,
			ALLBadBallNum,ALLHighBallNum,ALLSnickBallNum,ALLCutBallNum)
		{
			if (window.g_DEBUG)
			{
				printf("B# P4:index:"+index+",HandsomeAction:"+HandsomeAction+",RefreshIndex:"+RefreshIndex+",ServeEvent:"+ServeEvent);
			}
			switch (index)
			{
				case 8:
				{
					parent.UpData_CurrEnergy(UserID,CurrEnergy,BallInSelf,MaxEnergy);
					break;
				}
				case 15:
				{
					if (RefreshIndex == 1)//1.帅气的动作
					{
						parent.UpData_SpecTip_4(HandsomeAction);break;
					}
				}
				case 26:
				{
					parent.UpData_StorePower(ServeEvent,StorePowerTime,parent.parent._User4.GetRID());
					break;
				}
				case 32:
				{
					parent.s_P2_P4_Head.s_CurrEnergy.SetData("最大能量:",0,MaxEnergy,4);
					break;
				}
				case 41:
				{
					window.LMD_SbStrengthChg(parent.parent._P1UID,parent.parent._P2UID,parent.parent._P3UID,parent.parent._P4UID,CurrStamina,2,4);//孙小东任务事件 2010年9月29日
					parent.s_P2_P4_Head.s_Stamina.SetData("当前体力:",CurrStamina,MaxStamina,4);
					break;
				}
				case 42:
				{
					parent.s_P2_P4_Head.s_Stamina.SetData("最大体力:",CurrStamina,MaxStamina,4);break;
				}
			}
		}
	}
	//初始化绑定与事件,取得性格和性别
	void InitDBBinding()
	{
		_VNet2DBRow1.InitDB();
		_VNet2DBRow2.InitDB();
		_VNet2DBRow3.InitDB();
		_VNet2DBRow4.InitDB();

		m_iP1Character = parent._User1.GetCharacter();
		m_iP1Sex = parent._User1.GetSex();
		
		m_iP2Character = parent._User2.GetCharacter();
		m_iP2Sex = parent._User2.GetSex();

		m_iP3Character = parent._User3.GetCharacter();
		m_iP3Sex = parent._User3.GetSex();

		m_iP4Character = parent._User4.GetCharacter();
		m_iP4Sex = parent._User4.GetSex();
	}
};