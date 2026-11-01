import("$./../mdbdef/ScriptDbDef.gml");
import("$./../../mdb/dbdef_game.gml");
import("$./../ui/scoreUI.gml")
bgcolor = "#0";
title = "单机"

var g_mapID=5;		// 当前地图ID(开启简易场景后失效)
var g_userID = 2;
var g_SingleMode = 1;
var g_deskID = 1;		//桌子id
var g_RoleState = 1;	//角色状态 0:未知 1:房间 2:游戏 3:结算
var g_RoomMap = 30;	//当前选择的房间地图
var g_LogicTest = 0;	// 开启简易场景
var g_ROOMIP = "socket:://127.0.0.1:2008";
var g_EffectLV = 0;

import("$./SingleGameClient.gml")