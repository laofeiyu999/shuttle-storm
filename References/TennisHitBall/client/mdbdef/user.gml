// 鍒涘缓鏃ユ湡:2008-10-15 14:38:08
// Access鏂囦欢鍚�:E:\work\Vnet2Project2008\Project2\tennis\data\mdb\user\user.mdb

set window
{
	var USER                                              ="user.mdb";

	var ATTACKDEF                                         ="attackdef";
	var USER_ATTACKDEF_STATE_INDEX                        =0;   
	var USER_ATTACKDEF_STATE_INDEX_STR                    ="state_index";                // DBTYPE_I4           鐘舵�佺储寮�

	var USER_ATTACKDEF_STATE_STR                          =1;   
	var USER_ATTACKDEF_STATE_STR_STR                      ="state_str";                  // DBTYPE_WVARCHAR     鐘舵�佹敞閲�

	var USER_ATTACKDEF_PARTS1_INDEX                       =2;   
	var USER_ATTACKDEF_PARTS1_INDEX_STR                   ="parts1_index";               // DBTYPE_I4           閮ㄤ欢涓�绱㈠紩

	var USER_ATTACKDEF_PARTS1_STR                         =3;   
	var USER_ATTACKDEF_PARTS1_STR_STR                     ="parts1_str";                 // DBTYPE_WVARCHAR     閮ㄤ欢涓�娉ㄩ噴

	var USER_ATTACKDEF_PARTS1_BLADESTTM                   =4;   
	var USER_ATTACKDEF_PARTS1_BLADESTTM_STR               ="parts1_bladesttm";           // DBTYPE_I4           閮ㄤ欢涓�鍒�鍏夊紑濮嬫椂闂�

	var USER_ATTACKDEF_PARTS1_BLADEEDTM                   =5;   
	var USER_ATTACKDEF_PARTS1_BLADEEDTM_STR               ="parts1_bladeedtm";           // DBTYPE_I4           閮ㄤ欢涓�鍒�鍏夌粨鏉熸椂闂�

	var USER_ATTACKDEF_PARTS1_HITPAUSETM                  =6;   
	var USER_ATTACKDEF_PARTS1_HITPAUSETM_STR              ="parts1_hitpausetm";          // DBTYPE_I4           鍑讳腑鍚庝富鍔ㄦ柟鍋滈】鏃堕棿

	var USER_ATTACKDEF_PARTS1_BEHITPAUSETM                =7;   
	var USER_ATTACKDEF_PARTS1_BEHITPAUSETM_STR            ="parts1_behitpausetm";        // DBTYPE_I4           鍑讳腑鍚庤��鍔ㄦ柟鍋滈】鏃堕棿

	var USER_ATTACKDEF_PARTS1_JUDGESTTM                   =8;   
	var USER_ATTACKDEF_PARTS1_JUDGESTTM_STR               ="parts1_judgesttm";           // DBTYPE_I4           閮ㄤ欢涓�鍒ゅ畾寮�濮嬫椂闂�

	var USER_ATTACKDEF_PARTS1_JUDGEEDTM                   =9;   
	var USER_ATTACKDEF_PARTS1_JUDGEEDTM_STR               ="parts1_judgeedtm";           // DBTYPE_I4           閮ㄤ欢涓�鍒ゅ畾缁撴潫鏃堕棿

	var USER_ATTACKDEF_PARTS1_REACTSTATE                  =10;  
	var USER_ATTACKDEF_PARTS1_REACTSTATE_STR              ="parts1_reactstate";          // DBTYPE_I4           琚�閮ㄤ欢涓�鍑讳腑鍚庣殑鍙嶅簲鐘舵��

	var USER_ATTACKDEF_PARTS1_EVEN_IMPULSE                =11;  
	var USER_ATTACKDEF_PARTS1_EVEN_IMPULSE_STR            ="parts1_even_impulse";        // DBTYPE_R4           閮ㄤ欢涓�鐨勬按骞冲啿閲�

	var USER_ATTACKDEF_PARTS1_EVEN_ANGLE                  =12;  
	var USER_ATTACKDEF_PARTS1_EVEN_ANGLE_STR              ="parts1_even_angle";          // DBTYPE_R4           閮ㄤ欢涓�鐨勬按骞冲啿閲忕殑淇�姝ｈ�掑害

	var USER_ATTACKDEF_PARTS1_UP_IMPULSE                  =13;  
	var USER_ATTACKDEF_PARTS1_UP_IMPULSE_STR              ="parts1_up_impulse";          // DBTYPE_R4           閮ㄤ欢涓�鐨勫瀭鐩村啿閲�

	var USER_ATTACKDEF_PARTS1_HURT                        =14;  
	var USER_ATTACKDEF_PARTS1_HURT_STR                    ="parts1_hurt";                // DBTYPE_R4           閮ㄤ欢涓�鐨勪激瀹冲��

	var USER_ATTACKDEF_PARTS1_HAVEDONE                    =15;  
	var USER_ATTACKDEF_PARTS1_HAVEDONE_STR                ="parts1_havedone";            // DBTYPE_I4           鏄�鍚﹀凡缁忓�勭悊杩囷紙澶勭悊鐨勬槸琚�鏀绘柟鍝�涓�閮ㄤ欢锛�

	var USER_ATTACKDEF_PARTS_BACKOFFLEN                   =16;  
	var USER_ATTACKDEF_PARTS_BACKOFFLEN_STR               ="parts_backofflen";           // DBTYPE_R4           琚�鏀诲嚮鏂逛綅绉婚暱搴�

	var USER_ATTACKDEF_PARTS_BACKOFFTM                    =17;  
	var USER_ATTACKDEF_PARTS_BACKOFFTM_STR                ="parts_backofftm";            // DBTYPE_I4           琚�鏀诲嚮鏂逛綅绉绘椂闂�

	var USER_ATTACKDEF_PARTS_ACTTM                        =18;  
	var USER_ATTACKDEF_PARTS_ACTTM_STR                    ="parts_acttm";                // DBTYPE_I4           琚�鏀诲嚮鏂硅��鍔ㄥ姩浣滄寔缁�鏃堕棿

	var USER_ATTACKDEF_PARTS_BACKOFFANGLE                 =19;  
	var USER_ATTACKDEF_PARTS_BACKOFFANGLE_STR             ="parts_backoffangle";         // DBTYPE_R4           琚�鏀诲嚮鏂逛綅绉昏�掑害

	var USER_ATTACKDEF_AUTOINDEX                          =20;  
	var USER_ATTACKDEF_AUTOINDEX_STR                      ="autoindex";                  // DBTYPE_I4           涓婚敭锛堟棤鍔熻兘锛�

	var USER_ATTACKDEF_PARTS_ATT                          =21;  
	var USER_ATTACKDEF_PARTS_ATT_STR                      ="parts_att";                  // DBTYPE_R4           鏀诲嚮鍔涘�嶆瘮

	var USER_ATTACKDEF_ACC_ATT                            =22;  
	var USER_ATTACKDEF_ACC_ATT_STR                        ="acc_att";                    // DBTYPE_R4           闄勫姞浼ゅ��

	var USER_ATTACKDEF_BLEED_COUNT                        =23;  
	var USER_ATTACKDEF_BLEED_COUNT_STR                    ="bleed_count";                // DBTYPE_I4           鍒嗗嚑娆℃樉绀轰激琛�

	var USER_ATTACKDEF_BLADENAME                          =24;  
	var USER_ATTACKDEF_BLADENAME_STR                      ="bladename";                  // DBTYPE_WVARCHAR     鍒�鍏夋枃浠跺悕

	var USER_ATTACKDEF_BLADEINDEX                         =25;  
	var USER_ATTACKDEF_BLADEINDEX_STR                     ="bladeindex";                 // DBTYPE_I4           鍒�鍏夐儴浠剁储寮�


	var ATTRIBUTEFLAG                                     ="attributeflag";
	var USER_ATTRIBUTEFLAG_FLAG_NAME                      =0;   
	var USER_ATTRIBUTEFLAG_FLAG_NAME_STR                  ="flag_name";                  // DBTYPE_WVARCHAR     鏍囧織浣嶅悕绉�

	var USER_ATTRIBUTEFLAG_FLAG_POS                       =1;   
	var USER_ATTRIBUTEFLAG_FLAG_POS_STR                   ="flag_pos";                   // DBTYPE_I4           绗�鍑犱綅

	var USER_ATTRIBUTEFLAG_FLAG_TURE_SCRIPT               =2;   
	var USER_ATTRIBUTEFLAG_FLAG_TURE_SCRIPT_STR           ="flag_ture_script";           // DBTYPE_WVARCHAR     鏍囧織浣嶄负鐪熸椂鐨勮剼鏈�鍑芥暟

	var USER_ATTRIBUTEFLAG_FLAG_TRUE_OBJ                  =3;   
	var USER_ATTRIBUTEFLAG_FLAG_TRUE_OBJ_STR              ="flag_true_obj";              // DBTYPE_I4           鏍囧織浣嶄负鐪熸椂鐨勮剼鏈�鍑芥暟鎵ц�屽�硅薄

	var USER_ATTRIBUTEFLAG_FLAG_TRUE_PARAM                =4;   
	var USER_ATTRIBUTEFLAG_FLAG_TRUE_PARAM_STR            ="flag_true_param";            // DBTYPE_WVARCHAR     鏍囧織浣嶄负鐪熸椂鐨勮剼鏈�鍑芥暟鍙傛暟

	var USER_ATTRIBUTEFLAG_FLAG_FALSE_SCRIPT              =5;   
	var USER_ATTRIBUTEFLAG_FLAG_FALSE_SCRIPT_STR          ="flag_false_script";          // DBTYPE_WVARCHAR     鏍囧織浣嶄负鍋囨椂鐨勮剼鏈�鍑芥暟

	var USER_ATTRIBUTEFLAG_FLAG_FALSE_OBJ                 =6;   
	var USER_ATTRIBUTEFLAG_FLAG_FALSE_OBJ_STR             ="flag_false_obj";             // DBTYPE_I4           鏍囧織浣嶄负鍋囨椂鐨勮剼鏈�鍑芥暟鎵ц�屽�硅薄

	var USER_ATTRIBUTEFLAG_FLAG_FALSE_PARAM               =7;   
	var USER_ATTRIBUTEFLAG_FLAG_FALSE_PARAM_STR           ="flag_false_param";           // DBTYPE_WVARCHAR     鏍囧織浣嶄负鍋囨椂鐨勮剼鏈�鍑芥暟鍙傛暟


	var CONDITION                                         ="condition";
	var USER_CONDITION_CONDITION_NAME                     =0;   
	var USER_CONDITION_CONDITION_NAME_STR                 ="condition_name";             // DBTYPE_WVARCHAR     

	var USER_CONDITION_CONDITION_ID                       =1;   
	var USER_CONDITION_CONDITION_ID_STR                   ="condition_id";               // DBTYPE_I4           

	var USER_CONDITION_SKILL_CONDITION                    =2;   
	var USER_CONDITION_SKILL_CONDITION_STR                ="skill_condition";            // DBTYPE_WVARCHAR     鎶�鑳芥潯浠�

	var USER_CONDITION_GOODS_CONDITION                    =3;   
	var USER_CONDITION_GOODS_CONDITION_STR                ="goods_condition";            // DBTYPE_WVARCHAR     鐗╁搧鏉′欢

	var USER_CONDITION_BUFFER_CONDITION                   =4;   
	var USER_CONDITION_BUFFER_CONDITION_STR               ="buffer_condition";           // DBTYPE_WVARCHAR     buffer鏉′欢

	var USER_CONDITION_PARTS_CONDITION                    =5;   
	var USER_CONDITION_PARTS_CONDITION_STR                ="parts_condition";            // DBTYPE_WVARCHAR     閮ㄤ欢鏉′欢

	var USER_CONDITION_CHARACTER_CONDITION                =6;   
	var USER_CONDITION_CHARACTER_CONDITION_STR            ="character_condition";        // DBTYPE_WVARCHAR     瑙掕壊鏉′欢

	var USER_CONDITION_SCEEN_CONDITION                    =7;   
	var USER_CONDITION_SCEEN_CONDITION_STR                ="sceen_condition";            // DBTYPE_WVARCHAR     鍦烘櫙鏉′欢

	var USER_CONDITION_STATE_CONDITION                    =8;   
	var USER_CONDITION_STATE_CONDITION_STR                ="state_condition";            // DBTYPE_WVARCHAR     鐘舵�佹潯浠�

	var USER_CONDITION_ATTRIBUTE_CONDITION                =9;   
	var USER_CONDITION_ATTRIBUTE_CONDITION_STR            ="attribute_condition";        // DBTYPE_WVARCHAR     灞炴�ф爣蹇椾綅鏉′欢


	var DOWER                                             ="dower";
	var USER_DOWER_DOWERID                                =0;   
	var USER_DOWER_DOWERID_STR                            ="dowerid";                    // DBTYPE_I4           澶╄祴ID

	var USER_DOWER_DNAME                                  =1;   
	var USER_DOWER_DNAME_STR                              ="dName";                      // DBTYPE_WVARCHAR     澶╄祴鍚嶇О

	var USER_DOWER_DEXPLAIN                               =2;   
	var USER_DOWER_DEXPLAIN_STR                           ="dExplain";                   // DBTYPE_WVARCHAR     澶╄祴璇存槑

	var USER_DOWER_DTYPE                                  =3;   
	var USER_DOWER_DTYPE_STR                              ="dType";                      // DBTYPE_I4           澶╄祴绫诲瀷 濡�: 骞宠　绯�

	var USER_DOWER_DICON                                  =4;   
	var USER_DOWER_DICON_STR                              ="dIcon";                      // DBTYPE_WVARCHAR     澶╄祴鍥炬爣

	var USER_DOWER_DMAXPOINT                              =5;   
	var USER_DOWER_DMAXPOINT_STR                          ="dMaxPoint";                  // DBTYPE_I4           澶╄祴鏈�澶х骇鍒�鎴栫偣鏁�

	var USER_DOWER_DCONDITION                             =6;   
	var USER_DOWER_DCONDITION_STR                         ="dCondition";                 // DBTYPE_WVARCHAR     鍒拌揪璇ュぉ璧嬬殑鏉′欢 鍏�寮忎负:

	var USER_DOWER_DTATT                                  =7;   
	var USER_DOWER_DTATT_STR                              ="dTAtt";                      // DBTYPE_WVARCHAR     澶╄祴瀵瑰熀鏈�灞炴�у奖鍝嶅��: 鐖嗗嚮鐜囧�炲姞 1% 鍏�寮忎负: user.ap.dCurPoint * 3

	var USER_DOWER_DTOUCH                                 =8;   
	var USER_DOWER_DTOUCH_STR                             ="dTouch";                     // DBTYPE_WVARCHAR     澶╄祴瀵瑰叾瀹冨睘鎬у奖鍝嶅��: 瀛︿細鏂扮殑鎶�鑳�  鍏�寮忎负: skill.add(3); skill.add(5); buff.add(6)

	var USER_DOWER_DDELTRIGGER                            =9;   
	var USER_DOWER_DDELTRIGGER_STR                        ="dDelTrigger";                // DBTYPE_WVARCHAR     澶╄祴琚�鍒犻櫎鍚庣殑褰卞搷濡�: 瀛︿細澶╄祴鎶�鑳借��鍒犻櫎 鍏�寮忎负: skill.del(3)


	var FLAGDEF                                           ="flagdef";
	var USER_FLAGDEF_ATTRIBUTE_NAME                       =0;   
	var USER_FLAGDEF_ATTRIBUTE_NAME_STR                   ="attribute_name";             // DBTYPE_WVARCHAR     

	var USER_FLAGDEF_ATTRIBUTE_INDEX                      =1;   
	var USER_FLAGDEF_ATTRIBUTE_INDEX_STR                  ="attribute_index";            // DBTYPE_I4           

	var USER_FLAGDEF_FLAG1                                =2;   
	var USER_FLAGDEF_FLAG1_STR                            ="flag1";                      // DBTYPE_I4           

	var USER_FLAGDEF_FLAG2                                =3;   
	var USER_FLAGDEF_FLAG2_STR                            ="flag2";                      // DBTYPE_I4           

	var USER_FLAGDEF_FLAG3                                =4;   
	var USER_FLAGDEF_FLAG3_STR                            ="flag3";                      // DBTYPE_I4           

	var USER_FLAGDEF_FLAG4                                =5;   
	var USER_FLAGDEF_FLAG4_STR                            ="flag4";                      // DBTYPE_I4           

	var USER_FLAGDEF_FLAG5                                =6;   
	var USER_FLAGDEF_FLAG5_STR                            ="flag5";                      // DBTYPE_I4           

	var USER_FLAGDEF_FLAG6                                =7;   
	var USER_FLAGDEF_FLAG6_STR                            ="flag6";                      // DBTYPE_I4           

	var USER_FLAGDEF_FLAG7                                =8;   
	var USER_FLAGDEF_FLAG7_STR                            ="flag7";                      // DBTYPE_I4           

	var USER_FLAGDEF_FLAG8                                =9;   
	var USER_FLAGDEF_FLAG8_STR                            ="flag8";                      // DBTYPE_I4           

	var USER_FLAGDEF_FLAG9                                =10;  
	var USER_FLAGDEF_FLAG9_STR                            ="flag9";                      // DBTYPE_I4           

	var USER_FLAGDEF_FLAG10                               =11;  
	var USER_FLAGDEF_FLAG10_STR                           ="flag10";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG11                               =12;  
	var USER_FLAGDEF_FLAG11_STR                           ="flag11";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG12                               =13;  
	var USER_FLAGDEF_FLAG12_STR                           ="flag12";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG13                               =14;  
	var USER_FLAGDEF_FLAG13_STR                           ="flag13";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG14                               =15;  
	var USER_FLAGDEF_FLAG14_STR                           ="flag14";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG15                               =16;  
	var USER_FLAGDEF_FLAG15_STR                           ="flag15";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG16                               =17;  
	var USER_FLAGDEF_FLAG16_STR                           ="flag16";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG17                               =18;  
	var USER_FLAGDEF_FLAG17_STR                           ="flag17";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG18                               =19;  
	var USER_FLAGDEF_FLAG18_STR                           ="flag18";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG19                               =20;  
	var USER_FLAGDEF_FLAG19_STR                           ="flag19";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG20                               =21;  
	var USER_FLAGDEF_FLAG20_STR                           ="flag20";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG21                               =22;  
	var USER_FLAGDEF_FLAG21_STR                           ="flag21";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG22                               =23;  
	var USER_FLAGDEF_FLAG22_STR                           ="flag22";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG23                               =24;  
	var USER_FLAGDEF_FLAG23_STR                           ="flag23";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG24                               =25;  
	var USER_FLAGDEF_FLAG24_STR                           ="flag24";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG25                               =26;  
	var USER_FLAGDEF_FLAG25_STR                           ="flag25";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG26                               =27;  
	var USER_FLAGDEF_FLAG26_STR                           ="flag26";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG27                               =28;  
	var USER_FLAGDEF_FLAG27_STR                           ="flag27";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG28                               =29;  
	var USER_FLAGDEF_FLAG28_STR                           ="flag28";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG29                               =30;  
	var USER_FLAGDEF_FLAG29_STR                           ="flag29";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG30                               =31;  
	var USER_FLAGDEF_FLAG30_STR                           ="flag30";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG31                               =32;  
	var USER_FLAGDEF_FLAG31_STR                           ="flag31";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG32                               =33;  
	var USER_FLAGDEF_FLAG32_STR                           ="flag32";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG33                               =34;  
	var USER_FLAGDEF_FLAG33_STR                           ="flag33";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG34                               =35;  
	var USER_FLAGDEF_FLAG34_STR                           ="flag34";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG35                               =36;  
	var USER_FLAGDEF_FLAG35_STR                           ="flag35";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG36                               =37;  
	var USER_FLAGDEF_FLAG36_STR                           ="flag36";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG37                               =38;  
	var USER_FLAGDEF_FLAG37_STR                           ="flag37";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG38                               =39;  
	var USER_FLAGDEF_FLAG38_STR                           ="flag38";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG39                               =40;  
	var USER_FLAGDEF_FLAG39_STR                           ="flag39";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG40                               =41;  
	var USER_FLAGDEF_FLAG40_STR                           ="flag40";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG41                               =42;  
	var USER_FLAGDEF_FLAG41_STR                           ="flag41";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG42                               =43;  
	var USER_FLAGDEF_FLAG42_STR                           ="flag42";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG43                               =44;  
	var USER_FLAGDEF_FLAG43_STR                           ="flag43";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG44                               =45;  
	var USER_FLAGDEF_FLAG44_STR                           ="flag44";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG45                               =46;  
	var USER_FLAGDEF_FLAG45_STR                           ="flag45";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG46                               =47;  
	var USER_FLAGDEF_FLAG46_STR                           ="flag46";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG47                               =48;  
	var USER_FLAGDEF_FLAG47_STR                           ="flag47";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG48                               =49;  
	var USER_FLAGDEF_FLAG48_STR                           ="flag48";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG49                               =50;  
	var USER_FLAGDEF_FLAG49_STR                           ="flag49";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG50                               =51;  
	var USER_FLAGDEF_FLAG50_STR                           ="flag50";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG51                               =52;  
	var USER_FLAGDEF_FLAG51_STR                           ="flag51";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG52                               =53;  
	var USER_FLAGDEF_FLAG52_STR                           ="flag52";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG53                               =54;  
	var USER_FLAGDEF_FLAG53_STR                           ="flag53";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG54                               =55;  
	var USER_FLAGDEF_FLAG54_STR                           ="flag54";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG55                               =56;  
	var USER_FLAGDEF_FLAG55_STR                           ="flag55";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG56                               =57;  
	var USER_FLAGDEF_FLAG56_STR                           ="flag56";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG57                               =58;  
	var USER_FLAGDEF_FLAG57_STR                           ="flag57";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG58                               =59;  
	var USER_FLAGDEF_FLAG58_STR                           ="flag58";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG59                               =60;  
	var USER_FLAGDEF_FLAG59_STR                           ="flag59";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG60                               =61;  
	var USER_FLAGDEF_FLAG60_STR                           ="flag60";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG61                               =62;  
	var USER_FLAGDEF_FLAG61_STR                           ="flag61";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG62                               =63;  
	var USER_FLAGDEF_FLAG62_STR                           ="flag62";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG63                               =64;  
	var USER_FLAGDEF_FLAG63_STR                           ="flag63";                     // DBTYPE_I4           

	var USER_FLAGDEF_FLAG64                               =65;  
	var USER_FLAGDEF_FLAG64_STR                           ="flag64";                     // DBTYPE_I4           


	var GAMERULE                                          ="GameRule";
	var USER_GAMERULE_ID                                  =0;   
	var USER_GAMERULE_ID_STR                              ="ID";                         // DBTYPE_I4           

	var USER_GAMERULE_RULE                                =1;   
	var USER_GAMERULE_RULE_STR                            ="RULE";                       // DBTYPE_WVARCHAR     


	var HITACT                                            ="HitAct";
	var USER_HITACT_AUTOID                                =0;   
	var USER_HITACT_AUTOID_STR                            ="AutoID";                     // DBTYPE_I4           

	var USER_HITACT_INDEX                                 =1;   
	var USER_HITACT_INDEX_STR                             ="index";                      // DBTYPE_I4           1.鍑荤悆鏂瑰紡绱㈠紩(椤哄簭)

	var USER_HITACT_HITNAME                               =2;   
	var USER_HITACT_HITNAME_STR                           ="hitName";                    // DBTYPE_WVARCHAR     2.鍑荤悆鍚嶇О

	var USER_HITACT_HITTYPE                               =3;   
	var USER_HITACT_HITTYPE_STR                           ="hitType";                    // DBTYPE_I4           3.鍑荤悆绫诲瀷(0.鏀鹃珮 1.鍓婄悆 2.涓婃棆 3.鎴�鍑� 4.鍙戠悆(骞冲嚮) 5.鎸＄悆 6.鏁戠悆 7.鎵ｆ潃 8.鍙戠悆(澶栨棆))

	var USER_HITACT_HITNOFALL                             =4;   
	var USER_HITACT_HITNOFALL_STR                         ="hitNoFall";                  // DBTYPE_BOOL         4.娌℃湁鐫�鍦版槸鍚﹀彲浠ュ嚮鎵�

	var USER_HITACT_HITFALL                               =5;   
	var USER_HITACT_HITFALL_STR                           ="hitFall";                    // DBTYPE_BOOL         5.钀藉湴鍚庤兘鍚﹀嚮鎵�

	var USER_HITACT_HITFOREGROUND                         =6;   
	var USER_HITACT_HITFOREGROUND_STR                     ="hitForeGround";              // DBTYPE_BOOL         6.鏄�鍚﹀湪鍓嶅満鍙�浠ュ嚮鎵�

	var USER_HITACT_HITBACKGROUND                         =7;   
	var USER_HITACT_HITBACKGROUND_STR                     ="hitBackGround";              // DBTYPE_BOOL         7.鏄�鍚﹀湪鍚庡満鍙�浠ュ嚮鎵�

	var USER_HITACT_FULLTIME                              =8;   
	var USER_HITACT_FULLTIME_STR                          ="fullTime";                   // DBTYPE_I4           8.鍏呰冻鍑绘墦鏃堕棿

	var USER_HITACT_SHORTESTTIME                          =9;   
	var USER_HITACT_SHORTESTTIME_STR                      ="shortestTime";               // DBTYPE_I4           鏈�鐭�鍑绘墦鏃堕棿

	var USER_HITACT_HANDTYPE                              =10;  
	var USER_HITACT_HANDTYPE_STR                          ="handType";                   // DBTYPE_I4           10.姝ｅ弽鎵嬪姩浣�(0.姝ｆ墜 1.鍙嶆墜 2.涓嶅垎姝ｅ弽鎵�)

	var USER_HITACT_CANSTOREPOWER                         =11;  
	var USER_HITACT_CANSTOREPOWER_STR                     ="canStorePower";              // DBTYPE_BOOL         鑳藉惁钃勫姏

	var USER_HITACT_HITPOSX                               =12;  
	var USER_HITACT_HITPOSX_STR                           ="hitPosX";                    // DBTYPE_R4           鍑荤悆鐐筙

	var USER_HITACT_HITPOSY                               =13;  
	var USER_HITACT_HITPOSY_STR                           ="hitPosY";                    // DBTYPE_R4           鍑荤悆鐐筜

	var USER_HITACT_HITPOSZ                               =14;  
	var USER_HITACT_HITPOSZ_STR                           ="hitPosZ";                    // DBTYPE_R4           鍑荤悆鐐筞

	var USER_HITACT_CANHITFAR                             =15;  
	var USER_HITACT_CANHITFAR_STR                         ="canHitFar";                  // DBTYPE_BOOL         15.鏄�鍚﹁兘鎵撹繙鑼冨洿鐨勭悆

	var USER_HITACT_CANHITNEAR                            =16;  
	var USER_HITACT_CANHITNEAR_STR                        ="canHitNear";                 // DBTYPE_BOOL         鏄�鍚﹁兘鎵撹繎鑼冨洿鐨勭悆

	var USER_HITACT_CANHITBIGROUND                        =17;  
	var USER_HITACT_CANHITBIGROUND_STR                    ="canHitBigRound";             // DBTYPE_BOOL         鏄�鍚﹁兘鎵撳ぇ鍦�

	var USER_HITACT_HITACT                                =18;  
	var USER_HITACT_HITACT_STR                            ="hitAct";                     // DBTYPE_I4           鎵撳嚮鍔ㄤ綔

	var USER_HITACT_TOTALFRAME                            =19;  
	var USER_HITACT_TOTALFRAME_STR                        ="totalFrame";                 // DBTYPE_I4           鎬诲抚鏁�(鍑荤悆鍔ㄤ綔)

	var USER_HITACT_HITFRAME                              =20;  
	var USER_HITACT_HITFRAME_STR                          ="hitFrame";                   // DBTYPE_I4           20.鎵撳嚮甯ф暟(鍑荤悆鍔ㄤ綔)

	var USER_HITACT_HITTIME                               =21;  
	var USER_HITACT_HITTIME_STR                           ="hitTime";                    // DBTYPE_I4           鎵撳嚮鍔ㄤ綔鏃堕棿(鍑荤悆鍔ㄤ綔)

	var USER_HITACT_PULLACT                               =22;  
	var USER_HITACT_PULLACT_STR                           ="pullAct";                    // DBTYPE_I4           鎷夋媿鍔ㄤ綔

	var USER_HITACT_PULLMINTIME                           =23;  
	var USER_HITACT_PULLMINTIME_STR                       ="pullMinTime";                // DBTYPE_I4           鎷夋媿鏈�鐭�鏃堕棿

	var USER_HITACT_PULLMAXTIME                           =24;  
	var USER_HITACT_PULLMAXTIME_STR                       ="pullMaxTime";                // DBTYPE_I4           鎷夋媿鏈�闀挎椂闂�

	var USER_HITACT_PULLPOSX                              =25;  
	var USER_HITACT_PULLPOSX_STR                          ="pullPosX";                   // DBTYPE_R4           25.鎷夋媿鐐筙

	var USER_HITACT_PULLPOSY                              =26;  
	var USER_HITACT_PULLPOSY_STR                          ="pullPosY";                   // DBTYPE_R4           鍑荤悆鐐筜

	var USER_HITACT_PULLPOSZ                              =27;  
	var USER_HITACT_PULLPOSZ_STR                          ="pullPosZ";                   // DBTYPE_R4           鎷夋媿鐐筞

	var USER_HITACT_RETURNTRACK0                          =28;  
	var USER_HITACT_RETURNTRACK0_STR                      ="returnTrack0";               // DBTYPE_I4           鍓嶅満钃勫姏杞ㄨ抗

	var USER_HITACT_RETURNTRACK1                          =29;  
	var USER_HITACT_RETURNTRACK1_STR                      ="returnTrack1";               // DBTYPE_I4           鍚庡満钃勫姏杞ㄨ抗

	var USER_HITACT_RETURNTRACK2                          =30;  
	var USER_HITACT_RETURNTRACK2_STR                      ="returnTrack2";               // DBTYPE_I4           30.鍓嶅満鏅�閫氳建杩�

	var USER_HITACT_RETURNTRACK3                          =31;  
	var USER_HITACT_RETURNTRACK3_STR                      ="returnTrack3";               // DBTYPE_I4           鍚庡満鏅�閫氳建杩�

	var USER_HITACT_CANMISSHIT                            =32;  
	var USER_HITACT_CANMISSHIT_STR                        ="canMissHit";                 // DBTYPE_BOOL         鏄�鍚﹁�ュ姩浣滃彲浠ョ敤浜庢尌绌烘媿

	var USER_HITACT_ISSKILL                               =33;  
	var USER_HITACT_ISSKILL_STR                           ="isSkill";                    // DBTYPE_BOOL         33.鏄�鍚︽槸鎶�鑳藉姩浣� 濡傛灉鏄�鎶�鑳藉垯鎷夋媿淇℃伅,闄ゆ�ｅ弽鎵嬬殑鍑荤悆鍒ゅ畾淇℃伅鏃犳晥

	var USER_HITACT_RETURNTRACK4                          =34;  
	var USER_HITACT_RETURNTRACK4_STR                      ="returnTrack4";               // DBTYPE_I4           34.鎸＄悆杞ㄨ抗

	var USER_HITACT_RETURNTRACK5                          =35;  
	var USER_HITACT_RETURNTRACK5_STR                      ="returnTrack5";               // DBTYPE_I4           35.鍚庡満婊¤搫鍔涜建杩�

	var USER_HITACT_RETURNTRACK6                          =36;  
	var USER_HITACT_RETURNTRACK6_STR                      ="returnTrack6";               // DBTYPE_I4           鍓嶅満婊¤搫鍔涜建杩�

	var USER_HITACT_RETURNTRACK7                          =37;  
	var USER_HITACT_RETURNTRACK7_STR                      ="returnTrack7";               // DBTYPE_I4           棰勭暀

	var USER_HITACT_INTERFACEACT                          =38;  
	var USER_HITACT_INTERFACEACT_STR                      ="interfaceAct";               // DBTYPE_I4           38.姘旀皼鍔ㄤ綔绱㈠紩

	var USER_HITACT_PULLMOVESCALE                         =39;  
	var USER_HITACT_PULLMOVESCALE_STR                     ="pullMoveScale";              // DBTYPE_R4           鎷夋媿绉诲姩鐨勬椂闂存瘮渚�

	var USER_HITACT_RETURNSCRIPT                          =40;  
	var USER_HITACT_RETURNSCRIPT_STR                      ="ReturnScript";               // DBTYPE_WVARCHAR     鍥炵悆璋冪敤鑴氭湰(绛栧垝鍔熻兘鑴氭湰)

	var USER_HITACT___RETURNSCRIPT                        =41;  
	var USER_HITACT___RETURNSCRIPT_STR                    ="__ReturnScript";             // DBTYPE_WVARCHAR     鍥炵悆璋冪敤鑴氭湰(绋嬪簭鑴氭湰)


	var INPUTRULL                                         ="inputrull";
	var USER_INPUTRULL_STATE_NOW                          =0;   
	var USER_INPUTRULL_STATE_NOW_STR                      ="State_now";                  // DBTYPE_I4           0   鐜板湪鐨勭姸鎬佺储寮�

	var USER_INPUTRULL_INPUTINDEX                         =1;   
	var USER_INPUTRULL_INPUTINDEX_STR                     ="inputindex";                 // DBTYPE_I4           1   杈撳叆

	var USER_INPUTRULL_ATTRIBUTE_STATE_NOW                =2;   
	var USER_INPUTRULL_ATTRIBUTE_STATE_NOW_STR            ="attribute_state_now";        // DBTYPE_I4           2   鏍囧織浣�

	var USER_INPUTRULL_CHG_STATE                          =3;   
	var USER_INPUTRULL_CHG_STATE_STR                      ="chg_state";                  // DBTYPE_I4           3   鏀瑰彉鎴愮殑鐘舵�佺储寮�

	var USER_INPUTRULL_CHG_TYPE                           =4;   
	var USER_INPUTRULL_CHG_TYPE_STR                       ="chg_type";                   // DBTYPE_I4           4   绫诲瀷

	var USER_INPUTRULL_CHG_ATTRIBUTE1                     =5;   
	var USER_INPUTRULL_CHG_ATTRIBUTE1_STR                 ="chg_attribute1";             // DBTYPE_I4           5

	var USER_INPUTRULL_CHG_ATT_TYPE1                      =6;   
	var USER_INPUTRULL_CHG_ATT_TYPE1_STR                  ="chg_att_type1";              // DBTYPE_I4           6

	var USER_INPUTRULL_CHG_ATTRIBUT2                      =7;   
	var USER_INPUTRULL_CHG_ATTRIBUT2_STR                  ="chg_attribut2";              // DBTYPE_I4           7

	var USER_INPUTRULL_CHG_ATT_TYPE2                      =8;   
	var USER_INPUTRULL_CHG_ATT_TYPE2_STR                  ="chg_att_type2";              // DBTYPE_I4           8

	var USER_INPUTRULL_AUTOID                             =9;   
	var USER_INPUTRULL_AUTOID_STR                         ="autoid";                     // DBTYPE_I4           9

	var USER_INPUTRULL_ZHUSHI                             =10;  
	var USER_INPUTRULL_ZHUSHI_STR                         ="zhushi";                     // DBTYPE_WVARCHAR     10


	var INTERFACEACT                                      ="InterfaceAct";
	var USER_INTERFACEACT_NAME                            =0;   
	var USER_INTERFACEACT_NAME_STR                        ="name";                       // DBTYPE_WVARCHAR     璇存槑

	var USER_INTERFACEACT_INDEX                           =1;   
	var USER_INTERFACEACT_INDEX_STR                       ="index";                      // DBTYPE_I4           姘旀皼鍔ㄤ綔绱㈠紩

	var USER_INTERFACEACT_ACTINDEX                        =2;   
	var USER_INTERFACEACT_ACTINDEX_STR                    ="actIndex";                   // DBTYPE_I4           姘旀皼鍔ㄤ綔鍔ㄤ綔鍙�

	var USER_INTERFACEACT_CAMPOSX                         =3;   
	var USER_INTERFACEACT_CAMPOSX_STR                     ="camPosX";                    // DBTYPE_R4           鎽勫儚鏈轰綅缃�

	var USER_INTERFACEACT_CAMPOSY                         =4;   
	var USER_INTERFACEACT_CAMPOSY_STR                     ="camPosY";                    // DBTYPE_R4           鎽勫儚鏈轰綅缃�

	var USER_INTERFACEACT_CAMPOSZ                         =5;   
	var USER_INTERFACEACT_CAMPOSZ_STR                     ="camPosZ";                    // DBTYPE_R4           鎽勫儚鏈轰綅缃�

	var USER_INTERFACEACT_CAMLOOKX                        =6;   
	var USER_INTERFACEACT_CAMLOOKX_STR                    ="camLookX";                   // DBTYPE_R4           鎽勫儚鏈烘湞鍚�

	var USER_INTERFACEACT_CAMLOOKY                        =7;   
	var USER_INTERFACEACT_CAMLOOKY_STR                    ="camLookY";                   // DBTYPE_R4           鎽勫儚鏈烘湞鍚�

	var USER_INTERFACEACT_CAMLOOKZ                        =8;   
	var USER_INTERFACEACT_CAMLOOKZ_STR                    ="camLookZ";                   // DBTYPE_R4           鎽勫儚鏈烘湞鍚�


	var KEYDEF                                            ="keydef";
	var USER_KEYDEF_KEYLIST                               =0;   
	var USER_KEYDEF_KEYLIST_STR                           ="KeyList";                    // DBTYPE_WVARCHAR     

	var USER_KEYDEF_TIMELIST                              =1;   
	var USER_KEYDEF_TIMELIST_STR                          ="TimeList";                   // DBTYPE_WVARCHAR     

	var USER_KEYDEF_PRIORITY                              =2;   
	var USER_KEYDEF_PRIORITY_STR                          ="Priority";                   // DBTYPE_I4           

	var USER_KEYDEF_PRIORITYLASTTIME                      =3;   
	var USER_KEYDEF_PRIORITYLASTTIME_STR                  ="PriorityLastTime";           // DBTYPE_I4           

	var USER_KEYDEF_LISTNUM                               =4;   
	var USER_KEYDEF_LISTNUM_STR                           ="ListNum";                    // DBTYPE_I4           

	var USER_KEYDEF_EXPLAIN                               =5;   
	var USER_KEYDEF_EXPLAIN_STR                           ="explain";                    // DBTYPE_WVARCHAR     

	var USER_KEYDEF_AUTOID                                =6;   
	var USER_KEYDEF_AUTOID_STR                            ="autoid";                     // DBTYPE_I4           

	var USER_KEYDEF_LONGTIME                              =7;   
	var USER_KEYDEF_LONGTIME_STR                          ="longtime";                   // DBTYPE_I4           


	var PARTPHYSICS                                       ="PartPhysics";
	var USER_PARTPHYSICS_ID                               =0;   
	var USER_PARTPHYSICS_ID_STR                           ="ID";                         // DBTYPE_I4           

	var USER_PARTPHYSICS_GAMEID                           =1;   
	var USER_PARTPHYSICS_GAMEID_STR                       ="GameID";                     // DBTYPE_I4           

	var USER_PARTPHYSICS_NAME                             =2;   
	var USER_PARTPHYSICS_NAME_STR                         ="Name";                       // DBTYPE_WVARCHAR     

	var USER_PARTPHYSICS_SHAPETYPE                        =3;   
	var USER_PARTPHYSICS_SHAPETYPE_STR                    ="ShapeType";                  // DBTYPE_I4           

	var USER_PARTPHYSICS_HURTTYPE                         =4;   
	var USER_PARTPHYSICS_HURTTYPE_STR                     ="HurtType";                   // DBTYPE_I4           

	var USER_PARTPHYSICS_SIZE                             =5;   
	var USER_PARTPHYSICS_SIZE_STR                         ="Size";                       // DBTYPE_WVARCHAR     

	var USER_PARTPHYSICS_BONENAME                         =6;   
	var USER_PARTPHYSICS_BONENAME_STR                     ="BoneName";                   // DBTYPE_WVARCHAR     

	var USER_PARTPHYSICS_OFFSETMATRIX                     =7;   
	var USER_PARTPHYSICS_OFFSETMATRIX_STR                 ="OffsetMatrix";               // DBTYPE_WVARCHAR     


	var RESULT                                            ="result";
	var USER_RESULT_RESULT_NAME                           =0;   
	var USER_RESULT_RESULT_NAME_STR                       ="result_name";                // DBTYPE_WVARCHAR     缁撴灉鍚嶇О

	var USER_RESULT_RESULT_ID                             =1;   
	var USER_RESULT_RESULT_ID_STR                         ="result_id";                  // DBTYPE_I4           缁撴灉id

	var USER_RESULT_BODY_RESULT                           =2;   
	var USER_RESULT_BODY_RESULT_STR                       ="body_result";                // DBTYPE_WVARCHAR     body鑷�韬�缁撴灉

	var USER_RESULT_INTERACT_RESULT                       =3;   
	var USER_RESULT_INTERACT_RESULT_STR                   ="interact_result";            // DBTYPE_WVARCHAR     浜掑姩缁撴灉

	var USER_RESULT_MAP_RESULT                            =4;   
	var USER_RESULT_MAP_RESULT_STR                        ="map_result";                 // DBTYPE_WVARCHAR     璋冪敤map鎺ュ彛鐨勭粨鏋�

	var USER_RESULT_EFFECT_RESULT                         =5;   
	var USER_RESULT_EFFECT_RESULT_STR                     ="effect_result";              // DBTYPE_WVARCHAR     鐗规晥缁撴灉

	var USER_RESULT_SOUND_RESULT                          =6;   
	var USER_RESULT_SOUND_RESULT_STR                      ="sound_result";               // DBTYPE_WVARCHAR     闊虫晥缁撴灉

	var USER_RESULT_LOGICAL_RESULT                        =7;   
	var USER_RESULT_LOGICAL_RESULT_STR                    ="logical_result";             // DBTYPE_WVARCHAR     閫昏緫缁撴灉

	var USER_RESULT_PRIORITY                              =8;   
	var USER_RESULT_PRIORITY_STR                          ="priority";                   // DBTYPE_I4           浼樺厛绾�


	var SKILL                                             ="skill";
	var USER_SKILL_SKILLID                                =0;   
	var USER_SKILL_SKILLID_STR                            ="skillid";                    // DBTYPE_I4           鎶�鑳絀D

	var USER_SKILL_SNAME                                  =1;   
	var USER_SKILL_SNAME_STR                              ="sName";                      // DBTYPE_WVARCHAR     鎶�鑳藉悕绉�

	var USER_SKILL_SEXPLAIN                               =2;   
	var USER_SKILL_SEXPLAIN_STR                           ="sExplain";                   // DBTYPE_WVARCHAR     鎶�鑳芥弿杩�

	var USER_SKILL_STYPE                                  =3;   
	var USER_SKILL_STYPE_STR                              ="sType";                      // DBTYPE_I4           鎶�鑳藉睘浜庣殑鍏�鍏辩被鍨�

	var USER_SKILL_SUSECON                                =4;   
	var USER_SKILL_SUSECON_STR                            ="sUseCon";                    // DBTYPE_WVARCHAR     鎶�鑳芥秷鑰楃被鍨�0

	var USER_SKILL_SUSERES                                =5;   
	var USER_SKILL_SUSERES_STR                            ="sUseRes";                    // DBTYPE_WVARCHAR     娑堣�楃墿鍝�0

	var USER_SKILL_SMULTIPLE                              =6;   
	var USER_SKILL_SMULTIPLE_STR                          ="sMultiple";                  // DBTYPE_R4           浼ゅ�冲�嶆瘮姣旂巼 浼ゅ��=DPS * actMult * sMultiple + actDamage * sklDag;

	var USER_SKILL_SDAMAGE                                =7;   
	var USER_SKILL_SDAMAGE_STR                            ="sDamage";                    // DBTYPE_I4           闄勫姞浼ゅ�冲�嶆瘮 浼ゅ��=DPS * actMult * sklMult + actDamage * sDamage;

	var USER_SKILL_SEFFPARTS0                             =8;   
	var USER_SKILL_SEFFPARTS0_STR                         ="sEffParts0";                 // DBTYPE_I4           鐗规晥鎼哄甫閮ㄤ欢缂栧彿0

	var USER_SKILL_SEFFID0                                =9;   
	var USER_SKILL_SEFFID0_STR                            ="sEffId0";                    // DBTYPE_I4           鎼哄甫鐗规晥Id 0

	var USER_SKILL_SEFFPARTS1                             =10;  
	var USER_SKILL_SEFFPARTS1_STR                         ="sEffParts1";                 // DBTYPE_I4           鐗规晥鎼哄甫閮ㄤ欢缂栧彿1

	var USER_SKILL_SEFFID1                                =11;  
	var USER_SKILL_SEFFID1_STR                            ="sEffId1";                    // DBTYPE_I4           鎼哄甫鐗规晥Id 1

	var USER_SKILL_SEFFPARTS2                             =12;  
	var USER_SKILL_SEFFPARTS2_STR                         ="sEffParts2";                 // DBTYPE_I4           鐗规晥鎼哄甫閮ㄤ欢缂栧彿2

	var USER_SKILL_SEFFID2                                =13;  
	var USER_SKILL_SEFFID2_STR                            ="sEffId2";                    // DBTYPE_I4           鎼哄甫鐗规晥Id 2

	var USER_SKILL_SBURSTMODE                             =14;  
	var USER_SKILL_SBURSTMODE_STR                         ="sBurstMode";                 // DBTYPE_I4           瑙﹀彂鏂瑰紡涓庡嚑鐜�

	var USER_SKILL_SICON                                  =15;  
	var USER_SKILL_SICON_STR                              ="sIcon";                      // DBTYPE_WVARCHAR     鎶�鑳芥樉绀哄浘鏍�

	var USER_SKILL_SCDTM                                  =16;  
	var USER_SKILL_SCDTM_STR                              ="sCDTm";                      // DBTYPE_I4           鍐峰嵈鏃堕棿

	var USER_SKILL_SPUBLICCDTYPE                          =17;  
	var USER_SKILL_SPUBLICCDTYPE_STR                      ="sPublicCDType";              // DBTYPE_I4           鍏�鍏盋D鏃堕棿绫诲瀷

	var USER_SKILL_SPUBLICCDTM                            =18;  
	var USER_SKILL_SPUBLICCDTM_STR                        ="sPublicCDTm";                // DBTYPE_I4           鍏卞叕CD鏃堕棿鏃堕棿

	var USER_SKILL_SADDSP                                 =19;  
	var USER_SKILL_SADDSP_STR                             ="sAddSp";                     // DBTYPE_WVARCHAR     鎶�鑳藉�炲姞鏃惰Е鍙戣剼鏈�

	var USER_SKILL_SUSESP                                 =20;  
	var USER_SKILL_SUSESP_STR                             ="sUseSp";                     // DBTYPE_WVARCHAR     鎶�鑳借��浣跨敤鏃惰Е鍙戣剼鏈�

	var USER_SKILL_SMODE                                  =21;  
	var USER_SKILL_SMODE_STR                              ="sMode";                      // DBTYPE_WVARCHAR     鎶�鑳藉嚭鎷涙柟寮�

	var USER_SKILL_SCURLEV                                =22;  
	var USER_SKILL_SCURLEV_STR                            ="sCurLev";                    // DBTYPE_I4           鎶�鑳藉綋鍓嶇骇鍒�

	var USER_SKILL_SUPDATEDOT                             =23;  
	var USER_SKILL_SUPDATEDOT_STR                         ="sUpdateDot";                 // DBTYPE_I4           鎶�鑳藉崌绾ф墍闇�鐐规暟

	var USER_SKILL_SLEVREQ                                =24;  
	var USER_SKILL_SLEVREQ_STR                            ="sLevReq";                    // DBTYPE_I4           鎶�鑳介渶姹傜瓑绾�

	var USER_SKILL_SSTRUSED                               =25;  
	var USER_SKILL_SSTRUSED_STR                           ="sStrUsed";                   // DBTYPE_I4           浣撳姏娑堣��

	var USER_SKILL_SISUPDATE                              =26;  
	var USER_SKILL_SISUPDATE_STR                          ="sIsUpdate";                  // DBTYPE_BOOL         鎶�鑳芥槸鍚﹀彲浠ュ崌绾�

	var USER_SKILL_SACTDGE                                =27;  
	var USER_SKILL_SACTDGE_STR                            ="sActDge";                    // DBTYPE_WVARCHAR     鎶�鑳藉�瑰簲鍔ㄤ綔鐨勪激瀹冲�嶆瘮鍜岄檮鍔犱激瀹崇殑鍊嶆瘮(鍙�鍋氭樉绀虹敤,鐢�;鍒嗛殧) 12;30

	var USER_SKILL_SCANSHOWICON                           =28;  
	var USER_SKILL_SCANSHOWICON_STR                       ="sCanShowIcon";               // DBTYPE_WVARCHAR     鏄剧ず鐢�.鏄�鍚﹁兘楂樹寒鏄剧ず

	var USER_SKILL_SCANADDPOINT                           =29;  
	var USER_SKILL_SCANADDPOINT_STR                       ="sCanAddPoint";               // DBTYPE_WVARCHAR     鏄�鍚﹁兘鍔犳妧鑳界偣锛屾妧鑳界殑鍓嶇疆鏉′欢锛堟潯浠�1&&鏉′欢2&&鏉′欢3锛�

	var USER_SKILL_SADDPOINT                              =30;  
	var USER_SKILL_SADDPOINT_STR                          ="sAddPoint";                  // DBTYPE_WVARCHAR     澧炲姞鎶�鑳界偣鍚�.瑙﹀彂

	var USER_SKILL_SSKILLCLASS                            =31;  
	var USER_SKILL_SSKILLCLASS_STR                        ="sSkillClass";                // DBTYPE_I4           鎶�鑳界偣澶у垎绫�(鍩虹�� 鎶�鑳戒竴 鎶�鑳戒簩 1~3)

	var USER_SKILL_SSKILLSUBCLASS                         =32;  
	var USER_SKILL_SSKILLSUBCLASS_STR                     ="sSkillSubClass";             // DBTYPE_I4           鎶�鑳界偣灏忓垎绫�(鎶�鑳戒綅缃�  1~...)

	var USER_SKILL_SDRAWARROW                             =33;  
	var USER_SKILL_SDRAWARROW_STR                         ="sDrawArrow";                 // DBTYPE_WVARCHAR     缁樺埗鎶�鑳界��澶�

	var USER_SKILL_SKILLTYPE                              =34;  
	var USER_SKILL_SKILLTYPE_STR                          ="skillType";                  // DBTYPE_I4           瑙丠itAct鐨勬墦鍑荤被鍨�  鍑荤悆绫诲瀷(0.鏀鹃珮 1.鍓婄悆 2.涓婃棆 3.鎴�鍑� 4.鍙戠悆 5.鎸＄悆 6.鏁戠悆 7.鎵ｆ潃)

	var USER_SKILL_IFRONTNEEDENERGY                       =35;  
	var USER_SKILL_IFRONTNEEDENERGY_STR                   ="iFrontNeedEnergy";           // DBTYPE_I4           缃戝墠鎶�鑳介渶瑕佺殑鑳介噺

	var USER_SKILL_IBACKNEEDENERGY                        =36;  
	var USER_SKILL_IBACKNEEDENERGY_STR                    ="iBackNeedEnergy";            // DBTYPE_I4           缃戜腑鎶�鑳介渶瑕佺殑鑳介噺

	var USER_SKILL_FAILEDSCRIPT                           =37;  
	var USER_SKILL_FAILEDSCRIPT_STR                       ="failedScript";               // DBTYPE_WVARCHAR     閲婃斁澶辫触鏃惰皟鐢ㄧ殑鑴氭湰


	var STATE_ACT                                         ="state_act";
	var USER_STATE_ACT_AUTOID                             =0;   
	var USER_STATE_ACT_AUTOID_STR                         ="AutoID";                     // DBTYPE_I4           

	var USER_STATE_ACT_STA_ID                             =1;   
	var USER_STATE_ACT_STA_ID_STR                         ="sta_id";                     // DBTYPE_I4           鍔ㄤ綔/鐘舵�佺储寮�

	var USER_STATE_ACT_STA_NAME                           =2;   
	var USER_STATE_ACT_STA_NAME_STR                       ="sta_name";                   // DBTYPE_WVARCHAR     鍔ㄤ綔鍚嶇О

	var USER_STATE_ACT_STA_TYPE                           =3;   
	var USER_STATE_ACT_STA_TYPE_STR                       ="sta_type";                   // DBTYPE_I4           绫诲瀷

	var USER_STATE_ACT_STA_ART                            =4;   
	var USER_STATE_ACT_STA_ART_STR                        ="sta_art";                    // DBTYPE_I4           鍔ㄤ綔鎾�鏀炬椂闂�(ms) -1涓哄惊鐜�鎾�鏀�

	var USER_STATE_ACT_STA_ADJUST_GAP                     =5;   
	var USER_STATE_ACT_STA_ADJUST_GAP_STR                 ="sta_adjust_gap";             // DBTYPE_I4           

	var USER_STATE_ACT_CHG_WAY_STM                        =6;   
	var USER_STATE_ACT_CHG_WAY_STM_STR                    ="chg_way_stm";                // DBTYPE_I4           

	var USER_STATE_ACT_CHG_WAY_LTM                        =7;   
	var USER_STATE_ACT_CHG_WAY_LTM_STR                    ="chg_way_ltm";                // DBTYPE_I4           

	var USER_STATE_ACT_CHG_POS_STM                        =8;   
	var USER_STATE_ACT_CHG_POS_STM_STR                    ="chg_pos_stm";                // DBTYPE_I4           

	var USER_STATE_ACT_CHG_POS_LTM                        =9;   
	var USER_STATE_ACT_CHG_POS_LTM_STR                    ="chg_pos_ltm";                // DBTYPE_I4           

	var USER_STATE_ACT_SUD_ID                             =10;  
	var USER_STATE_ACT_SUD_ID_STR                         ="sud_id";                     // DBTYPE_WVARCHAR     

	var USER_STATE_ACT_SUD_S_TM                           =11;  
	var USER_STATE_ACT_SUD_S_TM_STR                       ="sud_s_tm";                   // DBTYPE_I4           

	var USER_STATE_ACT_SUD_KEEP_TM                        =12;  
	var USER_STATE_ACT_SUD_KEEP_TM_STR                    ="sud_keep_tm";                // DBTYPE_I4           

	var USER_STATE_ACT_EFT_CREATEFN                       =13;  
	var USER_STATE_ACT_EFT_CREATEFN_STR                   ="eft_createfn";               // DBTYPE_WVARCHAR     鍒涘缓鐗规晥鐢ㄧ殑鍑芥暟

	var USER_STATE_ACT_EFT_STM                            =14;  
	var USER_STATE_ACT_EFT_STM_STR                        ="eft_stm";                    // DBTYPE_I4           

	var USER_STATE_ACT_EFT_ETM                            =15;  
	var USER_STATE_ACT_EFT_ETM_STR                        ="eft_etm";                    // DBTYPE_I4           

	var USER_STATE_ACT_EFT_DELFN                          =16;  
	var USER_STATE_ACT_EFT_DELFN_STR                      ="eft_delfn";                  // DBTYPE_WVARCHAR     鍒犻櫎鐗规晥鐢ㄧ殑鍑芥暟

	var USER_STATE_ACT_ACT_S_SEG                          =17;  
	var USER_STATE_ACT_ACT_S_SEG_STR                      ="act_s_seg";                  // DBTYPE_I4           

	var USER_STATE_ACT_ACT_SPEED1                         =18;  
	var USER_STATE_ACT_ACT_SPEED1_STR                     ="act_speed1";                 // DBTYPE_R4           

	var USER_STATE_ACT_ACT_M_SEG                          =19;  
	var USER_STATE_ACT_ACT_M_SEG_STR                      ="act_m_seg";                  // DBTYPE_I4           

	var USER_STATE_ACT_ACT_SPEED2                         =20;  
	var USER_STATE_ACT_ACT_SPEED2_STR                     ="act_speed2";                 // DBTYPE_R4           

	var USER_STATE_ACT_ACT_E_SEG                          =21;  
	var USER_STATE_ACT_ACT_E_SEG_STR                      ="act_e_seg";                  // DBTYPE_I4           

	var USER_STATE_ACT_ACT_SPEED3                         =22;  
	var USER_STATE_ACT_ACT_SPEED3_STR                     ="act_speed3";                 // DBTYPE_R4           

	var USER_STATE_ACT_MOVE_EVEN_STM                      =23;  
	var USER_STATE_ACT_MOVE_EVEN_STM_STR                  ="move_even_stm";              // DBTYPE_I4           

	var USER_STATE_ACT_MOVE_EVEN_LTM                      =24;  
	var USER_STATE_ACT_MOVE_EVEN_LTM_STR                  ="move_even_ltm";              // DBTYPE_I4           

	var USER_STATE_ACT_MOVE_EVEN_LEN                      =25;  
	var USER_STATE_ACT_MOVE_EVEN_LEN_STR                  ="move_even_len";              // DBTYPE_R4           

	var USER_STATE_ACT_MOVE_EVEN_ANGLE                    =26;  
	var USER_STATE_ACT_MOVE_EVEN_ANGLE_STR                ="move_even_angle";            // DBTYPE_I4           

	var USER_STATE_ACT_MOVE_UPRIGHT_STM                   =27;  
	var USER_STATE_ACT_MOVE_UPRIGHT_STM_STR               ="move_upright_stm";           // DBTYPE_I4           

	var USER_STATE_ACT_MOVE_UPRIGHT_LTM                   =28;  
	var USER_STATE_ACT_MOVE_UPRIGHT_LTM_STR               ="move_upright_ltm";           // DBTYPE_I4           

	var USER_STATE_ACT_MOVE_UPRIGHT_HEI                   =29;  
	var USER_STATE_ACT_MOVE_UPRIGHT_HEI_STR               ="move_upright_hei";           // DBTYPE_R4           

	var USER_STATE_ACT_PRC_S                              =30;  
	var USER_STATE_ACT_PRC_S_STR                          ="prc_s";                      // DBTYPE_WVARCHAR     

	var USER_STATE_ACT_PRC_K                              =31;  
	var USER_STATE_ACT_PRC_K_STR                          ="prc_k";                      // DBTYPE_WVARCHAR     

	var USER_STATE_ACT_PRC_E                              =32;  
	var USER_STATE_ACT_PRC_E_STR                          ="prc_e";                      // DBTYPE_WVARCHAR     

	var USER_STATE_ACT_STA_ACT_SUM                        =33;  
	var USER_STATE_ACT_STA_ACT_SUM_STR                    ="sta_act_sum";                // DBTYPE_I4           

	var USER_STATE_ACT_STA_ACT_NAME                       =34;  
	var USER_STATE_ACT_STA_ACT_NAME_STR                   ="sta_act_name";               // DBTYPE_WVARCHAR     鍔ㄤ綔鏂囦欢鍚�

	var USER_STATE_ACT_STA_INPUT                          =35;  
	var USER_STATE_ACT_STA_INPUT_STR                      ="sta_input";                  // DBTYPE_WVARCHAR     

	var USER_STATE_ACT_STA_PREV                           =36;  
	var USER_STATE_ACT_STA_PREV_STR                       ="sta_prev";                   // DBTYPE_WVARCHAR     

	var USER_STATE_ACT_STA_NEXT                           =37;  
	var USER_STATE_ACT_STA_NEXT_STR                       ="sta_next";                   // DBTYPE_WVARCHAR     

	var USER_STATE_ACT_STA_NEXT_TM                        =38;  
	var USER_STATE_ACT_STA_NEXT_TM_STR                    ="sta_next_tm";                // DBTYPE_I4           

	var USER_STATE_ACT_RECOVERY                           =39;  
	var USER_STATE_ACT_RECOVERY_STR                       ="recovery";                   // DBTYPE_I4           

	var USER_STATE_ACT_PRC_TYPE                           =40;  
	var USER_STATE_ACT_PRC_TYPE_STR                       ="prc_type";                   // DBTYPE_WVARCHAR     

	var USER_STATE_ACT_MOVE_SPEED                         =41;  
	var USER_STATE_ACT_MOVE_SPEED_STR                     ="move_speed";                 // DBTYPE_R4           绉诲姩閫熷害   (绫�/绉�)

	var USER_STATE_ACT_MOVE_ANGLE                         =42;  
	var USER_STATE_ACT_MOVE_ANGLE_STR                     ="move_angle";                 // DBTYPE_I4           

	var USER_STATE_ACT_FLOAT_NEXT                         =43;  
	var USER_STATE_ACT_FLOAT_NEXT_STR                     ="float_next";                 // DBTYPE_WVARCHAR     瑙掕壊鑵剧┖鍚庣殑鐘舵�佹敼鍙樻柟寮忓簭鍒�

	var USER_STATE_ACT_FALL_GNEXT                         =44;  
	var USER_STATE_ACT_FALL_GNEXT_STR                     ="fall_gnext";                 // DBTYPE_WVARCHAR     瑙掕壊钀藉湴鍚庣殑鐘舵�佹敼鍙樻柟寮忓簭鍒�

	var USER_STATE_ACT_IMPACT_NEXT                        =45;  
	var USER_STATE_ACT_IMPACT_NEXT_STR                    ="impact_next";                // DBTYPE_WVARCHAR     瑙掕壊涓庣墿鐞嗛潰鍙戠敓纰版挒鍚庣殑鐘舵�佹敼鍙樻柟寮忓簭鍒�

	var USER_STATE_ACT_REMAINTM                           =46;  
	var USER_STATE_ACT_REMAINTM_STR                       ="remaintm";                   // DBTYPE_I4           鑷�寰�鐜�鐘舵�佺殑缁存寔鏃堕棿

	var USER_STATE_ACT_REMAIN_NEXT                        =47;  
	var USER_STATE_ACT_REMAIN_NEXT_STR                    ="remain_next";                // DBTYPE_WVARCHAR     鑷�寰�鐜�鐘舵�佸湪缁存寔鏃堕棿鍒颁簡涔嬪悗鐨勭姸鎬佹敼鍙樻柟寮忓簭鍒�

	var USER_STATE_ACT_SELF_PAUSE                         =48;  
	var USER_STATE_ACT_SELF_PAUSE_STR                     ="self_pause";                 // DBTYPE_I4           鍑讳腑瀵规墜鍚庤嚜韬�鍋滈】鏃堕棿

	var USER_STATE_ACT_RIVAL_PAUSE                        =49;  
	var USER_STATE_ACT_RIVAL_PAUSE_STR                    ="rival_pause";                // DBTYPE_I4           鍑讳腑瀵规墜鍚庡�规墜鍋滈】鏃堕棿

	var USER_STATE_ACT_MANUAL_DELAY                       =50;  
	var USER_STATE_ACT_MANUAL_DELAY_STR                   ="manual_delay";               // DBTYPE_I4           杩涘叆鐘舵�佸�氶暱鏃堕棿鍚庤Е鍙戜綋鍔涚殑澧炲噺

	var USER_STATE_ACT_MANUAL_GAP                         =51;  
	var USER_STATE_ACT_MANUAL_GAP_STR                     ="manual_gap";                 // DBTYPE_I4           澶氶暱鏃堕棿杩涜�屼竴娆′綋鍔涚殑澧炲噺

	var USER_STATE_ACT_MANUAL_INCRESE                     =52;  
	var USER_STATE_ACT_MANUAL_INCRESE_STR                 ="manual_increse";             // DBTYPE_R4           杩涜�屼竴娆′綋鍔涘�炲噺鐨勬暟閲忥紙濡傛灉姝ゅ�煎ぇ浜庝竴锛屽垯鐩存帴浣滀负浣撳姏鐨勫�為噺锛屽�傛灉灏忎簬涓�鍒欐寜鐓т綋鍔涗笂闄愪笌姝ゅ�肩殑涔樼Н杩涜�屽�炲噺锛�

	var USER_STATE_ACT_SKILLID                            =53;  
	var USER_STATE_ACT_SKILLID_STR                        ="skillid";                    // DBTYPE_I4           瀵瑰簲鐨勬妧鑳絠d

	var USER_STATE_ACT_LOCK_RADIUS                        =54;  
	var USER_STATE_ACT_LOCK_RADIUS_STR                    ="lock_radius";                // DBTYPE_R4           閿佹晫鍗婂緞

	var USER_STATE_ACT_CHGCHAT_STATE                      =55;  
	var USER_STATE_ACT_CHGCHAT_STATE_STR                  ="chgchat_state";              // DBTYPE_I4           鎹�浜哄悗缈昏浆鐨勭姸鎬�

	var USER_STATE_ACT_SKILLLV                            =56;  
	var USER_STATE_ACT_SKILLLV_STR                        ="skilllv";                    // DBTYPE_I4           瀵瑰簲鐨勬妧鑳界瓑绾�

	var USER_STATE_ACT_MANUALFAILSTATE                    =57;  
	var USER_STATE_ACT_MANUALFAILSTATE_STR                ="manualfailstate";            // DBTYPE_I4           浣撳姏鑰楀畬鍚庣炕杞�鍒颁粈涔堢姸鎬�

	var USER_STATE_ACT_PLUSSKILLS                         =58;  
	var USER_STATE_ACT_PLUSSKILLS_STR                     ="plusskills";                 // DBTYPE_WVARCHAR     琚�鍔ㄦ妧鑳絀D 鐢�;鍒嗛殧

	var USER_STATE_ACT_ISNETSEND                          =59;  
	var USER_STATE_ACT_ISNETSEND_STR                      ="isNetSend";                  // DBTYPE_BOOL         鏄�鍚﹁�佺粡杩囩綉缁滃彂閫�

	var USER_STATE_ACT_ISSELFMOVEACT                      =60;  
	var USER_STATE_ACT_ISSELFMOVEACT_STR                  ="isSelfMoveAct";              // DBTYPE_BOOL         鏄�鍚︽槸鑷�甯︿綅绉荤殑鍔ㄤ綔

	var USER_STATE_ACT_BLENDDURATION                      =61;  
	var USER_STATE_ACT_BLENDDURATION_STR                  ="BlendDuration";              // DBTYPE_R4           鍔ㄤ綔铻嶅悎

	var USER_STATE_ACT_EFT_DELETE                         =62;  
	var USER_STATE_ACT_EFT_DELETE_STR                     ="eft_delete";                 // DBTYPE_BOOL         鍦ㄦ敼鍙樼姸鎬佸悗鏄�鍚﹀垹闄ょ壒鏁�,鏄�琛ㄧず鏀瑰彉鐘舵�佸悗绔嬪嵆鍒犻櫎,鍚﹁〃绀哄埌鏃堕棿鍒犻櫎,鍚︾殑璇濈粨鏉熸椂闂翠笉鑳戒负-1,鍚﹀垯姘歌繙鍒犻櫎涓嶄簡

	var USER_STATE_ACT_CHECKSCRIPT                        =63;  
	var USER_STATE_ACT_CHECKSCRIPT_STR                    ="CheckScript";                // DBTYPE_WVARCHAR     鐘舵�佽繘鍏ョ殑鑴氭湰鏉′欢

	var USER_STATE_ACT_ISNEWACTRESET                      =64;  
	var USER_STATE_ACT_ISNEWACTRESET_STR                  ="isNewActReset";              // DBTYPE_BOOL         鏈変簡鐩稿悓鍔ㄤ綔鍚庢槸鍚﹂噸缃�鍔ㄤ綔


	var UPLEVEL                                           ="UpLevel";
	var USER_UPLEVEL_LEVELID                              =0;   
	var USER_UPLEVEL_LEVELID_STR                          ="LevelId";                    // DBTYPE_I4           

	var USER_UPLEVEL_FORCE                                =1;   
	var USER_UPLEVEL_FORCE_STR                            ="Force";                      // DBTYPE_I4           鍔涢噺锛氭敾鍑诲姏銆�

	var USER_UPLEVEL_CELERITY                             =2;   
	var USER_UPLEVEL_CELERITY_STR                         ="Celerity";                   // DBTYPE_I4           鏁忔嵎锛氶槻寰″姏銆�

	var USER_UPLEVEL_CONSTITUTION                         =3;   
	var USER_UPLEVEL_CONSTITUTION_STR                     ="Constitution";               // DBTYPE_I4           浣撹川锛氱敓鍛藉��

	var USER_UPLEVEL_SNAP                                 =4;   
	var USER_UPLEVEL_SNAP_STR                             ="Snap";                       // DBTYPE_I4           娲诲姏锛氫綋鍔涘洖澶嶃��

	var USER_UPLEVEL_ATTACKMIN                            =5;   
	var USER_UPLEVEL_ATTACKMIN_STR                        ="AttackMin";                  // DBTYPE_I4           鏀诲嚮锛氫汉鐗╂墍鑳界粰瀵硅薄閫犳垚浼ゅ�崇殑鏈�灏忓�笺��

	var USER_UPLEVEL_ATTACKMAX                            =6;   
	var USER_UPLEVEL_ATTACKMAX_STR                        ="AttackMax";                  // DBTYPE_I4           鏀诲嚮锛氫汉鐗╂墍鑳界粰瀵硅薄閫犳垚浼ゅ�崇殑鏈�澶у�笺��

	var USER_UPLEVEL_RECOVERY                             =7;   
	var USER_UPLEVEL_RECOVERY_STR                         ="Recovery";                   // DBTYPE_I4           闃插尽锛氫汉鐗╁�瑰彈鍒颁激瀹崇殑璞佸厤绋嬪害銆�

	var USER_UPLEVEL_LIFE                                 =8;   
	var USER_UPLEVEL_LIFE_STR                             ="Life";                       // DBTYPE_I4           鐢熷懡鍊硷細浜虹墿鐨勭敓鍛芥渶澶у�笺��

	var USER_UPLEVEL_ENERGY                               =9;   
	var USER_UPLEVEL_ENERGY_STR                           ="Energy";                     // DBTYPE_I4           浣撳姏锛氫汉鐗╃殑浣撳姏鏈�澶у�笺��

	var USER_UPLEVEL_RESUMEENERGY                         =10;  
	var USER_UPLEVEL_RESUMEENERGY_STR                     ="ResumeEnergy";               // DBTYPE_I4           鍥炰綋锛氫汉鐗╁洖澶嶄綋鍔涚殑閫熷害銆�

	var USER_UPLEVEL_RESUMELIFE                           =11;  
	var USER_UPLEVEL_RESUMELIFE_STR                       ="ResumeLife";                 // DBTYPE_I4           鍥炶��锛氫汉鐗╁洖澶嶇敓鍛界殑閫熷害銆�

	var USER_UPLEVEL_SPEED                                =12;  
	var USER_UPLEVEL_SPEED_STR                            ="Speed";                      // DBTYPE_I4           閫熷害锛氫汉鐗╃Щ鍔ㄧ殑閫熷害銆�

	var USER_UPLEVEL_MAXENERGY                            =13;  
	var USER_UPLEVEL_MAXENERGY_STR                        ="MaxEnergy";                  // DBTYPE_I4           鏈�澶т綋鍔�

	var USER_UPLEVEL_REQUIREEXP                           =14;  
	var USER_UPLEVEL_REQUIREEXP_STR                       ="RequireExp";                 // DBTYPE_I4           鍗囩骇闇�姹傜粡楠�

	var USER_UPLEVEL_ATTPOINT                             =15;  
	var USER_UPLEVEL_ATTPOINT_STR                         ="AttPoint";                   // DBTYPE_I4           灞炴�х偣鏁�

	var USER_UPLEVEL_SKILLPOINT                           =16;  
	var USER_UPLEVEL_SKILLPOINT_STR                       ="SkillPoint";                 // DBTYPE_I4           鎶�鑳界偣鏁�

	var USER_UPLEVEL_DOWERPOINT                           =17;  
	var USER_UPLEVEL_DOWERPOINT_STR                       ="DowerPoint";                 // DBTYPE_I4           澶╄祴鐐规暟

	var USER_UPLEVEL_ENCOURAGE                            =18;  
	var USER_UPLEVEL_ENCOURAGE_STR                        ="Encourage";                  // DBTYPE_WVARCHAR     鍗囧埌杩欎竴绾х殑濂栧姳,鏍煎紡涓� 鐗╁搧;num;鐗╁搧;num;

	var USER_UPLEVEL_TSTRENGTH                            =19;  
	var USER_UPLEVEL_TSTRENGTH_STR                        ="TStrength";                  // DBTYPE_I4           缃戠悆 鍔涢噺 20

	var USER_UPLEVEL_TSKILL                               =20;  
	var USER_UPLEVEL_TSKILL_STR                           ="TSkill";                     // DBTYPE_I4           缃戠悆 鎶�宸� 21

	var USER_UPLEVEL_TFORCEHAND                           =21;  
	var USER_UPLEVEL_TFORCEHAND_STR                       ="TForceHand";                 // DBTYPE_I4           缃戠悆 缃戝墠 22

	var USER_UPLEVEL_TBACKHAND                            =22;  
	var USER_UPLEVEL_TBACKHAND_STR                        ="TBackHand";                  // DBTYPE_I4           缃戠悆 鍚庡満 23

	var USER_UPLEVEL_TMAXENERGY                           =23;  
	var USER_UPLEVEL_TMAXENERGY_STR                       ="TMaxEnergy";                 // DBTYPE_I4           缃戠悆 鑳介噺 24

}
