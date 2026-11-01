// 创建日期:2011/5/16 18:26:39
// Access文件名:E:\VnetProject2010\project4\tennis\data\mdb\m_g_clinet.mdb

set window
{
	var M_G_CLINET                                        ="m_g_clinet.mdb";

	var AIGAME                                            ="AIGame";
	var M_G_CLINET_AIGAME_AIGAMEID                        =0;   
	var M_G_CLINET_AIGAME_AIGAMEID_STR                    ="AIGameID";                   // DBTYPE_I4           AI游戏的编号

	var M_G_CLINET_AIGAME_DESCRIPTION                     =1;   
	var M_G_CLINET_AIGAME_DESCRIPTION_STR                 ="Description";                // DBTYPE_WVARCHAR     描述(策划注释)

	var M_G_CLINET_AIGAME_GAMEMODEL                       =2;   
	var M_G_CLINET_AIGAME_GAMEMODEL_STR                   ="GameModel";                  // DBTYPE_I4           游戏模式(目前都是比赛模式)   1. 正常模式    2. 比赛模式    3. 奥运模式

	var M_G_CLINET_AIGAME_GAMESTYLE                       =3;   
	var M_G_CLINET_AIGAME_GAMESTYLE_STR                   ="GameStyle";                  // DBTYPE_I4           比赛类型  1. 单人   2. 双人

	var M_G_CLINET_AIGAME_PLATEFULTYPE                    =4;   
	var M_G_CLINET_AIGAME_PLATEFULTYPE_STR                ="PlatefulType";               // DBTYPE_I4           比赛盘数类型   1. 一盘制    3. 三盘制    5. 五盘制

	var M_G_CLINET_AIGAME_INNINGTYPE                      =5;   
	var M_G_CLINET_AIGAME_INNINGTYPE_STR                  ="InningType";                 // DBTYPE_I4           比赛局数类型   1. 一局制    2. 三局制    5. 五局制

	var M_G_CLINET_AIGAME_USEAI0                          =6;   
	var M_G_CLINET_AIGAME_USEAI0_STR                      ="UseAI0";                     // DBTYPE_BOOL         使用AI0

	var M_G_CLINET_AIGAME_AI0ID                           =7;   
	var M_G_CLINET_AIGAME_AI0ID_STR                       ="AI0ID";                      // DBTYPE_I4           第一AI的ID(玩家对点对手)

	var M_G_CLINET_AIGAME_USEAI1                          =8;   
	var M_G_CLINET_AIGAME_USEAI1_STR                      ="UseAI1";                     // DBTYPE_BOOL         使用AI1

	var M_G_CLINET_AIGAME_AI1ID                           =9;   
	var M_G_CLINET_AIGAME_AI1ID_STR                       ="AI1ID";                      // DBTYPE_I4           第二AI的ID(玩家队友)

	var M_G_CLINET_AIGAME_USEAI2                          =10;  
	var M_G_CLINET_AIGAME_USEAI2_STR                      ="UseAI2";                     // DBTYPE_BOOL         使用AI2

	var M_G_CLINET_AIGAME_AI2ID                           =11;  
	var M_G_CLINET_AIGAME_AI2ID_STR                       ="AI2ID";                      // DBTYPE_I4           第三AI的ID(玩家对点对手的队友)

	var M_G_CLINET_AIGAME_USEMAP                          =12;  
	var M_G_CLINET_AIGAME_USEMAP_STR                      ="UseMap";                     // DBTYPE_I4           使用地图的ID


	var AIUSER                                            ="AIUser";
	var M_G_CLINET_AIUSER_AIID                            =0;   
	var M_G_CLINET_AIUSER_AIID_STR                        ="AIID";                       // DBTYPE_I4           AI的ID(取1000~1999)

	var M_G_CLINET_AIUSER_DESCRIPTION                     =1;   
	var M_G_CLINET_AIUSER_DESCRIPTION_STR                 ="Description";                // DBTYPE_WVARCHAR     描述(策划注释)

	var M_G_CLINET_AIUSER_RID                             =2;   
	var M_G_CLINET_AIUSER_RID_STR                         ="RID";                        // DBTYPE_I4           AI的RoleID

	var M_G_CLINET_AIUSER_NKNAME                          =3;   
	var M_G_CLINET_AIUSER_NKNAME_STR                      ="NkName";                     // DBTYPE_WVARCHAR     昵称

	var M_G_CLINET_AIUSER_AIGMLCLASS                      =4;   
	var M_G_CLINET_AIUSER_AIGMLCLASS_STR                  ="AIGmlClass";                 // DBTYPE_WVARCHAR     AI的智商脚本类名

	var M_G_CLINET_AIUSER_DEFID                           =5;   
	var M_G_CLINET_AIUSER_DEFID_STR                       ="defid";                      // DBTYPE_I4           1.男  2.女

	var M_G_CLINET_AIUSER_AV0                             =6;   
	var M_G_CLINET_AIUSER_AV0_STR                         ="Av0";                        // DBTYPE_I4           部件0（发型）

	var M_G_CLINET_AIUSER_AV1                             =7;   
	var M_G_CLINET_AIUSER_AV1_STR                         ="Av1";                        // DBTYPE_I4           部件1（面部）

	var M_G_CLINET_AIUSER_AV2                             =8;   
	var M_G_CLINET_AIUSER_AV2_STR                         ="Av2";                        // DBTYPE_I4           部件2（身体）

	var M_G_CLINET_AIUSER_AV3                             =9;   
	var M_G_CLINET_AIUSER_AV3_STR                         ="Av3";                        // DBTYPE_I4           部件3（裤子）

	var M_G_CLINET_AIUSER_AV4                             =10;  
	var M_G_CLINET_AIUSER_AV4_STR                         ="Av4";                        // DBTYPE_I4           部件4（手套）

	var M_G_CLINET_AIUSER_AV5                             =11;  
	var M_G_CLINET_AIUSER_AV5_STR                         ="Av5";                        // DBTYPE_I4           部件5（大腿）

	var M_G_CLINET_AIUSER_AV6                             =12;  
	var M_G_CLINET_AIUSER_AV6_STR                         ="Av6";                        // DBTYPE_I4           部件6（鞋子）

	var M_G_CLINET_AIUSER_AV7                             =13;  
	var M_G_CLINET_AIUSER_AV7_STR                         ="Av7";                        // DBTYPE_I4           部件7（背包）

	var M_G_CLINET_AIUSER_AV8                             =14;  
	var M_G_CLINET_AIUSER_AV8_STR                         ="Av8";                        // DBTYPE_I4           部件8（球拍）

	var M_G_CLINET_AIUSER_AV9                             =15;  
	var M_G_CLINET_AIUSER_AV9_STR                         ="Av9";                        // DBTYPE_I4           部件9（眼镜）

	var M_G_CLINET_AIUSER_AV10                            =16;  
	var M_G_CLINET_AIUSER_AV10_STR                        ="Av10";                       // DBTYPE_I4           部件10（护腕）

	var M_G_CLINET_AIUSER_AV11                            =17;  
	var M_G_CLINET_AIUSER_AV11_STR                        ="Av11";                       // DBTYPE_I4           部件11（项链）

	var M_G_CLINET_AIUSER_AV12                            =18;  
	var M_G_CLINET_AIUSER_AV12_STR                        ="Av12";                       // DBTYPE_I4           部件12（附件）

	var M_G_CLINET_AIUSER_AV13                            =19;  
	var M_G_CLINET_AIUSER_AV13_STR                        ="Av13";                       // DBTYPE_I4           部件13

	var M_G_CLINET_AIUSER_TSKILL                          =20;  
	var M_G_CLINET_AIUSER_TSKILL_STR                      ="TSkill";                     // DBTYPE_I4           属性: 技巧

	var M_G_CLINET_AIUSER_TSTRENGTH                       =21;  
	var M_G_CLINET_AIUSER_TSTRENGTH_STR                   ="TStrength";                  // DBTYPE_I4           属性: 力量

	var M_G_CLINET_AIUSER_TFORWARD                        =22;  
	var M_G_CLINET_AIUSER_TFORWARD_STR                    ="TForward";                   // DBTYPE_I4           属性: 前场

	var M_G_CLINET_AIUSER_TBACKWARD                       =23;  
	var M_G_CLINET_AIUSER_TBACKWARD_STR                   ="TBackward";                  // DBTYPE_I4           属性: 后场

	var M_G_CLINET_AIUSER_TSERVE                          =24;  
	var M_G_CLINET_AIUSER_TSERVE_STR                      ="TServe";                     // DBTYPE_I4           属性: 发球

	var M_G_CLINET_AIUSER_TENERGY                         =25;  
	var M_G_CLINET_AIUSER_TENERGY_STR                     ="TEnergy";                    // DBTYPE_I4           属性: 能量

	var M_G_CLINET_AIUSER_TSTAMINA                        =26;  
	var M_G_CLINET_AIUSER_TSTAMINA_STR                    ="TStamina";                   // DBTYPE_I4           属性: 体力

	var M_G_CLINET_AIUSER_SKILL                           =27;  
	var M_G_CLINET_AIUSER_SKILL_STR                       ="Skill";                      // DBTYPE_WVARCHAR     拥有技能(目前没有作用  格式: 101,201,301)

	var M_G_CLINET_AIUSER_LEVEL                           =28;  
	var M_G_CLINET_AIUSER_LEVEL_STR                       ="Level";                      // DBTYPE_I4           等级

	var M_G_CLINET_AIUSER_TITLE                           =29;  
	var M_G_CLINET_AIUSER_TITLE_STR                       ="Title";                      // DBTYPE_I4           获得的称号 1.新手 2.资格赛 3巡回 4黄金 5大师


	var ALTERNATION                                       ="Alternation";
	var M_G_CLINET_ALTERNATION_ID                         =0;   
	var M_G_CLINET_ALTERNATION_ID_STR                     ="ID";                         // DBTYPE_I4           用于提供参数 搜索ID, 恒为0

	var M_G_CLINET_ALTERNATION_CURTRACKID                 =1;   
	var M_G_CLINET_ALTERNATION_CURTRACKID_STR             ="CurTrackID";                 // DBTYPE_I4           GetTrackInfo提供, 当前轨迹的ID, 没有轨迹的时候为-1

	var M_G_CLINET_ALTERNATION_FIRSTDROPPOINTX            =2;   
	var M_G_CLINET_ALTERNATION_FIRSTDROPPOINTX_STR        ="FirstDropPointX";            // DBTYPE_R4           GetTrackInfo提供, 第一落点X

	var M_G_CLINET_ALTERNATION_FIRSTDROPPOINTZ            =3;   
	var M_G_CLINET_ALTERNATION_FIRSTDROPPOINTZ_STR        ="FirstDropPointZ";            // DBTYPE_R4           GetTrackInfo提供, 第一落点Z

	var M_G_CLINET_ALTERNATION_SECONDDROPPOINTX           =4;   
	var M_G_CLINET_ALTERNATION_SECONDDROPPOINTX_STR       ="SecondDropPointX";           // DBTYPE_R4           GetTrackInfo提供, 第二落点X

	var M_G_CLINET_ALTERNATION_SECONDDROPPOINTZ           =5;   
	var M_G_CLINET_ALTERNATION_SECONDDROPPOINTZ_STR       ="SecondDropPointZ";           // DBTYPE_R4           GetTrackInfo提供, 第二落点Z

	var M_G_CLINET_ALTERNATION_GETSECONDDROPPOINTTIME     =6;   
	var M_G_CLINET_ALTERNATION_GETSECONDDROPPOINTTIME_STR ="GetSecondDropPointTime";     // DBTYPE_I4           GetTrackInfo提供, 到达第二落点的时间(单位:ms)

	var M_G_CLINET_ALTERNATION_GETHINTERSECTIONTIME       =7;   
	var M_G_CLINET_ALTERNATION_GETHINTERSECTIONTIME_STR   ="GetHInterSectionTime";       // DBTYPE_I4           GetHitInfo提供, 到达水平交点的时间(单位:ms)

	var M_G_CLINET_ALTERNATION_HINTERSECTIONPOINTX        =8;   
	var M_G_CLINET_ALTERNATION_HINTERSECTIONPOINTX_STR    ="HInterSectionPointX";        // DBTYPE_R4           GetHitInfo提供, 轨迹水平交点X

	var M_G_CLINET_ALTERNATION_HINTERSECTIONPOINTY        =9;   
	var M_G_CLINET_ALTERNATION_HINTERSECTIONPOINTY_STR    ="HInterSectionPointY";        // DBTYPE_R4           GetHitInfo提供, 轨迹水平交点Y

	var M_G_CLINET_ALTERNATION_HINTERSECTIONPOINTZ        =10;  
	var M_G_CLINET_ALTERNATION_HINTERSECTIONPOINTZ_STR    ="HInterSectionPointZ";        // DBTYPE_R4           GetHitInfo提供, 轨迹水平交点Z

	var M_G_CLINET_ALTERNATION_FIRSTLOBPOINT              =11;  
	var M_G_CLINET_ALTERNATION_FIRSTLOBPOINT_STR          ="FirstLobPoint";              // DBTYPE_I4           GetTrackInfo提供, 第一扣杀位置的索引

	var M_G_CLINET_ALTERNATION_LASTHITUSER                =12;  
	var M_G_CLINET_ALTERNATION_LASTHITUSER_STR            ="lastHitUser";                // DBTYPE_I4           上次擊球人UserID


	var ALTERNATIONUSER                                   ="AlternationUser";
	var M_G_CLINET_ALTERNATIONUSER_GAMESTATION            =0;   
	var M_G_CLINET_ALTERNATIONUSER_GAMESTATION_STR        ="GameStation";                // DBTYPE_I4           用于为返回参数提供支持, 游戏位置 通过这个查找自己的队友和对手 例如:我是1,对方就是3,队友是2,对手队友是4.

	var M_G_CLINET_ALTERNATIONUSER_ID                     =1;   
	var M_G_CLINET_ALTERNATIONUSER_ID_STR                 ="ID";                         // DBTYPE_I4           GetUserInfo提供, UserID

	var M_G_CLINET_ALTERNATIONUSER_POSX                   =2;   
	var M_G_CLINET_ALTERNATIONUSER_POSX_STR               ="PosX";                       // DBTYPE_R4           GetUserInfo提供, 人物位置X

	var M_G_CLINET_ALTERNATIONUSER_POSZ                   =3;   
	var M_G_CLINET_ALTERNATIONUSER_POSZ_STR               ="PosZ";                       // DBTYPE_R4           GetUserInfo提供, 人物位置Z

	var M_G_CLINET_ALTERNATIONUSER_DIRX                   =4;   
	var M_G_CLINET_ALTERNATIONUSER_DIRX_STR               ="DirX";                       // DBTYPE_R4           GetUserInfo提供, 人物方向X

	var M_G_CLINET_ALTERNATIONUSER_DIRZ                   =5;   
	var M_G_CLINET_ALTERNATIONUSER_DIRZ_STR               ="DirZ";                       // DBTYPE_R4           GetUserInfo提供, 人物方向Z


	var ARROWDEFINE                                       ="ArrowDefine";
	var M_G_CLINET_ARROWDEFINE_ID                         =0;   
	var M_G_CLINET_ARROWDEFINE_ID_STR                     ="ID";                         // DBTYPE_I4           

	var M_G_CLINET_ARROWDEFINE_NAME                       =1;   
	var M_G_CLINET_ARROWDEFINE_NAME_STR                   ="Name";                       // DBTYPE_WVARCHAR     

	var M_G_CLINET_ARROWDEFINE_MODELID                    =2;   
	var M_G_CLINET_ARROWDEFINE_MODELID_STR                ="ModelID";                    // DBTYPE_I4           显示相关。-1表示不关心。则后面的所有的碰撞状态都无效

	var M_G_CLINET_ARROWDEFINE_ITEMID                     =3;   
	var M_G_CLINET_ARROWDEFINE_ITEMID_STR                 ="ItemID";                     // DBTYPE_I4           

	var M_G_CLINET_ARROWDEFINE_DIRCNTRL                   =4;   
	var M_G_CLINET_ARROWDEFINE_DIRCNTRL_STR               ="DirCntrl";                   // DBTYPE_I4           0 不控制，外部传	1 水平方向沿着前进方向 2 x轴沿着前进方向

	var M_G_CLINET_ARROWDEFINE_HURTBOXTYPE                =5;   
	var M_G_CLINET_ARROWDEFINE_HURTBOXTYPE_STR            ="HurtBoxType";                // DBTYPE_I4           0 盒子 1圆柱

	var M_G_CLINET_ARROWDEFINE_HURTBOXID                  =6;   
	var M_G_CLINET_ARROWDEFINE_HURTBOXID_STR              ="HurtBoxID";                  // DBTYPE_I4           -1则不会使用下面的数据，

	var M_G_CLINET_ARROWDEFINE_HURTBOXSIZEX               =7;   
	var M_G_CLINET_ARROWDEFINE_HURTBOXSIZEX_STR           ="HurtBoxSizeX";               // DBTYPE_R4           

	var M_G_CLINET_ARROWDEFINE_HURTBOXSIZEY               =8;   
	var M_G_CLINET_ARROWDEFINE_HURTBOXSIZEY_STR           ="HurtBoxSizeY";               // DBTYPE_R4           

	var M_G_CLINET_ARROWDEFINE_HURTBOXSIZEZ               =9;   
	var M_G_CLINET_ARROWDEFINE_HURTBOXSIZEZ_STR           ="HurtBoxSizeZ";               // DBTYPE_R4           

	var M_G_CLINET_ARROWDEFINE_HURTBOXPOSX                =10;  
	var M_G_CLINET_ARROWDEFINE_HURTBOXPOSX_STR            ="HurtBoxPosX";                // DBTYPE_R4           

	var M_G_CLINET_ARROWDEFINE_HURTBOXPOSY                =11;  
	var M_G_CLINET_ARROWDEFINE_HURTBOXPOSY_STR            ="HurtBoxPosY";                // DBTYPE_R4           

	var M_G_CLINET_ARROWDEFINE_HURTBOXPOSZ                =12;  
	var M_G_CLINET_ARROWDEFINE_HURTBOXPOSZ_STR            ="HurtBoxPosZ";                // DBTYPE_R4           

	var M_G_CLINET_ARROWDEFINE_HURTID                     =13;  
	var M_G_CLINET_ARROWDEFINE_HURTID_STR                 ="HurtID";                     // DBTYPE_I4           对应的攻击动作

	var M_G_CLINET_ARROWDEFINE_VEL                        =14;  
	var M_G_CLINET_ARROWDEFINE_VEL_STR                    ="Vel";                        // DBTYPE_R4           速度

	var M_G_CLINET_ARROWDEFINE_DELDISTANCE                =15;  
	var M_G_CLINET_ARROWDEFINE_DELDISTANCE_STR            ="DelDistance";                // DBTYPE_R4           到达距离后删除

	var M_G_CLINET_ARROWDEFINE_DELTIME                    =16;  
	var M_G_CLINET_ARROWDEFINE_DELTIME_STR                ="DelTime";                    // DBTYPE_I4           到达时间后删除

	var M_G_CLINET_ARROWDEFINE_G                          =17;  
	var M_G_CLINET_ARROWDEFINE_G_STR                      ="G";                          // DBTYPE_R4           如果受到重力影响重力是多少

	var M_G_CLINET_ARROWDEFINE_AUTOTRACK                  =18;  
	var M_G_CLINET_ARROWDEFINE_AUTOTRACK_STR              ="Autotrack";                  // DBTYPE_I4           自动跟踪目标么

	var M_G_CLINET_ARROWDEFINE_HITATTACH                  =19;  
	var M_G_CLINET_ARROWDEFINE_HITATTACH_STR              ="HitAttach";                  // DBTYPE_I4           碰撞后插入目标

	var M_G_CLINET_ARROWDEFINE_HITDELAYDEL                =20;  
	var M_G_CLINET_ARROWDEFINE_HITDELAYDEL_STR            ="HitDelayDel";                // DBTYPE_I4           碰撞后延时删除。-1 不删除 0 立即删除 1 动画完成删除（不支持） >1延迟时间

	var M_G_CLINET_ARROWDEFINE_DELFADEOUT                 =21;  
	var M_G_CLINET_ARROWDEFINE_DELFADEOUT_STR             ="DelFadeout";                 // DBTYPE_I4           渐隐删除

	var M_G_CLINET_ARROWDEFINE_STATESTAND                 =22;  
	var M_G_CLINET_ARROWDEFINE_STATESTAND_STR             ="StateStand";                 // DBTYPE_I4           对应的显示状态

	var M_G_CLINET_ARROWDEFINE_STATELAUNCH                =23;  
	var M_G_CLINET_ARROWDEFINE_STATELAUNCH_STR            ="StateLaunch";                // DBTYPE_I4           

	var M_G_CLINET_ARROWDEFINE_STATEFLYING                =24;  
	var M_G_CLINET_ARROWDEFINE_STATEFLYING_STR            ="StateFlying";                // DBTYPE_I4           

	var M_G_CLINET_ARROWDEFINE_STATEHITWALL               =25;  
	var M_G_CLINET_ARROWDEFINE_STATEHITWALL_STR           ="StateHitWall";               // DBTYPE_I4           

	var M_G_CLINET_ARROWDEFINE_STATEHITGROUND             =26;  
	var M_G_CLINET_ARROWDEFINE_STATEHITGROUND_STR         ="StateHitGround";             // DBTYPE_I4           

	var M_G_CLINET_ARROWDEFINE_STATEHITPLAYER             =27;  
	var M_G_CLINET_ARROWDEFINE_STATEHITPLAYER_STR         ="StateHitPlayer";             // DBTYPE_I4           

	var M_G_CLINET_ARROWDEFINE_STATEHITWATER              =28;  
	var M_G_CLINET_ARROWDEFINE_STATEHITWATER_STR          ="StateHitWater";              // DBTYPE_I4           

	var M_G_CLINET_ARROWDEFINE_STATEHITWEAPON             =29;  
	var M_G_CLINET_ARROWDEFINE_STATEHITWEAPON_STR         ="StateHitWeapon";             // DBTYPE_I4           

	var M_G_CLINET_ARROWDEFINE_STATEBEHIT                 =30;  
	var M_G_CLINET_ARROWDEFINE_STATEBEHIT_STR             ="StateBeHit";                 // DBTYPE_I4           


	var CAMERADEF                                         ="cameradef";
	var M_G_CLINET_CAMERADEF_CAMERA_TYPE                  =0;   
	var M_G_CLINET_CAMERADEF_CAMERA_TYPE_STR              ="camera_type";                // DBTYPE_I4           摄像机运作方式id

	var M_G_CLINET_CAMERADEF_NOTE                         =1;   
	var M_G_CLINET_CAMERADEF_NOTE_STR                     ="note";                       // DBTYPE_WVARCHAR     摄像机运作方式描述

	var M_G_CLINET_CAMERADEF_CAMERA_DIST                  =2;   
	var M_G_CLINET_CAMERADEF_CAMERA_DIST_STR              ="camera_dist";                // DBTYPE_R4           镜头视距

	var M_G_CLINET_CAMERADEF_CAMERA_ZOOM                  =3;   
	var M_G_CLINET_CAMERADEF_CAMERA_ZOOM_STR              ="camera_zoom";                // DBTYPE_R4           摄像机视角

	var M_G_CLINET_CAMERADEF_DIST_SPRING                  =4;   
	var M_G_CLINET_CAMERADEF_DIST_SPRING_STR              ="dist_spring";                // DBTYPE_I4           视距调整的弹性系数

	var M_G_CLINET_CAMERADEF_ZOOM_SPRING                  =5;   
	var M_G_CLINET_CAMERADEF_ZOOM_SPRING_STR              ="Zoom_spring";                // DBTYPE_I4           视角调整的弹性系数

	var M_G_CLINET_CAMERADEF_ORIG_DIR_X                   =6;   
	var M_G_CLINET_CAMERADEF_ORIG_DIR_X_STR               ="orig_dir_x";                 // DBTYPE_R4           默认的摄像机指向x分量

	var M_G_CLINET_CAMERADEF_ORIG_DIR_Y                   =7;   
	var M_G_CLINET_CAMERADEF_ORIG_DIR_Y_STR               ="orig_dir_y";                 // DBTYPE_R4           默认的摄像机指向y分量

	var M_G_CLINET_CAMERADEF_ORIG_DIR_Z                   =8;   
	var M_G_CLINET_CAMERADEF_ORIG_DIR_Z_STR               ="orig_dir_z";                 // DBTYPE_R4           默认的摄像机指向z分量

	var M_G_CLINET_CAMERADEF_YAW_SPRING                   =9;   
	var M_G_CLINET_CAMERADEF_YAW_SPRING_STR               ="Yaw_spring";                 // DBTYPE_I4           眼睛的偏航的弹性系数（围绕y轴）

	var M_G_CLINET_CAMERADEF_PITCHING_SPRINT              =10;  
	var M_G_CLINET_CAMERADEF_PITCHING_SPRINT_STR          ="pitching_sprint";            // DBTYPE_I4           俯仰角调整的弹性系数（围绕x轴）

	var M_G_CLINET_CAMERADEF_ROLL_SPRING                  =11;  
	var M_G_CLINET_CAMERADEF_ROLL_SPRING_STR              ="Roll_spring";                // DBTYPE_I4           横滚角调整的弹性系数（围绕z轴）

	var M_G_CLINET_CAMERADEF_MOVERIGHT_EXTEND             =12;  
	var M_G_CLINET_CAMERADEF_MOVERIGHT_EXTEND_STR         ="MoveRight_extend";           // DBTYPE_R4           左右移动（抖动）的幅度

	var M_G_CLINET_CAMERADEF_MOVERIGHT_SPEED              =13;  
	var M_G_CLINET_CAMERADEF_MOVERIGHT_SPEED_STR          ="MoveRight_speed";            // DBTYPE_R4           左右移动（抖动）的频率

	var M_G_CLINET_CAMERADEF_MOVERISE_EXTEND              =14;  
	var M_G_CLINET_CAMERADEF_MOVERISE_EXTEND_STR          ="MoveRise_extend";            // DBTYPE_R4           上下移动（抖动）的幅度

	var M_G_CLINET_CAMERADEF_MOVERISE_SPEED               =15;  
	var M_G_CLINET_CAMERADEF_MOVERISE_SPEED_STR           ="MoveRise_speed";             // DBTYPE_R4           上下移动（抖动）的频率

	var M_G_CLINET_CAMERADEF_FOCUS_TYPE                   =16;  
	var M_G_CLINET_CAMERADEF_FOCUS_TYPE_STR               ="focus_type";                 // DBTYPE_I4           计算视点的方式

	var M_G_CLINET_CAMERADEF_DIR_TYPE                     =17;  
	var M_G_CLINET_CAMERADEF_DIR_TYPE_STR                 ="dir_type";                   // DBTYPE_I4           计算向的方式

	var M_G_CLINET_CAMERADEF_OFFSET_X                     =18;  
	var M_G_CLINET_CAMERADEF_OFFSET_X_STR                 ="offset_x";                   // DBTYPE_R4           视点相对角色的x偏移

	var M_G_CLINET_CAMERADEF_OFFSET_Y                     =19;  
	var M_G_CLINET_CAMERADEF_OFFSET_Y_STR                 ="offset_y";                   // DBTYPE_R4           视点相对角色的y偏移

	var M_G_CLINET_CAMERADEF_OFFSET_Z                     =20;  
	var M_G_CLINET_CAMERADEF_OFFSET_Z_STR                 ="offset_z";                   // DBTYPE_R4           视点相对角色的z偏移

	var M_G_CLINET_CAMERADEF_PITCHING                     =21;  
	var M_G_CLINET_CAMERADEF_PITCHING_STR                 ="pitching";                   // DBTYPE_R4           俯仰角

	var M_G_CLINET_CAMERADEF_CLAMP                        =22;  
	var M_G_CLINET_CAMERADEF_CLAMP_STR                    ="clamp";                      // DBTYPE_R4           视点与角色的连线和视点与摄像机连线的夹角

	var M_G_CLINET_CAMERADEF_OFFSET_LEN                   =23;  
	var M_G_CLINET_CAMERADEF_OFFSET_LEN_STR               ="offset_len";                 // DBTYPE_R4           视点相对角色的距离

	var M_G_CLINET_CAMERADEF_XRESTRICTION                 =24;  
	var M_G_CLINET_CAMERADEF_XRESTRICTION_STR             ="xRestriction";               // DBTYPE_BOOL         是否使用x方向约束

	var M_G_CLINET_CAMERADEF_XRESTRICTIONMIN              =25;  
	var M_G_CLINET_CAMERADEF_XRESTRICTIONMIN_STR          ="xRestrictionMin";            // DBTYPE_R4           x约束下限

	var M_G_CLINET_CAMERADEF_XRESTRICTIONMAX              =26;  
	var M_G_CLINET_CAMERADEF_XRESTRICTIONMAX_STR          ="xRestrictionMax";            // DBTYPE_R4           x约束上限

	var M_G_CLINET_CAMERADEF_YRESTRICTION                 =27;  
	var M_G_CLINET_CAMERADEF_YRESTRICTION_STR             ="yRestriction";               // DBTYPE_BOOL         

	var M_G_CLINET_CAMERADEF_YRESTRICTIONMIN              =28;  
	var M_G_CLINET_CAMERADEF_YRESTRICTIONMIN_STR          ="yRestrictionMin";            // DBTYPE_R4           

	var M_G_CLINET_CAMERADEF_YRESTRICTIONMAX              =29;  
	var M_G_CLINET_CAMERADEF_YRESTRICTIONMAX_STR          ="yRestrictionMax";            // DBTYPE_R4           

	var M_G_CLINET_CAMERADEF_ZRESTRICTION                 =30;  
	var M_G_CLINET_CAMERADEF_ZRESTRICTION_STR             ="zRestriction";               // DBTYPE_BOOL         

	var M_G_CLINET_CAMERADEF_ZRESTRICTIONMIN              =31;  
	var M_G_CLINET_CAMERADEF_ZRESTRICTIONMIN_STR          ="zRestrictionMin";            // DBTYPE_R4           

	var M_G_CLINET_CAMERADEF_ZRESTRICTIONMAX              =32;  
	var M_G_CLINET_CAMERADEF_ZRESTRICTIONMAX_STR          ="zRestrictionMax";            // DBTYPE_R4           

	var M_G_CLINET_CAMERADEF_XSPRING                      =33;  
	var M_G_CLINET_CAMERADEF_XSPRING_STR                  ="xSpring";                    // DBTYPE_R4           x轴跟随粘滞

	var M_G_CLINET_CAMERADEF_YSPRING                      =34;  
	var M_G_CLINET_CAMERADEF_YSPRING_STR                  ="ySpring";                    // DBTYPE_R4           

	var M_G_CLINET_CAMERADEF_ZSPRING                      =35;  
	var M_G_CLINET_CAMERADEF_ZSPRING_STR                  ="zSpring";                    // DBTYPE_R4           


	var CCRESULT                                          ="ccResult";
	var M_G_CLINET_CCRESULT_CCRESULTID                    =0;   
	var M_G_CLINET_CCRESULT_CCRESULTID_STR                ="CCResultID";                 // DBTYPE_I4           id

	var M_G_CLINET_CCRESULT_CALLFN                        =1;   
	var M_G_CLINET_CCRESULT_CALLFN_STR                    ="CallFn";                     // DBTYPE_WVARCHAR     调用函数

	var M_G_CLINET_CCRESULT_NOTE                          =2;   
	var M_G_CLINET_CCRESULT_NOTE_STR                      ="Note";                       // DBTYPE_WVARCHAR     说明


	var CONDITION                                         ="condition";
	var M_G_CLINET_CONDITION_ID                           =0;   
	var M_G_CLINET_CONDITION_ID_STR                       ="id";                         // DBTYPE_I4           触发的条件id

	var M_G_CLINET_CONDITION_CONDITION                    =1;   
	var M_G_CLINET_CONDITION_CONDITION_STR                ="Condition";                  // DBTYPE_WVARCHAR     触发的条件 多个查询条件的结果用(&&)隔开

	var M_G_CLINET_CONDITION_RESULT1                      =2;   
	var M_G_CLINET_CONDITION_RESULT1_STR                  ="Result1";                    // DBTYPE_WVARCHAR     结果1 多个查询条件的结果用逗号(,)隔开,执行的事件用星号(*)隔开

	var M_G_CLINET_CONDITION_RESULT2                      =3;   
	var M_G_CLINET_CONDITION_RESULT2_STR                  ="Result2";                    // DBTYPE_WVARCHAR     结果2

	var M_G_CLINET_CONDITION_RESULT3                      =4;   
	var M_G_CLINET_CONDITION_RESULT3_STR                  ="Result3";                    // DBTYPE_WVARCHAR     结果3

	var M_G_CLINET_CONDITION_RESULT4                      =5;   
	var M_G_CLINET_CONDITION_RESULT4_STR                  ="Result4";                    // DBTYPE_WVARCHAR     结果4

	var M_G_CLINET_CONDITION_RESULT5                      =6;   
	var M_G_CLINET_CONDITION_RESULT5_STR                  ="Result5";                    // DBTYPE_WVARCHAR     结果5

	var M_G_CLINET_CONDITION_RESULT6                      =7;   
	var M_G_CLINET_CONDITION_RESULT6_STR                  ="Result6";                    // DBTYPE_WVARCHAR     结果6

	var M_G_CLINET_CONDITION_RESULT7                      =8;   
	var M_G_CLINET_CONDITION_RESULT7_STR                  ="Result7";                    // DBTYPE_WVARCHAR     结果7

	var M_G_CLINET_CONDITION_RESULT8                      =9;   
	var M_G_CLINET_CONDITION_RESULT8_STR                  ="Result8";                    // DBTYPE_WVARCHAR     结果8

	var M_G_CLINET_CONDITION_RESULT9                      =10;  
	var M_G_CLINET_CONDITION_RESULT9_STR                  ="Result9";                    // DBTYPE_WVARCHAR     结果9

	var M_G_CLINET_CONDITION_NOTE                         =11;  
	var M_G_CLINET_CONDITION_NOTE_STR                     ="Note";                       // DBTYPE_WVARCHAR     说明


	var EFFECTDEF                                         ="effectdef";
	var M_G_CLINET_EFFECTDEF_EFFECTINDEX                  =0;   
	var M_G_CLINET_EFFECTDEF_EFFECTINDEX_STR              ="EffectIndex";                // DBTYPE_I4           特效索引

	var M_G_CLINET_EFFECTDEF_EFFECTNAME                   =1;   
	var M_G_CLINET_EFFECTDEF_EFFECTNAME_STR               ="EffectName";                 // DBTYPE_WVARCHAR     特效名称

	var M_G_CLINET_EFFECTDEF_EVERYID                      =2;   
	var M_G_CLINET_EFFECTDEF_EVERYID_STR                  ="EveryID";                    // DBTYPE_WVARCHAR     每个子特效索引 用","分隔 以下三个的长度一样

	var M_G_CLINET_EFFECTDEF_EVERYSTARTTM                 =3;   
	var M_G_CLINET_EFFECTDEF_EVERYSTARTTM_STR             ="EveryStartTm";               // DBTYPE_WVARCHAR     每个子特效开始时间  用","分隔 不填表示从0开始

	var M_G_CLINET_EFFECTDEF_EVERYLASTTM                  =4;   
	var M_G_CLINET_EFFECTDEF_EVERYLASTTM_STR              ="EveryLastTm";                // DBTYPE_WVARCHAR     每个子特效持续时间  用","分隔 不填表示一直持续

	var M_G_CLINET_EFFECTDEF_EVERYPLAYSPEED               =5;   
	var M_G_CLINET_EFFECTDEF_EVERYPLAYSPEED_STR           ="EveryPlaySpeed";             // DBTYPE_WVARCHAR     每个子特效播放速度  用","分隔 不填表示速度都是1 对fmode类特效有效 0.5表示以一半速度运行 2表示以2倍速度运行

	var M_G_CLINET_EFFECTDEF_EVERYSHADERCONTROL           =6;   
	var M_G_CLINET_EFFECTDEF_EVERYSHADERCONTROL_STR       ="EveryShaderControl";         // DBTYPE_WVARCHAR     对每个子特效的渲染控制ID

	var M_G_CLINET_EFFECTDEF_SHOWLV                       =7;   
	var M_G_CLINET_EFFECTDEF_SHOWLV_STR                   ="ShowLv";                     // DBTYPE_I4           显示等级

	var M_G_CLINET_EFFECTDEF_RANDNUM                      =8;   
	var M_G_CLINET_EFFECTDEF_RANDNUM_STR                  ="RandNum";                    // DBTYPE_I4           随机子特效同时存在个数 (=0表示同时 >0则随机取的个数(排除永久显示的))

	var M_G_CLINET_EFFECTDEF_NOTE                         =9;   
	var M_G_CLINET_EFFECTDEF_NOTE_STR                     ="Note";                       // DBTYPE_WVARCHAR     注释


	var EQUIPSERIES                                       ="EquipSeries";
	var M_G_CLINET_EQUIPSERIES_SERIESID                   =0;   
	var M_G_CLINET_EQUIPSERIES_SERIESID_STR               ="SeriesID";                   // DBTYPE_I4           套装编号

	var M_G_CLINET_EQUIPSERIES_SERIESTYPE                 =1;   
	var M_G_CLINET_EQUIPSERIES_SERIESTYPE_STR             ="SeriesType";                 // DBTYPE_I4           0.男用 1.女用

	var M_G_CLINET_EQUIPSERIES_SERIESNAME                 =2;   
	var M_G_CLINET_EQUIPSERIES_SERIESNAME_STR             ="SeriesName";                 // DBTYPE_WVARCHAR     套装名字

	var M_G_CLINET_EQUIPSERIES_SERIESPART1                =3;   
	var M_G_CLINET_EQUIPSERIES_SERIESPART1_STR            ="SeriesPart1";                // DBTYPE_I4           发型

	var M_G_CLINET_EQUIPSERIES_SERIESPART2                =4;   
	var M_G_CLINET_EQUIPSERIES_SERIESPART2_STR            ="SeriesPart2";                // DBTYPE_I4           面容

	var M_G_CLINET_EQUIPSERIES_SERIESPART3                =5;   
	var M_G_CLINET_EQUIPSERIES_SERIESPART3_STR            ="SeriesPart3";                // DBTYPE_I4           上装

	var M_G_CLINET_EQUIPSERIES_SERIESPART4                =6;   
	var M_G_CLINET_EQUIPSERIES_SERIESPART4_STR            ="SeriesPart4";                // DBTYPE_I4           裙裤

	var M_G_CLINET_EQUIPSERIES_SERIESPART5                =7;   
	var M_G_CLINET_EQUIPSERIES_SERIESPART5_STR            ="SeriesPart5";                // DBTYPE_I4           手套

	var M_G_CLINET_EQUIPSERIES_SERIESPART6                =8;   
	var M_G_CLINET_EQUIPSERIES_SERIESPART6_STR            ="SeriesPart6";                // DBTYPE_I4           袜子

	var M_G_CLINET_EQUIPSERIES_SERIESPART7                =9;   
	var M_G_CLINET_EQUIPSERIES_SERIESPART7_STR            ="SeriesPart7";                // DBTYPE_I4           鞋

	var M_G_CLINET_EQUIPSERIES_SERIESPART8                =10;  
	var M_G_CLINET_EQUIPSERIES_SERIESPART8_STR            ="SeriesPart8";                // DBTYPE_I4           背饰

	var M_G_CLINET_EQUIPSERIES_SERIESPART9                =11;  
	var M_G_CLINET_EQUIPSERIES_SERIESPART9_STR            ="SeriesPart9";                // DBTYPE_I4           球拍

	var M_G_CLINET_EQUIPSERIES_SERIESPART10               =12;  
	var M_G_CLINET_EQUIPSERIES_SERIESPART10_STR           ="SeriesPart10";               // DBTYPE_I4           眼镜

	var M_G_CLINET_EQUIPSERIES_SERIESPART11               =13;  
	var M_G_CLINET_EQUIPSERIES_SERIESPART11_STR           ="SeriesPart11";               // DBTYPE_I4           

	var M_G_CLINET_EQUIPSERIES_SERIESPART12               =14;  
	var M_G_CLINET_EQUIPSERIES_SERIESPART12_STR           ="SeriesPart12";               // DBTYPE_I4           

	var M_G_CLINET_EQUIPSERIES_SERIESPART13               =15;  
	var M_G_CLINET_EQUIPSERIES_SERIESPART13_STR           ="SeriesPart13";               // DBTYPE_I4           

	var M_G_CLINET_EQUIPSERIES_SERIESPART14               =16;  
	var M_G_CLINET_EQUIPSERIES_SERIESPART14_STR           ="SeriesPart14";               // DBTYPE_I4           

	var M_G_CLINET_EQUIPSERIES_SERIESATTRIBUTE1           =17;  
	var M_G_CLINET_EQUIPSERIES_SERIESATTRIBUTE1_STR       ="SeriesAttribute1";           // DBTYPE_WVARCHAR     装备一件后的属性

	var M_G_CLINET_EQUIPSERIES_SERIESATTRIBUTE2           =18;  
	var M_G_CLINET_EQUIPSERIES_SERIESATTRIBUTE2_STR       ="SeriesAttribute2";           // DBTYPE_WVARCHAR     

	var M_G_CLINET_EQUIPSERIES_SERIESATTRIBUTE3           =19;  
	var M_G_CLINET_EQUIPSERIES_SERIESATTRIBUTE3_STR       ="SeriesAttribute3";           // DBTYPE_WVARCHAR     

	var M_G_CLINET_EQUIPSERIES_SERIESATTRIBUTE4           =20;  
	var M_G_CLINET_EQUIPSERIES_SERIESATTRIBUTE4_STR       ="SeriesAttribute4";           // DBTYPE_WVARCHAR     

	var M_G_CLINET_EQUIPSERIES_SERIESATTRIBUTE5           =21;  
	var M_G_CLINET_EQUIPSERIES_SERIESATTRIBUTE5_STR       ="SeriesAttribute5";           // DBTYPE_WVARCHAR     

	var M_G_CLINET_EQUIPSERIES_SERIESATTRIBUTE6           =22;  
	var M_G_CLINET_EQUIPSERIES_SERIESATTRIBUTE6_STR       ="SeriesAttribute6";           // DBTYPE_WVARCHAR     

	var M_G_CLINET_EQUIPSERIES_SERIESATTRIBUTE7           =23;  
	var M_G_CLINET_EQUIPSERIES_SERIESATTRIBUTE7_STR       ="SeriesAttribute7";           // DBTYPE_WVARCHAR     

	var M_G_CLINET_EQUIPSERIES_SERIESATTRIBUTE8           =24;  
	var M_G_CLINET_EQUIPSERIES_SERIESATTRIBUTE8_STR       ="SeriesAttribute8";           // DBTYPE_WVARCHAR     

	var M_G_CLINET_EQUIPSERIES_SERIESATTRIBUTE9           =25;  
	var M_G_CLINET_EQUIPSERIES_SERIESATTRIBUTE9_STR       ="SeriesAttribute9";           // DBTYPE_WVARCHAR     

	var M_G_CLINET_EQUIPSERIES_SERIESATTRIBUTE10          =26;  
	var M_G_CLINET_EQUIPSERIES_SERIESATTRIBUTE10_STR      ="SeriesAttribute10";          // DBTYPE_WVARCHAR     

	var M_G_CLINET_EQUIPSERIES_SERIESATTRIBUTE11          =27;  
	var M_G_CLINET_EQUIPSERIES_SERIESATTRIBUTE11_STR      ="SeriesAttribute11";          // DBTYPE_WVARCHAR     

	var M_G_CLINET_EQUIPSERIES_SERIESATTRIBUTE12          =28;  
	var M_G_CLINET_EQUIPSERIES_SERIESATTRIBUTE12_STR      ="SeriesAttribute12";          // DBTYPE_WVARCHAR     

	var M_G_CLINET_EQUIPSERIES_SERIESATTRIBUTE13          =29;  
	var M_G_CLINET_EQUIPSERIES_SERIESATTRIBUTE13_STR      ="SeriesAttribute13";          // DBTYPE_WVARCHAR     

	var M_G_CLINET_EQUIPSERIES_SERIESATTRIBUTE14          =30;  
	var M_G_CLINET_EQUIPSERIES_SERIESATTRIBUTE14_STR      ="SeriesAttribute14";          // DBTYPE_WVARCHAR     


	var EVENTCOUNTER                                      ="EventCounter";
	var M_G_CLINET_EVENTCOUNTER_EVENTID                   =0;   
	var M_G_CLINET_EVENTCOUNTER_EVENTID_STR               ="EventID";                    // DBTYPE_I4           事件ID

	var M_G_CLINET_EVENTCOUNTER_EVENTDESCRIPTION          =1;   
	var M_G_CLINET_EVENTCOUNTER_EVENTDESCRIPTION_STR      ="EventDescription";           // DBTYPE_WVARCHAR     事件描述

	var M_G_CLINET_EVENTCOUNTER_VARNAME                   =2;   
	var M_G_CLINET_EVENTCOUNTER_VARNAME_STR               ="VarName";                    // DBTYPE_WVARCHAR     程序自动生成的脚本变量名

	var M_G_CLINET_EVENTCOUNTER_SAVETYPE                  =3;   
	var M_G_CLINET_EVENTCOUNTER_SAVETYPE_STR              ="SaveType";                   // DBTYPE_I4           保存类型 0.需要保存计数(客户端关闭后计数依然有效) 1.关闭客户端不保存计数

	var M_G_CLINET_EVENTCOUNTER_SENSITIVECOUNT            =4;   
	var M_G_CLINET_EVENTCOUNTER_SENSITIVECOUNT_STR        ="SensitiveCount";             // DBTYPE_WVARCHAR     敏感计数,用','隔开,当值为-1时表示每次通知    如: 1,10

	var M_G_CLINET_EVENTCOUNTER_SCRIPT                    =5;   
	var M_G_CLINET_EVENTCOUNTER_SCRIPT_STR                ="Script";                     // DBTYPE_WVARCHAR     调用的脚本函数名

	var M_G_CLINET_EVENTCOUNTER_ARROWID                   =6;   
	var M_G_CLINET_EVENTCOUNTER_ARROWID_STR               ="ArrowID";                    // DBTYPE_WVARCHAR     箭头的ID,GameUI.mdb/UIGuide

	var M_G_CLINET_EVENTCOUNTER_NGROUP                    =7;   
	var M_G_CLINET_EVENTCOUNTER_NGROUP_STR                ="nGroup";                     // DBTYPE_I4           分组


	var GAMEEVENT                                         ="GameEvent";
	var M_G_CLINET_GAMEEVENT_EVENTID                      =0;   
	var M_G_CLINET_GAMEEVENT_EVENTID_STR                  ="EventID";                    // DBTYPE_I4           事件ID

	var M_G_CLINET_GAMEEVENT_EVENTSCRIPT                  =1;   
	var M_G_CLINET_GAMEEVENT_EVENTSCRIPT_STR              ="EventScript";                // DBTYPE_WVARCHAR     发生事件后调用的脚本

	var M_G_CLINET_GAMEEVENT_EVENTSCRIPTFUN               =2;   
	var M_G_CLINET_GAMEEVENT_EVENTSCRIPTFUN_STR           ="EventScriptFun";             // DBTYPE_WVARCHAR     事件脚本函数

	var M_G_CLINET_GAMEEVENT_EVENTDISCRIPTION             =3;   
	var M_G_CLINET_GAMEEVENT_EVENTDISCRIPTION_STR         ="EventDiscription";           // DBTYPE_WVARCHAR     事件描述


	var GAMESHOW                                          ="gameshow";
	var M_G_CLINET_GAMESHOW_ROLEID                        =0;   
	var M_G_CLINET_GAMESHOW_ROLEID_STR                    ="RoleID";                     // DBTYPE_I4           0 角色ID

	var M_G_CLINET_GAMESHOW_USERID                        =1;   
	var M_G_CLINET_GAMESHOW_USERID_STR                    ="UserID";                     // DBTYPE_I4           1 用户ID

	var M_G_CLINET_GAMESHOW_TEAMID                        =2;   
	var M_G_CLINET_GAMESHOW_TEAMID_STR                    ="TeamID";                     // DBTYPE_I4           2 队伍ID

	var M_G_CLINET_GAMESHOW_GAMESTATE                     =3;   
	var M_G_CLINET_GAMESHOW_GAMESTATE_STR                 ="GameState";                  // DBTYPE_I4           3 游戏状态 2.开始 3.正中进行 4.结束 5.结束后

	var M_G_CLINET_GAMESHOW_SETNUM                        =4;   
	var M_G_CLINET_GAMESHOW_SETNUM_STR                    ="SetNum";                     // DBTYPE_I4           4 第几盘

	var M_G_CLINET_GAMESHOW_GAMENUM                       =5;   
	var M_G_CLINET_GAMESHOW_GAMENUM_STR                   ="GameNum";                    // DBTYPE_I4           5 第几局 99.抢七局

	var M_G_CLINET_GAMESHOW_GAMESCORE                     =6;   
	var M_G_CLINET_GAMESHOW_GAMESCORE_STR                 ="GameScore";                  // DBTYPE_I4           6 局的分数

	var M_G_CLINET_GAMESHOW_POINT                         =7;   
	var M_G_CLINET_GAMESHOW_POINT_STR                     ="Point";                      // DBTYPE_I4           7 比分 和现实的比分类似,普通为: 15:15 30:40 但是当40:40后再得一分为-1:40

	var M_G_CLINET_GAMESHOW_CURRENERGY                    =8;   
	var M_G_CLINET_GAMESHOW_CURRENERGY_STR                ="CurrEnergy";                 // DBTYPE_I4           8 当前能量

	var M_G_CLINET_GAMESHOW_BALLINSELF                    =9;   
	var M_G_CLINET_GAMESHOW_BALLINSELF_STR                ="BallInSelf";                 // DBTYPE_BOOL         9 "是"表示在自己半场

	var M_G_CLINET_GAMESHOW_STOREPOWER                    =10;  
	var M_G_CLINET_GAMESHOW_STOREPOWER_STR                ="StorePower";                 // DBTYPE_I4           10 蓄力百分比0~100 目前没用

	var M_G_CLINET_GAMESHOW_TIPSTATE1                     =11;  
	var M_G_CLINET_GAMESHOW_TIPSTATE1_STR                 ="TipState1";                  // DBTYPE_I4           11 提示 0:没有交换场地 1.有

	var M_G_CLINET_GAMESHOW_TIPSTATE2                     =12;  
	var M_G_CLINET_GAMESHOW_TIPSTATE2_STR                 ="TipState2";                  // DBTYPE_I4           12 提示 0:不是破发点 1.有

	var M_G_CLINET_GAMESHOW_TIPSTATE3                     =13;  
	var M_G_CLINET_GAMESHOW_TIPSTATE3_STR                 ="TipState3";                  // DBTYPE_I4           13 提示 0:默认状态 1.局点 2.赛点

	var M_G_CLINET_GAMESHOW_HANDSOMEACTION                =14;  
	var M_G_CLINET_GAMESHOW_HANDSOMEACTION_STR            ="HandsomeAction";             // DBTYPE_I4           14 帅气的动作 -1.默认值 0.普通结束 1.发球得分 2.扣杀 3.绝杀 4.反杀

	var M_G_CLINET_GAMESHOW_REFRESHINDEX                  =15;  
	var M_G_CLINET_GAMESHOW_REFRESHINDEX_STR              ="RefreshIndex";               // DBTYPE_I4           15 改变的索引 1.帅气的动作 2.局分 3.比赛前的数据 4:游戏开始 5:游戏结束

	var M_G_CLINET_GAMESHOW_GAINEXP                       =16;  
	var M_G_CLINET_GAMESHOW_GAINEXP_STR                   ="GainExp";                    // DBTYPE_I4           16 获得经验

	var M_G_CLINET_GAMESHOW_GAINMONEY                     =17;  
	var M_G_CLINET_GAMESHOW_GAINMONEY_STR                 ="GainMoney";                  // DBTYPE_I4           17 获得金币

	var M_G_CLINET_GAMESHOW_APPRAISE                      =18;  
	var M_G_CLINET_GAMESHOW_APPRAISE_STR                  ="Appraise";                   // DBTYPE_I4           18 系统评价

	var M_G_CLINET_GAMESHOW_ACEBALL                       =19;  
	var M_G_CLINET_GAMESHOW_ACEBALL_STR                   ="ACEBall";                    // DBTYPE_I4           19 	一击得分球

	var M_G_CLINET_GAMESHOW_USESKILL                      =20;  
	var M_G_CLINET_GAMESHOW_USESKILL_STR                  ="UseSkill";                   // DBTYPE_I4           20 使用技能次数

	var M_G_CLINET_GAMESHOW_USESKILLWINNER                =21;  
	var M_G_CLINET_GAMESHOW_USESKILLWINNER_STR            ="UseSkillWinner";             // DBTYPE_I4           21 使用技能得分(废弃)

	var M_G_CLINET_GAMESHOW_BREAKSKILL                    =22;  
	var M_G_CLINET_GAMESHOW_BREAKSKILL_STR                ="BreakSkill";                 // DBTYPE_I4           22 破解技能(废弃)

	var M_G_CLINET_GAMESHOW_BSKILLUSESKILL                =23;  
	var M_G_CLINET_GAMESHOW_BSKILLUSESKILL_STR            ="BSkillUseSkill";             // DBTYPE_I4           23 技能破技能(废弃)

	var M_G_CLINET_GAMESHOW_BREAKPOINTWINNER              =24;  
	var M_G_CLINET_GAMESHOW_BREAKPOINTWINNER_STR          ="BreakPointWinner";           // DBTYPE_I4           24 破发次数(废弃)

	var M_G_CLINET_GAMESHOW_BREAKPOINT                    =25;  
	var M_G_CLINET_GAMESHOW_BREAKPOINT_STR                ="BreakPoint";                 // DBTYPE_I4           25 破发点(废弃)

	var M_G_CLINET_GAMESHOW_SERVEEVENT                    =26;  
	var M_G_CLINET_GAMESHOW_SERVEEVENT_STR                ="ServeEvent";                 // DBTYPE_I4           26 发球事件 0:默认 1:开始发球 2:发球结束

	var M_G_CLINET_GAMESHOW_WINORLOST                     =27;  
	var M_G_CLINET_GAMESHOW_WINORLOST_STR                 ="WinOrLost";                  // DBTYPE_I4           27 输或者赢 1表示输 2表示赢 只通知自己那行记录 在RefreshIndex==2后清除为0

	var M_G_CLINET_GAMESHOW_ENDWINORLOST                  =28;  
	var M_G_CLINET_GAMESHOW_ENDWINORLOST_STR              ="EndWinOrLost";               // DBTYPE_I4           28 一场比赛的输赢 0为默认 1表示输 2表示赢 在RefreshIndex==5后有效

	var M_G_CLINET_GAMESHOW_GAMELASTTIME                  =29;  
	var M_G_CLINET_GAMESHOW_GAMELASTTIME_STR              ="GameLastTime";               // DBTYPE_I4           29 游戏持续的时间 单位秒

	var M_G_CLINET_GAMESHOW_TRIGGERTRAINID                =30;  
	var M_G_CLINET_GAMESHOW_TRIGGERTRAINID_STR            ="TriggerTrainID";             // DBTYPE_I4           30 触发的训练 在新手服务器有效 2上旋 3截击 4扣杀 5蓄力 6落点 7技能 在RefreshIndex==5后有效 只自己那行记录

	var M_G_CLINET_GAMESHOW_NEEDMORECONDITION             =31;  
	var M_G_CLINET_GAMESHOW_NEEDMORECONDITION_STR         ="NeedMoreCondition";          // DBTYPE_I4           31 需要更多的条件 用来告诉玩家你要得到称号还需要XXX 1.显示需要升级 2.显示需要训练

	var M_G_CLINET_GAMESHOW_MAXENERGY                     =32;  
	var M_G_CLINET_GAMESHOW_MAXENERGY_STR                 ="MaxEnergy";                  // DBTYPE_I4           32 最大的能量

	var M_G_CLINET_GAMESHOW_SERVETIME                     =33;  
	var M_G_CLINET_GAMESHOW_SERVETIME_STR                 ="ServeTime";                  // DBTYPE_I4           33 蓄力时间

	var M_G_CLINET_GAMESHOW_TOTALSCORE                    =34;  
	var M_G_CLINET_GAMESHOW_TOTALSCORE_STR                ="TotalScore";                 // DBTYPE_I4           34 总得分

	var M_G_CLINET_GAMESHOW_BADBALL                       =35;  
	var M_G_CLINET_GAMESHOW_BADBALL_STR                   ="BadBall";                    // DBTYPE_I4           35 受破球

	var M_G_CLINET_GAMESHOW_FULLSTOREBALL                 =36;  
	var M_G_CLINET_GAMESHOW_FULLSTOREBALL_STR             ="FullStoreBall";              // DBTYPE_I4           36 满蓄力球

	var M_G_CLINET_GAMESHOW_WAGERMONEY                    =37;  
	var M_G_CLINET_GAMESHOW_WAGERMONEY_STR                ="WagerMoney";                 // DBTYPE_I4           37 赌注的金币

	var M_G_CLINET_GAMESHOW_WAGERTAKEN                    =38;  
	var M_G_CLINET_GAMESHOW_WAGERTAKEN_STR                ="WagerTaken";                 // DBTYPE_I4           38 赌注的点卷

	var M_G_CLINET_GAMESHOW_GUIDEID                       =39;  
	var M_G_CLINET_GAMESHOW_GUIDEID_STR                   ="GuideID";                    // DBTYPE_I4           39 触发引导事件

	var M_G_CLINET_GAMESHOW_ARENAMODIFYNUM                =40;  
	var M_G_CLINET_GAMESHOW_ARENAMODIFYNUM_STR            ="ArenaModifyNum";             // DBTYPE_I4           40 竞技相关改变的数字,目前为活动点数

	var M_G_CLINET_GAMESHOW_CURRSTAMINA                   =41;  
	var M_G_CLINET_GAMESHOW_CURRSTAMINA_STR               ="CurrStamina";                // DBTYPE_I4           41 当前的体力

	var M_G_CLINET_GAMESHOW_MAXSTAMINA                    =42;  
	var M_G_CLINET_GAMESHOW_MAXSTAMINA_STR                ="MaxStamina";                 // DBTYPE_I4           42 最大的体力

	var M_G_CLINET_GAMESHOW_GAINTOKEN                     =43;  
	var M_G_CLINET_GAMESHOW_GAINTOKEN_STR                 ="GainToken";                  // DBTYPE_I4           43 获得点卷

	var M_G_CLINET_GAMESHOW_GAINLOTTERY                   =44;  
	var M_G_CLINET_GAMESHOW_GAINLOTTERY_STR               ="GainLottery";                // DBTYPE_I4           44 获得奖券

	var M_G_CLINET_GAMESHOW_GAINACTIVITYPOINT             =45;  
	var M_G_CLINET_GAMESHOW_GAINACTIVITYPOINT_STR         ="GainActivityPoint";          // DBTYPE_I4           45 获得活动点 废弃

	var M_G_CLINET_GAMESHOW_GAINSCORE                     =46;  
	var M_G_CLINET_GAMESHOW_GAINSCORE_STR                 ="GainScore";                  // DBTYPE_I4           46 获得积分   废弃

	var M_G_CLINET_GAMESHOW_GAINDATA                      =47;  
	var M_G_CLINET_GAMESHOW_GAINDATA_STR                  ="GainData";                   // DBTYPE_WVARCHAR     47 获得的奖励 格式为id:num;id:num; id有可能为1:活动点 2:积分 3:家族点卷 4:奖券 5:默契度 6:情侣值

	var M_G_CLINET_GAMESHOW_MISSGAMENUM                   =48;  
	var M_G_CLINET_GAMESHOW_MISSGAMENUM_STR               ="MissGameNum";                // DBTYPE_WVARCHAR     48 错过的局比分

	var M_G_CLINET_GAMESHOW_GETDROPBALL                   =49;  
	var M_G_CLINET_GAMESHOW_GETDROPBALL_STR               ="GetDropBall";                // DBTYPE_I4           49 本局比赛所得扣球数

	var M_G_CLINET_GAMESHOW_GETBADBALL                    =50;  
	var M_G_CLINET_GAMESHOW_GETBADBALL_STR                ="GetBadBall";                 // DBTYPE_I4           50 本局比赛所得坏球数

	var M_G_CLINET_GAMESHOW_GETHIGHBALL                   =51;  
	var M_G_CLINET_GAMESHOW_GETHIGHBALL_STR               ="GetHighBall";                // DBTYPE_I4           51 本局比赛所得高球数

	var M_G_CLINET_GAMESHOW_GETSNICKBALL                  =52;  
	var M_G_CLINET_GAMESHOW_GETSNICKBALL_STR              ="GetSnickBall";               // DBTYPE_I4           52 本局比赛所得削球数

	var M_G_CLINET_GAMESHOW_GETVOLLEYBALL                 =53;  
	var M_G_CLINET_GAMESHOW_GETVOLLEYBALL_STR             ="GetVolleyBall";              // DBTYPE_I4           53 本局比赛所得截击球数

	var M_G_CLINET_GAMESHOW_MAXDROPBALL                   =54;  
	var M_G_CLINET_GAMESHOW_MAXDROPBALL_STR               ="MaxDropBall";                // DBTYPE_I4           54 本局比赛所需扣球数

	var M_G_CLINET_GAMESHOW_MAXBADBALL                    =55;  
	var M_G_CLINET_GAMESHOW_MAXBADBALL_STR                ="MaxBadBall";                 // DBTYPE_I4           55 本局比赛所需坏球数

	var M_G_CLINET_GAMESHOW_MAXHIGHBALL                   =56;  
	var M_G_CLINET_GAMESHOW_MAXHIGHBALL_STR               ="MaxHighBall";                // DBTYPE_I4           56 本局比赛所需高球数

	var M_G_CLINET_GAMESHOW_MAXSNICKBALL                  =57;  
	var M_G_CLINET_GAMESHOW_MAXSNICKBALL_STR              ="MaxSnickBall";               // DBTYPE_I4           57 本局比赛所需削球数

	var M_G_CLINET_GAMESHOW_MAXVOLLEYBALL                 =58;  
	var M_G_CLINET_GAMESHOW_MAXVOLLEYBALL_STR             ="MaxVolleyBall";              // DBTYPE_I4           58 本局比赛所需截击球数

	var M_G_CLINET_GAMESHOW_TIMEGAMETIME                  =59;  
	var M_G_CLINET_GAMESHOW_TIMEGAMETIME_STR              ="TimeGameTime";               // DBTYPE_I4           59 计时赛本局比赛剩余时间


	var HORN                                              ="Horn";
	var M_G_CLINET_HORN_HORNID                            =0;   
	var M_G_CLINET_HORN_HORNID_STR                        ="hornID";                     // DBTYPE_I4           喇叭ID

	var M_G_CLINET_HORN_DESCRIPTION                       =1;   
	var M_G_CLINET_HORN_DESCRIPTION_STR                   ="Description";                // DBTYPE_WVARCHAR     喇叭描述

	var M_G_CLINET_HORN_SCRIPT                            =2;   
	var M_G_CLINET_HORN_SCRIPT_STR                        ="Script";                     // DBTYPE_WVARCHAR     喇叭调用脚本

	var M_G_CLINET_HORN_PERSONNUM                         =3;   
	var M_G_CLINET_HORN_PERSONNUM_STR                     ="personNum";                  // DBTYPE_I4           喇叭支持人数


	var INPUTCONVERS                                      ="inputconvers";
	var M_G_CLINET_INPUTCONVERS_KEY_DEF1                  =0;   
	var M_G_CLINET_INPUTCONVERS_KEY_DEF1_STR              ="key_def1";                   // DBTYPE_I4           默认按键1的虚拟键码

	var M_G_CLINET_INPUTCONVERS_KEY_DEF2                  =1;   
	var M_G_CLINET_INPUTCONVERS_KEY_DEF2_STR              ="key_def2";                   // DBTYPE_I4           默认按键2的虚拟键码

	var M_G_CLINET_INPUTCONVERS_SELF_DEF_KEY              =2;   
	var M_G_CLINET_INPUTCONVERS_SELF_DEF_KEY_STR          ="self_def_key";               // DBTYPE_I4           用户自定义按键的虚拟键码

	var M_G_CLINET_INPUTCONVERS_STICK_DEF                 =3;   
	var M_G_CLINET_INPUTCONVERS_STICK_DEF_STR             ="stick_def";                  // DBTYPE_I4           默认手柄的虚拟键码

	var M_G_CLINET_INPUTCONVERS_SELF_STICK_DEF            =4;   
	var M_G_CLINET_INPUTCONVERS_SELF_STICK_DEF_STR        ="self_stick_def";             // DBTYPE_I4           自定义手柄的虚拟键码

	var M_G_CLINET_INPUTCONVERS_PRESS_TM                  =5;   
	var M_G_CLINET_INPUTCONVERS_PRESS_TM_STR              ="press_tm";                   // DBTYPE_I4           长按键时间

	var M_G_CLINET_INPUTCONVERS_BOTH_TM                   =6;   
	var M_G_CLINET_INPUTCONVERS_BOTH_TM_STR               ="both_tm";                    // DBTYPE_I4           同时按键时间

	var M_G_CLINET_INPUTCONVERS_MYINDEX                   =7;   
	var M_G_CLINET_INPUTCONVERS_MYINDEX_STR               ="myindex";                    // DBTYPE_I4           索引序号


	var INTERACT                                          ="interact";
	var M_G_CLINET_INTERACT_ATTACKER_ID                   =0;   
	var M_G_CLINET_INTERACT_ATTACKER_ID_STR               ="attacker_id";                // DBTYPE_I4           攻击方角色id

	var M_G_CLINET_INTERACT_ATTACKER_CONDITION_ID         =1;   
	var M_G_CLINET_INTERACT_ATTACKER_CONDITION_ID_STR     ="attacker_condition_id";      // DBTYPE_I4           攻击方条件id

	var M_G_CLINET_INTERACT_BEATTACKER_ID                 =2;   
	var M_G_CLINET_INTERACT_BEATTACKER_ID_STR             ="beattacker_id";              // DBTYPE_I4           被攻击方角色id

	var M_G_CLINET_INTERACT_BEATTACKER_CONDITION_ID       =3;   
	var M_G_CLINET_INTERACT_BEATTACKER_CONDITION_ID_STR   ="beattacker_condition_id";    // DBTYPE_I4           被攻击方条件id

	var M_G_CLINET_INTERACT_ATTACKER_RESULT_ID            =4;   
	var M_G_CLINET_INTERACT_ATTACKER_RESULT_ID_STR        ="attacker_result_id";         // DBTYPE_WVARCHAR     攻击方结果id

	var M_G_CLINET_INTERACT_ATTACKER_RESULT_PARAM         =5;   
	var M_G_CLINET_INTERACT_ATTACKER_RESULT_PARAM_STR     ="attacker_result_param";      // DBTYPE_WVARCHAR     攻击方结果参数

	var M_G_CLINET_INTERACT_BEATTACKER_RESULT_ID          =6;   
	var M_G_CLINET_INTERACT_BEATTACKER_RESULT_ID_STR      ="beattacker_result_id";       // DBTYPE_WVARCHAR     被攻击方结果id

	var M_G_CLINET_INTERACT_BEATTACKER_RESULT_PARAM       =7;   
	var M_G_CLINET_INTERACT_BEATTACKER_RESULT_PARAM_STR   ="beattacker_result_param";    // DBTYPE_WVARCHAR     被攻击方结果参数

	var M_G_CLINET_INTERACT_INTERACT_RULL_INDEX           =8;   
	var M_G_CLINET_INTERACT_INTERACT_RULL_INDEX_STR       ="interact_rull_index";        // DBTYPE_I4           规则索引

	var M_G_CLINET_INTERACT_INTERACT_RULL_NAME            =9;   
	var M_G_CLINET_INTERACT_INTERACT_RULL_NAME_STR        ="interact_rull_name";         // DBTYPE_WVARCHAR     规则描述

	var M_G_CLINET_INTERACT_PRIORITY                      =10;  
	var M_G_CLINET_INTERACT_PRIORITY_STR                  ="priority";                   // DBTYPE_I4           优先级

	var M_G_CLINET_INTERACT_EXCLUDE_PRIORITY              =11;  
	var M_G_CLINET_INTERACT_EXCLUDE_PRIORITY_STR          ="exclude_priority";           // DBTYPE_WVARCHAR     排斥的优先级序列


	var ITEMDEF                                           ="itemdef";
	var M_G_CLINET_ITEMDEF_ITEM_ID                        =0;   
	var M_G_CLINET_ITEMDEF_ITEM_ID_STR                    ="item_id";                    // DBTYPE_I4           物件索引

	var M_G_CLINET_ITEMDEF_ITEM_NAME                      =1;   
	var M_G_CLINET_ITEMDEF_ITEM_NAME_STR                  ="item_name";                  // DBTYPE_WVARCHAR     物件名称

	var M_G_CLINET_ITEMDEF_ITEM_SKE                       =2;   
	var M_G_CLINET_ITEMDEF_ITEM_SKE_STR                   ="item_ske";                   // DBTYPE_WVARCHAR     骨骼文件

	var M_G_CLINET_ITEMDEF_ITEM_VAC                       =3;   
	var M_G_CLINET_ITEMDEF_ITEM_VAC_STR                   ="item_vac";                   // DBTYPE_WVARCHAR     动作文件

	var M_G_CLINET_ITEMDEF_ITEM_SKIN                      =4;   
	var M_G_CLINET_ITEMDEF_ITEM_SKIN_STR                  ="item_skin";                  // DBTYPE_WVARCHAR     皮肤文件

	var M_G_CLINET_ITEMDEF_ITEM_TEX                       =5;   
	var M_G_CLINET_ITEMDEF_ITEM_TEX_STR                   ="item_tex";                   // DBTYPE_WVARCHAR     贴图文件

	var M_G_CLINET_ITEMDEF_ITEM_POSX                      =6;   
	var M_G_CLINET_ITEMDEF_ITEM_POSX_STR                  ="item_posx";                  // DBTYPE_R4           物件位置

	var M_G_CLINET_ITEMDEF_ITEM_POSY                      =7;   
	var M_G_CLINET_ITEMDEF_ITEM_POSY_STR                  ="item_posy";                  // DBTYPE_R4           

	var M_G_CLINET_ITEMDEF_ITEM_POSZ                      =8;   
	var M_G_CLINET_ITEMDEF_ITEM_POSZ_STR                  ="item_posz";                  // DBTYPE_R4           

	var M_G_CLINET_ITEMDEF_ITEM_ROTX                      =9;   
	var M_G_CLINET_ITEMDEF_ITEM_ROTX_STR                  ="item_rotx";                  // DBTYPE_R4           物件旋转

	var M_G_CLINET_ITEMDEF_ITEM_ROTY                      =10;  
	var M_G_CLINET_ITEMDEF_ITEM_ROTY_STR                  ="item_roty";                  // DBTYPE_R4           

	var M_G_CLINET_ITEMDEF_ITEM_ROTZ                      =11;  
	var M_G_CLINET_ITEMDEF_ITEM_ROTZ_STR                  ="item_rotz";                  // DBTYPE_R4           

	var M_G_CLINET_ITEMDEF_ITEM_SCALEX                    =12;  
	var M_G_CLINET_ITEMDEF_ITEM_SCALEX_STR                ="item_scalex";                // DBTYPE_R4           物件缩放

	var M_G_CLINET_ITEMDEF_ITEM_SCALEY                    =13;  
	var M_G_CLINET_ITEMDEF_ITEM_SCALEY_STR                ="item_scaley";                // DBTYPE_R4           

	var M_G_CLINET_ITEMDEF_ITEM_SCALEZ                    =14;  
	var M_G_CLINET_ITEMDEF_ITEM_SCALEZ_STR                ="item_scalez";                // DBTYPE_R4           

	var M_G_CLINET_ITEMDEF_ITEM_ANISPEED                  =15;  
	var M_G_CLINET_ITEMDEF_ITEM_ANISPEED_STR              ="item_anispeed";              // DBTYPE_R4           物件动画播放速度

	var M_G_CLINET_ITEMDEF_ITEM_ANILOOPS                  =16;  
	var M_G_CLINET_ITEMDEF_ITEM_ANILOOPS_STR              ="item_aniloops";              // DBTYPE_I4           物件动画循环次数

	var M_G_CLINET_ITEMDEF_ITEM_EFFECTID                  =17;  
	var M_G_CLINET_ITEMDEF_ITEM_EFFECTID_STR              ="item_effectid";              // DBTYPE_I4           绑定的特效索引

	var M_G_CLINET_ITEMDEF_ITEM_EFFECTNAME                =18;  
	var M_G_CLINET_ITEMDEF_ITEM_EFFECTNAME_STR            ="item_effectname";            // DBTYPE_WVARCHAR     绑定的特效名称

	var M_G_CLINET_ITEMDEF_ITEM_FOLDER                    =19;  
	var M_G_CLINET_ITEMDEF_ITEM_FOLDER_STR                ="item_folder";                // DBTYPE_WVARCHAR     物件所在的文件夹

	var M_G_CLINET_ITEMDEF_ICON_ID                        =20;  
	var M_G_CLINET_ITEMDEF_ICON_ID_STR                    ="icon_id";                    // DBTYPE_I4           图标id

	var M_G_CLINET_ITEMDEF_ICONNAME                       =21;  
	var M_G_CLINET_ITEMDEF_ICONNAME_STR                   ="iconname";                   // DBTYPE_WVARCHAR     图标名称


	var ITEMSTATE                                         ="itemstate";
	var M_G_CLINET_ITEMSTATE_ITEM_ID                      =0;   
	var M_G_CLINET_ITEMSTATE_ITEM_ID_STR                  ="item_id";                    // DBTYPE_I4           物件索引

	var M_G_CLINET_ITEMSTATE_ITEM_STATE                   =1;   
	var M_G_CLINET_ITEMSTATE_ITEM_STATE_STR               ="item_state";                 // DBTYPE_I4           物件状态

	var M_G_CLINET_ITEMSTATE_IFSHOW_ITEM                  =2;   
	var M_G_CLINET_ITEMSTATE_IFSHOW_ITEM_STR              ="ifshow_item";                // DBTYPE_BOOL         是否显示物件

	var M_G_CLINET_ITEMSTATE_IFSHOW_EFFECT                =3;   
	var M_G_CLINET_ITEMSTATE_IFSHOW_EFFECT_STR            ="ifshow_effect";              // DBTYPE_BOOL         是否显示特效

	var M_G_CLINET_ITEMSTATE_EFFECT_SHOWST                =4;   
	var M_G_CLINET_ITEMSTATE_EFFECT_SHOWST_STR            ="effect_showst";              // DBTYPE_I4           特效开始显示时间

	var M_G_CLINET_ITEMSTATE_EFFECT_SHOWEND               =5;   
	var M_G_CLINET_ITEMSTATE_EFFECT_SHOWEND_STR           ="effect_showend";             // DBTYPE_I4           特效结束显示时间

	var M_G_CLINET_ITEMSTATE_ITEM_EFFECTNAME              =6;   
	var M_G_CLINET_ITEMSTATE_ITEM_EFFECTNAME_STR          ="item_effectname";            // DBTYPE_WVARCHAR     特效名称

	var M_G_CLINET_ITEMSTATE_ITEM_EFFECTID                =7;   
	var M_G_CLINET_ITEMSTATE_ITEM_EFFECTID_STR            ="item_effectid";              // DBTYPE_I4           特效id

	var M_G_CLINET_ITEMSTATE_ITEM_VAC                     =8;   
	var M_G_CLINET_ITEMSTATE_ITEM_VAC_STR                 ="item_vac";                   // DBTYPE_WVARCHAR     物件动作文件

	var M_G_CLINET_ITEMSTATE_ITEM_TEX                     =9;   
	var M_G_CLINET_ITEMSTATE_ITEM_TEX_STR                 ="item_tex";                   // DBTYPE_WVARCHAR     物件贴图文件

	var M_G_CLINET_ITEMSTATE_ITEM_ANISPEED                =10;  
	var M_G_CLINET_ITEMSTATE_ITEM_ANISPEED_STR            ="item_anispeed";              // DBTYPE_R4           物件动画播放速度

	var M_G_CLINET_ITEMSTATE_AUTOINDEX                    =11;  
	var M_G_CLINET_ITEMSTATE_AUTOINDEX_STR                ="autoindex";                  // DBTYPE_I4           


	var MSGBOX                                            ="msgbox";
	var M_G_CLINET_MSGBOX_ID                              =0;   
	var M_G_CLINET_MSGBOX_ID_STR                          ="ID";                         // DBTYPE_I4           

	var M_G_CLINET_MSGBOX_TITLE                           =1;   
	var M_G_CLINET_MSGBOX_TITLE_STR                       ="Title";                      // DBTYPE_WVARCHAR     对话框标题

	var M_G_CLINET_MSGBOX_TEXT                            =2;   
	var M_G_CLINET_MSGBOX_TEXT_STR                        ="Text";                       // DBTYPE_WVARCHAR     对话框内容

	var M_G_CLINET_MSGBOX_TYPE                            =3;   
	var M_G_CLINET_MSGBOX_TYPE_STR                        ="Type";                       // DBTYPE_WVARCHAR     对话框类型


	var PARTS                                             ="parts";
	var M_G_CLINET_PARTS_ACTIONID                         =0;   
	var M_G_CLINET_PARTS_ACTIONID_STR                     ="ActionID";                   // DBTYPE_I4           

	var M_G_CLINET_PARTS_RID                              =1;   
	var M_G_CLINET_PARTS_RID_STR                          ="rid";                        // DBTYPE_WVARCHAR     

	var M_G_CLINET_PARTS_SKE                              =2;   
	var M_G_CLINET_PARTS_SKE_STR                          ="ske";                        // DBTYPE_WVARCHAR     

	var M_G_CLINET_PARTS_SKIN                             =3;   
	var M_G_CLINET_PARTS_SKIN_STR                         ="skin";                       // DBTYPE_WVARCHAR     

	var M_G_CLINET_PARTS_TEXTURE                          =4;   
	var M_G_CLINET_PARTS_TEXTURE_STR                      ="texture";                    // DBTYPE_WVARCHAR     

	var M_G_CLINET_PARTS_DEFVAC                           =5;   
	var M_G_CLINET_PARTS_DEFVAC_STR                       ="defvac";                     // DBTYPE_WVARCHAR     

	var M_G_CLINET_PARTS_PARTS_TYPE                       =6;   
	var M_G_CLINET_PARTS_PARTS_TYPE_STR                   ="parts_type";                 // DBTYPE_I4           1.头发;2.五官;3.上装;4.裙/裤;5.手套;6.袜;7.鞋;8.背饰;9.球拍;10.眼镜;11.护腕/手链;12.项链;13.附件

	var M_G_CLINET_PARTS_EQUIP_TYPE                       =7;   
	var M_G_CLINET_PARTS_EQUIP_TYPE_STR                   ="equip_type";                 // DBTYPE_WVARCHAR     

	var M_G_CLINET_PARTS_PHYID                            =8;   
	var M_G_CLINET_PARTS_PHYID_STR                        ="phyid";                      // DBTYPE_WVARCHAR     

	var M_G_CLINET_PARTS_AUTOID                           =9;   
	var M_G_CLINET_PARTS_AUTOID_STR                       ="AutoID";                     // DBTYPE_I4           

	var M_G_CLINET_PARTS_NAME                             =10;  
	var M_G_CLINET_PARTS_NAME_STR                         ="name";                       // DBTYPE_WVARCHAR     物品名称

	var M_G_CLINET_PARTS_SHADER                           =11;  
	var M_G_CLINET_PARTS_SHADER_STR                       ="shader";                     // DBTYPE_WVARCHAR     使用的shader

	var M_G_CLINET_PARTS_EFFECT                           =12;  
	var M_G_CLINET_PARTS_EFFECT_STR                       ="effect";                     // DBTYPE_WVARCHAR     装备上绑定的特效名字


	var ROOMACT                                           ="RoomAct";
	var M_G_CLINET_ROOMACT_AUTOID                         =0;   
	var M_G_CLINET_ROOMACT_AUTOID_STR                     ="AutoID";                     // DBTYPE_I4           索引

	var M_G_CLINET_ROOMACT_ID                             =1;   
	var M_G_CLINET_ROOMACT_ID_STR                         ="ID";                         // DBTYPE_I4           房间动作状态ID

	var M_G_CLINET_ROOMACT_DESCRIPTION                    =2;   
	var M_G_CLINET_ROOMACT_DESCRIPTION_STR                ="Description";                // DBTYPE_WVARCHAR     描述

	var M_G_CLINET_ROOMACT_SCRIPT                         =3;   
	var M_G_CLINET_ROOMACT_SCRIPT_STR                     ="Script";                     // DBTYPE_WVARCHAR     脚本

	var M_G_CLINET_ROOMACT_SHUOMING                       =4;   
	var M_G_CLINET_ROOMACT_SHUOMING_STR                   ="shuoming";                   // DBTYPE_WVARCHAR     说明(策划注释)


	var SHADERCONTROL                                     ="shadercontrol";
	var M_G_CLINET_SHADERCONTROL_ID                       =0;   
	var M_G_CLINET_SHADERCONTROL_ID_STR                   ="id";                         // DBTYPE_I4           shader控制id

	var M_G_CLINET_SHADERCONTROL_CONTENT                  =1;   
	var M_G_CLINET_SHADERCONTROL_CONTENT_STR              ="Content";                    // DBTYPE_WVARCHAR     每个时间段使用*分隔,每个时间段的格式:起始数;类型;结束数;时间,类型1:逐渐变化2:不变 例如 0;1;1;1000*1;2;1;2000*1;1;0;1000 表示第一秒从0变化到1,接下来2秒没有变化,最后一秒从1变化到0,这就是所谓的淡入淡出

	var M_G_CLINET_SHADERCONTROL_NOTE                     =2;   
	var M_G_CLINET_SHADERCONTROL_NOTE_STR                 ="Note";                       // DBTYPE_WVARCHAR     注释


	var SHORTCUTKEY                                       ="shortcutkey";
	var M_G_CLINET_SHORTCUTKEY_INDEX                      =0;   
	var M_G_CLINET_SHORTCUTKEY_INDEX_STR                  ="index";                      // DBTYPE_I4           索引

	var M_G_CLINET_SHORTCUTKEY_CONTENT                    =1;   
	var M_G_CLINET_SHORTCUTKEY_CONTENT_STR                ="content";                    // DBTYPE_WVARCHAR     按键序列,只能定义单键或ctrl/shift/alt+单键,单键格式,填单键的键盘键码就可以;ctrl/shift/alt+单键的格式,ctrl/shit/alt分别为2/1/0,单键仍是键盘键码,中间用&分隔;如x 则为45,ctrl+x则为2&45,注意这里有个特例，是enter，填28就表示主键盘和小键盘的enter都支持

	var M_G_CLINET_SHORTCUTKEY_EXPLAIN                    =2;   
	var M_G_CLINET_SHORTCUTKEY_EXPLAIN_STR                ="explain";                    // DBTYPE_WVARCHAR     这个快捷键的解释


	var SUBEFFECT                                         ="subeffect";
	var M_G_CLINET_SUBEFFECT_ID                           =0;   
	var M_G_CLINET_SUBEFFECT_ID_STR                       ="id";                         // DBTYPE_I4           特效id

	var M_G_CLINET_SUBEFFECT_FILENAME                     =1;   
	var M_G_CLINET_SUBEFFECT_FILENAME_STR                 ="filename";                   // DBTYPE_WVARCHAR     文件名字

	var M_G_CLINET_SUBEFFECT_TYPE                         =2;   
	var M_G_CLINET_SUBEFFECT_TYPE_STR                     ="type";                       // DBTYPE_WVARCHAR     特效类型 fmodel:普通特效 particle:粒子特效 Sound:音效 Fn:函数调用(对象名写到bind_obj 对象必须在程序里面注册 函数名写到filename)

	var M_G_CLINET_SUBEFFECT_BIND_OBJ                     =3;   
	var M_G_CLINET_SUBEFFECT_BIND_OBJ_STR                 ="bind_obj";                   // DBTYPE_WVARCHAR     作用对象名字 对于fmodel  particle这两种形式 绑定的物体必须派生自模型种类的物品

	var M_G_CLINET_SUBEFFECT_FOLLOW                       =4;   
	var M_G_CLINET_SUBEFFECT_FOLLOW_STR                   ="follow";                     // DBTYPE_BOOL         是否跟随绑定物体

	var M_G_CLINET_SUBEFFECT_SHADE                        =5;   
	var M_G_CLINET_SUBEFFECT_SHADE_STR                    ="shade";                      // DBTYPE_WVARCHAR     使用shade的名字(普通特效有效)

	var M_G_CLINET_SUBEFFECT_SCALE_X                      =6;   
	var M_G_CLINET_SUBEFFECT_SCALE_X_STR                  ="scale_x";                    // DBTYPE_R4           x的缩放(普通特效有效)

	var M_G_CLINET_SUBEFFECT_SCALE_Y                      =7;   
	var M_G_CLINET_SUBEFFECT_SCALE_Y_STR                  ="scale_y";                    // DBTYPE_R4           y的缩放(普通特效有效)

	var M_G_CLINET_SUBEFFECT_SCALE_Z                      =8;   
	var M_G_CLINET_SUBEFFECT_SCALE_Z_STR                  ="scale_z";                    // DBTYPE_R4           z的缩放(普通特效有效)

	var M_G_CLINET_SUBEFFECT_ROTATE_X                     =9;   
	var M_G_CLINET_SUBEFFECT_ROTATE_X_STR                 ="rotate_x";                   // DBTYPE_R4           x的旋转(普通特效有效)

	var M_G_CLINET_SUBEFFECT_ROTATE_Y                     =10;  
	var M_G_CLINET_SUBEFFECT_ROTATE_Y_STR                 ="rotate_y";                   // DBTYPE_R4           y的旋转(普通特效有效)

	var M_G_CLINET_SUBEFFECT_ROTATE_Z                     =11;  
	var M_G_CLINET_SUBEFFECT_ROTATE_Z_STR                 ="rotate_z";                   // DBTYPE_R4           z的旋转(普通特效有效)

	var M_G_CLINET_SUBEFFECT_POS_X                        =12;  
	var M_G_CLINET_SUBEFFECT_POS_X_STR                    ="pos_x";                      // DBTYPE_R4           x的位置(普通特效有效)

	var M_G_CLINET_SUBEFFECT_POS_Y                        =13;  
	var M_G_CLINET_SUBEFFECT_POS_Y_STR                    ="pos_y";                      // DBTYPE_R4           y的位置(普通特效有效)

	var M_G_CLINET_SUBEFFECT_POS_Z                        =14;  
	var M_G_CLINET_SUBEFFECT_POS_Z_STR                    ="pos_z";                      // DBTYPE_R4           z的位置(普通特效有效)

	var M_G_CLINET_SUBEFFECT_PLAYSPEED                    =15;  
	var M_G_CLINET_SUBEFFECT_PLAYSPEED_STR                ="playspeed";                  // DBTYPE_R4           播放速度控制

	var M_G_CLINET_SUBEFFECT_SHADERCONTROLID              =16;  
	var M_G_CLINET_SUBEFFECT_SHADERCONTROLID_STR          ="shadercontrolid";            // DBTYPE_I4           使用的控制shaderID

	var M_G_CLINET_SUBEFFECT_SHOWLV                       =17;  
	var M_G_CLINET_SUBEFFECT_SHOWLV_STR                   ="ShowLv";                     // DBTYPE_I4           子特效显示等级

	var M_G_CLINET_SUBEFFECT_NOTE                         =18;  
	var M_G_CLINET_SUBEFFECT_NOTE_STR                     ="note";                       // DBTYPE_WVARCHAR     描述说明


	var TITLEDEF                                          ="titledef";
	var M_G_CLINET_TITLEDEF_ID                            =0;   
	var M_G_CLINET_TITLEDEF_ID_STR                        ="id";                         // DBTYPE_I4           0 称号的id

	var M_G_CLINET_TITLEDEF_NAMETEXT                      =1;   
	var M_G_CLINET_TITLEDEF_NAMETEXT_STR                  ="nametext";                   // DBTYPE_WVARCHAR     1 称号的文字：如 新手 高手

	var M_G_CLINET_TITLEDEF_ICON                          =2;   
	var M_G_CLINET_TITLEDEF_ICON_STR                      ="icon";                       // DBTYPE_WVARCHAR     2 称号对应的图标

}
