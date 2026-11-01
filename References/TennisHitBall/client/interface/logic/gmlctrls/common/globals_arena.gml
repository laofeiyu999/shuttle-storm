//全局变量 + 函数>>活动相关

set window
{
	//[功能]取已报名的活动ID
	//[返回值]已报名(活动ID);未报名(-1)
	void GetMyRaceID(){return window.g_ArenaRaceID.__Long__;}
	
	//[功能]设置已报名的活动ID
	//[参数]_raceid:活动ID
	void SetMyRaceID(_raceid)
	{
		printf("B# [活动]SetMyRaceID():_raceid:"+_raceid);
		window.g_ArenaRaceID = _raceid;
	}

	//根据报名ID取连胜次数
	//参数：raceID
	void GetWinNumByRaceID(raceID)
	{
		window.g_Row.InitByInt(window.M_G_SERVER,window.ARENARACE,window.M_G_SERVER_ARENARACE_ID,raceID);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetWinNumByRaceID:DBname:"+window.M_G_SERVER+",TBName:"+window.ARENARACE+",raceID:"+raceID);
			return window.DB_ERR;
		}

		var _winNum = window.g_Row.GetData(window.M_G_SERVER_ARENARACE_RES1);
		window.g_Row.Release();
		return _winNum;
	}

	//[功能]通过id取内容
	//[参数]id:竞技公告ID
	//		param:参数内容
	//[返回值]解析好的字符串
	void GetContentByID(id,param)
	{
		if (id < 0)
		{
			return window.DB_ERR;
		}
		
		window.g_Row.InitByInt(window.GAMEUI,window.ARENATIPINFO,window.GAMEUI_ARENATIPINFO_ID,id);
		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetContentByID:DBname:"+window.GAMEUI+",TBName:"+window.ARENATIPINFO+",id:"+id);
			return window.DB_ERR;
		}
		var _value = ""+window.g_Row.GetData(window.GAMEUI_ARENATIPINFO_CONTENT);//内容
		var _paramnum = window.g_Row.GetData(window.GAMEUI_ARENATIPINFO_PARAMNUM);
		var arrParam = window.SplitStr2(param,",",_paramnum);
		var _i = 0;
		while (_i < _paramnum)
		{
			_value = _value.Replace("%"+_i,arrParam[_i]);
			_i += 1;
		}
		window.g_Row.Release();
		return _value;
	}

	//[功能]根据ID取活动的名字
	//		库：m_g_server.mdb	araneRace
	//[参数] raceid：活动ID
	//[返回值]：错误("未知活动")
	void GetRaceNameByID(raceid)
	{
		window.g_Row.InitByInt(window.M_G_SERVER,window.ARENARACE,window.M_G_SERVER_ARENARACE_ID,raceid);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetRaceNameByID:DBname:"+window.M_G_SERVER+",TBName:"+window.ARENARACE+",raceid:"+raceid);
			return window.DB_ERR;
		}

		var _name = window.g_Row.GetData(window.M_G_SERVER_ARENARACE_TITLE);
		window.g_Row.Release();
		return _name;
	}

	//[功能]取某人的队伍ID
	//[参数]_raceID:活动ID
	//		_uid:玩家ID(不传就是自己的)
	//[返回值]队伍ID
	void GetTeamIDByRaceID(_raceID,_uid)
	{
		var _tempuid = _uid;
		if (_tempuid <= 0)
		{
			_tempuid = window.GetMyUID();
		}

		var _VNet2DBTable=new VNet2DBTable
		{
			var _unitID = 0;
			void GetData(teamid)
			{
				_unitID = teamid;
			}
		};

		var _SQL = "SELECT * FROM jiveTpGroup WHERE username="+_tempuid+" AND raceid="+_raceID;
		_VNet2DBTable.Select(window.GAMEUI,_SQL );
		_VNet2DBTable.ReadData("GetData",""+window.GAMEUI_JIVETPGROUP_TEAMID);
		var _teamid = _VNet2DBTable._unitID;
		_VNet2DBTable.del();
		printf("B# [活动]GetTeamIDByRaceID():_raceID:"+_raceID+",_uid:"+_uid+",_teamid:"+_teamid+",_SQL:"+_SQL);
		return _teamid;
	}
	
	//[功能]取某人的队伍名称
	//[参数]_raceID:活动ID
	//		_uid:玩家ID(不传就是自己的)
	//[返回值]队伍名称
	void GetTeamNameByRaceID(_raceID,_uid)
	{
		var _teamid = window.GetTeamIDByRaceID(_raceID,_uid);
		window.g_Row.InitByInt(window.GAMEUI,window.JIVETPGROUPINI,window.M_G_SERVER_ARENARACE_ID,_teamid);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetRaceNameByID:DBname:"+window.GAMEUI+",TBName:"+window.JIVETPGROUPINI+",_teamid:"+_teamid);
			return "";
		}

		var _name = window.g_Row.GetData(window.GAMEUI_JIVETPGROUPINI_TEAMNAME);
		window.g_Row.Release();
		return _name;
	}

	//[功能]判断某人是否为队长
	//[参数]_raceID:活动ID
	//		_uid:玩家ID(不传就是自己的) -1则未取到数据
	//[返回值]true / false
	void JudgeSBisCaptaim(_raceID,_uid)
	{
		var _tempuid = _uid;
		if (_tempuid <= 0)
		{
			_tempuid = window.GetMyUID();
		}
		
		var _teamid = window.GetTeamIDByRaceID(_raceID,_tempuid);
		
		window.g_Row.InitByInt(window.GAMEUI,window.JIVETPGROUPINI,window.GAMEUI_JIVETPGROUPINI_ID,_teamid);
		
		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# [活动]error-JudgeSBisCaptaim:DBname:"+window.GAMEUI+",TBName:"+window.JIVETPGROUPINI+",_teamid:"+_teamid);
			return -1;
		}
		var _createid = window.g_Row.GetData(window.GAMEUI_JIVETPGROUPINI_CREATEID);
		printf("B# [活动]JudgeSBisCaptaim():_raceID:"+_raceID+",_uid:"+_uid+",_teamid:"+_teamid+",_createid:"+_createid);
		window.g_Row.Release();
		if (_createid == _uid)
		{
			return true;
		}
		return false;
	}

	/*暂时无用废弃吧 2009年12月21日 yxf
	//[功能]队长通知队友去报名
	//[参数]_raceID:活动ID
	//		teamID:队伍ID
	void CallTeammateToRace(_raceID,teamID)
	{
		var _VNet2DBTable=new VNet2DBTable
		{
			var _uid = 0;
			void GetData(uid)
			{
				_uid = uid;
			}
		};
		var _SQL = "SELECT * FROM jiveTpGroup WHERE raceid="+_raceID+" AND teamID="+teamID;
		_VNet2DBTable.Select(window.GAMEUI,_SQL );
		_VNet2DBTable.ReadData("GetData",""+window.GAMEUI_JIVETPGROUP_USERNAME);
		var _userid = _VNet2DBTable._uid;
		_VNet2DBTable.del();
		if (_userid > 0)
		{
			//队长通知队友去报名
			window.F_CallTeammate(_userid,""+_userid+","+teamID+","+_raceID);
		}
	}
	*/

	//活动==============================================================
	//[功能]取活动配对类型
	//[参数]_raceid:活动ID
	//[返回值]-1错误的ID
	void GetQueueTypeByID(_raceid)
	{
		window.g_Row.InitByInt(window.M_G_SERVER,window.ARENARACE,window.M_G_SERVER_ARENARACE_ID,_raceid);
		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetQueueTypeByID:DBname:"+window.M_G_SERVER+",TBName:"+window.ARENARACE+",_raceid:"+_raceid);
			return -1;
		}
		var _queueType = window.g_Row.GetData(window.M_G_SERVER_ARENARACE_QUEUETYPE);
		window.g_Row.Release();
		return _queueType;
	}

	//[功能]报名活动成功
	//[参数]_raceid:活动ID
	void OnBeginRaceSuccess(_raceid)
	{
		window.g_CArenaFunction.ClearArenaTopTB();

		//测试
		//window.g_VNet2DBRowRaced.InitDB(_raceid);

		_raceid = toint(_raceid);
		window.SetMyRaceID(_raceid);
		if ( !window.IsRandomRace(_raceid) )
		{
			var _footleavetime = window.GetFootLeaveTimeByID(_raceid);
			window.find("HALL_LOGIC").m_FootLeaveTime.SetData(_footleavetime);

			if(_raceid != window.FAMILY_ACTIVITY_ID)
			{
				window.find("UIController").LoadDLG(115);//报名成功，
			}
			window.LMH1_Arena_Apply(_raceid);	//引导事件
			window.find("ARENA_LOGIC")._VArena_Logic.BeginQueueOk(_raceid);

			var _queueType = window.GetQueueTypeByID(_raceid);
			window.g_Row.Release();
			switch (_queueType)
			{
				case 0:window.g_ArenaSloganName = window.GetMyName();break;
				case 1:window.g_ArenaSloganName = window.GetMyName();break;
				case 2:window.g_ArenaSloganName = window.GetTeamNameByRaceID(_raceid,window.GetMyUID());break;
				case 3:window.g_ArenaSloganName = window.GetMyName();break;
			}
		}
	}

	//[功能]确定要放弃等待
	//[参数]_raceid:活动ID
	void g_OnConfirm_QuitWait(_raceid)
	{
		/*
		window.g_Row.InitByInt(window.M_G_SERVER,window.ARENARACE,window.M_G_SERVER_ARENARACE_ID,_raceid);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-g_OnConfirm_QuitWait:DBname:"+window.M_G_SERVER+",TBName:"+window.ARENARACE+",_raceid:"+_raceid);
			return;
		}
		var _queueType = window.g_Row.GetData(window.M_G_SERVER_ARENARACE_QUEUETYPE);//62字段
		window.g_Row.Release();
		switch (_queueType)
		{
			case 0:break;
			case 1:break;
			case 2:window.F_dismiss(window.GetMyUID(),_raceid);break;
			case 3:break;
		}*/
		
		if (_raceid.__Long__ < 0)
		{
			printf("g_OnConfirm_QuitWait:参数错误:_raceid:"+_raceid);
			return;
		}
		//参数：用户ID，报名ID
		var _Param = ""+window.GetMyUID()+","+_raceid;
		window.Tos_CancelQueue(_Param);
	}
	//[功能]放弃活动后-解散队伍
	//[参数]_raceid:活动ID
	void OnCancelRaceSuccess(_raceid,iReturnId)
	{
		//window.find(window.DLGLAYER).delallchild();
		window.g_CArenaFunction.ClearArenaTopTB();
		window.SetMyRaceID(-1);

		var _pos = window.GetUIPos();
		if(_pos == window.POS_ARENA)
		{
			window.find("VMB_SetSlogan_Logic").del();
			window.find(window.DLGLAYER).delallchild();
		}
		if(_pos == window.POS_FAMILYROOM)
		{
			window.RoomToFamily();
		}
		
		if (iReturnId == 2000 || iReturnId == 9001 || iReturnId == 9003)//取消排队成功
		{
			var _racename = window.GetRaceNameByID(_raceid);
			window.WriteChat7(520,_racename);
		}
		
		if ( window.IsRandomRace(toint(_raceid)) )
		{
			if (_raceid == window.find("RANDGAME_LOGIC")._VRandGameTip_Logic.m_RaceID)
			{
				window.find("RANDGAME_LOGIC").del();
			}
			return;
		}

		if (iReturnId == 8000)//失去活动资格
		{
			window.find("UIController").LoadDLG(113);//您的活动点数为0无法继续比赛，请再接再厉！
			window.LMH1_OutTheArena(_raceid);//引导事件
		}

		window.find("HALL_LOGIC").m_ArenaFallowTime.StopRunTime();

		window.g_CArenaFunction.ClearTeamGroupTB();
		
		window.find("ARENA_LOGIC")._VArena_Logic.CancelQueueOk(_raceid);

		var _queueType = window.GetQueueTypeByID(_raceid);
		switch (_queueType)
		{
			case 0:break;
			case 1:break;
			case 2:window.F_dismiss(window.GetMyUID(),_raceid);break;
			case 3:break;
		}
	}

	//[功能]队伍解散了
	//[参数]_raceid:活动ID
	void OnDismissTeamRaceSuccess(_raceid)
	{
		window.g_CArenaFunction.ClearArenaTopTB();
		window.g_CArenaFunction.ClearTeamGroupTB();
		window.SetMyRaceID(-1);
		window.find("ARENA_LOGIC")._VArena_Logic.CancelQueueOk(_raceid);
		window.find(window.DLGLAYER).delallchild();
	}

	//[功能]判断是否要提示取消报名
	//[参数]type:见Const.gml
	void JudgeIsNeedCancelQueue(type)
	{
		type = toint(type);
		var _SQL = "SELECT * FROM arenaRace WHERE pvpsv_num>0 and activity_state>"+window.g_ACTIVITY_CLOSE+" and race_state>="+window.g_QUEUE_QUEUEWAIT+" AND race_state<="+window.g_QUEUE_PAUSE;
		window.g_Table.Select(window.M_G_SERVER,_SQL);
		var _size = window.g_Table.GetSize();
		printf("B# JudgeIsNeedCancelQueue:type:"+type+",_size:"+_size);
		window.g_Table.Release();
		if (toint(_size) > 0)
		{
			if (type == 0)
			{
				return true;
			}
			window.g_JionRoomParamArenaType  = type;

			if (type == window.CANCELRACE_LOOKAT)
			{
				window.find("UIController").LoadDLG(102);//你有正在等待的活动，观看录像将自动放弃所有等待！
				return true;
			}

			if (type == window.CANCELRACE_TEAMINVITE)
			{
				window.find("UIController").LoadDLG(103);//你有正在等待的活动，参加其他活动将自动放弃所有等待！
				return true;
			}

			if (type == window.CANCELRACE_RANDGAME)
			{
				window.find("UIController").LoadDLG(125);//你有正在等待的活动，需要取消之前的比赛才能参加其它比赛！
				//window.find("UIController").LoadDLG(105);//你有正在等待的活动，快速开始比赛将自动放弃所有等待！
				return true;
			}

			if (type == window.CANCELRACE_RETURNCHENNEL)
			{
				window.find("UIController").LoadDLG(109);//你有正在等待的活动，返回频道将自动放弃所有等待！
				return true;
			}

			if (type == window.CANCELRACE_FREETRAIN)
			{
				window.find("UIController").LoadDLG(104);//你有正在等待的活动，参加自由训练将自动放弃所有等待？ 104
				return true;
			}

			if (type == window.CANCELRACE_COMMONTRAIN)//chenjihui
			{
				window.find("UIController").LoadDLG(104);//你有正在等待的活动，参加普通训练将自动放弃所有等待？ 104
				return true;
			}
			if(type == window.CANCLERACE_FAMILYCOMPETE)
			{
				window.find("UIController").LoadDLG(672);//你有正在等待的活动，需要取消之前的比赛才能参加家族比赛！
				return true;
			}
			else
			{
				window.find("UIController").LoadDLG(108);//你有正在等待的活动，参加普通比赛将自动放弃所有等待？ 108
				return true;
			}
		}
		else
		{
			window.g_JionRoomParamArenaType  = -1;
			return false;
		}
	}

	//[功能]根据ID取组ID
	//		库：m_g_server.mdb	araneRace
	//[参数] raceid：活动ID
	//[返回值]：错误("未知活动")
	void GetGroupIDByID(raceid)
	{
		printf("B# _SynArenaData-GetGroupIDByID():raceid:"+raceid);
		window.g_Row.InitByInt(window.M_G_SERVER,window.ARENARACE,window.M_G_SERVER_ARENARACE_ID,raceid);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# _SynArenaData-error-GetGroupIDByID:DBname:"+window.M_G_SERVER+",TBName:"+window.ARENARACE+",raceid:"+raceid);
			return window.DB_ERR;
		}

		var _groupid = window.g_Row.GetData(window.M_G_SERVER_ARENARACE_GROUP_ID);
		window.g_Row.Release();
		printf("B# _SynArenaData-GetGroupIDByID():_groupid:"+_groupid);
		return _groupid;
	}
	
	//[功能]取活动排行榜记录
	void GetArenaTopData()
	{
		var _raceid = window.GetMyRaceID();
		printf("B# _SynArenaData-GetArenaTopData():"+_raceid);
		if (_raceid <= 0 || window.IsRandomRace( _raceid ) )
		{
			printf("_SynArenaData-GetArenaTopData()-return:");
			return;
		}
	
		var _groupid = window.GetGroupIDByID(_raceid);
		if (_groupid.__Long__ <= 0)
		{
			printf("取排行榜的数据时组ID错误！快通知！_raceid："+_raceid+",_groupid:"+_groupid);
			return;
		}
		
		//已采用服务器通知才清数据的流程了2010年4月29日 yxf
		//window.g_CArenaFunction.ClearArenaTopTB();

		var _Param = ""+window.GetMyUID()+","+_raceid+","+_groupid+","+window.ARENA_TOP_NUM;
		//参数：用户ID，用户的竞技类型，用户所在的组ID,同步的最大长度
		window.Tos_SynArenaData(_Param);
	}

	//[功能]根据ID取活动的休整时间
	//		库：m_g_server.mdb	araneRace
	//[参数] raceid：活动ID
	//[返回值]：错误("未知活动")
	void GetFallowTimeByID(raceid)
	{
		window.g_Row.InitByInt(window.M_G_SERVER,window.ARENARACE,window.M_G_SERVER_ARENARACE_ID,raceid);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetFallowTimeByID:DBname:"+window.M_G_SERVER+",TBName:"+window.ARENARACE+",raceid:"+raceid);
			return window.DB_ERR;
		}

		var _time = window.g_Row.GetData(window.M_G_SERVER_ARENARACE_FALLOW_TIME);
		window.g_Row.Release();
		return _time;
	}

	//[功能]判断是否为撮合活动(先简单使用ID判断,日后有需要再改吧)
	//[参数]_raceid:活动ID
	//[返回值]true/false
	void IsRandomRace(_raceid)
	{
		if (toint(_raceid) == window.RANDOM_SINGLE || toint(_raceid) == window.RANDOM_DOUBLE)
		{
			return true;
		}
		return false;
	}

	//[功能]根据ID取充点得到的活动点
	//		库：m_g_server.mdb	araneRace
	//[参数] raceid：活动ID
	//[返回值]：错误("未知活动")
	void GetAddPointByID(raceid)
	{
		window.g_Row.InitByInt(window.M_G_SERVER,window.ARENARACE,window.M_G_SERVER_ARENARACE_ID,raceid);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetAddPointByID:DBname:"+window.M_G_SERVER+",TBName:"+window.ARENARACE+",raceid:"+raceid);
			return window.DB_ERR;
		}

		var _getpoint = window.g_Row.GetData(window.M_G_SERVER_ARENARACE_UI_ADDPOINTGET);
		window.g_Row.Release();
		return _getpoint;
	}

	//[功能]活动排行榜里的自己的数据
	//		库：m_g_server.mdb	ArenaData
	//[返回值]：错误("未知活动")
	void GetArenaTopDataByUID()
	{
		window.g_Row.InitByInt(window.M_G_SERVER,window.ARENADATA,window.M_G_SERVER_ARENADATA_USERID,window.GetMyUID());

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetArenaTopDataByUID:DBname:"+window.M_G_SERVER+",TBName:"+window.ARENADATA);
			return window.DB_ERR;
		}

		var _data = window.g_Row.GetData(window.M_G_SERVER_ARENADATA_DATA);
		window.g_Row.Release();
		return _data;
	}

	//[功能]根据ID取活动的结算剩余时间
	//		库：m_g_server.mdb	araneRace
	//[参数] raceid：活动ID
	//[返回值]：错误("未知活动")
	void GetFootLeaveTimeByID(raceid)
	{
		window.g_Row.InitByInt(window.M_G_SERVER,window.ARENARACE,window.M_G_SERVER_ARENARACE_ID,raceid);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetFallowTimeByID:DBname:"+window.M_G_SERVER+",TBName:"+window.ARENARACE+",raceid:"+raceid);
			return window.DB_ERR;
		}

		var _time = window.g_Row.GetData(window.M_G_SERVER_ARENARACE_UI_BALANCELEAVETIME);
		window.g_Row.Release();
		return _time;
	}
	
	//[功能]临时组队-询问所有好友此时的状态
	//[参数]_state:指定问某一个状态的人
	void TempTeamAskState(_state)
	{
		var _VNet2DBTable=new VNet2DBTable
		{
			void GetMyData(jid)
			{
				printf("TempTeamAskState(GetMyData)-2:jid:"+jid);
				
				//查询好友是否有空
				window.F_IsFriendFree(jid,"");
			}
		};

		var _SQL = "SELECT * FROM jiveTpInviteList WHERE delete="+_state;
		printf("B# TempTeamAskState-SQL:"+_SQL);
		_VNet2DBTable.Select( window.GAMEUI,_SQL );
		_VNet2DBTable.ReadData("GetMyData",""+window.GAMEUI_JIVETPINVITELIST_ID);
		_VNet2DBTable.del();
	}

	//[功能]根据UID设置玩家的状态字段
	//[参数] uid：玩家ID
	//		 state:状态{0默认 1已删除 2不在空闲中 3空闲}
	//[返回值]：-1参数错误 
	void SetTempTeamDelete(uid,state)
	{
		window.g_Row.InitByInt(window.GAMEUI,window.JIVETPINVITELIST,window.GAMEUI_JIVETPINVITELIST_ID,uid);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-SetTempTeamDelete:DBname:"+window.GAMEUI+",TBName:"+window.JIVETPINVITELIST+",uid:"+uid);
			return window.DB_ERR;
		}

		window.g_Row.SetInt(window.GAMEUI_JIVETPINVITELIST_DELETE,state);
		window.g_Row.UpdateEnd();
		window.g_Row.Release();
	}

	//[功能]根据ID取活动的排行榜标题
	//		库：m_g_server.mdb	araneRace
	//[参数] raceid：活动ID
	//[返回值]：错误("未知活动")
	void GetTopTitleByID(raceid)
	{
		window.g_Row.InitByInt(window.M_G_SERVER,window.ARENARACE,window.M_G_SERVER_ARENARACE_ID,raceid);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetTopTitleByID:DBname:"+window.M_G_SERVER+",TBName:"+window.ARENARACE+",raceid:"+raceid);
			return "--";
		}

		var _title = window.g_Row.GetData(window.M_G_SERVER_ARENARACE_UI_TOPTITLE);
		window.g_Row.Release();
		return _title;
	}
	
	//[功能]根据ID设置玩家此活动的状态{主要为双打撮合准备的}
	//		库：m_g_server.mdb	araneRace
	//[参数] raceid：活动ID
	void SetRaceStateByID(raceid,state)
	{
		window.g_Row.InitByInt(window.M_G_SERVER,window.ARENARACE,window.M_G_SERVER_ARENARACE_ID,raceid);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-SetRaceStateByID:DBname:"+window.M_G_SERVER+",TBName:"+window.ARENARACE+",raceid:"+raceid);
			return;
		}

		window.g_Row.SetInt(window.M_G_SERVER_ARENARACE_RACE_STATE,state);
		window.g_Row.UpdateEnd();
		window.g_Row.Release();
	}

	//=======================活动结算内容====================================
	//[功能]获取活动点,积分或贡献点
	//[参数]_data：奖励数据；_type：获取的类型，1为活动点，2为积分，3为贡献点
	//[返回值]返回相应类型的数据
	void GetActivityPointData(_data,_type)
	{
		var pos1=_data.Find(""+_type+":");
		if (pos1>=0)
		{
			var pos2=_data.Find(";",pos1+2);
			var _Item=_data.Mid(pos1+2,pos2-pos1-2);
			return _Item;
		}
		return "";
	}
}