//普通任务 list
//丁文选 2009-3-11

importex("$./../../UI/Task/ClassDef_Task_NormalTask_List.gml");

// 一行显示类：
class VColumn_Task_NormalTask_DBList_Logic item
{
//	size = "280,28";
	var _TaskID=-1;
	var _TaskDes="NA";
	var _TaskName="NA";
	var _TaskEventCount=0;
	var _target="NA";
	var _TaskPrize="NA";
	var _TaskChoicePrize="NA";
	var _TargetDes="NA";
	var _TargetDes1="NA";
	var _CompleteTask=-1;
	var __Selected__=0;
	var _AbandonState = false;

	void Init()
	{
		//任务名称
		//参数 Data
		staticvar s_text_TaskName = new text
		{
			void SetData(Data)
			{
				src=Data;
			}
		};

		//任务等级
		//参数 Data
		staticvar s_text_TaskLevel = new text
		{
			void SetData(Data)
			{
				src=Data;
			}
		};
		//完成
		staticvar s_JobDone = new VMyText
		{
			pos = "172,0";color="#00FF";
		}
	}
	//选择的效果
	void OnMySelect()
	{
	}
	//不选择的效果
	void OnMyUnSelect()
	{
	}
	inclass("VColumn_Task_NormalTask_DBList_UI");
	Init();

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

	void OnSetData()
	{
		var ____target="";
		if (_TaskEventCount>=0)
		{
			var _TaskDBRow=new VNet2DBRow{};
			_TaskDBRow.InitByInt(window.GAME,window.TASKSYNDATA,window.GAME_TASKSYNDATA_TASKID,window.toint(_TaskID));
			var _State=_TaskDBRow.GetData(window.GAME_TASKSYNDATA_STATE);
			var _Type=_TaskDBRow.GetData(window.GAME_TASKSYNDATA_TASKTYPE);
			if (_State<=1)
			{
				var _count=_TaskDBRow.GetData(window.GAME_TASKSYNDATA_EVENTCOUNT);
				if (_Type == 4)
				{
					if (_count>0 && _count < _TaskEventCount)
					{
						____target = _target+"&nbsp1/1";
						_TargetDes = _TargetDes1;
					}
					else
				        ____target=_target+"&nbsp"+_count+"/"+_TaskEventCount;
				}
				else
				____target=_target+"&nbsp"+_count+"/"+_TaskEventCount;
			}
			else
			{
				____target=_target+"&nbsp"+0+"/"+_TaskEventCount;
			}
			_TaskDBRow.del();
		}
		// 名称 内容 目标 钱 经验 物品1 物品2
		//  -1:100:-2:500:-3:1010001:2:1010008:3
//		if (_TaskID==110)
//		{
//			____target="";
//		}
		parent.parent.s_TaskContent.SetData(_TaskName,_TaskDes,_TargetDes,____target,GetMoney(_TaskPrize),GetExp(_TaskPrize),GetItem(_TaskPrize),GetItem(_TaskChoicePrize),window.GetQuan(_TaskPrize));

		//alert(_CompleteTask);
		if (_CompleteTask==-1)
		{
			parent.parent.s_btn_AcceptTask.show=true;		// 接受任务
			parent.parent.s_btn_AbandonTask.show=false;		// 放弃任务
			parent.parent.s_btn_CompleteTask.show=false;	// 完成任务

			parent.parent.SetFollowButState(false,false);

			return;
		}
		if (_CompleteTask==0)
		{
			parent.parent.s_btn_AcceptTask.show=false;		// 接受任务
			parent.parent.s_btn_AbandonTask.show=true;		// 放弃任务
			parent.parent.s_btn_CompleteTask.show=false;	// 完成任务

			var _b=window.CheckMissionFollow(_TaskID);
			if (_b)
			{
				parent.parent.SetFollowButState(true,false);
				return;
			}
			parent.parent.SetFollowButState(false,true);

			return;
		}
		if (_CompleteTask==1)
		{
			parent.parent.s_btn_AcceptTask.show=false;		// 接受任务
			parent.parent.s_btn_AbandonTask.show=true;		// 放弃任务
			parent.parent.s_btn_CompleteTask.show=true;		// 完成任务

			var _b=window.CheckMissionFollow(_TaskID);
			if (_b)
			{
				parent.parent.SetFollowButState(true,false);
				return;
			}
			parent.parent.SetFollowButState(false,true);
		
			return;
		}
	}

	void OnSelect()
	{
		parent.scriptprcallsub("OnUnSelect");
		__Selected__=1;
		OnMySelect();
		//alert("OnSelect0="+_TaskID);
		parent.parent._SelectTask(_TaskID,_TaskName,_target,_TaskEventCount,_TargetDes);

		/*var ____target="";
		if (_TaskEventCount>0)
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
				____target="-"+_target+"&nbsp"+_count+"/"+_TaskEventCount;
			}
			_TaskDBRow.del();
		}
		// 名称 内容 目标 钱 经验 物品1 物品2
		//  -1:100:-2:500:-3:1010001:2:1010008:3
		parent.parent.s_TaskContent.SetData(_TaskName,_TaskDes,_TargetDes,____target,GetMoney(_TaskPrize),GetExp(_TaskPrize),GetItem(_TaskPrize),GetItem(_TaskChoicePrize));*/

		/*var _b=window.CheckMissionFollow(_TaskID);
		if (_b==1)
		{
			//alert("1="+_b);
			parent.parent.s_btn_CancelFollow.show=true;		// 取消追踪
			parent.parent.s_btn_TaskFollow.show=false;		// 任务追踪
		}
		else
		{
			//alert("0="+_b);
			parent.parent.s_btn_CancelFollow.show=false;	// 取消追踪
			parent.parent.s_btn_TaskFollow.show=true;		// 任务追踪
		}*/

		OnSetData();
		//alert("OnSelect1="+_TaskID);
	};
	void OnUnSelect()
	{
		OnMyUnSelect();
		parent.parent.SetBtnState();
	};

	var _First = 1;
	void OnDataExchange(iRow,szData)
	{
		_TaskID=szData;
		//alert("_TaskID="+_TaskID);
		name = "Name_VColumn_Task_NormalTask_DBList_"+_TaskID;

		var _TaskDBRow=new VNet2DBRow{};
		_TaskDBRow.InitByInt(window.GAME,window.TASK,window.GAME_TASK_TASKID,toint(_TaskID));

		_TaskName		=_TaskDBRow.GetData(window.GAME_TASK_TASKNAME);
		_TaskDes		=_TaskDBRow.GetData(window.GAME_TASK_TASKDES);
		var _Level		=_TaskDBRow.GetData(window.GAME_TASK_TASKCONDITIONS);
		_TaskEventCount	=_TaskDBRow.GetData(window.GAME_TASK_EVNETCOUNT);
		_target			=_TaskDBRow.GetData(window.GAME_TASK_TARGET);
		
		_TargetDes1 =_TaskDBRow.GetData(window.GAME_TASK_TARGETDES1);
		var _TaskPrizeAll = _TaskDBRow.GetData(window.GAME_TASK_TASKPRIZE);
		var _count = window.GetSplitCount(_TaskPrizeAll,"&");
		if(_count == 2)
		{
			var _arr = window.SplitStr2(_TaskPrizeAll,"&",_count);
			var _sex = window.GetMySex();
			if(_sex == 1)
			{
				_TaskPrize = _arr[0];
			}
			else
			{
				_TaskPrize = _arr[1];
			}
		}
		else
		{
			_TaskPrize = _TaskPrizeAll;
		}
		printf("C# _TaskPrizeAll:"+_TaskPrizeAll+",_TaskPrize:"+_TaskPrize);
		//_TaskPrize		=_TaskDBRow.GetData(window.GAME_TASK_TASKPRIZE);
		_TaskChoicePrize=_TaskDBRow.GetData(window.GAME_TASK_TASKCHOICEPRIZE);

		_TargetDes		=_TaskDBRow.GetData(window.GAME_TASK_TARGETDES);
		var _TaskTypeName	= _TaskDBRow.GetData(window.GAME_TASK_TASKTYPENAME);

		s_taskType.SetData(_TaskTypeName);
		s_text_TaskName.SetData(_TaskName);
		s_text_TaskLevel.SetData(_Level);
		_TaskDBRow.del();

		s_JobDone.show=false;
		s_Submited.show=false;

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
					printf("BB# firstin ");
					//成功接受一个任务 引导
					window.LMH_Accept_Mission();
					if(toint(precompletetask)!=_CompleteTask)
					{
						printf("BB# complete in ");
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

				return;
			}
			if (_State==1)
			{// 已完成


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

					return;
				}
				parent.parent.SetFollowButState(false,true);

				if (__Selected__==1) {OnSetData();}

				return;
			}
			if(_State == 2)
			{
				if(_CompleteTask == 1 && !_AbandonState)
				{
					if (_Type != 3)								// modify by chenjihui
					{											// 2011-1-4
						window.CompleteTask_tip(_TaskID);		// 此处主要是防止无限任务交付时，系统提示两次奖励信息
					}
//					window.CompleteTask_tip(_TaskID);
				}
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
		//printf("taskOnDataExchange _TaskName "+_TaskName);
		
	}

	void CancelAllTaskFollow()
	{
		window.find("gameui").DelMission(_TaskID);
	}

	void AllTaskFollow()
	{
		if (window.CheckMissionFollow(_TaskID)==0)
		{
			window.find("gameui").MyAddMission(_TaskID,_TaskName,_target,_TaskEventCount,_TargetDes);
		}
	}

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
class VTask_NormalTask_DBList_Logic VN2ListCtrl
{
//	pos = "21,106";size="287,140";

	selecttype="1";colfilter="0";//simpleshowmode="1,25";

	inclass("VTask_NormalTask_DBList_UI");

	columclass="0,VColumn_Task_NormalTask_DBList_Logic";

	//[功能]为了选中某一个子对象
	//[参数]taskid：任务ID
	void SelectSubObjBy(taskid)
	{
		var _top = find("Name_VColumn_Task_NormalTask_DBList_"+taskid).top;
		checkselect(10,_top+10);
	}
};
