import("$./../../Init.gml");
import("$./ClassDef.gml");

new fmodel{}
size = "800,600";
wndsize = "800,600";
bgcolor = "#FFFFFF";

//纵向的
new VMyCheckBox
{
	Init("CH确定",1);
	startstate=1;
	void OnCheck()
	{
		MouseCheck();
		//alert("OnCheck");
	}
	void OnUnCheck()
	{
		MouseUnCheck();
		//alert("OnUnCheck");
	}
}

//横向的
new VMyCheckBox
{
	Init("CH取消",0);
	pos = "200,200";
	void OnCheck()
	{
		MouseCheck();
		//alert("OnCheck");
	}
	void OnUnCheck()
	{
		MouseUnCheck();
		//alert("OnUnCheck");
	}
}