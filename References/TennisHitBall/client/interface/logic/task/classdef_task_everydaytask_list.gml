//
// 日常任务 list 丁文选 
// 2009-3-11
//

importex("$./../../UI/Task/ClassDef_Task_EverydayTask_List.gml");

// 一行显示类：
class VColumn_Task_EverydayTask_DBList_Logic item
{
//	size = "264,28";
	var _TaskID=-1;
	var _TaskDes="NA";
	var _TaskName="NA";
	var _TaskEventCount=0;
	var _target="NA";
	var _CompleteTask=-1;
	var _TaskPrize="NA";
	var _TaskChoicePrize="NA";
	var _TargetDes="NA";
	var _TargetDes1="NA";
	var __Selected__=0;
	var _AbandonState = false;

	void Init()
	{
		//活动任务 底图
		staticvar s_img_ActivityTaskBk = new imgm
		{
			pos = "0,0";
		}
		//活动任务 字
		staticvar s_text_ActivityTask = new imgm
		{
			pos = "172,8";
		}
		//任务名称
		//参数 Data
		staticvar s_text_TaskName = new text
		{
			pos = "10,0";
			size = "115,26";
		};

		//任务等级
		//参数 Data
		staticvar s_text_TaskLevel = new text
		{
			pos = "125,0";
			size = "60,26";
		};

		// 任务状态
		staticvar s_JobDone = new VMyText
		{
			pos = "320,0";
			color="#00FF";
		};
	}
	//选择的效果
	void OnMySelect()
	{
	}
	//不选择的效果
	void OnMyUnSelect()
	{
	}
	inclass("VColumn_Task_EverydayTask_DBList_UI");
	Init();
	//选择的效果

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
	void GetContribute(_TaskPrize)
	{
		var pos=_TaskPrize.Find("-5");
		if (pos>=0)
		{
			var pos1=_TaskPrize.Find(":",pos+3);
			var _Item=_TaskPrize.Mid(pos+3,pos1-pos-3);
			return _Item;
		}
		return "0";
	}

	void OnSetData()
	{
		var ____target="";
		if (_TaskEventCount>=0)
		{
			var _TaskDBRow=new VNet2DBRow{};
			_TaskDBRow.InitByInt(window.GAME,window.TASKSYNDATA,window.GAME_TASKSYNDATA_TASKID,window.toint(_TaskID));
			var _State=_TaskDBRow.GetData(window.GAME_TASKSYNDATA_STATE);
			if (_State<=1)
			{
				var _count=_TaskDBRow.GetData(window.GAME_TASKSYNDATA_EVENTCOUNT);
				if (_count>_TaskEventCount)
				{
					_count=_TaskEventCount;
				}
				if (_Type == 4)
				{
					if (_count>0 && _count < _TaskEventCount)
					{
						____target ="-"+ _target+"&nbsp1/1";
						_TargetDes = _TargetDes1;
					}
					else
				        ____target="-"+_target+"&nbsp"+_count+"/"+_TaskEventCount;
				}
				else
				____target="-"+_target+"&nbsp"+_count+"/"+_TaskEventCount;
			}
			else
			{
				____target="-"+_target+"&nbsp"+0+"/"+_TaskEventCount;
			}
			_TaskDBRow.del();
		}
		// 名称 内容 目标 钱 经验 物品1 物品2
		//  -1:100:-2:500:-3:1010001:2:1010008:3
//		if (_TaskID==110)
//		{
//			____target="";
//		}
		parent.parent.s_TaskContent.SetData(_TaskName,_TaskDes,_TargetDes,____target,GetMoney(_TaskPrize),GetExp(_TaskPrize),GetItem(_TaskPrize),GetItem(_TaskChoicePrize),window.GetQuan(_TaskPrize),GetContribute(_TaskPrize));

		//alert(_CompleteTask);
		if (_CompleteTask==-1)
		{
			parent.parent.s_btn_AcceptTask.show=true;		// 接受任务
			parent.parent.s_btn_AbandonTask.show=false;		// 放弃任务
			parent.parent.s_btn_CompleteTask.show=false;	// 完成任务

			//parent.parent.SetFollowButState(false,false);

			return;
		}
		if (_CompleteTask==0)
		{
			parent.parent.s_btn_AcceptTask.show=false;		// 接受任务
			parent.parent.s_btn_AbandonTask.show=true;		// 放弃任务
			parent.parent.s_btn_CompleteTask.show=false;	// 完成任务

			/*var _b=window.CheckMissionFollow(_TaskID);
			if (_b)
			{
				parent.parent.SetFollowButState(true,false);
				return;
			}
			parent.parent.SetFollowButState(false,true);*/

			return;
		}
		if (_CompleteTask==1)
		{
			parent.parent.s_btn_AcceptTask.show=false;		// 接受任务
			parent.parent.s_btn_AbandonTask.show=false;		// 放弃任务
			parent.parent.s_btn_CompleteTask.show=true;		// 完成任务

			/*var _b=window.CheckMissionFollow(_TaskID);
			if (_b)
			{
				parent.parent.SetFollowButState(true,false);
				return;
			}
			parent.parent.SetFollowButState(false,true);*/
		
			return;
		}
	}

	void OnSelect()
	{
		//alert("_TaskID "+_TaskID);
		parent.scriptprcallsub("OnUnSelect");
		__Selected__=1;
		OnMySelect();
		parent.parent._SelectTask(_TaskID,_TaskName,_target,_TaskEventCount,_TargetDes,_TaskChoicePrize);

		OnSetData();
	};
	void OnUnSelect()
	{
		__Selected__=0;
		OnMyUnSelect();
		parent.parent.SetBtnState();
	};

	var _First = 1;
	void OnDataExchange(iRow,szData)
	{
		_TaskID=szData;

		_TaskName		= parent.fieldstr(iRow,window.GAME_TASK_TASKNAME);
		var _Level		= parent.fieldstr(iRow,window.GAME_TASK_TASKCONDITIONS);
		_TaskDes		= parent.fieldstr(iRow,window.GAME_TASK_TASKDES);
		_TaskEventCount	= parent.fieldstr(iRow,window.GAME_TASK_EVNETCOUNT);
		_target			= parent.fieldstr(iRow,window.GAME_TASK_TARGET);
		
		_TaskPrize		= parent.fieldstr(iRow,window.GAME_TASK_TASKPRIZE);
		_TaskChoicePrize= parent.fieldstr(iRow,window.GAME_TASK_TASKCHOICEPRIZE);

		_TargetDes		= parent.fieldstr(iRow,window.GAME_TASK_TARGETDES);
		_TargetDes1     = parent.fieldstr(iRow,window.GAME_TASK_TARGETDES1);
		var _TaskTypeName	= parent.fieldstr(iRow,window.GAME_TASK_TASKTYPENAME);

		s_taskType.SetData(_TaskTypeName);
		s_text_TaskName.SetData(_TaskName);
		s_text_TaskLevel.SetData(_Level);

		s_text_ActivityTask.show=false;
		s_img_ActivityTaskBk.show=false;
		s_JobDone.show=false;
		s_Submited.show=false;

		parent.parent.OnSubmitedNum();

		var prefirst = _First;
		var precompletetask = _CompleteTask;
		_First = 0;

		var _TaskDBRow=new VNet2DBRow{};
		_TaskDBRow.InitByInt(window.GAME,window.TASKSYNDATA,window.GAME_TASKSYNDATA_TASKID,window.toint(_TaskID));
		if (_TaskDBRow.IsReady())
		{
			var _Type=_TaskDBRow.GetData(window.GAME_TASKSYNDATA_TASKTYPE);
			var _State=_TaskDBRow.GetData(window.GAME_TASKSYNDATA_STATE);
			if (_State==0)
			{// 已接受
				s_Submited.show=true;

				_CompleteTask=0;
				if(0==prefirst)
				{
					//成功接受一个任务 引导
					window.LMH_Accept_Mission();
					if(toint(precompletetask)!=_CompleteTask)
					{
						window.InceptTask_tip(_TaskID);
					}
				}
				/*parent.parent.s_btn_AcceptTask.show=false;		// 接受任务
				parent.parent.s_btn_AbandonTask.show=true;		// 放弃任务
				parent.parent.s_btn_CompleteTask.show=false;	// 完成任务*/

				if (__Selected__==1){OnSetData();}

				var _b=window.CheckMissionFollow(_TaskID);
				if (_b)
				{
					parent.parent.SetFollowButState(true,false);
					return;
				}
				parent.parent.SetFollowButState(false,true);

				_TaskDBRow.del();
				return;
			}
			if (_State==1)
			{// 已完成
				if(0==_First)
				{
					//成功接受一个任务 引导
					window.LMH_Complete_Mission();
				}

				s_JobDone.show=true;
				

				_CompleteTask=1;
				/*parent.parent.s_btn_AcceptTask.show=false;		// 接受任务
				parent.parent.s_btn_AbandonTask.show=true;		// 放弃任务
				parent.parent.s_btn_CompleteTask.show=true;		// 完成任务*/

				var _b=window.CheckMissionFollow(_TaskID);
				if (_b)
				{
					parent.parent.SetFollowButState(true,false);

					if (__Selected__==1) {OnSetData();}

					_TaskDBRow.del();
					return;
				}
				parent.parent.SetFollowButState(false,true);

				if (__Selected__==1) {OnSetData();}

				_TaskDBRow.del();
				return;
			}
			if(_State == 2)
			{
				if(_CompleteTask == 1 && !_AbandonState)
				{
					window.CompleteTask_tip(_TaskID);
				}
			}
			if (_Type==2)
			{// 活动任务
				s_text_ActivityTask.show=true;
				s_img_ActivityTaskBk.show=true;

				//_CompleteTask=0;
				/*parent.parent.s_btn_AcceptTask.show=false;		// 接受任务
				parent.parent.s_btn_AbandonTask.show=true;		// 放弃任务
				parent.parent.s_btn_CompleteTask.show=false;	// 完成任务*/

				if (__Selected__==1) {OnSetData();}
				_TaskDBRow.del();
				return;
			}
		}

		_AbandonState = false;
		_CompleteTask=-1;
		/*parent.parent.s_btn_AcceptTask.show=true;		// 接受任务
		parent.parent.s_btn_AbandonTask.show=false;		// 放弃任务
		parent.parent.s_btn_CompleteTask.show=false;	// 完成任务*/

		parent.parent.SetFollowButState(false,false);

		if (__Selected__==1) {OnSetData();}
		_TaskDBRow.del();
	}

	/*void CancelAllTaskFollow()
	{
		if (_CompleteTask!=-1)
		{
			window.find("gameui").DelMission(_TaskID);
		}
	}

	void AllTaskFollow()
	{
		if (_CompleteTask!=-1)
		{
			if (window.CheckMissionFollow(_TaskID)==0)
			{
				window.find("gameui").MyAddMission(_TaskID,_TaskName,_target,_TaskEventCount,_TargetDes);
			}
		}
	}*/

	void AbandonTask()
	{
		var _selectTaskId = parent.parent.m_SelectTaskID;
		if(_selectTaskId == _TaskID)
		{
			_AbandonState = true;
		}
	}
}

//
//总的类：List
//
class VTask_EverydayTask_DBList_Logic VN2ListCtrl
{
//	pos = "21,106";size="287,140";

	selecttype="1";
	colfilter="0";//scroll = window.SCROLL_NOYES;

	inclass("VTask_EverydayTask_DBList_UI");

	columclass="0,VColumn_Task_EverydayTask_DBList_Logic";
};
