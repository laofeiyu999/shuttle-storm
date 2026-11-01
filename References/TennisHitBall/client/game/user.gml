import("$./coreLogic.gml");
import("$./../designerscript/SkillConsume/tennisskill.gml");//技能消耗
import("$./../effect/effect.gml");					// 特效对象
import("$./Pick.gml");								// 拾取
import("$./PingFrame.gml");						// ping显示窗口

class ShadowModel fmodel
{
//	ShowBox = true;
	name = "playerShadow";
	//src="$./../model/playerShadow.v3f";
};
class BallShadow fmodel
{
	name = "shadow";
	src="$./../model/ballshadow.v3f";
};

//脚下光圈-自己
class ApertureModel fmodel
{
	name = "_SXD";
	src = "$./../model/guangquan.v3f";
	pos="0,0.038,0.5";
	scale="2,2,2";
	setShader("add_texture.fx");
};

//光圈
class ApertureModel fmodel
{
	name = "_SXD";
	src = "$./../model/guangquan.v3f";
	pos="0,0.038,0.5";
	scale="2,2,2";
	setShader("add_texture.fx");
};

//头上名字
class VUserNkName text3d
{	
	name = "nkname";
	font("幼圆",21,42,true);
	scale="0.15,0.15,0.15"; 
	color="#e200f6";
	bold = true;
	pos="0,1.87,0";
	new item{name = "nkname_item";}
};

//class BaseBody CGameBody
//{
//	AutoNetFunToAllSub(1);
//
//	//别人发球的图片
//	var Serve_BALL = new fmodel
//	{
//		name = "Serve_BALL";
//		src = "$./../model/faqiu.v3f";
//		pos="0,2.3,0";
//		setShader("default.fx");
//		LinkModel(parent);
//		show = false;
//	}
//
//	new MFSM{name="FSM";/*SetUserId(1);SETBODYID(1,"a001");*/}												// 状态机接口
//	new PhyBody{name = "PhyBody";}
//	new PosMgr{name="POSMGR";/*SetUserId(1);SETBODYID(1,"a001");*/}
//	var posUpdater = new PosUpdater{name="PosUpdater";/*AddUpdateDes("Action")*/}								// 位置更新
//	new V3Action{name="Action"; SetUserPath="$./../../client/user/"; CartoonRender(window.g_CartoonRender);/*SETBODYID(1);*/};		// 动作管理接口
//	var SerMGR = new SerialMgr{name="SerMGR"};
//
//	var Logic = new CoreLogic
//	{
//		name="Logic";
//		SetEnergy(0);								// 设置当前的能量
//		SetMaxStamina(200);
//	};
//
//	new CIfUser{name="ifuser";};	
//};

class VmlGCSelf CGameBody
{
	name = "GameBody";
	AutoNetFunToAllSub(1);
	new item{name = "IAMISSELF";}
	
	//自己看到：自己的名字
	var nkname = new VUserNkName
	{
		color="#e200f6";
		src = window.GetMyName();
	}

	var Serve_BALL = new fmodel
	{
		name = "Serve_BALL";
		src = "$./../model/faqiu.v3f";
		pos="0,2.3,0";
		setShader("default.fx");
		LinkModel(parent);
		show = false;
	}

	//脚下光圈-自己
	var _SXD = new ApertureModel{}

	new IfKeyboard{name="IFKEY";/*SETBODYID(1,"a001");*/SETKeyboardtype(0);}					// 键盘接口
	new GCSelf{name="self"};
	new V3Action{name="Action"; SetUserPath="$./../../client/user/"; CartoonRender(window.g_CartoonRender);/*SETBODYID(1);*/};		// 动作管理接口
	new PosMgr{name="POSMGR";/*SetUserId(1);SETBODYID(1,"a001");*/SelfSet("true")/*吐血,无参报错*/;}
	new MFSM{name="FSM";/*SetUserId(1);SETBODYID(1,"a001");*/}												// 状态机接口
	new PhyBody{name = "PhyBody";}
	new Security{name = "Security";}
	var posUpdater = new PosUpdater{name="PosUpdater";/*AddUpdateDes("Action")*/}								// 位置更新
//	var _p2p=new p2pPlug{isself=true;name="p2p";setPingDelay(100); moveIndexOfParent(18);}
//	new ShadowEffect
//	{
//		name="shadowEffect"; 
//		SetUserPath("$./../../client/user/");
//		SetEffectNum( 3);							// 有几个残影
//		SetInterval( 50);							// 残影间的时间间隔
//		SetTotalTime( 3000);						// 残影总时长
//	}

	var SerMGR = new SerialMgr{name="SerMGR"};
	var Logic = new CoreLogic
	{
		name="Logic";
		SetCharType( 1);
		SetEnergy(0);								// 设置当前的能量
//		SetMaxStamina(200);
		if ( window.g_SingleMode == 1 )
		{
			LockEnergy();SetEnergy(100);
		}
	};
	var SkillMgr = new TennisSkill
	{
		name="skill";		
		void ScriptInit()
		{
			add(104);
			add(204);
			add(404);
			add(504);
			add(601);
		}

		void testFun( args1, args2)
		{
			return 1;
		}
	};

	new CIfUser{name="ifuser";};

	new PosUpdater	// 光圈-自己位置更新
	{
		ResetUpdateSrc("Action");
		AddUpdateDes("_SXD");
		SetUpdateStyle( 4);
	}	
	
	new RegionTest
	{
		name = "RegionTest";
		if( window.g_SingleMode == 1) CheckMove(false);//单机版不检查移动
		LoadRegion(1);
		SetState(99);
		if ( window.g_userID == 1 ) SetRolePos();	//房主调用
	}
	
	new RequestMonitor
	{
		SetNetMsgMethod(2);//定制发消息类型;1使用too()发消息，2使用tos()发消息
		SetMonitorTable(window.GAMEUI,window.REQUEST_CHAT_GAME);	//设置需要监视的数据表
	}
	
	new RequestMonitor//竞技商场
	{
		SetNetMsgMethod(2);											//定制发消息类型;1使用too()发消息，2使用tos()发消息
		SetMonitorTable(window.GAMEUI,window.REQUEST_SHOP_ARENA);	//设置需要监视的数据表
	}
	
	//监视自己的发球状态
	var _VNet2DBRow2 = new VNet2DBRow
	{
		void InitDB(rid)
		{
			printf("B# 发球-监视自己的发球状态:InitDB（）:"+rid);
			InitByInt(window.M_G_CLINET,window.GAMESHOW,0,rid,1);
			AddDBEvent("OnDataChange",0,26);
		}
		//索引，0角色ID
		//26 ServeEvent: 发球事件 0:默认 1:开始发球 2:发球结束 3:准备发球
		void OnDataChange(index,rid,ServeEvent)
		{
			printf("B# 发球-监视自己的发球状态-0:默认 1:开始发球 2:发球结束 3:准备发球 OnDataChange:index:"+index+",rid:"+rid+",ServeEvent:"+ServeEvent);
			printf("B# 发球-当前自己的界面位置："+window.GetUIPos());
			if(window.IsUIPos(window.POS_GAME))
			{
				if (ServeEvent == 3)
				{
					parent.find("Serve_BALL").show = true;
				}
				if (ServeEvent == 2)
				{
					parent.find("Serve_BALL").show = false;
				}
			}
		}
	}

	var m_Room_userNum = 0;

	//自己初始化后程序调用脚本的函数
	void SelfInit(userid)
	{
		printf("B# <何方志>:VmlGCSelf-SelfInit-房间:"+userid);
		_VNet2DBRow2.InitDB(window.GetMyRID());

		window.g_Room_userNum = userid;
		window.g_AllPlayersNum += 1;
		window.g_AllPlayersUID[window.g_AllPlayersNum-1] = userid;
		m_Room_userNum = window.g_Room_userNum;
		window.g_Room_tempUserName = window.GetNameByUID(userid);
//		printf("www:g_Room_userNum:"+window.g_Room_userNum+","+window.g_Room_tempUserName);
		set window.find("GAMELAYER")
		{
			window.find("VRoleModel_Info_Logic_Name_"+window.g_Room_userNum).del();
			new VRoleModel_Info_Logic
			{
				SetName(window.g_Room_userNum);
				SetUserName(""+window.GetQualifyShowNameByUID()+"  "+window.g_Room_tempUserName);
				SetLoverName(""+window.GetCurrLoverNkName(userid));
//				printf("www 111"+window.g_Room_tempUserName+","+userid+","+window.GetCurrLoverNkName(userid))
			}
		}
	}

	void OnDelete()
	{
		window.find("TOPLAYER").find("VRoleHang_Logic").del();
		window.find("VRoleModel_Info_Logic_Name_"+m_Room_userNum).del();
	}

	//站位好了 程序调用
	void RoleStationOver(userid){}

	inclass("MouseCapture");
	var m_PickUID = 0;		//标示唯一点选用的

	void OnMouseEnter() //当鼠标移上去时显示
	{
		if ( window.g_roomenu == 1){return;}
		find("nkname").color="#ff00ff";
		//find("_SXD1").show = true;

		if(window.GetUIPos() != window.POS_ROOM || !window.g_RoomHangInfoYesOrNo)
		{
			window.cursor = window.CURSOR_ARROW;
			//2010年9月21日 有BUG 上面有遮罩的时候 还是你呢个有悬停
			return;
		}
		window.find("TOPLAYER").find("VRoleHang_Logic").del();
		set window.find("TOPLAYER")
		{
			//创建悬浮信息提示框
			new VRoleHang_Logic
			{
			}
		}
		window.find("TOPLAYER").find("VRoleHang_Logic").ReadDataFromDB(window.GetMyUID());
	}

	void OnMouseLeave()  //当鼠标离开时不显示
	{
		find("nkname").color="#ff";
		//find("_SXD1").show = false;
		//删除悬浮信息提示框
		window.find("TOPLAYER").find("VRoleHang_Logic").del();
	}
	
	//lr : 11是左键 12是右键
	void OnMouseClick(lr) //当鼠标点击
	{
		var _UID = window.find("NAME_GCMap").find("MgrPicking").m_CurrItem;
		//printf("OnMouseClick:lr:"+lr+",_UID:"+_UID+",m_PickUID:"+m_PickUID);
		if (_UID == 0)
		{
			find("_SXD1").show = true;
			window.find("NAME_GCMap").find("MgrPicking").m_CurrItem = m_PickUID;
			//return;
		}
		else 
		{
			if (_UID == m_PickUID) //之前就是点的自己
			{
				find("_SXD1").show = false;
				window.find("NAME_GCMap").find("MgrPicking").m_CurrItem = 0;
			}
			else
			{
//				window.find("NAME_GCMap").FindGameBodyByUserID(_UID).find("_SXD1").show = false;
				window.find("NAME_GCMap").FindGameBodyByUserID(_UID).OnMouseUnClick(_UID);
				find("_SXD1").show = true;
				window.find("NAME_GCMap").find("MgrPicking").m_CurrItem = m_PickUID;
			}
		}
		if(lr == 12)
		{
			//删除悬浮信息提示框
			window.find("TOPLAYER").find("VRoleHang_Logic").del();
			RMouseMenu(window.GetMyUID());
			return;
		}
		
	}
	//右键菜单
	void RMouseMenu(_UID)
	{
		if(window.GetUIPos() == window.POS_GAME || window.GetUIPos() == window.POS_TRAINING)
		{
			return;
		}
		set window.find("TOPLAYER")
		{
			new VMyMouseR_Social
			{
				window.g_roomenu = 1;
				//printf("OnMouseClick:_UID "+_UID );
				window.g_Row.InitByInt(window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_UID,_UID);
				if(!window.g_Row.IsReady())
				{
					window.g_Row.Release();
					return window.DB_ERR;
				}
				var _UserID = window.g_Row.GetData(window.M_G_SERVER_USERDT_UID);	//玩家ID
				var _NkName = window.g_Row.GetData(window.M_G_SERVER_USERDT_NKNAME); //玩家昵称
				var _RoleID = window.g_Row.GetData(window.M_G_SERVER_USERDT_RID); //玩家角色ID
				var _State = window.g_Row.GetData(window.M_G_SERVER_USERDT_GAMESTA); //游戏状态 0断线 1空闲中 2房间内 3游戏中
				var _RoomID = window.g_Row.GetData(window.M_G_SERVER_USERDT_DID); //房间ID
				window.g_Row.Release();

				DelBub(m_Index_AddToPartnerList);
				DelBub(m_Index_MakePartner);
				DelBub(m_Index_CancelCurPartner);
				DelBub(m_Index_DelPartner);

				if (_State != 2 || window.GetMyState() != 1 )
				{
					SetState(m_Index_GotoRoom,0);
				}

				if (_UserID == window.GetMyUID())//对自己的操作
				{
					SetState(m_Index_Private,0);
					SetState(m_Index_AddFriend,0);
					SetState(m_Index_GotoRoom,0);
					SetState(m_Index_AddBlacklist,0);
					SetState(m_Index_PresentFlower,0);
					SetState(m_Index_AskaddFamily,0);
				}
				//点击了私聊
				void On_Private(data)
				{
					window.OnClick_PrivateChat(_NkName);
				}
				//点击了查看信息
				void On_LookInfo(data)
				{
					//设置要查看的个人信息数据-打开个人信息界面前必须调用
					//参数：UID,昵称，RoleID
					window.SetSelfInfoData(_UserID,_NkName,_RoleID);
				}
				//点击了加为好友
				void On_AddFriend(data)
				{
					window.AddFriend(_NkName);
				}
				//点击了前往房间
				void On_GotoRoom(data)
				{
					//获得用户的房间号 2009年2月4日
					window.Too_GetUserDid(""+_NkName);
				}
				//点击了加入黑名单
				void On_AddBlacklist(data)
				{
					window.AddBlacklist(_NkName);
				}
				//点击了复制昵称
				void On_CopyName(data)
				{
					window.setClipBoardData(_NkName);
				}
				//点击了献花
				void On_PresentFlower(data)
				{
					window.GamePresentFlower(_NkName);
				}
				//邀请加入家族
				void On_AskaddFamily()
				{
					window.F_Family_Askadd(_NkName);
				}
			}
		}
	}
	
	new item
	{
		//任务对动作的事件操作 
		name = "SXD_TaskAct";

		//[功能]播动作后调用（库a001user.mdb 表state_act 字段prc_s）
		//[参数]actid:动作ID
		//2010年9月28日
		void DbCall_PalyAction(actid)
		{
			parent.parent.___BodyPalyAction(window.GetMyUID(),actid);
		}
	}
	new item
	{
		var _Bind = new VN2DbFieldBinding
		{
			//SetBindingIndex(window.M_G_SERVER_USERDT_NKNAME);
			BindingByInt=""+window.M_G_SERVER+","+window.USERDT+","+window.M_G_SERVER_USERDT_UID+","+window.GetMyUID()+","+window.M_G_SERVER_USERDT_NKNAME;
		};

		void OnDataExchange(data)
		{
			//alert("OnDataExchange2 data="+data+",index="+index);
			window.find("VRoleModel_Info_Logic_Name_"+window.GetMyUID()).SetUserName(""+window.GetQualifyShowNameByUID()+"  "+data);
		}
	}
}

class VmlActionBugle CGameBody
{
	AutoNetFunToAllSub(1);
	new item{name = "IAMISCHAT";}

	//自己看到：别人的名字
	var nkname = new VUserNkName
	{
		color="#ff";
		LinkModel(parent);
	}

	new GCChat(name="user");
	new V3Action
	{
		name="Action"; 
		SetUserPath="$./../../client/user/"; 
		CartoonRender(window.g_CartoonRender);

		void OnDelete()
		{
			parent.MouseCapture_MgrRemove( this);
	//		alert("ChatDel.");
		}
	};		// 动作管理接口

	new PosMgr{name="POSMGR";/*SetUserId(2);SETBODYID(2,"a001");*/}
	new MFSM{name="FSM";}							// 状态机接口

	new PhyBody{name = "PhyBody";/*SETBODYID(2);*/}
//	var _p2p=new p2pPlug{name="p2p";setPingDelay(100); moveIndexOfParent(18);}
//	new ShadowEffect
//	{
//		name="shadowEffect"; 
//		SetUserPath("$./../../client/user/");
//		SetEffectNum( 3);
//		SetInterval( 50);
//		SetTotalTime( 10000);
//	}

//	var testModel = new fmodel
//	{
//		name = "TestModel";
//		src="$./../model/box.v3f";
//	}
//	new ShadowEffect{name="ShadowEffect"; SetUserPath="$./../../client/user/";}

	var SerMGR = new SerialMgr{name="SerMGR"};
	var Logic = new CoreLogic
	{
		name="Logic";
		SetEnergy(0);	//设置当前的能量
//		SetMaxStamina(200);
	};

	new CIfUser{name="ifuser";};

	new RegionTest
	{
		name = "RegionTest";
		if( window.g_SingleMode == 1 ) CheckMove(false);//单机版不检查移动
		LoadRegion(1);
		SetState(99);
		if ( window.g_userID == 1 ) SetRolePos();	//房主调用
	}
	void OnDelete()
	{
		group.ChatDel();
		window.find("VRoleModel_Info_Logic_Name_"+m_Room_userNum).del();
		window.find("TOPLAYER").find("VRoleHang_Logic").del();
//		MouseCapture_MgrRemove();
//		alert("ChatDel.");
	}

	//监视别人的换装
	var _VNet2DBRow = new VNet2DBRow
	{
		void InitDB(rid)
		{
			printf("B# 监视别人的换装:InitDB（）:"+rid);
			InitByInt(window.M_G_SERVER,window.ROLEDT,0,rid,1);
			AddDBEvent("OnDataChange",0,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36);
		}
		//索引，0角色ID,22AwtorId0 ......
		void OnDataChange(index,rid,av0,av1,av2,av3,av4,av5,av6,av7,av8,av9,av10,av11,av12,av13,av14)
		{
			printf("OnDataChange:index:"+index+",rid:"+rid);
			if (index >= 22 && index <= 36)
			{
				parent.find("Action").SETBODYID(rid);//房间里别的人
			}
		}
	}
	//监视别人的发球状态
	var _VNet2DBRow2 = new VNet2DBRow
	{
		void InitDB(rid)
		{
			printf("B# 发球-监视别人的发球状态:InitDB（）:"+rid);
			InitByInt(window.M_G_CLINET,window.GAMESHOW,0,rid,1);
			AddDBEvent("OnDataChange",0,26);
		}
		//索引，0角色ID
		//26 ServeEvent: 发球事件 0:默认 1:开始发球 2:发球结束 3:准备发球
		void OnDataChange(index,rid,ServeEvent)
		{
			printf("B# 发球-监视别人的发球状态-0:默认 1:开始发球 2:发球结束 3:准备发球 OnDataChange:index:"+index+",rid:"+rid+",ServeEvent:"+ServeEvent);
			printf("B# 发球-当前别人的界面位置："+window.GetUIPos());
			if(window.IsUIPos(window.POS_GAME))
			{
				if (ServeEvent == 3)
				{
					parent.find("Serve_BALL").show = true;
				}
				if (ServeEvent == 2)
				{
					parent.find("Serve_BALL").show = false;
				}
			}
		}
	}
	var m_PickUID = 0;		//标示唯一点选用的
	var m_Room_userNum = 0;
	//chat初始化后程序调用脚本的函数
	void ChatInit(userid)
	{
		window.Tos_CheckLoverID(userid);//发送查询情侣消息
		m_PickUID = userid;
		find("nkname").show = false;
		find("Action").show = false;
		find("playerShadow").show = false;
		find("nkname").src = window.GetNameByUID(userid);
		_VNet2DBRow.InitDB(window.GetRIDByUID(userid));
		_VNet2DBRow2.InitDB(window.GetRIDByUID(userid));
		find("user").AskSelfSynPos();

		window.g_Room_userNum = userid;
		window.g_AllPlayersNum += 1;
		window.g_AllPlayersUID[window.g_AllPlayersNum-1] = userid;
		m_Room_userNum = window.g_Room_userNum;
		window.g_Room_tempUserName = window.GetNameByUID(userid);//printf("www:g_Room_userNum:"+window.g_Room_userNum+","+window.g_Room_tempUserName);
		set window.find("GAMELAYER")
		{
			window.find("VRoleModel_Info_Logic_Name_"+window.g_Room_userNum).del();
			new VRoleModel_Info_Logic
			{
				var m_memid=window.g_Room_userNum;
				var m_memusername = window.g_Room_tempUserName;
				SetName(window.g_Room_userNum);
				SetUserName(""+window.GetQualifyShowNameByNkNAme(window.g_Room_tempUserName)+"  "+window.g_Room_tempUserName);
				var _Bind = new VN2DbFieldBinding
				{
					//SetBindingIndex(window.M_G_SERVER_USERDT_NKNAME);
					BindingByInt=""+window.M_G_SERVER+","+window.USERDT+","+window.M_G_SERVER_USERDT_UID+","+parent.m_memid+","+window.M_G_SERVER_USERDT_NKNAME;
				};

				void OnDataExchange(data)
				{
					//alert("OnDataExchange2 data="+data+",index="+index);
					window.find("VRoleModel_Info_Logic_Name_"+m_memid).SetUserName(""+window.GetQualifyShowNameByNkNAme(window.g_Room_tempUserName)+"  "+data);
				}
				
//				var relationkeyid = window.GetCurrLoverKeyID(userid);
//				var _CurrLoverNkName = window.GetCurrLoverNkName(userid);
//				SetLoverName(""+_CurrLoverNkName);
				
				sleep(500);//等500等待情侣查寻信息同步过来
				var _VNet2DBTable=new VNet2DBTable
				{
					var LName  = 0;
					var LSName  = 0;
					var LBUID  = 0;
					var LSUID  = 0;
					void GetDataLover(_LName,_LSName,_BUID,_SUID)
					{
						if (_BUID == parent.m_memid || _SUID == parent.m_memid)
						{
							LName = _LName;
							LSName = _LSName;
							LBUID  = _BUID  ;
							LSUID  = _SUID  ;
						}	
					}
				};
				var _sqlL = "SELECT * FROM "+window.RELATION+" WHERE "+window.M_G_SERVER_RELATION_WCOUPLE_STR+"=1";
				_VNet2DBTable.Select( window.M_G_SERVER,_sqlL);
				_VNet2DBTable.ReadData("GetDataLover",""+window.M_G_SERVER_RELATION_NKNAME+","+window.M_G_SERVER_RELATION_SNKNAME+","+
				window.M_G_SERVER_RELATION_BID+","+window.M_G_SERVER_RELATION_SID);
				if ( m_memusername == _VNet2DBTable.LName)
				{
					SetLoverName(""+_VNet2DBTable.LSName); 
				}
				else
				{	SetLoverName(""+_VNet2DBTable.LName);}
//				printf("www 222"+window.g_Room_tempUserName+","+userid+","+_VNet2DBTable.LSName+",OR"+_VNet2DBTable.LName);
			}
		}
	}
	void ShowSelf()
	{
		find("nkname").show = true;
		find("Action").show = true;
		find("playerShadow").show = true;
	}
	void HideSelf()
	{
		find("nkname").show = false;
		find("Action").show = false;
		find("playerShadow").show = false;
		find("_SXD1").show = false;
	}
	//站位好了 程序调用
	void RoleStationOver(userid)
	{
		if (window.g_ArenaJoinRoom) return;
		timer(1000,"ShowSelf");
	}

	var playerShadow = new ShadowModel
	{
	};
	var posUpdaterShadow = new PosUpdater	// 位置更新
	{
		ResetUpdateSrc("Action");
		AddUpdateDes("playerShadow");
		SetUpdateStyle( 1);
	}		
}

//镜像人物模型
class VmlGCChat VmlActionBugle 
{
//	_SXD1.del();
//	posUpdater.del();
//	sxdPosUpdater.del();
	//脚下光圈-别人
	var _SXD1 = new fmodel
	{
		name = "_SXD1";
		src = "$./../model/guanghuan.v3f";
		pos="0.03,0.03,0.28";
		scale="1.6,1.6,1.6";
		setShader("add_texture.fx");
		//LinkModel(parent);
		show = false;
	}
	var posUpdater = new PosUpdater{name="PosUpdater"; /*AddUpdateDes("Action")*/}								// 位置更新

		var sxdPosUpdater = new PosUpdater	// 光环-别人位置更新
	{
		ResetUpdateSrc("Action");
		AddUpdateDes("_SXD1");
		SetUpdateStyle( 4);
	}	

	inclass("MouseCapture");

	void OnMouseEnter() //当鼠标移上去时显示
	{
		if ( window.g_roomenu == 1){return;}
		
		find("nkname").color="#ff00ff";
		//find("_SXD1").show = true;
		
		if(window.GetUIPos() != window.POS_ROOM || !window.g_RoomHangInfoYesOrNo)
		{
			window.cursor = window.CURSOR_ARROW;
			//2010年9月21日 有BUG 上面有遮罩的时候 还是你呢个有悬停
			return;
		}
		window.find("TOPLAYER").find("VRoleHang_Logic").del();
		set window.find("TOPLAYER")
		{
			new VRoleHang_Logic
			{
				
			}
		}
		//创建悬浮信息提示框（其他玩家）
		window.find("TOPLAYER").find("VRoleHang_Logic").ReadDataFromDB(m_PickUID);
	}

	void OnMouseLeave()  //当鼠标离开时不显示
	{
		find("nkname").color="#ff";
		//find("_SXD1").show = false;
		//删除悬浮信息提示框
		window.find("TOPLAYER").find("VRoleHang_Logic").del();
	}
	
	//lr : 11是左键 12是右键
	void OnMouseClick(lr) //当鼠标点击
	{
		var _UID = window.find("NAME_GCMap").find("MgrPicking").m_CurrItem;
		//printf("OnMouseClick:lr:"+lr+",_UID:"+_UID+",m_PickUID:"+m_PickUID);
		if (_UID == 0)
		{
			find("_SXD1").show = true;
			window.find("NAME_GCMap").find("MgrPicking").m_CurrItem = m_PickUID;
			//return;
		}
		else 
		{
			if (_UID == m_PickUID) //之前就是点的自己
			{
				find("_SXD1").show = false;
				window.find("NAME_GCMap").find("MgrPicking").m_CurrItem = 0;
			}
			else
			{
//				window.find("NAME_GCMap").FindGameBodyByUserID(_UID).find("_SXD1").show = false;
				window.find("NAME_GCMap").FindGameBodyByUserID(_UID).OnMouseUnClick(_UID);
				find("_SXD1").show = true;
				window.find("NAME_GCMap").find("MgrPicking").m_CurrItem = m_PickUID;
			}
		}
		if(lr == 12)
		{
			//删除悬浮信息提示框
			window.find("TOPLAYER").find("VRoleHang_Logic").del();
			RMouseMenu(m_PickUID);
			return;
		}
		
	}
	//右键菜单
	void RMouseMenu(_UID)
	{
		if(window.GetUIPos() == window.POS_GAME || window.GetUIPos() == window.POS_TRAINING)
		{
			return;
		}
		set window.find("TOPLAYER")
		{
			new VMyMouseR_Social
			{
				window.g_roomenu = 1;
				//printf("OnMouseClick:_UID "+_UID );
				window.g_Row.InitByInt(window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_UID,_UID);
				if(!window.g_Row.IsReady())
				{
					window.g_Row.Release();
					return window.DB_ERR;
				}
				var _UserID = window.g_Row.GetData(window.M_G_SERVER_USERDT_UID);	//玩家ID
				var _NkName = window.g_Row.GetData(window.M_G_SERVER_USERDT_NKNAME); //玩家昵称
				var _RoleID = window.g_Row.GetData(window.M_G_SERVER_USERDT_RID); //玩家角色ID
				var _State = window.g_Row.GetData(window.M_G_SERVER_USERDT_GAMESTA); //游戏状态 0断线 1空闲中 2房间内 3游戏中
				var _RoomID = window.g_Row.GetData(window.M_G_SERVER_USERDT_DID); //房间ID
				window.g_Row.Release();

//				if(_UserID!=window.GetMyUID())
//				{
//					if(window.GetPartnerNameById(_UserID)=="")//无搭档
//					{
//						DelBub(m_Index_MakePartner);
//						DelBub(m_Index_CancelCurPartner);
//						DelBub(m_Index_DelPartner);
//					}
//					else
//					{
//						if(window.GetMyCurPartnerId() == _UserID)//是当前搭档
//						{
//							DelBub(m_Index_AddToPartnerList);
//							DelBub(m_Index_MakePartner);
//							DelBub(m_Index_DelPartner);
//						}
//						else									//只是是搭档
//						{
//							DelBub(m_Index_AddToPartnerList);
//							DelBub(m_Index_CancelCurPartner);
//						}
//					}
//				}
//				else
//				{
					DelBub(m_Index_AddToPartnerList);
					DelBub(m_Index_MakePartner);
					DelBub(m_Index_CancelCurPartner);
					DelBub(m_Index_DelPartner);
//				}
				if (_State != 2 || window.GetMyState() != 1 )
				{
					SetState(m_Index_GotoRoom,0);
				}

				if (_UserID == window.GetMyUID())//对自己的操作
				{
					SetState(m_Index_Private,0);
					SetState(m_Index_AddFriend,0);
					SetState(m_Index_GotoRoom,0);
					SetState(m_Index_AddBlacklist,0);
					SetState(m_Index_PresentFlower,0);
					SetState(m_Index_AskaddFamily,0);
				}
				//点击了私聊
				void On_Private(data)
				{
					window.OnClick_PrivateChat(_NkName);
				}
				//点击了查看信息
				void On_LookInfo(data)
				{
					
					//设置要查看的个人信息数据-打开个人信息界面前必须调用
					//参数：UID,昵称，RoleID
					window.SetSelfInfoData(_UserID,_NkName,_RoleID);
				}
				//点击了加为好友
				void On_AddFriend(data)
				{
					window.AddFriend(_NkName);
				}
				//点击了前往房间
				void On_GotoRoom(data)
				{
					//获得用户的房间号 2009年2月4日
					window.Too_GetUserDid(""+_NkName);
				}
				//点击了加入黑名单
				void On_AddBlacklist(data)
				{
					window.AddBlacklist(_NkName);
				}
				//点击了复制昵称
				void On_CopyName(data)
				{
					window.setClipBoardData(_NkName);
				}
				//点击了献花
				void On_PresentFlower(data)
				{
					window.GamePresentFlower(_NkName);
				}
				//邀请加入家族
				void On_AskaddFamily()
				{
					window.F_Family_Askadd(_NkName);
				}
			}
		}
	}
	void OnMouseUnClick(_UID) //当鼠标点击其他
	{
//		alert("撒旦阿斯顿:"+_UID);
		find("_SXD1").show = false;
	}

	new item
	{
		//任务对动作的事件操作 
		name = "SXD_TaskAct";

		//[功能]播动作后调用（库a001user.mdb 表state_act 字段prc_s）
		//[参数]actid:动作ID
		//2010年9月28日
		void DbCall_PalyAction(actid)
		{
			parent.parent.___BodyPalyAction(parent.m_PickUID,actid);
		}
	}
}

// 网络初始化简化类名
class _VGC VmlGCChat
{
};

class VmlGCAI CGameBody
{
	name = "GameBody";
//	AutoNetFunToAllSub(1);
	new item{name = "IAMISAI";}
//	new GCChat(name="user");
	new GCSelf{name="self"};

	AutoNetFunToAllSub(1);

	//别人发球的图片
	var Serve_BALL = new fmodel
	{
		name = "Serve_BALL";
		src = "$./../model/faqiu.v3f";
		pos="0,2.3,0";
		setShader("default.fx");
		LinkModel(parent);
		show = false;
	}

	////自己看到：自己的名字
	//new text3d
	//{	
		//name = "nkname";
		////font="宋体,-1,20"; 
		//font("幼圆",21,42,true);//楷体_GB2312 幼圆
		//scale="0.15,0.15,0.15"; 
		//color="#e200f6";
		//bold = true;
		//LinkModel(parent);
		//pos="0,1.9,0";
////		src = window.GetNameByUID(userid);
	//};

//	new MFSM{name="FSM";/*SetUserId(1);SETBODYID(1,"a001");*/}												// 状态机接口
	new AIController{ name="AIController"; IsInUse( 1);}
	new TTInput2{ name ="SimKey";}
	new IfKeyboard{name="IFKEY";/*SETBODYID(1,"a001");*/SETKeyboardtype(0);}					// 键盘接口
//	var _p2p=new p2pPlug{isself=true;name="p2p";setPingDelay(100); moveIndexOfParent(18);}
//	new ShadowEffect
//	{
//		name="shadowEffect"; 
//		SetUserPath("$./../../client/user/");
//		SetEffectNum( 3);							// 有几个残影
//		SetInterval( 50);							// 残影间的时间间隔
//		SetTotalTime( 3000);						// 残影总时长
//	}
	var Logic = new CoreLogic
	{
		name="Logic";
		SetEnergy(0);								// 设置当前的能量
		SetMaxStamina(200);
	};
	var SerMGR = new SerialMgr{name="SerMGR"};

	new V3Action{name="Action"; SetUserPath="$./../../client/user/"; CartoonRender(window.g_CartoonRender);/*SETBODYID(1);*/};		// 动作管理接口
	new PosMgr{name="POSMGR";/*SetUserId(1);SETBODYID(1,"a001");*/}
	new MFSM{name="FSM";/*SetUserId(1);SETBODYID(1,"a001");*/}												// 状态机接口
	new PhyBody{name = "PhyBody";}
	var posUpdater = new PosUpdater{name="PosUpdater";/*AddUpdateDes("Action")*/}								// 位置更新
	
	new CIfUser{name="ifuser";};	

	find("POSMGR").SelfSet("true")/*吐血,无参报错*/;
	Logic.SetCharType( 2);
	if ( window.g_SingleMode == 1 )
	{
		Logic.LockEnergy();
		Logic.SetEnergy(100);
	}

	var SkillMgr = new TennisSkill
	{
		name="skill";		
		void ScriptInit()
		{
			add(104);
			add(204);
			add(404);
			add(504);
			add(601);
		}

		void testFun( args1, args2)
		{
			return 1;
		}
	};

	new RegionTest
	{
		name = "RegionTest";
		if( window.g_SingleMode == 1) CheckMove(false);//单机版不检查移动
		LoadRegion(1);
		SetState(99);
		if ( window.g_userID == 1 ) SetRolePos();	//房主调用
	}

//	new RequestMonitor
//	{
//		SetNetMsgMethod(2);//定制发消息类型;1使用too()发消息，2使用tos()发消息
//		SetMonitorTable(window.GAMEUI,window.REQUEST_CHAT);	//设置需要监视的数据表
//	}
//	
//	new RequestMonitor//竞技商场
//	{
//		SetNetMsgMethod(2);											//定制发消息类型;1使用too()发消息，2使用tos()发消息
//		SetMonitorTable(window.GAMEUI,window.REQUEST_SHOP_ARENA);	//设置需要监视的数据表
//	}

	//监视机器人的发球状态
	var _VNet2DBRow2 = new VNet2DBRow
	{
		void InitDB(rid)
		{
			printf("B# 监视机器人的发球状态:InitDB（）:"+rid);
			InitByInt(window.M_G_CLINET,window.GAMESHOW,0,rid,1);
			AddDBEvent("OnDataChange",0,26);
		}
		//索引，0角色ID
		//26 ServeEvent: 发球事件 0:默认 1:开始发球 2:发球结束 3:准备发球
		void OnDataChange(index,rid,ServeEvent)
		{
			printf("B# 监视机器人的发球状态-OnDataChange:index:"+index+",rid:"+rid+",ServeEvent:"+ServeEvent);
			printf("B# 当前界面位置："+window.GetUIPos());
			if(window.IsUIPos(window.POS_GAME))
			{
				if (ServeEvent == 3)
				{
					parent.find("Serve_BALL").show = true;
				}
				if (ServeEvent == 2)
				{
					parent.find("Serve_BALL").show = false;
				}
			}
		}
	}
	//自己初始化后程序调用脚本的函数
	void SelfInit(userid)
	{
		printf("B# <何方志>:VmlGCAI-SelfInit:"+userid);
		_VNet2DBRow2.InitDB(window.GetRIDByUID(userid));
	}

	//站位好了 程序调用
	void RoleStationOver(userid){}

	var playerShadow = new ShadowModel
	{
	};
	var posUpdaterShadow = new PosUpdater	// 位置更新
	{
		ResetUpdateSrc("Action");
		AddUpdateDes("playerShadow");
		SetUpdateStyle( 1);
	}	
}

class VmlGCBall CGameBody
{
//	printf( "new VmlGCBall");
	name = "GCBall";
//	scale( "5, 5, 5");
	new BallModel
	{
		name = "Ball";
//		var _replayclass="ReplayBallModel";
		var recodeUpdatePos=30;
		show = false;
	};
	new TrackMgr
	{ 
		var AutoSend = 0;			// 是否开启自动发球
		var SendID = 3;				// 自动发球发出的球的ID
		SetBallPower(10);			// 设置发出球的力量
		name = "TRACKMGR";
		MySetAvalible( 1);
		if( window.g_SingleMode == 1) AutoSend = 1;
	}
	new CIfUser
	{
		name="ifuser";
		if( window.g_SingleMode == 1) SetUserId(window.g_userID);
	};
	new CBallProperty{name = "BallProperty";}

	var shadow = new BallShadow{};
	
	var posUpdater = new PosUpdater{name="PosUpdater"; AddUpdateDes("Ball"); }			// 位置更新
	var posUpdaterShadow = new PosUpdater{name="PosUpdaterShadow"; AddUpdateDes("shadow"); SetUpdateStyle( 2);}			// 位置更新
	
	new RegionTest
	{
		name = "RegionTest";
		SetCurrMap( window.GetMyGameMapID() );
		LoadRegion(2);
	}

	void SetVisible( flag)
	{
		if( flag == 0)
		{
//			alert("HIDE ball");
			find("Ball").visible = false;
			find("shadow").visible = false;
		}
		else
		{
//			alert("SHOW ball");
			find("Ball").visible = true;
			find("shadow").visible = true;	
		}
	}
};

class VmlGCNPC CSNPCMgr
{
	name = "NPCMgr";

	void LoadNPC()
	{
		//索引 模型名字 模型高度 模型半径 (模型需要看成一个胶囊体)
		SetLookObj(1,"Ball",0.01,0.08);			//设置关注的物体
		SetLookObj(2,"GameBody0",1.6,0.2);
		SetLookObj(3,"GameBody1",1.6,0.2);
		SetLookObj(4,"GameBody2",1.6,0.2);
		SetLookObj(5,"GameBody3",1.6,0.2);
//		switch(window.GetMyGameMapID()){
//			case 1:
				LoadScriptFile("$./../npc/birdandround.gml");	//载入运行的脚本
//		}
	}
};