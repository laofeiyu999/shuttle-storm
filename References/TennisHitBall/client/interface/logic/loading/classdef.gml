//
//Loading界面的逻辑部分类定义(去游戏)
//
importex("$./../../UI/Loading/ClassDef.gml");

//玩家状态信息
class VLoading_UserState item
{
	size = "100,30";show = false;
	var _IsFirst = false;	//昵称设置后就不再设置了
	//===================================与显示交互部分========================================
	void Init()
	{
		//玩家昵称
		staticvar s_Nkname = new VMyText{}
		//玩家状态
		staticvar s_State = new VMyText{pos(50,0);}
	}
	inclass("VLoading_UserState_UI");//界面显示类
	//=========================================================================================
	Init();

	//data1:玩家ID
	//data2:状态 0等待 1已加载完毕
	void SetData(uid,state)
	{
		if (uid<=0)
		{
			show = false;
			return;
		}
		show = true;
		if (!_IsFirst)
		{
			s_Nkname.SetData(window.GetNameByUID(uid));
			_IsFirst = true;
		}
		s_State.SetData(state);
	}
};

class VLoadingToGame_Logic item
{
	size = "100%,100%";bgcolor = "#FFFFFF";alpha = 25;
	var m_UID1 = 0;	//玩家1ID
	var m_UID2 = 0;	//玩家2ID
	var m_UID3 = 0;	//玩家3ID
	var m_UID4 = 0;	//玩家4ID
	//===================================与显示交互部分========================================
	void Init()
	{
		//比赛类型标示
		//参数 data1:无用
		//参数 data2：0普通，1竞技
		//参数 data3: 竞技ID(data2=1有效)
		staticvar s_GameType = new VMyText{}
		
		//小提示
		staticvar s_Tip = new VMyText{halign(50,0);valign(80,0);}

		//玩家一：自己
		//参数 见类定义
		staticvar s_User1 = new VLoading_UserState{pos(0,700);}

		//玩家二：对手
		//参数 见类定义
		staticvar s_User2 = new VLoading_UserState{pos(200,700);}

		//玩家三：自己队友
		//参数 见类定义
		staticvar s_User3 = new VLoading_UserState{pos(400,700);}

		//玩家四：对手队友
		//参数 见类定义
		staticvar s_User4 = new VLoading_UserState{pos(600,700);}
	}
	inclass("VLoadingToGame_UI");//界面显示类
	//=========================================================================================
	Init();
	
	var _VNet2DBTable=new VNet2DBTable{};

	//随机一条提示
	void GetRandTip()
	{
		var _SQL = "SELECT * FROM LoadingTip";
		_VNet2DBTable.Select( window.GAMEUI,_SQL);
		var _ID = rand(1,_VNet2DBTable.GetSize()+1);
		
		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByInt(window.GAMEUI,window.LOADINGTIP,window.GAMEUI_LOADINGTIP_TIPINDEX,_ID);
		if (!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			printf("B# error-Loading-GetRandTip:DBname:"+window.GAMEUI+",TBName:"+window.LOADINGTIP+",ID="+_ID);
			return;
		}
		s_Tip.SetData(_VNet2DBRow.GetData(window.GAMEUI_LOADINGTIP_TIPTEXT));
	}

	//外部接口传值
	//是否为竞技,报名ID,UID1,UID2,UID3,UID4
	void SetData(isarena,raceID,UID1,UID2,UID3,UID4)
	{
		printf("B# Loading:SetData:isarena:"+isarena+",raceID:"+raceID+",UID1:"+UID1+",UID2:"+UID2+",UID3:"+UID3+",UID4:"+UID4);

		s_GameType.SetData("比赛类型:",isarena,raceID);
		m_UID1 = UID1;
		m_UID2 = UID2;
		m_UID3 = UID3;
		m_UID4 = UID4;
		s_User1.SetData(m_UID1,0);
		s_User2.SetData(m_UID2,0);
		s_User3.SetData(m_UID3,0);
		s_User4.SetData(m_UID4,0);
	}

	//设置玩家的状态-暂定
	//玩家1状态,玩家2状态,玩家3状态,玩家4状态
	void SetUserState(state1,state2,state3,state4)
	{
		printf("B# Loading:SetUserState:state1:"+state1+",state2:"+state2+",state3:"+state3+",state4:"+state4);

		s_User1.SetData(m_UID1,state1);
		s_User2.SetData(m_UID2,state2);
		s_User3.SetData(m_UID3,state3);
		s_User4.SetData(m_UID4,state4);
	}

	void OnCreated()
	{
		GetRandTip();
	}
};