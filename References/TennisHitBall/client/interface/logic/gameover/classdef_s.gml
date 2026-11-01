//
//游戏结算界面的类定义:逻辑>>单打
//
import("$./../../UI/GameOver/ClassDef_S.gml");

class VGame_Over_S_Logic item
{
	size = "100%,100%";
	var m_TotalScoreIndex = 0;//总得分最强的玩家索引
	var m_UseSkillIndex = 0;//使用技能次数最强的玩家索引
	var m_ACEBallIndex = 0;//一击得分最强的玩家索引
	var m_FullStoreBallIndex = 0;//满蓄力最强的玩家索引

	//===================================与显示交互部分========================================
	void Init()
	{
		//自己的结算数据
		//参数：见类定义
		staticvar s_P1_Data = new VGame_Over_Data_Logic{}

		//对方的结算数据
		//参数：见类定义
		staticvar s_P2_Data = new VGame_Over_Data_Logic{pos = "500,0";}
		
		//系统评价
		//参数 data2
		/*
		//无评价--->0
		//一级评价 1
		//二级评价 2
		//三级评价 3
		//完胜评价 4
		//ACE球 评价 5
		//使用技能 评价 6
		//破解技能 评价 7
		//扣杀 评价 8
		//破发 评价 9
		//连场评价  10
		*/
		staticvar s_Appraise = new VMyText{pos = "0,180";}

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

		//保存录像按钮
		staticvar s_SaveVideo = new item{}
	}
	//界面显示类
	inclass("VGame_Over_S_UI");
	Init();
	//===========================================DB============================================
	void SetEvent()
	{
		set s_SaveVideo//保存录像
		{
			void OnPressed()
			{
				if (GetState() != window.USER_STATE_REDAY)return; //亮的时候才能点
				SetState(window.BTN_STATE_GREY);
				parent.parent.MySaveVideo();
			}
		}
	}
	//取数据库的数据
	//参数 P1UID:自己的UserID
	//参数 P1NkName:自己的昵称
	//参数 P2UID:对方的UserID
	//参数 OtherNkName：对方的昵称
	//参数 iWin ：胜利或失败
	void ReadDataFromDB(P1UID,P1NkName,P2UID,P2NkName,iWin)
	{
		printf("B# 游戏结算S：P1UID:"+P1UID+",P1NkName:"+P1NkName+",P2UID:"+P2UID+",P2NkName:"+P2NkName+",Win:"+iWin);
		s_P1_Data.s_NkName.SetData("昵称:",P1NkName);
		s_P2_Data.s_NkName.SetData("昵称:",P2NkName);
		
		s_NkName_1.SetData("昵称:",P1NkName);
		s_NkName_2.SetData("昵称:",P2NkName);
		
		var _TActID1 = -1;	//玩家1整场比赛胜利 11,12,13 整场比赛失败 14,15,16
		var _TActID2 = -1;	//玩家2整场比赛胜利 11,12,13 整场比赛失败 14,15,16
		
		if (iWin == 2)//参数 0为默认 1表示输 2表示赢
		{
			s_Win.SetData("胜利：",iWin);
			//s_Appraise.show = true;
			
			switch (parent._User1.GetCharacter())
			{
				case 1:{_TActID1 = 11;break;}
				case 2:{_TActID1 = 12;break;}
				case 3:{_TActID1 = 13;break;}
			}
			switch (parent._User2.GetCharacter())
			{
				case 1:{_TActID2 = 14;break;}
				case 2:{_TActID2 = 15;break;}
				case 3:{_TActID2 = 16;break;}
			}
		}
		if (iWin == 1)//参数 0为默认 1表示输 2表示赢
		{
			s_Win.SetData("失败：",iWin);
			//s_Appraise.show = false;
					
			switch (parent._User1.GetCharacter())
			{
				case 1:{_TActID1 = 14;break;}
				case 2:{_TActID1 = 15;break;}
				case 3:{_TActID1 = 16;break;}
			}
			switch (parent._User2.GetCharacter())
			{
				case 1:{_TActID2 = 11;break;}
				case 2:{_TActID2 = 12;break;}
				case 3:{_TActID2 = 13;break;}
			}
		}
		s_P1_Model.SetData(parent._User1.GetSex(),parent._User1.GetRID(),_TActID1);
		s_P2_Model.SetData(parent._User2.GetSex(),parent._User2.GetRID(),_TActID2);

		var _VNet2DBRow = new VNet2DBRow{}//按照ID读取数据库
		_VNet2DBRow.InitByInt(window.M_G_CLINET,window.GAMESHOW,window.M_G_CLINET_GAMESHOW_USERID,P1UID);
		if (!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.Release();
			printf("B# S:error:VGame_Over_S_Logic-DBname:"+window.M_G_CLINET+",TBName1:"+window.GAMESHOW+",P1UID:"+P1UID);
			//return;
		}
//		//系统评价和比赛时间 老虎修改2009-4-21
//		s_Appraise.SetData("系统评价:",_VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_APPRAISE));
		s_Time.SetData("比赛时间:",_VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GAMELASTTIME));
		//玩家1的结算数据 老虎修改2009-4-21
		s_P1_Data.s_Exp.SetData("经验:",_VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GAINEXP));
		var _TotalMoney = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GAINMONEY);
		var _WagerMoney = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_WAGERMONEY);
		s_P1_Data.s_Money.SetData("金币:",_TotalMoney);
		s_P1_Data.s_WagerTaken.SetData("挑战金点券:",_VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_WAGERTAKEN));
		s_P1_Data.s_WagerMoney.SetData("挑战金金币:",_WagerMoney);
		var _TotalScoreValue = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_TOTALSCORE);
		if (_TotalScoreValue > 0){m_TotalScoreIndex = 1;}//某项数据起码要大于0才会记录
		s_P1_Data.s_TotalScore.SetData("总得分:",_TotalScoreValue);
		var _UseSkillValue = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_USESKILL);
		if (_UseSkillValue > 0){m_UseSkillIndex = 1;}//某项数据起码要大于0才会记录
		s_P1_Data.s_UseSkill.SetData("使用技能:",_UseSkillValue);
		var _ACEBallValue = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_ACEBALL);
		if (_ACEBallValue > 0){m_ACEBallIndex = 1;}//某项数据起码要大于0才会记录
		s_P1_Data.s_ACEBall.SetData("ACE球:",_ACEBallValue);
		s_P1_Data.s_BadBall.SetData("受迫球:",_VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_BADBALL));
		var _FullStoreBallValue = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_FULLSTOREBALL);
		if (_FullStoreBallValue > 0){m_FullStoreBallIndex = 1;}//某项数据起码要大于0才会记录
		s_P1_Data.s_FullStoreBall.SetData("满蓄力次数:",_FullStoreBallValue);

		_VNet2DBRow.Release();

		_VNet2DBRow.InitByInt(window.M_G_CLINET,window.GAMESHOW,1,P2UID);
		if (!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.Release();
			printf("B# error:VGame_Over_S_Logic-DBname:"+window.M_G_CLINET+",TBName2:"+window.GAMESHOW+",P2UID:"+P2UID);
			//return;
		}
		//玩家2的结算数据 老虎修改2009-4-21
		s_P2_Data.s_Exp.SetData("经验:",_VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GAINEXP));
		_TotalMoney = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GAINMONEY);
		_WagerMoney = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_WAGERMONEY);
		s_P2_Data.s_Money.SetData("金币:",_TotalMoney);
		s_P2_Data.s_WagerTaken.SetData("挑战金点券:",_VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_WAGERTAKEN));
		s_P2_Data.s_WagerMoney.SetData("挑战金金币:",_WagerMoney);
//		s_P2_Data.s_Money.SetData("金币:",_VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GAINMONEY));
//		s_P2_Data.s_WagerTaken.SetData("挑战金点券:",_VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_WAGERTAKEN));
//		s_P2_Data.s_WagerMoney.SetData("挑战金金币:",_VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_WAGERMONEY));
		var _temp = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_TOTALSCORE);
		if (_temp > _TotalScoreValue){m_TotalScoreIndex = 2;}//P2和P1比
		s_P2_Data.s_TotalScore.SetData("总得分:",_temp);
		_temp = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_USESKILL);
		if (_temp > _UseSkillValue){m_UseSkillIndex = 2;}//P2和P1比
		s_P2_Data.s_UseSkill.SetData("使用技能:",_temp);
		_temp = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_ACEBALL);
		if (_temp > _ACEBallValue){m_ACEBallIndex = 2;}//P2和P1比
		s_P2_Data.s_ACEBall.SetData("ACE球:",_temp);
		s_P2_Data.s_BadBall.SetData("受迫球:",_VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_BADBALL));
		_temp = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_FULLSTOREBALL);
		if (_temp > _FullStoreBallValue){m_FullStoreBallIndex = 2;}//P2和P1比
		s_P2_Data.s_FullStoreBall.SetData("满蓄力次数:",_temp);
		
		_VNet2DBRow.del();

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
		printf("B# ===结算=== 总得分" + m_TotalScoreIndex + "使用技能" + m_UseSkillIndex + "一击得分" + m_ACEBallIndex + "满蓄力" + m_FullStoreBallIndex);
		CheckWinner(m_TotalScoreIndex,m_UseSkillIndex,m_ACEBallIndex,m_FullStoreBallIndex);
		sleep(4000);
		//设置是否显示vip奖励
		s_P1_Data.s_vip.setShow(window.GetVipTypeByUID(P1UID));
		s_P2_Data.s_vip.setShow(window.GetVipTypeByUID(P2UID));
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
		
		SetEvent();
		s_P1_Data.Init();
		s_P2_Data.Init();
		
		if (!window.g_AlreadySaveVideo)
		{
			s_SaveVideo.del();
		}

		ReadDataFromDB(parent._User1.GetUID(),parent._User1.GetNkName(),parent._User2.GetUID(),parent._User2.GetNkName(),parent.m_Win);
	}
};
