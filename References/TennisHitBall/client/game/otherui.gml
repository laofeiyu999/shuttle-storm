new item
{
	size = "20, 20";
	pos = "500, 300";
	bgcolor = "#ffffff";

	void OnClick()
	{
		window.map.find("userFinder").ScriptFun("Me.Logic.MissHit();")
	}
}