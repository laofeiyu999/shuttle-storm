//升级和获得称号提示的显示类
//2009-2-21
//吴楠

class VQualifyLv_UI item
{
	size="100%,100%";
	var key = 1;//控制音乐播放的开关
	group = 1;
	var m_aniloops = 2;
	void Init()
	{
		//升级提示
		staticvar s_LvUp = new item
		{
			size="100%,100%";
			var _Up = new img
			{
				size(97,81);pos(-100,230);show=true;
				src="$./../../PublicImage/Title/Up.tga";
			}
			var _Lv = new img
			{
				size(97,81);pos(1100,230);show=true;
				src="$./../../PublicImage/Title/Lv.tga";
			}
			var _LvUp = new img
			{
				size(186,81);
				//valign(15,0);halign(20,0);
				pos(540,140);
				show=false;
				src="$./../../PublicImage/Title/sj-text.tga";
			}
			var _LvUp_White = new img
			{
				size(186,81);
				//valign(15,0);halign(20,0);
				pos(540,140);
				show=false;
				src="$./../../PublicImage/Title/LvUp_White.tga";
			}
			var _Light1_Box = new item
			{
				size(400,200);pos(255,165);
				var _Light1 = new img
				{
					size="100%,100%";
					src="$./../../PublicImage/Title/c021611.tga";
					clipani(128,64,4,4);
					anispeed = -1;
					aniindex = 15;
					setShader("2d_add_texture.fx");
				}
			}
			var _CurLvBk = new img
			{
				size = "46,29";
				src = "$./../../PublicImage/Title/lv/LV.tga";
				pos(595,60);
				show = false;
			}
			var _CurLv = new VN2NumShow
			{
				size = "24,28";
				src = "$./../../PublicImage/Title/lv/sz.tga";
				show = false;
				//xcenter = true;ycenter = true;
				pos(645,60);
				void SetData(num)
				{
					if(toint(num)>0)
					{
						var _tempNum = toint(num);
						var _tempCount = tostring(_tempNum).Count;
						_tempCount = toint(_tempCount);
						var _numSizeX = _tempCount*24;
						size(_numSizeX,20);
						setNum(_tempNum);
						parent._addIcon.show = true;
						show = true;
					}
					else
					{
						show = false;
					}
				}
			}
			var _Light2_Box = new item
			{
				size(400,400);pos(250,60);
				var _Light2 = new img
				{
					size="100%,100%";
					src="$./../../PublicImage/Title/c021621.tga";
					clipani(128,128,1,4);
					anispeed = -1;
					aniindex = 3;
					setShader("2d_add_texture.fx");
				}
			}
			void LvUpShow()
			{
				_Light1_Box._Light1.anispeed=45;
				_Light1_Box._Light1.aniloops = group.m_aniloops;
				_Light2_Box._Light2.anispeed=15;
				_Light2_Box._Light2.aniloops = group.m_aniloops;
				_LvUp.show=true;
				_Up.show=false;
				_Lv.show=false;
				_LvUp_White.show=true;
			}
			void showFalse()
			{
				_LvUp_White.del();
			}
			void fire1Show()
			{
				parent.showFire(1);
			}
			void LvUpSound()
			{
				window.PlaySound(108);
			}
			void FireSound_1()
			{
				window.PlaySound(140);
			}
			void LvUpFalse()
			{
				_LvUp.del();
			}
			//设置升级
			//参数：级数
			void showLvUp(CuLevel)
			{
				parent.key = 0;//得称号就不再播放背景音乐
				_Up.setParamTimer("pos","-100,230","540,140",100,300);
				_Lv.setParamTimer("pos","1100,230","560,140",100,300);
				_CurLvBk.show = true;
				_CurLv.SetData(CuLevel);
				timer(800,"LvUpSound");
				timer(400,"FireSound_1");
				timer(400,"LvUpShow");
				timer(400,"showFalse");
				timer(700,"fire1Show");
				timer(window._Time_QualifyAndLvUp_Msg,"LvUpFalse");
			}
		}
		//称号提示
		staticvar s_Qualify = new item
		{
			//alert(1);
			size="100%,100%";
			var _qualifyBk = new img
			{
				size(2488,228);pos(-600,400);
				src = "$./../../PublicImage/Title/gxhd cs.tga";
				show = false;
				var _Light_G = new scene
				{
					var _Light = new fmodel
					{
						src = "$./../../../../model/c01131.v3f";
						pos="0,-0.5,14.4";
						setShader("add_texture.fx");
					}
				}
			}
			var _Qualify = new img
			{
				size(1488,228);pos(-600,400);show=false;
			}
			void paramShow()
			{
				_qualifyBk.show = true;
				_Qualify.show=true;
				_qualifyBk.setParamTimer("size","2488,228","807,74",150,0);
				_Qualify.setParamTimer("size","2488,228","1607,74",150,0);
				_qualifyBk.setParamTimer("pos","-600,300","130,400",150,0);
				_Qualify.setParamTimer("pos","-600,300","130,400",150,0);

				_qualifyBk.setParamTimer("size","807,74","835,80",50,150);
				_Qualify.setParamTimer("size","1607,74","835,80",50,150);
				_qualifyBk.setParamTimer("pos","130,400","120,398",50,150);
				_Qualify.setParamTimer("pos","130,400","320,398",50,150);

				_qualifyBk.setParamTimer("size","835,80","807,74",50,200);
				_Qualify.setParamTimer("size","835,80","407,74",50,200);
				_qualifyBk.setParamTimer("pos","120,398","130,400",50,200);
				_Qualify.setParamTimer("pos","320,398","400,400",50,200);
			}
			void lightFalse()
			{
				_qualifyBk._Light_G._Light.show=false;
			}
			void fire2Show()
			{
				parent.showFire(2);
			}
			void QualifySound()
			{
				if (parent.key == 1)
				{
					window.PlaySound(108);
				}
			}
			void FireSound_2()
			{
				window.PlaySound(141);
			}
			void QualifyFalse()
			{
				//_Qualify.del();
				//_qualifyBk.del();
			}
			//设置称号
			//参数：称号名称
			void SetData(QualifyData)
			{
				_Qualify.src="$./../../PublicImage/Title/chmc_"+QualifyData+".tga";
				switch (parent.key)
				{
				case 0://先播升级特效
					{
						timer(1500,"QualifySound");
						timer(1500,"FireSound_2");
						timer(1600,"paramShow");
						timer(2800,"lightFalse");
						timer(2000,"fire2Show");
						timer(4000,"QualifyFalse");
						break;
					}
				case 1://直接播称号特效
					{
						timer(600,"QualifySound");
						timer(400,"FireSound_2");
						timer(400,"paramShow");
						timer(1600,"lightFalse");
						timer(700,"fire2Show");
						timer(3000,"QualifyFalse");
						break;
					}
				}
			}
		}//end of s_Qualify

		staticvar s_Fireworks1 = new img3d
		{
			size(256,256);
			src="$./../../PublicImage/Title/c021631.tga";
			clipani(64,64,8,1);
			anispeed = -1;
			aniindex = 7;
			setShader("2d_add_texture.fx");
		}
		staticvar s_Fireworks2 = new img3d
		{
			size(256,256);
			src="$./../../PublicImage/Title/c031061.tga";
			clipani(64,64,8,1);
			anispeed = -1;
			aniindex = 7;
			setShader("2d_add_texture.fx");
		}
		staticvar s_Fireworks3 = new img3d
		{
			size(256,256);
			src="$./../../PublicImage/Title/c011321.tga";
			clipani(64,64,8,1);
			anispeed = -1;
			aniindex = 7;
			setShader("2d_add_texture.fx");
		}
		staticvar s_Fireworks4 = new img3d
		{
			size(256,256);
			src="$./../../PublicImage/Title/c031061.tga";
			clipani(64,64,8,1);
			anispeed = -1;
			aniindex = 7;
			setShader("2d_add_texture.fx");
		}
		staticvar s_Fireworks5 = new img3d
		{
			size(256,256);
			src="$./../../PublicImage/Title/c021631.tga";
			clipani(64,64,8,1);
			anispeed = -1;
			aniindex = 7;
			setShader("2d_add_texture.fx");
		}
		staticvar s_Fireworks6 = new img3d
		{
			size(256,256);
			src="$./../../PublicImage/Title/c011321.tga";
			clipani(64,64,8,1);
			anispeed = -1;
			aniindex = 7;
			setShader("2d_add_texture.fx");
		}
	}//end of Init()

	void setFire1()
	{
		s_Fireworks1.anispeed=16;
		s_Fireworks1.aniloops = group.m_aniloops;
	}
	void setFire2()
	{
		s_Fireworks2.anispeed=16;
		s_Fireworks2.aniloops = group.m_aniloops;
	}
	void setFire3()
	{
		s_Fireworks3.anispeed=16;
		s_Fireworks3.aniloops = group.m_aniloops;
	}
	void setFire4()
	{
		s_Fireworks4.anispeed=16;
		s_Fireworks4.aniloops = group.m_aniloops;
	}
	void setFire5()
	{
		s_Fireworks5.anispeed=16;
		s_Fireworks5.aniloops = group.m_aniloops;
	}
	void setFire6()
	{
		s_Fireworks6.anispeed=16;
		s_Fireworks6.aniloops = group.m_aniloops;
	}
	//设置烟花
	void showFire(type)
	{
		if(type == 1)//升级的烟花效果和音效
		{
			s_Fireworks1.pos(250,110);
			s_Fireworks2.pos(420,70);
			s_Fireworks3.pos(190,160);
			s_Fireworks4.pos(70,60);
			s_Fireworks5.pos(430,40);
			s_Fireworks6.pos(420,190);
			setFire1();
			timer(310,"setFire2");
			timer(510,"setFire3");
			timer(710,"setFire4");
			timer(810,"setFire5");
			timer(1110,"setFire6");
		}
		if(type == 2)//得称号的烟花效果和音效
		{
			s_Fireworks1.pos(450,210);
			s_Fireworks2.pos(250,280);
			s_Fireworks3.pos(450,350);
			s_Fireworks4.pos(300,450);
			s_Fireworks5.pos(650,320);
			s_Fireworks6.pos(120,190);
			setFire1();
			timer(200,"setFire2");
			timer(400,"setFire3");
			timer(600,"setFire4");
			timer(800,"setFire5");
			timer(1000,"setFire6");
		}
	}
};