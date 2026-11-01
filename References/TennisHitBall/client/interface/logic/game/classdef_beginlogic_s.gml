//
//游戏内界面的逻辑部分:开始>>单打
//
import("$./ClassDef_BeginLogic_Sub.gml");
import("$./../../UI/Game/ClassDef_BeginUI_S.gml");

//
//游戏开始的界面-容器-逻辑
//
class VGame_Begin_S_Logic item
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
		
		//VS
		//参数:无
		staticvar s_VS = new VMyText{valign = "50,0";halign = "50,0";}		
		
		//模型1
		//参数data1:RoleID
		//参数data2:动作的索引
		//参数data3:性别
		staticvar s_P1Model = new VMyText{pos = "300,350";}	

		//模型2
		//参数data2:RoleID
		//参数data3:动作的索引
		//参数data3:性别
		staticvar s_P2Mode2 = new VMyText{pos = "800,350";}	

		//玩家1等级
		//参数 data2
		staticvar s_P1_CuLevel = new VMyText{pos = "10,200";}

		//玩家2等级
		//参数 data2
		staticvar s_P2_CuLevel = new VMyText{pos = "100,200";}
	}
	//显示的类
	inclass("VGame_Begin_S_UI");
	//====================================================================================

	void OnCreated()
	{
		Init();
		s_P1attribute.Init(parent._User1.GetUID());
		s_P2attribute.Init(parent._User2.GetUID());

		s_P1attribute.s_TStrength.SetData("力量：",parent._User1.GetStrength(),"");
		s_P1attribute.s_TSkill.SetData("技术：",parent._User1.GetSkill(),"");
		s_P1attribute.s_TForceHand.SetData("正手：",parent._User1.GetForceHand(),"");
		s_P1attribute.s_TBackHand.SetData("反手：",parent._User1.GetBackHand(),"");
		s_P1attribute.s_TEnergy.SetData("能量：",parent._User1.GetEnergy(),"");
		s_P1attribute.s_TServe.SetData("发球： ",parent._User1.GetServe(),"");
		s_P1attribute.s_TPhysicalF.SetData("体力：",parent._User1.GetStamina(),"");
		s_P1_CuLevel.SetData("等级：",parent._User1.GetCurLevel(),"");
		s_P1attribute.s_Nkname.SetData("昵称:",parent._User1.GetNkName(),"");
		s_P1attribute.s_Title.SetData("称号：",parent._User1.GetTitle(),"");

		s_P2attribute.s_TStrength.SetData("力量：",parent._User2.GetStrength(),"");
		s_P2attribute.s_TSkill.SetData("技术：",parent._User2.GetSkill(),"");
		s_P2attribute.s_TForceHand.SetData("正手：",parent._User2.GetForceHand(),"");
		s_P2attribute.s_TBackHand.SetData("反手：",parent._User2.GetBackHand(),"");
		s_P2attribute.s_TEnergy.SetData("能量：",parent._User2.GetEnergy(),"");
		s_P2attribute.s_TServe.SetData("发球： ",parent._User1.GetServe(),"");
		s_P2attribute.s_TPhysicalF.SetData("体力：",parent._User1.GetStamina(),"");
		s_P2_CuLevel.SetData("等级：",parent._User2.GetCurLevel(),"");
		s_P2attribute.s_Nkname.SetData("昵称:",parent._User2.GetNkName(),"");
		s_P2attribute.s_Title.SetData("称号：",parent._User2.GetTitle(),"");
		
		var _TActID1 = 5;	//玩家1的挑衅动作 5,6,7
		var _TActID2 = 5;	//玩家2的挑衅动作

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
		s_P1Model.SetData(parent._User1.GetRID(),_TActID1,parent._User1.GetSex());
		s_P2Mode2.SetData(parent._User2.GetRID(),_TActID2,parent._User2.GetSex());
	
		s_VS.SetData("VS","");
	}
};