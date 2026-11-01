//
//训练相关
//

set window
{
	//给流氓虎的函数=训练用

	//更新右上角进度
	//参数1 当前数curr
	//参数2 总数all
	void LMH_Updata_Point(curr,all)
	{
		window.find("TRAINING_LOGIC")._VTraining.Updata_Point(curr,all);
	}
	//更新TipInfo
	//参数 time:时机(开始1,结束2)
	//参数 type:结果(开始可以为"",可以不为空/0 结束：1成功 2失败)
	void LMH_Updata_TipInfo(time,type)
	{
		window.find("TRAINING_LOGIC")._VTraining.Updata_TipInfo(time,type);
	}
	//函数 UpData_CurrEnergy:更新当前能量/技能
	//参数 CurrEnergy:当前能量
	void LMH_UpData_CurrEnergy(CurrEnergy)
	{
		window.find("TRAINING_LOGIC")._VTraining.UpData_CurrEnergy(CurrEnergy);
	}
	//函数 LMH_UpData_CurrStamina:更新当前体力
	//参数 CurrStamina:当前体力
	void LMH_UpData_CurrStamina(CurrStamina)
	{
		window.find("TRAINING_LOGIC")._VTraining.UpData_CurrStamina(CurrStamina);
	}
	//函数	SetSkillState：改变技能的状态:第3个亮则前两个都亮
	//参数1	index：索引1上旋 2削球 3扣杀 4放高球 5发球
	//参数2	SkillID：技能ID
	//参数3	state：0默认状态 1改变后的状态
	void LMH_SetSkillState(index,SkillID,state)
	{
		window.find("TRAINING_LOGIC")._VTraining.SetSkillState(index,SkillID,state);
	}
	//更新对话框的内容
	//参数1 ID:需要显示对话框的ID
	void LMH_UpData_DLG(id)
	{
		window.find("TRAINING_LOGIC")._VTraining.UpData_DLG(id);
	}
	//控制键盘按键的动画
	//参数1 index：序号 1上 2下 3左 4右 5J 6K 7L
	//参数2 state: //参数2 state: 1开始动画 2停止动画-按下状态 3停止动画-抬起状态
	void LMH_AniCtrl_KeyBoard(index,state)
	{
		window.find("TRAINING_LOGIC")._VTraining.AniCtrl_KeyBoard(index,state);
	}
	//显示或隐藏键盘
	//参数 param:true / false
	void LMH_Hide_KeyBoard(param)
	{
		window.find("TRAINING_LOGIC")._VTraining.Hide_KeyBoard(param);
	}
	//显示或隐藏昵称+能量
	//参数 param:true / false
	void LMH_Hide_HeadName(param)
	{
		window.find("TRAINING_LOGIC")._VTraining.Hide_HeadName(param);
	}
	//显示或隐藏技能
	//参数 param:true / false
	void LMH_Hide_Skill(param)
	{
		window.find("TRAINING_LOGIC")._VTraining.Hide_Skill(param);
	}
	//显示或隐藏右上角进度
	//参数 param:true / false
	void LMH_Hide_Point(param)
	{
		window.find("TRAINING_LOGIC")._VTraining.Hide_Point(param);
	}
	//显示或隐藏中间提示：开始或者完成
	//参数 param:true / false
	void LMH_Hide_TipInfo(param)
	{
		window.find("TRAINING_LOGIC")._VTraining.Hide_TipInfo(param);
	}
	//显示或隐藏对话框
	//参数 param:true / false
	void LMH_Hide_DLG(param)
	{
		window.find("TRAINING_LOGIC")._VTraining.Hide_DLG(param);
	}
	//删除Loading界面
	void LMH_DelLoading()
	{
		window.find("LOADING_LOGIC").del();//删除loading界面
	}
	//训练完成
	void LMH_TrainOver()
	{
		//发出完成训练的消息-参数：训练ID
		window.Tos_AchieveTrain(""+window.g_TrainID);

		if (toint(window.g_TrainID) == window.ID_FORCETRAIN)
		{
			window.TrainingToHall();	//训练中到大厅
			return;
		}

		window.find("TRAINING_LOGIC").del();	//删除训练中的界面
		window.find("UIController").LoadUI("UI_TRAINOVER");
	}
	//亮与灰-跳过录像：按钮
	//参数 param：1灰 2亮
	void LMH_Gray_BtnSkipVideo(param)
	{
		window.find("TRAINING_LOGIC")._VTraining.Gray_BtnSkipVideo(param);
	}
	//亮与灰-重复训练：按钮
	//参数 param：1灰 2亮
	void LMH_Gray_BtnRetryTrain(param)
	{
		window.find("TRAINING_LOGIC")._VTraining.Gray_BtnRetryTrain(param);
	}
	//	亮与灰-下一步：按钮
	//参数 param：1灰 2亮
	void LMH_Gray_BtnNextVideo(param)
	{
		window.find("TRAINING_LOGIC")._VTraining.Gray_BtnNextVideo(param);
	}


	//显示或隐藏 录像下一步录像：按钮
	//参数 param:true / false
	void LMH_Hide_Btn_NextVideo(param)
	{
		window.find("TRAINING_LOGIC")._VTraining.Hide_Btn_NextVideo(param);
	}

	//显示或隐藏 跳过录像：按钮
	//参数 param:true / false
	void LMH_Hide_Btn_SkipVideo(param)
	{
		window.find("TRAINING_LOGIC")._VTraining.Hide_Btn_SkipVideo(param);
	}

	//显示或隐藏 重复训练：按钮
	//参数 param:true / false
	void LMH_Hide_Btn_RetryTrain(param)
	{
		window.find("TRAINING_LOGIC")._VTraining.Hide_Btn_RetryTrain(param);
	}
	//训练能量变化提示
	//参数param：true显示，false不显示
	void LMH_Tips_Training_Energy(param)
	{
		window.find("TRAINING_LOGIC")._VTraining.s_PowerTips.SetTips(param);
	}
	//训练剩余球数是否显示
	//参数param：true显示，false不显示
	void LMH_Remaining_Training_PointShow(param)
	{
		window.find("TRAINING_LOGIC")._VTraining.s_RemainingPoint.SetShowPoint(param);
	}
	//训练剩余球数
	//参数num：球数
	void LMH_Remaining_Training_Point(num)
	{
		window.find("TRAINING_LOGIC")._VTraining.s_RemainingPoint.SetData(num);
	}
	//训练失败 的对话框
	void LMH_TaianFail_DLG()
	{
		window.find("UIController").LoadDLG(91);//训练失败！
	}
	//训练中设置教练图片
	//参数：1，2，3
	void LMH_Training_CoachType(role,type)
	{
		window.find("TRAINING_LOGIC")._VTraining.s_Coach.SetType(role,type);
	}
	//蓄力条提示
	//参数 data: 0:默认 1:开始发球 2:发球结束
	void LMH_Training_StorePower(data)
	{
		window.find("TRAINING_LOGIC")._VTraining.s_StorePower.SetData(data,0,window.GetMyRID());
	}
	//是否为满蓄力-老虎调用
	//参数 param:1:开始发球 2:发球结束 3准备发球 4蓄力条暂停 5蓄力条消失 6显示满蓄力 7删除满蓄力
	void LMH_SetMaxSpeed(param)
	{
		printf("B# 是否为满蓄力-老虎调用:SetMaxSpeed："+param);
		//g_IsMaxSpeed = param;
		window.find("TRAINING_LOGIC")._VTraining.s_StorePower.SetData(param,0,window.GetRID());
	}

	//设置训练中的技能
	//参数 技能的ID
	void LMH_SetTrainSkill(enterID)
	{
		window.find("TRAINING_LOGIC")._VTraining.s_Skill.SetData(enterID);
	}
	//是否在训练中
	//返回：true/false
	void LMH_IsInTraining()
	{
		if(window.IsUIPos(window.POS_TRAINING))
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	//能否使用能量球
	//返回:true能使用/false不能使用
	void LMH_IsUsePower()
	{
		return window.find("VShortBarIcon_All_Logic_NAME").s_Item1.m_CanUse;
	}
}