import("$./../../Logic/Init.gml");
import("$./ClassDef_PlayUI_S.gml");
import("$./ClassDef_PlayUI_BaseInfo.gml");
import("$./ClassDef_PlayUI_D_Energy_Name.gml");
import("$./ClassDef_PlayUI_Skill.gml");
import("$./ClassDef_PlayUI_Skill_Buy.gml");
import("$./ClassDef_GameNum.gml");
bgcolor = "#777777";
size = "1024,768";
wndsize = "1024,768";

new img
{
	name = "IO_BAD_ING_NAME";
	src = "$./imgs/ioerr.tga";
	clipani(100,100,1,2);
	anispeed = 5;
}

//new VRole_Skill_Buy_UI
//{
//	Init();
//	pos = "0,0";
//}

//new VShortBarIcon_UI
//{
//	Init();
//	s_Skill_Icon.SetData(1,101,1);
//	s_SkillNum.setNum(28);
//}
//
//new VRole_BaseTipInfo_UI
//{
//	Init();
//	s_Point.SetData(1,999,999);
//}

//new VGame_Playing_S_UI
//{
//	Init();
//	//s_P1vsP2Point.SetData(1,123,123);
//}

//new VRole_P1_P3_Name_Energy_UI
//{
//	Init();
//	s_CurrEnergy.SetData(1,80,100);
//	timer(3000,"s_CurrEnergy.SetData(1,100,100);");
//	timer(6000,"s_CurrEnergy.SetData(1,80,100);");
//}
//new VRole_Skill_Buy_UI
//{
//	Init();pos(0,0);
//	_Icon.SetData(101);
//	_Money.SetData(40007,0);
//}

//var _test = new VN2NumShow
//{
//	src="$./imgs/num.tga";
//	setNum(99);
//}
//new item
//{
//	size(50,50);pos(100,0);bkcolor="#ff0000";
//	void OnMouseDownL()
//	{
//		alert();
//	}
//}

new VPlay_Game_Num
{
	pos(850,100);
	SetShow(2,2,2);
	SetShow(2,99,2);
}