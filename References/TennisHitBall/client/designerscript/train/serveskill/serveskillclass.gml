//发球技能训练 继承自普通训练类
//编写:高睿
//时间:2010-5-4

/*常用函数说明
	window.LMH_UpData_DLG(ID);
		调用mdb/Tennis_Game.mdb/Train_Tip里面的对话
	window.LMH_Training_CoachType(coach_index,face_type)
		调用奖励的形象和表情
		coach_index	教练的形象序号	1汪涵 2杜海涛 3何炅 4欧弟 5吴欣 6谢娜
		face_type	表情序号		1普通说话 2庆祝 3沮丧
	window.LMH_AniCtrl_KeyBoard(button_index,animation_type);
		调用按键动画
		button_index	按键序号	1上 2下 3左 4右 5J 6K 7L 8下+K 9L+J 10L+K 11L+下+K
		animation_type	动画类型	1开始动画 2停止动画-按下状态 3停止动画-抬起状态
*/
class ServeSkillTrain TrainCurrencySect
{
	void OnMyCreated()
	{
		printf("E# ServeSkill OnMyCreated");
		m_UI_train_name = "ServeSkill";//训练名称，与类名称首个单词相同
		m_UI_coach_index = 1;		//教练的形象序号  1汪涵 2杜海涛 3何炅 4欧弟 5吴欣 6谢娜
		m_UI_skillico = 40401;		//技能图标 40001上旋 40105削球 40205扣杀 40305放高球 40401发球
		m_start_timepoint = 16000;	//录像的起始时间点，需要反复踩点
		m_aim_skill_type = 4;	//目标技能类型 0放高球技能 1削球技能 2上旋球技能 4发球技能 7扣杀技能
		m_aim_button_input = 9;//序号 1上 2下 3左 4右 5J 6K 7L 8下+K 9L+J 10L+K 11L+下+K
		m_UI_button_input = "L,J";//动画的按键内容，需要什么直接写，用逗号分隔
	}

	//[功能]发球机出球的X轴落点
	//[设置内容]t_maybe只能0~5 6个落点，和Z轴参数组合出6个落点
	void Set_Landing_PozX( t_maybe)
	{
		switch ( t_maybe)
		{
			case 0:m_landing_ball_posX = -2;break;
			case 1:m_landing_ball_posX =  0;break;
			case 2:m_landing_ball_posX =  2;break;
			case 3:m_landing_ball_posX = -2;break;
			case 4:m_landing_ball_posX =  0;break;
			case 5:m_landing_ball_posX =  2;break;
			default:break;
		}
	}
	//[功能]发球机出球的Z轴落点
	//[设置内容]t_maybe只能0~5 6个数，和X轴参数组合出6个落点
	void Set_Landing_PozZ( t_maybe)
	{
		switch ( t_maybe)
		{
			case 0:m_landing_ball_posZ = -8;break;
			case 1:m_landing_ball_posZ = -8;break;
			case 2:m_landing_ball_posZ = -8;break;
			case 3:m_landing_ball_posZ = -10;break;
			case 4:m_landing_ball_posZ = -10;break;
			case 5:m_landing_ball_posZ = -10;break;
			default:break;
		}
	}
	//[功能]训练录像的起始函数
	//[设置内容]第一段录像的目标按键输入 录像播放时间
	void Video_Begin()
	{
		window.LMH_SetTrainSkill(m_UI_skillico);	//显示技能图标
		Set_Energy_Stamina();//获得玩家的能量和体力属性值，并根据训练给予一个技能
		Fill_Energy_Stamina();
		timer( 3000,"Pause_Video_Opt");
	}
	//[功能]使用技能后的回调
	void Use_Skill()
	{
		Deduct_Energy_Stamina( 50,25);
	}
	//[功能]玩家按照录像要求正确输入按键的回调，需要根据录像进行对应的分段操作
	//[设置内容]分段 每段录像的目标按键输入 录像播放时间
	void Continue_Video()
	{
		m_video_part += 1;
		printf("E# Continue_Video() m_video_part: " + m_video_part);
		Deduct_Energy_Stamina( 50,25);	
		timer( 4000,"Stop_Video");
		break;
	}
	//[功能]训练操作阶段的函数，需要在此设置教练
	void Operate_Begin()
	{
		ListenEvent(8);
		Set_Operate();//初始化操作阶段的元素
		Serve_State();//把角色设置到发球的相关状态
		Fill_Energy_Stamina();
		ListenEvent(5);//开启技能使用监听，开启后才会调用Use_Skill();
		
	}
	//[功能]单次操作判断，需要根据训练的具体内容设定判断条件
	//[设置内容]判断条件和相关的反馈调用
	void Check_Operate_Result()
	{
		printf("E# Check_Operate_Result() m_skill_type: " + m_skill_type);
		Fill_Energy_Stamina();
		if ( m_skill_type == m_aim_skill_type)
		{
			m_skill_type = -1;//由于发球技能训练没有发球机发球环节，只能在此进行重置
			Show_Good();//显示正确操作的相关界面
		}
		else//未按要求做动作
		{
			Show_Bad();//显示错误操作的相关界面
		}
		timer(500,"Serve_State");//把角色设置到发球的相关状态
	}
	//[功能]操作环节结束时的回调，必须写
	void Operate_Over_Child(){}
	//[功能]训练开始Train_Begin()的回调
	//[设置内容]教练语言
	void Coach_DLG_Begin()
	{
		window.LMH_UpData_DLG(1600);
	}
	//[功能]录像开始Video_Begin()的调用
	//[设置内容]教练语言
	void Coach_DLG_Video_Begin()
	{
		window.LMH_UpData_DLG(1601);
	}
	//[功能]录像中操作Pause_Video()的回调
	//[设置内容]教练语言
	void Coach_DLG_Operate()
	{
		window.LMH_UpData_DLG(1602);
	}
	//[功能]操作开始Operate_Begin()的调用
	//[设置内容]教练语言
	void Coach_DLG_Operate_Begin()
	{
		window.LMH_UpData_DLG(1603);
	}
	//[功能]单次操作的反馈Show_Good()的回调
	//[设置内容]教练语言和表情
	void Coach_DLG_Good()
	{
		switch (m_right_times)
		{
			case 1:window.LMH_Training_CoachType(m_UI_coach_index,1);window.LMH_UpData_DLG(1604);break;
			case 2:window.LMH_Training_CoachType(m_UI_coach_index,1);window.LMH_UpData_DLG(1604);break;
			case 3:window.LMH_Training_CoachType(m_UI_coach_index,2);window.LMH_UpData_DLG(1605);break;
		}
	}
	//[功能]单次操作的反馈Show_Bad()的回调
	//[设置内容]教练语言和表情
	void Coach_DLG_Bad()
	{
		window.LMH_Training_CoachType(m_UI_coach_index,3);
		window.LMH_UpData_DLG(1606);
	}
	//[功能]玩家没有打到球的反馈的回调
	//[设置内容]教练语言和表情
	void Coach_DLG_Miss(){}
	//[功能]训练成功Show_Result()的回调
	//[设置内容]教练语言和表情
	void Coach_DLG_Succeed()
	{
		window.LMH_Training_CoachType(m_UI_coach_index,2);
		window.LMH_UpData_DLG(1608);
	}
	//[功能]训练失败Show_Result()的回调
	//[设置内容]教练语言和表情
	void Coach_DLG_Lose()
	{
		window.LMH_Training_CoachType(m_UI_coach_index,3);
		window.LMH_UpData_DLG(1609);
	}
	//[功能]玩家在反复训练过程中，至少一次成功，最后一次失败的特别处理函数
	//[设置内容]教练语言和表情
	void Coach_DLG_Repeat()
	{
		window.LMH_Training_CoachType(m_UI_coach_index,1);
		window.LMH_UpData_DLG(1610);
	}

}

