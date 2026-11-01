import("$./../../Logic/Init.gml");
import("$./../../Const.gml");
import("$./ClassDef.gml");
import("$./ClassDef_DLG.gml");
//size = "1024,768";
//wndsize = "1024,768";
wndsize = "1152,820";
size = "1152,820";
bgcolor = "#FFFF00";alpha = -1;
var g_Sex = 1;
drag = "self";



new VTrainOver_UI
{
	size = "100%,100%";
	Init();
	s_Award_Icon.SetData(1,2);
	s_Explain.SetData(1,"ksdjfgdkjfgskjdfgskdhfkjsdhfkjshdfkjshdkjfhskdjfskjdfhskjdfh");
	s_Award_Gold.SetData(1,50);
	s_Award_Exp.SetData(1,50);
//	SetTrainOver();
	s_Model.SetData(2,103118,1240);
}
<END>
new VPlayOver_DLG_UI
{
	pos(700,100);
	Init();
	s_TEXT_Explain.SetData("看见哈市的看见啊还是都看见爱是肯定就爱上看到机会");
	s_Btn_1.SetData("N_Continue0");
	s_Btn_2.SetData("M_GoGame0");
}