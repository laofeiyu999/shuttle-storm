//车新用函数
set window
{
	//游戏中的蓄力条-操作公式 计算出 0~0.5之间的数，用来计算发球速度的函数
	//游戏中蓄力需要的变量：来自车新
	var tstatic = new T_ScriptFun{};		//韩硕修改, 脚本调用的函数写在这里, 脚本的单一模式有问题( 8.18)
	var FA_QIU_MAX_TIME =  0;			//1533.0  发球时的最大蓄力时间,即从挥拍到击到球的时间
	var PI = 3.1415926;						//常数π 
	var FA_QIU_CAN_SHU = 2.0;				//计算发球球速的参数,越大最大函数越“陡” 
	//var g_ServerBallTime = 0;				//总的蓄力时间（第二个按键-第一个按键的时间） add by yxf
	//参数：now_time 当前蓄力时间, 
	var FA_QIU_MAX_DOWN	= 0.0;				   // 发满蓄力球蓄力时间下限值
	var FA_QIU_MAX_UP = 0.0;						// 发满蓄力球蓄力时间上限值
	var FA_QIU_MAX_FAN_WEI = 0.0;				//发满蓄力球的范围MS  30.0
	//取发球属性，计算发球蓄力最大值
	void Faqiu_qushuxing(rid)
	{
		var faqiu = 0 ;
		var _serve = window.GetUserServeAttByRID(rid);
		//printf("蓄力条2:Faqiu_qushuxing():_serve:"+_serve);
		faqiu	 = 1.0 * _serve / 2;	// 发球	
		//printf("蓄力条2:Faqiu_qushuxing():faqiu:"+faqiu);
		FA_QIU_MAX_TIME = 933.0 + (faqiu * 3.0) ;  //与发球属性相关的满蓄力
		//printf("蓄力条2:Faqiu_qushuxing():FA_QIU_MAX_TIME:"+FA_QIU_MAX_TIME);
		FA_QIU_MAX_FAN_WEI = faqiu / 4.0;				//发满蓄力球的范围MS  30.0
		//printf("蓄力条2:Faqiu_qushuxing():FA_QIU_MAX_FAN_WEI:"+FA_QIU_MAX_FAN_WEI);
	}

	//now_time:蓄力时间
	//rid:角色ID
	void Fun_ServeSpeed(now_time,rid)
	{
		//printf("蓄力条2:Fun_ServeSpeed():now_time:"+now_time+",rid:"+rid);
		Faqiu_qushuxing(rid);
		
		if (toint(now_time) > toint(FA_QIU_MAX_TIME))
		{
			now_time = FA_QIU_MAX_TIME;
		} // 如果蓄力时间大于发球最大蓄力时间，就等于发球最大蓄力时

//		printf("B# 计算发球速度,参数now_time:"+now_time);
	//	printf("B# 计算发球速度,结果:"+tstatic.sin(1.0 * now_time / FA_QIU_MAX_TIME * PI )*100.0/FA_QIU_CAN_SHU;);
	//	return tstatic.sin(1.0 * tofloat(now_time)/FA_QIU_MAX_TIME * PI )*100.0/FA_QIU_CAN_SHU;
		var MY_XZ = 0 ;
		var HAN_SHU_JIE_GUO_Z = 0;
		var MY_XF = 0;
		var HAN_SHU_JIE_GUO_F = 0;
		
		if ( toint( now_time) <= toint( FA_QIU_MAX_TIME)/2)
		{
			MY_XZ =  1.0 *  now_time / FA_QIU_MAX_TIME ;     //二次函数中的X，当蓄力时间小于满蓄力一半时用
			HAN_SHU_JIE_GUO_Z =  FA_QIU_CAN_SHU * MY_XZ * MY_XZ ;  //函数计算，当蓄力时间小于满蓄力一半时用
			//printf("蓄力条2-1:Fun_ServeSpeed():MY_XZ:"+MY_XZ+",HAN_SHU_JIE_GUO_Z:"+HAN_SHU_JIE_GUO_Z);
			return  HAN_SHU_JIE_GUO_Z;
		}
		else
		{
			MY_XF =  1.0 *  now_time / FA_QIU_MAX_TIME  - 1 ; // 二次函数中的X，当蓄力时间大于满蓄力一半时用
			HAN_SHU_JIE_GUO_F =  FA_QIU_CAN_SHU * MY_XF * MY_XF;  //函数计算，当蓄力时间大于满蓄力一半时用
			//printf("蓄力条2-2:Fun_ServeSpeed():MY_XF:"+MY_XF+",HAN_SHU_JIE_GUO_F:"+HAN_SHU_JIE_GUO_F);
			return  HAN_SHU_JIE_GUO_F;
		}
	}
	


	//[重要标注]2009年4月20日 15:28 yxf 
	//[功能]判断是否为满蓄力(车新游戏中逻辑与yxf界面是统一均调用此函数)
	//[参数]_time:蓄力时间ms
	//[返回值]1满蓄力 0不是满蓄力
	void CheXin_FullServe(_time,rid)			//通过RID知道谁发球满蓄力“自己还是别人”
	{
		Faqiu_qushuxing(rid);
		printf("B# CheXin_FullServe:"+_time);
		window.FA_QIU_MAX_DOWN	 = window.FA_QIU_MAX_TIME / 2 - window.FA_QIU_MAX_FAN_WEI;				   // 发满蓄力球蓄力时间下限值
		window.FA_QIU_MAX_UP	 = window.FA_QIU_MAX_TIME / 2 + window.FA_QIU_MAX_FAN_WEI;				   //发满蓄力球蓄力时间上限值	
		if (toint(_time) > toint(FA_QIU_MAX_TIME))
		{
			_time = FA_QIU_MAX_TIME;
		} // 如果蓄力时间大于发球最大蓄力时间，就等于发球最大蓄力时
		if (toint(_time) <= toint(window.FA_QIU_MAX_UP)  &&  toint(_time) >= toint(window.FA_QIU_MAX_DOWN))
		{
			printf("B# 是满蓄力！");
			return 1;
		}
		else 
		{
			return 0;
		}	
	}
	
	/*此段暂时废弃 2009年4月20日 15:28 yxf
	var g_IsMaxSpeed = 0;	//是否为满蓄力 1是 0不是
	//是否为满蓄力-车新调用
	//参数 param:1是满蓄力 0不是满蓄力
	void SetMaxSpeed(param)
	{
		printf("B# 是否为满蓄力-车新调用(1是满蓄力 0不是满蓄力):SetMaxSpeed："+param);
		g_IsMaxSpeed = param;
	}
	//返回是否为满蓄力-游戏中蓄力条调用
	void GetMaxSpeed()
	{
		return g_IsMaxSpeed;
	}
	*/
}