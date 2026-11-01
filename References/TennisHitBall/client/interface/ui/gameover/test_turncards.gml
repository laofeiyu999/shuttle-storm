importex("$./../../Logic/Init.gml");
importex("$./ClassDef_TurnCards.gml");

size = "1024,768";
wndsize = "1024,768";
new fmodel{}
bgcolor = "#123456";

window.g_Sex = 2;

new item
{
	size = "50,50";bgcolor = "#ff";
	var _index = 0;
	void OnClick()
	{
		parent._temp.anispeed = 5;
	}
}

var _temp = new img
{
	size = "70,80";
	pos = "300,300";
	src = "$./imgs"+window.g_Sex+"/pai.tga";
	clipani(133,165,10,1);
	anispeed = -1;
	aniindex = 0;
	//aniloops = 1;
}

<END>
new VGame_Over_TurnCards_UI
{
	Init();
}