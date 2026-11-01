// 创建日期:2011/5/16 18:26:55
// Access文件名:E:\VnetProject2010\project4\tennis\data\mdb\TopStar.mdb

set window
{
	var TOPSTAR                                           ="TopStar.mdb";

	var TS_A_ACE                                          ="TS_A_ACE";
	var TOPSTAR_TS_A_ACE_INDEX                            =0;   
	var TOPSTAR_TS_A_ACE_INDEX_STR                        ="index";                      // DBTYPE_I4           排名

	var TOPSTAR_TS_A_ACE_NKNAME                           =1;   
	var TOPSTAR_TS_A_ACE_NKNAME_STR                       ="nkName";                     // DBTYPE_WVARCHAR     玩家昵称

	var TOPSTAR_TS_A_ACE_LEVEL                            =2;   
	var TOPSTAR_TS_A_ACE_LEVEL_STR                        ="level";                      // DBTYPE_I4           等级

	var TOPSTAR_TS_A_ACE_TYPERES                          =3;   
	var TOPSTAR_TS_A_ACE_TYPERES_STR                      ="typeRes";                    // DBTYPE_I4           得分

	var TOPSTAR_TS_A_ACE_TECHNIC                          =4;   
	var TOPSTAR_TS_A_ACE_TECHNIC_STR                      ="technic";                    // DBTYPE_I4           技术类型 1网前力量型 2底线力量型 3网前技巧型 4底线技巧型

	var TOPSTAR_TS_A_ACE_LASTINDEX                        =5;   
	var TOPSTAR_TS_A_ACE_LASTINDEX_STR                    ="lastindex";                  // DBTYPE_I4           上一次的排行

	var TOPSTAR_TS_A_ACE_CURRINDEX                        =6;   
	var TOPSTAR_TS_A_ACE_CURRINDEX_STR                    ="currindex";                  // DBTYPE_I4           当前排名


	var TS_A_ALLBOUT                                      ="TS_A_AllBout";
	var TOPSTAR_TS_A_ALLBOUT_INDEX                        =0;   
	var TOPSTAR_TS_A_ALLBOUT_INDEX_STR                    ="index";                      // DBTYPE_I4           排名

	var TOPSTAR_TS_A_ALLBOUT_NKNAME                       =1;   
	var TOPSTAR_TS_A_ALLBOUT_NKNAME_STR                   ="nkName";                     // DBTYPE_WVARCHAR     玩家昵称

	var TOPSTAR_TS_A_ALLBOUT_LEVEL                        =2;   
	var TOPSTAR_TS_A_ALLBOUT_LEVEL_STR                    ="level";                      // DBTYPE_I4           等级

	var TOPSTAR_TS_A_ALLBOUT_TYPERES                      =3;   
	var TOPSTAR_TS_A_ALLBOUT_TYPERES_STR                  ="typeRes";                    // DBTYPE_I4           得分

	var TOPSTAR_TS_A_ALLBOUT_TECHNIC                      =4;   
	var TOPSTAR_TS_A_ALLBOUT_TECHNIC_STR                  ="technic";                    // DBTYPE_I4           技术类型 1网前力量型 2底线力量型 3网前技巧型 4底线技巧型

	var TOPSTAR_TS_A_ALLBOUT_LASTINDEX                    =5;   
	var TOPSTAR_TS_A_ALLBOUT_LASTINDEX_STR                ="lastindex";                  // DBTYPE_I4           上一次的排行

	var TOPSTAR_TS_A_ALLBOUT_CURRINDEX                    =6;   
	var TOPSTAR_TS_A_ALLBOUT_CURRINDEX_STR                ="currindex";                  // DBTYPE_I4           当前排名


	var TS_A_ALLSCORE                                     ="TS_A_AllScore";
	var TOPSTAR_TS_A_ALLSCORE_INDEX                       =0;   
	var TOPSTAR_TS_A_ALLSCORE_INDEX_STR                   ="index";                      // DBTYPE_I4           排名

	var TOPSTAR_TS_A_ALLSCORE_NKNAME                      =1;   
	var TOPSTAR_TS_A_ALLSCORE_NKNAME_STR                  ="nkName";                     // DBTYPE_WVARCHAR     玩家昵称

	var TOPSTAR_TS_A_ALLSCORE_LEVEL                       =2;   
	var TOPSTAR_TS_A_ALLSCORE_LEVEL_STR                   ="level";                      // DBTYPE_I4           等级

	var TOPSTAR_TS_A_ALLSCORE_TYPERES                     =3;   
	var TOPSTAR_TS_A_ALLSCORE_TYPERES_STR                 ="typeRes";                    // DBTYPE_I4           得分

	var TOPSTAR_TS_A_ALLSCORE_TECHNIC                     =4;   
	var TOPSTAR_TS_A_ALLSCORE_TECHNIC_STR                 ="technic";                    // DBTYPE_I4           技术类型 1网前力量型 2底线力量型 3网前技巧型 4底线技巧型

	var TOPSTAR_TS_A_ALLSCORE_LASTINDEX                   =5;   
	var TOPSTAR_TS_A_ALLSCORE_LASTINDEX_STR               ="lastindex";                  // DBTYPE_I4           上一次的排行

	var TOPSTAR_TS_A_ALLSCORE_CURRINDEX                   =6;   
	var TOPSTAR_TS_A_ALLSCORE_CURRINDEX_STR               ="currindex";                  // DBTYPE_I4           当前排名


	var TS_A_FULLSTORE                                    ="TS_A_FullStore";
	var TOPSTAR_TS_A_FULLSTORE_INDEX                      =0;   
	var TOPSTAR_TS_A_FULLSTORE_INDEX_STR                  ="index";                      // DBTYPE_I4           排名

	var TOPSTAR_TS_A_FULLSTORE_NKNAME                     =1;   
	var TOPSTAR_TS_A_FULLSTORE_NKNAME_STR                 ="nkName";                     // DBTYPE_WVARCHAR     玩家昵称

	var TOPSTAR_TS_A_FULLSTORE_LEVEL                      =2;   
	var TOPSTAR_TS_A_FULLSTORE_LEVEL_STR                  ="level";                      // DBTYPE_I4           等级

	var TOPSTAR_TS_A_FULLSTORE_TYPERES                    =3;   
	var TOPSTAR_TS_A_FULLSTORE_TYPERES_STR                ="typeRes";                    // DBTYPE_I4           得分

	var TOPSTAR_TS_A_FULLSTORE_TECHNIC                    =4;   
	var TOPSTAR_TS_A_FULLSTORE_TECHNIC_STR                ="technic";                    // DBTYPE_I4           技术类型 1网前力量型 2底线力量型 3网前技巧型 4底线技巧型

	var TOPSTAR_TS_A_FULLSTORE_LASTINDEX                  =5;   
	var TOPSTAR_TS_A_FULLSTORE_LASTINDEX_STR              ="lastindex";                  // DBTYPE_I4           上一次的排行

	var TOPSTAR_TS_A_FULLSTORE_CURRINDEX                  =6;   
	var TOPSTAR_TS_A_FULLSTORE_CURRINDEX_STR              ="currindex";                  // DBTYPE_I4           当前排名


	var TS_A_GOLDNUM                                      ="TS_A_GoldNum";
	var TOPSTAR_TS_A_GOLDNUM_INDEX                        =0;   
	var TOPSTAR_TS_A_GOLDNUM_INDEX_STR                    ="index";                      // DBTYPE_I4           排名

	var TOPSTAR_TS_A_GOLDNUM_FAMILYNAME                   =1;   
	var TOPSTAR_TS_A_GOLDNUM_FAMILYNAME_STR               ="familyName";                 // DBTYPE_WVARCHAR     家族名字

	var TOPSTAR_TS_A_GOLDNUM_NKNAME                       =2;   
	var TOPSTAR_TS_A_GOLDNUM_NKNAME_STR                   ="nkName";                     // DBTYPE_WVARCHAR     玩家昵称

	var TOPSTAR_TS_A_GOLDNUM_LEVEL                        =3;   
	var TOPSTAR_TS_A_GOLDNUM_LEVEL_STR                    ="level";                      // DBTYPE_I4           等级

	var TOPSTAR_TS_A_GOLDNUM_TYPERES                      =4;   
	var TOPSTAR_TS_A_GOLDNUM_TYPERES_STR                  ="typeRes";                    // DBTYPE_I4           胜利场次

	var TOPSTAR_TS_A_GOLDNUM_TYPERES1                     =5;   
	var TOPSTAR_TS_A_GOLDNUM_TYPERES1_STR                 ="typeRes1";                   // DBTYPE_I4           总场次

	var TOPSTAR_TS_A_GOLDNUM_TECHNIC                      =6;   
	var TOPSTAR_TS_A_GOLDNUM_TECHNIC_STR                  ="technic";                    // DBTYPE_I4           技术类型1网前力量型 2底线力量型 3网前技巧型 4底线技巧型

	var TOPSTAR_TS_A_GOLDNUM_LASTINDEX                    =7;   
	var TOPSTAR_TS_A_GOLDNUM_LASTINDEX_STR                ="lastindex";                  // DBTYPE_I4           上一次的排行

	var TOPSTAR_TS_A_GOLDNUM_CURRINDEX                    =8;   
	var TOPSTAR_TS_A_GOLDNUM_CURRINDEX_STR                ="currindex";                  // DBTYPE_I4           当前排名


	var TS_A_LOVER                                        ="TS_A_Lover";
	var TOPSTAR_TS_A_LOVER_USERID                         =0;   
	var TOPSTAR_TS_A_LOVER_USERID_STR                     ="userid";                     // DBTYPE_I4           玩家id

	var TOPSTAR_TS_A_LOVER_NKNAME                         =1;   
	var TOPSTAR_TS_A_LOVER_NKNAME_STR                     ="nkName";                     // DBTYPE_WVARCHAR     玩家昵称

	var TOPSTAR_TS_A_LOVER_LEVEL                          =2;   
	var TOPSTAR_TS_A_LOVER_LEVEL_STR                      ="level";                      // DBTYPE_I4           等级

	var TOPSTAR_TS_A_LOVER_TECHNIC                        =3;   
	var TOPSTAR_TS_A_LOVER_TECHNIC_STR                    ="technic";                    // DBTYPE_I4           技术类型1网前力量型 2底线力量型 3网前技巧型 4底线技巧型

	var TOPSTAR_TS_A_LOVER_ROLESHOW                       =4;   
	var TOPSTAR_TS_A_LOVER_ROLESHOW_STR                   ="roleshow";                   // DBTYPE_WVARCHAR     角色显示

	var TOPSTAR_TS_A_LOVER_SEX                            =5;   
	var TOPSTAR_TS_A_LOVER_SEX_STR                        ="sex";                        // DBTYPE_I4           性别 1男 2女

	var TOPSTAR_TS_A_LOVER_USERID1                        =6;   
	var TOPSTAR_TS_A_LOVER_USERID1_STR                    ="userid1";                    // DBTYPE_I4           玩家id1

	var TOPSTAR_TS_A_LOVER_NKNAME1                        =7;   
	var TOPSTAR_TS_A_LOVER_NKNAME1_STR                    ="nkName1";                    // DBTYPE_WVARCHAR     玩家昵称1

	var TOPSTAR_TS_A_LOVER_LEVEL1                         =8;   
	var TOPSTAR_TS_A_LOVER_LEVEL1_STR                     ="level1";                     // DBTYPE_I4           等级1

	var TOPSTAR_TS_A_LOVER_TECHNIC1                       =9;   
	var TOPSTAR_TS_A_LOVER_TECHNIC1_STR                   ="technic1";                   // DBTYPE_I4           技术类型1 1网前力量型 2底线力量型 3网前技巧型 4底线技巧型

	var TOPSTAR_TS_A_LOVER_ROLESHOW1                      =10;  
	var TOPSTAR_TS_A_LOVER_ROLESHOW1_STR                  ="roleshow1";                  // DBTYPE_WVARCHAR     角色显示1

	var TOPSTAR_TS_A_LOVER_SEX1                           =11;  
	var TOPSTAR_TS_A_LOVER_SEX1_STR                       ="sex1";                       // DBTYPE_I4           性别1 1男 2女

	var TOPSTAR_TS_A_LOVER_TYPERES                        =12;  
	var TOPSTAR_TS_A_LOVER_TYPERES_STR                    ="typeRes";                    // DBTYPE_I4           胜利场次

	var TOPSTAR_TS_A_LOVER_TYPERES1                       =13;  
	var TOPSTAR_TS_A_LOVER_TYPERES1_STR                   ="typeRes1";                   // DBTYPE_I4           总场次

	var TOPSTAR_TS_A_LOVER_WLOVES                         =14;  
	var TOPSTAR_TS_A_LOVER_WLOVES_STR                     ="WLoves";                     // DBTYPE_I4           情侣的爱情指数

	var TOPSTAR_TS_A_LOVER_WTOTALSCORE                    =15;  
	var TOPSTAR_TS_A_LOVER_WTOTALSCORE_STR                ="WTotalScore";                // DBTYPE_I4           情侣的总得分

	var TOPSTAR_TS_A_LOVER_WBADDISH                       =16;  
	var TOPSTAR_TS_A_LOVER_WBADDISH_STR                   ="WBaddish";                   // DBTYPE_I4           情侣的档次 1:黄铜 2:白银 3:黄金

	var TOPSTAR_TS_A_LOVER_LASTINDEX                      =17;  
	var TOPSTAR_TS_A_LOVER_LASTINDEX_STR                  ="lastindex";                  // DBTYPE_I4           上一次的排行

	var TOPSTAR_TS_A_LOVER_CURRINDEX                      =18;  
	var TOPSTAR_TS_A_LOVER_CURRINDEX_STR                  ="currindex";                  // DBTYPE_I4           当前排名

	var TOPSTAR_TS_A_LOVER_KEYID                          =19;  
	var TOPSTAR_TS_A_LOVER_KEYID_STR                      ="KeyId";                      // DBTYPE_NUMERIC      


	var TS_A_PARTNER                                      ="TS_A_Partner";
	var TOPSTAR_TS_A_PARTNER_USERID                       =0;   
	var TOPSTAR_TS_A_PARTNER_USERID_STR                   ="userid";                     // DBTYPE_I4           玩家id

	var TOPSTAR_TS_A_PARTNER_NKNAME                       =1;   
	var TOPSTAR_TS_A_PARTNER_NKNAME_STR                   ="nkName";                     // DBTYPE_WVARCHAR     玩家昵称

	var TOPSTAR_TS_A_PARTNER_LEVEL                        =2;   
	var TOPSTAR_TS_A_PARTNER_LEVEL_STR                    ="level";                      // DBTYPE_I4           等级

	var TOPSTAR_TS_A_PARTNER_TECHNIC                      =3;   
	var TOPSTAR_TS_A_PARTNER_TECHNIC_STR                  ="technic";                    // DBTYPE_I4           技术类型1网前力量型 2底线力量型 3网前技巧型 4底线技巧型

	var TOPSTAR_TS_A_PARTNER_ROLESHOW                     =4;   
	var TOPSTAR_TS_A_PARTNER_ROLESHOW_STR                 ="roleshow";                   // DBTYPE_WVARCHAR     角色显示

	var TOPSTAR_TS_A_PARTNER_SEX                          =5;   
	var TOPSTAR_TS_A_PARTNER_SEX_STR                      ="sex";                        // DBTYPE_I4           性别

	var TOPSTAR_TS_A_PARTNER_USERID1                      =6;   
	var TOPSTAR_TS_A_PARTNER_USERID1_STR                  ="userid1";                    // DBTYPE_I4           玩家id1

	var TOPSTAR_TS_A_PARTNER_NKNAME1                      =7;   
	var TOPSTAR_TS_A_PARTNER_NKNAME1_STR                  ="nkName1";                    // DBTYPE_WVARCHAR     玩家昵称1

	var TOPSTAR_TS_A_PARTNER_LEVEL1                       =8;   
	var TOPSTAR_TS_A_PARTNER_LEVEL1_STR                   ="level1";                     // DBTYPE_I4           等级1

	var TOPSTAR_TS_A_PARTNER_TECHNIC1                     =9;   
	var TOPSTAR_TS_A_PARTNER_TECHNIC1_STR                 ="technic1";                   // DBTYPE_I4           技术类型1 1网前力量型 2底线力量型 3网前技巧型 4底线技巧型

	var TOPSTAR_TS_A_PARTNER_ROLESHOW1                    =10;  
	var TOPSTAR_TS_A_PARTNER_ROLESHOW1_STR                ="roleshow1";                  // DBTYPE_WVARCHAR     角色显示1

	var TOPSTAR_TS_A_PARTNER_SEX1                         =11;  
	var TOPSTAR_TS_A_PARTNER_SEX1_STR                     ="sex1";                       // DBTYPE_I4           性别1

	var TOPSTAR_TS_A_PARTNER_TYPERES                      =12;  
	var TOPSTAR_TS_A_PARTNER_TYPERES_STR                  ="typeRes";                    // DBTYPE_I4           胜利场次

	var TOPSTAR_TS_A_PARTNER_TYPERES1                     =13;  
	var TOPSTAR_TS_A_PARTNER_TYPERES1_STR                 ="typeRes1";                   // DBTYPE_I4           总场次

	var TOPSTAR_TS_A_PARTNER_PPRIVITY                     =14;  
	var TOPSTAR_TS_A_PARTNER_PPRIVITY_STR                 ="PPrivity";                   // DBTYPE_I4           搭档默契度

	var TOPSTAR_TS_A_PARTNER_LASTINDEX                    =15;  
	var TOPSTAR_TS_A_PARTNER_LASTINDEX_STR                ="lastindex";                  // DBTYPE_I4           上一次的排行

	var TOPSTAR_TS_A_PARTNER_CURRINDEX                    =16;  
	var TOPSTAR_TS_A_PARTNER_CURRINDEX_STR                ="currindex";                  // DBTYPE_I4           当前排名


	var TS_A_SKILLNUM                                     ="TS_A_SkillNum";
	var TOPSTAR_TS_A_SKILLNUM_INDEX                       =0;   
	var TOPSTAR_TS_A_SKILLNUM_INDEX_STR                   ="index";                      // DBTYPE_I4           排名

	var TOPSTAR_TS_A_SKILLNUM_NKNAME                      =1;   
	var TOPSTAR_TS_A_SKILLNUM_NKNAME_STR                  ="nkName";                     // DBTYPE_WVARCHAR     玩家昵称

	var TOPSTAR_TS_A_SKILLNUM_LEVEL                       =2;   
	var TOPSTAR_TS_A_SKILLNUM_LEVEL_STR                   ="level";                      // DBTYPE_I4           等级

	var TOPSTAR_TS_A_SKILLNUM_TYPERES                     =3;   
	var TOPSTAR_TS_A_SKILLNUM_TYPERES_STR                 ="typeRes";                    // DBTYPE_I4           得分

	var TOPSTAR_TS_A_SKILLNUM_TECHNIC                     =4;   
	var TOPSTAR_TS_A_SKILLNUM_TECHNIC_STR                 ="technic";                    // DBTYPE_I4           技术类型 1网前力量型 2底线力量型 3网前技巧型 4底线技巧型

	var TOPSTAR_TS_A_SKILLNUM_LASTINDEX                   =5;   
	var TOPSTAR_TS_A_SKILLNUM_LASTINDEX_STR               ="lastindex";                  // DBTYPE_I4           上一次的排行

	var TOPSTAR_TS_A_SKILLNUM_CURRINDEX                   =6;   
	var TOPSTAR_TS_A_SKILLNUM_CURRINDEX_STR               ="currindex";                  // DBTYPE_I4           当前排名


	var TS_A_WINNUM                                       ="TS_A_WinNum";
	var TOPSTAR_TS_A_WINNUM_INDEX                         =0;   
	var TOPSTAR_TS_A_WINNUM_INDEX_STR                     ="index";                      // DBTYPE_I4           排名

	var TOPSTAR_TS_A_WINNUM_NKNAME                        =1;   
	var TOPSTAR_TS_A_WINNUM_NKNAME_STR                    ="nkName";                     // DBTYPE_WVARCHAR     玩家昵称

	var TOPSTAR_TS_A_WINNUM_LEVEL                         =2;   
	var TOPSTAR_TS_A_WINNUM_LEVEL_STR                     ="level";                      // DBTYPE_I4           等级

	var TOPSTAR_TS_A_WINNUM_TYPERES                       =3;   
	var TOPSTAR_TS_A_WINNUM_TYPERES_STR                   ="typeRes";                    // DBTYPE_I4           得分

	var TOPSTAR_TS_A_WINNUM_TECHNIC                       =4;   
	var TOPSTAR_TS_A_WINNUM_TECHNIC_STR                   ="technic";                    // DBTYPE_I4           技术类型1网前力量型 2底线力量型 3网前技巧型 4底线技巧型

	var TOPSTAR_TS_A_WINNUM_LASTINDEX                     =5;   
	var TOPSTAR_TS_A_WINNUM_LASTINDEX_STR                 ="lastindex";                  // DBTYPE_I4           上一次的排行

	var TOPSTAR_TS_A_WINNUM_CURRINDEX                     =6;   
	var TOPSTAR_TS_A_WINNUM_CURRINDEX_STR                 ="currindex";                  // DBTYPE_I4           当前排名

}
