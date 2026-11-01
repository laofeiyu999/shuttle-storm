// 创建日期:2011/5/16 18:26:36
// Access文件名:E:\VnetProject2010\project4\tennis\data\mdb\GameUI.mdb

set window
{
	var GAMEUI                                            ="GameUI.mdb";

	var ARENATIPINFO                                      ="ArenaTipinfo";
	var GAMEUI_ARENATIPINFO_ID                            =0;   
	var GAMEUI_ARENATIPINFO_ID_STR                        ="id";                         // DBTYPE_I4           0 序号

	var GAMEUI_ARENATIPINFO_TYPE                          =1;   
	var GAMEUI_ARENATIPINFO_TYPE_STR                      ="type";                       // DBTYPE_I4           1 类型 0即时（玩家获得连胜后）,1定时(必要公告),2随机(游戏介绍广告),3事件触发(时间点是事件触发的)

	var GAMEUI_ARENATIPINFO_TIMEPOINT                     =2;   
	var GAMEUI_ARENATIPINFO_TIMEPOINT_STR                 ="TimePoint";                  // DBTYPE_DATE         2 开始时间点

	var GAMEUI_ARENATIPINFO_DISTANCE                      =3;   
	var GAMEUI_ARENATIPINFO_DISTANCE_STR                  ="distance";                   // DBTYPE_I4           3 时间间隔(单位：分) 小时(60),天(1440),星期7天(10080),月30天(43200)

	var GAMEUI_ARENATIPINFO_TIMES                         =4;   
	var GAMEUI_ARENATIPINFO_TIMES_STR                     ="times";                      // DBTYPE_I4           播的次数

	var GAMEUI_ARENATIPINFO_CONTENT                       =5;   
	var GAMEUI_ARENATIPINFO_CONTENT_STR                   ="content";                    // DBTYPE_WVARCHAR     显示文本内容（支持格式化%1）

	var GAMEUI_ARENATIPINFO_PARAMNUM                      =6;   
	var GAMEUI_ARENATIPINFO_PARAMNUM_STR                  ="paramnum";                   // DBTYPE_I4           格式参数的个数:0代表不需要参数 n:参数个数

	var GAMEUI_ARENATIPINFO_DESC                          =7;   
	var GAMEUI_ARENATIPINFO_DESC_STR                      ="desc";                       // DBTYPE_WVARCHAR     描述说明


	var BUYCARSELECT                                      ="BuyCarSelect";
	var GAMEUI_BUYCARSELECT_ID                            =0;   
	var GAMEUI_BUYCARSELECT_ID_STR                        ="id";                         // DBTYPE_I4           唯一id

	var GAMEUI_BUYCARSELECT_CID                           =1;   
	var GAMEUI_BUYCARSELECT_CID_STR                       ="cid";                        // DBTYPE_I4           物品id

	var GAMEUI_BUYCARSELECT_NAME                          =2;   
	var GAMEUI_BUYCARSELECT_NAME_STR                      ="name";                       // DBTYPE_WVARCHAR     物品名称

	var GAMEUI_BUYCARSELECT_PRICETYPE                     =3;   
	var GAMEUI_BUYCARSELECT_PRICETYPE_STR                 ="pricetype";                  // DBTYPE_I4           价格类型

	var GAMEUI_BUYCARSELECT_PRICE                         =4;   
	var GAMEUI_BUYCARSELECT_PRICE_STR                     ="price";                      // DBTYPE_WVARCHAR     价格

	var GAMEUI_BUYCARSELECT_TIME                          =5;   
	var GAMEUI_BUYCARSELECT_TIME_STR                      ="time";                       // DBTYPE_WVARCHAR     物品期限

	var GAMEUI_BUYCARSELECT_STATE                         =6;   
	var GAMEUI_BUYCARSELECT_STATE_STR                     ="state";                      // DBTYPE_I4           能否使用

	var GAMEUI_BUYCARSELECT_TYPE                          =7;   
	var GAMEUI_BUYCARSELECT_TYPE_STR                      ="type";                       // DBTYPE_I4           类型

	var GAMEUI_BUYCARSELECT_SELECT                        =8;   
	var GAMEUI_BUYCARSELECT_SELECT_STR                    ="select";                     // DBTYPE_I4           是否选择

	var GAMEUI_BUYCARSELECT_ICON                          =9;   
	var GAMEUI_BUYCARSELECT_ICON_STR                      ="icon";                       // DBTYPE_WVARCHAR     图片

	var GAMEUI_BUYCARSELECT_SEX                           =10;  
	var GAMEUI_BUYCARSELECT_SEX_STR                       ="sex";                        // DBTYPE_I4           性别

	var GAMEUI_BUYCARSELECT_TEMP                          =11;  
	var GAMEUI_BUYCARSELECT_TEMP_STR                      ="temp";                       // DBTYPE_I4           是否为临时

	var GAMEUI_BUYCARSELECT_TIMEINDEX                     =12;  
	var GAMEUI_BUYCARSELECT_TIMEINDEX_STR                 ="timeindex";                  // DBTYPE_I4           物品期限索引 -1 0 1 2


	var CHARGECARSELECT                                   ="ChargeCarSelect";
	var GAMEUI_CHARGECARSELECT_ID                         =0;   
	var GAMEUI_CHARGECARSELECT_ID_STR                     ="id";                         // DBTYPE_I4           唯一id

	var GAMEUI_CHARGECARSELECT_CID                        =1;   
	var GAMEUI_CHARGECARSELECT_CID_STR                    ="cid";                        // DBTYPE_I4           物品id

	var GAMEUI_CHARGECARSELECT_NAME                       =2;   
	var GAMEUI_CHARGECARSELECT_NAME_STR                   ="name";                       // DBTYPE_WVARCHAR     物品名称

	var GAMEUI_CHARGECARSELECT_PRICETYPE                  =3;   
	var GAMEUI_CHARGECARSELECT_PRICETYPE_STR              ="pricetype";                  // DBTYPE_I4           价格类型

	var GAMEUI_CHARGECARSELECT_PRICE                      =4;   
	var GAMEUI_CHARGECARSELECT_PRICE_STR                  ="price";                      // DBTYPE_WVARCHAR     价格

	var GAMEUI_CHARGECARSELECT_TIME                       =5;   
	var GAMEUI_CHARGECARSELECT_TIME_STR                   ="time";                       // DBTYPE_WVARCHAR     物品期限

	var GAMEUI_CHARGECARSELECT_STATE                      =6;   
	var GAMEUI_CHARGECARSELECT_STATE_STR                  ="state";                      // DBTYPE_I4           能否使用

	var GAMEUI_CHARGECARSELECT_TYPE                       =7;   
	var GAMEUI_CHARGECARSELECT_TYPE_STR                   ="type";                       // DBTYPE_I4           类型

	var GAMEUI_CHARGECARSELECT_SELECT                     =8;   
	var GAMEUI_CHARGECARSELECT_SELECT_STR                 ="select";                     // DBTYPE_I4           是否选择

	var GAMEUI_CHARGECARSELECT_ICON                       =9;   
	var GAMEUI_CHARGECARSELECT_ICON_STR                   ="icon";                       // DBTYPE_WVARCHAR     图片

	var GAMEUI_CHARGECARSELECT_SEX                        =10;  
	var GAMEUI_CHARGECARSELECT_SEX_STR                    ="sex";                        // DBTYPE_I4           性别

	var GAMEUI_CHARGECARSELECT_TEMP                       =11;  
	var GAMEUI_CHARGECARSELECT_TEMP_STR                   ="temp";                       // DBTYPE_I4           是否为临时

	var GAMEUI_CHARGECARSELECT_TIMEINDEX                  =12;  
	var GAMEUI_CHARGECARSELECT_TIMEINDEX_STR              ="timeindex";                  // DBTYPE_I4           物品期限索引 -1 0 1 2


	var CHAT_ACTION                                       ="Chat_Action";
	var GAMEUI_CHAT_ACTION_ID                             =0;   
	var GAMEUI_CHAT_ACTION_ID_STR                         ="ID";                         // DBTYPE_I4           

	var GAMEUI_CHAT_ACTION_PROMPT                         =1;   
	var GAMEUI_CHAT_ACTION_PROMPT_STR                     ="Prompt";                     // DBTYPE_WVARCHAR     鼠标右键Over提示

	var GAMEUI_CHAT_ACTION_MARK                           =2;   
	var GAMEUI_CHAT_ACTION_MARK_STR                       ="Mark";                       // DBTYPE_WVARCHAR     文本说明，用于列表中显示

	var GAMEUI_CHAT_ACTION_ACTID                          =3;   
	var GAMEUI_CHAT_ACTION_ACTID_STR                      ="ActID";                      // DBTYPE_I4           动作的ID号

	var GAMEUI_CHAT_ACTION_SPEED                          =4;   
	var GAMEUI_CHAT_ACTION_SPEED_STR                      ="Speed";                      // DBTYPE_I4           动画图片的速度

	var GAMEUI_CHAT_ACTION_IMG                            =5;   
	var GAMEUI_CHAT_ACTION_IMG_STR                        ="img";                        // DBTYPE_WVARCHAR     图片名，不+tga


	var CHAT_BROW                                         ="CHAT_BROW";
	var GAMEUI_CHAT_BROW_ID                               =0;   
	var GAMEUI_CHAT_BROW_ID_STR                           ="ID";                         // DBTYPE_I4           

	var GAMEUI_CHAT_BROW_PROMPT                           =1;   
	var GAMEUI_CHAT_BROW_PROMPT_STR                       ="Prompt";                     // DBTYPE_WVARCHAR     鼠标右键Over提示

	var GAMEUI_CHAT_BROW_MARK                             =2;   
	var GAMEUI_CHAT_BROW_MARK_STR                         ="Mark";                       // DBTYPE_WVARCHAR     代表符号

	var GAMEUI_CHAT_BROW_FRAME                            =3;   
	var GAMEUI_CHAT_BROW_FRAME_STR                        ="Frame";                      // DBTYPE_I4           一张图片有几帧

	var GAMEUI_CHAT_BROW_SPEED                            =4;   
	var GAMEUI_CHAT_BROW_SPEED_STR                        ="Speed";                      // DBTYPE_I4           动画图片的速度

	var GAMEUI_CHAT_BROW_IMG                              =5;   
	var GAMEUI_CHAT_BROW_IMG_STR                          ="img";                        // DBTYPE_WVARCHAR     图片名，不+tga


	var CHAT_PRIVATENAME                                  ="CHAT_PRIVATENAME";
	var GAMEUI_CHAT_PRIVATENAME_PRIVATENAME               =0;   
	var GAMEUI_CHAT_PRIVATENAME_PRIVATENAME_STR           ="privatename";                // DBTYPE_WVARCHAR     私聊名称

	var GAMEUI_CHAT_PRIVATENAME_POS                       =1;   
	var GAMEUI_CHAT_PRIVATENAME_POS_STR                   ="pos";                        // DBTYPE_I4           添加的顺序


	var DIALOG                                            ="DIALOG";
	var GAMEUI_DIALOG_ID                                  =0;   
	var GAMEUI_DIALOG_ID_STR                              ="ID";                         // DBTYPE_I4           对话框编号

	var GAMEUI_DIALOG_LAYERCODE                           =1;   
	var GAMEUI_DIALOG_LAYERCODE_STR                       ="LAYERCODE";                  // DBTYPE_WVARCHAR     对话框应该在哪一层产生

	var GAMEUI_DIALOG_DLGCLASSNAME                        =2;   
	var GAMEUI_DIALOG_DLGCLASSNAME_STR                    ="DLGCLASSNAME";               // DBTYPE_WVARCHAR     对话框脚本类名称

	var GAMEUI_DIALOG_DLGCONTENT                          =3;   
	var GAMEUI_DIALOG_DLGCONTENT_STR                      ="DLGCONTENT";                 // DBTYPE_WVARCHAR     对话框内容 "%0 - %n"为可替换的参数

	var GAMEUI_DIALOG_DLGDESC                             =4;   
	var GAMEUI_DIALOG_DLGDESC_STR                         ="DLGDESC";                    // DBTYPE_WVARCHAR     对话框出现情况描述


	var EVENT_ARENAHALL                                   ="EVENT_ARENAHALL";
	var GAMEUI_EVENT_ARENAHALL_ID                         =0;   
	var GAMEUI_EVENT_ARENAHALL_ID_STR                     ="ID";                         // DBTYPE_I4           

	var GAMEUI_EVENT_ARENAHALL_SCRIPTFUNCNAME             =1;   
	var GAMEUI_EVENT_ARENAHALL_SCRIPTFUNCNAME_STR         ="SCRIPTFUNCNAME";             // DBTYPE_WVARCHAR     

	var GAMEUI_EVENT_ARENAHALL_FUNCNAME                   =2;   
	var GAMEUI_EVENT_ARENAHALL_FUNCNAME_STR               ="FUNCNAME";                   // DBTYPE_WVARCHAR     

	var GAMEUI_EVENT_ARENAHALL_PARAM                      =3;   
	var GAMEUI_EVENT_ARENAHALL_PARAM_STR                  ="PARAM";                      // DBTYPE_WVARCHAR     


	var EVENT_GAMECENTER                                  ="EVENT_GAMECENTER";
	var GAMEUI_EVENT_GAMECENTER_ID                        =0;   
	var GAMEUI_EVENT_GAMECENTER_ID_STR                    ="ID";                         // DBTYPE_I4           

	var GAMEUI_EVENT_GAMECENTER_SCRIPTFUNCNAME            =1;   
	var GAMEUI_EVENT_GAMECENTER_SCRIPTFUNCNAME_STR        ="SCRIPTFUNCNAME";             // DBTYPE_WVARCHAR     

	var GAMEUI_EVENT_GAMECENTER_FUNCNAME                  =2;   
	var GAMEUI_EVENT_GAMECENTER_FUNCNAME_STR              ="FUNCNAME";                   // DBTYPE_WVARCHAR     

	var GAMEUI_EVENT_GAMECENTER_PARAM                     =3;   
	var GAMEUI_EVENT_GAMECENTER_PARAM_STR                 ="PARAM";                      // DBTYPE_WVARCHAR     


	var EVENT_HALL                                        ="EVENT_HALL";
	var GAMEUI_EVENT_HALL_ID                              =0;   
	var GAMEUI_EVENT_HALL_ID_STR                          ="ID";                         // DBTYPE_I4           

	var GAMEUI_EVENT_HALL_SCRIPTFUNCNAME                  =1;   
	var GAMEUI_EVENT_HALL_SCRIPTFUNCNAME_STR              ="SCRIPTFUNCNAME";             // DBTYPE_WVARCHAR     

	var GAMEUI_EVENT_HALL_FUNCNAME                        =2;   
	var GAMEUI_EVENT_HALL_FUNCNAME_STR                    ="FUNCNAME";                   // DBTYPE_WVARCHAR     

	var GAMEUI_EVENT_HALL_PARAM                           =3;   
	var GAMEUI_EVENT_HALL_PARAM_STR                       ="PARAM";                      // DBTYPE_WVARCHAR     


	var EVENT_LOGIN                                       ="EVENT_LOGIN";
	var GAMEUI_EVENT_LOGIN_ID                             =0;   
	var GAMEUI_EVENT_LOGIN_ID_STR                         ="ID";                         // DBTYPE_I4           

	var GAMEUI_EVENT_LOGIN_SCRIPTFUNCNAME                 =1;   
	var GAMEUI_EVENT_LOGIN_SCRIPTFUNCNAME_STR             ="SCRIPTFUNCNAME";             // DBTYPE_WVARCHAR     

	var GAMEUI_EVENT_LOGIN_FUNCNAME                       =2;   
	var GAMEUI_EVENT_LOGIN_FUNCNAME_STR                   ="FUNCNAME";                   // DBTYPE_WVARCHAR     

	var GAMEUI_EVENT_LOGIN_PARAM                          =3;   
	var GAMEUI_EVENT_LOGIN_PARAM_STR                      ="PARAM";                      // DBTYPE_WVARCHAR     


	var EVENT_ROOM                                        ="EVENT_ROOM";
	var GAMEUI_EVENT_ROOM_ID                              =0;   
	var GAMEUI_EVENT_ROOM_ID_STR                          ="ID";                         // DBTYPE_I4           

	var GAMEUI_EVENT_ROOM_SCRIPTFUNCNAME                  =1;   
	var GAMEUI_EVENT_ROOM_SCRIPTFUNCNAME_STR              ="SCRIPTFUNCNAME";             // DBTYPE_WVARCHAR     

	var GAMEUI_EVENT_ROOM_FUNCNAME                        =2;   
	var GAMEUI_EVENT_ROOM_FUNCNAME_STR                    ="FUNCNAME";                   // DBTYPE_WVARCHAR     

	var GAMEUI_EVENT_ROOM_PARAM                           =3;   
	var GAMEUI_EVENT_ROOM_PARAM_STR                       ="PARAM";                      // DBTYPE_WVARCHAR     


	var EVENT_SHOP                                        ="EVENT_SHOP";
	var GAMEUI_EVENT_SHOP_ID                              =0;   
	var GAMEUI_EVENT_SHOP_ID_STR                          ="ID";                         // DBTYPE_I4           

	var GAMEUI_EVENT_SHOP_SCRIPTFUNCNAME                  =1;   
	var GAMEUI_EVENT_SHOP_SCRIPTFUNCNAME_STR              ="SCRIPTFUNCNAME";             // DBTYPE_WVARCHAR     

	var GAMEUI_EVENT_SHOP_FUNCNAME                        =2;   
	var GAMEUI_EVENT_SHOP_FUNCNAME_STR                    ="FUNCNAME";                   // DBTYPE_WVARCHAR     

	var GAMEUI_EVENT_SHOP_PARAM                           =3;   
	var GAMEUI_EVENT_SHOP_PARAM_STR                       ="PARAM";                      // DBTYPE_WVARCHAR     


	var FAMILYPEOPLECONTRIBUTETIP                         ="FamilyPeopleContributeTip";
	var GAMEUI_FAMILYPEOPLECONTRIBUTETIP_INDEX            =0;   
	var GAMEUI_FAMILYPEOPLECONTRIBUTETIP_INDEX_STR        ="index";                      // DBTYPE_I4           

	var GAMEUI_FAMILYPEOPLECONTRIBUTETIP_CONTRIBUTE       =1;   
	var GAMEUI_FAMILYPEOPLECONTRIBUTETIP_CONTRIBUTE_STR   ="contribute";                 // DBTYPE_I4           


	var FAMILYTIPINFO                                     ="FamilyTipInfo";
	var GAMEUI_FAMILYTIPINFO_ID                           =0;   
	var GAMEUI_FAMILYTIPINFO_ID_STR                       ="ID";                         // DBTYPE_I4           

	var GAMEUI_FAMILYTIPINFO_TYPE                         =1;   
	var GAMEUI_FAMILYTIPINFO_TYPE_STR                     ="type";                       // DBTYPE_I4           提示信息类型，1为弹出框提示，2为聊天框提示,0为不显示

	var GAMEUI_FAMILYTIPINFO_CONTENT                      =2;   
	var GAMEUI_FAMILYTIPINFO_CONTENT_STR                  ="content";                    // DBTYPE_WVARCHAR     提示信息内容

	var GAMEUI_FAMILYTIPINFO_RECID                        =3;   
	var GAMEUI_FAMILYTIPINFO_RECID_STR                    ="recID";                      // DBTYPE_I4           反馈消息ID


	var FRIENDGROUPNAME                                   ="FriendGroupName";
	var GAMEUI_FRIENDGROUPNAME_ID                         =0;   
	var GAMEUI_FRIENDGROUPNAME_ID_STR                     ="id";                         // DBTYPE_I4           标识索引，为1

	var GAMEUI_FRIENDGROUPNAME_GROUP1                     =1;   
	var GAMEUI_FRIENDGROUPNAME_GROUP1_STR                 ="group1";                     // DBTYPE_WVARCHAR     

	var GAMEUI_FRIENDGROUPNAME_GROUP2                     =2;   
	var GAMEUI_FRIENDGROUPNAME_GROUP2_STR                 ="group2";                     // DBTYPE_WVARCHAR     

	var GAMEUI_FRIENDGROUPNAME_GROUP3                     =3;   
	var GAMEUI_FRIENDGROUPNAME_GROUP3_STR                 ="group3";                     // DBTYPE_WVARCHAR     

	var GAMEUI_FRIENDGROUPNAME_GROUP4                     =4;   
	var GAMEUI_FRIENDGROUPNAME_GROUP4_STR                 ="group4";                     // DBTYPE_WVARCHAR     


	var GAMESERVER                                        ="GameServer";
	var GAMEUI_GAMESERVER_SVRID                           =0;   
	var GAMEUI_GAMESERVER_SVRID_STR                       ="SvrID";                      // DBTYPE_I4           0 服务器标识

	var GAMEUI_GAMESERVER_SVRNAME                         =1;   
	var GAMEUI_GAMESERVER_SVRNAME_STR                     ="SvrName";                    // DBTYPE_WVARCHAR     1 服务器名

	var GAMEUI_GAMESERVER_SVRIPADDR                       =2;   
	var GAMEUI_GAMESERVER_SVRIPADDR_STR                   ="SvrIPAddr";                  // DBTYPE_WVARCHAR     2 服务器IP地址

	var GAMEUI_GAMESERVER_RPORT                           =3;   
	var GAMEUI_GAMESERVER_RPORT_STR                       ="RPort";                      // DBTYPE_I4           3 R服务端口

	var GAMEUI_GAMESERVER_GPORT                           =4;   
	var GAMEUI_GAMESERVER_GPORT_STR                       ="GPort";                      // DBTYPE_I4           4 G服务端口

	var GAMEUI_GAMESERVER_UPORT                           =5;   
	var GAMEUI_GAMESERVER_UPORT_STR                       ="Uport";                      // DBTYPE_I4           5 U服务端口

	var GAMEUI_GAMESERVER_TOPLISTADDR                     =6;   
	var GAMEUI_GAMESERVER_TOPLISTADDR_STR                 ="TopListAddr";                // DBTYPE_WVARCHAR     6 排行榜服务器地址

	var GAMEUI_GAMESERVER_GAMEQQADDR                      =7;   
	var GAMEUI_GAMESERVER_GAMEQQADDR_STR                  ="GameQQAddr";                 // DBTYPE_WVARCHAR     7 游戏QQ服务器地址

	var GAMEUI_GAMESERVER_ALLOWSTATE                      =8;   
	var GAMEUI_GAMESERVER_ALLOWSTATE_STR                  ="AllowState";                 // DBTYPE_I4           8 服务器允许状态

	var GAMEUI_GAMESERVER_LIMITNUM                        =9;   
	var GAMEUI_GAMESERVER_LIMITNUM_STR                    ="LimitNum";                   // DBTYPE_WVARCHAR     9 服务器人数最大负载

	var GAMEUI_GAMESERVER_LIMITLEVEL                      =10;  
	var GAMEUI_GAMESERVER_LIMITLEVEL_STR                  ="LimitLevel";                 // DBTYPE_WVARCHAR     10 服务器进入等级限制

	var GAMEUI_GAMESERVER_SVRTYPE                         =11;  
	var GAMEUI_GAMESERVER_SVRTYPE_STR                     ="SvrType";                    // DBTYPE_I4           11 服务器类型（例如：1新手,2资格赛,3巡回赛,4黄金赛,5大师赛,6大满贯,7大奖赛）

	var GAMEUI_GAMESERVER_SVRSTATE                        =12;  
	var GAMEUI_GAMESERVER_SVRSTATE_STR                    ="SvrState";                   // DBTYPE_I4           12 运行商标记（例如：例如: 热门,推荐）

	var GAMEUI_GAMESERVER_VERIFYIPADDR                    =13;  
	var GAMEUI_GAMESERVER_VERIFYIPADDR_STR                ="VerifyIPAddr";               // DBTYPE_WVARCHAR     13 验证IP地址字符串

	var GAMEUI_GAMESERVER_OLNUM                           =14;  
	var GAMEUI_GAMESERVER_OLNUM_STR                       ="OLNum";                      // DBTYPE_I4           14 在线人数

	var GAMEUI_GAMESERVER_SHOWSV                          =15;  
	var GAMEUI_GAMESERVER_SHOWSV_STR                      ="ShowSv";                     // DBTYPE_I4           15 是否显示此服务器 <=0不显示

	var GAMEUI_GAMESERVER_GAMENUM                         =16;  
	var GAMEUI_GAMESERVER_GAMENUM_STR                     ="GameNum";                    // DBTYPE_I4           游戏中的人数


	var INFOBOARD                                         ="InfoBoard";
	var GAMEUI_INFOBOARD_ID                               =0;   
	var GAMEUI_INFOBOARD_ID_STR                           ="ID";                         // DBTYPE_I4           编号

	var GAMEUI_INFOBOARD_ITYPE                            =1;   
	var GAMEUI_INFOBOARD_ITYPE_STR                        ="IType";                      // DBTYPE_I4           显示类型 0取数据库的内容 1自定义内容 2全屏遮罩 3聊天框内容

	var GAMEUI_INFOBOARD_TEXT                             =2;   
	var GAMEUI_INFOBOARD_TEXT_STR                         ="Text";                       // DBTYPE_WVARCHAR     文字内容 支持参数 "%1 - %n"

	var GAMEUI_INFOBOARD_DESC                             =3;   
	var GAMEUI_INFOBOARD_DESC_STR                         ="Desc";                       // DBTYPE_WVARCHAR     描述说明


	var JIVECONSORTIA                                     ="jiveConsortia";
	var GAMEUI_JIVECONSORTIA_USERNAME                     =0;   
	var GAMEUI_JIVECONSORTIA_USERNAME_STR                 ="userName";                   // DBTYPE_WVARCHAR     用户id

	var GAMEUI_JIVECONSORTIA_USERNICK                     =1;   
	var GAMEUI_JIVECONSORTIA_USERNICK_STR                 ="userNick";                   // DBTYPE_WVARCHAR     昵称

	var GAMEUI_JIVECONSORTIA_CONSORTIAID                  =2;   
	var GAMEUI_JIVECONSORTIA_CONSORTIAID_STR              ="consortiaID";                // DBTYPE_I4           公会id

	var GAMEUI_JIVECONSORTIA_STATE                        =3;   
	var GAMEUI_JIVECONSORTIA_STATE_STR                    ="state";                      // DBTYPE_I4           状态

	var GAMEUI_JIVECONSORTIA_POTENCE                      =4;   
	var GAMEUI_JIVECONSORTIA_POTENCE_STR                  ="potence";                    // DBTYPE_I4           成员的权力3 会长1 管理员2

	var GAMEUI_JIVECONSORTIA_POPEDOM                      =5;   
	var GAMEUI_JIVECONSORTIA_POPEDOM_STR                  ="popedom";                    // DBTYPE_WVARCHAR     成员的权限 能做什么事情 加人

	var GAMEUI_JIVECONSORTIA_POINT                        =6;   
	var GAMEUI_JIVECONSORTIA_POINT_STR                    ="point";                      // DBTYPE_I4           成员对公会的贡献点

	var GAMEUI_JIVECONSORTIA_CHAT                         =7;   
	var GAMEUI_JIVECONSORTIA_CHAT_STR                     ="chat";                       // DBTYPE_I4           能否聊天

	var GAMEUI_JIVECONSORTIA_ONLINE                       =8;   
	var GAMEUI_JIVECONSORTIA_ONLINE_STR                   ="online";                     // DBTYPE_I4           玩家是否在线 0：在线 1：不在线

	var GAMEUI_JIVECONSORTIA_LEVEL                        =9;   
	var GAMEUI_JIVECONSORTIA_LEVEL_STR                    ="level";                      // DBTYPE_I4           等级

	var GAMEUI_JIVECONSORTIA_SEX                          =10;  
	var GAMEUI_JIVECONSORTIA_SEX_STR                      ="sex";                        // DBTYPE_I4           性别 1男 2女

	var GAMEUI_JIVECONSORTIA_TROLETYPE                    =11;  
	var GAMEUI_JIVECONSORTIA_TROLETYPE_STR                ="TRoleType";                  // DBTYPE_I4           网球的角色类型id


	var JIVECONSORTIAAPPLY                                ="jiveConsortiaApply";
	var GAMEUI_JIVECONSORTIAAPPLY_ID                      =0;   
	var GAMEUI_JIVECONSORTIAAPPLY_ID_STR                  ="id";                         // DBTYPE_I4           申请的唯一id

	var GAMEUI_JIVECONSORTIAAPPLY_UID                     =1;   
	var GAMEUI_JIVECONSORTIAAPPLY_UID_STR                 ="uID";                        // DBTYPE_WVARCHAR     用户id

	var GAMEUI_JIVECONSORTIAAPPLY_USERNICK                =2;   
	var GAMEUI_JIVECONSORTIAAPPLY_USERNICK_STR            ="userNick";                   // DBTYPE_WVARCHAR     用户昵称

	var GAMEUI_JIVECONSORTIAAPPLY_TID                     =3;   
	var GAMEUI_JIVECONSORTIAAPPLY_TID_STR                 ="tID";                        // DBTYPE_I4           公会id

	var GAMEUI_JIVECONSORTIAAPPLY_STATE                   =4;   
	var GAMEUI_JIVECONSORTIAAPPLY_STATE_STR               ="state";                      // DBTYPE_I4           申请是否有效 0无效

	var GAMEUI_JIVECONSORTIAAPPLY_SEX                     =5;   
	var GAMEUI_JIVECONSORTIAAPPLY_SEX_STR                 ="sex";                        // DBTYPE_I4           


	var JIVECONSORTIAINI                                  ="jiveConsortiaINI";
	var GAMEUI_JIVECONSORTIAINI_ID                        =0;   
	var GAMEUI_JIVECONSORTIAINI_ID_STR                    ="id";                         // DBTYPE_I4           公会ID

	var GAMEUI_JIVECONSORTIAINI_NAME                      =1;   
	var GAMEUI_JIVECONSORTIAINI_NAME_STR                  ="name";                       // DBTYPE_WVARCHAR     公会名字

	var GAMEUI_JIVECONSORTIAINI_USERNICK                  =2;   
	var GAMEUI_JIVECONSORTIAINI_USERNICK_STR              ="userNick";                   // DBTYPE_WVARCHAR     会长昵称

	var GAMEUI_JIVECONSORTIAINI_USERID                    =3;   
	var GAMEUI_JIVECONSORTIAINI_USERID_STR                ="userID";                     // DBTYPE_WVARCHAR     会长ID

	var GAMEUI_JIVECONSORTIAINI_STATE                     =4;   
	var GAMEUI_JIVECONSORTIAINI_STATE_STR                 ="state";                      // DBTYPE_I4           公会状态

	var GAMEUI_JIVECONSORTIAINI_CURRPOINT                 =5;   
	var GAMEUI_JIVECONSORTIAINI_CURRPOINT_STR             ="currPoint";                  // DBTYPE_I4           公会当前总的点数

	var GAMEUI_JIVECONSORTIAINI_CURRLV                    =6;   
	var GAMEUI_JIVECONSORTIAINI_CURRLV_STR                ="currLv";                     // DBTYPE_I4           公会当前级别

	var GAMEUI_JIVECONSORTIAINI_CURRNUM                   =7;   
	var GAMEUI_JIVECONSORTIAINI_CURRNUM_STR               ="currNum";                    // DBTYPE_I4           公会人数

	var GAMEUI_JIVECONSORTIAINI_POPEDOM                   =8;   
	var GAMEUI_JIVECONSORTIAINI_POPEDOM_STR               ="popedom";                    // DBTYPE_I4           公会权限

	var GAMEUI_JIVECONSORTIAINI_CALLBOARD                 =9;   
	var GAMEUI_JIVECONSORTIAINI_CALLBOARD_STR             ="callboard";                  // DBTYPE_WVARCHAR     公告板

	var GAMEUI_JIVECONSORTIAINI_ICONID                    =10;  
	var GAMEUI_JIVECONSORTIAINI_ICONID_STR                ="iconID";                     // DBTYPE_I4           图标

	var GAMEUI_JIVECONSORTIAINI_SLOGAN                    =11;  
	var GAMEUI_JIVECONSORTIAINI_SLOGAN_STR                ="slogan";                     // DBTYPE_WVARCHAR     口号

	var GAMEUI_JIVECONSORTIAINI_CALLBOARDTM               =12;  
	var GAMEUI_JIVECONSORTIAINI_CALLBOARDTM_STR           ="callboardTm";                // DBTYPE_WVARCHAR     公告板修改日期

	var GAMEUI_JIVECONSORTIAINI_CREATETM                  =13;  
	var GAMEUI_JIVECONSORTIAINI_CREATETM_STR              ="createTm";                   // DBTYPE_WVARCHAR     创建日期

	var GAMEUI_JIVECONSORTIAINI_CURRMANNUM                =14;  
	var GAMEUI_JIVECONSORTIAINI_CURRMANNUM_STR            ="currManNum";                 // DBTYPE_I4           男性数量

	var GAMEUI_JIVECONSORTIAINI_APPLYNEEDAGREE            =15;  
	var GAMEUI_JIVECONSORTIAINI_APPLYNEEDAGREE_STR        ="applyNeedAgree";             // DBTYPE_I4           申请加入时是否需要同意

	var GAMEUI_JIVECONSORTIAINI_SORT                      =16;  
	var GAMEUI_JIVECONSORTIAINI_SORT_STR                  ="sort";                       // DBTYPE_I4           排名

	var GAMEUI_JIVECONSORTIAINI_SETICON                   =17;  
	var GAMEUI_JIVECONSORTIAINI_SETICON_STR               ="setIcon";                    // DBTYPE_I4           能否设置图标 1.可以设置 0.不可以设置


	var JIVECONSORTIAINISYN                               ="jiveConsortiaINISyn";
	var GAMEUI_JIVECONSORTIAINISYN_ID                     =0;   
	var GAMEUI_JIVECONSORTIAINISYN_ID_STR                 ="id";                         // DBTYPE_I4           公会ID

	var GAMEUI_JIVECONSORTIAINISYN_NAME                   =1;   
	var GAMEUI_JIVECONSORTIAINISYN_NAME_STR               ="name";                       // DBTYPE_WVARCHAR     公会名字

	var GAMEUI_JIVECONSORTIAINISYN_USERNICK               =2;   
	var GAMEUI_JIVECONSORTIAINISYN_USERNICK_STR           ="userNick";                   // DBTYPE_WVARCHAR     会长昵称

	var GAMEUI_JIVECONSORTIAINISYN_CURRLV                 =3;   
	var GAMEUI_JIVECONSORTIAINISYN_CURRLV_STR             ="currLv";                     // DBTYPE_I4           公会当前级别

	var GAMEUI_JIVECONSORTIAINISYN_CURRPOINT              =4;   
	var GAMEUI_JIVECONSORTIAINISYN_CURRPOINT_STR          ="currPoint";                  // DBTYPE_I4           公会当前总的点数

	var GAMEUI_JIVECONSORTIAINISYN_CURRNUM                =5;   
	var GAMEUI_JIVECONSORTIAINISYN_CURRNUM_STR            ="currNum";                    // DBTYPE_I4           公会人数

	var GAMEUI_JIVECONSORTIAINISYN_CALLBOARD              =6;   
	var GAMEUI_JIVECONSORTIAINISYN_CALLBOARD_STR          ="callboard";                  // DBTYPE_WVARCHAR     公告板

	var GAMEUI_JIVECONSORTIAINISYN_LASTINDEX              =7;   
	var GAMEUI_JIVECONSORTIAINISYN_LASTINDEX_STR          ="lastindex";                  // DBTYPE_I4           

	var GAMEUI_JIVECONSORTIAINISYN_ICONID                 =8;   
	var GAMEUI_JIVECONSORTIAINISYN_ICONID_STR             ="iconID";                     // DBTYPE_I4           图标

	var GAMEUI_JIVECONSORTIAINISYN_CURRINDEX              =9;   
	var GAMEUI_JIVECONSORTIAINISYN_CURRINDEX_STR          ="currindex";                  // DBTYPE_I4           当前排行

	var GAMEUI_JIVECONSORTIAINISYN_STATE                  =10;  
	var GAMEUI_JIVECONSORTIAINISYN_STATE_STR              ="state";                      // DBTYPE_I4           公会状态

	var GAMEUI_JIVECONSORTIAINISYN_POPEDOM                =11;  
	var GAMEUI_JIVECONSORTIAINISYN_POPEDOM_STR            ="popedom";                    // DBTYPE_I4           公会权限

	var GAMEUI_JIVECONSORTIAINISYN_SLOGAN                 =12;  
	var GAMEUI_JIVECONSORTIAINISYN_SLOGAN_STR             ="slogan";                     // DBTYPE_WVARCHAR     口号

	var GAMEUI_JIVECONSORTIAINISYN_CALLBOARDTM            =13;  
	var GAMEUI_JIVECONSORTIAINISYN_CALLBOARDTM_STR        ="callboardTm";                // DBTYPE_WVARCHAR     公告板修改日期

	var GAMEUI_JIVECONSORTIAINISYN_CREATETM               =14;  
	var GAMEUI_JIVECONSORTIAINISYN_CREATETM_STR           ="createTm";                   // DBTYPE_WVARCHAR     创建日期

	var GAMEUI_JIVECONSORTIAINISYN_CURRMANNUM             =15;  
	var GAMEUI_JIVECONSORTIAINISYN_CURRMANNUM_STR         ="currManNum";                 // DBTYPE_I4           男性数量

	var GAMEUI_JIVECONSORTIAINISYN_APPLYNEEDAGREE         =16;  
	var GAMEUI_JIVECONSORTIAINISYN_APPLYNEEDAGREE_STR     ="applyNeedAgree";             // DBTYPE_I4           申请加入时是否需要同意

	var GAMEUI_JIVECONSORTIAINISYN_SORT                   =17;  
	var GAMEUI_JIVECONSORTIAINISYN_SORT_STR               ="sort";                       // DBTYPE_I4           排名

	var GAMEUI_JIVECONSORTIAINISYN_SETICON                =18;  
	var GAMEUI_JIVECONSORTIAINISYN_SETICON_STR            ="setIcon";                    // DBTYPE_I4           能否设置图标 1.可以设置 0.不可以设置


	var JIVEFLOWER                                        ="jiveFlower";
	var GAMEUI_JIVEFLOWER_USERNAME                        =0;   
	var GAMEUI_JIVEFLOWER_USERNAME_STR                    ="username";                   // DBTYPE_NUMERIC      id

	var GAMEUI_JIVEFLOWER_NKNAME                          =1;   
	var GAMEUI_JIVEFLOWER_NKNAME_STR                      ="nkname";                     // DBTYPE_WVARCHAR     昵称

	var GAMEUI_JIVEFLOWER_VALUE                           =2;   
	var GAMEUI_JIVEFLOWER_VALUE_STR                       ="value";                      // DBTYPE_I4           人气

	var GAMEUI_JIVEFLOWER_LASTINDEX                       =3;   
	var GAMEUI_JIVEFLOWER_LASTINDEX_STR                   ="lastindex";                  // DBTYPE_I4           

	var GAMEUI_JIVEFLOWER_LV                              =4;   
	var GAMEUI_JIVEFLOWER_LV_STR                          ="lv";                         // DBTYPE_I4           等级

	var GAMEUI_JIVEFLOWER_SKILL                           =5;   
	var GAMEUI_JIVEFLOWER_SKILL_STR                       ="skill";                      // DBTYPE_I4           技术方向

	var GAMEUI_JIVEFLOWER_CURRINDEX                       =6;   
	var GAMEUI_JIVEFLOWER_CURRINDEX_STR                   ="currindex";                  // DBTYPE_I4           当前排行


	var JIVETPGROUP                                       ="jiveTpGroup";
	var GAMEUI_JIVETPGROUP_GID                            =0;   
	var GAMEUI_JIVETPGROUP_GID_STR                        ="gid";                        // DBTYPE_I4           唯一id

	var GAMEUI_JIVETPGROUP_USERNAME                       =1;   
	var GAMEUI_JIVETPGROUP_USERNAME_STR                   ="username";                   // DBTYPE_WVARCHAR     成员ID

	var GAMEUI_JIVETPGROUP_NICKNAME                       =2;   
	var GAMEUI_JIVETPGROUP_NICKNAME_STR                   ="nickName";                   // DBTYPE_WVARCHAR     成员的昵称

	var GAMEUI_JIVETPGROUP_TEAMID                         =3;   
	var GAMEUI_JIVETPGROUP_TEAMID_STR                     ="teamID";                     // DBTYPE_I4           队伍ID

	var GAMEUI_JIVETPGROUP_STATE                          =4;   
	var GAMEUI_JIVETPGROUP_STATE_STR                      ="state";                      // DBTYPE_I4           状态

	var GAMEUI_JIVETPGROUP_INVITED                        =5;   
	var GAMEUI_JIVETPGROUP_INVITED_STR                    ="invited";                    // DBTYPE_I4           是否已经邀请人了

	var GAMEUI_JIVETPGROUP_INVITETM                       =6;   
	var GAMEUI_JIVETPGROUP_INVITETM_STR                   ="invitetm";                   // DBTYPE_I4           邀请的时间

	var GAMEUI_JIVETPGROUP_INVID                          =7;   
	var GAMEUI_JIVETPGROUP_INVID_STR                      ="invid";                      // DBTYPE_WVARCHAR     邀请人的id

	var GAMEUI_JIVETPGROUP_RACEID                         =8;   
	var GAMEUI_JIVETPGROUP_RACEID_STR                     ="raceid";                     // DBTYPE_I4           活动id


	var JIVETPGROUPINI                                    ="jiveTpGroupINI";
	var GAMEUI_JIVETPGROUPINI_ID                          =0;   
	var GAMEUI_JIVETPGROUPINI_ID_STR                      ="id";                         // DBTYPE_I4           公会ID

	var GAMEUI_JIVETPGROUPINI_CREATEID                    =1;   
	var GAMEUI_JIVETPGROUPINI_CREATEID_STR                ="createID";                   // DBTYPE_WVARCHAR     创建者的id

	var GAMEUI_JIVETPGROUPINI_CREATENKNAME                =2;   
	var GAMEUI_JIVETPGROUPINI_CREATENKNAME_STR            ="createNkname";               // DBTYPE_WVARCHAR     创建者的昵称

	var GAMEUI_JIVETPGROUPINI_TEAMNAME                    =3;   
	var GAMEUI_JIVETPGROUPINI_TEAMNAME_STR                ="teamName";                   // DBTYPE_WVARCHAR     队伍名称

	var GAMEUI_JIVETPGROUPINI_RACEID                      =4;   
	var GAMEUI_JIVETPGROUPINI_RACEID_STR                  ="raceid";                     // DBTYPE_I4           活动id

	var GAMEUI_JIVETPGROUPINI_STATE                       =5;   
	var GAMEUI_JIVETPGROUPINI_STATE_STR                   ="state";                      // DBTYPE_I4           状态id


	var JIVETPINVITELIST                                  ="jiveTpInviteList";
	var GAMEUI_JIVETPINVITELIST_ID                        =0;   
	var GAMEUI_JIVETPINVITELIST_ID_STR                    ="id";                         // DBTYPE_I4           id

	var GAMEUI_JIVETPINVITELIST_NKNAME                    =1;   
	var GAMEUI_JIVETPINVITELIST_NKNAME_STR                ="nkname";                     // DBTYPE_WVARCHAR     昵称

	var GAMEUI_JIVETPINVITELIST_LV                        =2;   
	var GAMEUI_JIVETPINVITELIST_LV_STR                    ="lv";                         // DBTYPE_I4           等级

	var GAMEUI_JIVETPINVITELIST_RELATION                  =3;   
	var GAMEUI_JIVETPINVITELIST_RELATION_STR              ="relation";                   // DBTYPE_I4           关系

	var GAMEUI_JIVETPINVITELIST_SKILL                     =4;   
	var GAMEUI_JIVETPINVITELIST_SKILL_STR                 ="skill";                      // DBTYPE_I4           技术方向

	var GAMEUI_JIVETPINVITELIST_DELETE                    =5;   
	var GAMEUI_JIVETPINVITELIST_DELETE_STR                ="delete";                     // DBTYPE_I4           0为没删除，1为删除


	var KEYSET                                            ="KEYSET";
	var GAMEUI_KEYSET_ID                                  =0;   
	var GAMEUI_KEYSET_ID_STR                              ="ID";                         // DBTYPE_I4           

	var GAMEUI_KEYSET_ACTIVE                              =1;   
	var GAMEUI_KEYSET_ACTIVE_STR                          ="Active";                     // DBTYPE_WVARCHAR     相关操作

	var GAMEUI_KEYSET_KEYVALUE                            =2;   
	var GAMEUI_KEYSET_KEYVALUE_STR                        ="KeyValue";                   // DBTYPE_WVARCHAR     对应键位

	var GAMEUI_KEYSET_KEYINDEX                            =3;   
	var GAMEUI_KEYSET_KEYINDEX_STR                        ="KeyIndex";                   // DBTYPE_I4           对应的功能键序号

	var GAMEUI_KEYSET_KEYIMG                              =4;   
	var GAMEUI_KEYSET_KEYIMG_STR                          ="keyimg";                     // DBTYPE_WVARCHAR     图片名称


	var LOADINGTIP                                        ="LoadingTip";
	var GAMEUI_LOADINGTIP_TIPINDEX                        =0;   
	var GAMEUI_LOADINGTIP_TIPINDEX_STR                    ="tipIndex";                   // DBTYPE_I4           内容序号

	var GAMEUI_LOADINGTIP_TIPTEXT                         =1;   
	var GAMEUI_LOADINGTIP_TIPTEXT_STR                     ="tipText";                    // DBTYPE_WVARCHAR     显示的文字

	var GAMEUI_LOADINGTIP_TIPDES                          =2;   
	var GAMEUI_LOADINGTIP_TIPDES_STR                      ="tipDes";                     // DBTYPE_WVARCHAR     说明的东西 可填可不填


	var MSGCHATRECEIVE                                    ="MsgChatReceive";
	var GAMEUI_MSGCHATRECEIVE_ID                          =0;   
	var GAMEUI_MSGCHATRECEIVE_ID_STR                      ="id";                         // DBTYPE_I4           0 序号

	var GAMEUI_MSGCHATRECEIVE_CONTENT                     =1;   
	var GAMEUI_MSGCHATRECEIVE_CONTENT_STR                 ="content";                    // DBTYPE_WVARCHAR     1 信息内容

	var GAMEUI_MSGCHATRECEIVE_SENDERNAME                  =2;   
	var GAMEUI_MSGCHATRECEIVE_SENDERNAME_STR              ="senderName";                 // DBTYPE_WVARCHAR     2 发送者昵称

	var GAMEUI_MSGCHATRECEIVE_RECIVEUID                   =3;   
	var GAMEUI_MSGCHATRECEIVE_RECIVEUID_STR               ="reciveUID";                  // DBTYPE_I4           3 接收者的UID

	var GAMEUI_MSGCHATRECEIVE_JID                         =4;   
	var GAMEUI_MSGCHATRECEIVE_JID_STR                     ="JId";                        // DBTYPE_WVARCHAR     4 发送者的JID


	var MSGREQUEST                                        ="MsgRequest";
	var GAMEUI_MSGREQUEST_ID                              =0;   
	var GAMEUI_MSGREQUEST_ID_STR                          ="id";                         // DBTYPE_I4           0 序号

	var GAMEUI_MSGREQUEST_ENTERID                         =1;   
	var GAMEUI_MSGREQUEST_ENTERID_STR                     ="enterID";                    // DBTYPE_I4           1 物品的EnterID

	var GAMEUI_MSGREQUEST_TIMELIMIT                       =2;   
	var GAMEUI_MSGREQUEST_TIMELIMIT_STR                   ="timeLimit";                  // DBTYPE_I4           2 有效期序号-1，0，1，2

	var GAMEUI_MSGREQUEST_JID                             =3;   
	var GAMEUI_MSGREQUEST_JID_STR                         ="JId";                        // DBTYPE_WVARCHAR     3 索要者的jid

	var GAMEUI_MSGREQUEST_REQUESTNAME                     =4;   
	var GAMEUI_MSGREQUEST_REQUESTNAME_STR                 ="requestName";                // DBTYPE_WVARCHAR     4 索要者的昵称

	var GAMEUI_MSGREQUEST_PRICE                           =5;   
	var GAMEUI_MSGREQUEST_PRICE_STR                       ="price";                      // DBTYPE_I4           5 价格

	var GAMEUI_MSGREQUEST_MSG                             =6;   
	var GAMEUI_MSGREQUEST_MSG_STR                         ="msg";                        // DBTYPE_WVARCHAR     6 留言内容

	var GAMEUI_MSGREQUEST_RECIVEUID                       =7;   
	var GAMEUI_MSGREQUEST_RECIVEUID_STR                   ="reciveUID";                  // DBTYPE_I4           7 接收者UID


	var MSGREQUESTNEW                                     ="MsgRequestNew";
	var GAMEUI_MSGREQUESTNEW_ID                           =0;   
	var GAMEUI_MSGREQUESTNEW_ID_STR                       ="id";                         // DBTYPE_I4           0 序号

	var GAMEUI_MSGREQUESTNEW_JID                          =1;   
	var GAMEUI_MSGREQUESTNEW_JID_STR                      ="JId";                        // DBTYPE_WVARCHAR     1 索要者的jid

	var GAMEUI_MSGREQUESTNEW_REQUESTNAME                  =2;   
	var GAMEUI_MSGREQUESTNEW_REQUESTNAME_STR              ="requestName";                // DBTYPE_WVARCHAR     2 索要者的昵称

	var GAMEUI_MSGREQUESTNEW_MSG                          =3;   
	var GAMEUI_MSGREQUESTNEW_MSG_STR                      ="msg";                        // DBTYPE_WVARCHAR     3 留言内容

	var GAMEUI_MSGREQUESTNEW_RECIVEUID                    =4;   
	var GAMEUI_MSGREQUESTNEW_RECIVEUID_STR                ="reciveUID";                  // DBTYPE_I4           4 接收者UID

	var GAMEUI_MSGREQUESTNEW_DATA                         =5;   
	var GAMEUI_MSGREQUESTNEW_DATA_STR                     ="data";                       // DBTYPE_WVARCHAR     5 物品的EnterID,时间序号


	var MSGREQUESTSELECT                                  ="MsgRequestSelect";
	var GAMEUI_MSGREQUESTSELECT_ID                        =0;   
	var GAMEUI_MSGREQUESTSELECT_ID_STR                    ="id";                         // DBTYPE_I4           唯一id

	var GAMEUI_MSGREQUESTSELECT_CID                       =1;   
	var GAMEUI_MSGREQUESTSELECT_CID_STR                   ="cid";                        // DBTYPE_I4           物品id

	var GAMEUI_MSGREQUESTSELECT_NAME                      =2;   
	var GAMEUI_MSGREQUESTSELECT_NAME_STR                  ="name";                       // DBTYPE_WVARCHAR     物品名称

	var GAMEUI_MSGREQUESTSELECT_PRICETYPE                 =3;   
	var GAMEUI_MSGREQUESTSELECT_PRICETYPE_STR             ="pricetype";                  // DBTYPE_I4           价格类型

	var GAMEUI_MSGREQUESTSELECT_PRICE                     =4;   
	var GAMEUI_MSGREQUESTSELECT_PRICE_STR                 ="price";                      // DBTYPE_WVARCHAR     价格

	var GAMEUI_MSGREQUESTSELECT_TIME                      =5;   
	var GAMEUI_MSGREQUESTSELECT_TIME_STR                  ="time";                       // DBTYPE_WVARCHAR     物品期限 永久 7 30 365

	var GAMEUI_MSGREQUESTSELECT_STATE                     =6;   
	var GAMEUI_MSGREQUESTSELECT_STATE_STR                 ="state";                      // DBTYPE_I4           能否使用

	var GAMEUI_MSGREQUESTSELECT_TYPE                      =7;   
	var GAMEUI_MSGREQUESTSELECT_TYPE_STR                  ="type";                       // DBTYPE_I4           类型

	var GAMEUI_MSGREQUESTSELECT_SELECT                    =8;   
	var GAMEUI_MSGREQUESTSELECT_SELECT_STR                ="select";                     // DBTYPE_I4           是否选择

	var GAMEUI_MSGREQUESTSELECT_ICON                      =9;   
	var GAMEUI_MSGREQUESTSELECT_ICON_STR                  ="icon";                       // DBTYPE_WVARCHAR     图片

	var GAMEUI_MSGREQUESTSELECT_SEX                       =10;  
	var GAMEUI_MSGREQUESTSELECT_SEX_STR                   ="sex";                        // DBTYPE_I4           性别

	var GAMEUI_MSGREQUESTSELECT_TEMP                      =11;  
	var GAMEUI_MSGREQUESTSELECT_TEMP_STR                  ="temp";                       // DBTYPE_I4           是否为临时

	var GAMEUI_MSGREQUESTSELECT_TIMEINDEX                 =12;  
	var GAMEUI_MSGREQUESTSELECT_TIMEINDEX_STR             ="timeindex";                  // DBTYPE_I4           物品期限索引 -1 0 1 2


	var RELATIONSET                                       ="RelationSet";
	var GAMEUI_RELATIONSET_ID                             =0;   
	var GAMEUI_RELATIONSET_ID_STR                         ="id";                         // DBTYPE_I4           ID = 关系类型*1000 + 关系档次*100 + 实际等级

	var GAMEUI_RELATIONSET_RELATION                       =1;   
	var GAMEUI_RELATIONSET_RELATION_STR                   ="relation";                   // DBTYPE_I4           关系 1搭档 2密友 3情侣

	var GAMEUI_RELATIONSET_MAXVALUE                       =2;   
	var GAMEUI_RELATIONSET_MAXVALUE_STR                   ="maxvalue";                   // DBTYPE_I4           本等级的最大值(用于升级)

	var GAMEUI_RELATIONSET_BADGESRC                       =3;   
	var GAMEUI_RELATIONSET_BADGESRC_STR                   ="badgesrc";                   // DBTYPE_WVARCHAR     徽章的图片名

	var GAMEUI_RELATIONSET_DESC                           =4;   
	var GAMEUI_RELATIONSET_DESC_STR                       ="desc";                       // DBTYPE_WVARCHAR     备注

	var GAMEUI_RELATIONSET_BADDISH                        =5;   
	var GAMEUI_RELATIONSET_BADDISH_STR                    ="baddish";                    // DBTYPE_I4           档次 0默认（搭档和密友没有档次） 1白银 2黄金 3钻石 9为升级档次


	var REQUEST_ARENAHALL                                 ="REQUEST_ARENAHALL";
	var GAMEUI_REQUEST_ARENAHALL_ID                       =0;   
	var GAMEUI_REQUEST_ARENAHALL_ID_STR                   ="ID";                         // DBTYPE_I4           

	var GAMEUI_REQUEST_ARENAHALL_FUNCTION                 =1;   
	var GAMEUI_REQUEST_ARENAHALL_FUNCTION_STR             ="Function";                   // DBTYPE_WVARCHAR     函数名

	var GAMEUI_REQUEST_ARENAHALL_PARAM                    =2;   
	var GAMEUI_REQUEST_ARENAHALL_PARAM_STR                ="Param";                      // DBTYPE_WVARCHAR     参数

	var GAMEUI_REQUEST_ARENAHALL_COUNTER                  =3;   
	var GAMEUI_REQUEST_ARENAHALL_COUNTER_STR              ="Counter";                    // DBTYPE_I4           计数


	var REQUEST_CHAT                                      ="REQUEST_CHAT";
	var GAMEUI_REQUEST_CHAT_ID                            =0;   
	var GAMEUI_REQUEST_CHAT_ID_STR                        ="ID";                         // DBTYPE_I4           

	var GAMEUI_REQUEST_CHAT_FUNCTION                      =1;   
	var GAMEUI_REQUEST_CHAT_FUNCTION_STR                  ="Function";                   // DBTYPE_WVARCHAR     函数名

	var GAMEUI_REQUEST_CHAT_PARAM                         =2;   
	var GAMEUI_REQUEST_CHAT_PARAM_STR                     ="Param";                      // DBTYPE_WVARCHAR     参数

	var GAMEUI_REQUEST_CHAT_COUNTER                       =3;   
	var GAMEUI_REQUEST_CHAT_COUNTER_STR                   ="Counter";                    // DBTYPE_I4           计数


	var REQUEST_CHAT_GAME                                 ="REQUEST_CHAT_GAME";
	var GAMEUI_REQUEST_CHAT_GAME_ID                       =0;   
	var GAMEUI_REQUEST_CHAT_GAME_ID_STR                   ="ID";                         // DBTYPE_I4           

	var GAMEUI_REQUEST_CHAT_GAME_FUNCTION                 =1;   
	var GAMEUI_REQUEST_CHAT_GAME_FUNCTION_STR             ="Function";                   // DBTYPE_WVARCHAR     函数名

	var GAMEUI_REQUEST_CHAT_GAME_PARAM                    =2;   
	var GAMEUI_REQUEST_CHAT_GAME_PARAM_STR                ="Param";                      // DBTYPE_WVARCHAR     参数

	var GAMEUI_REQUEST_CHAT_GAME_COUNTER                  =3;   
	var GAMEUI_REQUEST_CHAT_GAME_COUNTER_STR              ="Counter";                    // DBTYPE_I4           计数


	var REQUEST_GAMECENTER                                ="REQUEST_GAMECENTER";
	var GAMEUI_REQUEST_GAMECENTER_ID                      =0;   
	var GAMEUI_REQUEST_GAMECENTER_ID_STR                  ="ID";                         // DBTYPE_I4           

	var GAMEUI_REQUEST_GAMECENTER_FUNCTION                =1;   
	var GAMEUI_REQUEST_GAMECENTER_FUNCTION_STR            ="Function";                   // DBTYPE_WVARCHAR     函数名

	var GAMEUI_REQUEST_GAMECENTER_PARAM                   =2;   
	var GAMEUI_REQUEST_GAMECENTER_PARAM_STR               ="Param";                      // DBTYPE_WVARCHAR     参数

	var GAMEUI_REQUEST_GAMECENTER_COUNTER                 =3;   
	var GAMEUI_REQUEST_GAMECENTER_COUNTER_STR             ="Counter";                    // DBTYPE_I4           计数


	var REQUEST_HALL                                      ="REQUEST_HALL";
	var GAMEUI_REQUEST_HALL_ID                            =0;   
	var GAMEUI_REQUEST_HALL_ID_STR                        ="ID";                         // DBTYPE_I4           

	var GAMEUI_REQUEST_HALL_FUNCTION                      =1;   
	var GAMEUI_REQUEST_HALL_FUNCTION_STR                  ="Function";                   // DBTYPE_WVARCHAR     函数名

	var GAMEUI_REQUEST_HALL_PARAM                         =2;   
	var GAMEUI_REQUEST_HALL_PARAM_STR                     ="Param";                      // DBTYPE_WVARCHAR     参数

	var GAMEUI_REQUEST_HALL_COUNTER                       =3;   
	var GAMEUI_REQUEST_HALL_COUNTER_STR                   ="Counter";                    // DBTYPE_I4           计数


	var REQUEST_LOGIN                                     ="REQUEST_LOGIN";
	var GAMEUI_REQUEST_LOGIN_ID                           =0;   
	var GAMEUI_REQUEST_LOGIN_ID_STR                       ="ID";                         // DBTYPE_I4           

	var GAMEUI_REQUEST_LOGIN_FUNCTION                     =1;   
	var GAMEUI_REQUEST_LOGIN_FUNCTION_STR                 ="Function";                   // DBTYPE_WVARCHAR     函数名

	var GAMEUI_REQUEST_LOGIN_PARAM                        =2;   
	var GAMEUI_REQUEST_LOGIN_PARAM_STR                    ="Param";                      // DBTYPE_WVARCHAR     参数

	var GAMEUI_REQUEST_LOGIN_COUNTER                      =3;   
	var GAMEUI_REQUEST_LOGIN_COUNTER_STR                  ="Counter";                    // DBTYPE_I4           计数


	var REQUEST_ROOM                                      ="REQUEST_ROOM";
	var GAMEUI_REQUEST_ROOM_ID                            =0;   
	var GAMEUI_REQUEST_ROOM_ID_STR                        ="ID";                         // DBTYPE_I4           

	var GAMEUI_REQUEST_ROOM_FUNCTION                      =1;   
	var GAMEUI_REQUEST_ROOM_FUNCTION_STR                  ="Function";                   // DBTYPE_WVARCHAR     函数名

	var GAMEUI_REQUEST_ROOM_PARAM                         =2;   
	var GAMEUI_REQUEST_ROOM_PARAM_STR                     ="Param";                      // DBTYPE_WVARCHAR     参数

	var GAMEUI_REQUEST_ROOM_COUNTER                       =3;   
	var GAMEUI_REQUEST_ROOM_COUNTER_STR                   ="Counter";                    // DBTYPE_I4           计数


	var REQUEST_SHOP                                      ="REQUEST_SHOP";
	var GAMEUI_REQUEST_SHOP_ID                            =0;   
	var GAMEUI_REQUEST_SHOP_ID_STR                        ="ID";                         // DBTYPE_I4           

	var GAMEUI_REQUEST_SHOP_FUNCTION                      =1;   
	var GAMEUI_REQUEST_SHOP_FUNCTION_STR                  ="Function";                   // DBTYPE_WVARCHAR     函数名

	var GAMEUI_REQUEST_SHOP_PARAM                         =2;   
	var GAMEUI_REQUEST_SHOP_PARAM_STR                     ="Param";                      // DBTYPE_WLONGVARCHAR 参数

	var GAMEUI_REQUEST_SHOP_COUNTER                       =3;   
	var GAMEUI_REQUEST_SHOP_COUNTER_STR                   ="Counter";                    // DBTYPE_I4           计数


	var REQUEST_SHOP_ARENA                                ="REQUEST_SHOP_ARENA";
	var GAMEUI_REQUEST_SHOP_ARENA_ID                      =0;   
	var GAMEUI_REQUEST_SHOP_ARENA_ID_STR                  ="ID";                         // DBTYPE_I4           

	var GAMEUI_REQUEST_SHOP_ARENA_FUNCTION                =1;   
	var GAMEUI_REQUEST_SHOP_ARENA_FUNCTION_STR            ="Function";                   // DBTYPE_WVARCHAR     函数名

	var GAMEUI_REQUEST_SHOP_ARENA_PARAM                   =2;   
	var GAMEUI_REQUEST_SHOP_ARENA_PARAM_STR               ="Param";                      // DBTYPE_WVARCHAR     参数

	var GAMEUI_REQUEST_SHOP_ARENA_COUNTER                 =3;   
	var GAMEUI_REQUEST_SHOP_ARENA_COUNTER_STR             ="Counter";                    // DBTYPE_I4           计数


	var RESOLUTION                                        ="resolution";
	var GAMEUI_RESOLUTION_KEY                             =0;   
	var GAMEUI_RESOLUTION_KEY_STR                         ="key";                        // DBTYPE_I4           主键

	var GAMEUI_RESOLUTION_WIDTH                           =1;   
	var GAMEUI_RESOLUTION_WIDTH_STR                       ="width";                      // DBTYPE_I4           分辨率的宽

	var GAMEUI_RESOLUTION_HEIGHT                          =2;   
	var GAMEUI_RESOLUTION_HEIGHT_STR                      ="height";                     // DBTYPE_I4           分辨率的高


	var SELFDT                                            ="selfdt";
	var GAMEUI_SELFDT_ID                                  =0;   
	var GAMEUI_SELFDT_ID_STR                              ="ID";                         // DBTYPE_I4           

	var GAMEUI_SELFDT_SELFID                              =1;   
	var GAMEUI_SELFDT_SELFID_STR                          ="selfId";                     // DBTYPE_I4           玩家自身id

	var GAMEUI_SELFDT_SELFNAME                            =2;   
	var GAMEUI_SELFDT_SELFNAME_STR                        ="selfName";                   // DBTYPE_WVARCHAR     玩家自身的昵称

	var GAMEUI_SELFDT_SELFSEX                             =3;   
	var GAMEUI_SELFDT_SELFSEX_STR                         ="selfSex";                    // DBTYPE_I4           性别 1:男 2:女

	var GAMEUI_SELFDT_SAREA                               =4;   
	var GAMEUI_SELFDT_SAREA_STR                           ="sArea";                      // DBTYPE_WVARCHAR     网通或是电信

	var GAMEUI_SELFDT_SCHANNEL                            =5;   
	var GAMEUI_SELFDT_SCHANNEL_STR                        ="sChannel";                   // DBTYPE_WVARCHAR     频道名 比如:新手1等

	var GAMEUI_SELFDT_DESKID                              =6;   
	var GAMEUI_SELFDT_DESKID_STR                          ="deskid";                     // DBTYPE_I4           房间id

	var GAMEUI_SELFDT_IMSELF                              =7;   
	var GAMEUI_SELFDT_IMSELF_STR                          ="imself";                     // DBTYPE_I4           用于快速找到此条记录，值永远是-1

	var GAMEUI_SELFDT_CURLEVEL                            =8;   
	var GAMEUI_SELFDT_CURLEVEL_STR                        ="curLevel";                   // DBTYPE_I4           用户等级

	var GAMEUI_SELFDT_DEGREE                              =9;   
	var GAMEUI_SELFDT_DEGREE_STR                          ="degree";                     // DBTYPE_I4           用户身份


	var SHOTCUT_KEY                                       ="shotcut_key";
	var GAMEUI_SHOTCUT_KEY_ID                             =0;   
	var GAMEUI_SHOTCUT_KEY_ID_STR                         ="ID";                         // DBTYPE_I4           

	var GAMEUI_SHOTCUT_KEY_SHOTCUT_KEY                    =1;   
	var GAMEUI_SHOTCUT_KEY_SHOTCUT_KEY_STR                ="shotcut_key";                // DBTYPE_I4           按键

	var GAMEUI_SHOTCUT_KEY_TYPE                           =2;   
	var GAMEUI_SHOTCUT_KEY_TYPE_STR                       ="type";                       // DBTYPE_I4           1为游戏中快捷键

	var GAMEUI_SHOTCUT_KEY_DES                            =3;   
	var GAMEUI_SHOTCUT_KEY_DES_STR                        ="des";                        // DBTYPE_WVARCHAR     


	var SHOTCUTCHATCONTENT                                ="ShotcutChatContent";
	var GAMEUI_SHOTCUTCHATCONTENT_SHOTCUT_KEY             =0;   
	var GAMEUI_SHOTCUTCHATCONTENT_SHOTCUT_KEY_STR         ="shotcut_key";                // DBTYPE_I4           快捷键

	var GAMEUI_SHOTCUTCHATCONTENT_DES                     =1;   
	var GAMEUI_SHOTCUTCHATCONTENT_DES_STR                 ="des";                        // DBTYPE_WVARCHAR     默认快捷聊天内容

	var GAMEUI_SHOTCUTCHATCONTENT_CUSTOMDES               =2;   
	var GAMEUI_SHOTCUTCHATCONTENT_CUSTOMDES_STR           ="customDes";                  // DBTYPE_WVARCHAR     自定义聊天内容


	var SOUND_REGISTER                                    ="SOUND_REGISTER";
	var GAMEUI_SOUND_REGISTER_SOUNDID                     =0;   
	var GAMEUI_SOUND_REGISTER_SOUNDID_STR                 ="soundid";                    // DBTYPE_I4           

	var GAMEUI_SOUND_REGISTER_FILENAME                    =1;   
	var GAMEUI_SOUND_REGISTER_FILENAME_STR                ="filename";                   // DBTYPE_WVARCHAR     文件名

	var GAMEUI_SOUND_REGISTER_DESCRIPTION                 =2;   
	var GAMEUI_SOUND_REGISTER_DESCRIPTION_STR             ="description";                // DBTYPE_WVARCHAR     描述

	var GAMEUI_SOUND_REGISTER_SHOWNAME                    =3;   
	var GAMEUI_SOUND_REGISTER_SHOWNAME_STR                ="showname";                   // DBTYPE_WVARCHAR     显示的名字 背景音乐用

	var GAMEUI_SOUND_REGISTER_TYPE                        =4;   
	var GAMEUI_SOUND_REGISTER_TYPE_STR                    ="type";                       // DBTYPE_I4           类型 1登录 2大厅 3游戏


	var TASKSCRIPT                                        ="TaskScript";
	var GAMEUI_TASKSCRIPT_ID                              =0;   
	var GAMEUI_TASKSCRIPT_ID_STR                          ="id";                         // DBTYPE_I4           

	var GAMEUI_TASKSCRIPT_CONTENT                         =1;   
	var GAMEUI_TASKSCRIPT_CONTENT_STR                     ="content";                    // DBTYPE_WVARCHAR     要运行的脚本

	var GAMEUI_TASKSCRIPT_PRENODE                         =2;   
	var GAMEUI_TASKSCRIPT_PRENODE_STR                     ="prenode";                    // DBTYPE_I4           上一页 -1 表示没有

	var GAMEUI_TASKSCRIPT_NEXTNODE                        =3;   
	var GAMEUI_TASKSCRIPT_NEXTNODE_STR                    ="nextnode";                   // DBTYPE_I4           下一页 -1 表示没有

	var GAMEUI_TASKSCRIPT_IMGSRC                          =4;   
	var GAMEUI_TASKSCRIPT_IMGSRC_STR                      ="imgsrc";                     // DBTYPE_WVARCHAR     图片的名字 -1则自动取id关联图片 index_1.jpg


	var TIPINFO                                           ="TipInfo";
	var GAMEUI_TIPINFO_TIPINDEX                           =0;   
	var GAMEUI_TIPINFO_TIPINDEX_STR                       ="tipIndex";                   // DBTYPE_I4           索引号

	var GAMEUI_TIPINFO_TIPTYPE                            =1;   
	var GAMEUI_TIPINFO_TIPTYPE_STR                        ="tipType";                    // DBTYPE_I4           类型 1按钮的悬停 0是灰图不可用功能 2为家族悬停提示信息

	var GAMEUI_TIPINFO_TIPTEXT                            =2;   
	var GAMEUI_TIPINFO_TIPTEXT_STR                        ="tipText";                    // DBTYPE_WVARCHAR     显示的文字

	var GAMEUI_TIPINFO_TIPDES                             =3;   
	var GAMEUI_TIPINFO_TIPDES_STR                         ="tipDes";                     // DBTYPE_WVARCHAR     说明的东西 可填可不填


	var UI                                                ="UI";
	var GAMEUI_UI_UICODE                                  =0;   
	var GAMEUI_UI_UICODE_STR                              ="UICODE";                     // DBTYPE_WVARCHAR     界面代码，如UI_LOGIN表示登录界面

	var GAMEUI_UI_LAYERCODE                               =1;   
	var GAMEUI_UI_LAYERCODE_STR                           ="LAYERCODE";                  // DBTYPE_WVARCHAR     一共有9层 window第0层，container1一层，container2 二层，GameContainer三层，这几层之间是父子关系，GameContainer是最上面一层。BGLAYER第四层，UILAYER第五层，BTNLAYER第六层，DLGLAYER第七层，这几层之间是兄弟关系

	var GAMEUI_UI_UIFILEPATH                              =2;   
	var GAMEUI_UI_UIFILEPATH_STR                          ="UIFILEPATH";                 // DBTYPE_WVARCHAR     界面GML文件路径，以游戏安装目录为根目录,用$./表示

	var GAMEUI_UI_NAME                                    =3;   
	var GAMEUI_UI_NAME_STR                                ="NAME";                       // DBTYPE_WVARCHAR     界面name

	var GAMEUI_UI_DESC                                    =4;   
	var GAMEUI_UI_DESC_STR                                ="DESC";                       // DBTYPE_WVARCHAR     界面描述


	var UI2D_EFFECT                                       ="ui2d_effect";
	var GAMEUI_UI2D_EFFECT_ID                             =0;   
	var GAMEUI_UI2D_EFFECT_ID_STR                         ="id";                         // DBTYPE_I4           

	var GAMEUI_UI2D_EFFECT_TYPE                           =1;   
	var GAMEUI_UI2D_EFFECT_TYPE_STR                       ="type";                       // DBTYPE_I4           类型：1竖挂件 2横幅

	var GAMEUI_UI2D_EFFECT_POS                            =2;   
	var GAMEUI_UI2D_EFFECT_POS_STR                        ="pos";                        // DBTYPE_WVARCHAR     位置

	var GAMEUI_UI2D_EFFECT_SIZEX                          =3;   
	var GAMEUI_UI2D_EFFECT_SIZEX_STR                      ="sizex";                      // DBTYPE_I4           单帧宽(单位：像素)

	var GAMEUI_UI2D_EFFECT_SIZEY                          =4;   
	var GAMEUI_UI2D_EFFECT_SIZEY_STR                      ="sizey";                      // DBTYPE_I4           单帧高(单位：像素)

	var GAMEUI_UI2D_EFFECT_WS                             =5;   
	var GAMEUI_UI2D_EFFECT_WS_STR                         ="ws";                         // DBTYPE_I4           列数

	var GAMEUI_UI2D_EFFECT_ALLFMS                         =6;   
	var GAMEUI_UI2D_EFFECT_ALLFMS_STR                     ="allfms";                     // DBTYPE_I4           总帧数

	var GAMEUI_UI2D_EFFECT_SPEED                          =7;   
	var GAMEUI_UI2D_EFFECT_SPEED_STR                      ="speed";                      // DBTYPE_I4           速度

	var GAMEUI_UI2D_EFFECT_LOOPS                          =8;   
	var GAMEUI_UI2D_EFFECT_LOOPS_STR                      ="loops";                      // DBTYPE_I4           循环次数(<=0无限制)

	var GAMEUI_UI2D_EFFECT_IMGNAME                        =9;   
	var GAMEUI_UI2D_EFFECT_IMGNAME_STR                    ="imgname";                    // DBTYPE_WVARCHAR     图片文件名(基础路径：.\client\interface\UI\PublicImage\uieffect\)

	var GAMEUI_UI2D_EFFECT_DESC                           =10;  
	var GAMEUI_UI2D_EFFECT_DESC_STR                       ="desc";                       // DBTYPE_WVARCHAR     备注


	var UIGUIDE                                           ="UIGuide";
	var GAMEUI_UIGUIDE_ID                                 =0;   
	var GAMEUI_UIGUIDE_ID_STR                             ="id";                         // DBTYPE_I4           箭头ID

	var GAMEUI_UIGUIDE_SRC                                =1;   
	var GAMEUI_UIGUIDE_SRC_STR                            ="src";                        // DBTYPE_WVARCHAR     显示的图片名字

	var GAMEUI_UIGUIDE_POS                                =2;   
	var GAMEUI_UIGUIDE_POS_STR                            ="pos";                        // DBTYPE_WVARCHAR     图片的位置

	var GAMEUI_UIGUIDE_UINAME                             =3;   
	var GAMEUI_UIGUIDE_UINAME_STR                         ="uiname";                     // DBTYPE_WVARCHAR     界面的name

	var GAMEUI_UIGUIDE_DISCRIBE                           =4;   
	var GAMEUI_UIGUIDE_DISCRIBE_STR                       ="discribe";                   // DBTYPE_WVARCHAR     位置和功能的说明


	var UIGUIDEEX                                         ="UIGuideEx";
	var GAMEUI_UIGUIDEEX_BTNNANE                          =0;   
	var GAMEUI_UIGUIDEEX_BTNNANE_STR                      ="btnnane";                    // DBTYPE_WVARCHAR     按钮的name

	var GAMEUI_UIGUIDEEX_TYPE                             =1;   
	var GAMEUI_UIGUIDEEX_TYPE_STR                         ="type";                       // DBTYPE_I4           强制引导的类型：1固定大小 2自定义大小

	var GAMEUI_UIGUIDEEX_LAYER                            =2;   
	var GAMEUI_UIGUIDEEX_LAYER_STR                        ="layer";                      // DBTYPE_I4           按钮到-window大小的层数 -1代表自动处理 目前最高5层

	var GAMEUI_UIGUIDEEX_CLICKEVENT                       =3;   
	var GAMEUI_UIGUIDEEX_CLICKEVENT_STR                   ="clickevent";                 // DBTYPE_WVARCHAR     一段脚本 点击之后需要做事情

	var GAMEUI_UIGUIDEEX_BTNPARAM                         =4;   
	var GAMEUI_UIGUIDEEX_BTNPARAM_STR                     ="btnparam";                   // DBTYPE_WVARCHAR     分辨率1 可点击亮块的参数：width,height,left,top(宽，高，左，上)：例如:100,100,200,300

	var GAMEUI_UIGUIDEEX_BTNPARAM1                        =5;   
	var GAMEUI_UIGUIDEEX_BTNPARAM1_STR                    ="btnparam1";                  // DBTYPE_WVARCHAR     分辨率2 可点击亮块的参数：width,height,left,top(宽，高，左，上)：例如:100,100,200,300

	var GAMEUI_UIGUIDEEX_BTNPARAM2                        =6;   
	var GAMEUI_UIGUIDEEX_BTNPARAM2_STR                    ="btnparam2";                  // DBTYPE_WVARCHAR     分辨率3 可点击亮块的参数：width,height,left,top(宽，高，左，上)：例如:100,100,200,300

	var GAMEUI_UIGUIDEEX_BTNCLICKTYPE                     =7;   
	var GAMEUI_UIGUIDEEX_BTNCLICKTYPE_STR                 ="btnclicktype";               // DBTYPE_I4           按钮点击事件类型;0不区分左右键和单双击 1左键单击 2左键双击 3右键单击 4右键双击

	var GAMEUI_UIGUIDEEX_ARROWSRC                         =8;   
	var GAMEUI_UIGUIDEEX_ARROWSRC_STR                     ="arrowsrc";                   // DBTYPE_WVARCHAR     箭头图片名

	var GAMEUI_UIGUIDEEX_ARROWPARAM                       =9;   
	var GAMEUI_UIGUIDEEX_ARROWPARAM_STR                   ="arrowparam";                 // DBTYPE_WVARCHAR     箭头的参数:clipani(100,100,1,2);字符串 例如：79,110,1,4

	var GAMEUI_UIGUIDEEX_ARROWPOS                         =10;  
	var GAMEUI_UIGUIDEEX_ARROWPOS_STR                     ="arrowpos";                   // DBTYPE_WVARCHAR     分辨率1 箭头的位置 pos = "100,200";

	var GAMEUI_UIGUIDEEX_ARROWPOS1                        =11;  
	var GAMEUI_UIGUIDEEX_ARROWPOS1_STR                    ="arrowpos1";                  // DBTYPE_WVARCHAR     分辨率2 箭头的位置 pos = "100,200";

	var GAMEUI_UIGUIDEEX_ARROWPOS2                        =12;  
	var GAMEUI_UIGUIDEEX_ARROWPOS2_STR                    ="arrowpos2";                  // DBTYPE_WVARCHAR     分辨率3 箭头的位置 pos = "100,200";

	var GAMEUI_UIGUIDEEX_ARROWANISPEED                    =13;  
	var GAMEUI_UIGUIDEEX_ARROWANISPEED_STR                ="arrowanispeed";              // DBTYPE_I4           箭头的参数:anispeed=2;动画速度

	var GAMEUI_UIGUIDEEX_TEXTIMGSRC                       =14;  
	var GAMEUI_UIGUIDEEX_TEXTIMGSRC_STR                   ="textimgsrc";                 // DBTYPE_WVARCHAR     说明文字图片名

	var GAMEUI_UIGUIDEEX_TEXTIMGPARAM                     =15;  
	var GAMEUI_UIGUIDEEX_TEXTIMGPARAM_STR                 ="textimgparam";               // DBTYPE_WVARCHAR     分辨率1 说明文字图片位置参数:pos = "100,200";

	var GAMEUI_UIGUIDEEX_TEXTIMGPARAM1                    =16;  
	var GAMEUI_UIGUIDEEX_TEXTIMGPARAM1_STR                ="textimgparam1";              // DBTYPE_WVARCHAR     分辨率2 说明文字图片位置参数:pos = "100,200";

	var GAMEUI_UIGUIDEEX_TEXTIMGPARAM2                    =17;  
	var GAMEUI_UIGUIDEEX_TEXTIMGPARAM2_STR                ="textimgparam2";              // DBTYPE_WVARCHAR     分辨率3 说明文字图片位置参数:pos = "100,200";

	var GAMEUI_UIGUIDEEX_DESC                             =18;  
	var GAMEUI_UIGUIDEEX_DESC_STR                         ="desc";                       // DBTYPE_WLONGVARCHAR 说明

	var GAMEUI_UIGUIDEEX_EXDATA                           =19;  
	var GAMEUI_UIGUIDEEX_EXDATA_STR                       ="exdata";                     // DBTYPE_WLONGVARCHAR 扩展数据 可以是一段脚本


	var UIHELP                                            ="UIHelp";
	var GAMEUI_UIHELP_ID                                  =0;   
	var GAMEUI_UIHELP_ID_STR                              ="id";                         // DBTYPE_I4           

	var GAMEUI_UIHELP_PARENTID                            =1;   
	var GAMEUI_UIHELP_PARENTID_STR                        ="parentid";                   // DBTYPE_I4           父的ID

	var GAMEUI_UIHELP_TITLE                               =2;   
	var GAMEUI_UIHELP_TITLE_STR                           ="title";                      // DBTYPE_WVARCHAR     标题

	var GAMEUI_UIHELP_LIST                                =3;   
	var GAMEUI_UIHELP_LIST_STR                            ="list";                       // DBTYPE_WVARCHAR     可点击选项文字

	var GAMEUI_UIHELP_DISCRIBE                            =4;   
	var GAMEUI_UIHELP_DISCRIBE_STR                        ="discribe";                   // DBTYPE_WVARCHAR     内容描述

	var GAMEUI_UIHELP_CONTENT                             =5;   
	var GAMEUI_UIHELP_CONTENT_STR                         ="content";                    // DBTYPE_WLONGVARCHAR 说明文字

	var GAMEUI_UIHELP_BTN_BACK                            =6;   
	var GAMEUI_UIHELP_BTN_BACK_STR                        ="btn_back";                   // DBTYPE_I4           按钮一(返回):1显示 0不显示

	var GAMEUI_UIHELP_BTN_CLOSE                           =7;   
	var GAMEUI_UIHELP_BTN_CLOSE_STR                       ="btn_close";                  // DBTYPE_I4           按钮二(关闭):1显示 0不显示

	var GAMEUI_UIHELP_FACE                                =8;   
	var GAMEUI_UIHELP_FACE_STR                            ="face";                       // DBTYPE_WVARCHAR     形象表情 文件名


	var VIDEOINFO                                         ="VideoInfo";
	var GAMEUI_VIDEOINFO_RID                              =0;   
	var GAMEUI_VIDEOINFO_RID_STR                          ="rid";                        // DBTYPE_I4           录像信息编号

	var GAMEUI_VIDEOINFO_TITLE                            =1;   
	var GAMEUI_VIDEOINFO_TITLE_STR                        ="title";                      // DBTYPE_WVARCHAR     录像名称标题

	var GAMEUI_VIDEOINFO_LENGTH                           =2;   
	var GAMEUI_VIDEOINFO_LENGTH_STR                       ="length";                     // DBTYPE_WVARCHAR     录像文件时间长度

	var GAMEUI_VIDEOINFO_SIZE                             =3;   
	var GAMEUI_VIDEOINFO_SIZE_STR                         ="size";                       // DBTYPE_I4           录像文件大小

	var GAMEUI_VIDEOINFO_DATA                             =4;   
	var GAMEUI_VIDEOINFO_DATA_STR                         ="data";                       // DBTYPE_WVARCHAR     录像时间 小时 分

	var GAMEUI_VIDEOINFO_DEL                              =5;   
	var GAMEUI_VIDEOINFO_DEL_STR                          ="Del";                        // DBTYPE_I4           是否删除 0未删除 1已删除

}
