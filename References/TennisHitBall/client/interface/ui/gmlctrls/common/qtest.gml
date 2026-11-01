import("$./../../../Logic/Init.gml");
import("$./ClassDef_QualifyLv.gml");
bkcolor="#123456";
size = "1024,768";
wndsize = "1024,768";
drag = "window";

new fmodel;
var lastLv = 1;
var currLv = 2;
new VQualifyLv_UI
{
	m_LastLv = window.lastLv;
	//sleep(2000);
	void OnClick()
	{
		Init();
		ShowAtt(window.currLv);
		s_LvUp.showLvUp(window.currLv);
		s_Qualify.SetData(2);
		//showFire(2);
	}
}