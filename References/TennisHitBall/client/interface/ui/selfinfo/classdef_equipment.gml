//个人信息装备属性显示类定义
//@刘高辰
//08年9月4号

importex("$./ClassDef_Sub.gml");

class VSelfInfo_Equipment_UI item
{
	size = "100%,100%";bgcolor = -1;alpha = 0;
	//var _Sex = //底图的性别
	//=============================与界面交互========================================
	void Init()
	{
		new img
		{
			size = "351,480";pos="505,199";
			src = "$./../PublicImage/imgs"+window.g_Sex+"/BK_S.tga";		
		}
		
		//服饰：Radio
		staticvar s_R_Cloth = new VRadio_Info_Cloth_UI{pos="524,178";}
		//装备：Radio
		staticvar s_R_Equipment = new VRadio_Info_Equipment_UI{pos="582,178";}

		//底图的人物
		staticvar s_BK = new img
		{
			//pos="565,223";
			//src = "$./imgs"+window.g_Sex+"/DE_2_1.tga";		
		}
		//头发
		//参数 data1
		staticvar s_Hair = new VDE_Icon_UI
		{
			pos="745,210";
			Init("Hair.tga");
		}
		//五官
		//参数 data1
		staticvar s_Facial = new VDE_Icon_UI
		{
			pos="520,336";
			Init("Facial.tga");
		}
		//袜子
		//参数 data1
		staticvar s_Socks = new VDE_Icon_UI
		{
			pos="520,565";
			Init("Socks.tga");
		}
		//护腕手链
		//参数 data1
		staticvar s_Cuff = new VDE_Icon_UI
		{
			pos="745,378";
			Init("Cuff.tga");
		}
		//眼镜
		//参数 data1
		staticvar s_Glasses = new VDE_Icon_UI
		{
			pos="520,210";
			Init("Glasses.tga");
		}

		//项链
		//参数 data1
		staticvar s_Necklace = new VDE_Icon_UI
		{
			pos="520,210";
//			new img
//			{
//				src = "$./../PublicImage/imgs"+window.g_Sex+"/Necklace.tga";
//			}
			Init("Necklace.tga");
		}
		///上装
		//参数 data1
		staticvar s_Jacket = new VDE_Icon_UI
		{
			pos="520,330";
			Init("Jacket.tga");
		}
		//群/裤
		//参数 data1
		staticvar s_Trouser = new VDE_Icon_UI
		{
			pos="520,436";
			Init("Trouser.tga");
		}
		//鞋
		//参数 data1
		staticvar s_Shoes = new VDE_Icon_UI
		{
			pos="520,570";
			Init("Shoes.tga");
		}
		//背饰
		//参数 data1
		staticvar s_Back = new VDE_Icon_UI
		{
			pos="745,210";
			Init("Back.tga");
		}
		//手套
		//参数 data1
		staticvar s_Gloves = new VDE_Icon_UI
		{
			pos="745,360";
			Init("Gloves.tga");
		}
		//球拍
		//参数 data1
		staticvar s_Racket = new VDE_Icon_UI
		{
			pos="745,570";
			Init("Racket.tga");
		}

	}//Init()
	
	//改变人物的底图
	//参数 type：类型 1服饰 2装备
	void ChangeBK(type)
	{
		if (type == 1)
		{
			s_BK.pos="565,223";
		}
		if (type == 2)
		{
			s_BK.pos="560,223";
		}
		s_BK.src = "$./imgs"+window.g_Sex+"/DE_"+type+"_"+_Sex+".tga";
	}
};