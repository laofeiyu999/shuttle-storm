//
//游戏结算界面的类定义:逻辑>>双打
//
import("$./../../UI/GameOver/ClassDef_D.gml");

class VGame_Over_D_Logic item
{
	size = "100%,100%";
	var m_TotalScoreIndex = 0;//总得分最强的玩家索引
	var m_UseSkillIndex = 0;//使用技能次数最强的玩家索引
	var m_ACEBallIndex = 0;//一击得分最强的玩家索引
	var m_FullStoreBallIndex = 0;//满蓄力最强的玩家索引
	var m_UID = 0;
	var m_LoverOrNot = window.GetRoomType();//获得房间类型
	//===================================与显示交互部分========================================
	void Init()
	{
		//P1的结算数据
		//参数：见类定义
		staticvar s_P1_Data = new VGame_Over_Data_Logic{}

		//P2的结算数据
		//参数：见类定义
		staticvar s_P2_Data = new VGame_Over_Data_Logic{pos = "200,0";}
		
		//P3的结算数据
		//参数：见类定义
		staticvar s_P3_Data = new VGame_Over_Data_Logic{pos = "400,0";}

		//P4的结算数据
		//参数：见类定义
		staticvar s_P4_Data = new VGame_Over_Data_Logic{pos = "600,0";}

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

		//比赛时间
		//参数data2:单位秒
		staticvar s_Time = new VMyText{pos = "700,350";}

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
		
		//模型3
		//参数data1：性别
		//参数data2:RoleID
		//参数data3:动作的索引
		staticvar s_P3_Model = new VMyText{pos = "400,350";}	

		//模型4
		//参数data1：性别
		//参数data2:RoleID
		//参数data3:动作的索引
		staticvar s_P4_Model = new VMyText{pos = "900,350";}	

		//胜利或者失败
		//参数 0为默认 1表示输 2表示赢
		staticvar s_Win = new VMyText{pos = "500,500";}
		
		//昵称-自己的p1
		staticvar s_NkName_1 = new VMyText
		{
			pos = "76,676";size = "160,25";color = "#FFFFFF";
			xcenter = true;ycenter = true;
		}
		//昵称-队友的p3
		staticvar s_NkName_2 = new VMyText
		{
			pos = "300,676";size = "160,25";color = "#FFFFFF";
			xcenter = true;ycenter = true;
		}
		//保存录像按钮
		staticvar s_SaveVideo = new item{}
	}
	//界面显示类
	inclass("VGame_Over_D_UI");
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
	//参数 P1UID:	自己的UserID
	//参数 P2UID:	对方的UserID
	//参数 P3UID:	自己队友的UserID
	//参数 P4UID:	对方队友的UserID
	//参数 iWin ：	胜利或失败
	void ReadDataFromDB(P1UID,P2UID,P3UID,P4UID,iWin)
	{

		var P1UID_Lover = window.GetCurrLoverUID(P1UID);
		var P3UID_Lover = window.GetCurrLoverUID(P3UID);
		var P2UID_Lover = window.GetCurrLoverUID(P2UID);
		var P4UID_Lover = window.GetCurrLoverUID(P4UID);

		printf("B# 游戏结算-D-ReadDataFromDB：P1UID:"+P1UID+",P2UID:"+P2UID+",P3UID:"+P3UID+",P4UID:"+P4UID+",Win:"+iWin);
		s_P1_Data.s_NkName.SetData("昵称:",parent._User1.GetNkName());
		s_P2_Data.s_NkName.SetData("昵称:",parent._User2.GetNkName());
		s_P3_Data.s_NkName.SetData("昵称:",parent._User3.GetNkName());
		s_P4_Data.s_NkName.SetData("昵称:",parent._User4.GetNkName());

		s_NkName_1.SetData("昵称:",parent._User1.GetNkName());
		s_NkName_2.SetData("昵称:",parent._User3.GetNkName());
		
		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByInt(window.M_G_CLINET,window.GAMESHOW,window.M_G_CLINET_GAMESHOW_USERID,P1UID);
		if (!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.Release();
			printf("B# D:error:DBname:"+window.M_G_CLINET+",TBName1:"+window.GAMESHOW+",P1UID:"+P1UID);
			//return;
		}
		
		//系统评价和比赛时间 老虎修改2009-4-21
//		s_Appraise.SetData("系统评价:",_VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_APPRAISE));
		s_Time.SetData("比赛时间:",_VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GAMELASTTIME));
		//玩家1的结算数据 老虎修改2009-4-21
		s_P1_Data.s_Exp.SetData("经验:",_VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GAINEXP));
		var _TotalMoney = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GAINMONEY);
		var _WagerMoney = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_WAGERMONEY);
		s_P1_Data.s_Money.SetData("金币:",_TotalMoney);
		s_P1_Data.s_WagerTaken.SetData("挑战金点券:",_VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_WAGERTAKEN));
		s_P1_Data.s_WagerMoney.SetData("挑战金金币:",_WagerMoney);
		if ( m_LoverOrNot != window.ROOM_TYPE_LOVERDOUBLE )
		{
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
		}
		if ( m_LoverOrNot == window.ROOM_TYPE_LOVERDOUBLE )
		{	//如果是情侣房间，传情侣比赛模式的结算值 顺序为扣球，坏球，高球，削球，截击球
			var _TotalScoreValue = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GETDROPBALL);
			if (_TotalScoreValue > 0){m_TotalScoreIndex = 1;}//某项数据起码要大于0才会记录
			s_P1_Data.s_TotalScore.SetData("总得分:",_TotalScoreValue);
			var _UseSkillValue = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GETBADBALL);
			if (_UseSkillValue > 0){m_UseSkillIndex = 1;}//某项数据起码要大于0才会记录
			s_P1_Data.s_UseSkill.SetData("使用技能:",_UseSkillValue);
			var _ACEBallValue = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GETHIGHBALL);
			if (_ACEBallValue > 0){m_ACEBallIndex = 1;}//某项数据起码要大于0才会记录
			s_P1_Data.s_ACEBall.SetData("ACE球:",_ACEBallValue);
			s_P1_Data.s_BadBall.SetData("受迫球:",_VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GETSNICKBALL));
			var _FullStoreBallValue = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GETVOLLEYBALL);
			if (_FullStoreBallValue > 0){m_FullStoreBallIndex = 1;}//某项数据起码要大于0才会记录
			s_P1_Data.s_FullStoreBall.SetData("满蓄力次数:",_FullStoreBallValue);
		}
		
		var _P1_data = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GAINDATA);
		var _P1_PartnerPoint = window.GetActivityPointData(_P1_data,6);
		// modify by chenjihui
		// 2010-12-20
		if (P1UID_Lover != P3UID)
		{
			_P1_PartnerPoint = 0;
		}
		s_P1_Data.s_Partner.SetData("默契度:",_P1_PartnerPoint);		// "默契度"即“亲密度”
		_VNet2DBRow.Release();

		_VNet2DBRow.InitByInt(window.M_G_CLINET,window.GAMESHOW,1,P2UID);
		if (!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.Release();
			printf("B# error:DBname:"+window.M_G_CLINET+",TBName2:"+window.GAMESHOW+",P2UID:"+P2UID);
			//return;
		}
		//玩家2的结算数据 老虎修改2009-4-21
		s_P2_Data.s_Exp.SetData("经验:",_VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GAINEXP));
		_TotalMoney = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GAINMONEY);
		_WagerMoney = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_WAGERMONEY);
		s_P2_Data.s_Money.SetData("金币:",_TotalMoney);
		s_P2_Data.s_WagerTaken.SetData("挑战金点券:",_VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_WAGERTAKEN));
		s_P2_Data.s_WagerMoney.SetData("挑战金金币:",_WagerMoney);
		if ( m_LoverOrNot != window.ROOM_TYPE_LOVERDOUBLE )
		{
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
		}
		if ( m_LoverOrNot == window.ROOM_TYPE_LOVERDOUBLE )
		{
			var _temp = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GETDROPBALL);
			if (_temp > _TotalScoreValue){m_TotalScoreIndex = 2;}//P2和P1比
			s_P2_Data.s_TotalScore.SetData("总得分:",_temp);
			_temp = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GETBADBALL);
			if (_temp > _UseSkillValue){m_UseSkillIndex = 2;}//P2和P1比
			s_P2_Data.s_UseSkill.SetData("使用技能:",_temp);
			_temp = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GETHIGHBALL);
			if (_temp > _ACEBallValue){m_ACEBallIndex = 2;}//P2和P1比
			s_P2_Data.s_ACEBall.SetData("ACE球:",_temp);
			s_P2_Data.s_BadBall.SetData("受迫球:",_VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GETSNICKBALL));
			_temp = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GETVOLLEYBALL);
			if (_temp > _FullStoreBallValue){m_FullStoreBallIndex = 2;}//P2和P1比
			s_P2_Data.s_FullStoreBall.SetData("满蓄力次数:",_temp);
		}
		
		var _P2_data = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GAINDATA);
		var _P2_PartnerPoint = window.GetActivityPointData(_P2_data,6);

		// modify by chenjihui
		// 2010-12-20
		if (P2UID_Lover != P4UID)
		{
			_P2_PartnerPoint = 0;
		}
		s_P2_Data.s_Partner.SetData("默契度:",_P2_PartnerPoint);

		_VNet2DBRow.Release();

		_VNet2DBRow.InitByInt(window.M_G_CLINET,window.GAMESHOW,1,P3UID);
		if (!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.Release();
			printf("B# error:DBname:"+window.M_G_CLINET+",TBName1:"+window.GAMESHOW+",P3UID:"+P3UID);
			//return;
		}
		//玩家3的结算数据 老虎修改2009-4-21
		s_P3_Data.s_Exp.SetData("经验:",_VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GAINEXP));
		_TotalMoney = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GAINMONEY);
		_WagerMoney = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_WAGERMONEY);
		s_P3_Data.s_Money.SetData("金币:",_TotalMoney);
		s_P3_Data.s_WagerTaken.SetData("挑战金点券:",_VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_WAGERTAKEN));
		s_P3_Data.s_WagerMoney.SetData("挑战金金币:",_WagerMoney);
		if ( m_LoverOrNot != window.ROOM_TYPE_LOVERDOUBLE )
		{
			var _temp = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_TOTALSCORE);
			if (_temp > _TotalScoreValue){m_TotalScoreIndex = 3;}//P3和高的比
			s_P3_Data.s_TotalScore.SetData("总得分:",_temp);
			_temp = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_USESKILL);
			if (_temp > _UseSkillValue){m_UseSkillIndex = 3;}//P3和高的比
			s_P3_Data.s_UseSkill.SetData("使用技能:",_temp);
			_temp = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_ACEBALL);
			if (_temp > _ACEBallValue){m_ACEBallIndex = 3;}//P3和高的比
			s_P3_Data.s_ACEBall.SetData("ACE球:",_temp);
			s_P3_Data.s_BadBall.SetData("受迫球:",_VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_BADBALL));
			_temp = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_FULLSTOREBALL);
			if (_temp > _FullStoreBallValue){m_FullStoreBallIndex = 3;}//P3和高的比
			s_P3_Data.s_FullStoreBall.SetData("满蓄力次数:",_temp);
		}
		if ( m_LoverOrNot == window.ROOM_TYPE_LOVERDOUBLE )
		{
			var _temp = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GETDROPBALL);
			if (_temp > _TotalScoreValue){m_TotalScoreIndex = 3;}//P3和高的比
			s_P3_Data.s_TotalScore.SetData("总得分:",_temp);
			_temp = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GETBADBALL);
			if (_temp > _UseSkillValue){m_UseSkillIndex = 3;}//P3和高的比
			s_P3_Data.s_UseSkill.SetData("使用技能:",_temp);
			_temp = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GETHIGHBALL);
			if (_temp > _ACEBallValue){m_ACEBallIndex = 3;}//P3和高的比
			s_P3_Data.s_ACEBall.SetData("ACE球:",_temp);
			s_P3_Data.s_BadBall.SetData("受迫球:",_VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GETSNICKBALL));
			_temp = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GETVOLLEYBALL);
			if (_temp > _FullStoreBallValue){m_FullStoreBallIndex = 3;}//P3和高的比
			s_P3_Data.s_FullStoreBall.SetData("满蓄力次数:",_temp);
		}

		var _P3_data = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GAINDATA);
		var _P3_PartnerPoint = window.GetActivityPointData(_P3_data,6);
		// modify by chenjihui
		// 2010-12-20
		if (P3UID_Lover != P1UID)
		{
			_P3_PartnerPoint = 0;
		}
		s_P3_Data.s_Partner.SetData("默契度:",_P3_PartnerPoint);

		_VNet2DBRow.Release();

		_VNet2DBRow.InitByInt(window.M_G_CLINET,window.GAMESHOW,1,P4UID);
		if (!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.Release();
			printf("B# error:DBname:"+window.M_G_CLINET+",TBName1:"+window.GAMESHOW+",UID:"+P4UID);
			//return;
		}
		//玩家4的结算数据 老虎修改2009-4-21
		s_P4_Data.s_Exp.SetData("经验:",_VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GAINEXP));
		_TotalMoney = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GAINMONEY);
		_WagerMoney = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_WAGERMONEY);
		s_P4_Data.s_Money.SetData("金币:",_TotalMoney);
		s_P4_Data.s_WagerTaken.SetData("挑战金点券:",_VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_WAGERTAKEN));
		s_P4_Data.s_WagerMoney.SetData("挑战金金币:",_WagerMoney);
		if ( m_LoverOrNot != window.ROOM_TYPE_LOVERDOUBLE )
		{
			var _temp = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_TOTALSCORE);
			if (_temp > _TotalScoreValue){m_TotalScoreIndex = 4;}//P4和高的比
			s_P4_Data.s_TotalScore.SetData("总得分:",_temp);
			_temp = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_USESKILL);
			if (_temp > _UseSkillValue){m_UseSkillIndex = 4;}//P4和高的比
			s_P4_Data.s_UseSkill.SetData("使用技能:",_temp);
			_temp = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_ACEBALL);
			if (_temp > _ACEBallValue){m_ACEBallIndex = 4;}//P4和高的比
			s_P4_Data.s_ACEBall.SetData("ACE球:",_temp);
			s_P4_Data.s_BadBall.SetData("受迫球:",_VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_BADBALL));
			_temp = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_FULLSTOREBALL);
			if (_temp > _FullStoreBallValue){m_FullStoreBallIndex = 4;}//P4和高的比
			s_P4_Data.s_FullStoreBall.SetData("满蓄力次数:",_temp);
		}
		if ( m_LoverOrNot == window.ROOM_TYPE_LOVERDOUBLE )
		{
			var _temp = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GETDROPBALL);
			if (_temp > _TotalScoreValue){m_TotalScoreIndex = 4;}//P4和高的比
			s_P4_Data.s_TotalScore.SetData("总得分:",_temp);
			_temp = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GETBADBALL);
			if (_temp > _UseSkillValue){m_UseSkillIndex = 4;}//P4和高的比
			s_P4_Data.s_UseSkill.SetData("使用技能:",_temp);
			_temp = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GETHIGHBALL);
			if (_temp > _ACEBallValue){m_ACEBallIndex = 4;}//P4和高的比
			s_P4_Data.s_ACEBall.SetData("ACE球:",_temp);
			s_P4_Data.s_BadBall.SetData("受迫球:",_VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GETSNICKBALL));
			_temp = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GETVOLLEYBALL);
			if (_temp > _FullStoreBallValue){m_FullStoreBallIndex = 4;}//P4和高的比
			s_P4_Data.s_FullStoreBall.SetData("满蓄力次数:",_temp);
		}

		var _P4_data = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GAINDATA);
		var _P4_PartnerPoint = window.GetActivityPointData(_P4_data,6);
		// modify by chenjihui
		// 2010-12-20
		if (P4UID_Lover != P2UID)
		{
			_P4_PartnerPoint = 0;
		}
		s_P4_Data.s_Partner.SetData("默契度:",_P4_PartnerPoint);

		_VNet2DBRow.del();

/*
		// 移到前面，以供作用域内其它代码使用    chenjihui 2010-12-19

		var P1UID_Lover = window.GetCurrLoverUID(P1UID);
		var P3UID_Lover = window.GetCurrLoverUID(P3UID);
		var P2UID_Lover = window.GetCurrLoverUID(P2UID);
		var P4UID_Lover = window.GetCurrLoverUID(P4UID);
*/
		if (P1UID_Lover == P2UID)
		{
//			var s_P1loverPoin = window.GetLoverExtraExp(P1UID);
			var s_P1loverPoin = window.User1LoverExp;
			s_P1_Data.s_Expadd.SetData("经验加成:",""+s_P1loverPoin);
			s_P2_Data.s_Expadd.SetData("经验加成:",""+s_P1loverPoin);
			s_P3_Data.s_Expadd.SetData("经验加成:","");
			s_P4_Data.s_Expadd.SetData("经验加成:","");
		}
		if(P3UID_Lover == P4UID)
		{
			
//			var s_P3loverPoin = window.GetLoverExtraExp(P3UID);
			var s_P3loverPoin = window.User3LoverExp;
			s_P1_Data.s_Expadd.SetData("经验加成:","");
			s_P2_Data.s_Expadd.SetData("经验加成:","");
			s_P3_Data.s_Expadd.SetData("经验加成:",""+s_P3loverPoin);
			s_P4_Data.s_Expadd.SetData("经验加成:",""+s_P3loverPoin);
		}
		if(P1UID_Lover == P3UID)
		{
//			var s_P1loverPoin = window.GetLoverExtraExp(P1UID);
			var s_P1loverPoin = window.User1LoverExp;
			s_P2_Data.s_Expadd.SetData("经验加成:","");
			s_P4_Data.s_Expadd.SetData("经验加成:","");
			s_P1_Data.s_Expadd.SetData("经验加成:",""+s_P1loverPoin);
			s_P3_Data.s_Expadd.SetData("经验加成:",""+s_P1loverPoin);
		}
		if(P2UID_Lover == P4UID)
		{
//			var s_P2loverPoin = window.GetLoverExtraExp(P2UID);
			var s_P2loverPoin = window.User2LoverExp;
			s_P1_Data.s_Expadd.SetData("经验加成:","");
			s_P3_Data.s_Expadd.SetData("经验加成:","");
			s_P2_Data.s_Expadd.SetData("经验加成:",""+s_P2loverPoin);
			s_P4_Data.s_Expadd.SetData("经验加成:",""+s_P2loverPoin);
		}
		if(P1UID_Lover == P4UID)
		{
//			var s_P1loverPoin = window.GetLoverExtraExp(P1UID);
			var s_P1loverPoin = window.User1LoverExp;
			s_P2_Data.s_Expadd.SetData("经验加成:","");
			s_P3_Data.s_Expadd.SetData("经验加成:","");
			s_P1_Data.s_Expadd.SetData("经验加成:",""+s_P1loverPoin);
			s_P4_Data.s_Expadd.SetData("经验加成:",""+s_P1loverPoin);
		}
		if(P2UID_Lover == P3UID)
		{
//			var s_P2loverPoin = window.GetLoverExtraExp(P2UID);
			var s_P2loverPoin = window.User2LoverExp;
			s_P1_Data.s_Expadd.SetData("经验加成:","");
			s_P4_Data.s_Expadd.SetData("经验加成:","");
			s_P2_Data.s_Expadd.SetData("经验加成:",""+s_P2loverPoin);
			s_P3_Data.s_Expadd.SetData("经验加成:",""+s_P2loverPoin);
		}
		if( P3UID_Lover == P4UID && P1UID_Lover == P2UID)
		{
//			var s_P1loverPoin = window.GetLoverExtraExp(P1UID);
//			var s_P3loverPoin	window.GetLoverExtraExp(P3UID);
			var s_P1loverPoin = window.User1LoverExp;
			var s_P3loverPoin = window.User3LoverExp;
			
			s_P1_Data.s_Expadd.SetData("经验加成:",""+s_P1loverPoin);
			s_P2_Data.s_Expadd.SetData("经验加成:",""+s_P1loverPoin);
			s_P3_Data.s_Expadd.SetData("经验加成:",""+s_P3loverPoin);
			s_P4_Data.s_Expadd.SetData("经验加成:",""+s_P3loverPoin);
		}
		if( P1UID_Lover == P3UID && P2UID_Lover == P4UID)
		{
//			var s_P1loverPoin = window.GetLoverExtraExp(P1UID);
//			var s_P2loverPoin	window.GetLoverExtraExp(P2UID);
			var s_P1loverPoin = window.User1LoverExp;
			var s_P2loverPoin = window.User2LoverExp;
			s_P1_Data.s_Expadd.SetData("经验加成:",""+s_P1loverPoin);
			s_P2_Data.s_Expadd.SetData("经验加成:",""+s_P2loverPoin);
			s_P3_Data.s_Expadd.SetData("经验加成:",""+s_P1loverPoin);
			s_P4_Data.s_Expadd.SetData("经验加成:",""+s_P2loverPoin);
		}
		if( P1UID_Lover == P4UID && P2UID_Lover == P3UID)
		{
//			var s_P1loverPoin = window.GetLoverExtraExp(P1UID);
//			var s_P2loverPoin	window.GetLoverExtraExp(P2UID);
			var s_P1loverPoin = window.User1LoverExp;
			var s_P2loverPoin = window.User2LoverExp;
			s_P1_Data.s_Expadd.SetData("经验加成:",""+s_P1loverPoin);
			s_P2_Data.s_Expadd.SetData("经验加成:",""+s_P2loverPoin);
			s_P3_Data.s_Expadd.SetData("经验加成:",""+s_P2loverPoin);
			s_P4_Data.s_Expadd.SetData("经验加成:",""+s_P1loverPoin);
		}
		window.User1LoverExp = 0;window.User2LoverExp = 0;
		window.User3LoverExp = 0;

		var _TActID1 = -1;	//玩家1整场比赛胜利 11,12,13 整场比赛失败 14,15,16
		var _TActID2 = -1;	//玩家2整场比赛胜利 11,12,13 整场比赛失败 14,15,16
		var _TActID3 = -1;	//玩家2整场比赛胜利 11,12,13 整场比赛失败 14,15,16
		var _TActID4 = -1;	//玩家2整场比赛胜利 11,12,13 整场比赛失败 14,15,16

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
			switch (parent._User3.GetCharacter())
			{
				case 1:{_TActID3 = 11;break;}
				case 2:{_TActID3 = 12;break;}
				case 3:{_TActID3 = 13;break;}
			}
			switch (parent._User4.GetCharacter())
			{
				case 1:{_TActID4 = 14;break;}
				case 2:{_TActID4 = 15;break;}
				case 3:{_TActID4 = 16;break;}
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
			switch (parent._User3.GetCharacter())
			{
				case 1:{_TActID3 = 14;break;}
				case 2:{_TActID3 = 15;break;}
				case 3:{_TActID3 = 16;break;}
			}
			switch (parent._User4.GetCharacter())
			{
				case 1:{_TActID4 = 11;break;}
				case 2:{_TActID4 = 12;break;}
				case 3:{_TActID4 = 13;break;}
			}
		}
		s_P1_Model.SetData(parent._User1.GetSex(),parent._User1.GetRID(),_TActID1);
		s_P2_Model.SetData(parent._User2.GetSex(),parent._User2.GetRID(),_TActID2);
		s_P3_Model.SetData(parent._User3.GetSex(),parent._User3.GetRID(),_TActID3);
		s_P4_Model.SetData(parent._User4.GetSex(),parent._User4.GetRID(),_TActID4);
		
		printf("B# ===结算=== 总得分" + m_TotalScoreIndex + "使用技能" + m_UseSkillIndex + "一击得分" + m_ACEBallIndex + "满蓄力" + m_FullStoreBallIndex);
		CheckWinner(m_TotalScoreIndex,m_UseSkillIndex,m_ACEBallIndex,m_FullStoreBallIndex);
		sleep(4000);
		//设置是否显示vip奖励
		s_P1_Data.s_vip.setShow(window.GetVipTypeByUID(P1UID));
		s_P2_Data.s_vip.setShow(window.GetVipTypeByUID(P2UID));
		s_P3_Data.s_vip.setShow(window.GetVipTypeByUID(P3UID));
		s_P4_Data.s_vip.setShow(window.GetVipTypeByUID(P4UID));
	}

	void CheckWinner(m_TotalScoreIndex,m_UseSkillIndex,m_ACEBallIndex,m_FullStoreBallIndex)
	{
		switch (m_TotalScoreIndex)
		{
			case 0:{break;}//如果大家都是0,就没有“最强”
			case 1:{s_P1_Data.s_TotalScore.SetNB(true);break;}
			case 2:{s_P2_Data.s_TotalScore.SetNB(true);break;}
			case 3:{s_P3_Data.s_TotalScore.SetNB(true);break;}
			case 4:{s_P4_Data.s_TotalScore.SetNB(true);break;}
		}
		switch (m_UseSkillIndex)
		{
			case 0:{break;}//如果大家都是0,就没有“最强”
			case 1:{s_P1_Data.s_UseSkill.SetNB(true);break;}
			case 2:{s_P2_Data.s_UseSkill.SetNB(true);break;}
			case 3:{s_P3_Data.s_UseSkill.SetNB(true);break;}
			case 4:{s_P4_Data.s_UseSkill.SetNB(true);break;}
		}
		switch (m_ACEBallIndex)
		{
			case 0:{break;}//如果大家都是0,就没有“最强”
			case 1:{s_P1_Data.s_ACEBall.SetNB(true);break;}
			case 2:{s_P2_Data.s_ACEBall.SetNB(true);break;}
			case 3:{s_P3_Data.s_ACEBall.SetNB(true);break;}
			case 4:{s_P4_Data.s_ACEBall.SetNB(true);break;}
		}
		switch (m_FullStoreBallIndex)
		{
			case 0:{break;}//如果大家都是0,就没有“最强”
			case 1:{s_P1_Data.s_FullStoreBall.SetNB(true);break;}
			case 2:{s_P2_Data.s_FullStoreBall.SetNB(true);break;}
			case 3:{s_P3_Data.s_FullStoreBall.SetNB(true);break;}
			case 4:{s_P4_Data.s_FullStoreBall.SetNB(true);break;}
		}
		printf("B# ===结算=== 确定显不显示");
	}

	void OnCreated()
	{
		SetEvent();
		s_P1_Data.Init();
		s_P2_Data.Init();
		s_P3_Data.Init();
		s_P4_Data.Init();

		if ( m_LoverOrNot == window.ROOM_TYPE_LOVERDOUBLE)
		{
			s_bkLM.show = true;
			s_bkLM.m_ImgPartner.show = true;		// 显示亲密度图片
			s_bk.show = false;
			s_bk.m_ImgPartner.show = false;		// 显示亲密度图片
		}
		else
		{
			s_bk.show = true;
			s_bk.m_ImgPartner.show = true;		// 显示亲密度图片
			s_bkLM.show = false;
			s_bkLM.m_ImgPartner.show = false;		// 显示亲密度图片
		}
		if (!window.g_AlreadySaveVideo)
		{
			s_SaveVideo.del();
		}

		ReadDataFromDB(parent._User1.GetUID(),parent._User2.GetUID(),parent._User3.GetUID(),parent._User4.GetUID(),parent.m_Win);
	}
};
