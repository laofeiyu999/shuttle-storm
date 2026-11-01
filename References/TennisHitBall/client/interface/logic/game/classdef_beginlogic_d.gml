//
//游戏内界面的逻辑部分:开始>>双打
//
import("$./ClassDef_BeginLogic_Sub.gml");
import("$./../../UI/Game/ClassDef_BeginUI_D.gml");

//
//游戏开始的界面-容器-逻辑
//
class VGame_Begin_D_Logic item
{
	size = "100%,100%";

	//=================================与显示交互部分=====================================
	void Init()
	{
		//左边P1的属性
		//参数：见类定义
		staticvar s_P1attribute = new VRole_Attribute_Logic{pos = "0,0";}	
		
		//右边P2的属性
		//参数：见类定义
		staticvar s_P2attribute = new VRole_Attribute_Logic{pos = "900,0";}
		
		//左边P3的属性
		//参数：见类定义
		staticvar s_P3attribute = new VRole_Attribute_Logic{pos = "0,600";}	
		
		//右边P4的属性
		//参数：见类定义
		staticvar s_P4attribute = new VRole_Attribute_Logic{pos = "900,600";}

		//VS
		//参数:无
		staticvar s_VS = new VMyText{valign = "50,0";halign = "50,0";}		
		
		//模型1-一队
		//参数data1:RoleID
		//参数data2:动作的索引
		//参数data3:性别
		staticvar s_P1Model = new VMyText{pos = "300,350";}	

		//模型2-二队
		//参数data2:RoleID
		//参数data3:动作的索引
		//参数data3:性别
		staticvar s_P2Mode2 = new VMyText{pos = "800,350";}	

		//模型3-一队
		//参数data1:RoleID
		//参数data2:动作的索引
		//参数data3:性别
		staticvar s_P1Mode3 = new VMyText{pos = "300,350";}	

		//模型4-二队
		//参数data2:RoleID
		//参数data3:动作的索引
		//参数data3:性别
		staticvar s_P2Mode4 = new VMyText{pos = "800,350";}	

		//玩家1等级
		//参数 data2
		staticvar s_P1_CuLevel = new VMyText{pos = "10,200";}

		//玩家2等级
		//参数 data2
		staticvar s_P2_CuLevel = new VMyText{pos = "100,200";}

		//玩家3等级
		//参数 data2
		staticvar s_P3_CuLevel = new VMyText{pos = "10,250";}

		//玩家4等级
		//参数 data2
		staticvar s_P4_CuLevel = new VMyText{pos = "100,250";}
	}
	//显示的类
	inclass("VGame_Begin_D_UI");
	//====================================================================================

	void OnCreated()
	{
		Init();
		s_P1attribute.Init();
		s_P2attribute.Init();
		s_P3attribute.Init();
		s_P4attribute.Init();

		s_P1attribute.s_TStrength.SetData("1力量：",parent._User1.GetStrength(),"");
		s_P1attribute.s_TSkill.SetData("1技术：",parent._User1.GetSkill(),"");
		s_P1attribute.s_TForceHand.SetData("1正手：",parent._User1.GetForceHand(),"");
		s_P1attribute.s_TBackHand.SetData("1反手：",parent._User1.GetBackHand(),"");
		s_P1attribute.s_TEnergy.SetData("1能量：",parent._User1.GetEnergy(),"");
		s_P1_CuLevel.SetData("1等级：",parent._User1.GetCurLevel(),"");
		s_P1attribute.s_Nkname.SetData("1昵称:",parent._User1.GetNkName(),"");
		s_P1attribute.s_Title.SetData("1称号：",parent._User1.GetTitle(),"");

		s_P2attribute.s_TStrength.SetData("2力量：",parent._User2.GetStrength(),"");
		s_P2attribute.s_TSkill.SetData("2技术：",parent._User2.GetSkill(),"");
		s_P2attribute.s_TForceHand.SetData("2正手：",parent._User2.GetForceHand(),"");
		s_P2attribute.s_TBackHand.SetData("2反手：",parent._User2.GetBackHand(),"");
		s_P2attribute.s_TEnergy.SetData("2能量：",parent._User2.GetEnergy(),"");
		s_P2_CuLevel.SetData("2等级：",parent._User2.GetCurLevel(),"");
		s_P2attribute.s_Nkname.SetData("2昵称:",parent._User2.GetNkName(),"");
		s_P2attribute.s_Title.SetData("2称号：",parent._User2.GetTitle(),"");
		
		s_P3attribute.s_TStrength.SetData("3力量：",parent._User3.GetStrength(),"");
		s_P3attribute.s_TSkill.SetData("3技术：",parent._User3.GetSkill(),"");
		s_P3attribute.s_TForceHand.SetData("3正手：",parent._User3.GetForceHand(),"");
		s_P3attribute.s_TBackHand.SetData("3反手：",parent._User3.GetBackHand(),"");
		s_P3attribute.s_TEnergy.SetData("3能量：",parent._User3.GetEnergy(),"");
		s_P3_CuLevel.SetData("3等级：",parent._User3.GetCurLevel(),"");
		s_P3attribute.s_Nkname.SetData("3昵称:",parent._User3.GetNkName(),"");
		s_P3attribute.s_Title.SetData("3称号：",parent._User3.GetTitle(),"");

		s_P4attribute.s_TStrength.SetData("4力量：",parent._User4.GetStrength(),"");
		s_P4attribute.s_TSkill.SetData("4技术：",parent._User4.GetSkill(),"");
		s_P4attribute.s_TForceHand.SetData("4正手：",parent._User4.GetForceHand(),"");
		s_P4attribute.s_TBackHand.SetData("4反手：",parent._User4.GetBackHand(),"");
		s_P4attribute.s_TEnergy.SetData("4能量：",parent._User4.GetEnergy(),"");
		s_P4_CuLevel.SetData("4等级：",parent._User4.GetCurLevel(),"");
		s_P4attribute.s_Nkname.SetData("4昵称:",parent._User4.GetNkName(),"");
		s_P4attribute.s_Title.SetData("4称号：",parent._User4.GetTitle(),"");

		var _TActID1 = 5;	//玩家1的挑衅动作 5,6,7
		var _TActID2 = 5;	//玩家2的挑衅动作
		var _TActID3 = 5;	//玩家3的挑衅动作
		var _TActID4 = 5;	//玩家4的挑衅动作

		switch (parent._User1.GetCharacter())
		{
			case 1:{_TActID1 = 5;break;}
			case 2:{_TActID1 = 6;break;}
			case 3:{_TActID1 = 7;break;}
		}
		switch (parent._User2.GetCharacter())
		{
			case 1:{_TActID2 = 5;break;}
			case 2:{_TActID2 = 6;break;}
			case 3:{_TActID2 = 7;break;}
		}
		switch (parent._User3.GetCharacter())
		{
			case 1:{_TActID3 = 5;break;}
			case 2:{_TActID3 = 6;break;}
			case 3:{_TActID3 = 7;break;}
		}
		switch (parent._User4.GetCharacter())
		{
			case 1:{_TActID4 = 5;break;}
			case 2:{_TActID4 = 6;break;}
			case 3:{_TActID4 = 7;break;}
		}
		s_P1Model.SetData(parent._User1.GetRID(),_TActID1,parent._User1.GetSex());
		s_P2Mode2.SetData(parent._User2.GetRID(),_TActID2,parent._User2.GetSex());
		s_P1Mode3.SetData(parent._User3.GetRID(),_TActID3,parent._User3.GetSex());
		s_P2Mode4.SetData(parent._User4.GetRID(),_TActID4,parent._User4.GetSex());

		s_VS.SetData("VS","");
	}
};