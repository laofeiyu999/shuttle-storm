//
//游戏结算界面的类定义:逻辑>>双打
//
import("$./../../UI/ArenaOver/ClassDef_D.gml");

class VArena_Over_D_Logic item
{
	size = "100%,100%";
	var m_TotalScoreIndex = 0;//总得分最强的玩家索引
	var m_UseSkillIndex = 0;//使用技能次数最强的玩家索引
	var m_ACEBallIndex = 0;//一击得分最强的玩家索引
	var m_FullStoreBallIndex = 0;//满蓄力最强的玩家索引
	var m_showStateArray = sysarray(5);	//需要自动调整的显示内容：奖券,活动点,积分,贡献点,默契度
	var m_UID = 0;
	var m_LoverOrNot = window.GetRoomType();//获得房间类型
	//===================================与显示交互部分========================================
	void Init()
	{
		//P1的结算数据
		//参数：见类定义
		staticvar s_P1_Data = new VArena_Over_Data_Logic{}

		//P2的结算数据
		//参数：见类定义
		staticvar s_P2_Data = new VArena_Over_Data_Logic{pos = "200,0";}

		//P3的结算数据
		//参数：见类定义
		staticvar s_P3_Data = new VArena_Over_Data_Logic{pos = "400,0";}

		//P4的结算数据
		//参数：见类定义
		staticvar s_P4_Data = new VArena_Over_Data_Logic{pos = "600,0";}

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
	inclass("VArena_Over_D_UI");
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
	//参数 P1UID:	自己的UserID
	//参数 P2UID:	对方的UserID
	//参数 P3UID:	自己队友的UserID
	//参数 P4UID:	对方队友的UserID
	//参数 iWin ：	胜利或失败
	void ReadDataFromDB(raceid,P1UID,P2UID,P3UID,P4UID,iWin)
	{
		var P1UID_Lover = window.GetCurrLoverUID(P1UID);
		var P3UID_Lover = window.GetCurrLoverUID(P3UID);
		var P2UID_Lover = window.GetCurrLoverUID(P2UID);
		var P4UID_Lover = window.GetCurrLoverUID(P4UID);
		printf("B# 结算-D-ReadDataFromDB：P1UID:"+P1UID+",P2UID:"+P2UID+",P3UID:"+P3UID+",P4UID:"+P4UID+",Win:"+iWin);
		s_P1_Data.s_NkName.SetData("昵称:",parent._User1.GetNkName());
		s_P2_Data.s_NkName.SetData("昵称:",parent._User2.GetNkName());
		s_P3_Data.s_NkName.SetData("昵称:",parent._User3.GetNkName());
		s_P4_Data.s_NkName.SetData("昵称:",parent._User4.GetNkName());

		//s_NkName_1.SetData("昵称:",parent._User1.GetNkName());
		//s_NkName_2.SetData("昵称:",parent._User3.GetNkName());

		//设置是否显示vip奖励
//		s_P1_Data.s_vip.setShow(window.GetVipTypeByUID(P1UID));
//		s_P2_Data.s_vip.setShow(window.GetVipTypeByUID(P2UID));
//		s_P3_Data.s_vip.setShow(window.GetVipTypeByUID(P3UID));
//		s_P4_Data.s_vip.setShow(window.GetVipTypeByUID(P4UID));
		
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
		var _P1_PartnerPoint = window.GetActivityPointData(_P1_data,5);

		//奖券		
		s_P1_Data.s_Lottery.SetData("奖券:",_P1_Lottery);
		//活动点		
		s_P1_Data.s_ArenaPoint.SetData("活动点:",_P1_ArenaPoint);
		//积分		
		s_P1_Data.s_Integral.SetData("积分:",_P1_Integral));
		//贡献点
		s_P1_Data.s_ContributePoint.SetData("贡献点:",_P1_ContributePoint);
		//默契度
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
		//p1数据打印
		printf("B# ===结算P1=== 奖券:"+_1_Lottery+",活动点:"+_P1_ArenaPoint+",积分:"+_P1_Integral+"贡献点:"+_P1_ContributePoint);

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
		var _P2_PartnerPoint = window.GetActivityPointData(_P2_data,5);

		//奖券		
		s_P2_Data.s_Lottery.SetData("奖券:",_P2_Lottery);
		//活动点		
		s_P2_Data.s_ArenaPoint.SetData("活动点:",_P2_ArenaPoint);
		//积分		
		s_P2_Data.s_Integral.SetData("积分:",_P2_Integral);
		//贡献点
		s_P2_Data.s_ContributePoint.SetData("贡献点:",_P2_ContributePoint);

		//默契度
		var _P2_data = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GAINDATA);
		var _P2_PartnerPoint = window.GetActivityPointData(_P2_data,6);

		// modify by chenjihui
		// 2010-12-20
		if (P2UID_Lover != P4UID)
		{
			_P2_PartnerPoint = 0;
		}
		s_P2_Data.s_Partner.SetData("默契度:",_P2_PartnerPoint);

		//p3的设置
		_VNet2DBRow.Release();
		//p2数据打印
		printf("B# ===结算P2=== 奖券:"+_2_Lottery+",活动点:"+_P2_ArenaPoint+",积分:"+_P2_Integral+"贡献点:"+_P2_ContributePoint);

		_VNet2DBRow.InitByInt(window.M_G_CLINET,window.GAMESHOW,window.M_G_CLINET_GAMESHOW_USERID,P3UID);
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
		s_P3_Data.s_TotalScore.SetData("总得分:",_temp);
		//使用技能次数
		_temp = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_USESKILL);
		if (_temp > _UseSkillValue){m_UseSkillIndex = 2;}//P2和P1比
		s_P3_Data.s_UseSkill.SetData("使用技能:",_temp);
		//一击得分次数
		_temp = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_ACEBALL);
		if (_temp > _ACEBallValue){m_ACEBallIndex = 2;}//P2和P1比
		s_P3_Data.s_ACEBall.SetData("ACE球:",_temp);
		//受破球次数
		s_P3_Data.s_BadBall.SetData("受迫球:",_VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_BADBALL));

		//满蓄力次数
		_temp = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_FULLSTOREBALL);
		if (_temp > _FullStoreBallValue){m_FullStoreBallIndex = 2;}//P2和P1比
		s_P3_Data.s_FullStoreBall.SetData("满蓄力次数:",_temp);

		//经验
		s_P3_Data.s_Exp.SetData("经验:",_VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GAINEXP));
		//金币
		s_P3_Data.s_Money.SetData("金币:",_TotalMoney-_WagerMoney);

		var _P3_data = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GAINDATA);
		var _P3_Lottery = window.GetActivityPointData(_P3_data,4);
		var _P3_ArenaPoint = window.GetActivityPointData(_P3_data,1);
		var _P3_Integral = window.GetActivityPointData(_P3_data,2);
		var _P3_ContributePoint = window.GetActivityPointData(_P3_data,3);
		var _P3_PartnerPoint = window.GetActivityPointData(_P3_data,5);

		//奖券		
		s_P3_Data.s_Lottery.SetData("奖券:",_P3_Lottery);
		//活动点		
		s_P3_Data.s_ArenaPoint.SetData("活动点:",_P3_ArenaPoint);
		//积分		
		s_P3_Data.s_Integral.SetData("积分:",_P3_Integral);
		//贡献点
		s_P3_Data.s_ContributePoint.SetData("贡献点:",_P3_ContributePoint);
		//默契度
		var _P3_data = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GAINDATA);
		var _P3_PartnerPoint = window.GetActivityPointData(_P3_data,6);
		// modify by chenjihui
		// 2010-12-20
		if (P3UID_Lover != P1UID)
		{
			_P3_PartnerPoint = 0;
		}
		s_P3_Data.s_Partner.SetData("默契度:",_P3_PartnerPoint);

		//p4的设置
		_VNet2DBRow.Release();
		//p3数据打印
		printf("B# ===结算P3=== 奖券:"+_3_Lottery+",活动点:"+_P3_ArenaPoint+",积分:"+_P3_Integral+"贡献点:"+_P3_ContributePoint);

		_VNet2DBRow.InitByInt(window.M_G_CLINET,window.GAMESHOW,window.M_G_CLINET_GAMESHOW_USERID,P4UID);
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
		s_P4_Data.s_TotalScore.SetData("总得分:",_temp);
		//使用技能次数
		_temp = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_USESKILL);
		if (_temp > _UseSkillValue){m_UseSkillIndex = 2;}//P2和P1比
		s_P4_Data.s_UseSkill.SetData("使用技能:",_temp);
		//一击得分次数
		_temp = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_ACEBALL);
		if (_temp > _ACEBallValue){m_ACEBallIndex = 2;}//P2和P1比
		s_P4_Data.s_ACEBall.SetData("ACE球:",_temp);
		//受破球次数
		s_P4_Data.s_BadBall.SetData("受迫球:",_VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_BADBALL));

		//满蓄力次数
		_temp = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_FULLSTOREBALL);
		if (_temp > _FullStoreBallValue){m_FullStoreBallIndex = 2;}//P2和P1比
		s_P4_Data.s_FullStoreBall.SetData("满蓄力次数:",_temp);

		//经验
		s_P4_Data.s_Exp.SetData("经验:",_VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GAINEXP));
		//金币
		s_P4_Data.s_Money.SetData("金币:",_TotalMoney-_WagerMoney);

		var _P4_data = _VNet2DBRow.GetData(window.M_G_CLINET_GAMESHOW_GAINDATA);
		var _P4_Lottery = window.GetActivityPointData(_P4_data,4);
		var _P4_ArenaPoint = window.GetActivityPointData(_P4_data,1);
		var _P4_Integral = window.GetActivityPointData(_P4_data,2);
		var _P4_ContributePoint = window.GetActivityPointData(_P4_data,3);
		var _P4_PartnerPoint = window.GetActivityPointData(_P4_data,5);

		//奖券		
		s_P4_Data.s_Lottery.SetData("奖券:",_P4_Lottery);
		//活动点		
		s_P4_Data.s_ArenaPoint.SetData("活动点:",_P4_ArenaPoint);
		//积分		
		s_P4_Data.s_Integral.SetData("积分:",_P4_Integral);
		//贡献点
		s_P4_Data.s_ContributePoint.SetData("贡献点:",_P4_ContributePoint);
		//默契度
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

		if (P1UID_Lover == P2UID)
		{
			var s_P1loverPoin = window.User1LoverExp;
			s_P1_Data.s_Expadd.SetData("经验加成:",""+s_P1loverPoin);
			s_P2_Data.s_Expadd.SetData("经验加成:",""+s_P1loverPoin);
			s_P3_Data.s_Expadd.SetData("经验加成:","");
			s_P4_Data.s_Expadd.SetData("经验加成:","");
		}
		if(P3UID_Lover == P4UID)
		{
			var s_P3loverPoin = window.User3LoverExp;
			s_P1_Data.s_Expadd.SetData("经验加成:","");
			s_P2_Data.s_Expadd.SetData("经验加成:","");
			s_P3_Data.s_Expadd.SetData("经验加成:",""+s_P3loverPoin);
			s_P4_Data.s_Expadd.SetData("经验加成:",""+s_P3loverPoin);
		}
		if(P1UID_Lover == P3UID)
		{
			var s_P1loverPoin = window.User1LoverExp;
			s_P2_Data.s_Expadd.SetData("经验加成:","");
			s_P4_Data.s_Expadd.SetData("经验加成:","");
			s_P1_Data.s_Expadd.SetData("经验加成:",""+s_P1loverPoin);
			s_P3_Data.s_Expadd.SetData("经验加成:",""+s_P1loverPoin);
		}
		if(P2UID_Lover == P4UID)
		{
			var s_P2loverPoin = window.User2LoverExp;
			s_P1_Data.s_Expadd.SetData("经验加成:","");
			s_P3_Data.s_Expadd.SetData("经验加成:","");
			s_P2_Data.s_Expadd.SetData("经验加成:",""+s_P2loverPoin);
			s_P4_Data.s_Expadd.SetData("经验加成:",""+s_P2loverPoin);
		}
		if(P1UID_Lover == P4UID)
		{
			var s_P1loverPoin = window.User1LoverExp;
			s_P2_Data.s_Expadd.SetData("经验加成:","");
			s_P3_Data.s_Expadd.SetData("经验加成:","");
			s_P1_Data.s_Expadd.SetData("经验加成:",""+s_P1loverPoin);
			s_P4_Data.s_Expadd.SetData("经验加成:",""+s_P1loverPoin);
		}
		if(P2UID_Lover == P3UID)
		{
			var s_P2loverPoin = window.User2LoverExp;
			s_P1_Data.s_Expadd.SetData("经验加成:","");
			s_P4_Data.s_Expadd.SetData("经验加成:","");
			s_P2_Data.s_Expadd.SetData("经验加成:",""+s_P2loverPoin);
			s_P3_Data.s_Expadd.SetData("经验加成:",""+s_P2loverPoin);
		}
		if( P3UID_Lover == P4UID && P1UID_Lover == P2UID)
		{
			var s_P1loverPoin = window.User1LoverExp;
			var s_P3loverPoin = window.User3LoverExp;
			
			s_P1_Data.s_Expadd.SetData("经验加成:",""+s_P1loverPoin);
			s_P2_Data.s_Expadd.SetData("经验加成:",""+s_P1loverPoin);
			s_P3_Data.s_Expadd.SetData("经验加成:",""+s_P3loverPoin);
			s_P4_Data.s_Expadd.SetData("经验加成:",""+s_P3loverPoin);
		}
		if( P1UID_Lover == P3UID && P2UID_Lover == P4UID)
		{
			var s_P1loverPoin = window.User1LoverExp;
			var s_P2loverPoin = window.User2LoverExp;
			s_P1_Data.s_Expadd.SetData("经验加成:",""+s_P1loverPoin);
			s_P2_Data.s_Expadd.SetData("经验加成:",""+s_P2loverPoin);
			s_P3_Data.s_Expadd.SetData("经验加成:",""+s_P1loverPoin);
			s_P4_Data.s_Expadd.SetData("经验加成:",""+s_P2loverPoin);
		}
		if( P1UID_Lover == P4UID && P2UID_Lover == P3UID)
		{
			var s_P1loverPoin = window.User1LoverExp;
			var s_P2loverPoin = window.User2LoverExp;
			s_P1_Data.s_Expadd.SetData("经验加成:",""+s_P1loverPoin);
			s_P2_Data.s_Expadd.SetData("经验加成:",""+s_P2loverPoin);
			s_P3_Data.s_Expadd.SetData("经验加成:",""+s_P2loverPoin);
			s_P4_Data.s_Expadd.SetData("经验加成:",""+s_P1loverPoin);
		}
		window.User1LoverExp = 0;window.User2LoverExp = 0;
		window.User3LoverExp = 0;

		//p4数据打印
		printf("B# ===结算P4=== 奖券:"+_P4_Lottery+",活动点:"+_P4_ArenaPoint+",积分:"+_P4_Integral+"贡献点:"+_P4_ContributePoint);
		//设置显示
		//奖券状态
		if(tostring(_P1_Lottery) != "" || tostring(_P2_Lottery) != "" || tostring(_P3_Lottery) != "" || tostring(_P4_Lottery) != "")
		{
			m_showStateArray[0] = 1;
		}
		else
		{
			m_showStateArray[0] = 0;
		}
		//活动点状态
		if(tostring(_P1_ArenaPoint) != "" || tostring(_P2_ArenaPoint) != "" || tostring(_P3_ArenaPoint) != "" || tostring(_P4_ArenaPoint) != "")
		{
			m_showStateArray[1] = 1;
		}
		else
		{
			m_showStateArray[1] = 0;
		}
		//积分状态
		if(tostring(_P1_Integral) != "" || tostring(_P2_Integral) != "" || tostring(_P3_Integral) != "" || tostring(_P4_Integral) != "")
		{
			m_showStateArray[2] = 1;
		}
		else
		{
			m_showStateArray[2] = 0;
		}
		
		if(tostring(_P1_ContributePoint) != "" || tostring(_P2_ContributePoint) != "" || tostring(_P3_ContributePoint) != "" || tostring(_P4_ContributePoint) != "")
		{
			m_showStateArray[3] = 1;
		}
		else
		{
			m_showStateArray[3] = 0;
		}
		
		if(tostring(_P1_PartnerPoint) != "" || tostring(_P2_PartnerPoint) != "" || tostring(_P3_PartnerPoint) != "" || tostring(_P4_PartnerPoint) != "")
		{
			m_showStateArray[4] = 1;
		}
		else
		{
			m_showStateArray[4] = 0;
		}

		ShowContent(m_showStateArray);
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
		Init();
		//SetEvent();
		s_P1_Data.Init();
		s_P2_Data.Init();
		s_P3_Data.Init();
		s_P4_Data.Init();

		ReadDataFromDB(parent._RaceID,parent._User1.GetUID(),parent._User2.GetUID(),parent._User3.GetUID(),parent._User4.GetUID(),parent._Win);
	}
};
