//
//游戏内界面的界面部分的类定义:开始>>单打
//

//P1角色的属性-界面
class VRole_Attribute_P1_UI item
{
	size="100%,137";//bgcolor = "#FF";

	staticvar m_UID = 2;  //自己决定用的底图颜色，1为蓝，2为红

	//用户UID
	void Init(UID)
	{
		if (UID > 0)
		{
			var teamID = window.GetTeamByUID(UID);
			if( 1 == teamID|| 2 == teamID)
			{
				m_UID = (teamID%2)+1;
			}
		}

		new img
		{
			src = "$./imgs"+parent.m_UID+"/A_D_1.tga";size = "100%,100%";
		}
		new img //角色信息名
		{
			pos = "210,3";
			src = "$./imgs"+parent.m_UID+"/A_D_2.tga";
		}

		new img //力量
		{
			pos = "260,63";
			src = "$./imgs"+parent.m_UID+"/Strength.tga";
		}
		//力量
		staticvar s_TStrength = new text
		{
			size = "98,20";pos = "295,60";//xcenter = true;//src = "力量";bgcolor = "#FF";alpha=50;
			font = "宋体,-1,20";color = "#000000";
			void SetData(data1,data2){src = data2;}
		}


		new img //技术
		{
			pos = "390,63";
			src = "$./imgs"+parent.m_UID+"/Skill.tga";
		}
		//技术
		staticvar s_TSkill = new text
		{
			size = "98,20";pos = "425,60";//xcenter = true;
			font = "宋体,-1,20";color = "#000000";
			void SetData(data1,data2){src = data2;}
		}


		new img //前场
		{
			pos = "520,63";
			src = "$./imgs"+parent.m_UID+"/ForceHand.tga";
		}
		//前场
		staticvar s_TForceHand = new text
		{
			size = "100,20";pos = "555,60";//xcenter = true;
			font = "宋体,-1,20";color = "#000000";
			void SetData(data1,data2){src = data2;}
		}


		new img //后场
		{
			pos = "650,63";
			src = "$./imgs"+parent.m_UID+"/BackHand.tga";
		}
		//后场
		staticvar s_TBackHand = new text
		{
			size = "100,20";pos = "685,60";//xcenter = true;
			font = "宋体,-1,20";color = "#000000";
			void SetData(data1,data2){src = data2;}
		}

		new img //发球
		{
			pos = "260,85";
			src = "$./imgs"+parent.m_UID+"/Serve.tga";
		}
		//发球
		staticvar s_TServe = new text
		{
			size = "98,20";pos = "295,82";//xcenter = true;
			font = "宋体,-1,20";color = "#000000";
			void SetData(data1,data2){src = data2;}
		}

		new img //能量
		{
			pos = "390,85";
			src = "$./imgs"+parent.m_UID+"/Energy.tga";
		}
		//能量
		staticvar s_TEnergy = new text
		{
			size = "90,20";pos = "425,82";//xcenter = true;
			font = "宋体,-1,20";color = "#000000";
			void SetData(data1,data2){src = data2;}
		}

		new img //体力
		{
			pos = "520,85";
			src = "$./imgs"+parent.m_UID+"/PhysicalF.tga";
		}
		//体力
		staticvar s_TPhysicalF = new text
		{
			size = "100,20";pos = "555,82";//xcenter = true;
			font = "宋体,-1,20";color = "#000000";
			void SetData(data1,data2){src = data2;}
		}
		new img //昵称
		{
			pos = "455,22";
			src = "$./imgs"+parent.m_UID+"/Nkname.tga";
		}
		//昵称
		staticvar s_Nkname = new text
		{
			size = "150,20";pos = "495,22";xcenter = true;ycenter = true;
			font = "黑体,-1,20";color = "#ffffff";
			void SetData(data1,data2){src = data2;}
		}

		new img //称号
		{
			pos = "673,26";
			src = "$./imgs"+parent.m_UID+"/Title.tga";
		}
		//称号
		staticvar s_Title = new text
		{
			size = "160,26";pos = "668,22";xcenter = true;ycenter = true;//src = "力量";bgcolor = "#FF";alpha=50;
			font = "黑体,-1,12";color = "#ffffff";
			void SetData(data1,data2){src = window.GetQualifyByQID(data2);}
		}
	}
};
/////////////////////////////////////////////////////////////////////////////////////////
//P2角色的属性-界面
class VRole_Attribute_P2_UI item
{
	size="100%,137";
	staticvar m_UID = 1;  //自己决定用的底图颜色，1为蓝，2为红

	//用户UID
	void Init(UID)
	{
		if (UID > 0)
		{
			var teamID = window.GetTeamByUID(UID);
			if( 1 == teamID|| 2 == teamID)
			{
				m_UID = (teamID%2)+1;
			}
		}

		new img
		{
			src = "$./imgs"+parent.m_UID+"/B_D_1.tga";size = "100%,100%";
		}
		new img
		{
			pos = "320,30";
			src = "$./imgs"+parent.m_UID+"/B_D_2.tga";
		}

		new img //力量
		{
			pos = "366,90";
			src = "$./imgs"+parent.m_UID+"/Strength.tga";
		}
			//力量
		staticvar s_TStrength = new text
		{
			size = "98,20";pos = "400,87";//xcenter = true;
			font = "宋体,-1,20";color = "#000000";
			void SetData(data1,data2){src = data2;}
		}


		new img //技术
		{
			pos = "480,90";
			src = "$./imgs"+parent.m_UID+"/Skill.tga";
		}
		//技术
		staticvar s_TSkill = new text
		{
			size = "98,20";pos = "517,87";//xcenter = true;
			font = "宋体,-1,20";color = "#000000";
			void SetData(data1,data2){src = data2;}
		}


		new img //前场
		{
			pos = "599,90";
			src = "$./imgs"+parent.m_UID+"/ForceHand.tga";
		}
		//前场
		staticvar s_TForceHand = new text
		{
			size = "100,20";pos = "636,87";//xcenter = true;
			font = "宋体,-1,20";color = "#000000";
			void SetData(data1,data2){src = data2;}
		}
		


		new img //后场
		{
			pos = "718,90";
			src = "$./imgs"+parent.m_UID+"/BackHand.tga";
		}
		//后场
		staticvar s_TBackHand = new text
		{
			size = "100,20";pos = "754,87";//xcenter = true;
			font = "宋体,-1,20";color = "#000000";
			void SetData(data1,data2){src = data2;}
		}

		new img //发球
		{
			pos = "480,112";
			src = "$./imgs"+parent.m_UID+"/Serve.tga";
		}
		//发球
		staticvar s_TServe = new text
		{
			size = "100,20";pos = "517,109";//xcenter = true;
			font = "宋体,-1,20";color = "#000000";
			void SetData(data1,data2){src = data2;}
		}

		new img //能量
		{
			pos = "599,112";
			src = "$./imgs"+parent.m_UID+"/Energy.tga";
		}
		//能量
		staticvar s_TEnergy = new text
		{
			size = "100,20";pos = "636,109";//xcenter = true;//src = "力量";bgcolor = "#FF";alpha=50;
			font = "宋体,-1,20";color = "#000000";
			void SetData(data1,data2){src = data2;}
		}

		new img //体力
		{
			pos = "718,112";
			src = "$./imgs"+parent.m_UID+"/PhysicalF.tga";
		}
		//体力
		staticvar s_TPhysicalF = new text
		{
			size = "100,20";pos = "754,109";//xcenter = true;
			font = "宋体,-1,20";color = "#000000";
			void SetData(data1,data2){src = data2;}
		}


		new img //昵称
		{
			pos = "785,46";
			src = "$./imgs"+parent.m_UID+"/Nkname.tga";
		}
		//昵称
		staticvar s_Nkname = new text
		{
			size = "150,26";pos = "635,44";xcenter = true;ycenter = true;
			font = "黑体,-1,20";color = "#ffffff";
			void SetData(data1,data2){src = data2;}
		}

		new img //称号
		{
			pos = "575,50";
			src = "$./imgs"+parent.m_UID+"/Title.tga";
		}
		//称号
		staticvar s_Title = new text
		{
			size = "120,20";pos = "470,50";xcenter = true;ycenter = true;//src = "力量";bgcolor = "#FF";alpha=50;
			font = "黑体,-1,12";color = "#ffffff";
			void SetData(data1,data2){src = window.GetQualifyByQID(data2);}
		}
	}
};