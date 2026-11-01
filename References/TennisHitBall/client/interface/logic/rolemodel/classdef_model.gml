//
//模型类
//

/* 默认数据 取至m_g_goods.mdb 的 RoleInfo表
1.头发;2.五官;3.上装;4.裙/裤;5.手套;6.袜;7.鞋;8.背饰;9.球拍;10.眼镜;11.护腕/手链;12.项链;13.附件
男：381,416,432,459,462,483,515,526,559,580,605,630,647
女：1,33,54,65,86,118,207,225,271,291,316,345,357
*/

/*
1.头发;2.五官;3.上装;4.裙/裤;5.手套;6.袜;7.鞋;8.背饰;9.球拍;10.眼镜;11.护腕/手链;12.项链;13.附件
取至 m_g_server.mdb 的 roledt表 22-36字段
*/
importex("$./../../UI/RoleModel/ClassDef_Model.gml");

class VModelBase_Logic item
{
	size = "50%,100%";bgcolor = "#FF";enableUpdate(1);
	group = 1;//show = false;
	
	var m_AV_1 = 0;			//1.头发;
	var m_AV_2 = 0;			//2.五官;
	var m_AV_3 = 0;			//3.上装;
	var m_AV_4 = 0;			//4.裙/裤;
	var m_AV_5 = 0;			//5.手套;
	var m_AV_6 = 0;			//6.袜;
	var m_AV_7 = 0;			//7.鞋;
	var m_AV_8 = 0;			//8.背饰;
	var m_AV_9 = 0;			//9.球拍;
	var m_AV_10 = 0;		//10.眼镜;
	var m_AV_11 = 0;		//11.护腕/手链;
	var m_AV_12 = 0;		//12.项链;
	var m_AV_13 = 0;		//13.附件
	
	var m_Sex = 0;			//模型的性别
	var m_angle = 0;		//模型转的角度
	var m_angleDiff = 0;	//模型转的角度改变的值
	var m_LastActID = 0;	//模型的动作-上次的
	var m_SleepActID = window._Act_HALL;	//模型的动作-待机
	var m_IsPlaying = false;		//设置动作的间隔标识(是否在播放)
	var m_IsInitActSame = true;	//是否是第一次设置动作

	//=============================与界面交互========================================
	//参数 sex
	void Init(sex)
	{
		m_Sex = sex;
		//模型
		staticvar s_Model = new item{}
		//左边转：按钮
		staticvar s_TurnLeft = new VMyButton{Init("←");valign(70,0);halign(35,0);}
		//右边转：按钮
		staticvar s_TurnRight = new VMyButton{Init("→");valign(70,0);halign(5,0);}
	}
	inclass("VModelBase_UI");
	//==============================function=========================================
	//设置响应事件
	void SetEvent()
	{
		set s_TurnLeft//左边转：按钮
		{
			void LogicMouseDownL(){parent.m_angleDiff = -0.04;}		
			void LogicMouseUpL(){parent.m_angleDiff = 0;}
			void LogicMouseUpL_Lost(){parent.m_angleDiff = 0;}
		}
		set s_TurnRight//右边转：按钮
		{
			void LogicMouseDownL(){parent.m_angleDiff = 0.04;}		
			void LogicMouseUpL(){parent.m_angleDiff = 0;}
			void LogicMouseUpL_Lost(){parent.m_angleDiff = 0;}
		}
	}
	//模型转动
	void OnMyUpDate()
	{
//		killtimer("OnMyUpDate");
//		timer(10, "OnMyUpDate", "OnMyUpDate");
		while(1)
		{
			m_angle = m_angle + m_angleDiff;
			s_Model._rtexture._scene._V3Action.SelfRotate(m_angle);
			s_Model._rtexture._scene._stage.ypr = ""+m_angle+",0,0";
			sleep(10);
		}
	}
	//显示待机动作初始的
	void InitAct()
	{
		var _pos = window.GetUIPos();
		switch (_pos)
		{
			case 3://创建角色
			{
				m_SleepActID = window._Act_CREATEROLE;break;
			}
//			case 23://个人信息
//			{
//				m_SleepActID = window._Act_SELFINFO;break;
//			}
//			case 70://商城
//			{
//				m_SleepActID = window._ACT_MALL;break;
//			}
			case 22://背包
			{
				m_SleepActID = window._Act_SELFINFO;break;
			}
			default:m_SleepActID = window._Act_HALL;break;
		}
		printf("B# VModelMgr_Logic-InitAct():_pos:"+_pos+",m_SleepActID:"+m_SleepActID);
		s_Model._rtexture._scene._MFSM.clearset(m_SleepActID);
//		s_Model._rtexture._scene._V3Action.AniCtrl.Reset();
//		s_Model._rtexture._scene._V3Action.AniCtrl.Start();
	}
	
	//[功能]设置播放完毕后的标志位
	//[参数]param:ture fasle
	void SetIsPlaying(param)
	{
		printf("B# 人物动作播放:SetIsPlaying():m_LastActID:"+m_LastActID+",param:"+param);
		m_IsPlaying = param;
	}

	//设置小动作：试穿后调用
	void SetModelAct(actid)
	{
		printf("B# 人物动作播放:actid:"+actid+",m_LastActID:"+m_LastActID);
		if (actid == m_LastActID)	//动作相同-播完再播
		{
//			if(m_IsInitActSame)
//			{
//				m_IsInitActSame = false;
//				m_IsPlaying = false;
//				timer(window._Time_Act_Limit,"m_IsPlaying=true");
//			}
			if (!m_IsPlaying)
			{
				if (actid == 0)
				{
					s_Model._rtexture._scene._MFSM.clearset(m_SleepActID);
//					s_Model._rtexture._scene._V3Action.AniCtrl.Reset();
//					s_Model._rtexture._scene._V3Action.AniCtrl.Start();
				}
				else
				{
					
					s_Model._rtexture._scene._MFSM.clearset(actid);
//					s_Model._rtexture._scene._V3Action.AniCtrl.Reset();
//					s_Model._rtexture._scene._V3Action.AniCtrl.Start();
				}
				SetIsPlaying(true);
				timer(window._Time_Act_Limit,"SetIsPlaying(false)");
			}
		}
		else	//不同动作-直接切换
		{
			if (actid == 0)
			{
				s_Model._rtexture._scene._MFSM.clearset(m_SleepActID);
//				s_Model._rtexture._scene._V3Action.AniCtrl.Reset();
//				s_Model._rtexture._scene._V3Action.AniCtrl.Start();
			}
			else
			{
				
				s_Model._rtexture._scene._MFSM.clearset(actid);
//				s_Model._rtexture._scene._V3Action.AniCtrl.Reset();
//				s_Model._rtexture._scene._V3Action.AniCtrl.Start();
			}
//			m_IsInitActSame = true;
			
		}
		m_LastActID = actid;
	}

	//统一接口
	//同函数 InitParts
	void ShowRole(p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13)
	{
		if (window.g_DEBUG)
		{
			printf("B# VModelMgr_Logic统一接口Avatar-m_Sex:"+m_Sex+":p1:"+p1+",p2:"+p2+",p3:"+p3+",p4:"+p4+",p5:"+p5+",p6:"+p6+",p7:"
			+p7+",p8:"+p8+",p9:"+p9+",p10:"+p10+",p11:"+p11+",p12:"+p12+",p13:"+p13);
		}

		s_Model._rtexture._scene._V3Action.ShowRole2(p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13);
	}

	//参数：1.头发;2.五官;3.上装;4.裙/裤;5.手套;6.袜;7.鞋;8.背饰;9.球拍;10.眼镜;11.护腕/手链;12.项链;13.附件
	void InitParts(p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13)
	{
		m_AV_1 = p1;
		m_AV_2 = p2;
		m_AV_3 = p3;
		m_AV_4 = p4;
		m_AV_5 = p5;
		m_AV_6 = p6;
		m_AV_7 = p7;
		m_AV_8 = p8;
		m_AV_9 = p9;
		m_AV_10 = p10;
		m_AV_11 = p11;
		m_AV_12 = p12;
		m_AV_13 = p13;
		ShowRole(p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13);
	}

	//创建角色用
	//参数：1头发 2五官 3上装 4裙裤
	void SetParts(p1,p2,p3,p4)
	{
		printf("B# VModelMgr_Logic-SetParts-m_Sex:"+m_Sex+":p1:"+p1+",p2:"+p2+",p3:"+p3+",p4:"+p4);

		if (toint(p1) <= 0){p1 = m_AV_1;}else{m_AV_1 = p1;}
		if (toint(p2) <= 0){p2 = m_AV_2;}else{m_AV_2 = p2;}
		if (toint(p3) <= 0){p3 = m_AV_3;}else{m_AV_3 = p3;}
		if (toint(p4) <= 0){p4 = m_AV_4;}else{m_AV_4 = p4;}

		ShowRole(p1,p2,p3,p4,m_AV_5,m_AV_6,m_AV_7,m_AV_8,m_AV_9,m_AV_10,m_AV_11,m_AV_12,m_AV_13);
	}

	//商城试穿用
	//参数：1.头发;2.五官;3.上装;4.裙/裤;5.手套;6.袜;7.鞋;8.背饰;9.球拍;10.眼镜;11.护腕/手链;12.项链;13.附件
	void SetParts2(p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13)
	{
		if (window.g_DEBUG)
		{
			printf("B# VModelMgr_Logic-1.头发;2.五官;3.上装;4.裙/裤;5.手套;6.袜;7.鞋;8.背饰;9.球拍;10.眼镜;11.护腕/手链;12.项链;13.附件");
			printf("B# VModelMgr_Logic-SetParts2-m_Sex:"+m_Sex+":p1:"+p1+",p2:"+p2+",p3:"+p3+",p4:"+p4+",p5:"+p5+",p6:"+p6+",p7:"
			+p7+",p8:"+p8+",p9:"+p9+",p10:"+p10+",p11:"+p11+",p12:"+p12+",p13:"+p13);
		}

		if (toint(p1) <= 0){p1 = m_AV_1;}
		if (toint(p2) <= 0){p2 = m_AV_2;}
		if (toint(p3) <= 0){p3 = m_AV_3;}
		if (toint(p4) <= 0){p4 = m_AV_4;}
		if (toint(p5) <= 0){p5 = m_AV_5;}
		if (toint(p6) <= 0){p6 = m_AV_6;}
		if (toint(p7) <= 0){p7 = m_AV_7;}
		if (toint(p8) <= 0){p8 = m_AV_8;}
		if (toint(p9) <= 0){p9 = m_AV_9;}
		if (toint(p10) <= 0){p10 = m_AV_10;}
		if (toint(p11) <= 0){p11 = m_AV_11;}
		if (toint(p12) <= 0){p12 = m_AV_12;}
		if (toint(p13) <= 0){p13 = m_AV_13;}

		ShowRole(p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13);
	}

	//模特的初始化方式
	void InitModel_1()
	{
		window.g_Row.InitByInt(window.M_G_GOODS,window.ROLEINFO,window.M_G_GOODS_ROLEINFO_ENTRYID,m_Sex);
		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-VModelBase_Logic-InitModel_1():DBname:"+window.M_G_GOODS+",TBName:"+window.ROLEINFO);
			window.find("UIController").LoadDLG(149);//查看玩家个人信息失败！
			//if (window.g_DEBUG){alert("ERROR：VModel_Avatar_New-InitModel_1()数据库无此记录:"+m_Sex);}
			return;
		}
		//DisplayID
		var _p1 = window.g_Row.GetData(window.M_G_GOODS_ROLEINFO_DEFINEPART0);
		var _p2 = window.g_Row.GetData(window.M_G_GOODS_ROLEINFO_DEFINEPART1);
		var _p3 = window.g_Row.GetData(window.M_G_GOODS_ROLEINFO_DEFINEPART2);
		var _p4 = window.g_Row.GetData(window.M_G_GOODS_ROLEINFO_DEFINEPART3);
		var _p5 = window.g_Row.GetData(window.M_G_GOODS_ROLEINFO_DEFINEPART4);
		var _p6 = window.g_Row.GetData(window.M_G_GOODS_ROLEINFO_DEFINEPART5);
		var _p7 = window.g_Row.GetData(window.M_G_GOODS_ROLEINFO_DEFINEPART6);
		var _p8 = window.g_Row.GetData(window.M_G_GOODS_ROLEINFO_DEFINEPART7);
		var _p9 = window.g_Row.GetData(window.M_G_GOODS_ROLEINFO_DEFINEPART8);//球拍是 EnterID-已经改成了Fuck的DID，不通知我，靠
		var _p10 = window.g_Row.GetData(window.M_G_GOODS_ROLEINFO_DEFINEPART9);
		var _p11 = window.g_Row.GetData(window.M_G_GOODS_ROLEINFO_DEFINEPART10);
		var _p12 = window.g_Row.GetData(window.M_G_GOODS_ROLEINFO_DEFINEPART11);
		var _p13 = window.g_Row.GetData(window.M_G_GOODS_ROLEINFO_DEFINEPART12);
		
		window.g_Row.Release();

		//_p9 = window.GetDisplayIDByEnterID(_p9);

		InitParts(_p1,_p2,_p3,_p4,_p5,_p6,_p7,_p8,_p9,_p10,_p11,_p12,_p13);
	}
	//roledt 的真实玩家初始化
	void InitModel_2(rid)
	{
		window.g_Row.InitByInt(window.M_G_SERVER,window.ROLEDT,window.M_G_SERVER_ROLEDT_RID,rid);
		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-VModelBase_Logic-InitModel_2():DBname:"+window.M_G_SERVER+",TBName:"+window.ROLEDT);
			//if (window.g_DEBUG){alert("ERROR：VModel_Avatar_New-InitModel_2()数据库无此记录:"+rid);}
			window.find("UIController").LoadDLG(142);//玩家已离线！
			return;
		}
		//DisplayID
		var _p1 = window.g_Row.GetData(window.M_G_SERVER_ROLEDT_AWTORID0);
		var _p2 = window.g_Row.GetData(window.M_G_SERVER_ROLEDT_AWTORID1);
		var _p3 = window.g_Row.GetData(window.M_G_SERVER_ROLEDT_AWTORID2);
		var _p4 = window.g_Row.GetData(window.M_G_SERVER_ROLEDT_AWTORID3);
		var _p5 = window.g_Row.GetData(window.M_G_SERVER_ROLEDT_AWTORID4);
		var _p6 = window.g_Row.GetData(window.M_G_SERVER_ROLEDT_AWTORID5);
		var _p7 = window.g_Row.GetData(window.M_G_SERVER_ROLEDT_AWTORID6);
		var _p8 = window.g_Row.GetData(window.M_G_SERVER_ROLEDT_AWTORID7);
		var _p9 = window.g_Row.GetData(window.M_G_SERVER_ROLEDT_AWTORID8);
		var _p10 = window.g_Row.GetData(window.M_G_SERVER_ROLEDT_AWTORID9);
		var _p11 = window.g_Row.GetData(window.M_G_SERVER_ROLEDT_AWTORID10);
		var _p12 = window.g_Row.GetData(window.M_G_SERVER_ROLEDT_AWTORID11);
		var _p13 = window.g_Row.GetData(window.M_G_SERVER_ROLEDT_AWTORID12);
		
		window.g_Row.Release();

		InitParts(_p1,_p2,_p3,_p4,_p5,_p6,_p7,_p8,_p9,_p10,_p11,_p12,_p13);
	}

	//================================================================================
	void OnCreated()
	{
		//show = true;

		SetEvent();
		OnMyUpDate();
	}
};
