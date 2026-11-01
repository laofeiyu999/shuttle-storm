//训练类
//老虎定义
//时间:2010-4-13

class TrainCurrencySect GameTrain
{
	//这是一个十分独特的函数，不能放在OnCreated()里
	ListenEvent(6);//监听地图信息是否加载完成

//-------------------------------------------//基础变量和函数//-----------------------------------------
//-------------------------//步骤控制变量//------------------------
	var m_step = 1;				//训练的步骤标识
	var m_video_part = 1;		//多段录像的分段标识
	var m_repeat = 0;			//跳过录像和重复训练的标识

	var m_wait_begin_time = 1000;//等待加载SetVideo()的时间

//--------------------------//监听的变量//-------------------------
	var m_serve_state = 0;		//角色发球状态的标识，防止发球机发球
	var m_got_act = 0;			//获得击球动作的标识
	var m_got_track = 0;		//获得回球轨迹的标识
	var m_act_ID = 0;			//角色的动作ID
	var m_aim_act_type = -1;	//训练要求的动作类型 0放高 1削球 2上旋 3截击 4发球(平击) 5挡球 6救球 7扣杀 8发球(外旋)
	var m_track_ID = 0;			//球轨迹的ID
	var m_aim_track_type = -1;	//训练要求的轨迹类型  0上旋类 1削球类 2放高球类 3发球 4挡球\扑救 5扣杀
	var m_ball_posX = 0;		//球的位置x
	var m_ball_posZ = 0;		//球的位置z
	var m_ball_landing_times = 0;//落地次数
	var m_landing_zone_X = 0;	//第一次落点位置X
	var m_landing_zone_Z = 0;	//第一次落点位置Z
	var m_skill_type = -1;		//技能类型
	var m_aim_skill_type = 0;	//目标技能类型 0放高球技能 1削球技能 2上旋技能 4发球技能 7扣杀技能
	var m_cumulate_time = 0;	//蓄力时长
	var m_aim_cumulate_time = 0;//目标蓄力时长
//	var m_button_input = "";	//实际按键输入
	var m_aim_button_input = 0;//目标按键输入 序号 1上 2下 3左 4右 5J 6K 7L 8下+K 9L+J 10L+K 11L+下+K

//--------------------------//判断的变量//-------------------------
	var m_remain_balls = 15;	//剩余球数
	var m_right_times = 0;		//正确动作的次数，同时也是界面右上角的分子
	var m_aim_right_times = 3;	//成功需要的次数
	var m_succeed_or_lose = 0;	//训练是否成功：0 没有达到，1 达到
	var m_succeeded = 0;		//成功完成过训练的标识

//--------------------------//录像的变量//--------------------------
//	var m_video_name = "";		//录像的路径
	var m_start_timepoint = 0;	//录像开始的时间点
	var m_pause_timepoint = 0;	//录像暂停的时间点
	var m_stop_timepoint = 0;	//录像停止的时间点

//--------------------------//界面的变量//--------------------------
	var m_UI_train_name = "";	//训练的名字
	var m_UI_denominator = 3;	//右上角比分的分母
	var m_UI_coach_index = 0;	//教练的形象序号 1汪涵 2杜海涛 3何炅 4欧弟 5吴欣 6谢娜
	var m_UI_coach_DlgNum = 0;	//训练对话的起始数
	var m_UI_button_input = "";	//闪烁的按钮
	var m_UI_skillico = 0;		//技能图标 40001上旋 40105削球 40205扣杀 40305放高球 40401发球
	var maxEnergy = 0;			//玩家的能量属性值
	var maxStamina = 0;			//玩家的体力属性值

//---------------------//发球机发出的网球参数//---------------------
	var m_send_ball_trackID = 0;	//轨迹
	var m_send_ball_posX = 0.00;	//发球位置X
	var m_send_ball_posY = 0.00;	//发球位置Y
	var m_send_ball_posZ = 12.00;	//发球位置Z
	var m_landing_ball_posX = 0;	//落点X
	var m_landing_ball_posY = 0.00;	//落点Y
	var m_landing_ball_posZ = 0;	//落点Z
	var m_ball_speed = 1;			//球速

//------------------------------------------//预加载和启动函数//----------------------------------------
	void OnCreated()//系统的初始化函数
	{
		printf("E# ==Train== TrainCurrencySect OnCreated");
		var _CKeySet = new CKeySet
		{
			void OnCreated()
			{
				parent.SETKeyboardtype(GetUseKeyType());//设置键盘方案
				del();
			}
		}
		if ( window.GetMyRID() <= 0 )
			alert("Train OnCreated In Script. RID = " + window.GetMyRID());
		SetUserID( window.GetMyUID() );
		SETBODYID( window.GetMyRID() );
		window.tennisGameStatic.SetGameStyle( 1);//设置单人模式

		staticvar tstatic = new T_ScriptFun{};//韩硕的随机函数模块
		OnMyCreated();//子类的函数
	}
	void OnDelete()
	{
		printf("E# ==Train== TrainCurrencySect OnDelete");
	}
	void Train_Begin()
	{
		printf("E# ==Train== Train_Begin() m_step: " + m_step);
		switch (m_step)
		{
			case 1:
			{
				Del_Tip();
				Video_Begin_Init();
//				timer( 2000,"Video_Begin");//子类的函数
				sleep(2000);
				Video_Begin();//子类的函数
				if ( m_repeat ==0 ) Coach_DLG_Video_Begin();//子类的函数
				break;
			}
			case 2:
			{
				Operate_Begin_Init();
				Operate_Begin();//子类的函数
				break;
			}
		}
	}
	void Video_Begin_Init()
	{
		parent.KeyBoardEnable(0);
	}
	void Operate_Begin_Init()
	{
//		m_repeat = 0;
		parent.KeyBoardEnable(1);
		new fmodel									//搁这儿整个发球机
		{
			src = "$./../../model/faqiuji.v3f";
			pos = "0,0,12";
		}
		parent.find("IAMISSELF").parent.find("RegionTest").SetState(2);//区域限制的设定状态
		parent.find("PhyBody").SetInitPos(0,0,-12);	//角色的初始位置 x,y,z
		parent.find("FSM").clearset(1);				//发球的初始动作
	}
	void Operate_Over_Init()
	{
		Button_Animation_Stop();
		ListenEvent(1,0);//中止发球
		m_video_part = 1;
		m_got_act = 0;
		m_got_track = 0;
		m_right_times = 0;
		m_remain_balls = 15;
		m_repeat = 0;
		m_succeed_or_lose = 0;
		printf("E# ==Train== Operate_Over_Init()");
	}
	void Train_Over_Init()
	{
		ListenEvent(1,0);
		ListenEvent(2,0);
		ListenEvent(3,0);
		m_step = 1;
//		m_video_part = 1;
		m_succeeded = 0;
		printf("E# ==Train== Train_Over_Init()");
	}

//------------------------------------------//监听事件的函数//------------------------------------------
	void Button_Input( t_button)					//事件 0 玩家输入
	{
		var temp_button = Button_Input_Translate(t_button);
		printf("E# ==Train== Button_Input() t_button: " + t_button + " temp_button: " + temp_button + " m_aim_button_input: " + m_aim_button_input);
		if (temp_button == m_aim_button_input)
		{
			Button_Animation_Stop();
			parent.parent.find("GAMEMAP").setPlay( 1);
			ListenEvent(0,0);

			Continue_Video();//需要子类自己控制
		}
	}
	void Ball_Hit_Ground( times, posx, posz)		//事件 1 球落地
	{
//		printf( "E# ==训练== 球落地事件  落地次数 = " + times + "  落点x = " + posx + "  落点z = " + posz);
		m_ball_landing_times = times;
		m_ball_posX = posx;
		m_ball_posZ = posz;
		
		if (times == 1)
		{
			m_landing_zone_X = posx;
			m_landing_zone_Z = posz;
		}
		Check_Result( times);//以球落地作为判断的触发
	}
	void Hit_Event( index, posx, posz, cumulatetime)//事件 2 击球
	{
		printf( "E# ==Train== 击球事件  击球动作ID = " + index + "  所处位置x = " + posx + "  所处位置z = " + posz + "  蓄力时间 = " + cumulatetime);
		m_act_ID = index;
		m_ball_posX = posx;
		m_ball_posZ = posz;
		m_cumulate_time = cumulatetime;
		m_got_act = 1;
	}
	void Return_Event( trackID, posx, posz, speed)	//事件 3 回球
	{
		printf( "E# ==Train== 回球事件  回球轨迹ID = " + trackID + "  落点x = " + posx + "  落点z = " + posz + "  球速 = " + speed);
		m_track_ID = trackID;
		m_ball_posX = posx;
		m_ball_posZ = posz;
		m_got_track = 1;
	}
	void Skill_ID( ID)							//事件 5 使用技能
	{
		printf( "E# ==Train== 技能事件 技能ID = " + ID);
		m_skill_type = Check_Skill_Type(ID);
		Use_Skill();//子类的函数，开启监听后才会调用
		printf( "E# ==Train== 技能事件 目标技能类型 = " + m_aim_skill_type + "使用的技能类型 = " + m_skill_type);
	}
	void TrainStart()								//事件 6 训练开始 加载各种需要的控件
	{
		var row = new VNet2DBRow{};
		row.InitByInt( window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_UID,window.GetMyUID() );
		if ( !row.IsReady() )
		{
			alert("M_G_SERVER_USERDT_UID 打开失败");
			row.del();
			return;
		}
		row.SetInt( window.M_G_SERVER_USERDT_RULESTATION,1 );
		parent.find("IAMISSELF").parent.find("RegionTest").SetStation();
		ListenEvent(6,0);
		row.del();
		timer( m_wait_begin_time,"Load_Video_SRC");//固定流程，所有训练都以播放录像开始
		timer( 3000,"Del_Loading");//这里的时间是一切开始前的等待时间
	}
	void Serve_Event( index, posx, posz)			//事件 8 发球
	{
		printf( "E# ==Train== 发球事件  发球动作= " + index + " 发球点x = " + posx + " 发球点z = " + posz);
		m_ball_posX = posx;
		m_ball_posZ = posz;
		m_got_act = 1;
		m_serve_state = 1;
	}	

//--------------------------------------------//录像的函数//--------------------------------------------
	//[功能]加载录像路径
	void Load_Video_SRC()
	{
		var t_src = "$./"+m_UI_train_name+"/"+m_UI_train_name+".VRG";
		printf( "E# ==Train== Load_Video_SRC() t_src: " + t_src );
		parent.parent.find("GAMEMAP").src = t_src;
		Set_Video();
	}
	//[功能]初始化录像相关参数，实现录像层，隐藏操作层
	void Set_Video()
	{
		parent.parent.find("Name_ReplayMap").show = true;
		parent.parent.find("NAME_GCMap").show = false;
		Play_Video( m_start_timepoint);
		Load_Video_UI();//调子类的函数，根据不同的训练加载界面元素
		window.LMH_Updata_TipInfo(1,m_UI_train_name);
		window.LMH_Hide_TipInfo(true);
	}
	void Set_Video_Camera()
	{
//		var t_video_userinfo = new VNet2DBRow{};
//		t_video_userinfo.InitByInt(window.M_G_CLINET, window.GAMESHOW, window.M_G_CLINET_GAMESHOW_USERID, 0);
//		if ( t_video_userinfo.IsReady() == 0 )
//		{
//			alert("A001USER_HITACT_INDEX 打开失败");
//			t_video_userinfo.del();
//			return;
//		}
//		var t_video_userID = t_video_userinfo.GetData( window.M_G_CLINET_GAMESHOW_USERID);
//		t_video_userinfo.del();
		parent.parent.find("Name_ReplayMap").find("ReplayCamera").SetReplayTargetID( 1000035);//设置摄像机角度
	}
	//[功能]播放录像，并指向需要的时间点
	//[参数]t_time_point 需要的时间点 0不指定 >0 指定
	void Play_Video( t_time_point)
	{
		parent.parent.find("GAMEMAP").setPlay( 1);
		if ( t_time_point != 0)
		{
			printf( "E# ==Train== Play_Video() t_time_point: " + t_time_point );
			parent.parent.find("GAMEMAP").replayto( t_time_point);
		}
	}
	//[功能]暂停录像，切换教练的话，开启按键动画和输入监听
	void Pause_Video_Opt()
	{
		if (m_step != 1) return;
		parent.parent.find("GAMEMAP").setPlay( 0);
		Coach_DLG_Operate();//调子类的函数
		Button_Animation_Play();
		ListenEvent(0);
	}
	//[功能]暂停录像，切换教练的话，不开启按键动画和输入监听
	void Pause_Video_UnOpt()
	{
		if (m_step != 1) return;
		parent.parent.find("GAMEMAP").setPlay( 0);
		Coach_DLG_Operate();//调子类的函数
		Continue_Video();
	}
	//[功能]停止录像，隐藏录像层，切换到操作层
	void Stop_Video()
	{
		if (m_step != 1) return;
		parent.parent.find("GAMEMAP").setPlay( 0);
		parent.parent.find("Name_ReplayMap").show = false;
		parent.parent.find("NAME_GCMap").show = true;
		m_step = 2;
		Train_Begin();
	}
	//[功能]播放按钮动画
	//[参数]window.LMH_AniCtrl_KeyBoard(t_button_index,state);
	//		t_button_index 序号 1上 2下 3左 4右 5J 6K 7L 8下+K 9L+J 10L+K 11L+下+K
	//		state: 1开始动画 2停止动画-按下状态 3停止动画-抬起状态
	void Button_Animation_Play()
	{
		printf( "E# ==Train== Button_Animation_Play() m_UI_button_input: " + m_UI_button_input);
		var t_button_arr = window.SplitStr2(m_UI_button_input,",");
		var t_button_num = window.GetSplitCount(m_UI_button_input,",");
		var t_count = 0;
		var t_button = 0;
		while ( t_count < t_button_num)
		{
			t_button = Button_Animation_Translate(tostring( t_button_arr[t_count] ) );
			printf("E# ==Train== Button_Animation_Play() t_button_arr[t_count]: " +t_button_arr[t_count] + " t_button: " +t_button);
			window.LMH_AniCtrl_KeyBoard(t_button,1);
			if ( t_button == 7){window.LMH_AniCtrl_KeyBoard(t_button,2);}
			t_count += 1;
		}
		
		//这个函数应该把需要的按键全部处理成动画
//		switch (m_aim_button_input)
//		{
//			case 8:
//			{
//				window.LMH_AniCtrl_KeyBoard(2,1);
//				window.LMH_AniCtrl_KeyBoard(6,1);
//			}
//			case 9:
//			{
//				window.LMH_AniCtrl_KeyBoard(7,1);
//				window.LMH_AniCtrl_KeyBoard(5,1);
//			}
//			case 10:
//			{
//				window.LMH_AniCtrl_KeyBoard(7,1);
//				window.LMH_AniCtrl_KeyBoard(6,1);
//			}
//			case 11:
//			{
//				window.LMH_AniCtrl_KeyBoard(7,1);
//				window.LMH_AniCtrl_KeyBoard(2,1);
//				window.LMH_AniCtrl_KeyBoard(6,1);
//			}
//			default:window.LMH_AniCtrl_KeyBoard(m_aim_button_input,1);
//		}
	}
	//[功能]停止按钮动画
	//[参数]t_button_index 序号 1上 2下 3左 4右 5J 6K 7L 8下+K 9L+J 10L+K 11L+下+K
	void Button_Animation_Stop()//state: 1开始动画 2停止动画-按下状态 3停止动画-抬起状态 
	{
		//这个函数应该把需要的按键全部处理成停止
		var i=1;
		while (i<8)
		{
			window.LMH_AniCtrl_KeyBoard(i,3);
			i+=1;
		}
	}

//--------------------------------------------//操作的函数//--------------------------------------------
	//[功能]技能训练专用函数，设定能量和体力，并根据训练给予一个技能
	void Set_Energy_Stamina()
	{
		var t_trainUser = new VUserDT_Logic//读数据库，玩家当前能量
		{
			Init(window.GetMyUID());
		}
		maxEnergy = t_trainUser.GetEnergy();//获得角色的能量上限
		maxStamina = t_trainUser.GetStamina();//获得角色的体力上限
		parent.find("IAMISSELF").parent.find("Logic").SetEnergy(maxEnergy);//上来就是满能量
		parent.find("IAMISSELF").parent.find("Logic").AddStamina_Tennis(maxStamina);//上来就是满体力
//		parent.find("IAMISSELF").parent.find("Logic").LockEnergy();				//把能量锁死
		var t_skillicon = Check_Skill_Class();
		parent.find("skill").add(t_skillicon);				//给角色一个技能 skill首字母一定要小写
	}
	//[功能]玩家操作的相关初始设定
	void Set_Operate()
	{
		Load_Train_UI();
		ListenEvent(1);
		ListenEvent(2);
		ListenEvent(3);
		window.LMH_Updata_Point(m_right_times,m_UI_denominator);
		window.LMH_Remaining_Training_Point(m_remain_balls);
		Button_Animation_Play();
		Coach_DLG_Operate_Begin();
	}
	//[功能]将角色设置成发球状态
	void Serve_State()
	{
		m_serve_state = 1;
		parent.find("IAMISSELF").parent.find("RegionTest").SetState(10);		//区域限制的设定状态
		parent.find("PhyBody").SetInitPos( 3,0,-12);							//角色的初始位置
		parent.find("FSM").clearset( 1021);										//发球的初始动作
	}
	//[功能]发球机发球
	void Send_Ball()
	{
		m_got_act = 0;
		m_got_track = 0;
		m_skill_type = -1;
		var t_maybe = tstatic.rand(5);//调用引擎的随机函数
		Set_Landing_PozX( t_maybe);//子类单独设定并回传
		Set_Landing_PozZ( t_maybe);//子类单独设定并回传
		parent.find("TRACKMGR").NewFly( m_send_ball_trackID,m_send_ball_posX,m_send_ball_posY,m_send_ball_posZ,m_landing_ball_posX,m_landing_ball_posY,m_landing_ball_posZ,m_ball_speed);
		if ( m_UI_train_name == "Killshot" || m_UI_train_name == "KillshotSkill")
		{
			var t_effectID = t_maybe + 37;
			parent.find("IAMISSELF").parent.find("ifuser").neweffintime(3000,"test1" + t_effectID);
		}
		else
		{
			var t_effectID = t_maybe + 1;
			parent.find("IAMISSELF").parent.find("ifuser").neweffintime(2000,"test13" + t_effectID);
		}
//		printf("E# ==Train== 发球: 轨迹ID = " + m_send_ball_trackID + " 发球位置x = " + m_send_ball_posX + " 发球位置y = " + m_send_ball_posY + " 发球位置z = " + m_send_ball_posZ );
//		printf("E# ==Train== 落点: 落点x = " + m_landing_ball_posX + " 落点y = " +m_landing_ball_posY + " 落点z = " + m_landing_ball_posZ + " 球速 = " + m_ball_speed);
	}


//--------------------------------------//判断和数据库查询的函数//--------------------------------------
	//[功能]检查是否需要发球
	void Check_Whether_Send()
	{
		printf("E# ==Train== Check_Whether_Send: m_remain_balls: " + m_remain_balls + " m_succeed_or_lose: " + m_succeed_or_lose);
		if (m_remain_balls == 0 || m_succeed_or_lose == 1)
		{
			Show_Result();
		}
		else
		{
			m_remain_balls -= 1;
			window.LMH_Remaining_Training_Point(m_remain_balls);
			if (m_serve_state == 1) return;//如果是发球状态，就不发球
			timer(300,"Send_Ball");
		}
	}
	//[功能]根据球落地次数检查操作结果
	void Check_Result( times)
	{
		printf("E# ==Train== Check_Result: times: " + times + " m_got_act: " + m_got_act + " m_got_track: " + m_got_track);
		if (times == 1 && m_got_act == 1 && m_got_track == 1)
			Check_Operate_Result();	//子类别的函数
		if (times == 2 && m_got_track == 0)
			Coach_DLG_Miss();		//子类别的函数
		if (times == 3)
			Check_Whether_Send();
	}
	//[功能]通过轨迹的序号获得轨迹的类型
	//[返回]轨迹的类型: 1上旋 2截击 3放高球 4削球 5扣杀 6挡球 7扑救 8发球
	void Check_Track_Type( t_track_ID)
	{
		var t_track_info = new VNet2DBRow{};
		t_track_info.InitByInt(window.TENNIS_GAME, window.TRACKINFO, window.TENNIS_GAME_TRACKINFO_TRACKID, t_track_ID);
		if ( t_track_info.IsReady() == 0 )
		{
			alert("TENNIS_GAME_TRACKINFO_TRACKTYPE 打开失败");
			t_track_info.del();
			return;
		}
		var t_track_type = t_track_info.GetData( window.TENNIS_GAME_TRACKINFO_STATTYPE);
		t_track_info.del();
		return t_track_type;
	}
	//[功能]通过击球动作的序号获得动作的类型
	//[返回]击球动作的类型:0放高 1削球 2上旋 3截击 4发球(平击) 5挡球 6救球 7扣杀 8发球(外旋)
	void Check_Act_Type( t_act_ID)
	{
		var t_act_info = new VNet2DBRow{};
		t_act_info.InitByInt(window.A001USER, window.HITACT, window.A001USER_HITACT_INDEX, t_act_ID);
		if ( t_act_info.IsReady() == 0 )
		{
			alert("A001USER_HITACT_INDEX 打开失败");
			t_act_info.del();
			return;
		}
		var t_act_type = t_act_info.GetData( window.A001USER_HITACT_HITTYPE);
		t_act_info.del();
		return t_act_type;
	}
	//[功能]根据技能训练设置的技能物品ID，写死 mdb/user/user001.mdb/skill 里的ID
	//[返回]技能ID
	void Check_Skill_Class()
	{
		var t_skill_class = 0;
		if ( m_UI_skillico >= 40001 && m_UI_skillico <= 40004) t_skill_class = 101;
		if ( m_UI_skillico >= 40105 && m_UI_skillico <= 40108) t_skill_class = 201;
		if ( m_UI_skillico >= 40205 && m_UI_skillico <= 40208) t_skill_class = 401;
		if ( m_UI_skillico >= 40305 && m_UI_skillico <= 40308) t_skill_class = 301;
		if ( m_UI_skillico >= 40401 && m_UI_skillico <= 40404) t_skill_class = 501;
		return t_skill_class;
	}
	//[功能]根据技能监听返回的ID，获得技能类型
	//[返回]技能类型
	void Check_Skill_Type( t_skillID)
	{
		printf( "E# ==Train== 查询技能类型 技能ID = " + t_skillID);
		var t_skill_info = new VNet2DBRow{};
		t_skill_info.InitByInt(window.A001USER, window.SKILL, window.A001USER_SKILL_SKILLID, t_skillID);
		if ( t_skill_info.IsReady() == 0 )
		{
			alert("A001USER_SKILL_SKILLID 打开失败");
			t_skill_info.del();
			return;
		}
		var t_skill_type = t_skill_info.GetData( window.A001USER_SKILL_SKILLTYPE);
		t_skill_info.del();
		printf( "E# ==Train== 查询技能类型 技能类型 = " + t_skill_type);
		return t_skill_type;
	}
	//[功能]将监听到的数据库按键序号翻译成阿福的按键动画序号 mdb/user/user001.mdb/keydef
	//[返回]按键序号: 1上 2下 3左 4右 5J 6K 7L 8下+K 9L+J 10L+K 11L+下+K
	void Button_Input_Translate( t_button)
	{
		switch (t_button)
		{
			case 12: return 5;
			case 17: return 6;
			case 23: return 7;
			case 35: return 1;
			case 39: return 2;
			case 43: return 3;
			case 47: return 4;
			case 71: return 8;
			case 72: return 9;
			case 73: return 10;
			case 74: return 11;
			default:break;
		}
	}
	//[功能]将按键从字符串翻译为代号
	//[返回]按键序号: 1上 2下 3左 4右 5J 6K 7L
	void Button_Animation_Translate( t_button_str)
	{
		printf("E# ==Train== Button_Animation_Translate() t_button_str: " + t_button_str);
		if ( t_button_str == "W") return 1;
		if ( t_button_str == "S") return 2;
		if ( t_button_str == "A") return 3;
		if ( t_button_str == "D") return 4;
		if ( t_button_str == "J") return 5;
		if ( t_button_str == "K") return 6;
		if ( t_button_str == "L") return 7;
	}

//----------------------------------------//界面操作相关的函数//----------------------------------------
	//[功能]设置训练录像阶段的界面元素
	//[设置内容]已一一列出
	void Load_Video_UI()
	{
		window.LMH_Hide_HeadName(true);	//昵称和能量
		window.LMH_Hide_Skill(true);		//技能
		window.LMH_Hide_Point(false);		//右上角的分子分母
		window.LMH_Remaining_Training_PointShow(false);//剩余球数隐藏
		window.LMH_Hide_DLG(true);			//对话框
		window.LMH_Training_CoachType(m_UI_coach_index,1);//教练表情
		window.LMH_Hide_Btn_NextVideo(false);//下一步
//		window.LMH_Gray_BtnNextVideo(1);	//下一步灰图
		window.LMH_Hide_Btn_SkipVideo(true);//跳过录像按钮
		window.LMH_Hide_Btn_RetryTrain(true);//重复训练
		window.LMH_Gray_BtnSkipVideo(1);	//跳过录像按钮灰图
		window.LMH_Gray_BtnRetryTrain(1);	//重复训练灰图
		window.LMH_Hide_KeyBoard(true);		//键盘动画
	}
	//[功能]设置训练操作阶段的界面元素
	//[设置内容]已一一列出
	void Load_Train_UI()
	{
		window.LMH_Hide_Point(true);		//右上角的分子分母
		window.LMH_Remaining_Training_PointShow(true);//剩余球数显示
		window.LMH_Gray_BtnSkipVideo(1);	//跳过录像按钮灰图
		window.LMH_Gray_BtnRetryTrain(1);	//重复训练灰图
	}
	//[功能]干掉loading界面
	void Del_Loading()
	{
		window.find("LOADING_LOGIC").del();
		window.TStatic.SetReplaySound(1);//打开音效
		Set_Video_Camera();
		Coach_DLG_Begin();//子类的函数
		Train_Begin();
	}
	//[功能]删除中间滚动条，根据具体情况将“跳过录像”或者“重复训练”按钮变亮
	void Del_Tip()
	{
		window.LMH_Hide_TipInfo(false);
		switch (m_step)
		{
			case 1: window.LMH_Gray_BtnSkipVideo(2); window.LMH_Gray_BtnRetryTrain(1); break;
			case 2: window.LMH_Gray_BtnSkipVideo(1); window.LMH_Gray_BtnRetryTrain(2); break;
		}
	}
	//[功能]删除特效
	//[参数]特效名字
	void Del_Effect( t_effect_name)
	{
		parent.find("IAMISSELF").parent.find("ifuser").deleff(t_effect_name);
	}
	//[功能]显示特效
	//[参数]特效名字
	void Show_Effect( t_effect_name)
	{
		parent.find("IAMISSELF").parent.find("ifuser").neweff(t_effect_name);
	}
	//[功能]加满能量和体力
	void Fill_Energy_Stamina()
	{
		window.LMH_UpData_CurrEnergy(maxEnergy);
		window.LMH_UpData_CurrStamina(maxEnergy);
	}
	//[功能]扣除能量和体力
	//[参数]temp1扣除能量值 temp2扣除体力值
	void Deduct_Energy_Stamina( temp1,temp2)
	{
		window.LMH_UpData_CurrEnergy(maxEnergy - temp1);
		window.LMH_UpData_CurrStamina(maxEnergy - temp2);
	}
	//[功能]成功完成一次动作的相关显示
	void Show_Good()
	{
		if (m_succeed_or_lose == 1) return;//为防止锁键盘函数失效采取的保护措施
		
		m_right_times += 1;
		if ( m_right_times == 3) 
		{
			m_succeed_or_lose = 1;
			m_succeeded = 1;
		}
		printf("E# ==Train== Show_Good(): m_right_times: " + m_right_times + " m_succeed_or_lose: " + m_succeed_or_lose + " m_succeeded: " + m_succeeded);
		window.LMH_Updata_Point(m_right_times,m_UI_denominator);
		Coach_DLG_Good();//子类的函数
	}
	//[功能]错误完成一次动作的相关显示
	void Show_Bad()
	{
		Coach_DLG_Bad();//子类的函数
	}
	//[功能]显示训练的结果
	void Show_Result()
	{
		printf("E# ==Train== Show_Result() m_succeed_or_lose: " + m_succeed_or_lose + " m_succeeded: " + m_succeeded);
		parent.KeyBoardEnable(0);
		window.LMH_AniCtrl_KeyBoard(m_aim_button_input,3);//干掉按键动画
		Operate_Over_Child();//留给子类做自己的事情，比如干掉特效
		if (m_succeed_or_lose == 0)
		{
			window.LMH_Updata_TipInfo(2,2);//滚动条准备“失败”
			if ( m_succeeded == 1) Coach_DLG_Repeat();//子类的函数
			else{ Coach_DLG_Lose();}//子类的函数
		}
		else
		{
			window.LMH_Updata_TipInfo(2,1);//滚动条准备“完成”
			Coach_DLG_Succeed();//子类的函数
		}
		window.LMH_Hide_TipInfo(true);
		Operate_Over_Init();
		timer(2500,"Del_Tip");
		timer(5000,"Result_UI");//显示死阿福的结算界面
	}
	//[功能]训练的结果画面，成功出结算，失败只弹提示框
	void Result_UI()
	{
		printf("E# ==Train== Result_UI(): m_repeat: " + m_repeat + " m_succeed_or_lose: " + m_succeed_or_lose );
		if (m_repeat != 0) return;
		if (m_succeeded == 1)
		{
			group.find("GameInterface").SetGameState(4);
			window.LMH_TrainOver();
		}
		else
		{
			window.LMH_TaianFail_DLG();
		}
		Train_Over_Init();
	}
	//[功能]“跳过录像”和“重复训练”的跳转用函数
	void Leap_Between_Video_and_Train()
	{
		if (m_repeat == 1)//跳过录像用Stop_Video
		{
			ListenEvent(0,0);
			window.TStatic.SetReplaySound(0);
			Stop_Video();
			return;
		}
		if (m_repeat == 2)//重复训练用
		{
			m_step = 1;
			m_ball_landing_times = 1;//终止发球
			m_start_timepoint += 700;//为了点击“重复训练”后弥补Del_Loading()之前播放的时间
			Set_Video();
			Coach_DLG_Begin();//子类的函数 重复训练时及时更换对话框内容
			timer(300,"window.TStatic.SetReplaySound(1)");//重复录像跳转时遮盖音效
			timer(1300,"Train_Begin");
		}
	}
}

