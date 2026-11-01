//背景框测试
//@刘高辰
//08年8月5日

import("$./../../../Logic/Init.gml");
import ("$./ClassDef.gml");
window.g_Sex = 2;
bgcolor = "#000000";
//drag = "self";

new VPic9_GuideFrame_UI
{
	pos(100,100);
	SetSize(400,500);
}

//var _temp = new VCHAT_BK_UI_H
//{
//	pos(300,300);
//	SetSize(200,200);
//}
//new item
//{
//	size(50,50);bkcolor="#ff0000";
//	void OnClick()
//	{
//		parent._temp.SetSize(400,300);
//	}
//}
//new item
//{
//	size(50,50);pos(50,0);bkcolor="#00ff00";
//	void OnClick()
//	{
//		parent._temp.SetSize(200,200);
//	}
//}
//new VMouseBK_UI
//{
//	pos(400,200);
//	SetSize(150,350);
//}
//
//new VMouseBK_UI
//{
//	pos(200,200);
//	SetSize(120,254);
//}
//
new VPic3_RoomListTop_UI
{
	pos = "10,10";size(100,164);
}
//<END>
////
//new VEnter_Game_BK_UI
//{
//	//size(300,300);
//	SetSize(300,300);
//}
//new VMouseBK_UI
//{
//	pos(0,600);
//	SetSize(100,100);
//}
//
//new VLISTBASE_UI
//{
//	pos(105,600);
//	SetSize(100,100);
//}

////选择条框
//var _bk = new img
//{
//	pos(0,650);
//	src="$./../VComboBox/imgs"+window.g_Sex+"/bk.tga";
//}
////三角按钮
//new VLISTCHECK_UI
//{
//	halign (100,0);valign(1,0);
//	void OnPressed()
//	{
//		parent.OnClick_triangle();
//	}
//}

//new VText_Bk_UI
//{
//	pos = "300,300";
//}
//new VText_Bk_UI
//{
//	size(150,33);
//}

//new VEnter_Game_BK_UI
//{
//	size(621,524);valign(100,0);halign(100,0);//size(511,495);
//	new img{src = "$./imgs"+window.g_Sex+"/EnterBk/tiao.tga";size = "612,20";valign(30,0);}
//	new img{src = "$./imgs"+window.g_Sex+"/EnterBk/底图-高光.tga";size = "100%,26,-36,0";valign(33,0);pos = "18,0"}
//}
//
//new VLIST_BK_UI
//{
//}
//<END>
//new VTop_Small_BK_UI
//{
//	size(200,200);
//}