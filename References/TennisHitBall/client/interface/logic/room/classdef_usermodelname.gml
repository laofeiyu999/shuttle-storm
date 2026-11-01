//人物模型上的信息显示
//夏洋洋

importex("$./../../UI/Room/ClassDef_UserModelName.gml");

class VRoleModel_Info_Logic Layer
{
	
	var _uid = 0;
	var _showContentMoveFlag = true;	//信息内容位置移动标志
	var _showState = true;		//内容显示状态
	var _FamilyNameShowFlag = true;	//家族名字状态
	var _UserNameShowFlag = true;	//用户名字状态
	var _LoverNameShowFlag = true;  //情侣名字状态

	void Init()
	{
		//家族徽章
		staticvar s_FamilyIcon = new item{}
		staticvar m_UserFamilyName = new BaseText
		{}
		staticvar m_UserName = new BaseText
		{}
	}
	//name = "VRoleModel_Info_Logic_Name";
	inclass("VRoleModel_Info_UI");

	void SetEvent()
	{
		set m_UserName
		{
			show = window.g_RoleModel_UserNameShowState;
		}
		set m_UserFamilyName
		{
			show = window.g_RoleModel_FamilyNameShowState;
		}
		set s_FamilyIcon
		{
			show = window.g_RoleModel_FamilyNameShowState;
		}
		set m_SomeOneLover
		{
//			show = window.g_RoleModel_LoverNameShowState;
			show = true;
		}
	}

	Init();
	SetEvent();

	void SetName(_index)
	{
		_uid = _index;
		name = "VRoleModel_Info_Logic_Name_"+_index;
		window.F_Family_GetOtherPlayerFamilyName(_index);
	}

	void SetShowState(_state)
	{
//		m_UserName.show = _state;
//		s_FamilyIcon.show = _state;
//		m_UserFamilyName.show = _state;
		show = _state;
		_showState = _state;
	}

	void SetUserName(data)
	{
		m_UserName.SetData(data);
		//_uid = window.GetUIDByName(data);
//		var _familyName = window.GetFamilyName(data);
//		m_UserFamilyName.SetData(_familyName);
//		SetFamilyName("正在获取中...");
//		window.F_Family_GetOtherPlayerFamilyName(_uid);
//		CheckPos();
	}

	void SetFamilyName(data)
	{
		m_UserFamilyName.SetData(data);
	}

	void SetFamilyIcom(state,data)
	{
		s_FamilyIcon.SetData(state,data);
	}

	void SetFamilyColorByLv(_lv)
	{
		m_UserFamilyName.SetFamilyColorByLv(_lv);
	}

	void GetUserName()
	{
		return m_UserName.src;
	}

	void SetLoverName(data)
	{
		m_SomeOneLover.SetData(data);
	}

	void ResetPos(_pos)
	{
		pos = ""+_pos;
		left = left-width/2+35;
		top = top-height+10;
		pos(left,top);
	}

	//设置信息内容位置移动标志，_state：true显示，false不显示
	void SetShowContentMoveFlag(_state)
	{
		_showContentMoveFlag = _state;
	}

	//设置家族名称显示内容，_state：true显示，false不显示
	void SetFamilyNameShowState(_state)
	{
		_FamilyNameShowFlag = _state;
		m_UserFamilyName.show = _state;
		s_FamilyIcon.show = _state;
	}

	//设置用户昵称显示内容，_state：true显示，false不显示
	void SetUserNameShowState(_state)
	{
		_UserNameShowFlag = _state;
		m_UserName.show = _state;
	}
	//设置用户情侣显示内容，_state：true显示，false不显示
	void SetLoverNameShowState(_state)
	{
		_UserNameShowFlag = _state;
		m_SomeOneLover.show = _state;
	}

	void CheckPos()
	{
		while(true)
		{
			if(!_showState)
			{
				sleep(60);
				continue;
			}
			SetFamilyNameShowState(window.g_RoleModel_FamilyNameShowState);
			SetUserNameShowState(window.g_RoleModel_UserNameShowState);
			if(!window.g_RoleModel_FamilyNameShowState && !window.g_RoleModel_UserNameShowState)
			{
				sleep(60);
				continue;
			}
			var _pos = 0;
			if(window.g_probablyPos == window.POS_PROBABLY_LOOKAT)
			{
				_pos = window.GetAction2DPosInLookAt(_uid);
			}
			else
			{
				_pos = window.GetAction2DPos(_uid);
			}
			//var _state = false;
			if(_pos != 0)
			{
				show = true;//_state = true;
				ResetPos(_pos);
				
			}
			else
			{
				show = false;//_state = false;
			}
			//printf("xiayy:CheckPos:_uid:"+_uid+",pos:"+_pos+",show:"+_showState+",g_RoleModel_FamilyNameShowState:"+window.g_RoleModel_FamilyNameShowState+",g_RoleModel_UserNameShowState:"+window.g_RoleModel_UserNameShowState);
			sleep(60);
		}
	}

	void OnUpdate()
	{
		if(!_showState)
		{
			return;
		}
		if(_FamilyNameShowFlag != window.g_RoleModel_FamilyNameShowState)
		{
			SetFamilyNameShowState(window.g_RoleModel_FamilyNameShowState);
		}
		if(_UserNameShowFlag != window.g_RoleModel_UserNameShowState)
		{
			SetUserNameShowState(window.g_RoleModel_UserNameShowState);
		}
		if(!window.g_RoleModel_FamilyNameShowState && !window.g_RoleModel_UserNameShowState && !window.g_RoleModel_LoverNameShowState)
		{
			return;
		}
		var _pos = 0;
		if(window.g_probablyPos == window.POS_PROBABLY_LOOKAT)
		{
			_pos = window.GetAction2DPosInLookAt(_uid);
		}
		else
		{
			_pos = window.GetAction2DPos(_uid);
		}
		if(_pos != 0)
		{
			show = true;
			ResetPos(_pos);
			
		}
		else
		{
			show = false;
		}
		//printf("xiayy:CheckPos:_uid:"+_uid+",pos:"+_pos+",show:"+_showState+",g_RoleModel_FamilyNameShowState:"+window.g_RoleModel_FamilyNameShowState+",g_RoleModel_UserNameShowState:"+window.g_RoleModel_UserNameShowState);
	}
}