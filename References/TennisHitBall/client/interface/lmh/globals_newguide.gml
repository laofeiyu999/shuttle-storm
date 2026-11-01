//
//新的引导相关
//2010年9月15日 yxf

set window
{
	var g_ForceGuideState = 0;	//强制引导状态 0默认不在 1在
	
	//[功能]设置强制引导状态
	//[参数]param:0不在 1在
	void SetForceGuideState(param)
	{
		window.g_ForceGuideState = param;
	}

	//[功能]得到强制引导状态
	//[参数]param:0不在 1在
	void GetForceGuideState(param)
	{
		return window.g_ForceGuideState;
	}


	//[功能]强制引导的遮罩
	//[参数]btnname：按钮的名字-字符串 如"btn_name"
	void CXF_NewGuide(btnname)
	{
		//需要引导的人 把训练记住的变量重新初始化
		window.SetTrainChannel(window.G_TRAINCHANNEL_1_YOUNG);
		window.SetForceGuideState(1);//进引导

		set window
		{
			new VGuideCapture_New
			{
				Init(btnname);
			}
		}
		window.LMH1_DelFucklayer();
	}

	//[功能]删除-强制引导的遮罩
	void CXF_DelGuide()
	{
		window.find("VGuideCapture_New_Name").del();
	}
	
	//[功能]点击了测试的引导
	void CXF_Guide_tBtnName_Test_New1()
	{
		alert("测试强制引导");
	}
	
	//[功能]大厅界面删除时调用
	void CXF_OnHallUIDeleted()
	{
		window.find("VGuideCapture_New_Name").del();
	}

	//[功能]点击了跳过图片
	void CXF_Guide_OnClick_Jump()
	{
		window.find("PACK_LOGIC").del();//关闭背包
		window.OnClick_BTN_GameHall(); //打牌普通比赛
		window.CXF_DelGuide();
		window.find("eventCounter").AddEventCount(window.EVENTCOUNT_FIN_mail_getgift);
		window.find("eventCounter").Guide_Mailgiftget = window.find("eventCounter").GetEventCount(window.EVENTCOUNT_FIN_mail_getgift);
		window.find("eventCounter").AddEventCount(window.EVENTCOUNT_FIN_pack_gitfopen);
		window.find("eventCounter").Guide_Packgift = window.find("eventCounter").GetEventCount(window.EVENTCOUNT_FIN_pack_gitfopen);
		window.find("eventCounter").AddEventCount(window.EVENTCOUNT_FIN_guidetrainover);
		window.find("eventCounter").Guide_Guideend = window.find("eventCounter").GetEventCount(window.EVENTCOUNT_FIN_guidetrainover);
		printf("C# 引导：CXF_Guide_OnClick_Jump（）；"+window.find("eventCounter").Guide_Guideend);
	}

	//[功能]训练完成的提示框弹出时调用
	//[参数]_trainid:训练ID
	void CXF_OnTrainOver_DLG(_trainid)
	{
		var LV = window.GetLVByUID();
		var EXP = window.GetCurExpByUID();
		printf("=======陈雪峰-强制引导:playerLV:"+LV);
		printf("========陈雪峰-强制引导:playerEXP:"+EXP);
		printf("陈雪峰-强制引导:CXF_OnTrainOver_DLG():"+_trainid);
		if (_trainid == 2 && window.find("eventCounter").Guide_Trainbegin == 0 && LV == 1 && EXP == 40)
		{
			//训练完成
			window.find("eventCounter").AddEventCount(window.EVENTCOUNT_FIN_enter_trainhall);
			window.find("eventCounter").Guide_Trainbegin = window.find("eventCounter").GetEventCount(window.EVENTCOUNT_FIN_enter_trainhall);
			printf("C# =======引导=======Guide_Trainbegin:" +window.find("eventCounter").Guide_Trainbegin);
			//弹出对”训练“完成提示框“返回大厅”按钮的引导
			window.CXF_NewGuide("tBtnName_Train_ontrainover");
		}
		return;
	}
	//点击了某个引导调用的系列函数
	
	//[功能]进入大厅时调用
	//[参数]type:1强制训练完成后进大厅 2直接进大厅
	void CXF_ShowHallUI(type)
	{
		var playerLV = window.GetLVByUID();
		var playerEXP = window.GetCurExpByUID();
		var _sex3 = window.GetMySex();
		var boyrocketnumber = window.GetItemNumByEnterID(1105002);
		var girlrocketnumber = window.GetItemNumByEnterID(2105010);
		printf("陈雪峰-强制引导:CXF_ShowHallUI():"+type);
		printf("陈雪峰-强制引导:playerLV:"+playerLV);
		printf("陈雪峰-强制引导:playerEXP:"+playerEXP);
		if(type == 1 )
		{ 
			printf("C# =====引导=====强制训练完成开始强制引导");
			window.CXF_NewGuide("tBtnName_Task_Entermission");
			return;
		}
		if(type == 2 )
		{
			printf("C# =====引导======Guide_Guideend：" +window.find("eventCounter").Guide_Guideend);
			if (window.find("eventCounter").Guide_Guideend == 1 && window.find("eventCounter").GetEventCount(window.EVENTCOUNT_FIN_openhelp) == 0)
			{
				printf("C# =======引导=====结束");
				timer(100,"window.OpenHelp(100017)");
				window.find("eventCounter").AddEventCount(window.EVENTCOUNT_FIN_openhelp);
				printf("C# =======引导=======openhelp:" +openhelp);
				return;
			}
			printf("C# =====引导======Guide_Missionbegin:" +window.find("eventCounter").Guide_Missionbegin);
			printf("C# ======引导======playerLV:" +playerLV +"  playerEXP:"+playerEXP);
			if (window.find("eventCounter").Guide_Missionbegin == 0 &&	playerLV == 1 && playerEXP == 0 )
			{	
				printf("C# =====引导=====开始强制引导");
				window.CXF_NewGuide("tBtnName_Task_Entermission");
				return;
			}
			printf("C# =====引导=======Guide_Trainbegin:" +window.find("eventCounter").Guide_Trainbegin);
			if (window.find("eventCounter").Guide_Trainbegin == 0 && playerLV == 1 && playerEXP == 0 )
			{
				printf("C# =====引导=====从训练开始强制引导");
				window.CXF_NewGuide("tBtnName_Train_Entertrain");
				return;
			}
			if (window.find("eventCounter").Guide_Missionsec == 0 && playerLV == 1 && playerEXP == 40 )
			{
				printf("C# =====引导=====从完成任务大厅开始强制引导");
				window.CXF_NewGuide("tBtnName_Task_mission");
				return;
			}
			if (window.find("eventCounter").Guide_Shopbegin == 0 && playerLV == 1 && playerEXP == 90)
			{	
				printf("C# =====引导=====从进入商城购买球拍开始强制引导");
				window.CXF_NewGuide("tBtnName_Shop_Entershop");
				return;
			}
			if (window.find("eventCounter").Guide_Shoprocketbegin == 0 && playerLV == 1 && playerEXP == 90)
			{
				printf("C# =====引导=====从进入商城购买技能开始强制引导");
				window.CXF_NewGuide("tBtnName_Shop_Entershop");
				return;
			}
			if ( boyrocketnumber == 0 || girlrocketnumber == 0)
			{
				window.find("eventCounter").AddEventCount(window.EVENTCOUNT_FIN_openhelp);
				printf(" C#  =========引导 ============球拍过期不再进行引导")
				if (window.find("eventCounter").Guide_Pckracketon == 0 && playerLV == 1 && playerEXP == 90)
				{
					printf("C# =====引导=====从进入背包开始强制引导");
					window.CXF_NewGuide("tBtnName_Pack_firstpage");
					return;
				}
				return;
			}
			if (window.find("eventCounter").Guide_Packskillon == 0 && playerLV == 1 && playerEXP == 90)
			{
				printf("C# =====引导=====从进入背包开始强制引导");
				window.CXF_NewGuide("tBtnName_Pack_firstpage");
				return;				
			}

//				//点击商城。强制引导亮块
//				void CXF_Guide_Entershop();
//				{
//					//进入商城
//					window.OnClick_BTN_Mall();
//					//弹出对“金币区”的引导
//					window.CXF_NewGuide("tBtnName_Shop_goldshop");
//				}
//				//点击金币区，强制引导亮块
//				void CXF_Guide_Entergold()
//				{
//					//进入金币区
//					window.FQ_OnClick_Mall_GoldBuy_Btn();
//					//弹出对“技能商城技能”的引导
//					window.CXF_NewGuide("tBtnName_Shop_skill");
//				}
//				return;
//			}
//			if (window.find("eventCounter").Guide_Pckracketon == 0 && playerLV == 1 && playerEXP == 90 )
//			{
//				printf("C# =====引导=====从打开背包装备球拍开始强制引导");
//				window.CXF_NewGuide("tBtnName_Pack_firstpage");
//				return;
//			}
//			if (window.find("eventCounter").Guide_Packskillon == 0 && playerLV == 1 && playerEXP == 90)
//			{
//				printf("C# =====引导=====从打开背包装备技能开始强制引导");
//				window.CXF_NewGuide("tBtnName_Pack_firstpage");
////				void CXF_Guide_Enterpack()
////				{
//					//进入背包
//					window.OnClick_BTN_Pack();
//					//弹出对“背包技能”的引导
//					window.CXF_NewGuide("tBtnName_Pack_Skillpack");
//				}
//				return;
//			}
//			if (window.find("eventCounter").Guide_Mailgiftget == 0 && playerLV == 1 && playerEXP == 90)
//			{
//				printf("C# =====引导=====从邮件界面开始强制引导");
//				window.CXF_NewGuide("tBtnName_Mail_Entermail");
//				return;
//			}
//			if (window.find("eventCounter").Guide_Mailbegin == 0)
//			{
//				printf("C# =====引导=====从邮件界面开始强制引导");
//				window.CXF_NewGuide("tBtnName_Pack_choosejump");
//				return;
//			}
//			if (window.find("eventCounter").Guide_Packgift == 0 && playerLV == 1 && playerEXP == 90)
//			{
//				printf("C# =====引导=====从礼包进入背包开始强制引导");
//				window.CXF_NewGuide("tBtnName_Pack_Secondtime");
//				return;
//			}
			if (window.find("eventCounter").Guide_Guideend != 0 )
			{
				window.CXF_DelGuide();
				return;
			}
		}
	}




//-------------强制引导-------
/*完成新手教学训练后，进入大厅，开始强制引导。引导中右键
流程为任务-训练-任务-商城-背包（球拍）-邮件-背包（道具）-背包（技能）-背包（属性）
强制引导为线性流程，最后关闭背包进入普通比赛大厅结束强制引导，同时右键开启。
*/

	//玩家完成新手教学训练进入大厅
	void Guide_Hall()
	{
		printf("C# =====引导=====强制训练之前引导流程结束 开始接受任务的引导");
		window.find("eventCounter").AddEventCount(window.EVENTCOUNT_FIN_enter_channelchoose);//强制训练之前的引导以收到奖励为终结
		window.find("eventCounter").Guide_m = window.find("eventCounter").GetEventCount(window.EVENTCOUNT_FIN_enter_channelchoose);
	}

		//点击了任务按钮，强制引导亮块
	void CXF_Guide_EnterTask();
	{
		//1 打开任务界面
		window.OnClick_BTN_Task();
		//2 弹出任务列表的强制引导
		window.CXF_NewGuide("tBtnName_Mission_Choosemission");
	}

	//点击了任务列表强制引导亮块
	void CXF_Guide_SelectTastList()
	{
		//1 选中此任务
		window.FQ_CheckSelect_TaskList_ByID(41);
		//2 弹出对“接受任务“按钮的引导
		window.CXF_NewGuide("tBtnName_Mission_Getmission");
	}
	//点击了接受任务按钮强制引导亮块
	void CXF_Guide_Getmission()
	{
		//1 点击接受任务按钮
		window.FQ_OnClick_Normal_AcceptTask_Btn();
		window.find("eventCounter").AddEventCount(window.EVENTCOUNT_FIN_accept_mission);
		window.find("eventCounter").Guide_Missionbegin = window.find("eventCounter").GetEventCount(window.EVENTCOUNT_FIN_accept_mission);
//		window.find("HALLGCMap").find("self").SendEventInfo();
//		window.find("HALLGCMap").find("IAMISSELF").parent.find("self").SendEventInfo();
		printf("C# =======引导=======Guide_Missionbegin:" +window.find("eventCounter").Guide_Missionbegin);
		//2 弹出对”训练“按钮的引导
		window.CXF_NewGuide("tBtnName_Train_Entertrain");
	}


	//点击训练按钮，强制引导亮块
	void CXF_Guide_Entertrain()
	{
		//1 点击训练按钮
		window.OnClick_BTN_Train();
		//2 弹出对”上旋训练“亮块的引导
		window.CXF_NewGuide("tBtnName_Train_Firsttrain");
	}

	//点击选中训练，强制引导亮块
	void CXF_Guide_SelectTrainList()
	{
		//1 选中此训练
		window.FQ_CheckSelect_TrainList_ByID();
		//2 弹出对”进入训练“亮块的引导
		window.CXF_NewGuide("tBtnName_Train_Choosetrain");
	}
	//点击进入训练按钮，强制引导亮块
	void CXF_Guide_Gettrain()
	{
		//1 点击”进入训练“按钮，
		window.FQ_OnClick_Train_BeginTrain_Btn();
		//2 弹出对“训练按钮”的引导
		window.CXF_NewGuide("tBtnName_Train_Gettrain");
	}
	//点击确定按钮，强制引导亮块
	void CXF_Guide_INtrain()
	{
		//点击“确定按钮”进入训练场
		window.FQ_OnClick_TrainDesc_Train_Btn();
	}

	//点击返回大厅，强制引导亮块
	void CXF_Guide_Backhall()
	{
		//1 点击确定按钮
		window.FQ_OnClick_TrainOver_BackToHall_Btn();
		//2 弹出对”任务”亮块的引导
		window.CXF_NewGuide("tBtnName_Task_mission");
	}
	//进入任务界面，强制引导亮块
	void CXF_Guide_ReadyMission()
	{
		//进入任务界面 
		window.OnClick_BTN_Task();
		//弹出对“选中任务”的引导
		window.CXF_NewGuide("tBtnName_Mission_readymission");
	}
	//选中任务，强制引导亮块
	void CXF_Guide_Readychomissionlist()
	{
		//选中任务
		window.FQ_CheckSelect_TaskList_ByID(41);
		//弹出对“交任务”的引导
		window.CXF_NewGuide("tBtnName_Mission_readypaytask");
	}
	//交付任务，强制引导亮块
	void CXF_Guide_Paymission()
	{
		//交任务
		window.FQ_OnClick_Normal_CompleteTask_Btn();
		window.find("eventCounter").AddEventCount(window.EVENTCOUNT_FIN_submit_mission);
		window.find("eventCounter").Guide_Missionsec = window.find("eventCounter").GetEventCount(window.EVENTCOUNT_FIN_submit_mission);
//		window.find("HALLGCMap").find("self").SendEventInfo();
		//弹出对“商城”的引导
		window.CXF_NewGuide("tBtnName_Shop_Entershop");
	}
	//点击商城。强制引导亮块
	void CXF_Guide_Entershop()
	{
		//进入商城
		window.OnClick_BTN_Mall();
		//弹出对“金币区”的引导
		window.CXF_NewGuide("tBtnName_Shop_goldshop");
	}
	//点击金币区，强制引导亮块
	void CXF_Guide_Entergold()
	{
		//进入金币区
		window.FQ_OnClick_Mall_GoldBuy_Btn();
		if (window.find("eventCounter").Guide_Shopbegin == 0)
		{
			//弹出对“球拍界面”的引导
			window.CXF_NewGuide("tBtnName_Shop_goldracket");
		}
		else
			//弹出对“技能界面”的引导
			window.CXF_NewGuide("tBtnName_Shop_skill");
	}
	//进入球拍界面，强制引导亮块
	void CXF_Guide_Entershracket()
	{
		//进入球拍界面
		window.FQ_OnClick_Mall_GoldBuy_Packet_Btn();
		//弹出对购买球拍的引导
		var _sex0 =window.GetMySex();
		if (_sex0 == 1)
		{
			window.CXF_NewGuide("tBtnName_Shop_racketonboy");
		}
		else
			window.CXF_NewGuide("tBtnName_Shop_racketongirl");
	}
	//选择球拍，强制引导亮块
	void CXF_Guide_Chooseracket()
	{
		var _sex1 = window.GetMySex(); 
		if (_sex1 == 1)
		{
			//选中球拍
			window.FQ_CheckSelect_MallGoodsList_ByID(1105002);//男球拍ID
			//弹出对“购买球拍”的引导
			window.CXF_NewGuide("tBtnName_Shop_shopgetracketboy");
		}
		else
		{
			//选中球拍
			window.FQ_CheckSelect_MallGoodsList_ByID(2105010);//女球拍ID
			//弹出对“购买球拍”的引导
			window.CXF_NewGuide("tBtnName_Shop_shopgetracketgirl");
		}
	}
	//点击购买，强制引导亮块
	void CXF_Guide_Getgoldracket()
	{
		//点击购买球拍
		window.FQ_OnClick_Mall_Buy_Btn();
		//弹出对“购物车购买”的引导
		window.CXF_NewGuide("tBtnName_Shop_shopcarracket");
	}
	//点击购物车购买，强制引导亮块
	void CXF_Guide_Getcarracket()
	{
		//点击购买
		window.FQ_OnClick_Mall_BuyCar_Confirm_Btn();
		window.find("eventCounter").AddEventCount(window.EVENTCOUNT_FIN_buy_racket);
		window.find("eventCounter").Guide_Shopbegin = window.find("eventCounter").GetEventCount(window.EVENTCOUNT_FIN_buy_racket);
//		window.find("HALLGCMap").find("self").SendEventInfo();
		//弹出对“商城技能界面“的引导
	
		window.CXF_NewGuide("tBtnName_Shop_skill");
	}
	//点击商城技能界面，强制引导亮块
	void CXF_Guide_Entershskill()
	{
		//点击商城技能界面
		window.FQ_OnClick_Mall_GoldBuy_Skill_Btn();
		//弹出对“C型技能球”的引导
		window.CXF_NewGuide("tBtnName_Shop_shoponskill");
	}
	//点击选中技能球，强制引导亮块
	void CXF_Guide_Chooseskill()
	{
		//点击选中技能球
		window.FQ_CheckSelect_MallGoodsList_ByID(40001);
		//弹出对“购买技能”的引导
		window.CXF_NewGuide("tBtnName_Shop_shopgetskill");
	}
	//点击商城购买，强制引导亮块
	void CXF_Guide_Getgoldskill()
	{
		//点击商城购买
		window.FQ_OnClick_Mall_Buy_Btn();
		//弹出对“购物车确定按钮”的引导
		window.CXF_NewGuide("tBtnName_Shop_shopcarskill");
	}
	//点击购物车购买，强制引导亮块
	void CXF_Guide_Getcarskill()
	{
		//点击购物车购买按钮
		window.FQ_OnClick_Mall_BuyCar_Confirm_Btn();
		window.find("eventCounter").AddEventCount(window.EVENTCOUNT_FIN_buy_skill);
		window.find("eventCounter").Guide_Shoprocketbegin = window.find("eventCounter").GetEventCount(window.EVENTCOUNT_FIN_buy_skill);
//		window.find("HALLGCMap").find("self").SendEventInfo();
		//弹出对”背包“的引导
		window.CXF_NewGuide("tBtnName_Pack_firstpage");
	}
	

	//点击背包，强制引导亮块
	void CXF_Guide_Enterpack()
	{
		//进入背包
		window.OnClick_BTN_Pack();
		printf("C# =====引导======Guide_Pckracketon1:" +window.find("eventCounter").Guide_Pckracketon);
		if (window.find("eventCounter").Guide_Pckracketon == 0)
		{
			//弹出对"球拍界面"的引导
			window.CXF_NewGuide("tBtnName_Pack_packracket");				
		}
		else
		{
			//弹出对背包技能界面的引导
			window.CXF_NewGuide("tBtnName_Pack_Skillpack");	
		}
	}
	//点击球拍界面，强制引导亮块
	void CXF_Guide_Enterpackracket()
	{
		//进入背包球拍界面
		window.find("PACK_LOGIC")._VPack_Logic.Check_UnCheck(3);
		var _sex2 = window.GetMySex(); 
		if (_sex2 == 1)
		{
			//弹出对”装备男球拍“的引导
			window.CXF_NewGuide("tBtnName_Pack_readyracketboy");
		}
		else
		{
			//弹出对”装备女球拍“的引导
			window.CXF_NewGuide("tBtnName_Pack_readyracketgirl");
		}
	}
	//装备球拍，强制引导亮块
	void CXF_Guide_Getracket()
	{
		//双击装备球拍
		window.FQ_OnClick_PackList_First();//第一个球拍
		window.find("eventCounter").AddEventCount(window.EVENTCOUNT_FIN_equip_racket);
		window.find("eventCounter").Guide_Pckracketon = window.find("eventCounter").GetEventCount(window.EVENTCOUNT_FIN_equip_racket);
//		window.find("HALLGCMap").find("self").SendEventInfo();
		printf("C# ======引导=====Guide_Pckracketon:"+window.find("eventCounter").Guide_Pckracketon);
		//弹出对背包技能界面的引导
		window.CXF_NewGuide("tBtnName_Pack_Skillpack");
	}
	//点击背包技能界面，强制引导亮块
	void CXF_Guide_Enterpackskill()
	{
		//点击背包技能界面
		window.find("PACK_LOGIC")._VPack_Logic.Check_UnCheck(4);
		//弹出对”装备技能“的引导
		window.CXF_NewGuide("tBtnName_Pack_getskill");
	}
	//双击装备技能，强制引导亮块
	void CXF_Guide_Getskill()
	{
		//装备技能
		window.FQ_OnClick_PackList_First(40001);
		window.find("eventCounter").AddEventCount(window.EVENTCOUNT_FIN_bind_skill);
		window.find("eventCounter").Guide_Packskillon = window.find("eventCounter").GetEventCount(window.EVENTCOUNT_FIN_bind_skill);
//		window.find("HALLGCMap").find("self").SendEventInfo();
		window.find("eventCounter").AddEventCount(window.EVENTCOUNT_FIN_guidetrainover);
		window.find("eventCounter").Guide_Guideend = window.find("eventCounter").GetEventCount(window.EVENTCOUNT_FIN_guidetrainover);
		//弹出对”背包关闭按钮“的引导
		window.CXF_NewGuide("tBtnName_Pack_closepack");
	}

	//关闭背包，强制引导亮块
	void CXF_Guide_closepack()
	{
		window.SetForceGuideState(0);//出引导
		//关闭背包
		window.find("PACK_LOGIC").del();
//		window.find("eventCounter").AddEventCount(window.EVENTCOUNT_FIN_guidetrainover);
//		window.find("eventCounter").Guide_Guideend = window.find("eventCounter").GetEventCount(window.EVENTCOUNT_FIN_guidetrainover);
		window.find("eventCounter").AddEventCount(window.EVENTCOUNT_FIN_openhelp);
		timer(100,"window.OpenHelp(100017)");
		if (!window.IsHallHtnOpened(window.G_HALLBTN_GAMEHALL))
		{
			window.find("UIController").LoadUI("UI_GAMEHALL");
		}
//		//弹出对”普通比赛“的引导
//		window.CXF_NewGuide("tBtnName_Pack_returngame");
//	}
//	//回到大厅，强制结束
//	void CXF_Guide_Backsechall()
//	{
//		//进入大厅
//		window.OnClick_BTN_GameHall();
//		window.find("eventCounter").AddEventCount(window.EVENTCOUNT_FIN_guidetrainover);
//		window.find("eventCounter").Guide_Guideend = window.find("eventCounter").GetEventCount(window.EVENTCOUNT_FIN_guidetrainover);
//		window.find("HALLGCMap").find("self").SendEventInfo();
//		printf("C# 引导：CXF_Guide_Backsechall（）；"+window.find("eventCounter").Guide_Guideend);
//		timer(100,"window.OpenHelp(100017)");
	}
}