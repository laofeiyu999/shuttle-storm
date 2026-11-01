// 煙花道具特效類
// chenjihui 2010-12-29
// modify 2011-1-11
class FireworksQualify_UI item
{
	size="100%,100%";
	group = 1;
	var m_aniloops = 2;

//	void Init()
//	{
		staticvar springFireworks = new item
		{
			size="100%,100%";
			void startShow()
			{
				parent.showFire();
			}
			void delet()
			{
				sleep(3015);
				delallchild();
			}
		}

		staticvar s_Fireworks1 = new img3d
		{
			size(356,356);
			src="$./../../../UI/PublicImage/Title/c021631.tga";
			clipani(64,64,8,1);
			anispeed = -1;
			aniindex = 7;
			setShader("2d_add_texture.fx");
		}
		staticvar s_Fireworks2 = new img3d
		{
			size(256,256);
			src="$./../../../UI/PublicImage/Title/c031061.tga";
			clipani(64,64,8,1);
			anispeed = -1;
			aniindex = 7;
			setShader("2d_add_texture.fx");
		}
		staticvar s_Fireworks3 = new img3d
		{
			size(256,256);
			src="$./../../../UI/PublicImage/Title/c011321.tga";
			clipani(64,64,8,1);
			anispeed = -1;
			aniindex = 7;
			setShader("2d_add_texture.fx");
		}
		staticvar s_Fireworks4 = new img3d
		{
			size(256,256);
			src="$./../../../UI/PublicImage/Title/c031061.tga";
			clipani(64,64,8,1);
			anispeed = -1;
			aniindex = 7;
			setShader("2d_add_texture.fx");
		}
		staticvar s_Fireworks5 = new img3d
		{
			size(256,356);
			src="$./../../../UI/PublicImage/Title/c021631.tga";
			clipani(64,64,8,1);
			anispeed = -1;
			aniindex = 7;
			setShader("2d_add_texture.fx");
		}
		staticvar s_Fireworks6 = new img3d
		{
			size(356,356);
			src="$./../../../UI/PublicImage/Title/c011321.tga";
			clipani(64,64,8,1);
			anispeed = -1;
			aniindex = 7;
			setShader("2d_add_texture.fx");
		}
		staticvar s_Fireworks7 = new img3d
		{
			size(156,156);
			src="$./../../../UI/PublicImage/Title/c031061.tga";
			clipani(64,64,8,1);
			anispeed = -1;
			aniindex = 7;
			setShader("2d_add_texture.fx");
		}
		staticvar s_Fireworks8 = new img3d
		{
			size(156,156);
			src="$./../../../UI/PublicImage/Title/c011321.tga";
			clipani(64,64,8,1);
			anispeed = -1;
			aniindex = 7;
			setShader("2d_add_texture.fx");
		}
		staticvar s_Fireworks9 = new img3d
		{
			size(256,256);
			src="$./../../../UI/PublicImage/Title/c021631.tga";
			clipani(64,64,8,1);
			anispeed = -1;
			aniindex = 7;
			setShader("2d_add_texture.fx");
		}

		staticvar s_Fireworks10 = new img3d
		{
			size(356,356);
			src="$./../../../UI/PublicImage/Title/c021631.tga";
			clipani(64,64,8,1);
			anispeed = -1;
			aniindex = 7;
			setShader("2d_add_texture.fx");
		}
		staticvar s_Fireworks11 = new img3d
		{
			size(256,256);
			src="$./../../../UI/PublicImage/Title/c031061.tga";
			clipani(64,64,8,1);
			anispeed = -1;
			aniindex = 7;
			setShader("2d_add_texture.fx");
		}
		staticvar s_Fireworks12 = new img3d
		{
			size(256,256);
			src="$./../../../UI/PublicImage/Title/c011321.tga";
			clipani(64,64,8,1);
			anispeed = -1;
			aniindex = 7;
			setShader("2d_add_texture.fx");
		}
		staticvar s_Fireworks13 = new img3d
		{
			size(256,256);
			src="$./../../../UI/PublicImage/Title/c031061.tga";
			clipani(64,64,8,1);
			anispeed = -1;
			aniindex = 7;
			setShader("2d_add_texture.fx");
		}
		staticvar s_Fireworks14 = new img3d
		{
			size(256,356);
			src="$./../../../UI/PublicImage/Title/c021631.tga";
			clipani(64,64,8,1);
			anispeed = -1;
			aniindex = 7;
			setShader("2d_add_texture.fx");
		}
		staticvar s_Fireworks15 = new img3d
		{
			size(356,356);
			src="$./../../../UI/PublicImage/Title/c011321.tga";
			clipani(64,64,8,1);
			anispeed = -1;
			aniindex = 7;
			setShader("2d_add_texture.fx");
		}
		staticvar s_Fireworks16 = new img3d
		{
			size(156,156);
			src="$./../../../UI/PublicImage/Title/c031061.tga";
			clipani(64,64,8,1);
			anispeed = -1;
			aniindex = 7;
			setShader("2d_add_texture.fx");
		}
		staticvar s_Fireworks17 = new img3d
		{
			size(156,156);
			src="$./../../../UI/PublicImage/Title/c011321.tga";
			clipani(64,64,8,1);
			anispeed = -1;
			aniindex = 7;
			setShader("2d_add_texture.fx");
		}
		staticvar s_Fireworks18 = new img3d
		{
			size(256,256);
			src="$./../../../UI/PublicImage/Title/c021631.tga";
			clipani(64,64,8,1);
			anispeed = -1;
			aniindex = 7;
			setShader("2d_add_texture.fx");
		}
//	}

	

	//烟花音效
	void FireSound()
	{
		window.PlaySound(115);
	}

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
	void setFire7()
	{
		s_Fireworks7.anispeed=16;
		s_Fireworks7.aniloops = group.m_aniloops;
	}
	void setFire8()
	{
		s_Fireworks8.anispeed=16;
		s_Fireworks8.aniloops = group.m_aniloops;
	}
	void setFire9()
	{
		s_Fireworks9.anispeed=16;
		s_Fireworks9.aniloops = group.m_aniloops;
	}
	void setFire10()
	{
		s_Fireworks10.anispeed=16;
		s_Fireworks10.aniloops = group.m_aniloops;
	}
	void setFire11()
	{
		s_Fireworks11.anispeed=16;
		s_Fireworks11.aniloops = group.m_aniloops;
	}
	void setFire12()
	{
		s_Fireworks12.anispeed=16;
		s_Fireworks12.aniloops = group.m_aniloops;
	}
	void setFire13()
	{
		s_Fireworks13.anispeed=16;
		s_Fireworks13.aniloops = group.m_aniloops;
	}
	void setFire14()
	{
		s_Fireworks14.anispeed=16;
		s_Fireworks14.aniloops = group.m_aniloops;
	}
	void setFire15()
	{
		s_Fireworks15.anispeed=16;
		s_Fireworks15.aniloops = group.m_aniloops;
	}
	void setFire16()
	{
		s_Fireworks16.anispeed=16;
		s_Fireworks16.aniloops = group.m_aniloops;
	}
	void setFire17()
	{
		s_Fireworks17.anispeed=16;
		s_Fireworks17.aniloops = group.m_aniloops;
	}
	void setFire18()
	{
		s_Fireworks18.anispeed=16;
		s_Fireworks18.aniloops = group.m_aniloops;
	}
	void setFire19()
	{
		s_Fireworks7.pos(850,30);
		s_Fireworks7.anispeed=16;
		s_Fireworks7.aniloops = group.m_aniloops;
	}
	void setFire20()
	{
		s_Fireworks15.pos(700,190);
		s_Fireworks15.anispeed=16;
		s_Fireworks15.aniloops = group.m_aniloops;
	}
	void setFire21()
	{
		s_Fireworks9.pos(780,80);
		s_Fireworks9.anispeed=16;
		s_Fireworks9.aniloops = group.m_aniloops;
	}
	void setFire22()
	{
		s_Fireworks18.pos(700,120);
		s_Fireworks18.anispeed=16;
		s_Fireworks18.aniloops = group.m_aniloops;
	}
	void setFire23()
	{
		s_Fireworks14.pos(630,100);
		s_Fireworks14.anispeed=16;
		s_Fireworks14.aniloops = group.m_aniloops;
	}
	void setFire24()
	{
		s_Fireworks11.pos(620,50);
		s_Fireworks11.anispeed=16;
		s_Fireworks11.aniloops = group.m_aniloops;
	}
	void setFire25()
	{
		s_Fireworks10.pos(650,150);
		s_Fireworks10.anispeed=16;
		s_Fireworks10.aniloops = group.m_aniloops;
	}

	//设置烟花
	void showFire()
	{
		s_Fireworks1.pos(250,110);
		s_Fireworks2.pos(320,70);
		s_Fireworks3.pos(190,160);
		s_Fireworks4.pos(70,60);
		s_Fireworks5.pos(150,100);
		s_Fireworks6.pos(200,190);
		s_Fireworks7.pos(380,30);
		s_Fireworks8.pos(30,50);
		s_Fireworks9.pos(280,80);
		s_Fireworks10.pos(150,150);
		s_Fireworks11.pos(120,50);
		s_Fireworks12.pos(290,260);
		s_Fireworks13.pos(320,160);
		s_Fireworks14.pos(130,100);
		s_Fireworks15.pos(200,190);
		s_Fireworks16.pos(50,320);
		s_Fireworks17.pos(30,300);
		s_Fireworks18.pos(200,120);
		setFire1();
		timer(310,"setFire2");
		timer(50,"FireSound");
		timer(410,"setFire14");
		timer(510,"setFire4");
		timer(610,"setFire19");
		timer(810,"setFire1");
		timer(910,"setFire3");
		timer(1010,"setFire20");
		timer(1000,"setFire11");
		timer(1110,"setFire6");
		timer(1200,"setFire21");
		timer(1210,"setFire18");
		timer(1310,"setFire4");
		timer(1350,"setFire22");
		timer(1410,"setFire12");
		timer(1510,"setFire8");
		timer(1550,"setFire23");
		timer(1610,"setFire10");
		timer(1710,"setFire7");
		timer(1810,"setFire17");
		timer(1800,"setFire24");
		timer(1910,"setFire9");
		timer(2000,"setFire15");
		timer(2700,"setFire25");
		timer(2110,"setFire4");
		timer(2510,"setFire1");
		timer(2310,"setFire13");
		timer(3010,"setFire6");
	}
};
