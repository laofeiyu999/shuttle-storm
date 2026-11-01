//
//游戏内界面的界面部分的类定义:开始>>双打
//
importex("$./ClassDef_BeginUI_D_Sub.gml");
import("$./ClassDef_BeginUI_D_Model_1.gml");
import("$./ClassDef_BeginUI_D_Model_2.gml");
import("$./ClassDef_BeginUI_D_Model_3.gml");
import("$./ClassDef_BeginUI_D_Model_4.gml");
import("$./ClassDef_BeginUI_LV.gml");

//游戏开始的界面
class VGame_Begin_D_UI item
{
	size = "100%,100%";bgcolor = "#000000";alpha = 50;
	//下边的黑边
	var _tempbottom = new item
	{
		size = "100%,100";bgcolor = "#000000";//pos = "0,"+(parent.height-100);
		valign(100,0);
	}
	//上边的黑边
	var _temptop = new item
	{
		size = "100%,100";bgcolor = "#000000";
		top = 0;
	}
	//=================================与显示交互部分=====================================
	void Init()
	{
		//模型1
		staticvar s_P1Model = new VBegin_Model_D1{top = -250;left = -700;}
		//模型2
		staticvar s_P2Mode2 = new VBegin_Model_D2{top = -200;halign(100,-424+width);}
		//模型3
		staticvar s_P1Mode3 = new VBegin_Model_3{top = -250;left = -700;}
		//模型4
		staticvar s_P2Mode4 = new VBegin_Model_4{top = -200;halign(100,-424+width);}
		
		//属性条-上
		staticvar s_IMG_P1attribute = new img
		{
			src = "$./imgs/Doubles_Pro_D.tga";
			size = "100%,137";
			//pos = ""+parent.width+",505";
			left = parent.width;
			valign(100,-125);
		}
		//属性条-上
		staticvar s_IMG_P2attribute = new img
		{
			src = "$./imgs/Doubles_Pro_D.tga";
			size = "100%,137";
			//pos = "-"+parent.width+",620";
			left = "-"+parent.width;
			valign(100,-10);
		}

//		staticvar _distance = (width-s_IMG_P1attribute.width)/2;
		
		//左边P1的属性
		staticvar s_P1attribute = new VRole_Attribute_P1_D_UI
		{
//			pos = "900,565";
//			bgcolor = "#ff";alpha = 30;
			//halign(100,width);
//			halign(100,width);
			valign(100,-230+height);
		}
		//右边P2的属性
		staticvar s_P2attribute = new VRole_Attribute_P2_D_UI
		{
//			pos = "-900,100";
//			bgcolor = "#ff";alpha = 30;
			valign(100,-230+height);
			//left = -900;
		}
		//左边P3的属性
		staticvar s_P3attribute = new VRole_Attribute_P1_D_UI
		{
//			pos = "900,650";
//			bgcolor = "#ff";alpha = 30;
			//halign(100,width);
			valign(100,-116+height);
		}	
		//右边P4的属性
		staticvar s_P4attribute = new VRole_Attribute_P2_D_UI
		{
			//pos = "-900,-20";
			valign(100,-116+height);
			//left = -900;
		}

		//玩家1等级
		//参数 data2
		staticvar s_P1_CuLevel = new VBegin_LV_UI
		{
//			pos = ""+(-60+parent._distance)+",380";
			left = 30;
			valign(100,-130);
		}
		//玩家2等级
		//参数 data2
		staticvar s_P2_CuLevel = new VBegin_LV_UI
		{
//			pos = ""+(590+parent._distance)+",380";
			halign(100,-500+width);
			valign(100,-130);
		}
		//玩家3等级
		//参数 data2
		staticvar s_P3_CuLevel = new VBegin_LV_UI
		{
//			pos = ""+(180+parent._distance)+",380";
			left = 240;
			valign(100,-130);
		}
		//玩家4等级
		//参数 data2
		staticvar s_P4_CuLevel = new VBegin_LV_UI
		{
//			pos = ""+(790+parent._distance)+",380";
			halign(100,-270+width);
			valign(100,-130);
		}

		//VS
		staticvar s_VS =new scene
		{
			var _Vs_Model = new fmodel
			{
				src = "$./../../../model/vs.v3f";
				pos="0,0.5,5";
				setShader("add_texture.fx");
				show = false;
			}
		};
		//VS即将向右走的图片-模糊
		staticvar _Vs_Out = new img
		{
			src = "$./imgs/vs-3.tga";
//			pos = "430,190";
			top = 190;
			left = (parent.width-width)/2;
			alpha = 100;
			//镜头移动-add by yxf
			void MoveCamera()
			{
				window.find("NAME_GCMap").BeginMove(window._Dir_FileBegin,window._Time_CameraMoveBegin);//开始镜头移动
				if (window.g_DEBUG)
				{
					printf("播背景音乐:window.GetMyGameMapID():"+window.GetMyGameMapID());
				}	

				var _gamemusic = window.g_CSoundSet.GetBgMusic(window.eBgMusic_Game);
				if (_gamemusic.__Long__ == 0)
				{
					_gamemusic = window.GetMyGameMapID();
				}
				parent.parent._GameMusicID = _gamemusic;
				window.PlayMusic(_gamemusic);	//根据游戏中地图播背景音乐
			}
			//换模糊的图片
			void ChangeVs(){_Vs_Out.src = "$./imgs/vs-4.tga";}
		};
	}//end init	
	//======================================其他变量=======================================
	//P1的lV的横向动画-模糊效果
	var _P1_CuLevel_H = new img
	{
		src = "$./imgs/ LV_Wang.tga";
//		pos = "1024,480";
		left = parent.width;
		valign(100,-265);
		size = "131,59";	
		void LSHOW(){show = false;}
	}
	//P2的lV的横向动画-模糊效果
	var _P2_CuLevel_H = new img
	{
		src = "$./imgs/LV_Wang.tga";
		pos = "-200,480";
		left = -200;
		valign(100,-265);
		size = "131,59";
		void LSHOW(){show = false;}
	}
	//P3的lV的横向动画-模糊效果
	var _P3_CuLevel_H = new img
	{
		src = "$./imgs/LV_Wang.tga";
//		pos = "1024,480";
		left = parent.width;
		valign(100,-265);
		size = "131,59";	
		void LSHOW(){show = false;}
	}
	//P4的lV的横向动画-模糊效果
	var _P4_CuLevel_H = new img
	{
		src = "$./imgs/LV_Wang.tga";
//		pos = "-200,480";
		left = -200;
		valign(100,-265);
		size = "131,59";
		void LSHOW(){show = false;}
	}
	//======================================函数=======================================
	//Vs-即将走的-加色法3D图片
	void VsDown()
	{
		new img3d
		{
			pos = "-1200,-1200";
			size = "2560,2560";
			src= "$./imgs/VS_Spiral.tga";
			setShader("2d_add_texture.fx");
			setParamTimer("pos","-800,-800",""+((parent.width-width)/2+18)+",190",133,0);
			setParamTimer("pos",""+((parent.width-width)/2+18)+",190",""+((parent.width-width)/2-48)+",140",167,133);
			setParamTimer("size","2560,2560","128,128",133,0);
			setParamTimer("size","128,128","256,256",167,133);
			delaydel(300);
		}
	}
	//显示与隐藏-LV数字-蓝
	void LVShow_Blue(param)
	{
		s_P1_CuLevel.show = param;
		s_P2_CuLevel.show = param;
		s_P3_CuLevel.show = param;
		s_P4_CuLevel.show = param;
	}
	//显示与隐藏-LV数字-黄发光底
	void LVShow_Yellow(param)
	{
		s_P1_CuLevel.shinenum.show = param;
		s_P2_CuLevel.shinenum.show = param;
		s_P3_CuLevel.shinenum.show = param;
		s_P4_CuLevel.shinenum.show = param;
	}

	//开始运行所有动画
	void Run()
	{
		//等级-横向模糊
//		_P1_CuLevel_H.setParamTimer("pos","1024,480","80,480",window._Time_Level_Fly,window._Time_Level_Fly_Wait,"LSHOW");
//		_P2_CuLevel_H.setParamTimer("pos","-200,480","600,480",window._Time_Level_Fly,window._Time_Level_Fly_Wait,"LSHOW");
//		_P3_CuLevel_H.setParamTimer("pos","1024,480","280,480",window._Time_Level_Fly,window._Time_Level_Fly_Wait,"LSHOW");
//		_P4_CuLevel_H.setParamTimer("pos","-200,480","800,480",window._Time_Level_Fly,window._Time_Level_Fly_Wait,"LSHOW");
		_P1_CuLevel_H.setParamTimer("left",""+width,"80",window._Time_Level_Fly,window._Time_Level_Fly_Wait,"LSHOW");
		_P2_CuLevel_H.setParamTimer("left","-200",""+(width-460),window._Time_Level_Fly,window._Time_Level_Fly_Wait,"LSHOW");
		_P3_CuLevel_H.setParamTimer("left",""+width,"280",window._Time_Level_Fly,window._Time_Level_Fly_Wait,"LSHOW");
		_P4_CuLevel_H.setParamTimer("pos","-200",""+(width-124),window._Time_Level_Fly,window._Time_Level_Fly_Wait,"LSHOW");

		//属性条
//		s_IMG_P1attribute.setParamTimer("pos",""+width+",505",""+_distance+",505",window._Time_Statue_Fly,window._Time_Statue_Fly_Wait);
//		s_IMG_P2attribute.setParamTimer("pos","-"+width+",620",""+_distance+",620",window._Time_Statue_Fly,window._Time_Statue_Fly_Wait);
		s_IMG_P1attribute.setParamTimer("left",""+width,"0",window._Time_Statue_Fly,window._Time_Statue_Fly_Wait);
		s_IMG_P2attribute.setParamTimer("left","-"+s_IMG_P2attribute.width,""+(width-s_IMG_P2attribute.width),window._Time_Statue_Fly,window._Time_Statue_Fly_Wait);
		
//		s_P1attribute.setParamTimer("pos","900,538",""+_distance+",538",window._Time_Statue_Fly,window._Time_Statue_Fly_Wait);
//		s_P3attribute.setParamTimer("pos","900,652",""+_distance+",652",window._Time_Statue_Fly,window._Time_Statue_Fly_Wait);
//		s_P2attribute.setParamTimer("pos","-900,538",""+(522+_distance)+",538",window._Time_Statue_Fly,window._Time_Statue_Fly_Wait);
//		s_P4attribute.setParamTimer("pos","-900,652",""+(522+_distance)+",652",window._Time_Statue_Fly,window._Time_Statue_Fly_Wait);
		s_P1attribute.setParamTimer("halign","100,"+s_P1attribute.width,"1,"+(30-width/100),window._Time_Statue_Fly,window._Time_Statue_Fly_Wait);
		s_P3attribute.setParamTimer("halign","100,"+s_P3attribute.width,"1,"+(30-width/100),window._Time_Statue_Fly,window._Time_Statue_Fly_Wait);
		s_P2attribute.setParamTimer("left","-900",""+(width-s_P2attribute.width),window._Time_Statue_Fly,window._Time_Statue_Fly_Wait);
		s_P4attribute.setParamTimer("left","-900",""+(width-s_P4attribute.width),window._Time_Statue_Fly,window._Time_Statue_Fly_Wait);

		//黑条
		//_tempbottom.setParamTimer("pos","0,"+(height-100),"0,"+height,window._Time_VS_Black,window._Time_VS_Black_Wait);
		_tempbottom.setParamTimer("valign","100,0","100,100",window._Time_VS_Black,window._Time_VS_Black_Wait);
		//_temptop.setParamTimer("pos","0,0","0,-100",window._Time_VS_Black,window._Time_VS_Black_Wait);
		_temptop.setParamTimer("top","0","-100",window._Time_VS_Black,window._Time_VS_Black_Wait);

		
		//VS
		s_VS._Vs_Model.setParamTimer("show",false,true,1,window._Time_VS_Down_Show);
		timer(2333,"VsDown");
		_Vs_Out.setParamTimer("alpha",100,0,600,window._Time_VS_Down_Show);
		s_VS._Vs_Model.setParamTimer("show",true,false,1,4266);
		_Vs_Out.setParamTimer("left",""+(width-_Vs_Out.width)/2,""+width,166,4266,"MoveCamera");
		
		//模型
//		s_P1Model.setParamTimer("pos","-700,-200","-320,-200",window._Time_Player_Run,window._Time_Player_Run_Wait,"LoadAct");
//		s_P2Mode2.setParamTimer("pos","600,-200","200,-200",window._Time_Player_Run,window._Time_Player_Run_Wait,"LoadAct");
//		s_P1Mode3.setParamTimer("pos","-700,-200","-220,-200",window._Time_Player_Run,window._Time_Player_Run_Wait,"LoadAct");
//		s_P2Mode4.setParamTimer("pos","600,-200","300,-200",window._Time_Player_Run,window._Time_Player_Run_Wait,"LoadAct");
		s_P1Model.setParamTimer("left","-700","-320",window._Time_Player_Run,window._Time_Player_Run_Wait,"LoadAct");
		s_P2Mode2.setParamTimer("halign","100,"+(-424+s_P2Mode2.width),"100,"+(-824+s_P2Mode2.width),window._Time_Player_Run,window._Time_Player_Run_Wait,"LoadAct");
		s_P1Mode3.setParamTimer("left","-700","-220",window._Time_Player_Run,window._Time_Player_Run_Wait,"LoadAct");
		s_P2Mode4.setParamTimer("halign","100,"+(-424+s_P2Mode4.width),"100,"+(-724+s_P2Mode4.width),window._Time_Player_Run,window._Time_Player_Run_Wait,"LoadAct");

		timer(4266,"window.PlaySound(106)");//比赛结束后结算框离开屏幕的声音
		timer(700,"window.PlaySound(110)");//播放音效-比赛开始时
		_Vs_Out.timer(4300,"ChangeVs");			
		timer(1200,"LVShow_Blue(true)");//显示-LV数字-蓝
		//timer(3333,"LVShow_Blue(false)");//隐藏-LV数字-蓝
		timer(1333,"LVShow_Yellow(true)");//显示-LV数字-黄发光底
		timer(1667,"LVShow_Yellow(false)");//隐藏-LV数字-黄发光底
		
		//LV的动画系列
		s_P1_CuLevel.LvPos();
		s_P2_CuLevel.LvPos();
		//LV
		s_P1_CuLevel.shinenum.shinetop.setParamTimer("size","80,80","200,200",133,1333);
		s_P1_CuLevel.shinenum.shinetop.setParamTimer("pos","55,95","5,35",133,1333); 
		s_P1_CuLevel.shinenum.shinetop.setParamTimer("size","200,200","80,80",133,1467);
		s_P1_CuLevel.shinenum.shinetop.setParamTimer("pos","5,35","55,95",133,1467); 
		//数字
		//百位数 - 蓝色
		s_P1_CuLevel.shinenum.h_num.setParamTimer("size","66,62","200,200",133,1333);
		s_P1_CuLevel.shinenum.h_num.setParamTimer("size","200,200","66,62",133,1467);
		//十位数 - 蓝色
		s_P1_CuLevel.shinenum.t_num.setParamTimer("size","66,62","200,200",133,1333);
		s_P1_CuLevel.shinenum.t_num.setParamTimer("size","200,200","66,62",133,1467);
		//个位数 - 蓝色
		s_P1_CuLevel.shinenum.o_num.setParamTimer("size","66,62","200,200",133,1333);
		s_P1_CuLevel.shinenum.o_num.setParamTimer("size","200,200","66,62",133,1467);

		s_P2_CuLevel.shinenum.shinetop.setParamTimer("size","80,80","200,200",133,1333);
		s_P2_CuLevel.shinenum.shinetop.setParamTimer("pos","55,95","5,35",133,1333); 
		s_P2_CuLevel.shinenum.shinetop.setParamTimer("size","200,200","80,80",133,1467);
		s_P2_CuLevel.shinenum.shinetop.setParamTimer("pos","5,35","55,95",133,1467); 
		s_P2_CuLevel.shinenum.h_num.setParamTimer("size","66,62","200,200",133,1333);
		s_P2_CuLevel.shinenum.h_num.setParamTimer("size","200,200","66,62",133,1467);
		s_P2_CuLevel.shinenum.t_num.setParamTimer("size","66,62","200,200",133,1333);
		s_P2_CuLevel.shinenum.t_num.setParamTimer("size","200,200","66,62",133,1467);
		s_P2_CuLevel.shinenum.o_num.setParamTimer("size","66,62","200,200",133,1333);
		s_P2_CuLevel.shinenum.o_num.setParamTimer("size","200,200","66,62",133,1467);

		//setParamTimer("alpha",50,100,window._Time_Back_Alpha,window._Time_Back_Alpha_Wait);
	}
};