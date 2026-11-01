//
//训练结算界面+游戏结算界面下面的一个选择条(包含说明文字+两个按钮)类定义：逻辑
//
importex("$./../../UI/TrainOver/ClassDef_DLG.gml");

class VPlayOver_DLG_Logic item
{
	size = "400,500";bgcolor = "#FFFF";alpha = 50;
	pos = "0,712";
	var m_Type = 0;	//训练的类型  1训练 2游戏
	var m_TrainID = -2;	//训练的ID
	var m_IsAllFinish = -1;	//是否全部做完
	var m_ChannelType = 0;	//训练的类型-与频道类型一样
	//===================================与显示交互部分========================================
	void Init()
	{
		//说明文字
		//参数 data1:内容
		//接口:void SetData()
		staticvar s_TEXT_Explain = new VMyText{}

		//按钮一
		//参数 data1:按钮名字
		//接口:void SetData()
		staticvar s_Btn_1 = new VMyButton
		{
			pos(800,0);
			void SetData(data1){Init(data1);}
		}

		//按钮二
		//参数 data1:按钮名字
		//接口:void SetData()
		staticvar s_Btn_2 = new VMyButton
		{
			pos(900,0);
			void SetData(data1){Init(data1);}
		}
	}
	//界面显示类
	inclass("VPlayOver_DLG_UI");
	//=======================================function==========================================
	Init();
	//设置响应事件
	void SetEvent()
	{
		set s_Btn_1//按钮一
		{
			void OnPressed(){parent.OnClick_Btn1();}
		}
		set s_Btn_2//按钮二
		{
			void OnPressed(){parent.OnClick_Btn2();}
		}
	}
	//点击了按钮一:继续训练/某个训练
	void OnClick_Btn1()
	{
		printf("B# [结算]选择条点击了按钮1-前：m_Type:"+m_Type+",m_TrainID:"+m_TrainID+",g_TrainType:"+window.g_TrainType+",g_TrainID:"+window.g_TrainID);
		if (m_Type == 1)//1训练
		{
			window.g_TrainType = 2;		//训练的类型：0强制训练 1正常(训练选择) 2(训练中弹出)
			window.g_TrainID = m_TrainID;
			window.find("TRAINOVER_LOGIC").del();	//删除训练结算界面
			window.find("PLAYOVER_DLG_LOGIC").del();//删除结算选择条
			
			window.find("UIController").LoadUI("UI_TRAIN_POP"); 
		}
		if (m_Type == 2)//2游戏
		{
			if (m_TrainID == 99) //把他弄到资格赛或更高
			{
				window.SetSerType(toint(m_ChannelType)+1);
				window.HallToChannelChoose();//大厅到频道选择
			}
			else
			{
				window.g_TrainID = m_TrainID;
				window.g_TrainType = 1;		//训练的类型：0强制训练 1正常(训练选择) 2(训练中弹出)
				window.GameToTrain();		//游戏到训练外
				window.find("UIController").LoadUI("UI_TRAIN_POP"); 	
			}
		}
		printf("B# [结算]选择条点击了按钮1-后：m_Type:"+m_Type+",m_TrainID:"+m_TrainID+",g_TrainType:"+window.g_TrainType+",g_TrainID:"+window.g_TrainID);
	}
	//点击了按钮二:去比赛/去资格赛-回到房间
	void OnClick_Btn2()
	{
		printf("B# [结算]选择条点击了按钮2-前：m_Type:"+m_Type+",m_TrainID:"+m_TrainID+",g_TrainType:"+window.g_TrainType+",g_TrainID:"+window.g_TrainID);
		if (m_Type == 1)//1训练
		{
			if (m_IsAllFinish == 99)//全部完成
			{	
				window.SetSerType(toint(m_ChannelType)+1);
				window.HallToChannelChoose();//大厅到频道选择
			}
			else
			{
				window.TrainingToHall();	//训练中到大厅
			}
		}
		if (m_Type == 2)//2游戏
		{
			var _uipos = window.GetUIPos();
			if(_uipos == window.POS_GAMEOVER)
			{
				window.find("GAME_OVER_LOGIC").OnClick_BtnBackToRoom();
			}
			if(_uipos == window.POS_GAMEOVER_TURNCARDS)
			{
				window.find("GameOver_TurnCards_Logic").OnClick_BtnBackToRoom();
			}
			
		}
		printf("B# [结算]选择条点击了按钮2-后：m_Type:"+m_Type+",m_TrainID:"+m_TrainID+",g_TrainType:"+window.g_TrainType+",g_TrainID:"+window.g_TrainID);
	}
	SetEvent();
	//=========================================DB===============================================
	//从数据库中取相关数据 
	//参数1 type：类型 1训练 2游戏
	//参数2 Currid：当前训练ID / 所在频道(1-7)
	//参数3 nextID：下一个训练ID(游戏结算-1无效，训练结束有效2-7)
	//参数4 allFinish：全部完成且级别达到99  完成但级别不够98 未完成为-1 / 高手装菜鸟(99)
	void GetDataFromDB(type,Currid,nextID,allFinish)
	{	
		printf("B# [结算]训练选择条:GetDataFromDB()type:"+type+",Currid:"+Currid+",nextID:"+nextID+",allFinish:"+allFinish);
		//在此计算下边的选择条ID
		var _DLGID = 0;
		m_Type = type;
		m_IsAllFinish = allFinish;
		if (type == 1)//1训练
		{
			timer(3000,"Timer_Tip_CXF("+Currid+")");
			
			m_TrainID = nextID;
			m_ChannelType = window.GetTrianTypeByID(Currid);	//训练的类型-与频道类型一样
			if (m_IsAllFinish == -1)//未完成
			{
				_DLGID = 1000+toint(m_ChannelType)*100+toint(Currid);
			}
			else
			{
				window.LMH1_AllTrain_Finish();	//引导事件

				//当前频道和训练的类型一致，且获得称号，则去往下一个级别的频道
				if ((window.GetSerType() == m_ChannelType) 
					&& (window.GetQualifyByUID(window.GetMyUID()) == toint(m_ChannelType)+1))
				{
					_DLGID = 1000+toint(m_ChannelType)*100+99;
				}
				else
				{
					m_IsAllFinish = 98;
					_DLGID = 1000+toint(m_ChannelType)*100+98;
				}
			}
		}
		else
		{
			if(window.GetUIPos() == window.POS_GAMEOVER_TURNCARDS)
			{
				parent.timer(2000,"show=true");
			}
			else
			{
				parent.timer(7000,"show=true");
			}
			

			if (allFinish.__Long__ == 99)//高手装菜鸟(99)
			{
				m_ChannelType = Currid;
				m_TrainID = allFinish;
				_DLGID = 2000 + Currid*100 + m_TrainID;
			}
			else
			{
				m_TrainID = Currid;
				_DLGID = 2000 + m_TrainID;
			}
		}
		
		printf("B# [结算]训练选择条:ID:"+_DLGID+",m_TrainID:"+m_TrainID+",m_Type:"+m_Type);
		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByInt(window.TENNIS_GAME,window.TRAIN_DLG,window.TENNIS_GAME_TRAIN_DLG_ID,_DLGID);
		if (!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			printf("B# error-[结算]训练结算选择条:DBname:"+window.TENNIS_GAME+",TBName:"+window.TRAIN_DLG);
			return;
		}
		s_TEXT_Explain.SetData(_VNet2DBRow.GetData(window.TENNIS_GAME_TRAIN_DLG_TEXT));//提示的内容
		s_Btn_1.SetData(_VNet2DBRow.GetData(window.TENNIS_GAME_TRAIN_DLG_OVERBTN1));//按钮1
		s_Btn_2.SetData(_VNet2DBRow.GetData(window.TENNIS_GAME_TRAIN_DLG_OVERBTN2));//按钮2
		
		_VNet2DBRow.del();
	}

	//[功能]显示时提示强制引导
	//[参数]iTrainid:训练ID
	void Timer_Tip_CXF(iTrainid)
	{
		parent.show=true;
		window.CXF_OnTrainOver_DLG(iTrainid);//训练完成-的提示框 2010年9月17日13:40
	}
};
