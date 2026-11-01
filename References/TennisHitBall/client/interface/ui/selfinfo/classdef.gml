//个人信息显示类定义
//

//class VUILoverModelShow item
//{
//	size = "100%,100%"pos = "0,0";//bgcolor = "#FFFF";;halign(100,0);
//
//	var _count = 0;
//	var m_Sex = 0;					//模型的性别
//	var m_Pos = "-0.05,1.14,1.5";	//默认位置
//	void Init(sex,_pos)
//	{
//		m_Sex = sex;//alert("group.m_Sex="+m_Sex);
//		m_Pos = _pos;
//		//模型
//		staticvar s_Model = new item
//		{
//			size = "100%,100%";//bgcolor = "#FFFFFF";
//			var _rtexture = new layer3d
//			{
//				size = "100%,100%";eye.far = 1000;eye.FOV = 0.55;bgcolor = "#FFFFFF";
//				ClearZ = 1;
//
//				var _scene = new scene
//				{
//					//camera.src="keyboard";
//					camera.pos = "-0.14,2.8,-2.9";
//					camera.dir = "-0.14,-1.1,6";
//					camera.up = "-0.01, 0.5, 0";
//					
//					//人物模型
//					var _V3Action = new V3Action
//					{
//						name = "Action";
//						SetUserPath="$./../../../../client/user/";
////						SetDbName("a00"+parent.parent.parent.parent.m_Sex);//alert("group.m_Sex="+parent.parent.parent.parent.m_Sex);
//						SetDbName("a00"+group.m_Sex);
//						pos = group.m_Pos;
//
//						void OnCreated()
//						{
//							group._count += 1;
//							if (group._count == 2)
//							{
//								group.InitAct();//初始化动作
//							}
//						}
//					};//act
//					//状态机，控制动作播完就不播了
//					var _MFSM = new MFSM
//					{
//						VNETLOG(11095,"2:"+group.m_Sex+"\n")
//						name="FSM";
////						SetDbName("a00"+group.m_Sex);
//						SetDbName("a00"+parent.parent.parent.parent.m_Sex);
////						void OnCreated()
////						{
////							group._count += 1;
////							if (group._count == 2)
////							{
////								alert("InitAct00");
//////								group.InitAct();//初始化动作
////							}
////						}
//					}//FSM
//					new UserLogic//随机动作的东东-from 韩硕
//					{
//						name = "Logic";
//					}
//
//					new CIfUser{name="ifuser";}
//
//					new TEffect{name="UI_TEffect";}
//				}//scene
//			}//rt
//		}//model
//	}//Init()
//
//	//统一接口
//	//同函数 InitParts
//	void ShowRole(p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13)
//	{
//		printf("B# VUIModelShow-m_Sex:"+m_Sex+":p1:"+p1+",p2:"+p2+",p3:"+p3+",p4:"+p4+",p5:"+p5+",p6:"+p6+",p7:"
//		+p7+",p8:"+p8+",p9:"+p9+",p10:"+p10+",p11:"+p11+",p12:"+p12+",p13:"+p13);
//
//		s_Model._rtexture._scene._V3Action.ShowRole2(p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13);
//	}
//
//	
//};

//importex("$./../../UI/RoleModel/ClassDef_Model.gml");
class VSelfInfo_UI VUIBG_UI
{
//	group = 1;
	size = "0%,0%";size = "597,555";pos="5,50";bgcolor = -1;alpha = 100;capturemouse = false;
	//valign(10,0);halign(100,0);
	pos = ""+(window.width-width+4) + "," +(window.height-height - 36)/2;
	void Init()
	{
		//OpenDrag();
		SetTitalPos("25,0");
		InitBG("$./imgs"+window.g_Sex+"/new/grxxxx-text.tga");

		new img{pos = "26,45";src="$./imgs"+window.g_Sex+"/new/bk.tga";}

		InitHelp();
		InitClose();
		
		//基础信息：Radio
		staticvar s_R_BaseInfo = new VRadio_BK_UI
		{
			pos="291,40";
			InitText("基础");
		}
		//战绩统计：Radio
		staticvar s_R_Record = new VRadio_BK_UI
		{
			pos="352,40";
			InitText("战绩");
		}
		//社交：Radio
		staticvar s_R_Sociality = new VRadio_BK_UI
		{
			pos="413,40";
			InitText("社交");
		}

		//模型（你和情侣）
		//data1:女的Avatar信息
		//sex1:玩家1性别
		//data2:男的Avatar信息
		//sex2:玩家2性别
		staticvar s_LovModel = new item
		{
			size = "218,450";pos = "0,0";//bgcolor = "#FF";
//			var _woman = new VUILoverModelShow{}
//			var _man = new VUILoverModelShow{halign(100,0);}
			var _man = new VUIModelShow{halign(100,0);};
			var _woman = new VUIModelShow{};
			

			void SetData(data1,sex1,data2,sex2,type)
			{
				if (type == 1)
				{
					window.POS_PROBABLY_TSLovMod = 0;
					pos = "50,60";
					if(sex1 == window.USER_SEX_MAN)
					{
						_man.Init(sex1,"-0.25,1.52,0.3");
						var _a2 = window.SplitStr2(data1,",");
						_man.ShowRole(_a2[0],_a2[1],_a2[2],_a2[3],_a2[4],_a2[5],_a2[6],_a2[7],_a2[8],_a2[9],_a2[10],_a2[11],_a2[12],_a2[13]);
				
					}
					if(sex1 == window.USER_SEX_WOMAN)
					{
						_woman.Init(sex1,"-0.20,1.50,0.3");
						var _a1 = window.SplitStr2(data1,",");
						_woman.ShowRole(_a1[0],_a1[1],_a1[2],_a1[3],_a1[4],_a1[5],_a1[6],_a1[7],_a1[8],_a1[9],_a1[10],_a1[11],_a1[12],_a1[13]);
					}
				}
				else
				{
					window.POS_PROBABLY_TSLovMod = 1;
					pos = "45,60";
					printf("陈昀调试：这里是情侣模式，双方分别是:");
					printf("陈昀调试：男：" + sex2 + "装备是" + data2);
					printf("陈昀调试：女：" + sex1 + "装备是" + data1);
					_woman.Init(sex1,"-0.09,1.47,0.4");
					var _a1 = window.SplitStr2(data1,",");
					_woman.ShowRole(_a1[0],_a1[1],_a1[2],_a1[3],_a1[4],_a1[5],_a1[6],_a1[7],_a1[8],_a1[9],_a1[10],_a1[11],_a1[12],_a1[13]);

					_man.Init(sex2,"-0.31,1.52,0.3");
					var _a2 = window.SplitStr2(data2,",");
					_man.ShowRole(_a2[0],_a2[1],_a2[2],_a2[3],_a2[4],_a2[5],_a2[6],_a2[7],_a2[8],_a2[9],_a2[10],_a2[11],_a2[12],_a2[13]);
				}
			}
		}
	}
	void ReSetPos()
	{
		pos = ""+(window.width-width+4) + "," +(window.height-height - 36)/2;
	}
}