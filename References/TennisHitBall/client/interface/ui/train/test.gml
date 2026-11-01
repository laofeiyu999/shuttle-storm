import("$./../../Logic/Init.gml");
import("$./ClassDef_SingleWnd.gml");
import("$./ClassDef.gml");
import("$./ClassDef_TrainList.gml");
bkcolor = "#ffffff";
window.g_Sex = 1;
size = "800,600":
new VTrainSingleWnd_UI
{
	size="400,400";
	pos = "0,0";
	Init();
	SetSingleWnd();
	s_Explain.SetData(1,"开始就大方好开始就大方好开始就大方好开始就大方好开始就大方好");
	s_Goal.SetData(1,"开始就大方好开始就大方好开始就大方好开始就大方好开始就大方好");
	s_Award_Gold.SetData(1,30);
	s_Award_Exp.SetData(1,30);
}

//new VTrain_UI
//{
//	size = "100%,100%";
//	Init();	
//	new VTrain_CourseList_UI{}
//}
//new VColumn_Train_UI
//{
//	size="100%,100%";
//	Init();
//	s_State.SetData(1);
//	s_Icon.SetData("Topspin");
//}
