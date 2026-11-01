//关于家族的函数
//夏洋洋 2010-3-5

//家族功能部分，家族消息部分
set window
{

	var FamilyDataHash = "";		//家族数据库相关的哈希值
	var FamilySetLog = sysarray(window.FAMILYSET_NUM);		//家族设置每项修改是否成功标记：1为成功。第一项为家族名称，第二项为家族口号，第三项为家族公告，第四项为家族验证，第五项为家族徽章。
	var FamilyApplyID = 0;		//申请的家族ID
	var FamilyRecData_p1 = 0;	//反馈消息p1
	var FamilyRecData_p2 = 0;	//反馈消息p2
	var FamilyRecData_p3 = 0;	//反馈消息p3
	var FamilyRecData_p4 = 0;	//反馈消息p4
	var FamilyTransferName = 0	//被转让家族人的昵称
	var FamilyKickUID = 0;		//被踢人的uid
	var FamilyBeAssistantFlag = 0;	//任命/撤销家族执行官的标志
	var FamilyBeAssistantName = 0;	//任命/撤销家族执行官的人的名字
	var FamilyInviteID = 0;		//邀请人的家族的ID
	var FamilyInviterID = 0;	//邀请人的ID
	var FamilyCompleteID = 0;	//家族比赛id
	var FamilyLevUpMonitorFlag = 0;	//家族升级监视器创建状态，0为未创建，1为创建

	//监视家族升级
	void SetFamilyLevUpMonitor()
	{
		staticvar g_MyFamilyDBRow = new VNet2DBRow
		{
			name ="FamilyLevUpMonitor_Name";
			void InitDB(_familyID)
			{
				printf("xiayy:g_MyFamilyDBRow Create;_familyID:"+_familyID);
				InitByInt(window.GAMEUI,window.JIVECONSORTIAINI,window.GAMEUI_JIVECONSORTIAINI_ID,_familyID);
				AddDBEvent("OnMyDataChange",6);	
			}

			//索引
			//_familyLev：6家族等级
			void OnMyDataChange(index,_familyLev)
			{
				switch(index)
				{
					case 6:
					{
						//window.WriteToFamilyChat("家族升级了");
						//window.ShowFamilyTipInfo(window.SUC_FAMILY_LVUP);
						break;
					}
				}
			}

			void DelMonitor()
			{
				window.FamilyLevUpMonitorFlag = 0;
				del();
			}
		}
	}
	
	//监视家族人数
	void SetFamilyOnlinePeopleNum()
	{
		staticvar g_Monitor_FamilyOnlinePeopleNum = new VNet2DBTable
		{
//			printf("xiayy:g_Monitor_FamilyOnlinePeopleNum Create");
			name = "FamilyOnlinePeopleNum_NAME";
			var _tempPoint = 0;
			
			var _SQL = "SELECT * FROM "+window.JIVECONSORTIA;
			Select(window.GAMEUI,_SQL);

			void OnAddData(p0,_userNick,_consortiaID,_state,p4,p5,_point,p7,_online)
			{
//				printf("xiayy:My_consortiaID:"+window.GetFamilyIDByName()+",_consortiaID:"+_consortiaID+",_online:"+_online+",_point:"+_point);
				_tempPoint = _point;
				if(window.GetFamilyIDByName() == _consortiaID)
				{
					if(_online == 1)
					{
//						if(_userNick == window.GetMyName())
//						{
//							window.F_Family_Getallteam();
//						}
						//任务 在线人数要求
						var _familyOnlinePeopleNum = window.GetFamilyOnlinePeopleNum();
						window.TaskEvent_NeedFamilyOnlinePeopleNum(_familyOnlinePeopleNum);
					}
//					var _VNet2DBTable = new VNet2DBTable
//					{
//						var _SQL = "SELECT * FROM "+window.FAMILYPEOPLECONTRIBUTETIP;
//						Select(window.GAMEUI,_SQL);
//
//						var _myPoint = toint(parent._tempPoint);//printf("xiayy:_point:"+_myPoint);
//						var _getToPoint = 0;
//
//						void GetData(data)
//						{
//							if(_myPoint >= data)
//							{
//								_getToPoint = data;
//							}
//						}
//					}
//					_VNet2DBTable.ReadData("GetData",window.GAMEUI_FAMILYPEOPLECONTRIBUTETIP_CONTRIBUTE);
//					var _peopleGetToPoint = _VNet2DBTable._getToPoint;
//					_VNet2DBTable.del();
//					if(_peopleGetToPoint != 0)
//					{
//						window.WriteToFamilyChat(""+_userNick+"为家族积累积分达到"+_peopleGetToPoint);
//					}
				}
//				printf("xiayy:FamilyLevUpMonitorFlag:"+window.FamilyLevUpMonitorFlag+",MyName:"+window.GetMyName()+"_userNick:"+_userNick);
				if(window.GetMyName() == _userNick)
				{
					if(window.FamilyLevUpMonitorFlag == 0)
					{
						window.SetFamilyLevUpMonitor();
						window.find("FamilyLevUpMonitor_Name").InitDB(toint(_consortiaID));
						window.FamilyLevUpMonitorFlag = 1;
					}
					if(toint(_state) == 0)
					{
						var _pos = window.GetUIPos();
						if(_pos == window.POS_FAMILYROOM)
						{
							window.RoomToFamily();
						}
						if(_pos == window.POS_GAME)
						{
							var _familyActivityState = window.GetFamilyActivityState();
							if(_familyActivityState == window.g_QUEUE_QUEUEWAIT || _familyActivityState == window.g_QUEUE_PAUSE)
							{
								window.g_OnConfirm_QuitWait(window.FAMILY_ACTIVITY_ID);
							}
						}
					}
				}
				
			}
			void OnDelete()
			{
//				window.FamilyLevUpMonitorFlag = 0;
//				window.find("FamilyLevUpMonitor_Name").del();
				window.find("FamilyLevUpMonitor_Name").DelMonitor();
			}
		}
	}
	
	
	//=====================================家族功能部分=========================================
	//[功能]获取家族比赛状态
	//[参数]无
	//[返回]家族比赛状态
	void GetFamilyActivityState()
	{
		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByInt(window.M_G_SERVER,window.ARENARACE,window.M_G_SERVER_ARENARACE_ID,toint(window.FAMILY_ACTIVITY_ID));
		if(!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			return -1;
		}
		var _state = _VNet2DBRow.GetData(window.M_G_SERVER_ARENARACE_RACE_STATE);
		_VNet2DBRow.del();
		return _state;
	}

	//[功能]获取相应等级的家族名称的颜色
	//[参数]_lv：等级；type：1为字的颜色，2为描边的颜色
	//[返回]返回颜色
	void GetFamilyNameColor(_lv,type)
	{
		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByInt(window.GAME,window.JZ_LEVEL,window.GAME_JZ_LEVEL_LV,_lv);
		if(!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			return window.DB_ERR;
		}
		var _color = "";
		if(type == window.FAMILY_COLORTYPE_COLOR)
		{
			_color = _VNet2DBRow.GetData(window.GAME_JZ_LEVEL_COLOR);
		}
		if(type == window.FAMILY_COLORTYPE_BORDERCOLOR)
		{
			_color = _VNet2DBRow.GetData(window.GAME_JZ_LEVEL_BORDERCOLOR);
		}//printf("xiayy:GetFamilyNameColor:type:"+type+",color:"+_color);
		_VNet2DBRow.del();
		return _color;
	}
	//[功能]获取玩家在家族的权限，即能做的事
	//[参数]_uid：玩家_uid
	//[返回]返回权限
	void GetPeoplePopedom(_uid)
	{
		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByString(window.GAMEUI,window.JIVECONSORTIA,window.GAMEUI_JIVECONSORTIA_USERNAME,tostring(_uid));
		if(!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			return window.DB_ERR;
		}
		var _popedom = _VNet2DBRow.GetData(window.GAMEUI_JIVECONSORTIA_POPEDOM);
		_VNet2DBRow.del();
		return _popedom;
	}
	//[功能]获取玩家是否拥有某种权限
	//[参数]_uid：玩家_uid;_popedom：权限号
	//[返回]true:拥有这项权限；false：没有这项权限
	void GetPeopleOnePopedomState(_uid,_popedom)
	{
		var _allPopedom = window.GetPeoplePopedom(_uid);
		if(_allPopedom == window.DB_ERR)
		{
			return false;
		}
		var _pos = _allPopedom.Find(""+_popedom+";");
		if(_pos<0 || _pos == _allPopedom.Count)
		{
			return false;
		}
		else
		{
			return true;
		}
	}
	//[功能]获取家族悬停的信息
	//[参数]_index:TIPINFO表中的索引号
	//[返回]返回显示的文字
	void GetFamilyHangWndTip(_index)
	{
		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByInt(window.GAMEUI,window.TIPINFO,window.GAMEUI_TIPINFO_TIPINDEX,_index);
		if(!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			return window.DB_ERR;
		}
		var _familyHangWndTip = _VNet2DBRow.GetData(window.GAMEUI_TIPINFO_TIPTEXT);
		_VNet2DBRow.del();
		return _familyHangWndTip;
	}
	
	//清除家族排行榜中的内容
	void ClearFamilyTopListData()
	{
		var _VNet2DBTable = new VNet2DBTable
		{
			var _SQL = "SELECT * FROM "+window.JIVECONSORTIAINI;
			Select(window.GAMEUI,_SQL);

			
			void GetData(_id)
			{
				var row = new VNet2DBRow{};
				row.InitByInt(window.GAMEUI,window.JIVECONSORTIAINI,window.GAMEUI_JIVECONSORTIAINI_ID,_id);
				if(!row.IsReady())
				{
					row.del();
					return window.DB_ERR;
				}
				row.SetInt(window.GAMEUI_JIVECONSORTIAINI_STATE,0);
				row.del();
			}
		}
		_VNet2DBTable.ReadData("GetData",window.GAMEUI_JIVECONSORTIAINI_ID);
		_VNet2DBTable.del();
	}
	//[功能]是否被屏蔽发言
	//[参数]_name：玩家名字
	//[返回值]是否能发言状态：0为不能发言，1为能发言
	void GetFamilyPeopleCanChat(_name)
	{
		var _playName = _name;
		if(_playName == "" || _playName == 0)
		{
			_playName = window.GetNameByUID();
		}
		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByString(window.GAMEUI,window.JIVECONSORTIA,window.GAMEUI_JIVECONSORTIA_USERNICK,_playName);
		if(!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			return window.DB_ERR;
		}
		var _canChatState = _VNet2DBRow.GetData(window.GAMEUI_JIVECONSORTIA_CHAT);
		_VNet2DBRow.del();
		return _canChatState;
	}

	//[功能]获取当前等级家族可以拥有的最大人数
	//[参数]_lv：等级
	//[返回值]返回最大人数
	void GetFamilyMaxPeopleNum(_lv)
	{
		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByInt(window.GAME,window.JZ_LEVEL,window.GAME_JZ_LEVEL_LV,_lv);
		if(!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			return window.DB_ERR;
		}
		var _maxPeopleNum = _VNet2DBRow.GetData(window.GAME_JZ_LEVEL_NUM);
		_VNet2DBRow.del();
		return _maxPeopleNum;
	}
	
	//[功能]获取升级所需的积分
	//[参数]_lv：等级
	//[返回值]返回相应等级所需的积分
	void GetLevelUpNeedPoint(_lv)
	{
		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByInt(window.GAME,window.JZ_LEVEL,window.GAME_JZ_LEVEL_LV,_lv);
		if(!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			return window.DB_ERR;
		}
		var _needPoint = _VNet2DBRow.GetData(window.GAME_JZ_LEVEL_POINT);
		_VNet2DBRow.del();
		return _needPoint;
	}
	//[功能]通过名字查找家族是否存在
	//[参数]data：名字
	//[返回值]true：存在；false：不存在
	void existFamilyByName(data)
	{
		if(data == "" || data = 0)
		{
			return window.DB_ERR;
		}
		window.g_Row.InitByString(window.GAMEUI,window.JIVECONSORTIAINI,window.GAMEUI_JIVECONSORTIAINI_NAME,data);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetRIDByName:"+window.GAMEUI+",TBName:"+window.JIVECONSORTIAINI);
			return false;
		}
		window.g_Row.Release();
		return true;
	}
	

	//[功能]解析徽章数据
	//[参数]data:徽章数据
	//[返回值]返回徽章内外框数据
	void parserBadgeData(data)
	{
		var _tempNum = window.FAMILY_BAGEE_BITNUM*10;
		var _badgeOutAll = toint(toint(data)/toint(_tempNum));
		var _badgeInAll = toint(toint(data)%toint(_tempNum));
		var _badgeOut = sysarray(3);
		var _badgeIn = sysarray(3);
		//解析外框数据
		var _temp = _badgeOutAll;
		_badgeOut[0] = toint(_temp/window.FAMILY_BAGEE_BITNUM);
		_temp = toint(_badgeOutAll%window.FAMILY_BAGEE_BITNUM);
		_badgeOut[1] = toint(_temp/10);
		_temp = toint(_temp%10);
		_badgeOut[2] = _temp;
		//解析内框数据
		_temp = _badgeInAll;
		_badgeIn[0] = toint(_temp/window.FAMILY_BAGEE_BITNUM);
		_temp = toint(_temp%window.FAMILY_BAGEE_BITNUM);
		_badgeIn[1] = toint(_temp/10);
		_temp = toint(_temp%10);
		_badgeIn[2] = _temp;

		_temp = ""+_badgeOut[0]+","+_badgeOut[1]+","+_badgeOut[2]+","+_badgeIn[0]+","+_badgeIn[1]+","+_badgeIn[2];
		return _temp;
	}

	//[功能]判断玩家是否拥有家族
	//[参数]_name:玩家昵称
	//[返回值]true：有家族；false：无家族
	void haveFamilyState(_name)
	{
		var _playName = _name;
		if(_playName == "" || _playName == 0)
		{
			_playName = window.GetNameByUID();
		}
		window.g_Row.InitByString(window.GAMEUI,window.JIVECONSORTIA,window.GAMEUI_JIVECONSORTIA_USERNICK,_playName);
		if(!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			return false;
		}
		var _familyState = window.g_Row.GetData(window.GAMEUI_JIVECONSORTIA_STATE);
		window.g_Row.Release();
		if(_familyState == 1)
		{
			return true;
		}
		if(_familyState == 0)
		{
			return false;
		}
	}
	//[功能]根据_uid判断玩家是否拥有家族
	//[参数]_uid：用户id
	//[返回值]true：有家族；false：无家族
	void haveFamilyStateByUID(_uid)
	{
		var _playUID = _uid;
		if(_playUID == "" || toint(_playUID) == 0)
		{
			_playUID = window.GetMyUID();
		}
		window.g_Row.InitByString(window.GAMEUI,window.JIVECONSORTIA,window.GAMEUI_JIVECONSORTIA_USERNAME,tostring(_playUID));
		if(!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			return false;
		}
		var _familyState = window.g_Row.GetData(window.GAMEUI_JIVECONSORTIA_STATE);
		window.g_Row.Release();
		if(_familyState == 1)
		{
			return true;
		}
		if(_familyState == 0)
		{
			return false;
		}
	}

	//[功能]获取玩家对家族的贡献点
	//[参数]无
	//[返回值]玩家对家族的贡献点
	void GetFamilyPoint()
	{
		window.g_Row.InitByString(window.GAMEUI,window.JIVECONSORTIA,window.GAMEUI_JIVECONSORTIA_USERNICK,window.GetNameByUID());
		if(!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			return window.DB_ERR;
		}
		var _familyPoint = window.g_Row.GetData(window.GAMEUI_JIVECONSORTIA_POINT);
		window.g_Row.Release();
		return _familyPoint;
	}

	//[功能]获取玩家在家族的权利
	//[参数]_uid:玩家uid
	//[返回值]玩家权利
	void GetFamilyPotence(_uid)
	{
		var _userID = _uid;
		if(_userID =="" || toint(_userID) == 0)
		{
			_userID = window.GetMyUID();
		}
		window.g_Row.InitByString(window.GAMEUI,window.JIVECONSORTIA,window.GAMEUI_JIVECONSORTIA_USERNAME,tostring(_userID));
		if(!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			return window.DB_ERR;
		}
		var _potence = window.g_Row.GetData(window.GAMEUI_JIVECONSORTIA_POTENCE);
		window.g_Row.Release();
		return _potence;
	}

	//[功能]获取公会id
	//[参数]_name:玩家昵称
	//[返回值]公会id
	void GetFamilyIDByName(_name)
	{
		var _userName = _name;
		if(_userName == 0 || _userName == "")
		{
			_userName = window.GetNameByUID();
		}
		window.g_Row.InitByString(window.GAMEUI,window.JIVECONSORTIA,window.GAMEUI_JIVECONSORTIA_USERNICK,_userName);
		if(!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			return window.DB_ERR;
		}
		var _familyID = window.g_Row.GetData(window.GAMEUI_JIVECONSORTIA_CONSORTIAID);
		var _familyState = window.g_Row.GetData(window.GAMEUI_JIVECONSORTIA_STATE);
		window.g_Row.Release();
		if(_familyState > 0)
		{
			return _familyID;
		}
		else
		{
			return -1;
		}
		
	}

	//[功能]获取公会id
	//[参数]_UID:玩家UID
	//[返回值]公会id
	void GetFamilyIDByUID(_UID)
	{
		var _userID = _UID;
		if(_userID == 0 || _userID == "")
		{
			_userID = window.GetMyUID();
		}
		window.g_Row.InitByString(window.GAMEUI,window.JIVECONSORTIA,window.GAMEUI_JIVECONSORTIA_USERNAME,_userID);
		if(!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			return window.DB_ERR;
		}
		var _familyID = window.g_Row.GetData(window.GAMEUI_JIVECONSORTIA_CONSORTIAID);
		var _familyState = window.g_Row.GetData(window.GAMEUI_JIVECONSORTIA_STATE);
		window.g_Row.Release();
		if(_familyState > 0)
		{
			return _familyID;
		}
		else
		{
			return -1;
		}
		
	}

	//[功能]获取公会id
	//[参数]_name:公会名称
	//[返回值]公会id
	void GetFamilyIDByFamilyName(_name)
	{
		var _familyName = _name;
		var _dbField = window.JIVECONSORTIAINISYN;
		if(_familyName == "")
		{
			_familyName = window.GetFamilyName();
			_dbField = window.JIVECONSORTIAINI;
		}
		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByString(window.GAMEUI,_dbField,window.GAMEUI_JIVECONSORTIAINISYN_NAME,_familyName);
		if(!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			return window.DB_ERR;
		}
		var _familyID = _VNet2DBRow.GetData(window.GAMEUI_JIVECONSORTIAINISYN_ID);
		_VNet2DBRow.del();
		return _familyID;
	}

	//[功能]获取公会人数
	//[参数]_name：玩家名字
	//[返回值]_people:公会人数
	void GetFamilyPeopleNum(_name)
	{
		window.g_Row.InitByInt(window.GAMEUI,window.JIVECONSORTIAINI,window.GAMEUI_JIVECONSORTIAINI_ID,window.GetFamilyIDByName(_name));
		if(!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			return window.DB_ERR;
		}
		var _people = window.g_Row.GetData(window.GAMEUI_JIVECONSORTIAINI_CURRNUM);
		window.g_Row.Release();
		return _people;
	}
	//[功能]获取公会人数
	//[参数]_uid：公会UID
	//[返回值]_people:公会人数
	void GetFamilyPeopleNumByUID(uid)
	{
		window.g_Row.InitByInt(window.GAMEUI,window.JIVECONSORTIAINI,window.GAMEUI_JIVECONSORTIAINI_ID,uid);
		if(!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			return window.DB_ERR;
		}
		var _people = window.g_Row.GetData(window.GAMEUI_JIVECONSORTIAINI_CURRNUM);
		window.g_Row.Release();
		return _people;
	}
	//[功能]获取公会在线人数
	//[参数]_name：玩家名字
	//[返回值]_people:公会在线人数
	void GetFamilyOnlinePeopleNum()
	{
		var _VNet2DBTable = new VNet2DBTable
		{
			var _SQL = "SELECT * FROM "+window.JIVECONSORTIA+" WHERE "+window.GAMEUI_JIVECONSORTIA_STATE_STR+"=1 AND "+window.GAMEUI_JIVECONSORTIA_ONLINE_STR+"="+window.FAMILY_PEOPLE_ONLINE+" AND "+window.GAMEUI_JIVECONSORTIA_CONSORTIAID_STR+"="+window.GetFamilyIDByName();
			Select(window.GAMEUI,_SQL);
		}
		var  m_onlinePeopleNum = _VNet2DBTable.GetSize();
		_VNet2DBTable.del();
		return m_onlinePeopleNum;
	}
	//[功能]获取公会名称
	//[参数]无
	//[返回值]返回公会名称
	void GetFamilyName(_name)
	{
		window.g_Row.InitByInt(window.GAMEUI,window.JIVECONSORTIAINI,window.GAMEUI_JIVECONSORTIAINI_ID,window.GetFamilyIDByName(_name));
		if(!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			return window.DB_ERR;
		}
		var _familyName = window.g_Row.GetData(window.GAMEUI_JIVECONSORTIAINI_NAME);
		window.g_Row.Release();
		return _familyName;
	}
	//[功能]获取公会会长名称
	//[参数]无
	//[返回值]返回公会会长名称
	void GetFamilyHeadName()
	{
		window.g_Row.InitByInt(window.GAMEUI,window.JIVECONSORTIAINI,window.GAMEUI_JIVECONSORTIAINI_ID,window.GetFamilyIDByName());
		if(!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			return window.DB_ERR;
		}
		var _familyHeadName = window.g_Row.GetData(window.GAMEUI_JIVECONSORTIAINI_USERNICK);
		window.g_Row.Release();
		return _familyHeadName;
	}
	//[功能]获取公会签名
	//[参数]无
	//[返回值]返回公会签名
	void GetFamilySlogan(_name)
	{
		window.g_Row.InitByInt(window.GAMEUI,window.JIVECONSORTIAINI,window.GAMEUI_JIVECONSORTIAINI_ID,window.GetFamilyIDByName(_name));
		if(!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			return window.DB_ERR;
		}
		var _slogn = window.g_Row.GetData(window.GAMEUI_JIVECONSORTIAINI_SLOGAN);
		window.g_Row.Release();
		return _slogn;
	}
	
	//[功能]获取公会公告
	//[参数]无
	//[返回值]返回公会公告
	void GetFamilyAffiche()
	{
		window.g_Row.InitByInt(window.GAMEUI,window.JIVECONSORTIAINI,window.GAMEUI_JIVECONSORTIAINI_ID,window.GetFamilyIDByName());
		if(!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			return window.DB_ERR;
		}
		var _affiche = window.g_Row.GetData(window.GAMEUI_JIVECONSORTIAINI_CALLBOARD);
		window.g_Row.Release();
		return _affiche;
	}

	//[功能]获取公会等级
	//[参数]uid:公会id
	//[返回值]公会等级
	void GetFamilyLev(uid)
	{
		var _familyUID = uid;
		var _db = window.JIVECONSORTIAINISYN;
		var _dbField = window.GAMEUI_JIVECONSORTIAINISYN_ID;
		var _lookForField = window.GAMEUI_JIVECONSORTIAINISYN_CURRLV;
		if(_familyUID == "" || toint(_familyUID) == 0)
		{
			_db = window.JIVECONSORTIAINI;
			_dbField = window.GAMEUI_JIVECONSORTIAINI_ID;
			_lookForField = window.GAMEUI_JIVECONSORTIAINI_CURRLV;
			_familyUID = window.GetFamilyIDByName();
		}
		window.g_Row.InitByInt(window.GAMEUI,_db,_dbField,_familyUID);
		if(!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			return window.DB_ERR;
		}
		var _FamilyLev = window.g_Row.GetData(_lookForField);
		window.g_Row.Release();
		return _FamilyLev;
	}

	//[功能]获取公会图标能否修改
	//[参数]无
	//[返回值]公会图标能否修改
	void GetFamilyIconSet()
	{
		window.g_Row.InitByInt(window.GAMEUI,window.JIVECONSORTIAINI,window.GAMEUI_JIVECONSORTIAINI_ID,window.GetFamilyIDByName());
		if(!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			return window.DB_ERR;
		}
		var _FamilyIconSet = window.g_Row.GetData(window.GAMEUI_JIVECONSORTIAINI_SETICON);
		window.g_Row.Release();
		return _FamilyIconSet;
	}

	//[功能]获取能否自动加入公会的标志
	//[参数]无
	//[返回值]返回能否自动加入公会的标志
	void GetApplyForFamily()
	{
		window.g_Row.InitByInt(window.GAMEUI,window.JIVECONSORTIAINI,window.GAMEUI_JIVECONSORTIAINI_ID,window.GetFamilyIDByName());
		if(!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			return window.DB_ERR;
		}
		var _apply = window.g_Row.GetData(window.GAMEUI_JIVECONSORTIAINI_APPLYNEEDAGREE);
		window.g_Row.Release();
		return _apply;
	}
	//[功能]获取管理员人数
	//[参数]无
	//[返回值]管理员人数
	void GetFamilyAssistantNum()
	{
		var _VNet2DBTable=new VNet2DBTable{}
		var _SQL = "SELECT * FROM "+window.JIVECONSORTIA+" WHERE "+window.GAMEUI_JIVECONSORTIA_CONSORTIAID_STR+"=" + window.GetFamilyIDByName()+" AND "+window.GAMEUI_JIVECONSORTIA_POTENCE_STR+"="+window.FAMILY_POTENCE_ASSISTANT;
		_VNet2DBTable.Select(window.GAMEUI, _SQL);
		var _size = _VNet2DBTable.GetSize();
		_VNet2DBTable.del();
		return _size;
	}
	//[功能]获取家族徽章数据
	//[参数]_name:玩家昵称
	//[返回值]返回家族徽章数据
	void GetFamilyBadgeData(_name)
	{
		window.g_Row.InitByInt(window.GAMEUI,window.JIVECONSORTIAINI,window.GAMEUI_JIVECONSORTIAINI_ID,window.GetFamilyIDByName(_name));
		if(!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			return window.DB_ERR;
		}
		var _badgeData = window.g_Row.GetData(window.GAMEUI_JIVECONSORTIAINI_ICONID);
		window.g_Row.Release();
		return _badgeData;
	}
	
	//[功能]计算家族徽章数据
	//[参数]data1：外框标志，data2：徽章等级，data3：图片索引，data4：内框标志，data5：徽章等级，data6：图片索引
	//[返回值]返回家族徽章数据
	void ComputeFamilyBageData(data1,data2,data3,data4,data5,data6)
	{
		var _badgeOutInfo = window.FAMILY_BAGEE_BITNUM*data1 + window.FAMILY_BAGEE_BITNUM*data2/100+data3;
		var _badgeInInfo = window.FAMILY_BAGEE_BITNUM*data4 + window.FAMILY_BAGEE_BITNUM*data5/100+data6;
		var _badgeData = toint(window.FAMILY_BAGEE_BITNUM*10*_badgeOutInfo + _badgeInInfo);
		return _badgeData;
	}

	//[功能]判断家族玩家是否在线
	//[参数]_uid：玩家id
	//[返回值]_state:1为在线；0为不在线
	void GetFamilyOnlineState(_uid)
	{
		if(_uid == "" || _uid == 0)
		{
			_uid = window.GetMyUID();
		}
		window.g_Row.InitByString(window.GAMEUI,window.JIVECONSORTIA,window.GAMEUI_JIVECONSORTIA_USERNAME,tostring(_uid));
		if(!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			return window.DB_ERR;
		}
		var _state = window.g_Row.GetData(window.GAMEUI_JIVECONSORTIA_ONLINE);
		window.g_Row.Release();
		return _state;
	}
	//[功能]获取家族成员列表中的成员等级
	//[参数]uid:用户id
	//[返回值]成员等级
	void GetLVByUIDInFamily(uid)
	{
		var _UserID = uid;
		if (toint(uid) == 0)
		{
			_UserID = window.GetMyUID();
		}
		
		window.g_Row.InitByString(window.GAMEUI,window.JIVECONSORTIA,window.GAMEUI_JIVECONSORTIA_USERNAME,tostring(_UserID));

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			return window.DB_ERR;
		}

		var _Lv = window.g_Row.GetData(window.GAMEUI_JIVECONSORTIA_LEVEL);
		window.g_Row.Release();
		return _Lv;
	}
	//[功能]获取家族成员列表中的性别
	//[参数]uid：用户id
	//[返回值]成员性别
	void GetSexByUIDInFamily(uid)
	{
		var _UserID = uid;
		if (toint(uid) == 0)
		{
			_UserID = window.GetMyUID();
		}
		
		window.g_Row.InitByString(window.GAMEUI,window.JIVECONSORTIA,window.GAMEUI_JIVECONSORTIA_USERNAME,tostring(_UserID));

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			return window.DB_ERR;
		}

		var _Sex = window.g_Row.GetData(window.GAMEUI_JIVECONSORTIA_SEX);
		window.g_Row.Release();
		return _Sex;
	}
	//[功能]获取家族成员列表中的技术类型
	//[参数]uid：用户id
	//[返回值]成员技术类型
	void GetRoleTypeByUIDInFamily(uid)
	{
		var _UserID = uid;
		if (toint(uid) == 0)
		{
			_UserID = window.GetMyUID();
		}
		window.g_Row.InitByString(window.GAMEUI,window.JIVECONSORTIA,window.GAMEUI_JIVECONSORTIA_USERNAME,tostring(_UserID));

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			return window.DB_ERR;
		}

		var _roletype = window.g_Row.GetData(window.GAMEUI_JIVECONSORTIA_TROLETYPE);
		window.g_Row.Release();
		return _roletype;
	}
	//[功能]获取家族成员的UID
	//[参数]_name:用户昵称
	//[返回值]家族成员的UID
	void GetFamilyPeopleUIDByName(_name)
	{
		var _userName = _name;
		if(_userName == "" || _userName == 0)
		{
			_userName = window.GetMyName();
		}
		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByString(window.GAMEUI,window.JIVECONSORTIA,window.GAMEUI_JIVECONSORTIA_USERNICK,_userName);
		if(!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			return window.DB_ERR;
		}
		var _userID = toint(_VNet2DBRow.GetData(window.GAMEUI_JIVECONSORTIA_USERNAME));
		_VNet2DBRow.del();
		return _userID;
	}
	//====================================家族消息部分=================================================
	//登入登出家族,客户端打开家族界面时登入,关闭时登出
	//data:0:登出 1:登入
	void F_Family_enter(data)
	{
		window.find("friendsys").SendTypeMessage("cs","enter",data);
	}
	//检查家族名称
	//data:家族名称
	void F_Family_checkname(data)
	{
		window.find("friendsys").SendTypeMessage("cs","checkname",data);
	}
	//申请加入
	//data:要加入家族的id
	void F_Family_Apply(data)
	{
		if(window.GetLvByUID() < window.FAMILY_APPLYLEV)
		{
			window.find("UIController").LoadDLG(654);
			return;
		}
//		var _lev = toint(window.GetFamilyLev(data));
//		if(window.GetFamilyPeopleNumByUID(data) >= window.GetFamilyMaxPeopleNum(_lev))
//		{
//			window.find("UIController").LoadDLG(666);
//			window.find("DLGLAYER").find("VMB_FamilyPopUpTipInfo_Logic").ReplaceData("该家族人数已满");
//			return;
//		}
		//window.find("UIController").LoadDLG(664);
		window.find("friendsys").SendTypeMessage("cs","apply",data);
		
		
	}
	//退出家族
	void F_Family_Leave()
	{
		window.find("friendsys").SendTypeMessage("cs","leave","");
		window.find("VMyFamily_Logic").m_TypeIndex = 1;
	}
	//解散家族
	//data:玩家id
	void F_Family_Dismiss(data)
	{
		window.find("friendsys").SendTypeMessage("cs","dismiss",data);
		window.find("VMyFamily_Logic").m_TypeIndex = 1;
	}
	//修改家族签名
	//data:家族签名
	void F_Family_Modifyslogan(data)
	{
		window.find("friendsys").SendTypeMessage("cs","modifyslogan",data);
	}
	//修改家族公告板
	//data:家族公告板
	void F_Family_Modifycallboard(data)
	{
		window.find("friendsys").SendTypeMessage("cs","modifycallboard",data);
	}
	//修改能否自动加入的标志
	//data:自动加入的标志
	void F_Family_Modifyapply(data)
	{
		window.find("friendsys").SendTypeMessage("cs","modifyapply",data);
	}
	//修改家族徽章数据
	void F_Family_Modifyicon(data)
	{
		window.find("friendsys").SendTypeMessage("cs","modifyicon",data);
	}
	//修改家族中某人的权限
	//data1:玩家名字；data2:0降级为普通用户 1升级为管理员
	void F_Family_Modifypopedom(data1,data2)
	{
		if(data2 == window.FAMILY_UPTOASSISTANT)
		{
			if(window.GetFamilyPeopleCanChat(data1) == 0)
			{
				var _uid = window.GetFamilyPeopleUIDByName(data1);
				window.F_Family_ShieldTalk(_uid,window.FAMILY_CANCLESHIELD);
			}
		}
		window.find("friendsys").SendTypeMessage("cs","modifypopedom",data1,data2);
	}
	//把家族中一个成员踢出
	//data:玩家id
	void F_Family_Kick(data)
	{
		window.find("friendsys").SendTypeMessage("cs","kick",data);
	}
	//转让族长
	//data:要转给家族人的名字
	void F_Family_Transfer(data)
	{
		if(window.GetFamilyPeopleCanChat(data) == 0)
		{
			var _uid = window.GetFamilyPeopleUIDByName(data);
			window.F_Family_ShieldTalk(_uid,window.FAMILY_CANCLESHIELD);
		}
		window.find("friendsys").SendTypeMessage("cs","transfer",data);
	}
	//屏蔽某人的在家族中的聊天
	//data1:被屏蔽人的id;data2:0:禁言 1:取消禁言
	void F_Family_ShieldTalk(data1,data2)
	{
		window.find("friendsys").SendTypeMessage("cs","chat",data1,data2);
	}
	//家族某人邀请人加入
	//data:要加入家族的人物昵称
	void F_Family_Askadd(data)
	{
		window.find("friendsys").SendTypeMessage("cs","askadd",data);
	}
	//对申请的处理
	//data1:要处理的申请id;data2:0不同意 1同意
	void F_Family_Doapply(data1,data2)
	{
		window.find("friendsys").SendTypeMessage("cs","doapply",data1,data2);
	}
	//同意邀请加人家族
	//askid:邀请人的id;teamid:邀请人的家族id;isagree:1 同意，0不同意
	void F_Family_Recinvite(askid,teamid,isagree)
	{
		window.find("friendsys").SendTypeMessage("cs","recinvite",askid,teamid,isagree);
	}
	//家族排行榜
	//data:家族数据的hash值
	void F_Family_Getallteam()
	{
		window.find("friendsys").SendTypeMessage("cs","getallteam",window.FamilyDataHash);
	}
	//获得申请信息
	void F_Family_Getallapply()
	{
		window.find("friendsys").SendTypeMessage("cs","getallapply","");
	}
	//清除所有的申请,成功后客户端需清除自己本地数据
	void F_Family_Clearallapply()
	{
		window.find("friendsys").SendTypeMessage("cs","clearallapply","");
	}
	//获得其他玩家的家族名称,只能查找在线的用户
	void F_Family_GetOtherPlayerFamilyName(data)
	{
		window.find("friendsys").SendTypeMessage("cs","getinfo",data);
	}

	//获得排行榜的家族数据
	void F_Family_GetFamilyInfo(id)
	{
		window.find("friendsys").SendTypeMessage("cs","getFamilyInfo",id);
	}

	//给一个人发消息
	void F_Friend_TransMsg(id,msg)
	{
		window.find("friendsys").SendTypeMessage("fr","transmsg",id,msg);
	}
	//======================提示信息专用函数===========================
	//获取显示在聊天框中的提示内容
	//_recID:反馈信息ID
	void GetFamilyTipInfoContent(_recID)
	{
		window.g_Row.InitByInt(window.GAMEUI,window.FAMILYTIPINFO,window.GAMEUI_FAMILYTIPINFO_RECID,_recID);
		if(!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			return window.DB_ERR;
		}
		var _tipInfoContent = window.g_Row.GetData(window.GAMEUI_FAMILYTIPINFO_CONTENT);//alert(_tipInfoContent);
		window.g_Row.Release();
		return _tipInfoContent;
	}
	//获取弹出框的索引
	//_recID:反馈信息ID
	void GetFamilyTipDLGIndex(_recID)
	{
		window.g_Row.InitByInt(window.GAMEUI,window.FAMILYTIPINFO,window.GAMEUI_FAMILYTIPINFO_RECID,_recID);
		if(!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			return window.DB_ERR;
		}
		var _tipInfoDLGIndex = window.g_Row.GetData(window.GAMEUI_FAMILYTIPINFO_POPUPINDEX);//alert(_tipInfoContent);
		window.g_Row.Release();
		return _tipInfoDLGIndex;
	}
	//获取提示信息的类型
	//_recID:反馈信息ID
	void GetFamilyTipType(_recID)
	{
		window.g_Row.InitByInt(window.GAMEUI,window.FAMILYTIPINFO,window.GAMEUI_FAMILYTIPINFO_RECID,_recID);
		if(!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			return window.DB_ERR;
		}
		var _tipInfoType = window.g_Row.GetData(window.GAMEUI_FAMILYTIPINFO_TYPE);//alert(_tipInfoContent);
		window.g_Row.Release();
		return _tipInfoType;
	}
	//数据进行处理
	//%s：玩家昵称；%i：我的昵称；%f：家族名称；%h：会长名称；%x:用于区分族长或管理员；%l：等级；%q：签名；
	//_content：获取的内容
	void SetTipInfoContent(_content)
	{
		var _sCount = window.GetSplitCount("%s");
		if(_sCount)
		{
			var _userName = "[ "+window.FamilyRecData_p2+" ]";
			if(_userName == window.GetNameByUID())
			{
				_userName = "[ 您 ]";
			}
			_content=_content.Replace("%s",_userName);
		}
		var _iCount = window.GetSplitCount("%i");
		if(_iCount)
		{
			var _replaceContent = "[ "+window.GetNameByUID()+" ]";
			_content=_content.Replace("%i",_replaceContent);
		}
		var _fCount = window.GetSplitCount("%f");
		if(_fCount)
		{
			var _replaceContent = "[ "+window.GetFamilyName()+" ]";
			if(window.FamilyRecData_p1 == window.SUC_FAMILY_DOAPPLY)
			{
				_replaceContent = "[ "+window.FamilyRecData_p2+" ]";
			}
			_content=_content.Replace("%f",_replaceContent);
		}
		var _hCount = window.GetSplitCount("%h");
		if(_hCount)
		{
			var _replaceContent = "[ "+window.GetFamilyHeadName()+" ]";
			_content=_content.Replace("%h",_replaceContent);
		}
		var _xCount = window.GetSplitCount("%x");
		if(_xCount)
		{
			var _replaceContent = "[ "+ window.FamilyRecData_p3+" ]";
			_content=_content.Replace("%x",_replaceContent);
		}
		var _lCount = window.GetSplitCount("%l");
		if(_lCount)
		{
			var _replaceContent = "[ "+window.GetFamilyLev()+" ]";
			_content=_content.Replace("%l",_replaceContent);
		}
		var _qCount = window.GetSplitCount("%q");
		if(_qCount)
		{
			var _replaceContent = "[ "+window.GetFamilySlogan()+" ]";
			if(window.FamilyRecData_p1 == window.SUC_FAMILY_MS)
			{
				_replaceContent = window.GetFamilySlogan();
			}
			_content=_content.Replace("%q",_replaceContent);
		}
		return _content;
	}
	//显示家族提示信息
	//_recID:反馈信息ID
	void ShowFamilyTipInfo(_recID)
	{
		var _type = window.GetFamilyTipType(_recID);
		var _content = window.GetFamilyTipInfoContent(_recID);
		if(_content == -1 || _content == "")
		{
			return;
		}
		var _dealContent = window.SetTipInfoContent(_content);
		switch(_type)
		{
			case 1:
			{
				window.find("UIController").LoadDLG(666);
				window.find("DLGLAYER").find("VMB_FamilyPopUpTipInfo_Logic").ReplaceData(_dealContent);
				break;
			}
			case 2:
			{
				window.WriteToFamilyChat(_dealContent);
			}
		}
	}
}