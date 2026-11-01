import("$./../../Logic/Init.gml");
import("$./ClassDef_PlayBox.gml");

size = "1024,768";
wndsize = "1024,768";
//wndsize = "1152,820";
//size = "1152,820";
//wndsize = "1280,960";
//size = "1280,960";
new fmodel();
bkcolor="#123456";
new VGameVideo_PlayBox_UI
{
	Init();show=true;
	s_VideoTime.SetData(99,99,99,99);
	s_PlayState.SetData("正早播放");
	s_JinDuTiao._item.SetMySize(245);
}

new item
{
	size = "100,8";bgcolor="#ff";
	pos = "300,300";
}