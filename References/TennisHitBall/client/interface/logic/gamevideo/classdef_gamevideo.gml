import("$./../Game/ClassDef_PlayLogic_Sub.gml");
import("$./../../UI/GameVideo/ClassDef_GameVideo.gml");


//
//录像和观战的界面
//

class VGameVideoPlay_Logic item
{
	size="100%,100%";
	name = "VGameVideoPlay_Logic_NAME";
	var m_iGameNum = 1;					//游戏的局数
	var m_iP1GameScore = 0;				//p1的赢的局数
	var m_iP2GameScore = 0;				//p2的赢的局数
	var m_iP1Point = 0;					//P1的当前得分-打完一球就变化
	var m_iP2Point = 0;					//P2的当前得分-打完一球就变化
	var m_iWin = 0;						//胜利或失败 0失败 1胜利

	//==========================与界面交互=====================================
	void Init()
	{
		if(parent.m_RoomType == 2)
		{
			//p1昵称+能量
			//参数：见类定义
			staticvar s_P1_Head = new VRole_Name_Energy_D_Logic{valign = "100,0";}	

			//p2昵称+能量
			//参数：见类定义
			staticvar s_P2_Head = new VRole_Name_Energy_D_Logic{halign(2,-5);valign(7,0);}
		}
		else
		{
			//p1昵称+能量
			//参数：见类定义
			staticvar s_P1_Head = new VRole_Name_Energy_Logic{valign = "100,0";}	

			//p2昵称+能量
			//参数：见类定义
			staticvar s_P2_Head = new VRole_Name_Energy_Logic{halign(2,-6);valign(7,0);}
		}

		//比分
		//参数 data2:p1的分
		//参数 data3:P2的分
		staticvar s_P1vsP2Point = new VMyText{pos = "10,30";bgcolor = "#FFFFFF";}

		//基础提示信息
		staticvar s_BaseTipInfo = new VRole_BaseTipInfo_Logic{valign(50,0);halign(50,0);}

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

		//蓄力条
		//参数 data1: 0:默认 1:开始发球 2:发球结束
		staticvar s_StorePower = new VMyText{valign(90,0);halign(50,0);}

		//局分情况显示
		//参数 gamenum:总局数 1-n
		//参数 currnum:当前局 1-n,0为初始值
		//参数 winorlost:输赢 1表示输 2表示赢
		staticvar s_GameNum = new item{}

		//退出按钮
		staticvar s_Btn_Exit = new img{}
	}
	inclass("VGameVideoPlay_UI");
	//======================================================================
	//Init();

	void SetEvent()
	{
		set s_Btn_Exit
		{
			void OnClick()
			{
				window.find("UIController").LoadDLG(106);
			}
		}
	}

	//初始化：昵称+能量
	void Init_Name_Energy()
	{
		if(parent.m_RoomType == 2)
		{
			s_P1_Head.s_Name1.SetData("昵称:",parent.m_NkName1);
			s_P1_Head.s_Name2.SetData("昵称:",parent.m_NkName3);

			s_P2_Head.s_Name1.SetData("昵称:",parent.m_NkName2);
			s_P2_Head.s_Name2.SetData("昵称:",parent.m_NkName4);
		}
		else
		{
			s_P1_Head.s_NickName.SetData("昵称:",parent.m_NkName1,"");

			s_P2_Head.s_NickName.SetData("昵称:",parent.m_NkName2,"");
		}
		printf("昵称1："+parent.m_NkName1+",昵称2："+parent.m_NkName2);
	}
	
	//初始化:左上角比分
	void Init_Point()
	{
		s_P1vsP2Point.SetData("比分:",0,0);
	}
	
	//初始化：基础提示信息
	void Init_BaseTipInfo()
	{
		s_BaseTipInfo.s_ChangeGround.show = false;
		s_BaseTipInfo.s_GamePoint.show = false;
		s_BaseTipInfo.s_BreakPoint.show = false;
		s_BaseTipInfo.s_SetPoint.show = false;

		s_BaseTipInfo.s_GameNum.show = true;
		s_BaseTipInfo.s_Point.show = true;
	}

	//更新基础提示信息
	//参数：交换场地，局数, 破发点，局点/赛点 
	void UpData_BaseTipInfo(TipState1,GameNum,TipState2,TipState3)
	{
		if (window.g_DEBUG)
		{
			printf("yxf:基础提示-S：TipState1:"+TipState1+",GameNum:"+GameNum+",TipState2:"+TipState2+",TipState3:"+TipState3);
		}
		
		Hide_BaseTipInfo(true);
		Init_BaseTipInfo();

		if (TipState1 == 1)
		{
			s_BaseTipInfo.s_ChangeGround.show = true;
		}
		s_BaseTipInfo.s_GameNum.SetData("局数:",GameNum);
		s_BaseTipInfo.s_Point.SetData("",m_iP1Point,m_iP2Point);
		printf("B# wunan-录像比分:"+m_iP1Point+m_iP2Point);
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
	//录像一开始不会显示局数和比分所以添加
	void InitBaseTipInfo()
	{
		UpData_BaseTipInfo("",1,"","")
	}
	//显示/隐藏:基础提示信息
	void Hide_BaseTipInfo(param)
	{
		s_BaseTipInfo.show = param;
		if (!param)
		{
			s_TipCommon.SetEnd();
			window.find("GameInterface").ShowOver_Start();//新的一球开始提示结束了
		}
	}

	//更新右上角的比分
	void UpData_PointScore()
	{
		s_P1vsP2Point.SetData("比分:",m_iP1Point,m_iP2Point);
	}

	//更新右上角局分情况显示
	//参数 currnum:当前局 1-n,0为初始值
	//参数 winorlost:输赢 1表示输 2表示赢
	void UpData_GameNum(currnum,winorlost)
	{
		if (window.g_DEBUG)
		{
			printf("S-UpData_GameNum:gamenum:"+parent.m_GameNum+",currnum:"+currnum+",winorlost:"+winorlost);
		}
		s_GameNum.SetData(parent.m_GameNum,currnum,winorlost);
	}

	//设置局的比分
	//参数 iUserID:用户ID	GameScroe：局的比分
	void SetGameScore(RID,GameScore)
	{	
		if (RID == parent.m_RID1){m_iP1GameScore = GameScore;}
		if (RID == parent.m_RID2){m_iP2GameScore = GameScore;}
		UpData_PointScore();
	}
	//设置球的比分
	//参数 iUserID:用户ID	Point:比分
	void SetPoint(RID,Point)
	{
		if (window.g_DEBUG)
		{
			printf("S-SetPoint:设置球的比分:iUserID:"+RID+",Point:"+Point);
		}
		if (RID == parent.m_RID1){m_iP1Point = Point;}
		if (RID == parent.m_RID2){m_iP2Point = Point;}
		UpData_PointScore();
	}
	//更新 游戏一局结束 提示
	//参数 WinOrLost ；1表示输 2表示赢
	void UpData_OneGameEnd(WinOrLost)
	{
		if (window.g_DEBUG)
		{
			printf("游戏一局结束 提示-S:UpData_OneGameEnd:"+WinOrLost);
		}
		s_TipCommon.SetEnd();
	}
	//显示/隐藏：一球的普通结束:目前显示放在了UI做了，这里只做消失
	void Hide_CommonTip(param)
	{
		if (!param)
		{
			timer(window._Time_WaitBase,"Msg_BaseTipInfo");
		}
	}
	
	//蓄力条：操作
	//参数: 0:默认 1:开始发球 2:发球结束
	void UpData_StorePower(param,time,rid)
	{
		//s_StorePower.show = true;
		if (window.g_DEBUG)
		{
			printf("S-蓄力条：1:开始发球 2:发球结束："+param);
		}
		s_StorePower.SetData(param,"",rid);
	}

	//函数 UpData_CurrEnergy:更新当前能量/技能
	//参数 iUserID:用户ID
	//参数 CurrEnergy:当前能量
	//参数 BallInSelf：球的前后场位置
	//参数 MaxEnergy：最大能量
	void UpData_CurrEnergy(RID,CurrEnergy,BallInSelf,MaxEnergy)
	{
		if (window.g_DEBUG)
		{
			printf("Video-能量改变:iRID："+RID+",CurrEnergy:"+CurrEnergy+",BallInSelf:"+BallInSelf+",MaxEnergy:"+MaxEnergy);
		}
		var _Int_CurrEnergy = toint(CurrEnergy);
		// 段晓彤修改 增加双打/单打的判断
		if (parent.m_RoomType == 2)// 双打
		{
			if (RID == parent.m_RID1)	// 1和3是一队
			{
				//alert("P1--当前能量: "+_Int_CurrEnergy+"  最大能量: "+MaxEnergy);
				s_P1_Head.s_CurrEnergy.SetData("能量:",_Int_CurrEnergy,MaxEnergy, 1);
			}
			if (RID == parent.m_RID2)	// 2和4是一队
			{
				//alert("P2--当前能量: "+_Int_CurrEnergy+"  最大能量: "+MaxEnergy);
				s_P2_Head.s_CurrEnergy.SetData("能量:",_Int_CurrEnergy,MaxEnergy, 2);
			}
			if (RID == parent.m_RID3)
			{
				//alert("P3--当前能量: "+_Int_CurrEnergy+"  最大能量: "+MaxEnergy);
				s_P1_Head.s_CurrEnergy.SetData("能量:",_Int_CurrEnergy,MaxEnergy, 3);
			}
			if (RID == parent.m_RID4)
			{
				//alert("P4--当前能量: "+_Int_CurrEnergy+"  最大能量: "+MaxEnergy);
				s_P2_Head.s_CurrEnergy.SetData("能量:",_Int_CurrEnergy,MaxEnergy, 4);
			}
		}
		else// 单打
		{
			if (RID == parent.m_RID1)
			{
				s_P1_Head.s_CurrEnergy.SetData("能量:",_Int_CurrEnergy,MaxEnergy);
			}
			if (RID == parent.m_RID2)
			{
				s_P2_Head.s_CurrEnergy.SetData("能量:",CurrEnergy,MaxEnergy);
			}
		}
	}
	
	void OnCreated()
	{
		Init();
		SetEvent();

		//s_P1_Head.Init(window.GetUIDByName(parent.m_NkName1));
		//s_P2_Head.Init(window.GetUIDByName(parent.m_NkName2));
		s_P1_Head.Init(-1);
		s_P2_Head.Init(-1);

		s_BaseTipInfo.Init();
		UpData_GameNum(0,0);

		Init_Name_Energy(); 
		Init_Point();
		
		s_BaseTipInfo.show = false; //基础提示信息
		s_TipCommon.show = false;	//一球结束：普通
		s_StorePower.show = false;	//蓄力条

		InitDBBinding();
	}

	///////////////////////////////////////DB//////////////////////////////////////////
	//己方的记录
	var _VNet2DBRow1 = new VNet2DBRow
	{
		void InitDB()
		{
			InitByInt(window.M_G_CLINET,window.GAMESHOW,0,parent.parent.m_RID1,1);
			AddDBEvent("OnMyDataChange",0,1,3,5,6,7,8,9,11,12,13,14,15,26,27,28,30,32,41,42);
			printf("Video-P1-AddDBEvent:"+parent.parent.m_RID1);
			//注释掉的原因是不显示体力条了，2010年6月8日 yxf  （游戏中的界面有这几句也忘记为什么了，当初好像是有BUG）
			//SetInt(8,-1);
			//SetInt(32,-1);
			//SetInt(41,-1);
			//SetInt(42,-1);
		}
		//索引，0角色ID,1用户ID,3游戏状态,5第几局,6局的分数,7比分,8当前能量,9球的前后场,11提示状态1,12提示状态2,13提示状态3,14帅气的动作,15改变的索引,26发球事件
		//3 GameState:游戏状态 2:开始 3:正中进行 4:结束 5:结束后
		//11 TipState1:提示 0:没有交换场地 1.有
		//12 TipState2:提示 0:不是破发点 1.有
		//13 TipState3:提示 0:默认状态 1.局点 2.赛点
		//15 RefreshIndex:改变的索引 1.帅气的动作 2.局分 3.比赛前的数据 4:游戏开始 5:游戏结束
		//26 ServeEvent: 发球事件 0:默认 1:开始发球 2:发球结束
		//27 WinOrLost	一局输或者赢 1表示输 2表示赢 只通知自己那行记录 在RefreshIndex==2后清除
		//28 EndWinOrLost 一场比赛的输赢 0为默认 1表示输 2表示赢 在RefreshIndex==5后有效
		//32 MaxEnergy	最大的能量
		//41 CurrStamina 当前的体力
		//42 MaxStamina 最大的体力
		void OnMyDataChange(index,RoleID,UserID,GameState,GameNum,GameScore,Point,CurrEnergy,BallInSelf,
			TipState1,TipState2,TipState3,HandsomeAction,RefreshIndex,ServeEvent,WinOrLost,EndWinOrLost,
			TriggerTrainID,MaxEnergy,CurrStamina,MaxStamina)
		{	
			if (window.g_DEBUG)
			{
				printf("B# Video-P1:index:"+index+",RoleID:"+RoleID+",UserID:"+UserID+",GameState:"+GameState
				+",GameNum:"+GameNum+",GameScore:"+GameScore+",Point:"+Point
				+",CurrEnergy:"+CurrEnergy+",BallInSelf:"+BallInSelf
				+",TipState1:"+TipState1+",TipState2:"+TipState2+",TipState3:"+TipState3
				+",HandsomeAction:"+HandsomeAction+",RefreshIndex:"+RefreshIndex+",ServeEvent:"+ServeEvent
				+",WinOrLost:"+WinOrLost+",EndWinOrLost:"+EndWinOrLost+",TriggerTrainID:"+TriggerTrainID
				+",MaxEnergy:"+MaxEnergy+",CurrStamina:"+CurrStamina+",MaxStamina:"+MaxStamina);
			}
			// 段晓彤修改, 增加双打判断
			if (parent.parent.m_RoomType == 2)
				parent.s_P1_Head.s_Stamina.SetData("当前体力:",CurrStamina,MaxStamina, 1);
			else
				parent.s_P1_Head.s_Stamina.SetData("当前体力:",CurrStamina,MaxStamina);
			switch (index)
			{
				case 6:{parent.SetGameScore(RoleID,GameScore);break;}
				case 7:{parent.SetPoint(RoleID,Point);break;}
				case 8:{parent.UpData_CurrEnergy(RoleID,CurrEnergy,BallInSelf,MaxEnergy);break;}
				case 9:{parent.UpData_CurrEnergy(RoleID,CurrEnergy,BallInSelf,MaxEnergy);break;}
				case 15:
				{
					if (RefreshIndex == 1)//1.帅气的动作
					{
						parent.UpData_SpecTip_1(HandsomeAction);break;
					}
					if (RefreshIndex == 2)//2.局分
					{
						parent.UpData_OneGameEnd(WinOrLost);
						parent.UpData_GameNum(GameNum,WinOrLost);
						break;
					}
					if (RefreshIndex == 3)//3.比赛前的数据
					{
						parent.UpData_BaseTipInfo(TipState1,GameNum,TipState2,TipState3);
						break;
					}
					if (RefreshIndex == 4)//4:游戏开始
					{
						break;
					}
				}
				case 26:
				{
					parent.UpData_StorePower(ServeEvent,"",RoleID);
					break;
				}
				case 32:
				{
					parent.s_P1_Head.s_CurrEnergy.SetData("当前能量:",0,MaxEnergy);
					break;
				}
				case 41:
				{
					if	(parent.parent.m_RoomType == 2)
						parent.s_P1_Head.s_Stamina.SetData("当前体力:",CurrStamina,MaxStamina, 1);
					else
						parent.s_P1_Head.s_Stamina.SetData("当前体力:",CurrStamina,MaxStamina);
					break;
				}
				case 42:
				{
					if	(parent.parent.m_RoomType == 2)
						parent.s_P1_Head.s_Stamina.SetData("当前体力:",CurrStamina,MaxStamina,1);
					else
						parent.s_P1_Head.s_Stamina.SetData("当前体力:",CurrStamina,MaxStamina);
					break;
				}
			}
		}
	}
	//他方的记录
	var _VNet2DBRow2 = new VNet2DBRow
	{
		void InitDB()
		{
			InitByInt(window.M_G_CLINET,window.GAMESHOW,0,parent.parent.m_RID2,1);
			AddDBEvent("OnOtherDataChange",0,1,6,7,8,9,14,15,26,32,41,42);
			printf("Video-P2-AddDBEvent:"+parent.parent.m_RID2);
			//注释掉的原因是不显示体力条了，2010年6月8日 yxf  （游戏中的界面有这几句也忘记为什么了，当初好像是有BUG）
//			SetInt(8,-1);
//			SetInt(32,-1);
//			SetInt(41,-1);
//			SetInt(42,-1);
		}		
		//索引，0角色ID,1用户ID,6局的分数,7比分,8当前能量,9球的前后场,14帅气的动作,15改变的索引
		void OnOtherDataChange(index,RoleID,UserID,GameScore,Point,CurrEnergy,BallInSelf,
			HandsomeAction,RefreshIndex,ServeEvent,MaxEnergy,CurrStamina,MaxStamina)
		{
			if (window.g_DEBUG)
			{
				printf("B# Video-P2:index:"+index+",RoleID:"+RoleID+",UserID:"+UserID
				+",GameScore:"+GameScore+",Point:"+Point+",CurrEnergy:"+CurrEnergy
				+",BallInSelf:"+BallInSelf+",HandsomeAction:"+HandsomeAction+",RefreshIndex:"+RefreshIndex+",ServeEvent:"+ServeEvent
				+",MaxEnergy:"+MaxEnergy+",CurrStamina:"+CurrStamina+",MaxStamina:"+MaxStamina);
			}
			//段晓彤修改 增加双打判断
			if	(parent.parent.m_RoomType == 2)
				parent.s_P2_Head.s_Stamina.SetData("当前体力:",CurrStamina,MaxStamina, 2);
			else
				parent.s_P2_Head.s_Stamina.SetData("当前体力:",CurrStamina,MaxStamina);

			switch (index)
			{
				case 6:{parent.SetGameScore(RoleID,GameScore);break;}
				case 7:{parent.SetPoint(RoleID,Point);break;}
				case 8:{parent.UpData_CurrEnergy(RoleID,CurrEnergy,BallInSelf,MaxEnergy);break;}
				case 9:{parent.UpData_CurrEnergy(RoleID,CurrEnergy,BallInSelf,MaxEnergy);break;}
				case 15:
				{
					if (RefreshIndex == 1)//1.帅气的动作
					{
						parent.UpData_SpecTip_2(HandsomeAction);
					}
					break;
				}
				case 26:
				{
					parent.UpData_StorePower(ServeEvent,"",RoleID);
					break;
				}
				case 41:
				{
					if	(parent.parent.m_RoomType == 2)
						parent.s_P2_Head.s_Stamina.SetData("当前体力:",CurrStamina,MaxStamina, 2);
					else
						parent.s_P2_Head.s_Stamina.SetData("当前体力:",CurrStamina,MaxStamina);
					break;
				}
				case 42:
				{
					if	(parent.parent.m_RoomType == 2)
						parent.s_P2_Head.s_Stamina.SetData("当前体力:",CurrStamina,MaxStamina, 2);
					else
						parent.s_P2_Head.s_Stamina.SetData("当前体力:",CurrStamina,MaxStamina);
					break;
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
	}
	//己方P3的记录
	var _VNet2DBRow3 = new VNet2DBRow
	{
		void InitDB()
		{
			InitByInt(window.M_G_CLINET,window.GAMESHOW,0,parent.parent.m_RID3,1);
			AddDBEvent("OnP3DataChange",0,1,6,7,8,9,14,15,26,32,33,41,42);
//			SetInt(8,-1);
//			SetInt(32,-1);
//			SetInt(41,-1);
//			SetInt(42,-1);
		}		
		//索引，14帅气的动作,15改变的索引
		void OnP3DataChange(index,RoleID,UserID,GameScore,Point,CurrEnergy,BallInSelf,
			HandsomeAction,RefreshIndex,ServeEvent,MaxEnergy,ServeTime,CurrStamina,MaxStamina)
		{
			if (window.g_DEBUG)
			{
				printf("B# P3:index:"+index+",HandsomeAction:"+HandsomeAction+",RefreshIndex:"+RefreshIndex+",ServeEvent:"+ServeEvent);
			}
			parent.s_P1_Head.s_Stamina.SetData("当前体力:",CurrStamina,MaxStamina,3);
			switch (index)
			{
				case 8:
				{
					parent.UpData_CurrEnergy(RoleID,CurrEnergy,BallInSelf,MaxEnergy);
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
			InitByInt(window.M_G_CLINET,window.GAMESHOW,0,parent.parent.m_RID4,1);
			AddDBEvent("OnP4DataChange",0,1,6,7,8,9,14,15,26,32,33,41,42);
//			SetInt(8,-1);
//			SetInt(32,-1);
//			SetInt(41,-1);
//			SetInt(42,-1);
		}		
		//索引，14帅气的动作,15改变的索引
		void OnP4DataChange(index,RoleID,UserID,GameScore,Point,CurrEnergy,BallInSelf,
			HandsomeAction,RefreshIndex,ServeEvent,MaxEnergy,ServeTime,CurrStamina,MaxStamina)
		{
			if (window.g_DEBUG)
			{
				printf("B# P4:index:"+index+",HandsomeAction:"+HandsomeAction+",RefreshIndex:"+RefreshIndex+",ServeEvent:"+ServeEvent);
			}
			parent.s_P2_Head.s_Stamina.SetData("当前体力:",CurrStamina,MaxStamina,4);
			switch (index)
			{
				case 8:
				{
					parent.UpData_CurrEnergy(RoleID,CurrEnergy,BallInSelf,MaxEnergy);
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

	//得到错过的数据 2010年6月7日 yxf
	void GetMissData()
	{
		if (_VNet2DBRow1.IsReady())
		{
			var _Point1 = _VNet2DBRow1.GetData(window.M_G_CLINET_GAMESHOW_POINT);
			//printf("P1:GetMissData():_Point1:"+_Point1);
			SetPoint(parent.m_RID1,_Point1);
			
			var _Point2 = _VNet2DBRow2.GetData(window.M_G_CLINET_GAMESHOW_POINT);
			//printf("P1:GetMissData():_Point2:"+_Point2);
			SetPoint(parent.m_RID2,_Point2);

			var _GameScore = _VNet2DBRow1.GetData(window.M_G_CLINET_GAMESHOW_MISSGAMENUM);
			var _num = window.GetSplitCount(_GameScore,",");
			if (toint(_num) > 0)
			{
				var _arr = window.SplitStr2(_GameScore,",",_num);
				var _i = 0;
				while (_i < _num)
				{
					UpData_GameNum(_i+2,toint(_arr[_i]));
					_i += 1;
				}
			}
			// 段晓彤修改, 
			if (parent.m_RoomType == 2)// 双打
			{
				// P1和P3的当前能量
				var _CurrEnergy1 = _VNet2DBRow1.GetData(window.M_G_CLINET_GAMESHOW_CURRENERGY);
				var _CurrEnergy3 = _VNet2DBRow3.GetData(window.M_G_CLINET_GAMESHOW_CURRENERGY);
				// P1和P3的最大能量
				var _MaxEnergy1 = _VNet2DBRow1.GetData(window.M_G_CLINET_GAMESHOW_MAXENERGY);
				var _MaxEnergy3 = _VNet2DBRow3.GetData(window.M_G_CLINET_GAMESHOW_MAXENERGY);
				// P1和P3的当前体力
				var _CurrStamina1 = _VNet2DBRow1.GetData(window.M_G_CLINET_GAMESHOW_CURRSTAMINA);
				var _CurrStamina3 = _VNet2DBRow3.GetData(window.M_G_CLINET_GAMESHOW_CURRSTAMINA);
				// P1和P3的最大体力
				var _MaxStamina1 = _VNet2DBRow1.GetData(window.M_G_CLINET_GAMESHOW_MAXSTAMINA);
				var _MaxStamina3 = _VNet2DBRow3.GetData(window.M_G_CLINET_GAMESHOW_MAXSTAMINA);

				UpData_CurrEnergy(parent.m_RID1,_CurrEnergy1,0,_MaxEnergy1);				// P1能量
				UpData_CurrEnergy(parent.m_RID2,_CurrEnergy2,0,_MaxEnergy2);				// P2能量
				UpData_CurrEnergy(parent.m_RID3,_CurrEnergy3,0,_MaxEnergy3);				// P3能量
				UpData_CurrEnergy(parent.m_RID4,_CurrEnergy4,0,_MaxEnergy4);				// P1能量

				// P2和P4的当前能量
				var _CurrEnergy2 = _VNet2DBRow2.GetData(window.M_G_CLINET_GAMESHOW_CURRENERGY);
				var _CurrEnergy4 = _VNet2DBRow4.GetData(window.M_G_CLINET_GAMESHOW_CURRENERGY);
				// P2和P4的最大能量
				var _MaxEnergy2 = _VNet2DBRow2.GetData(window.M_G_CLINET_GAMESHOW_MAXENERGY);
				var _MaxEnergy4 = _VNet2DBRow4.GetData(window.M_G_CLINET_GAMESHOW_MAXENERGY);
				// P2和P4的当前体力
				var _CurrStamina2 = _VNet2DBRow2.GetData(window.M_G_CLINET_GAMESHOW_CURRSTAMINA);
				var _CurrStamina4 = _VNet2DBRow4.GetData(window.M_G_CLINET_GAMESHOW_CURRSTAMINA);
				// P2和P4的最大体力
				var _MaxStamina2 = _VNet2DBRow2.GetData(window.M_G_CLINET_GAMESHOW_MAXSTAMINA);
				var _MaxStamina4 = _VNet2DBRow4.GetData(window.M_G_CLINET_GAMESHOW_MAXSTAMINA);

				s_P1_Head.s_Stamina.SetData("当前体力:",_CurrStamina1,_MaxStamina1,1);				// P1体力
				s_P2_Head.s_Stamina.SetData("当前体力:",_CurrStamina2,_MaxStamina2,2);				// P2体力
				s_P1_Head.s_Stamina.SetData("当前体力:",_CurrStamina3,_MaxStamina3,3);				// P3体力
				s_P2_Head.s_Stamina.SetData("当前体力:",_CurrStamina4,_MaxStamina4,4);				// P4体力
				
				//alert("P1当前能量:"+_CurrEnergy1+"  "+"最大能量:"+_MaxEnergy1);
				//alert("P2当前能量:"+_CurrEnergy2+"  "+"最大能量:"+_MaxEnergy2);
				//alert("P3当前能量:"+_CurrEnergy3+"  "+"最大能量:"+_MaxEnergy3);
				//alert("P4当前能量:"+_CurrEnergy4+"  "+"最大能量:"+_MaxEnergy4);
			}
			else
			{
				var _CurrEnergy = _VNet2DBRow1.GetData(window.M_G_CLINET_GAMESHOW_CURRENERGY);// 当前能量
				var _MaxEnergy = _VNet2DBRow1.GetData(window.M_G_CLINET_GAMESHOW_MAXENERGY);// 最大能量
				UpData_CurrEnergy(parent.m_RID1,_CurrEnergy,0,_MaxEnergy);

				var _CurrEnergy2 = _VNet2DBRow2.GetData(window.M_G_CLINET_GAMESHOW_CURRENERGY);// 当前能量
				var _MaxEnergy2 = _VNet2DBRow2.GetData(window.M_G_CLINET_GAMESHOW_MAXENERGY);// 最大能量
				UpData_CurrEnergy(parent.m_RID2,_CurrEnergy2,0,_MaxEnergy2);

				var _CurrStamina = _VNet2DBRow1.GetData(window.M_G_CLINET_GAMESHOW_CURRSTAMINA);// 当前体力
				var _MaxStaminay = _VNet2DBRow1.GetData(window.M_G_CLINET_GAMESHOW_MAXSTAMINA);// 最大体力
				s_P1_Head.s_Stamina.SetData("当前体力:",_CurrStamina,_MaxStaminay);

				var _CurrStamina2 = _VNet2DBRow2.GetData(window.M_G_CLINET_GAMESHOW_CURRSTAMINA);// 当前体力
				var _MaxStaminay2 = _VNet2DBRow2.GetData(window.M_G_CLINET_GAMESHOW_MAXSTAMINA);// 最大体力
				s_P2_Head.s_Stamina.SetData("当前体力:",_CurrStamina2,_MaxStaminay2);
			}
		}
	}
};