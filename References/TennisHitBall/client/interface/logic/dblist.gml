import("$./../mdb/dbdef.gml");

set window
{
	var cDBMemSign = new DBMemSign();
	cDBMemSign.AddToMemSign("m_g_clinet.mdb","AIGame",0,1);
	cDBMemSign.AddToMemSign("m_g_clinet.mdb","AIUser",0,1);
	cDBMemSign.AddToMemSign("m_g_clinet.mdb","effectdef",0,1);
	cDBMemSign.AddToMemSign("m_g_clinet.mdb","subeffect",0,1);
	cDBMemSign.AddToMemSign("m_g_clinet.mdb","shadercontrol",0,1);	//shader控制 对特殊的shader起作用
	cDBMemSign.AddToMemSign("m_g_clinet.mdb","parts",0,1);
	cDBMemSign.AddToMemSign("m_g_clinet.mdb","msgbox",0,1);
	cDBMemSign.AddToMemSign("m_g_clinet.mdb","inputconvers",7,1);
	cDBMemSign.AddToMemSign("m_g_clinet.mdb","interact",8,1);
	cDBMemSign.AddToMemSign("m_g_clinet.mdb","itemstate",11,1);
	cDBMemSign.AddToMemSign("m_g_clinet.mdb","ArrowDefine",0,1);
	cDBMemSign.AddToMemSign("m_g_clinet.mdb","cameradef",0,1);
	cDBMemSign.AddToMemSign("m_g_clinet.mdb","shortcutkey",0,1);
	cDBMemSign.AddToMemSign("m_g_clinet.mdb","itemdef",0,1);	//道具图标
	cDBMemSign.AddToMemSign("m_g_clinet.mdb","titledef",0,1);	//称号定义表
	cDBMemSign.AddToMemSign("m_g_clinet.mdb","condition",0,1);	//条件触发事件
	cDBMemSign.AddToMemSign("m_g_clinet.mdb","ccResult",0,1);		//触发事件的结果
	cDBMemSign.AddToMemSign("m_g_clinet.mdb","EquipSeries",0,1);	//套装定义
	cDBMemSign.AddToMemSign("m_g_clinet.mdb","GameEvent",0,1);	// 游戏事件
	cDBMemSign.AddToMemSign("m_g_clinet.mdb","EventCounter",0,1);	// 事件计数器
	cDBMemSign.AddToMemSign("m_g_clinet.mdb","RoomAct",0,1);	// 事件计数器
	cDBMemSign.AddToMemSign("m_g_clinet.mdb","Horn",0,1);	// 事件计数器

	cDBMemSign.AddToMemSign("game.mdb","BytePos",0,1);
	cDBMemSign.AddToMemSign("game.mdb","buffer",0,1);
	cDBMemSign.AddToMemSign("game.mdb","MapInfo",0,1);
//	cDBMemSign.AddToMemSign("game.mdb","Task",0,5);
//	cDBMemSign.AddToMemSign("game.mdb","PVE_Exp",0,1);
	cDBMemSign.AddToMemSign("game.mdb","PVP_Exp",0,1);
	cDBMemSign.AddToMemSign("game.mdb","PVP_Money",0,1);
	cDBMemSign.AddToMemSign("game.mdb","PVP_PK",0,1);
	cDBMemSign.AddToMemSign("game.mdb","PVP_Sp",0,1);
	cDBMemSign.AddToMemSign("game.mdb","GmCommand",0,1);
	cDBMemSign.AddToMemSign("game.mdb","ObjectEventDef",0,1);
	cDBMemSign.AddToMemSign("game.mdb","jz_level",0,1);
	cDBMemSign.AddToMemSign("game.mdb","LevelUp",0,1);
	cDBMemSign.AddToMemSign("game.mdb","TrainingUI",0,1);
	cDBMemSign.AddToMemSign("game.mdb","TaskUI",0,1);
	cDBMemSign.AddToMemSign("game.mdb","ObjectDef",0,1);
	cDBMemSign.AddToMemSign("game.mdb","Encourage",0,1);
	cDBMemSign.AddToMemSign("game.mdb","RankEncourage",0,1);

	cDBMemSign.AddToMemSign("m_g_goods.mdb","Award",0,1);
//	cDBMemSign.AddToMemSign("m_g_goods.mdb","ItemPack",0,1);	 // ==0
//	cDBMemSign.AddToMemSign("m_g_goods.mdb","ItemSet",0,1);	//	==0
	cDBMemSign.AddToMemSign("m_g_goods.mdb","Item_Class",0,1);
	cDBMemSign.AddToMemSign("m_g_goods.mdb","RandItem",0,1);
	cDBMemSign.AddToMemSign("m_g_goods.mdb","RandProp",0,1);
//	cDBMemSign.AddToMemSign("m_g_goods.mdb","NpcTypeInfo",0,1);
	cDBMemSign.AddToMemSign("m_g_goods.mdb","RoleInfo",0,1);
//	cDBMemSign.AddToMemSign("m_g_goods.mdb","items",0,1);			//所有的物品
	cDBMemSign.AddToMemSign("m_g_goods.mdb","ItemLimit",0,1);		//物品的种类(是否可以卖..)
	cDBMemSign.AddToMemSign("m_g_goods.mdb","ItemLevelUp",0,1);	//物品的等级升级
	cDBMemSign.AddToMemSign("m_g_goods.mdb","ItemAttUp",0,1);		//物品的属性升级
	cDBMemSign.AddToMemSign("m_g_goods.mdb","Synthetic",0,1);		//合成制造公式
//	cDBMemSign.AddToMemSign("m_g_goods.mdb","SupplyItem",0,1);	//支给物品	// ==0
//	cDBMemSign.AddToMemSign("m_g_goods.mdb","BoxInfo",0,1);		//宝箱信息
//	cDBMemSign.AddToMemSign("m_g_goods.mdb","BoxZone",0,1);		//宝箱RP区域设定
//	cDBMemSign.AddToMemSign("m_g_goods.mdb","BoxCollect",0,1);	//宝箱返回物品集合
//	cDBMemSign.AddToMemSign("m_g_goods.mdb","DropInfo",0,1);		//宝箱信息
	cDBMemSign.AddToMemSign("m_g_goods.mdb","DropZone",0,1);		//宝箱RP区域设定
	//cDBMemSign.AddToMemSign("m_g_goods.mdb","DropCollect",0,1);	//宝箱返回物品集合
	cDBMemSign.AddToMemSign("m_g_goods.mdb","SplitItems",0,1);	//拆分物品公式
	cDBMemSign.AddToMemSign("m_g_goods.mdb","InlayItem",0,1);	//拆分物品公式

	cDBMemSign.AddToMemSign("GameUI.mdb","LoadingTip",0,1);			// loading小提示
	cDBMemSign.AddToMemSign("GameUI.mdb","ArenaTipinfo",0,1);			// 竞技场公告
	cDBMemSign.AddToMemSign("GameUI.mdb","DIALOG",0,1);				// 提示框
	cDBMemSign.AddToMemSign("GameUI.mdb","CHAT_BROW",0,1); 		    // 聊天表情
	cDBMemSign.AddToMemSign("GameUI.mdb","Chat_Action",0,1); 		    // 聊天动作
	cDBMemSign.AddToMemSign("GameUI.mdb","UI",0,1);
	cDBMemSign.AddToMemSign("GameUI.mdb","SOUND_REGISTER",0,1);		//界面音效和背景音乐
	cDBMemSign.AddToMemSign("GameUI.mdb","InfoBoard",0,1);			//界面顶层的信息
	cDBMemSign.AddToMemSign("GameUI.mdb","TipInfo",0,1);				//物品提示信息
	cDBMemSign.AddToMemSign("GameUI.mdb","UIGuide",0,1);				//界面引导
	cDBMemSign.AddToMemSign("GameUI.mdb","UIGuideEx",0,1);			//界面引导-新 2009年10月25日
	cDBMemSign.AddToMemSign("GameUI.mdb","UIHelp",0,1);				//界面帮助
	cDBMemSign.AddToMemSign("GameUI.mdb","TaskScript",0,1);		//任务界面脚本
	cDBMemSign.AddToMemSign("GameUI.mdb","FamilyTipInfo",0,1);		//家族提示信息
	cDBMemSign.AddToMemSign("GameUI.mdb","FamilyPeopleContributeTip",0,1);	//家族成员积分累计提示】

	cDBMemSign.AddToMemSign("Tennis_Game.mdb","GamePath",0,1);		//游戏路径表
	cDBMemSign.AddToMemSign("Tennis_Game.mdb","GroundInfo",0,1);		//场地参数
	cDBMemSign.AddToMemSign("Tennis_Game.mdb","TrackInfo",0,1);		//轨迹文件
	cDBMemSign.AddToMemSign("Tennis_Game.mdb","TrackTypeInfo",0,1);	//轨迹类型数据文件
//	cDBMemSign.AddToMemSign("Tennis_Game.mdb","Notify",0,1);			//轨迹类型数据文件	//==0
	cDBMemSign.AddToMemSign("Tennis_Game.mdb","MapInfo",0,1);			//地图信息
	cDBMemSign.AddToMemSign("Tennis_Game.mdb","RegionCollision",0,1);	//碰撞描述
	cDBMemSign.AddToMemSign("Tennis_Game.mdb","RegionLimit",0,1);		//人物限制描述
	cDBMemSign.AddToMemSign("Tennis_Game.mdb","GameArgs",0,1);		//游戏参数
//	cDBMemSign.AddToMemSign("Tennis_Game.mdb","GameEvent",0,1);		//游戏事件
//	cDBMemSign.AddToMemSign("Tennis_Game.mdb","Train",0,1);			//训练
	cDBMemSign.AddToMemSign("Tennis_Game.mdb","Train_DLG",0,1);		//训练结束的对话框
	cDBMemSign.AddToMemSign("Tennis_Game.mdb","Train_Tip",0,1);		//训练中的对话框
	cDBMemSign.AddToMemSign("Tennis_Game.mdb","Qualify",0,1);			//称号
	cDBMemSign.AddToMemSign("Tennis_Game.mdb","InlinePresent",0,1);		//在线赠送礼品
	cDBMemSign.AddToMemSign("Tennis_Game.mdb","GameEndPresent",0,1);		//游戏结束时满足条件送礼物
	cDBMemSign.AddToMemSign("Tennis_Game.mdb","AllPresent",0,1);			//所有赠送的礼品
	cDBMemSign.AddToMemSign("Tennis_Game.mdb","VipSetting",0,1);			//Vip设置
	cDBMemSign.AddToMemSign("Tennis_Game.mdb","FamilyBadgeInfo",0,1);		//家族徽章图

	cDBMemSign.AddToMemSign("EventState.mdb","ConvertDef",0,1);		//切换定义
	cDBMemSign.AddToMemSign("EventState.mdb","EventDef",0,1);			//状态表
	cDBMemSign.AddToMemSign("EventState.mdb","InputDefine",0,1);		//输入定义

	cDBMemSign.AddToMemSign("AIEventState.mdb","ConvertDef",0,1);		//切换定义
	cDBMemSign.AddToMemSign("AIEventState.mdb","EventDef",0,1);			//状态表
	cDBMemSign.AddToMemSign("AIEventState.mdb","InputDefine",0,1);		//输入定义

	cDBMemSign.AddToMemSign("a001user.mdb","GameRule",0,1);
	cDBMemSign.AddToMemSign("a001user.mdb","state_act",0,1);
	cDBMemSign.AddToMemSign("a001user.mdb","keydef",4,1);
	cDBMemSign.AddToMemSign("a001user.mdb","inputrull",9,1);
	cDBMemSign.AddToMemSign("a001user.mdb","flagdef",1,1);
	cDBMemSign.AddToMemSign("a001user.mdb","attributeflag",1,1);
//	cDBMemSign.AddToMemSign("a001user.mdb","condition",1,1);		// ==0
	cDBMemSign.AddToMemSign("a001user.mdb","result",1,1);
	cDBMemSign.AddToMemSign("a001user.mdb","attackdef",20,1);
	cDBMemSign.AddToMemSign("a001user.mdb","PartPhysics",0,1);
	cDBMemSign.AddToMemSign("a001user.mdb","UpLevel",0,1);
	cDBMemSign.AddToMemSign("a001user.mdb","dower",0,1);
	cDBMemSign.AddToMemSign("a001user.mdb","skill",0,1);
	cDBMemSign.AddToMemSign("a001user.mdb","HitAct",0,1);
	cDBMemSign.AddToMemSign("a001user.mdb","InterfaceAct",0,1);

	cDBMemSign.AddToMemSign("a002user.mdb","GameRule",0,1);
	cDBMemSign.AddToMemSign("a002user.mdb","state_act",0,1);
	cDBMemSign.AddToMemSign("a002user.mdb","keydef",4,1);
	cDBMemSign.AddToMemSign("a002user.mdb","inputrull",9,1);
	cDBMemSign.AddToMemSign("a002user.mdb","flagdef",1,1);
	cDBMemSign.AddToMemSign("a002user.mdb","attributeflag",1,1);
//	cDBMemSign.AddToMemSign("a002user.mdb","condition",1,1);			// ==0
	cDBMemSign.AddToMemSign("a002user.mdb","result",1,1);
	cDBMemSign.AddToMemSign("a002user.mdb","attackdef",20,1);
	cDBMemSign.AddToMemSign("a002user.mdb","PartPhysics",0,1);
	cDBMemSign.AddToMemSign("a002user.mdb","UpLevel",0,1);
	cDBMemSign.AddToMemSign("a002user.mdb","dower",0,1);
	cDBMemSign.AddToMemSign("a002user.mdb","skill",0,1);
	cDBMemSign.AddToMemSign("a002user.mdb","HitAct",0,1);
	cDBMemSign.AddToMemSign("a002user.mdb","InterfaceAct",0,1);
}