import("$./ClassDef.gml");

wndsize= "1024,768";
size= "1024,768";
//wndsize= "1280,960";
//size= "1280,960";
new fmodel{}
bgcolor= "#123456";

new item
{
	size="50,50";bgcolor="#ff";
	void OnClick()
	{
		parent._temp.show = true;
	}
}

var _temp = new VSysAffiche_UI
{
	Init();
	show = true;
}