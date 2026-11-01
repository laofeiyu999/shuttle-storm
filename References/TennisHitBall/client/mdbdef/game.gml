// 创建日期:2011/5/16 18:26:32
// Access文件名:E:\VnetProject2010\project4\tennis\data\mdb\game.mdb

set window
{
	var GAME                                              ="game.mdb";

	var BUFFER                                            ="buffer";
	var GAME_BUFFER_BUFFID                                =0;   
	var GAME_BUFFER_BUFFID_STR                            ="buffid";                     // DBTYPE_I4           

	var GAME_BUFFER_BNAME                                 =1;   
	var GAME_BUFFER_BNAME_STR                             ="bName";                      // DBTYPE_WVARCHAR     Buff名称

	var GAME_BUFFER_BEXPLAIN                              =2;   
	var GAME_BUFFER_BEXPLAIN_STR                          ="bExplain";                   // DBTYPE_WVARCHAR     Buff说明

	var GAME_BUFFER_BTYPE                                 =3;   
	var GAME_BUFFER_BTYPE_STR                             ="bType";                      // DBTYPE_I4           Buff类型,0为buffer，1为debuffer,2为物品冷却buffer

	var GAME_BUFFER_BTIME                                 =4;   
	var GAME_BUFFER_BTIME_STR                             ="bTime";                      // DBTYPE_I4           Buff时间 比如: 30分种 秒为单位

	var GAME_BUFFER_BTIMETYPE                             =5;   
	var GAME_BUFFER_BTIMETYPE_STR                         ="bTimeType";                  // DBTYPE_I4           Buff时间类型 如: 0:不需要时间,1:终止时间型,2:倒计时型 在线时间有效,3:持续性

	var GAME_BUFFER_BCONNUM                               =6;   
	var GAME_BUFFER_BCONNUM_STR                           ="bConNum";                    // DBTYPE_I4           持续Buff触发 次数

	var GAME_BUFFER_BSELFDEL                              =7;   
	var GAME_BUFFER_BSELFDEL_STR                          ="bSelfDel";                   // DBTYPE_BOOL         增加Buff时所,如果当前Buff存在的处理方式 为真是 则顶掉以前的. 为假是 增加Buff失败

	var GAME_BUFFER_BCONDITION                            =8;   
	var GAME_BUFFER_BCONDITION_STR                        ="bCondition";                 // DBTYPE_WVARCHAR     Buff增加条件 如: 低于60级不可增加

	var GAME_BUFFER_BADDTOUCH                             =9;   
	var GAME_BUFFER_BADDTOUCH_STR                         ="bAddTouch";                  // DBTYPE_WVARCHAR     Buff增加时对其它东西的影响 如: 把和自己对立的BUFF删除

	var GAME_BUFFER_BTATT                                 =10;  
	var GAME_BUFFER_BTATT_STR                             ="bTAtt";                      // DBTYPE_WVARCHAR     Buff影响到的属性 如:增加力量等

	var GAME_BUFFER_BTOUCH                                =11;  
	var GAME_BUFFER_BTOUCH_STR                            ="bTouch";                     // DBTYPE_WVARCHAR     Buff影响的其它.如:增加一个技能或经能验双倍.或禁言

	var GAME_BUFFER_BDELTRIGGER                           =12;  
	var GAME_BUFFER_BDELTRIGGER_STR                       ="bDelTrigger";                // DBTYPE_WVARCHAR     Buff删除时触发.如:删除力量,删除技能等

	var GAME_BUFFER_BICON                                 =13;  
	var GAME_BUFFER_BICON_STR                             ="bIcon";                      // DBTYPE_WVARCHAR     Buff图标

	var GAME_BUFFER_F15                                   =14;  
	var GAME_BUFFER_F15_STR                               ="F15";                        // DBTYPE_WVARCHAR     

	var GAME_BUFFER_BCLDEL                                =15;  
	var GAME_BUFFER_BCLDEL_STR                            ="bClDel";                     // DBTYPE_WVARCHAR     Buff删除时客户端触发


	var BYTEPOS                                           ="BytePos";
	var GAME_BYTEPOS_INDEX                                =0;   
	var GAME_BYTEPOS_INDEX_STR                            ="index";                      // DBTYPE_I4           

	var GAME_BYTEPOS_ATT                                  =1;   
	var GAME_BYTEPOS_ATT_STR                              ="att";                        // DBTYPE_WVARCHAR     

	var GAME_BYTEPOS_POS                                  =2;   
	var GAME_BYTEPOS_POS_STR                              ="pos";                        // DBTYPE_I4           


	var ENCOURAGE                                         ="Encourage";
	var GAME_ENCOURAGE_ID                                 =0;   
	var GAME_ENCOURAGE_ID_STR                             ="id";                         // DBTYPE_I4           索引 顺着下填

	var GAME_ENCOURAGE_SERVERTYPE                         =1;   
	var GAME_ENCOURAGE_SERVERTYPE_STR                     ="serverType";                 // DBTYPE_I4           服务器类型 1新手 2资格 3巡回 4黄金 5大师 6大满

	var GAME_ENCOURAGE_TM                                 =2;   
	var GAME_ENCOURAGE_TM_STR                             ="tm";                         // DBTYPE_I4           时间(秒) 最高不超过10分钟

	var GAME_ENCOURAGE_APPRAISE                           =3;   
	var GAME_ENCOURAGE_APPRAISE_STR                       ="appraise";                   // DBTYPE_I4           评价 1C 2B 3A 4S 5SS

	var GAME_ENCOURAGE_WINEXP                             =4;   
	var GAME_ENCOURAGE_WINEXP_STR                         ="winExp";                     // DBTYPE_I4           获胜获得的经验

	var GAME_ENCOURAGE_WINMONEY                           =5;   
	var GAME_ENCOURAGE_WINMONEY_STR                       ="winMoney";                   // DBTYPE_I4           获胜获得的金币

	var GAME_ENCOURAGE_WINPRIVITY                         =6;   
	var GAME_ENCOURAGE_WINPRIVITY_STR                     ="winPrivity";                 // DBTYPE_I4           如果有搭档,获胜获得的默契度  获胜每分钟效率为12默契度，失败为8

	var GAME_ENCOURAGE_LOSTEXP                            =7;   
	var GAME_ENCOURAGE_LOSTEXP_STR                        ="lostExp";                    // DBTYPE_I4           失败获得的经验

	var GAME_ENCOURAGE_LOSTMONEY                          =8;   
	var GAME_ENCOURAGE_LOSTMONEY_STR                      ="lostMoney";                  // DBTYPE_I4           失败获得的金币

	var GAME_ENCOURAGE_LOSTPRIVITY                        =9;   
	var GAME_ENCOURAGE_LOSTPRIVITY_STR                    ="lostPrivity";                // DBTYPE_I4           如果有搭档,失败获得的默契度 获胜每分钟效率为12默契度，失败为8


	var GMCOMMAND                                         ="GmCommand";
	var GAME_GMCOMMAND_GMCOMID                            =0;   
	var GAME_GMCOMMAND_GMCOMID_STR                        ="GMComId";                    // DBTYPE_I4           

	var GAME_GMCOMMAND_GMCNAME                            =1;   
	var GAME_GMCOMMAND_GMCNAME_STR                        ="GMCName";                    // DBTYPE_WVARCHAR     GM指令名

	var GAME_GMCOMMAND_GMCFORMAT                          =2;   
	var GAME_GMCOMMAND_GMCFORMAT_STR                      ="GMCFormat";                  // DBTYPE_WVARCHAR     GM指令格式

	var GAME_GMCOMMAND_GMCEXPLAIN                         =3;   
	var GAME_GMCOMMAND_GMCEXPLAIN_STR                     ="GMCExplain";                 // DBTYPE_WVARCHAR     GM指令说明

	var GAME_GMCOMMAND_GMCFUN                             =4;   
	var GAME_GMCOMMAND_GMCFUN_STR                         ="GMCFun";                     // DBTYPE_WVARCHAR     GM指令关键字

	var GAME_GMCOMMAND_GMCSP                              =5;   
	var GAME_GMCOMMAND_GMCSP_STR                          ="GMCSp";                      // DBTYPE_WVARCHAR     GM指令执行的脚本

	var GAME_GMCOMMAND_GMCNEEDCALLFUN                     =6;   
	var GAME_GMCOMMAND_GMCNEEDCALLFUN_STR                 ="GMCNeedCallFun";             // DBTYPE_BOOL         GM指令执行时是否需要调用程序

	var GAME_GMCOMMAND_GMCNEEDPOPEDOM                     =7;   
	var GAME_GMCOMMAND_GMCNEEDPOPEDOM_STR                 ="GMCNeedPopedom";             // DBTYPE_I4           GM指令执行所需权限

	var GAME_GMCOMMAND_GMCFINDUSER                        =8;   
	var GAME_GMCOMMAND_GMCFINDUSER_STR                    ="GMCFindUser";                // DBTYPE_BOOL         GM指令是否需要查找用户


	var JZ_LEVEL                                          ="jz_level";
	var GAME_JZ_LEVEL_LV                                  =0;   
	var GAME_JZ_LEVEL_LV_STR                              ="lv";                         // DBTYPE_I4           

	var GAME_JZ_LEVEL_NUM                                 =1;   
	var GAME_JZ_LEVEL_NUM_STR                             ="num";                        // DBTYPE_I4           最大人数

	var GAME_JZ_LEVEL_POINT                               =2;   
	var GAME_JZ_LEVEL_POINT_STR                           ="point";                      // DBTYPE_I4           从第一级到目前基数需要的贡献点

	var GAME_JZ_LEVEL_MANAGERNUM                          =3;   
	var GAME_JZ_LEVEL_MANAGERNUM_STR                      ="managerNum";                 // DBTYPE_I4           管理员的数量

	var GAME_JZ_LEVEL_COLOR                               =4;   
	var GAME_JZ_LEVEL_COLOR_STR                           ="color";                      // DBTYPE_WVARCHAR     字的颜色

	var GAME_JZ_LEVEL_BORDERCOLOR                         =5;   
	var GAME_JZ_LEVEL_BORDERCOLOR_STR                     ="borderColor";                // DBTYPE_WVARCHAR     描边颜色


	var LEVELUP                                           ="LevelUp";
	var GAME_LEVELUP_LEVELNUM                             =0;   
	var GAME_LEVELUP_LEVELNUM_STR                         ="LevelNum";                   // DBTYPE_I4           0 等级

	var GAME_LEVELUP_REQUIREEXP                           =1;   
	var GAME_LEVELUP_REQUIREEXP_STR                       ="RequireExp";                 // DBTYPE_I4           1 本级升到下一级所需经验 满级时填0

	var GAME_LEVELUP_ENCOURAGEMAN                         =2;   
	var GAME_LEVELUP_ENCOURAGEMAN_STR                     ="EncourageMan";               // DBTYPE_WVARCHAR     普通帐号升到这一级的奖励,格式为 物品,num,限制时间(废弃)

	var GAME_LEVELUP_ENCOURAGEWOMAN                       =3;   
	var GAME_LEVELUP_ENCOURAGEWOMAN_STR                   ="EncourageWoMan";             // DBTYPE_WVARCHAR     普通帐号升到这一级的奖励,格式为 物品,num,限制时间(废弃)

	var GAME_LEVELUP_PRESENTID                            =4;   
	var GAME_LEVELUP_PRESENTID_STR                        ="PresentID";                  // DBTYPE_I4           现在的发礼品id


	var LOVERENCOURAGE                                    ="LoverEncourage";
	var GAME_LOVERENCOURAGE_LV                            =0;   
	var GAME_LOVERENCOURAGE_LV_STR                        ="lv";                         // DBTYPE_I4           情侣等级,从1开始

	var GAME_LOVERENCOURAGE_NUM                           =1;   
	var GAME_LOVERENCOURAGE_NUM_STR                       ="num";                        // DBTYPE_I4           达到需要的亲密度,1级为0

	var GAME_LOVERENCOURAGE_SHOWNAME                      =2;   
	var GAME_LOVERENCOURAGE_SHOWNAME_STR                  ="showname";                   // DBTYPE_WVARCHAR     显示在界面上的名称

	var GAME_LOVERENCOURAGE_EXPADD                        =3;   
	var GAME_LOVERENCOURAGE_EXPADD_STR                    ="expadd";                     // DBTYPE_I4           经验加成,单位(%)


	var LOVERUSEITEM                                      ="LoverUseItem";
	var GAME_LOVERUSEITEM_USELOVERITEM                    =0;   
	var GAME_LOVERUSEITEM_USELOVERITEM_STR                ="useLoverItem";               // DBTYPE_I4           使用的情侣结婚物品 -1000为固定的离婚物品id,必须填写一条数据,用来处理邮件

	var GAME_LOVERUSEITEM_SENDLOVERITEM                   =1;   
	var GAME_LOVERUSEITEM_SENDLOVERITEM_STR               ="sendLoverItem";              // DBTYPE_I4           结婚赠送的情侣结婚物品

	var GAME_LOVERUSEITEM_SENDNAME                        =2;   
	var GAME_LOVERUSEITEM_SENDNAME_STR                    ="sendName";                   // DBTYPE_WVARCHAR     邮件赠送者

	var GAME_LOVERUSEITEM_SENDCONTENT                     =3;   
	var GAME_LOVERUSEITEM_SENDCONTENT_STR                 ="sendContent";                // DBTYPE_WVARCHAR     邮件内容

	var GAME_LOVERUSEITEM_SENDTITLE                       =4;   
	var GAME_LOVERUSEITEM_SENDTITLE_STR                   ="sendTitle";                  // DBTYPE_WVARCHAR     邮件标题


	var LOVERVALUEADDINGAME                               ="LoverValueAddInGame";
	var GAME_LOVERVALUEADDINGAME_ID                       =0;   
	var GAME_LOVERVALUEADDINGAME_ID_STR                   ="id";                         // DBTYPE_I4           比赛获得的固定亲密度 1:普通比赛 2.情侣模式

	var GAME_LOVERVALUEADDINGAME_VALUE                    =1;   
	var GAME_LOVERVALUEADDINGAME_VALUE_STR                ="value";                      // DBTYPE_I4           


	var MAPINFO                                           ="MapInfo";
	var GAME_MAPINFO_MAPID                                =0;   
	var GAME_MAPINFO_MAPID_STR                            ="MapID";                      // DBTYPE_I4           地图标识

	var GAME_MAPINFO_MAPNAME                              =1;   
	var GAME_MAPINFO_MAPNAME_STR                          ="MapName";                    // DBTYPE_WVARCHAR     地图名称

	var GAME_MAPINFO_LIMITLEVELMIN                        =2;   
	var GAME_MAPINFO_LIMITLEVELMIN_STR                    ="LimitLevelMin";              // DBTYPE_I4           限制等级最小

	var GAME_MAPINFO_LIMITLEVELMAX                        =3;   
	var GAME_MAPINFO_LIMITLEVELMAX_STR                    ="LimitLevelMax";              // DBTYPE_I4           限制等级最大

	var GAME_MAPINFO_MAPMODE                              =4;   
	var GAME_MAPINFO_MAPMODE_STR                          ="MapMode";                    // DBTYPE_I4           地图模式 pvp 或者 pve

	var GAME_MAPINFO_ICONPATH                             =5;   
	var GAME_MAPINFO_ICONPATH_STR                         ="IconPath";                   // DBTYPE_WVARCHAR     图标路径

	var GAME_MAPINFO_MAPDESC                              =6;   
	var GAME_MAPINFO_MAPDESC_STR                          ="MapDesc";                    // DBTYPE_WVARCHAR     地图描述

	var GAME_MAPINFO_CONDITION                            =7;   
	var GAME_MAPINFO_CONDITION_STR                        ="Condition";                  // DBTYPE_WVARCHAR     其他限制条件

	var GAME_MAPINFO_CONDITIONA                           =8;   
	var GAME_MAPINFO_CONDITIONA_STR                       ="ConditionA";                 // DBTYPE_WVARCHAR     其他限制条件A

	var GAME_MAPINFO_CONDITIONB                           =9;   
	var GAME_MAPINFO_CONDITIONB_STR                       ="ConditionB";                 // DBTYPE_WVARCHAR     其他限制条件B

	var GAME_MAPINFO_CONDITIONC                           =10;  
	var GAME_MAPINFO_CONDITIONC_STR                       ="ConditionC";                 // DBTYPE_WVARCHAR     其他限制条件C

	var GAME_MAPINFO_CONDITIOND                           =11;  
	var GAME_MAPINFO_CONDITIOND_STR                       ="ConditionD";                 // DBTYPE_WVARCHAR     其他限制条件D

	var GAME_MAPINFO_CONDITIONE                           =12;  
	var GAME_MAPINFO_CONDITIONE_STR                       ="ConditionE";                 // DBTYPE_WVARCHAR     其他限制条件E

	var GAME_MAPINFO_MAPTASK                              =13;  
	var GAME_MAPINFO_MAPTASK_STR                          ="MapTask";                    // DBTYPE_WVARCHAR     该地图可以接受的任务ID

	var GAME_MAPINFO_BIRTHPOINT0                          =14;  
	var GAME_MAPINFO_BIRTHPOINT0_STR                      ="BirthPoint0";                // DBTYPE_WVARCHAR     出生点0

	var GAME_MAPINFO_BIRTHPOINT1                          =15;  
	var GAME_MAPINFO_BIRTHPOINT1_STR                      ="BirthPoint1";                // DBTYPE_WVARCHAR     出生点1

	var GAME_MAPINFO_BIRTHPOINT2                          =16;  
	var GAME_MAPINFO_BIRTHPOINT2_STR                      ="BirthPoint2";                // DBTYPE_WVARCHAR     出生点2

	var GAME_MAPINFO_BIRTHPOINT3                          =17;  
	var GAME_MAPINFO_BIRTHPOINT3_STR                      ="BirthPoint3";                // DBTYPE_WVARCHAR     出生点3

	var GAME_MAPINFO_BIRTHPOINT4                          =18;  
	var GAME_MAPINFO_BIRTHPOINT4_STR                      ="BirthPoint4";                // DBTYPE_WVARCHAR     出生点4

	var GAME_MAPINFO_BIRTHPOINT5                          =19;  
	var GAME_MAPINFO_BIRTHPOINT5_STR                      ="BirthPoint5";                // DBTYPE_WVARCHAR     出生点5

	var GAME_MAPINFO_CSCPTFILE                            =20;  
	var GAME_MAPINFO_CSCPTFILE_STR                        ="CScptFile";                  // DBTYPE_WVARCHAR     客户端地图要加载的脚本

	var GAME_MAPINFO_SSCPTFILE                            =21;  
	var GAME_MAPINFO_SSCPTFILE_STR                        ="SScptFile";                  // DBTYPE_WVARCHAR     服务端地图要加载的脚本

	var GAME_MAPINFO_MAPLV                                =22;  
	var GAME_MAPINFO_MAPLV_STR                            ="MapLv";                      // DBTYPE_I4           地图难度,取值范围1-10,1最简单 10最难

	var GAME_MAPINFO_MAPTM                                =23;  
	var GAME_MAPINFO_MAPTM_STR                            ="MapTm";                      // DBTYPE_I4           地图在时间后结束

	var GAME_MAPINFO_GROUPSTART                           =24;  
	var GAME_MAPINFO_GROUPSTART_STR                       ="GroupStart";                 // DBTYPE_I4           是否是这一组地图的开始 0:不是 1:是 只有pve模式地图使用，pvp模式地图不用填

	var GAME_MAPINFO_MAP_EXP                              =25;  
	var GAME_MAPINFO_MAP_EXP_STR                          ="Map_Exp";                    // DBTYPE_I4           关卡总经验值

	var GAME_MAPINFO_MAP_EXP_PRO                          =26;  
	var GAME_MAPINFO_MAP_EXP_PRO_STR                      ="Map_Exp_Pro";                // DBTYPE_WVARCHAR     关卡经验比重(普通NPC经验百分比;远程NPC经验百分比;特殊NPC经验百分比;BOSS经验百分比)

	var GAME_MAPINFO_MAP_NPC_NUM                          =27;  
	var GAME_MAPINFO_MAP_NPC_NUM_STR                      ="Map_Npc_Num";                // DBTYPE_WVARCHAR     关卡NPC数量(普通NPC数量;远程NPC数量;特殊NPC数量;BOSS数量)

	var GAME_MAPINFO_CAMMARKPOINT                         =28;  
	var GAME_MAPINFO_CAMMARKPOINT_STR                     ="CamMarkPoint";               // DBTYPE_WVARCHAR     摄像机的标记点(此点必须在摄像机限制规定的有效区域内部。摄像机会以此位置为基准向角色初始位置靠拢，从而生成摄像机初始位置。)

	var GAME_MAPINFO_PRELOADNPC                           =29;  
	var GAME_MAPINFO_PRELOADNPC_STR                       ="PreLoadNPC";                 // DBTYPE_WVARCHAR     预加载NPC

	var GAME_MAPINFO_MAP_MONEY                            =30;  
	var GAME_MAPINFO_MAP_MONEY_STR                        ="Map_Money";                  // DBTYPE_I4           关卡结算金钱


	var MSYSIMEXCOLUMNS                                   ="MSysIMEXColumns";
	var GAME_MSYSIMEXCOLUMNS_ATTRIBUTES                   =0;   
	var GAME_MSYSIMEXCOLUMNS_ATTRIBUTES_STR               ="Attributes";                 // DBTYPE_I4           

	var GAME_MSYSIMEXCOLUMNS_DATATYPE                     =1;   
	var GAME_MSYSIMEXCOLUMNS_DATATYPE_STR                 ="DataType";                   // DBTYPE_I2           

	var GAME_MSYSIMEXCOLUMNS_FIELDNAME                    =2;   
	var GAME_MSYSIMEXCOLUMNS_FIELDNAME_STR                ="FieldName";                  // DBTYPE_WVARCHAR     

	var GAME_MSYSIMEXCOLUMNS_INDEXTYPE                    =3;   
	var GAME_MSYSIMEXCOLUMNS_INDEXTYPE_STR                ="IndexType";                  // DBTYPE_UI1          

	var GAME_MSYSIMEXCOLUMNS_SKIPCOLUMN                   =4;   
	var GAME_MSYSIMEXCOLUMNS_SKIPCOLUMN_STR               ="SkipColumn";                 // DBTYPE_BOOL         

	var GAME_MSYSIMEXCOLUMNS_SPECID                       =5;   
	var GAME_MSYSIMEXCOLUMNS_SPECID_STR                   ="SpecID";                     // DBTYPE_I4           

	var GAME_MSYSIMEXCOLUMNS_START                        =6;   
	var GAME_MSYSIMEXCOLUMNS_START_STR                    ="Start";                      // DBTYPE_I2           

	var GAME_MSYSIMEXCOLUMNS_WIDTH                        =7;   
	var GAME_MSYSIMEXCOLUMNS_WIDTH_STR                    ="Width";                      // DBTYPE_I2           


	var MSYSIMEXSPECS                                     ="MSysIMEXSpecs";
	var GAME_MSYSIMEXSPECS_DATEDELIM                      =0;   
	var GAME_MSYSIMEXSPECS_DATEDELIM_STR                  ="DateDelim";                  // DBTYPE_WVARCHAR     

	var GAME_MSYSIMEXSPECS_DATEFOURDIGITYEAR              =1;   
	var GAME_MSYSIMEXSPECS_DATEFOURDIGITYEAR_STR          ="DateFourDigitYear";          // DBTYPE_BOOL         

	var GAME_MSYSIMEXSPECS_DATELEADINGZEROS               =2;   
	var GAME_MSYSIMEXSPECS_DATELEADINGZEROS_STR           ="DateLeadingZeros";           // DBTYPE_BOOL         

	var GAME_MSYSIMEXSPECS_DATEORDER                      =3;   
	var GAME_MSYSIMEXSPECS_DATEORDER_STR                  ="DateOrder";                  // DBTYPE_I2           

	var GAME_MSYSIMEXSPECS_DECIMALPOINT                   =4;   
	var GAME_MSYSIMEXSPECS_DECIMALPOINT_STR               ="DecimalPoint";               // DBTYPE_WVARCHAR     

	var GAME_MSYSIMEXSPECS_FIELDSEPARATOR                 =5;   
	var GAME_MSYSIMEXSPECS_FIELDSEPARATOR_STR             ="FieldSeparator";             // DBTYPE_WVARCHAR     

	var GAME_MSYSIMEXSPECS_FILETYPE                       =6;   
	var GAME_MSYSIMEXSPECS_FILETYPE_STR                   ="FileType";                   // DBTYPE_I2           

	var GAME_MSYSIMEXSPECS_SPECID                         =7;   
	var GAME_MSYSIMEXSPECS_SPECID_STR                     ="SpecID";                     // DBTYPE_I4           

	var GAME_MSYSIMEXSPECS_SPECNAME                       =8;   
	var GAME_MSYSIMEXSPECS_SPECNAME_STR                   ="SpecName";                   // DBTYPE_WVARCHAR     

	var GAME_MSYSIMEXSPECS_SPECTYPE                       =9;   
	var GAME_MSYSIMEXSPECS_SPECTYPE_STR                   ="SpecType";                   // DBTYPE_UI1          

	var GAME_MSYSIMEXSPECS_STARTROW                       =10;  
	var GAME_MSYSIMEXSPECS_STARTROW_STR                   ="StartRow";                   // DBTYPE_I4           

	var GAME_MSYSIMEXSPECS_TEXTDELIM                      =11;  
	var GAME_MSYSIMEXSPECS_TEXTDELIM_STR                  ="TextDelim";                  // DBTYPE_WVARCHAR     

	var GAME_MSYSIMEXSPECS_TIMEDELIM                      =12;  
	var GAME_MSYSIMEXSPECS_TIMEDELIM_STR                  ="TimeDelim";                  // DBTYPE_WVARCHAR     


	var OBJECTDEF                                         ="ObjectDef";
	var GAME_OBJECTDEF_ID                                 =0;   
	var GAME_OBJECTDEF_ID_STR                             ="ID";                         // DBTYPE_I4           ID。

	var GAME_OBJECTDEF_NAME                               =1;   
	var GAME_OBJECTDEF_NAME_STR                           ="Name";                       // DBTYPE_WVARCHAR     名称。

	var GAME_OBJECTDEF_TYPE                               =2;   
	var GAME_OBJECTDEF_TYPE_STR                           ="Type";                       // DBTYPE_I4           类型。

	var GAME_OBJECTDEF_SHOWID                             =3;   
	var GAME_OBJECTDEF_SHOWID_STR                         ="ShowID";                     // DBTYPE_I4           显示BodyID。

	var GAME_OBJECTDEF_ROLEID                             =4;   
	var GAME_OBJECTDEF_ROLEID_STR                         ="RoleID";                     // DBTYPE_I4           roleid。

	var GAME_OBJECTDEF_BONEMODEL                          =5;   
	var GAME_OBJECTDEF_BONEMODEL_STR                      ="BoneModel";                  // DBTYPE_WVARCHAR     bonemodel。

	var GAME_OBJECTDEF_CANVISITBYAI                       =6;   
	var GAME_OBJECTDEF_CANVISITBYAI_STR                   ="CanVisitByAI";               // DBTYPE_BOOL         能被AI访问。

	var GAME_OBJECTDEF_HASAI                              =7;   
	var GAME_OBJECTDEF_HASAI_STR                          ="HasAI";                      // DBTYPE_BOOL         具有AI。

	var GAME_OBJECTDEF_AISCRIPT                           =8;   
	var GAME_OBJECTDEF_AISCRIPT_STR                       ="AIScript";                   // DBTYPE_WVARCHAR     AI脚本。

	var GAME_OBJECTDEF_CANPUSH                            =9;   
	var GAME_OBJECTDEF_CANPUSH_STR                        ="CanPush";                    // DBTYPE_BOOL         能挡人？。false 则能让别人穿过

	var GAME_OBJECTDEF_PART1                              =10;  
	var GAME_OBJECTDEF_PART1_STR                          ="Part1";                      // DBTYPE_I4           part1。

	var GAME_OBJECTDEF_PART2                              =11;  
	var GAME_OBJECTDEF_PART2_STR                          ="Part2";                      // DBTYPE_I4           part2。

	var GAME_OBJECTDEF_PART3                              =12;  
	var GAME_OBJECTDEF_PART3_STR                          ="Part3";                      // DBTYPE_I4           part3。

	var GAME_OBJECTDEF_PART4                              =13;  
	var GAME_OBJECTDEF_PART4_STR                          ="Part4";                      // DBTYPE_I4           part4。

	var GAME_OBJECTDEF_CANBELIFT                          =14;  
	var GAME_OBJECTDEF_CANBELIFT_STR                      ="CanBeLift";                  // DBTYPE_BOOL         能被举。

	var GAME_OBJECTDEF_EVENTID                            =15;  
	var GAME_OBJECTDEF_EVENTID_STR                        ="EventID";                    // DBTYPE_I4           事件ID。

	var GAME_OBJECTDEF_RESERVE                            =16;  
	var GAME_OBJECTDEF_RESERVE_STR                        ="Reserve";                    // DBTYPE_WVARCHAR     保留。

	var GAME_OBJECTDEF_GOODSITEMID                        =17;  
	var GAME_OBJECTDEF_GOODSITEMID_STR                    ="GoodsItemID";                // DBTYPE_I4           goodsItemID;可找描述价格等。

	var GAME_OBJECTDEF_LIFE                               =18;  
	var GAME_OBJECTDEF_LIFE_STR                           ="Life";                       // DBTYPE_I4           寿命（时间）。

	var GAME_OBJECTDEF_G                                  =19;  
	var GAME_OBJECTDEF_G_STR                              ="G";                          // DBTYPE_R4           重力加速度。

	var GAME_OBJECTDEF_BIRTHSOUND                         =20;  
	var GAME_OBJECTDEF_BIRTHSOUND_STR                     ="BirthSound";                 // DBTYPE_WVARCHAR     出生音效。

	var GAME_OBJECTDEF_DROPID                             =21;  
	var GAME_OBJECTDEF_DROPID_STR                         ="DropID";                     // DBTYPE_I4           掉落ID。

	var GAME_OBJECTDEF_EVENTMGRID                         =22;  
	var GAME_OBJECTDEF_EVENTMGRID_STR                     ="EventMgrID";                 // DBTYPE_I4           EventMgrID。

	var GAME_OBJECTDEF_CANTHROUGHWALL                     =23;  
	var GAME_OBJECTDEF_CANTHROUGHWALL_STR                 ="CanThroughWall";             // DBTYPE_BOOL         能穿透阻挡墙么，只有CanPush=true的才有必要设置这个


	var OBJECTEVENTDEF                                    ="ObjectEventDef";
	var GAME_OBJECTEVENTDEF_ID                            =0;   
	var GAME_OBJECTEVENTDEF_ID_STR                        ="ID";                         // DBTYPE_I4           这个表用来描述所有的与道具相关的事件，所有的内容都用标准的gml脚本填写。目前是与ObjectDef.csv配合使用。ver 0.1

	var GAME_OBJECTEVENTDEF_NAME                          =1;   
	var GAME_OBJECTEVENTDEF_NAME_STR                      ="Name";                       // DBTYPE_WVARCHAR     描述

	var GAME_OBJECTEVENTDEF_ONBIRTH                       =2;   
	var GAME_OBJECTEVENTDEF_ONBIRTH_STR                   ="OnBirth";                    // DBTYPE_WVARCHAR     

	var GAME_OBJECTEVENTDEF_ONBEPICKQUERY                 =3;   
	var GAME_OBJECTEVENTDEF_ONBEPICKQUERY_STR             ="OnBePickQuery";              // DBTYPE_WVARCHAR     

	var GAME_OBJECTEVENTDEF_ONBEPICKED                    =4;   
	var GAME_OBJECTEVENTDEF_ONBEPICKED_STR                ="OnBePicked";                 // DBTYPE_WVARCHAR     

	var GAME_OBJECTEVENTDEF_ONBETHROW                     =5;   
	var GAME_OBJECTEVENTDEF_ONBETHROW_STR                 ="OnBeThrow";                  // DBTYPE_WVARCHAR     

	var GAME_OBJECTEVENTDEF_ONFALLTOGND                   =6;   
	var GAME_OBJECTEVENTDEF_ONFALLTOGND_STR               ="OnFallToGnd";                // DBTYPE_WVARCHAR     

	var GAME_OBJECTEVENTDEF_ONHITPLAYER                   =7;   
	var GAME_OBJECTEVENTDEF_ONHITPLAYER_STR               ="OnHitPlayer";                // DBTYPE_WVARCHAR     

	var GAME_OBJECTEVENTDEF_ONHITWALL                     =8;   
	var GAME_OBJECTEVENTDEF_ONHITWALL_STR                 ="OnHitWall";                  // DBTYPE_WVARCHAR     

	var GAME_OBJECTEVENTDEF_ONBEHIT                       =9;   
	var GAME_OBJECTEVENTDEF_ONBEHIT_STR                   ="OnBeHit";                    // DBTYPE_WVARCHAR     

	var GAME_OBJECTEVENTDEF_ONDEAD                        =10;  
	var GAME_OBJECTEVENTDEF_ONDEAD_STR                    ="OnDead";                     // DBTYPE_WVARCHAR     

	var GAME_OBJECTEVENTDEF_TRIGGCHECKSCRIPT              =11;  
	var GAME_OBJECTEVENTDEF_TRIGGCHECKSCRIPT_STR          ="TriggCheckScript";           // DBTYPE_WVARCHAR     是否允许拾取道具的检查条件。必须是一个bool表达式

	var GAME_OBJECTEVENTDEF_TRIGGINSCRIPT                 =12;  
	var GAME_OBJECTEVENTDEF_TRIGGINSCRIPT_STR             ="TriggInScript";              // DBTYPE_WVARCHAR     进入时候调用的脚本

	var GAME_OBJECTEVENTDEF_TRIGGOUTSCRIPT                =13;  
	var GAME_OBJECTEVENTDEF_TRIGGOUTSCRIPT_STR            ="TriggOutScript";             // DBTYPE_WVARCHAR     离开的时候调用的脚本


	var PVE_EXP                                           ="PVE_Exp";
	var GAME_PVE_EXP_PVE1                                 =0;   
	var GAME_PVE_EXP_PVE1_STR                             ="pve1";                       // DBTYPE_R4           第1名获得的经验加成

	var GAME_PVE_EXP_PVE2                                 =1;   
	var GAME_PVE_EXP_PVE2_STR                             ="pve2";                       // DBTYPE_R4           第2名获得的经验加成

	var GAME_PVE_EXP_PVE3                                 =2;   
	var GAME_PVE_EXP_PVE3_STR                             ="pve3";                       // DBTYPE_R4           第3名获得的经验加成

	var GAME_PVE_EXP_PVE4                                 =3;   
	var GAME_PVE_EXP_PVE4_STR                             ="pve4";                       // DBTYPE_R4           第4名获得的经验加成

	var GAME_PVE_EXP_PVE5                                 =4;   
	var GAME_PVE_EXP_PVE5_STR                             ="pve5";                       // DBTYPE_R4           第5名获得的经验加成

	var GAME_PVE_EXP_PVE6                                 =5;   
	var GAME_PVE_EXP_PVE6_STR                             ="pve6";                       // DBTYPE_R4           第6名获得的经验加成


	var PVP_EXP                                           ="PVP_Exp";
	var GAME_PVP_EXP_LEVEL_USER                           =0;   
	var GAME_PVP_EXP_LEVEL_USER_STR                       ="level_user";                 // DBTYPE_I4           参与玩家的平均等级

	var GAME_PVP_EXP_SINGLE1                              =1;   
	var GAME_PVP_EXP_SINGLE1_STR                          ="single1";                    // DBTYPE_I4           第1名获得的经验

	var GAME_PVP_EXP_SINGLE2                              =2;   
	var GAME_PVP_EXP_SINGLE2_STR                          ="single2";                    // DBTYPE_I4           第2名获得的经验

	var GAME_PVP_EXP_SINGLE3                              =3;   
	var GAME_PVP_EXP_SINGLE3_STR                          ="single3";                    // DBTYPE_I4           第3名获得的经验

	var GAME_PVP_EXP_SINGLE4                              =4;   
	var GAME_PVP_EXP_SINGLE4_STR                          ="single4";                    // DBTYPE_I4           第4名获得的经验

	var GAME_PVP_EXP_SINGLE5                              =5;   
	var GAME_PVP_EXP_SINGLE5_STR                          ="single5";                    // DBTYPE_I4           第5名获得的经验

	var GAME_PVP_EXP_SINGLE6                              =6;   
	var GAME_PVP_EXP_SINGLE6_STR                          ="single6";                    // DBTYPE_I4           第6名获得的经验

	var GAME_PVP_EXP_TEAM21                               =7;   
	var GAME_PVP_EXP_TEAM21_STR                           ="team21";                     // DBTYPE_I4           2v2第1的经验

	var GAME_PVP_EXP_TEAM22                               =8;   
	var GAME_PVP_EXP_TEAM22_STR                           ="team22";                     // DBTYPE_I4           2v2第2的经验

	var GAME_PVP_EXP_TEAM31                               =9;   
	var GAME_PVP_EXP_TEAM31_STR                           ="team31";                     // DBTYPE_I4           3v3第1的经验

	var GAME_PVP_EXP_TEAM32                               =10;  
	var GAME_PVP_EXP_TEAM32_STR                           ="team32";                     // DBTYPE_I4           3v3第2的经验


	var PVP_MONEY                                         ="PVP_Money";
	var GAME_PVP_MONEY_SINGLE1                            =0;   
	var GAME_PVP_MONEY_SINGLE1_STR                        ="single1";                    // DBTYPE_I4           第1名获得的金钱

	var GAME_PVP_MONEY_SINGLE2                            =1;   
	var GAME_PVP_MONEY_SINGLE2_STR                        ="single2";                    // DBTYPE_I4           第2名获得的金钱

	var GAME_PVP_MONEY_SINGLE3                            =2;   
	var GAME_PVP_MONEY_SINGLE3_STR                        ="single3";                    // DBTYPE_I4           第3名获得的金钱

	var GAME_PVP_MONEY_SINGLE4                            =3;   
	var GAME_PVP_MONEY_SINGLE4_STR                        ="single4";                    // DBTYPE_I4           第4名获得的金钱

	var GAME_PVP_MONEY_SINGLE5                            =4;   
	var GAME_PVP_MONEY_SINGLE5_STR                        ="single5";                    // DBTYPE_I4           第5名获得的金钱

	var GAME_PVP_MONEY_SINGLE6                            =5;   
	var GAME_PVP_MONEY_SINGLE6_STR                        ="single6";                    // DBTYPE_I4           第6名获得的金钱

	var GAME_PVP_MONEY_TEAM21                             =6;   
	var GAME_PVP_MONEY_TEAM21_STR                         ="team21";                     // DBTYPE_I4           2v2第1的金钱

	var GAME_PVP_MONEY_TEAM22                             =7;   
	var GAME_PVP_MONEY_TEAM22_STR                         ="team22";                     // DBTYPE_I4           2v2第2的金钱

	var GAME_PVP_MONEY_TEAM31                             =8;   
	var GAME_PVP_MONEY_TEAM31_STR                         ="team31";                     // DBTYPE_I4           3v3第1的金钱

	var GAME_PVP_MONEY_TEAM32                             =9;   
	var GAME_PVP_MONEY_TEAM32_STR                         ="team32";                     // DBTYPE_I4           3v3第2的金钱


	var PVP_PK                                            ="PVP_PK";
	var GAME_PVP_PK_LEVEL_USER                            =0;   
	var GAME_PVP_PK_LEVEL_USER_STR                        ="level_user";                 // DBTYPE_I4           参与玩家的平均等级

	var GAME_PVP_PK_SINGLE1                               =1;   
	var GAME_PVP_PK_SINGLE1_STR                           ="single1";                    // DBTYPE_I4           第1名获得的PK点

	var GAME_PVP_PK_SINGLE2                               =2;   
	var GAME_PVP_PK_SINGLE2_STR                           ="single2";                    // DBTYPE_I4           第2名获得的PK点

	var GAME_PVP_PK_SINGLE3                               =3;   
	var GAME_PVP_PK_SINGLE3_STR                           ="single3";                    // DBTYPE_I4           第3名获得的PK点

	var GAME_PVP_PK_SINGLE4                               =4;   
	var GAME_PVP_PK_SINGLE4_STR                           ="single4";                    // DBTYPE_I4           第4名获得的PK点

	var GAME_PVP_PK_SINGLE5                               =5;   
	var GAME_PVP_PK_SINGLE5_STR                           ="single5";                    // DBTYPE_I4           第5名获得的PK点

	var GAME_PVP_PK_SINGLE6                               =6;   
	var GAME_PVP_PK_SINGLE6_STR                           ="single6";                    // DBTYPE_I4           第6名获得的PK点

	var GAME_PVP_PK_TEAM21                                =7;   
	var GAME_PVP_PK_TEAM21_STR                            ="team21";                     // DBTYPE_I4           2v2第1的PK点

	var GAME_PVP_PK_TEAM22                                =8;   
	var GAME_PVP_PK_TEAM22_STR                            ="team22";                     // DBTYPE_I4           2v2第2的PK点

	var GAME_PVP_PK_TEAM31                                =9;   
	var GAME_PVP_PK_TEAM31_STR                            ="team31";                     // DBTYPE_I4           3v3第1的PK点

	var GAME_PVP_PK_TEAM32                                =10;  
	var GAME_PVP_PK_TEAM32_STR                            ="team32";                     // DBTYPE_I4           3v3第2的PK点


	var PVP_SP                                            ="PVP_Sp";
	var GAME_PVP_SP_LEVEL_USER                            =0;   
	var GAME_PVP_SP_LEVEL_USER_STR                        ="level_user";                 // DBTYPE_I4           参与玩家的平均等级

	var GAME_PVP_SP_SINGLE1                               =1;   
	var GAME_PVP_SP_SINGLE1_STR                           ="single1";                    // DBTYPE_I4           第1名获得的技能点

	var GAME_PVP_SP_SINGLE2                               =2;   
	var GAME_PVP_SP_SINGLE2_STR                           ="single2";                    // DBTYPE_I4           第2名获得的技能点

	var GAME_PVP_SP_SINGLE3                               =3;   
	var GAME_PVP_SP_SINGLE3_STR                           ="single3";                    // DBTYPE_I4           第3名获得的技能点

	var GAME_PVP_SP_SINGLE4                               =4;   
	var GAME_PVP_SP_SINGLE4_STR                           ="single4";                    // DBTYPE_I4           第4名获得的技能点

	var GAME_PVP_SP_SINGLE5                               =5;   
	var GAME_PVP_SP_SINGLE5_STR                           ="single5";                    // DBTYPE_I4           第5名获得的技能点

	var GAME_PVP_SP_SINGLE6                               =6;   
	var GAME_PVP_SP_SINGLE6_STR                           ="single6";                    // DBTYPE_I4           第6名获得的技能点

	var GAME_PVP_SP_TEAM21                                =7;   
	var GAME_PVP_SP_TEAM21_STR                            ="team21";                     // DBTYPE_I4           2v2第1的技能点

	var GAME_PVP_SP_TEAM22                                =8;   
	var GAME_PVP_SP_TEAM22_STR                            ="team22";                     // DBTYPE_I4           2v2第2的技能点

	var GAME_PVP_SP_TEAM31                                =9;   
	var GAME_PVP_SP_TEAM31_STR                            ="team31";                     // DBTYPE_I4           3v3第1的技能点

	var GAME_PVP_SP_TEAM32                                =10;  
	var GAME_PVP_SP_TEAM32_STR                            ="team32";                     // DBTYPE_I4           3v3第2的技能点


	var RANKENCOURAGE                                     ="RankEncourage";
	var GAME_RANKENCOURAGE_ID                             =0;   
	var GAME_RANKENCOURAGE_ID_STR                         ="id";                         // DBTYPE_I4           

	var GAME_RANKENCOURAGE_NUM                            =1;   
	var GAME_RANKENCOURAGE_NUM_STR                        ="num";                        // DBTYPE_I4           这个评价获得的经验,金币比,100表示无奖励惩罚

	var GAME_RANKENCOURAGE_MARK                           =2;   
	var GAME_RANKENCOURAGE_MARK_STR                       ="mark";                       // DBTYPE_WVARCHAR     描述


	var TASK                                              ="Task";
	var GAME_TASK_TASKID                                  =0;   
	var GAME_TASK_TASKID_STR                              ="TaskId";                     // DBTYPE_I4           0

	var GAME_TASK_TASKTYPE                                =1;   
	var GAME_TASK_TASKTYPE_STR                            ="TaskType";                   // DBTYPE_I4           1 任务类型                0:普通任务     1:日常任务     2：     3：无限任务     4：假条件任务

	var GAME_TASK_TASKTYPENAME                            =2;   
	var GAME_TASK_TASKTYPENAME_STR                        ="TaskTypeName";               // DBTYPE_I4           1:日常 2:训练 3:新手 4:闯关 5:5分钟时限 6:8分钟时限 7:普通 8:家族日常 9:节日任务 10:密友任务 11:情侣任务

	var GAME_TASK_TASKNAME                                =3;   
	var GAME_TASK_TASKNAME_STR                            ="TaskName";                   // DBTYPE_WVARCHAR     3 任务名称

	var GAME_TASK_TASKDES                                 =4;   
	var GAME_TASK_TASKDES_STR                             ="TaskDes";                    // DBTYPE_WVARCHAR     4 任务描述

	var GAME_TASK_COMPLETETASKDES                         =5;   
	var GAME_TASK_COMPLETETASKDES_STR                     ="CompleteTaskDes";            // DBTYPE_WVARCHAR     5 完成任务后的描述

	var GAME_TASK_TARGETDES                               =6;   
	var GAME_TASK_TARGETDES_STR                           ="TargetDes";                  // DBTYPE_WVARCHAR     6 任务目标说明

	var GAME_TASK_TARGET                                  =7;   
	var GAME_TASK_TARGET_STR                              ="Target";                     // DBTYPE_WVARCHAR     7 任务目标

	var GAME_TASK_TASKLOADMAP                             =8;   
	var GAME_TASK_TASKLOADMAP_STR                         ="TaskLoadMap";                // DBTYPE_I4           8 接任务时所在的NPCID

	var GAME_TASK_SUBMITNPCID                             =9;   
	var GAME_TASK_SUBMITNPCID_STR                         ="SubmitNpcID";                // DBTYPE_I4           9 交任务时所在的NPCID

	var GAME_TASK_TASKINPECT                              =10;  
	var GAME_TASK_TASKINPECT_STR                          ="TaskInpect";                 // DBTYPE_WVARCHAR     10 接受任务触发

	var GAME_TASK_TASKEVENT                               =11;  
	var GAME_TASK_TASKEVENT_STR                           ="TaskEvent";                  // DBTYPE_WVARCHAR     11 任务所需消息

	var GAME_TASK_EVNETCOUNT                              =12;  
	var GAME_TASK_EVNETCOUNT_STR                          ="EvnetCount";                 // DBTYPE_I4           12 完成任务事件总数(显示用)

	var GAME_TASK_TASKOVERSP                              =13;  
	var GAME_TASK_TASKOVERSP_STR                          ="TaskOverSp";                 // DBTYPE_WVARCHAR     13 完成任务脚本触发

	var GAME_TASK_TASKQUITSP                              =14;  
	var GAME_TASK_TASKQUITSP_STR                          ="TaskQuitSp";                 // DBTYPE_WVARCHAR     14 退出任务脚本触发

	var GAME_TASK_TASKTREM                                =15;  
	var GAME_TASK_TASKTREM_STR                            ="TaskTrem";                   // DBTYPE_WVARCHAR     15 前置任务（添前置任务ID）

	var GAME_TASK_TASKITREM                               =16;  
	var GAME_TASK_TASKITREM_STR                           ="TaskITrem";                  // DBTYPE_WVARCHAR     16 接受任务所需条件

	var GAME_TASK_TASKCONDITIONS                          =17;  
	var GAME_TASK_TASKCONDITIONS_STR                      ="TaskConditions";             // DBTYPE_I4           17 任务接受条件(显示用)

	var GAME_TASK_TASKAWARD                               =18;  
	var GAME_TASK_TASKAWARD_STR                           ="TaskAward";                  // DBTYPE_WVARCHAR     18 任务奖励                物品ID （10000；钱 10001点券 10002经验 10004亲密度）

	var GAME_TASK_TASKPRIZE                               =19;  
	var GAME_TASK_TASKPRIZE_STR                           ="TaskPrize";                  // DBTYPE_WVARCHAR     19 任务完成奖励(显示用)    -1代表钱 -2 代表经验 -4代表点券，-5代表贡献点，-6代表亲密度，这些必须在物品前面，-3代表物品 -1:100:-2:500:-3:1010001:2:1010008:3

	var GAME_TASK_TASKCHOICEPRIZE                         =20;  
	var GAME_TASK_TASKCHOICEPRIZE_STR                     ="TaskChoicePrize";            // DBTYPE_WVARCHAR     20 任务完成可选奖励(显示和服务器都用)    -1代表钱 -2 代表经验 -3代表物品 -4 代表亲密度 -1:100:-2:500:-4200：-3:1010001:2:1010008:3

	var GAME_TASK_TASKPUNISH                              =21;  
	var GAME_TASK_TASKPUNISH_STR                          ="TaskPunish";                 // DBTYPE_WVARCHAR     21 任务未完成惩罚(显示用)

	var GAME_TASK_TASKCANIN                               =22;  
	var GAME_TASK_TASKCANIN_STR                           ="TaskCanIn";                  // DBTYPE_BOOL         22 当前版本是否可以接受

	var GAME_TASK_TASKF                                   =23;  
	var GAME_TASK_TASKF_STR                               ="TaskF";                      // DBTYPE_I4           23 刷新用(显示用)

	var GAME_TASK_TASKCMD                                 =24;  
	var GAME_TASK_TASKCMD_STR                             ="TaskCmd";                    // DBTYPE_WVARCHAR     24 接到任务时 客户端 脚本触发

	var GAME_TASK_AUTO                                    =25;  
	var GAME_TASK_AUTO_STR                                ="Auto";                       // DBTYPE_I4           25 1.此任务上线时自动接

	var GAME_TASK_TASKNOTSHOWLV                           =26;  
	var GAME_TASK_TASKNOTSHOWLV_STR                       ="TaskNotShowLv";              // DBTYPE_I4           26.任务达到这个等级不显示

	var GAME_TASK_RANDOMTASK                              =27;  
	var GAME_TASK_RANDOMTASK_STR                          ="RandomTask";                 // DBTYPE_WVARCHAR     27.随机任务的id

	var GAME_TASK_RTASKNAME                               =28;  
	var GAME_TASK_RTASKNAME_STR                           ="RTaskName";                  // DBTYPE_WVARCHAR     28 任务名称

	var GAME_TASK_RTASKDES                                =29;  
	var GAME_TASK_RTASKDES_STR                            ="RTaskDes";                   // DBTYPE_WVARCHAR     29 任务描述

	var GAME_TASK_RTARGET                                 =30;  
	var GAME_TASK_RTARGET_STR                             ="RTarget";                    // DBTYPE_WVARCHAR     30 任务目标

	var GAME_TASK_REVNETCOUNT                             =31;  
	var GAME_TASK_REVNETCOUNT_STR                         ="REvnetCount";                // DBTYPE_I4           31 完成任务事件总数

	var GAME_TASK_FAMILYLV                                =32;  
	var GAME_TASK_FAMILYLV_STR                            ="FamilyLv";                   // DBTYPE_I4           32 家族等级 1-10对应家族等级1-10级

	var GAME_TASK_FAMILYQX                                =33;  
	var GAME_TASK_FAMILYQX_STR                            ="FamilyQX";                   // DBTYPE_I4           33 家族权限  1:族长  2:管理员  3:普通成员

	var GAME_TASK_CTASKEVENT                              =34;  
	var GAME_TASK_CTASKEVENT_STR                          ="CTaskEvent";                 // DBTYPE_WVARCHAR     34 任务各状态下的事件，格式：1:func1();2:func2();   1为接受任务状态，2为完成任务状态，3为提交任务状态

	var GAME_TASK_ALLOWSTARTTM                            =35;  
	var GAME_TASK_ALLOWSTARTTM_STR                        ="AllowStartTm";               // DBTYPE_WVARCHAR     35 任务可以接和交的起始时间,开始时间的格式：月-日-小时-分-秒

	var GAME_TASK_DURATIVETM                              =36;  
	var GAME_TASK_DURATIVETM_STR                          ="DurativeTm";                 // DBTYPE_I4           36 任务持续时间,单位小时

	var GAME_TASK_LOVERLEVEL                              =37;  
	var GAME_TASK_LOVERLEVEL_STR                          ="LoverLevel";                 // DBTYPE_I4           37 情侣任务可接等级

	var GAME_TASK_LTASKNOTSHOWLE                          =38;  
	var GAME_TASK_LTASKNOTSHOWLE_STR                      ="LTaskNotshowLe";             // DBTYPE_I4           38 情侣任务可见等级

	var GAME_TASK_TARGETDES1                              =39;  
	var GAME_TASK_TARGETDES1_STR                          ="TargetDes1";                 // DBTYPE_WVARCHAR     39 任务目标说明1


	var TASKSYNDATA                                       ="TaskSynData";
	var GAME_TASKSYNDATA_TASKID                           =0;   
	var GAME_TASKSYNDATA_TASKID_STR                       ="TaskID";                     // DBTYPE_I4           0

	var GAME_TASKSYNDATA_TASKTYPE                         =1;   
	var GAME_TASKSYNDATA_TASKTYPE_STR                     ="TaskType";                   // DBTYPE_I4           1 任务类型 0:普通任务

	var GAME_TASKSYNDATA_STATE                            =2;   
	var GAME_TASKSYNDATA_STATE_STR                        ="State";                      // DBTYPE_I4           2 数据状态 0:未完成 1:已经完成 2:已经提交或已放弃

	var GAME_TASKSYNDATA_EVENTCOUNT                       =3;   
	var GAME_TASKSYNDATA_EVENTCOUNT_STR                   ="EventCount";                 // DBTYPE_I4           3 事件触发次数


	var TASKUI                                            ="TaskUI";
	var GAME_TASKUI_TASKID                                =0;   
	var GAME_TASKUI_TASKID_STR                            ="TaskID";                     // DBTYPE_I4           任务的ID

	var GAME_TASKUI_NAME                                  =1;   
	var GAME_TASKUI_NAME_STR                              ="Name";                       // DBTYPE_WVARCHAR     任务名称

	var GAME_TASKUI_SHOW                                  =2;   
	var GAME_TASKUI_SHOW_STR                              ="Show";                       // DBTYPE_BOOL         是否显示。界面程序要监视此值的变化

	var GAME_TASKUI_TASK1                                 =3;   
	var GAME_TASKUI_TASK1_STR                             ="Task1";                      // DBTYPE_WVARCHAR     分支任务1

	var GAME_TASKUI_PARAM1                                =4;   
	var GAME_TASKUI_PARAM1_STR                            ="Param1";                     // DBTYPE_I4           当前进度-分支任务1

	var GAME_TASKUI_PARAM2                                =5;   
	var GAME_TASKUI_PARAM2_STR                            ="Param2";                     // DBTYPE_I4           总进度-分支任务1

	var GAME_TASKUI_TASK2                                 =6;   
	var GAME_TASKUI_TASK2_STR                             ="Task2";                      // DBTYPE_WVARCHAR     分支任务1

	var GAME_TASKUI_PARAM3                                =7;   
	var GAME_TASKUI_PARAM3_STR                            ="Param3";                     // DBTYPE_I4           当前进度-分支任务1

	var GAME_TASKUI_PARAM4                                =8;   
	var GAME_TASKUI_PARAM4_STR                            ="Param4";                     // DBTYPE_I4           总进度-分支任务1

	var GAME_TASKUI_SUCCESSORFAIL                         =9;   
	var GAME_TASKUI_SUCCESSORFAIL_STR                     ="SuccessOrFail";              // DBTYPE_I4           任务完成与否


	var TRAININGUI                                        ="TrainingUI";
	var GAME_TRAININGUI_UID                               =0;   
	var GAME_TRAININGUI_UID_STR                           ="UID";                        // DBTYPE_I4           每一个UID对应一个固定的界面，下面的参数对每一个固定的界面都有固定的意义

	var GAME_TRAININGUI_NAME                              =1;   
	var GAME_TRAININGUI_NAME_STR                          ="Name";                       // DBTYPE_WVARCHAR     界面名称，给人看得

	var GAME_TRAININGUI_SHOW                              =2;   
	var GAME_TRAININGUI_SHOW_STR                          ="Show";                       // DBTYPE_BOOL         是否显示。界面程序要监视此值的变化

	var GAME_TRAININGUI_TEXT                              =3;   
	var GAME_TRAININGUI_TEXT_STR                          ="Text";                       // DBTYPE_WVARCHAR     界面的文本。先固定死，如果不行，以后改成索引

	var GAME_TRAININGUI_PARAM1                            =4;   
	var GAME_TRAININGUI_PARAM1_STR                        ="Param1";                     // DBTYPE_I4           第一个参数。界面程序要监视此值的变化

	var GAME_TRAININGUI_PARAM2                            =5;   
	var GAME_TRAININGUI_PARAM2_STR                        ="Param2";                     // DBTYPE_I4           

	var GAME_TRAININGUI_PARAM3                            =6;   
	var GAME_TRAININGUI_PARAM3_STR                        ="Param3";                     // DBTYPE_I4           

	var GAME_TRAININGUI_PARAM4                            =7;   
	var GAME_TRAININGUI_PARAM4_STR                        ="Param4";                     // DBTYPE_I4           


	var USEODDSITEM                                       ="UseOddsItem";
	var GAME_USEODDSITEM_CID                              =0;   
	var GAME_USEODDSITEM_CID_STR                          ="cid";                        // DBTYPE_I4           0 cid概率物品的ID

	var GAME_USEODDSITEM_STARTDIALOG                      =1;   
	var GAME_USEODDSITEM_STARTDIALOG_STR                  ="StartDialog";                // DBTYPE_I4           1 双击物品时的对话框ID

	var GAME_USEODDSITEM_CANCELDIALOG                     =2;   
	var GAME_USEODDSITEM_CANCELDIALOG_STR                 ="CancelDialog";               // DBTYPE_I4           2 取消使用时的对话框ID

	var GAME_USEODDSITEM_ODDS1                            =3;   
	var GAME_USEODDSITEM_ODDS1_STR                        ="Odds1";                      // DBTYPE_I4           3 概率1 (概率1+概率2+概率3+概率4+概率5=100)

	var GAME_USEODDSITEM_ODDS1EVENT                       =4;   
	var GAME_USEODDSITEM_ODDS1EVENT_STR                   ="Odds1Event";                 // DBTYPE_WVARCHAR     4 概率1分支时触发

	var GAME_USEODDSITEM_ODDS1DIALOG                      =5;   
	var GAME_USEODDSITEM_ODDS1DIALOG_STR                  ="Odds1Dialog";                // DBTYPE_I4           5 概率1分支时的对话框ID

	var GAME_USEODDSITEM_ODDS1MESSAGE                     =6;   
	var GAME_USEODDSITEM_ODDS1MESSAGE_STR                 ="Odds1Message";               // DBTYPE_WVARCHAR     6 概率1分支时广播的消息

	var GAME_USEODDSITEM_ODDS2                            =7;   
	var GAME_USEODDSITEM_ODDS2_STR                        ="Odds2";                      // DBTYPE_I4           7 概率2

	var GAME_USEODDSITEM_ODDS2EVENT                       =8;   
	var GAME_USEODDSITEM_ODDS2EVENT_STR                   ="Odds2Event";                 // DBTYPE_WVARCHAR     8 概率2分支时触发

	var GAME_USEODDSITEM_ODDS2DIALOG                      =9;   
	var GAME_USEODDSITEM_ODDS2DIALOG_STR                  ="Odds2Dialog";                // DBTYPE_I4           9 概率2分支时的对话框ID

	var GAME_USEODDSITEM_ODDS2MESSAGE                     =10;  
	var GAME_USEODDSITEM_ODDS2MESSAGE_STR                 ="Odds2Message";               // DBTYPE_WVARCHAR     10 概率2分支时广播的消息

	var GAME_USEODDSITEM_ODDS3                            =11;  
	var GAME_USEODDSITEM_ODDS3_STR                        ="Odds3";                      // DBTYPE_I4           11 概率3

	var GAME_USEODDSITEM_ODDS3EVENT                       =12;  
	var GAME_USEODDSITEM_ODDS3EVENT_STR                   ="Odds3Event";                 // DBTYPE_WVARCHAR     12 概率3分支时触发

	var GAME_USEODDSITEM_ODDS3DIALOG                      =13;  
	var GAME_USEODDSITEM_ODDS3DIALOG_STR                  ="Odds3Dialog";                // DBTYPE_I4           13 概率3分支时的对话框ID

	var GAME_USEODDSITEM_ODDS3MESSAGE                     =14;  
	var GAME_USEODDSITEM_ODDS3MESSAGE_STR                 ="Odds3Message";               // DBTYPE_WVARCHAR     14 概率3分支时广播的消息

	var GAME_USEODDSITEM_ODDS4                            =15;  
	var GAME_USEODDSITEM_ODDS4_STR                        ="Odds4";                      // DBTYPE_I4           15 概率4

	var GAME_USEODDSITEM_ODDS4EVENT                       =16;  
	var GAME_USEODDSITEM_ODDS4EVENT_STR                   ="Odds4Event";                 // DBTYPE_WVARCHAR     16 概率4分支时触发

	var GAME_USEODDSITEM_ODDS4DIALOG                      =17;  
	var GAME_USEODDSITEM_ODDS4DIALOG_STR                  ="Odds4Dialog";                // DBTYPE_I4           17 概率4分支时的对话框ID

	var GAME_USEODDSITEM_ODDS4MESSAGE                     =18;  
	var GAME_USEODDSITEM_ODDS4MESSAGE_STR                 ="Odds4Message";               // DBTYPE_WVARCHAR     18 概率4分支时广播的消息

	var GAME_USEODDSITEM_ODDS5                            =19;  
	var GAME_USEODDSITEM_ODDS5_STR                        ="Odds5";                      // DBTYPE_I4           19 概率5

	var GAME_USEODDSITEM_ODDS5EVENT                       =20;  
	var GAME_USEODDSITEM_ODDS5EVENT_STR                   ="Odds5Event";                 // DBTYPE_WVARCHAR     20 概率5分支时触发

	var GAME_USEODDSITEM_ODDS5DIALOG                      =21;  
	var GAME_USEODDSITEM_ODDS5DIALOG_STR                  ="Odds5Dialog";                // DBTYPE_I4           21 概率5分支时的对话框

	var GAME_USEODDSITEM_ODDS5MESSAGE                     =22;  
	var GAME_USEODDSITEM_ODDS5MESSAGE_STR                 ="Odds5Message";               // DBTYPE_WVARCHAR     22 概率5分支时广播的消息

}
