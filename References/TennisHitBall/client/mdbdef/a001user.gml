// 创建日期:2011/5/16 17:11:46
// Access文件名:E:\VnetProject2011\Develop\Tennis\Project0\publish\mdb\user\a001user.mdb

set window
{
	var A001USER                                          ="a001user.mdb";

	var ATTACKDEF                                         ="attackdef";
	var A001USER_ATTACKDEF_STATE_INDEX                    =0;   
	var A001USER_ATTACKDEF_STATE_INDEX_STR                ="state_index";                // DBTYPE_I4           状态索引

	var A001USER_ATTACKDEF_STATE_STR                      =1;   
	var A001USER_ATTACKDEF_STATE_STR_STR                  ="state_str";                  // DBTYPE_WVARCHAR     状态注释

	var A001USER_ATTACKDEF_PARTS1_INDEX                   =2;   
	var A001USER_ATTACKDEF_PARTS1_INDEX_STR               ="parts1_index";               // DBTYPE_I4           部件一索引

	var A001USER_ATTACKDEF_PARTS1_STR                     =3;   
	var A001USER_ATTACKDEF_PARTS1_STR_STR                 ="parts1_str";                 // DBTYPE_WVARCHAR     部件一注释

	var A001USER_ATTACKDEF_PARTS1_BLADESTTM               =4;   
	var A001USER_ATTACKDEF_PARTS1_BLADESTTM_STR           ="parts1_bladesttm";           // DBTYPE_I4           部件一刀光开始时间

	var A001USER_ATTACKDEF_PARTS1_BLADEEDTM               =5;   
	var A001USER_ATTACKDEF_PARTS1_BLADEEDTM_STR           ="parts1_bladeedtm";           // DBTYPE_I4           部件一刀光结束时间

	var A001USER_ATTACKDEF_PARTS1_HITPAUSETM              =6;   
	var A001USER_ATTACKDEF_PARTS1_HITPAUSETM_STR          ="parts1_hitpausetm";          // DBTYPE_I4           击中后主动方停顿时间

	var A001USER_ATTACKDEF_PARTS1_BEHITPAUSETM            =7;   
	var A001USER_ATTACKDEF_PARTS1_BEHITPAUSETM_STR        ="parts1_behitpausetm";        // DBTYPE_I4           击中后被动方停顿时间

	var A001USER_ATTACKDEF_PARTS1_JUDGESTTM               =8;   
	var A001USER_ATTACKDEF_PARTS1_JUDGESTTM_STR           ="parts1_judgesttm";           // DBTYPE_I4           部件一判定开始时间

	var A001USER_ATTACKDEF_PARTS1_JUDGEEDTM               =9;   
	var A001USER_ATTACKDEF_PARTS1_JUDGEEDTM_STR           ="parts1_judgeedtm";           // DBTYPE_I4           部件一判定结束时间

	var A001USER_ATTACKDEF_PARTS1_REACTSTATE              =10;  
	var A001USER_ATTACKDEF_PARTS1_REACTSTATE_STR          ="parts1_reactstate";          // DBTYPE_I4           被部件一击中后的反应状态

	var A001USER_ATTACKDEF_PARTS1_EVEN_IMPULSE            =11;  
	var A001USER_ATTACKDEF_PARTS1_EVEN_IMPULSE_STR        ="parts1_even_impulse";        // DBTYPE_R4           部件一的水平冲量

	var A001USER_ATTACKDEF_PARTS1_EVEN_ANGLE              =12;  
	var A001USER_ATTACKDEF_PARTS1_EVEN_ANGLE_STR          ="parts1_even_angle";          // DBTYPE_R4           部件一的水平冲量的修正角度

	var A001USER_ATTACKDEF_PARTS1_UP_IMPULSE              =13;  
	var A001USER_ATTACKDEF_PARTS1_UP_IMPULSE_STR          ="parts1_up_impulse";          // DBTYPE_R4           部件一的垂直冲量

	var A001USER_ATTACKDEF_PARTS1_HURT                    =14;  
	var A001USER_ATTACKDEF_PARTS1_HURT_STR                ="parts1_hurt";                // DBTYPE_R4           部件一的伤害值

	var A001USER_ATTACKDEF_PARTS1_HAVEDONE                =15;  
	var A001USER_ATTACKDEF_PARTS1_HAVEDONE_STR            ="parts1_havedone";            // DBTYPE_I4           是否已经处理过（处理的是被攻方哪个部件）

	var A001USER_ATTACKDEF_PARTS_BACKOFFLEN               =16;  
	var A001USER_ATTACKDEF_PARTS_BACKOFFLEN_STR           ="parts_backofflen";           // DBTYPE_R4           被攻击方位移长度

	var A001USER_ATTACKDEF_PARTS_BACKOFFTM                =17;  
	var A001USER_ATTACKDEF_PARTS_BACKOFFTM_STR            ="parts_backofftm";            // DBTYPE_I4           被攻击方位移时间

	var A001USER_ATTACKDEF_PARTS_ACTTM                    =18;  
	var A001USER_ATTACKDEF_PARTS_ACTTM_STR                ="parts_acttm";                // DBTYPE_I4           被攻击方被动动作持续时间

	var A001USER_ATTACKDEF_PARTS_BACKOFFANGLE             =19;  
	var A001USER_ATTACKDEF_PARTS_BACKOFFANGLE_STR         ="parts_backoffangle";         // DBTYPE_R4           被攻击方位移角度

	var A001USER_ATTACKDEF_AUTOINDEX                      =20;  
	var A001USER_ATTACKDEF_AUTOINDEX_STR                  ="autoindex";                  // DBTYPE_I4           主键（无功能）

	var A001USER_ATTACKDEF_PARTS_ATT                      =21;  
	var A001USER_ATTACKDEF_PARTS_ATT_STR                  ="parts_att";                  // DBTYPE_R4           攻击力倍比

	var A001USER_ATTACKDEF_ACC_ATT                        =22;  
	var A001USER_ATTACKDEF_ACC_ATT_STR                    ="acc_att";                    // DBTYPE_R4           附加伤害

	var A001USER_ATTACKDEF_BLEED_COUNT                    =23;  
	var A001USER_ATTACKDEF_BLEED_COUNT_STR                ="bleed_count";                // DBTYPE_I4           分几次显示伤血

	var A001USER_ATTACKDEF_BLADENAME                      =24;  
	var A001USER_ATTACKDEF_BLADENAME_STR                  ="bladename";                  // DBTYPE_WVARCHAR     刀光文件名

	var A001USER_ATTACKDEF_BLADEINDEX                     =25;  
	var A001USER_ATTACKDEF_BLADEINDEX_STR                 ="bladeindex";                 // DBTYPE_I4           刀光部件索引


	var ATTRIBUTEFLAG                                     ="attributeflag";
	var A001USER_ATTRIBUTEFLAG_FLAG_NAME                  =0;   
	var A001USER_ATTRIBUTEFLAG_FLAG_NAME_STR              ="flag_name";                  // DBTYPE_WVARCHAR     标志位名称

	var A001USER_ATTRIBUTEFLAG_FLAG_POS                   =1;   
	var A001USER_ATTRIBUTEFLAG_FLAG_POS_STR               ="flag_pos";                   // DBTYPE_I4           第几位

	var A001USER_ATTRIBUTEFLAG_FLAG_TURE_SCRIPT           =2;   
	var A001USER_ATTRIBUTEFLAG_FLAG_TURE_SCRIPT_STR       ="flag_ture_script";           // DBTYPE_WVARCHAR     标志位为真时的脚本函数

	var A001USER_ATTRIBUTEFLAG_FLAG_TRUE_OBJ              =3;   
	var A001USER_ATTRIBUTEFLAG_FLAG_TRUE_OBJ_STR          ="flag_true_obj";              // DBTYPE_I4           标志位为真时的脚本函数执行对象

	var A001USER_ATTRIBUTEFLAG_FLAG_TRUE_PARAM            =4;   
	var A001USER_ATTRIBUTEFLAG_FLAG_TRUE_PARAM_STR        ="flag_true_param";            // DBTYPE_WVARCHAR     标志位为真时的脚本函数参数

	var A001USER_ATTRIBUTEFLAG_FLAG_FALSE_SCRIPT          =5;   
	var A001USER_ATTRIBUTEFLAG_FLAG_FALSE_SCRIPT_STR      ="flag_false_script";          // DBTYPE_WVARCHAR     标志位为假时的脚本函数

	var A001USER_ATTRIBUTEFLAG_FLAG_FALSE_OBJ             =6;   
	var A001USER_ATTRIBUTEFLAG_FLAG_FALSE_OBJ_STR         ="flag_false_obj";             // DBTYPE_I4           标志位为假时的脚本函数执行对象

	var A001USER_ATTRIBUTEFLAG_FLAG_FALSE_PARAM           =7;   
	var A001USER_ATTRIBUTEFLAG_FLAG_FALSE_PARAM_STR       ="flag_false_param";           // DBTYPE_WVARCHAR     标志位为假时的脚本函数参数


	var CONDITION                                         ="condition";
	var A001USER_CONDITION_CONDITION_NAME                 =0;   
	var A001USER_CONDITION_CONDITION_NAME_STR             ="condition_name";             // DBTYPE_WVARCHAR     

	var A001USER_CONDITION_CONDITION_ID                   =1;   
	var A001USER_CONDITION_CONDITION_ID_STR               ="condition_id";               // DBTYPE_I4           

	var A001USER_CONDITION_SKILL_CONDITION                =2;   
	var A001USER_CONDITION_SKILL_CONDITION_STR            ="skill_condition";            // DBTYPE_WVARCHAR     技能条件

	var A001USER_CONDITION_GOODS_CONDITION                =3;   
	var A001USER_CONDITION_GOODS_CONDITION_STR            ="goods_condition";            // DBTYPE_WVARCHAR     物品条件

	var A001USER_CONDITION_BUFFER_CONDITION               =4;   
	var A001USER_CONDITION_BUFFER_CONDITION_STR           ="buffer_condition";           // DBTYPE_WVARCHAR     buffer条件

	var A001USER_CONDITION_PARTS_CONDITION                =5;   
	var A001USER_CONDITION_PARTS_CONDITION_STR            ="parts_condition";            // DBTYPE_WVARCHAR     部件条件

	var A001USER_CONDITION_CHARACTER_CONDITION            =6;   
	var A001USER_CONDITION_CHARACTER_CONDITION_STR        ="character_condition";        // DBTYPE_WVARCHAR     角色条件

	var A001USER_CONDITION_SCEEN_CONDITION                =7;   
	var A001USER_CONDITION_SCEEN_CONDITION_STR            ="sceen_condition";            // DBTYPE_WVARCHAR     场景条件

	var A001USER_CONDITION_STATE_CONDITION                =8;   
	var A001USER_CONDITION_STATE_CONDITION_STR            ="state_condition";            // DBTYPE_WVARCHAR     状态条件

	var A001USER_CONDITION_ATTRIBUTE_CONDITION            =9;   
	var A001USER_CONDITION_ATTRIBUTE_CONDITION_STR        ="attribute_condition";        // DBTYPE_WVARCHAR     属性标志位条件


	var DOWER                                             ="dower";
	var A001USER_DOWER_DOWERID                            =0;   
	var A001USER_DOWER_DOWERID_STR                        ="dowerid";                    // DBTYPE_I4           天赋ID

	var A001USER_DOWER_DNAME                              =1;   
	var A001USER_DOWER_DNAME_STR                          ="dName";                      // DBTYPE_WVARCHAR     天赋名称

	var A001USER_DOWER_DEXPLAIN                           =2;   
	var A001USER_DOWER_DEXPLAIN_STR                       ="dExplain";                   // DBTYPE_WVARCHAR     天赋说明

	var A001USER_DOWER_DTYPE                              =3;   
	var A001USER_DOWER_DTYPE_STR                          ="dType";                      // DBTYPE_I4           天赋类型 如: 平衡系

	var A001USER_DOWER_DICON                              =4;   
	var A001USER_DOWER_DICON_STR                          ="dIcon";                      // DBTYPE_WVARCHAR     天赋图标

	var A001USER_DOWER_DMAXPOINT                          =5;   
	var A001USER_DOWER_DMAXPOINT_STR                      ="dMaxPoint";                  // DBTYPE_I4           天赋最大级别或点数

	var A001USER_DOWER_DCONDITION                         =6;   
	var A001USER_DOWER_DCONDITION_STR                     ="dCondition";                 // DBTYPE_WVARCHAR     到达该天赋的条件 公式为:

	var A001USER_DOWER_DTATT                              =7;   
	var A001USER_DOWER_DTATT_STR                          ="dTAtt";                      // DBTYPE_WVARCHAR     天赋对基本属性影响如: 爆击率增加 1% 公式为: user.ap.dCurPoint * 3

	var A001USER_DOWER_DTOUCH                             =8;   
	var A001USER_DOWER_DTOUCH_STR                         ="dTouch";                     // DBTYPE_WVARCHAR     天赋对其它属性影响如: 学会新的技能  公式为: skill.add(3); skill.add(5); buff.add(6)

	var A001USER_DOWER_DDELTRIGGER                        =9;   
	var A001USER_DOWER_DDELTRIGGER_STR                    ="dDelTrigger";                // DBTYPE_WVARCHAR     天赋被删除后的影响如: 学会天赋技能被删除 公式为: skill.del(3)


	var FLAGDEF                                           ="flagdef";
	var A001USER_FLAGDEF_ATTRIBUTE_NAME                   =0;   
	var A001USER_FLAGDEF_ATTRIBUTE_NAME_STR               ="attribute_name";             // DBTYPE_WVARCHAR     

	var A001USER_FLAGDEF_ATTRIBUTE_INDEX                  =1;   
	var A001USER_FLAGDEF_ATTRIBUTE_INDEX_STR              ="attribute_index";            // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG1                            =2;   
	var A001USER_FLAGDEF_FLAG1_STR                        ="flag1";                      // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG2                            =3;   
	var A001USER_FLAGDEF_FLAG2_STR                        ="flag2";                      // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG3                            =4;   
	var A001USER_FLAGDEF_FLAG3_STR                        ="flag3";                      // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG4                            =5;   
	var A001USER_FLAGDEF_FLAG4_STR                        ="flag4";                      // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG5                            =6;   
	var A001USER_FLAGDEF_FLAG5_STR                        ="flag5";                      // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG6                            =7;   
	var A001USER_FLAGDEF_FLAG6_STR                        ="flag6";                      // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG7                            =8;   
	var A001USER_FLAGDEF_FLAG7_STR                        ="flag7";                      // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG8                            =9;   
	var A001USER_FLAGDEF_FLAG8_STR                        ="flag8";                      // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG9                            =10;  
	var A001USER_FLAGDEF_FLAG9_STR                        ="flag9";                      // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG10                           =11;  
	var A001USER_FLAGDEF_FLAG10_STR                       ="flag10";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG11                           =12;  
	var A001USER_FLAGDEF_FLAG11_STR                       ="flag11";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG12                           =13;  
	var A001USER_FLAGDEF_FLAG12_STR                       ="flag12";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG13                           =14;  
	var A001USER_FLAGDEF_FLAG13_STR                       ="flag13";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG14                           =15;  
	var A001USER_FLAGDEF_FLAG14_STR                       ="flag14";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG15                           =16;  
	var A001USER_FLAGDEF_FLAG15_STR                       ="flag15";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG16                           =17;  
	var A001USER_FLAGDEF_FLAG16_STR                       ="flag16";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG17                           =18;  
	var A001USER_FLAGDEF_FLAG17_STR                       ="flag17";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG18                           =19;  
	var A001USER_FLAGDEF_FLAG18_STR                       ="flag18";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG19                           =20;  
	var A001USER_FLAGDEF_FLAG19_STR                       ="flag19";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG20                           =21;  
	var A001USER_FLAGDEF_FLAG20_STR                       ="flag20";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG21                           =22;  
	var A001USER_FLAGDEF_FLAG21_STR                       ="flag21";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG22                           =23;  
	var A001USER_FLAGDEF_FLAG22_STR                       ="flag22";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG23                           =24;  
	var A001USER_FLAGDEF_FLAG23_STR                       ="flag23";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG24                           =25;  
	var A001USER_FLAGDEF_FLAG24_STR                       ="flag24";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG25                           =26;  
	var A001USER_FLAGDEF_FLAG25_STR                       ="flag25";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG26                           =27;  
	var A001USER_FLAGDEF_FLAG26_STR                       ="flag26";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG27                           =28;  
	var A001USER_FLAGDEF_FLAG27_STR                       ="flag27";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG28                           =29;  
	var A001USER_FLAGDEF_FLAG28_STR                       ="flag28";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG29                           =30;  
	var A001USER_FLAGDEF_FLAG29_STR                       ="flag29";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG30                           =31;  
	var A001USER_FLAGDEF_FLAG30_STR                       ="flag30";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG31                           =32;  
	var A001USER_FLAGDEF_FLAG31_STR                       ="flag31";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG32                           =33;  
	var A001USER_FLAGDEF_FLAG32_STR                       ="flag32";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG33                           =34;  
	var A001USER_FLAGDEF_FLAG33_STR                       ="flag33";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG34                           =35;  
	var A001USER_FLAGDEF_FLAG34_STR                       ="flag34";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG35                           =36;  
	var A001USER_FLAGDEF_FLAG35_STR                       ="flag35";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG36                           =37;  
	var A001USER_FLAGDEF_FLAG36_STR                       ="flag36";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG37                           =38;  
	var A001USER_FLAGDEF_FLAG37_STR                       ="flag37";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG38                           =39;  
	var A001USER_FLAGDEF_FLAG38_STR                       ="flag38";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG39                           =40;  
	var A001USER_FLAGDEF_FLAG39_STR                       ="flag39";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG40                           =41;  
	var A001USER_FLAGDEF_FLAG40_STR                       ="flag40";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG41                           =42;  
	var A001USER_FLAGDEF_FLAG41_STR                       ="flag41";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG42                           =43;  
	var A001USER_FLAGDEF_FLAG42_STR                       ="flag42";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG43                           =44;  
	var A001USER_FLAGDEF_FLAG43_STR                       ="flag43";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG44                           =45;  
	var A001USER_FLAGDEF_FLAG44_STR                       ="flag44";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG45                           =46;  
	var A001USER_FLAGDEF_FLAG45_STR                       ="flag45";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG46                           =47;  
	var A001USER_FLAGDEF_FLAG46_STR                       ="flag46";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG47                           =48;  
	var A001USER_FLAGDEF_FLAG47_STR                       ="flag47";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG48                           =49;  
	var A001USER_FLAGDEF_FLAG48_STR                       ="flag48";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG49                           =50;  
	var A001USER_FLAGDEF_FLAG49_STR                       ="flag49";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG50                           =51;  
	var A001USER_FLAGDEF_FLAG50_STR                       ="flag50";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG51                           =52;  
	var A001USER_FLAGDEF_FLAG51_STR                       ="flag51";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG52                           =53;  
	var A001USER_FLAGDEF_FLAG52_STR                       ="flag52";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG53                           =54;  
	var A001USER_FLAGDEF_FLAG53_STR                       ="flag53";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG54                           =55;  
	var A001USER_FLAGDEF_FLAG54_STR                       ="flag54";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG55                           =56;  
	var A001USER_FLAGDEF_FLAG55_STR                       ="flag55";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG56                           =57;  
	var A001USER_FLAGDEF_FLAG56_STR                       ="flag56";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG57                           =58;  
	var A001USER_FLAGDEF_FLAG57_STR                       ="flag57";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG58                           =59;  
	var A001USER_FLAGDEF_FLAG58_STR                       ="flag58";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG59                           =60;  
	var A001USER_FLAGDEF_FLAG59_STR                       ="flag59";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG60                           =61;  
	var A001USER_FLAGDEF_FLAG60_STR                       ="flag60";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG61                           =62;  
	var A001USER_FLAGDEF_FLAG61_STR                       ="flag61";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG62                           =63;  
	var A001USER_FLAGDEF_FLAG62_STR                       ="flag62";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG63                           =64;  
	var A001USER_FLAGDEF_FLAG63_STR                       ="flag63";                     // DBTYPE_I4           

	var A001USER_FLAGDEF_FLAG64                           =65;  
	var A001USER_FLAGDEF_FLAG64_STR                       ="flag64";                     // DBTYPE_I4           


	var GAMERULE                                          ="GameRule";
	var A001USER_GAMERULE_ID                              =0;   
	var A001USER_GAMERULE_ID_STR                          ="ID";                         // DBTYPE_I4           

	var A001USER_GAMERULE_RULE                            =1;   
	var A001USER_GAMERULE_RULE_STR                        ="RULE";                       // DBTYPE_WVARCHAR     


	var HITACT                                            ="HitAct";
	var A001USER_HITACT_AUTOID                            =0;   
	var A001USER_HITACT_AUTOID_STR                        ="AutoID";                     // DBTYPE_I4           

	var A001USER_HITACT_INDEX                             =1;   
	var A001USER_HITACT_INDEX_STR                         ="index";                      // DBTYPE_I4           1.击球方式索引(顺序)

	var A001USER_HITACT_HITNAME                           =2;   
	var A001USER_HITACT_HITNAME_STR                       ="hitName";                    // DBTYPE_WVARCHAR     2.击球名称

	var A001USER_HITACT_HITTYPE                           =3;   
	var A001USER_HITACT_HITTYPE_STR                       ="hitType";                    // DBTYPE_I4           3.击球类型(0.放高 1.削球 2.上旋 3.截击 4.发球(平击) 5.挡球 6.救球 7.扣杀 8.发球(外旋))

	var A001USER_HITACT_HITNOFALL                         =4;   
	var A001USER_HITACT_HITNOFALL_STR                     ="hitNoFall";                  // DBTYPE_BOOL         4.没有着地是否可以击打

	var A001USER_HITACT_HITFALL                           =5;   
	var A001USER_HITACT_HITFALL_STR                       ="hitFall";                    // DBTYPE_BOOL         5.落地后能否击打

	var A001USER_HITACT_HITFOREGROUND                     =6;   
	var A001USER_HITACT_HITFOREGROUND_STR                 ="hitForeGround";              // DBTYPE_BOOL         6.是否在前场可以击打

	var A001USER_HITACT_HITBACKGROUND                     =7;   
	var A001USER_HITACT_HITBACKGROUND_STR                 ="hitBackGround";              // DBTYPE_BOOL         7.是否在后场可以击打

	var A001USER_HITACT_FULLTIME                          =8;   
	var A001USER_HITACT_FULLTIME_STR                      ="fullTime";                   // DBTYPE_I4           8.充足击打时间   目前没有用

	var A001USER_HITACT_SHORTESTTIME                      =9;   
	var A001USER_HITACT_SHORTESTTIME_STR                  ="shortestTime";               // DBTYPE_I4           最短击打时间    目前没有用

	var A001USER_HITACT_HANDTYPE                          =10;  
	var A001USER_HITACT_HANDTYPE_STR                      ="handType";                   // DBTYPE_I4           10.正反手动作(0.正手 1.反手 2.不分正反手)

	var A001USER_HITACT_CANSTOREPOWER                     =11;  
	var A001USER_HITACT_CANSTOREPOWER_STR                 ="canStorePower";              // DBTYPE_BOOL         能否蓄力

	var A001USER_HITACT_HITPOSX                           =12;  
	var A001USER_HITACT_HITPOSX_STR                       ="hitPosX";                    // DBTYPE_R4           击球点X

	var A001USER_HITACT_HITPOSY                           =13;  
	var A001USER_HITACT_HITPOSY_STR                       ="hitPosY";                    // DBTYPE_R4           击球点Y

	var A001USER_HITACT_HITPOSZ                           =14;  
	var A001USER_HITACT_HITPOSZ_STR                       ="hitPosZ";                    // DBTYPE_R4           击球点Z

	var A001USER_HITACT_CANHITFAR                         =15;  
	var A001USER_HITACT_CANHITFAR_STR                     ="canHitFar";                  // DBTYPE_BOOL         15.是否能打远范围的球

	var A001USER_HITACT_CANHITNEAR                        =16;  
	var A001USER_HITACT_CANHITNEAR_STR                    ="canHitNear";                 // DBTYPE_BOOL         是否能打近范围的球

	var A001USER_HITACT_CANHITBIGROUND                    =17;  
	var A001USER_HITACT_CANHITBIGROUND_STR                ="canHitBigRound";             // DBTYPE_BOOL         是否能打大圈

	var A001USER_HITACT_HITACT                            =18;  
	var A001USER_HITACT_HITACT_STR                        ="hitAct";                     // DBTYPE_I4           打击动作

	var A001USER_HITACT_TOTALFRAME                        =19;  
	var A001USER_HITACT_TOTALFRAME_STR                    ="totalFrame";                 // DBTYPE_I4           总帧数(击球动作)

	var A001USER_HITACT_HITFRAME                          =20;  
	var A001USER_HITACT_HITFRAME_STR                      ="hitFrame";                   // DBTYPE_I4           打击帧数(击球动作)

	var A001USER_HITACT_HITTIME                           =21;  
	var A001USER_HITACT_HITTIME_STR                       ="hitTime";                    // DBTYPE_I4           20.打击动作时间(击球动作)

	var A001USER_HITACT_PULLACT                           =22;  
	var A001USER_HITACT_PULLACT_STR                       ="pullAct";                    // DBTYPE_I4           拉拍动作

	var A001USER_HITACT_PULLMINTIME                       =23;  
	var A001USER_HITACT_PULLMINTIME_STR                   ="pullMinTime";                // DBTYPE_I4           拉拍最短时间

	var A001USER_HITACT_PULLMAXTIME                       =24;  
	var A001USER_HITACT_PULLMAXTIME_STR                   ="pullMaxTime";                // DBTYPE_I4           拉拍最长时间

	var A001USER_HITACT_PULLPOSX                          =25;  
	var A001USER_HITACT_PULLPOSX_STR                      ="pullPosX";                   // DBTYPE_R4           拉拍点X

	var A001USER_HITACT_PULLPOSY                          =26;  
	var A001USER_HITACT_PULLPOSY_STR                      ="pullPosY";                   // DBTYPE_R4           25.击球点Y

	var A001USER_HITACT_PULLPOSZ                          =27;  
	var A001USER_HITACT_PULLPOSZ_STR                      ="pullPosZ";                   // DBTYPE_R4           拉拍点Z

	var A001USER_HITACT_RETURNTRACK0                      =28;  
	var A001USER_HITACT_RETURNTRACK0_STR                  ="returnTrack0";               // DBTYPE_I4           前场蓄力轨迹

	var A001USER_HITACT_RETURNTRACK1                      =29;  
	var A001USER_HITACT_RETURNTRACK1_STR                  ="returnTrack1";               // DBTYPE_I4           后场蓄力轨迹

	var A001USER_HITACT_RETURNTRACK2                      =30;  
	var A001USER_HITACT_RETURNTRACK2_STR                  ="returnTrack2";               // DBTYPE_I4           前场普通轨迹

	var A001USER_HITACT_RETURNTRACK3                      =31;  
	var A001USER_HITACT_RETURNTRACK3_STR                  ="returnTrack3";               // DBTYPE_I4           30.后场普通轨迹

	var A001USER_HITACT_CANMISSHIT                        =32;  
	var A001USER_HITACT_CANMISSHIT_STR                    ="canMissHit";                 // DBTYPE_BOOL         是否该动作可以用于挥空拍

	var A001USER_HITACT_ISSKILL                           =33;  
	var A001USER_HITACT_ISSKILL_STR                       ="isSkill";                    // DBTYPE_BOOL         是否是技能动作 如果是技能则拉拍信息,除正反手的击球判定信息无效

	var A001USER_HITACT_RETURNTRACK4                      =34;  
	var A001USER_HITACT_RETURNTRACK4_STR                  ="returnTrack4";               // DBTYPE_I4           33.挡球轨迹

	var A001USER_HITACT_RETURNTRACK5                      =35;  
	var A001USER_HITACT_RETURNTRACK5_STR                  ="returnTrack5";               // DBTYPE_I4           34.后场满蓄力轨迹

	var A001USER_HITACT_RETURNTRACK6                      =36;  
	var A001USER_HITACT_RETURNTRACK6_STR                  ="returnTrack6";               // DBTYPE_I4           35.前场满蓄力轨迹

	var A001USER_HITACT_RETURNTRACK7                      =37;  
	var A001USER_HITACT_RETURNTRACK7_STR                  ="returnTrack7";               // DBTYPE_I4           预留

	var A001USER_HITACT_INTERFACEACT                      =38;  
	var A001USER_HITACT_INTERFACEACT_STR                  ="interfaceAct";               // DBTYPE_I4           气氛动作索引

	var A001USER_HITACT_PULLMOVESCALE                     =39;  
	var A001USER_HITACT_PULLMOVESCALE_STR                 ="pullMoveScale";              // DBTYPE_R4           38.拉拍移动的时间比例

	var A001USER_HITACT_RETURNSCRIPT                      =40;  
	var A001USER_HITACT_RETURNSCRIPT_STR                  ="ReturnScript";               // DBTYPE_WVARCHAR     回球调用脚本(策划功能脚本)

	var A001USER_HITACT___RETURNSCRIPT                    =41;  
	var A001USER_HITACT___RETURNSCRIPT_STR                ="__ReturnScript";             // DBTYPE_WVARCHAR     回球调用脚本(程序脚本)

	var A001USER_HITACT_CANHITOVERPULLMAXTIME             =42;  
	var A001USER_HITACT_CANHITOVERPULLMAXTIME_STR         ="canHitOverPullMaxTime";      // DBTYPE_BOOL         是否能打拉拍超出最大拉拍时间的球

	var A001USER_HITACT_SKILLTYPE                         =43;  
	var A001USER_HITACT_SKILLTYPE_STR                     ="skillType";                  // DBTYPE_I4           技能的类型（调用技能轨迹使用）   0.普通    1.C型轨迹技能     2.待用

	var A001USER_HITACT_SERVETHROWTRACK                   =44;  
	var A001USER_HITACT_SERVETHROWTRACK_STR               ="serveThrowTrack";            // DBTYPE_I4           抛球轨迹索引(发球动作专用)

	var A001USER_HITACT_THROWTIME                         =45;  
	var A001USER_HITACT_THROWTIME_STR                     ="ThrowTime";                  // DBTYPE_I4           抛球距打球的时间(发球动作专用)


	var INPUTRULL                                         ="inputrull";
	var A001USER_INPUTRULL_STATE_NOW                      =0;   
	var A001USER_INPUTRULL_STATE_NOW_STR                  ="State_now";                  // DBTYPE_I4           0   现在的状态索引

	var A001USER_INPUTRULL_INPUTINDEX                     =1;   
	var A001USER_INPUTRULL_INPUTINDEX_STR                 ="inputindex";                 // DBTYPE_I4           1   输入

	var A001USER_INPUTRULL_ATTRIBUTE_STATE_NOW            =2;   
	var A001USER_INPUTRULL_ATTRIBUTE_STATE_NOW_STR        ="attribute_state_now";        // DBTYPE_I4           2   标志位

	var A001USER_INPUTRULL_CHG_STATE                      =3;   
	var A001USER_INPUTRULL_CHG_STATE_STR                  ="chg_state";                  // DBTYPE_I4           3   改变成的状态索引

	var A001USER_INPUTRULL_CHG_TYPE                       =4;   
	var A001USER_INPUTRULL_CHG_TYPE_STR                   ="chg_type";                   // DBTYPE_I4           4   类型

	var A001USER_INPUTRULL_CHG_ATTRIBUTE1                 =5;   
	var A001USER_INPUTRULL_CHG_ATTRIBUTE1_STR             ="chg_attribute1";             // DBTYPE_I4           5

	var A001USER_INPUTRULL_CHG_ATT_TYPE1                  =6;   
	var A001USER_INPUTRULL_CHG_ATT_TYPE1_STR              ="chg_att_type1";              // DBTYPE_I4           6

	var A001USER_INPUTRULL_CHG_ATTRIBUT2                  =7;   
	var A001USER_INPUTRULL_CHG_ATTRIBUT2_STR              ="chg_attribut2";              // DBTYPE_I4           7

	var A001USER_INPUTRULL_CHG_ATT_TYPE2                  =8;   
	var A001USER_INPUTRULL_CHG_ATT_TYPE2_STR              ="chg_att_type2";              // DBTYPE_I4           8

	var A001USER_INPUTRULL_AUTOID                         =9;   
	var A001USER_INPUTRULL_AUTOID_STR                     ="autoid";                     // DBTYPE_I4           9

	var A001USER_INPUTRULL_ZHUSHI                         =10;  
	var A001USER_INPUTRULL_ZHUSHI_STR                     ="zhushi";                     // DBTYPE_WVARCHAR     10


	var INTERFACEACT                                      ="InterfaceAct";
	var A001USER_INTERFACEACT_NAME                        =0;   
	var A001USER_INTERFACEACT_NAME_STR                    ="name";                       // DBTYPE_WVARCHAR     说明

	var A001USER_INTERFACEACT_INDEX                       =1;   
	var A001USER_INTERFACEACT_INDEX_STR                   ="index";                      // DBTYPE_I4           气氛动作索引

	var A001USER_INTERFACEACT_ACTINDEX                    =2;   
	var A001USER_INTERFACEACT_ACTINDEX_STR                ="actIndex";                   // DBTYPE_I4           气氛动作动作号

	var A001USER_INTERFACEACT_CAMPOSX                     =3;   
	var A001USER_INTERFACEACT_CAMPOSX_STR                 ="camPosX";                    // DBTYPE_R4           摄像机位置

	var A001USER_INTERFACEACT_CAMPOSY                     =4;   
	var A001USER_INTERFACEACT_CAMPOSY_STR                 ="camPosY";                    // DBTYPE_R4           摄像机位置

	var A001USER_INTERFACEACT_CAMPOSZ                     =5;   
	var A001USER_INTERFACEACT_CAMPOSZ_STR                 ="camPosZ";                    // DBTYPE_R4           摄像机位置

	var A001USER_INTERFACEACT_CAMLOOKX                    =6;   
	var A001USER_INTERFACEACT_CAMLOOKX_STR                ="camLookX";                   // DBTYPE_R4           摄像机朝向

	var A001USER_INTERFACEACT_CAMLOOKY                    =7;   
	var A001USER_INTERFACEACT_CAMLOOKY_STR                ="camLookY";                   // DBTYPE_R4           摄像机朝向

	var A001USER_INTERFACEACT_CAMLOOKZ                    =8;   
	var A001USER_INTERFACEACT_CAMLOOKZ_STR                ="camLookZ";                   // DBTYPE_R4           摄像机朝向


	var KEYDEF                                            ="keydef";
	var A001USER_KEYDEF_KEYLIST                           =0;   
	var A001USER_KEYDEF_KEYLIST_STR                       ="KeyList";                    // DBTYPE_WVARCHAR     

	var A001USER_KEYDEF_TIMELIST                          =1;   
	var A001USER_KEYDEF_TIMELIST_STR                      ="TimeList";                   // DBTYPE_WVARCHAR     

	var A001USER_KEYDEF_PRIORITY                          =2;   
	var A001USER_KEYDEF_PRIORITY_STR                      ="Priority";                   // DBTYPE_I4           

	var A001USER_KEYDEF_PRIORITYLASTTIME                  =3;   
	var A001USER_KEYDEF_PRIORITYLASTTIME_STR              ="PriorityLastTime";           // DBTYPE_I4           

	var A001USER_KEYDEF_LISTNUM                           =4;   
	var A001USER_KEYDEF_LISTNUM_STR                       ="ListNum";                    // DBTYPE_I4           

	var A001USER_KEYDEF_EXPLAIN                           =5;   
	var A001USER_KEYDEF_EXPLAIN_STR                       ="explain";                    // DBTYPE_WVARCHAR     

	var A001USER_KEYDEF_AUTOID                            =6;   
	var A001USER_KEYDEF_AUTOID_STR                        ="autoid";                     // DBTYPE_I4           

	var A001USER_KEYDEF_LONGTIME                          =7;   
	var A001USER_KEYDEF_LONGTIME_STR                      ="longtime";                   // DBTYPE_I4           


	var PARTPHYSICS                                       ="PartPhysics";
	var A001USER_PARTPHYSICS_ID                           =0;   
	var A001USER_PARTPHYSICS_ID_STR                       ="ID";                         // DBTYPE_I4           

	var A001USER_PARTPHYSICS_GAMEID                       =1;   
	var A001USER_PARTPHYSICS_GAMEID_STR                   ="GameID";                     // DBTYPE_I4           

	var A001USER_PARTPHYSICS_NAME                         =2;   
	var A001USER_PARTPHYSICS_NAME_STR                     ="Name";                       // DBTYPE_WVARCHAR     

	var A001USER_PARTPHYSICS_SHAPETYPE                    =3;   
	var A001USER_PARTPHYSICS_SHAPETYPE_STR                ="ShapeType";                  // DBTYPE_I4           

	var A001USER_PARTPHYSICS_HURTTYPE                     =4;   
	var A001USER_PARTPHYSICS_HURTTYPE_STR                 ="HurtType";                   // DBTYPE_I4           

	var A001USER_PARTPHYSICS_SIZE                         =5;   
	var A001USER_PARTPHYSICS_SIZE_STR                     ="Size";                       // DBTYPE_WVARCHAR     

	var A001USER_PARTPHYSICS_BONENAME                     =6;   
	var A001USER_PARTPHYSICS_BONENAME_STR                 ="BoneName";                   // DBTYPE_WVARCHAR     

	var A001USER_PARTPHYSICS_OFFSETMATRIX                 =7;   
	var A001USER_PARTPHYSICS_OFFSETMATRIX_STR             ="OffsetMatrix";               // DBTYPE_WVARCHAR     


	var RESULT                                            ="result";
	var A001USER_RESULT_RESULT_NAME                       =0;   
	var A001USER_RESULT_RESULT_NAME_STR                   ="result_name";                // DBTYPE_WVARCHAR     结果名称

	var A001USER_RESULT_RESULT_ID                         =1;   
	var A001USER_RESULT_RESULT_ID_STR                     ="result_id";                  // DBTYPE_I4           结果id

	var A001USER_RESULT_BODY_RESULT                       =2;   
	var A001USER_RESULT_BODY_RESULT_STR                   ="body_result";                // DBTYPE_WVARCHAR     body自身结果

	var A001USER_RESULT_INTERACT_RESULT                   =3;   
	var A001USER_RESULT_INTERACT_RESULT_STR               ="interact_result";            // DBTYPE_WVARCHAR     互动结果

	var A001USER_RESULT_MAP_RESULT                        =4;   
	var A001USER_RESULT_MAP_RESULT_STR                    ="map_result";                 // DBTYPE_WVARCHAR     调用map接口的结果

	var A001USER_RESULT_EFFECT_RESULT                     =5;   
	var A001USER_RESULT_EFFECT_RESULT_STR                 ="effect_result";              // DBTYPE_WVARCHAR     特效结果

	var A001USER_RESULT_SOUND_RESULT                      =6;   
	var A001USER_RESULT_SOUND_RESULT_STR                  ="sound_result";               // DBTYPE_WVARCHAR     音效结果

	var A001USER_RESULT_LOGICAL_RESULT                    =7;   
	var A001USER_RESULT_LOGICAL_RESULT_STR                ="logical_result";             // DBTYPE_WVARCHAR     逻辑结果

	var A001USER_RESULT_PRIORITY                          =8;   
	var A001USER_RESULT_PRIORITY_STR                      ="priority";                   // DBTYPE_I4           优先级


	var SKILL                                             ="skill";
	var A001USER_SKILL_SKILLID                            =0;   
	var A001USER_SKILL_SKILLID_STR                        ="skillid";                    // DBTYPE_I4           技能ID 第一个数字表示大类 第二个表示类型 第三个表示等级

	var A001USER_SKILL_SNAME                              =1;   
	var A001USER_SKILL_SNAME_STR                          ="sName";                      // DBTYPE_WVARCHAR     技能名称

	var A001USER_SKILL_SEXPLAIN                           =2;   
	var A001USER_SKILL_SEXPLAIN_STR                       ="sExplain";                   // DBTYPE_WVARCHAR     技能描述

	var A001USER_SKILL_STYPE                              =3;   
	var A001USER_SKILL_STYPE_STR                          ="sType";                      // DBTYPE_I4           技能属于的公共类型

	var A001USER_SKILL_SUSECON                            =4;   
	var A001USER_SKILL_SUSECON_STR                        ="sUseCon";                    // DBTYPE_WVARCHAR     技能使用条件(程序条件, 直接调用程序函数)

	var A001USER_SKILL_SUSECON_LOGIC                      =5;   
	var A001USER_SKILL_SUSECON_LOGIC_STR                  ="sUseCon_Logic";              // DBTYPE_WVARCHAR     技能使用条件(脚本条件, 写在gml中)

	var A001USER_SKILL_SUSERES                            =6;   
	var A001USER_SKILL_SUSERES_STR                        ="sUseRes";                    // DBTYPE_WVARCHAR     技能使用结果(程序结果, 直接调用程序函数)

	var A001USER_SKILL_SUSERES_LOGIC                      =7;   
	var A001USER_SKILL_SUSERES_LOGIC_STR                  ="sUseRes_Logic";              // DBTYPE_WVARCHAR     技能使用结果(脚本结果, 写在gml中)

	var A001USER_SKILL_SMULTIPLE                          =8;   
	var A001USER_SKILL_SMULTIPLE_STR                      ="sMultiple";                  // DBTYPE_R4           伤害倍比比率 伤害=DPS * actMult * sMultiple + actDamage * sklDag;

	var A001USER_SKILL_SDAMAGE                            =9;   
	var A001USER_SKILL_SDAMAGE_STR                        ="sDamage";                    // DBTYPE_I4           附加伤害倍比 伤害=DPS * actMult * sklMult + actDamage * sDamage;

	var A001USER_SKILL_SEFFPARTS0                         =10;  
	var A001USER_SKILL_SEFFPARTS0_STR                     ="sEffParts0";                 // DBTYPE_I4           特效携带部件编号0

	var A001USER_SKILL_SEFFID0                            =11;  
	var A001USER_SKILL_SEFFID0_STR                        ="sEffId0";                    // DBTYPE_I4           携带特效Id 0

	var A001USER_SKILL_SEFFPARTS1                         =12;  
	var A001USER_SKILL_SEFFPARTS1_STR                     ="sEffParts1";                 // DBTYPE_I4           特效携带部件编号1

	var A001USER_SKILL_SEFFID1                            =13;  
	var A001USER_SKILL_SEFFID1_STR                        ="sEffId1";                    // DBTYPE_I4           携带特效Id 1

	var A001USER_SKILL_SEFFPARTS2                         =14;  
	var A001USER_SKILL_SEFFPARTS2_STR                     ="sEffParts2";                 // DBTYPE_I4           特效携带部件编号2

	var A001USER_SKILL_SEFFID2                            =15;  
	var A001USER_SKILL_SEFFID2_STR                        ="sEffId2";                    // DBTYPE_I4           携带特效Id 2

	var A001USER_SKILL_SBURSTMODE                         =16;  
	var A001USER_SKILL_SBURSTMODE_STR                     ="sBurstMode";                 // DBTYPE_I4           触发方式与几率

	var A001USER_SKILL_SICON                              =17;  
	var A001USER_SKILL_SICON_STR                          ="sIcon";                      // DBTYPE_WVARCHAR     技能显示图标

	var A001USER_SKILL_SCDTM                              =18;  
	var A001USER_SKILL_SCDTM_STR                          ="sCDTm";                      // DBTYPE_I4           冷却时间

	var A001USER_SKILL_SPUBLICCDTYPE                      =19;  
	var A001USER_SKILL_SPUBLICCDTYPE_STR                  ="sPublicCDType";              // DBTYPE_I4           公共CD时间类型

	var A001USER_SKILL_SPUBLICCDTM                        =20;  
	var A001USER_SKILL_SPUBLICCDTM_STR                    ="sPublicCDTm";                // DBTYPE_I4           共公CD时间时间

	var A001USER_SKILL_SADDSP                             =21;  
	var A001USER_SKILL_SADDSP_STR                         ="sAddSp";                     // DBTYPE_WVARCHAR     技能增加时触发脚本

	var A001USER_SKILL_SUSESP                             =22;  
	var A001USER_SKILL_SUSESP_STR                         ="sUseSp";                     // DBTYPE_WVARCHAR     技能被使用时触发脚本

	var A001USER_SKILL_SMODE                              =23;  
	var A001USER_SKILL_SMODE_STR                          ="sMode";                      // DBTYPE_WVARCHAR     技能出招方式

	var A001USER_SKILL_SCURLEV                            =24;  
	var A001USER_SKILL_SCURLEV_STR                        ="sCurLev";                    // DBTYPE_I4           技能当前级别

	var A001USER_SKILL_SUPDATEDOT                         =25;  
	var A001USER_SKILL_SUPDATEDOT_STR                     ="sUpdateDot";                 // DBTYPE_I4           技能升级所需点数

	var A001USER_SKILL_SLEVREQ                            =26;  
	var A001USER_SKILL_SLEVREQ_STR                        ="sLevReq";                    // DBTYPE_I4           技能需求等级

	var A001USER_SKILL_SSTRUSED                           =27;  
	var A001USER_SKILL_SSTRUSED_STR                       ="sStrUsed";                   // DBTYPE_I4           体力消耗

	var A001USER_SKILL_SISUPDATE                          =28;  
	var A001USER_SKILL_SISUPDATE_STR                      ="sIsUpdate";                  // DBTYPE_BOOL         技能是否可以升级

	var A001USER_SKILL_SACTDGE                            =29;  
	var A001USER_SKILL_SACTDGE_STR                        ="sActDge";                    // DBTYPE_WVARCHAR     技能对应动作的伤害倍比和附加伤害的倍比(只做显示用,用;分隔) 12;30

	var A001USER_SKILL_SCANSHOWICON                       =30;  
	var A001USER_SKILL_SCANSHOWICON_STR                   ="sCanShowIcon";               // DBTYPE_WVARCHAR     显示用.是否能高亮显示

	var A001USER_SKILL_SCANADDPOINT                       =31;  
	var A001USER_SKILL_SCANADDPOINT_STR                   ="sCanAddPoint";               // DBTYPE_WVARCHAR     是否能加技能点，技能的前置条件（条件1&&条件2&&条件3）

	var A001USER_SKILL_SADDPOINT                          =32;  
	var A001USER_SKILL_SADDPOINT_STR                      ="sAddPoint";                  // DBTYPE_WVARCHAR     增加技能点后.触发

	var A001USER_SKILL_SSKILLCLASS                        =33;  
	var A001USER_SKILL_SSKILLCLASS_STR                    ="sSkillClass";                // DBTYPE_I4           技能点大分类(基础 技能一 技能二 1~3)

	var A001USER_SKILL_SSKILLSUBCLASS                     =34;  
	var A001USER_SKILL_SSKILLSUBCLASS_STR                 ="sSkillSubClass";             // DBTYPE_I4           技能点小分类(技能位置  1~...)

	var A001USER_SKILL_SDRAWARROW                         =35;  
	var A001USER_SKILL_SDRAWARROW_STR                     ="sDrawArrow";                 // DBTYPE_WVARCHAR     绘制技能箭头

	var A001USER_SKILL_SKILLTYPE                          =36;  
	var A001USER_SKILL_SKILLTYPE_STR                      ="skillType";                  // DBTYPE_I4           见HitAct的打击类型  击球类型(0.放高 1.削球 2.上旋 3.截击 4.发球 5.挡球 6.救球 7.扣杀)

	var A001USER_SKILL_IFRONTNEEDENERGY                   =37;  
	var A001USER_SKILL_IFRONTNEEDENERGY_STR               ="iFrontNeedEnergy";           // DBTYPE_I4           网前技能需要的能量

	var A001USER_SKILL_IBACKNEEDENERGY                    =38;  
	var A001USER_SKILL_IBACKNEEDENERGY_STR                ="iBackNeedEnergy";            // DBTYPE_I4           网中技能需要的能量

	var A001USER_SKILL_FAILEDSCRIPT                       =39;  
	var A001USER_SKILL_FAILEDSCRIPT_STR                   ="failedScript";               // DBTYPE_WVARCHAR     释放失败时调用的脚本(直接调用程序函数)

	var A001USER_SKILL_FAILEDSCRIPT_LOGIC                 =40;  
	var A001USER_SKILL_FAILEDSCRIPT_LOGIC_STR             ="failedScript_Logic";         // DBTYPE_WVARCHAR     释放失败时调用的脚本(写在gml中)


	var STATE_ACT                                         ="state_act";
	var A001USER_STATE_ACT_AUTOID                         =0;   
	var A001USER_STATE_ACT_AUTOID_STR                     ="AutoID";                     // DBTYPE_I4           

	var A001USER_STATE_ACT_STA_ID                         =1;   
	var A001USER_STATE_ACT_STA_ID_STR                     ="sta_id";                     // DBTYPE_I4           动作/状态索引

	var A001USER_STATE_ACT_STA_NAME                       =2;   
	var A001USER_STATE_ACT_STA_NAME_STR                   ="sta_name";                   // DBTYPE_WVARCHAR     动作名称

	var A001USER_STATE_ACT_STA_TYPE                       =3;   
	var A001USER_STATE_ACT_STA_TYPE_STR                   ="sta_type";                   // DBTYPE_I4           类型

	var A001USER_STATE_ACT_STA_ART                        =4;   
	var A001USER_STATE_ACT_STA_ART_STR                    ="sta_art";                    // DBTYPE_I4           动作播放时间(ms) -1为循环播放

	var A001USER_STATE_ACT_STA_ADJUST_GAP                 =5;   
	var A001USER_STATE_ACT_STA_ADJUST_GAP_STR             ="sta_adjust_gap";             // DBTYPE_I4           

	var A001USER_STATE_ACT_CHG_WAY_STM                    =6;   
	var A001USER_STATE_ACT_CHG_WAY_STM_STR                ="chg_way_stm";                // DBTYPE_I4           

	var A001USER_STATE_ACT_CHG_WAY_LTM                    =7;   
	var A001USER_STATE_ACT_CHG_WAY_LTM_STR                ="chg_way_ltm";                // DBTYPE_I4           

	var A001USER_STATE_ACT_CHG_POS_STM                    =8;   
	var A001USER_STATE_ACT_CHG_POS_STM_STR                ="chg_pos_stm";                // DBTYPE_I4           

	var A001USER_STATE_ACT_CHG_POS_LTM                    =9;   
	var A001USER_STATE_ACT_CHG_POS_LTM_STR                ="chg_pos_ltm";                // DBTYPE_I4           

	var A001USER_STATE_ACT_SUD_ID                         =10;  
	var A001USER_STATE_ACT_SUD_ID_STR                     ="sud_id";                     // DBTYPE_WVARCHAR     

	var A001USER_STATE_ACT_SUD_S_TM                       =11;  
	var A001USER_STATE_ACT_SUD_S_TM_STR                   ="sud_s_tm";                   // DBTYPE_I4           

	var A001USER_STATE_ACT_SUD_KEEP_TM                    =12;  
	var A001USER_STATE_ACT_SUD_KEEP_TM_STR                ="sud_keep_tm";                // DBTYPE_I4           

	var A001USER_STATE_ACT_EFT_CREATEFN                   =13;  
	var A001USER_STATE_ACT_EFT_CREATEFN_STR               ="eft_createfn";               // DBTYPE_WVARCHAR     创建特效用的函数

	var A001USER_STATE_ACT_EFT_STM                        =14;  
	var A001USER_STATE_ACT_EFT_STM_STR                    ="eft_stm";                    // DBTYPE_I4           

	var A001USER_STATE_ACT_EFT_ETM                        =15;  
	var A001USER_STATE_ACT_EFT_ETM_STR                    ="eft_etm";                    // DBTYPE_I4           

	var A001USER_STATE_ACT_EFT_DELFN                      =16;  
	var A001USER_STATE_ACT_EFT_DELFN_STR                  ="eft_delfn";                  // DBTYPE_WVARCHAR     删除特效用的函数

	var A001USER_STATE_ACT_ACT_S_SEG                      =17;  
	var A001USER_STATE_ACT_ACT_S_SEG_STR                  ="act_s_seg";                  // DBTYPE_I4           

	var A001USER_STATE_ACT_ACT_SPEED1                     =18;  
	var A001USER_STATE_ACT_ACT_SPEED1_STR                 ="act_speed1";                 // DBTYPE_R4           

	var A001USER_STATE_ACT_ACT_M_SEG                      =19;  
	var A001USER_STATE_ACT_ACT_M_SEG_STR                  ="act_m_seg";                  // DBTYPE_I4           

	var A001USER_STATE_ACT_ACT_SPEED2                     =20;  
	var A001USER_STATE_ACT_ACT_SPEED2_STR                 ="act_speed2";                 // DBTYPE_R4           

	var A001USER_STATE_ACT_ACT_E_SEG                      =21;  
	var A001USER_STATE_ACT_ACT_E_SEG_STR                  ="act_e_seg";                  // DBTYPE_I4           

	var A001USER_STATE_ACT_ACT_SPEED3                     =22;  
	var A001USER_STATE_ACT_ACT_SPEED3_STR                 ="act_speed3";                 // DBTYPE_R4           

	var A001USER_STATE_ACT_MOVE_EVEN_STM                  =23;  
	var A001USER_STATE_ACT_MOVE_EVEN_STM_STR              ="move_even_stm";              // DBTYPE_I4           

	var A001USER_STATE_ACT_MOVE_EVEN_LTM                  =24;  
	var A001USER_STATE_ACT_MOVE_EVEN_LTM_STR              ="move_even_ltm";              // DBTYPE_I4           

	var A001USER_STATE_ACT_MOVE_EVEN_LEN                  =25;  
	var A001USER_STATE_ACT_MOVE_EVEN_LEN_STR              ="move_even_len";              // DBTYPE_R4           

	var A001USER_STATE_ACT_MOVE_EVEN_ANGLE                =26;  
	var A001USER_STATE_ACT_MOVE_EVEN_ANGLE_STR            ="move_even_angle";            // DBTYPE_I4           

	var A001USER_STATE_ACT_MOVE_UPRIGHT_STM               =27;  
	var A001USER_STATE_ACT_MOVE_UPRIGHT_STM_STR           ="move_upright_stm";           // DBTYPE_I4           

	var A001USER_STATE_ACT_MOVE_UPRIGHT_LTM               =28;  
	var A001USER_STATE_ACT_MOVE_UPRIGHT_LTM_STR           ="move_upright_ltm";           // DBTYPE_I4           

	var A001USER_STATE_ACT_MOVE_UPRIGHT_HEI               =29;  
	var A001USER_STATE_ACT_MOVE_UPRIGHT_HEI_STR           ="move_upright_hei";           // DBTYPE_R4           

	var A001USER_STATE_ACT_PRC_S                          =30;  
	var A001USER_STATE_ACT_PRC_S_STR                      ="prc_s";                      // DBTYPE_WVARCHAR     

	var A001USER_STATE_ACT_PRC_K                          =31;  
	var A001USER_STATE_ACT_PRC_K_STR                      ="prc_k";                      // DBTYPE_WVARCHAR     

	var A001USER_STATE_ACT_PRC_E                          =32;  
	var A001USER_STATE_ACT_PRC_E_STR                      ="prc_e";                      // DBTYPE_WVARCHAR     

	var A001USER_STATE_ACT_STA_ACT_SUM                    =33;  
	var A001USER_STATE_ACT_STA_ACT_SUM_STR                ="sta_act_sum";                // DBTYPE_I4           

	var A001USER_STATE_ACT_STA_ACT_NAME                   =34;  
	var A001USER_STATE_ACT_STA_ACT_NAME_STR               ="sta_act_name";               // DBTYPE_WVARCHAR     动作文件名

	var A001USER_STATE_ACT_STA_INPUT                      =35;  
	var A001USER_STATE_ACT_STA_INPUT_STR                  ="sta_input";                  // DBTYPE_WVARCHAR     

	var A001USER_STATE_ACT_STA_PREV                       =36;  
	var A001USER_STATE_ACT_STA_PREV_STR                   ="sta_prev";                   // DBTYPE_WVARCHAR     

	var A001USER_STATE_ACT_STA_NEXT                       =37;  
	var A001USER_STATE_ACT_STA_NEXT_STR                   ="sta_next";                   // DBTYPE_WVARCHAR     

	var A001USER_STATE_ACT_STA_NEXT_TM                    =38;  
	var A001USER_STATE_ACT_STA_NEXT_TM_STR                ="sta_next_tm";                // DBTYPE_I4           

	var A001USER_STATE_ACT_RECOVERY                       =39;  
	var A001USER_STATE_ACT_RECOVERY_STR                   ="recovery";                   // DBTYPE_I4           

	var A001USER_STATE_ACT_PRC_TYPE                       =40;  
	var A001USER_STATE_ACT_PRC_TYPE_STR                   ="prc_type";                   // DBTYPE_WVARCHAR     

	var A001USER_STATE_ACT_MOVE_SPEED                     =41;  
	var A001USER_STATE_ACT_MOVE_SPEED_STR                 ="move_speed";                 // DBTYPE_R4           移动速度   (米/秒)

	var A001USER_STATE_ACT_MOVE_ANGLE                     =42;  
	var A001USER_STATE_ACT_MOVE_ANGLE_STR                 ="move_angle";                 // DBTYPE_I4           

	var A001USER_STATE_ACT_FLOAT_NEXT                     =43;  
	var A001USER_STATE_ACT_FLOAT_NEXT_STR                 ="float_next";                 // DBTYPE_WVARCHAR     角色腾空后的状态改变方式序列

	var A001USER_STATE_ACT_FALL_GNEXT                     =44;  
	var A001USER_STATE_ACT_FALL_GNEXT_STR                 ="fall_gnext";                 // DBTYPE_WVARCHAR     角色落地后的状态改变方式序列

	var A001USER_STATE_ACT_IMPACT_NEXT                    =45;  
	var A001USER_STATE_ACT_IMPACT_NEXT_STR                ="impact_next";                // DBTYPE_WVARCHAR     角色与物理面发生碰撞后的状态改变方式序列

	var A001USER_STATE_ACT_REMAINTM                       =46;  
	var A001USER_STATE_ACT_REMAINTM_STR                   ="remaintm";                   // DBTYPE_I4           自循环状态的维持时间

	var A001USER_STATE_ACT_REMAIN_NEXT                    =47;  
	var A001USER_STATE_ACT_REMAIN_NEXT_STR                ="remain_next";                // DBTYPE_WVARCHAR     自循环状态在维持时间到了之后的状态改变方式序列

	var A001USER_STATE_ACT_SELF_PAUSE                     =48;  
	var A001USER_STATE_ACT_SELF_PAUSE_STR                 ="self_pause";                 // DBTYPE_I4           击中对手后自身停顿时间

	var A001USER_STATE_ACT_RIVAL_PAUSE                    =49;  
	var A001USER_STATE_ACT_RIVAL_PAUSE_STR                ="rival_pause";                // DBTYPE_I4           击中对手后对手停顿时间

	var A001USER_STATE_ACT_MANUAL_DELAY                   =50;  
	var A001USER_STATE_ACT_MANUAL_DELAY_STR               ="manual_delay";               // DBTYPE_I4           进入状态多长时间后触发体力的增减

	var A001USER_STATE_ACT_MANUAL_GAP                     =51;  
	var A001USER_STATE_ACT_MANUAL_GAP_STR                 ="manual_gap";                 // DBTYPE_I4           多长时间进行一次体力的增减

	var A001USER_STATE_ACT_MANUAL_INCRESE                 =52;  
	var A001USER_STATE_ACT_MANUAL_INCRESE_STR             ="manual_increse";             // DBTYPE_R4           进行一次体力增减的数量（如果此值大于一，则直接作为体力的增量，如果小于一则按照体力上限与此值的乘积进行增减）

	var A001USER_STATE_ACT_SKILLID                        =53;  
	var A001USER_STATE_ACT_SKILLID_STR                    ="skillid";                    // DBTYPE_I4           对应的技能id

	var A001USER_STATE_ACT_LOCK_RADIUS                    =54;  
	var A001USER_STATE_ACT_LOCK_RADIUS_STR                ="lock_radius";                // DBTYPE_R4           锁敌半径

	var A001USER_STATE_ACT_CHGCHAT_STATE                  =55;  
	var A001USER_STATE_ACT_CHGCHAT_STATE_STR              ="chgchat_state";              // DBTYPE_I4           换人后翻转的状态

	var A001USER_STATE_ACT_SKILLLV                        =56;  
	var A001USER_STATE_ACT_SKILLLV_STR                    ="skilllv";                    // DBTYPE_I4           对应的技能等级

	var A001USER_STATE_ACT_MANUALFAILSTATE                =57;  
	var A001USER_STATE_ACT_MANUALFAILSTATE_STR            ="manualfailstate";            // DBTYPE_I4           体力耗完后翻转到什么状态

	var A001USER_STATE_ACT_PLUSSKILLS                     =58;  
	var A001USER_STATE_ACT_PLUSSKILLS_STR                 ="plusskills";                 // DBTYPE_WVARCHAR     被动技能ID 用;分隔

	var A001USER_STATE_ACT_ISNETSEND                      =59;  
	var A001USER_STATE_ACT_ISNETSEND_STR                  ="isNetSend";                  // DBTYPE_BOOL         是否要经过网络发送

	var A001USER_STATE_ACT_ISSELFMOVEACT                  =60;  
	var A001USER_STATE_ACT_ISSELFMOVEACT_STR              ="isSelfMoveAct";              // DBTYPE_BOOL         是否是自带位移的动作

	var A001USER_STATE_ACT_BLENDDURATION                  =61;  
	var A001USER_STATE_ACT_BLENDDURATION_STR              ="BlendDuration";              // DBTYPE_R4           动作融合

	var A001USER_STATE_ACT_EFT_DELETE                     =62;  
	var A001USER_STATE_ACT_EFT_DELETE_STR                 ="eft_delete";                 // DBTYPE_BOOL         在改变状态后是否删除特效,是表示改变状态后立即删除,否表示到时间删除,否的话结束时间不能为-1,否则永远删除不了

	var A001USER_STATE_ACT_CHECKSCRIPT                    =63;  
	var A001USER_STATE_ACT_CHECKSCRIPT_STR                ="CheckScript";                // DBTYPE_WVARCHAR     状态进入的脚本条件

	var A001USER_STATE_ACT_ISNEWACTRESET                  =64;  
	var A001USER_STATE_ACT_ISNEWACTRESET_STR              ="isNewActReset";              // DBTYPE_BOOL         进入新的相同动作后是否重置动作


	var UPLEVEL                                           ="UpLevel";
	var A001USER_UPLEVEL_LEVELID                          =0;   
	var A001USER_UPLEVEL_LEVELID_STR                      ="LevelId";                    // DBTYPE_I4           第一位数字1：网前力量型 2：底线力量型 3：网前技巧型 4：底线技巧型

	var A001USER_UPLEVEL_FORCE                            =1;   
	var A001USER_UPLEVEL_FORCE_STR                        ="Force";                      // DBTYPE_I4           力量：攻击力。

	var A001USER_UPLEVEL_CELERITY                         =2;   
	var A001USER_UPLEVEL_CELERITY_STR                     ="Celerity";                   // DBTYPE_I4           敏捷：防御力。

	var A001USER_UPLEVEL_CONSTITUTION                     =3;   
	var A001USER_UPLEVEL_CONSTITUTION_STR                 ="Constitution";               // DBTYPE_I4           体质：生命值

	var A001USER_UPLEVEL_SNAP                             =4;   
	var A001USER_UPLEVEL_SNAP_STR                         ="Snap";                       // DBTYPE_I4           活力：体力回复。

	var A001USER_UPLEVEL_ATTACKMIN                        =5;   
	var A001USER_UPLEVEL_ATTACKMIN_STR                    ="AttackMin";                  // DBTYPE_I4           攻击：人物所能给对象造成伤害的最小值。

	var A001USER_UPLEVEL_ATTACKMAX                        =6;   
	var A001USER_UPLEVEL_ATTACKMAX_STR                    ="AttackMax";                  // DBTYPE_I4           攻击：人物所能给对象造成伤害的最大值。

	var A001USER_UPLEVEL_RECOVERY                         =7;   
	var A001USER_UPLEVEL_RECOVERY_STR                     ="Recovery";                   // DBTYPE_I4           防御：人物对受到伤害的豁免程度。

	var A001USER_UPLEVEL_LIFE                             =8;   
	var A001USER_UPLEVEL_LIFE_STR                         ="Life";                       // DBTYPE_I4           生命值：人物的生命最大值。

	var A001USER_UPLEVEL_ENERGY                           =9;   
	var A001USER_UPLEVEL_ENERGY_STR                       ="Energy";                     // DBTYPE_I4           体力：人物的体力最大值。

	var A001USER_UPLEVEL_RESUMEENERGY                     =10;  
	var A001USER_UPLEVEL_RESUMEENERGY_STR                 ="ResumeEnergy";               // DBTYPE_I4           回体：人物回复体力的速度。

	var A001USER_UPLEVEL_RESUMELIFE                       =11;  
	var A001USER_UPLEVEL_RESUMELIFE_STR                   ="ResumeLife";                 // DBTYPE_I4           回血：人物回复生命的速度。

	var A001USER_UPLEVEL_SPEED                            =12;  
	var A001USER_UPLEVEL_SPEED_STR                        ="Speed";                      // DBTYPE_I4           速度：人物移动的速度。

	var A001USER_UPLEVEL_MAXENERGY                        =13;  
	var A001USER_UPLEVEL_MAXENERGY_STR                    ="MaxEnergy";                  // DBTYPE_I4           最大体力

	var A001USER_UPLEVEL_REQUIREEXP                       =14;  
	var A001USER_UPLEVEL_REQUIREEXP_STR                   ="RequireExp";                 // DBTYPE_I4           升级需求经验

	var A001USER_UPLEVEL_ATTPOINT                         =15;  
	var A001USER_UPLEVEL_ATTPOINT_STR                     ="AttPoint";                   // DBTYPE_I4           属性点数

	var A001USER_UPLEVEL_SKILLPOINT                       =16;  
	var A001USER_UPLEVEL_SKILLPOINT_STR                   ="SkillPoint";                 // DBTYPE_I4           技能点数

	var A001USER_UPLEVEL_DOWERPOINT                       =17;  
	var A001USER_UPLEVEL_DOWERPOINT_STR                   ="DowerPoint";                 // DBTYPE_I4           天赋点数

	var A001USER_UPLEVEL_ENCOURAGE                        =18;  
	var A001USER_UPLEVEL_ENCOURAGE_STR                    ="Encourage";                  // DBTYPE_WVARCHAR     升到这一级的奖励,格式为 物品;num;物品;num;

	var A001USER_UPLEVEL_TSTRENGTH                        =19;  
	var A001USER_UPLEVEL_TSTRENGTH_STR                    ="TStrength";                  // DBTYPE_I4           网球 力量

	var A001USER_UPLEVEL_TSKILL                           =20;  
	var A001USER_UPLEVEL_TSKILL_STR                       ="TSkill";                     // DBTYPE_I4           网球 技巧

	var A001USER_UPLEVEL_TFORCEHAND                       =21;  
	var A001USER_UPLEVEL_TFORCEHAND_STR                   ="TForceHand";                 // DBTYPE_I4           网球 网前

	var A001USER_UPLEVEL_TBACKHAND                        =22;  
	var A001USER_UPLEVEL_TBACKHAND_STR                    ="TBackHand";                  // DBTYPE_I4           网球 后场

	var A001USER_UPLEVEL_TMAXENERGY                       =23;  
	var A001USER_UPLEVEL_TMAXENERGY_STR                   ="TMaxEnergy";                 // DBTYPE_I4           网球 能量

	var A001USER_UPLEVEL_TSERVEFULL                       =24;  
	var A001USER_UPLEVEL_TSERVEFULL_STR                   ="TServeFull";                 // DBTYPE_I4           网球 发球

	var A001USER_UPLEVEL_TSTAMINA                         =25;  
	var A001USER_UPLEVEL_TSTAMINA_STR                     ="TStamina";                   // DBTYPE_I4           网球 体力

	var A001USER_UPLEVEL_DESC                             =26;  
	var A001USER_UPLEVEL_DESC_STR                         ="Desc";                       // DBTYPE_WVARCHAR     类型的文字说明

}
