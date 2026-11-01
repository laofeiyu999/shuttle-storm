import("$./../Init.gml");
import("$./../../Const.gml");
//import("$./ClassDef_PlayLogic_Skill.gml");
importex("$./ClassDef_PlayLogic_Skill_Buy.gml");
//import("$./ClassDef_PlayLogic_Sub.gml");

bkcolor="#CCCCCCs";

wndsize = "1024,768";
//new VRole_Skill_Buy_UI{Init();}

new item
{
	size = "100%,100%";

	void OnClick()
	{
	
		staticvar Begin = new VRole_Skill_Buy_Logic
		{
			//pos = "15,20";//size = "500,500";
			SetSkillID(40001);
			OnShow();
		//	void OnCreated()
		//	{
		//		pos = "0,0";
		//	}
		}
	}

	new item
	{
		size = "50,50";bgcolor ="#FF";capturemouse = true;

		void OnClick()
		{
			parent.Begin.del();
		}
	}
}

<END>
new VRole_Skill_Icon_Logic
{
	pos = "100,100";
	Init();
	SetEvent();
	s_Skill_Icon.SetData("",101,1);
}