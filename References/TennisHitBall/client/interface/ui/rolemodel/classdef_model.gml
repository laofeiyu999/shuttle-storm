//
//可以换装的模型-新的写法 全部合在一个类
//适用地方：商城（自己+默认）+个人信息（自己+别人）+背包 + 创建角色
//yxf 2009年10月22日
//

class VModelBase_UI item
{
	size = "100%,100%";halign(100,0);pos = "0,0";bgcolor = -1;
	var _count = 0;

	//drag = "self";
	void Init(sex)
	{
		m_Sex = sex;
		//模型
		staticvar s_Model = new item
		{
			size = "100%,100%";
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
//						pos = "-0.05,1.24,1.5";
						pos = "-0.05,1.14,1.5";

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


			//竖挂件
			var _v2dImg = new img
			{
				name = "Name_v2dImg";
			};

			//横幅
			var _h2dImg = new img
			{
				name = "Name_h2dImg";
			};

		}//model
		//左边转：按钮
		staticvar s_TurnLeft = new VBTN_TurnRight_New
		{
			valign(85,0);halign(85,-2);
			SetHangID(38);
		}
		//右边转：按钮
		staticvar s_TurnRight = new VBTN_TurnLeft_New
		{
			valign(85,0);halign(40,0);
			SetHangID(39);
		}
//		new img
//		{
//			src = "$./../GmlCtrls/VButton/imgs"+window.g_Sex+"/new/Public_New/daoying_zuo.tga";
//			pos="191,617";
//		}
//		new img
//		{
//			src = "$./../GmlCtrls/VButton/imgs"+window.g_Sex+"/new/Public_New/daoying_you.tga";
//			pos="399,617";
//		}
	}
};