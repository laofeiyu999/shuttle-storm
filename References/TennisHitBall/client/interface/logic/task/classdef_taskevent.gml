//任务事件

set window
{
	//[功能]处理各个状态下触发的任务事件
	//[参数]_id：任务id;_type：状态，1为接受任务状态，2为完成任务状态，3为提交任务状态
	//[返回值]
	void DealWithTaskEvent(_type,_id)
	{
		var _CTaskEvent = window.GetCTaskEvent(_id);
		if(_CTaskEvent == "")
		{
			return;
		}
		var _num = window.GetSplitCount(_CTaskEvent,";");
		var _CTaskEventArray = window.SplitStr2(_CTaskEvent,";",_num);
		var _index = 0;
		while(_index<_num)
		{
			var _array = window.SplitStr2(_CTaskEventArray[_index],":",2);
			if(toint(_array[0]) == _type)
			{
				if(tostring(_array[1]) != "")
				{
					vml(""+_array[1]);
				}
				break;
			}
			_index += 1;
		}
	}
	//[功能]加入家族任务
	//[参数]_uid:用户id
	//[返回值]
	void TaskEvent_AddInFamily(_uid)
	{
		var _Param = ""+window.GetMyUID()+","+window.CLIENT_31_ADDINFAMILY+","+window.CLIENT_31_ADDINFAMILY_STR+",1";
		window.Tos_AddEvent(_Param);
		//alert("我有家族了")；
	}

	//[功能]需要家族在线人数达到一定值
	//[参数]_num：家族在线人数
	//[返回值]无
	void TaskEvent_NeedFamilyOnlinePeopleNum(_num)
	{	
		if(_num>=2)
		{
			var _Param = ""+window.GetMyUID()+","+window.CLIENT_32_FAMILYONLINEPEOPLENUM+","+window.CLIENT_32_FAMILYONLINEPEOPLENUM_STR+",1";
			window.Tos_AddEvent(_Param);
		}
		if(_num>=4)
		{
			var _Param1 = ""+window.GetMyUID()+","+window.CLIENT_32_FAMILYONLINEPEOPLENUM1+","+window.CLIENT_32_FAMILYONLINEPEOPLENUM_STR+",1";
			window.Tos_AddEvent(_Param1);
		}
		if(_num>=7)
		{
			var _Param2 = ""+window.GetMyUID()+","+window.CLIENT_32_FAMILYONLINEPEOPLENUM2+","+window.CLIENT_32_FAMILYONLINEPEOPLENUM_STR+",1";
			window.Tos_AddEvent(_Param2);
		}
		if(_num>=11)
		{
			var _Param3 = ""+window.GetMyUID()+","+window.CLIENT_32_FAMILYONLINEPEOPLENUM3+","+window.CLIENT_32_FAMILYONLINEPEOPLENUM_STR+",1";
			window.Tos_AddEvent(_Param3);
		}
		if(_num>=16)
		{
			var _Param4 = ""+window.GetMyUID()+","+window.CLIENT_32_FAMILYONLINEPEOPLENUM4+","+window.CLIENT_32_FAMILYONLINEPEOPLENUM_STR+",1";
			window.Tos_AddEvent(_Param4);
		}
		if(_num>=22)
		{
			var _Param5 = ""+window.GetMyUID()+","+window.CLIENT_32_FAMILYONLINEPEOPLENUM5+","+window.CLIENT_32_FAMILYONLINEPEOPLENUM_STR+",1";
			window.Tos_AddEvent(_Param5);
		}
		if(_num>=29)
		{
			var _Param6 = ""+window.GetMyUID()+","+window.CLIENT_32_FAMILYONLINEPEOPLENUM6+","+window.CLIENT_32_FAMILYONLINEPEOPLENUM_STR+",1";
			window.Tos_AddEvent(_Param6);
		}
		if(_num>=37)
		{
			var _Param7 = ""+window.GetMyUID()+","+window.CLIENT_32_FAMILYONLINEPEOPLENUM7+","+window.CLIENT_32_FAMILYONLINEPEOPLENUM_STR+",1";
			window.Tos_AddEvent(_Param7);
		}
		if(_num>=46)
		{
			var _Param8 = ""+window.GetMyUID()+","+window.CLIENT_32_FAMILYONLINEPEOPLENUM8+","+window.CLIENT_32_FAMILYONLINEPEOPLENUM_STR+",1";
			window.Tos_AddEvent(_Param8);
		}
		if(_num>=56)
		{
			var _Param9 = ""+window.GetMyUID()+","+window.CLIENT_32_FAMILYONLINEPEOPLENUM9+","+window.CLIENT_32_FAMILYONLINEPEOPLENUM_STR+",1";
			window.Tos_AddEvent(_Param9);
		}
	}
	void CheckFamily()
	{	printf("task接取任务时检查是否在家族");
		if(window.haveFamilyStateByUID())
		{
			var _Param = ""+window.GetMyUID()+","+window.CLIENT_31_ADDINFAMILY+","+window.CLIENT_31_ADDINFAMILY_STR+",1";
			window.Tos_AddEvent(_Param);
		}
	}

	void CheckFamilyOLNum()
	{	printf("task接取任务时检查在线人数")；
		var _FOnlineNum = window.GetFamilyOnlinePeopleNum();
		TaskEvent_NeedFamilyOnlinePeopleNum(_FOnlineNum);

	}
}
