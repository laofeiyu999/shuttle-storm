//操作自己数据的类GameUI.mdb selfdt===============================================
class VMyData item
{
	var _CURPOS		= -1;	//以前的先不变
	var TYPE_INT	= 0;
	var TYPE_STRING = 1;
	var TYPE_BOOL	= 2;
	
	var _uilayertree = new TreeUILayer{}

	void InitAllPos()
	{
		_uilayertree.LayerNumber(window.POS_NUMBER);
		_uilayertree.SetParent(window.POS_ROOT,window.POS_LOGIN);
		_uilayertree.SetParent(window.POS_ROOT,window.POS_CHANNELCHOOSE);
		_uilayertree.SetParent(window.POS_ROOT,window.POS_CREATEROLE);

		_uilayertree.SetParent(window.POS_ROOT,window.POS_HALL);
		_uilayertree.SetParent(window.POS_ROOT,window.POS_GAMEHALL);
		_uilayertree.SetParent(window.POS_ROOT,window.POS_ARENA);
		_uilayertree.SetParent(window.POS_ROOT,window.POS_CREATEROOM);

		_uilayertree.SetParent(window.POS_ROOT,window.POS_TOPSTAR);
		_uilayertree.SetParent(window.POS_ROOT,window.POS_USERLIST);
		_uilayertree.SetParent(window.POS_ROOT,window.POS_PACK);
		_uilayertree.SetParent(window.POS_ROOT,window.POS_SELFINFO);
		_uilayertree.SetParent(window.POS_ROOT,window.POS_VIDEO);
		_uilayertree.SetParent(window.POS_ROOT,window.POS_MAIL);
		_uilayertree.SetParent(window.POS_ROOT,window.POS_TASK);

		_uilayertree.SetParent(window.POS_ROOT,window.POS_FRIEND);
		_uilayertree.SetParent(window.POS_ROOT,window.POS_MSG);
		_uilayertree.SetParent(window.POS_ROOT,window.POS_FAMILY);
		_uilayertree.SetParent(window.POS_ROOT,window.POS_VIDEOING);
		
		_uilayertree.SetParent(window.POS_ROOT,window.POS_TRAIN);
		_uilayertree.SetParent(window.POS_ROOT,window.POS_TRAINING);
		_uilayertree.SetParent(window.POS_ROOT,window.POS_TRAINOVER);

		_uilayertree.SetParent(window.POS_ROOT,window.POS_MALL);
		_uilayertree.SetParent(window.POS_MALL,window.POS_GIFT_RECEIVE);
		_uilayertree.SetParent(window.POS_MALL,window.POS_GIFT);
		_uilayertree.SetParent(window.POS_MALL,window.POS_REQUEST);
		_uilayertree.SetParent(window.POS_ROOT,window.POS_REQUEST_MSG);
		_uilayertree.SetParent(window.POS_MALL,window.POS_BUYCAR);

		_uilayertree.SetParent(window.POS_ROOT,window.POS_ROOM);
		_uilayertree.SetParent(window.POS_ROOM,window.POS_ROOM_STORE);
		_uilayertree.SetParent(window.POS_ROOM,window.POS_ROOM_INVITE);
		_uilayertree.SetParent(window.POS_ROOM,window.POS_ROOM_ROOMSET);
		
		_uilayertree.SetParent(window.POS_ROOT,window.POS_GAME);
		_uilayertree.SetParent(window.POS_ROOT,window.POS_GAMEOVER);
	}

	void InThisPos(_pos)
	{
		return _uilayertree.InSameTree(_pos, _CURPOS);
	}
	void SetCurPos(curpos)
	{
		if (curpos < 0){return;}
		if (curpos > window.POS_NUMBER - 1){return;}

		printf("D# 位置改变:SetCurPos()从:"+_CURPOS+" 到:"+curpos);

		_CURPOS = curpos;
		window.find("HELPLAYER").delallchild(); //先放这
	}
	void GetCurPos()
	{
//		printf("D# 位置改变:GetCurPos()当前位置:"+_CURPOS);

		return _CURPOS;
	}

	//valuetype取值 0:int类型 1:字符串类型,2:bool类型
	void SetDBValue(dbidx, somevalue, valuetype)
	{
		window.g_row.InitByInt(window.GAMEUI, window.SELFDT, window.GAMEUI_SELFDT_ID, window.SELFVALUE);
		if (!window.g_row.IsReady()){printf("B# window.MYDATA.SetDBValue:ERR");return;}
		switch(valuetype)
		{
			case 0:
				window.g_row.SetInt(dbidx, somevalue);
				break;
			case 1:
				window.g_row.SetString(dbidx, somevalue);
				break;
			case 2:
				window.g_row.SetBOOL(dbidx, somevalue);
				break;
		}
	}
	
	void GetDBValue(dbidx)
	{
		window.g_row.InitByInt(window.GAMEUI, window.SELFDT, window.GAMEUI_SELFDT_ID, window.SELFVALUE);
		if (!window.g_row.IsReady()){printf("B# window.MYDATA.GetDBValue:ERR");return;}
		return window.g_row.GetData(dbidx);
	}
	//UserID
	void SetUID(somevalue){SetDBValue(window.GAMEUI_SELFDT_SELFID, somevalue, TYPE_INT);}
	void GetUID(){return GetDBValue(window.GAMEUI_SELFDT_SELFID);}
	//昵称-基本没用
	void SetNKName(somevalue){SetDBValue(window.GAMEUI_SELFDT_SELFNAME, somevalue, TYPE_STRING);}
	void GetNKName(){return GetDBValue(window.GAMEUI_SELFDT_SELFNAME);}
	//性别-基本没用
	void SetSex(somevalue){SetDBValue(window.GAMEUI_SELFDT_SELFSEX, somevalue, TYPE_INT);}
	void GetSex(){return GetDBValue(window.GAMEUI_SELFDT_SELFSEX);}
	//区域-基本没用
	void SetArea(somevalue){SetDBValue(window.GAMEUI_SELFDT_SAREA, somevalue, TYPE_STRING);}
	void GetArea(){return GetDBValue(window.GAMEUI_SELFDT_SAREA);}
	//频道
	void SetChannel(somevalue){SetDBValue(window.GAMEUI_SELFDT_SCHANNEL, somevalue, TYPE_STRING);}
	void GetChannel(){return GetDBValue(window.GAMEUI_SELFDT_SCHANNEL);}
	//房间ID
	void SetDeskID(somevalue){SetDBValue(window.GAMEUI_SELFDT_DESKID, somevalue, TYPE_INT);}
	void GetDeskID(){return GetDBValue(window.GAMEUI_SELFDT_DESKID);}
	//等级
	void SetCurLevel(somevalue){SetDBValue(window.GAMEUI_SELFDT_CURLEVEL, somevalue, TYPE_INT);}
	void GetCurLevel(){return GetDBValue(window.GAMEUI_SELFDT_CURLEVEL);}
	//身份
	void SetDegree(somevalue){SetDBValue(window.GAMEUI_SELFDT_DEGREE, somevalue, TYPE_INT);}
	void GetDegree(){return GetDBValue(window.GAMEUI_SELFDT_DEGREE);}
};

set window
{
	//[功能]得到当前的界面位置
	//[返回值]见Const.gml
	void GetUIPos(){return window.MYDATA.GetCurPos();}

	//[功能]设置当前的界面位置
	//[参数]_pos:见Const.gml
	void SetUIPos(_pos){window.MYDATA.SetCurPos(_pos);}

	//[功能]判断位置
	//[参数]_pos:见Const.gml
	void IsUIPos(_pos){return window.MYDATA.InThisPos(_pos);}
	
	//[功能]得到自己的房间ID
	//[返回值]自己的房间ID
	void GetMyRoomID(){return window.MYDATA.GetDeskID();}

	//所提供系列函数-在显示大厅界面的时候就可以调用了
	void InitMyData()
	{
		printf("B# InitMyData()");
		
		window.g_Row.InitByInt(window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_UID,window.GetMyUID());
		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-InitMyData:"+window.M_G_SERVER+",TBName:"+window.USERDT);
			return window.DB_ERR;
		}
		window.g_MyName = window.g_Row.GetData(window.M_G_SERVER_USERDT_NKNAME);//1字段
		window.g_MySex = window.g_Row.GetData(window.M_G_SERVER_USERDT_SEX);//2字段
		if (window.g_DEBUG)
		{
			if (window.g_MySex == 0)
			{
				printf("B# 小何：Userdt的性别不对了！"+window.g_MySex);
			}
		}
		window.g_MyRID = window.g_Row.GetData(window.M_G_SERVER_USERDT_RID);//3字段
		window.g_Row.Release();
		window.MYDATA.SetNKName(g_MyName);
		window.MYDATA.SetSex(g_MySex);

		window.find("friendsys").Login(window.GetMyUID(),window.g_MyName);
		window.find("friendsys").SetInGame(1);// SendTypeMessage("fr","ingame",1);//Login(g_MyUID,g_MyName);

		//登录到大厅了
		SetMyState(1);

		window.LMH1_InitMyData();//引导事件

		// add by hanshuo 4.11.2009  连接p2p服务器
		window.tennisGameStatic.JoinP2PServer( window.GetMyUID(), window.GAMESVP2PIP);
		
		//全局唯一监测自己数据
		window.g_MyUserDBRow.InitDB();
		
		//进入大厅后10ms后刷新商品时间。
		//chenjihui 
		window.timer(10,"Too_GetShopTime");

		//进入大厅后800ms后检测需要续费物品并放入续费车
		// add by chenjihui
		window.g_MyItemsCheck.timer(800,"StartCheckCharge");
		//物品到期提醒
//		window.g_MyItemsCheck.timer(window.g_MyItemTellBeginTime/8,"StartCheck");
		window.g_MyItemsCheck.timer(2000,"StartCheck");

		//设置动作的昵称
		window.find("VSenceBugle_Mgr_Logic_Name").SetNkName(window.GetMyName());//设置自己的昵称

		//获胜感言
		window.g_ArenaSlogan = "我就是传说中的高手！";

		window.SetUIGameState(window.USER_UISTATE_NOTINANY);//2009年12月24日
		
		//window.g_CArenaFunction.ClearPackTB();//清背包的数据 2010年4月21日 yxf
		//window.g_CArenaFunction.ClearMailTB();//清邮件的数据 2010年4月28日 yxf
	}
	
	void SetMyUID(uid){g_MyUID = uid;} //登录成功之后调用一次
	void GetMyUID(){return g_MyUID;}
	void GetMySex(){return g_MySex;}
	void GetMyName(){return g_MyName;}
	void GetMyRID(){return g_MyRID;}
	void GetMyGameMapID(){return g_GameMapID;}
	void SetMyGameMapID(gmapid){g_GameMapID = gmapid;}
	void GetMyRoomMapID(){return g_RoomMapID;}
	void SetMyRoomMapID(rmapid){g_RoomMapID = rmapid;}
	void GetMyState(){return g_MyState;}
	void SetMyState(state){g_MyState = state;}
	void GetMyQualify()
	{
		VNETLOG(1133,"GetMyQualify:g_Qualify:"+g_Qualify+"\n");
		return g_Qualify;
	}
	void SetMyQualify(qualify)
	{
		VNETLOG(1133,"SetMyQualify:qualify:"+qualify+"\n");
		g_Qualify = qualify;
	}
	void GetMySvID(){return g_SvID;}
	void SetMySvID(svid){g_SvID = svid;}

	//=============================================================================================

	//[功能]根据类型取得技术类型
	//[参数]type:类型 1网前力量型,2底线力量型 3网前技巧型 4底线技巧型
	void GetTechnicByType(type)
	{
		var _str = "";
		switch (type)
		{
			case 1:_str += "网前力量";break;
			case 2:_str += "底线力量";break;
			case 3:_str += "网前技巧";break;
			case 4:_str += "底线技巧";break;
		}
		if (_str == "")
		{
			_str = "- -";
		}
		return _str;
	}

	//根据称号ID取出称号内容
	//参数titleID：称号ID
	void GetQualifyByQID(titleID)
	{
		window.g_Row.InitByInt(window.TENNIS_GAME,window.QUALIFY,window.TENNIS_GAME_QUALIFY_ID,titleID);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetTitleByQID:DBname:"+window.TENNIS_GAME+",TBName:"+window.QUALIFY+",titleID:"+titleID);
			return window.DB_ERR;
		}

		var _Title = window.g_Row.GetData(window.TENNIS_GAME_QUALIFY_SHOWNAME);
		window.g_Row.Release();
		return _Title;
	}

	//[功能]通过moneytype取钱数值
	//[参数]moneytype:货币类型 1,金币;2,点券;3,Pk点
	//[返回值]该类型货币的值 错误值：-1(错误的类型)
	void GetValueByMoneyType(moneytype)
	{
		if (moneytype < 0)
		{
			return window.DB_ERR;
		}
		
		window.g_Row.InitByInt(window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_UID,window.GetMyUID());
		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetValueByMoneyType:DBname:"+window.M_G_SERVER+",TBName:"+window.USERDT+",uid:"+window.GetMyUID());
			return window.DB_ERR;
		}
		var _value = 0;
		switch (moneytype)
		{
		case 1:
			{
				_value = window.g_Row.GetData(window.M_G_SERVER_USERDT_TOTALMONEY);//金币
				break;
			}
		case 2:
			{
				//var _Money = window.g_Row.GetData(window.M_G_SERVER_USERDT_TOTALTICKET);//点券
				_value = window.g_Row.GetData(window.M_G_SERVER_USERDT_TOKENMONEY);//点券：临时措施-代金券
				break;
			}
		default:break;
		}
		window.g_Row.Release();
		return _value;
	}

	//[功能]取体力
	//[参数]roleid:角色ID 不传则取自己的ID
	void GetRoleStamina(roleid)
	{
		var _id = roleid;
		
		if (_id == 0)
		{
			_id = window.GetMyRID();
		}
		window.g_Row.InitByInt(window.M_G_SERVER,window.ROLEDT,window.M_G_SERVER_ROLEDT_RID,_id);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetRoleStamina:DBname:"+window.M_G_SERVER+",TBName:"+window.ROLEDT+",roleid:"+_id);
			return window.DB_ERR;
		}

		var _temp = window.g_Row.GetData(window.M_G_SERVER_ROLEDT_TSTAMINA);
		window.g_Row.Release();
		//alert("6# GetRoleStamina:"+_temp);
		return _temp;
	}

//根据UID取得玩家的RoleID
	//参数 uid:玩家的UserID 不传则取自己的
	//错误值：-1
	void GetRIDByUID(uid)
	{
		var _UserID = uid;
		if (toint(uid) == 0)
		{
			_UserID = window.GetMyUID();
		}
		
		window.g_Row.InitByInt(window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_UID,_UserID);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetRIDByUID:"+window.M_G_SERVER+",TBName:"+window.USERDT);
			return window.DB_ERR;
		}

		var _rid = window.g_Row.GetData(window.M_G_SERVER_USERDT_RID);//3字段
		window.g_Row.Release();
		return _rid;
	}

	//根据UID取得玩家的昵称
	//参数 uid:玩家的UserID 不传则取自己的
	//错误值：-1
	void GetNameByUID(uid)
	{
		var _UserID = uid;
		if (toint(uid) == 0)
		{
			_UserID = window.GetMyUID();
		}
		
		window.g_Row.InitByInt(window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_UID,_UserID);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetNameByUID:"+window.M_G_SERVER+",TBName:"+window.USERDT);
			return window.DB_ERR;
		}

		var _name = window.g_Row.GetData(window.M_G_SERVER_USERDT_NKNAME);//1字段
		window.g_Row.Release();
		return _name;
	}

	//根据UID取得玩家的状态
	//参数 uid:玩家的UserID 不传则取自己的
	//错误值：-1 当前游戏状态 0断线 1空闲中 2房间内 3游戏中
	void GetStateByUID(uid)
	{
		var _UserID = uid;
		if (toint(uid) == 0)
		{
			_UserID = window.GetMyUID();
		}
		
		window.g_Row.InitByInt(window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_UID,_UserID);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetStateByUID:"+window.M_G_SERVER+",TBName:"+window.USERDT);
			return window.DB_ERR;
		}

		var _state = window.g_Row.GetData(window.M_G_SERVER_USERDT_GAMESTA);//6字段
		window.g_Row.Release();
		return _state;
	}

	//根据Name取得玩家的RoleID
	//参数 _name:玩家的昵称 
	//错误值：-1
	void GetRIDByName(_name)
	{
		if (_name == 0 || _name == "")
		{
			return window.DB_ERR;
		}
		window.g_Row.InitByString(window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_NKNAME,_name);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetRIDByName:"+window.M_G_SERVER+",TBName:"+window.USERDT);
			return window.DB_ERR;
		}

		var _rid = window.g_Row.GetData(window.M_G_SERVER_USERDT_RID);//3字段
		window.g_Row.Release();
		return _rid;
	}

	//根据Name取得玩家的UID
	//参数 _name:玩家的昵称 
	//错误值：-1
	void GetUIDByName(_name)
	{
		if (_name == 0 || _name == "")
		{
			return window.DB_ERR;
		}
		window.g_Row.InitByString(window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_NKNAME,_name);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetUIDByName:"+window.M_G_SERVER+",TBName:"+window.USERDT);
			return window.DB_ERR;
		}

		var _uid = window.g_Row.GetData(window.M_G_SERVER_USERDT_UID);//0字段
		window.g_Row.Release();
		return _uid;
	}

	//根据Name取得玩家的Vip标志
	//参数 _name:玩家的昵称 
	//错误值：-1
	void GetVipByName(_name)
	{
		if (_name == 0 || _name == "")
		{
			return window.DB_ERR;
		}
		window.g_Row.InitByString(window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_NKNAME,_name);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetVipByName:"+window.M_G_SERVER+",TBName:"+window.USERDT);
			return window.DB_ERR;
		}

		var _vip = window.g_Row.GetData(window.M_G_SERVER_USERDT_VIPVALUE);
		window.g_Row.Release();
		return _vip;
	}

	//根据UID取得玩家等级
	//参数 uid:玩家的UserID 不传则取自己的
	//错误值：-1
	void GetLVByUID(uid)
	{
		var _UserID = uid;
		if (toint(uid) == 0)
		{
			_UserID = window.GetMyUID();
		}
		
		window.g_Row.InitByInt(window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_UID,_UserID);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetLVByUID:"+window.M_G_SERVER+",TBName:"+window.USERDT);
			return 0;
		}

		var _Lv = window.g_Row.GetData(window.M_G_SERVER_USERDT_CULEVEL);//67字段
		window.g_Row.Release();
		return _Lv;
	}

	//根据UID取得玩家性别
	//参数 uid:玩家的UserID 不传则取自己的
	//错误值：-1
	void GetSexByUID(uid)
	{
		var _UserID = uid;
		if (toint(uid) == 0)
		{
			_UserID = window.GetMyUID();
		}
		
		window.g_Row.InitByInt(window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_UID,_UserID);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetSexByUID:"+window.M_G_SERVER+",TBName:"+window.USERDT);
			return window.DB_ERR;
		}

		var _Sex = window.g_Row.GetData(window.M_G_SERVER_USERDT_SEX);//2字段
		window.g_Row.Release();
		return _Sex;
	}

	//根据UID取得玩家的队伍
	//参数 uid:玩家的UserID 不传则取自己的
	//错误值：-1
	void GetTeamByUID(uid)
	{
		var _UserID = uid;
		if (toint(uid) == 0)
		{
			_UserID = window.GetMyUID();
		}
		
		window.g_Row.InitByInt(window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_UID,_UserID);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetTeamByUID:"+window.M_G_SERVER+",TBName:"+window.USERDT);
			return window.DB_ERR;
		}

		var _Team = window.g_Row.GetData(window.M_G_SERVER_USERDT_TEAM);//11字段
		window.g_Row.Release();
		return _Team;
	}

	// add by hanshuo 12.17.2009
	//根据UID取得游戏内玩家的队伍, 与游戏规则相关的请使用这个
	//参数 uid:玩家的UserID 不传则取自己的
	//错误值：-1
	void GetGameTeamByUID(uid)
	{
		var _UserID = uid;
		if (toint(uid) == 0)
		{
			_UserID = window.GetMyUID();
		}
		
		window.g_Row.InitByInt(window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_UID,_UserID);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetTeamByUID:"+window.M_G_SERVER+",TBName:"+window.USERDT);
			return window.DB_ERR;
		}

		var _Team = window.g_Row.GetData(window.M_G_SERVER_USERDT_GAMESERVETEAM);//106字段
		window.g_Row.Release();
		return _Team;
	}

	//根据UID取得玩家的称号
	//参数 uid:玩家的UID 
	//错误值：-1
	void GetQualifyByUID(uid)
	{
		var _UserID = uid;
		if (toint(uid) == 0)
		{
			_UserID = window.GetMyUID();
		}
		window.g_Row.InitByInt(window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_UID,_UserID);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetQualifyByUID:"+window.M_G_SERVER+",TBName:"+window.USERDT+",uid:"+_UserID);
			return window.DB_ERR;
		}

		var _Qualify = window.g_Row.GetData(window.M_G_SERVER_USERDT_RECEIVEQUALIFY);//104字段
		window.g_Row.Release();
		return _Qualify;
	}

	//根据UID取得玩家的技术类型
	//参数 uid:玩家的UID 不传则取自己的
	//错误值：-1
	void GetRoleTypeByUID(uid)
	{
		var _UserID = uid;
		if (toint(uid) == 0)
		{
			_UserID = window.GetMyUID();
		}
		window.g_Row.InitByInt(window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_UID,_UserID);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetRoleTypeByUID:"+window.M_G_SERVER+",TBName:"+window.USERDT+",uid:"+_UserID);
			return window.DB_ERR;
		}

		var _roletype = window.g_Row.GetData(window.M_G_SERVER_USERDT_TROLETYPE);
		window.g_Row.Release();
		return _roletype;
	}

	//根据UID取得玩家的技术类型 的等级
	//参数 uid:玩家的UID 不传则取自己的
	//错误值：-1
	void GetRoleTypeLvByUID(uid,lv)
	{
		var _UserID = uid;
		if (toint(uid) == 0)
		{
			_UserID = window.GetMyUID();
		}
		var _lv = lv;
		if (_lv.__Long__ <= 0)
		{
			_lv = window.GetLVByUID(_UserID);
		}
		var _roletypelv = window.GetRoleTypeByUID(_UserID) * window.ROLE_TYPE_IDBASE + _lv;
		return _roletypelv;
	}

	//根据等级取升级所需的经验
	//参数：当前经验
	//错误值：-1
	void GetNeedExpByCurrLV(currlv)
	{
		window.g_Row.InitByInt(window.GAME,window.LEVELUP,window.GAME_LEVELUP_LEVELNUM,currlv);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetNeedExpByCurrLV:DBname:"+window.GAME+",TBName:"+window.LEVELUP);
			return window.DB_ERR;
		}

		var _exp = window.g_Row.GetData(window.GAME_LEVELUP_REQUIREEXP);
		window.g_Row.Release();
		return _exp;
	}

	//[功能]取角色的初始属性
	//{参数]_sex:性别
	//		_roleTypeLv:角色类型的等级
	//		_index:序号 0-6
	//[返回值]初始属性值
	void GetUserInitAttByLv(_sex,_roleTypeLv,_index)
	{
		printf("B# VModelMgr_Logic-GetUserInitAttByLv:_sex:"+_sex+",_roleTypeLv:"+_roleTypeLv+",_index:"+_index);
		VNETLOG(1132,"GetUserInitAttByLv()._sex:"+_sex+"\n");
		if (_sex == 0)
		{
			printf("B# 严重错误GetUserInitAttByLv()._sex:"+_sex);
			return 0;
		}
		var _DbName = "a00"+_sex+"user.mdb";

		window.g_Row.InitByInt(_DbName,window.UPLEVEL,window.UPLEVEL_LEVELID,_roleTypeLv);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetUserInitAttByLv:DBname:"+_DbName+",TBName:"+window.UPLEVEL+",_roleTypeLv:"+_roleTypeLv);
			return 0;
		}
		var _value = 0;
		switch (_index)
		{
		case 0:_value = window.g_Row.GetData(window.A001USER_UPLEVEL_TSTRENGTH);break;
		case 1:_value = window.g_Row.GetData(window.A001USER_UPLEVEL_TSKILL);break;
		case 2:_value = window.g_Row.GetData(window.A001USER_UPLEVEL_TFORCEHAND);break;
		case 3:_value = window.g_Row.GetData(window.A001USER_UPLEVEL_TBACKHAND);break;
		case 4:_value = window.g_Row.GetData(window.A001USER_UPLEVEL_TSERVEFULL);break;
		case 5:_value = window.g_Row.GetData(window.A001USER_UPLEVEL_TMAXENERGY);break;
		case 6:_value = window.g_Row.GetData(window.A001USER_UPLEVEL_TSTAMINA);break;
		}
		window.g_Row.Release();
		return _value;
	}

	//[功能]取角色的装备后属性
	//{参数]_rid:不传则为自己的RID
	//		_index:序号 0-6
	//[返回值]装备后属性
	void GetUserEquipAttByRID(_rid,_index)
	{
		//printf("B# VModelMgr_Logic-GetUserEquipAttByRID:_rid:"+_rid+",_index:"+_index);
		
		var _RoleID = _rid;
		if (toint(_RoleID) == 0)
		{
			_RoleID = window.GetMyRID();
		}
		window.g_Row.InitByInt(window.M_G_SERVER,window.ROLEDT,window.M_G_SERVER_ROLEDT_RID,_RoleID);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetUserEquipAttByUID:"+window.M_G_SERVER+",TBName:"+window.ROLEDT+",_RoleID:"+_RoleID);
			return 0;
		}

		var _value = 0;
		switch (_index)
		{
		case 0:_value = window.g_Row.GetData(window.M_G_SERVER_ROLEDT_TSTRENGTH);break;
		case 1:_value = window.g_Row.GetData(window.M_G_SERVER_ROLEDT_TSKILL);break;
		case 2:_value = window.g_Row.GetData(window.M_G_SERVER_ROLEDT_TFORCEHAND);break;
		case 3:_value = window.g_Row.GetData(window.M_G_SERVER_ROLEDT_TBACKHAND);break;
		case 4:_value = window.g_Row.GetData(window.M_G_SERVER_ROLEDT_TSERVEFULL);break;
		case 5:_value = window.g_Row.GetData(window.M_G_SERVER_ROLEDT_TENERGY);break;
		case 6:_value = window.g_Row.GetData(window.M_G_SERVER_ROLEDT_TSTAMINA);break;
		}
		window.g_Row.Release();
		return _value;
	}

	//[功能]取角色的装备后属性-发球
	//{参数]_rid:不传则为自己的RID
	//[返回值]装备后属性
	void GetUserServeAttByRID(_rid)
	{
		return window.GetUserEquipAttByRID(_rid,window.ATL_SERVE);
	}

	//[功能]根据UID取得玩家的Vip类型
	//[参数] uid:玩家的UID 不传则取自己的
	//[返回值]0不是Vip >=1是Vip 错误值：-1
	void GetVipTypeByUID(uid)
	{
		var _UserID = uid;
		if (toint(uid) == 0)
		{
			_UserID = window.GetMyUID();
		}
		window.g_Row.InitByInt(window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_UID,_UserID);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetVipTypeByUID:"+window.M_G_SERVER+",TBName:"+window.USERDT+",uid:"+_UserID);
			return window.DB_ERR;
		}

		var _viptype = window.g_Row.GetData(window.M_G_SERVER_USERDT_VIPVALUE);
		window.g_Row.Release();
		return _viptype;
	}


	//[功能]根据nkname取得玩家的UID{先查本服，再查好友的}
	//[参数] nkname:昵称
	//[返回值]错误值：<0(没找到);正确：玩家JID 
	void GetUIDByName_KF(nkname)
	{
//		var _JID = window.GetUIDByName(nkname);
//		if (toint(_JID) > 0)
//		{
//			return _JID;
//		}

		window.g_Row.InitByString(window.M_G_SERVER,window.FRIENDDT,window.M_G_SERVER_FRIENDDT_NKNAME,nkname);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetUIDByName_KF:"+window.M_G_SERVER+",TBName:"+window.FRIENDDT+",nkname:"+nkname);
			return window.DB_ERR;
		}

		var _JID = window.g_Row.GetData(window.M_G_SERVER_FRIENDDT_JID);
		window.g_Row.Release();
		return _JID;
	}

	//[功能]根据nkname取得玩家的Sex{先查本服，再查好友的}
	//[参数] nkname:昵称
	//[返回值]错误值：0(没找到);正确：玩家Sex
	void GetSexByName_KF(nkname)
	{
		var _Sex = 0;
//		if (nkname == "" || nkname == 0)
//		{
//			return _Sex;
//		}
		
//		window.g_Row.InitByString(window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_NKNAME,nkname);
//
//		if (window.g_Row.IsReady())
//		{
//			_Sex = window.g_Row.GetData(window.M_G_SERVER_USERDT_SEX);
//		}
//
//		window.g_Row.Release();
//		if (toint(_Sex) > 0)
//		{
//			return _Sex;
//		}

		window.g_Row.InitByString(window.M_G_SERVER,window.FRIENDDT,window.M_G_SERVER_FRIENDDT_NKNAME,nkname);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetSexByName_KF:"+window.M_G_SERVER+",TBName:"+window.FRIENDDT+",nkname:"+nkname);
			return _Sex;
		}

		_Sex = window.g_Row.GetData(window.M_G_SERVER_FRIENDDT_SEX);
		window.g_Row.Release();
		return _Sex;
	}

	//[功能]根据UID取得玩家的比赛总场次
	//[参数]uid:玩家的UID(不传取自己的) 
	//[返回值]参数错误或查无此人-1;否则为比赛总场次
	void GetRaceAllNumByUID(uid)
	{
		var _UserID = uid;
		if (toint(uid) == 0)
		{
			_UserID = window.GetMyUID();
		}
		window.g_Row.InitByInt(window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_UID,_UserID);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetRaceAllNumByUID:"+window.M_G_SERVER+",TBName:"+window.USERDT+",uid:"+_UserID);
			return window.DB_ERR;
		}

		var _allnum = window.g_Row.GetData(window.M_G_SERVER_USERDT_TS_RACEALLNUM);
		window.g_Row.Release();
		return _allnum;
	}

	//[功能]根据UID取得玩家的胜利场次
	//[参数]uid:玩家的UID(不传取自己的) 
	//[返回值]参数错误或查无此人-1;否则为胜利场次
	void GetRaceWinNumByUID(uid)
	{
		var _UserID = uid;
		if (toint(uid) == 0)
		{
			_UserID = window.GetMyUID();
		}
		window.g_Row.InitByInt(window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_UID,_UserID);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetRaceWinNumByUID:"+window.M_G_SERVER+",TBName:"+window.USERDT+",uid:"+_UserID);
			return window.DB_ERR;
		}

		var _winnum = window.g_Row.GetData(window.M_G_SERVER_USERDT_TS_RACEWINNUM);
		window.g_Row.Release();
		return _winnum;
	}

	//[功能]看看自己是否可以收到相关消息(邀请，临时组队)
	//[参数]nkname:对方的昵称
	//[返回值]0(合适) 1(黑名单) 2(状态不在空闲) 3(界面不合适) 4(设置了拒绝)
	void JudgeMyState(nkname)
	{
		//是否在强制训练中
		if (window.GetForceGuideState() == 1)
		{
			return window.JUDGE_MYSTATE_UIPOS;
			return;
		}

		//判断是否设置了不接受邀请
		if (!window.GetGameSetUpOtherByIndex(window.OTHER_INVITE))
		{
			printf("B# JudgeMyState:设置了不接受邀请");
			return window.JUDGE_MYSTATE_SETONINVITE;
		}

		//[步骤1]判断是否为黑名单 ：1好友,2黑名单,5陌生人
		var _relation = window.find("friendsys").CheckRelation(nkname);
		printf("B# JudgeMyState:_relation:"+_relation+",nkname:"+nkname);
		if (toint(_relation) == window.FRIEND_BLACKLIST)
		{
			return window.JUDGE_MYSTATE_BACKLIST;
		}
		
		//[步骤2]判断是否为空闲状态 ：0断线 1空闲 2房间 3游戏 4登录
		var _state = window.GetStateByUID();
		printf("B# JudgeMyState:_state:"+_state);
		if (toint(_state) != window.USER_GAMESTATE_FREE)
		{
			return window.JUDGE_MYSTATE_STATE;
		}
		
		//[步骤2]在合适的界面才能收到消息(屏蔽，训练中，结算)
		var _pos = window.GetUIPos();
		printf("B# JudgeMyState:Pos:"+_pos);
		if (_pos == window.POS_TRAINING || _pos == window.POS_GAMEOVER || _pos == window.POS_TRAINOVER || _pos == window.POS_VIDEOING)
		{
			return window.JUDGE_MYSTATE_UIPOS;
		}

		return window.JUDGE_MYSTATE_DEFAULT;
	}
	
	//[功能]取得自己的界面游戏状态
	//[返回值]0 ~ 5 详见 Const.gml
	void GetUIGameState()
	{
		return window.g_UIGameState;
	}

	//[功能]设置自己的界面游戏状态
	//[参数]state:0 ~ 5 详见 Const.gml
	void SetUIGameState(state)
	{
		window.g_UIGameState = state;
	}
	//[功能]判断玩家是否为自己的好友
	//[参数]_username:玩家名字
	//[返回值]true：是好友；false：不是好友
	void GetIsFriendState(_username)
	{
		if(window.find("friendsys").CheckRelation(_username) == window.FRIEND_FRIEND)
		{
			return true;
		}
		return false;
	}

	//[功能]根据JId取好友在线与否
	//[参数] nkname:昵称
	//[返回值]true false
	void GetFriStateByJID(nkname)
	{
		window.g_Row.InitByString(window.M_G_SERVER,window.FRIENDDT,window.M_G_SERVER_FRIENDDT_NKNAME,nkname);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetFriStateByJID:"+window.M_G_SERVER+",TBName:"+window.FRIENDDT+",nkname:"+nkname);
			return false;
		}

		var _state = window.g_Row.GetData(window.M_G_SERVER_FRIENDDT_GAMESTATE);
		window.g_Row.Release();
		return _state;
	}

	//[功能]获取玩家拥有的折扣
	void GetAgio()
	{
		var _VNet2DBTable = new VNet2DBTable
		{
			var _itemAgio = 100;
			void GetPlayerAgio(_cid,_equipState)
			{
				if(_equipState == 1)
				{
					var _type = window.GetItemAgioType(_cid);
					if(_type == 2)
					{
						_itemAgio = window.GetItemAgio(_cid);
					}
				}
				//printf("xiayy:_cid:"+_cid+",_equipState:"+_equipState+",_itemAgio:"+_itemAgio);
			}
		}
		var _SQL = "SELECT * FROM "+window.PLAYERITEMS+" WHERE "+window.M_G_GOODS_PLAYERITEMS_PACKID_STR +"=509 AND "+window.M_G_GOODS_PLAYERITEMS_STATE_STR+">0";
		_VNet2DBTable.Select(window.M_G_GOODS,_SQL);
		var _count = _VNet2DBTable.GetSize();
		var _agio = 100;
		if(_count != 0)
		{
			_VNet2DBTable.ReadData("GetPlayerAgio",""+window.M_G_GOODS_PLAYERITEMS_CID+","+window.M_G_GOODS_PLAYERITEMS_EQUIPPOS);
			_agio = _VNet2DBTable._itemAgio;
		}
		_VNet2DBTable.del();
		return _agio;
	}

	//[功能]获取玩家装备的幸运卡折扣
	//[参数]无
	//[返回值]0为没有装备幸运卡，大于0表示幸运卡折扣
	void GetLuckyCardAgio()
	{
		var _VNet2DBTable = new VNet2DBTable
		{
			var _itemAgio = 0;
			void GetPlayerAgio(_cid,_equipState)
			{
				if(_equipState == 1)
				{
					var _type = window.GetItemAgioType(_cid);
					if(_type == 1)
					{
						_itemAgio = window.GetItemAgio(_cid);
					}
				}
				//printf("xiayy:GetLuckyCardAgio:_cid:"+_cid+",_equipState:"+_equipState+",_itemAgio:"+_itemAgio);
			}
		}
		var _SQL = "SELECT * FROM "+window.PLAYERITEMS+" WHERE "+window.M_G_GOODS_PLAYERITEMS_PACKID_STR +"=509 AND "+window.M_G_GOODS_PLAYERITEMS_STATE_STR+"=1";
		_VNet2DBTable.Select(window.M_G_GOODS,_SQL);
		var _count = _VNet2DBTable.GetSize();
		var _agio = 0;
		if(_count != 0)
		{
			_VNet2DBTable.ReadData("GetPlayerAgio",""+window.M_G_GOODS_PLAYERITEMS_CID+","+window.M_G_GOODS_PLAYERITEMS_EQUIPPOS);
			_agio = _VNet2DBTable._itemAgio;
		}
		_VNet2DBTable.del();
		return _agio;
	}

	//[功能]根据UID取得玩家的当前经验
	//[参数]uid:玩家的UID(不传取自己的) 
	//[返回值]参数错误或查无此人-1;否则为当前经验
	void GetCurExpByUID(uid)
	{
		var _UserID = uid;
		if (toint(uid) == 0)
		{
			_UserID = window.GetMyUID();
		}
		window.g_Row.InitByInt(window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_UID,_UserID);

		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-GetCurExpByUID:"+window.M_G_SERVER+",TBName:"+window.USERDT+",uid:"+_UserID);
			return window.DB_ERR;
		}

		var _curexp = window.g_Row.GetData(window.M_G_SERVER_USERDT_CUEXP);
		window.g_Row.Release();
		return _curexp;
	}

	//[功能]获得自己的Avatar信息
	//[返回值]"381,416,432,459,462,483,515,526,559,580,605,630,647"
	void GetMyAvatar()
	{
		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByInt(window.M_G_SERVER,window.ROLEDT,window.M_G_SERVER_ROLEDT_RID,window.GetMyRID());
		if (!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			printf("B# error-GetMyAvatar()ROLEDT表里查找rid失败rid="+window.GetMyRID()+"\n");
			return;
		}
		var _str = ""+_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID0);	//部件
		_str = _str+","+_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID1);
		_str = _str+","+_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID2);
		_str = _str+","+_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID3);
		_str = _str+","+_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID4);
		_str = _str+","+_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID5);
		_str = _str+","+_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID6);
		_str = _str+","+_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID7);
		_str = _str+","+_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID8);
		_str = _str+","+_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID9);
		_str = _str+","+_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID10);
		_str = _str+","+_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID11);
		_str = _str+","+_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID12);
		_str = _str+","+_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID13);
		_VNet2DBRow.del();
		return _str;
	}

	//[功能]获得Avatar信息ByUID
	//[返回值]"381,416,432,459,462,483,515,526,559,580,605,630,647" 没有找到或者没有UID返回-1
	void GetSelfAvatarByUID(UID)
	{
		var userid = UID;
		if ( userid == 0 || userid == "")
		{
			return -1;
		}
		var _VNet2DBRow = new VNet2DBRow{};
		_VNet2DBRow.InitByInt(window.M_G_SERVER,window.ROLEDT,window.M_G_SERVER_ROLEDT_UID,userid);
		if (!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			printf("B# error-GetSelfAvatarByUID()ROLEDT表里查找rid失败rid="+userid+"\n");
			return -1;
		}
		var _str = ""+_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID0);	//部件
		_str = _str+","+_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID1);
		_str = _str+","+_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID2);
		_str = _str+","+_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID3);
		_str = _str+","+_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID4);
		_str = _str+","+_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID5);
		_str = _str+","+_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID6);
		_str = _str+","+_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID7);
		_str = _str+","+_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID8);
		_str = _str+","+_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID9);
		_str = _str+","+_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID10);
		_str = _str+","+_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID11);
		_str = _str+","+_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID12);
		_str = _str+","+_VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_AWTORID13);
		_VNet2DBRow.del();
		return _str;
	}

	void GetSelfSexByUID(UID)
	{
		var userid = UID;
		if ( userid == 0 || userid == "")
		{
			return -1;
		}
		var _VNet2DBRow = new VNet2DBRow{};
		_VNet2DBRow.InitByInt(window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_UID,userid);
		if (!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			printf("B# error-GetSelfSexByUID()ROLEDT表里查找rid失败rid="+userid+"\n");
			return -1;
		}
		var selfsex = _VNet2DBRow.GetData(window.M_G_SERVER_USERDT_SEX);
		_VNet2DBRow.del();
		return selfsex;
		
	}

	//[功能]通过UID取玩家称号的对应频道名
	//[参数]uid:玩家的UID 不传则为自己的
	//[返回值]错误值：-1
	void GetQualifyShowNameByUID(uid)
	{
		var _UserID = uid;
		if (toint(uid) == 0)
		{
			_UserID = window.GetMyUID();
		}
		var _q = window.GetQualifyByUID(_UserID);
		var _name = window.GetChannelType(_q);
		return _name;
	}

	//[功能]通过昵称取玩家称号的对应频道名
	//[参数]_name:玩家的昵称 不传则为自己的
	//[返回值]错误值：-1
	void GetQualifyShowNameByNkNAme(_name)
	{
		var _NkName = _name;
		if (tostring(_name) == "" || tostring(_name) == "0")
		{
			_NkName = window.GetMyName();
		}
		return GetQualifyShowNameByUID(window.GetUIDByName(_NkName));
	}
}