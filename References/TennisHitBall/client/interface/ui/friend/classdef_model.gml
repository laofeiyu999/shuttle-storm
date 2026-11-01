//
//显示一个模型
//适用地方：情侣界面
//yxf 2010年9月24日
//

class VUIModelShow item
{
	size = "100%,100%"pos = "0,0";//bgcolor = "#FFFF";;halign(100,0);
	group = 1;

	var _count = 0;
	var m_Sex = 0;					//模型的性别
	var m_Pos = "-0.05,1.14,1.5";	//默认位置
	void Init(sex,_pos)
	{
		m_Sex = sex;
		m_Pos = _pos;
		//模型
		staticvar s_Model = new item
		{
			size = "100%,100%";//bgcolor = "#FFFFFF";
			var _rtexture = new layer3d
			{
				size = "100%,100%";eye.far = 1000;eye.FOV = 0.55;bgcolor = "#FFFFFF";
				ClearZ = 1;

				var _scene = new scene
				{
					//camera.src="keyboard";
					camera.pos = "-0.14,2.8,-2.9";
					camera.dir = "-0.14,-1.1,6";
					camera.up = "-0.01, 0.5, 0";
					
					//人物模型
					var _V3Action = new V3Action
					{
						name = "Action";
						SetUserPath="$./../../../../client/user/";
						SetDbName("a00"+group.m_Sex);
						pos = group.m_Pos;

						void OnCreated()
						{
							group._count += 1;
							if (group._count == 2)
							{
								group.InitAct();//初始化动作
							}
						}
					};//act
					//状态机，控制动作播完就不播了
					var _MFSM = new MFSM
					{
						VNETLOG(11095,"2:"+group.m_Sex+"\n")
						name="FSM";
						SetDbName("a00"+group.m_Sex);
						
						void OnCreated()
						{
							group._count += 1;
							if (group._count == 2)
							{
								group.InitAct();//初始化动作
							}
						}
					}//FSM
					new UserLogic//随机动作的东东-from 韩硕
					{
						name = "Logic";
					}

					new CIfUser{name="ifuser";}

					new TEffect{name="UI_TEffect";}
				}//scene
			}//rt
		}//model
	}//Init()

	//统一接口
	//同函数 InitParts
	void ShowRole(p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14)
	{
		printf("陈昀调试B# VUIModelShow-m_Sex:"+m_Sex+":p1:"+p1+",p2:"+p2+",p3:"+p3+",p4:"+p4+",p5:"+p5+",p6:"+p6+",p7:"
		+p7+",p8:"+p8+",p9:"+p9+",p10:"+p10+",p11:"+p11+",p12:"+p12+",p13:"+p13+",p14:"+p14);

		s_Model._rtexture._scene._V3Action.ShowRole2(p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14);
	}

	void InitAct()
	{
		if ( window.POS_PROBABLY_TSLovMod == 1)
		{
			if (m_Sex == window.USER_SEX_MAN)
			{
				s_Model._rtexture._scene._MFSM.clearset(window._Act_LOVERINFO_MAN);
			}
			if (m_Sex == window.USER_SEX_WOMAN)
			{
				s_Model._rtexture._scene._MFSM.clearset(window._Act_LOVERINFO_WOMAN);
			}
		}
	}
};