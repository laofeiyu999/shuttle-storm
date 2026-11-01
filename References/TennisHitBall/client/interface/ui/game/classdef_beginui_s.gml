//
//游戏内界面的界面部分的类定义:开始>>单打
//

importex("$./ClassDef_BeginUI_S_Sub.gml");
import("$./ClassDef_BeginUI_S_Model_1.gml");
import("$./ClassDef_BeginUI_S_Model_2.gml");
import("$./ClassDef_BeginUI_LV.gml");

//游戏开始的界面
class VGame_Begin_S_UI item
{
	size = "100%,100%";bgcolor = "#000000";alpha = 50;
	var _tempbottom = new item
	{
		size = "100%,100";bgcolor = "#000000";//pos = "0,670"
		valign(100,0);
	}
	var _temptop = new item
	{
		size = "100%,100";bgcolor = "#000000";
		//valign(1,-10);
		top = 0;
	}

	void Init()
	{
		//左边P1的属性
		staticvar s_P1attribute = new VRole_Attribute_P1_UI
		{
//			pos = "900,525";
			halign(100,parent.width);valign(100,-100);
		}
		//右边P2的属性
		staticvar s_P2attribute = new VRole_Attribute_P2_UI
		{
//			pos = "-900,100";
			//halign(1,-parent.width));//valign(1,100);
			left = -900;top = 100;
		}
		
		//玩家1等级
		//参数 data2
		staticvar s_P1_CuLevel = new VBegin_LV_UI
		{
//			pos = "250,360";
			left = 250;
			valign(100,-100);
		}
		//玩家2等级
		//参数 data2
		staticvar s_P2_CuLevel = new VBegin_LV_UI
		{
			//pos = "532,-30";
			halign(100,-100);top = -30;
		}	

		//模型1
		staticvar s_P1Model = new VBegin_Model_1{}
		//模型2
		staticvar s_P2Mode2 = new VBegin_Model_2{}

		//VS
		staticvar s_VS =new scene
		{
			var b = new fmodel
			{
				src = "$./../../../model/vs.v3f";
				pos="0,0,4.4";
				setShader("add_texture.fx");
				show = false;
			}
			
		};
		staticvar c = new img
		{
			src = "$./imgs/vs-3.tga";
			//pos = "430,320";
			halign(50,0);valign(50,0);
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
		};
	}
	var e = new img
	{
		src = "$./imgs/LV_Wang.tga";
		pos = ""+parent.width+",455";
		size = "131,59";	

		void LSHOW()
		{
			src = "$./imgs/LV_Vertical.tga";
			show = false;
			sleep(2200);
			show = true;
		}
	}
	var f = new img
	{
		src = "$./imgs/LV_Wang.tga";
		pos = "-200,60";
		size = "131,59";	

		void LSHOW()
		{
			src = "$./imgs/LV_Vertical.tga";
			show = false;
			sleep(2200);
			show = true;
		}
	}
	void VsDown()
	{
		staticvar d = new img3d
		{
			pos = "-1200,-1200";
			size = "2560,2560";
			src= "$./imgs/VS_Spiral.tga";
			setShader("2d_add_texture.fx");
//			setParamTimer("pos","-800,-800","448,320",133,0);
			setParamTimer("pos","-800,-800",""+((parent.width-width)/2+18)+","+(parent.height-height)/2,133,0);
//			setParamTimer("pos","448,320","384,256",167,133);
			setParamTimer("pos",""+((parent.width-width)/2+18)+","+(parent.height-height)/2,""+((parent.width-width)/2-48)+","+(parent.height-height)/2,167,133);
			setParamTimer("size","2560,2560","128,128",133,0);
			setParamTimer("size","128,128","256,256",167,133);
			timer(300,"del()");
		}
	}
	void ChangeVs()
	{
		c.src = "$./imgs/vs-4.tga";
	}
	void LevelShowT()
	{
		s_P1_CuLevel.show = true;
		s_P2_CuLevel.show = true;
	}
	void LevelShowF()
	{
		s_P1_CuLevel.show = false;
		s_P2_CuLevel.show = false;	
	}
	void LvShineShow()
	{
		s_P1_CuLevel.shinenum.show = true;
		s_P2_CuLevel.shinenum.show = true;
	}
	void LvShineShowF()
	{
		s_P1_CuLevel.shinenum.show = false;
		s_P2_CuLevel.shinenum.show = false;
	}
	void StartMusic()
	{
		window.PlaySound(110);
	}

	void Run()
	{
		e.setParamTimer("pos",""+width+",455","280,455",window._Time_Level_Fly,window._Time_Level_Fly_Wait,"LSHOW");
		e.setParamTimer("pos","280,455","280,"+height,window._Time_Level_Down,window._Time_Level_Down_Wait);
		f.setParamTimer("pos","-200,60","602,60",window._Time_Level_Fly,window._Time_Level_Fly_Wait,"LSHOW");
		f.setParamTimer("pos","602,60","602,-100",window._Time_Level_Down,window._Time_Level_Down_Wait);
//
		//s_P1attribute.setParamTimer("pos","900,525","0,525",window._Time_Statue_Fly,window._Time_Statue_Fly_Wait);
		//s_P1attribute.setParamTimer("pos","0,525","0,625",window._Time_VS_Black,window._Time_VS_Black_Wait);halign(100,width);valign(100,-100);
		s_P1attribute.setParamTimer("halign","100,"+width,"1,-10",window._Time_Statue_Fly,window._Time_Statue_Fly_Wait);
		s_P1attribute.setParamTimer("valign","100,-100","100,0",window._Time_VS_Black,window._Time_VS_Black_Wait);
//
//		s_P2attribute.setParamTimer("pos","-900,100","0,100",window._Time_Statue_Fly,window._Time_Statue_Fly_Wait);
//		s_P2attribute.setParamTimer("pos","0,100","0,0",window._Time_VS_Black,window._Time_VS_Black_Wait);halign(1,-width));valign(1,100);
//		s_P2attribute.setParamTimer("halign","1,-"+width,"100,0",window._Time_Statue_Fly,window._Time_Statue_Fly_Wait);
//		s_P2attribute.setParamTimer("valign","1,100","1,-10",window._Time_VS_Black,window._Time_VS_Black_Wait);
		s_P2attribute.setParamTimer("left","-900","0",window._Time_Statue_Fly,window._Time_Statue_Fly_Wait);
		s_P2attribute.setParamTimer("top","100","0",window._Time_VS_Black,window._Time_VS_Black_Wait);
		
		//_tempbottom.setParamTimer("pos","0,670","0,770",window._Time_VS_Black,window._Time_VS_Black_Wait);valign(100,-100);
		_tempbottom.setParamTimer("valign","100,0","100,100",window._Time_VS_Black,window._Time_VS_Black_Wait);
		//_temptop.setParamTimer("pos","0,0","0,-100",window._Time_VS_Black,window._Time_VS_Black_Wait);valign(1,110);
		//_temptop.setParamTimer("valign","1,-10","1,-110",window._Time_VS_Black,window._Time_VS_Black_Wait);
		_temptop.setParamTimer("top","0","-100",window._Time_VS_Black,window._Time_VS_Black_Wait);

		s_VS.b.setParamTimer("show",false,true,1,window._Time_VS_Down_Show);
		timer(2333,"VsDown");
		c.setParamTimer("alpha",100,0,600,window._Time_VS_Down_Show);
		s_VS.b.setParamTimer("show",true,false,1,4266);
		//c.setParamTimer("pos","433,323",""+width+",323",166,4266,"MoveCamera");
		c.setParamTimer("halign","50,0","100,"+c.width,166,4266,"MoveCamera");
//		s_P1Model.setParamTimer("pos","-700,0","-320,0",window._Time_Player_Run,window._Time_Player_Run_Wait,"LoadAct");
		s_P1Model.setParamTimer("left","-700","-"+parent.width/3,window._Time_Player_Run,window._Time_Player_Run_Wait,"LoadAct");
//		s_P1Model.setParamTimer("left","-700","-320",window._Time_Player_Run,window._Time_Player_Run_Wait,"LoadAct");
//		s_P2Mode2.setParamTimer("pos","700,-200","300,-200",window._Time_Player_Run,window._Time_Player_Run_Wait,"LoadAct");
		s_P2Mode2.setParamTimer("left","-"+(324-s_P2Mode2.width),"300",window._Time_Player_Run,window._Time_Player_Run_Wait,"LoadAct");

		timer(4266,"window.PlaySound(106)");
		timer(700,"StartMusic");
		timer(4300,"ChangeVs");
		timer(1200,"LevelShowT");
		timer(3333,"LevelShowF");
		timer(1333,"LvShineShow");
		timer(1667,"LvShineShowF");

		s_P1_CuLevel.LvPos();
		s_P2_CuLevel.LvPos();

		s_P1_CuLevel.shinenum.shinetop.setParamTimer("size","80,80","200,200",133,1333);
		s_P1_CuLevel.shinenum.shinetop.setParamTimer("pos","55,95","5,35",133,1333); 
		s_P1_CuLevel.shinenum.shinetop.setParamTimer("size","200,200","80,80",133,1467);
		s_P1_CuLevel.shinenum.shinetop.setParamTimer("pos","5,35","55,95",133,1467); 
		s_P1_CuLevel.shinenum.h_num.setParamTimer("size","66,62","200,200",133,1333);
		s_P1_CuLevel.shinenum.h_num.setParamTimer("size","200,200","66,62",133,1467);
		s_P1_CuLevel.shinenum.t_num.setParamTimer("size","66,62","200,200",133,1333);
		s_P1_CuLevel.shinenum.t_num.setParamTimer("size","200,200","66,62",133,1467);
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

		setParamTimer("alpha",50,100,window._Time_Back_Alpha,window._Time_Back_Alpha_Wait);
	}
	//UI测试函数
	void UITEST()
	{
		Init();
		s_P1Model.SetData(2,5,1);
		s_P2Mode2.SetData(2,5,1);
		s_P1attribute.Init();
		s_P2attribute.Init();
		s_P1_CuLevel.SetData("",22);
		s_P2_CuLevel.SetData("",80);
		s_P2attribute.s_TStrength.SetData("",50);
	}
};