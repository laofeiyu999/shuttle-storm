import("$./../../../Logic/Init.gml");
import("$./ClassDef_DropMenu.gml");
bkcolor="#123456";

window.g_Sex=2;
var _t1 = new VDROPMENU_UI
{
	name = "1";
	m_sizeX=200;
	
	SetData(4,"1,2,3,0",2,1);
	setIMGShow(true);
}