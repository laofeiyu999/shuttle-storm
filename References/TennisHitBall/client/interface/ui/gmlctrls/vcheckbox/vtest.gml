import("$./../../../Logic/Init.gml");
//import("ClassDef.gml")

window.g_Sex = 1;
bkcolor = "#ffffff";

new VCK_CK_New
{			
	valign(42,0);
	halign(54,0);
	startstate = 1;
	void OnCheck(){MouseCheck();}
	void OnUnCheck(){MouseUnCheck();}
}
<END>
new VCK_Gou_UI
{
	//startstate = 1;
	void OnCheck()
	{
		alert("OnCheck");
		MouseCheck();
	}
	void OnUnCheck()
	{
		alert("OnUnCheck");
		MouseUnCheck();
	}
}

new VCK_CK_New
{
	bgcolor = "#FF";
	pos = "30,0";
	startstate = 1;
	void OnCheck(){MouseCheck();}
	void OnUnCheck(){MouseUnCheck();}
}