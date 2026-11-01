// 日常任务界面的逻辑部分类定义-丁文选
// 2010.9.27

import("$./../../UI/Task/ClassDef_Task_Lover.gml");
import("$./ClassDef_Task_LoverTask_List.gml");
class VTask_Lover_Logic item
{
//	bkcolor="#00FF00";
//	pos="0,100";
//	size = "325,370";

	name = "VTask_Lover_Logic";
	var m_SelectTaskID=-1;
	var m_TaskChoicePrize=-1;
	var m_SelectTaskName="NA";
	var m_SelectTaskTarget="NA";
	var m_SelectTaskTargetDes="NA";
	var m_SelectTaskEventCount=0;
	var m_SubmitedNum=0;		// 已完成任务数量
	var m_CompletedNum=0;		// 已接受任务数量

	//=========================与界面交互=========================
	void Init()
	{
		// 接受任务
		staticvar s_btn_AcceptTask = new VMyButton
		{
			pos = "105,448";Init("接受任务");
		}
		// 放弃任务
		staticvar s_btn_AbandonTask = new VMyButton
		{
			pos = "105,306";Init("放弃任务");
		}
		// 完成任务
		staticvar s_btn_CompleteTask = new VMyButton
		{
			pos = "105,448";Init("完成任务");
		}
		//任务内容
		staticvar s_TaskContent = new VMyText
		{
			pos = "26,250";size = "279,107";
		}
		//已完成任务数量
		staticvar s_text_SubmitedNum = new VMyText
		{
			pos = "16,400";size = "160,20";
		}
//		//已接受任务数量
//		staticvar s_text_CompletedNum = new VMyText
//		{
//			pos = "16,418";size = "160,20";
//		}
	}

	// 设置响应事件
	void SetEvent()
	{
		/*set s_TaskContent
		{
			void SetSelect(data)
			{
				//alert("22222="+data);
				parent.m_TaskChoicePrize=data;
			}
		}*/
		set s_btn_AbandonTask	// 放弃任务
		{
			void OnPressed()
			{
				if (parent.m_SelectTaskID>=0)
				{
					//window.find("selfcharacter").parent.tos("InceptTask",parent.m_SelectTaskID);
					window.find("UIController").LoadDLG(741);
				}
			}
		}
		// 接受任务
		set s_btn_AcceptTask
		{
			name = "BtnName_Task_Lover_AcceptTask";
			void OnPressed()
			{
				//alert(""+parent.m_SelectTaskID+" uid "+window.GetMyUID()+" lv "+window.GetLVByUID());
				if (parent.m_SelectTaskID>=0)
				{
					//window.find("selfcharacter").parent.tos("InceptTask",parent.m_SelectTaskID);
					parent.OnClick_AcceptTask();
				}
			}
		}
		// 完成任务
		set s_btn_CompleteTask
		{
			name = "BtnName_Task_Lover_CompleteTask";
			void OnPressed()
			{
				if (parent.m_SelectTaskID>=0)
				{
					/*if (parent.m_TaskChoicePrize==-2)
					{
						window.find("UITipManager").ShowTipFromId(11063);
						return;
					}
					if (parent.m_TaskChoicePrize>0)
					{
						window.find("selfcharacter").parent.tos("SubmitTask2",parent.m_SelectTaskID+","+parent.m_TaskChoicePrize);
					}
					else
					{
						window.find("selfcharacter").parent.tos("SubmitTask",parent.m_SelectTaskID);
					}

					//window.find("selfcharacter").parent.tos("SubmitTask",parent.m_SelectTaskID);
					window.find("gameui").DelMission(parent.m_SelectTaskID);*/
					parent.OnClick_CompleteTask();
				}
			}
		}
	}

	inclass("VTask_Lover_UI");
	Init();
	
	//[功能]放弃日常任务	
	//[参数值]无
	//[返回值]无
	void AbandonTask()
	{
		_Task_LoverTask_DBList_Logic.scriptprcallsub("AbandonTask");
		window.Tos_TaskQuit(""+window.GetMyUID()+","+m_SelectTaskID);
		window.AbondonTask_tip(m_SelectTaskID);
		window.LMH_Giveup_Mission();//放弃任务引导
	}
	void OnClick_AcceptTask()
	{
		window.Tos_InceptTask(""+window.GetMyUID()+","+m_SelectTaskID);
	}
	void OnClick_CompleteTask()
	{
		window.Tos_SubmitTask(""+window.GetMyUID()+","+m_SelectTaskID);
		window.PlaySound(145);
//		window.CompleteTask_tip(m_SelectTaskID);
	}
	void PressedAbandonTask()
	{
		window.g_TaskId = m_SelectTaskID;
		window.find("UITipManager").ShowTipFromId(11037);
	}

	var _Task_LoverTask_DBList_Logic=new VTask_LoverTask_DBList_Logic
	{
		//bkcolor="#FF";
		void NoData()
		{
			parent.s_TaskContent.ClearData();
			parent.m_SelectTaskID=-1;
		}
		void OnDelete()		//移除绑定
		{
			DelRegDbTable();
		}

		void AddRegDbTable()
		{
			window.find("G_DBMANAGE").RegDbTable(this,window.GAME,window.TASK,"Bind_Task_LoverTask_DBList_Logic");	// 绑定数据表
		}
		void DelRegDbTable()
		{
			window.find("G_DBMANAGE").ReMoveRegDbTable(this);
		}
		var _type=0;
		void SetType(type)
		{
			_type=type;
			ReFresh();
		}
		void ReFresh()
		{
			/*if (_type==0)
			{
				ReFresh2();
				return;
			}
			if (_type==1)
			{
				ReFresh1();
				return;
			}*/
			ReFresh3();
		}
		/*void ReFresh1()
		{
			var _Level=window.find("selfcharacter").parent.find("user").get("rolesvp.Level");
			//var _SQL = "SELECT * FROM "+window.TASK+" WHERE "+window.GAME_TASK_TASKTYPE_STR+">0 AND "+window.GAME_TASK_TASKCONDITIONS_STR+">="+(_Level-5)+" AND "+window.GAME_TASK_TASKCONDITIONS_STR+"<="+_Level+" AND "+window.GAME_TASK_TASKCANIN_STR+"=1 ORDER BY "+window.GAME_TASK_TASKCONDITIONS_STR;
			var _SQL = "SELECT * FROM "+window.TASK+" WHERE "+window.GAME_TASK_TASKTYPE_STR+">0 AND "+window.GAME_TASK_TASKCONDITIONS_STR+">="+(_Level-5)+" AND "+window.GAME_TASK_TASKCONDITIONS_STR+"<="+_Level+" ORDER BY "+window.GAME_TASK_TASKCONDITIONS_STR;
			window.find("G_DBMANAGE").SelectByRegDbTable("Bind_Task_LoverTask_DBList_Logic",window.GAME,_SQL);
			//checkselect(10,10);
		}
		void ReFresh2()
		{
			var _Level=window.find("selfcharacter").parent.find("user").get("rolesvp.Level");
			//var _SQL = "SELECT * FROM "+window.TASK+" WHERE "+window.GAME_TASK_TASKTYPE_STR+">0 AND "+window.GAME_TASK_TASKCONDITIONS_STR+"<="+_Level+" AND "+window.GAME_TASK_TASKCANIN_STR+"=1 ORDER BY "+window.GAME_TASK_TASKCONDITIONS_STR;
			var _SQL = "SELECT * FROM "+window.TASK+" WHERE "+window.GAME_TASK_TASKTYPE_STR+">0 AND "+window.GAME_TASK_TASKCONDITIONS_STR+"<="+_Level+" ORDER BY "+window.GAME_TASK_TASKCONDITIONS_STR;
			window.find("G_DBMANAGE").SelectByRegDbTable("Bind_Task_LoverTask_DBList_Logic",window.GAME,_SQL);
			//checkselect(10,10);
		}*/
		void ReFresh3()
		{
			parent.SetBtnState();
			//alert("hi");
			var _Level=window.GetLVByUID();
			//var _SQL = "SELECT * FROM "+window.TASK+" WHERE "+window.GAME_TASK_TASKTYPE_STR+">0 AND "+window.GAME_TASK_TASKCONDITIONS_STR+"<="+_Level+" AND "+window.GAME_TASK_TASKCANIN_STR+"=1 ORDER BY "+window.GAME_TASK_TASKCONDITIONS_STR;
			//var _SQL = "SELECT * FROM "+window.TASK+" WHERE "+window.GAME_TASK_TASKTYPE_STR+">0 AND "+window.GAME_TASK_TASKCONDITIONS_STR+"<="+_Level+" AND "+window.GAME_TASK_TASKCANIN_STR+"=1"+" ORDER BY "+window.GAME_TASK_TASKCONDITIONS_STR;
			var _SQL = "SELECT * FROM "+window.TASK+" WHERE "+window.GAME_TASK_TASKTYPENAME_STR+"=11 AND "+window.GAME_TASK_TASKCONDITIONS_STR+"<="+_Level+" ORDER BY "+window.GAME_TASK_TASKCONDITIONS_STR;
			window.find("G_DBMANAGE").SelectByRegDbTable("Bind_Task_LoverTask_DBList_Logic",window.GAME,_SQL);
			checkselect(10,10);
		}
		void OnCreated()
		{
			SetCheckData(1,window.GAME_TASK_TASKID);
			
			AddRegDbTable();
			ReFresh();
		}

		void SetTaskSize(_count)
		{
			parent.s_text_TaskNum.SetData(_count);
		}

		// SetCheckData
		void CheckData(index,data)
		{
			/*if (index==window.GAME_TASK_TASKID)
			{
				var _TaskDBRow=new VNet2DBRow{};
				_TaskDBRow.InitByInt(window.GAME,window.TASKSYNDATA,window.GAME_TASKSYNDATA_TASKID,window.toint(data));
				if (_TaskDBRow.IsReady())
				{
					_TaskDBRow.del();
					return 1;
				}
				_TaskDBRow.del();
			}*/
			//---------------------
			//查询任务数量
			var _taskTable = new VNet2DBTable
			{
				var _taskNum = 0;
				Select(window.GAME,"SELECT * FROM "+window.TASKSYNDATA+" WHERE "+window.GAME_TASKSYNDATA_STATE_STR+"<2");//临时组队
				
				void GetData(_taskID)
				{ 
					var _taskRow = new VNet2DBRow{}
					_taskRow.InitByInt(window.GAME,window.TASK,window.GAME_TASK_TASKID,_taskID);
					if(!_taskRow.IsReady())
					{
						_taskRow.Release();
						return;
					}
					var _taskTypeName = _taskRow.GetData(window.GAME_TASK_TASKTYPENAME);
					var _taskName = _taskRow.GetData(window.GAME_TASK_TASKNAME);
					_taskRow.Release();
					if(_taskTypeName == 11)
					{
						_taskNum += 1;
					}
//					printf("xiayy:_taskTypeName:"+_taskTypeName+",_taskNum:"+_taskNum+",_taskName:"+_taskName);
				}
			}
			_taskTable.ReadData("GetData",window.GAME_TASKSYNDATA_TASKID);
			var _TaskCount = _taskTable._taskNum;
			SetTaskSize(_TaskCount);
			_taskTable.del();
			if(toint(index)==window.GAME_TASK_TASKID)
			{
				var _TaskDefDBRow=new VNet2DBRow{};
				_TaskDefDBRow.InitByInt(window.GAME,window.TASK,window.GAME_TASK_TASKID,window.toint(data));
				var _taskName = _TaskDefDBRow.GetData(window.GAME_TASK_TASKNAME);
				var _taskDes = _TaskDefDBRow.GetData(window.GAME_TASK_TARGET);
				var _TaskTrem = _TaskDefDBRow.GetData(window.GAME_TASK_TASKTREM);
				var _taskCanIn = _TaskDefDBRow.GetData(window.GAME_TASK_TASKCANIN);
				var _taskNeedFamilyLv = _TaskDefDBRow.GetData(window.GAME_TASK_FAMILYLV);
				_TaskDefDBRow.del();
				if(_taskCanIn == 0)
				{
					return 0;
				}
				if(toint(_TaskTrem) > 0)
				{
					if(0 == window.TaskComplete(_TaskTrem))
					{
						return 0;
					}
				}
				if(0!=window.TaskComplete(data))
				{
					return 0;
				}
				var _mylev = window.GetFamilyLev();
				//printf("xiayy:_taskName:"+_taskName+",_taskDes:"+_taskDes+",_taskNeedFamilyLv:"+_taskNeedFamilyLv+",_mylev:"+_mylev);
//				if(_taskNeedFamilyLv < _mylev)
//				{
//					var _TaskDefDBRow=new VNet2DBRow{};
//					_TaskDefDBRow.InitByInt(window.GAME,window.TASKSYNDATA,window.GAME_TASKSYNDATA_TASKID,window.toint(data));
//					if(!_TaskDefDBRow.IsReady())
//					{	//printf("xiayy:没有接这个任务");
//						_TaskDefDBRow.del();
//						return 0;
//					}
//					var _taskState = _TaskDefDBRow.GetData(window.GAME_TASKSYNDATA_STATE);
////					printf("xiayy:_taskState:"+_taskState);
//					_TaskDefDBRow.del();
//					if(_taskState != 0 && _taskState != 1)
//					{
//						return 0;
//					}
//				}
			}
			return 1;
		}
	}



	void OnCreated()
	{
		SetEvent();
		window._Task_Lover_Logic=this;
	}
	void OnDelete()
	{
		window._Task_Lover_Logic=0;
	}

	void _SelectTask(TaskID,TaskName,TaskTarget,count,TargetDes,_TaskChoicePrize)
	{
		m_SelectTaskID=TaskID;
		m_SelectTaskName=TaskName;
		m_SelectTaskTarget=TaskTarget;
		m_SelectTaskEventCount=count;
		m_SelectTaskTargetDes=_TargetDes;
		if (_TaskChoicePrize.Count>0)
		{
			m_TaskChoicePrize=-2;
		}
		else
		{
			m_TaskChoicePrize=-1;
		}
	}

	void OnAddMission(TaskID)
	{
		if (TaskID==m_SelectTaskID)
		{
			s_btn_CancelFollow.show=true;		// 取消追踪
			s_btn_TaskFollow.show=false;		// 任务追踪
		}
	}
	void OnDelMission(TaskID)
	{
		if (TaskID==m_SelectTaskID)
		{
			s_btn_CancelFollow.show=false;	// 取消追踪
			s_btn_TaskFollow.show=true;		// 任务追踪
		}
	}
//	void OnCompletedNum(num)
//	{// 已完成任务数量
//		//alert(num);
//		s_text_SubmitedNum.SetData(num,GetCount());
//		OnSubmitedNum();
//	}
//
//	void OnSubmitedNum()
//	{// 已接受任务数量
//
//		var _TaskDBTable=new VNet2DBTable{};
//
//		var _SQL = "SELECT * FROM "+window.TASKSYNDATA+" WHERE "+window.GAME_TASKSYNDATA_TASKTYPE_STR+"=1 AND "+window.GAME_TASKSYNDATA_STATE_STR+"<2";
//
//		_TaskDBTable.Select(window.GAME,_SQL);
//
//		s_text_CompletedNum.SetData(_TaskDBTable.GetSize(),GetCount());
//	}

	void SetFollowButState(bCancelFollow,bTaskFollow)
	{
		//取消追踪
		s_btn_CancelFollow.show=bCancelFollow;
		//任务追踪
		s_btn_TaskFollow.show=bTaskFollow;
	}

	void SetBtnState()
	{
		s_btn_AbandonTask.show = false;
		s_btn_AcceptTask.show = false;
		s_btn_CompleteTask.show = false;
	}

	void GetCount()
	{
		//var _Level=window.find("selfcharacter").parent.find("user").get("rolesvp.Level");
		return 20;
	}
};
