// 创建日期:2011-7-30 18:32:10
// Access文件名:m_g_server.mdb

set window
{
	var M_G_SERVER                                        ="m_g_server.mdb";

	var ACTIVITYGROUP                                     ="ActivityGroup";
	var M_G_SERVER_ACTIVITYGROUP_ID                       =0;   
	var M_G_SERVER_ACTIVITYGROUP_ID_STR                   ="id";                         // DBTYPE_I4           组ID

	var M_G_SERVER_ACTIVITYGROUP_CURRNUM                  =1;   
	var M_G_SERVER_ACTIVITYGROUP_CURRNUM_STR              ="currnum";                    // DBTYPE_I4           组的当前人数

	var M_G_SERVER_ACTIVITYGROUP_MAXNUM                   =2;   
	var M_G_SERVER_ACTIVITYGROUP_MAXNUM_STR               ="maxnum";                     // DBTYPE_I4           组的最大人数(-1即不分组)

	var M_G_SERVER_ACTIVITYGROUP_STATE                    =3;   
	var M_G_SERVER_ACTIVITYGROUP_STATE_STR                ="state";                      // DBTYPE_I4           当前组的状态：(1初始 2即将开启 3等待报名中 4比赛进行中 5已结束)

	var M_G_SERVER_ACTIVITYGROUP_LEAVETIME                =4;   
	var M_G_SERVER_ACTIVITYGROUP_LEAVETIME_STR            ="leavetime";                  // DBTYPE_I4           当前组的比赛剩余时间,结束的时间((单位：秒)

	var M_G_SERVER_ACTIVITYGROUP_SPACETIME                =5;   
	var M_G_SERVER_ACTIVITYGROUP_SPACETIME_STR            ="spacetime";                  // DBTYPE_I4           开始报名的间隔时间(单位：秒)

	var M_G_SERVER_ACTIVITYGROUP_TEAM                     =6;   
	var M_G_SERVER_ACTIVITYGROUP_TEAM_STR                 ="team";                       // DBTYPE_I4           大厅服务器填写：队伍（不分则都为1） 分1队 2队 为擂台类活动留

	var M_G_SERVER_ACTIVITYGROUP_INDEX                    =7;   
	var M_G_SERVER_ACTIVITYGROUP_INDEX_STR                ="index";                      // DBTYPE_I4           大厅服务器填写：自己的排名


	var ACTIVITYOVER                                      ="ActivityOver";
	var M_G_SERVER_ACTIVITYOVER_USERID                    =0;   
	var M_G_SERVER_ACTIVITYOVER_USERID_STR                ="UserID";                     // DBTYPE_I4           

	var M_G_SERVER_ACTIVITYOVER_RACEID                    =1;   
	var M_G_SERVER_ACTIVITYOVER_RACEID_STR                ="RaceID";                     // DBTYPE_I4           

	var M_G_SERVER_ACTIVITYOVER_NKNAME                    =2;   
	var M_G_SERVER_ACTIVITYOVER_NKNAME_STR                ="NkName";                     // DBTYPE_WVARCHAR     

	var M_G_SERVER_ACTIVITYOVER_SORT                      =3;   
	var M_G_SERVER_ACTIVITYOVER_SORT_STR                  ="Sort";                       // DBTYPE_I4           

	var M_G_SERVER_ACTIVITYOVER_AWARDNAME                 =4;   
	var M_G_SERVER_ACTIVITYOVER_AWARDNAME_STR             ="AwardName";                  // DBTYPE_WVARCHAR     


	var ARENADATA                                         ="ArenaData";
	var M_G_SERVER_ARENADATA_USERID                       =0;   
	var M_G_SERVER_ARENADATA_USERID_STR                   ="UserID";                     // DBTYPE_I4           

	var M_G_SERVER_ARENADATA_RACEID                       =1;   
	var M_G_SERVER_ARENADATA_RACEID_STR                   ="RaceID";                     // DBTYPE_I4           

	var M_G_SERVER_ARENADATA_NKNAME                       =2;   
	var M_G_SERVER_ARENADATA_NKNAME_STR                   ="NkName";                     // DBTYPE_WVARCHAR     

	var M_G_SERVER_ARENADATA_DATA                         =3;   
	var M_G_SERVER_ARENADATA_DATA_STR                     ="Data";                       // DBTYPE_I4           

	var M_G_SERVER_ARENADATA_TM                           =4;   
	var M_G_SERVER_ARENADATA_TM_STR                       ="Tm";                         // DBTYPE_NUMERIC      

	var M_G_SERVER_ARENADATA_SORT                         =5;   
	var M_G_SERVER_ARENADATA_SORT_STR                     ="Sort";                       // DBTYPE_I4           

	var M_G_SERVER_ARENADATA_STATE                        =6;   
	var M_G_SERVER_ARENADATA_STATE_STR                    ="State";                      // DBTYPE_I4           


	var ARENARACE                                         ="arenaRace";
	var M_G_SERVER_ARENARACE_ID                           =0;   
	var M_G_SERVER_ARENARACE_ID_STR                       ="id";                         // DBTYPE_I4           0 报名ID

	var M_G_SERVER_ARENARACE_ARENATYPE                    =1;   
	var M_G_SERVER_ARENARACE_ARENATYPE_STR                ="arenatype";                  // DBTYPE_I4           1 报名需要的数据

	var M_G_SERVER_ARENARACE_QUEUETYPE                    =2;   
	var M_G_SERVER_ARENARACE_QUEUETYPE_STR                ="queuetype";                  // DBTYPE_I4           2 配对类型：0未知 1玩家 2队伍 3家族

	var M_G_SERVER_ARENARACE_CREATEROOMTYPE               =3;   
	var M_G_SERVER_ARENARACE_CREATEROOMTYPE_STR           ="createRoomType";             // DBTYPE_I4           3 需创建的房间类型：1普通活动 2撮合活动

	var M_G_SERVER_ARENARACE_PVPSV_NUM                    =4;   
	var M_G_SERVER_ARENARACE_PVPSV_NUM_STR                ="pvpsv_num";                  // DBTYPE_I4           4 配对服务器同步：pvp服务器的可用数量( 0代表没有服务器开启 >0时可用)

	var M_G_SERVER_ARENARACE_SUPPORTARENATYPE             =5;   
	var M_G_SERVER_ARENARACE_SUPPORTARENATYPE_STR         ="supportarenatype";           // DBTYPE_I4           5 所支持的比赛类型：2竞技赛

	var M_G_SERVER_ARENARACE_ACTIVITY_STATE               =6;   
	var M_G_SERVER_ARENARACE_ACTIVITY_STATE_STR           ="activity_state";             // DBTYPE_I4           6 配对服务器同步：本活动的状态：(1关闭 2开启 3报名中&未比赛 4报名中&有比赛 5报名结束&有比赛 6报名结束&没有比赛)

	var M_G_SERVER_ARENARACE_WAIT_TIME                    =7;   
	var M_G_SERVER_ARENARACE_WAIT_TIME_STR                ="wait_time";                  // DBTYPE_I4           7 配对服务器同步：估计等待时间(单位：秒)

	var M_G_SERVER_ARENARACE_RACE_STATE                   =8;   
	var M_G_SERVER_ARENARACE_RACE_STATE_STR               ="race_state";                 // DBTYPE_I4           8 配对服务器同步：玩家此活动的状态： 1初始状态 2等待排队中 3暂停中 4已取消排队


	var M_G_SERVER_ARENARACE_OPENTIME                     =9;   
	var M_G_SERVER_ARENARACE_OPENTIME_STR                 ="opentime";                   // DBTYPE_NUMERIC      9 配对服务器同步：活动开启剩余时间(-1表示没有时间限制，0已开启)：暂时没用

	var M_G_SERVER_ARENARACE_SIGNLEAVETIME                =10;  
	var M_G_SERVER_ARENARACE_SIGNLEAVETIME_STR            ="signleavetime";              // DBTYPE_I4           10 配对服务器同步：报名的剩余时间(-1表示没时间限制)(单位：秒)

	var M_G_SERVER_ARENARACE_BEGINENDTIME_UI              =11;  
	var M_G_SERVER_ARENARACE_BEGINENDTIME_UI_STR          ="beginendtime_ui";            // DBTYPE_WVARCHAR     11 配对服务器同步：界面显示活动的起始时间(08:00-09:00)

	var M_G_SERVER_ARENARACE_FALLOW_TIME                  =12;  
	var M_G_SERVER_ARENARACE_FALLOW_TIME_STR              ="fallow_time";                // DBTYPE_I4           12 配对服务器同步：休整时间(单位：秒)

	var M_G_SERVER_ARENARACE_ALLNUM                       =13;  
	var M_G_SERVER_ARENARACE_ALLNUM_STR                   ="allnum";                     // DBTYPE_I4           13 配对服务器同步：活动的总人数

	var M_G_SERVER_ARENARACE_CHANNEL_TIME                 =14;  
	var M_G_SERVER_ARENARACE_CHANNEL_TIME_STR             ="channel_time";               // DBTYPE_WVARCHAR     14 频道活动公告显示时间(封测时要显示在频道假数据使用，目前废弃)

	var M_G_SERVER_ARENARACE_GROUP_ID                     =15;  
	var M_G_SERVER_ARENARACE_GROUP_ID_STR                 ="group_id";                   // DBTYPE_I4           大厅服务器填写：自己所在的组ID

	var M_G_SERVER_ARENARACE_TITLE                        =16;  
	var M_G_SERVER_ARENARACE_TITLE_STR                    ="title";                      // DBTYPE_WVARCHAR     界面显示：标题

	var M_G_SERVER_ARENARACE_DES1                         =17;  
	var M_G_SERVER_ARENARACE_DES1_STR                     ="des1";                       // DBTYPE_WLONGVARCHAR 界面显示：弹出框的竞技赛说明(目前包括规则和奖励65535字符限制)

	var M_G_SERVER_ARENARACE_DES2                         =18;  
	var M_G_SERVER_ARENARACE_DES2_STR                     ="des2";                       // DBTYPE_WVARCHAR     界面显示：弹出框的报名费用

	var M_G_SERVER_ARENARACE_UIRACETYPE                   =19;  
	var M_G_SERVER_ARENARACE_UIRACETYPE_STR               ="uiracetype";                 // DBTYPE_WVARCHAR     界面显示：报名货币类型 和items表里的一样 "金币" "点券" "免费"

	var M_G_SERVER_ARENARACE_UIAWARD                      =20;  
	var M_G_SERVER_ARENARACE_UIAWARD_STR                  ="uiaward";                    // DBTYPE_WVARCHAR     界面显示：奖励文字

	var M_G_SERVER_ARENARACE_RACEMONEY                    =21;  
	var M_G_SERVER_ARENARACE_RACEMONEY_STR                ="racemoney";                  // DBTYPE_I4           界面显示：报名费用 和uiracetype联合使用

	var M_G_SERVER_ARENARACE_TEAMNUM                      =22;  
	var M_G_SERVER_ARENARACE_TEAMNUM_STR                  ="teamnum";                    // DBTYPE_I4           界面显示：队伍成员数

	var M_G_SERVER_ARENARACE_SIGNGETDATA                  =23;  
	var M_G_SERVER_ARENARACE_SIGNGETDATA_STR              ="signgetdata";                // DBTYPE_I4           界面使用：报名后得到的数值(如：活动点)

	var M_G_SERVER_ARENARACE_LOSTMONEY                    =24;  
	var M_G_SERVER_ARENARACE_LOSTMONEY_STR                ="lostmoney";                  // DBTYPE_I4           界面使用：输掉一场比赛扣钱数

	var M_G_SERVER_ARENARACE_HOT                          =25;  
	var M_G_SERVER_ARENARACE_HOT_STR                      ="hot";                        // DBTYPE_I4           界面排序：1热门 2新开 3其他

	var M_G_SERVER_ARENARACE_RES1                         =26;  
	var M_G_SERVER_ARENARACE_RES1_STR                     ="res1";                       // DBTYPE_I4           大厅服务器填写：此类型的保留数据1 (连胜,活动点数.....)

	var M_G_SERVER_ARENARACE_RES2                         =27;  
	var M_G_SERVER_ARENARACE_RES2_STR                     ="res2";                       // DBTYPE_I4           此类型的保留数据2

	var M_G_SERVER_ARENARACE_RES3                         =28;  
	var M_G_SERVER_ARENARACE_RES3_STR                     ="res3";                       // DBTYPE_I4           此类型的保留数据3

	var M_G_SERVER_ARENARACE_RES4                         =29;  
	var M_G_SERVER_ARENARACE_RES4_STR                     ="res4";                       // DBTYPE_I4           此类型的保留数据4

	var M_G_SERVER_ARENARACE_RES5                         =30;  
	var M_G_SERVER_ARENARACE_RES5_STR                     ="res5";                       // DBTYPE_I4           此类型的保留数据5

	var M_G_SERVER_ARENARACE_VEXP                         =31;  
	var M_G_SERVER_ARENARACE_VEXP_STR                     ="Vexp";                       // DBTYPE_I4           完成后胜利的经验 (暂不用)

	var M_G_SERVER_ARENARACE_VMONEY                       =32;  
	var M_G_SERVER_ARENARACE_VMONEY_STR                   ="Vmoney";                     // DBTYPE_I4           完成后胜利的钱(暂不用)

	var M_G_SERVER_ARENARACE_VMANGOODS1                   =33;  
	var M_G_SERVER_ARENARACE_VMANGOODS1_STR               ="Vmangoods1";                 // DBTYPE_WVARCHAR     完成后给的物品(男) 格式:cid,num,limittime  ("物品ID1,3个,7天有效;物品ID2,1个,7天有效"....)

	var M_G_SERVER_ARENARACE_VWOMANGOODS1                 =34;  
	var M_G_SERVER_ARENARACE_VWOMANGOODS1_STR             ="Vwomangoods1";               // DBTYPE_WVARCHAR     完成后给的物品(女)

	var M_G_SERVER_ARENARACE_CONDITION                    =35;  
	var M_G_SERVER_ARENARACE_CONDITION_STR                ="condition";                  // DBTYPE_WVARCHAR     一段脚本 报名限制条件：返回值1(符合),-1(金币不够),-2(等级不够)

	var M_G_SERVER_ARENARACE_SCRIPTAPPLY                  =36;  
	var M_G_SERVER_ARENARACE_SCRIPTAPPLY_STR              ="scriptapply";                // DBTYPE_WVARCHAR     一段脚本 报名时用检查用

	var M_G_SERVER_ARENARACE_SCRIPTAPPLYSUCCESS           =37;  
	var M_G_SERVER_ARENARACE_SCRIPTAPPLYSUCCESS_STR       ="scriptapplysuccess";         // DBTYPE_WVARCHAR     一段脚本 报名成功时用

	var M_G_SERVER_ARENARACE_SCRIPTENDWIN                 =38;  
	var M_G_SERVER_ARENARACE_SCRIPTENDWIN_STR             ="scriptendwin";               // DBTYPE_WLONGVARCHAR 一段脚本 每次获胜时用

	var M_G_SERVER_ARENARACE_SCRIPTENDLOST                =39;  
	var M_G_SERVER_ARENARACE_SCRIPTENDLOST_STR            ="scriptendlost";              // DBTYPE_WLONGVARCHAR 一段脚本 每次失败时用

	var M_G_SERVER_ARENARACE_SCRIPTCANCELQUEUE            =40;  
	var M_G_SERVER_ARENARACE_SCRIPTCANCELQUEUE_STR        ="scriptcancelqueue";          // DBTYPE_WVARCHAR     一段脚本 取消报名触发

	var M_G_SERVER_ARENARACE_SCRIPTGROUPEND               =41;  
	var M_G_SERVER_ARENARACE_SCRIPTGROUPEND_STR           ="scriptgroupend";             // DBTYPE_WVARCHAR     一段脚本 一组结束后对每个用户的触发

	var M_G_SERVER_ARENARACE_SCRIPTALLGROUPEND            =42;  
	var M_G_SERVER_ARENARACE_SCRIPTALLGROUPEND_STR        ="scriptallgroupend";          // DBTYPE_WVARCHAR     一段脚本 一组结束后触发

	var M_G_SERVER_ARENARACE_SCRIPTADDARENADATA           =43;  
	var M_G_SERVER_ARENARACE_SCRIPTADDARENADATA_STR       ="scriptaddarenadata";         // DBTYPE_WVARCHAR     一段脚本 转换竞技场点数用

	var M_G_SERVER_ARENARACE_SCRIPTGROUPSTART             =44;  
	var M_G_SERVER_ARENARACE_SCRIPTGROUPSTART_STR         ="scriptgroupstart";           // DBTYPE_WVARCHAR     一段脚本 一组开始后触发

	var M_G_SERVER_ARENARACE_MINLV_UI                     =45;  
	var M_G_SERVER_ARENARACE_MINLV_UI_STR                 ="minlv_ui";                   // DBTYPE_I4           界面显示：最小等级

	var M_G_SERVER_ARENARACE_MAXLV_UI                     =46;  
	var M_G_SERVER_ARENARACE_MAXLV_UI_STR                 ="maxlv_ui";                   // DBTYPE_I4           界面显示：最大等级 -1无限大

	var M_G_SERVER_ARENARACE_UI_ADDPOINTGET               =47;  
	var M_G_SERVER_ARENARACE_UI_ADDPOINTGET_STR           ="ui_addpointget";             // DBTYPE_I4           界面显示：充点得到的点数   -1代表不能充点

	var M_G_SERVER_ARENARACE_UI_ADDPOINTMONEY             =48;  
	var M_G_SERVER_ARENARACE_UI_ADDPOINTMONEY_STR         ="ui_addpointmoney";           // DBTYPE_I4           界面显示：充点付出的金币数

	var M_G_SERVER_ARENARACE_UI_BEGINTIMEPOINT            =49;  
	var M_G_SERVER_ARENARACE_UI_BEGINTIMEPOINT_STR        ="ui_begintimepoint";          // DBTYPE_I4           界面显示：活动开始的时间点(单位:MS)

	var M_G_SERVER_ARENARACE_UI_BALANCELEAVETIME          =50;  
	var M_G_SERVER_ARENARACE_UI_BALANCELEAVETIME_STR      ="ui_balanceleavetime";        // DBTYPE_I4           界面显示：结算剩余时间(单位:秒)

	var M_G_SERVER_ARENARACE_UI_TOPTITLE                  =51;  
	var M_G_SERVER_ARENARACE_UI_TOPTITLE_STR              ="ui_toptitle";                // DBTYPE_WVARCHAR     界面显示：活动排行的标题文字

	var M_G_SERVER_ARENARACE_CHECK_APPLY                  =52;  
	var M_G_SERVER_ARENARACE_CHECK_APPLY_STR              ="check_apply";                // DBTYPE_I4           界面和服务器都用,用于搭档的活动 是否可以报名活动: 0:都可以 1:队长可以 2:队员可以

	var M_G_SERVER_ARENARACE_CHECK_ADDPOINT               =53;  
	var M_G_SERVER_ARENARACE_CHECK_ADDPOINT_STR           ="check_addpoint";             // DBTYPE_I4           界面和服务器都用,用于搭档的活动 活动界面充点: 0:都可以 1:队长可以 2:队员可以

	var M_G_SERVER_ARENARACE_CHECK_SLOGAN                 =54;  
	var M_G_SERVER_ARENARACE_CHECK_SLOGAN_STR             ="check_slogan";               // DBTYPE_I4           界面和服务器都用,用于搭档的活动 让玩家设置获胜感言: 0:都可以 1:队长可以 2:队员可以

	var M_G_SERVER_ARENARACE_CHECK_REST                   =55;  
	var M_G_SERVER_ARENARACE_CHECK_REST_STR               ="check_rest";                 // DBTYPE_I4           界面和服务器都用,用于搭档的活动 取消休整: 0:都可以 1:队长可以 2:队员可以

	var M_G_SERVER_ARENARACE_CHECK_CANCEL                 =56;  
	var M_G_SERVER_ARENARACE_CHECK_CANCEL_STR             ="check_cancel";               // DBTYPE_I4           界面用,用于搭档的活动 是否可以取消活动: 0:都可以 1:队长可以 2:队员可以


	var CHATRECEIVE                                       ="chatReceive";
	var M_G_SERVER_CHATRECEIVE_ID                         =0;   
	var M_G_SERVER_CHATRECEIVE_ID_STR                     ="id";                         // DBTYPE_I4           序号

	var M_G_SERVER_CHATRECEIVE_TYPE                       =1;   
	var M_G_SERVER_CHATRECEIVE_TYPE_STR                   ="type";                       // DBTYPE_I4           信息类型:0普通,1私聊,2世界,3队伍,4频道,5系统公告,6GM,7系统提示,8滚动公告,9小喇叭,10GM聊天

	var M_G_SERVER_CHATRECEIVE_TYPE2                      =2;   
	var M_G_SERVER_CHATRECEIVE_TYPE2_STR                  ="type2";                      // DBTYPE_I4           特殊标记，比如gm

	var M_G_SERVER_CHATRECEIVE_CONTENT                    =3;   
	var M_G_SERVER_CHATRECEIVE_CONTENT_STR                ="content";                    // DBTYPE_WVARCHAR     信息内容

	var M_G_SERVER_CHATRECEIVE_SENDERID                   =4;   
	var M_G_SERVER_CHATRECEIVE_SENDERID_STR               ="senderID";                   // DBTYPE_I4           发送对象ID

	var M_G_SERVER_CHATRECEIVE_SENDERNAME                 =5;   
	var M_G_SERVER_CHATRECEIVE_SENDERNAME_STR             ="senderName";                 // DBTYPE_WVARCHAR     发送对象名字

	var M_G_SERVER_CHATRECEIVE_ACCEPTNAME                 =6;   
	var M_G_SERVER_CHATRECEIVE_ACCEPTNAME_STR             ="acceptname";                 // DBTYPE_WVARCHAR     

	var M_G_SERVER_CHATRECEIVE_COLOR                      =7;   
	var M_G_SERVER_CHATRECEIVE_COLOR_STR                  ="color";                      // DBTYPE_WVARCHAR     聊天的颜色

	var M_G_SERVER_CHATRECEIVE_CHANNLID                   =8;   
	var M_G_SERVER_CHATRECEIVE_CHANNLID_STR               ="channlID";                   // DBTYPE_I4           频道id,只针对信息类型为频道信息有效,若该消息不算任何频道,则为0,请不要定义0号频道

	var M_G_SERVER_CHATRECEIVE_TM                         =9;   
	var M_G_SERVER_CHATRECEIVE_TM_STR                     ="tm";                         // DBTYPE_DATE         接收信息时间


	var DESKDT                                            ="deskdt";
	var M_G_SERVER_DESKDT_DESKID                          =0;   
	var M_G_SERVER_DESKDT_DESKID_STR                      ="deskid";                     // DBTYPE_I4           0 桌子ID对应gameid

	var M_G_SERVER_DESKDT_DESKNAME                        =1;   
	var M_G_SERVER_DESKDT_DESKNAME_STR                    ="deskname";                   // DBTYPE_WVARCHAR     1 建立时用户输入的桌子名称

	var M_G_SERVER_DESKDT_DESKPASS                        =2;   
	var M_G_SERVER_DESKDT_DESKPASS_STR                    ="deskpass";                   // DBTYPE_WVARCHAR     2 建立时用户输入的桌子密码

	var M_G_SERVER_DESKDT_DESKMSG                         =3;   
	var M_G_SERVER_DESKDT_DESKMSG_STR                     ="deskmsg";                    // DBTYPE_WVARCHAR     3 房主留言

	var M_G_SERVER_DESKDT_DESKMAXNUM                      =4;   
	var M_G_SERVER_DESKDT_DESKMAXNUM_STR                  ="deskmaxnum";                 // DBTYPE_I4           4 房间最大人数

	var M_G_SERVER_DESKDT_DESKCURRNUM                     =5;   
	var M_G_SERVER_DESKDT_DESKCURRNUM_STR                 ="deskcurrnum";                // DBTYPE_I4           5 房间当前人数

	var M_G_SERVER_DESKDT_LOOKERCURRNUM                   =6;   
	var M_G_SERVER_DESKDT_LOOKERCURRNUM_STR               ="lookercurrnum";              // DBTYPE_I4           6 房间当前旁观者人数

	var M_G_SERVER_DESKDT_DESKSTA                         =7;   
	var M_G_SERVER_DESKDT_DESKSTA_STR                     ="desksta";                    // DBTYPE_UI1          7 桌子状态 0未知 1游戏中 2等待中 3结算中

	var M_G_SERVER_DESKDT_DESKTYPE                        =8;   
	var M_G_SERVER_DESKDT_DESKTYPE_STR                    ="desktype";                   // DBTYPE_I4           8 桌子类型 0未知 1网球竞技单 2网球竞技双 3网球道具单 4网球道具双 5大奖竞技单 6大奖竞技双 7大奖道具单 8大奖道具双

	var M_G_SERVER_DESKDT_SCORENUM                        =9;   
	var M_G_SERVER_DESKDT_SCORENUM_STR                    ="scorenum";                   // DBTYPE_I4           9 游戏局数 0未知 1.3.5局

	var M_G_SERVER_DESKDT_DMAPID                          =10;  
	var M_G_SERVER_DESKDT_DMAPID_STR                      ="dmapid";                     // DBTYPE_I4           10 游戏中当前使用的地图

	var M_G_SERVER_DESKDT_MASTERID                        =11;  
	var M_G_SERVER_DESKDT_MASTERID_STR                    ="masterid";                   // DBTYPE_I4           11 房主ID

	var M_G_SERVER_DESKDT_CANLOOK                         =12;  
	var M_G_SERVER_DESKDT_CANLOOK_STR                     ="canlook";                    // DBTYPE_BOOL         12 是否可以观战

	var M_G_SERVER_DESKDT_EXPMULT                         =13;  
	var M_G_SERVER_DESKDT_EXPMULT_STR                     ="expmult";                    // DBTYPE_R4           13 经验获得倍比

	var M_G_SERVER_DESKDT_MONEYMULT                       =14;  
	var M_G_SERVER_DESKDT_MONEYMULT_STR                   ="moneymult";                  // DBTYPE_R4           14 金钱获得倍比

	var M_G_SERVER_DESKDT_TASK                            =15;  
	var M_G_SERVER_DESKDT_TASK_STR                        ="task";                       // DBTYPE_WVARCHAR     15 地图所选任务

	var M_G_SERVER_DESKDT_GAMESTARTLOOK                   =16;  
	var M_G_SERVER_DESKDT_GAMESTARTLOOK_STR               ="gamestartlook";              // DBTYPE_I4           16 游戏开始了，可以观战了  0没有 1开始了

	var M_G_SERVER_DESKDT_MSG0                            =17;  
	var M_G_SERVER_DESKDT_MSG0_STR                        ="Msg0";                       // DBTYPE_WVARCHAR     17 房间活动信息 进入信息

	var M_G_SERVER_DESKDT_MSG1                            =18;  
	var M_G_SERVER_DESKDT_MSG1_STR                        ="Msg1";                       // DBTYPE_WVARCHAR     18 房间活动信息 离开信息

	var M_G_SERVER_DESKDT_MSG2                            =19;  
	var M_G_SERVER_DESKDT_MSG2_STR                        ="Msg2";                       // DBTYPE_WVARCHAR     19 房间活动信息 结束信息

	var M_G_SERVER_DESKDT_DISPLAYID                       =20;  
	var M_G_SERVER_DESKDT_DISPLAYID_STR                   ="DisplayID";                  // DBTYPE_I4           20 用于界面显示的ID

	var M_G_SERVER_DESKDT_GETROLEPLACE                    =21;  
	var M_G_SERVER_DESKDT_GETROLEPLACE_STR                ="GetRolePlace";               // DBTYPE_I4           21 1的时候,服务器得到人物的站位信息

	var M_G_SERVER_DESKDT_DIFFERENCE                      =22;  
	var M_G_SERVER_DESKDT_DIFFERENCE_STR                  ="difference";                 // DBTYPE_I4           22 积分差：大奖赛类型的房间有效 0未知，1分差30以内，2分差60以内

	var M_G_SERVER_DESKDT_ACHIEVEGAMENUM                  =23;  
	var M_G_SERVER_DESKDT_ACHIEVEGAMENUM_STR              ="AchieveGameNum";             // DBTYPE_I4           23 完成的游戏局数

	var M_G_SERVER_DESKDT_CREATETM                        =24;  
	var M_G_SERVER_DESKDT_CREATETM_STR                    ="CreateTm";                   // DBTYPE_NUMERIC      24 创建时间

	var M_G_SERVER_DESKDT_WAITUSER1                       =25;  
	var M_G_SERVER_DESKDT_WAITUSER1_STR                   ="WaitUser1";                  // DBTYPE_I4           25 等待的用户1

	var M_G_SERVER_DESKDT_USER1TEAM                       =26;  
	var M_G_SERVER_DESKDT_USER1TEAM_STR                   ="User1Team";                  // DBTYPE_I4           26 用户1的队伍

	var M_G_SERVER_DESKDT_WAITUSER2                       =27;  
	var M_G_SERVER_DESKDT_WAITUSER2_STR                   ="WaitUser2";                  // DBTYPE_I4           27 等待的用户2

	var M_G_SERVER_DESKDT_USER2TEAM                       =28;  
	var M_G_SERVER_DESKDT_USER2TEAM_STR                   ="User2Team";                  // DBTYPE_I4           28 用户2的队伍

	var M_G_SERVER_DESKDT_WAITUSER3                       =29;  
	var M_G_SERVER_DESKDT_WAITUSER3_STR                   ="WaitUser3";                  // DBTYPE_I4           29 等待的用户3

	var M_G_SERVER_DESKDT_USER3TEAM                       =30;  
	var M_G_SERVER_DESKDT_USER3TEAM_STR                   ="User3Team";                  // DBTYPE_I4           30 用户3的队伍

	var M_G_SERVER_DESKDT_WAITUSER4                       =31;  
	var M_G_SERVER_DESKDT_WAITUSER4_STR                   ="WaitUser4";                  // DBTYPE_I4           31 等待的用户4

	var M_G_SERVER_DESKDT_USER4TEAM                       =32;  
	var M_G_SERVER_DESKDT_USER4TEAM_STR                   ="User4Team";                  // DBTYPE_I4           32 用户4的队伍

	var M_G_SERVER_DESKDT_IRACEID                         =33;  
	var M_G_SERVER_DESKDT_IRACEID_STR                     ="iRaceID";                    // DBTYPE_I4           33 竞技ID，竞技赛用

	var M_G_SERVER_DESKDT_SHOWID                          =34;  
	var M_G_SERVER_DESKDT_SHOWID_STR                      ="ShowID";                     // DBTYPE_I4           34 显示ID，界面用

	var M_G_SERVER_DESKDT_IWAGER                          =35;  
	var M_G_SERVER_DESKDT_IWAGER_STR                      ="iWager";                     // DBTYPE_I4           35 赌注0 表示没有赌注

	var M_G_SERVER_DESKDT_IWAGERTYPE                      =36;  
	var M_G_SERVER_DESKDT_IWAGERTYPE_STR                  ="iWagerType";                 // DBTYPE_I4           36 赌注类型 1表示金币 2点卷

	var M_G_SERVER_DESKDT_IGROUPID                        =37;  
	var M_G_SERVER_DESKDT_IGROUPID_STR                    ="iGroupID";                   // DBTYPE_I4           37 竞技组ID，竞技赛用

	var M_G_SERVER_DESKDT_LOOKERMAXNUM                    =38;  
	var M_G_SERVER_DESKDT_LOOKERMAXNUM_STR                ="lookermaxnum";               // DBTYPE_I4           38 最大观战人数

	var M_G_SERVER_DESKDT_SEXSORT                         =39;  
	var M_G_SERVER_DESKDT_SEXSORT_STR                     ="sexsort";                    // DBTYPE_I4           39 显示用 房间男女 规则女的放在男的前面 格式:女女男男 数据以倒叙排列 例如:女女男 数据:122

	var M_G_SERVER_DESKDT_LOCKFORQUEUE                    =40;  
	var M_G_SERVER_DESKDT_LOCKFORQUEUE_STR                ="LockForQueue";               // DBTYPE_I4           40 因为去竞技了而把房间锁定

	var M_G_SERVER_DESKDT_BUILDTM                         =41;  
	var M_G_SERVER_DESKDT_BUILDTM_STR                     ="BuildTm";                    // DBTYPE_NUMERIC      41 创建房间的时间,只有在resetroom和createroom的时候才修改

	var M_G_SERVER_DESKDT_GMROOMTYPE                      =42;  
	var M_G_SERVER_DESKDT_GMROOMTYPE_STR                  ="GMRoomType";                 // DBTYPE_I4           42 GM房间类型：0 非GM房间，1 GM手动房间，2 GM自动房间


	var FRIENDDT                                          ="FriendDT";
	var M_G_SERVER_FRIENDDT_USERID                        =0;   
	var M_G_SERVER_FRIENDDT_USERID_STR                    ="UserID";                     // DBTYPE_I4           玩家ID

	var M_G_SERVER_FRIENDDT_NKNAME                        =1;   
	var M_G_SERVER_FRIENDDT_NKNAME_STR                    ="nkName";                     // DBTYPE_WVARCHAR     游戏中使用的昵称

	var M_G_SERVER_FRIENDDT_SEX                           =2;   
	var M_G_SERVER_FRIENDDT_SEX_STR                       ="Sex";                        // DBTYPE_I4           性别 1男 2女

	var M_G_SERVER_FRIENDDT_ROLEMAXLV                     =3;   
	var M_G_SERVER_FRIENDDT_ROLEMAXLV_STR                 ="RoleMaxlv";                  // DBTYPE_I4           角色中最高等级

	var M_G_SERVER_FRIENDDT_STATE                         =4;   
	var M_G_SERVER_FRIENDDT_STATE_STR                     ="State";                      // DBTYPE_I4           玩家状态(赵老师用) 0下线 1上线

	var M_G_SERVER_FRIENDDT_CURRCHANNEL                   =5;   
	var M_G_SERVER_FRIENDDT_CURRCHANNEL_STR               ="CurrChannel";                // DBTYPE_WVARCHAR     玩家当前频道

	var M_G_SERVER_FRIENDDT_ROOMID                        =6;   
	var M_G_SERVER_FRIENDDT_ROOMID_STR                    ="RoomId";                     // DBTYPE_I4           玩家所在的房间ID

	var M_G_SERVER_FRIENDDT_RELATION                      =7;   
	var M_G_SERVER_FRIENDDT_RELATION_STR                  ="Relation";                   // DBTYPE_I4           关系 0好友 1黑名单

	var M_G_SERVER_FRIENDDT_JID                           =8;   
	var M_G_SERVER_FRIENDDT_JID_STR                       ="JID";                        // DBTYPE_I4           好友的jid

	var M_G_SERVER_FRIENDDT_DELETE                        =9;   
	var M_G_SERVER_FRIENDDT_DELETE_STR                    ="delete";                     // DBTYPE_I4           是否被删除，0没删，1删了

	var M_G_SERVER_FRIENDDT_QUALIFY                       =10;  
	var M_G_SERVER_FRIENDDT_QUALIFY_STR                   ="qualify";                    // DBTYPE_I4           称号

	var M_G_SERVER_FRIENDDT_ROLETYPE                      =11;  
	var M_G_SERVER_FRIENDDT_ROLETYPE_STR                  ="roletype";                   // DBTYPE_I4           角色类型

	var M_G_SERVER_FRIENDDT_GAMESTATE                     =12;  
	var M_G_SERVER_FRIENDDT_GAMESTATE_STR                 ="gamestate";                  // DBTYPE_I4           游戏状态 0离线 1空闲中 2房间内 3游戏中 4登陆中


	var GAMEDT                                            ="gamedt";
	var M_G_SERVER_GAMEDT_GAMEID                          =0;   
	var M_G_SERVER_GAMEDT_GAMEID_STR                      ="gameid";                     // DBTYPE_I4           

	var M_G_SERVER_GAMEDT_MAPTTM                          =1;   
	var M_G_SERVER_GAMEDT_MAPTTM_STR                      ="MaptTm";                     // DBTYPE_I4           地图时间

	var M_G_SERVER_GAMEDT_CURRMAPTM                       =2;   
	var M_G_SERVER_GAMEDT_CURRMAPTM_STR                   ="CurrMapTm";                  // DBTYPE_I4           当前运行的时间

	var M_G_SERVER_GAMEDT_STARTTM                         =3;   
	var M_G_SERVER_GAMEDT_STARTTM_STR                     ="StartTm";                    // DBTYPE_NUMERIC      开始游戏时间

	var M_G_SERVER_GAMEDT_GAMESTATE                       =4;   
	var M_G_SERVER_GAMEDT_GAMESTATE_STR                   ="GameState";                  // DBTYPE_I4           游戏状态

	var M_G_SERVER_GAMEDT_MAPID                           =5;   
	var M_G_SERVER_GAMEDT_MAPID_STR                       ="MapID";                      // DBTYPE_I4           定义地图

	var M_G_SERVER_GAMEDT_BOSSISDEAD                      =6;   
	var M_G_SERVER_GAMEDT_BOSSISDEAD_STR                  ="BossIsDead";                 // DBTYPE_BOOL         是否杀死BOSS

	var M_G_SERVER_GAMEDT_GAMEMODE                        =7;   
	var M_G_SERVER_GAMEDT_GAMEMODE_STR                    ="GameMode";                   // DBTYPE_UI1          游戏模式 1:对战,2:冒险

	var M_G_SERVER_GAMEDT_GMCORTROL                       =8;   
	var M_G_SERVER_GAMEDT_GMCORTROL_STR                   ="GMCortrol";                  // DBTYPE_WVARCHAR     GM控制,指令

	var M_G_SERVER_GAMEDT_MAXUSERNUM                      =9;   
	var M_G_SERVER_GAMEDT_MAXUSERNUM_STR                  ="MaxUserNum";                 // DBTYPE_I4           地图最大人数

	var M_G_SERVER_GAMEDT_AUDIENCENUM                     =10;  
	var M_G_SERVER_GAMEDT_AUDIENCENUM_STR                 ="AudienceNum";                // DBTYPE_I4           观众的数量

	var M_G_SERVER_GAMEDT_AVERAGELV                       =11;  
	var M_G_SERVER_GAMEDT_AVERAGELV_STR                   ="AverageLv";                  // DBTYPE_I4           平均等级

	var M_G_SERVER_GAMEDT_FIGHTNUM                        =12;  
	var M_G_SERVER_GAMEDT_FIGHTNUM_STR                    ="FightNum";                   // DBTYPE_I4           如果是混战,记录参战的人数,如果是组队,记录每个对的人数,是2v2还是3v3

	var M_G_SERVER_GAMEDT_MANUALMULTI                     =13;  
	var M_G_SERVER_GAMEDT_MANUALMULTI_STR                 ="manualmulti";                // DBTYPE_I4           如果是PVE体力消耗是PvP的一半

	var M_G_SERVER_GAMEDT_RPERVEC                         =14;  
	var M_G_SERVER_GAMEDT_RPERVEC_STR                     ="RPerVec";                    // DBTYPE_I4           录象版本号


	var GAMEEND_FREE                                      ="GameEnd_Free";
	var M_G_SERVER_GAMEEND_FREE_ID                        =0;   
	var M_G_SERVER_GAMEEND_FREE_ID_STR                    ="id";                         // DBTYPE_I4           界面上显示的顺序

	var M_G_SERVER_GAMEEND_FREE_NAME                      =1;   
	var M_G_SERVER_GAMEEND_FREE_NAME_STR                  ="name";                       // DBTYPE_WVARCHAR     昵称

	var M_G_SERVER_GAMEEND_FREE_ATTACK                    =2;   
	var M_G_SERVER_GAMEEND_FREE_ATTACK_STR                ="attack";                     // DBTYPE_I4           击杀分

	var M_G_SERVER_GAMEEND_FREE_SURVIVAL                  =3;   
	var M_G_SERVER_GAMEEND_FREE_SURVIVAL_STR              ="survival";                   // DBTYPE_I4           生存分

	var M_G_SERVER_GAMEEND_FREE_SKILL                     =4;   
	var M_G_SERVER_GAMEEND_FREE_SKILL_STR                 ="skill";                      // DBTYPE_I4           技巧分

	var M_G_SERVER_GAMEEND_FREE_TOTALFRAC                 =5;   
	var M_G_SERVER_GAMEEND_FREE_TOTALFRAC_STR             ="totalFrac";                  // DBTYPE_I4           总得分

	var M_G_SERVER_GAMEEND_FREE_FIRSTROLE                 =6;   
	var M_G_SERVER_GAMEEND_FREE_FIRSTROLE_STR             ="firstRole";                  // DBTYPE_WVARCHAR     第一个人物的角色名称

	var M_G_SERVER_GAMEEND_FREE_FIRSTLEVEL                =7;   
	var M_G_SERVER_GAMEEND_FREE_FIRSTLEVEL_STR            ="firstLevel";                 // DBTYPE_I4           第一个人物的级别

	var M_G_SERVER_GAMEEND_FREE_FIRSTEXPCHANGE            =8;   
	var M_G_SERVER_GAMEEND_FREE_FIRSTEXPCHANGE_STR        ="firstExpChange";             // DBTYPE_WVARCHAR     第一个人物的rid,之前的等级,经验和第一个人物现在的等级,经验及是否是防沉迷状态及获得的经验,中间用"＃"隔开,

	var M_G_SERVER_GAMEEND_FREE_EXPSTATE                  =9;   
	var M_G_SERVER_GAMEEND_FREE_EXPSTATE_STR              ="expState";                   // DBTYPE_I4           是否为双倍经验

	var M_G_SERVER_GAMEEND_FREE_SECONDROLE                =10;  
	var M_G_SERVER_GAMEEND_FREE_SECONDROLE_STR            ="secondRole";                 // DBTYPE_WVARCHAR     第二个人物的角色名称

	var M_G_SERVER_GAMEEND_FREE_PVEWIN                    =11;  
	var M_G_SERVER_GAMEEND_FREE_PVEWIN_STR                ="pvewin";                     // DBTYPE_I4           如果是pve，获胜了没有，0为失败，1为胜利

	var M_G_SERVER_GAMEEND_FREE_SECONDEXPCHANGE           =12;  
	var M_G_SERVER_GAMEEND_FREE_SECONDEXPCHANGE_STR       ="secondExpChange";            // DBTYPE_WVARCHAR     第二个人物的rid,之前的等级,经验和第一个人物现在的等级,经验及是否是防沉迷状态及获得的经验,中间用"＃"隔开

	var M_G_SERVER_GAMEEND_FREE_SECONDSTATE               =13;  
	var M_G_SERVER_GAMEEND_FREE_SECONDSTATE_STR           ="secondState";                // DBTYPE_I4           

	var M_G_SERVER_GAMEEND_FREE_INDEX                     =14;  
	var M_G_SERVER_GAMEEND_FREE_INDEX_STR                 ="index";                      // DBTYPE_I4           排名

	var M_G_SERVER_GAMEEND_FREE_MAXFRAC                   =15;  
	var M_G_SERVER_GAMEEND_FREE_MAXFRAC_STR               ="MaxFrac";                    // DBTYPE_I4           攻击,生存,技巧最强,111,百位为攻击,十位为生存,个位为技巧,1为最强,0为非最强


	var GAMEEND_GROUP1                                    ="GameEnd_Group1";
	var M_G_SERVER_GAMEEND_GROUP1_ID                      =0;   
	var M_G_SERVER_GAMEEND_GROUP1_ID_STR                  ="id";                         // DBTYPE_I4           界面上显示的顺序

	var M_G_SERVER_GAMEEND_GROUP1_NAME                    =1;   
	var M_G_SERVER_GAMEEND_GROUP1_NAME_STR                ="name";                       // DBTYPE_WVARCHAR     昵称

	var M_G_SERVER_GAMEEND_GROUP1_ATTACK                  =2;   
	var M_G_SERVER_GAMEEND_GROUP1_ATTACK_STR              ="attack";                     // DBTYPE_I4           击杀分

	var M_G_SERVER_GAMEEND_GROUP1_SURVIVAL                =3;   
	var M_G_SERVER_GAMEEND_GROUP1_SURVIVAL_STR            ="survival";                   // DBTYPE_I4           生存分

	var M_G_SERVER_GAMEEND_GROUP1_SKILL                   =4;   
	var M_G_SERVER_GAMEEND_GROUP1_SKILL_STR               ="skill";                      // DBTYPE_I4           技巧分

	var M_G_SERVER_GAMEEND_GROUP1_TOTALFRAC               =5;   
	var M_G_SERVER_GAMEEND_GROUP1_TOTALFRAC_STR           ="totalFrac";                  // DBTYPE_I4           总得分

	var M_G_SERVER_GAMEEND_GROUP1_FIRSTROLE               =6;   
	var M_G_SERVER_GAMEEND_GROUP1_FIRSTROLE_STR           ="firstRole";                  // DBTYPE_WVARCHAR     第一个人物的角色

	var M_G_SERVER_GAMEEND_GROUP1_FIRSTLEVEL              =7;   
	var M_G_SERVER_GAMEEND_GROUP1_FIRSTLEVEL_STR          ="firstLevel";                 // DBTYPE_I4           第一个人物的级别

	var M_G_SERVER_GAMEEND_GROUP1_FIRSTEXPPERCENT         =8;   
	var M_G_SERVER_GAMEEND_GROUP1_FIRSTEXPPERCENT_STR     ="firstExpPercent";            // DBTYPE_I4           第一个人物的经验百分比

	var M_G_SERVER_GAMEEND_GROUP1_FIRSTEXP                =9;   
	var M_G_SERVER_GAMEEND_GROUP1_FIRSTEXP_STR            ="firstExp";                   // DBTYPE_I4           第一个人物获得的经验

	var M_G_SERVER_GAMEEND_GROUP1_SECONDROLE              =10;  
	var M_G_SERVER_GAMEEND_GROUP1_SECONDROLE_STR          ="secondRole";                 // DBTYPE_WVARCHAR     第二个人物的角色

	var M_G_SERVER_GAMEEND_GROUP1_SECONDLEVEL             =11;  
	var M_G_SERVER_GAMEEND_GROUP1_SECONDLEVEL_STR         ="secondLevel";                // DBTYPE_I4           第二个人物的级别

	var M_G_SERVER_GAMEEND_GROUP1_SECONDEXPPERCENT        =12;  
	var M_G_SERVER_GAMEEND_GROUP1_SECONDEXPPERCENT_STR    ="secondExpPercent";           // DBTYPE_I4           第二个人物的经验百分比

	var M_G_SERVER_GAMEEND_GROUP1_SECONDEXP               =13;  
	var M_G_SERVER_GAMEEND_GROUP1_SECONDEXP_STR           ="secondExp";                  // DBTYPE_I4           第二个人物获得的经验

	var M_G_SERVER_GAMEEND_GROUP1_INDEX                   =14;  
	var M_G_SERVER_GAMEEND_GROUP1_INDEX_STR               ="index";                      // DBTYPE_I4           排名

	var M_G_SERVER_GAMEEND_GROUP1_MAXFRAC                 =15;  
	var M_G_SERVER_GAMEEND_GROUP1_MAXFRAC_STR             ="MaxFrac";                    // DBTYPE_I4           攻击,生存,技巧最强,111,百位为攻击,十位为生存,个位为技巧,1为最强,0为非最强


	var GAMEEND_GROUP2                                    ="GameEnd_Group2";
	var M_G_SERVER_GAMEEND_GROUP2_ID                      =0;   
	var M_G_SERVER_GAMEEND_GROUP2_ID_STR                  ="id";                         // DBTYPE_I4           界面上显示的顺序

	var M_G_SERVER_GAMEEND_GROUP2_NAME                    =1;   
	var M_G_SERVER_GAMEEND_GROUP2_NAME_STR                ="name";                       // DBTYPE_WVARCHAR     昵称

	var M_G_SERVER_GAMEEND_GROUP2_ATTACK                  =2;   
	var M_G_SERVER_GAMEEND_GROUP2_ATTACK_STR              ="attack";                     // DBTYPE_I4           击杀分

	var M_G_SERVER_GAMEEND_GROUP2_SURVIVAL                =3;   
	var M_G_SERVER_GAMEEND_GROUP2_SURVIVAL_STR            ="survival";                   // DBTYPE_I4           生存分

	var M_G_SERVER_GAMEEND_GROUP2_SKILL                   =4;   
	var M_G_SERVER_GAMEEND_GROUP2_SKILL_STR               ="skill";                      // DBTYPE_I4           技巧分

	var M_G_SERVER_GAMEEND_GROUP2_TOTALFRAC               =5;   
	var M_G_SERVER_GAMEEND_GROUP2_TOTALFRAC_STR           ="totalFrac";                  // DBTYPE_I4           总得分

	var M_G_SERVER_GAMEEND_GROUP2_FIRSTROLE               =6;   
	var M_G_SERVER_GAMEEND_GROUP2_FIRSTROLE_STR           ="firstRole";                  // DBTYPE_WVARCHAR     第一个人物的角色

	var M_G_SERVER_GAMEEND_GROUP2_FIRSTLEVEL              =7;   
	var M_G_SERVER_GAMEEND_GROUP2_FIRSTLEVEL_STR          ="firstLevel";                 // DBTYPE_I4           第一个人物的级别

	var M_G_SERVER_GAMEEND_GROUP2_FIRSTEXPPERCENT         =8;   
	var M_G_SERVER_GAMEEND_GROUP2_FIRSTEXPPERCENT_STR     ="firstExpPercent";            // DBTYPE_I4           第一个人物的经验百分比

	var M_G_SERVER_GAMEEND_GROUP2_FIRSTEXP                =9;   
	var M_G_SERVER_GAMEEND_GROUP2_FIRSTEXP_STR            ="firstExp";                   // DBTYPE_I4           第一个人物获得的经验

	var M_G_SERVER_GAMEEND_GROUP2_SECONDROLE              =10;  
	var M_G_SERVER_GAMEEND_GROUP2_SECONDROLE_STR          ="secondRole";                 // DBTYPE_WVARCHAR     第二个人物的角色

	var M_G_SERVER_GAMEEND_GROUP2_SECONDLEVEL             =11;  
	var M_G_SERVER_GAMEEND_GROUP2_SECONDLEVEL_STR         ="secondLevel";                // DBTYPE_I4           第二个人物的级别

	var M_G_SERVER_GAMEEND_GROUP2_SECONDEXPPERCENT        =12;  
	var M_G_SERVER_GAMEEND_GROUP2_SECONDEXPPERCENT_STR    ="secondExpPercent";           // DBTYPE_I4           第二个人物的经验百分比

	var M_G_SERVER_GAMEEND_GROUP2_SECONDEXP               =13;  
	var M_G_SERVER_GAMEEND_GROUP2_SECONDEXP_STR           ="secondExp";                  // DBTYPE_I4           第二个人物获得的经验

	var M_G_SERVER_GAMEEND_GROUP2_INDEX                   =14;  
	var M_G_SERVER_GAMEEND_GROUP2_INDEX_STR               ="index";                      // DBTYPE_I4           排名

	var M_G_SERVER_GAMEEND_GROUP2_MAXFRAC                 =15;  
	var M_G_SERVER_GAMEEND_GROUP2_MAXFRAC_STR             ="MaxFrac";                    // DBTYPE_I4           攻击,生存,技巧最强,111,百位为攻击,十位为生存,个位为技巧,1为最强,0为非最强


	var GMCOMMAND                                         ="GmCommand";
	var M_G_SERVER_GMCOMMAND_ENTRYID                      =0;   
	var M_G_SERVER_GMCOMMAND_ENTRYID_STR                  ="EntryId";                    // DBTYPE_I4           GM识别id

	var M_G_SERVER_GMCOMMAND_AUTHORITY                    =1;   
	var M_G_SERVER_GMCOMMAND_AUTHORITY_STR                ="Authority";                  // DBTYPE_I4           权限

	var M_G_SERVER_GMCOMMAND_COMMAND                      =2;   
	var M_G_SERVER_GMCOMMAND_COMMAND_STR                  ="Command";                    // DBTYPE_WVARCHAR     命令

	var M_G_SERVER_GMCOMMAND_CALLFUN                      =3;   
	var M_G_SERVER_GMCOMMAND_CALLFUN_STR                  ="CallFun";                    // DBTYPE_WVARCHAR     调用函数

	var M_G_SERVER_GMCOMMAND_CALLPARAM                    =4;   
	var M_G_SERVER_GMCOMMAND_CALLPARAM_STR                ="CallParam";                  // DBTYPE_WVARCHAR     调用参数

	var M_G_SERVER_GMCOMMAND_EXAMPLE                      =5;   
	var M_G_SERVER_GMCOMMAND_EXAMPLE_STR                  ="Example";                    // DBTYPE_WVARCHAR     例子

	var M_G_SERVER_GMCOMMAND_DESCRIBE                     =6;   
	var M_G_SERVER_GMCOMMAND_DESCRIBE_STR                 ="Describe";                   // DBTYPE_WVARCHAR     描述


	var JIVEWARTEAM                                       ="jiveWarTeam";
	var M_G_SERVER_JIVEWARTEAM_JID                        =0;   
	var M_G_SERVER_JIVEWARTEAM_JID_STR                    ="jid";                        // DBTYPE_I4           jid

	var M_G_SERVER_JIVEWARTEAM_NICKNAME                   =1;   
	var M_G_SERVER_JIVEWARTEAM_NICKNAME_STR               ="nickName";                   // DBTYPE_WVARCHAR     昵称

	var M_G_SERVER_JIVEWARTEAM_TEAMID                     =2;   
	var M_G_SERVER_JIVEWARTEAM_TEAMID_STR                 ="teamID";                     // DBTYPE_I4           队伍id

	var M_G_SERVER_JIVEWARTEAM_STATE                      =3;   
	var M_G_SERVER_JIVEWARTEAM_STATE_STR                  ="state";                      // DBTYPE_I4           状态 0:此人不在战队 1:正常

	var M_G_SERVER_JIVEWARTEAM_SCORE                      =4;   
	var M_G_SERVER_JIVEWARTEAM_SCORE_STR                  ="score";                      // DBTYPE_I4           个人积分

	var M_G_SERVER_JIVEWARTEAM_POINT                      =5;   
	var M_G_SERVER_JIVEWARTEAM_POINT_STR                  ="point";                      // DBTYPE_I4           个人荣誉点

	var M_G_SERVER_JIVEWARTEAM_WEEKWIN                    =6;   
	var M_G_SERVER_JIVEWARTEAM_WEEKWIN_STR                ="weekWin";                    // DBTYPE_I4           本周胜利次数

	var M_G_SERVER_JIVEWARTEAM_WEEKLOST                   =7;   
	var M_G_SERVER_JIVEWARTEAM_WEEKLOST_STR               ="weekLost";                   // DBTYPE_I4           本周失败次数

	var M_G_SERVER_JIVEWARTEAM_OFTENWEAPONUSETYPE         =8;   
	var M_G_SERVER_JIVEWARTEAM_OFTENWEAPONUSETYPE_STR     ="oftenWeaponUseType";         // DBTYPE_I4           经常使用的武器类型

	var M_G_SERVER_JIVEWARTEAM_OFTENWEAPONUSENUM          =9;   
	var M_G_SERVER_JIVEWARTEAM_OFTENWEAPONUSENUM_STR      ="oftenWeaponUseNum";          // DBTYPE_I4           经常使用武器的次数

	var M_G_SERVER_JIVEWARTEAM_WEAPONUSETOTAL             =10;  
	var M_G_SERVER_JIVEWARTEAM_WEAPONUSETOTAL_STR         ="weaponUseTotal";             // DBTYPE_I4           总使用武器的次数

	var M_G_SERVER_JIVEWARTEAM_WINNUM                     =11;  
	var M_G_SERVER_JIVEWARTEAM_WINNUM_STR                 ="winNum";                     // DBTYPE_I4           总胜利次数

	var M_G_SERVER_JIVEWARTEAM_LOSTNUM                    =12;  
	var M_G_SERVER_JIVEWARTEAM_LOSTNUM_STR                ="lostNum";                    // DBTYPE_I4           总失败次数

	var M_G_SERVER_JIVEWARTEAM_POPEDOM                    =13;  
	var M_G_SERVER_JIVEWARTEAM_POPEDOM_STR                ="popedom";                    // DBTYPE_I4           地位 队长 普通队员等等

	var M_G_SERVER_JIVEWARTEAM_WEAPONUSE                  =14;  
	var M_G_SERVER_JIVEWARTEAM_WEAPONUSE_STR              ="weaponUse";                  // DBTYPE_WVARCHAR     武器使用次数

	var M_G_SERVER_JIVEWARTEAM_CANDO                      =15;  
	var M_G_SERVER_JIVEWARTEAM_CANDO_STR                  ="canDo";                      // DBTYPE_WVARCHAR     成员的权限 能做什么事情 加人踢人等等

	var M_G_SERVER_JIVEWARTEAM_ONLINE                     =16;  
	var M_G_SERVER_JIVEWARTEAM_ONLINE_STR                 ="online";                     // DBTYPE_I4           1在线，0不在线

	var M_G_SERVER_JIVEWARTEAM_LEVEL                      =17;  
	var M_G_SERVER_JIVEWARTEAM_LEVEL_STR                  ="level";                      // DBTYPE_I4           等级


	var JIVEWARTEAMINI                                    ="jiveWarTeamINI";
	var M_G_SERVER_JIVEWARTEAMINI_ID                      =0;   
	var M_G_SERVER_JIVEWARTEAMINI_ID_STR                  ="id";                         // DBTYPE_I4           战队的ID

	var M_G_SERVER_JIVEWARTEAMINI_CREATEID                =1;   
	var M_G_SERVER_JIVEWARTEAMINI_CREATEID_STR            ="createID";                   // DBTYPE_I4           创建人的id

	var M_G_SERVER_JIVEWARTEAMINI_CREATENKNAME            =2;   
	var M_G_SERVER_JIVEWARTEAMINI_CREATENKNAME_STR        ="createNkname";               // DBTYPE_WVARCHAR     创建人的昵称

	var M_G_SERVER_JIVEWARTEAMINI_TEAMNAME                =3;   
	var M_G_SERVER_JIVEWARTEAMINI_TEAMNAME_STR            ="teamName";                   // DBTYPE_WVARCHAR     战队名字

	var M_G_SERVER_JIVEWARTEAMINI_STATE                   =4;   
	var M_G_SERVER_JIVEWARTEAMINI_STATE_STR               ="state";                      // DBTYPE_I4           战队状态 0:表示已经不存在 1:正常

	var M_G_SERVER_JIVEWARTEAMINI_CURRPEOPLE              =5;   
	var M_G_SERVER_JIVEWARTEAMINI_CURRPEOPLE_STR          ="currPeople";                 // DBTYPE_I4           战队当前人数

	var M_G_SERVER_JIVEWARTEAMINI_MAXPEOPLE               =6;   
	var M_G_SERVER_JIVEWARTEAMINI_MAXPEOPLE_STR           ="maxPeople";                  // DBTYPE_I4           战队最大人数

	var M_G_SERVER_JIVEWARTEAMINI_SCORE                   =7;   
	var M_G_SERVER_JIVEWARTEAMINI_SCORE_STR               ="score";                      // DBTYPE_I4           战队积分

	var M_G_SERVER_JIVEWARTEAMINI_POINT                   =8;   
	var M_G_SERVER_JIVEWARTEAMINI_POINT_STR               ="point";                      // DBTYPE_I4           战队荣誉点数

	var M_G_SERVER_JIVEWARTEAMINI_TYPE                    =9;   
	var M_G_SERVER_JIVEWARTEAMINI_TYPE_STR                ="type";                       // DBTYPE_I4           战队类型

	var M_G_SERVER_JIVEWARTEAMINI_WEEKWINNUM              =10;  
	var M_G_SERVER_JIVEWARTEAMINI_WEEKWINNUM_STR          ="weekWinNum";                 // DBTYPE_I4           一周胜利场次

	var M_G_SERVER_JIVEWARTEAMINI_WEEKLOSTNUM             =11;  
	var M_G_SERVER_JIVEWARTEAMINI_WEEKLOSTNUM_STR         ="weekLostNum";                // DBTYPE_I4           一周失败场次

	var M_G_SERVER_JIVEWARTEAMINI_WINNUM                  =12;  
	var M_G_SERVER_JIVEWARTEAMINI_WINNUM_STR              ="winNum";                     // DBTYPE_I4           胜利总场次

	var M_G_SERVER_JIVEWARTEAMINI_LOSTNUM                 =13;  
	var M_G_SERVER_JIVEWARTEAMINI_LOSTNUM_STR             ="lostNum";                    // DBTYPE_I4           失败总场次

	var M_G_SERVER_JIVEWARTEAMINI_HIGHSOCRE               =14;  
	var M_G_SERVER_JIVEWARTEAMINI_HIGHSOCRE_STR           ="highsocre";                  // DBTYPE_I4           最高积分


	var QUEUEDT                                           ="queuedt";
	var M_G_SERVER_QUEUEDT_ID                             =0;   
	var M_G_SERVER_QUEUEDT_ID_STR                         ="id";                         // DBTYPE_NUMERIC      唯一id

	var M_G_SERVER_QUEUEDT_RACEID                         =1;   
	var M_G_SERVER_QUEUEDT_RACEID_STR                     ="raceID";                     // DBTYPE_I4           活动id

	var M_G_SERVER_QUEUEDT_RACESTATE                      =2;   
	var M_G_SERVER_QUEUEDT_RACESTATE_STR                  ="raceState";                  // DBTYPE_I4           活动状态 0.没有 1.报名了,等待消息返回 2.已经报名活动 3.进入游戏 4.活动结算

	var M_G_SERVER_QUEUEDT_GROUPID                        =3;   
	var M_G_SERVER_QUEUEDT_GROUPID_STR                    ="groupID";                    // DBTYPE_I4           报名的组id

	var M_G_SERVER_QUEUEDT_SCORE1                         =4;   
	var M_G_SERVER_QUEUEDT_SCORE1_STR                     ="score1";                     // DBTYPE_I4           分数1

	var M_G_SERVER_QUEUEDT_SCORE2                         =5;   
	var M_G_SERVER_QUEUEDT_SCORE2_STR                     ="score2";                     // DBTYPE_I4           分数2

	var M_G_SERVER_QUEUEDT_SCORE3                         =6;   
	var M_G_SERVER_QUEUEDT_SCORE3_STR                     ="score3";                     // DBTYPE_I4           分数3

	var M_G_SERVER_QUEUEDT_SCORE4                         =7;   
	var M_G_SERVER_QUEUEDT_SCORE4_STR                     ="score4";                     // DBTYPE_I4           分数4

	var M_G_SERVER_QUEUEDT_SCORE5                         =8;   
	var M_G_SERVER_QUEUEDT_SCORE5_STR                     ="score5";                     // DBTYPE_I4           分数5

	var M_G_SERVER_QUEUEDT_TEAMID                         =9;   
	var M_G_SERVER_QUEUEDT_TEAMID_STR                     ="teamID";                     // DBTYPE_I4           队伍id(如果是队伍)

	var M_G_SERVER_QUEUEDT_CREATEID                       =10;  
	var M_G_SERVER_QUEUEDT_CREATEID_STR                   ="createID";                   // DBTYPE_I4           队伍创建者id

	var M_G_SERVER_QUEUEDT_TEAMMATE                       =11;  
	var M_G_SERVER_QUEUEDT_TEAMMATE_STR                   ="teamMate";                   // DBTYPE_I4           队伍成员

	var M_G_SERVER_QUEUEDT_DATA1                          =12;  
	var M_G_SERVER_QUEUEDT_DATA1_STR                      ="data1";                      // DBTYPE_I4           队伍数据1,脚本用


	var RELATION                                          ="relation";
	var M_G_SERVER_RELATION_KEY                           =0;   
	var M_G_SERVER_RELATION_KEY_STR                       ="Key";                        // DBTYPE_NUMERIC      由两个id组成的

	var M_G_SERVER_RELATION_BID                           =1;   
	var M_G_SERVER_RELATION_BID_STR                       ="BId";                        // DBTYPE_I4           大的id

	var M_G_SERVER_RELATION_SID                           =2;   
	var M_G_SERVER_RELATION_SID_STR                       ="SId";                        // DBTYPE_I4           小的id

	var M_G_SERVER_RELATION_PPRIVITY                      =3;   
	var M_G_SERVER_RELATION_PPRIVITY_STR                  ="PPrivity";                   // DBTYPE_I4           搭档默契度

	var M_G_SERVER_RELATION_PWINNUM                       =4;   
	var M_G_SERVER_RELATION_PWINNUM_STR                   ="PWinNum";                    // DBTYPE_I4           搭档胜利场次

	var M_G_SERVER_RELATION_PTOTALNUM                     =5;   
	var M_G_SERVER_RELATION_PTOTALNUM_STR                 ="PTotalNum";                  // DBTYPE_I4           搭档总场次

	var M_G_SERVER_RELATION_PTEAMLEADER                   =6;   
	var M_G_SERVER_RELATION_PTEAMLEADER_STR               ="PTeamLeader";                // DBTYPE_I4           搭档的队长 1:大ID为队长 2:小ID为队长

	var M_G_SERVER_RELATION_PCURRENT                      =7;   
	var M_G_SERVER_RELATION_PCURRENT_STR                  ="PCurrent";                   // DBTYPE_I4           是否为当前搭档 1:是 0:否

	var M_G_SERVER_RELATION_PSTATE                        =8;   
	var M_G_SERVER_RELATION_PSTATE_STR                    ="PState";                     // DBTYPE_I4           是否为搭档 1:是 0:否

	var M_G_SERVER_RELATION_PDATA1                        =9;   
	var M_G_SERVER_RELATION_PDATA1_STR                    ="PData1";                     // DBTYPE_I4           搭档预留字段1 现在用来标识搭档解除后,被解除玩家上线时用的标志,1表示提示大id对小id解除了搭档,2表示小id对大id解除了搭档 邮件功能 任务清理

	var M_G_SERVER_RELATION_PDATA2                        =10;  
	var M_G_SERVER_RELATION_PDATA2_STR                    ="PData2";                     // DBTYPE_I4           搭档预留字段2

	var M_G_SERVER_RELATION_PDATA3                        =11;  
	var M_G_SERVER_RELATION_PDATA3_STR                    ="PData3";                     // DBTYPE_I4           搭档预留字段3

	var M_G_SERVER_RELATION_WFEELS1                       =12;  
	var M_G_SERVER_RELATION_WFEELS1_STR                   ="WFeels1";                    // DBTYPE_I4           大ID对小ID的好感度

	var M_G_SERVER_RELATION_WFEELS2                       =13;  
	var M_G_SERVER_RELATION_WFEELS2_STR                   ="WFeels2";                    // DBTYPE_I4           小ID对大ID的好感度

	var M_G_SERVER_RELATION_WSTATE                        =14;  
	var M_G_SERVER_RELATION_WSTATE_STR                    ="WState";                     // DBTYPE_I4           是否为密友 1:是 0:否

	var M_G_SERVER_RELATION_WLOVES                        =15;  
	var M_G_SERVER_RELATION_WLOVES_STR                    ="WLoves";                     // DBTYPE_I4           情侣的爱情指数

	var M_G_SERVER_RELATION_WTIME                         =16;  
	var M_G_SERVER_RELATION_WTIME_STR                     ="WTime";                      // DBTYPE_NUMERIC      成为情侣的时间

	var M_G_SERVER_RELATION_WCOUPLE                       =17;  
	var M_G_SERVER_RELATION_WCOUPLE_STR                   ="WCouple";                    // DBTYPE_I4           是否为情侣 1:是 0:否

	var M_G_SERVER_RELATION_WWINNUM                       =18;  
	var M_G_SERVER_RELATION_WWINNUM_STR                   ="WWinNum";                    // DBTYPE_I4           情侣的胜利场次

	var M_G_SERVER_RELATION_WTOTALNUM                     =19;  
	var M_G_SERVER_RELATION_WTOTALNUM_STR                 ="WTotalNum";                  // DBTYPE_I4           情侣的总场次

	var M_G_SERVER_RELATION_WTOTALSCORE                   =20;  
	var M_G_SERVER_RELATION_WTOTALSCORE_STR               ="WTotalScore";                // DBTYPE_I4           情侣的总得分

	var M_G_SERVER_RELATION_WBADDISH                      =21;  
	var M_G_SERVER_RELATION_WBADDISH_STR                  ="WBaddish";                   // DBTYPE_I4           情侣的档次 1:黄铜 2:白银 3:黄金

	var M_G_SERVER_RELATION_WDATA1                        =22;  
	var M_G_SERVER_RELATION_WDATA1_STR                    ="WData1";                     // DBTYPE_I4           情侣预留字段1 现在用来标识情侣解除后,被解除玩家上线时用的标志 1表示提示大id对小id解除了情侣,2表示小id对大id解除了情侣 邮件功能 任务清理

	var M_G_SERVER_RELATION_WDATA2                        =23;  
	var M_G_SERVER_RELATION_WDATA2_STR                    ="WData2";                     // DBTYPE_I4           情侣预留字段2 现在用来表示密友解除后,被解除玩家上线时用的标志 1表示提示大id对小id解除了情侣,2表示小id对大id解除了情侣 任务清理

	var M_G_SERVER_RELATION_WDATA3                        =24;  
	var M_G_SERVER_RELATION_WDATA3_STR                    ="WData3";                     // DBTYPE_I4           情侣预留字段3

	var M_G_SERVER_RELATION_NKNAME                        =25;  
	var M_G_SERVER_RELATION_NKNAME_STR                    ="NkName";                     // DBTYPE_WVARCHAR     大ID用户昵称,用户不在线时读取

	var M_G_SERVER_RELATION_LV                            =26;  
	var M_G_SERVER_RELATION_LV_STR                        ="Lv";                         // DBTYPE_I4           大ID用户等级,用户不在线时读取

	var M_G_SERVER_RELATION_ROLETYPE                      =27;  
	var M_G_SERVER_RELATION_ROLETYPE_STR                  ="RoleType";                   // DBTYPE_I4           大ID角色类型,用户不在线时读取

	var M_G_SERVER_RELATION_ROLESHOW                      =28;  
	var M_G_SERVER_RELATION_ROLESHOW_STR                  ="RoleShow";                   // DBTYPE_WVARCHAR     大ID角色显示数据,以逗号来分隔

	var M_G_SERVER_RELATION_SEX                           =29;  
	var M_G_SERVER_RELATION_SEX_STR                       ="Sex";                        // DBTYPE_I4           大ID角色性别 1:男 2:女

	var M_G_SERVER_RELATION_SNKNAME                       =30;  
	var M_G_SERVER_RELATION_SNKNAME_STR                   ="SNkName";                    // DBTYPE_WVARCHAR     小ID用户昵称,用户不在线时读取

	var M_G_SERVER_RELATION_SLV                           =31;  
	var M_G_SERVER_RELATION_SLV_STR                       ="SLv";                        // DBTYPE_I4           小ID用户等级,用户不在线时读取

	var M_G_SERVER_RELATION_SROLETYPE                     =32;  
	var M_G_SERVER_RELATION_SROLETYPE_STR                 ="SRoleType";                  // DBTYPE_I4           小ID角色类型,用户不在线时读取

	var M_G_SERVER_RELATION_SROLESHOW                     =33;  
	var M_G_SERVER_RELATION_SROLESHOW_STR                 ="SRoleShow";                  // DBTYPE_WVARCHAR     小ID角色显示数据,以逗号来分隔

	var M_G_SERVER_RELATION_SSEX                          =34;  
	var M_G_SERVER_RELATION_SSEX_STR                      ="SSex";                       // DBTYPE_I4           小ID角色性别 1:男 2:女


	var ROLEDT                                            ="roledt";
	var M_G_SERVER_ROLEDT_RID                             =0;   
	var M_G_SERVER_ROLEDT_RID_STR                         ="rid";                        // DBTYPE_I4           0

	var M_G_SERVER_ROLEDT_UID                             =1;   
	var M_G_SERVER_ROLEDT_UID_STR                         ="uid";                        // DBTYPE_I4           1 用户ID

	var M_G_SERVER_ROLEDT_RDEFID                          =2;   
	var M_G_SERVER_ROLEDT_RDEFID_STR                      ="rdefid";                     // DBTYPE_I4           2 角色定义表

	var M_G_SERVER_ROLEDT_FORCE                           =3;   
	var M_G_SERVER_ROLEDT_FORCE_STR                       ="Force";                      // DBTYPE_I4           3 力量：攻击力。

	var M_G_SERVER_ROLEDT_CELERITY                        =4;   
	var M_G_SERVER_ROLEDT_CELERITY_STR                    ="Celerity";                   // DBTYPE_I4           4 敏捷：防御力。

	var M_G_SERVER_ROLEDT_CONSTITUTION                    =5;   
	var M_G_SERVER_ROLEDT_CONSTITUTION_STR                ="Constitution";               // DBTYPE_I4           5 体质：生命值

	var M_G_SERVER_ROLEDT_SNAP                            =6;   
	var M_G_SERVER_ROLEDT_SNAP_STR                        ="Snap";                       // DBTYPE_I4           6 活力：体力回复。

	var M_G_SERVER_ROLEDT_ATTACKMIN                       =7;   
	var M_G_SERVER_ROLEDT_ATTACKMIN_STR                   ="AttackMin";                  // DBTYPE_I4           7 攻击：人物所能给对象造成伤害的最小值。

	var M_G_SERVER_ROLEDT_ATTACKMAX                       =8;   
	var M_G_SERVER_ROLEDT_ATTACKMAX_STR                   ="AttackMax";                  // DBTYPE_I4           8 攻击：人物所能给对象造成伤害的最大值。

	var M_G_SERVER_ROLEDT_RECOVERY                        =9;   
	var M_G_SERVER_ROLEDT_RECOVERY_STR                    ="Recovery";                   // DBTYPE_I4           9 防御：人物对受到伤害的豁免程度。

	var M_G_SERVER_ROLEDT_LIFE                            =10;  
	var M_G_SERVER_ROLEDT_LIFE_STR                        ="Life";                       // DBTYPE_I4           10 生命值：人物的生命最大值。

	var M_G_SERVER_ROLEDT_ENERGY                          =11;  
	var M_G_SERVER_ROLEDT_ENERGY_STR                      ="Energy";                     // DBTYPE_I4           11 体力：人物的体力最大值。

	var M_G_SERVER_ROLEDT_RESUMEENERGY                    =12;  
	var M_G_SERVER_ROLEDT_RESUMEENERGY_STR                ="ResumeEnergy";               // DBTYPE_I4           12 回体：人物回复体力的速度。

	var M_G_SERVER_ROLEDT_RESUMELIFE                      =13;  
	var M_G_SERVER_ROLEDT_RESUMELIFE_STR                  ="ResumeLife";                 // DBTYPE_I4           13 回血：人物回复生命的速度。

	var M_G_SERVER_ROLEDT_SPEED                           =14;  
	var M_G_SERVER_ROLEDT_SPEED_STR                       ="Speed";                      // DBTYPE_R4           14 速度：人物移动的速度。

	var M_G_SERVER_ROLEDT_CULIFE                          =15;  
	var M_G_SERVER_ROLEDT_CULIFE_STR                      ="CuLife";                     // DBTYPE_I4           15 当前血量

	var M_G_SERVER_ROLEDT_CUEXP                           =16;  
	var M_G_SERVER_ROLEDT_CUEXP_STR                       ="CuExp";                      // DBTYPE_I4           16 当前经验

	var M_G_SERVER_ROLEDT_CULEVEL                         =17;  
	var M_G_SERVER_ROLEDT_CULEVEL_STR                     ="CuLevel";                    // DBTYPE_I4           17 当前等级

	var M_G_SERVER_ROLEDT_MAXENERGY                       =18;  
	var M_G_SERVER_ROLEDT_MAXENERGY_STR                   ="MaxEnergy";                  // DBTYPE_I4           18 最大体力

	var M_G_SERVER_ROLEDT_CUENERGY                        =19;  
	var M_G_SERVER_ROLEDT_CUENERGY_STR                    ="CuEnergy";                   // DBTYPE_I4           19 当前体力

	var M_G_SERVER_ROLEDT_DOWER                           =20;  
	var M_G_SERVER_ROLEDT_DOWER_STR                       ="Dower";                      // DBTYPE_LONGVARBINARY20 天赋存放空间

	var M_G_SERVER_ROLEDT_SKILL                           =21;  
	var M_G_SERVER_ROLEDT_SKILL_STR                       ="Skill";                      // DBTYPE_LONGVARBINARY21

	var M_G_SERVER_ROLEDT_AWTORID0                        =22;  
	var M_G_SERVER_ROLEDT_AWTORID0_STR                    ="AwtorId0";                   // DBTYPE_I4           22 第一个部件id对应parts中的ID:头发

	var M_G_SERVER_ROLEDT_AWTORID1                        =23;  
	var M_G_SERVER_ROLEDT_AWTORID1_STR                    ="AwtorId1";                   // DBTYPE_I4           23 第二个部件id对应parts中的ID:五官

	var M_G_SERVER_ROLEDT_AWTORID2                        =24;  
	var M_G_SERVER_ROLEDT_AWTORID2_STR                    ="AwtorId2";                   // DBTYPE_I4           24 第三个部件id对应parts中的ID:上装

	var M_G_SERVER_ROLEDT_AWTORID3                        =25;  
	var M_G_SERVER_ROLEDT_AWTORID3_STR                    ="AwtorId3";                   // DBTYPE_I4           25 第四个部件id对应parts中的ID:裙/裤

	var M_G_SERVER_ROLEDT_AWTORID4                        =26;  
	var M_G_SERVER_ROLEDT_AWTORID4_STR                    ="AwtorId4";                   // DBTYPE_I4           26 第五个部件id对应parts中的ID:手套

	var M_G_SERVER_ROLEDT_AWTORID5                        =27;  
	var M_G_SERVER_ROLEDT_AWTORID5_STR                    ="AwtorId5";                   // DBTYPE_I4           27 第六个部件id对应道具的ID:袜

	var M_G_SERVER_ROLEDT_AWTORID6                        =28;  
	var M_G_SERVER_ROLEDT_AWTORID6_STR                    ="AwtorId6";                   // DBTYPE_I4           28 第七个部件id对应道具的ID:鞋

	var M_G_SERVER_ROLEDT_AWTORID7                        =29;  
	var M_G_SERVER_ROLEDT_AWTORID7_STR                    ="AwtorId7";                   // DBTYPE_I4           29 第八个部件id对应道具的ID:背饰

	var M_G_SERVER_ROLEDT_AWTORID8                        =30;  
	var M_G_SERVER_ROLEDT_AWTORID8_STR                    ="AwtorId8";                   // DBTYPE_I4           30 第九个部件id对应道具的ID:球拍

	var M_G_SERVER_ROLEDT_AWTORID9                        =31;  
	var M_G_SERVER_ROLEDT_AWTORID9_STR                    ="AwtorId9";                   // DBTYPE_I4           31 第十个部件id对应道具的ID:眼镜

	var M_G_SERVER_ROLEDT_AWTORID10                       =32;  
	var M_G_SERVER_ROLEDT_AWTORID10_STR                   ="AwtorId10";                  // DBTYPE_I4           32 第一个部件id对应parts中的ID(时装):护腕/手链

	var M_G_SERVER_ROLEDT_AWTORID11                       =33;  
	var M_G_SERVER_ROLEDT_AWTORID11_STR                   ="AwtorId11";                  // DBTYPE_I4           33 第二个部件id对应parts中的ID(时装):项链

	var M_G_SERVER_ROLEDT_AWTORID12                       =34;  
	var M_G_SERVER_ROLEDT_AWTORID12_STR                   ="AwtorId12";                  // DBTYPE_I4           34 第三个部件id对应parts中的ID(时装):附件

	var M_G_SERVER_ROLEDT_AWTORID13                       =35;  
	var M_G_SERVER_ROLEDT_AWTORID13_STR                   ="AwtorId13";                  // DBTYPE_I4           35 第四个部件id对应parts中的ID(时装)

	var M_G_SERVER_ROLEDT_AWTORID14                       =36;  
	var M_G_SERVER_ROLEDT_AWTORID14_STR                   ="AwtorId14";                  // DBTYPE_I4           36 第五个部件id对应parts中的ID(时装)

	var M_G_SERVER_ROLEDT_RPVEWINCOUNT                    =37;  
	var M_G_SERVER_ROLEDT_RPVEWINCOUNT_STR                ="RPveWinCount";               // DBTYPE_I4           37 角色PVE胜利次数

	var M_G_SERVER_ROLEDT_RPVPWINCOUNT                    =38;  
	var M_G_SERVER_ROLEDT_RPVPWINCOUNT_STR                ="RPvpWinCount";               // DBTYPE_I4           38 角色PVP胜利次数

	var M_G_SERVER_ROLEDT_RPVEWARCOUNT                    =39;  
	var M_G_SERVER_ROLEDT_RPVEWARCOUNT_STR                ="RPveWarCount";               // DBTYPE_I4           39 角色PVE战斗场次

	var M_G_SERVER_ROLEDT_RPVPWARCOUNT                    =40;  
	var M_G_SERVER_ROLEDT_RPVPWARCOUNT_STR                ="RPvpWarcount";               // DBTYPE_I4           40 角色PVP战斗场次

	var M_G_SERVER_ROLEDT_BODYRADIUS                      =41;  
	var M_G_SERVER_ROLEDT_BODYRADIUS_STR                  ="BodyRadius";                 // DBTYPE_R4           41 角色半径。根据这个半径挤人

	var M_G_SERVER_ROLEDT_BODYHEIGHT                      =42;  
	var M_G_SERVER_ROLEDT_BODYHEIGHT_STR                  ="BodyHeight";                 // DBTYPE_R4           42 高度，人的高度，挤人用

	var M_G_SERVER_ROLEDT_BODYMASS                        =43;  
	var M_G_SERVER_ROLEDT_BODYMASS_STR                    ="BodyMass";                   // DBTYPE_R4           43 质量。挤人用，越重越难挤动

	var M_G_SERVER_ROLEDT_ARROWPOSX                       =44;  
	var M_G_SERVER_ROLEDT_ARROWPOSX_STR                   ="ArrowPosX";                  // DBTYPE_R4           44 远程武器发射位置。多个发射点（左投右投）怎么办

	var M_G_SERVER_ROLEDT_ARROWPOSY                       =45;  
	var M_G_SERVER_ROLEDT_ARROWPOSY_STR                   ="ArrowPosY";                  // DBTYPE_R4           45

	var M_G_SERVER_ROLEDT_ARROWPOSZ                       =46;  
	var M_G_SERVER_ROLEDT_ARROWPOSZ_STR                   ="ArrowPosZ";                  // DBTYPE_R4           46

	var M_G_SERVER_ROLEDT_SKILLPOINT                      =47;  
	var M_G_SERVER_ROLEDT_SKILLPOINT_STR                  ="SkillPoint";                 // DBTYPE_I4           47 技能点

	var M_G_SERVER_ROLEDT_BODYTHIS                        =48;  
	var M_G_SERVER_ROLEDT_BODYTHIS_STR                    ="bodythis";                   // DBTYPE_I4           48 Body 指针 走的时候 删除

	var M_G_SERVER_ROLEDT_TSTRENGTH                       =49;  
	var M_G_SERVER_ROLEDT_TSTRENGTH_STR                   ="TStrength";                  // DBTYPE_I4           49 网球 力量

	var M_G_SERVER_ROLEDT_TSKILL                          =50;  
	var M_G_SERVER_ROLEDT_TSKILL_STR                      ="TSkill";                     // DBTYPE_I4           50 网球 技巧

	var M_G_SERVER_ROLEDT_TFORCEHAND                      =51;  
	var M_G_SERVER_ROLEDT_TFORCEHAND_STR                  ="TForceHand";                 // DBTYPE_I4           51 网球 网前

	var M_G_SERVER_ROLEDT_TBACKHAND                       =52;  
	var M_G_SERVER_ROLEDT_TBACKHAND_STR                   ="TBackHand";                  // DBTYPE_I4           52 网球 后场

	var M_G_SERVER_ROLEDT_DTINIT                          =53;  
	var M_G_SERVER_ROLEDT_DTINIT_STR                      ="DtInit";                     // DBTYPE_I4           53

	var M_G_SERVER_ROLEDT_TSERVEFULL                      =54;  
	var M_G_SERVER_ROLEDT_TSERVEFULL_STR                  ="TServeFull";                 // DBTYPE_I4           54 网球 发球满力

	var M_G_SERVER_ROLEDT_TENERGY                         =55;  
	var M_G_SERVER_ROLEDT_TENERGY_STR                     ="TEnergy";                    // DBTYPE_I4           55 网球 能量

	var M_G_SERVER_ROLEDT_TCHARACTER                      =56;  
	var M_G_SERVER_ROLEDT_TCHARACTER_STR                  ="TCharacter";                 // DBTYPE_I4           56 角色的性格:男（1俊朗型 2.冷酷型 3.阳光型） 女（1.可爱型 2.冷艳型 3.靓丽型）

	var M_G_SERVER_ROLEDT_BULLET                          =57;  
	var M_G_SERVER_ROLEDT_BULLET_STR                      ="Bullet";                     // DBTYPE_I4           57 子弹数

	var M_G_SERVER_ROLEDT_DEFAULTAWTOR                    =58;  
	var M_G_SERVER_ROLEDT_DEFAULTAWTOR_STR                ="DefaultAwtor";               // DBTYPE_WVARCHAR     58 默认的Awtor信息

	var M_G_SERVER_ROLEDT_SYNSKILL                        =59;  
	var M_G_SERVER_ROLEDT_SYNSKILL_STR                    ="SynSkill";                   // DBTYPE_WVARCHAR     59 技能存放空间

	var M_G_SERVER_ROLEDT_TSTAMINA                        =60;  
	var M_G_SERVER_ROLEDT_TSTAMINA_STR                    ="TStamina";                   // DBTYPE_I4           60 网球 体力


	var STACORDT                                          ="StaCorDt";
	var M_G_SERVER_STACORDT_AID                           =0;   
	var M_G_SERVER_STACORDT_AID_STR                       ="aid";                        // DBTYPE_I4           

	var M_G_SERVER_STACORDT_RID                           =1;   
	var M_G_SERVER_STACORDT_RID_STR                       ="rid";                        // DBTYPE_I4           1 角色ID

	var M_G_SERVER_STACORDT_ACTID                         =2;   
	var M_G_SERVER_STACORDT_ACTID_STR                     ="actid";                      // DBTYPE_I4           2 动作ID

	var M_G_SERVER_STACORDT_MANUAL_INCRESE                =3;   
	var M_G_SERVER_STACORDT_MANUAL_INCRESE_STR            ="manual_increse";             // DBTYPE_I4           3 减少体力修正

	var M_G_SERVER_STACORDT_SPEED1                        =4;   
	var M_G_SERVER_STACORDT_SPEED1_STR                    ="speed1";                     // DBTYPE_I4           4 速度1修正

	var M_G_SERVER_STACORDT_SPEED2                        =5;   
	var M_G_SERVER_STACORDT_SPEED2_STR                    ="speed2";                     // DBTYPE_I4           5 速度2修正

	var M_G_SERVER_STACORDT_SPEED3                        =6;   
	var M_G_SERVER_STACORDT_SPEED3_STR                    ="speed3";                     // DBTYPE_I4           6 速度3修正

	var M_G_SERVER_STACORDT_ATTACKMIN                     =7;   
	var M_G_SERVER_STACORDT_ATTACKMIN_STR                 ="AttackMin";                  // DBTYPE_I4           7 最小伤害修正

	var M_G_SERVER_STACORDT_ATTACKMAX                     =8;   
	var M_G_SERVER_STACORDT_ATTACKMAX_STR                 ="AttackMax";                  // DBTYPE_I4           8 最大伤害修正

	var M_G_SERVER_STACORDT_FORCE                         =9;   
	var M_G_SERVER_STACORDT_FORCE_STR                     ="Force";                      // DBTYPE_I4           9 攻击力修正

	var M_G_SERVER_STACORDT_SNAP                          =10;  
	var M_G_SERVER_STACORDT_SNAP_STR                      ="Snap";                       // DBTYPE_I4           10 体力恢复修正

	var M_G_SERVER_STACORDT_RECOVERY                      =11;  
	var M_G_SERVER_STACORDT_RECOVERY_STR                  ="Recovery";                   // DBTYPE_I4           11 防御力修正


	var USERBUFFER                                        ="userbuffer";
	var M_G_SERVER_USERBUFFER_AUTOID                      =0;   
	var M_G_SERVER_USERBUFFER_AUTOID_STR                  ="autoid";                     // DBTYPE_I4           

	var M_G_SERVER_USERBUFFER_BUFID                       =1;   
	var M_G_SERVER_USERBUFFER_BUFID_STR                   ="bufid";                      // DBTYPE_I4           

	var M_G_SERVER_USERBUFFER_TYPE                        =2;   
	var M_G_SERVER_USERBUFFER_TYPE_STR                    ="type";                       // DBTYPE_I4           类型0为共有的buff，1为技能,是人物独有的buff

	var M_G_SERVER_USERBUFFER_USERID                      =3;   
	var M_G_SERVER_USERBUFFER_USERID_STR                  ="userid";                     // DBTYPE_I4           哪个user拥有这些buff

	var M_G_SERVER_USERBUFFER_LASTTIME                    =4;   
	var M_G_SERVER_USERBUFFER_LASTTIME_STR                ="lasttime";                   // DBTYPE_I4           还有多长时间结束

	var M_G_SERVER_USERBUFFER_LEVEL                       =5;   
	var M_G_SERVER_USERBUFFER_LEVEL_STR                   ="level";                      // DBTYPE_I4           叠加层数

	var M_G_SERVER_USERBUFFER_NUM                         =6;   
	var M_G_SERVER_USERBUFFER_NUM_STR                     ="num";                        // DBTYPE_I4           如果是dot型的，这个是还有几次结束


	var USERDT                                            ="userdt";
	var M_G_SERVER_USERDT_UID                             =0;   
	var M_G_SERVER_USERDT_UID_STR                         ="uid";                        // DBTYPE_I4           0用户ID

	var M_G_SERVER_USERDT_NKNAME                          =1;   
	var M_G_SERVER_USERDT_NKNAME_STR                      ="nkname";                     // DBTYPE_WVARCHAR     1游戏中使用名称

	var M_G_SERVER_USERDT_SEX                             =2;   
	var M_G_SERVER_USERDT_SEX_STR                         ="sex";                        // DBTYPE_I4           2性别 1男 2女

	var M_G_SERVER_USERDT_RID                             =3;   
	var M_G_SERVER_USERDT_RID_STR                         ="rid";                        // DBTYPE_I4           3游戏中使用的角色(唯一ID)

	var M_G_SERVER_USERDT_PLUS_RID                        =4;   
	var M_G_SERVER_USERDT_PLUS_RID_STR                    ="plus_rid";                   // DBTYPE_I4           4游戏中使用的第二个角色(唯一ID)

	var M_G_SERVER_USERDT_USERSTA                         =5;   
	var M_G_SERVER_USERDT_USERSTA_STR                     ="usersta";                    // DBTYPE_I4           5用户状态(是否旁观) 0未知 1旁观者 2参赛者

	var M_G_SERVER_USERDT_GAMESTA                         =6;   
	var M_G_SERVER_USERDT_GAMESTA_STR                     ="gamesta";                    // DBTYPE_I4           6当前游戏状态 0断线 1空闲中 2房间内 3游戏中

	var M_G_SERVER_USERDT_DID                             =7;   
	var M_G_SERVER_USERDT_DID_STR                         ="did";                        // DBTYPE_I4           7所在桌子ID

	var M_G_SERVER_USERDT_MID                             =8;   
	var M_G_SERVER_USERDT_MID_STR                         ="mid";                        // DBTYPE_I4           8所在地图ID

	var M_G_SERVER_USERDT_SD_PID                          =9;   
	var M_G_SERVER_USERDT_SD_PID_STR                      ="sd_pid";                     // DBTYPE_WVARCHAR     9盛大cid

	var M_G_SERVER_USERDT_SD_CID                          =10;  
	var M_G_SERVER_USERDT_SD_CID_STR                      ="sd_cid";                     // DBTYPE_WVARCHAR     10盛大cid

	var M_G_SERVER_USERDT_TEAM                            =11;  
	var M_G_SERVER_USERDT_TEAM_STR                        ="team";                       // DBTYPE_I4           11所属队伍

	var M_G_SERVER_USERDT_READY                           =12;  
	var M_G_SERVER_USERDT_READY_STR                       ="ready";                      // DBTYPE_I4           12准备状态:0未知 1等待 2准备

	var M_G_SERVER_USERDT_CAROM                           =13;  
	var M_G_SERVER_USERDT_CAROM_STR                       ="carom";                      // DBTYPE_I4           13连击数

	var M_G_SERVER_USERDT_KILLNUM                         =14;  
	var M_G_SERVER_USERDT_KILLNUM_STR                     ="killnum";                    // DBTYPE_I4           14击倒数

	var M_G_SERVER_USERDT_USERNUM                         =15;  
	var M_G_SERVER_USERDT_USERNUM_STR                     ="usernum";                    // DBTYPE_I4           15剩余人数

	var M_G_SERVER_USERDT_DAMAGE                          =16;  
	var M_G_SERVER_USERDT_DAMAGE_STR                      ="damage";                     // DBTYPE_I4           16总伤害

	var M_G_SERVER_USERDT_MULEXP                          =17;  
	var M_G_SERVER_USERDT_MULEXP_STR                      ="mulexp";                     // DBTYPE_R4           17 当前经验倍比

	var M_G_SERVER_USERDT_PKPOINT                         =18;  
	var M_G_SERVER_USERDT_PKPOINT_STR                     ="pkpoint";                    // DBTYPE_I4           18获得PK点

	var M_G_SERVER_USERDT_MONEY                           =19;  
	var M_G_SERVER_USERDT_MONEY_STR                       ="money";                      // DBTYPE_I4           19获得金钱

	var M_G_SERVER_USERDT_ITEMS                           =20;  
	var M_G_SERVER_USERDT_ITEMS_STR                       ="items";                      // DBTYPE_WVARCHAR     20获得道具

	var M_G_SERVER_USERDT_ISWIN                           =21;  
	var M_G_SERVER_USERDT_ISWIN_STR                       ="iswin";                      // DBTYPE_BOOL         21是否胜利

	var M_G_SERVER_USERDT_FRACTION                        =22;  
	var M_G_SERVER_USERDT_FRACTION_STR                    ="fraction";                   // DBTYPE_I4           22总分数

	var M_G_SERVER_USERDT_PIPFRAC                         =23;  
	var M_G_SERVER_USERDT_PIPFRAC_STR                     ="pipfrac";                    // DBTYPE_I4           23击杀分

	var M_G_SERVER_USERDT_SURVIVAL                        =24;  
	var M_G_SERVER_USERDT_SURVIVAL_STR                    ="survival";                   // DBTYPE_I4           24生存分

	var M_G_SERVER_USERDT_SKILLFRAC                       =25;  
	var M_G_SERVER_USERDT_SKILLFRAC_STR                   ="skillfrac";                  // DBTYPE_I4           25技巧分

	var M_G_SERVER_USERDT_RANKFRAC                        =26;  
	var M_G_SERVER_USERDT_RANKFRAC_STR                    ="rankfrac";                   // DBTYPE_I4           26队伍总分数

	var M_G_SERVER_USERDT_INDULGE                         =27;  
	var M_G_SERVER_USERDT_INDULGE_STR                     ="indulge";                    // DBTYPE_I4           27反沉迷于等级

	var M_G_SERVER_USERDT_SORT                            =28;  
	var M_G_SERVER_USERDT_SORT_STR                        ="sort";                       // DBTYPE_I4           28排名

	var M_G_SERVER_USERDT_POSX                            =29;  
	var M_G_SERVER_USERDT_POSX_STR                        ="posx";                       // DBTYPE_R4           29玩家位置

	var M_G_SERVER_USERDT_POSY                            =30;  
	var M_G_SERVER_USERDT_POSY_STR                        ="posy";                       // DBTYPE_R4           30

	var M_G_SERVER_USERDT_POSZ                            =31;  
	var M_G_SERVER_USERDT_POSZ_STR                        ="posz";                       // DBTYPE_R4           31

	var M_G_SERVER_USERDT_ROTEX                           =32;  
	var M_G_SERVER_USERDT_ROTEX_STR                       ="rotex";                      // DBTYPE_R4           32玩家角度

	var M_G_SERVER_USERDT_ROTEY                           =33;  
	var M_G_SERVER_USERDT_ROTEY_STR                       ="rotey";                      // DBTYPE_R4           33

	var M_G_SERVER_USERDT_ROTEZ                           =34;  
	var M_G_SERVER_USERDT_ROTEZ_STR                       ="rotez";                      // DBTYPE_R4           34

	var M_G_SERVER_USERDT_FSMID                           =35;  
	var M_G_SERVER_USERDT_FSMID_STR                       ="fsmid";                      // DBTYPE_I4           35状态号

	var M_G_SERVER_USERDT_FSMTM                           =36;  
	var M_G_SERVER_USERDT_FSMTM_STR                       ="fsmtm";                      // DBTYPE_I4           36状态起始时间

	var M_G_SERVER_USERDT_CHANGNUM                        =37;  
	var M_G_SERVER_USERDT_CHANGNUM_STR                    ="changnum";                   // DBTYPE_I4           37可以换人的次数

	var M_G_SERVER_USERDT_ISDEAD                          =38;  
	var M_G_SERVER_USERDT_ISDEAD_STR                      ="isdead";                     // DBTYPE_I4           38是否死亡

	var M_G_SERVER_USERDT_ISOVER                          =39;  
	var M_G_SERVER_USERDT_ISOVER_STR                      ="isover";                     // DBTYPE_I4           39是否游戏结束

	var M_G_SERVER_USERDT_HITID                           =40;  
	var M_G_SERVER_USERDT_HITID_STR                       ="hitid";                      // DBTYPE_I4           40上次攻击到的角色id（被动方id）

	var M_G_SERVER_USERDT_INITIATIVE_HITSTATE             =41;  
	var M_G_SERVER_USERDT_INITIATIVE_HITSTATE_STR         ="initiative_hitstate";        // DBTYPE_I4           41上次攻击到目标时所处的状态（主动方状态）

	var M_G_SERVER_USERDT_INITIATIVE_BEHITSTATE           =42;  
	var M_G_SERVER_USERDT_INITIATIVE_BEHITSTATE_STR       ="initiative_behitstate";      // DBTYPE_I4           42上次攻击到的角色所处的状态（被动方状态）

	var M_G_SERVER_USERDT_BEHITID                         =43;  
	var M_G_SERVER_USERDT_BEHITID_STR                     ="behitid";                    // DBTYPE_I4           43上次被攻击到的角色id（主动方id）

	var M_G_SERVER_USERDT_PASSIVITY_HITSTATE              =44;  
	var M_G_SERVER_USERDT_PASSIVITY_HITSTATE_STR          ="passivity_hitstate";         // DBTYPE_I4           44上次被攻击时攻击方状态（主动方状态）

	var M_G_SERVER_USERDT_PASSIVITY_BEHITSTATE            =45;  
	var M_G_SERVER_USERDT_PASSIVITY_BEHITSTATE_STR        ="passivity_behitstate";       // DBTYPE_I4           45上次被攻击时自己的状态（被动方状态）

	var M_G_SERVER_USERDT_HITPARTSID                      =46;  
	var M_G_SERVER_USERDT_HITPARTSID_STR                  ="hitpartsid";                 // DBTYPE_I4           46上次攻击到对方的部件id

	var M_G_SERVER_USERDT_BEHITPARTSID                    =47;  
	var M_G_SERVER_USERDT_BEHITPARTSID_STR                ="behitpartsid";               // DBTYPE_I4           47上次被对方攻击到的部件id

	var M_G_SERVER_USERDT_INITIATIVE_ATTDEFID             =48;  
	var M_G_SERVER_USERDT_INITIATIVE_ATTDEFID_STR         ="initiative_attdefid";        // DBTYPE_I4           48上次攻击到目标时对应的ATTDEF表中的索引

	var M_G_SERVER_USERDT_PASSIVITY_ATTDEFID              =49;  
	var M_G_SERVER_USERDT_PASSIVITY_ATTDEFID_STR          ="passivity_attdefid";         // DBTYPE_LONGVARBINARY49上次被攻击到时对方对应的ATTDEF表中的索引

	var M_G_SERVER_USERDT_DBUFF                           =50;  
	var M_G_SERVER_USERDT_DBUFF_STR                       ="DBuff";                      // DBTYPE_LONGVARBINARY50DBuff存放空间

	var M_G_SERVER_USERDT_PVEWINCOUNT                     =51;  
	var M_G_SERVER_USERDT_PVEWINCOUNT_STR                 ="PveWinCount";                // DBTYPE_I4           51PVE胜利总场次

	var M_G_SERVER_USERDT_PVPWINCOUNT                     =52;  
	var M_G_SERVER_USERDT_PVPWINCOUNT_STR                 ="PvpWinCount";                // DBTYPE_I4           52PVP胜利总场次

	var M_G_SERVER_USERDT_PVEWARCOUNT                     =53;  
	var M_G_SERVER_USERDT_PVEWARCOUNT_STR                 ="PveWarCount";                // DBTYPE_I4           53PVE战斗场次

	var M_G_SERVER_USERDT_PVPWARCOUNT                     =54;  
	var M_G_SERVER_USERDT_PVPWARCOUNT_STR                 ="PvpWarCount";                // DBTYPE_I4           54PVP战斗场次

	var M_G_SERVER_USERDT_CUPKPOINT                       =55;  
	var M_G_SERVER_USERDT_CUPKPOINT_STR                   ="Cupkpoint";                  // DBTYPE_I4           55当然PK点

	var M_G_SERVER_USERDT_TOTALPKPOINT                    =56;  
	var M_G_SERVER_USERDT_TOTALPKPOINT_STR                ="totalpkpoint";               // DBTYPE_I4           56总PK点

	var M_G_SERVER_USERDT_TOTALMONEY                      =57;  
	var M_G_SERVER_USERDT_TOTALMONEY_STR                  ="totalMoney";                 // DBTYPE_I4           57游戏币

	var M_G_SERVER_USERDT_TOTALTICKET                     =58;  
	var M_G_SERVER_USERDT_TOTALTICKET_STR                 ="totalticket";                // DBTYPE_I4           58点券

	var M_G_SERVER_USERDT_TOKENMONEY                      =59;  
	var M_G_SERVER_USERDT_TOKENMONEY_STR                  ="TokenMoney";                 // DBTYPE_I4           59代金券

	var M_G_SERVER_USERDT_ONLINETM                        =60;  
	var M_G_SERVER_USERDT_ONLINETM_STR                    ="OnLineTm";                   // DBTYPE_I4           60总在线时间

	var M_G_SERVER_USERDT_MULMONEY                        =61;  
	var M_G_SERVER_USERDT_MULMONEY_STR                    ="mulmoney";                   // DBTYPE_R4           61 当前钱倍比

	var M_G_SERVER_USERDT_USERTHIS                        =62;  
	var M_G_SERVER_USERDT_USERTHIS_STR                    ="userthis";                   // DBTYPE_I4           62用户客户端指针

	var M_G_SERVER_USERDT_FSMTYPE                         =63;  
	var M_G_SERVER_USERDT_FSMTYPE_STR                     ="fsmtype";                    // DBTYPE_I4           63用户状态类型

	var M_G_SERVER_USERDT_CHAIRINDEX                      =64;  
	var M_G_SERVER_USERDT_CHAIRINDEX_STR                  ="ChairIndex";                 // DBTYPE_I4           64用户所在等待房间位置

	var M_G_SERVER_USERDT_USERTYPE                        =65;  
	var M_G_SERVER_USERDT_USERTYPE_STR                    ="UserType";                   // DBTYPE_I4           65类型，用户还是npc，及是哪类npc

	var M_G_SERVER_USERDT_ROOMARENA                       =66;  
	var M_G_SERVER_USERDT_ROOMARENA_STR                   ="RoomArena";                  // DBTYPE_I4           66大厅是否在实景中

	var M_G_SERVER_USERDT_CULEVEL                         =67;  
	var M_G_SERVER_USERDT_CULEVEL_STR                     ="CuLevel";                    // DBTYPE_I4           67当前等级

	var M_G_SERVER_USERDT_CUEXP                           =68;  
	var M_G_SERVER_USERDT_CUEXP_STR                       ="CuExp";                      // DBTYPE_I4           68当前经验

	var M_G_SERVER_USERDT_TB_ATTDEF                       =69;  
	var M_G_SERVER_USERDT_TB_ATTDEF_STR                   ="tb_attdef";                  // DBTYPE_LONGVARBINARY69由网络同步的atttree

	var M_G_SERVER_USERDT_SPOINT                          =70;  
	var M_G_SERVER_USERDT_SPOINT_STR                      ="SPoint";                     // DBTYPE_I4           70角色总技能点

	var M_G_SERVER_USERDT_TRAIN_STEP                      =71;  
	var M_G_SERVER_USERDT_TRAIN_STEP_STR                  ="train_step";                 // DBTYPE_I4           71训练关进度

	var M_G_SERVER_USERDT_DTINIT                          =72;  
	var M_G_SERVER_USERDT_DTINIT_STR                      ="dtinit";                     // DBTYPE_I4           72数据初始化状态

	var M_G_SERVER_USERDT_RP                              =73;  
	var M_G_SERVER_USERDT_RP_STR                          ="RP";                         // DBTYPE_I4           73人品值

	var M_G_SERVER_USERDT_RPERVEC                         =74;  
	var M_G_SERVER_USERDT_RPERVEC_STR                     ="RPerVec";                    // DBTYPE_I4           74录象的版本号

	var M_G_SERVER_USERDT_TOTALEXP                        =75;  
	var M_G_SERVER_USERDT_TOTALEXP_STR                    ="totalExp";                   // DBTYPE_I4           75排行榜的经验

	var M_G_SERVER_USERDT_RULESTATION                     =76;  
	var M_G_SERVER_USERDT_RULESTATION_STR                 ="ruleStation";                // DBTYPE_I4           76根据网球规则的逻辑站位 5表示在房间中的 1~4是游戏里面用的. 具体游戏中发球的站位, 1为+x-z 2为-x-z 3为-x+z 4为+x+z

	var M_G_SERVER_USERDT_TITLE                           =77;  
	var M_G_SERVER_USERDT_TITLE_STR                       ="title";                      // DBTYPE_I4           77称号

	var M_G_SERVER_USERDT_ACCOUNTTYPE                     =78;  
	var M_G_SERVER_USERDT_ACCOUNTTYPE_STR                 ="AccountType";                // DBTYPE_I4           78帐户类型

	var M_G_SERVER_USERDT_TOTLETICKET                     =79;  
	var M_G_SERVER_USERDT_TOTLETICKET_STR                 ="TotleTicket";                // DBTYPE_I4           79消费总点券

	var M_G_SERVER_USERDT_SDP2PSVRID                      =80;  
	var M_G_SERVER_USERDT_SDP2PSVRID_STR                  ="SdP2pSvrId";                 // DBTYPE_I4           80盛大P2P Server ID

	var M_G_SERVER_USERDT_SDP2PID                         =81;  
	var M_G_SERVER_USERDT_SDP2PID_STR                     ="SdP2pId";                    // DBTYPE_I4           81盛大P2P ID

	var M_G_SERVER_USERDT_USER_NAME                       =82;  
	var M_G_SERVER_USERDT_USER_NAME_STR                   ="user_name";                  // DBTYPE_WVARCHAR     82用户登录名

	var M_G_SERVER_USERDT_OPERATCTRL                      =83;  
	var M_G_SERVER_USERDT_OPERATCTRL_STR                  ="OperatCtrl";                 // DBTYPE_WVARCHAR     83运营控制(是否被禁言;)

	var M_G_SERVER_USERDT_GAMESTATION                     =84;  
	var M_G_SERVER_USERDT_GAMESTATION_STR                 ="GameStation";                // DBTYPE_I4           84游戏内人物ID, 用于确定首发, 接发等. 游戏中该值不会改变, 是游戏中人物的唯一标识, 取值1~4. 进入游戏时, 1为发球, 2为发球队友, 3为接发球, 4为接发球队友. 随游戏进程, 发球者ID会改变.

	var M_G_SERVER_USERDT_P2PPING                         =85;  
	var M_G_SERVER_USERDT_P2PPING_STR                     ="p2pping";                    // DBTYPE_I4           85 p2p ping

	var M_G_SERVER_USERDT_POPEDOM                         =86;  
	var M_G_SERVER_USERDT_POPEDOM_STR                     ="Popedom";                    // DBTYPE_I4           86GM权力

	var M_G_SERVER_USERDT_CREATEROOMTM                    =87;  
	var M_G_SERVER_USERDT_CREATEROOMTM_STR                ="CreateRoomTm";               // DBTYPE_LONGVARBINARY87创建房间时间

	var M_G_SERVER_USERDT_PRIXPOINT                       =88;  
	var M_G_SERVER_USERDT_PRIXPOINT_STR                   ="PrixPoint";                  // DBTYPE_I4           88大奖赛积分

	var M_G_SERVER_USERDT_TS_PRIXSENSON                   =89;  
	var M_G_SERVER_USERDT_TS_PRIXSENSON_STR               ="TS_PrixSenson";              // DBTYPE_I4           89网球明星榜:大奖赛-本赛季(废弃)

	var M_G_SERVER_USERDT_TS_PRIXALL                      =90;  
	var M_G_SERVER_USERDT_TS_PRIXALL_STR                  ="TS_PrixAll";                 // DBTYPE_I4           90网球明星榜:大奖赛-总排行(废弃)

	var M_G_SERVER_USERDT_TS_RACEWINNUM                   =91;  
	var M_G_SERVER_USERDT_TS_RACEWINNUM_STR               ="TS_RaceWinNum";              // DBTYPE_I4           91网球明星榜:竞技-胜利场次(个人信息-战绩统计)

	var M_G_SERVER_USERDT_TS_RACEALLSCORE                 =92;  
	var M_G_SERVER_USERDT_TS_RACEALLSCORE_STR             ="TS_RaceAllScore";            // DBTYPE_I4           92网球明星榜:竞技-总得分(个人信息-战绩统计)

	var M_G_SERVER_USERDT_TS_RACEACE                      =93;  
	var M_G_SERVER_USERDT_TS_RACEACE_STR                  ="TS_RaceACE";                 // DBTYPE_I4           93网球明星榜:竞技-Ace球总数(个人信息-战绩统计)

	var M_G_SERVER_USERDT_TS_RACESKILLSCORE               =94;  
	var M_G_SERVER_USERDT_TS_RACESKILLSCORE_STR           ="TS_RaceSkillScore";          // DBTYPE_I4           94网球明星榜:竞技-技能得分数(废弃)

	var M_G_SERVER_USERDT_TS_RACESKILLNUM                 =95;  
	var M_G_SERVER_USERDT_TS_RACESKILLNUM_STR             ="TS_RaceSkillNum";            // DBTYPE_I4           95网球明星榜:竞技-技能总数(个人信息-战绩统计)

	var M_G_SERVER_USERDT_TS_RACESKILLRATE                =96;  
	var M_G_SERVER_USERDT_TS_RACESKILLRATE_STR            ="TS_RaceSkillRate";           // DBTYPE_I4           96网球明星榜:竞技-技能得分率(个人信息-战绩统计)(废弃)

	var M_G_SERVER_USERDT_TS_RACEBREAKSKILL               =97;  
	var M_G_SERVER_USERDT_TS_RACEBREAKSKILL_STR           ="TS_RaceBreakSkill";          // DBTYPE_I4           97网球明星榜:竞技-普通破解技能(个人信息-战绩统计)(废弃)

	var M_G_SERVER_USERDT_TS_RACESKILLBREAKSKILL          =98;  
	var M_G_SERVER_USERDT_TS_RACESKILLBREAKSKILL_STR      ="TS_RaceSkillBreakSkill";     // DBTYPE_I4           98网球明星榜:竞技-技能破解技能(个人信息-战绩统计)(废弃)

	var M_G_SERVER_USERDT_TS_RACEBREAKSUCCESS             =99;  
	var M_G_SERVER_USERDT_TS_RACEBREAKSUCCESS_STR         ="TS_RaceBreakSuccess";        // DBTYPE_I4           99网球明星榜:竞技-破发成功率(个人信息-战绩统计)(废弃)

	var M_G_SERVER_USERDT_TS_RACEBREAKNUM                 =100; 
	var M_G_SERVER_USERDT_TS_RACEBREAKNUM_STR             ="TS_RaceBreakNum";            // DBTYPE_I4           100网球明星榜:竞技-破发局数(个人信息-战绩统计)(废弃)

	var M_G_SERVER_USERDT_TS_RACEALLNUM                   =101; 
	var M_G_SERVER_USERDT_TS_RACEALLNUM_STR               ="TS_RaceAllNum";              // DBTYPE_I4           101竞技-总比赛场次(个人信息-战绩统计)

	var M_G_SERVER_USERDT_RULETYPE                        =102; 
	var M_G_SERVER_USERDT_RULETYPE_STR                    ="RuleType";                   // DBTYPE_I4           102 0. 发球方  1. 接球方  2. 发球方队友  3. 接球方队友

	var M_G_SERVER_USERDT_ACHIEVETRAINID                  =103; 
	var M_G_SERVER_USERDT_ACHIEVETRAINID_STR              ="AchieveTrainID";             // DBTYPE_WVARCHAR     103 完成的训练ID 不同步到客户端 服务器用

	var M_G_SERVER_USERDT_RECEIVEQUALIFY                  =104; 
	var M_G_SERVER_USERDT_RECEIVEQUALIFY_STR              ="ReceiveQualify";             // DBTYPE_I4           104 获得的称号 1.新手 2.资格赛 3巡回 4黄金 5大师

	var M_G_SERVER_USERDT_TS_RACECANBREAKNUM              =105; 
	var M_G_SERVER_USERDT_TS_RACECANBREAKNUM_STR          ="TS_RaceCanBreakNum";         // DBTYPE_I4           105 竞技-可破发局数

	var M_G_SERVER_USERDT_GAMESERVETEAM                   =106; 
	var M_G_SERVER_USERDT_GAMESERVETEAM_STR               ="GameServeTeam";              // DBTYPE_I4           106 游戏内发球的队伍 1队发球 2队接发球

	var M_G_SERVER_USERDT_SERIESWINNUM                    =107; 
	var M_G_SERVER_USERDT_SERIESWINNUM_STR                ="SeriesWinNum";               // DBTYPE_I4           107 连胜次数

	var M_G_SERVER_USERDT_SERIESWINTIME                   =108; 
	var M_G_SERVER_USERDT_SERIESWINTIME_STR               ="SeriesWinTime";              // DBTYPE_NUMERIC      108 达到此连胜的时间

	var M_G_SERVER_USERDT_RUNTIME                         =109; 
	var M_G_SERVER_USERDT_RUNTIME_STR                     ="RunTime";                    // DBTYPE_NUMERIC      109 竞技报名时间

	var M_G_SERVER_USERDT_ARENASTATE                      =110; 
	var M_G_SERVER_USERDT_ARENASTATE_STR                  ="ArenaState";                 // DBTYPE_I4           110 竞技赛状态 0.默认 1.报名了,等待消息回馈 2.已经报名了一个活动 3.进入竞技活动 4.活动结算

	var M_G_SERVER_USERDT_WAGER                           =111; 
	var M_G_SERVER_USERDT_WAGER_STR                       ="Wager";                      // DBTYPE_I4           111 赌注

	var M_G_SERVER_USERDT_TS_FULLSTORENUM                 =112; 
	var M_G_SERVER_USERDT_TS_FULLSTORENUM_STR             ="TS_FullStoreNum";            // DBTYPE_I4           112 网球明星榜:竞技-	满蓄力次数(个人信息-战绩统计)

	var M_G_SERVER_USERDT_INLINEPRENSENT                  =113; 
	var M_G_SERVER_USERDT_INLINEPRENSENT_STR              ="InlinePrensent";             // DBTYPE_I4           113 在线领取礼物-已经领取好了的

	var M_G_SERVER_USERDT_INLINEPRENSENTTM                =114; 
	var M_G_SERVER_USERDT_INLINEPRENSENTTM_STR            ="InlinePrensentTm";           // DBTYPE_I4           114 在线领取礼物的用户时间(秒)

	var M_G_SERVER_USERDT_ARENARACEID                     =115; 
	var M_G_SERVER_USERDT_ARENARACEID_STR                 ="ArenaRaceID";                // DBTYPE_I4           115 参加的竞技赛ID

	var M_G_SERVER_USERDT_GAMEWINPRESENT                  =116; 
	var M_G_SERVER_USERDT_GAMEWINPRESENT_STR              ="GameWinPresent";             // DBTYPE_I4           116 获胜时领过奖品时的游戏场次

	var M_G_SERVER_USERDT_TS_ARENAALLNUM                  =117; 
	var M_G_SERVER_USERDT_TS_ARENAALLNUM_STR              ="TS_ArenaAllNum";             // DBTYPE_I4           117 竞技的比赛场次

	var M_G_SERVER_USERDT_TS_ARENAWINNUM                  =118; 
	var M_G_SERVER_USERDT_TS_ARENAWINNUM_STR              ="TS_ArenaWinNum";             // DBTYPE_I4           118 竞技的获胜场次

	var M_G_SERVER_USERDT_NORMALSTAT                      =119; 
	var M_G_SERVER_USERDT_NORMALSTAT_STR                  ="NormalStat";                 // DBTYPE_I4           119 玩家可以进行的普通统计次数

	var M_G_SERVER_USERDT_ARENASTAT                       =120; 
	var M_G_SERVER_USERDT_ARENASTAT_STR                   ="ArenaStat";                  // DBTYPE_I4           120 玩家可以进行的竞技统计次数

	var M_G_SERVER_USERDT_ENTRYTRAINID                    =121; 
	var M_G_SERVER_USERDT_ENTRYTRAINID_STR                ="EntryTrainID";               // DBTYPE_I4           121 进入训练的id

	var M_G_SERVER_USERDT_ENTRYTRAINTM                    =122; 
	var M_G_SERVER_USERDT_ENTRYTRAINTM_STR                ="EntryTrainTm";               // DBTYPE_NUMERIC      122 进入训练的时间

	var M_G_SERVER_USERDT_ARENADATA1                      =123; 
	var M_G_SERVER_USERDT_ARENADATA1_STR                  ="ArenaData1";                 // DBTYPE_I4           123 竞技比分1

	var M_G_SERVER_USERDT_ARENADATA2                      =124; 
	var M_G_SERVER_USERDT_ARENADATA2_STR                  ="ArenaData2";                 // DBTYPE_I4           124 竞技比分2

	var M_G_SERVER_USERDT_ARENADATA3                      =125; 
	var M_G_SERVER_USERDT_ARENADATA3_STR                  ="ArenaData3";                 // DBTYPE_I4           125 竞技比分3

	var M_G_SERVER_USERDT_ARENADATA4                      =126; 
	var M_G_SERVER_USERDT_ARENADATA4_STR                  ="ArenaData4";                 // DBTYPE_I4           126 竞技比分4

	var M_G_SERVER_USERDT_ARENADATA5                      =127; 
	var M_G_SERVER_USERDT_ARENADATA5_STR                  ="ArenaData5";                 // DBTYPE_I4           127 竞技比分5

	var M_G_SERVER_USERDT_ALLTEAMUSER                     =128; 
	var M_G_SERVER_USERDT_ALLTEAMUSER_STR                 ="AllTeamUser";                // DBTYPE_WVARCHAR     128 所有组队的成员

	var M_G_SERVER_USERDT_ALLTEAMSVID                     =129; 
	var M_G_SERVER_USERDT_ALLTEAMSVID_STR                 ="AllTeamSvID";                // DBTYPE_WVARCHAR     129 组队成员来自的服务器ID

	var M_G_SERVER_USERDT_TROLETYPE                       =130; 
	var M_G_SERVER_USERDT_TROLETYPE_STR                   ="TRoleType";                  // DBTYPE_I4           130 网球的角色类型id

	var M_G_SERVER_USERDT_VIPVALUE                        =131; 
	var M_G_SERVER_USERDT_VIPVALUE_STR                    ="VipValue";                   // DBTYPE_I4           131 Vip标识

	var M_G_SERVER_USERDT_LOSTONLINETM                    =132; 
	var M_G_SERVER_USERDT_LOSTONLINETM_STR                ="LostOnLineTm";               // DBTYPE_NUMERIC      132 最后一次上线时间

	var M_G_SERVER_USERDT_TASKCOMPLETE                    =133; 
	var M_G_SERVER_USERDT_TASKCOMPLETE_STR                ="TaskComplete";               // DBTYPE_LONGVARBINARY133 已经完成的任务

	var M_G_SERVER_USERDT_STOREINFO                       =134; 
	var M_G_SERVER_USERDT_STOREINFO_STR                   ="StoreInfo";                  // DBTYPE_LONGVARBINARY134

	var M_G_SERVER_USERDT_ALLTEAMLV                       =135; 
	var M_G_SERVER_USERDT_ALLTEAMLV_STR                   ="AllTeamLv";                  // DBTYPE_I4           135 组队成员的等级,队伍是平均等级

	var M_G_SERVER_USERDT_ALLTEAMWINRATIO                 =136; 
	var M_G_SERVER_USERDT_ALLTEAMWINRATIO_STR             ="AllTeamWinRatio";            // DBTYPE_I4           136 组队成员的胜率

	var M_G_SERVER_USERDT_TASK                            =137; 
	var M_G_SERVER_USERDT_TASK_STR                        ="Task";                       // DBTYPE_WVARCHAR     137 任务记录(已经接的任务)

	var M_G_SERVER_USERDT_EVERYDAYTASKCOMPLETE            =138; 
	var M_G_SERVER_USERDT_EVERYDAYTASKCOMPLETE_STR        ="EverydayTaskComplete";       // DBTYPE_LONGVARBINARY138 已经完成的日常任务

	var M_G_SERVER_USERDT_CANSLOGAN                       =139; 
	var M_G_SERVER_USERDT_CANSLOGAN_STR                   ="CanSlogan";                  // DBTYPE_I4           139 能否发表获胜感言

	var M_G_SERVER_USERDT_QUEUEDTID                       =140; 
	var M_G_SERVER_USERDT_QUEUEDTID_STR                   ="QueueDtID";                  // DBTYPE_NUMERIC      140 活动数据id

	var M_G_SERVER_USERDT_FAMILYID                        =141; 
	var M_G_SERVER_USERDT_FAMILYID_STR                    ="FamilyID";                   // DBTYPE_I4           141 家族ID

	var M_G_SERVER_USERDT_MANGOUID                        =142; 
	var M_G_SERVER_USERDT_MANGOUID_STR                    ="MangoUID";                   // DBTYPE_NUMERIC      142 芒果的UID，目前只是服务器使用

	var M_G_SERVER_USERDT_LIMITSAY                        =143; 
	var M_G_SERVER_USERDT_LIMITSAY_STR                    ="LimitSay";                   // DBTYPE_NUMERIC      143 玩家被限制说话的时间

	var M_G_SERVER_USERDT_TS_ARENAGOLDS                   =144; 
	var M_G_SERVER_USERDT_TS_ARENAGOLDS_STR               ="TS_ArenaGoldS";              // DBTYPE_I4           144 网球明星榜:竞技-黄金赛单打的胜利场次

	var M_G_SERVER_USERDT_TS_ARENAGOLDSALLNUM             =145; 
	var M_G_SERVER_USERDT_TS_ARENAGOLDSALLNUM_STR         ="TS_ArenaGoldSAllNum";        // DBTYPE_I4           145 网球明星榜:竞技-黄金赛单打的比赛场次

	var M_G_SERVER_USERDT_TS_ARENAGOLDD                   =146; 
	var M_G_SERVER_USERDT_TS_ARENAGOLDD_STR               ="TS_ArenaGoldD";              // DBTYPE_I4           146 网球明星榜:竞技-黄金赛双打的胜利场次

	var M_G_SERVER_USERDT_TS_ARENAGOLDDWALLNUM            =147; 
	var M_G_SERVER_USERDT_TS_ARENAGOLDDWALLNUM_STR        ="TS_ArenaGoldDWAllNum";       // DBTYPE_I4           147 网球明星榜:竞技-黄金赛双打的比赛场次

	var M_G_SERVER_USERDT_EXPARTNERNUM                    =148; 
	var M_G_SERVER_USERDT_EXPARTNERNUM_STR                ="ExPartnerNum";               // DBTYPE_I4           148 还能增加的搭档数量

	var M_G_SERVER_USERDT_INLINEPRESENTLASTTM             =149; 
	var M_G_SERVER_USERDT_INLINEPRESENTLASTTM_STR         ="InlinePresentLastTm";        // DBTYPE_I4           149 上一次领取奖励的时间

	var M_G_SERVER_USERDT_ACCUMTASKCOMPLETE               =150; 
	var M_G_SERVER_USERDT_ACCUMTASKCOMPLETE_STR           ="AccumTaskComplete";          // DBTYPE_LONGVARBINARY150 累积奖励任务完成情况


	var USERDT_INVITE                                     ="userdt_invite";
	var M_G_SERVER_USERDT_INVITE_UID                      =0;   
	var M_G_SERVER_USERDT_INVITE_UID_STR                  ="uid";                        // DBTYPE_I4           0用户ID

	var M_G_SERVER_USERDT_INVITE_NKNAME                   =1;   
	var M_G_SERVER_USERDT_INVITE_NKNAME_STR               ="nkname";                     // DBTYPE_WVARCHAR     1游戏中使用名称

	var M_G_SERVER_USERDT_INVITE_SEX                      =2;   
	var M_G_SERVER_USERDT_INVITE_SEX_STR                  ="sex";                        // DBTYPE_I4           2性别 1男 2女

	var M_G_SERVER_USERDT_INVITE_RID                      =3;   
	var M_G_SERVER_USERDT_INVITE_RID_STR                  ="rid";                        // DBTYPE_I4           3游戏中使用的角色(唯一ID)

	var M_G_SERVER_USERDT_INVITE_PLUS_RID                 =4;   
	var M_G_SERVER_USERDT_INVITE_PLUS_RID_STR             ="plus_rid";                   // DBTYPE_I4           4游戏中使用的第二个角色(唯一ID)

	var M_G_SERVER_USERDT_INVITE_USERSTA                  =5;   
	var M_G_SERVER_USERDT_INVITE_USERSTA_STR              ="usersta";                    // DBTYPE_I4           5用户状态(是否旁观) 0未知 1旁观者 2参赛者

	var M_G_SERVER_USERDT_INVITE_GAMESTA                  =6;   
	var M_G_SERVER_USERDT_INVITE_GAMESTA_STR              ="gamesta";                    // DBTYPE_I4           6当前游戏状态 0断线 1空闲中 2房间内 3游戏中

	var M_G_SERVER_USERDT_INVITE_DID                      =7;   
	var M_G_SERVER_USERDT_INVITE_DID_STR                  ="did";                        // DBTYPE_I4           7所在桌子ID

	var M_G_SERVER_USERDT_INVITE_MID                      =8;   
	var M_G_SERVER_USERDT_INVITE_MID_STR                  ="mid";                        // DBTYPE_I4           8所在地图ID

	var M_G_SERVER_USERDT_INVITE_SD_PID                   =9;   
	var M_G_SERVER_USERDT_INVITE_SD_PID_STR               ="sd_pid";                     // DBTYPE_WVARCHAR     9盛大cid

	var M_G_SERVER_USERDT_INVITE_SD_CID                   =10;  
	var M_G_SERVER_USERDT_INVITE_SD_CID_STR               ="sd_cid";                     // DBTYPE_WVARCHAR     10盛大cid

	var M_G_SERVER_USERDT_INVITE_TEAM                     =11;  
	var M_G_SERVER_USERDT_INVITE_TEAM_STR                 ="team";                       // DBTYPE_I4           11所属队伍

	var M_G_SERVER_USERDT_INVITE_READY                    =12;  
	var M_G_SERVER_USERDT_INVITE_READY_STR                ="ready";                      // DBTYPE_I4           12准备状态:0未知 1等待 2准备

	var M_G_SERVER_USERDT_INVITE_CAROM                    =13;  
	var M_G_SERVER_USERDT_INVITE_CAROM_STR                ="carom";                      // DBTYPE_I4           13连击数

	var M_G_SERVER_USERDT_INVITE_KILLNUM                  =14;  
	var M_G_SERVER_USERDT_INVITE_KILLNUM_STR              ="killnum";                    // DBTYPE_I4           14击倒数

	var M_G_SERVER_USERDT_INVITE_USERNUM                  =15;  
	var M_G_SERVER_USERDT_INVITE_USERNUM_STR              ="usernum";                    // DBTYPE_I4           15剩余人数

	var M_G_SERVER_USERDT_INVITE_DAMAGE                   =16;  
	var M_G_SERVER_USERDT_INVITE_DAMAGE_STR               ="damage";                     // DBTYPE_I4           16总伤害

	var M_G_SERVER_USERDT_INVITE_MULEXP                   =17;  
	var M_G_SERVER_USERDT_INVITE_MULEXP_STR               ="mulexp";                     // DBTYPE_R4           17 当前经验倍比

	var M_G_SERVER_USERDT_INVITE_PKPOINT                  =18;  
	var M_G_SERVER_USERDT_INVITE_PKPOINT_STR              ="pkpoint";                    // DBTYPE_I4           18获得PK点

	var M_G_SERVER_USERDT_INVITE_MONEY                    =19;  
	var M_G_SERVER_USERDT_INVITE_MONEY_STR                ="money";                      // DBTYPE_I4           19获得金钱

	var M_G_SERVER_USERDT_INVITE_ITEMS                    =20;  
	var M_G_SERVER_USERDT_INVITE_ITEMS_STR                ="items";                      // DBTYPE_WVARCHAR     20获得道具

	var M_G_SERVER_USERDT_INVITE_ISWIN                    =21;  
	var M_G_SERVER_USERDT_INVITE_ISWIN_STR                ="iswin";                      // DBTYPE_BOOL         21是否胜利

	var M_G_SERVER_USERDT_INVITE_FRACTION                 =22;  
	var M_G_SERVER_USERDT_INVITE_FRACTION_STR             ="fraction";                   // DBTYPE_I4           22总分数

	var M_G_SERVER_USERDT_INVITE_PIPFRAC                  =23;  
	var M_G_SERVER_USERDT_INVITE_PIPFRAC_STR              ="pipfrac";                    // DBTYPE_I4           23击杀分

	var M_G_SERVER_USERDT_INVITE_SURVIVAL                 =24;  
	var M_G_SERVER_USERDT_INVITE_SURVIVAL_STR             ="survival";                   // DBTYPE_I4           24生存分

	var M_G_SERVER_USERDT_INVITE_SKILLFRAC                =25;  
	var M_G_SERVER_USERDT_INVITE_SKILLFRAC_STR            ="skillfrac";                  // DBTYPE_I4           25技巧分

	var M_G_SERVER_USERDT_INVITE_RANKFRAC                 =26;  
	var M_G_SERVER_USERDT_INVITE_RANKFRAC_STR             ="rankfrac";                   // DBTYPE_I4           26队伍总分数

	var M_G_SERVER_USERDT_INVITE_INDULGE                  =27;  
	var M_G_SERVER_USERDT_INVITE_INDULGE_STR              ="indulge";                    // DBTYPE_I4           27反沉迷于等级

	var M_G_SERVER_USERDT_INVITE_SORT                     =28;  
	var M_G_SERVER_USERDT_INVITE_SORT_STR                 ="sort";                       // DBTYPE_I4           28排名

	var M_G_SERVER_USERDT_INVITE_POSX                     =29;  
	var M_G_SERVER_USERDT_INVITE_POSX_STR                 ="posx";                       // DBTYPE_R4           29玩家位置

	var M_G_SERVER_USERDT_INVITE_POSY                     =30;  
	var M_G_SERVER_USERDT_INVITE_POSY_STR                 ="posy";                       // DBTYPE_R4           30

	var M_G_SERVER_USERDT_INVITE_POSZ                     =31;  
	var M_G_SERVER_USERDT_INVITE_POSZ_STR                 ="posz";                       // DBTYPE_R4           31

	var M_G_SERVER_USERDT_INVITE_ROTEX                    =32;  
	var M_G_SERVER_USERDT_INVITE_ROTEX_STR                ="rotex";                      // DBTYPE_R4           32玩家角度

	var M_G_SERVER_USERDT_INVITE_ROTEY                    =33;  
	var M_G_SERVER_USERDT_INVITE_ROTEY_STR                ="rotey";                      // DBTYPE_R4           33

	var M_G_SERVER_USERDT_INVITE_ROTEZ                    =34;  
	var M_G_SERVER_USERDT_INVITE_ROTEZ_STR                ="rotez";                      // DBTYPE_R4           34

	var M_G_SERVER_USERDT_INVITE_FSMID                    =35;  
	var M_G_SERVER_USERDT_INVITE_FSMID_STR                ="fsmid";                      // DBTYPE_I4           35状态号

	var M_G_SERVER_USERDT_INVITE_FSMTM                    =36;  
	var M_G_SERVER_USERDT_INVITE_FSMTM_STR                ="fsmtm";                      // DBTYPE_I4           36状态起始时间

	var M_G_SERVER_USERDT_INVITE_CHANGNUM                 =37;  
	var M_G_SERVER_USERDT_INVITE_CHANGNUM_STR             ="changnum";                   // DBTYPE_I4           37可以换人的次数

	var M_G_SERVER_USERDT_INVITE_ISDEAD                   =38;  
	var M_G_SERVER_USERDT_INVITE_ISDEAD_STR               ="isdead";                     // DBTYPE_I4           38是否死亡

	var M_G_SERVER_USERDT_INVITE_ISOVER                   =39;  
	var M_G_SERVER_USERDT_INVITE_ISOVER_STR               ="isover";                     // DBTYPE_I4           39是否游戏结束

	var M_G_SERVER_USERDT_INVITE_HITID                    =40;  
	var M_G_SERVER_USERDT_INVITE_HITID_STR                ="hitid";                      // DBTYPE_I4           40上次攻击到的角色id（被动方id）

	var M_G_SERVER_USERDT_INVITE_INITIATIVE_HITSTATE      =41;  
	var M_G_SERVER_USERDT_INVITE_INITIATIVE_HITSTATE_STR  ="initiative_hitstate";        // DBTYPE_I4           41上次攻击到目标时所处的状态（主动方状态）

	var M_G_SERVER_USERDT_INVITE_INITIATIVE_BEHITSTATE    =42;  
	var M_G_SERVER_USERDT_INVITE_INITIATIVE_BEHITSTATE_STR="initiative_behitstate";      // DBTYPE_I4           42上次攻击到的角色所处的状态（被动方状态）

	var M_G_SERVER_USERDT_INVITE_BEHITID                  =43;  
	var M_G_SERVER_USERDT_INVITE_BEHITID_STR              ="behitid";                    // DBTYPE_I4           43上次被攻击到的角色id（主动方id）

	var M_G_SERVER_USERDT_INVITE_PASSIVITY_HITSTATE       =44;  
	var M_G_SERVER_USERDT_INVITE_PASSIVITY_HITSTATE_STR   ="passivity_hitstate";         // DBTYPE_I4           44上次被攻击时攻击方状态（主动方状态）

	var M_G_SERVER_USERDT_INVITE_PASSIVITY_BEHITSTATE     =45;  
	var M_G_SERVER_USERDT_INVITE_PASSIVITY_BEHITSTATE_STR ="passivity_behitstate";       // DBTYPE_I4           45上次被攻击时自己的状态（被动方状态）

	var M_G_SERVER_USERDT_INVITE_HITPARTSID               =46;  
	var M_G_SERVER_USERDT_INVITE_HITPARTSID_STR           ="hitpartsid";                 // DBTYPE_I4           46上次攻击到对方的部件id

	var M_G_SERVER_USERDT_INVITE_BEHITPARTSID             =47;  
	var M_G_SERVER_USERDT_INVITE_BEHITPARTSID_STR         ="behitpartsid";               // DBTYPE_I4           47上次被对方攻击到的部件id

	var M_G_SERVER_USERDT_INVITE_INITIATIVE_ATTDEFID      =48;  
	var M_G_SERVER_USERDT_INVITE_INITIATIVE_ATTDEFID_STR  ="initiative_attdefid";        // DBTYPE_I4           48上次攻击到目标时对应的ATTDEF表中的索引

	var M_G_SERVER_USERDT_INVITE_PASSIVITY_ATTDEFID       =49;  
	var M_G_SERVER_USERDT_INVITE_PASSIVITY_ATTDEFID_STR   ="passivity_attdefid";         // DBTYPE_LONGVARBINARY49上次被攻击到时对方对应的ATTDEF表中的索引

	var M_G_SERVER_USERDT_INVITE_DBUFF                    =50;  
	var M_G_SERVER_USERDT_INVITE_DBUFF_STR                ="DBuff";                      // DBTYPE_LONGVARBINARY50DBuff存放空间

	var M_G_SERVER_USERDT_INVITE_PVEWINCOUNT              =51;  
	var M_G_SERVER_USERDT_INVITE_PVEWINCOUNT_STR          ="PveWinCount";                // DBTYPE_I4           51PVE胜利总场次

	var M_G_SERVER_USERDT_INVITE_PVPWINCOUNT              =52;  
	var M_G_SERVER_USERDT_INVITE_PVPWINCOUNT_STR          ="PvpWinCount";                // DBTYPE_I4           52PVP胜利总场次

	var M_G_SERVER_USERDT_INVITE_PVEWARCOUNT              =53;  
	var M_G_SERVER_USERDT_INVITE_PVEWARCOUNT_STR          ="PveWarCount";                // DBTYPE_I4           53PVE战斗场次

	var M_G_SERVER_USERDT_INVITE_PVPWARCOUNT              =54;  
	var M_G_SERVER_USERDT_INVITE_PVPWARCOUNT_STR          ="PvpWarCount";                // DBTYPE_I4           54PVP战斗场次

	var M_G_SERVER_USERDT_INVITE_CUPKPOINT                =55;  
	var M_G_SERVER_USERDT_INVITE_CUPKPOINT_STR            ="Cupkpoint";                  // DBTYPE_I4           55当然PK点

	var M_G_SERVER_USERDT_INVITE_TOTALPKPOINT             =56;  
	var M_G_SERVER_USERDT_INVITE_TOTALPKPOINT_STR         ="totalpkpoint";               // DBTYPE_I4           56总PK点

	var M_G_SERVER_USERDT_INVITE_TOTALMONEY               =57;  
	var M_G_SERVER_USERDT_INVITE_TOTALMONEY_STR           ="totalMoney";                 // DBTYPE_I4           57游戏币

	var M_G_SERVER_USERDT_INVITE_TOTALTICKET              =58;  
	var M_G_SERVER_USERDT_INVITE_TOTALTICKET_STR          ="totalticket";                // DBTYPE_I4           58点券

	var M_G_SERVER_USERDT_INVITE_TOKENMONEY               =59;  
	var M_G_SERVER_USERDT_INVITE_TOKENMONEY_STR           ="TokenMoney";                 // DBTYPE_I4           59代金券

	var M_G_SERVER_USERDT_INVITE_ONLINETM                 =60;  
	var M_G_SERVER_USERDT_INVITE_ONLINETM_STR             ="OnLineTm";                   // DBTYPE_I4           60总在线时间

	var M_G_SERVER_USERDT_INVITE_MULMONEY                 =61;  
	var M_G_SERVER_USERDT_INVITE_MULMONEY_STR             ="mulmoney";                   // DBTYPE_R4           61 当前钱倍比

	var M_G_SERVER_USERDT_INVITE_USERTHIS                 =62;  
	var M_G_SERVER_USERDT_INVITE_USERTHIS_STR             ="userthis";                   // DBTYPE_I4           62用户客户端指针

	var M_G_SERVER_USERDT_INVITE_FSMTYPE                  =63;  
	var M_G_SERVER_USERDT_INVITE_FSMTYPE_STR              ="fsmtype";                    // DBTYPE_I4           63用户状态类型

	var M_G_SERVER_USERDT_INVITE_CHAIRINDEX               =64;  
	var M_G_SERVER_USERDT_INVITE_CHAIRINDEX_STR           ="ChairIndex";                 // DBTYPE_I4           64用户所在等待房间位置

	var M_G_SERVER_USERDT_INVITE_USERTYPE                 =65;  
	var M_G_SERVER_USERDT_INVITE_USERTYPE_STR             ="UserType";                   // DBTYPE_I4           65类型，用户还是npc，及是哪类npc

	var M_G_SERVER_USERDT_INVITE_ROOMARENA                =66;  
	var M_G_SERVER_USERDT_INVITE_ROOMARENA_STR            ="RoomArena";                  // DBTYPE_I4           66大厅是否在实景中

	var M_G_SERVER_USERDT_INVITE_CULEVEL                  =67;  
	var M_G_SERVER_USERDT_INVITE_CULEVEL_STR              ="CuLevel";                    // DBTYPE_I4           67当前等级

	var M_G_SERVER_USERDT_INVITE_CUEXP                    =68;  
	var M_G_SERVER_USERDT_INVITE_CUEXP_STR                ="CuExp";                      // DBTYPE_I4           68当前经验

	var M_G_SERVER_USERDT_INVITE_TB_ATTDEF                =69;  
	var M_G_SERVER_USERDT_INVITE_TB_ATTDEF_STR            ="tb_attdef";                  // DBTYPE_LONGVARBINARY69由网络同步的atttree

	var M_G_SERVER_USERDT_INVITE_SPOINT                   =70;  
	var M_G_SERVER_USERDT_INVITE_SPOINT_STR               ="SPoint";                     // DBTYPE_I4           70角色总技能点

	var M_G_SERVER_USERDT_INVITE_TRAIN_STEP               =71;  
	var M_G_SERVER_USERDT_INVITE_TRAIN_STEP_STR           ="train_step";                 // DBTYPE_I4           71训练关进度

	var M_G_SERVER_USERDT_INVITE_DTINIT                   =72;  
	var M_G_SERVER_USERDT_INVITE_DTINIT_STR               ="dtinit";                     // DBTYPE_I4           72数据初始化状态

	var M_G_SERVER_USERDT_INVITE_RP                       =73;  
	var M_G_SERVER_USERDT_INVITE_RP_STR                   ="RP";                         // DBTYPE_I4           73人品值

	var M_G_SERVER_USERDT_INVITE_RPERVEC                  =74;  
	var M_G_SERVER_USERDT_INVITE_RPERVEC_STR              ="RPerVec";                    // DBTYPE_I4           74录象的版本号

	var M_G_SERVER_USERDT_INVITE_TOTALEXP                 =75;  
	var M_G_SERVER_USERDT_INVITE_TOTALEXP_STR             ="totalExp";                   // DBTYPE_I4           75排行榜的经验

	var M_G_SERVER_USERDT_INVITE_RULESTATION              =76;  
	var M_G_SERVER_USERDT_INVITE_RULESTATION_STR          ="ruleStation";                // DBTYPE_I4           76根据网球规则的逻辑站位 5表示在房间中的 1~4是游戏里面用的. 具体游戏中发球的站位, 1为+x-z 2为-x-z 3为-x+z 4为+x+z

	var M_G_SERVER_USERDT_INVITE_TITLE                    =77;  
	var M_G_SERVER_USERDT_INVITE_TITLE_STR                ="title";                      // DBTYPE_I4           77称号

	var M_G_SERVER_USERDT_INVITE_ACCOUNTTYPE              =78;  
	var M_G_SERVER_USERDT_INVITE_ACCOUNTTYPE_STR          ="AccountType";                // DBTYPE_I4           78帐户类型

	var M_G_SERVER_USERDT_INVITE_TOTLETICKET              =79;  
	var M_G_SERVER_USERDT_INVITE_TOTLETICKET_STR          ="TotleTicket";                // DBTYPE_I4           79消费总点券

	var M_G_SERVER_USERDT_INVITE_SDP2PSVRID               =80;  
	var M_G_SERVER_USERDT_INVITE_SDP2PSVRID_STR           ="SdP2pSvrId";                 // DBTYPE_I4           80盛大P2P Server ID

	var M_G_SERVER_USERDT_INVITE_SDP2PID                  =81;  
	var M_G_SERVER_USERDT_INVITE_SDP2PID_STR              ="SdP2pId";                    // DBTYPE_I4           81盛大P2P ID

	var M_G_SERVER_USERDT_INVITE_USER_NAME                =82;  
	var M_G_SERVER_USERDT_INVITE_USER_NAME_STR            ="user_name";                  // DBTYPE_WVARCHAR     82用户登录名

	var M_G_SERVER_USERDT_INVITE_OPERATCTRL               =83;  
	var M_G_SERVER_USERDT_INVITE_OPERATCTRL_STR           ="OperatCtrl";                 // DBTYPE_WVARCHAR     83运营控制(是否被禁言;)

	var M_G_SERVER_USERDT_INVITE_GAMESTATION              =84;  
	var M_G_SERVER_USERDT_INVITE_GAMESTATION_STR          ="GameStation";                // DBTYPE_I4           84游戏内人物ID, 用于确定首发, 接发等. 游戏中该值不会改变, 是游戏中人物的唯一标识, 取值1~4. 进入游戏时, 1为发球, 2为发球队友, 3为接发球, 4为接发球队友. 随游戏进程, 发球者ID会改变.

	var M_G_SERVER_USERDT_INVITE_P2PPING                  =85;  
	var M_G_SERVER_USERDT_INVITE_P2PPING_STR              ="p2pping";                    // DBTYPE_I4           85 p2p ping

	var M_G_SERVER_USERDT_INVITE_POPEDOM                  =86;  
	var M_G_SERVER_USERDT_INVITE_POPEDOM_STR              ="Popedom";                    // DBTYPE_I4           86GM权力

	var M_G_SERVER_USERDT_INVITE_CREATEROOMTM             =87;  
	var M_G_SERVER_USERDT_INVITE_CREATEROOMTM_STR         ="CreateRoomTm";               // DBTYPE_LONGVARBINARY87创建房间时间

	var M_G_SERVER_USERDT_INVITE_PRIXPOINT                =88;  
	var M_G_SERVER_USERDT_INVITE_PRIXPOINT_STR            ="PrixPoint";                  // DBTYPE_I4           88大奖赛积分

	var M_G_SERVER_USERDT_INVITE_TS_PRIXSENSON            =89;  
	var M_G_SERVER_USERDT_INVITE_TS_PRIXSENSON_STR        ="TS_PrixSenson";              // DBTYPE_I4           89网球明星榜:大奖赛-本赛季(废弃)

	var M_G_SERVER_USERDT_INVITE_TS_PRIXALL               =90;  
	var M_G_SERVER_USERDT_INVITE_TS_PRIXALL_STR           ="TS_PrixAll";                 // DBTYPE_I4           90网球明星榜:大奖赛-总排行(废弃)

	var M_G_SERVER_USERDT_INVITE_TS_RACEWINNUM            =91;  
	var M_G_SERVER_USERDT_INVITE_TS_RACEWINNUM_STR        ="TS_RaceWinNum";              // DBTYPE_I4           91网球明星榜:竞技-胜利场次(个人信息-战绩统计)

	var M_G_SERVER_USERDT_INVITE_TS_RACEALLSCORE          =92;  
	var M_G_SERVER_USERDT_INVITE_TS_RACEALLSCORE_STR      ="TS_RaceAllScore";            // DBTYPE_I4           92网球明星榜:竞技-总得分(个人信息-战绩统计)

	var M_G_SERVER_USERDT_INVITE_TS_RACEACE               =93;  
	var M_G_SERVER_USERDT_INVITE_TS_RACEACE_STR           ="TS_RaceACE";                 // DBTYPE_I4           93网球明星榜:竞技-Ace球总数(个人信息-战绩统计)

	var M_G_SERVER_USERDT_INVITE_TS_RACESKILLSCORE        =94;  
	var M_G_SERVER_USERDT_INVITE_TS_RACESKILLSCORE_STR    ="TS_RaceSkillScore";          // DBTYPE_I4           94网球明星榜:竞技-技能得分数(废弃)

	var M_G_SERVER_USERDT_INVITE_TS_RACESKILLNUM          =95;  
	var M_G_SERVER_USERDT_INVITE_TS_RACESKILLNUM_STR      ="TS_RaceSkillNum";            // DBTYPE_I4           95网球明星榜:竞技-技能总数(个人信息-战绩统计)

	var M_G_SERVER_USERDT_INVITE_TS_RACESKILLRATE         =96;  
	var M_G_SERVER_USERDT_INVITE_TS_RACESKILLRATE_STR     ="TS_RaceSkillRate";           // DBTYPE_I4           96网球明星榜:竞技-技能得分率(个人信息-战绩统计)(废弃)

	var M_G_SERVER_USERDT_INVITE_TS_RACEBREAKSKILL        =97;  
	var M_G_SERVER_USERDT_INVITE_TS_RACEBREAKSKILL_STR    ="TS_RaceBreakSkill";          // DBTYPE_I4           97网球明星榜:竞技-普通破解技能(个人信息-战绩统计)(废弃)

	var M_G_SERVER_USERDT_INVITE_TS_RACESKILLBREAKSKILL   =98;  
	var M_G_SERVER_USERDT_INVITE_TS_RACESKILLBREAKSKILL_STR="TS_RaceSkillBreakSkill";     // DBTYPE_I4           98网球明星榜:竞技-技能破解技能(个人信息-战绩统计)(废弃)

	var M_G_SERVER_USERDT_INVITE_TS_RACEBREAKSUCCESS      =99;  
	var M_G_SERVER_USERDT_INVITE_TS_RACEBREAKSUCCESS_STR  ="TS_RaceBreakSuccess";        // DBTYPE_I4           99网球明星榜:竞技-破发成功率(个人信息-战绩统计)(废弃)

	var M_G_SERVER_USERDT_INVITE_TS_RACEBREAKNUM          =100; 
	var M_G_SERVER_USERDT_INVITE_TS_RACEBREAKNUM_STR      ="TS_RaceBreakNum";            // DBTYPE_I4           100网球明星榜:竞技-破发局数(个人信息-战绩统计)(废弃)

	var M_G_SERVER_USERDT_INVITE_TS_RACEALLNUM            =101; 
	var M_G_SERVER_USERDT_INVITE_TS_RACEALLNUM_STR        ="TS_RaceAllNum";              // DBTYPE_I4           101竞技-总比赛场次(个人信息-战绩统计)

	var M_G_SERVER_USERDT_INVITE_RULETYPE                 =102; 
	var M_G_SERVER_USERDT_INVITE_RULETYPE_STR             ="RuleType";                   // DBTYPE_I4           102 0. 发球方  1. 接球方  2. 发球方队友  3. 接球方队友

	var M_G_SERVER_USERDT_INVITE_ACHIEVETRAINID           =103; 
	var M_G_SERVER_USERDT_INVITE_ACHIEVETRAINID_STR       ="AchieveTrainID";             // DBTYPE_WVARCHAR     103 完成的训练ID 不同步到客户端 服务器用

	var M_G_SERVER_USERDT_INVITE_RECEIVEQUALIFY           =104; 
	var M_G_SERVER_USERDT_INVITE_RECEIVEQUALIFY_STR       ="ReceiveQualify";             // DBTYPE_I4           104 获得的称号 1.新手 2.资格赛 3巡回 4黄金 5大师

	var M_G_SERVER_USERDT_INVITE_TS_RACECANBREAKNUM       =105; 
	var M_G_SERVER_USERDT_INVITE_TS_RACECANBREAKNUM_STR   ="TS_RaceCanBreakNum";         // DBTYPE_I4           105 竞技-可破发局数

	var M_G_SERVER_USERDT_INVITE_GAMESERVETEAM            =106; 
	var M_G_SERVER_USERDT_INVITE_GAMESERVETEAM_STR        ="GameServeTeam";              // DBTYPE_I4           106 游戏内发球的队伍 1队发球 2队接发球

	var M_G_SERVER_USERDT_INVITE_SERIESWINNUM             =107; 
	var M_G_SERVER_USERDT_INVITE_SERIESWINNUM_STR         ="SeriesWinNum";               // DBTYPE_I4           107 连胜次数

	var M_G_SERVER_USERDT_INVITE_SERIESWINTIME            =108; 
	var M_G_SERVER_USERDT_INVITE_SERIESWINTIME_STR        ="SeriesWinTime";              // DBTYPE_NUMERIC      108 达到此连胜的时间

	var M_G_SERVER_USERDT_INVITE_RUNTIME                  =109; 
	var M_G_SERVER_USERDT_INVITE_RUNTIME_STR              ="RunTime";                    // DBTYPE_NUMERIC      109 竞技报名时间

	var M_G_SERVER_USERDT_INVITE_ARENASTATE               =110; 
	var M_G_SERVER_USERDT_INVITE_ARENASTATE_STR           ="ArenaState";                 // DBTYPE_I4           110 竞技赛状态 0.默认 1.去竞技赛游戏了

	var M_G_SERVER_USERDT_INVITE_WAGER                    =111; 
	var M_G_SERVER_USERDT_INVITE_WAGER_STR                ="Wager";                      // DBTYPE_I4           111 赌注

	var M_G_SERVER_USERDT_INVITE_TS_FULLSTORENUM          =112; 
	var M_G_SERVER_USERDT_INVITE_TS_FULLSTORENUM_STR      ="TS_FullStoreNum";            // DBTYPE_I4           112 网球明星榜:竞技-	满蓄力次数(个人信息-战绩统计)

	var M_G_SERVER_USERDT_INVITE_INLINEPRENSENT           =113; 
	var M_G_SERVER_USERDT_INVITE_INLINEPRENSENT_STR       ="InlinePrensent";             // DBTYPE_I4           113 在线领取礼物-已经领取好了的

	var M_G_SERVER_USERDT_INVITE_INLINEPRENSENTTM         =114; 
	var M_G_SERVER_USERDT_INVITE_INLINEPRENSENTTM_STR     ="InlinePrensentTm";           // DBTYPE_I4           114 在线领取礼物的用户时间(秒)

	var M_G_SERVER_USERDT_INVITE_ARENARACEID              =115; 
	var M_G_SERVER_USERDT_INVITE_ARENARACEID_STR          ="ArenaRaceID";                // DBTYPE_I4           115 参加的竞技赛ID

	var M_G_SERVER_USERDT_INVITE_GAMEWINPRESENT           =116; 
	var M_G_SERVER_USERDT_INVITE_GAMEWINPRESENT_STR       ="GameWinPresent";             // DBTYPE_I4           116 获胜时领过奖品时的游戏场次

	var M_G_SERVER_USERDT_INVITE_TS_ARENAALLNUM           =117; 
	var M_G_SERVER_USERDT_INVITE_TS_ARENAALLNUM_STR       ="TS_ArenaAllNum";             // DBTYPE_I4           117 竞技的比赛场次

	var M_G_SERVER_USERDT_INVITE_TS_ARENAWINNUM           =118; 
	var M_G_SERVER_USERDT_INVITE_TS_ARENAWINNUM_STR       ="TS_ArenaWinNum";             // DBTYPE_I4           118 竞技的获胜场次

	var M_G_SERVER_USERDT_INVITE_NORMALSTAT               =119; 
	var M_G_SERVER_USERDT_INVITE_NORMALSTAT_STR           ="NormalStat";                 // DBTYPE_I4           119 玩家可以进行的普通统计次数

	var M_G_SERVER_USERDT_INVITE_ARENASTAT                =120; 
	var M_G_SERVER_USERDT_INVITE_ARENASTAT_STR            ="ArenaStat";                  // DBTYPE_I4           120 玩家可以进行的竞技统计次数

	var M_G_SERVER_USERDT_INVITE_ENTRYTRAINID             =121; 
	var M_G_SERVER_USERDT_INVITE_ENTRYTRAINID_STR         ="EntryTrainID";               // DBTYPE_I4           121 进入训练的id

	var M_G_SERVER_USERDT_INVITE_ENTRYTRAINTM             =122; 
	var M_G_SERVER_USERDT_INVITE_ENTRYTRAINTM_STR         ="EntryTrainTm";               // DBTYPE_NUMERIC      122 进入训练的时间

	var M_G_SERVER_USERDT_INVITE_ARENADATA1               =123; 
	var M_G_SERVER_USERDT_INVITE_ARENADATA1_STR           ="ArenaData1";                 // DBTYPE_I4           123 竞技比分1

	var M_G_SERVER_USERDT_INVITE_ARENADATA2               =124; 
	var M_G_SERVER_USERDT_INVITE_ARENADATA2_STR           ="ArenaData2";                 // DBTYPE_I4           124 竞技比分2

	var M_G_SERVER_USERDT_INVITE_ARENADATA3               =125; 
	var M_G_SERVER_USERDT_INVITE_ARENADATA3_STR           ="ArenaData3";                 // DBTYPE_I4           125 竞技比分3

	var M_G_SERVER_USERDT_INVITE_ARENADATA4               =126; 
	var M_G_SERVER_USERDT_INVITE_ARENADATA4_STR           ="ArenaData4";                 // DBTYPE_I4           126 竞技比分4

	var M_G_SERVER_USERDT_INVITE_ARENADATA5               =127; 
	var M_G_SERVER_USERDT_INVITE_ARENADATA5_STR           ="ArenaData5";                 // DBTYPE_I4           127 竞技比分5

	var M_G_SERVER_USERDT_INVITE_ALLTEAMUSER              =128; 
	var M_G_SERVER_USERDT_INVITE_ALLTEAMUSER_STR          ="AllTeamUser";                // DBTYPE_WVARCHAR     128 所有组队的成员

	var M_G_SERVER_USERDT_INVITE_ALLTEAMSVID              =129; 
	var M_G_SERVER_USERDT_INVITE_ALLTEAMSVID_STR          ="AllTeamSvID";                // DBTYPE_WVARCHAR     129 组队成员来自的服务器ID

	var M_G_SERVER_USERDT_INVITE_TROLETYPE                =130; 
	var M_G_SERVER_USERDT_INVITE_TROLETYPE_STR            ="TRoleType";                  // DBTYPE_I4           130 网球的角色类型id

	var M_G_SERVER_USERDT_INVITE_VIPVALUE                 =131; 
	var M_G_SERVER_USERDT_INVITE_VIPVALUE_STR             ="VipValue";                   // DBTYPE_I4           131 Vip标识

	var M_G_SERVER_USERDT_INVITE_LOSTONLINETM             =132; 
	var M_G_SERVER_USERDT_INVITE_LOSTONLINETM_STR         ="LostOnLineTm";               // DBTYPE_NUMERIC      132 最后一次上线时间

	var M_G_SERVER_USERDT_INVITE_TASKCOMPLETE             =133; 
	var M_G_SERVER_USERDT_INVITE_TASKCOMPLETE_STR         ="TaskComplete";               // DBTYPE_LONGVARBINARY133 已经完成的任务

	var M_G_SERVER_USERDT_INVITE_STOREINFO                =134; 
	var M_G_SERVER_USERDT_INVITE_STOREINFO_STR            ="StoreInfo";                  // DBTYPE_LONGVARBINARY133 已经完成的任务

	var M_G_SERVER_USERDT_INVITE_ALLTEAMLV                =135; 
	var M_G_SERVER_USERDT_INVITE_ALLTEAMLV_STR            ="AllTeamLv";                  // DBTYPE_I4           134 组队成员的等级,队伍是平均等级

	var M_G_SERVER_USERDT_INVITE_ALLTEAMWINRATIO          =136; 
	var M_G_SERVER_USERDT_INVITE_ALLTEAMWINRATIO_STR      ="AllTeamWinRatio";            // DBTYPE_I4           135 组队成员的胜率

	var M_G_SERVER_USERDT_INVITE_TASK                     =137; 
	var M_G_SERVER_USERDT_INVITE_TASK_STR                 ="Task";                       // DBTYPE_WVARCHAR     136 任务记录(已经接的任务)

	var M_G_SERVER_USERDT_INVITE_EVERYDAYTASKCOMPLETE     =138; 
	var M_G_SERVER_USERDT_INVITE_EVERYDAYTASKCOMPLETE_STR ="EverydayTaskComplete";       // DBTYPE_LONGVARBINARY137 已经完成的日常任务

	var M_G_SERVER_USERDT_INVITE_CANSLOGAN                =139; 
	var M_G_SERVER_USERDT_INVITE_CANSLOGAN_STR            ="CanSlogan";                  // DBTYPE_I4           138 能否发表获胜感言

	var M_G_SERVER_USERDT_INVITE_QUEUEDTID                =140; 
	var M_G_SERVER_USERDT_INVITE_QUEUEDTID_STR            ="QueueDtID";                  // DBTYPE_NUMERIC      139 活动数据id

	var M_G_SERVER_USERDT_INVITE_FAMILYID                 =141; 
	var M_G_SERVER_USERDT_INVITE_FAMILYID_STR             ="FamilyID";                   // DBTYPE_I4           140 家族ID

	var M_G_SERVER_USERDT_INVITE_MANGOUID                 =142; 
	var M_G_SERVER_USERDT_INVITE_MANGOUID_STR             ="MangoUID";                   // DBTYPE_NUMERIC      141 芒果的UID，目前只是服务器使用

	var M_G_SERVER_USERDT_INVITE_LIMITSAY                 =143; 
	var M_G_SERVER_USERDT_INVITE_LIMITSAY_STR             ="LimitSay";                   // DBTYPE_NUMERIC      142 玩家被限制说话的时间


	var USERDT_USER                                       ="userdt_user";
	var M_G_SERVER_USERDT_USER_UID                        =0;   
	var M_G_SERVER_USERDT_USER_UID_STR                    ="uid";                        // DBTYPE_I4           0用户ID

	var M_G_SERVER_USERDT_USER_NKNAME                     =1;   
	var M_G_SERVER_USERDT_USER_NKNAME_STR                 ="nkname";                     // DBTYPE_WVARCHAR     1游戏中使用名称

	var M_G_SERVER_USERDT_USER_SEX                        =2;   
	var M_G_SERVER_USERDT_USER_SEX_STR                    ="sex";                        // DBTYPE_I4           2性别 1男 2女

	var M_G_SERVER_USERDT_USER_RID                        =3;   
	var M_G_SERVER_USERDT_USER_RID_STR                    ="rid";                        // DBTYPE_I4           3游戏中使用的角色(唯一ID)

	var M_G_SERVER_USERDT_USER_PLUS_RID                   =4;   
	var M_G_SERVER_USERDT_USER_PLUS_RID_STR               ="plus_rid";                   // DBTYPE_I4           4游戏中使用的第二个角色(唯一ID)

	var M_G_SERVER_USERDT_USER_USERSTA                    =5;   
	var M_G_SERVER_USERDT_USER_USERSTA_STR                ="usersta";                    // DBTYPE_I4           5用户状态(是否旁观) 0未知 1旁观者 2参赛者

	var M_G_SERVER_USERDT_USER_GAMESTA                    =6;   
	var M_G_SERVER_USERDT_USER_GAMESTA_STR                ="gamesta";                    // DBTYPE_I4           6当前游戏状态 0断线 1空闲中 2房间内 3游戏中

	var M_G_SERVER_USERDT_USER_DID                        =7;   
	var M_G_SERVER_USERDT_USER_DID_STR                    ="did";                        // DBTYPE_I4           7所在桌子ID

	var M_G_SERVER_USERDT_USER_MID                        =8;   
	var M_G_SERVER_USERDT_USER_MID_STR                    ="mid";                        // DBTYPE_I4           8所在地图ID

	var M_G_SERVER_USERDT_USER_SD_PID                     =9;   
	var M_G_SERVER_USERDT_USER_SD_PID_STR                 ="sd_pid";                     // DBTYPE_WVARCHAR     9盛大cid

	var M_G_SERVER_USERDT_USER_SD_CID                     =10;  
	var M_G_SERVER_USERDT_USER_SD_CID_STR                 ="sd_cid";                     // DBTYPE_WVARCHAR     10盛大cid

	var M_G_SERVER_USERDT_USER_TEAM                       =11;  
	var M_G_SERVER_USERDT_USER_TEAM_STR                   ="team";                       // DBTYPE_I4           11所属队伍

	var M_G_SERVER_USERDT_USER_READY                      =12;  
	var M_G_SERVER_USERDT_USER_READY_STR                  ="ready";                      // DBTYPE_I4           12准备状态:0未知 1等待 2准备

	var M_G_SERVER_USERDT_USER_CAROM                      =13;  
	var M_G_SERVER_USERDT_USER_CAROM_STR                  ="carom";                      // DBTYPE_I4           13连击数

	var M_G_SERVER_USERDT_USER_KILLNUM                    =14;  
	var M_G_SERVER_USERDT_USER_KILLNUM_STR                ="killnum";                    // DBTYPE_I4           14击倒数

	var M_G_SERVER_USERDT_USER_USERNUM                    =15;  
	var M_G_SERVER_USERDT_USER_USERNUM_STR                ="usernum";                    // DBTYPE_I4           15剩余人数

	var M_G_SERVER_USERDT_USER_DAMAGE                     =16;  
	var M_G_SERVER_USERDT_USER_DAMAGE_STR                 ="damage";                     // DBTYPE_I4           16总伤害

	var M_G_SERVER_USERDT_USER_MULEXP                     =17;  
	var M_G_SERVER_USERDT_USER_MULEXP_STR                 ="mulexp";                     // DBTYPE_R4           17 当前经验倍比

	var M_G_SERVER_USERDT_USER_PKPOINT                    =18;  
	var M_G_SERVER_USERDT_USER_PKPOINT_STR                ="pkpoint";                    // DBTYPE_I4           18获得PK点

	var M_G_SERVER_USERDT_USER_MONEY                      =19;  
	var M_G_SERVER_USERDT_USER_MONEY_STR                  ="money";                      // DBTYPE_I4           19获得金钱

	var M_G_SERVER_USERDT_USER_ITEMS                      =20;  
	var M_G_SERVER_USERDT_USER_ITEMS_STR                  ="items";                      // DBTYPE_WVARCHAR     20获得道具

	var M_G_SERVER_USERDT_USER_ISWIN                      =21;  
	var M_G_SERVER_USERDT_USER_ISWIN_STR                  ="iswin";                      // DBTYPE_BOOL         21是否胜利

	var M_G_SERVER_USERDT_USER_FRACTION                   =22;  
	var M_G_SERVER_USERDT_USER_FRACTION_STR               ="fraction";                   // DBTYPE_I4           22总分数

	var M_G_SERVER_USERDT_USER_PIPFRAC                    =23;  
	var M_G_SERVER_USERDT_USER_PIPFRAC_STR                ="pipfrac";                    // DBTYPE_I4           23击杀分

	var M_G_SERVER_USERDT_USER_SURVIVAL                   =24;  
	var M_G_SERVER_USERDT_USER_SURVIVAL_STR               ="survival";                   // DBTYPE_I4           24生存分

	var M_G_SERVER_USERDT_USER_SKILLFRAC                  =25;  
	var M_G_SERVER_USERDT_USER_SKILLFRAC_STR              ="skillfrac";                  // DBTYPE_I4           25技巧分

	var M_G_SERVER_USERDT_USER_RANKFRAC                   =26;  
	var M_G_SERVER_USERDT_USER_RANKFRAC_STR               ="rankfrac";                   // DBTYPE_I4           26队伍总分数

	var M_G_SERVER_USERDT_USER_INDULGE                    =27;  
	var M_G_SERVER_USERDT_USER_INDULGE_STR                ="indulge";                    // DBTYPE_I4           27反沉迷于等级

	var M_G_SERVER_USERDT_USER_SORT                       =28;  
	var M_G_SERVER_USERDT_USER_SORT_STR                   ="sort";                       // DBTYPE_I4           28排名

	var M_G_SERVER_USERDT_USER_POSX                       =29;  
	var M_G_SERVER_USERDT_USER_POSX_STR                   ="posx";                       // DBTYPE_R4           29玩家位置

	var M_G_SERVER_USERDT_USER_POSY                       =30;  
	var M_G_SERVER_USERDT_USER_POSY_STR                   ="posy";                       // DBTYPE_R4           30

	var M_G_SERVER_USERDT_USER_POSZ                       =31;  
	var M_G_SERVER_USERDT_USER_POSZ_STR                   ="posz";                       // DBTYPE_R4           31

	var M_G_SERVER_USERDT_USER_ROTEX                      =32;  
	var M_G_SERVER_USERDT_USER_ROTEX_STR                  ="rotex";                      // DBTYPE_R4           32玩家角度

	var M_G_SERVER_USERDT_USER_ROTEY                      =33;  
	var M_G_SERVER_USERDT_USER_ROTEY_STR                  ="rotey";                      // DBTYPE_R4           33

	var M_G_SERVER_USERDT_USER_ROTEZ                      =34;  
	var M_G_SERVER_USERDT_USER_ROTEZ_STR                  ="rotez";                      // DBTYPE_R4           34

	var M_G_SERVER_USERDT_USER_FSMID                      =35;  
	var M_G_SERVER_USERDT_USER_FSMID_STR                  ="fsmid";                      // DBTYPE_I4           35状态号

	var M_G_SERVER_USERDT_USER_FSMTM                      =36;  
	var M_G_SERVER_USERDT_USER_FSMTM_STR                  ="fsmtm";                      // DBTYPE_I4           36状态起始时间

	var M_G_SERVER_USERDT_USER_CHANGNUM                   =37;  
	var M_G_SERVER_USERDT_USER_CHANGNUM_STR               ="changnum";                   // DBTYPE_I4           37可以换人的次数

	var M_G_SERVER_USERDT_USER_ISDEAD                     =38;  
	var M_G_SERVER_USERDT_USER_ISDEAD_STR                 ="isdead";                     // DBTYPE_I4           38是否死亡

	var M_G_SERVER_USERDT_USER_ISOVER                     =39;  
	var M_G_SERVER_USERDT_USER_ISOVER_STR                 ="isover";                     // DBTYPE_I4           39是否游戏结束

	var M_G_SERVER_USERDT_USER_HITID                      =40;  
	var M_G_SERVER_USERDT_USER_HITID_STR                  ="hitid";                      // DBTYPE_I4           40上次攻击到的角色id（被动方id）

	var M_G_SERVER_USERDT_USER_INITIATIVE_HITSTATE        =41;  
	var M_G_SERVER_USERDT_USER_INITIATIVE_HITSTATE_STR    ="initiative_hitstate";        // DBTYPE_I4           41上次攻击到目标时所处的状态（主动方状态）

	var M_G_SERVER_USERDT_USER_INITIATIVE_BEHITSTATE      =42;  
	var M_G_SERVER_USERDT_USER_INITIATIVE_BEHITSTATE_STR  ="initiative_behitstate";      // DBTYPE_I4           42上次攻击到的角色所处的状态（被动方状态）

	var M_G_SERVER_USERDT_USER_BEHITID                    =43;  
	var M_G_SERVER_USERDT_USER_BEHITID_STR                ="behitid";                    // DBTYPE_I4           43上次被攻击到的角色id（主动方id）

	var M_G_SERVER_USERDT_USER_PASSIVITY_HITSTATE         =44;  
	var M_G_SERVER_USERDT_USER_PASSIVITY_HITSTATE_STR     ="passivity_hitstate";         // DBTYPE_I4           44上次被攻击时攻击方状态（主动方状态）

	var M_G_SERVER_USERDT_USER_PASSIVITY_BEHITSTATE       =45;  
	var M_G_SERVER_USERDT_USER_PASSIVITY_BEHITSTATE_STR   ="passivity_behitstate";       // DBTYPE_I4           45上次被攻击时自己的状态（被动方状态）

	var M_G_SERVER_USERDT_USER_HITPARTSID                 =46;  
	var M_G_SERVER_USERDT_USER_HITPARTSID_STR             ="hitpartsid";                 // DBTYPE_I4           46上次攻击到对方的部件id

	var M_G_SERVER_USERDT_USER_BEHITPARTSID               =47;  
	var M_G_SERVER_USERDT_USER_BEHITPARTSID_STR           ="behitpartsid";               // DBTYPE_I4           47上次被对方攻击到的部件id

	var M_G_SERVER_USERDT_USER_INITIATIVE_ATTDEFID        =48;  
	var M_G_SERVER_USERDT_USER_INITIATIVE_ATTDEFID_STR    ="initiative_attdefid";        // DBTYPE_I4           48上次攻击到目标时对应的ATTDEF表中的索引

	var M_G_SERVER_USERDT_USER_PASSIVITY_ATTDEFID         =49;  
	var M_G_SERVER_USERDT_USER_PASSIVITY_ATTDEFID_STR     ="passivity_attdefid";         // DBTYPE_LONGVARBINARY49上次被攻击到时对方对应的ATTDEF表中的索引

	var M_G_SERVER_USERDT_USER_DBUFF                      =50;  
	var M_G_SERVER_USERDT_USER_DBUFF_STR                  ="DBuff";                      // DBTYPE_LONGVARBINARY50DBuff存放空间

	var M_G_SERVER_USERDT_USER_PVEWINCOUNT                =51;  
	var M_G_SERVER_USERDT_USER_PVEWINCOUNT_STR            ="PveWinCount";                // DBTYPE_I4           51PVE胜利总场次

	var M_G_SERVER_USERDT_USER_PVPWINCOUNT                =52;  
	var M_G_SERVER_USERDT_USER_PVPWINCOUNT_STR            ="PvpWinCount";                // DBTYPE_I4           52PVP胜利总场次

	var M_G_SERVER_USERDT_USER_PVEWARCOUNT                =53;  
	var M_G_SERVER_USERDT_USER_PVEWARCOUNT_STR            ="PveWarCount";                // DBTYPE_I4           53PVE战斗场次

	var M_G_SERVER_USERDT_USER_PVPWARCOUNT                =54;  
	var M_G_SERVER_USERDT_USER_PVPWARCOUNT_STR            ="PvpWarCount";                // DBTYPE_I4           54PVP战斗场次

	var M_G_SERVER_USERDT_USER_CUPKPOINT                  =55;  
	var M_G_SERVER_USERDT_USER_CUPKPOINT_STR              ="Cupkpoint";                  // DBTYPE_I4           55当然PK点

	var M_G_SERVER_USERDT_USER_TOTALPKPOINT               =56;  
	var M_G_SERVER_USERDT_USER_TOTALPKPOINT_STR           ="totalpkpoint";               // DBTYPE_I4           56总PK点

	var M_G_SERVER_USERDT_USER_TOTALMONEY                 =57;  
	var M_G_SERVER_USERDT_USER_TOTALMONEY_STR             ="totalMoney";                 // DBTYPE_I4           57游戏币

	var M_G_SERVER_USERDT_USER_TOTALTICKET                =58;  
	var M_G_SERVER_USERDT_USER_TOTALTICKET_STR            ="totalticket";                // DBTYPE_I4           58点券

	var M_G_SERVER_USERDT_USER_TOKENMONEY                 =59;  
	var M_G_SERVER_USERDT_USER_TOKENMONEY_STR             ="TokenMoney";                 // DBTYPE_I4           59代金券

	var M_G_SERVER_USERDT_USER_ONLINETM                   =60;  
	var M_G_SERVER_USERDT_USER_ONLINETM_STR               ="OnLineTm";                   // DBTYPE_I4           60总在线时间

	var M_G_SERVER_USERDT_USER_MULMONEY                   =61;  
	var M_G_SERVER_USERDT_USER_MULMONEY_STR               ="mulmoney";                   // DBTYPE_R4           61 当前钱倍比

	var M_G_SERVER_USERDT_USER_USERTHIS                   =62;  
	var M_G_SERVER_USERDT_USER_USERTHIS_STR               ="userthis";                   // DBTYPE_I4           62用户客户端指针

	var M_G_SERVER_USERDT_USER_FSMTYPE                    =63;  
	var M_G_SERVER_USERDT_USER_FSMTYPE_STR                ="fsmtype";                    // DBTYPE_I4           63用户状态类型

	var M_G_SERVER_USERDT_USER_CHAIRINDEX                 =64;  
	var M_G_SERVER_USERDT_USER_CHAIRINDEX_STR             ="ChairIndex";                 // DBTYPE_I4           64用户所在等待房间位置

	var M_G_SERVER_USERDT_USER_USERTYPE                   =65;  
	var M_G_SERVER_USERDT_USER_USERTYPE_STR               ="UserType";                   // DBTYPE_I4           65类型，用户还是npc，及是哪类npc

	var M_G_SERVER_USERDT_USER_ROOMARENA                  =66;  
	var M_G_SERVER_USERDT_USER_ROOMARENA_STR              ="RoomArena";                  // DBTYPE_I4           66大厅是否在实景中

	var M_G_SERVER_USERDT_USER_CULEVEL                    =67;  
	var M_G_SERVER_USERDT_USER_CULEVEL_STR                ="CuLevel";                    // DBTYPE_I4           67当前等级

	var M_G_SERVER_USERDT_USER_CUEXP                      =68;  
	var M_G_SERVER_USERDT_USER_CUEXP_STR                  ="CuExp";                      // DBTYPE_I4           68当前经验

	var M_G_SERVER_USERDT_USER_TB_ATTDEF                  =69;  
	var M_G_SERVER_USERDT_USER_TB_ATTDEF_STR              ="tb_attdef";                  // DBTYPE_LONGVARBINARY69由网络同步的atttree

	var M_G_SERVER_USERDT_USER_SPOINT                     =70;  
	var M_G_SERVER_USERDT_USER_SPOINT_STR                 ="SPoint";                     // DBTYPE_I4           70角色总技能点

	var M_G_SERVER_USERDT_USER_TRAIN_STEP                 =71;  
	var M_G_SERVER_USERDT_USER_TRAIN_STEP_STR             ="train_step";                 // DBTYPE_I4           71训练关进度

	var M_G_SERVER_USERDT_USER_DTINIT                     =72;  
	var M_G_SERVER_USERDT_USER_DTINIT_STR                 ="dtinit";                     // DBTYPE_I4           72数据初始化状态

	var M_G_SERVER_USERDT_USER_RP                         =73;  
	var M_G_SERVER_USERDT_USER_RP_STR                     ="RP";                         // DBTYPE_I4           73人品值

	var M_G_SERVER_USERDT_USER_RPERVEC                    =74;  
	var M_G_SERVER_USERDT_USER_RPERVEC_STR                ="RPerVec";                    // DBTYPE_I4           74录象的版本号

	var M_G_SERVER_USERDT_USER_TOTALEXP                   =75;  
	var M_G_SERVER_USERDT_USER_TOTALEXP_STR               ="totalExp";                   // DBTYPE_I4           75排行榜的经验

	var M_G_SERVER_USERDT_USER_RULESTATION                =76;  
	var M_G_SERVER_USERDT_USER_RULESTATION_STR            ="ruleStation";                // DBTYPE_I4           76根据网球规则的逻辑站位 5表示在房间中的 1~4是游戏里面用的. 具体游戏中发球的站位, 1为+x-z 2为-x-z 3为-x+z 4为+x+z

	var M_G_SERVER_USERDT_USER_TITLE                      =77;  
	var M_G_SERVER_USERDT_USER_TITLE_STR                  ="title";                      // DBTYPE_I4           77称号

	var M_G_SERVER_USERDT_USER_ACCOUNTTYPE                =78;  
	var M_G_SERVER_USERDT_USER_ACCOUNTTYPE_STR            ="AccountType";                // DBTYPE_I4           78帐户类型

	var M_G_SERVER_USERDT_USER_TOTLETICKET                =79;  
	var M_G_SERVER_USERDT_USER_TOTLETICKET_STR            ="TotleTicket";                // DBTYPE_I4           79消费总点券

	var M_G_SERVER_USERDT_USER_SDP2PSVRID                 =80;  
	var M_G_SERVER_USERDT_USER_SDP2PSVRID_STR             ="SdP2pSvrId";                 // DBTYPE_I4           80盛大P2P Server ID

	var M_G_SERVER_USERDT_USER_SDP2PID                    =81;  
	var M_G_SERVER_USERDT_USER_SDP2PID_STR                ="SdP2pId";                    // DBTYPE_I4           81盛大P2P ID

	var M_G_SERVER_USERDT_USER_USER_NAME                  =82;  
	var M_G_SERVER_USERDT_USER_USER_NAME_STR              ="user_name";                  // DBTYPE_WVARCHAR     82用户登录名

	var M_G_SERVER_USERDT_USER_OPERATCTRL                 =83;  
	var M_G_SERVER_USERDT_USER_OPERATCTRL_STR             ="OperatCtrl";                 // DBTYPE_WVARCHAR     83运营控制(是否被禁言;)

	var M_G_SERVER_USERDT_USER_GAMESTATION                =84;  
	var M_G_SERVER_USERDT_USER_GAMESTATION_STR            ="GameStation";                // DBTYPE_I4           84游戏内人物ID, 用于确定首发, 接发等. 游戏中该值不会改变, 是游戏中人物的唯一标识, 取值1~4. 进入游戏时, 1为发球, 2为发球队友, 3为接发球, 4为接发球队友. 随游戏进程, 发球者ID会改变.

	var M_G_SERVER_USERDT_USER_P2PPING                    =85;  
	var M_G_SERVER_USERDT_USER_P2PPING_STR                ="p2pping";                    // DBTYPE_I4           85 p2p ping

	var M_G_SERVER_USERDT_USER_POPEDOM                    =86;  
	var M_G_SERVER_USERDT_USER_POPEDOM_STR                ="Popedom";                    // DBTYPE_I4           86GM权力

	var M_G_SERVER_USERDT_USER_CREATEROOMTM               =87;  
	var M_G_SERVER_USERDT_USER_CREATEROOMTM_STR           ="CreateRoomTm";               // DBTYPE_LONGVARBINARY87创建房间时间

	var M_G_SERVER_USERDT_USER_PRIXPOINT                  =88;  
	var M_G_SERVER_USERDT_USER_PRIXPOINT_STR              ="PrixPoint";                  // DBTYPE_I4           88大奖赛积分

	var M_G_SERVER_USERDT_USER_TS_PRIXSENSON              =89;  
	var M_G_SERVER_USERDT_USER_TS_PRIXSENSON_STR          ="TS_PrixSenson";              // DBTYPE_I4           89网球明星榜:大奖赛-本赛季(废弃)

	var M_G_SERVER_USERDT_USER_TS_PRIXALL                 =90;  
	var M_G_SERVER_USERDT_USER_TS_PRIXALL_STR             ="TS_PrixAll";                 // DBTYPE_I4           90网球明星榜:大奖赛-总排行(废弃)

	var M_G_SERVER_USERDT_USER_TS_RACEWINNUM              =91;  
	var M_G_SERVER_USERDT_USER_TS_RACEWINNUM_STR          ="TS_RaceWinNum";              // DBTYPE_I4           91网球明星榜:竞技-胜利场次(个人信息-战绩统计)

	var M_G_SERVER_USERDT_USER_TS_RACEALLSCORE            =92;  
	var M_G_SERVER_USERDT_USER_TS_RACEALLSCORE_STR        ="TS_RaceAllScore";            // DBTYPE_I4           92网球明星榜:竞技-总得分(个人信息-战绩统计)

	var M_G_SERVER_USERDT_USER_TS_RACEACE                 =93;  
	var M_G_SERVER_USERDT_USER_TS_RACEACE_STR             ="TS_RaceACE";                 // DBTYPE_I4           93网球明星榜:竞技-Ace球总数(个人信息-战绩统计)

	var M_G_SERVER_USERDT_USER_TS_RACESKILLSCORE          =94;  
	var M_G_SERVER_USERDT_USER_TS_RACESKILLSCORE_STR      ="TS_RaceSkillScore";          // DBTYPE_I4           94网球明星榜:竞技-技能得分数(废弃)

	var M_G_SERVER_USERDT_USER_TS_RACESKILLNUM            =95;  
	var M_G_SERVER_USERDT_USER_TS_RACESKILLNUM_STR        ="TS_RaceSkillNum";            // DBTYPE_I4           95网球明星榜:竞技-技能总数(个人信息-战绩统计)

	var M_G_SERVER_USERDT_USER_TS_RACESKILLRATE           =96;  
	var M_G_SERVER_USERDT_USER_TS_RACESKILLRATE_STR       ="TS_RaceSkillRate";           // DBTYPE_I4           96网球明星榜:竞技-技能得分率(个人信息-战绩统计)(废弃)

	var M_G_SERVER_USERDT_USER_TS_RACEBREAKSKILL          =97;  
	var M_G_SERVER_USERDT_USER_TS_RACEBREAKSKILL_STR      ="TS_RaceBreakSkill";          // DBTYPE_I4           97网球明星榜:竞技-普通破解技能(个人信息-战绩统计)(废弃)

	var M_G_SERVER_USERDT_USER_TS_RACESKILLBREAKSKILL     =98;  
	var M_G_SERVER_USERDT_USER_TS_RACESKILLBREAKSKILL_STR ="TS_RaceSkillBreakSkill";     // DBTYPE_I4           98网球明星榜:竞技-技能破解技能(个人信息-战绩统计)(废弃)

	var M_G_SERVER_USERDT_USER_TS_RACEBREAKSUCCESS        =99;  
	var M_G_SERVER_USERDT_USER_TS_RACEBREAKSUCCESS_STR    ="TS_RaceBreakSuccess";        // DBTYPE_I4           99网球明星榜:竞技-破发成功率(个人信息-战绩统计)(废弃)

	var M_G_SERVER_USERDT_USER_TS_RACEBREAKNUM            =100; 
	var M_G_SERVER_USERDT_USER_TS_RACEBREAKNUM_STR        ="TS_RaceBreakNum";            // DBTYPE_I4           100网球明星榜:竞技-破发局数(个人信息-战绩统计)(废弃)

	var M_G_SERVER_USERDT_USER_TS_RACEALLNUM              =101; 
	var M_G_SERVER_USERDT_USER_TS_RACEALLNUM_STR          ="TS_RaceAllNum";              // DBTYPE_I4           101竞技-总比赛场次(个人信息-战绩统计)

	var M_G_SERVER_USERDT_USER_RULETYPE                   =102; 
	var M_G_SERVER_USERDT_USER_RULETYPE_STR               ="RuleType";                   // DBTYPE_I4           102 0. 发球方  1. 接球方  2. 发球方队友  3. 接球方队友

	var M_G_SERVER_USERDT_USER_ACHIEVETRAINID             =103; 
	var M_G_SERVER_USERDT_USER_ACHIEVETRAINID_STR         ="AchieveTrainID";             // DBTYPE_WVARCHAR     103 完成的训练ID 不同步到客户端 服务器用

	var M_G_SERVER_USERDT_USER_RECEIVEQUALIFY             =104; 
	var M_G_SERVER_USERDT_USER_RECEIVEQUALIFY_STR         ="ReceiveQualify";             // DBTYPE_I4           104 获得的称号 1.新手 2.资格赛 3巡回 4黄金 5大师

	var M_G_SERVER_USERDT_USER_TS_RACECANBREAKNUM         =105; 
	var M_G_SERVER_USERDT_USER_TS_RACECANBREAKNUM_STR     ="TS_RaceCanBreakNum";         // DBTYPE_I4           105 竞技-可破发局数

	var M_G_SERVER_USERDT_USER_GAMESERVETEAM              =106; 
	var M_G_SERVER_USERDT_USER_GAMESERVETEAM_STR          ="GameServeTeam";              // DBTYPE_I4           106 游戏内发球的队伍 1队发球 2队接发球

	var M_G_SERVER_USERDT_USER_SERIESWINNUM               =107; 
	var M_G_SERVER_USERDT_USER_SERIESWINNUM_STR           ="SeriesWinNum";               // DBTYPE_I4           107 连胜次数

	var M_G_SERVER_USERDT_USER_SERIESWINTIME              =108; 
	var M_G_SERVER_USERDT_USER_SERIESWINTIME_STR          ="SeriesWinTime";              // DBTYPE_NUMERIC      108 达到此连胜的时间

	var M_G_SERVER_USERDT_USER_RUNTIME                    =109; 
	var M_G_SERVER_USERDT_USER_RUNTIME_STR                ="RunTime";                    // DBTYPE_NUMERIC      109 竞技报名时间

	var M_G_SERVER_USERDT_USER_ARENASTATE                 =110; 
	var M_G_SERVER_USERDT_USER_ARENASTATE_STR             ="ArenaState";                 // DBTYPE_I4           110 竞技赛状态 0.默认 1.去竞技赛游戏了

	var M_G_SERVER_USERDT_USER_WAGER                      =111; 
	var M_G_SERVER_USERDT_USER_WAGER_STR                  ="Wager";                      // DBTYPE_I4           111 赌注

	var M_G_SERVER_USERDT_USER_TS_FULLSTORENUM            =112; 
	var M_G_SERVER_USERDT_USER_TS_FULLSTORENUM_STR        ="TS_FullStoreNum";            // DBTYPE_I4           112 网球明星榜:竞技-	满蓄力次数(个人信息-战绩统计)

	var M_G_SERVER_USERDT_USER_INLINEPRENSENT             =113; 
	var M_G_SERVER_USERDT_USER_INLINEPRENSENT_STR         ="InlinePrensent";             // DBTYPE_I4           113 在线领取礼物-已经领取好了的

	var M_G_SERVER_USERDT_USER_INLINEPRENSENTTM           =114; 
	var M_G_SERVER_USERDT_USER_INLINEPRENSENTTM_STR       ="InlinePrensentTm";           // DBTYPE_I4           114 在线领取礼物的用户时间(秒)

	var M_G_SERVER_USERDT_USER_ARENARACEID                =115; 
	var M_G_SERVER_USERDT_USER_ARENARACEID_STR            ="ArenaRaceID";                // DBTYPE_I4           115 参加的竞技赛ID

	var M_G_SERVER_USERDT_USER_GAMEWINPRESENT             =116; 
	var M_G_SERVER_USERDT_USER_GAMEWINPRESENT_STR         ="GameWinPresent";             // DBTYPE_I4           116 获胜时领过奖品时的游戏场次

	var M_G_SERVER_USERDT_USER_TS_ARENAALLNUM             =117; 
	var M_G_SERVER_USERDT_USER_TS_ARENAALLNUM_STR         ="TS_ArenaAllNum";             // DBTYPE_I4           117 竞技的比赛场次

	var M_G_SERVER_USERDT_USER_TS_ARENAWINNUM             =118; 
	var M_G_SERVER_USERDT_USER_TS_ARENAWINNUM_STR         ="TS_ArenaWinNum";             // DBTYPE_I4           118 竞技的获胜场次

	var M_G_SERVER_USERDT_USER_NORMALSTAT                 =119; 
	var M_G_SERVER_USERDT_USER_NORMALSTAT_STR             ="NormalStat";                 // DBTYPE_I4           119 玩家可以进行的普通统计次数

	var M_G_SERVER_USERDT_USER_ARENASTAT                  =120; 
	var M_G_SERVER_USERDT_USER_ARENASTAT_STR              ="ArenaStat";                  // DBTYPE_I4           120 玩家可以进行的竞技统计次数

	var M_G_SERVER_USERDT_USER_ENTRYTRAINID               =121; 
	var M_G_SERVER_USERDT_USER_ENTRYTRAINID_STR           ="EntryTrainID";               // DBTYPE_I4           121 进入训练的id

	var M_G_SERVER_USERDT_USER_ENTRYTRAINTM               =122; 
	var M_G_SERVER_USERDT_USER_ENTRYTRAINTM_STR           ="EntryTrainTm";               // DBTYPE_NUMERIC      122 进入训练的时间

	var M_G_SERVER_USERDT_USER_ARENADATA1                 =123; 
	var M_G_SERVER_USERDT_USER_ARENADATA1_STR             ="ArenaData1";                 // DBTYPE_I4           123 竞技比分1

	var M_G_SERVER_USERDT_USER_ARENADATA2                 =124; 
	var M_G_SERVER_USERDT_USER_ARENADATA2_STR             ="ArenaData2";                 // DBTYPE_I4           124 竞技比分2

	var M_G_SERVER_USERDT_USER_ARENADATA3                 =125; 
	var M_G_SERVER_USERDT_USER_ARENADATA3_STR             ="ArenaData3";                 // DBTYPE_I4           125 竞技比分3

	var M_G_SERVER_USERDT_USER_ARENADATA4                 =126; 
	var M_G_SERVER_USERDT_USER_ARENADATA4_STR             ="ArenaData4";                 // DBTYPE_I4           126 竞技比分4

	var M_G_SERVER_USERDT_USER_ARENADATA5                 =127; 
	var M_G_SERVER_USERDT_USER_ARENADATA5_STR             ="ArenaData5";                 // DBTYPE_I4           127 竞技比分5

	var M_G_SERVER_USERDT_USER_ALLTEAMUSER                =128; 
	var M_G_SERVER_USERDT_USER_ALLTEAMUSER_STR            ="AllTeamUser";                // DBTYPE_WVARCHAR     128 所有组队的成员

	var M_G_SERVER_USERDT_USER_ALLTEAMSVID                =129; 
	var M_G_SERVER_USERDT_USER_ALLTEAMSVID_STR            ="AllTeamSvID";                // DBTYPE_WVARCHAR     129 组队成员来自的服务器ID

	var M_G_SERVER_USERDT_USER_TROLETYPE                  =130; 
	var M_G_SERVER_USERDT_USER_TROLETYPE_STR              ="TRoleType";                  // DBTYPE_I4           130 网球的角色类型id

	var M_G_SERVER_USERDT_USER_VIPVALUE                   =131; 
	var M_G_SERVER_USERDT_USER_VIPVALUE_STR               ="VipValue";                   // DBTYPE_I4           131 Vip标识

	var M_G_SERVER_USERDT_USER_LOSTONLINETM               =132; 
	var M_G_SERVER_USERDT_USER_LOSTONLINETM_STR           ="LostOnLineTm";               // DBTYPE_NUMERIC      132 最后一次上线时间

	var M_G_SERVER_USERDT_USER_TASKCOMPLETE               =133; 
	var M_G_SERVER_USERDT_USER_TASKCOMPLETE_STR           ="TaskComplete";               // DBTYPE_LONGVARBINARY133 已经完成的任务

	var M_G_SERVER_USERDT_USER_STOREINFO                  =134; 
	var M_G_SERVER_USERDT_USER_STOREINFO_STR              ="StoreInfo";                  // DBTYPE_LONGVARBINARY133 已经完成的任务

	var M_G_SERVER_USERDT_USER_ALLTEAMLV                  =135; 
	var M_G_SERVER_USERDT_USER_ALLTEAMLV_STR              ="AllTeamLv";                  // DBTYPE_I4           134 组队成员的等级,队伍是平均等级

	var M_G_SERVER_USERDT_USER_ALLTEAMWINRATIO            =136; 
	var M_G_SERVER_USERDT_USER_ALLTEAMWINRATIO_STR        ="AllTeamWinRatio";            // DBTYPE_I4           135 组队成员的胜率

	var M_G_SERVER_USERDT_USER_TASK                       =137; 
	var M_G_SERVER_USERDT_USER_TASK_STR                   ="Task";                       // DBTYPE_WVARCHAR     136 任务记录(已经接的任务)

	var M_G_SERVER_USERDT_USER_EVERYDAYTASKCOMPLETE       =138; 
	var M_G_SERVER_USERDT_USER_EVERYDAYTASKCOMPLETE_STR   ="EverydayTaskComplete";       // DBTYPE_LONGVARBINARY137 已经完成的日常任务

	var M_G_SERVER_USERDT_USER_CANSLOGAN                  =139; 
	var M_G_SERVER_USERDT_USER_CANSLOGAN_STR              ="CanSlogan";                  // DBTYPE_I4           138 能否发表获胜感言

	var M_G_SERVER_USERDT_USER_QUEUEDTID                  =140; 
	var M_G_SERVER_USERDT_USER_QUEUEDTID_STR              ="QueueDtID";                  // DBTYPE_NUMERIC      139 活动数据id

	var M_G_SERVER_USERDT_USER_FAMILYID                   =141; 
	var M_G_SERVER_USERDT_USER_FAMILYID_STR               ="FamilyID";                   // DBTYPE_I4           140 家族ID

	var M_G_SERVER_USERDT_USER_MANGOUID                   =142; 
	var M_G_SERVER_USERDT_USER_MANGOUID_STR               ="MangoUID";                   // DBTYPE_NUMERIC      141 芒果的UID，目前只是服务器使用

	var M_G_SERVER_USERDT_USER_LIMITSAY                   =143; 
	var M_G_SERVER_USERDT_USER_LIMITSAY_STR               ="LimitSay";                   // DBTYPE_NUMERIC      142 玩家被限制说话的时间

}
