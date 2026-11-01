//引导相关函数
//2010年9月15日 yxf

set window
{
	/*	切蛋糕算法
	
	|-----------------------|
	|						|
	|			1			|
	|.......|--------|......|
	|	2	|////////|	3	|
	|.......|--------|......|
	|			4			|
	|						|
	|-----------------------|

	虚线为要吃的蛋糕A。
	4刀切5块(最多的情况，即上图，A全在大蛋糕中间)
	*/

	//[功能]切蛋糕
	//[参数]eatcake:想吃蛋糕的参数:"sizex,sizey,posx,posy",例如("100,100,50,200")
	//		obj:对象的指针(传"NULL"时无效)
	//[返回值]剩余蛋糕的参数:"sizex,sizey,posx,posy;sizex,sizey,posx,posy" 例如："100,100,50,200;100,100,50,200....
	void PartCake(eatcake,obj)
	{
		var _width = 0;
		var _height = 0;
		var _left = 0;
		var _top = 0;
		
		if (tostring(obj) != "NULL")
		{
			//指针有效
			_width = obj.width;
			_height = obj.height;
			_left = obj.left;
			_top = obj.top;
		}
		else
		{
			//指针无效，size,pos有效
			var _eatcake_count = window.GetSplitCount(eatcake,",");
			if (_eatcake_count != 4)
				printf("8# err:PartCake()参数错误:"+eatcake);
		
			var _eatcake_array = window.SplitStr2(eatcake,",",_eatcake_count);

			_width = toint(_eatcake_array[0]);
			_height = toint(_eatcake_array[1]);
			_left = toint(_eatcake_array[2]);
			_top = toint(_eatcake_array[3]);
		}
		printf("8# PartCake()参数:_width:"+_width+",_height:"+_height+",_left:"+_left+",_top:"+_top);
		
		//剩余蛋糕参数
		var _leavecake = ""+window.width+","+ _top+";0,0;";
		_leavecake += ""+_left+","+_height+";0,"+_top+";";
		_leavecake += ""+(window.width - _left - _width )+ "," + _height +";" + (_left + _width)+ "," + _top+";";
		_leavecake += ""+window.width+","+ ( window.height - _height - _top )+ ";0,"+(_top + _height);

		printf("8# PartCake()结果:_leavecake："+_leavecake);
		return _leavecake;
	}

	//[功能]穿件其余蛋糕
	//[参数]_container:包容子对象的容器指针
	//		_sizepos:剩余蛋糕的参数:"sizex,sizey,posx,posy;sizex,sizey,posx,posy" 例如："100,100,50,200;100,100,50,200....
	//		_bgcolor:背景色
	//		_alpha:不透明度
	//[返回值]true,false
	void CreateOtherPartCake(_container,_sizepos,_bgcolor,_alpha)
	{
		var _othercake_count = window.GetSplitCount(_sizepos,";");
		if (_othercake_count != 8)
			printf("8# err:CreateOtherPartCake()参数错误:_othercake_count:"+_othercake_count+",_sizepos:"+_sizepos);

		var _othercake_array = window.SplitStr2(_sizepos,";",_othercake_count);
		
		var _i = 0;
		while(1)
		{
			if(_i >= 8) 
				break;
			
			set _container
			{
				new item
				{
					var _index = toint(_i)/2 + 1;
					name = "Name_OtherPartCake_"+_index;
					size = _othercake_array[_i];
					pos = _othercake_array[_i + 1];
					bgcolor = _bgcolor;
					alpha = _alpha;
				}
			}

			_i += 2;
		}
	}

	/*
		为策划提供一些强制引导的功能事件
	*/

	//[功能]根据任务ID选中任务列表中一项
	//[参数]_taskid:任务ID
	void FQ_CheckSelect_TaskList_ByID(_taskid)
	{
		window.find("TASK_LOGIC")._VTask_Logic._VTask_Normal_Logic._VTask_NormalTask_DBList_Logic.SelectSubObjBy(_taskid);
	}

	//[功能]点击了Normal(个人任务)的“接受任务”按钮
	void FQ_OnClick_Normal_AcceptTask_Btn()
	{
		window.find("TASK_LOGIC")._VTask_Logic._VTask_Normal_Logic.OnClick_AcceptTask();
	}

	//[功能]根据训练ID选中训练列表中一项
	//[参数]_trainid:训练ID
	void FQ_CheckSelect_TrainList_ByID(_trainid)
	{
		window.find("VTrain_CourseList_Logic_NAME").SelectSubObjBy(_trainid);
	}

	//[功能]点击了训练界面的“开始训练”按钮
	void FQ_OnClick_Train_BeginTrain_Btn()
	{
		window.find("TRAIN_LOGIC")._VTrain_Logic.OnClick_BtnEnter();		
	}

	//[功能]点击了训练说明界面的“训练”按钮
	void FQ_OnClick_TrainDesc_Train_Btn()
	{
		window.find("TRAIN_POP_LOGIC")._Train.OnClick_Begin();		
	}

	//[功能]点击了训练结算界面提示框的“返回大厅”按钮
	void FQ_OnClick_TrainOver_BackToHall_Btn()
	{
		window.find("PLAYOVER_DLG_LOGIC")._DLG.OnClick_Btn2();
	}
		
	//[功能]点击了Normal(个人任务)的“交付任务”按钮
	void FQ_OnClick_Normal_CompleteTask_Btn()
	{
		window.find("TASK_LOGIC")._VTask_Logic._VTask_Normal_Logic.OnClick_CompleteTask();
	}

	//[功能]点击了商城界面-金币+奖券购物区 按钮
	void FQ_OnClick_Mall_GoldBuy_Btn()
	{
		window.find("MALL_LOGIC")._VMall_Logic.s_Btn_ComfortShopping.OnPressed();
	}

	//[功能]点击了商城界面-金币+奖券购物区 - 球拍标签 按钮
	void FQ_OnClick_Mall_GoldBuy_Packet_Btn()
	{
		window.find("MALL_LOGIC")._VMall_Logic.m_Class_Shopping.Check_UnCheck(5);
	}

	//[功能]点击了商城界面-金币+奖券购物区 - 技能标签 按钮
	void FQ_OnClick_Mall_GoldBuy_Skill_Btn()
	{
		window.find("MALL_LOGIC")._VMall_Logic.m_Class_Shopping.Check_UnCheck(6);
	}
	//[功能]根据物品ID选中商城的一个物品
	//[参数]itemid:物品ID
	void FQ_CheckSelect_MallGoodsList_ByID(itemid)
	{
		window.find("VMall_DressList_Logic_NAME").SelectSubObjBy(itemid);
	}

	//[功能]点击了商城界面-购买按钮
	void FQ_OnClick_Mall_Buy_Btn()
	{
		window.find("MALL_LOGIC")._VMall_Logic.OnClick_Buy();
	}

	//[功能]点击了商城购物车界面-确定按钮
	void FQ_OnClick_Mall_BuyCar_Confirm_Btn()
	{
		window.find("MALL_BUY_LOGIC")._BuyCar.OnClick_BtnConfirm();
	}

	//[功能]点击了背包-球拍的第一个
	void FQ_OnClick_PackList_First()
	{
		window.find("VPack_DBList_Logic_NAME").SelectSubObjBy();
		var _GID = window.find("VPack_DBList_Logic_NAME").GetCurrSelectData();
		window.OnClick_PackGoods(_GID);
	}

	//[功能]选中邮件列表第一个
	void FQ_CheckSelect_MailList_First()
	{
		window.find("VMailList_Logic_NAME").SelectSubObjBy();
	}

	//[功能]点击了邮件界面 - 接受按钮
	void FQ_OnClick_Mail_Receive_Btn()
	{
		window.find("MAIL_LOGIC")._VMail_Logic.OnClick_Receive();
	}

	//[功能]点击了提示框的确定按钮
	void FQ_OnClick_MsgBox_Confirm_Btn()
	{
		window.find("VMyMessageBox_1_Logic").OnConfirm();
	}
}