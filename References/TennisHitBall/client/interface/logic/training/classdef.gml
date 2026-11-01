//
//训练中界面的逻辑类定义
//

importex("$./../../UI/Training/ClassDef.gml");
import("$./../Game/ClassDef_PlayLogic_Sub.gml");

class VTraining_Logic item
{
	size = "100%,100%";bgcolor = "#FF";alpha = 50;
	var _CKey = new CKeySet{}
	var _VNet2DBRow = new VNet2DBRow{}
	//=============================与界面交互========================================
	void Init()
	{
		//我的昵称+能量
		//参数：见类定义$./../Game/ClassDef_PlayLogic_Sub.gml
		staticvar s_Head = new VRole_Name_Energy_Logic
		{
			//参数 param:true / false
			void SetData2(param){show = param;}
		}

		//我的技能
		//参数：见类定义$./../Game/ClassDef_PlayLogic_Sub.gml
		staticvar s_Skill = new VRole_Skill_Icon_Logic
		{
			pos = "0,100";
			//参数 param:true / false
			void SetData2(param){show = param;}
		}

		//右上角进度
		//参数2 data2:当前数
		//参数3 data3:总数
		staticvar s_Point = new VMyText
		{
			halign(100,0);bgcolor = "#FFFFFF";
			//参数 param:true / false
			void SetData2(param){show = param;}
		}

		//开始训练+完成的提示
		//参数 data2: 文件名
		staticvar s_TipInfo = new VMyText
		{
			valign(50,50);halign(50,50);
			font = "宋体,-1,30";bgcolor = "#FFFF";
			//参数 param:true / false
			void SetData2(param){show = param;}
		}

		//键盘-元素名字需要与逻辑相同
		staticvar s_KeyBoard = new item
		{
			size = "300,150";pos = "700,400";bgcolor = "#FFFFFF";

			/*对按键的操作
			参见类定义 $./../GmlCtrls/Common/ClassDef_Text.gml
			//设置数据
				void SetData(data1)  参数1 ：可用
			//设置动画
				void SetAni(param)  参数1 ：1开始动画 2停止动画-按下状态 3停止动画-抬起状态
			*/

			//方向键：左
			var _left = new VKeyText{pos(0,50);}
			//方向键：右
			var _right = new VKeyText{pos(50,50);}
			//方向键：上
			var _up = new VKeyText{pos(25,10);}
			//方向键：下
			var _bottom = new VKeyText{pos(25,50);}
			//击球键：(J)
			var _J = new VKeyText{pos(70,50);}
			//击球键：(K)
			var _K = new VKeyText{pos(80,50);}
			//击球键：(L)
			var _L = new VKeyText{pos(90,50);}

			//参数1 param:true / false 显示隐藏
			void SetData2(param){show = param;}
		}

		//对话框
		staticvar s_DLG = new item
		{
			size = "100%,15%";valign(100,0);
			bgcolor = "#FFFF";alpha = 50;
			//对话框：文字
			var _Text = new VMyText
			{
				size = "80%,100%";xcenter - true;ycenter = true;
			}

			//参数1 param:true / false 显示隐藏
			void SetData2(param){show = param;}

			//参数 data1:对话的内容
			void SetData(data1)
			{
				_Text.SetData(data1);
			}
		}

		//蓄力条
		//参数 data1: 0:默认 1:开始发球 2:发球结束
		staticvar s_StorePower = new VMyText{valign(90,0);halign(50,0);}

		//跳过录像：按钮
		staticvar s_Btn_SkipVideo = new VMyButton
		{
			Init("跳过录像");pos = "200,300";
		}

		//重复训练：按钮
		staticvar s_Btn_RetryTrain = new VMyButton
		{
			Init("重复训练");pos = "300,300";
		}
		//下一步：按钮
		staticvar s_Btn_NextVideo = new VMyButton
		{
			Init("下一步");pos = "300,300";
		}
	}
	inclass("VTraining_UI");//界面显示类
	Init();
	//==============================function=========================================
	//初始化所有的显示样式-目前都隐藏
	void Init_Show()
	{
		s_Head.show = false;
		s_Skill.show = false;
		s_Point.show = false;
		s_TipInfo.show = false;
		s_KeyBoard.show = false;
		s_DLG.show = false;
	}
	Init_Show();
	//设置响应事件
	void SetEvent()
	{
		set _CKey//初始化键盘的按键
		{
			void OnCreated()
			{
				parent.s_KeyBoard._up.SetData(GetKeyValue(0),"");
				parent.s_KeyBoard._bottom.SetData(GetKeyValue(1),"");
				parent.s_KeyBoard._left.SetData(GetKeyValue(2),"");
				parent.s_KeyBoard._right.SetData(GetKeyValue(3),"");
				parent.s_KeyBoard._J.SetData(GetKeyValue(4),"");
				parent.s_KeyBoard._K.SetData(GetKeyValue(5),"");
				parent.s_KeyBoard._L.SetData(GetKeyValue(6),"");

				del();
			}
		}
		set s_Btn_SkipVideo//跳过录像：按钮
		{
			void OnPressed()
			{
				if (GetState() == window.USER_STATE_REDAY) //亮的时候才能点
				{
					window.find("GAMELAYER").find("NAME_GCMap").OnClick_SkipVideo();
				}
			}
		}
		set s_Btn_RetryTrain//重复训练：按钮
		{
			void OnPressed()
			{
				if (GetState() == window.USER_STATE_REDAY) //亮的时候才能点
				{
					window.find("GAMELAYER").find("NAME_GCMap").OnClick_RetryTrain();
				}
			}
		}
		set s_Btn_NextVideo
		{
			name = "BtnName_Train_Next";
			void OnPressed()
			{
				if (GetState() == window.USER_STATE_REDAY) //亮的时候才能点
				{
					window.find("GAMELAYER").find("NAME_GCMap").OnClick_NextVideo();
				}
			}
		}
	}
	//=================================外部接口=显示隐藏================================
	//显示或隐藏昵称+能量
	//参数 param:true / false
	void Hide_HeadName(param)
	{
		if (window.g_DEBUG){printf("B# T-Hide_HeadName:param:"+param);}
		s_Head.SetData2(param);
	}
	//显示或隐藏技能
	//参数 param:true / false
	void Hide_Skill(param)
	{
		if (window.g_DEBUG){printf("B# T-Hide_Skill:param:"+param);}
		s_Skill.SetData2(param);
	}
	//显示或隐藏键盘
	//参数 param:true / false
	void Hide_KeyBoard(param)
	{
		if (window.g_DEBUG){printf("B# T-Hide_KeyBoard:param:"+param);}
		s_KeyBoard.SetData2(param);
	}
	//显示或隐藏右上角进度
	//参数 param:true / false
	void Hide_Point(param)
	{
		if (window.g_DEBUG){printf("B# T-Hide_Point:param:"+param);}
		s_Point.SetData2(param);
	}
	//显示或隐藏中间提示：开始或者完成
	//参数 param:true / false
	void Hide_TipInfo(param)
	{
		if (window.g_DEBUG){printf("B# T-Hide_TipInfo:param:"+param);}
		s_TipInfo.SetData2(param);
	}
	//显示或隐藏对话框
	//参数 param:true / false
	void Hide_DLG(param)
	{
		if (window.g_DEBUG){printf("B# T-Hide_DLG:param:"+param);}
		s_DLG.SetData2(param);
	}
	//显示或隐藏 跳过录像：按钮
	//参数 param:true / false
	void Hide_Btn_SkipVideo(param)
	{
		if (window.g_DEBUG){printf("B# T-Hide_Btn_SkipVideo:param:"+param);}
		s_Btn_SkipVideo.show = param;
	}
	//显示或隐藏 重复训练：按钮
	//参数 param:true / false
	void Hide_Btn_RetryTrain(param)
	{
		if (window.g_DEBUG){printf("B# T-Hide_Btn_RetryTrain:param:"+param);}
		s_Btn_RetryTrain.show = param;
	}

	//显示或隐藏 下一步：按钮
	//参数 param:true / false
	void Hide_Btn_NextVideo(_param)
	{
		if (window.g_DEBUG){printf("B# T-Hide_Btn_NextVideo:param:"+_param);}
		s_Btn_NextVideo.show = _param;
	}


	//=================================外部接口=数据更新================================
	//控制键盘按键的动画
	//参数1 index：序号 1上 2下 3左 4右 5J 6K 7L
	//参数2 state: 1开始动画 2停止动画-按下状态 3停止动画-抬起状态
	void AniCtrl_KeyBoard(index,state)
	{
		switch (index)
		{
			case 1:{s_KeyBoard._up.SetAni(state);break;}
			case 2:{s_KeyBoard._bottom.SetAni(state);break;}
			case 3:{s_KeyBoard._left.SetAni(state);break;}
			case 4:{s_KeyBoard._right.SetAni(state);break;}
			case 5:{s_KeyBoard._J.SetAni(state);break;}
			case 6:{s_KeyBoard._K.SetAni(state);break;}
			case 7:{s_KeyBoard._L.SetAni(state);break;}
		}
	}

	//函数	SetSkillState：改变技能的状态:第3个亮则前两个都亮
	//参数1	index：索引1上旋 2削球 3扣杀 4放高球 5发球
	//参数2	SkillID：技能ID
	//参数3	state：0默认状态 1改变后的状态
	void SetSkillState(index,SkillID,state)
	{
		if (window.g_DEBUG)
		{
			printf("B# T-SetSkillState:index:"+index+",SkillID:"+SkillID+",state:"+state);
		}
		switch (index)
		{
			case 1:{s_Skill.s_Skill_Icon1.SetData("技能1ID:",SkillID,state);break;}
			case 2:{s_Skill.s_Skill_Icon2.SetData("技能2ID:",SkillID,state);break;}
			case 3:{s_Skill.s_Skill_Icon3.SetData("技能3ID:",SkillID,state);break;}
			case 4:{s_Skill.s_Skill_Icon4.SetData("技能4ID:",SkillID,state);break;}
			case 5:{s_Skill.s_Skill_Icon5.SetData("技能5ID:",SkillID,state);break;}
		}
	}
	//函数 UpData_CurrEnergy:更新当前能量/技能
	//参数1 CurrEnergy:当前能量
	void UpData_CurrEnergy(CurrEnergy)
	{
		if (window.g_DEBUG)
		{
			printf("B# T-UpData_CurrEnergy()-CurrEnergy:"+CurrEnergy+",总能量:"+parent.m_User1.GetEnergy());
		}
		s_Head.s_CurrEnergy.SetData("能量:",CurrEnergy,parent.m_User1.GetEnergy());
	}

	//函数 UpData_CurrStamina:更新当前体力
	//参数1 CurrEnergy:当前能量
	void UpData_CurrStamina(CurrStamina)
	{
		if (window.g_DEBUG)
		{
			printf("B# T-UpData_CurrStamina()-CurrStamina:"+CurrStamina+",总体力:"+parent.m_User1.GetStamina());
		}
		s_Head.s_Stamina.SetData("体力:",CurrStamina,parent.m_User1.GetStamina());
	}

	//更新右上角进度
	//参数1 当前数curr
	//参数2 总数all
	void Updata_Point(curr,all)
	{
		if (window.g_DEBUG)
		{
			printf("B# T-Updata_Point:curr:"+curr+",all:"+all);
		}
		s_Point.SetData("比分:",curr,all);
	}
	//更新TipInfo
	//参数1 time:时机(开始1,结束2)
	//参数2 type:结果(开始可以为"",可以不为空/0 结束：1成功 2失败)
	void Updata_TipInfo(time,type)
	{
		if (window.g_DEBUG)
		{
			printf("B# T-Updata_TipInfo:time:"+time+",type:"+type);
		}
		var _fileName = "";
		if (time == 1)
		{
			if (type == "")
			{
				_fileName = window.GetTrainIcon(window.g_TrainID);
			}
			else
			{
				_fileName = type;
			}
		}
		if (time == 2)
		{
			switch (type)
			{
				case 1:{_fileName = "Succes";break;}
				case 2:{_fileName = "Lose";break;}
			}
		}
		s_TipInfo.SetData("中间提示信息:",_fileName);
	}
	//更新对话框的内容
	//参数1 ID:需要显示对话框的ID
	void UpData_DLG(id)
	{
		_VNet2DBRow.InitByInt(window.TENNIS_GAME,window.TRAIN_TIP,window.TENNIS_GAME_TRAIN_TIP_ID,id);
		if (!_VNet2DBRow.IsReady())
		{
			_VNetDBRow.Release();
			if (window.g_DEBUG)
			{
				printf("B# error-UpData_DLG:DBname:"+window.TENNIS_GAME+",TBName:"+window.TRAIN_TIP+",id:"+id);
			}
			return;
		}
		var _text = _VNet2DBRow.GetData(window.TENNIS_GAME_TRAIN_DLG_TEXT);
		s_DLG.SetData(_text);
		_VNetDBRow.Release();
	}
	//蓄力条：操作
	//参数: 0:默认 1:开始发球 2:发球结束
	void UpData_StorePower(param,time,rid)
	{
		if (window.g_DEBUG)
		{
			printf("B# Train-蓄力条：1:开始发球 2:发球结束："+param+",time:"+time+",rid:"+rid);
		}
		s_StorePower.SetData(param,time,rid);
	}
	//亮与灰-跳过录像：按钮
	//参数 param：1灰 2亮
	void Gray_BtnSkipVideo(param)
	{
		if (window.g_DEBUG)
		{
			printf("B# Train-亮与灰-跳过录像：1灰 2亮："+param);
		}
		s_Btn_SkipVideo.SetState(param);
	}
	//亮与灰-重复训练：按钮
	//参数 param：1灰 2亮
	void Gray_BtnRetryTrain(param)
	{
		if (window.g_DEBUG)
		{
			printf("B# Train-亮与灰-重复训练：1灰 2亮："+param);
		}
		s_Btn_RetryTrain.SetState(param);
	}

	//亮与灰-下一步录像：按钮
	//参数 param：1灰 2亮
	void Gray_BtnNextVideo(param)
	{
		if (window.g_DEBUG)
		{
			printf("B# Train-亮与灰-下一步录像：1灰 2亮："+param);
		}
		s_Btn_NextVideo.SetState(param);
	}
	//================================DBList=========================================
	//己方的记录
	var _VNet2DBRow1 = new VNet2DBRow
	{
		void InitDB()
		{
			InitByInt(window.M_G_CLINET,window.GAMESHOW,0,window.GetMyRID(),1);
			AddDBEvent("OnMyDataChange",0,1,3,5,6,7,8,9,11,12,13,14,15,26,27,28,33,41,42);
		}
		//索引，0角色ID,1用户ID,3游戏状态,5第几局,6局的分数,7比分,8当前能量,9球的前后场,11提示状态1,12提示状态2,13提示状态3,14帅气的动作,15改变的索引,26发球事件
		//3 GameState:游戏状态 2:开始 3:正中进行 4:结束 5:结束后
		//11 TipState1:提示 0:没有交换场地 1.有
		//12 TipState2:提示 0:不是破发点 1.有
		//13 TipState3:提示 0:默认状态 1.局点 2.赛点
		//14 HandsomeAction:帅气的动作 -1.默认值 0.普通结束 1.发球得分 2.扣杀 3.绝杀 4.反杀
		//15 RefreshIndex:改变的索引 1.帅气的动作 2.局分 3.比赛前的数据 4:游戏开始 5:游戏结束
		//26 ServeEvent: 发球事件 0:默认 1:开始发球 2:发球结束
		//27 WinOrLost	一局输或者赢 1表示输 2表示赢 只通知自己那行记录 在RefreshIndex==2后清除
		//28 EndWinOrLost 一场比赛的输赢 0为默认 1表示输 2表示赢 在RefreshIndex==5后有效
		//33 ServeTime 蓄力的时间
		void OnMyDataChange(index,RoleID,UserID,GameState,GameNum,GameScore,Point,CurrEnergy,
			BallInSelf,TipState1,TipState2,TipState3,HandsomeAction,RefreshIndex,ServeEvent,
			WinOrLost,EndWinOrLost,ServeTime,CurrStamina,MaxStamina)
		{
			if (window.g_DEBUG)
			{
				printf("B# Train-P1:index:"+index+",RoleID:"+RoleID+",UserID:"+UserID+",GameState:"+GameState
				+",GameNum:"+GameNum+",GameScore:"+GameScore+",Point:"+Point
				+",CurrEnergy:"+CurrEnergy+",BallInSelf:"+BallInSelf
				+",TipState1:"+TipState1+",TipState2:"+TipState2+",TipState3:"+TipState3
				+",HandsomeAction:"+HandsomeAction+",RefreshIndex:"+RefreshIndex+",ServeEvent:"+ServeEvent
				+",WinOrLost:"+WinOrLost+",EndWinOrLost:"+EndWinOrLost+",ServeTime:"+ServeTime);
			}
			switch (index)
			{
				//case 8:{parent.UpData_CurrEnergy(UserID,CurrEnergy,BallInSelf);break;}
				//case 9:{parent.UpData_CurrEnergy(UserID,CurrEnergy,BallInSelf);break;}
				case 26:
				{
					parent.UpData_StorePower(ServeEvent,ServeTime,RoleID);
					break;
				}
				case 41:
				{
					parent.UpData_CurrStamina(CurrStamina);
					break;
				}
				case 42:
				{
					//最大体力改变时
					//parent.UpData_CurrStamina(CurrStamina);
					break;
				}
			}
		}
	}
	void OnCreated()
	{
		SetEvent();
		s_Head.Init();
		s_Skill.Init();
		s_Head.s_NickName.SetData("昵称:",parent.m_User1.GetNkName(),"");
		s_Head.s_CurrEnergy.SetData("当前能量:",0,parent.m_User1.GetEnergy());
		_VNet2DBRow1.InitDB();
	}
};