//功能：小何
//内容：老虎
//根据玩家在比赛中的表现，引导去做训练

class TrainStat GameStat
{
	var _DEBUG = 1;			//0表示测试 其他正常模式

	var ST_XULIQIU = 1;			//蓄力球
	var ST_FANGXIANQIU = 2;		//方向球
	var ST_ZHONGDEFEN = 3;		//得分
	var ST_SKILLTYPE1 = 4;		//使用技能类型1
	var ST_SKILLTYPE2 = 5;		//使用技能类型2
	var ST_SKILLTYPE3 = 6;		//使用技能类型3
	var ST_SKILLLV1 = 7;			//使用技能等级1
	var ST_SKILLLV2 = 8;			//使用技能等级2
	var ST_SKILLLV3 = 9;			//使用技能等级3
	var ST_SKILLLV4 = 10;		//使用技能等级4
	var ST_FRONTBALL = 11;		//前场球
	var ST_BACKBALL = 12;		//后场球
	var ST_BOTHBALL = 13;		//无所谓前场后场的球
	var ST_ALLENERGY = 14;		//所有得到的能量
	var ST_PQ = 15;				//抛球
	var ST_SX = 16;				//上旋
	var ST_JJ = 17;				//截击
	var ST_FGQ = 18;			//放高球
	var ST_XQ = 19;				//削球
	var ST_KS = 20;				//扣杀
	var ST_DQ = 21;				//挡球
	var ST_PJ = 22;				//扑救
	var ST_FQ = 23;				//发球
	var ST_ZS = 24;				//总数
	var ST_JN = 25;				//技能球
	var ST_MXL = 26;				//满蓄力
//	var ST_MFX = 27;				//满方向
	var ST_MFQ = 28;				//满蓄力发球
	var ST_YJDF = 29;				//一击得分
	var ST_SXSKILL = 30;			//上旋技能
	var ST_XQSKILL = 31;			//削球技能
	var ST_KSSKILL = 32;			//扣杀技能
	var ST_FGQSKILL = 33;		//放高球技能
	var ST_FQSKILL = 34;			//发球技能
//-------------------------------------------------

	var m_TipTrainID = -1;	//触发的训练ID,返回给程序用
	var m_UserID = -1;
	var m_UnfinishTrainID = -1;

	//程序接口,根据ID得到用户的某项数据
	void GetSelfData(type)//得到自己的数据
	{
		return GetSData(m_UserID,type);
	}
	void GetOppData(type)//得到对方的数据
	{
		return GetOppSData(m_UserID,type);
	}
	void CheckTrainID(serveType)//玩家所在服务器
	{
//		if ( m_TipTrainID == -1 ) return;
//		var row = new VNet2DBRow{};
//		row.InitByInt( window.TENNIS_GAME,window.TRAIN,window.TENNIS_GAME_TRAIN_ID,m_TipTrainID );
//		if ( row.IsReady() )
//		{
//			var needSvID = row.GetData(TENNIS_GAME_TRAIN_TYPE);
//			needSvID = toint(needSvID);
//			if ( needSvID != serveType )
//			{//调试报错用
//				printf("错误的训练id:"+m_TipTrainID+" 和当前的服务器类型不匹配:"+serveType+" 需要服务器:"+needSvID);
//				m_TipTrainID = -1;
//			}
//		}
//		else
//		{
//			m_TipTrainID = -1;
//		}
	}
	void CheckUserTitle()//玩家当前称号
	{
		var userTitle = window.GetQualifyByUID(window.GetMyUID());
		return userTitle;
	}

	//训练引导主函数，优先级自上而下，程序调用
	void TiggerTrainID(serveType,userid,win)
	{
		m_UserID = userid;
		m_TipTrainID = -1;
		m_UnfinishTrainID = window.GetMinTrainIDByType(1);//只取新手阶段未完成的训练ID
		printf("C# --训练引导--userid: " + m_UserID + " win: " + win + " GetMinTrainIDByType:" + m_UnfinishTrainID);
		
		//高等称号在低级服务器
		if ( serveType == 1 && CheckUserTitle() > 1)
		{
			//什么都不做，让阿福先把人引导到下一个阶段的服务器
			printf("C# --训练引导--当前人物称号 " + CheckUserTitle() + " 高于服务器级别 " + serveType);
			return;
		}

//-------------------------根据胜负做相应引导-------------------------
		//输了引导去自由训练
		if ( serveType == 1 && win == 1)
		{
			m_TipTrainID = 7;
			printf("C# --训练引导--新手阶段输了 引导去训练" + m_TipTrainID);
			return CheckTrainID(serveType);
		}

		//赢了引导做未完成的训练
		if ( serveType == 1 && win == 2)
		{
			printf("C# --训练引导--GetMinTrainIDByType:" + m_UnfinishTrainID);
			if ( m_UnfinishTrainID != 0)
			{
				m_TipTrainID = m_UnfinishTrainID;
				printf("C# --训练引导--新手阶段赢得比赛 引导去训练" + m_TipTrainID);
				return CheckTrainID(serveType);
			}
			else
			{
				printf("C# --训练引导--所有训练已全部完成");
				ReckonToTrain_Junior(serveType,userid,win);
			}
		}
		else if ( serveType == 2)
		{
			ReckonToTrain_Senior(serveType,userid,win);
		}
	}

//-------------------------判断完胜负提示去训练-------------------------
	void ReckonToTrain_Junior(serveType,userid,win)
	{
		m_UserID = userid;
		m_TipTrainID = -1;

		//新手阶段：2 上旋  3 截击  4 扣杀  5 蓄力  6 落点  7 新手自由训练
		//新手赛阶段引导
		if ( serveType == 1 && CheckUserTitle() == 1)
		{
			//称号与所在服务器匹配
			//针对当前能够做的训练进行引导
			printf("C# --训练引导--数据统计 动作  上旋球" + GetSelfData(ST_SX) + " 削球 " + GetSelfData(ST_XQ) + " 放高球 " + GetSelfData(ST_FGQ));
			printf("C# --训练引导--数据统计 动作  扣杀 " + GetSelfData(ST_KS) + " 截击 " + GetSelfData(ST_JJ) + " 扑救 " + GetSelfData(ST_PJ));
			printf("C# --训练引导--数据统计 动作  挡球 " + GetSelfData(ST_DQ) + " 蓄力 " + GetSelfData(ST_XULIQIU)+ " 方向球 " + GetSelfData(ST_FANGXIANQIU));
			printf("C# --训练引导--数据统计 动作  满蓄力" + GetSelfData(ST_MXL) + " 一击得分 " + GetSelfData(ST_YJDF) + " 技能球 " + GetSelfData(ST_JN));
//			if ( GetSelfData(ST_JN) == 0 && GetOppData(ST_JN) >= 1)
//			{
//				m_TipTrainID = 7;
//				printf("C# --训练引导--训练ID " + m_TipTrainID);
//				return CheckTrainID(serveType);
//			}
			if ( GetSelfData(ST_FANGXIANQIU) <= 10)
			{
				m_TipTrainID = 6;
				printf("C# --训练引导--训练ID " + m_TipTrainID);
				return CheckTrainID(serveType);
			}
			if ( GetSelfData(ST_XULIQIU) <= 10)
			{
				m_TipTrainID = 5;
				printf("C# --训练引导--训练ID " + m_TipTrainID);
				return CheckTrainID(serveType);
			}
			if ( GetSelfData(ST_JJ) == 0 && GetOppData(ST_JJ) >= 1)
			{
				m_TipTrainID = 3;
				printf("C# --训练引导--训练ID " + m_TipTrainID);
				return CheckTrainID(serveType);
			}
			if ( GetSelfData(ST_KS) == 0 && GetOppData(ST_KS) >= 1)
			{
				m_TipTrainID = 4;
				printf("C# --训练引导--训练ID " + m_TipTrainID);
				return CheckTrainID(serveType);
			}
			if ( GetOppData(ST_YJDF) >= 5)
			{
				m_TipTrainID = 2;
				printf("C# --训练引导--训练ID " + m_TipTrainID);
				return CheckTrainID(serveType);
			}
			if ( GetSelfData(ST_PJ) >= 10)
			{
				m_TipTrainID = 2;
				printf("C# --训练引导--训练ID " + m_TipTrainID);
				return CheckTrainID(serveType);
			}
			return CheckTrainID(serveType);
		}
	}

	void ReckonToTrain_Senior(serveType,userid,win)
	{
		m_UserID = userid;
		m_TipTrainID = -1;
		
		//资格赛阶段引导
		//资格赛阶段：8 放高球  9 削球  10 满蓄力  11 满方向  12 满力发球  
		//			  13 上旋技能  14 削球技能  15 扣杀技能  16 放高球技能  17 发球技能  18 资格赛自由训练
		
		
		if (CheckUserTitle() > 2)
		{
			//高等称号在低级服务器
			//什么都不做，让阿福先把人引导到下一个阶段的服务器
			printf("B# 当前人物称号 " + CheckUserTitle() + " 高于服务器级别 " + serveType);
			return;
		}
		if (CheckUserTitle() == 2)
		{
			//称号与所在服务器匹配
			//针对当前和之前能够做的训练进行引导
			printf("C# --训练引导--数据统计 动作  上旋球" + GetSelfData(ST_SX) + " 削球 " + GetSelfData(ST_XQ) + " 放高球 " + GetSelfData(ST_FGQ));
			printf("C# --训练引导--数据统计 动作  扣杀 " + GetSelfData(ST_KS) + " 截击 " + GetSelfData(ST_JJ) + " 扑救 " + GetSelfData(ST_PJ));
			printf("C# --训练引导--数据统计 动作  挡球 " + GetSelfData(ST_DQ) + " 蓄力 " + GetSelfData(ST_XULIQIU)+ " 方向球 " + GetSelfData(ST_FANGXIANQIU));
			printf("C# --训练引导--数据统计 动作  满蓄力" + GetSelfData(ST_MXL) + " 一击得分 " + GetSelfData(ST_YJDF) + " 技能球 " + GetSelfData(ST_JN));
			
			//上旋训练从新手搬过来了
			if ( GetSelfData(ST_JN) == 0 && GetOppData(ST_JN) >= 1)
			{
				m_TipTrainID = 13;
				return CheckTrainID(serveType);
			}
		
			if ( GetSelfData(ST_KSSKILL) == 0 && GetOppData(ST_KSSKILL) >= 1)
			{
				m_TipTrainID = 15;
				return CheckTrainID(serveType);
			}
			if ( GetSelfData(ST_XQSKILL) == 0 && GetOppData(ST_XQSKILL) >= 1)
			{
				m_TipTrainID = 14;
				return CheckTrainID(serveType);
			}
			if ( GetSelfData(ST_FGQSKILL) == 0 && GetOppData(ST_FGQSKILL) >= 1)
			{
				m_TipTrainID = 16;
				return CheckTrainID(serveType);
			}
			if ( GetSelfData(ST_FQSKILL) == 0 && GetOppData(ST_FQSKILL) >= 1)
			{
				m_TipTrainID = 17;
				return CheckTrainID(serveType);
			}
//			if ( GetSelfData(ST_MFX) <= 10)
//			{
//				m_TipTrainID = 11;
//				return CheckTrainID(serveType);
//			}
			if (GetSelfData(ST_FANGXIANQIU) <= 10)
			{
				m_TipTrainID = 11;
				return CheckTrainID(serveType);
			}
			if ( GetSelfData(ST_PJ) >= 5 && GetOppData(ST_FANGXIANQIU) >= 10)
			{
				m_TipTrainID = 11;
				return CheckTrainID(serveType);
			}
			if ( GetSelfData(ST_MXL) <= 5)
			{
				m_TipTrainID = 10;
				return CheckTrainID(serveType);
			}
			if ( GetSelfData(ST_MFQ) == 0 && GetOppData(ST_MFQ) >= 1)
			{
				m_TipTrainID = 12;
				return CheckTrainID(serveType);
			}
			if ( GetSelfData(ST_MFQ) <= 3)
			{
				m_TipTrainID = 12;
				return CheckTrainID(serveType);
			}
			if ( GetSelfData(ST_MFQ) <= 2 && GetOppData(ST_YJDF) >= 5)
			{
				m_TipTrainID = 12;
				return CheckTrainID(serveType);
			}
			if ( GetSelfData(ST_FGQ) <= 5 && GetOppData(ST_JJ) >= 8)
			{
				m_TipTrainID = 8;
				return CheckTrainID(serveType);
			}
			if ( GetSelfData(ST_JJ) <= 5)
			{
				m_TipTrainID = 3;
				return CheckTrainID(serveType);
			}
			if ( GetSelfData(ST_KS) <= 3 && GetOppData(ST_FGQ) >= 5)
			{
				m_TipTrainID = 4;
				return CheckTrainID(serveType);
			}
		}
	}
};

