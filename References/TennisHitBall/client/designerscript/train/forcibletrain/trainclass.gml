class SampleGameTrain GameTrain
{
//-------------------------------------------///////基础变量和函数///////-------------------------------------------
//-------------------------//步骤控制变量//------------------------
	var _step = 0;			//切换训练的按钮
	var _section = 0;		//多段录像的分段
	var _repeat = 0;		//跳过录像和重复训练用函数
	var _next = 100;		//下一步
	var _nextStep = 1;		//通过下一步按钮触发的函数序列

//-------------------------//初始化的变量//------------------------
	var _send_ball = 4000;	//发球机循环发球间隔
	var _x = 0;				//角色的初始站位X
	var _z = 0;				//角色的初始站位Y
	var _maybe;				//随机轨迹用函数

//--------------------------//监听的变量//-------------------------
	var _index = 0;			//动作ID
	var _locusID = 0;		//轨迹的索引
	var _posx = 0;			//位置x
	var _posy = 0;			//位置y
	var _posz = 0;			//位置z
	var _times = 0;			//落地次数
	var _ID = 0;			//技能ID
	var _aim_ID;			//目标技能
	var _cumulatetime = 0;	//蓄力时间
	var _listnum;			//实际按键输入
	var _aim_input;			//目标按键输入

//--------------------------//判断的变量//-------------------------
	var _amount = 15;		//剩余球数
	var _good = 0;			//动作是否达到要求：0 没有达到，1 达到
	var _rat = 0;			//小老鼠 完成球数的积累值：每成功完成一次击球自加1
	var _rabbit = 0;		//小兔子 判断是否训练成功的积累值
	var _degree;			//成功需要的小老鼠数量
	var _justic_point;		//成功需要的小兔子数量
	var _succeed = 0;		//是否成功完成过训练
	var _lose = 0;

//--------------------------//录像的变量//--------------------------
	var _name;				//录像的文件名称，设成变量方便调用
	var _pause_time;		//暂停时间，可反复赋值
	var _stop_time;			//停止时间，手动停止录像

//--------------------------//界面的变量//--------------------------
	var _curr = 0;			//右上角比分的分子
	var _all = 0;			//右上角比分的分母
//--------------------------//查表的范围//--------------------------
	var _ID1 = 10001;
	var _ID2 = 10002;
	var _ID3 = 10003;
	var _ID4 = 10004;
	var _ID5 = 10005;
	var _ID6 = 10006;
	var _ID7 = 10007;
	var _ID8 = 10008;

//--------------------------//网球的轨迹//--------------------------
	var _locus;				//轨迹
	var _s_posx = 3.00;		//发球位置X
	var _s_posy = 0.00;		//发球位置Y
	var _s_posz = -12.00;	//发球位置Z
	var _f_posx;			//落点X
	var _f_posy;			//落点Y
	var _f_posz;			//落点Z
	var _speed;				//球速

	var _count;

//--------------------------------------------//录像的函数//--------------------------------------------
	void Next_Step()//点击“下一步”触发，作为录像、操作开始前的步骤控制函数
	{
		switch (_nextStep)
		{
			case 1:break;
			case 2:break;
			case 3:
			{
				window.LMH_Hide_Btn_NextVideo(false);
				Go_Go_Go();
				break;
			}
			case 4:
			{
				window.LMH_Gray_BtnNextVideo(1);
				timer(2500,"Send_Ball");//点击下一步，开始发球
				Set_UI();//点击下一步，按钮才开始闪烁
				return;
			}
			default:break;
		}
		window.LMH_UpData_DLG(_next);
		_next += 1;
		_nextStep += 1;
	}
	void Click_Accept()					//为了对点击弹出框的“确定”有反应，死阿福强迫我又搞了一个函数
	{
		window.TStatic.SetReplaySound(0);
		Load_Video_UI();				//加载死阿福的界面,具体用什么到这个函数里去找
		parent.parent.find("Name_ReplayMap").find("ReplayCamera").SetReplayTargetID( 1000035);//设置摄像机角度

		_step = _step + 1;
		Play_Video_Forehead(45000)
		timer(1000,"Pause_Video_Forehead");

		window.LMH_UpData_DLG(_next);		//文本框中教练自我介绍用
		_next += 1;
//		window.LMH_Hide_Btn_NextVideo(true);
		window.LMH_Gray_BtnNextVideo(2);	//下一步变亮
	}
	void Play_Video_Forehead( time)//播放录像和音效
	{
		if ( time != 0)
		{
			parent.parent.find("GAMEMAP").replayto( time);
		}
		parent.parent.find("GAMEMAP").setPlay( 1);
		timer(500,"window.TStatic.SetReplaySound(1)");
	}
	void Pause_Video_Forehead()//暂停录像和音效
	{
		parent.parent.find("GAMEMAP").setPlay( 0);
	}
	void Set_Video()		//每段训练开始的预热部分
	{
		switch (_step)
		{
			case 0://在后台先播放起来
			{
				parent.parent.find("Name_ReplayMap").show = true;
				parent.parent.find("NAME_GCMap").show = false;
				parent.parent.find("GAMEMAP").src = "$./src/ForcibleTrain.VRG";
				parent.parent.find("GAMEMAP").replayto( 41000);//4000
				parent.parent.find("GAMEMAP").setPlay( 1);
				timer(500,"window.TStatic.SetReplaySound(1)");
				break;
			}
			case 1:{break;}
			case 2:{break;}
			case 3://发球的录像起始点
			{
				parent.parent.find("GAMEMAP").replayto( 22000);
				parent.parent.find("GAMEMAP").setPlay( 1);
//				timer(1000,"window.TStatic.SetReplaySound(1)");
				break;
			}
			case 4: break;
			case 5://击球的录像起始点
			{
				parent.parent.find("GAMEMAP").replayto( 10000);
				parent.parent.find("GAMEMAP").setPlay( 1);
				timer(500,"window.TStatic.SetReplaySound(1)");
				break;
			}
			case 6:{break;}
		}
	}
	void Show_Tip()			//死阿福不让控制播放时间，只能用这种憋屈的办法
	{
		switch (_step)
		{
			case 1:
			{
				window.LMH_Updata_TipInfo(1,"MoveTrain");
				window.LMH_Hide_TipInfo(true);
				timer(1500,"window.LMH_Hide_TipInfo(false)");
				break;
			}
			case 2:{break;}
			case 3:
			{
				window.LMH_Updata_TipInfo(1,"ServeTrain");
				window.LMH_Hide_TipInfo(true);
				timer(1500,"window.LMH_Hide_TipInfo(false)");
				break;
			}
			case 4:{break;}
			case 5:
			{
				window.LMH_Updata_TipInfo(1,"HitTrain");
				window.LMH_Hide_TipInfo(true);
				timer(1500,"window.LMH_Hide_TipInfo(false)");
				break;
			}
			case 6:{break;}
		}
	}
	void Warm_Up_End()		//结束录像的预热
	{
		switch (_step)
		{
			case 1: 
			{
				parent.parent.find("GAMEMAP").replayto( 47500);
				break;
			}
			case 2: break;
			case 3: 
			{
				parent.parent.find("GAMEMAP").replayto( 23500);
				break;
			}
			case 4: break;
			case 5:
			{
				parent.parent.find("GAMEMAP").replayto( 14100);
				break;
			}
			case 6: break;
		}
		parent.parent.find("GAMEMAP").setPlay( 1);
		timer(500,"window.TStatic.SetReplaySound(1)");
	}
	void Play_Video_1()		//播放录像 1 移动训练
	{
		switch (_section)
		{
			case 1: 
			{
				window.TStatic.SetReplaySound(0);//关闭音效
				Warm_Up_End();
				_aim_input = 47; _pause_time = 2000;
				timer( _pause_time,"Pause_Video");
				break;
			}
			case 2: 
			{
				_aim_input = 35; _pause_time = 1300;
				timer( _pause_time,"Pause_Video");
				break;
			}

			//由于按键检测的时间缩短，暂时去掉A+S的使用教学
//			case 3: 
//			{
//				_aim_input = 63; _pause_time = 1300; 
//				timer( _pause_time,"Pause_Video");
//				break;
//			}
//			case 4: 
//			{
//				_stop_time = 2000; 
//				timer( _stop_time,"Stop_Video_Another");
//				break;
//			}

			case 3: 
			{
				timer( 1300,"Stop_Video_Another");
				break;
			}
		}
	}
	void Play_Video_2()		//播放录像 2 发球训练
	{
		switch (_section)
		{
			case 1: 
			{
				Warm_Up_End();
				_aim_input = 12; _pause_time = 2500;
				timer( _pause_time,"Pause_Video");
				break;
			}
			case 2: 
			{
				_aim_input = 12; _pause_time = 800;
				timer( _pause_time,"Pause_Video");
				window.LMH_Training_StorePower(1);	//发球力量槽显示
				timer( 600,"window.LMH_Training_StorePower(4);");//发球力量槽延时停住
				break;
			}
			case 3: 
			{
				_stop_time = 2300;
				timer( _stop_time,"Stop_Video");
				window.LMH_Training_StorePower(5);	//发球力量槽消失
				break;
			}
		}
	}
	void Play_Video_3()		//播放录像 3 击球训练
	{
		switch (_section)
		{
			case 1:
			{
				Warm_Up_End();
				_aim_input = 12; _pause_time = 1550;
				timer( _pause_time,"Pause_Video");
				break;
			}
			case 2:
			{
				_stop_time = 2000;
				timer( _stop_time,"Stop_Video");
				break;
			}
		}
	}
	void Pause_Video()		//暂停录像，弹出操作指导
	{
		parent.parent.find("GAMEMAP").setPlay( 0);
		switch (_step)
		{
			case 1:Button_Animation_1(); break;
			case 2: break;
			case 3:Button_Animation_2(); break;
			case 4: break;
			case 5:Button_Animation_3(); break;
			case 6: break;
		}
		ListenEvent(0);
	}
	void Button_Animation_1()//index：序号 1上 2下 3左 4右 5J 6K 7L   state: 1开始动画 2停止动画-按下状态 3停止动画-抬起状态 
	{
		switch (_section)
		{
			case 1:
			{
				window.LMH_UpData_DLG(104);
				window.LMH_AniCtrl_KeyBoard(4,1);
				_section = _section + 1;
				break;
			}
			case 2:
			{
				window.LMH_UpData_DLG(105);
				window.LMH_AniCtrl_KeyBoard(1,1);
				_section = _section + 1;
				break;
			}
			//由于按键检测的时间缩短，暂时去掉A+S的使用教学
//			case 3:
//			{
//				window.LMH_UpData_DLG(106);
//				window.LMH_AniCtrl_KeyBoard(2,2);
//				window.LMH_AniCtrl_KeyBoard(3,2);
//				_section = _section + 1;
//				break;
//			}
		}
	}
	void Button_Animation_2()
	{
		switch (_section)
		{
			case 1:
			{
				window.LMH_UpData_DLG(109);
				window.LMH_AniCtrl_KeyBoard(5,1);
				_section = _section + 1;
				break;
			}
			case 2:
			{
				window.LMH_UpData_DLG(110);
				window.LMH_AniCtrl_KeyBoard(5,1);
				_section = _section + 1;
				break;
			}
		}
	}
	void Button_Animation_3()
	{
		switch (_section)
		{
			case 1:
			{
				window.LMH_UpData_DLG(115);
				window.LMH_AniCtrl_KeyBoard(5,1);
				_section = _section + 1;
				break;
			}
		}
	}
	void Stop_Video()//其余训练录像的停止，弹出“完成”
	{
		parent.parent.find("GAMEMAP").setPlay( 0);
		parent.parent.find("Name_ReplayMap").show = false;
		parent.parent.find("NAME_GCMap").show = true;
		_step = _step + 1;
		_section = 1;
		Go_Go_Go();
	}
	void Stop_Video_Another()//移动训练录像停止，没有实际操作环节，直接弹出“完成”
	{
		parent.parent.find("GAMEMAP").setPlay( 0);
		window.LMH_Training_CoachType(1,2);
		window.LMH_UpData_DLG(107);
		_section = 1;
		timer(1000,Show_Result());
	}

//--------------------------------------------//初始化函数//--------------------------------------------
	void Load_Video_UI()
	{
		window.LMH_Training_CoachType(1,1);	//教练表情
		window.LMH_Hide_DLG(true);			//对话框
		window.LMH_Hide_KeyBoard(true);		//键盘动画
		window.LMH_Hide_HeadName(false);	//昵称和能量
		window.LMH_Hide_Skill(false);		//技能
		window.LMH_Hide_Point(false);		//右上角的进度
		window.LMH_Remaining_Training_PointShow(false);//剩余球数隐藏
		window.LMH_Hide_Btn_SkipVideo(true);//跳过录像按钮
		window.LMH_Hide_Btn_RetryTrain(true);//重复训练
		window.LMH_Hide_Btn_NextVideo(true);//下一步
		window.LMH_Gray_BtnSkipVideo(1);	//跳过录像按钮灰图
		window.LMH_Gray_BtnRetryTrain(1);	//重复训练灰图
		window.LMH_Gray_BtnNextVideo(1);	//下一步灰图
	}
	void Load_Train_UI()
	{
		window.LMH_Hide_DLG(true);			//对话框
		window.LMH_Training_CoachType(1,1);	//教练表情
		window.LMH_Hide_KeyBoard(true);		//键盘动画
		window.LMH_Hide_HeadName(true);		//昵称和能量
		window.LMH_Hide_Skill(true);		//技能
		window.LMH_Hide_Point(true);		//右上角的进度
		window.LMH_Remaining_Training_PointShow(false);//剩余球数显示
		window.LMH_Hide_Btn_SkipVideo(true);//跳过录像按钮
		window.LMH_Hide_Btn_RetryTrain(true);//重复训练
		window.LMH_Hide_Btn_NextVideo(true);//下一步
		window.LMH_Gray_BtnSkipVideo(1);	//跳过录像按钮灰图
		window.LMH_Gray_BtnRetryTrain(1);	//重复训练灰图
		window.LMH_Gray_BtnNextVideo(1);	//下一步灰图
	}
	void Set_UI()
	{
		window.LMH_Updata_Point(_curr,_all);
		window.LMH_AniCtrl_KeyBoard(5,1);
	}
	void Serve_State()															//设定角色发球状态
	{
		_count += 1;
		parent.KeyBoardEnable(1);
		parent.find("IAMISSELF").parent.find("RegionTest").SetState(10);		//区域限制的设定状态
		parent.find("PhyBody").SetInitPos( _s_posx,_s_posy,_s_posz);			//角色的初始位置
		parent.find("FSM").clearset( 1021);										//发球的初始动作
		printf("B# ====训练测试==== 训练动作触发次数 " + _count);
	}
	void Set_Locus( locus,s_posx,s_posy,s_posz,f_posx,f_posy,f_posz,speed)		//设定轨迹
	{
		_locus = locus;
		_s_posx = s_posx;
		_s_posy = s_posy;
		_s_posz = s_posz;
		_f_posx = f_posx;
		_f_posy = f_posy;
		_f_posz = f_posz;
		_speed = speed;
	}
	void Send_Ball()															//发球机循环发球
	{
		parent.find("TRACKMGR").NewFly( _locus,_s_posx,_s_posy,_s_posz,_f_posx,_f_posy,_f_posz,_speed);
		if ( _lose > 0)
		{
			window.LMH_BigKeyOprt(1,1);//画面中间显示大按钮
		}
		printf("====Train test==== 轨迹ID = " + _locus + " 发球位置x = " + _s_posx + " 发球位置y = " + _s_posy + " 发球位置z = " + _s_posz + " 落点x = " + _f_posx + " 落点y = " +_f_posy + " 落点z = " + _f_posz + " 球速 = " + _speed);				
	}

//--------------------------------------------//事件的函数//--------------------------------------------
	void Button_Input( listnum)						//事件 0 玩家输入
	{
		printf("====Train test==== 键盘输入ID = " + listnum);
		if (listnum == _aim_input)
		{
			window.LMH_AniCtrl_KeyBoard(1,3);
			window.LMH_AniCtrl_KeyBoard(2,3);
			window.LMH_AniCtrl_KeyBoard(3,3);
			window.LMH_AniCtrl_KeyBoard(4,3);
			window.LMH_AniCtrl_KeyBoard(5,3);
			window.LMH_AniCtrl_KeyBoard(6,3);
			window.LMH_AniCtrl_KeyBoard(7,3);
			parent.parent.find("GAMEMAP").setPlay( 1);
			ListenEvent(0,0);
			switch (_step)
			{
				case 1:Play_Video_1(); break;
				case 2: break;
				case 3:Play_Video_2(); break;
				case 4: break;
				case 5:Play_Video_3(); break;
				case 6: break;
			}
		}
	}
	void Ball_Hit_Ground( times, posx, posz)		//事件 1 球落地
	{
		printf( "====Train Test==== 球落地事件  落地次数 = " + times + "  落点x = " + posx + "  落点z = " + posz);
		_times = times;
		_posx = posx;
		_posz = posz;
		printf( "====Train test==== 变量列表 _index = " + _index + " _posx = " + _posx + " _posy = " + _posy + " _posz = " + _posz + " _times = " + _times + " _ID = " +_ID + " _cumulatetime = " + _cumulatetime);				
		switch (_step)
		{
			case 1: break;
			case 2: break;
			case 3: break;
			case 4:Check_Area_Complex(); break;
			case 5: break;
			case 6:Check_Area_Simple(); break;
		}
	}
	void Hit_Event( index, posx, posz, cumulatetime)//事件 2 击球
	{
		printf( "====Train test==== 击球事件  击球动作ID = " + index + "  所处位置x = " + posx + "  所处位置z = " + posz + "  蓄力时间 = " + cumulatetime);
		_index = index;
		_posx = posx;
		_posz = posz;
		_cumulatetime = cumulatetime;
		window.LMH_BigKeyOprt(0,1);//画面中间消失大按钮
		printf( "====Train test==== 变量列表 _index = " + _index + " _posx = " + _posx + " _posy = " + _posy + " _posz = " + _posz + " _times = " + _times + " _ID = " +_ID + " _cumulatetime = " + _cumulatetime);				
	}
	void Return_Event( locusID, posx, posz, speed)	//事件 3 回球
	{
		printf( "====Train test==== 回球事件  回球轨迹ID = " + locusID + "  落点x = " + posx + "  落点z = " + posz + "  球速 = " + speed);
		_locusID = locusID;
		_posx = posx;
		_posz = posz;
		_speed = speed;
		printf( "====Train test==== 变量列表 _index = " + _index + " _posx = " + _posx + " _posy = " + _posy + " _posz = " + _posz + " _times = " + _times + " _ID = " +_ID + " _cumulatetime = " + _cumulatetime);				
	}
	void Skill_ID( ID,type)							//事件 5 使用技能
	{
		_ID = ID;
		printf( "====Train test==== 目标技能ID = " + _aim ID + "使用的技能ID = " + _ID);
		if (_ID == _aim_ID)
		{
			_rat = _rat + 1;
			Count_Rat();
		}
	}
	void Serve_Event( index, posx, posz)			//事件 8 发球
	{
		printf( "====Train test==== 发球事件  发球动作= " + index + " 发球点x = " + posx + " 发球点z = " + posz);
		_s_posx = posx;
		_s_posz = posz;
	}
	
//--------------------------------------------//判断的函数//--------------------------------------------
	void Set_Range( ID1,ID2,ID3,ID4,ID5,ID6,ID7,ID8)//设定判断的范围
	{
		printf("ID1 = " + ID1 + " ID2 = " + ID2 + " ID3 = " + ID3 + " ID4 = " + ID4 + " ID5 = " + ID5 + " ID6 = " +ID6 + " ID7 = " + ID7 + " ID8 = " + ID8);				
		_ID1 = ID1;
		_ID2 = ID2;
		_ID3 = ID3;
		_ID4 = ID4;
		_ID5 = ID5;
		_ID6 = ID6;
		_ID7 = ID7;
		_ID8 = ID8;
		printf("_ID1 = " + _ID1 + " _ID2 = " + _ID2 + " _ID3 = " + _ID3 + " _ID4 = " + _ID4 + " _ID5 = " + _ID5 + " _ID6 = " +_ID6 + " _ID7 = " + _ID7 + " _ID8 = " + _ID8);				
	}
	void Check_Area_Simple()						// 2 参数判断球的落点
	{
		if (_times == 1 && _posz > 0)
		{
			_rat = _rat + 1;
			Count_Rat();
		}
		if (_times == 2 && _posz < 0)
		{
			_lose = 1;
			window.LMH_Training_CoachType(1,3);
			window.LMH_UpData_DLG(118);
			window.LMH_BigKeyOprt(0,1);//画面中间消失大按钮
			timer(2500,"Send_Ball");
		}
	}
	void Check_Area_Complex()						// 3 参数判断球的落点
	{
		if (_times == 1 && _posx < 0 && _posz > 0)
		{
			parent.KeyBoardEnable(0);
			_rat = _rat + 1;
			Count_Rat();
		}
		if (_times == 3)
		{
			Serve_State();
		}
	}
	void Count_Rat()								//判断1次动作是否正确
	{
		Show_Good();
		if (_rat == _degree)
		{
			_rabbit = _rabbit + 1;
			Count_Rabbit();
		}
		else
		{
			switch (_step)
			{
				case 1: break;
				case 2: break;
				case 3: break;
				case 4: break;
				case 5: break;
				case 6: timer(2500,"Send_Ball"); break;
			}
		};
	}
	void Count_Rabbit()								//判断该训练是否完成
	{
		if (_rabbit == _justic_point)
		{
			switch (_step)
			{
				case 1: break;
				case 2: break;
				case 3: break;
				case 4: Show_Result(); break;
				case 5: break;
				case 6: timer( 2000,"Show_Result"); break;
			}
		}
	}

//--------------------------------------------//结算的函数//--------------------------------------------
	void Show_Good()								//成功1次的界面
	{
		_curr = _curr + 1;
		window.LMH_Updata_Point(_curr,_all);
		switch (_rat)								//教练的表情和话
		{
			case 1://发球训练
			{
				window.LMH_Training_CoachType(1,1);window.LMH_UpData_DLG(112);
//				window.LMH_AniCtrl_KeyBoard(5,3);
//				window.LMH_AniCtrl_KeyBoard(6,1);//切换到K键
				break;
			}
			case 2://发球训练
			{
				window.LMH_Training_CoachType(1,2);window.LMH_UpData_DLG(113);
//				window.LMH_AniCtrl_KeyBoard(6,3);//干掉K键
				window.LMH_AniCtrl_KeyBoard(5,3);//干掉K键
				break;
			}
			case 3://击球训练
			{
				window.LMH_Training_CoachType(1,1);
				window.LMH_UpData_DLG(120);
				//为了配合屏幕中间的按键提示，先把下面这些注释了
//				window.LMH_UpData_DLG(116);
//				window.LMH_Training_CoachType(1,1);window.LMH_UpData_DLG(116);
//				window.LMH_AniCtrl_KeyBoard(5,3);
//				window.LMH_AniCtrl_KeyBoard(6,1);//切换到K键
				break;
			}
			case 4://击球训练
			{
				window.LMH_Training_CoachType(1,2);window.LMH_UpData_DLG(119);
				window.LMH_AniCtrl_KeyBoard(5,3);
//				window.LMH_AniCtrl_KeyBoard(6,3);//干掉K键
				break;
			}
		}
	}
	void Show_Result()								//训练的结果
	{
		parent.KeyBoardEnable(0);
		window.LMH_AniCtrl_KeyBoard(5,3);
		window.LMH_AniCtrl_KeyBoard(6,3);
		window.LMH_Updata_TipInfo(2,1);					//显示成功3联句 1 滚动条准备“成功”
		window.LMH_Hide_TipInfo(true);					//显示成功3联句 2 滚动条出现
		timer(1500,"window.LMH_Hide_TipInfo(false)");	//显示成功3联句 3 滚动条消失
		_step = _step + 1;
		if (_step == 7)
		{
			timer(5000,"Result_UI");
		}
		else
		{
			timer(3000,"Go_Go_Go");
		};
		parent.find("IAMISSELF").parent.find("ifuser").deleff("test126");//记得修改这里的特效ID
		parent.find("IAMISSELF").parent.find("ifuser").deleff("test129");//记得修改这里的特效ID
	}
	void Result_UI()
	{
		group.find("GameInterface").SetGameState(4);
		window.LMH_TrainOver();
	}

//--------------------------------------------//启动脚本的函数//--------------------------------------------
//--------------------------------------我终于把时间掌握在了自己手里！--------------------------------------
	SETBODYID(window.GetMyRID());
	ListenEvent(6);					//监听地图信息是否加载完成 一切从这里开始
	void TrainStart()				//事件 6 训练开始 加载各种需要的控件
	{
		var row = new VNet2DBRow{};
		row.InitByInt( window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_UID,window.GetMyUID() );
		if ( !row.IsReady() )
		{
			row.del();
			return;
		}
		row.SetInt( window.M_G_SERVER_USERDT_RULESTATION,1 );
		parent.find("IAMISSELF").parent.find("RegionTest").SetStation();
		ListenEvent(6,0);
		Set_Video();				//放在这里让录像先播放起来，看到的时候不卡
		row.del();
		timer( 4000,"Del_Loading");	//这里的时间是一切开始前的等待时间
	}
	void Del_Loading()				//干掉loading界面
	{
		parent.parent.find("GAMEMAP").setPlay(0);	//录像先暂停，不点击“确定”不播放
		window.find("LOADING_LOGIC").del();
		window.TStatic.SetReplaySound(1);//打开音效
		//引导事件
		window.LMH_AddEvent(window.EVENTCOUNT_UI_before_forcabletrain);//进入强制训练前
		printf("C# =====引导=====进入强制训练前的说明界面");
		window.find("UIController").LoadDLG(39);	//死阿福万恶的提示框在此！
	}
	void Go_Go_Go()					//作为各部分之间循环的中转函数
	{
		switch (_step)								//调用谁就写谁
		{
			case 1:
			{
				Move_Video();
				break;
			}
			case 2:
			{
				Move_Train();
				break;
			}
			case 3:
			{
				Serve_Video();
				break;
			}
			case 4:
			{
				Serve_Train();
				parent.parent.find("Name_ReplayMap").show = false;
				parent.parent.find("NAME_GCMap").show = true;
				break;
			}
			case 5:
			{
				Hit_Video();
				parent.parent.find("Name_ReplayMap").show = true;
				parent.parent.find("NAME_GCMap").show = false;
				break;
			}
			case 6:
			{
				Hit_Train();
				parent.parent.find("Name_ReplayMap").show = false;
				parent.parent.find("NAME_GCMap").show = true;
				break;
			}
		}
	}

	//在加载完场景信息之前，进入训练场景时是一个说明介绍；或者玩家进入后先看训练，同时后台加载训练场景
	//-------------------------------------------//////////移动训练//////////-------------------------------------------
	//-----------------------------------------------------录像部分-----------------------------------------------------
	void Move_Video()
	{
		Show_Tip();
		_section = 1;
		Load_Video_UI();							//加载死阿福的界面,具体用什么到这个函数里去找
		window.LMH_UpData_DLG(103);
		timer(3000,"Play_Video_1");
	}
	//-----------------------------------------------------训练部分------------------------------------------------------
	void Move_Train()
	{
		_step = _step + 1;
		printf("_step = " + _step);
		Go_Go_Go();
	}
	
	//-------------------------------------------//////////发球训练//////////-------------------------------------------
	//-----------------------------------------------------录像部分-----------------------------------------------------
	void Serve_Video()
	{
		Show_Tip();
		_section = 1
		window.TStatic.SetReplaySound(0);
		Set_Video();
		Load_Video_UI();							//加载死阿福的界面,具体用什么到这个函数里去找
		window.LMH_UpData_DLG(108);
		timer(3000,"Play_Video_2");
	}
	//-----------------------------------------------------训练部分------------------------------------------------------
	void Serve_Train()
	{
		_rat = 0;
		_rabbit = 0;
		_degree = 2;
		_justic_point = 1;
		_curr = 0;
		_all = 2;
		window.LMH_UpData_DLG(111);
		Serve_State();
//		parent.find("IAMISSELF").parent.find("RegionTest").RoleStation("10");	//发球状态的特殊区域限制
//		parent.find("PhyBody").SetInitPos(3,0,-12);	//角色的初始位置 x,y,z
		parent.find("IAMISSELF").parent.find("ifuser").neweff("test126");		//开启特效
		Load_Train_UI();							//加载死阿福的界面,具体用什么到这个函数里去找
		Set_UI();
		ListenEvent(1);
		ListenEvent(8);
	}

	//-------------------------------------------//////////接球训练//////////-------------------------------------------
	//-----------------------------------------------------录像部分-----------------------------------------------------
	void Hit_Video()
	{
		Show_Tip();
		_section = 1;
		Set_Video();
		Load_Video_UI();							//加载死阿福的界面,具体用什么到这个函数里去找
		window.LMH_UpData_DLG(114);
		timer(3000,"Play_Video_3");
	}
	//-----------------------------------------------------训练部分------------------------------------------------------
	void Hit_Train()
	{
		_rat = 2;
		_rabbit = 0;
		_degree = 4;
		_justic_point = 1;
		_curr = 0;
		_all = 2;
		_times == 0;
		_posz == 0;
		parent.KeyBoardEnable(1);
		window.LMH_UpData_DLG(116);
		new fmodel//搁这儿整个发球机
		{
			src = "$./../../../model/faqiuji.v3f";
			pos = "-1,0,12";
		}
		parent.find("IAMISSELF").parent.find("RegionTest").SetState(2);			//区域限制的设定状态
		parent.find("PhyBody").SetInitPos(3,0,-12);	//角色的初始位置 x,y,z
		parent.find("FSM").clearset(1);				//发球的初始动作
		parent.find("IAMISSELF").parent.find("ifuser").neweff("test129");		//开启特效
		Load_Train_UI();							//加载死阿福的界面,具体用什么到这个函数里去找
		Set_Locus(2,-1,0,12,3,0,-10,1);			// 轨迹ID, 起点x, 起点y, 起点z, 落点x, 落点y, 落点z, 速度
		ListenEvent(1);
		ListenEvent(2);

		window.LMH_Gray_BtnNextVideo(2);	//下一步变亮
//		timer(2500,"Send_Ball");
	}
};
