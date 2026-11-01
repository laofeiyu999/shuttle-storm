//
//训练界面的每一个独立训练的弹出类定义
//

importex("$./../../UI/Train/ClassDef_SingleWnd.gml");

class VTrainSingleWnd_Logic item
{
	size = "400,500";bgcolor = "#FFFF";alpha = 50;
	valign(50,0);halign(50,0);
	var m_TrainID = -1;	//训练ID
	//var m_Time = -1;	//物品的有效期
	var m_Style = 0;	//1普通训练 2自由训练
	//=============================与界面交互========================================
	void Init()
	{
		//训练类型：
		//参数2 data2:对应数据库的图标名
		staticvar s_Type = new VMyText{pos = "1,10";}

		//说明
		//参数2 data2:说明
		staticvar s_Explain = new VMyText
		{
			pos = "1,50";size = "400,150";autoenter = true;
		}
		
		//奖励-物品
		//参数1 data2:格式："物品ID1,数量,有效期;物品ID2,数量,有效期"
		staticvar s_AwardGoods = new VMyText{pos = "1,200";}

		//奖励-金币
		//参数2 data2:
		staticvar s_Award_Gold = new VMyText{pos = "200,400";}

		//奖励-经验
		//参数2 data2:
		staticvar s_Award_Exp = new VMyText{pos = "300,400";}

		//开始训练：按钮
		staticvar s_Btn_BeginTrain = new VMyButton
		{
			pos="23,429";Init("开始训练");
		}
		//返回：按钮
		staticvar s_Btn_Return = new VMyButton
		{
			pos="226,435";Init("返回");
		}
	}
	inclass("VTrainSingleWnd_UI");//界面显示类
	//==============================function=========================================
	//点击了进入
	void OnClick_Begin()
	{
		printf("B# 点击了训练提示的进入,m_TrainID:"+m_TrainID);
		var cancelType = 0;
		
		if (m_Style == window.TRAIN_TYPE_FREE)
		{
			cancelType = window.CANCELRACE_FREETRAIN;
		}

		if (m_Style == window.TRAIN_TYPE_COMMON)
		{
			cancelType = window.CANCELRACE_COMMONTRAIN;
		}

		if (window.JudgeIsNeedCancelQueue(cancelType))//window.CANCELRACE_FREETRAIN))
		{
			printf("B# JudgeIsNeedCancelQueue-HallToFreeTrain():");
			return;
		}

		//发出进入训练的消息,参数：训练ID
		window.Tos_EnterTrain(""+m_TrainID,m_Style);

		if (m_Style == window.TRAIN_TYPE_COMMON)
		{
			parent.del();
			return;
		}
		if (m_Style == window.TRAIN_TYPE_FREE)
		{
			window.SetUIGameState(window.USER_UISTATE_AI_FREETRAIN);//2009年12月24日
			window.HallToFreeTrain();
			return;
		}
	}
	//点击了返回
	void OnClick_Return()
	{
		printf("B# 点击了训练提示的返回,g_TrainType:"+window.g_TrainType);
		//训练的类型：0强制训练 1正常(训练选择) 2(训练中弹出)
		if (window.g_TrainType == 1)
		{
			parent.del();
			return;
		}
		else
		{
			parent.del();
			if (window.g_IsForceTrain)
			{
				window.TrainingToHall();
			}
			else
			{
				window.TrainingToTrain();//训练中到训练外
			}
		}
	}
	//设置响应事件
	void SetEvent()
	{
		set s_Btn_BeginTrain
		{
			void OnPressed(){parent.OnClick_Begin();}
		}
		set s_Btn_Return
		{
			void OnPressed(){parent.OnClick_Return();}
		}
		set s_Btn_Close
		{
			void OnPressed(){parent.OnClick_Return();}
		}
	}
	//从数据库中取相关数据 
	void GetDataFromDB()
	{
		m_TrainID = window.g_TrainID;
		
		if (m_TrainID <= 0)
		{
			parent.del();
			window.find("UIController").LoadDLG(35);//请选择一个训练！
			return;
		}
		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByInt(window.TENNIS_GAME,window.TRAIN,window.TENNIS_GAME_TRAIN_ID,m_TrainID);
		if (!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			printf("D# error-训练框:DBname:"+window.TENNIS_GAME+",TBName:"+window.TRAIN+",m_TrainID:"+m_TrainID);
			return;
		}
		m_Style = _VNet2DBRow.GetData(window.TENNIS_GAME_TRAIN_STYLE);
		s_Type.SetData("类型图标名:",_VNet2DBRow.GetData(window.TENNIS_GAME_TRAIN_ICON),"");//训练类型：图标
		s_Explain.SetData("说明:",_VNet2DBRow.GetData(window.TENNIS_GAME_TRAIN_EXPLAIN),"");//说明

		var _State = _VNet2DBRow.GetData(window.TENNIS_GAME_TRAIN_STATE);//状态 0未通过 1通过
		if (_State == 0)
		{
			s_Award_Gold.SetData("金币:",_VNet2DBRow.GetData(window.TENNIS_GAME_TRAIN_AWARD_GOLD),"");//奖励-金币
			s_Award_Exp.SetData("经验:",_VNet2DBRow.GetData(window.TENNIS_GAME_TRAIN_AWARD_EXP),"");//奖励-经验

			var _Item = "";//物品ID,有效期
			if (window.GetMySex() == window.USER_SEX_MAN)//男性物品
			{
				_Item = _VNet2DBRow.GetData(window.TENNIS_GAME_TRAIN_AWARD_ITEM1);//物品ID,有效期
			}
			else
			{
				_Item = _VNet2DBRow.GetData(window.TENNIS_GAME_TRAIN_AWARD_ITEM2);//物品ID,有效期
			}
			if (_Item != "" && _Item != 0)
			{
				s_NUllBG_1.show = false;
				s_NUllBG_2.show = false;
			}
			s_AwardGoods.SetData("",_Item,0,0,0);
		}
		else
		{
			s_Award_Gold.SetData("金币:",_VNet2DBRow.GetData(window.TENNIS_GAME_TRAIN_AWARD_GOLD2),"");//奖励-金币
			s_Award_Exp.SetData("经验:",_VNet2DBRow.GetData(window.TENNIS_GAME_TRAIN_AWARD_EXP2),"");//奖励-经验
			
			SetSingleWnd();//显示的函数
		}

		_VNet2DBRow.del();
	}
	//================================DBList=========================================
	Init();
	SetEvent();
	GetDataFromDB();
};