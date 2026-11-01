
import("$./../../Logic/Init.gml");
import("$./../GmlCtrls/include.gml");
import("$./ClassDef.gml");
import("$./../Game/ClassDef_PlayUI_Skill.gml");
import("$./../../Logic/Game/ClassDef_PlayLogic_Skill_Icon.gml");
//wndsize ="1024,768";
//size ="1024,768";
//size = "1152,864";
//wndsize = "1152,864";
wndsize ="1280,960";
size ="1280,960";
new fmodel{}
bgcolor = "#123456";
window.g_Sex = 2;
drag = "self";
new VTraining_UI
{
	size="100%,100%";
	Init();
	s_LostPoint.show = true;
	s_RemainingPoint.SetShowPoint(true);
	s_RemainingPoint.SetData(12);
	s_GoalPoint.show = true;
	s_FinishPoint.show = true;
	s_Point.SetData2(true);
	s_Point.SetData(1,30,30);
	s_TipInfo.SetData(1,"ChipSkill");
	s_TipInfo.SetData2(true);
	sleep(3000);
	s_TipInfo.SetData2(false);
//	s_RemainingPoint.SetShowPoint(true);
//	s_RemainingPoint.SetData(15);
//	s_Point.SetData2(true);
//	s_Point.SetData(1,30,30);
//	s_KeyBoard._left.SetData("W");
//	s_KeyBoard._right.SetData("D");
//	s_KeyBoard._up.SetData("L");
//	s_KeyBoard._bottom.SetData("C");
//	s_KeyBoard._J.SetData("S");
//	s_KeyBoard._K.SetData("R");
//	s_KeyBoard._L.SetData("H");
//	s_KeyBoard._L.SetMySpeed(2);
//	timer(6000,"temp4");
//	void temp4()
//	{
//		s_KeyBoard._L.SetMySpeed(3);
//	}
//	s_PowerTips.SetTips(true);
//	s_KeyBoard.SetData2(true);
//	s_Coach.SetType(2);
//	s_DLG.SetData("看见爱上的看见啊还是都看见哈多看见啊还ksjdfgskjdfhskjdfhksjdhfksjdhfkjsdhfksjdhfksjdhfksjdf是都看见爱是肯定就哈萨克的机会撒看见的哈开始简单哈卡时间的哈开始","");
//	timer(3000,"temp3");
//	timer(5000,"temp");
//	timer(7000,"temp2");
//	void temp()
//	{
//		s_DLG.SetData("看见爱上的看见啊还是都看见哈多看见啊还ksjdfgskjdfhskjdfhksjdhfksjdhfkjsdhfksjdhfksjdhfksjdf是都看见爱是肯定就937459384756387456384756384756单哈卡时间的哈开始","");
//	}
//	void temp2()
//	{
//		s_DLG.SetData("dlkfjgldkf可是简单回复开始就大方好开始简单方还是看","");
//		s_PowerTips.SetTips(false);
//	}
//	void temp3()
//	{
//		s_DLG.Setdata2(true);
//	}
//	s_Skill.SetData2(true);
}
	



//new img
//{
//	src = "$./imgs1/Space.tga";
//	clipani(90,42,1,2);anispeed = 0;
//	aniindex = 1;
//}