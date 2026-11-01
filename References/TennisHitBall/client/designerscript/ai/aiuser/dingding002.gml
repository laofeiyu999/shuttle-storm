/********************************************************************
	created:	2009/10/12
	created:	12:10:2009   15:49
	filename: 	F:\tennis1\client\AI\Dingding000.gml
	file base:	Dingding002
	file ext:		.gml
	author:		CheXin
	level:			easy
	purpose:	新手引导AI,降低流失率.
*********************************************************************/

class Sbai002 SMA 
{
	// add by hanshuo
	// 为对象命名, 设置初始化数据库, 设置是否打开日志
	// 介于AI的状态机可能不同, 状态机的初始化也放在这里了
	name = "SMA"; 
	Init("AIEventState.mdb", 2); 		
	UseLog( 1);

	var secondpointZ = 0;
	var secondpointX = 0;
	var userposZ = 0;
	var userposX = 0;
	var otherposZ = 0;
	var otherposX = 0;
	var jiaodianZ = 0;
	var jiaodianX = 0;
	var jiaodianTime = 0;
	var secondposTime = 0;
	var userrunxulitime = 1500.0;    // 跑动到蓄力点时间 与 球到交点时间差 多少以上才向蓄力点跑 单位MS
	var dirxulitimeMAX = 100;   //根据AI难度,方向键蓄力最大时间
	var dirxulitime = 0;  //方向键蓄力时间
	var userruntime = 0;    //人物向蓄力点跑的时间
	var userruntimeputong = 0; //人物向普通点跑的时间
	var hitpoint = 0; // 1:蓄力球   2.普通球    3.打不到 
	var suijizhi = 0 ; //定义的随机值参数
	var lueshifangxiang = 3.0;//对方与中线距离多远时，正手打右、反手打左  
	var daxiaoqiuG = 12.0 ;//对方Z值大小多大时，削球几率高 
	var daxiaoqiuD = 10.0 ;//对方Z值大小多大时，削球几率低
	var dafanggaoG = 1.0  //对方Z值大小多大时，放高几率高
	var dafanggaoD = 2.0  //对方Z值大小多大时，放高几率低
	var feishangxuanG = -1.0; //不打上旋的高概率，主要是高概率用削球
	var feishangxuanD = -1.0; //不打上旋的低概率， 用削球或放高球的低概率
	var pNPCInfo = new NPCInfo(){};
	var runreadyZ = 9.0  //常量：ai击球后准备接下个球的Z坐标
	pNPCInfo.aireadyposX1 = 1.0 ; // 变量：ai击球后准备接下个球的X坐标
	var aireadytime1 = 0.0;   //准备接下个球的跑动时间1
	pNPCInfo.aireadyposX2 = -1.0 ; // 变量：ai击球后准备接下个球的X坐标
	var aireadytime2=  0.0; //准备接下个球的跑动时间2
	pNPCInfo.aireadyposZ =  0.0;// 变量：ai击球后准备接下个球的Z坐标
	pNPCInfo.faqiuxulishijian = 200; //AI发球的蓄力时间
	var easyrundelay = 200.0 //简单AI向落点跑的延迟时间
	var easyhitdelay = 450.0//简单AI击球 如果不用跑的蓄力，且球飞到交点的时间大于这个时间，则延迟easydelay 时间击球
	var easydelay = 0.0 // 简单AI击球延迟时间
	var tstatic = new T_ScriptFun{};			// 随机函数，韩硕修改, 脚本调用的函数写在这里, 脚本的单一模式有问题( 10.26)

	//=============绝对值函数===========================
	void Jueduizhi(canshu)
	{
		if (canshu < 0)
		{
			return canshu * -1;
		}
		else
		{
			return canshu;
		}
	}

	//==============坐标点函数=====================================
	void AllzuobiaoX(x , z)   //人物或击球交点X坐标镜像
	{
		if (z < 0)
		{
			return x ; 
		}	
		else
		{
			return x * -1 ;
		}
	}
	
	//=========================AI跑通常函数=======================================================
	void AI_Runxuli() //水平向有击球交点向可以蓄力的点跑
	{
		parent.find("Action").GetPosInfoToDB(); //获取人物的相关信息
		pNPCInfo.InitMyUserRow();
		userposZ = pNPCInfo.MYUserRow.GetData(window.M_G_CLINET_ALTERNATIONUSER_POSZ);  //自己位置的Z
		userposX = pNPCInfo.MYUserRow.GetData(window.M_G_CLINET_ALTERNATIONUSER_POSX);  //自己位置的X
		
		parent.find("Logic").BestHitBallToDB();//获取击球信息
		jiaodianX = pNPCInfo.NpcAIrow.GetData(window.M_G_CLINET_ALTERNATION_HINTERSECTIONPOINTX);  //轨迹交点的X
		jiaodianTime = pNPCInfo.NpcAIrow.GetData(window.M_G_CLINET_ALTERNATION_GETHINTERSECTIONTIME);  //球到达轨迹交点的时间

		
		var runposRX = 0 ;//当击球点在人右侧时跑向的坐标X		
		var runposLX = 0 ;//当击球点在人左侧时跑向的坐标X
		var runfanwei =  userposX - jiaodianX;   //交点与人物站位X方向的距离

		if (userposZ > 0)//计算AI跑动坐标
		{
			runposRX = jiaodianX + pNPCInfo.xulifanwei;
			runposLX = jiaodianX - pNPCInfo.xulifanwei;
		}
		else//计算AI跑动坐标
		{
			runposRX = jiaodianX - pNPCInfo.xulifanwei;
			runposLX = jiaodianX + pNPCInfo.xulifanwei;
		}

		if (AllzuobiaoX(userposX, userposZ) >=AllzuobiaoX( jiaodianX ,userposZ))
		{ //人物X大，击球点在人物左侧		
			print("CHEXIN=========击球点在人物左侧==");
			if (Jueduizhi(runfanwei) > pNPCInfo.xulifanwei)   //交点和人的距离大于蓄力范围，AI要跑
			{
				print("CHEXIN=========击球点在人物左侧==========AI跑动了");
				print("CHEXIN=========AllzuobiaoX( jiaodianX ,userposZ))==="  +AllzuobiaoX( jiaodianX ,userposZ));
				print("CHEXIN=========userposZ===="  +userposZ);
				print("CHEXIN=========runposLX===="  +runposLX);
				parent.find("SerMGR").MoveTo( runposLX, 0.0, userposZ);
//				parent.find("SerMGR").MoveTo( (userposX + 4.0), 0.0, userposZ);
			}			
			else //否则直接打球
			{
				print("CHEXIN=====击球点在人物左侧===没跑直接打了===");
				if (jiaodianTime > easyhitdelay)
				{
					AI_Hitballlogictranscript();  //调用延迟的AI击球
				}
				else
				{
					AI_Hitballlogic();
				}
				
			}
		}
		if (AllzuobiaoX(userposX, userposZ) < AllzuobiaoX( jiaodianX ,userposZ))
		{//人物X小，击球点在人物右侧
			print("CHEXIN=========击球点在人物右侧==");
			if (Jueduizhi(runfanwei) > pNPCInfo.xulifanwei) //交点和人的距离大于蓄力范围，AI要跑
			{
				print("CHEXIN======击球点在人物右侧==AI跑了===");
				parent.find("SerMGR").MoveTo( runposRX, 0.0, userposZ);
			}		
			else //否则直接打球
			{
				print("CHEXIN=====击球点在人物右侧===没跑直接打了===");
				if (jiaodianTime > easyhitdelay)
				{
					AI_Hitballlogictranscript();  //调用延迟的AI击球
				}
				else
				{
					AI_Hitballlogic();
				}				
			}
		}
	}
	void AI_Runputong()  //水平向有击球交点向普通点跑
	{
		parent.find("Action").GetPosInfoToDB(); //获取人物的相关信息
		pNPCInfo.InitMyUserRow();
		userposZ = pNPCInfo.MYUserRow.GetData(window.M_G_CLINET_ALTERNATIONUSER_POSZ);  //自己位置的Z
		userposX = pNPCInfo.MYUserRow.GetData(window.M_G_CLINET_ALTERNATIONUSER_POSX);  //自己位置的X
		
		parent.find("Logic").BestHitBallToDB();;//获取击球信息
		jiaodianX = pNPCInfo.NpcAIrow.GetData(window.M_G_CLINET_ALTERNATION_HINTERSECTIONPOINTX);  //轨迹交点的X
		jiaodianTime = pNPCInfo.NpcAIrow.GetData(window.M_G_CLINET_ALTERNATION_GETHINTERSECTIONTIME);  //球到达轨迹交点的时间

		var runposRX = 0; //当击球点在人右侧时跑向的坐标X		
		var runposLX = 0;//当击球点在人左侧时跑向的坐标X
		var runfanwei =  userposX - jiaodianX;   //交点与人物站位X方向的距离

		if (userposZ > 0)//计算AI跑动坐标
		{
			runposRX = jiaodianX + pNPCInfo.jieqiufanwei;
			runposLX = jiaodianX - pNPCInfo.jieqiufanwei;
		}
		else//计算AI跑动坐标
		{
			runposRX = jiaodianX - pNPCInfo.jieqiufanwei;
			runposLX = jiaodianX + pNPCInfo.jieqiufanwei;
		}

		if (AllzuobiaoX(userposX, userposZ) >= AllzuobiaoX( jiaodianX ,userposZ))
		{ //人物X大，击球点在人物左侧
			if (Jueduizhi(runfanwei) > pNPCInfo.jieqiufanwei) //交点和人的距离大于接球范围，AI要跑
			{
				print("CHEXIN========= //人物X大，击球点在人物左侧=========AI要跑========");
				parent.find("SerMGR").MoveTo( runposLX, 0.0, userposZ);
			}
			else //否则直接打球
			{
				if (jiaodianTime > easyhitdelay)
				{
					AI_Hitballlogictranscript();  //调用延迟的AI击球
				}
				else
				{
					AI_Hitballlogic();
				}			
				print("CHEXIN========= //人物X大，击球点在人物左侧=========直接击球函数========");
			}
		}
		if (AllzuobiaoX(userposX, userposZ) < AllzuobiaoX( jiaodianX ,userposZ))
		{//人物X小，击球点在人物右侧
			if (Jueduizhi(runfanwei) > pNPCInfo.jieqiufanwei) //交点和人的距离大于接球范围，AI要跑
			{
				print("CHEXIN========= //人物X小，击球点在人物右侧=========AI要跑========");
				parent.find("SerMGR").MoveTo( runposRX, 0.0, userposZ);
			}
			else //否则直接打球
			{
				print("CHEXIN========= //人物X小，击球点在人物右侧=========直接击球函数========");
				if (jiaodianTime > easyhitdelay)
				{
					AI_Hitballlogictranscript();  //调用延迟的AI击球
				}
				else
				{
					AI_Hitballlogic();
				}			
			}
		}
	}

	void AI_Rundabudao()
	{
		parent.find("Action").GetPosInfoToDB(); //获取人物的相关信息
		pNPCInfo.InitMyUserRow();
		userposZ = pNPCInfo.MYUserRow.GetData(window.M_G_CLINET_ALTERNATIONUSER_POSZ);  //自己位置的Z
		userposX = pNPCInfo.MYUserRow.GetData(window.M_G_CLINET_ALTERNATIONUSER_POSX);  //自己位置的X
		
		parent.find("Logic").BestHitBallToDB();;//获取击球信息
		jiaodianX = pNPCInfo.NpcAIrow.GetData(window.M_G_CLINET_ALTERNATION_HINTERSECTIONPOINTX);  //轨迹交点的X
		jiaodianTime = pNPCInfo.NpcAIrow.GetData(window.M_G_CLINET_ALTERNATION_GETHINTERSECTIONTIME);  //球到达轨迹交点的时间

		var runposRX = 0; //当击球点在人右侧时跑向的坐标X		
		var runposLX = 0;//当击球点在人左侧时跑向的坐标X
		var runfanwei =  userposX - jiaodianX;   //交点与人物站位X方向的距离

		if (userposZ > 0)//计算AI跑动坐标
		{
			runposRX = jiaodianX + pNPCInfo.jieqiufanwei;
			runposLX = jiaodianX - pNPCInfo.jieqiufanwei;
		}
		else//计算AI跑动坐标
		{
			runposRX = jiaodianX - pNPCInfo.jieqiufanwei;
			runposLX = jiaodianX + pNPCInfo.jieqiufanwei;
		}

		if (AllzuobiaoX(userposX, userposZ) >= AllzuobiaoX( jiaodianX ,userposZ))
		{ //人物X大，击球点在人物左侧
			if (Jueduizhi(runfanwei) > pNPCInfo.jieqiufanwei) //交点和人的距离大于接球范围，AI要跑
			{
				print("CHEXIN========= //人物X大，击球点在人物左侧=========AI要跑但打不到========");
				parent.find("SerMGR").MoveTo( runposLX, 0.0, userposZ , jiaodianTime);
			}
			else //否则直接打球
			{
				print("CHEXIN========= //人物X大，击球点在人物左侧=========直接击球函数========");
				if (jiaodianTime > easyhitdelay)
				{
					AI_Hitballlogictranscript();  //调用延迟的AI击球
				}
				else
				{
					AI_Hitballlogic();
				}			
			}
		}
		if (AllzuobiaoX(userposX, userposZ) < AllzuobiaoX( jiaodianX ,userposZ))
		{//人物X小，击球点在人物右侧
			if (Jueduizhi(runfanwei) > pNPCInfo.jieqiufanwei) //交点和人的距离大于接球范围，AI要跑
			{
				print("CHEXIN========= //人物X小，击球点在人物右侧=========AI要跑但打不到========");
				parent.find("SerMGR").MoveTo( runposRX, 0.0, userposZ , jiaodianTime);
			}
			else //否则直接打球
			{
				print("CHEXIN========= //人物X小，击球点在人物右侧=========直接击球函数========");
				if (jiaodianTime > easyhitdelay)
				{
					AI_Hitballlogictranscript();  //调用延迟的AI击球
				}
				else
				{
					AI_Hitballlogic();
				}			
			}
		}	
	}

	void AI_Runready() //AI击球后，向准备接下个球的坐标跑的函数
	{
//		alert("AI_Runready");
		parent.find("Action").GetPosInfoToDB(); //获取人物的相关信息
		pNPCInfo.InitMyUserRow();
		userposZ = pNPCInfo.MYUserRow.GetData(window.M_G_CLINET_ALTERNATIONUSER_POSZ);  //自己位置的Z
		userposX =  pNPCInfo.MYUserRow.GetData(window.M_G_CLINET_ALTERNATIONUSER_POSX);  //自己位置的	X	
		aireadytime1	= parent.find("SerMGR").GetMoveTime( userposX, userposZ, pNPCInfo.aireadyposX1, pNPCInfo.aireadyposZ);
		aireadytime2 = parent.find("SerMGR").GetMoveTime( userposX, userposZ, pNPCInfo.aireadyposX2, pNPCInfo.aireadyposZ);
		if (userposZ < 0)
		{
			pNPCInfo.aireadyposZ = -1 * runreadyZ;
		}
		else
		{
			pNPCInfo.aireadyposZ =  runreadyZ;
		}
		print("CHEXIN===AI_Runready==AI_Runready==AI_Runready=AI_Runready=!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" );
		print("CHEXIN=========userposZ===="  +userposZ);
		print("CHEXIN=========pNPCInfo.aireadyposX===="  +pNPCInfo.aireadyposX);
		print("CHEXIN=========pNPCInfo.aireadyposX1===="  +pNPCInfo.aireadyposX1);
		print("CHEXIN=========pNPCInfo.aireadyposX2===="  +pNPCInfo.aireadyposX2);
		print("CHEXIN=========pNPCInfo.aireadyposZ===="  +pNPCInfo.aireadyposZ);
		print("CHEXIN=========aireadytime1===="  +aireadytime1);
		print("CHEXIN=========aireadytime2===="  +aireadytime2);
		print("CHEXIN===AI_Runready==AI_Runready==AI_Runready=AI_Runready=!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" );
		if (userposX <= 0 )
		{
			parent.find("SerMGR").MoveTo( pNPCInfo.aireadyposX1, 0.0, pNPCInfo.aireadyposZ,aireadytime1);
		}
		else  
		{
			parent.find("SerMGR").MoveTo( pNPCInfo.aireadyposX2, 0.0, pNPCInfo.aireadyposZ,aireadytime2);
		}		
	}
//===============下面是水平向无交点（削球）时的AI跑动函数======================================================
	void AI_XIAORunxuli() //向可以蓄力的点跑
	{
		parent.parent.find("GCBall").find("TRACKMGR").GetTrackInfoToDB();//获取轨迹信息
		secondpointZ = pNPCInfo.NpcAIrow.GetData(window.M_G_CLINET_ALTERNATION_SECONDDROPPOINTZ);  //第二落点的Z
		secondpointX = pNPCInfo.NpcAIrow.GetData(window.M_G_CLINET_ALTERNATION_SECONDDROPPOINTX);  //第二落点的X
		
		parent.find("Action").GetPosInfoToDB(); //获取人物的相关信息
		pNPCInfo.InitMyUserRow();
		userposZ = pNPCInfo.MYUserRow.GetData(window.M_G_CLINET_ALTERNATIONUSER_POSZ);  //自己位置的Z
		userposX = pNPCInfo.MYUserRow.GetData(window.M_G_CLINET_ALTERNATIONUSER_POSX);  //自己位置的X
			
		var runposRX = 0 ;//当击球点在人右侧时跑向的坐标X		
		var runposLX = 0 ;//当击球点在人左侧时跑向的坐标X

		if (userposZ > 0)//计算AI跑动坐标
		{
			runposRX = secondpointX + pNPCInfo.xulifanwei;
			runposLX = secondpointX - pNPCInfo.xulifanwei;
		}
		else//计算AI跑动坐标
		{
			runposRX = secondpointX - pNPCInfo.xulifanwei;
			runposLX = secondpointX + pNPCInfo.xulifanwei;
		}

		if (AllzuobiaoX(userposX, userposZ) >=AllzuobiaoX( secondpointX ,secondpointZ))
		{ //人物X大，击球点在人物左侧
			print("CHEXIN=========AllzuobiaoX(userposX, userposZ)==="  +AllzuobiaoX(userposX, secondpointZ));
			print("CHEXIN=========AllzuobiaoX( secondpointX ,userposZ))==="  +AllzuobiaoX( secondpointX ,secondpointZ));
			print("CHEXIN=========userposZ===="  +userposZ);
			parent.find("SerMGR").MoveTo( runposLX, 0.0, secondpointZ);
		}
		if (AllzuobiaoX(userposX, userposZ) < AllzuobiaoX( secondpointX ,secondpointZ))
		{//人物X小，击球点在人物右侧
			parent.find("SerMGR").MoveTo( runposRX, 0.0, secondpointZ);
		}
	}

	void AI_XIAORunputong() //向普通点跑
	{
		parent.parent.find("GCBall").find("TRACKMGR").GetTrackInfoToDB();//获取轨迹信息
		secondpointZ = pNPCInfo.NpcAIrow.GetData(window.M_G_CLINET_ALTERNATION_SECONDDROPPOINTZ);  //第二落点的Z
		secondpointX = pNPCInfo.NpcAIrow.GetData(window.M_G_CLINET_ALTERNATION_SECONDDROPPOINTX);  //第二落点的X
		
		parent.find("Action").GetPosInfoToDB(); //获取人物的相关信息
		pNPCInfo.InitMyUserRow();
		userposZ = pNPCInfo.MYUserRow.GetData(window.M_G_CLINET_ALTERNATIONUSER_POSZ);  //自己位置的Z
		userposX = pNPCInfo.MYUserRow.GetData(window.M_G_CLINET_ALTERNATIONUSER_POSX);  //自己位置的X
			
		var runposRX = 0 ;//当击球点在人右侧时跑向的坐标X		
		var runposLX = 0 ;//当击球点在人左侧时跑向的坐标X

		if (userposZ > 0)//计算AI跑动坐标
		{
			runposRX = secondpointX + pNPCInfo.jieqiufanwei;
			runposLX = secondpointX - pNPCInfo.jieqiufanwei;
		}
		else//计算AI跑动坐标
		{
			runposRX = secondpointX - pNPCInfo.jieqiufanwei;
			runposLX = secondpointX + pNPCInfo.jieqiufanwei;
		}

		if (AllzuobiaoX(userposX, userposZ) >=AllzuobiaoX( secondpointX ,secondpointZ))
		{ //人物X大，击球点在人物左侧
			print("CHEXIN=========AllzuobiaoX(userposX, userposZ)==="  +AllzuobiaoX(userposX, secondpointZ));
			print("CHEXIN=========AllzuobiaoX( secondpointX ,userposZ))==="  +AllzuobiaoX( secondpointX ,secondpointZ));
			print("CHEXIN=========userposZ===="  +userposZ);
			parent.find("SerMGR").MoveTo( runposLX, 0.0, secondpointZ);
		}
		if (AllzuobiaoX(userposX, userposZ) < AllzuobiaoX( secondpointX ,secondpointZ))
		{//人物X小，击球点在人物右侧
			parent.find("SerMGR").MoveTo( runposRX, 0.0, secondpointZ);
		}
	}

	void AI_XIAORundabudao()
	{
		parent.parent.find("GCBall").find("TRACKMGR").GetTrackInfoToDB();//获取轨迹信息
		secondposTime = pNPCInfo.NpcAIrow.GetData(window.M_G_CLINET_ALTERNATION_GETSECONDDROPPOINTTIME);//球到达第二落点的时间
		secondpointZ = pNPCInfo.NpcAIrow.GetData(window.M_G_CLINET_ALTERNATION_SECONDDROPPOINTZ);  //第二落点的Z
		secondpointX = pNPCInfo.NpcAIrow.GetData(window.M_G_CLINET_ALTERNATION_SECONDDROPPOINTX);  //第二落点的X

		parent.find("Action").GetPosInfoToDB(); //获取人物的相关信息
		pNPCInfo.InitMyUserRow();
		userposZ = pNPCInfo.MYUserRow.GetData(window.M_G_CLINET_ALTERNATIONUSER_POSZ);  //自己位置的Z
		userposX = pNPCInfo.MYUserRow.GetData(window.M_G_CLINET_ALTERNATIONUSER_POSX);  //自己位置的X
		
		parent.find("Logic").BestHitBallToDB();;//获取击球信息
//		jiaodianX = pNPCInfo.NpcAIrow.GetData(window.M_G_CLINET_ALTERNATION_HINTERSECTIONPOINTX);  //轨迹交点的X
//		jiaodianTime = pNPCInfo.NpcAIrow.GetData(window.M_G_CLINET_ALTERNATION_GETHINTERSECTIONTIME);  //球到达轨迹交点的时间

		var runposRX = 0; //当击球点在人右侧时跑向的坐标X		
		var runposLX = 0;//当击球点在人左侧时跑向的坐标X
		var runfanwei =  userposX - jiaodianX;   //交点与人物站位X方向的距离

		if (userposZ > 0)//计算AI跑动坐标
		{
			runposRX = secondpointX + pNPCInfo.jieqiufanwei;
			runposLX = secondpointX - pNPCInfo.jieqiufanwei;
		}
		else//计算AI跑动坐标
		{
			runposRX = secondpointX - pNPCInfo.jieqiufanwei;
			runposLX = secondpointX + pNPCInfo.jieqiufanwei;
		}

		if (AllzuobiaoX(userposX, userposZ) >= AllzuobiaoX( secondpointX ,secondpointZ))
		{ //人物X大，击球点在人物左侧
			if (Jueduizhi(runfanwei) >= pNPCInfo.jieqiufanwei) //交点和人的距离大于接球范围，AI要跑
			{
				print("CHEXIN========= //人物X大，击球点在人物左侧=========AI要跑但打不到========");
				parent.find("SerMGR").MoveTo( runposLX, 0.0, secondpointZ , secondposTime);
			}
			else //否则直接打球
			{
				print("CHEXIN========= //人物X大，击球点在人物左侧=========直接击球函数========");
				AI_Hitballlogic();
			}
		}
		if (AllzuobiaoX(userposX, userposZ) < AllzuobiaoX( secondpointX ,secondpointZ))
		{//人物X小，击球点在人物右侧
			if (Jueduizhi(runfanwei) >= pNPCInfo.jieqiufanwei) //交点和人的距离大于接球范围，AI要跑
			{
				print("CHEXIN========= //人物X小，击球点在人物右侧=========AI要跑但打不到========");
				parent.find("SerMGR").MoveTo( runposRX, 0.0, userposZ , secondposTime);
			}
			else //否则直接打球
			{
				print("CHEXIN========= //人物X小，击球点在人物右侧=========直接击球函数========");
				AI_Hitballlogic();
			}
		}
	
	}
//==============================//下面是计算人物向什么点跑，跑多长时间的函数=========================================================
	void User_runtime(run_fan_wei , run_pos_xuli_RL , run_pos_putong_RL , run_pos_Z) //计算人物向什么点跑，跑多长时间的函数
	{
		if (Jueduizhi(run_fan_wei) <= pNPCInfo.xulifanwei) //交点和人的距离小于蓄力范围，跑蓄力时间为0
		{
			userruntime = 0;
			userruntimeputong =  parent.find("SerMGR").GetMoveTime( userposX, userposZ, run_pos_putong_RL, run_pos_Z);
		}
		if (pNPCInfo.xulifanwei < Jueduizhi(run_fan_wei) <= pNPCInfo.jieqiufanwei)//交点和人的距离大于蓄力范围小于普通范围，跑普通时间为0
		{
			userruntime =  parent.find("SerMGR").GetMoveTime( userposX, userposZ, run_pos_xuli_RL, run_pos_Z);
			userruntimeputong = 0;
		}
		if (Jueduizhi(run_fan_wei) > pNPCInfo.jieqiufanwei )//交点和人的距离大于普通范围，AI肯定跑
		{
			userruntime =  parent.find("SerMGR").GetMoveTime( userposX, userposZ, run_pos_xuli_RL, run_pos_Z);
			userruntimeputong =  parent.find("SerMGR").GetMoveTime( userposX, userposZ, run_pos_putong_RL, run_pos_Z);
		}
	}

//=============================下面是人物向蓄力点跑还是向普通点跑的函数===========================================
	void User_howrun(secondpoint) //人物调用什么函数，向什么点跑的函数
	{
		print("CHEXIN=secondpoint========"  + secondpoint);
		if (secondpoint == 1)
		{
			if (jiaodianTime > userruntime  + userrunxulitime) //向蓄力点跑来得及，的人先到，比球快
			{
				print("CHEXIN=====AI_Runxuli====");
				hitpoint = 1;
				AI_Runxuli();
			}
			if (userruntimeputong <= jiaodianTime  && jiaodianTime <= userruntime + userrunxulitime) //跑不到蓄力点，但可以跑到普通点。
			{
				print("CHEXIN=====AI_Runputong====");
				hitpoint = 2;
				if (jiaodianTime > userruntimeputong + easyrundelay)
				{
					AI_Runputongtransprit() ;  //延迟跑动函数
				}
				else 
				{
					AI_Runputong();
				}
			}
			if (userruntimeputong > jiaodianTime &&  userruntime  + userrunxulitime >  jiaodianTime) //跑不到普通点，球比人快，打不到球
			{
				print("CHEXIN=====AI_Rundabudao====");
				hitpoint = 3;
				AI_Rundabudao();
			}
		}
		else
		{
			if (jiaodianTime > userruntime + userrunxulitime) //向蓄力点跑的人先到，比球快
			{
				print("CHEXIN=前侧====AI_XIAORunxuli();====");
				hitpoint = 1;
				AI_XIAORunxuli();
			}
			if (userruntimeputong <= jiaodianTime  && jiaodianTime <= userruntime + userrunxulitime) //跑不到蓄力点，但可以跑到普通点。
			{
				print("CHEXIN=前侧====AI_XIAORunputong() ;====");
				hitpoint = 2;
				if (jiaodianTime > userruntimeputong + easyrundelay)
				{
					AI_XIAORunputongtransprit() ;  //延迟跑动函数
				}
				else 
				{
					AI_XIAORunputong();
				}
			}
			if (userruntimeputong > jiaodianTime &&  userruntime + userrunxulitime >  jiaodianTime) //跑不到普通点，球比人快，打不到球
			{
				print("CHEXIN=前侧====AI_Rundabudao====");
				hitpoint = 3;
				AI_XIAORundabudao();
			}		
		}		
	}


	//============================//下面是AI为了接球跑动函数========================================================
	void AI_Runputongtransprit()
	{
		timer(easyrundelay,"AI_Runputong");	
	}
	void AI_XIAORunputongtransprit()
	{
		timer(easyrundelay,"AI_XIAORunputong");
	}
	
	void AI_Runlogic() //AI为了接球跑动函数   //暂时缺少打不到球时的跑动10.15
	{
		print("CHEXIN=======#########################################################===========");
//		alert("AI_Runlogic");
		parent.parent.find("GCBall").find("TRACKMGR").GetTrackInfoToDB();//获取轨迹信息
		secondpointZ = pNPCInfo.NpcAIrow.GetData(window.M_G_CLINET_ALTERNATION_SECONDDROPPOINTZ);  //第二落点的Z
		secondpointX = pNPCInfo.NpcAIrow.GetData(window.M_G_CLINET_ALTERNATION_SECONDDROPPOINTX);  //第二落点的X
		
		
		parent.find("Action").GetPosInfoToDB(); //获取人物的相关信息
		pNPCInfo.InitMyUserRow();
		userposZ = pNPCInfo.MYUserRow.GetData(window.M_G_CLINET_ALTERNATIONUSER_POSZ);  //自己位置的Z
		userposX = pNPCInfo.MYUserRow.GetData(window.M_G_CLINET_ALTERNATIONUSER_POSX);  //自己位置的X

		parent.find("Logic").BestHitBallToDB();//获取击球信息

		jiaodianX = pNPCInfo.NpcAIrow.GetData(window.M_G_CLINET_ALTERNATION_HINTERSECTIONPOINTX);  //轨迹交点的X
		jiaodianTime = pNPCInfo.NpcAIrow.GetData(window.M_G_CLINET_ALTERNATION_GETHINTERSECTIONTIME);  //球到达轨迹交点的时间
		print("CHEXIN===jiaodianTime===" + jiaodianTime);
		var runposRX = 0.0;
		var runposLX = 0.0;
		var runposputongLX = 0.0;
		var runposputongRX = 0.0;
		var runfanwei =  userposX - jiaodianX;   //交点与人物站位X方向的距离
		
		if (userposZ > 0)//计算AI跑动坐标
		{
			runposRX = jiaodianX + pNPCInfo.xulifanwei;
			runposLX = jiaodianX - pNPCInfo.xulifanwei;
			runposputongRX = jiaodianX + pNPCInfo.jieqiufanwei ;
			runposputongLX = jiaodianX - pNPCInfo.jieqiufanwei ;
		}
		else//计算AI跑动坐标
		{
			runposRX = jiaodianX - pNPCInfo.xulifanwei;
			runposLX = jiaodianX + pNPCInfo.xulifanwei;
			runposputongRX = jiaodianX - pNPCInfo.jieqiufanwei ;
			runposputongLX = jiaodianX + pNPCInfo.jieqiufanwei ;
		}

		print("CHEXIN======userposX==="+userposX);
		print("CHEXIN======jiaodianTime==="+jiaodianTime);
		print("CHEXIN======jiaodianX==="+jiaodianX);
		print("CHEXIN======runposRX==="+runposRX);
		print("CHEXIN======runposLX==="+runposLX);
		print("CHEXIN======runposputongRX==="+runposputongRX);
		print("CHEXIN======runposputongLX==="+runposputongLX);
		print("CHEXIN==secondpointZ===secondpointZ===="+secondpointZ);
		print("CHEXIN==userPosZ===userPosZ===="+userPosZ);
		

		if (Jueduizhi( secondpointZ) > Jueduizhi( userPosZ) )
		{	// 第二落点在我之后
			print("CHEXIN==第二落点在我之后===");
			if (AllzuobiaoX(userposX, userposZ) >= AllzuobiaoX(jiaodianX, userposZ))
			{ //人物X大，击球点在人物左侧
				User_runtime(runfanwei , runposLX , runposputongLX , userposZ);  //计算 userruntime  userruntimeputong 的函数				
				print("CHEXIN==击球点在人物左侧===jiaodianTime===="+jiaodianTime);
				print("CHEXIN=击球点在人物左侧====userruntime===="+userruntime);
				print("CHEXIN=击球点在人物左侧====userruntimeputong===="+userruntimeputong);
				User_howrun(1);
			}
			if (AllzuobiaoX(userposX, userposZ) < AllzuobiaoX(jiaodianX, userposZ))
			{//人物X小，击球点在人物右侧
				User_runtime(runfanwei , runposRX , runposputongRX , userposZ);  //计算 userruntime  userruntimeputong 的函数				
				print("CHEXIN==击球点在人物右侧===jiaodianTime===="+jiaodianTime);
				print("CHEXIN==击球点在人物右侧===userruntime===="+userruntime);
				print("CHEXIN=击球点在人物右侧====userruntimeputong===="+userruntimeputong);
				User_howrun(1);
			}			
		}
		else
		{	// 第二落点在我之前
			print("CHEXIN==第二落点在我之前===");
			if (AllzuobiaoX(userposX, userposZ) >= AllzuobiaoX(jiaodianX, userposZ))
			{ //人物X大，击球点在人物左前侧
				User_runtime(runfanwei , runposLX , runposputongLX , secondpointZ);  //计算 userruntime  userruntimeputong 的函数								
				print("CHEXIN==击球点在人物左前侧===jiaodianTime===="+jiaodianTime);
				print("CHEXIN=击球点在人物左前侧====userruntime===="+userruntime);
				print("CHEXIN=击球点在人物左前侧====userruntimeputong===="+userruntimeputong);
				User_howrun(2);
			}
			if (AllzuobiaoX(userposX, userposZ) < AllzuobiaoX(jiaodianX, userposZ))
			{//人物X小，击球点在人物右前侧
				User_runtime(runfanwei , runposRX , runposputongRX , secondpointZ);  //计算 userruntime  userruntimeputong 的函数								
				print("CHEXIN==击球点在人物右前侧===jiaodianTime===="+jiaodianTime);
				print("CHEXIN==击球点在人物右前侧===userruntime===="+userruntime);
				print("CHEXIN==击球点在人物右前侧====userruntimeputong===="+userruntimeputong);
				User_howrun(2);
			}						
		}
		print("CHEXIN=======###################################################===========");
	}

	void AI_runover()   //移动结束
	{
		print("CHEXIN=====AI_runover=====");
		parent.find("SerMGR").StopMove(); 
	//	parent.find("SimKey").ClearKey();
	}
	void AI_clearkey()
	{
		parent.find("SimKey").ClearKey();
	}
	//===========================下面是击球===================================================================
	void AI_Hitballlogictranscript()
	{
		AI_clearkey();
		easydelay = jiaodianTime - easyhitdelay ;   // easyhitdelay是期望的简单AI最大击球蓄力时间，如果球到交点时间过长则延迟击球
		print("CHEXIN=======延迟延迟延迟延迟延迟延迟延迟延迟延迟延迟延迟延迟===========");
		print("CHEXIN===easyhitdelay=="+easyhitdelay);
		print("CHEXIN===easydelay=="+easydelay);
		timer(easydelay,"AI_Hitballlogic");
	}

	void AI_Hitballlogic()  //AI击球函数
	{			
		parent.find("SerMGR").StopMove();  //停止移动
		parent.parent.find("GCBall").find("TRACKMGR").GetTrackInfoToDB();//获取轨迹信息
		secondpointZ = pNPCInfo.NpcAIrow.GetData(window.M_G_CLINET_ALTERNATION_SECONDDROPPOINTZ);  //第二落点的Z
		secondpointX = pNPCInfo.NpcAIrow.GetData(window.M_G_CLINET_ALTERNATION_SECONDDROPPOINTX);  //第二落点的X
		
		parent.find("Action").GetPosInfoToDB(); //获取人物的相关信息		
		pNPCInfo.InitMyUserRow();
		userposZ = pNPCInfo.MYUserRow.GetData(window.M_G_CLINET_ALTERNATIONUSER_POSZ);  //自己位置的Z
		userposX = pNPCInfo.MYUserRow.GetData(window.M_G_CLINET_ALTERNATIONUSER_POSX);  //自己位置的X
		
		pNPCInfo.InitOtherPlayerUserRow();
		parent.parent.FindGameBodyByUserID( pNPCInfo.OtherUserRow.GetData(window.M_G_CLINET_ALTERNATIONUSER_ID)).find("Action").GetPosInfoToDB();
		otherposZ = pNPCInfo.OtherUserRow.GetData(window.M_G_CLINET_ALTERNATIONUSER_POSZ);  //对手位置的Z
		otherposX = pNPCInfo.OtherUserRow.GetData(window.M_G_CLINET_ALTERNATIONUSER_POSX);  //对手位置的X

		parent.find("Logic").BestHitBallToDB();//获取击球信息
		jiaodianX = pNPCInfo.NpcAIrow.GetData(window.M_G_CLINET_ALTERNATION_HINTERSECTIONPOINTX);  //轨迹交点的X
		jiaodianTime = pNPCInfo.NpcAIrow.GetData(window.M_G_CLINET_ALTERNATION_GETHINTERSECTIONTIME);  //球到达轨迹交点的时间
		var runfanwei =  userposX - jiaodianX;   //交点与人物站位X方向的距离
		dirxulitime = jiaodianTime  ;   //方向键蓄力时间与球到交点时间相同
		print("CHEXIN=击球函数==dirxulitime===" + dirxulitime);
		if (dirxulitime < 0)
		{
			dirxulitime = 0;
		}
		if (dirxulitime > dirxulitimeMAX)
		{   //不同AI难度下需要的方向键最大蓄力时间
			dirxulitime= dirxulitimeMAX;
		}
		suijizhi = tstatic.rand(100);  //随机值函数

		print("CHEXIN=击球函数==jiaodianTime===" + jiaodianTime);
		print("CHEXIN=击球函数==userposX===" + userposX);
		print("CHEXIN=击球函数==userposZ===" + userposZ);
		print("CHEXIN=击球函数==jiaodianX===" + jiaodianX);
		print("CHEXIN=击球函数==runfanwei===" + runfanwei);
//==========================判断怎么打		
		if (AllzuobiaoX(userposX, userposZ) >= AllzuobiaoX(jiaodianX, userposZ))     //调用击球函数AI_Hitballlogic时已经跑完，所以方向蓄力时间 = 球飞到交点的时间
		{ //人物X大，击球点在人物左侧	
			
			if (AllzuobiaoX(userposX, userposZ) < AllzuobiaoX(otherposX, userposZ) && Jueduizhi(otherposX) >= lueshifangxiang) 
			{ //AI人物X小，对方在右侧	 且 对方里中线距离太远，需要打非擅长方向，
//				alert("AI人物X小，对方在右侧	 且 对方里中线距离大于3");
				if (Jueduizhi(otherposZ) < dafanggaoD)
				{ //距离中心线Z值小于放高低概率位置
					if (Jueduizhi(otherposZ) <= dafanggaoG)
					{ // Z值小于放高高概率位置
							AN_gezhongdaqiu(3) ;//左放高球按键
					}
					else
					{ //Z值在低概率放高 高概率放高 之间
						if (suijizhi <= feishangxuanD)
						{
							AN_gezhongdaqiu(3) ;//左放高球按键
						}
						else
						{
							AN_gezhongdaqiu(1) ;//左上旋球按键
						}
					}					
				}
				else
				{ //对方不靠前场
					if (daxiaoqiuG >= Jueduizhi(otherposZ) &&  Jueduizhi(otherposZ) > daxiaoqiuD)
					{  //低概率削球满足
						if ( suijizhi <= feishangxuanD)
						{//随机打削球
							AN_gezhongdaqiu(5) ;//左削球按键
						}
						else
						{
							AN_gezhongdaqiu(1);  //左上旋按键
						}
					}
					if (Jueduizhi(otherposZ) > daxiaoqiuG)
					{ //高概率削球满足
						if (suijizhi <= feishangxuanG)
						{//随机打削球
							AN_gezhongdaqiu(5);//左削球按键
						}
						else
						{
							AN_gezhongdaqiu(1);  //左上旋按键
						}
					}
					if (Jueduizhi(otherposZ) <= daxiaoqiuD)
					{ //不在打削球位置时打上旋
						AN_gezhongdaqiu(1);  //左上旋按键
					}					
				}				
			}
			else
			{ //打擅长方向
				if (Jueduizhi(otherposZ) < dafanggaoD)
				{ //距离中心线Z值小于放高低概率位置
					if (Jueduizhi(otherposZ) <= dafanggaoG)
					{ // Z值小于放高高概率位置
							AN_gezhongdaqiu(4) ;//右放高球按键
					}
					else
					{ //Z值在低概率放高 高概率放高 之间
						if (suijizhi <= feishangxuanD)
						{
							AN_gezhongdaqiu(4) ;//右放高球按键
						}
						else
						{
							AN_gezhongdaqiu(2) ;//右上旋球按键
						}
					}					
				}
				else
				{ //对方不靠前场
					if (daxiaoqiuG >= Jueduizhi(otherposZ) &&  Jueduizhi(otherposZ) > daxiaoqiuD)
					{  //低概率削球满足
						if ( suijizhi <= feishangxuanD)
						{//随机打削球
							AN_gezhongdaqiu(6) ;//右削球按键
						}
						else
						{
							AN_gezhongdaqiu(2);  //右上旋按键
						}
					}
					if (Jueduizhi(otherposZ) > daxiaoqiuG)
					{ //高概率削球满足
						if (suijizhi <= feishangxuanG)
						{//随机打削球
							AN_gezhongdaqiu(6);//右削球按键
						}
						else
						{
							AN_gezhongdaqiu(2);  //右上旋按键
						}
					}
					if (Jueduizhi(otherposZ) <= daxiaoqiuD)
					{ //不在打削球位置时打上旋
						AN_gezhongdaqiu(2);  //右上旋按键
					}					
				}				
			}
		}
		else
		{//人物X小，击球点在人物右侧	
			if (AllzuobiaoX(userposX, userposZ) > AllzuobiaoX(otherposX, userposZ) && Jueduizhi(otherposX) >= lueshifangxiang)
			{//AI人物X大，对方在左侧	 且 对方里中线距离大于3 对方在擅长方向等着 ，那就打不擅长方向
//				alert("AI人物X大，对方在左侧	 且 对方里中线距离大于3");
				if (Jueduizhi(otherposZ) < dafanggaoD)
				{ //距离中心线Z值小于放高低概率位置
					if (Jueduizhi(otherposZ) <= dafanggaoG)
					{ // Z值小于放高高概率位置
							AN_gezhongdaqiu(4) ;//右放高球按键
					}
					else
					{ //Z值在低概率放高 高概率放高 之间
						if (suijizhi <= feishangxuanD)
						{
							AN_gezhongdaqiu(4) ;//右放高球按键
						}
						else
						{
							AN_gezhongdaqiu(2) ;//右上旋球按键
						}
					}					
				}
				else
				{ //对方不靠前场
					if (daxiaoqiuG >= Jueduizhi(otherposZ) &&  Jueduizhi(otherposZ) > daxiaoqiuD)
					{  //低概率削球满足
						if ( suijizhi <= feishangxuanD)
						{//随机打削球
							AN_gezhongdaqiu(6) ;//右削球按键
						}
						else
						{
							AN_gezhongdaqiu(2);  //右上旋按键
						}
					}
					if (Jueduizhi(otherposZ) > daxiaoqiuG)
					{ //高概率削球满足
						if (suijizhi <= feishangxuanG)
						{//随机打削球
							AN_gezhongdaqiu(6);//右削球按键
						}
						else
						{
							AN_gezhongdaqiu(2);  //右上旋按键
						}
					}
					if (Jueduizhi(otherposZ) <= daxiaoqiuD)
					{ //不在打削球位置时打上旋
						AN_gezhongdaqiu(2);  //右上旋按键
					}					
				}				
			}
			else
			{ // 打擅长方向（正手向左、反手向右）				
				if (Jueduizhi(otherposZ) < dafanggaoD)
				{ //距离中心线Z值小于放高低概率位置				
					if (Jueduizhi(otherposZ) <= dafanggaoG)
					{ // Z值小于放高高概率位置
							AN_gezhongdaqiu(3) ;//左放高球按键
					}
					else
					{ //Z值在低概率放高 高概率放高 之间
						if (suijizhi <= feishangxuanD)
						{
							AN_gezhongdaqiu(3) ;//左放高球按键
						}
						else
						{
							AN_gezhongdaqiu(1) ;//左上旋球按键
						}
					}					
				}
				else
				{ //对方不靠前场				
					if (daxiaoqiuG >= Jueduizhi(otherposZ) &&  Jueduizhi(otherposZ) > daxiaoqiuD)
					{  //低概率削球满足
						if ( suijizhi <= feishangxuanD)
						{//随机打削球
							AN_gezhongdaqiu(5) ;//左削球按键
						}
						else
						{
							AN_gezhongdaqiu(1);  //左上旋按键
						}
					}
					if (Jueduizhi(otherposZ) > daxiaoqiuG)
					{ //高概率削球满足
						if (suijizhi <= feishangxuanG)
						{//随机打削球
							AN_gezhongdaqiu(5);//左削球按键
						}
						else
						{
							AN_gezhongdaqiu(1);  //左上旋按键
						}
					}
					if (Jueduizhi(otherposZ) <= daxiaoqiuD)
					{ //不在打削球位置时打上旋
						AN_gezhongdaqiu(1);  //左上旋按键
					}					
				}				
			}
		}
	//==========================判断怎么打	
		print("CHEXIN===userposX===" + userposX);
		print("CHEXIN===dafanggaoD===" + dafanggaoD);
		print("CHEXIN===otherposZ===" + otherposZ);
		print("CHEXIN===otherposX===" + otherposX);
		print("CHEXIN===jiaodianTime===" + jiaodianTime);
		print("CHEXIN===dirxulitime===" + dirxulitime);
		print("CHEXIN=========secondpointZ "  +secondpointZ);
		print("CHEXIN=========pNPCInfo.xulifanwei "  +pNPCInfo.xulifanwei);
	}

	void AN_gezhongdaqiu(lexing)
	{
		print("CHEXIN=========AN_gezhongdaqiu啊啊啊啊啊啊 啊啊啊啊啊啊啊啊啊啊 " );
		print("CHEXIN=========dirxulitime "  +dirxulitime);
		if (lexing == 1)
		{ //向左上旋按键
			parent.find("SimKey").KeyUpAfterUpdate( 4);//按J键
			parent.find("SimKey").KeyUpAfterUpdate( 2,dirxulitime);//向左打
		}
		if (lexing == 2)
		{ //向右上旋按键
			parent.find("SimKey").KeyUpAfterUpdate( 4);//按J键
			parent.find("SimKey").KeyUpAfterUpdate( 3,dirxulitime);//向右打
		}
		if (lexing == 3)
		{//向左放高按键
			parent.find("SimKey").KeyUpAfterUpdate( 5);//按K键
			parent.find("SimKey").KeyUpAfterUpdate( 2,dirxulitime);//向左打
			parent.find("SimKey").KeyUpAfterUpdate( 0,dirxulitime);//向上打
		}
		if (lexing == 4)
		{//向右放高按键
			parent.find("SimKey").KeyUpAfterUpdate( 5);//按K键
			parent.find("SimKey").KeyUpAfterUpdate( 3, dirxulitime);//向右打
			parent.find("SimKey").KeyUpAfterUpdate( 0, dirxulitime);//向上打
		}
		if (lexing == 5)
		{//向左削球按键
			parent.find("SimKey").KeyUpAfterUpdate( 1, dirxulitime);//向下打						
			parent.find("SimKey").KeyUpAfterUpdate( 5);//按K键
			parent.find("SimKey").KeyUpAfterUpdate( 2, dirxulitime);//向左打
		}
		if (lexing == 6)
		{//向右削球按键
			parent.find("SimKey").KeyUpAfterUpdate( 1,dirxulitime);//向下打						
			parent.find("SimKey").KeyUpAfterUpdate( 5);//按K键
			parent.find("SimKey").KeyUpAfterUpdate( 3, dirxulitime);//向右打
		}
	}

	void AN_Janjian()  // 按下J键的函数
	{
		parent.find("SimKey").KeyUpAfterUpdate( 4);
	}
	void AI_faqiuzhuangtai()  //返回在发球状态下，AI是发球状态 还是 接发球状态 的函数
	{
		var userRow = new VNet2DBRow
		{
			InitByInt(window.M_G_SERVER, window.USERDT, window.M_G_SERVER_USERDT_UID, parent.parent.find("AIController").GetUserID()/*被查询方的UserID, AIController提供*/);
		}
		var AIfaqiustate = userRow.GetData( window.M_G_SERVER_USERDT_RULETYPE);//AI在发球状态时的状态（0.发球方 1.接球方 2.发球方队友 3接球方队友）
		userRow.del();		
//		alert("AIfaqiustate =" + AIfaqiustate );
		return AIfaqiustate ;
	}
	void AI_faqiuyanshi()
	{
		parent.find("SimKey").ClearKey();
		timer(1000,"AI_faqiu");
	}
	void AI_faqiu() //AI在发球状态下， 发球函数
	{
		var userRow = new VNet2DBRow
		{
			InitByInt( window.M_G_SERVER, window.USERDT, window.M_G_SERVER_USERDT_UID, parent.parent.find("AIController").GetUserID()/*被查询方的UserID, AIController提供*/);
		}
		var AIfaqiustate = userRow.GetData( window.M_G_SERVER_USERDT_RULETYPE);//AI在发球状态时的状态（0.发球方 1.接球方 2.发球方队友 3接球方队友）
		userRow.del();
//		alert("AIfaqiustate================"  + AIfaqiustate);

		suijizhi = tstatic.rand(100);
		if (AIfaqiustate == 0 )
		{ // AI是发球方

			if (suijizhi >= 50)
			{
				parent.find("SimKey").KeyUpAfterUpdate( 4);
				parent.find("SimKey").KeyUpAfterUpdate( 2,pNPCInfo.faqiuxulishijian); //向左打
				timer(pNPCInfo.faqiuxulishijian,"AN_Janjian");
				
			}
			else
			{
				parent.find("SimKey").KeyUpAfterUpdate( 4);
				parent.find("SimKey").KeyUpAfterUpdate( 3,pNPCInfo.faqiuxulishijian); //向右打
				timer(pNPCInfo.faqiuxulishijian,"AN_Janjian");				
			}
		}
	}
};
