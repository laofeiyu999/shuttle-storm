//
//活动场结算界面的类定义:逻辑>>单打
//
import("$./../../UI/ArenaOver/ClassDef_S.gml");
import("$./ClassDef_Data.gml");

class VArena_Over_S_Logic item
{
	size = "100%,100%";
	var m_TotalScoreIndex = 0;//总得分最强的玩家索引
	var m_UseSkillIndex = 0;//使用技能次数最强的玩家索引
	var m_ACEBallIndex = 0;//一击得分最强的玩家索引
	var m_FullStoreBallIndex = 0;//满蓄力最强的玩家索引
	var m_showStateArray = sysarray(5);	//需要自动调整的显示内容：奖券,活动点,积分,贡献点

	//===================================与显示交互部分========================================
	void Init()
	{
		//自己的结算数据
		//参数：见类定义
		staticvar s_P1_Data = new VArena_Over_Data_Logic{}

		//对方的结算数据
		//参数：见类定义
		staticvar s_P2_Data = new VArena_Over_Data_Logic{pos = "500,0";}
	

		//模型1
		//参数data1：性别
		//参数data2:RoleID
		//参数data3:动作的索引
		staticvar s_P1_Model = new VMyText{pos = "300,350";}	

		//模型2
		//参数data1：性别
		//参数data2:RoleID
		//参数data3:动作的索引
		staticvar s_P2_Model = new VMyText{pos = "800,350";}	

		//胜利或者失败
		//参数 0为默认 1表示输 2表示赢
		staticvar s_Win = new VMyText{pos = "500,500";}
		
		//昵称-自己的
		staticvar s_NkName_1 = new VMyText
		{
			pos = "76,676";size = "160,25";color = "#FFFFFF";
			xcenter = true;ycenter = true;
		}
		//昵称-别人的
		staticvar s_NkName_2 = new VMyText
		{
			pos = "300,676";size = "160,25";color = "#FFFFFF";
			xcenter = true;ycenter = true;
		}
		
		//比赛时间
		//参数data2:单位秒
		staticvar s_Time = new VMyText{pos = "700,350";}

//		//保存录像按钮
//		staticvar s_SaveVideo = new item{}
	}
	//界面显示类
	inclass("VArena_Over_S_UI");
	//===========================================DB============================================
//	void SetEvent()
//	{
//		set s_SaveVideo//保存录像
//		{
//			void OnPressed()
//			{
//				if (GetState() != window.USER_STATE_REDAY)return; //亮的时候才能点
//				SetState(window.BTN_STATE_GREY);
//				parent.parent.MySaveVideo();
//			}
//		}
//	}
	//取数据库的数据
	//参数raceid：比赛ID
	//参数 P1UID:自己的UserID
	//参数 P1NkName:自己的昵称
	//参数 P2UID:对方的UserID
	//参数 OtherNkName：对方的昵称
	//参数 iWin ：胜利或失败
	void ReadDataFromDB(raceid,P1UID,P1NkName,P2UID,P2NkName,iWin)
	{
		s_P1_Data.s_NkName.SetData("昵称:",P1NkName);
		s_P2_Data.s_NkName.SetData("昵称:",P2NkName);
		
		//s_NkName_1.SetData("昵称:",P1NkName);
		//s_NkName_2.SetData("昵称:",P2NkName);
		

//		//设置是否显示vip奖励
//		s_P1_Data.s_vip.setShow(window.GetVipTypeByUID(P1UID));
//		s_P2_Data.s_vip.setShow(window.GetVipTypeByUID(P2UID));
		
		//设置模型动作
		var _TActID1 = -1;	//玩家1整场比赛胜利 11,12,13 整场比赛失败 14,15,16
		//window.g_ArenaWinOrLost = winorlost;//比赛的输赢 0为默认 1表示输 2表示赢

		if (iWin == 2)
		{
			s_Win.SetData("胜利：",iWin);
			_TActID1 = 11;
		}
		if (iWin == 1)
		{
			s_Win.SetData("失败：",iWin);
			_TActID1 = 14;
		}

		s_P1_Model.SetData(parent._User1.GetSex(),parent._User1.GetRID(),_TActID1);
		
		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByInt(window.M_G_SERVER,window.ARENARACE,window.M_G_SERVER_ARENARACE_ID,raceid);
		if (!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.Release();
			printf("B# 活动结算-error:DBname:"+window.M_G_SERVER+",TBName:"+window.ARENARACE+",raceid:"+raceid);
			//return;
		}

		//设置连胜次数
		var _winnum = _VNet2DBRow.GetData(window.M_G_SERVER_ARENARACE_RES1);
		s_WinNum.SetData(_winnum);

		_VNet2DBRow.Release();

		_VNet2DBRow.InitByInt(window.M_G_CLINET,window.GAMESHOW,window.M_G_CLINET_GAMESHOW_USERID,P1UID);
		if (!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.Release();
			printf("B# S:error:VArena_Over_S_Logic-DBname:"+window.M_G_CLINET+",TBName1:"+window.GAMESHOW);
			//return;
		}
		//系统评价和比赛时间 老虎修改2009-4-21
		//s_Appraise.SetData("系统评价:",_VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_APPRAISE));
		//s_Time.SetData("比赛时间:",_VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GAMELASTTIME));
		//玩家1的结算数据 老虎修改2009-4-21

		var _TotalMoney = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GAINMONEY);
		var _WagerMoney = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_WAGERMONEY);
		//总得分
		var _TotalScoreValue = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_TOTALSCORE);
		if (_TotalScoreValue > 0){m_TotalScoreIndex = 1;}//某项数据起码要大于0才会记录
		s_P1_Data.s_TotalScore.SetData("总得分:",_TotalScoreValue);
		//使用技能次数
		var _UseSkillValue = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_USESKILL);
		if (_UseSkillValue > 0){m_UseSkillIndex = 1;}//某项数据起码要大于0才会记录
		s_P1_Data.s_UseSkill.SetData("使用技能:",_UseSkillValue);
		//一击得分次数
		var _ACEBallValue = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_ACEBALL);
		if (_ACEBallValue > 0){m_ACEBallIndex = 1;}//某项数据起码要大于0才会记录
		s_P1_Data.s_ACEBall.SetData("ACE球:",_ACEBallValue);
		//受破球次数
		s_P1_Data.s_BadBall.SetData("受迫球:",_VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_BADBALL));
		
		//满蓄力次数
		var _FullStoreBallValue = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_FULLSTOREBALL);
		if (_FullStoreBallValue > 0){m_FullStoreBallIndex = 1;}//某项数据起码要大于0才会记录
		s_P1_Data.s_FullStoreBall.SetData("满蓄力次数:",_FullStoreBallValue);

		//经验 
		s_P1_Data.s_Exp.SetData("经验:",_VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GAINEXP));
		//金币
		s_P1_Data.s_Money.SetData("金币:",_TotalMoney-_WagerMoney);

		
		var _P1_data = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GAINDATA);
		var _P1_Lottery = window.GetActivityPointData(_P1_data,4);
		var _P1_ArenaPoint = window.GetActivityPointData(_P1_data,1);
		var _P1_Integral = window.GetActivityPointData(_P1_data,2);
		var _P1_ContributePoint = window.GetActivityPointData(_P1_data,3);

		//奖券		
		s_P1_Data.s_Lottery.SetData("奖券:",_P1_Lottery);
		//活动点		
		s_P1_Data.s_ArenaPoint.SetData("活动点:",_P1_ArenaPoint);
		//积分		
		s_P1_Data.s_Integral.SetData("积分:",_P1_Integral);
		//贡献点
		s_P1_Data.s_ContributePoint.SetData("贡献点:",_P1_ContributePoint);

		_VNet2DBRow.Release();
		//p1数据打印
		printf("B# ===结算P1=== 内容:"+_P1_data+"奖券:"+_P1_Lottery+",活动点:"+_P1_ArenaPoint+",积分:"+_P1_Integral+",贡献点:"+_P1_ContributePoint);

		_VNet2DBRow.InitByInt(window.M_G_CLINET,window.GAMESHOW,window.M_G_CLINET_GAMESHOW_USERID,P2UID);
		if (!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.Release();
			printf("B# error:VArena_Over_S_Logic-DBname:"+window.M_G_CLINET+",TBName2:"+window.GAMESHOW);
			//return;
		}
		//玩家2的结算数据 老虎修改2009-4-21
		_TotalMoney = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GAINMONEY);
		_WagerMoney = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_WAGERMONEY);
		//总得分
		var _temp = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_TOTALSCORE);
		if (_temp > _TotalScoreValue){m_TotalScoreIndex = 2;}//P2和P1比
		s_P2_Data.s_TotalScore.SetData("总得分:",_temp);
		//使用技能次数
		_temp = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_USESKILL);
		if (_temp > _UseSkillValue){m_UseSkillIndex = 2;}//P2和P1比
		s_P2_Data.s_UseSkill.SetData("使用技能:",_temp);
		//一击得分次数
		_temp = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_ACEBALL);
		if (_temp > _ACEBallValue){m_ACEBallIndex = 2;}//P2和P1比
		s_P2_Data.s_ACEBall.SetData("ACE球:",_temp);
		//受破球次数
		s_P2_Data.s_BadBall.SetData("受迫球:",_VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_BADBALL));
		
		//满蓄力次数
		_temp = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_FULLSTOREBALL);
		if (_temp > _FullStoreBallValue){m_FullStoreBallIndex = 2;}//P2和P1比
		s_P2_Data.s_FullStoreBall.SetData("满蓄力次数:",_temp);

		//经验 
		s_P2_Data.s_Exp.SetData("经验:",_VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GAINEXP));
		//金币
		s_P2_Data.s_Money.SetData("金币:",_TotalMoney-_WagerMoney);

		
		var _P2_data = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GAINDATA);
		var _P2_Lottery = window.GetActivityPointData(_P2_data,4);
		var _P2_ArenaPoint = window.GetActivityPointData(_P2_data,1);
		var _P2_Integral = window.GetActivityPointData(_P2_data,2);
		var _P2_ContributePoint = window.GetActivityPointData(_P2_data,3);
		//奖券		
		s_P2_Data.s_Lottery.SetData("奖券:",_P2_Lottery);
		//活动点		
		s_P2_Data.s_ArenaPoint.SetData("活动点:",_P2_ArenaPoint);
		//积分		
		s_P2_Data.s_Integral.SetData("积分:",_P2_Integral);
		//贡献点
		s_P2_Data.s_ContributePoint.SetData("贡献点:",_P2_ContributePoint);

		_VNet2DBRow.del();
		//p2数据打印
		printf("B# ===结算P2=== 内容:"+_P2_data+"奖券:"+_P2_Lottery+",活动点:"+_P2_ArenaPoint+",积分:"+_P2_Integral+",贡献点:"+_P2_ContributePoint);
		
		var P1UID_Lover = window.GetCurrLoverUID(P1UID);
		if ( P1UID_Lover == P2UID)
		{	
//			var s_P1loverPoin = window.GetLoverExtraExp(P1UID);
			var s_P1loverPoin = window.User1LoverExp;
			window.User1LoverExp = 0;
			s_P1_Data.s_Expadd.SetData("经验加成:",""+s_P1loverPoin);
			s_P2_Data.s_Expadd.SetData("经验加成:",""+s_P1loverPoin);
		}
		else
		{
			s_P1_Data.s_Expadd.SetData("经验:","");
			s_P2_Data.s_Expadd.SetData("经验:","");
		}

		//设置显示
		//奖券状态
		if(tostring(_P1_Lottery) != "" || tostring(_P2_Lottery) != "")
		{
			m_showStateArray[0] = 1;
		}
		else
		{
			m_showStateArray[0] = 0;
		}
		//活动点状态
		if(tostring(_P1_ArenaPoint) != "" || tostring(_P2_ArenaPoint) != "")
		{
			m_showStateArray[1] = 1;
		}
		else
		{
			m_showStateArray[1] = 0;
		}
		//积分状态
		if(tostring(_P1_Integral) != "" || tostring(_P2_Integral) != "")
		{
			m_showStateArray[2] = 1;
		}
		else
		{
			m_showStateArray[2] = 0;
		}
		//贡献点状态
		if(tostring(_P1_ContributePoint) != "" || tostring(_P2_ContributePoint) != "")
		{
			m_showStateArray[3] = 1;
		}
		else
		{
			m_showStateArray[3] = 0;
		}
		m_showStateArray[4] = 0;

		ShowContent(m_showStateArray);
		printf("B# ===结算=== m_showStateArray[0]:"+m_showStateArray[0]+",m_showStateArray[1]:"+m_showStateArray[1]+",m_showStateArray[2]:"+m_showStateArray[2]+",m_showStateArray[3]:"+m_showStateArray[3]);
		printf("B# ===结算=== 总得分" + m_TotalScoreIndex + "使用技能" + m_UseSkillIndex + "一击得分" + m_ACEBallIndex + "满蓄力" + m_FullStoreBallIndex);
		//CheckWinner(m_TotalScoreIndex,m_UseSkillIndex,m_ACEBallIndex,m_FullStoreBallIndex);
	}

	void CheckWinner(m_TotalScoreIndex,m_UseSkillIndex,m_ACEBallIndex,m_FullStoreBallIndex)
	{
		switch (m_TotalScoreIndex)
		{
			case 0:{break;}//如果大家都是0,就没有“最强”
			case 1:{s_P1_Data.s_TotalScore.SetNB(true);break;}
			case 2:{s_P2_Data.s_TotalScore.SetNB(true);break;}
		}
		switch (m_UseSkillIndex)
		{
			case 0:{break;}//如果大家都是0,就没有“最强”
			case 1:{s_P1_Data.s_UseSkill.SetNB(true);break;}
			case 2:{s_P2_Data.s_UseSkill.SetNB(true);break;}
		}
		switch (m_ACEBallIndex)
		{
			case 0:{break;}//如果大家都是0,就没有“最强”
			case 1:{s_P1_Data.s_ACEBall.SetNB(true);break;}
			case 2:{s_P2_Data.s_ACEBall.SetNB(true);break;}
		}
		switch (m_FullStoreBallIndex)
		{
			case 0:{break;}//如果大家都是0,就没有“最强”
			case 1:{s_P1_Data.s_FullStoreBall.SetNB(true);break;}
			case 2:{s_P2_Data.s_FullStoreBall.SetNB(true);break;}
		}
		printf("B# ===结算=== 确定显不显示");
	}

	void OnCreated()
	{
		Init();
		//SetEvent();
		s_P1_Data.Init();
		s_P2_Data.Init();
		if(window.GetQueueTypeByID(window.FamilyCompleteID) == window.FAMILY_COMPLETE_TYPE)
		{
			
		}
		ReadDataFromDB(parent._RaceID,parent._User1.GetUID(),parent._User1.GetNkName(),parent._User2.GetUID(),parent._User2.GetNkName(),parent._Win);
	}
};
