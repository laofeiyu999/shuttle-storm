importex("$./../Init.gml");
importex("$./ClassDef_TurnCards.gml");

size = "1024,768";
wndsize = "1024,768";
new fmodel{}
bgcolor = "#123456";

window.g_Sex = 1;

new VGame_Over_TurnCards_Logic
{

}

new item
{
	size = "50,50";bgcolor="#ff";

	void OnClick()
	{
//		window.find("VGame_Over_Cards_1").SetCardsState(true);
//		window.find("VGame_Over_Cards_1").SetCardsFront(10000);
//		window.find("VGame_Over_Cards_1").SetCardsText(1004948);
		window._Result_GetItem(1004948,6,"40013,30");
	}
}	