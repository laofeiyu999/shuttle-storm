
set window
{
	var g_TaskChageState = 0;	//任务状态改变0:自动 1:手动 chenjihui 2011-1-7
	void OnTaskCompleted(taskid)
	{//条件满足了,任务可以完成了
		window.PlaySound(145);
		window.LMH_Complete_Mission();
		window.SubmitTask_tip(taskid)
	}

	void TaskComplete(taskid)
	{//查询任务是否做完了
		return window.find("HallFuckSelf").parent.find("self").TaskComplete(taskid);
	}

	void OnTaskComplete(taskid)
	{//任务提交成功
		window.LMH_Submit_Mission();
		var _data = "交付任务["+window.GetTaskNameByID(taskid)+"]";
		window.find("TaskMsgShow_Logic").SetData(_data,1);
		window.CompleteTask_tip(taskid);
		timer(500,"TaskFresh");
	}
	//[功能]刷新任务列表	夏洋洋添加于2009-12-22
	//[参数值]无
	//[返回值]无
	void TaskFresh()
	{
		window.find("VTask_Normal_Logic")._VTask_NormalTask_DBList_Logic.ReFresh();
		window.find("VTask_Everyday_Logic")._Task_EverydayTask_DBList_Logic.ReFresh();
	}

	void OnTaskComplete1(taskid)
	{//日常任务提交成功了
		window.LMH_Submit_Mission();
	}

	void TaskErrMsg(errid,param)
	{
	}

	void CheckAwardOk(param)
	{
	}

	void SetTaskContent(tmp,info,iscomplete)
	{
		var data = window.DelTaskFlagStr(info);
		window.find("TaskMsgShow_Logic").SetData(data,iscomplete);
	}

	var _Task_Everyday_Logic=0;
	void OnCompletedNum(num,IsComplete)
	{
		_Task_Everyday_Logic.OnCompletedNum(num);

		if (IsComplete==1)
		{
			window.LMH_Submit_Mission();
			//自己产生交任务特效,
			//window.GetSelf().bodyeffmgr.CreateEff(68,14);
		}
	}

	void DelTaskFlagStr(Str)
	{
		Str=Str.Replace("@","");

		while (true)
		{
			var _pos0=Str.Find("|",0);
			var _pos1=Str.Find("|",_pos0+1);

			if (_pos0<0 || _pos1<0 || _pos0==_pos1)
			{
				break;
			}

			Str=Str.Replace(Str.Mid(_pos0,_pos1-_pos0+1),"");
		}
		
		return Str;
	}

	void GetMoney(_TaskPrize)
	{
		var pos=_TaskPrize.Find("-1");
		if (pos>=0)
		{
			var pos1=_TaskPrize.Find(":",pos+3);
			return _TaskPrize.Mid(pos+3,pos1-pos-3);
		}
		return "0";
	}
	void GetExp(_TaskPrize)
	{
		var pos=_TaskPrize.Find("-2");
		if (pos>=0)
		{
			var pos1=_TaskPrize.Find(":",pos+3);
			return _TaskPrize.Mid(pos+3,pos1-pos-3);
		}
		return "0";
	}
	void GetItem(_TaskPrize)
	{
		var pos=_TaskPrize.Find("-3");
		if (pos>=0)
		{
			var pos1=_TaskPrize.Find(":",pos+3);
			var _Item=_TaskPrize.Right(_TaskPrize.Count-pos-3);
			return _Item;
		}
		return "0";
	}
	void GetQuan(_TaskPrize)
	{
		var pos=_TaskPrize.Find("-4");
		if (pos>=0)
		{
			var pos1=_TaskPrize.Find(":",pos+3);
			return _TaskPrize.Mid(pos+3,pos1-pos-3);
		}
		return "0";
	}
	void GetContribute(_TaskPrize)
	{
		var pos=_TaskPrize.Find("-5");
		if (pos>=0)
		{
			var pos1=_TaskPrize.Find(":",pos+3);
			var _Item=_TaskPrize.Mid(pos+3,pos1-pos-3);
			return _Item;
		}
		return "";
	}
	///////////////////////////
	//获得亲密度值
	//2010-12-16
	void GetQmValue(_TaskPrize)		//add by chenjihui
	{
		var pos=_TaskPrize.Find("-6");
		if (pos>=0)
		{
			var pos1=_TaskPrize.Find(":",pos+3);
			return _TaskPrize.Mid(pos+3,pos1-pos-3);
		}
		return "0";
	}
	///////////////////////

	void InceptTask_tip(id)
	{
		printf("BB# 任务InceptTask_tip():id:"+id);
		var _taskname = window.GetTaskNameByID(id);
		if (g_TaskChageState == 1)
		{
			window.WriteChat7(800,""+_taskname);
		}
		g_TaskChageState = 0;
		window.DealWithTaskEvent(1,id);
	}
	void SubmitTask_tip(id)
	{
		var _taskname = window.GetTaskNameByID(id);
		window.WriteChat7(801,""+_taskname);
		window.DealWithTaskEvent(3,id);
	}
	void AbondonTask_tip(id)
	{
		var _taskname = window.GetTaskNameByID(id);
		window.WriteChat7(802,""+_taskname);
		
	}
	void CompleteTask_tip(id)
	{
		//timer(500,"TaskFresh");
		var _taskname = window.GetTaskNameByID(id);
		var _taskPrizeAll = window.GetTaskPrizeByID(id);
		var _taskPrizeTypeCount = window.GetSplitCount(_taskPrizeAll,"&");
		var _taskPrize = "";
		if(_taskPrizeTypeCount == 2)
		{
			var _arr = window.SplitStr2(_taskPrizeAll,"&",_taskPrizeTypeCount);
			var _sex = window.GetMySex();
			if(_sex == 1)
			{
				_taskPrize = _arr[0];
			}
			else
			{
				_taskPrize = _arr[1];
			}
		}
		else
		{
			_taskPrize = _taskPrizeAll;
		}
		printf("C# _taskPrizeAll:"+_taskPrizeAll+",_taskPrize:"+_taskPrize);
		var _moneyOrQuan = "金币";
		var _moneyOrQuanNum = 0;
		var _taskMoney = window.GetMoney(_taskPrize);
		var _taskQuan = window.GetQuan(_taskPrize);
		var _contributeName = "贡献点";
		var _contribute = window.GetContribute(_taskPrize);
		//add by chenjihui
		//2010-12-17
		var _lover = "亲密度";
		var _loverValue = window.GetQmValue(_taskPrize);
		if(_loverValue == "" || _loverValue == 0)
		{
			_lover = "";
			_loverValue = "";
		}
		///////////////////
		if(_contribute == "" || _contribute == 0)
		{
			_contributeName = "";
			_contribute = "";
		}
		if(toint(_taskQuan) != 0)
		{
			_moneyOrQuan = "奖券";
			_moneyOrQuanNum = _taskQuan;
		}
		else
		{
			_moneyOrQuan = "金币";
			_moneyOrQuanNum = _taskMoney;
			if(_moneyOrQuanNum == 0)
			{
				_moneyOrQuan = "";
				_moneyOrQuanNum = "";
			}
		}
		var _taskExpName = "经验";
		var _taskExp =  window.GetExp(_taskPrize);
		if(_taskExp == 0)
		{
			_taskExpName = "";
			_taskExp = "";
		}
		var _taskItem = window.GetItem(_taskPrize);
		printf("xiayy:_contribute:"+_contribute);
		if(_taskItem != 0 && _taskItem != "")
		{
			var _itemContent = "";
			var _strNum = window.GetSplitCount(_taskItem,":");
			if(_strNum>=2)
			{
				var _itemArr = window.SplitStr2(_taskItem,":",_strNum);
				var _index = 0;
				//至少一个物品
				if(toint(_strNum)>1)
				{
					//staticvar s_text = new VItemPrizeText_UI{}//字
					var _widthIndex = 0;
					var _heightIndex = 0;
					var _szVML;
					var i=1;
					while(_strNum>0)
					{
						var _itemName = window.GetNameByEnterID(_itemArr[_index]);
						_itemContent += ""+_itemName+"x"+_itemArr[_index+1]+"   ";
						i+=1;
						_strNum-=2;
						_index+=2;
					}
				}
			}
			window.WriteChat7(803,""+_taskname+","+_moneyOrQuan+","+_moneyOrQuanNum+","+_taskExpName+","+_taskExp+","+_contributeName+","+_contribute+","+_lover+","+_loverValue+" "+","+_itemContent);
		}
		else
		{
			var _temp = " ";
			if ( toint(_taskQuan) != 0 && toint(_taskMoney) != 0)
			{
				window.WriteChat7(803,""+_taskname+",金币"+toint(_taskMoney)+",奖券"+toint(_taskQuan)+","+_taskExpName+","+_taskExp+","+_contributeName+","+_contribute+","+_lover+","+_loverValue+" "+","+_temp);
			}
			else
			{
				window.WriteChat7(803,""+_taskname+","+_moneyOrQuan+","+_moneyOrQuanNum+","+_taskExpName+","+_taskExp+","+_contributeName+","+_contribute+","+_lover+","+_loverValue+" "+","+_temp);
			}
		}
		window.DealWithTaskEvent(2,id);
	}

	//[功能]根据任务ID取任务名字
	//[参数]taskid:任务ID
	//[返回值]任务的名字 -1(未找到)
	void GetTaskNameByID(taskid)
	{
		window.g_Row.InitByInt(window.GAME,window.TASK,window.GAME_TASK_TASKID,taskid);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetTaskNameByID:DBname:"+window.GAME+",TBName:"+window.TASK+",taskid:"+taskid);
			return window.DB_ERR;
		}

		var _name = window.g_Row.GetData(window.GAME_TASK_TASKNAME);
		window.g_Row.Release();
		return _name;
	}
	//
	void GetTaskPrizeByID(taskid)
	{
		window.g_Row.InitByInt(window.GAME,window.TASK,window.GAME_TASK_TASKID,taskid);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetTaskNameByID:DBname:"+window.GAME+",TBName:"+window.TASK+",taskid:"+taskid);
			return window.DB_ERR;
		}

		var _prize = window.g_Row.GetData(window.GAME_TASK_TASKPRIZE);
		window.g_Row.Release();
		return _prize;
	}
	//[功能]获取随机任务的id
	//[参数]无
	//[返回值]随机任务id,-1为没有随机任务
	void GetRandomTaskID()
	{
		var _VNet2DBTable=new VNet2DBTable
		{
			var _taskID = -1;
			void GetData(gid)
			{
				_taskID = gid;
			}
		}
		var _SQL = "SELECT * FROM "+window.TASKSYNDATA+" WHERE "+window.GAME_TASKSYNDATA_TASKID_STR+">=173 AND "+window.GAME_TASKSYNDATA_TASKID_STR+"<200";
		_VNet2DBTable.Select( window.GAME,_SQL);
		var _num = _VNet2DBTable.GetSize();
		if(_num<=0)
		{
			_VNet2DBTable.del();
			return -1;
		}
		_VNet2DBTable.ReadData("GetData",""+window.GAME_TASKSYNDATA_TASKID);
		var _id = _VNet2DBTable._taskID;
		_VNet2DBTable.del();
		return _id;
	}
	//[功能]获取随机任务的名字
	//[参数]随机任务id
	//[返回值]随机任务名字
	void GetRandomTaskName(_id)
	{
		window.g_Row.InitByInt(window.GAME,window.TASK,window.GAME_TASK_TASKID,_id);
		if(!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			return window.DB_ERR;
		}
		var _RTaskName = window.g_Row.GetData(window.GAME_TASK_RTASKNAME);
		window.g_Row.Release();
		return _RTaskName;
	}
	//[功能]获取随机任务的描述
	//[参数]随机任务id
	//[返回值]随机任务描述
	void GetRandomTaskDes(_id)
	{
		window.g_Row.InitByInt(window.GAME,window.TASK,window.GAME_TASK_TASKID,_id);
		if(!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			return window.DB_ERR;
		}
		var _RTaskDes = window.g_Row.GetData(window.GAME_TASK_RTASKDES);
		window.g_Row.Release();
		return _RTaskDes;
	}
	//[功能]获取随机任务的目标
	//[参数]随机任务id
	//[返回值]随机任务目标
	void GetRandomTaskTarget(_id)
	{
		window.g_Row.InitByInt(window.GAME,window.TASK,window.GAME_TASK_TASKID,_id);
		if(!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			return window.DB_ERR;
		}
		var _RTarget = window.g_Row.GetData(window.GAME_TASK_RTARGET);
		window.g_Row.Release();
		return _RTarget;
	}
	//[功能]获取任务各状态下的触发事件
	//[参数]任务id
	//[返回值]任务各状态下的触发事件
	void GetCTaskEvent(_id)
	{
		window.g_Row.InitByInt(window.GAME,window.TASK,window.GAME_TASK_TASKID,_id);
		if(!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			return window.DB_ERR;
		}
		var _CTaskEvent = window.g_Row.GetData(window.GAME_TASK_CTASKEVENT);
		window.g_Row.Release();
		return _CTaskEvent;
	}
}