import("$./../designerscript/BrainDeformity/Brain_Deformity.gml");
import("$./../designerscript/sorry/tools.gml");

set window
{
	var radian  = 0;//击球角度
	var servepeopleID = 0;//发球人ID
	var _speed = 0;
 	/*===球相关===*/
	// 第一次落地
	void GameEvent_FirstDrop()
	{

	}

	// 第二次落地
	void GameEvent_SecondDrop()
	{
		window.find("NAME_GCMap").find("userFinder").RunScript("AI.AIController.AIEvent( 1002)");

		//----------拯救笨蛋 老虎添加----------
		//隐藏动作提示、2个落点特效
		if ( BD_HELP == 1) 
		{
			window.BD_HideFallPoint();
			window.LMH_UpDate_PromptInfo(false,0);
		}
	}

	// 球飞出
	void GameEvent_NewFly()
	{
		//----------拯救笨蛋 老虎添加----------
		if ( BD_HELP == 1) {window.BD_NewFly();}

		
		//----任务相关 --车新
		window.tasklogic(); 
	}

	/*===比赛规则相关===*/
	void GameEvent_GameStart()
	{
		printf("6# GameEvent_GameStart()");
		//----------拯救笨蛋 老虎添加----------
		window.BD_CheckUp();//查看是否需要帮助笨蛋

		//----------体力消耗 老虎添加----------
		//初始化最大值、当前值，并暂存体力属性值和判断是否是自己
		var _temp = window.GetRoleStamina();
		if( window.GetUIGameState() == USER_UISTATE_AI_FREETRAIN || window.GetUIGameState() == USER_UISTATE_AI_RAND)
		{	//在AI训练和单搓AI里的初始化自己的属性
			window.find("GAMELAYER").find("NAME_GCMap").find("IAMISSELF").parent.find("Logic").SetMaxStamina( _temp);
			window.find("GAMELAYER").find("NAME_GCMap").find("IAMISSELF").parent.find("Logic").AddStamina( _temp);
			//在AI训练和单搓AI里的初始化AI的属性
			window.find("GAMELAYER").find("NAME_GCMap").find("IAMISAI").parent.find("Logic").SetMaxStamina( 50);
			window.find("GAMELAYER").find("NAME_GCMap").find("IAMISAI").parent.find("Logic").AddStamina( 50);
		}
		else
		{	//其他正常方式初始化自己的体力属性
			window.find("GAMELAYER").find("NAME_GCMap").find("self").parent.find("Logic").AddStamina_Tennis(_temp);
		}
		//启动自动回复机制
		window.find("GAMELAYER").find("NAME_GCMap").find("self").parent.find("Logic").roleStamina = _temp;
		window.find("GAMELAYER").find("NAME_GCMap").find("self").parent.find("Logic").matchBegin = 1;
		window.find("GAMELAYER").find("NAME_GCMap").find("self").parent.find("Logic").CheckSelf();
		//-------------------------------------
	}

	// 一球结束
	void GameEvent_RoundOver()
	{
		//----------拯救笨蛋 老虎添加----------
		//隐藏动作提示、2个落点特效
		if ( BD_HELP == 1) 
		{
			window.BD_HideFallPoint();
			window.LMH_UpDate_PromptInfo(false,0);
		}
	}

	// 一局结束
	void GameEvent_InnOver()
	{
		//----------体力回复 老虎添加----------
		//一局结束后体力回复1/5
		var _temp = window.GetRoleStamina();
		window.find("GAMELAYER").find("NAME_GCMap").find("self").parent.find("Logic").AddStamina_Tennis(_temp/5);
		//-------------------------------------
	}

	// 一盘结束
	void GameEvent_PlateOver()
	{
	
	}

	// 一场结束
	void GameEvent_GameOver()
	{
		printf("6# GameEvent_GameOver()");
		//----------拯救笨蛋 老虎添加----------
		window.BD_GameEnd();//将所有检查用的信息清零
	
		//----------体力回复 老虎添加----------
		//关掉自动回复机制
		window.find("GAMELAYER").find("NAME_GCMap").find("self").parent.find("Logic").matchBegin = 0;
	}

	var g_CanServe = true;
	// 发球站位重置(重新站位后就会调用, 这时还不能动)
	void GameEvent_ReadyServe( id )
	{
		//--------------接发球区域 SXD----------------
		var _VNet2DBRow = new VNet2DBRow
		{
			InitByInt(window.M_G_SERVER,window.USERDT, window.M_G_SERVER_USERDT_UID, window.GetMyUID());
		}
		var _ruleType = _VNet2DBRow.GetData(window.M_G_SERVER_USERDT_RULETYPE);	//规则位置, 发球啊还是接发啊, 参见数据库说明
		var _lv =  _VNet2DBRow.GetData(window.M_G_SERVER_USERDT_CULEVEL);
		if( _lv<=20)
		{
		
//		alert( "_ruleType: " + _ruleType);
			if( _ruleType == 1)
			{	// 是接发球
				var _ruleStation = _VNet2DBRow.GetData(window.M_G_SERVER_USERDT_RULESTATION);	//在场地中的站位, 具体参见数据库说明
				
				// TODO: 特效的基准位置, 在x和y轴正半区的位置, SMD填写
				var _x = 3.5;
				var _z = 12.0;
				
				// 筛选人物的位置确定特效的摆放位置
				switch( _ruleStation)
				{
					case 1:
						{
							_z = _z * ( -1);
							break;	
						}	
					case 2:
						{
							_x = _x * ( -1);
							_z = _z * ( -1);
							break;	
						}	
					case 3:
						{
							_x = _x * ( -1);					
							break;	
						}
				}

				
				// TODO: 修改特效的名字, 目前的EffectName部分 SXD修改
				set window.find("GAMELAYER").find("NAME_GCMap").find("Serve_receive_BALL")
				{
					visible = true;
					var _posStr = "" + _x + "," + "0.001" + "," + _z;
	//				alert( _posStr);
					pos = _posStr;
				}
			}
		}
		_VNet2DBRow.del();
		
		servepeopleID = id;
		if ( id == window.GetMyUID())
		{
			radian = window.g_CBallAngle.GetRadianOfThreePoint(-3.2,6.6,-0.5,6.6,2.6,-12);
			window.find("VGame_Sector").Comp_Angle(radian);
			g_CanServe = true;
		}
	}

	// 可以开始发球( 可以动了)
	void GameEvent_CanServe( id)
	{
		window.find("NAME_GCMap").find("userFinder").RunScript("AI.AIController.AIEvent( 1003)");
	}

	// 发球结束
	void GameEvent_ServeOver( id)
	{
		window.find("GAMELAYER").find("NAME_GCMap").find("userFinder").RunScript("AI.AIController.AIEvent( 1004)");
		
		// TODO: 修改特效的名字, 目前的EffectName部分 SXD修改
		set window.find("GAMELAYER").find("NAME_GCMap").find("Serve_receive_BALL")
		{
			visible = false;
		}
		g_CanServe = false;
	}

	// 有人击中球, 会在newfly前面调用
	void GameEvent_SomeoneHitBall( userID, hitAct, trackID, trackSpeed)
	{

		var _VNet2DBRow = new VNet2DBRow
		{
			InitByInt(window.Tennis_Game,window.TrackInfo,window.Tennis_Game_TrackInfo_trackID,trackID);
		}
		if ( _VNet2DBRow.IsReady() == 0 )
		{ 
			_VNet2DBRow.del();
			printf("sxd9=========MatchDBRow打开失败=======================");
			return;
		}

		var _StatSkill =_VNet2DBRow.GetData(window.TENNIS_GAME_TRACKINFO_STATSKILLTYPE);
		printf("sxd8玩家的_StatSkill值为："+_StatSkill);
		if (userID == window.GetMyUID() && _StatSkill ==0)
		{
			_speed = CountSpeed(trackID,trackSpeed);
			if (_speed == -1 )
			{
				window.find("VGame_Playing_S_UI").s_MaxSpeed.show = false;	
				window.find("VGame_Playing_D_UI").s_MaxSpeed.show = false;	
			}
			else
			{
				window.find("VGame_Playing_S_UI").s_MaxSpeed.s_MaxSectorSpeed.SetData(toint(_speed));
			    window.find("VGame_Playing_S_UI").s_MaxSpeed.show = true;
				window.find("VGame_Playing_D_UI").s_MaxSpeed.s_MaxSectorSpeed.SetData(toint(_speed));
			    window.find("VGame_Playing_D_UI").s_MaxSpeed.show = true;
			}
			
		}
		else
		{
				window.find("VGame_Playing_S_UI").s_MaxSpeed.show = false;		
				window.find("VGame_Playing_D_UI").s_MaxSpeed.show = false;		
		}
		_VNet2DBRow.del();
	}

	// 有人击球(未击中, 只是有动作)
	void GameEvent_SomeoneHit( userID, hitAct, trackID, trackSpeed)
	{
//		window.find("NAME_GCMap").find("userFinder").RunScript("AI.AIController.AIEvent( 1002)");

		//----------拯救笨蛋 老虎添加----------
		if ( BD_HELP == 1) {window.BD_SomeoneHit( userID, hitAct);}//传递击球信息
		
		var _fulltime = RoleFullTime();
		var _sectortime = window.find("GAMELAYER").find("NAME_GCMap").find("IAMISSELF").parent.find("Logic").GetCurPowerStoreTime();
	     printf("sxd8得到的当前蓄力值为："+_sectortime);
		 //alert("_fulltime="+_fulltime+"_sectortime"+_sectortime);
		 if (userID == window.GetMyUID())
		 {
			 window.find("VGame_SectorTime").SetData(_sectortime,_fulltime);
		 }
		 
		
	}

	

	//var _groundinfo = window.JudgeGroundInfo();
	var xishu2 = 0;	//装备了属性卡后增加的击球最远落点
	var xishu = 0; //装备了属性卡后能打到的击球最远落点
	var xishu3 = 0; //将左右最远落点综合平均一下
	var xishu4 = 0; //左半场的落点为负的，这里给它变成负的
	void GameEvent_Move( posX, posY, posZ)//角色移动
	{
		var _absposZ = tofloat(posZ);//6.4 前后场
		if(_absposZ>0){_absposZ = _absposZ*(-1);} //场地对换后，人物坐标翻转
		printf("OOXX posZ:" + _absposZ);		
		if ( _absposZ < -6.6)
		{
			xishu2 = tofloat(window._getBackAttr)*0.0055;
		}
		if ( _absposZ > -6.6 )
		{
			xishu2 = tofloat(window._getfrontAttr )*0.0055;
		}
		
		xishu = 1.65+xishu2;
		xishu3 = (3.3+xishu)/2;
		xishu4 = xishu3*(-1);

		radian = tofloat(window.g_CBallAngle.GetRadianOfThreePoint(xishu4,4.5,xishu3,4.5,posX,_absposZ));
		if ( g_CanServe == false || servepeopleID != window.GetMyUID())
		{
			window.find("VGame_Sector").Comp_Angle(radian);
		}
		
	}
	Load("$./MyCoreLogic.gml");
}