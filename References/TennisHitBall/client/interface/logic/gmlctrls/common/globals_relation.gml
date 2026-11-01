//关系系统全局函数
//yxf 2010年9月23日

set window
{
	/*	说明
		关系设置表中，ID = 关系类型*关系等级计算基数 + 关系档次*关系档次次计算基数 + 实际等级
	*/

	//关系类型
	var RELATION_PARTNER	= 1;	//搭档
	var RELATION_BUDDY		= 2;	//密友
	var RELATION_LOVER		= 3;	//情侣
	var RELATION_UNMARRY	= 14;	//离婚

	var RELATION_LV_BASE	= 1000;	//关系等级计算基数
	var User1LoverExp		=0;		//在比赛开始时记录玩家情侣额外经验加成
	var User2LoverExp		=0;
	var User3LoverExp		=0;
	var User4LoverExp		=0;
	
	//关系档次
	var RELATION_BADDISH_0	 = 1;	//默认（目前搭档，密友密友档次之分）
	var RELATION_BADDISH_1	 = 1;	//白银
	var RELATION_BADDISH_2	 = 2;	//黄金
	var RELATION_BADDISH_3	 = 3;	//钻石
	
	var RELATION_BADDISH_BASE	= 100;	//关系档次次计算基数

	var RELATION_BUDDY_CANUPLV	= 2999;	//密友可升级为情侣的关系设置ID
	
	var g_BuddyToLover_Value = 0;		//密友到情侣的条件
	
	//对关系的操作类型 1:邀请成为搭档 2:邀请成为当前搭档 3:邀请成为密友 4:邀请成为情侣 5:使用金币的取消情侣
	var RELATION_OPT_PARTNER		= 1;	//1:邀请成为搭档
	var RELATION_OPT_CURR_PARTNER	= 2;	//2:邀请成为当前搭档
	var RELATION_OPT_BUDDY			= 3;	//3:邀请成为密友
	var RELATION_OPT_LOVER			= 4;	//4:邀请成为情侣
	var RELATION_OPT_DELLOVER		= 5;	//5:使用金币的取消情侣
	
	//[功能]根据ID去频道的名字
	//[参数]id:服务器ID
	void GetSvNameById(id)
	{
		var _name = "";
		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByInt(window.GAMEUI,window.GAMESERVER,window.GAMEUI_GAMESERVER_SVRID,id);
		if(_VNet2DBRow.IsReady()){_name = _VNet2DBRow.GetData(window.GAMEUI_GAMESERVER_SVRNAME);}
		_VNet2DBRow.del();
		return _name;
	}

	//[功能]根据关系类型计算出关系设置ID
	//[参数]type:关系类型
	//		value:当前的值
	//		baddish:关系档次
	//[返回值]关系设置ID
	void GetRelationSetIDByType(type,value,baddish)
	{
		var _VNet2DBTable=new VNet2DBTable
		{
			var _relationsetid = -1;
			var _currvalue = -1;
			var _geted = false;	//是否得到
			void GetMyData(id,max)
			{	
				if (_geted) return;

				if (_currvalue <= max)
				{
					_geted = true;
					_relationsetid = id;
				}
			}
		};
		_VNet2DBTable._currvalue = value.__Long__;
		if(type == RELATION_PARTNER)
			baddish = 0;
		var _SQL = "SELECT * FROM "+window.RELATIONSET+" WHERE "+window.GAMEUI_RELATIONSET_RELATION_STR+"="+type+" AND "+window.GAMEUI_RELATIONSET_BADDISH_STR+"="+baddish;
		_VNet2DBTable.Select( window.GAMEUI,_SQL );
		_VNet2DBTable.ReadData("GetMyData",""+window.GAMEUI_RELATIONSET_ID+","+window.GAMEUI_RELATIONSET_MAXVALUE );
		var _id = _VNet2DBTable._relationsetid;
		_VNet2DBTable.del();
		return _id;
	}

	//[功能]根据关系类型计算出关系设置ID(搭档)
	//[参数]value:当前的值
	//[返回值]关系设置ID
	void GetSetIDByType_Partner(value)
	{
		return GetRelationSetIDByType(window.RELATION_PARTNER,value,window.RELATION_BADDISH_0);
	}

	//[功能]根据关系类型计算出关系设置ID(密友)
	//[参数]value:当前的值
	//[返回值]关系设置ID
	void GetSetIDByType_Buddy(value)
	{
		baddish = window.RELATION_BADDISH_0;
		return GetRelationSetIDByType(window.RELATION_BUDDY,value,window.RELATION_BADDISH_0);
	}

	//[功能]根据关系类型计算出关系设置ID(情侣)
	//[参数]value:当前的值
	//		baddish:关系档次
	//[返回值]关系设置ID
	void GetSetIDByType_Lover(value,baddish)
	{
		return GetRelationSetIDByType(window.RELATION_LOVER,value,baddish);
	}

	//[功能]根据关系类型计算出关系等级
	//[参数]type:关系类型
	//		value:当前的值
	//		baddish:关系档次
	//[返回值]关系等级
	void GetRelationLvByType(type,value,baddish)
	{
		var _setid = window.GetRelationSetIDByType(type,value,baddish);
		_setid = _setid.__Long__;
		if (_setid <= 0) return 0;
		return ( _setid % (window.RELATION_LV_BASE*type) ) % (window.RELATION_BADDISH_BASE*baddish);
	}

	//[功能]根据关系类型计算出关系等级(搭档)
	//[参数]value:当前的值
	//[返回值]关系等级
	void GetRelationLvByType_Partner(value)
	{
		return GetRelationLvByType(window.RELATION_PARTNER,value,window.RELATION_BADDISH_0);
	}

	//[功能]根据关系类型计算出关系等级(密友)
	//[参数]value:当前的值
	//[返回值]关系等级
	void GetRelationLvByType_Buddy(value)
	{
		return GetRelationLvByType(window.RELATION_BUDDY,value,window.RELATION_BADDISH_0);
	}

	//[功能]根据关系类型计算出关系等级(情侣)
	//[参数]value:当前的值
	//		baddish:关系档次
	//[返回值]关系等级
	void GetRelationLvByType_Lover(value,baddish)
	{
		return GetRelationLvByType(window.RELATION_LOVER,value,baddish);
	}
	
	//[功能]根据关系ID计算出关系等级
	//[参数]RelatioID:关系ID
	//		type:关系类型
	//		baddish:关系档次
	//[返回值]关系等级
	void GetLvByRelationID(RelatioID,type,baddish)
	{
		var _setid = RelatioID.__Long__;
		if (_setid <= 0) return 0;
		return ( _setid % (window.RELATION_LV_BASE*type) ) % (window.RELATION_BADDISH_BASE*baddish);
	}

	//[功能]根据关系ID计算出关系等级(搭档)
	//[参数]RelatioID:关系ID
	//[返回值]关系等级
	void GetLvByRelationID_Partner(RelatioID)
	{
		return GetLvByRelationID(RelatioID,window.RELATION_PARTNER,window.RELATION_BADDISH_0);
	}

	//[功能]根据关系ID计算出关系等级(密友)
	//[参数]RelatioID:关系ID
	//[返回值]关系等级
	void GetLvByRelationID_Buddy(RelatioID)
	{
		return GetLvByRelationID(RelatioID,window.RELATION_BUDDY,window.RELATION_BADDISH_0);
	}

	//[功能]根据关系ID计算出关系等级(情侣)
	//[参数]RelatioID:关系ID
	//		baddish:关系档次
	//[返回值]关系等级
	void GetLvByRelationID_Lover(RelatioID,baddish)
	{
		return GetLvByRelationID(RelatioID,window.RELATION_LOVER,baddish);
	}

	//[功能]根据关系设置ID取升级最大值
	//[参数]setid:关系设置ID
	//[返回值]最大值
	void GetRelationMaxValueByID(setid)
	{
		var _max = 0;
		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByInt(window.GAMEUI,window.RELATIONSET,window.GAMEUI_RELATIONSET_ID,setid);
		if(!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			printf("B# error-GetRelationMaxValueByID:DBname:"+window.GAMEUI+",TBName:"+window.RELATIONSET+",setid:"+setid);
			return 0;
		}
		_max = _VNet2DBRow.GetData(window.GAMEUI_RELATIONSET_MAXVALUE);
		_VNet2DBRow.del();
		return _max;
	}
	
//	window.g_BuddyToLover_Value = window.GetRelationMaxValueByID(window.RELATION_BUDDY_CANUPLV);	//给变量赋值了 写法有点诡异 见谅

	//[功能]根据关系设置ID取徽章图片名
	//[参数]setid:关系设置ID
	//[返回值]最大值
	void GetRelationBadgeSrcByID(setid)
	{
		var _res = 0;
		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByInt(window.GAMEUI,window.RELATIONSET,window.GAMEUI_RELATIONSET_ID,setid);
		if(!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			printf("B# error-GetRelationBadgeSrcByID:DBname:"+window.GAMEUI+",TBName:"+window.RELATIONSET+",setid:"+setid);
			return 0;
		}
		_res = _VNet2DBRow.GetData(window.GAMEUI_RELATIONSET_BADGESRC);
		_VNet2DBRow.del();
		return _res;
	}

	//[功能]取当前的情侣的唯一ID
	//[返回值]当前情侣的Key，为0代表没有情侣
	void GetCurrLoverKeyID(_UserID)
	{
		var _VNet2DBTable=new VNet2DBTable
		{
			var m_UID = _UserID;
			if (m_UID == "" || m_UID == 0)
			{
				m_UID = window.GetMyUID();
			}
			var _key = 0;
			void GetMyData(key,_BigID,_SamllID)
			{
				if (_BigID == m_UID || _SamllID == m_UID)
					_key = key;
			}
		};
		var _SQL = "SELECT * FROM "+window.RELATION+" WHERE "+window.M_G_SERVER_RELATION_WCOUPLE_STR+"=1";
		_VNet2DBTable.Select( window.M_G_SERVER,_SQL );
		_VNet2DBTable.ReadData("GetMyData",""+window.M_G_SERVER_RELATION_KEY+","+window.M_G_SERVER_RELATION_BID+","+window.M_G_SERVER_RELATION_SID);
		var _KeyID = _VNet2DBTable._key;
		_VNet2DBTable.del();
		return _KeyID;
	}

	//[功能]获得当前情侣的亲密度
	//[返回值]返回亲密度值
	void GerCurLovePointByUID(_UID)
	{
		var _VNet2DBTable=new VNet2DBTable
		{
			var m_UID = _UID;
			var _LovePoint = 0;
			void GetMyData(wloves,_BigID,_SamllID)
			{
				if (_BigID == m_UID || _SamllID == m_UID)
					_LovePoint = wloves;
			}
		};
		var _SQL = "SELECT * FROM "+window.RELATION+" WHERE "+window.M_G_SERVER_RELATION_WCOUPLE_STR+"=1";
		_VNet2DBTable.Select( window.M_G_SERVER,_SQL );
		_VNet2DBTable.ReadData("GetMyData",""+window.M_G_SERVER_RELATION_WLOVES+","+window.M_G_SERVER_RELATION_BID+","+window.M_G_SERVER_RELATION_SID);
		var LovePoint = _VNet2DBTable._LovePoint;
		_VNet2DBTable.del();
		return LovePoint;
	}

	//[功能]根据情侣亲密度计算出获得经验的加成 情侣等级 等级名称
	//[返回值]加成经验的百分比 查询失败返回-1
	void GetLoverExtraExp(_UserID,_returnType)
	{
		var _UID = toint(_UserID);
//		alert("_UID ="+_UID+",,,"+window.GetMyUID() );
		if (_UID == "" || _UID == 0)
		{
			_UID = window.GetMyUID();
		}
		var _LovePoint = window.GerCurLovePointByUID(_UID);
		var _LV= 0;
		if (_LovePoint < 0)
			return -1;

		var _VNet2DBTable=new VNet2DBTable
		{
			var _LoverNum = "";
			void GetData(_NUM)
			{
				if (_LoverNum == "")
					_LoverNum =""+_NUM;
				else
					_LoverNum = _LoverNum+","+_NUM;
			}
		};
		var sql = "SELECT * FROM "+window.LOVERENCOURAGE;
		_VNet2DBTable.Select( window.GAME,sql);
		_VNet2DBTable.ReadData("GetData",""+window.GAME_LOVERENCOURAGE_NUM);
		var DBLoverPoint = _VNet2DBTable._LoverNum;
		_VNet2DBTable.del();
		var _numDBL = window.GetSplitCount(DBLoverPoint, ",");
		var _array = window.SplitStr2( DBLoverPoint, ",", _numDBL);

//		printf("wwwGetLoverExtraExp_array[0]="+_array[0]+",_array[1]="+_array[1]+",_array[2]="+_array[2]+",_array[2]="+_array[3]+",_array[4]="+
//			_array[4]+",_array[5]="+_array[5]+",_array[6]="+_array[6]);
		if (toint(_LovePoint) >= toint(_array[0]) && toint(_LovePoint) < toint(_array[1]))
			_LV = 1;
		if (toint(_LovePoint) >= toint(_array[1]) && toint(_LovePoint) < toint(_array[2]))
			_LV = 2;
		if (toint(_LovePoint) >= toint(_array[2]) && toint(_LovePoint) < toint(_array[3]))
			_LV = 3;
		if (toint(_LovePoint) >= toint(_array[3]) && toint(_LovePoint) < toint(_array[4]))
			_LV = 4;
		if (toint(_LovePoint) >= toint(_array[4]) && toint(_LovePoint) < toint(_array[5]))
			_LV = 5;
		if (toint(_LovePoint) >= toint(_array[5]) && toint(_LovePoint) < toint(_array[6]))
			_LV = 6;
		if (toint(_LovePoint) >= toint(_array[6]) )
			_LV = 7;

		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByBigInt(window.GAME,window.LOVERENCOURAGE,window.GAME_LOVERENCOURAGE_LV,_LV);
		if (!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			printf("B# error-GetLoverExtraExp:DBname:"+window.GAME+",TBName:"+window.LOVERENCOURAGE+",_LV:"+_LV);
			return -1;
		}
		var _expadd = _VNet2DBRow.GetData(window.GAME_LOVERENCOURAGE_EXPADD);
		var _showname = _VNet2DBRow.GetData(window.GAME_LOVERENCOURAGE_SHOWNAME);
		_VNet2DBRow.del();
		if (tostring(_returnType) == "lv")
			return _LV;
		if (tostring(_returnType) == "showname")
			return _showname;
		if (tostring(_returnType) == "expadd" || toint(_returnType) == 0)
			return _expadd;

	}
	//[功能]取当前的情侣的UID
	//[返回值]当前情侣的UID，为0代表没有情侣
	void GetCurrLoverUID(_UserID)
	{
		var _UID = toint(_UserID);
		if (_UID == "" || _UID == 0)
		{
			_UID = window.GetMyUID();
		}
		var _keyid = window.GetCurrLoverKeyID(_UserID);
		if (_keyid < 0)
			return 0;
		
		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByBigInt(window.M_G_SERVER,window.RELATION,window.M_G_SERVER_RELATION_KEY,_keyid);
		if(!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			printf("B# error-GetCurrLoverUID:DBname:"+window.M_G_SERVER+",TBName:"+window.RELATION+",_keyid:"+_keyid);
			return 0;
		}
		var _ResUID = 0;
		var _BUID =_VNet2DBRow.GetData(window.M_G_SERVER_RELATION_BID);			//大的UID
		var _SUID =_VNet2DBRow.GetData(window.M_G_SERVER_RELATION_SID);			//小的UID
		_VNet2DBRow.del();
		if(_BUID.__Long__ == _UID) //大ID是自己
		{
			//则情侣它是小ID
			_ResUID = _SUID.__Long__;
		}
		else
		{
			_ResUID = _BUID.__Long__;
		}
		return _ResUID;
	}

	//[功能]取当前的情侣的昵称
	//[返回值]当前情侣的UID，为""代表没有情侣
	void GetCurrLoverNkName(_UserID)
	{
		var _UID = _UserID;
		if (_UID == "" || _UID == 0)
		{
			_UID = window.GetMyUID();
		}
		var _keyid = window.GetCurrLoverKeyID(_UserID);
		if (_keyid < 0)
			return "";
		
		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByBigInt(window.M_G_SERVER,window.RELATION,window.M_G_SERVER_RELATION_KEY,_keyid);
		if(!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			printf("B# error-GetCurrLoverNkName:DBname:"+window.M_G_SERVER+",TBName:"+window.RELATION+",_keyid:"+_keyid);
			return "";
		}
		var _ResName = 0;
		var _BID =_VNet2DBRow.GetData(window.M_G_SERVER_RELATION_BID);
		if (_BID == _UID)
		{
			_ResName =_VNet2DBRow.GetData(window.M_G_SERVER_RELATION_SNKNAME);
		}
		else
			_ResName =_VNet2DBRow.GetData(window.M_G_SERVER_RELATION_NKNAME);		//昵称	
		
			
		_VNet2DBRow.del();
//		alert("GetCurrLoverNkName _ResName="+_ResName+",,,"+window.GetMyUID());
		return _ResName;
	}

	//[功能]根据UID判断某人与自己是否为密友
	//[参数]_UID:被判断者的UID
	//[返回值]true是 false不是
	void GetRelationByUID_Buddy(_UID)
	{
		var _VNet2DBTable=new VNet2DBTable
		{
			var _JudgeUID = 0;
			var _Result = false;//是否符合
			void GetData(bid,sid)
			{
				if (_Result)
					return;

				if (_JudgeUID == bid || _JudgeUID == sid)
					_Result = true;
			}
		};
		_VNet2DBTable._JudgeUID = _UID.__Long__;
		var sql = "SELECT * FROM "+window.RELATION+" WHERE "+window.M_G_SERVER_RELATION_WSTATE_STR+"=1";
		_VNet2DBTable.Select( window.M_G_SERVER,sql);
		_VNet2DBTable.ReadData("GetData",""+window.M_G_SERVER_RELATION_BID+","+window.M_G_SERVER_RELATION_SID);
		var _res = _VNet2DBTable._Result;
		_VNet2DBTable.del();
		return _res;
	}

	//[功能]根据UID判断某人与自己是否为某种关系
	//[参数]_UID:被判断者的UID
	//		_type:关系类型 1搭档 2密友 3情侣
	//[返回值]true是 false不是
	void JudgeRelationByUID(_UID,_type)
	{
		if (_type == window.RELATION_PARTNER)//搭档
		{
			alert("此功能未提供！");
			return false;
		}
		if (_type == window.RELATION_BUDDY)//密友
		{
			return window.GetRelationByUID_Buddy(_UID);
		}
		if (_type == window.RELATION_LOVER)//情侣
		{
			var _tempUID = window.GetCurrLoverUID();
			if (_UID.__Long__ == _tempUID.__Long__)
				return true;
			else
				return false;
		}
	}

	//[功能]根据UID判断某人与自己是否为某种关系(情侣)
	//[参数]_UID:被判断者的UID
	//[返回值]true是 false不是
	void JudgeRelationByUID_Lover(_UID)
	{
		return window.JudgeRelationByUID(_UID,window.RELATION_LOVER);
	}

	//[功能]根据UID判断某人与自己是否为某种关系(密友)
	//[参数]_UID:被判断者的UID
	//[返回值]true是 false不是
	void JudgeRelationByUID_Buddy(_UID)
	{
		return window.GetRelationByUID_Buddy(_UID);
	}

	//-----------------------------------------------------------------------
	//设置可开启的搭档列表的数量
	var g_CanOpenPartnerNum = 0;
	void SetCanOpenPartnerNum(data)
	{
		g_CanOpenPartnerNum = data;
		window.find("FRIEND_LOGIC").s_Class_Partner.SetLeavingNum(window.g_CanOpenPartnerNum);
	}
	//获得当前搭档名字
	void GetCurPartnerName()
	{
		var _VNet2DBTable=new VNet2DBTable
		{
			var m_name = "";
			void GetData(_name,_BID,_sname)
			{
				if(_BID ==  window.GetMyUID())
					m_name = _sname;
				else
					m_name = _name;
			}
		};
		var sql = "SELECT * FROM "+window.RELATION+" WHERE "+window.M_G_SERVER_RELATION_PCURRENT_STR+"=1";
		_VNet2DBTable.Select( window.M_G_SERVER,sql);
		_VNet2DBTable.ReadData("GetData",""+window.M_G_SERVER_RELATION_NKNAME+","+window.M_G_SERVER_RELATION_BID+","+window.M_G_SERVER_RELATION_SNKNAME);
		var _tempname = _VNet2DBTable.m_name;
		_VNet2DBTable.del();
		return _tempname;
	}
	//获得当前搭档的Id
	void GetMyCurPartnerId()
	{
		var _VNet2DBTable=new VNet2DBTable
		{
			var m_id = 0;
			void GetData(_bid,_sid)
			{
				if(window.GetMyUID() == _bid)
				{
					m_id=_sid;
				}
				else
				{
					m_id=_bid;
				}
			}
		};
		var sql = "SELECT * FROM "+window.RELATION+" WHERE "+window.M_G_SERVER_RELATION_PCURRENT_STR+"=1";
		_VNet2DBTable.Select( window.M_G_SERVER,sql);
		_VNet2DBTable.ReadData("GetData",""+window.M_G_SERVER_RELATION_BID+","+window.M_G_SERVER_RELATION_SID);
		var _id = _VNet2DBTable.m_id;
		_VNet2DBTable.del();
		return _id;
	}
	//根据id获得此搭档的名字
	//可判断此人是不是搭档
	void GetPartnerNameById(_id)
	{
		var _VNet2DBTable=new VNet2DBTable
		{
			var m_id = _id;
			var m_name = "";
			void GetData(_bid,_sid,_name,_sname)
			{
				if(m_id == _bid || m_id == _sid )
				{
					if(m_id == _bid )
					{
						m_name=_name;
					}
					else
						m_name=_sname;
				}
			}
		};
		var sql = "SELECT * FROM "+window.RELATION+" WHERE "+window.M_G_SERVER_RELATION_PSTATE_STR+"=1";
		_VNet2DBTable.Select( window.M_G_SERVER,sql);
		_VNet2DBTable.ReadData("GetData",""+window.M_G_SERVER_RELATION_BID+","+window.M_G_SERVER_RELATION_SID+","+window.M_G_SERVER_RELATION_NKNAME
			+","+window.M_G_SERVER_RELATION_SNKNAME);
		var _name = _VNet2DBTable.m_name;
		_VNet2DBTable.del();
		return _name;
	}
	//我是不是队长
	void GetMyLeaderState()
	{
		var _VNet2DBTable=new VNet2DBTable
		{
			var m_leader = 0;
			void GetData(_bid,_leader)
			{
				if(window.GetMyUID() == _bid)
				{
					if(_leader==1){m_leader=1;}
				}
				else
				{
					if(_leader==2){m_leader=1;}
				}
			}
		};
		var sql = "SELECT * FROM "+window.RELATION+" WHERE "+window.M_G_SERVER_RELATION_PCURRENT_STR+"=1";
		_VNet2DBTable.Select( window.M_G_SERVER,sql);
		_VNet2DBTable.ReadData("GetData",""+window.M_G_SERVER_RELATION_BID+","+window.M_G_SERVER_RELATION_PTEAMLEADER);
		var _templeader = _VNet2DBTable.m_leader;
		_VNet2DBTable.del();
		return _templeader;
	}
	//添加搭档
	void AddPartnerById(_id)
	{
		if(window.GetLVByUID()<6){window.find("UIController").LoadDLG(736);return;}
		window.Tos_RelationInvite("1,1,"+_id);
	}
	//删除搭档
	void DelPartnerById(_id)
	{
		window.find("UIController").LoadDLG(732);
		window.find("VMB_DelPartner_Logic").m_ID=_id;
	}
	//组成当前搭档
	void MakePartner(_id)
	{
		var _tempId = window.GetMyCurPartnerId();
		if(_tempId==_id){return;}
		window.Tos_RelationInvite("1,2,"+_id);
	}
	//取消当前搭档关系
	void CancelCurPartner(_id)
	{
		window.find("UIController").LoadDLG(731);
		window.find("VMB_CancelCurPartner_Logic").m_ID=_id;
	}
	//被邀请进搭档列表
	void BeAddPartnerList(_id,_name,_data)
	{
		window.find("UIController").LoadDLG(733);
		window.find("VMB_BeAskPartnerList_Logic").ReplaceData(_name);
		window.find("VMB_BeAskPartnerList_Logic").m_ID=_id;
		window.find("VMB_BeAskPartnerList_Logic").m_exData=_data;
	}
	//被邀请当前搭档
	void BeAddCurPartner(_id,_name,_data)
	{
		window.find("UIController").LoadDLG(734);
		window.find("VMB_BeAskCurPartner_Logic").ReplaceData(_name);
		window.find("VMB_BeAskCurPartner_Logic").m_ID=_id;
		window.find("VMB_BeAskCurPartner_Logic").m_exData=_data;
	}
	//同意进搭档列表
	void AgreeInvitePartner(_id,_data)
	{
		window.Tos_AnswerRelationInvite("1,"+_id+",1,1,"+_data);
	}
	//拒绝进搭档列表
	void RefuseInvitePartner(_id,_data)
	{
		window.Tos_AnswerRelationInvite("1,"+_id+",0,1,"+_data);
	}
	//同意成当前搭档
	void AgreeInviteCurPartner(_id,_data)
	{
		window.Tos_AnswerRelationInvite("1,"+_id+",1,2,"+_data);
	}
	//拒绝成当前搭档
	void RefuseInviteCurPartner(_id,_data)
	{
		window.Tos_AnswerRelationInvite("1,"+_id+",0,2,"+_data);
	}

	//[界面调用]点击了成为密友
	//[参数]_NkName：被操作者的玩家昵称
	//		_UID: 被操作者的UID
	void OnClick_ToBeBuddy(_NkName,_UID)
	{
		//1 先看有无“亲密项链”
		if (window.GetItemNumByEnterID(window.g_NECKLACE_ID) <= 0)
		{
			window.find("UIController").LoadDLG(709);	//成为密友需要“%0”，是否立刻购买？所需%1：%2
			//名字,点券,钱
			var _itemname = window.GetNameByEnterID(window.g_NECKLACE_BUY_ID);
			var _moneytype = window.GetPriceNameByType(window.GetPriceTypeByID(window.g_NECKLACE_BUY_ID));
			var _money = window.GetPriceByIndex(window.g_NECKLACE_BUY_ID);
			var _vip = window.GetVipTypeByUID(window.GetMyUID());
			if (_vip == window.G_VIPVALUE)
			{
				var _vipagio = window.GetVipBuyAgio(_vip);
				_money = ""+toint(_money) * _vipagio +"(Vip"+_vipagio+"折)";	
			}
			var _param = ""+_itemname+","+_moneytype+","+_money;
			window.find("VMB_NoNeckLace_Logic").ReplaceData(_param);
			return;
		}

		//2 发消息
		window.find("UIController").LoadDLG(710);	//您确定要与[%0]成为密友吗？消耗“%1” X %2
		//昵称,物品名字,数量
		var _itemname = window.GetNameByEnterID(window.g_NECKLACE_BUY_ID);
		var _param = ""+_NkName+","+_itemname+","+window.g_NECKLACE_USE_NUM;
		window.find("VMB_UseNeckLace_Logic").ReplaceData(_param);
		window.find("VMB_UseNeckLace_Logic").SetParam(_UID,window.g_NECKLACE_BUY_ID);
	}
	
	//[网络调用]收到消息被成为密友的请求
	//[参数]_NkName：操作者的昵称
	//		_UID: 操作者的UID
	//		exdata:额外数据 情侣时是物品id
	void OnCall_ToBeBuddy(_NkName,_UID,exdata)
	{
		window.find("UIController").LoadDLG(711);	//[%0]为你买了%1，您愿意与[%2]成为密友吗？
		//昵称，物品名，昵称
		var _itemname = window.GetNameByEnterID(window.g_NECKLACE_BUY_ID);
		var _param = ""+_NkName+","+_itemname+","+_NkName;
		window.find("VMB_WillBeBuddy_Logic").ReplaceData(_param);
		window.find("VMB_WillBeBuddy_Logic").SetParam(_NkName,_UID,exdata);
	}
	
	//[界面调用]点击了删除密友
	//[参数]_UID: 被操作者的UID
	void OnClick_DelBuddy(_UID)
	{
		window.find("UIController").LoadDLG(707);//您确定要删除密友吗，删除后不能恢复密友关系
		window.find("DLGLAYER").find("VMB_DelBuddy_Logic").SetParam(_UID);
	}

	//[网络调用]点击了将密友加入黑名单
	//[参数]_NkName：操作者的昵称
	//		_UID:玩家ID
	void OnClick_BuddyToBlackList(_NkName,_UID)
	{
		window.find("UIController").LoadDLG(708);//您是否要将[%0]加入黑名单？加入黑名单后密友关系将自动解除。
		window.find("DLGLAYER").find("VMB_BuddyToBlack_Logic").ReplaceData(""+_NkName);
		window.find("DLGLAYER").find("VMB_BuddyToBlack_Logic").SetParam(_UID,_NkName);
	}

	//[界面调用]点击了成为情侣
	//[参数]_NkName：被操作者的玩家昵称
	//		_UID: 被操作者的UID
	void OnClick_ToBeLover(_NkName,_EnterID)
	{
//		//1 先看有无“定情信物”
//		var _ItemNum = 0;	//定情信物的数量
//		var _ItemID = window.g_TOBELOVER_ITEM_3_ID;	//先默认最贵的
//		_ItemNum = window.GetItemNumByEnterID(window.g_TOBELOVER_ITEM_3_ID);	//钻石
//		if (_ItemNum <= 0)
//		{
//			_ItemNum = window.GetItemNumByEnterID(window.g_TOBELOVER_ITEM_2_ID);//黄金
//			_ItemID = window.g_TOBELOVER_ITEM_2_ID;
//			if (_ItemNum <= 0)
//			{
//				_ItemNum = window.GetItemNumByEnterID(window.g_TOBELOVER_ITEM_1_ID);//白银
//				_ItemID = window.g_TOBELOVER_ITEM_1_ID;
//			}
//		}
//
//		if (_ItemNum <= 0)
//		{
//			window.find("UIController").LoadDLG(712);	//成为情侣需要 白银/黄金/钻石 定情信物，是否立刻去商城购买？
//			return;
//		}
//
		// 有定情信物了
		var _ItemID = _EnterID;
		if ( window.GetCurrLoverNkName(window.GetMyUID()) != tostring(_NkName))
		{
			window.find("UIController").LoadDLG(713);	//您确定要与[%0]成为情侣吗，消耗%1定情信物x %2
	//		//昵称,物品名字,数量
			var _itemname = window.GetNameByEnterID(_ItemID);
			var _param = ""+_NkName+","+_itemname+","+window.g_TOBELOVER_ITEM_USE_NUM;
			window.find("VMB_UseLoveItem_Logic").ReplaceData(_param);
			window.find("VMB_UseLoveItem_Logic").SetParam(_ItemID,_NkName);
		}
		else
		{
			window.find("UIController").LoadDLG(828);
			window.find("VMB_BecomeLoverAgain_Logic").SetParam(_ItemID,_NkName);
		}
	}

	//[网络调用]收到消息被成为情侣的请求
	//[参数]_NkName：操作者的昵称
	//		_UID: 操作者的UID
	//		exdata:额外数据 情侣时是物品id
	void OnCall_ToBeLover(_NkName,exdata,randomid)
	{
		window.find("UIController").LoadDLG(714);	//[%0]送你了华丽的[%1]定情信物，请求你与他结为情侣，您愿意吗？
		var _ItemID = exdata;
		var _randomid = randomid;
		//昵称,物品名
		var _itemname = window.GetNameByEnterID(_ItemID);
		var _param = ""+_NkName+","+_itemname;
		window.find("VMB_WillBeLover_Logic").ReplaceData(_param);
		window.find("VMB_WillBeLover_Logic").SetParam(_NkName,exdata,_randomid);
	}

	//点击扩充搭档列表
	void OnClick_AddPartnerListNum()
	{
		var _itemname = window.GetNameByEnterID(window.G_ADDPARTNERLISTNUM_ITEM_ID);
		//1 先看看有没有道具
		if (window.GetItemNumByEnterID(window.G_ADDPARTNERLISTNUM_ITEM_ID) <= 0)
		{
			window.find("UIController").LoadDLG(762);	//扩充搭档列表需要消耗“%0”，是否立刻去商城购买？
			var _param = ""+_itemname;
			window.find("VMB_AddPartnerListBuyItem_Logic").ReplaceData(_param);
			return;
		}

		window.find("UIController").LoadDLG(735);//扩充搭档列表需要消耗“%0”x%1，是否确定？
		var _param = ""+_itemname+","+window.G_ADDPARTNERLIST_ITEM_NUM;
		window.find("VMB_AddPartnerList_Logic").ReplaceData(_param);
	}

	//增加密友亲密度
	void OnClick_AddBuddyLv(_id)
	{
		var _itemname = window.GetNameByEnterID(window.G_ADDBUDDYLV_ITEM_ID);
		//1 先看看有没有道具
		if (window.GetItemNumByEnterID(window.G_ADDBUDDYLV_ITEM_ID) <= 0)
		{
			window.find("UIController").LoadDLG(761);	//增加密友亲密度需要消耗“%0”，是否立刻去商城购买？
			var _param = ""+_itemname;
			window.find("VMB_UpLvBuddyUseItem_Logic").ReplaceData(_param);
//			window.find("VMB_AddPartnerListBuyItem_Logic").SetParam(window.g_FORCEPARTLOVER_ITEM_ID,_UID);
			return;
		}

		window.find("UIController").LoadDLG(760);//增加密友亲密度需要消耗“%0”x%1，是否确定？
		var _param = ""+_itemname+","+window.G_ADDBUDDYLV_ITEM_NUM;
		window.find("VMB_UpLvBuddy_Logic").ReplaceData(_param);
		window.find("DLGLAYER").find("VMB_UpLvBuddy_Logic").m_UID=_id;
	}
	//提升爱情指数
	void OnClick_AddLovePoint()
	{
		var _itemname = window.GetNameByEnterID(window.G_ADDLOVERPOINT_ITEM_ID);
		//1 先看看有没有道具
		if (window.GetItemNumByEnterID(window.G_ADDLOVERPOINT_ITEM_ID) <= 0)
		{
			window.find("UIController").LoadDLG(764);	//提升爱情指数需要消耗“%0”，是否立刻去商城购买？
			var _param = ""+_itemname;
			window.find("VMB_AddLovePointBuyItem_Logic").ReplaceData(_param);
			return;
		}

		window.find("UIController").LoadDLG(763);//提升爱情指数需要消耗“%0”x%1，是否确定？
		var _param = ""+_itemname+","+window.G_ADDPARTNERLIST_ITEM_NUM;
		window.find("VMB_AddLovePoint_Logic").ReplaceData(_param);
	}
	//[界面调用]点击了情侣分手
	//[参数]_NkName：被操作者的玩家昵称
	//		_UID: 被操作者的UID
	void OnClick_LoverPart(_NkName,_UID)
	{
//		//1 先看看有没有道具
//		if (window.GetItemNumByEnterID(window.g_FORCEPARTLOVER_ITEM_ID) > 0)
//		{
//			window.find("UIController").LoadDLG(723);	//您确定要与[%0]解除情侣关系吗？ 一旦解除无法恢复，消耗“%1”x%2
//			var _itemname = window.GetNameByEnterID(window.g_FORCEPARTLOVER_ITEM_ID);
//			var _param = ""+_NkName+","+_itemname+","+window.g_FORCEPARTLOVER_ITEM_NUM;
//			window.find("VMB_ForcePartLover_Logic").ReplaceData(_param);
//			window.find("VMB_ForcePartLover_Logic").SetParam(window.g_FORCEPARTLOVER_ITEM_ID,_UID);
//			return;
//		}

		window.find("UIController").LoadDLG(716);//解除情侣关系需要花费%0%1，确定要与[%2]解除情侣关系吗？
//		var _param = ""+window.g_PARTLOVER_MONEY_VALUE+","+window.GetPriceNameByType(window.g_PARTLOVER_MONEY_TYPE)+","+_NkName;
//		window.find("VMB_PartLover_Logic").ReplaceData(_param);
//		window.find("DLGLAYER").find("VMB_PartLover_Logic").SetParam(_UID);
	}
	//情侣分手
	void OnClick_LoverPart2(_UID)
	{
//		//1 先看有无“破碎的心”
//		if (window.GetItemNumByEnterID(window.g_FORCEPARTLOVER_ITEM_ID) <= 0)
//		{
//			window.find("UIController").LoadDLG(802);	//强制分手需要“%0”，是否立刻购买？所需%1：%2
//			//名字,点券,钱
//			var _itemname = window.GetNameByEnterID(window.g_FORCEPARTLOVER_ITEM_ID);
//			var _moneytype = window.GetPriceNameByType(window.GetPriceTypeByID(window.g_FORCEPARTLOVER_ITEM_ID));
//			var _money = window.GetPriceByIndex(window.g_FORCEPARTLOVER_ITEM_ID);
//			var _vip = window.GetVipTypeByUID(window.GetMyUID());
//			if (_vip == window.G_VIPVALUE)
//			{
//				var _vipagio = window.GetVipBuyAgio(_vip);
//				_money = ""+toint(_money) * _vipagio +"(Vip"+_vipagio+"折)";	
//			}
//			var _param = ""+_itemname+","+_moneytype+","+_money;
//			window.find("VMB_ForseBreakUp_Logic").ReplaceData(_param);
//			return;
//		}
			window.find("UIController").LoadDLG(723);	//您确定要与[%0]解除情侣关系吗？ 一旦解除无法恢复，消耗“%1”x%2
//			var _itemname = window.GetNameByEnterID(window.g_FORCEPARTLOVER_ITEM_ID);
//			var _param = ""+_NkName+","+_itemname+","+window.g_FORCEPARTLOVER_ITEM_NUM;
//			window.find("VMB_ForcePartLover_Logic").ReplaceData(_param);
			window.find("VMB_ForcePartLover_Logic").SetParam(_UID);
	}

	//[网络调用]收到消息被解除情侣的请求
	//[参数]_NkName：操作者的昵称
	//		_UID: 操作者的UID
	//		exdata:额外数据 情侣时是物品id
	void OnCall_PartLover(_NkName,_UID,exdata)
	{
		window.find("UIController").LoadDLG(718);	//[%0]要与你解除情侣关系，是否同意？
		var _param = ""+_NkName;
		window.find("VMB_WillPartLover_Logic").ReplaceData(_param);
		window.find("VMB_WillPartLover_Logic").SetParam(_NkName,_UID,exdata);
	}

	//[界面调用]点击了情侣升级
	//[参数]_currlv:当前情侣等级
	void OnClick_LoverLvUp(_currlv)
	{
		var _ItemID = 0;
		switch(_currlv)
		{
			case 1:_ItemID = window.g_UPLVLOVER_ITEM_ID_2;break;
			case 2:_ItemID = window.g_UPLVLOVER_ITEM_ID_3;break;
			case 3:_ItemID = window.g_UPLVLOVER_ITEM_ID_4;break;
			case 4:_ItemID = window.g_UPLVLOVER_ITEM_ID_5;break;
			case 5:break;
		}
		
		if (_ItemID <= 0)
		{
			printf("B# error-OnClick_LoverLvUp():_currlv:"+_currlv);
			return;
		}
		
		var _itemname = window.GetNameByEnterID(_ItemID);
		//1 先看看有没有道具
		if (window.GetItemNumByEnterID(_ItemID) <= 0)
		{
			window.find("UIController").LoadDLG(726);	//情侣升级需要%0，是否立刻去商城购买？
			var _itemname = window.GetNameByEnterID(_ItemID);
			var _param = ""+_itemname;
			window.find("VMB_UpLvLover_Logic").ReplaceData(_param);
			window.find("VMB_UpLvLover_Logic")._itemid = _ItemID;
			return;
		}
		
		//2 提示消耗道具
		window.find("UIController").LoadDLG(727);//您确定要升级情侣关系吗，消耗%0 x%1
		var _param = ""+_itemname+","+window.g_UPLVLOVER_ITEM_USE_NUM;
		window.find("DLGLAYER").find("VMB_UpLvLoverUseItem_Logic").ReplaceData(_param);
		window.find("DLGLAYER").find("VMB_UpLvLoverUseItem_Logic").SetParam(_ItemID);
	}

	//[功能]情侣升级-界面效果
	void UIEffect_LoverLvUp()
	{
		window.find("VQualifyLv_Logic_NAME_Item").Init();
		window.find("VQualifyLv_Logic_NAME_Item").s_LvUp.showLvUp_Lover();
	}
	//[功能]取当前的是否有密友
	//[返回值]当前有密友的返回true，为false代表没有情侣
	void GetCurrBuddy()
	{
		var _VNet2DBTable=new VNet2DBTable
		{
//			var _key = 0;
//			void GetMyData(key)
//			{
//				_key = key;
//			}
		};
		var _SQL = "SELECT * FROM "+window.RELATION+" WHERE "+window.M_G_SERVER_RELATION_WSTATE_STR+"=1";
		_VNet2DBTable.Select( window.M_G_SERVER,_SQL );
		
		if(_VNet2DBTable.GetSize()==0)
		{
			_VNet2DBTable.del();
			return 0;
		}
		else
		{
			_VNet2DBTable.del();
			return 1;
		}
		
	}

	//[功能]取当前的情侣等级
	//[返回值]当前有密友的返回true，为false代表没有情侣
	void GetCurrLoverLevel()
	{
		var _VNet2DBTable=new VNet2DBTable
		{
			var LPoint = 0;
			var LBedge = 0;
			void GetDataLover(_LPoint,_LBedge)
			{
				LName = _LName;
				LPoint = _LPoint;
				LBedge = _LBedge;
			}
		};
		var _sqlL = "SELECT * FROM "+window.RELATION+" WHERE "+window.M_G_SERVER_RELATION_WCOUPLE_STR+"=1";
		_VNet2DBTable.Select( window.M_G_SERVER,_sqlL);
		_VNet2DBTable.ReadData("GetDataLover",""+window.M_G_SERVER_RELATION_WLOVES+","+window.M_G_SERVER_RELATION_WBADDISH);
		var LLevel = window.GetRelationLvByType_Lover(_VNet2DBTable.LPoint,_VNet2DBTable.LBedge);
		
		if(_VNet2DBTable.GetSize()==0)
		{
			_VNet2DBTable.del();	
			return 0;
		}
		
		_VNet2DBTable.del();
		return LLevel;
	}

	//[商城界面调用]商城界面打开后调用
	//[备注]2010年10月6日11:05 yxf
	void MallCall_OnOpenMallUI()
	{
		if(window.g_RelationOpenMallType == window.g_RelationOpenMallType_ToBeLover)
		{
			//成为情侣-后续调用
			if (window.g_TOBELOVER_MALLPOS_TYPE == 1)	//1点券区 2金币区
			{
				window.FQ_OnClick_Mall_RMBBuy_Btn();
			}
			else
			{
				window.FQ_OnClick_Mall_GoldBuy_Btn();
			}
			window.FQ_OnClick_Mall_GoldBuy_Prop_Btn();//道具
			window.FQ_OnClick_Mall_PageGo(window.g_TOBELOVER_MALLPOS_PAGE);
			return;
		}
		if(window.g_RelationOpenMallType == window.g_RelationOpenMallType_UpLvLover)
		{
			//提升情侣-后续调用
			if (window.g_UPLVLOVER_MALLPOS_TYPE == 1)	//1点券区 2金币区
			{
				window.FQ_OnClick_Mall_RMBBuy_Btn();
			}
			else
			{
				window.FQ_OnClick_Mall_GoldBuy_Btn();
			}
			window.FQ_OnClick_Mall_GoldBuy_Prop_Btn();//道具
			window.FQ_OnClick_Mall_PageGo(window.g_UPLVLOVER_MALLPOS_PAGE);
			return;
		}
		if(window.g_RelationOpenMallType == window.g_RelationOpenMallType_UpLvBuddy)
		{
			//提升密友-后续调用
			if (window.g_UPLVBUDDY_MALLPOS_TYPE == 1)	//1点券区 2金币区
			{
				window.FQ_OnClick_Mall_RMBBuy_Btn();
			}
			else
			{
				window.FQ_OnClick_Mall_GoldBuy_Btn();
			}
			window.FQ_OnClick_Mall_GoldBuy_Prop_Btn();//道具
			window.FQ_OnClick_Mall_PageGo(window.G_UPLVBUDDY_MALLPOS_PAGE);
			return;
		}
		if(window.g_RelationOpenMallType == window.g_RelationOpenMallType_AddListNum)
		{
			//扩充搭档列表-后续调用
			if (window.G_ADDPARTNERLIST_MALLPOS_TYPE == 1)	//1点券区 2金币区
			{
				window.FQ_OnClick_Mall_RMBBuy_Btn();
			}
			else
			{
				window.FQ_OnClick_Mall_GoldBuy_Btn();
			}
			window.FQ_OnClick_Mall_GoldBuy_Prop_Btn();//道具
			window.FQ_OnClick_Mall_PageGo(window.G_ADDPARTNERLIST_MALLPOS_PAGE);
			return;
		}
		if(window.g_RelationOpenMallType == window.g_RelationOpenMallType_AddLovePoint)
		{
			//爱情指数-后续调用
			if (window.g_UPLVLOVER_MALLPOS_TYPE == 1)	//1点券区 2金币区
			{
				window.FQ_OnClick_Mall_RMBBuy_Btn();
			}
			else
			{
				window.FQ_OnClick_Mall_GoldBuy_Btn();
			}
			window.FQ_OnClick_Mall_GoldBuy_Prop_Btn();//道具
			window.FQ_OnClick_Mall_PageGo(window.G_ADDLOVEPOINT_MALLPOS_PAGE);
			return;
		}
	}

	//[Socket调用]成为某种关系成功后
	//[参数]iType:邀请类型,1:邀请成为搭档 2:邀请成为当前搭档 3:邀请成为密友 4:邀请成为情侣 5:使用金币的取消情侣 6:数据同步完成
	//		iInviteid:被邀请的用户id
	//		iReturnID:返回值
	//		szNick:被邀请的用户昵称,由对方返回的消息时有
	void SocketCall_BeRelationSuccess(iType,iReturnID,szNick)
	{
		window.find("TASK_LOGIC")._VTask_Logic.RefreshTaskshow();
		switch (iType)
		{
			case 1:break;
			case 2:window.SocketCall_BeRelationSuccess_Partner(1,szNick);break;
			case 3:
				//刷新好友列表
				if (window.IsHallHtnOpened(window.G_HALLBTN_FRIEND))
				{
					window.find("FRIEND_LOGIC")._VRelation_Logic.s_Class_Friend.RelationSelect();
				}
				break;
			case 4:window.SocketCall_BeRelationSuccess_Lover(1,szNick);break;
			case 5:window.SocketCall_BeRelationSuccess_Lover(2,"");break;
			case 6:
			{
				window.SocketCall_BeRelationSuccess_Lover(4,"");
				window.SocketCall_BeRelationSuccess_Partner(2,"");
				break;
			}
		}
	}
	
	//[Socket调用]成为某种关系成功后-情侣
	//[参数]type:1:邀请成为情侣 2:使用金币的取消情侣 3:强制取消情侣 4数据同步完成
	//		szNick:被邀请的用户昵称,由对方返回的消息时有
	void SocketCall_BeRelationSuccess_Lover(returnid,szNick,returnUID)
	{
		if (window.IsHallHtnOpened(window.G_HALLBTN_FRIEND))
		{
			window.find("FRIEND_LOGIC").UpDate_Lover(returnid);
		}
		if (window.GetRoleModelOpenState())
		{
			window.find("ROLEMODEL_LOGIC").UpDate_Lover(returnid,window.GetCurrLoverNkName());
		}
		if (window.GetSelfInfoOpenState())
		{
			window.find("SELFINFO_LOGIC").UpDate_Lover(returnid,szNick);
		}
		if (window.IsHallHtnOpened(window.G_HALLBTN_TASK))
		{
			window.find("TASK_LOGIC")._VTask_Logic.RefreshTaskshow();
		}
		if (window.g_probablyPos == window.POS_PROBABLY_ROOM &&  returnid == window.RELATION_UNMARRY)//在房间中离刷新任务头上名字
		{
			window.find("VRoleModel_Info_Logic_Name_"+returnUID).SetLoverName("");
			window.find("VRoleModel_Info_Logic_Name_"+window.GetCurrLoverUID(returnUID)).SetLoverName("");
		}
		if ( window.g_probablyPos == window.POS_PROBABLY_ROOM &&  returnid != window.RELATION_UNMARRY)//在房间中结婚刷新任务头上名字
		{
			window.find("VRoleModel_Info_Logic_Name_"+window.GetMyUID()).SetLoverName(""+window.GetCurrLoverNkName());
			window.find("VRoleModel_Info_Logic_Name_"+window.GetCurrLoverUID(window.GetMyUID())).SetLoverName(""+window.GetCurrLoverNkName(window.GetCurrLoverUID(window.GetMyUID())));
		}
	}

	//[Socket调用]成为某种关系成功后-搭档
	//[参数]type:1:邀请成为当前搭档 2取消当前搭档成功 3数据同步完成
	//		szNick:被邀请的用户昵称,由对方返回的消息时有
	void SocketCall_BeRelationSuccess_Partner(type,szNick)
	{
		if (window.GetRoleModelOpenState())
		{
			window.find("ROLEMODEL_LOGIC").UpDate_Partner(type,szNick);
		}
		if (window.GetSelfInfoOpenState())
		{
			window.find("SELFINFO_LOGIC").UpDate_Partner(type,szNick);
		}
	}

	//[Socket调用]增加亲密度,爱情指数,默契度的成功
	//[参数]iType:类型 1:搭档 2:密友 3:情侣
	void SocketCall_AddRelationPointSuccess(iType)
	{
		if (iType == 3)
		{
			if (window.IsHallHtnOpened(window.G_HALLBTN_FRIEND))
			{
				window.find("FRIEND_LOGIC").UpDate_LoverValue();
			}	
		}
	}

	//[Socket调用]情侣升级成功
	void SocketCall_UpLvLoverSuccess(iType)
	{
		window.UIEffect_LoverLvUp();

		if (window.IsHallHtnOpened(window.G_HALLBTN_FRIEND))
		{
			window.find("FRIEND_LOGIC").UpDate_Lover(4);
		}	
	}
}