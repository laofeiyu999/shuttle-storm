// 创建日期:2011/5/16 18:26:51
// Access文件名:E:\VnetProject2010\project4\tennis\data\mdb\Tennis_Game.mdb

set window
{
	var TENNIS_GAME                                       ="Tennis_Game.mdb";

	var ALLPRESENT                                        ="AllPresent";
	var TENNIS_GAME_ALLPRESENT_ID                         =0;   
	var TENNIS_GAME_ALLPRESENT_ID_STR                     ="id";                         // DBTYPE_I4           

	var TENNIS_GAME_ALLPRESENT_AWARDNAME                  =1;   
	var TENNIS_GAME_ALLPRESENT_AWARDNAME_STR              ="awardname";                  // DBTYPE_WVARCHAR     奖励的名称或者原因

	var TENNIS_GAME_ALLPRESENT_GOODS1                     =2;   
	var TENNIS_GAME_ALLPRESENT_GOODS1_STR                 ="goods1";                     // DBTYPE_WVARCHAR     到时长时送的礼品,物品奖励-男 格式:"物品ID,数量,有效期序号(0,1,2)";多个以分号隔开

	var TENNIS_GAME_ALLPRESENT_GOODS2                     =3;   
	var TENNIS_GAME_ALLPRESENT_GOODS2_STR                 ="goods2";                     // DBTYPE_WVARCHAR     到时长时送的礼品,物品奖励-女 格式:"物品ID,数量,有效期序号(0,1,2)";多个以分号隔开

	var TENNIS_GAME_ALLPRESENT_SENDNAME                   =4;   
	var TENNIS_GAME_ALLPRESENT_SENDNAME_STR               ="sendname";                   // DBTYPE_WVARCHAR     赠送者

	var TENNIS_GAME_ALLPRESENT_SENDWORD                   =5;   
	var TENNIS_GAME_ALLPRESENT_SENDWORD_STR               ="sendword";                   // DBTYPE_WVARCHAR     赠送时的留言

	var TENNIS_GAME_ALLPRESENT_REMARK                     =6;   
	var TENNIS_GAME_ALLPRESENT_REMARK_STR                 ="remark";                     // DBTYPE_WVARCHAR     备注说明


	var FAMILYBADGEINFO                                   ="FamilyBadgeInfo";
	var TENNIS_GAME_FAMILYBADGEINFO_BADGEID               =0;   
	var TENNIS_GAME_FAMILYBADGEINFO_BADGEID_STR           ="BadgeID";                    // DBTYPE_I4           

	var TENNIS_GAME_FAMILYBADGEINFO_BADGEFLAG             =1;   
	var TENNIS_GAME_FAMILYBADGEINFO_BADGEFLAG_STR         ="BadgeFlag";                  // DBTYPE_I4           徽章内框或外框的标志，1为外框，2为内框

	var TENNIS_GAME_FAMILYBADGEINFO_BADGELEVEL            =2;   
	var TENNIS_GAME_FAMILYBADGEINFO_BADGELEVEL_STR        ="BadgeLevel";                 // DBTYPE_I4           徽章等级

	var TENNIS_GAME_FAMILYBADGEINFO_BADAGEINDEX           =3;   
	var TENNIS_GAME_FAMILYBADGEINFO_BADAGEINDEX_STR       ="BadageIndex";                // DBTYPE_I4           徽章图片索引


	var GAMEARGS                                          ="GameArgs";
	var TENNIS_GAME_GAMEARGS_GAMEARGS                     =0;   
	var TENNIS_GAME_GAMEARGS_GAMEARGS_STR                 ="GameArgs";                   // DBTYPE_I4           游戏参数

	var TENNIS_GAME_GAMEARGS_MINLOBHEIGHT                 =1;   
	var TENNIS_GAME_GAMEARGS_MINLOBHEIGHT_STR             ="MinLobHeight";               // DBTYPE_R4           最低扣杀高度

	var TENNIS_GAME_GAMEARGS_MAXHITHEIGHT                 =2;   
	var TENNIS_GAME_GAMEARGS_MAXHITHEIGHT_STR             ="MaxHitHeight";               // DBTYPE_R4           最高击球高度

	var TENNIS_GAME_GAMEARGS_MAXHITDIS                    =3;   
	var TENNIS_GAME_GAMEARGS_MAXHITDIS_STR                ="MaxHitDis";                  // DBTYPE_R4           最远击球距离

	var TENNIS_GAME_GAMEARGS_NORHITDIS                    =4;   
	var TENNIS_GAME_GAMEARGS_NORHITDIS_STR                ="NorHitDis";                  // DBTYPE_R4           正常击球距离

	var TENNIS_GAME_GAMEARGS_AGGRESSIVESKILLHITWIDTH      =5;   
	var TENNIS_GAME_GAMEARGS_AGGRESSIVESKILLHITWIDTH_STR  ="AggressiveSkillHitWidth";    // DBTYPE_R4           进攻技能打击距离(x)

	var TENNIS_GAME_GAMEARGS_AGGRESSIVESKILLFRONT         =6;   
	var TENNIS_GAME_GAMEARGS_AGGRESSIVESKILLFRONT_STR     ="AggressiveSkillFront";       // DBTYPE_R4           进攻技能打击距离(z)

	var TENNIS_GAME_GAMEARGS_DEFENSIVESKILLHITWIDTH       =7;   
	var TENNIS_GAME_GAMEARGS_DEFENSIVESKILLHITWIDTH_STR   ="DefensiveSkillHitWidth";     // DBTYPE_R4           防守技能打击距离(x)

	var TENNIS_GAME_GAMEARGS_DEFENSIVESKILLFRONT          =8;   
	var TENNIS_GAME_GAMEARGS_DEFENSIVESKILLFRONT_STR      ="DefensiveSkillFront";        // DBTYPE_R4           防守技能打击距离(z)

	var TENNIS_GAME_GAMEARGS_FLASHDIS                     =9;   
	var TENNIS_GAME_GAMEARGS_FLASHDIS_STR                 ="FlashDis";                   // DBTYPE_R4           击球的允许闪烁距离, 只记x向

	var TENNIS_GAME_GAMEARGS_SKILLMOVETIME                =10;  
	var TENNIS_GAME_GAMEARGS_SKILLMOVETIME_STR            ="SkillMoveTime";              // DBTYPE_I4           技能移动的时间

	var TENNIS_GAME_GAMEARGS_SKILLSHIELDCTRLTIME          =11;  
	var TENNIS_GAME_GAMEARGS_SKILLSHIELDCTRLTIME_STR      ="SkillShieldCtrlTime";        // DBTYPE_I4           技能屏蔽按键从技能开始的时间

	var TENNIS_GAME_GAMEARGS_SKILLRECOVERCTRLTIME         =12;  
	var TENNIS_GAME_GAMEARGS_SKILLRECOVERCTRLTIME_STR     ="SkillRecoverCtrlTime";       // DBTYPE_I4           技能恢复按键距离击球的时间

	var TENNIS_GAME_GAMEARGS_LOSTHITMAXDIS                =13;  
	var TENNIS_GAME_GAMEARGS_LOSTHITMAXDIS_STR            ="LostHitMaxDis";              // DBTYPE_R4           挥空拍的最远距离

	var TENNIS_GAME_GAMEARGS_MAXREFLECTHEIGHT             =14;  
	var TENNIS_GAME_GAMEARGS_MAXREFLECTHEIGHT_STR         ="MaxReflectHeight";           // DBTYPE_R4           挥空拍的最高高度


	var GAMEENDPRESENT                                    ="GameEndPresent";
	var TENNIS_GAME_GAMEENDPRESENT_ID                     =0;   
	var TENNIS_GAME_GAMEENDPRESENT_ID_STR                 ="id";                         // DBTYPE_I4           id从1开始,依次递增

	var TENNIS_GAME_GAMEENDPRESENT_PRESENTID              =1;   
	var TENNIS_GAME_GAMEENDPRESENT_PRESENTID_STR          ="presentid";                  // DBTYPE_I4           礼品id

	var TENNIS_GAME_GAMEENDPRESENT_GUIDEID                =2;   
	var TENNIS_GAME_GAMEENDPRESENT_GUIDEID_STR            ="guideid";                    // DBTYPE_I4           触发的引导id

	var TENNIS_GAME_GAMEENDPRESENT_REMARK                 =3;   
	var TENNIS_GAME_GAMEENDPRESENT_REMARK_STR             ="remark";                     // DBTYPE_WVARCHAR     备注说明


	var GAMEPATH                                          ="GamePath";
	var TENNIS_GAME_GAMEPATH_INDEX                        =0;   
	var TENNIS_GAME_GAMEPATH_INDEX_STR                    ="index";                      // DBTYPE_I4           索引

	var TENNIS_GAME_GAMEPATH_DESCRIPTION                  =1;   
	var TENNIS_GAME_GAMEPATH_DESCRIPTION_STR              ="description";                // DBTYPE_WVARCHAR     描述

	var TENNIS_GAME_GAMEPATH_PATH                         =2;   
	var TENNIS_GAME_GAMEPATH_PATH_STR                     ="path";                       // DBTYPE_WVARCHAR     路径


	var GROUNDINFO                                        ="GroundInfo";
	var TENNIS_GAME_GROUNDINFO_AUTOID                     =0;   
	var TENNIS_GAME_GROUNDINFO_AUTOID_STR                 ="AutoID";                     // DBTYPE_I4           场地区域信息

	var TENNIS_GAME_GROUNDINFO_INDEX                      =1;   
	var TENNIS_GAME_GROUNDINFO_INDEX_STR                  ="index";                      // DBTYPE_I4           只搜索0

	var TENNIS_GAME_GROUNDINFO_DOUBLEWIDTH                =2;   
	var TENNIS_GAME_GROUNDINFO_DOUBLEWIDTH_STR            ="doubleWidth";                // DBTYPE_R4           双打宽度

	var TENNIS_GAME_GROUNDINFO_SINGLEWIDTH                =3;   
	var TENNIS_GAME_GROUNDINFO_SINGLEWIDTH_STR            ="singleWidth";                // DBTYPE_R4           单打宽度

	var TENNIS_GAME_GROUNDINFO_LENGTH                     =4;   
	var TENNIS_GAME_GROUNDINFO_LENGTH_STR                 ="length";                     // DBTYPE_R4           总长度

	var TENNIS_GAME_GROUNDINFO_SERVELENGTH                =5;   
	var TENNIS_GAME_GROUNDINFO_SERVELENGTH_STR            ="serveLength";                // DBTYPE_R4           发球区长度


	var INLINEPRESENT                                     ="InlinePresent";
	var TENNIS_GAME_INLINEPRESENT_ID                      =0;   
	var TENNIS_GAME_INLINEPRESENT_ID_STR                  ="id";                         // DBTYPE_I4           id从1开始,依次递增

	var TENNIS_GAME_INLINEPRESENT_INLINETIME              =1;   
	var TENNIS_GAME_INLINEPRESENT_INLINETIME_STR          ="inlinetime";                 // DBTYPE_I4           在线时长(秒)（写入每次检测用的时间，不是累计时间）

	var TENNIS_GAME_INLINEPRESENT_PRESENT                 =2;   
	var TENNIS_GAME_INLINEPRESENT_PRESENT_STR             ="present";                    // DBTYPE_WVARCHAR     礼品，格式为：礼品id1,等级下限,等级上限;[礼品id2,等级下限,等级上限......]

	var TENNIS_GAME_INLINEPRESENT_PRESENTSCRIPT           =3;   
	var TENNIS_GAME_INLINEPRESENT_PRESENTSCRIPT_STR       ="presentscript";              // DBTYPE_WVARCHAR     礼品，内容为脚本，用来增加金币，奖券和经验，与Task类似

	var TENNIS_GAME_INLINEPRESENT_SENDCHAT                =4;   
	var TENNIS_GAME_INLINEPRESENT_SENDCHAT_STR            ="sendchat";                   // DBTYPE_WVARCHAR     给玩家聊天框中提醒的文字

	var TENNIS_GAME_INLINEPRESENT_REMARK                  =5;   
	var TENNIS_GAME_INLINEPRESENT_REMARK_STR              ="remark";                     // DBTYPE_WVARCHAR     备注说明

	var TENNIS_GAME_INLINEPRESENT_STARTTIME               =6;   
	var TENNIS_GAME_INLINEPRESENT_STARTTIME_STR           ="starttime";                  // DBTYPE_DATE         起始时间，0或者空表示无起始时间限制

	var TENNIS_GAME_INLINEPRESENT_ENDTIME                 =7;   
	var TENNIS_GAME_INLINEPRESENT_ENDTIME_STR             ="endtime";                    // DBTYPE_DATE         结束时间，0或者空表示无结束时间限制

	var TENNIS_GAME_INLINEPRESENT_RESETTIME               =8;   
	var TENNIS_GAME_INLINEPRESENT_RESETTIME_STR           ="resettime";                  // DBTYPE_I4           重置时间，单位为分钟，0表示不重置

	var TENNIS_GAME_INLINEPRESENT_CONDITIONS              =9;   
	var TENNIS_GAME_INLINEPRESENT_CONDITIONS_STR          ="conditions";                 // DBTYPE_WVARCHAR     用户需满足的条件（用脚本写入，条件包括：角色等级、是否为情侣）

	var TENNIS_GAME_INLINEPRESENT_PREPRESENT              =10;  
	var TENNIS_GAME_INLINEPRESENT_PREPRESENT_STR          ="prepresent";                 // DBTYPE_I4           前置奖励（使用id字段数值）,只用在系列奖励内部表示系列内奖励的顺序关系；0 表示没有特定前置奖励，通常作为系列奖励的起始奖励

	var TENNIS_GAME_INLINEPRESENT_ISAVAILABLE             =11;  
	var TENNIS_GAME_INLINEPRESENT_ISAVAILABLE_STR         ="isavailable";                // DBTYPE_BOOL         总开关（此条奖励是否开启）

	var TENNIS_GAME_INLINEPRESENT_PRIORITY                =12;  
	var TENNIS_GAME_INLINEPRESENT_PRIORITY_STR            ="priority";                   // DBTYPE_I4           优先级，不为0的数字,数字小的优先被触发，同一系列奖励内部的奖励优先级相同，不同的系列优先级必须不同，奖励按照优先级顺序执行，如果因为其他条件不满足造成某个系列被跳过，当优先级比它更低的系列被执行后即便此时条件被满足也将不会回跳，该系列将被永久跳过


	var MAPINFO                                           ="MapInfo";
	var TENNIS_GAME_MAPINFO_MAPID                         =0;   
	var TENNIS_GAME_MAPINFO_MAPID_STR                     ="MapID";                      // DBTYPE_I4           地图ID

	var TENNIS_GAME_MAPINFO_MAPNAME                       =1;   
	var TENNIS_GAME_MAPINFO_MAPNAME_STR                   ="MapName";                    // DBTYPE_WVARCHAR     地图名称

	var TENNIS_GAME_MAPINFO_MAPDISCRIPTION                =2;   
	var TENNIS_GAME_MAPINFO_MAPDISCRIPTION_STR            ="MapDiscription";             // DBTYPE_WVARCHAR     地图描述

	var TENNIS_GAME_MAPINFO_MAPICON                       =3;   
	var TENNIS_GAME_MAPINFO_MAPICON_STR                   ="MapIcon";                    // DBTYPE_WVARCHAR     地图图标

	var TENNIS_GAME_MAPINFO_MAPXML                        =4;   
	var TENNIS_GAME_MAPINFO_MAPXML_STR                    ="MapXml";                     // DBTYPE_WVARCHAR     地图xml文件

	var TENNIS_GAME_MAPINFO_MAPSCRIPT                     =5;   
	var TENNIS_GAME_MAPINFO_MAPSCRIPT_STR                 ="MapScript";                  // DBTYPE_WVARCHAR     加载地图时运行的脚本

	var TENNIS_GAME_MAPINFO_MAPLEVEL                      =6;   
	var TENNIS_GAME_MAPINFO_MAPLEVEL_STR                  ="MapLevel";                   // DBTYPE_I4           地图等级

	var TENNIS_GAME_MAPINFO_MAPTYPE                       =7;   
	var TENNIS_GAME_MAPINFO_MAPTYPE_STR                   ="MapType";                    // DBTYPE_I4           地图类型 1.房间地图 2.游戏地图

	var TENNIS_GAME_MAPINFO_ROOMMAPID                     =8;   
	var TENNIS_GAME_MAPINFO_ROOMMAPID_STR                 ="RoomMapID";                  // DBTYPE_I4           游戏地图对应的房间地图id

	var TENNIS_GAME_MAPINFO_ROOMCAMERA                    =9;   
	var TENNIS_GAME_MAPINFO_ROOMCAMERA_STR                ="RoomCamera";                 // DBTYPE_I4           对应房间使用的摄像机id

	var TENNIS_GAME_MAPINFO_ROOMPOS1X                     =10;  
	var TENNIS_GAME_MAPINFO_ROOMPOS1X_STR                 ="RoomPos1X";                  // DBTYPE_R4           人物进入房间落地位置1的X

	var TENNIS_GAME_MAPINFO_ROOMPOS1Y                     =11;  
	var TENNIS_GAME_MAPINFO_ROOMPOS1Y_STR                 ="RoomPos1Y";                  // DBTYPE_R4           人物进入房间落地位置1的Y

	var TENNIS_GAME_MAPINFO_ROOMPOS2X                     =12;  
	var TENNIS_GAME_MAPINFO_ROOMPOS2X_STR                 ="RoomPos2X";                  // DBTYPE_R4           人物进入房间落地位置2的X

	var TENNIS_GAME_MAPINFO_ROOMPOS2Y                     =13;  
	var TENNIS_GAME_MAPINFO_ROOMPOS2Y_STR                 ="RoomPos2Y";                  // DBTYPE_R4           人物进入房间落地位置2的Y

	var TENNIS_GAME_MAPINFO_ROOMPOS3X                     =14;  
	var TENNIS_GAME_MAPINFO_ROOMPOS3X_STR                 ="RoomPos3X";                  // DBTYPE_R4           人物进入房间落地位置3的X

	var TENNIS_GAME_MAPINFO_ROOMPOS3Y                     =15;  
	var TENNIS_GAME_MAPINFO_ROOMPOS3Y_STR                 ="RoomPos3Y";                  // DBTYPE_R4           人物进入房间落地位置3的Y

	var TENNIS_GAME_MAPINFO_ROOMPOS4X                     =16;  
	var TENNIS_GAME_MAPINFO_ROOMPOS4X_STR                 ="RoomPos4X";                  // DBTYPE_R4           人物进入房间落地位置4的X

	var TENNIS_GAME_MAPINFO_ROOMPOS4Y                     =17;  
	var TENNIS_GAME_MAPINFO_ROOMPOS4Y_STR                 ="RoomPos4Y";                  // DBTYPE_R4           人物进入房间落地位置4的Y


	var MATCH_PARAM                                       ="Match_param";
	var TENNIS_GAME_MATCH_PARAM_ID                        =0;   
	var TENNIS_GAME_MATCH_PARAM_ID_STR                    ="id";                         // DBTYPE_I4           作为主键用，无意义

	var TENNIS_GAME_MATCH_PARAM_MAX_H_STORE_TIME          =1;   
	var TENNIS_GAME_MATCH_PARAM_MAX_H_STORE_TIME_STR      ="MAX_H_STORE_TIME";           // DBTYPE_R4           后场击球满蓄力时间上限值

	var TENNIS_GAME_MATCH_PARAM_MAX_Q_STORE_TIME          =2;   
	var TENNIS_GAME_MATCH_PARAM_MAX_Q_STORE_TIME_STR      ="MAX_Q_STORE_TIME";           // DBTYPE_R4           前场击球满蓄力时间上限值

	var TENNIS_GAME_MATCH_PARAM_MAX_HD_STORE_TIME         =3;   
	var TENNIS_GAME_MATCH_PARAM_MAX_HD_STORE_TIME_STR     ="MAX_HD_STORE_TIME";          // DBTYPE_R4           后场方向满蓄力时间上限值

	var TENNIS_GAME_MATCH_PARAM_MAX_QD_STORE_TIME         =4;   
	var TENNIS_GAME_MATCH_PARAM_MAX_QD_STORE_TIME_STR     ="MAX_QD_STORE_TIME";          // DBTYPE_R4           前场方向满蓄力时间上限值

	var TENNIS_GAME_MATCH_PARAM_MAX_FAD_STORE_TIME        =5;   
	var TENNIS_GAME_MATCH_PARAM_MAX_FAD_STORE_TIME_STR    ="MAX_FAD_STORE_TIME";         // DBTYPE_R4           发球满方向蓄力时间

	var TENNIS_GAME_MATCH_PARAM_MAX_SHU_XING_BEISHU       =6;   
	var TENNIS_GAME_MATCH_PARAM_MAX_SHU_XING_BEISHU_STR   ="MAX_SHU_XING_BEISHU";        // DBTYPE_R4           为扩大属性显示值域

	var TENNIS_GAME_MATCH_PARAM_POSZ_FRONT                =7;   
	var TENNIS_GAME_MATCH_PARAM_POSZ_FRONT_STR            ="POSZ_FRONT";                 // DBTYPE_R4           判断人物前后场的分界值

	var TENNIS_GAME_MATCH_PARAM_MOREN_SPEED               =8;   
	var TENNIS_GAME_MATCH_PARAM_MOREN_SPEED_STR           ="MOREN_SPEED";                // DBTYPE_R4           默认球速上限值

	var TENNIS_GAME_MATCH_PARAM_MAX_SPEED                 =9;   
	var TENNIS_GAME_MATCH_PARAM_MAX_SPEED_STR             ="MAX_SPEED";                  // DBTYPE_R4           满蓄力球速上限值

	var TENNIS_GAME_MATCH_PARAM_MAX_PT_SPEED              =10;  
	var TENNIS_GAME_MATCH_PARAM_MAX_PT_SPEED_STR          ="MAX_PT_SPEED";               // DBTYPE_R4           满技术值普通球球速

	var TENNIS_GAME_MATCH_PARAM_MAX_SKILL                 =11;  
	var TENNIS_GAME_MATCH_PARAM_MAX_SKILL_STR             ="MAX_SKILL";                  // DBTYPE_R4           技术值上限

	var TENNIS_GAME_MATCH_PARAM_KOU_SHA_CHENG_FA          =12;  
	var TENNIS_GAME_MATCH_PARAM_KOU_SHA_CHENG_FA_STR      ="KOU_SHA_CHENG_FA";           // DBTYPE_R4           扣杀时的角度惩罚

	var TENNIS_GAME_MATCH_PARAM_Q_MAX_CHENG_FA            =13;  
	var TENNIS_GAME_MATCH_PARAM_Q_MAX_CHENG_FA_STR        ="Q_MAX_CHENG_FA";             // DBTYPE_R4           前场最大落点惩罚

	var TENNIS_GAME_MATCH_PARAM_H_MAX_CHENG_FA            =14;  
	var TENNIS_GAME_MATCH_PARAM_H_MAX_CHENG_FA_STR        ="H_MAX_CHENG_FA";             // DBTYPE_R4           后场最大落点惩罚

	var TENNIS_GAME_MATCH_PARAM_GAI_LV_ZHI                =15;  
	var TENNIS_GAME_MATCH_PARAM_GAI_LV_ZHI_STR            ="GAI_LV_ZHI";                 // DBTYPE_R4           挡球概率调试参数

	var TENNIS_GAME_MATCH_PARAM_GAI_LV_ZHI_J              =16;  
	var TENNIS_GAME_MATCH_PARAM_GAI_LV_ZHI_J_STR          ="GAI_LV_ZHI_J";               // DBTYPE_R4           技术值减少的挡球概率值

	var TENNIS_GAME_MATCH_PARAM_ENERGY_BASE               =17;  
	var TENNIS_GAME_MATCH_PARAM_ENERGY_BASE_STR           ="ENERGY_BASE";                // DBTYPE_R4           每次击球获得的基础能量值

	var TENNIS_GAME_MATCH_PARAM_XU_LI_QIU8                =18;  
	var TENNIS_GAME_MATCH_PARAM_XU_LI_QIU8_STR            ="XU_LI_QIU8";                 // DBTYPE_R4           4-8回合时蓄力球获得的能量倍数

	var TENNIS_GAME_MATCH_PARAM_XU_LI_QIU2                =19;  
	var TENNIS_GAME_MATCH_PARAM_XU_LI_QIU2_STR            ="XU_LI_QIU2";                 // DBTYPE_R4           8回合以上时蓄力球获得的能量倍数

	var TENNIS_GAME_MATCH_PARAM_PU_JIU_BEI_SHU            =20;  
	var TENNIS_GAME_MATCH_PARAM_PU_JIU_BEI_SHU_STR        ="PU_JIU_BEI_SHU";             // DBTYPE_R4           普通击球与挡球/扑救之间的能量倍数

	var TENNIS_GAME_MATCH_PARAM_SHUANG_DA_DROPX_C         =21;  
	var TENNIS_GAME_MATCH_PARAM_SHUANG_DA_DROPX_C_STR     ="SHUANG_DA_DROPX_C";          // DBTYPE_R4           双打时落点X值的倍数

	var TENNIS_GAME_MATCH_PARAM_JIE_FAQIU_DANGQIU         =22;  
	var TENNIS_GAME_MATCH_PARAM_JIE_FAQIU_DANGQIU_STR     ="JIE_FAQIU_DANGQIU";          // DBTYPE_R4           接发球 出挡球轨迹的“标线”。

	var TENNIS_GAME_MATCH_PARAM_JIE_KOUSHA_DANGQIU        =23;  
	var TENNIS_GAME_MATCH_PARAM_JIE_KOUSHA_DANGQIU_STR    ="JIE_KOUSHA_DANGQIU";         // DBTYPE_R4           接扣杀、满蓄力截击上旋 出挡球轨迹的“标线”。

	var TENNIS_GAME_MATCH_PARAM_FLO_H_STORE_TIME          =24;  
	var TENNIS_GAME_MATCH_PARAM_FLO_H_STORE_TIME_STR      ="FLO_H_STORE_TIME";           // DBTYPE_R4           后场击球满蓄力时间下限值

	var TENNIS_GAME_MATCH_PARAM_FLO_Q_STORE_TIME          =25;  
	var TENNIS_GAME_MATCH_PARAM_FLO_Q_STORE_TIME_STR      ="FLO_Q_STORE_TIME";           // DBTYPE_R4           前场击球满蓄力时间下限值

	var TENNIS_GAME_MATCH_PARAM_FLO_MOREN_SPEED           =26;  
	var TENNIS_GAME_MATCH_PARAM_FLO_MOREN_SPEED_STR       ="FLO_MOREN_SPEED";            // DBTYPE_R4           默认球速下限值

	var TENNIS_GAME_MATCH_PARAM_FLO_MAX_SPEED             =27;  
	var TENNIS_GAME_MATCH_PARAM_FLO_MAX_SPEED_STR         ="FLO_MAX_SPEED";              // DBTYPE_R4           满蓄力球速下限值

	var TENNIS_GAME_MATCH_PARAM_FLO_HD_STORE_TIME         =28;  
	var TENNIS_GAME_MATCH_PARAM_FLO_HD_STORE_TIME_STR     ="FLO_HD_STORE_TIME";          // DBTYPE_R4           后场方向满蓄力时间下限值

	var TENNIS_GAME_MATCH_PARAM_FLO_QD_STORE_TIME         =29;  
	var TENNIS_GAME_MATCH_PARAM_FLO_QD_STORE_TIME_STR     ="FLO_QD_STORE_TIME";          // DBTYPE_R4           前场方向满蓄力时间下限值


	var NOTIFY                                            ="Notify";
	var TENNIS_GAME_NOTIFY_AUTOID                         =0;   
	var TENNIS_GAME_NOTIFY_AUTOID_STR                     ="AutoID";                     // DBTYPE_I4           通知以执行脚本

	var TENNIS_GAME_NOTIFY_INDEX                          =1;   
	var TENNIS_GAME_NOTIFY_INDEX_STR                      ="index";                      // DBTYPE_I4           通知编号

	var TENNIS_GAME_NOTIFY_DISCRIPTION                    =2;   
	var TENNIS_GAME_NOTIFY_DISCRIPTION_STR                ="discription";                // DBTYPE_WVARCHAR     通知说明(请详细描述通知的调用方, 使用的后作用)

	var TENNIS_GAME_NOTIFY_SCRIPT                         =3;   
	var TENNIS_GAME_NOTIFY_SCRIPT_STR                     ="script";                     // DBTYPE_WVARCHAR     通知调用的脚本


	var QUALIFY                                           ="Qualify";
	var TENNIS_GAME_QUALIFY_ID                            =0;   
	var TENNIS_GAME_QUALIFY_ID_STR                        ="ID";                         // DBTYPE_I4           称号ID 1.新手 2.资格赛 3巡回 4黄金 5大师

	var TENNIS_GAME_QUALIFY_SHOWNAME                      =1;   
	var TENNIS_GAME_QUALIFY_SHOWNAME_STR                  ="ShowName";                   // DBTYPE_WVARCHAR     显示名称

	var TENNIS_GAME_QUALIFY_NEEDLV                        =2;   
	var TENNIS_GAME_QUALIFY_NEEDLV_STR                    ="NeedLV";                     // DBTYPE_I4           需要等级

	var TENNIS_GAME_QUALIFY_NOTE                          =3;   
	var TENNIS_GAME_QUALIFY_NOTE_STR                      ="Note";                       // DBTYPE_WVARCHAR     


	var REGIONCOLLISION                                   ="RegionCollision";
	var TENNIS_GAME_REGIONCOLLISION_ID                    =0;   
	var TENNIS_GAME_REGIONCOLLISION_ID_STR                ="id";                         // DBTYPE_I4           

	var TENNIS_GAME_REGIONCOLLISION_MAPID                 =1;   
	var TENNIS_GAME_REGIONCOLLISION_MAPID_STR             ="mapid";                      // DBTYPE_I4           地图id

	var TENNIS_GAME_REGIONCOLLISION_CENTERX               =2;   
	var TENNIS_GAME_REGIONCOLLISION_CENTERX_STR           ="centerx";                    // DBTYPE_R4           区域中心的x

	var TENNIS_GAME_REGIONCOLLISION_CENTERY               =3;   
	var TENNIS_GAME_REGIONCOLLISION_CENTERY_STR           ="centery";                    // DBTYPE_R4           区域中心的y

	var TENNIS_GAME_REGIONCOLLISION_CENTERZ               =4;   
	var TENNIS_GAME_REGIONCOLLISION_CENTERZ_STR           ="centerz";                    // DBTYPE_R4           区域中心的z

	var TENNIS_GAME_REGIONCOLLISION_XLENGTH               =5;   
	var TENNIS_GAME_REGIONCOLLISION_XLENGTH_STR           ="xlength";                    // DBTYPE_R4           x方向的长度 必须大于0

	var TENNIS_GAME_REGIONCOLLISION_YLENGTH               =6;   
	var TENNIS_GAME_REGIONCOLLISION_YLENGTH_STR           ="ylength";                    // DBTYPE_R4           y方向的长度 必须大于0

	var TENNIS_GAME_REGIONCOLLISION_ZLENGTH               =7;   
	var TENNIS_GAME_REGIONCOLLISION_ZLENGTH_STR           ="zlength";                    // DBTYPE_R4           z方向的长度 必须大于0


	var REGIONLIMIT                                       ="RegionLimit";
	var TENNIS_GAME_REGIONLIMIT_ID                        =0;   
	var TENNIS_GAME_REGIONLIMIT_ID_STR                    ="id";                         // DBTYPE_I4           

	var TENNIS_GAME_REGIONLIMIT_INCLUDE                   =1;   
	var TENNIS_GAME_REGIONLIMIT_INCLUDE_STR               ="include";                    // DBTYPE_BOOL         true表示是这个区域,false表示除了这个区域的其他部分

	var TENNIS_GAME_REGIONLIMIT_STATE                     =2;   
	var TENNIS_GAME_REGIONLIMIT_STATE_STR                 ="state";                      // DBTYPE_I4           人物状态1.发球 2.其他情况

	var TENNIS_GAME_REGIONLIMIT_CONDITION                 =3;   
	var TENNIS_GAME_REGIONLIMIT_CONDITION_STR             ="condition";                  // DBTYPE_WVARCHAR     状态相同时用的条件判断

	var TENNIS_GAME_REGIONLIMIT_CONDITION1                =4;   
	var TENNIS_GAME_REGIONLIMIT_CONDITION1_STR            ="condition1";                 // DBTYPE_WVARCHAR     状态相同时用的条件判断

	var TENNIS_GAME_REGIONLIMIT_LEFTPOINTX                =5;   
	var TENNIS_GAME_REGIONLIMIT_LEFTPOINTX_STR            ="leftpointx";                 // DBTYPE_R4           区域左上角的x

	var TENNIS_GAME_REGIONLIMIT_LEFTPOINTZ                =6;   
	var TENNIS_GAME_REGIONLIMIT_LEFTPOINTZ_STR            ="leftpointz";                 // DBTYPE_R4           区域左上角的z

	var TENNIS_GAME_REGIONLIMIT_XLENGTH                   =7;   
	var TENNIS_GAME_REGIONLIMIT_XLENGTH_STR               ="xlength";                    // DBTYPE_R4           x方向的长度 必须大于等于0

	var TENNIS_GAME_REGIONLIMIT_ZLENGTH                   =8;   
	var TENNIS_GAME_REGIONLIMIT_ZLENGTH_STR               ="zlength";                    // DBTYPE_R4           z方向的长度 必须大于等于0


	var TRACKINFO                                         ="TrackInfo";
	var TENNIS_GAME_TRACKINFO_AUTOID                      =0;   
	var TENNIS_GAME_TRACKINFO_AUTOID_STR                  ="AutoID";                     // DBTYPE_I4           

	var TENNIS_GAME_TRACKINFO_TRACKID                     =1;   
	var TENNIS_GAME_TRACKINFO_TRACKID_STR                 ="trackID";                    // DBTYPE_I4           索引

	var TENNIS_GAME_TRACKINFO_TRACKNAME                   =2;   
	var TENNIS_GAME_TRACKINFO_TRACKNAME_STR               ="trackName";                  // DBTYPE_WVARCHAR     名字

	var TENNIS_GAME_TRACKINFO_TRACKFILE                   =3;   
	var TENNIS_GAME_TRACKINFO_TRACKFILE_STR               ="trackFile";                  // DBTYPE_WVARCHAR     文件

	var TENNIS_GAME_TRACKINFO_TRACKTYPE                   =4;   
	var TENNIS_GAME_TRACKINFO_TRACKTYPE_STR               ="trackType";                  // DBTYPE_I4           轨迹所属的类型 0.上旋类     1.削球类    2.放高球类     3.发球     4.挡球\扑救     5.扣杀

	var TENNIS_GAME_TRACKINFO_TRACKDEFSPEED               =5;   
	var TENNIS_GAME_TRACKINFO_TRACKDEFSPEED_STR           ="trackDefSpeed";              // DBTYPE_R4           轨迹默认速度

	var TENNIS_GAME_TRACKINFO_SCRIPT_TRACKSTART           =6;   
	var TENNIS_GAME_TRACKINFO_SCRIPT_TRACKSTART_STR       ="Script_TrackStart";          // DBTYPE_WVARCHAR     轨迹开始时调用的脚本

	var TENNIS_GAME_TRACKINFO_SCRIPT_TRACKEND             =7;   
	var TENNIS_GAME_TRACKINFO_SCRIPT_TRACKEND_STR         ="Script_TrackEnd";            // DBTYPE_WVARCHAR     轨迹结束时调用的脚本

	var TENNIS_GAME_TRACKINFO_SCRIPT_FIRSTDROP            =8;   
	var TENNIS_GAME_TRACKINFO_SCRIPT_FIRSTDROP_STR        ="Script_FirstDrop";           // DBTYPE_WVARCHAR     第一落点调用的脚本

	var TENNIS_GAME_TRACKINFO_SCRIPT_SECONDDROP           =9;   
	var TENNIS_GAME_TRACKINFO_SCRIPT_SECONDDROP_STR       ="Script_SecondDrop";          // DBTYPE_WVARCHAR     第二落点调用的脚本

	var TENNIS_GAME_TRACKINFO_SCRIPT_THIRDDROP            =10;  
	var TENNIS_GAME_TRACKINFO_SCRIPT_THIRDDROP_STR        ="Script_ThirdDrop";           // DBTYPE_WVARCHAR     

	var TENNIS_GAME_TRACKINFO_SCRIPT_FORTHDROP            =11;  
	var TENNIS_GAME_TRACKINFO_SCRIPT_FORTHDROP_STR        ="Script_ForthDrop";           // DBTYPE_WVARCHAR     

	var TENNIS_GAME_TRACKINFO_SCRIPT_HITAFFECT            =12;  
	var TENNIS_GAME_TRACKINFO_SCRIPT_HITAFFECT_STR        ="Script_HitAffect";           // DBTYPE_WVARCHAR     击到球的脚本(控制击到球后的玩家行为脚本,策划用)

	var TENNIS_GAME_TRACKINFO___SCRIPT_HITAFFECT          =13;  
	var TENNIS_GAME_TRACKINFO___SCRIPT_HITAFFECT_STR      ="__Script_HitAffect";         // DBTYPE_WVARCHAR     击到球的脚本(控制击到球后的玩家行为脚本,程序用)

	var TENNIS_GAME_TRACKINFO_STATTYPE                    =14;  
	var TENNIS_GAME_TRACKINFO_STATTYPE_STR                ="StatType";                   // DBTYPE_I4           统计用 0:默认 1:上旋 2:截击 3:放高球 4:削球 5:扣杀 6:挡球 7:扑救 8:发球

	var TENNIS_GAME_TRACKINFO_STATWHERE                   =15;  
	var TENNIS_GAME_TRACKINFO_STATWHERE_STR               ="StatWhere";                  // DBTYPE_I4           统计用 0:前后场都有可能 1:前场 2:后场 3:无所谓

	var TENNIS_GAME_TRACKINFO_STATSKILLTYPE               =16;  
	var TENNIS_GAME_TRACKINFO_STATSKILLTYPE_STR           ="StatSkillType";              // DBTYPE_I4           统计用 0:1--3类型

	var TENNIS_GAME_TRACKINFO_STATSKILLLV                 =17;  
	var TENNIS_GAME_TRACKINFO_STATSKILLLV_STR             ="StatSkillLV";                // DBTYPE_I4           统计用 0:默认无级别 1~4表示技能级别

	var TENNIS_GAME_TRACKINFO_SCRIPT_TRACKSTOP            =18;  
	var TENNIS_GAME_TRACKINFO_SCRIPT_TRACKSTOP_STR        ="Script_TrackStop";           // DBTYPE_WVARCHAR     轨迹停止后运行的脚本

	var TENNIS_GAME_TRACKINFO_ISSTOPANDENDSCRIPTONLYONCE  =19;  
	var TENNIS_GAME_TRACKINFO_ISSTOPANDENDSCRIPTONLYONCE_STR="IsStopAndEndScriptOnlyOnce"; // DBTYPE_BOOL         轨迹停止与结束的脚本只调用其一, 比如如果轨迹停止了, 就不会有End脚本的调用, 如果飞行中换轨迹, 没有走到Stop, 就会调用End.

	var TENNIS_GAME_TRACKINFO_STATSTOREBALL               =20;  
	var TENNIS_GAME_TRACKINFO_STATSTOREBALL_STR           ="StatStoreBall";              // DBTYPE_I4           统计用 0:默认无蓄力 1:有蓄力 2:满蓄力


	var TRACKTYPEINFO                                     ="TrackTypeInfo";
	var TENNIS_GAME_TRACKTYPEINFO_AUTOID                  =0;   
	var TENNIS_GAME_TRACKTYPEINFO_AUTOID_STR              ="AutoID";                     // DBTYPE_I4           

	var TENNIS_GAME_TRACKTYPEINFO_TRACKTYPE               =1;   
	var TENNIS_GAME_TRACKTYPEINFO_TRACKTYPE_STR           ="trackType";                  // DBTYPE_I4           (0: 上旋/)  (1:削球) (2:放高球 ) (3:发球) 4(:挡球\扑救)   5(满蓄力上旋截击/扣杀)

	var TENNIS_GAME_TRACKTYPEINFO_DROP0X                  =2;   
	var TENNIS_GAME_TRACKTYPEINFO_DROP0X_STR              ="drop0X";                     // DBTYPE_R4           基准点

	var TENNIS_GAME_TRACKTYPEINFO_DROP0Y                  =3;   
	var TENNIS_GAME_TRACKTYPEINFO_DROP0Y_STR              ="drop0Y";                     // DBTYPE_R4           

	var TENNIS_GAME_TRACKTYPEINFO_DROP0Z                  =4;   
	var TENNIS_GAME_TRACKTYPEINFO_DROP0Z_STR              ="drop0Z";                     // DBTYPE_R4           基础落点

	var TENNIS_GAME_TRACKTYPEINFO_DROP1X                  =5;   
	var TENNIS_GAME_TRACKTYPEINFO_DROP1X_STR              ="drop1X";                     // DBTYPE_R4           第二基准点.和基准点的偏移距离

	var TENNIS_GAME_TRACKTYPEINFO_DROP1Y                  =6;   
	var TENNIS_GAME_TRACKTYPEINFO_DROP1Y_STR              ="drop1Y";                     // DBTYPE_R4           

	var TENNIS_GAME_TRACKTYPEINFO_DROP1Z                  =7;   
	var TENNIS_GAME_TRACKTYPEINFO_DROP1Z_STR              ="drop1Z";                     // DBTYPE_R4           

	var TENNIS_GAME_TRACKTYPEINFO_DROP2X                  =8;   
	var TENNIS_GAME_TRACKTYPEINFO_DROP2X_STR              ="drop2X";                     // DBTYPE_R4           第三基准点.和基准点的偏移距离

	var TENNIS_GAME_TRACKTYPEINFO_DROP2Y                  =9;   
	var TENNIS_GAME_TRACKTYPEINFO_DROP2Y_STR              ="drop2Y";                     // DBTYPE_R4           

	var TENNIS_GAME_TRACKTYPEINFO_DROP2Z                  =10;  
	var TENNIS_GAME_TRACKTYPEINFO_DROP2Z_STR              ="drop2Z";                     // DBTYPE_R4           


	var TRAIN                                             ="Train";
	var TENNIS_GAME_TRAIN_ID                              =0;   
	var TENNIS_GAME_TRAIN_ID_STR                          ="ID";                         // DBTYPE_I4           0 训练ID

	var TENNIS_GAME_TRAIN_NAME                            =1;   
	var TENNIS_GAME_TRAIN_NAME_STR                        ="Name";                       // DBTYPE_WVARCHAR     1 名称

	var TENNIS_GAME_TRAIN_TYPE                            =2;   
	var TENNIS_GAME_TRAIN_TYPE_STR                        ="Type";                       // DBTYPE_I4           2 需要的服务器类型 1新手赛,2资格赛,3巡回赛,4黄金赛,5大师赛,6大满贯

	var TENNIS_GAME_TRAIN_STATE                           =3;   
	var TENNIS_GAME_TRAIN_STATE_STR                       ="State";                      // DBTYPE_I4           3 状态 0未通过 1通过

	var TENNIS_GAME_TRAIN_EXPLAIN                         =4;   
	var TENNIS_GAME_TRAIN_EXPLAIN_STR                     ="Explain";                    // DBTYPE_WVARCHAR     4 说明

	var TENNIS_GAME_TRAIN_AWARD_ITEM1                     =5;   
	var TENNIS_GAME_TRAIN_AWARD_ITEM1_STR                 ="Award_Item1";                // DBTYPE_WVARCHAR     5 物品奖励-男 "物品ID,有效期序号(0,1,2)"  特别说明：现在限定只奖励一种物品！！！！！！！

	var TENNIS_GAME_TRAIN_AWARD_ITEM2                     =6;   
	var TENNIS_GAME_TRAIN_AWARD_ITEM2_STR                 ="Award_Item2";                // DBTYPE_WVARCHAR     6 物品奖励-女 "物品ID,有效期序号(0,1,2)"

	var TENNIS_GAME_TRAIN_AWARD_GOLD                      =7;   
	var TENNIS_GAME_TRAIN_AWARD_GOLD_STR                  ="Award_Gold";                 // DBTYPE_I4           7 奖励-金币-第一次做的

	var TENNIS_GAME_TRAIN_AWARD_EXP                       =8;   
	var TENNIS_GAME_TRAIN_AWARD_EXP_STR                   ="Award_exp";                  // DBTYPE_I4           8 奖励-经验-第一次做的

	var TENNIS_GAME_TRAIN_GOAL                            =9;   
	var TENNIS_GAME_TRAIN_GOAL_STR                        ="Goal";                       // DBTYPE_WVARCHAR     9 训练目标-说明

	var TENNIS_GAME_TRAIN_FINISH                          =10;  
	var TENNIS_GAME_TRAIN_FINISH_STR                      ="Finish";                     // DBTYPE_WVARCHAR     10 训练完成-说明

	var TENNIS_GAME_TRAIN_ICON                            =11;  
	var TENNIS_GAME_TRAIN_ICON_STR                        ="Icon";                       // DBTYPE_WVARCHAR     11 训练显示的图标:与训练弹出的类型是一个名字

	var TENNIS_GAME_TRAIN_TRAINSCRIPT                     =12;  
	var TENNIS_GAME_TRAIN_TRAINSCRIPT_STR                 ="TrainScript";                // DBTYPE_WVARCHAR     12 训练的运行脚本路径, 通过T_gamestatic的getgameroot获得游戏目录, 然后在本库gamepath表获得训练路径, 拼接本路径得到绝对路径

	var TENNIS_GAME_TRAIN_AWARD_GOLD2                     =13;  
	var TENNIS_GAME_TRAIN_AWARD_GOLD2_STR                 ="Award_Gold2";                // DBTYPE_I4           13 奖励-金币-不是第一次做的

	var TENNIS_GAME_TRAIN_AWARD_EXP2                      =14;  
	var TENNIS_GAME_TRAIN_AWARD_EXP2_STR                  ="Award_exp2";                 // DBTYPE_I4           14 奖励-经验-不是第一次做的

	var TENNIS_GAME_TRAIN_CANREPEAT                       =15;  
	var TENNIS_GAME_TRAIN_CANREPEAT_STR                   ="CanRepeat";                  // DBTYPE_I4           15 是否可以重复做 0不可以 1可以

	var TENNIS_GAME_TRAIN_FORCETRAIN                      =16;  
	var TENNIS_GAME_TRAIN_FORCETRAIN_STR                  ="ForceTrain";                 // DBTYPE_BOOL         16 是否为强制性训练

	var TENNIS_GAME_TRAIN_SENDWORD                        =17;  
	var TENNIS_GAME_TRAIN_SENDWORD_STR                    ="SendWord";                   // DBTYPE_WVARCHAR     17 留言

	var TENNIS_GAME_TRAIN_SENDNAME                        =18;  
	var TENNIS_GAME_TRAIN_SENDNAME_STR                    ="SendName";                   // DBTYPE_WVARCHAR     18 赠送者

	var TENNIS_GAME_TRAIN_PRESENTID                       =19;  
	var TENNIS_GAME_TRAIN_PRESENTID_STR                   ="PresentID";                  // DBTYPE_I4           19 礼品赠送id,前面不知道有没有人用,暂时放那

	var TENNIS_GAME_TRAIN_SHORTTIME                       =20;  
	var TENNIS_GAME_TRAIN_SHORTTIME_STR                   ="ShortTime";                  // DBTYPE_I4           

	var TENNIS_GAME_TRAIN_STYLE                           =21;  
	var TENNIS_GAME_TRAIN_STYLE_STR                       ="style";                      // DBTYPE_I4           0默认  1普通训练 2自由训练

	var TENNIS_GAME_TRAIN_AIID                            =22;  
	var TENNIS_GAME_TRAIN_AIID_STR                        ="aiid";                       // DBTYPE_I4           -1默认 AI的ID，目前只有自由训练有

	var TENNIS_GAME_TRAIN_NEEDLV                          =23;  
	var TENNIS_GAME_TRAIN_NEEDLV_STR                      ="NeedLv";                     // DBTYPE_I4           需要的等级 0无等级需求


	var TRAIN_DLG                                         ="Train_DLG";
	var TENNIS_GAME_TRAIN_DLG_ID                          =0;   
	var TENNIS_GAME_TRAIN_DLG_ID_STR                      ="ID";                         // DBTYPE_I4           0 对话框的ID - 有潜规则请勿随意更改

	var TENNIS_GAME_TRAIN_DLG_TEXT                        =1;   
	var TENNIS_GAME_TRAIN_DLG_TEXT_STR                    ="Text";                       // DBTYPE_WVARCHAR     1 提示的内容

	var TENNIS_GAME_TRAIN_DLG_SHOWBTN                     =2;   
	var TENNIS_GAME_TRAIN_DLG_SHOWBTN_STR                 ="ShowBtn";                    // DBTYPE_I4           2 该显示什么按钮 0都不显示 1显示"下一步" 2显示"跳过"

	var TENNIS_GAME_TRAIN_DLG_OVERBTN1                    =3;   
	var TENNIS_GAME_TRAIN_DLG_OVERBTN1_STR                ="OverBtn1";                   // DBTYPE_WVARCHAR     3 训练结束或游戏结束时下边显示的第一个按钮

	var TENNIS_GAME_TRAIN_DLG_OVERBTN2                    =4;   
	var TENNIS_GAME_TRAIN_DLG_OVERBTN2_STR                ="OverBtn2";                   // DBTYPE_WVARCHAR     4 训练结束或游戏结束时下边显示的第二个按钮

	var TENNIS_GAME_TRAIN_DLG_DESC                        =5;   
	var TENNIS_GAME_TRAIN_DLG_DESC_STR                    ="desc";                       // DBTYPE_WVARCHAR     5 备注与描述 ID生成说明：千位(1训练,2新手赛)+百位("千位为1有效"1-7对应相应频道)+十位个位(训练ID的编号Train表,99代表所有训练结束)


	var TRAIN_TIP                                         ="Train_Tip";
	var TENNIS_GAME_TRAIN_TIP_ID                          =0;   
	var TENNIS_GAME_TRAIN_TIP_ID_STR                      ="ID";                         // DBTYPE_I4           0 对话框的ID - 有潜规则请勿随意更改

	var TENNIS_GAME_TRAIN_TIP_TEXT                        =1;   
	var TENNIS_GAME_TRAIN_TIP_TEXT_STR                    ="Text";                       // DBTYPE_WVARCHAR     1 提示的内容

	var TENNIS_GAME_TRAIN_TIP_SHOWBTN                     =2;   
	var TENNIS_GAME_TRAIN_TIP_SHOWBTN_STR                 ="ShowBtn";                    // DBTYPE_I4           2 该显示什么按钮 0都不显示 1显示"下一步" 2显示"跳过"

	var TENNIS_GAME_TRAIN_TIP_OVERBTN1                    =3;   
	var TENNIS_GAME_TRAIN_TIP_OVERBTN1_STR                ="OverBtn1";                   // DBTYPE_WVARCHAR     3 训练结束或游戏结束时下边显示的第一个按钮

	var TENNIS_GAME_TRAIN_TIP_OVERBTN2                    =4;   
	var TENNIS_GAME_TRAIN_TIP_OVERBTN2_STR                ="OverBtn2";                   // DBTYPE_WVARCHAR     4 训练结束或游戏结束时下边显示的第二个按钮

	var TENNIS_GAME_TRAIN_TIP_DESC                        =5;   
	var TENNIS_GAME_TRAIN_TIP_DESC_STR                    ="desc";                       // DBTYPE_WVARCHAR     5 备注与描述 ID生成说明：千位(1训练,2新手赛)+百位("千位为1有效"1-7对应相应频道)+十位个位(训练ID的编号Train表,99代表所有训练结束)


	var VIPSETTING                                        ="VipSetting";
	var TENNIS_GAME_VIPSETTING_ID                         =0;   
	var TENNIS_GAME_VIPSETTING_ID_STR                     ="id";                         // DBTYPE_I4           Vip的位数 1表示第一位

	var TENNIS_GAME_VIPSETTING_BUY                        =1;   
	var TENNIS_GAME_VIPSETTING_BUY_STR                    ="Buy";                        // DBTYPE_I4           购买的折扣0~100

	var TENNIS_GAME_VIPSETTING_GAMEMONEY                  =2;   
	var TENNIS_GAME_VIPSETTING_GAMEMONEY_STR              ="GameMoney";                  // DBTYPE_I4           游戏获胜时增加的钱百分比 0~100

	var TENNIS_GAME_VIPSETTING_GAMEEXP                    =3;   
	var TENNIS_GAME_VIPSETTING_GAMEEXP_STR                ="GameExp";                    // DBTYPE_I4           游戏获胜时增加的经验百分比 0~100

	var TENNIS_GAME_VIPSETTING_NOTE                       =4;   
	var TENNIS_GAME_VIPSETTING_NOTE_STR                   ="Note";                       // DBTYPE_WVARCHAR     备注

}
