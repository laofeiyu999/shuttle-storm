import("$./../../Init.gml");
import("$./ClassDef.gml");

new fmodel{}
size = "800,600";
wndsize = "800,600";
bgcolor = "#FFFFFF";

var _R1 = new VMyRadio
{
	Init("确定",1);
	startstate=1;
	groupname="testradiogroupname_2";
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

var _R2 = new VMyRadio
{
	groupname="testradiogroupname_2";
	Init("R取消",0);
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

new text
{
	src = "取消";pos = "100,200";
	void OnClick()
	{
		parent._R1.UnCheck();
		parent._R2.Check();
	}
}

new text
{
	src = "确定";pos = "150,200";
	void OnClick()
	{
		parent._R2.UnCheck();
		parent._R1.Check();
	}
}