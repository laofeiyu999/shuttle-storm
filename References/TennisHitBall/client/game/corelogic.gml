//import("$./../../mdb/dbdef_game.gml");
import("$./../mdbdef/ScriptDbDef.gml");
import("$./../model/ovo.gml");
import("$./../designerscript/SkillConsume/StaminaRecover.gml");

class TennisHitBall item
{
	var posZ;				// 人物位置
	var posX;				// 人物位置
	var posS;               // 人物发球位置 1为+x-z 2为-x-z 3为-x+z 4为+x+z
	var handType;			// 正反手
	var strength;			// 力量
	var skill;				// 技术
	var foreHand;			// 网前
	var backHand;			// 后场
	var trackType;			// 轨迹类型
	var dropZ ;				// 无蓄力球基础落点Z                                          
	var dropZ1 ;			// 短蓄力球最大偏移距离Z  
	var dropZ2;				// 长蓄力的最大偏移距离Z  
	var dropX ;				// 无蓄力球基础落点X                                          
	var dropX1 ;			// 短蓄力球最大偏移距离X       
	var dropX2 ;			//  长蓄力的最大偏移距离X  
	var userID;				// User数据库
	var bodyID ;			
	var nStoreTime; 
	var hitActIndex;
	var hitType;			//击球方式
	var hitActIsSkill;		//技能
	var skillType;     // 技能类型   用来区分技能
	var dir = -1;        
	var trackIndex  ;
	var lastTrackType;      //上一来球轨迹的类型
	var canStorePower;		// 是否能蓄力

	var frontStore ;		//前场蓄力轨迹   （ 技能球普通轨迹）
	var backStore ;			//后场蓄力轨迹    （技能球第二种轨迹）
	var frontNormal ;		//前场普通轨迹
	var backNormal ;		//后场普通轨迹
	var fMaxStore  ;		//前场满蓄力轨迹
	var bMaxStore ;			//后场满蓄力轨迹
	var isSkill = false;	//是否是技能的参数
	var dangQiuGuiJi ;		//挡球轨迹
	var oppBallPower;		//来球的力量						
}  // 计算击球落点的类

/*
变量名称规则
1.类内部发变量以m_起头,后面的第一个单词字母小写,其他的单词第一个字母都大写 如:m_tennisHitBall
2.常量全部大写,以"_"分开每个单词 如:MAX_H_STORE_TIME
3.内部的函数以fn_开头,如:fn_Fqsudu
4.程序调用脚本的函数默认,最好能写成CallBack_开头的
5.返回给程序的变量,第一个单词字母小写,其他的单词第一个字母都大写 如:ballSpeed
6.函数的形参全部小写,每个单词以"_"分开 如void fn_Fqsudu(now_time , max_time , fa_qiuc )
7.临时的参数全部小写,中间没有分隔,如 var tempfaqiu;
*/

class CoreLogic MatchState
{	
	var DEBUG_MODE = 0;							//调试模式
	var tstatic = new T_ScriptFun{};			// 韩硕修改, 脚本调用的函数写在这里, 脚本的单一模式有问题( 8.18)

	//window.tennisGameStatic.GetGameType();   单打双打，得到一个整数。
	var dangqiugailv = 0.0;					//触发挡球的概率
	var m_suijizhi = 0;         //随即数
//	printf("随机数====" + m_suijizhi);
//	var s = tstatic.sin(1.732);
//	printf(s)// 常数
	var m_tennisHitBall					= new TennisHitBall{};
	var MAX_H_STORE_TIME = 850.0;				//后场击球满蓄力值
	var MAX_Q_STORE_TIME = 550.0 ;				//前场击球满蓄力值
	var MAX_HD_STORE_TIME = 700.0;			//后场方向满蓄力值
	var MAX_QD_STORE_TIME = 400.0;			//前场方向满蓄力值  
	var MAX_FAD_STORE_TIME = 500.0;                        // 发球满方向蓄力值
	var MAX_SHU_XING_BEISHU = 3.0     //2009.12.26 为扩大属性显示值域，将之前设计的满属性100改成了300，因此数据库中取出的值要除以这个值以适应脚本内容
	var POSZ_FRONT  =  6.4;							 //判断人物前后场的分界值
	var MOREN_SPEED = 1.0;							//默认球速				
	var MAX_SPEED = 0.65;							//满蓄力球速
	var MAX_PT_SPEED = 0.8;                       //满技术值普通球球速
    var MAX_SKILL = 100.0;							//技术值上限
	var Q_HAND_TAPE_CHENG_FA = 1.0;					//人在前场时正手向右，反手向左打时最大偏移距离的惩罚
	var H_HAND_TAPE_CHENG_FA = 1.0;				//人在后场时正手向右，反手向左打时最大偏移距离的惩罚
	var KOU_SHA_CHENG_FA = 1.0  ;                    //扣杀时的角度惩罚
	var Q_MAX_CHENG_FA = 0.5;						//前场最大落点惩罚
	var H_MAX_CHENG_FA = 0.5;						//后场最大落点惩罚
	var GAI_LV_ZHI = 2.0;								//挡球概率调试参数  （相当于最大力量差值的挡球概率为  50%）
	var GAI_LV_ZHI_J = 4.0;								//技术值减少的挡球概率值 调试参数   （相当于满技术减少 25% 可能的挡球）
	var ENERGY_BASE = 2.0						 //每次击球获得的基础能量值
	var XU_LI_QIU8 = 2.0;						//4-8回合时蓄力球获得的能量倍数
	var XU_LI_QIU2 = 4.0;					//8回合以上时蓄力球获得的能量倍数
	var PU_JIU_BEI_SHU = 0.5 ;             //普通击球与挡球/扑救之间的能量倍数
	
	//转移到路径在：E:\vnet2project2008\Project2\tennis\data\client\interface\Logic\GmlCtrls\Common\Utility.gml
	//var FA_QIU_MAX_TIME = 1533.0;			//发球时的最大蓄力时间，也就是从挥拍到击到球的时间
	//var FA_QIU_MAX_DOWN = 0;					   // 发满蓄力球蓄力时间下限值
	//var FA_QIU_MAX_UP = 0;								// 发满蓄力球蓄力时间上限值
	//var FA_QIU_MAX_FAN_WEI = 200.0     //发满蓄力球的时间范围，即683ms上下多少ms以内算满蓄力

	var SHUANG_DA_DROPX_C = 1.43;        //双打时落点X值的倍数
	var JIE_FAQIU_DANGQIU = 10.0   //接发球 出挡球轨迹的“标线”。
	var JIE_KOUSHA_DANGQIU = 6.4 //接扣杀、满蓄力截击上旋 出挡球轨迹的“标线”。
//	var PI = 3.1415926;					  //  常数π 
//	var FA_QIU_CAN_SHU = 200.0 ;             // 计算发球球速的参数,越大最大发球球速越慢
	var m_jiBenPianYiX = 2.0 ;
	var m_jiBenPianYiZ = 1.0 ;

	
	// 返回参数
	var isFullStore = 0 ; // 是否是满蓄力
	var ballSpeed = 0.0;	// 球速(浮点型)
	var trackIndex = -1;	// 轨迹索引(整型)
	var dropX = 0.0;		// 落点X(浮点型)
	var dropY = 0.0;		// 落点Y(浮点型)
	var dropZ = 0.0;		// 落点Z(浮点型)
	var ballPower = 0.0;	// 球的力量值(浮点型)
	var addEnergy = 0;		// 打球时获得的能量值
	// 可用参数
	
//-------------所有计算ballSpeed trackIndex  addEnergy 力量值 等用到的函数----------------------------------------------
	/*
	void fn_Fqsudu(now_time , max_time , fa_qiuc )
	{
		if (DEBUG_MODE == 1)
		{		
			printf("进入到fn_Fqsudu");
			printf("现在的蓄力时间== "   +now_time);
			printf("满蓄力时间==" +max_time);
			printf("计算发球速度时用到的修正参数===" +fa_qiuc);
			printf( "计算出的结果===" + tstatic.sin(1.0 * now_time / max_time * PI ) * 100.0 / fa_qiuc);
		}
		return tstatic.sin(1.0 * now_time / max_time * PI ) * 100.0 / fa_qiuc ;
	}  */  
	// 计算出 0~0.5之间的数，用来计算发球速度的函数
	void fn_Dqgl(qiu_zhi,fa_hui_zhi,chang_shu) //计算触发挡球的概率值
	{
		if (DEBUG_MODE == 1)
		{
			printf("进入到fn_Dqgl");
			printf("球上携带的力量值=="  +qiu_zhi);
			printf("此次发挥的力量值==" +fa_hui_zhi);
			printf("计算挡球概率时的修正参数==="  +chang_shu);
			printf( "计算出的结果===" +(qiu_zhi - fa_hui_zhi) / chang_shu);
		}
		return (qiu_zhi - fa_hui_zhi) * 1.0/ chang_shu;
	}
	//计算触发挡球的概率值
	void fn_Jishujianshao(ji_shu ,can_shu,max_zhi)
	{
		if (DEBUG_MODE == 1)
		{
			var testjishu = 1.0- ji_shu / (can_shu * max_zhi);
			printf("进入到fn_Jishujianshao");
			printf("技术值===" +ji_shu);
			printf("计算技术值减少的挡球概率时的修正参数"  +can_shu);
			printf("最大技术值==" +max_zhi);
			printf( "计算的结果 ==" +testjishu);
		}
		return 1.0- ji_shu * 1.0  / (can_shu * max_zhi);
	}
	//技术值减少的挡球概率
	void fn_Jsqs(moren_su_du , max_su_du , xu_li_shi_jian , max_shi_jian)  // 计算蓄力球球速
	{
		if (DEBUG_MODE == 1)
		{
			var test = moren_su_du - (moren_su_du - max_su_du)*xu_li_shi_jian*1.0 / max_shi_jian;
			printf(" 进入到计算蓄力球球速函数");
			printf(" 默认的球速===" +moren_su_du);
			printf(" 定义的最快球速====" +max_su_du);
			printf(" 当前的蓄力时间===" +xu_li_shi_jian);
			printf(" 定义的最大蓄力时间===" +max_shi_jian);
			printf("计算出的结果===" + test);
		}
		return moren_su_du - (moren_su_du - max_su_du)*xu_li_shi_jian / max_shi_jian;
	}
	// 计算蓄力球球速   和普通球球速
	void fn_Jscf(max_cheng_fa , shu_xing)
	{
		if (DEBUG_MODE == 1)
		{
			printf("进入到fn_Jscf");
			printf("由于技术影响的最大击球惩罚 ==" + max_cheng_fa);
			printf("正手或反手属性====" +shu_xing);
			printf("计算出的结果===" +max_cheng_fa * ( 1 + shu_xing / 100.0));
		}
		return max_cheng_fa * ( 1 + shu_xing / 100.0);
	}
	
	void fn_Energy4x( ji_chu_neng_liang , xu_li_shi_jian , man_xu_li)
	{
		if (DEBUG_MODE == 1)
		{
			printf("进入到fn_Energy4x");
			printf("每次普通击球获得的基础能量===" +ji_chu_neng_liang);
			printf("本次击球的蓄力时间=="  +xu_li_shi_jian);
			printf("定义的满蓄力时间==" +man_xu_li);
			printf("能量结果==" ji_chu_neng_liang  * (3.0 * xu_li_shi_jian / man_xu_li);
		}
		return ji_chu_neng_liang  * (3.0 * xu_li_shi_jian / man_xu_li);
	} // 4回合以内的蓄力球能量计算
	
	void fn_Energy8x( ji_chu_neng_liang , xu_li_shi_jian , man_xu_li , bei_shu)
	{
		if (DEBUG_MODE == 1)
		{
			printf("fn_Energy8x");
			printf("每次普通击球获得的基础能量===" +ji_chu_neng_liang);
			printf("本次击球的蓄力时间=="  +xu_li_shi_jian);
			printf("定义的满蓄力时间==" +man_xu_li);
			printf("由于回合数而产生的能量加成倍数=="bei_shu);
			printf("结果=="ji_chu_neng_liang  * (3.0 * xu_li_shi_jian / man_xu_li) * bei_shu;
		}
		return  ji_chu_neng_liang  * (3.0 * xu_li_shi_jian / man_xu_li) *  bei_shu;


	} // 4回合以上的蓄力球能量计算

	// ----------------------------------下面是计算击球落点时需要的计算函数----------------------------------------------
	//普通球落点计算函数
	void fn_Jisuan(start , distance , max_xu_li , dang_qian_xuli)   
	{
		return start + distance*dang_qian_xuli/max_xu_li;		
	}
	//普通球落点计算函数
	void fn_Jinengjisuan(ji_chu_luo_dian , pian_yi)   //技能球落点计算函数
	{
		return ji_chu_luo_dian + pian_yi * 1.5;		
	}
	//技能球落点计算函数
	//----------------------------------------下面是C型技能球的-trackindex-----------------------------------------------------------------
	void fn_Cskill()
	{
		printf("打的方向是 ======" +m_tennisHitBall.dir);
		if (m_tennisHitBall.dir >= 5 && m_tennisHitBall.dir <= 7)
		{
			trackIndex = m_tennisHitBall.backStore;      //向左打会调用 C型技能球的左弯轨迹
			isFullStore = 0 ; // 是否是满蓄力
		}
		else
		{
			trackIndex = m_tennisHitBall.frontStore ;		//前场蓄力轨迹   （ 技能球普通轨迹）
			isFullStore = 0 ; // 是否是满蓄力
		}

	}

	//------------------------------------------------下面是发球的ballspeed   和  trackindex--------------------------------------------------------------------------
	//为了蓄力条的满蓄力显示统一，将判断满蓄力的变量及计算公式统一到window下面了
	//见:\client\interface\Logic\GmlCtrls\Common\Utility.gml
	void fn_Faqiuspeed(body_id)			
	{
		//修改后
		if (window.CheXin_FullServe(m_tennisHitBall.nStoreTime,body_id) == 1) //1满蓄力 0不是满蓄力
		{
			printf("真的是满蓄力");
			isFullStore = 1;
			ballSpeed = 0.4 ;
			trackIndex = m_tennisHitBall.bMaxStore;
		}
		else
		{
			isFullStore = 0;
			ballSpeed = MOREN_SPEED - window.Fun_ServeSpeed(m_tennisHitBall.nStoreTime,body_id);
			trackIndex = m_tennisHitBall.backStore;
		}

		/*原文
		window.FA_QIU_MAX_DOWN = window.FA_QIU_MAX_TIME / 2 - window.FA_QIU_MAX_FAN_WEI ;				   // 发满蓄力球蓄力时间下限值,用来判断是否满蓄力的参数window.FA_QIU_MAX_FAN_WEI在阿福的脚本里F:\tennis\client\interface\Logic\GmlCtrls\Common\Utility.gml
		window.FA_QIU_MAX_UP = window.FA_QIU_MAX_TIME / 2 + window.FA_QIU_MAX_FAN_WEI ;				   //发满蓄力球蓄力时间上限值，用来判断是否满蓄力的参数
		if (m_tennisHitBall.nStoreTime > window.FA_QIU_MAX_TIME)
		{
			m_tennisHitBall.nStoreTime = window.FA_QIU_MAX_TIME;
		} // 如果蓄力时间大于发球最大蓄力时间，就等于发球最大蓄力时间
	//	ballSpeed = MOREN_SPEED - fn_Fqsudu(m_tennisHitBall.nStoreTime , FA_QIU_MAX_TIME , FA_QIU_CAN_SHU);
		if (m_tennisHitBall.nStoreTime <= window.FA_QIU_MAX_UP  &&  m_tennisHitBall.nStoreTime >= window.FA_QIU_MAX_DOWN)    //判断是满蓄力发球
		{
			ballSpeed = 0.4 ;
			trackIndex = m_tennisHitBall.bMaxStore;	
			//window.SetMaxSpeed(1);//是否是满蓄力发球  给阿福的参数付值
			printf("真的是满蓄力" );
		}
		else    //不是满蓄力发球
		{
			ballSpeed = MOREN_SPEED - window.Fun_ServeSpeed(m_tennisHitBall.nStoreTime);
			trackIndex = m_tennisHitBall.backStore;	
			//window.SetMaxSpeed(0);//是否是满蓄力发球  给阿福的参数付值
		}
		*/
		//路径在：E:\vnet2project2008\Project2\tennis\data\client\interface\Logic\GmlCtrls\Common\Utility.gml
		
		printf("发球蓄力时间====m_tennisHitBall.nStoreTime==========" + m_tennisHitBall.nStoreTime);
		printf("发球球速函数=====window.Fun_ServeSpeed=========" +window.Fun_ServeSpeed(m_tennisHitBall.nStoreTime));	
		printf("发球球速==============" +ballSpeed);
					
	}//发球条件下的计算
	//------------------------------------下面是普通球的 ballspeed  和 trackindex----------------------------------------------------------------------------------------
	// TODO: 通过相关参数计算返回变量	
	void fn_Putongspeed(curr_bout)
	{
		printf("fn_Putongspeed: isStore" + m_tennisHitBall.canStorePower);
		if(m_tennisHitBall.nStoreTime == 0 || !m_tennisHitBall.canStorePower)
		{
			printf("普通球，不能蓄力的或者蓄力时间为0的球")
			addEnergy = ENERGY_BASE ;     //无蓄力或蓄力时间为0的球不受回合数影响能量获得			
			ballPower = 0; //无蓄力球上的力量值为0
			ballSpeed = fn_Jsqs( MOREN_SPEED,MAX_PT_SPEED,m_tennisHitBall.skill ,MAX_SKILL ); // 无蓄力球因为技术值增长球速
			var dangqiu = fn_Dqgl( m_tennisHitBall.oppBallPower,ballPower,GAI_LV_ZHI );
			var jishugailv = fn_Jishujianshao( m_tennisHitBall.skill,GAI_LV_ZHI_J,MAX_SKILL ); 
			dangqiugailv = dangqiu *  jishugailv ; //由于技术值而减少的挡球概率
			printf("挡球概率最后====dangqiugailv==========" + dangqiugailv);
			if (DEBUG_MODE == 1)
			{
				printf("===无蓄力球的挡球概率为====" +dangqiugailv );
				printf("===来球的力量值====" +m_tennisHitBall.oppBallPower );
				printf("===发挥的力量值====" +ballPower );
				printf("===概率值参数====" +GAI_LV_ZHI );
//				printf("===技术减少的概率为====" +fn_Jishujianshao ); 这句有问题
			}	
			printf("计算的dangqiugailv==="  +  dangqiugailv);

			if (m_suijizhi < dangqiugailv)
			{
				isFullStore = 0 ; // 是否是满蓄力
				trackIndex = m_tennisHitBall.dangQiuGuiJi;
				printf("挡球trackIndex==" + trackIndex);
			}
			if (m_suijizhi >= dangqiugailv)
			{	
				printf("m_tennisHitBall.posZ =====这个值======"  +m_tennisHitBall.posZ);
				if(m_tennisHitBall.posZ <= POSZ_FRONT)    // 人在前场的无蓄力
				{	
					isFullStore = 0 ; // 是否是满蓄力
					trackIndex = m_tennisHitBall.frontNormal;
					printf("前场trackIndex==" + trackIndex);
				}
			
				if(m_tennisHitBall.posZ > POSZ_FRONT)     // 人在后场的无蓄力
				{
					isFullStore = 0 ; // 是否是满蓄力
					trackIndex = m_tennisHitBall.backNormal;
					printf("后场trackIndex==" + trackIndex);
				}

			}
			printf("rackIndex==" + trackIndex);
		}  //不是技能，没有蓄力，时的计算
		
		
		if(m_tennisHitBall.nStoreTime > 0 && m_tennisHitBall.canStorePower)
		{				
			if(m_tennisHitBall.posZ <= POSZ_FRONT)   // 人在前场的有蓄力
			{	
				printf("进到这里了么？前场虚力球");
				
				if( m_tennisHitBall.nStoreTime > MAX_Q_STORE_TIME)
				{
					m_tennisHitBall.nStoreTime = MAX_Q_STORE_TIME;
				} //人在前场时，蓄力值的最大值为定义好的前场的满蓄力值
				if (curr_bout <= 4)
				{
					addEnergy = fn_Energy4x( ENERGY_BASE , m_tennisHitBall.nStoreTime , MAX_Q_STORE_TIME);
				} // 4回合以内蓄力球能量计算
				if (curr_bout > 4 && curr_bout <=  8)
				{
					addEnergy = fn_Energy8x( ENERGY_BASE , m_tennisHitBall.nStoreTime , MAX_Q_STORE_TIME , XU_LI_QIU8);
				} // 4-8回合蓄力球能量计算
				if (curr_bout > 8)
				{
					addEnergy = fn_Energy8x( ENERGY_BASE , m_tennisHitBall.nStoreTime , MAX_Q_STORE_TIME , XU_LI_QIU2);
				} //8回合以上蓄力球能量计算

				ballSpeed =fn_Jsqs( MOREN_SPEED , MAX_SPEED , m_tennisHitBall.nStoreTime , MAX_Q_STORE_TIME);
				ballPower = m_tennisHitBall.strength * (m_tennisHitBall.nStoreTime / MAX_Q_STORE_TIME)   //球上的力量值 = 蓄力发挥的满蓄力的百分比

				var dangqiu = fn_Dqgl( m_tennisHitBall.oppBallPower,ballPower,GAI_LV_ZHI );
				var jishugailv = fn_Jishujianshao( m_tennisHitBall.skill,GAI_LV_ZHI_J,MAX_SKILL ); 
				dangqiugailv = dangqiu *  jishugailv ; //由于技术值而减少的挡球概率
				printf("挡球概率最后====dangqiugailv==========" + dangqiugailv);
//				var m_suijizhi = tstatic.rand(0,100);
				if (ballPower >= m_tennisHitBall.oppBallPower)
				{
					if (m_tennisHitBall.nStoreTime >= MAX_Q_STORE_TIME)
					{
						isFullStore = 1 ; // 是否是满蓄力
						trackIndex = m_tennisHitBall.fMaxStore ;
					} // 蓄力等于满蓄力时出满蓄力轨迹
					else
					{
						isFullStore = 0 ; // 是否是满蓄力
						trackIndex = m_tennisHitBall.frontStore;
					}	
				} //发挥的力量值大于球上携带的力量值时不会触发挡球轨迹。
				if (ballPower < m_tennisHitBall.oppBallPower)
				{
					if (m_suijizhi < dangqiugailv)
					{	
						isFullStore = 0 ; // 是否是满蓄力
						trackIndex = m_tennisHitBall.dangQiuGuiJi;
					}
					if (m_suijizhi >= dangqiugailv)
					{
						if (m_tennisHitBall.nStoreTime >= MAX_Q_STORE_TIME)
						{
							isFullStore = 1 ; // 是否是满蓄力
							trackIndex = m_tennisHitBall.fMaxStore ;
						} // 蓄力等于满蓄力时出满蓄力轨迹
						else
						{
							isFullStore = 0 ; // 是否是满蓄力
							trackIndex = m_tennisHitBall.frontStore;							
						}						
					}//随机数大于挡球标准值时，不触发挡球轨迹					
				}
			}//有蓄力，且人在前场时
			if(m_tennisHitBall.posZ > POSZ_FRONT) // 人在后场的有蓄力
			{
				printf("进到这里了么？后场虚礼球")
				if( m_tennisHitBall.nStoreTime > MAX_H_STORE_TIME)
				{
					m_tennisHitBall.nStoreTime = MAX_H_STORE_TIME;
				} //人在后场，蓄力值最大值是定义好的后场满蓄力值
				if (curr_bout <= 4)
				{
					printf("进到这里了么？4回合内的球")
					addEnergy = fn_Energy4x( ENERGY_BASE , m_tennisHitBall.nStoreTime , MAX_H_STORE_TIME);
				} // 4回合以内蓄力球能量计算
				if (curr_bout > 4 && curr_bout <=  8)
				{
					printf("进到这里了么？4-8回合的球")
					addEnergy = fn_Energy8x( ENERGY_BASE , m_tennisHitBall.nStoreTime , MAX_H_STORE_TIME , XU_LI_QIU8);
				} // 4-8回合蓄力球能量计算
				if (curr_bout > 8)
				{
					printf("进到这里了么？8回合以上的球")
					addEnergy = fn_Energy8x( ENERGY_BASE , m_tennisHitBall.nStoreTime , MAX_H_STORE_TIME , XU_LI_QIU2);
				} //8回合以上蓄力球能量计算
				ballSpeed =fn_Jsqs( MOREN_SPEED , MAX_SPEED , m_tennisHitBall.nStoreTime , MAX_H_STORE_TIME);
				ballPower = m_tennisHitBall.strength * (m_tennisHitBall.nStoreTime / MAX_H_STORE_TIME)   //球上的力量值 = 蓄力发挥的满蓄力的百分比
				var dangqiu = fn_Dqgl( m_tennisHitBall.oppBallPower,ballPower,GAI_LV_ZHI );
				var jishugailv = fn_Jishujianshao( m_tennisHitBall.skill,GAI_LV_ZHI_J,MAX_SKILL ); 
				dangqiugailv = dangqiu *  jishugailv ; //由于技术值而减少的挡球概率
				printf("挡球概率最后====dangqiugailv==========" + dangqiugailv);
//				var m_suijizhi = tstatic.rand(0,100);
				if (ballPower >= m_tennisHitBall.oppBallPower)
				{
					if (m_tennisHitBall.nStoreTime >= MAX_H_STORE_TIME)
					{
						trackIndex = m_tennisHitBall.bMaxStore ;
						isFullStore = 1;
					} // 蓄力等于满蓄力时出满蓄力轨迹
					else
					{
						trackIndex = m_tennisHitBall.backStore;
						isFullStore = 0;
					}	
				} //发挥的力量值大于球上携带的力量值时不会触发挡球轨迹。
				if (ballPower < m_tennisHitBall.oppBallPower)
				{
					if (m_suijizhi < dangqiugailv)
					{
						isFullStore = 0; //是否满蓄力
						trackIndex = m_tennisHitBall.dangQiuGuiJi;
					}
					if (m_suijizhi >= dangqiugailv)
					{
						if (m_tennisHitBall.nStoreTime >= MAX_H_STORE_TIME)
						{
							trackIndex = m_tennisHitBall.bMaxStore ;
							isFullStore = 1;
						}	// 蓄力等于满蓄力时出满蓄力轨迹					
						else
						{
							trackIndex = m_tennisHitBall.backStore;
							isFullStore = 0;
						}
					}	//		如果没有随到出挡球轨迹
				}													
			}		//人在后场的有蓄力	
		//	ballSpeed = 1.0 - (nStoreTime / 1000)/2.0;
		} // 有蓄力的时候
	} // 不是技能， 不是发球，计算球速  轨迹  能量 挡球概率

//------------------------------下面是扑救球的能量计算-------------------------------------------------------------
	void fn_Pujiuspeed();			
	{
		addEnergy = ENERGY_BASE * PU_JIU_BEI_SHU;
	}//如果是挡球或扑救，击球获得的能量为普通能量乘以扑救球与普通球能量倍数，与回合数无关。
//--------------------------------------下面是接发球的  轨迹  和球速-----------------------------------------------------------
	void fn_Jiefaspeed();
	{
		ballSpeed = MOREN_SPEED;
		isFullStore = 0; //是否满蓄力
		trackIndex = m_tennisHitBall.dangQiuGuiJi ;
	}
//-------------------------------------------------------------------------------------------------------------------------------
	/* 
	作用:	计算击球参数
	参数:	1. UserID(整型)
			2. BodyID(整型)
			3. 蓄力时间(整型)
			4. 击球动作索引(整型)
			5.球上的力量值
	返回:	填写ballSpeed  trackIndex  isFullStore
	*/
	void CalHitArgs( user_id,body_id,store_time,hit_act_index,opp_ball_power )
	{
		
		printf("Script CalHitArgs Called!");
		printf("=============INPUT==============");
		printf("store_time = " + store_time);
		printf("hit_act_index = " + hit_act_index);
		printf("opp_ball_power = " + opp_ball_power);
		printf("lasttrackindex = " + group.vmlBall.find("TRACKMGR").GetTrack());
		printf("================================");
		printf("");


		addEnergy = 0;
		var currbout = GetBout();// 得到的回合数
		var totalenergy = GetEnergy(); // 当前能量数
		var lasttrackindex = group.vmlBall.find("TRACKMGR").GetTrack() //上一条轨迹的类型
		m_suijizhi = tstatic.rand(100);
		
		
		ballSpeed = -1;
		trackIndex = -1;

		// userrow是m_g_Server库userDt表中m_nUserID玩家的数据
		var userrow = new VNet2DBRow{}
		userrow.InitByInt("m_g_server.mdb","userdt",window.M_G_SERVER_FRIENDDT_USERID ,user_id);
		
		if ( userrow.IsReady() == 0 )
		{ 
			userrow.del();
			printf("=========userrow打开失败=======================");
			return;
		}
		
		var rolerow = new VNet2DBRow{}
		rolerow.InitByInt("m_g_server.mdb","roledt",window.M_G_SERVER_ROLEDT_RID ,body_id);
		
		if ( rolerow.IsReady() == 0 )
		{ 
			userrow.del();
			rolerow.del();
			printf("=========rolerow打开失败=======================");
			return;
		}
		
		var sex = 1; // 用性别查找对应的数据库
		sex = rolerow.GetData(window.M_G_SERVER_ROLEDT_RDEFID);	

		var hitrow = new VNet2DBRow{}
		if ( sex == 1)
		{
			hitrow.InitByInt("a001user.mdb","HitAct", window.A001USER_HITACT_INDEX , hit_act_index);
		}
		if ( sex == 2)
		{
			hitrow.InitByInt("a002user.mdb","HitAct", window.A001USER_HITACT_INDEX, hit_act_index);
		}

		if ( hitrow.IsReady() == 0 )
		{ 
			userrow.del();
			rolerow.del();
			hitrow.del();
			printf("=========hitrow打开失败=======================");
			return;
		}

		var lasttrackrow = new VNet2DBRow{}
		lasttrackrow.InitByInt("Tennis_Game.mdb","TrackInfo", window.TENNIS_GAME_TRACKINFO_TRACKID, lasttrackindex);
		if ( hitrow.IsReady() == 0 )
		{ 
			userrow.del();
			rolerow.del();
			hitrow.del();
			lasttrackrow.del();
			printf("=========lasttrackrow打开失败=======================");
			return;
		}
		
		//下面是判断条件、计算参数时用到的各种值
		

		
		
		if( DEBUG_MODE == 1)
		{
	//		posz = userrow.GetData(31);  // 人物位置
			m_tennisHitBall.posZ = userrow.GetData(window.M_G_SERVER_USERDT_POSZ);  // 人物位置
			m_tennisHitBall.strength = 1.0 * rolerow.GetData(window.M_G_SERVER_ROLEDT_TSTRENGTH) / MAX_SHU_XING_BEISHU;	// 力量
			m_tennisHitBall.skill = 1.0 * rolerow.GetData(window.M_G_SERVER_ROLEDT_TSKILL)  / MAX_SHU_XING_BEISHU;	// 技术
			m_tennisHitBall.foreHand = 1.0 * rolerow.GetData(window.M_G_SERVER_ROLEDT_TFORCEHAND)  / MAX_SHU_XING_BEISHU;	// 网前
			m_tennisHitBall.backHand = 1.0 * rolerow.GetData(window.M_G_SERVER_ROLEDT_TBACKHAND)  / MAX_SHU_XING_BEISHU;	// 后场
			m_tennisHitBall.frontStore = hitrow.GetData(window.A001USER_HITACT_RETURNTRACK0);	//前场蓄力轨迹 技能1级轨迹。
			m_tennisHitBall.backStore =  hitrow.GetData(window.A001USER_HITACT_RETURNTRACK1);	//后场蓄力轨迹
			m_tennisHitBall.frontNormal =  hitrow.GetData(window.A001USER_HITACT_RETURNTRACK2);//前场普通轨迹
			m_tennisHitBall.backNormal =  hitrow.GetData(window.A001USER_HITACT_RETURNTRACK3);	//后场普通轨迹
			m_tennisHitBall.dangQiuGuiJi =  hitrow.GetData(window.A001USER_HITACT_RETURNTRACK4);	//力量值触发的挡球轨迹
			m_tennisHitBall.bMaxStore =  hitrow.GetData(window.A001USER_HITACT_RETURNTRACK5);	//后场满蓄力轨迹
			m_tennisHitBall.fMaxStore = hitrow.GetData(window.A001USER_HITACT_RETURNTRACK6);	//前场满蓄力轨迹
			m_tennisHitBall.skillType = hitrow.GetData(window.A001USER_HITACT_SKILLTYPE);	//技能类型， （调用技能球轨迹用）

			m_tennisHitBall.isSkill  =	hitrow.GetData(window.A001USER_HITACT_ISSKILL);//取是否是技能
			m_tennisHitBall.hitType = hitrow.GetData(window.A001USER_HITACT_HITTYPE); // 击球类型
			m_tennisHitBall.userID		=	user_id;	 //
			m_tennisHitBall.bodyID			=	body_id ; 
			m_tennisHitBall.nStoreTime			=	store_time; //蓄力时间
			m_tennisHitBall.hitActIndex			=	hit_act_index; // 动作索引
			m_tennisHitBall.oppBallPower	=	opp_ball_power; // 球上的力量值
			m_tennisHitBall.lastTrackType		=  lasttrackrow.GetData(window.TENNIS_GAME_TRACKINFO_TRACKTYPE);     //上条轨迹的类型
			m_tennisHitBall.canStorePower  =  hitrow.GetData(window.A001USER_HITACT_CANSTOREPOWER); // 是否能蓄力

			Q_HAND_TAPE_CHENG_FA = fn_Jscf(Q_MAX_CHENG_FA , m_tennisHitBall.foreHand);		//计算人在前场时正手向右，反手向左打时最大偏移距离的惩罚
			H_HAND_TAPE_CHENG_FA = fn_Jscf(H_MAX_CHENG_FA , m_tennisHitBall.backHand);		
			
		}
		else
		{			
			m_tennisHitBall.posZ = userrow.GetData(window.M_G_SERVER_USERDT_POSZ);  // 人物位置
			m_tennisHitBall.strength = 1.0 * rolerow.GetData(window.M_G_SERVER_ROLEDT_TSTRENGTH)  / MAX_SHU_XING_BEISHU;	// 力量
			if (m_tennisHitBall.strength > 100.0)
			{	m_tennisHitBall.strength = 100.0}
			m_tennisHitBall.skill = 1.0 * rolerow.GetData(window.M_G_SERVER_ROLEDT_TSKILL)  / MAX_SHU_XING_BEISHU;	// 技术
			if (m_tennisHitBall.skill > 100.0)
			{	m_tennisHitBall.skill = 100.0}
			m_tennisHitBall.foreHand = 1.0 * rolerow.GetData(window.M_G_SERVER_ROLEDT_TFORCEHAND)  / MAX_SHU_XING_BEISHU;	// 网前
			if (m_tennisHitBall.foreHand > 100.0)
			{	m_tennisHitBall.foreHand = 100.0}
			m_tennisHitBall.backHand = 1.0 * rolerow.GetData(window.M_G_SERVER_ROLEDT_TBACKHAND)  / MAX_SHU_XING_BEISHU;	// 后场
			if (m_tennisHitBall.backHand > 100.0)
			{	m_tennisHitBall.backHand = 100.0}
			m_tennisHitBall.frontStore = hitrow.GetData(window.A001USER_HITACT_RETURNTRACK0);	//前场蓄力轨迹 技能1级轨迹。
			m_tennisHitBall.backStore =  hitrow.GetData(window.A001USER_HITACT_RETURNTRACK1);	//后场蓄力轨迹
			m_tennisHitBall.frontNormal =  hitrow.GetData(window.A001USER_HITACT_RETURNTRACK2);//前场普通轨迹
			m_tennisHitBall.backNormal =  hitrow.GetData(window.A001USER_HITACT_RETURNTRACK3);	//后场普通轨迹
			m_tennisHitBall.dangQiuGuiJi =  hitrow.GetData(window.A001USER_HITACT_RETURNTRACK4);	//力量值触发的挡球轨迹
			m_tennisHitBall.bMaxStore =  hitrow.GetData(window.A001USER_HITACT_RETURNTRACK5);	//后场满蓄力轨迹
			m_tennisHitBall.fMaxStore = hitrow.GetData(window.A001USER_HITACT_RETURNTRACK6);	//前场满蓄力轨迹
			m_tennisHitBall.skillType = hitrow.GetData(window.A001USER_HITACT_SKILLTYPE);	//技能类型， （调用技能球轨迹用）

			m_tennisHitBall.isSkill  =	hitrow.GetData(window.A001USER_HITACT_ISSKILL);//取是否是技能
			m_tennisHitBall.hitType = hitrow.GetData(window.A001USER_HITACT_HITTYPE); // 击球类型
			
			
			m_tennisHitBall.userID		=	user_id;	 //
			m_tennisHitBall.bodyID			=	body_id ; 
			m_tennisHitBall.nStoreTime			=	store_time; //蓄力时间
			m_tennisHitBall.hitActIndex			=	hit_act_index; // 动作索引
			m_tennisHitBall.oppBallPower	=	opp_ball_power; // 球上的力量值
			m_tennisHitBall.lastTrackType		=  lasttrackrow.GetData(window.TENNIS_GAME_TRACKINFO_TRACKTYPE);     //上条轨迹的类型
			m_tennisHitBall.canStorePower  =  hitrow.GetData(window.A001USER_HITACT_CANSTOREPOWER); // 是否能蓄力

			Q_HAND_TAPE_CHENG_FA = fn_Jscf(Q_MAX_CHENG_FA , m_tennisHitBall.foreHand);		//计算人在前场时正手向右，反手向左打时最大偏移距离的惩罚
			H_HAND_TAPE_CHENG_FA = fn_Jscf(H_MAX_CHENG_FA , m_tennisHitBall.backHand);		//计算人在后场时正手向右，反手向左打时最大偏移距离的惩罚			
		}

/////-------------------------------------为了判断人物站在前场还是后场------------------------------------------------------------------------------
		if(m_tennisHitBall.posZ < 0)
		{
			m_tennisHitBall.posZ = m_tennisHitBall.posZ * (-1);
		} //为判断人物站位属于前场还是后场，需要取人物所在Z值的绝对值		


		
//---------------------------------------------------------------------------------------------------------------------

		
				//-----------------------------------------下面是技能球的 ballspeed   和  trackindex---------------------------------------------------------------
		if (m_tennisHitBall.isSkill )
		{
			printf("0。这是技能球");
			printf("1。这技能的类型 ===" +m_tennisHitBall.skillType);
			ballSpeed = MOREN_SPEED;

			if (m_tennisHitBall.skillType == 1)
			{
				fn_Cskill();
			}
			else 
			{
				trackIndex = m_tennisHitBall.frontStore;
				isFullStore = 0; //是否满蓄力
			}
			printf("发球的球速为===" + ballSpeed);
			printf("发球的轨迹为===" + trackIndex);
		}
		if (!m_tennisHitBall.isSkill)
		{			
			printf("1。不是技能");
			if(m_tennisHitBall.hitType == 4 || m_tennisHitBall.hitType == 8)
			{
				printf("2。这是发球");
				fn_Faqiuspeed(body_id);
				printf("发球的球速为===" + ballSpeed);
				printf("发球的轨迹为===" + trackIndex);
			}
			if (m_tennisHitBall.hitType != 4 && m_tennisHitBall.hitType != 8)
			{
				printf("3。不是发球");
				printf("上条轨迹的类型是：" +m_tennisHitBall.lastTrackType);
				
				if ( m_tennisHitBall.lastTrackType	 == 3 && m_tennisHitBall.posZ < JIE_FAQIU_DANGQIU)
				{
					printf("4。上条轨迹是发球");
					printf("5。人物接发球时站位靠前");	
						//printf("6。或者接扣杀、满蓄力时位置靠前");	
					fn_Jiefaspeed();	
					printf("不正确的接发球轨迹" + trackIndex);
				}//接发球如果人太靠前。		
				else
				{
					if ( m_tennisHitBall.lastTrackType	 == 5 && m_tennisHitBall.posZ < JIE_KOUSHA_DANGQIU)
					{
						printf("上条轨迹是扣杀或满蓄力上旋和截击");
						printf("人物在前场");	
						printf("6。或者接扣杀、满蓄力时位置靠前");	
						fn_Jiefaspeed();	
						printf("不正确的接发球轨迹" + trackIndex);
					}//在前场接扣杀或满蓄力截击。
					else
					{
						fn_Putongspeed(currbout);	
					}
				}	
				if (m_tennisHitBall.hitType == 5 || m_tennisHitBall.hitType == 6)
				{
					printf("7。扑救或者挡球出现");		
					fn_Pujiuspeed();
				}
			}		
		}
		printf("===========================来球的力量值=======================" + m_tennisHitBall.oppBallPower);
		printf("===========================发挥的力量值======================" + ballPower);
		printf("===========================随机数==========================" + m_suijizhi);
		printf("===========================挡球概率=========================" + dangqiugailv);
		printf("===========这一拍获得的能量 = " + addEnergy);
		printf("===========现在拥有的能量 = " + totalenergy);
		if (DEBUG_MODE == 1)
		{			
			printf("===========posz = " + m_tennisHitBall.posZ);
			printf("===========ballSpeed = " + ballSpeed);
			printf("===========trackIndex = " + trackIndex);
			printf("===========ballPower = " + ballPower);
			printf("===========m_tennisHitBall.opp_ball_power = " + m_tennisHitBall.oppBallPower);
			printf("===========dangqiuguiji = " + m_tennisHitBall.dangQiuGuiJi);
			printf("===========m_suijizhi = " + m_suijizhi);
			printf("===========dangqiugailv = " + dangqiugailv);
			printf("===========addEnergy = " + addEnergy);
		}			
		userrow.del();
		rolerow.del();
		hitrow.del();
		lasttrackrow.del();
	}//end of CalHitArgs()
	
	/* 
	作用:	计算落点参数
	参数:	1. UserID(整型)
			2. BodyID(整型)
			3. 蓄力时间(整型)
			4. 左右手(整型)
			5. 击球动作索引(整型)
			6. 蓄力方向(整型)
			enum KeyDirection
		{
			UP = 0,
			UPRIGHT,
			RIGHT,
			DOWNRIGHT,
			DOWN,
			DOWNLEFT,
			LEFT,
			UPLEFT,
			//没有按下任何方向键
			STOP
		};

	返回:	填写dropX  dropY  dropZ
	*/
	//=========================落点参数付值函数===============================
											//蓄力0
	var TYPE_CALC_ZSQC_XULI_XIAO = 1;						
	var TYPE_CALC_ZSQC_XULI_DA= 2;
	var TYPE_CALC_ZSHC_XULI_XIAO = 3;
	var TYPE_CALC_ZSHC_XULI_DA = 4;
	var TYPE_CALC_FSQC_XULI_XIAO = 5;
	var TYPE_CALC_FSQC_XULI_DA = 6;
	var TYPE_CALC_FSHC_XULI_XIAO = 7;
	var TYPE_CALC_FSHC_XULI_DA = 8;
	
	void fn_Shang(tp)
	{
		printf("调用的函数是fn_Shang")
		m_jiBenPianYiX = 0;						  //没有X方向蓄力基本偏移量为0
		m_tennisHitBall.dropX1 = 0;      //没有X方向蓄力时X偏移量为0
		m_tennisHitBall.dropX2 = 0;      //没有X方向蓄力时X偏移量为0	
	} //上
	void fn_Youshang(tp)
	{
		printf("调用的函数是fn_Youshang")
		if(tp ==1   || tp == 2) 
		{
			m_jiBenPianYiX = Q_HAND_TAPE_CHENG_FA * m_jiBenPianYiX;      //正手向右打时最大偏移量惩罚
			m_tennisHitBall.dropX1 = Q_HAND_TAPE_CHENG_FA * m_tennisHitBall.dropX1;      //正手向右打时最大偏移量惩罚
			m_tennisHitBall.dropX2 = Q_HAND_TAPE_CHENG_FA * m_tennisHitBall.dropX2;      //正手向右打时最大偏移量惩罚
		}
		if(tp ==3   || tp == 4) 
		{
			m_jiBenPianYiX = H_HAND_TAPE_CHENG_FA * m_jiBenPianYiX;      //正手向右打时最大偏移量惩罚
			m_tennisHitBall.dropX1 = H_HAND_TAPE_CHENG_FA * m_tennisHitBall.dropX1;      //正手向右打时最大偏移量惩罚
			m_tennisHitBall.dropX2 = H_HAND_TAPE_CHENG_FA * m_tennisHitBall.dropX2;      //正手向右打时最大偏移量惩罚
		}
	}//右上
	void fn_You(tp)
	{
		printf("调用的函数是fn_You")
		if(tp ==1   || tp == 2) 
		{
			m_jiBenPianYiX = Q_HAND_TAPE_CHENG_FA * m_jiBenPianYiX;      //正手向右打时最大偏移量惩罚
			m_tennisHitBall.dropX1 = Q_HAND_TAPE_CHENG_FA * m_tennisHitBall.dropX1;      //正手向右打时最大偏移量惩罚
			m_tennisHitBall.dropX2 = Q_HAND_TAPE_CHENG_FA * m_tennisHitBall.dropX2;      //正手向右打时最大偏移量惩罚
		}
		if(tp ==3   || tp == 4) 
		{
			m_jiBenPianYiX = H_HAND_TAPE_CHENG_FA * m_jiBenPianYiX;      //正手向右打时最大偏移量惩罚
			m_tennisHitBall.dropX1 = H_HAND_TAPE_CHENG_FA * m_tennisHitBall.dropX1;      //正手向右打时最大偏移量惩罚
			m_tennisHitBall.dropX2 = H_HAND_TAPE_CHENG_FA * m_tennisHitBall.dropX2;      //正手向右打时最大偏移量惩罚
		}
			m_jiBenPianYiZ = 0;      //没有Z方向蓄力时Z偏移量为0
			m_tennisHitBall.dropZ1 = 0;      //没有Z方向蓄力时Z偏移量为0
			m_tennisHitBall.dropZ2 = 0;      //没有Z方向蓄力时Z偏移量为0	
	}//右
	void fn_Youxia(tp)
	{
		printf("调用的函数是fn_Youxia")
		if(tp ==1   || tp == 2) 
		{
			m_jiBenPianYiX = Q_HAND_TAPE_CHENG_FA * m_jiBenPianYiX;      //正手向右打时最大偏移量惩罚
			m_tennisHitBall.dropX1 = Q_HAND_TAPE_CHENG_FA * m_tennisHitBall.dropX1;      //正手向右打时最大偏移量惩罚
			m_tennisHitBall.dropX2 = Q_HAND_TAPE_CHENG_FA * m_tennisHitBall.dropX2;      //正手向右打时最大偏移量惩罚
		}
		if(tp ==3   || tp == 4) 
		{
			m_jiBenPianYiX = H_HAND_TAPE_CHENG_FA * m_jiBenPianYiX;      //正手向右打时最大偏移量惩罚
			m_tennisHitBall.dropX1 = H_HAND_TAPE_CHENG_FA * m_tennisHitBall.dropX1;      //正手向右打时最大偏移量惩罚
			m_tennisHitBall.dropX2 = H_HAND_TAPE_CHENG_FA * m_tennisHitBall.dropX2;      //正手向右打时最大偏移量惩罚
		}
		if (m_tennisHitBall.trackType == 2  || m_tennisHitBall.trackType == 4)
		{
			m_jiBenPianYiZ = 0;
			m_tennisHitBall.dropZ1 = 0;
			m_tennisHitBall.dropZ2 = 0;
			return;
		}
		m_jiBenPianYiZ = (-1) * m_jiBenPianYiZ; //向下打Z值基础偏移量为负
		m_tennisHitBall.dropZ1 = (-1) *	m_tennisHitBall.dropZ1;     //向下打Z值短蓄力最大偏移量为负
		m_tennisHitBall.dropZ2 = (-1) *  m_tennisHitBall.dropZ2;                        //向下打Z值偏移量为负		
	}//右下
	void fn_Xia(tp)
	{
		printf("调用的函数是fn_Xia")
		m_jiBenPianYiX = 0;      //没有X方向蓄力时X偏移量为0
		m_tennisHitBall.dropX1 = 0;      //没有X方向蓄力时X偏移量为0
		m_tennisHitBall.dropX2 = 0;      //没有X方向蓄力时X偏移量为0	
		if (m_tennisHitBall.trackType == 2  || m_tennisHitBall.trackType == 4)
		{
			m_jiBenPianYiZ = 0;
			m_tennisHitBall.dropZ1 = 0;
			m_tennisHitBall.dropZ2 = 0;
			return;
		}	
		m_jiBenPianYiZ = (-1) * m_jiBenPianYiZ; //向下打Z值基础偏移量为负
		m_tennisHitBall.dropZ1 = (-1) *m_tennisHitBall.dropZ1;     //向下打Z值短蓄力最大偏移量为负
		m_tennisHitBall.dropZ2 = (-1) *  m_tennisHitBall.dropZ2; 	//向下打Z值短蓄力最大偏移量为负	
	}
	void fn_Zuoxia(tp)
	{
		printf("调用的函数是fn_Zuoxia")
		if (tp == 5 || tp == 6)
		{
			m_jiBenPianYiX = Q_HAND_TAPE_CHENG_FA * m_jiBenPianYiX;      //反手向左打时最大偏移量惩罚
			m_tennisHitBall.dropX1 = Q_HAND_TAPE_CHENG_FA * m_tennisHitBall.dropX1;      //反手向左打时最大偏移量惩罚
			m_tennisHitBall.dropX2 = Q_HAND_TAPE_CHENG_FA * m_tennisHitBall.dropX2;      //反手向左打时最大偏移量惩罚						
		}
		if (tp == 7 || tp == 8)
		{
			m_jiBenPianYiX = H_HAND_TAPE_CHENG_FA * m_jiBenPianYiX;      //反手向左打时最大偏移量惩罚
			m_tennisHitBall.dropX1 = H_HAND_TAPE_CHENG_FA * m_tennisHitBall.dropX1;      //反手向左打时最大偏移量惩罚
			m_tennisHitBall.dropX2 = H_HAND_TAPE_CHENG_FA * m_tennisHitBall.dropX2;      //反手向左打时最大偏移量惩罚						
		}
		m_jiBenPianYiX	= (-1) *  m_jiBenPianYiX;//向左打X值基础偏移量为负
		m_tennisHitBall.dropX1 = (-1) * m_tennisHitBall.dropX1; //向左打X值短蓄力最大偏移量为负						
		m_tennisHitBall.dropX2	= (-1) *  m_tennisHitBall.dropX2;
		if (m_tennisHitBall.trackType == 2  || m_tennisHitBall.trackType == 4)
		{
			m_jiBenPianYiZ = 0;
			m_tennisHitBall.dropZ1 = 0;
			m_tennisHitBall.dropZ2 = 0;
			return;
		}
		m_jiBenPianYiZ = (-1) * m_jiBenPianYiZ; //向下打Z值基础偏移量为负
		m_tennisHitBall.dropZ1 = (-1) *m_tennisHitBall.dropZ1;     //向下打Z值短蓄力最大偏移量为负
		m_tennisHitBall.dropZ2	= (-1) *  m_tennisHitBall.dropZ2;
	}
	void fn_Zuo(tp)
	{
		printf("调用的函数是fn_Zuo")
		if (tp == 5 || tp == 6)
		{
			m_jiBenPianYiX = Q_HAND_TAPE_CHENG_FA * m_jiBenPianYiX;      //反手向左打时最大偏移量惩罚
			m_tennisHitBall.dropX1 = Q_HAND_TAPE_CHENG_FA * m_tennisHitBall.dropX1;      //反手向左打时最大偏移量惩罚
			m_tennisHitBall.dropX2 = Q_HAND_TAPE_CHENG_FA * m_tennisHitBall.dropX2;      //反手向左打时最大偏移量惩罚						
		}
		if (tp == 7 || tp == 8)
		{
			m_jiBenPianYiX = H_HAND_TAPE_CHENG_FA * m_jiBenPianYiX;      //反手向左打时最大偏移量惩罚
			m_tennisHitBall.dropX1 = H_HAND_TAPE_CHENG_FA * m_tennisHitBall.dropX1;      //反手向左打时最大偏移量惩罚
			m_tennisHitBall.dropX2 = H_HAND_TAPE_CHENG_FA * m_tennisHitBall.dropX2;      //反手向左打时最大偏移量惩罚						
		}
		m_jiBenPianYiZ = 0;      //没有Z方向蓄力时Z偏移量为0
		m_tennisHitBall.dropZ1 = 0;      //没有Z方向蓄力时Z偏移量为0
		m_tennisHitBall.dropZ2 = 0;      //没有Z方向蓄力时Z偏移量为0	
		m_jiBenPianYiX = (-1) * m_jiBenPianYiX;// 向左打X值的基本偏移量为负
		m_tennisHitBall.dropX1	= (-1) *  m_tennisHitBall.dropX1;
		m_tennisHitBall.dropX2	= (-1) *  m_tennisHitBall.dropX2;
	}
	void fn_Zuoshang(tp)
	{
		printf("调用的函数是fn_Zuoshang")
		if (tp == 5 || tp == 6)
		{
			m_jiBenPianYiX = Q_HAND_TAPE_CHENG_FA * m_jiBenPianYiX;      //反手向左打时最大偏移量惩罚
			m_tennisHitBall.dropX1 = Q_HAND_TAPE_CHENG_FA * m_tennisHitBall.dropX1;      //反手向左打时最大偏移量惩罚
			m_tennisHitBall.dropX2 = Q_HAND_TAPE_CHENG_FA * m_tennisHitBall.dropX2;      //反手向左打时最大偏移量惩罚						
		}
		if (tp == 7 || tp == 8)
		{
			m_jiBenPianYiX = H_HAND_TAPE_CHENG_FA * m_jiBenPianYiX;      //反手向左打时最大偏移量惩罚
			m_tennisHitBall.dropX1 = H_HAND_TAPE_CHENG_FA * m_tennisHitBall.dropX1;      //反手向左打时最大偏移量惩罚
			m_tennisHitBall.dropX2 = H_HAND_TAPE_CHENG_FA * m_tennisHitBall.dropX2;      //反手向左打时最大偏移量惩罚						
		}
		m_jiBenPianYiX	= (-1) *  m_jiBenPianYiX;//向左打X值基础偏移量为负
		m_tennisHitBall.dropX1 = (-1) * m_tennisHitBall.dropX1; //向左打X值短蓄力最大偏移量为负
		m_tennisHitBall.dropX2	= (-1) *  m_tennisHitBall.dropX2;		
		printf("左上里面的m_jiBenPianYiX====" +m_jiBenPianYiX)
	}

	void fn_Wufangxiang(tp)
	{
		printf("调用的函数是fn_Wufangxiang")
		m_jiBenPianYiX = 0 ;
		m_jiBenPianYiZ = 0 ;
	}
	void fn_Liucheng(tp)
	{
		switch(m_tennisHitBall.dir)
		{
			printf("m_tennisHitBall.dir ===" +m_tennisHitBall.dir)
			printf("tp ===" +tp)
			case 0:fn_Shang(tp); break;           //方向上
			case 1:fn_Youshang(tp); break;
			case 2:fn_You(tp); break;
			case 3:fn_Youxia(tp); break;
			case 4:fn_Xia(tp); break;
			case 5:fn_Zuoxia(tp); break;
			case 6:fn_Zuo(tp); break;
			case 7:fn_Zuoshang(tp); break;
			case 8:fn_Wufangxiang(tp);break; // 无方向蓄力
			
		}
	}

//----------------------------------------------------下面为正手前场计算-------------------------------------------------------------------	
	void fn_Zsqc()
	{				
		if( m_tennisHitBall.handType == 0 && m_tennisHitBall.posZ <= POSZ_FRONT )   // 正手、人在前场的条件判断
		{	
			if (m_tennisHitBall.nStoreTime > MAX_QD_STORE_TIME) 
			{
				m_tennisHitBall.nStoreTime = MAX_QD_STORE_TIME;
			}
			if (0 <= m_tennisHitBall.nStoreTime  &&  m_tennisHitBall.nStoreTime <= MAX_QD_STORE_TIME / 2)     // 如果蓄力不足一半
			{	
				fn_Liucheng(TYPE_CALC_ZSQC_XULI_XIAO)
				m_tennisHitBall.dropX = m_tennisHitBall.dropX + m_jiBenPianYiX;
				m_tennisHitBall.dropZ = m_tennisHitBall.dropZ + m_jiBenPianYiZ;

				dropX = fn_Jisuan(m_tennisHitBall.dropX , m_tennisHitBall.dropX1 , MAX_QD_STORE_TIME ,m_tennisHitBall.nStoreTime)  ;
				dropZ = fn_Jisuan(m_tennisHitBall.dropZ , m_tennisHitBall.dropZ1 , MAX_QD_STORE_TIME , m_tennisHitBall.nStoreTime)  ;

			}  // 判断方向蓄力是否小于满蓄力的一半
			if(MAX_QD_STORE_TIME / 2  < m_tennisHitBall.nStoreTime &&  m_tennisHitBall.nStoreTime <= MAX_QD_STORE_TIME)  //如果蓄力超过一半
			{			
				fn_Liucheng(TYPE_CALC_ZSQC_XULI_DA)
				m_tennisHitBall.dropX = m_tennisHitBall.dropX + m_jiBenPianYiX + m_tennisHitBall.dropX1;    //长蓄力X的基础落点值 = 短蓄力基础+短蓄力最大偏移量
				m_tennisHitBall.dropZ = m_tennisHitBall.dropZ + m_jiBenPianYiZ + m_tennisHitBall.dropZ1;    //长蓄力Z的基础落点值 = 短蓄力基础+短蓄力最大偏移量

				dropX = fn_Jisuan(m_tennisHitBall.dropX , m_tennisHitBall.dropX2 , MAX_QD_STORE_TIME , m_tennisHitBall.nStoreTime)  
				dropZ = fn_Jisuan(m_tennisHitBall.dropZ , m_tennisHitBall.dropZ2 , MAX_QD_STORE_TIME , m_tennisHitBall.nStoreTime)  
			}	//如果蓄力超过满蓄力一半
		}// 正手、人在前场的条件判断
	}//正手、前场函数
//-------------------------------------------------上面为正手前场-----------下面为正手后场-----------------------------------------------------------------
	void fn_Zshc()
	{
		if(m_tennisHitBall.handType == 0 && m_tennisHitBall.posZ > POSZ_FRONT  ) 
		{	
			if (m_tennisHitBall.nStoreTime > MAX_HD_STORE_TIME) 
			{
				m_tennisHitBall.nStoreTime = MAX_HD_STORE_TIME;
			}
			if (0 <= m_tennisHitBall.nStoreTime  &&  m_tennisHitBall.nStoreTime <= MAX_HD_STORE_TIME / 2)     // 如果蓄力不足一半
			{			
				fn_Liucheng(TYPE_CALC_ZSHC_XULI_XIAO)
				m_tennisHitBall.dropX = m_tennisHitBall.dropX + m_jiBenPianYiX;
				m_tennisHitBall.dropZ = m_tennisHitBall.dropZ + m_jiBenPianYiZ;

				dropX = fn_Jisuan(m_tennisHitBall.dropX , m_tennisHitBall.dropX1 , MAX_HD_STORE_TIME ,m_tennisHitBall.nStoreTime)  
				dropZ = fn_Jisuan(m_tennisHitBall.dropZ , m_tennisHitBall.dropZ1 , MAX_HD_STORE_TIME , m_tennisHitBall.nStoreTime)  
			}  // 判断方向蓄力是否小于满蓄力的一半
			if(MAX_HD_STORE_TIME / 2  < m_tennisHitBall.nStoreTime &&  m_tennisHitBall.nStoreTime <= MAX_HD_STORE_TIME)  //如果蓄力超过一半
			{	
				fn_Liucheng(TYPE_CALC_ZSHC_XULI_DA)
				m_tennisHitBall.dropX = m_tennisHitBall.dropX + m_jiBenPianYiX + m_tennisHitBall.dropX1;    //长蓄力X的基础落点值 = 短蓄力基础+短蓄力最大偏移量
				m_tennisHitBall.dropZ = m_tennisHitBall.dropZ + m_jiBenPianYiZ + m_tennisHitBall.dropZ1;    //长蓄力Z的基础落点值 = 短蓄力基础+短蓄力最大偏移量
				dropX = fn_Jisuan(m_tennisHitBall.dropX , m_tennisHitBall.dropX2 , MAX_HD_STORE_TIME , m_tennisHitBall.nStoreTime)  
				dropZ = fn_Jisuan(m_tennisHitBall.dropZ , m_tennisHitBall.dropZ2 , MAX_HD_STORE_TIME , m_tennisHitBall.nStoreTime)  
			}	//如果蓄力超过满蓄力一半		
		} // 正手、人在后场的条件判断
	}//正手、后场函数

 //------------------------------------------上面为正手后场------下面为反手前场-----------------------------------------------------------------------------
	void fn_Fsqc()
	{
		if( m_tennisHitBall.handType == 1 && m_tennisHitBall.posZ <= POSZ_FRONT ) 
		{
			if (m_tennisHitBall.nStoreTime > MAX_QD_STORE_TIME) 
			{
				m_tennisHitBall.nStoreTime = MAX_QD_STORE_TIME;
			}
			if (0 <= m_tennisHitBall.nStoreTime  &&  m_tennisHitBall.nStoreTime <= MAX_QD_STORE_TIME / 2)     // 如果蓄力不足一半
			{			
				fn_Liucheng(TYPE_CALC_FSQC_XULI_XIAO)
				m_tennisHitBall.dropX = m_tennisHitBall.dropX + m_jiBenPianYiX;
				m_tennisHitBall.dropZ = m_tennisHitBall.dropZ + m_jiBenPianYiZ;
				dropX = fn_Jisuan(m_tennisHitBall.dropX , m_tennisHitBall.dropX1 , MAX_QD_STORE_TIME ,m_tennisHitBall.nStoreTime)  
				dropZ = fn_Jisuan(m_tennisHitBall.dropZ , m_tennisHitBall.dropZ1 , MAX_QD_STORE_TIME , m_tennisHitBall.nStoreTime)  
			}  // 判断方向蓄力是否小于满蓄力的一半
			if(MAX_QD_STORE_TIME / 2  < m_tennisHitBall.nStoreTime &&  m_tennisHitBall.nStoreTime <= MAX_QD_STORE_TIME)  //如果蓄力超过一半
			{			
				
				fn_Liucheng(TYPE_CALC_FSQC_XULI_DA)
				m_tennisHitBall.dropX = m_tennisHitBall.dropX + m_jiBenPianYiX + m_tennisHitBall.dropX1;    //长蓄力X的基础落点值 = 短蓄力基础+短蓄力最大偏移量
				m_tennisHitBall.dropZ = m_tennisHitBall.dropZ + m_jiBenPianYiZ + m_tennisHitBall.dropZ1;    //长蓄力Z的基础落点值 = 短蓄力基础+短蓄力最大偏移量
				dropX = fn_Jisuan(m_tennisHitBall.dropX , m_tennisHitBall.dropX2 , MAX_QD_STORE_TIME , m_tennisHitBall.nStoreTime)  
				dropZ = fn_Jisuan(m_tennisHitBall.dropZ , m_tennisHitBall.dropZ2 , MAX_QD_STORE_TIME , m_tennisHitBall.nStoreTime)  
			}	//如果蓄力超过满蓄力一半
		} 
	}//反手、前场

//------------------------------------上面为反手前场--------------------------下面为反手后场---------------------------------------------------------------------
	void fn_Fshc()
	{	
		if( m_tennisHitBall.handType == 1 && m_tennisHitBall.posZ > POSZ_FRONT ) 
		{	
			if (m_tennisHitBall.nStoreTime > MAX_HD_STORE_TIME) 
			{
				m_tennisHitBall.nStoreTime = MAX_HD_STORE_TIME;
			}
			if (0 <= m_tennisHitBall.nStoreTime  &&  m_tennisHitBall.nStoreTime <= MAX_HD_STORE_TIME / 2)     // 如果蓄力不足一半
			{			
				fn_Liucheng(TYPE_CALC_FSHC_XULI_XIAO)
				printf("m_tennisHitBall.dropX==="  + m_tennisHitBall.dropX);
				m_tennisHitBall.dropX = m_tennisHitBall.dropX + m_jiBenPianYiX;
				printf("m_tennisHitBall.dropX==="  + m_tennisHitBall.dropX);
				printf("m_jiBenPianYiX==="  + m_jiBenPianYiX);
				m_tennisHitBall.dropZ = m_tennisHitBall.dropZ + m_jiBenPianYiZ;

				dropX = fn_Jisuan(m_tennisHitBall.dropX , m_tennisHitBall.dropX1 , MAX_HD_STORE_TIME ,m_tennisHitBall.nStoreTime)  
				dropZ = fn_Jisuan(m_tennisHitBall.dropZ , m_tennisHitBall.dropZ1 , MAX_HD_STORE_TIME , m_tennisHitBall.nStoreTime)  

			}  // 判断方向蓄力是否小于满蓄力的一半
			if(MAX_HD_STORE_TIME / 2  < m_tennisHitBall.nStoreTime &&  m_tennisHitBall.nStoreTime <= MAX_HD_STORE_TIME)  //如果蓄力超过一半
			{			
				
				fn_Liucheng(TYPE_CALC_FSHC_XULI_DA)
				m_tennisHitBall.dropX = m_tennisHitBall.dropX + m_jiBenPianYiX + m_tennisHitBall.dropX1;    //长蓄力X的基础落点值 = 短蓄力基础+短蓄力最大偏移量
				m_tennisHitBall.dropZ = m_tennisHitBall.dropZ + m_jiBenPianYiZ + m_tennisHitBall.dropZ1;    //长蓄力Z的基础落点值 = 短蓄力基础+短蓄力最大偏移量
				dropX = fn_Jisuan(m_tennisHitBall.dropX , m_tennisHitBall.dropX2 , MAX_HD_STORE_TIME , m_tennisHitBall.nStoreTime)  
				dropZ = fn_Jisuan(m_tennisHitBall.dropZ , m_tennisHitBall.dropZ2 , MAX_HD_STORE_TIME , m_tennisHitBall.nStoreTime)  
			}	//如果蓄力超过满蓄力一半				
		} 
	}//反手、后场
//-------------------------上面是反手后场计算----------------------

	void fn_Jineng()
	{		
		switch(m_tennisHitBall.dir )				
		{
			printf("======!!!!!!!!!!!!!!!!!!=====m_tennisHitBall.dir= " + m_tennisHitBall.dir);
			case 0:{m_jiBenPianYiX = 0;}	break;	//上			
			case 1:{}		break;	//右上			
			case 2:{}		break;	//右			
			case 3:{}		break;	//右下			
			case 4:{m_jiBenPianYiX = 0;}	break;	//下		
			case 5:{m_jiBenPianYiX = m_jiBenPianYiX * (-1);	}	break;	//左下	
			case 6:{m_jiBenPianYiX = m_jiBenPianYiX * (-1);	}	break;	//左			
			case 7:{m_jiBenPianYiX = m_jiBenPianYiX * (-1);	}	break;	//左上				
			case 8:{m_jiBenPianYiX = 0 ;}	 	break;	//无方向			
		} //根据输入的方向不同计算公式不同

		dropX = fn_Jinengjisuan(m_tennisHitBall.dropX , m_jiBenPianYiX);
		
		if (m_tennisHitBall.trackType == 0 || m_tennisHitBall.trackType == 5)  //上旋类技能轨迹
		{
			dropZ = m_tennisHitBall.dropZ + m_jiBenPianYiZ;
		}//上旋类技能轨迹
		if (m_tennisHitBall.trackType == 1)//削球类技能轨迹
		{
			dropZ = m_tennisHitBall.dropZ - m_jiBenPianYiZ;
		}///削球类技能轨迹
		if (m_tennisHitBall.trackType == 2)//高球类技能轨迹
		{
			dropZ = m_tennisHitBall.dropZ + m_jiBenPianYiZ;
		}//高球类技能轨迹		
	}  //技能落点函数
	
//-------------------------------------上面为反手后场------------下面是发球落点--------------------------------------------------------------------------
	void fn_Faqiu()
	{
		var type = TYPE_CALC_NULL;
		if (m_tennisHitBall.nStoreTime > MAX_FAD_STORE_TIME )
		{
			m_tennisHitBall.nStoreTime = MAX_FAD_STORE_TIME;
		}
		if (m_tennisHitBall.posS >= 3 )  //站位的Z为正时
		{
			m_tennisHitBall.dropX = (-1) * m_tennisHitBall.dropX;				
		}
		dropZ = m_tennisHitBall.dropZ ;	
		if (DEBUG_MODE == 1)
		{
			printf("是普通发球？？？？？？？");
			printf("轨迹类型是====" + m_tennisHitBall.trackType);
			printf("基本落点======="+ m_tennisHitBall.dropZ);
			printf("m_tennisHitBall.posx========" + m_tennisHitBall.posx);
			printf("m_tennisHitBall.posZ========" + m_tennisHitBall.posZ);
		}
		if (m_tennisHitBall.posS == 1 || m_tennisHitBall.posS == 4) //站位的X为正时
		{			
			m_tennisHitBall.dropX = (-1) * m_tennisHitBall.dropX;				
			switch (m_tennisHitBall.dir)
			{
				case 0:{m_tennisHitBall.dropX1 = 0;}break;  //上
				case 1:{}break; //右上
				case 2:{}break; //右
				case 3:{}break; //右下
				case 4:{m_tennisHitBall.dropX1 = 0;}break; //下
				case 5:{m_tennisHitBall.dropX1 = (-1) * m_tennisHitBall.dropX1 ;}break; //左下
				case 6:{m_tennisHitBall.dropX1 = (-1) * m_tennisHitBall.dropX1 ;}break; //左
				case 7:{m_tennisHitBall.dropX1 = (-1) * m_tennisHitBall.dropX1 ;}break; //左上
				case 8:{m_tennisHitBall.dropX1 = 0;}break; //无		
			}			
			dropX = fn_Jisuan(m_tennisHitBall.dropX , m_tennisHitBall.dropX1 , MAX_FAD_STORE_TIME ,m_tennisHitBall.nStoreTime)  			
		}//人物在右边正手位
		if (m_tennisHitBall.posS == 2 || m_tennisHitBall.posS == 3) //站位的X为负时
		{			
			switch (m_tennisHitBall.dir)
			{
				case 0:{m_tennisHitBall.dropX1 = 0;}break;  //上
				case 1:{}break; //右上
				case 2:{}break; //右
				case 3:{}break; //右下
				case 4:{m_tennisHitBall.dropX1 = 0;}break; //下
				case 5:{m_tennisHitBall.dropX1 = (-1) * m_tennisHitBall.dropX1 ;}break; //左下
				case 6:{m_tennisHitBall.dropX1 = (-1) * m_tennisHitBall.dropX1 ;}break; //左
				case 7:{m_tennisHitBall.dropX1 = (-1) * m_tennisHitBall.dropX1 ;}break; //左上
				case 8:{m_tennisHitBall.dropX1 = 0;}break; //无			
			}			
			dropX = fn_Jisuan(m_tennisHitBall.dropX , m_tennisHitBall.dropX1 , MAX_FAD_STORE_TIME ,m_tennisHitBall.nStoreTime)  			
		}//人物在左边反手位
	}//  发球落点计算函数
//------------------------------------------上面是发球计算---------------下面是技能发球计算---------------------------------------
	void fn_SkillFaqiu()
	{
		if (m_tennisHitBall.posS >= 3)
		{
			m_tennisHitBall.dropX = (-1) * m_tennisHitBall.dropX;				
		}
		dropZ = m_tennisHitBall.dropZ;		
		if (m_tennisHitBall.posS == 1 || m_tennisHitBall.posS == 4) 
		{	
			printf("人物所在位置m_tennisHitBall.posx====" + m_tennisHitBall.posx);
			m_tennisHitBall.dropX = (-1) * m_tennisHitBall.dropX;				
			switch (m_tennisHitBall.dir)
			{
				case 0:{m_tennisHitBall.dropX1 = 0;}break;  //上
				case 1:{}break; //右上
				case 2:{}break; //右
				case 3:{}break; //右下
				case 4:{m_tennisHitBall.dropX1 = 0;}break; //下
				case 5:{m_tennisHitBall.dropX1 = (-1) * m_tennisHitBall.dropX1 ;}break; //左下
				case 6:{m_tennisHitBall.dropX1 = (-1) * m_tennisHitBall.dropX1 ;}break; //左
				case 7:{m_tennisHitBall.dropX1 = (-1) * m_tennisHitBall.dropX1 ;}break; //左上
				case 8:{m_tennisHitBall.dropX1 = 0;}break; //无		
			}
			dropX = fn_Jinengjisuan(m_tennisHitBall.dropX , m_tennisHitBall.dropX1) ; 			
		}//人物在右边正手位
		if (m_tennisHitBall.posS == 2 || m_tennisHitBall.posS == 3) 
		{		
			printf("人物所在位置m_tennisHitBall.posx====" + m_tennisHitBall.posx);
			switch (m_tennisHitBall.dir)
			{
				case 0:{m_tennisHitBall.dropX1 = 0;}break;  //上
				case 1:{}break; //右上
				case 2:{}break; //右
				case 3:{}break; //右下
				case 4:{m_tennisHitBall.dropX1 = 0;}break; //下
				case 5:{m_tennisHitBall.dropX1 = (-1) * m_tennisHitBall.dropX1 ;}break; //左下
				case 6:{m_tennisHitBall.dropX1 = (-1) * m_tennisHitBall.dropX1 ;}break; //左
				case 7:{m_tennisHitBall.dropX1 = (-1) * m_tennisHitBall.dropX1 ;}break; //左上
				case 8:{m_tennisHitBall.dropX1 = 0;}break; //无				
			}
			dropX = fn_Jinengjisuan(m_tennisHitBall.dropX , m_tennisHitBall.dropX1) ; 	
		}		
	}			
//---------------------------------------------上面是技能发球计算-------------------------------------------------------------------------------------	
	void CalDropArgs( user_id,body_id,store_time,hit_act_index,dir,track_index )
	{	
		printf("Script CalDropArgs Called!");
		printf("=============INPUT==============");
		printf("store_time = " + store_time);
		printf("hit_act_index = " + hit_act_index);
		printf("dir = " + dir);
		printf("track_index = " + track_index);
		printf("================================");
		printf("");

		// row是m_g_Server库userDt表中m_nUserID玩家的数据
		var userrow = new VNet2DBRow{}
		userrow.InitByInt("m_g_server.mdb","userdt",window.M_G_SERVER_FRIENDDT_USERID,user_id);
		if ( userrow.IsReady() == 0 )
		{ 
			userrow.del();
			return;
		}
		
		var rolerow = new VNet2DBRow{}
		rolerow.InitByInt("m_g_server.mdb","roledt",window.M_G_SERVER_ROLEDT_RID,body_id);
		
		if ( rolerow.IsReady() == 0 )
		{ 
			userrow.del();
			rolerow.del();
			return;
		}

		var sex = 1; // 用性别查找对应的数据库
		sex = rolerow.GetData(window.M_G_SERVER_ROLEDT_RDEFID);	
		printf("===========sex==========="   + sex);

		var hitrow = new VNet2DBRow{}
		if ( sex == 1)
		{
			hitrow.InitByInt("a001user.mdb","HitAct", window.A001USER_HITACT_INDEX, hit_act_index);
		}
		if ( sex == 2)
		{
			hitrow.InitByInt("a002user.mdb","HitAct", window.A001USER_HITACT_INDEX, hit_act_index);
		}
		

		if ( hitrow.IsReady() == 0 )
		{ 
			userrow.del();
			rolerow.del();
			hitrow.del();
			return;
		}

		m_tennisHitBall.posx				= userrow.GetData(window.M_G_SERVER_USERDT_POSX);  // 人物位置
		m_tennisHitBall.posZ				= userrow.GetData(window.M_G_SERVER_USERDT_POSZ);  // 人物位置
		m_tennisHitBall.posS				= userrow.GetData(window.M_G_SERVER_USERDT_RULESTATION);  // 人物位置 具体游戏中发球的站位, 1为+x-z 2为-x-z 3为-x+z 4为+x+z
//		m_tennisHitBall.posZ				=  10.0;
		m_tennisHitBall.handType		=  hitrow.GetData(window.A001USER_HITACT_HANDTYPE);  // 正反手
//		m_tennisHitBall.handType       = 1;
		m_tennisHitBall.strength			 = 1.0 * rolerow.GetData(window.M_G_SERVER_ROLEDT_TSTRENGTH)  / MAX_SHU_XING_BEISHU;	// 力量
		if (m_tennisHitBall.strength > 100.0)
		{	m_tennisHitBall.strength = 100.0}
		m_tennisHitBall.skill				 = 1.0 * rolerow.GetData(window.M_G_SERVER_ROLEDT_TSKILL) / MAX_SHU_XING_BEISHU;	// 技术
		if (m_tennisHitBall.skill > 100.0)
		{	m_tennisHitBall.skill = 100.0}
		m_tennisHitBall.foreHand		= 1.0 * rolerow.GetData(window.M_G_SERVER_ROLEDT_TFORCEHAND) / MAX_SHU_XING_BEISHU;	// 网前
		if (m_tennisHitBall.foreHand > 100.0)
		{	m_tennisHitBall.foreHand = 100.0 }
		m_tennisHitBall.backHand		= 1.0 * rolerow.GetData(window.M_G_SERVER_ROLEDT_TBACKHAND) / MAX_SHU_XING_BEISHU;	// 后场
		if (m_tennisHitBall.backHand > 100.0)
		{	m_tennisHitBall.backHand = 100.0 }
		m_tennisHitBall.userID	=	user_id;	 //
		m_tennisHitBall.userID		=	body_id ; 
		m_tennisHitBall.nStoreTime		=	store_time; //蓄力时间
		m_tennisHitBall.hitActIndex		=	hit_act_index; // 动作索引
		m_tennisHitBall.hitType			= hitrow.GetData(window.A001USER_HITACT_HITTYPE);   //击球类型
//		m_tennisHitBall.hitType = 4;
		m_tennisHitBall.hitActIsSkill   = hitrow.GetData(window.A001USER_HITACT_ISSKILL);   //是否是技能
//		m_tennisHitBall.hitActIsSkill  = false;
		m_tennisHitBall.dir					=	dir    ;          //方向索引
		m_tennisHitBall.trackIndex		=	track_index  ; //轨迹索引
		m_jiBenPianYiX = 2 ;
		m_jiBenPianYiZ = 1 ;

	//	var droprawZ = trackrow.GetData(4);	// 默认落点的Z值

		var trackrow = new VNet2DBRow{}
		trackrow.InitByInt("Tennis_Game.mdb","TrackInfo", window.TENNIS_GAME_TRACKINFO_TRACKID, m_tennisHitBall.trackIndex);

		m_tennisHitBall.trackType = trackrow.GetData(window.TENNIS_GAME_TRACKINFO_TRACKTYPE);
	//	m_tennisHitBall.trackType = 3;
		printf("刚从数据库取到的轨迹类型==="+ m_tennisHitBall.trackType);

		var trackInfoRow = new VNet2DBRow{}
		trackInfoRow.InitByInt("Tennis_Game.mdb","TrackTypeInfo", window.TENNIS_GAME_TRACKTYPEINFO_TRACKTYPE, m_tennisHitBall.trackType);
		
		m_tennisHitBall.dropZ = trackInfoRow.GetData(window.TENNIS_GAME_TRACKTYPEINFO_DROP0Z );			// 短蓄力球基础落点Z          
		m_tennisHitBall.dropZ1 = trackInfoRow.GetData(window.TENNIS_GAME_TRACKTYPEINFO_DROP1Z);			// 短蓄力球最大偏移距离Z  
		m_tennisHitBall.dropZ2 = trackInfoRow.GetData(window.TENNIS_GAME_TRACKTYPEINFO_DROP2Z);		// 长蓄力的最大偏移距离Z  
		m_tennisHitBall.dropX = trackInfoRow.GetData(window.TENNIS_GAME_TRACKTYPEINFO_DROP0X);			// 短蓄力球基础落点X         
		m_tennisHitBall.dropX1 = trackInfoRow.GetData(window.TENNIS_GAME_TRACKTYPEINFO_DROP1X);			// 短蓄力球最大偏移距离X 
		m_tennisHitBall.dropX2 = trackInfoRow.GetData(window.TENNIS_GAME_TRACKTYPEINFO_DROP2X);			//  长蓄力的最大偏移距离X
		
		trackInfoRow.del();
		// TODO: 通过相关参数计算返回变量
//		dropY = 0
//		dropX = 0;			
//		dropZ = 7.5;
		
		if (m_tennisHitBall.hitActIsSkill )
		{
			printf("这个球是技能球");
			if (m_tennisHitBall.hitType == 4 || m_tennisHitBall.hitType == 8)
			{
				fn_SkillFaqiu();
			}
			else
			{
				fn_Jineng();	
				var shuangda = window.tennisGameStatic.GetGameType(); 
				printf("单打还是双打 =" + shuangda);
				if (shuangda == 2)
				{
					dropX = dropX * SHUANG_DA_DROPX_C ;
				}
			}
			
		}//技能球调用的落点函数

		if (!m_tennisHitBall.hitActIsSkill )
		{
			printf("这个球不是技能球");

			if (m_tennisHitBall.hitType == 4 || m_tennisHitBall.hitType == 8)
			{
				printf("这个球不是技能球，而且是发球");
				fn_Faqiu();				
			}
//			if(m_tennisHitBall.handType == 2)
//			{
//				printf("这个球不是技能球，而且不分正反手");
//				Wuzhengfan();
//				break;
//			}
			else
			{
				printf("这个球不是技能球、不是发球 是普通球")
				fn_Zsqc();
				fn_Zshc();
				fn_Fsqc();
				fn_Fshc();
				var shuangda = window.tennisGameStatic.GetGameType(); 
				printf("单打还是双打 =" + shuangda);
				if (shuangda == 2)
				{
					dropX = dropX * SHUANG_DA_DROPX_C ;
				}
			}
		}	//普通球调用的落点函数
		
		
		if (DEBUG_MODE == 1)
		{
			printf("X落点===dropx==" +dropX)
			printf("X落点===dropz==" +dropZ)
			printf("X落点==m_jiBenPianYiX==" +m_jiBenPianYiX)
			printf("X落点===m_jiBenPianYiZ==" +m_jiBenPianYiZ)
			printf("Z落点==m_tennisHitBall.dropZ =="  +m_tennisHitBall.dropZ)
			printf("X落点==m_tennisHitBall.dropZ1 =" +m_tennisHitBall.dropZ1)
			printf("Z落点==m_tennisHitBall.dropZ2 ="  +m_tennisHitBall.dropZ2)
			printf("X落点==m_tennisHitBall.dropX ==" +m_tennisHitBall.dropX)
			printf("Z落点==m_tennisHitBall.dropX1="  +m_tennisHitBall.dropX1)
			printf("Z落点==m_tennisHitBall.dropX2="  +m_tennisHitBall.dropX2)
		}
		userrow.del();	 
		rolerow.del();
		trackrow.del();
		hitrow.del();
	}

	void IsFullStore( userID, hitActIndex, storeTime)
	{
	
		return true;
	}
}

//var logic = new CoreLogic{};
///* 
//	作用:	计算击球参数
//	参数:	1. UserID(整型)
//			2. BodyID(整型)
//			3. 蓄力时间(整型)
//			4. 左右手(整型)
//			5. 击球动作索引(整型)
//	返回:	填写ballSpeed  trackIndex
//	*/
//logic.CalHitArgs( 1, 2, 520, 2, 80);
//( m_nUserID, m_iBodyId, nStoreTime, hitActIndex,oppBallPower)

///* 
//	作用:	计算落点参数
//	参数:	1. UserID(整型)
//			2. BodyID(整型)
//			3. 蓄力时间(整型)
//			4. 左右手(整型)
//			5. 击球动作索引(整型)
//			6. 蓄力方向(整型)
//			*/
//logic.CalDropArgs( 1, 2, 250, 1,7, 0);
//(m_nUserID,  m_iBodyId, nStoreTime, hitActIndex, dir, trackIndex)
/*
var nStoreTime  = 1000;
var MaxDStoreTime = 1000;
var dropX = 2 + nStoreTime * 2 /  MaxDStoreTime;
printf("dropX  = " + dropX );*/
	

  // 向下打Z值的偏移量为负
	
