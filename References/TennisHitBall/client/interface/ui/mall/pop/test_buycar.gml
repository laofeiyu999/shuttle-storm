import("$./../../../Logic/GmlCtrls/Common/Globals.gml");
import("$./../../GmlCtrls/include.gml");
import("$./ClassDef_BuyCar.gml");
import("$./ClassDef_RequestMsg.gml");

window.g_Sex = 1;

//size = "1024,768";
//wndsize = "1024,768";
//size = "1152,864";
//wndsize = "1152,864";
size = "1280,960";
wndsize = "1280,960";
new fmodel{}
bgcolor = "#123456";
drag = "self";

new VMall_BuyCar_UI
{
	Init();
}

//new VMall_RequestMsg_UI
//{
//	Init();
//	s_MyGold.SetData(100000000);
//	s_MyLottery.SetData(100000000);
//	s_MyMoney.SetData(100000000);
//}