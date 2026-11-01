import("$./ClassDef.gml");
import("$./../../../Logic/Init.gml");
import("$./../../../Const.gml");

size = "1024,768";
wndsize = "1024,768";
new fmodel{}
bgcolor = "#123456";
alpha = -1;
pos = "100,100";

new VPic3_Tital_UI{size = "300,32";pos = "300,100";}

//new VPic9_BK1_UI{size = "308,408";pos = "300,300";}

new VPic3_Tital_SJ_UI{size = "300,20";pos = "300,500";}

<END>
new VUIBG_UI
{
	size = "308,408";
	pos = "300,100";
	InitBG("");
	InitClose();
	InitBtnBG();
	InitHelp();
}
