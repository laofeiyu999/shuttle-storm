import("$./../../Logic/init.gml");
import("$./../../Const.gml");
import("$./ClassDef_SpeakFroth.gml");
size = "800,600";
wndsize = "800,600";
//size = "1024,768";
//wndsize = "1024,768";
bgcolor = "#FF";alpha = 80;
window.g_Sex = 1;
new VSpeakFroth_UI
{
//	bgcolor = "#FF0000";
	pos = "100,100";
	SetData("法师的法师大法师暗室逢灯法师暗室逢灯爱上对法，前面总共三十二个字",1);
}

new VSpeakFroth_UI
{
//	bgcolor = "#FF0000";
	pos = "300,100";
	SetData("法法法法",2);
}
//new VPic9_SpeakFroth_UI{size = "100,100";}
//new img{src = "$./imgs1/speakFroth/left.tga";}