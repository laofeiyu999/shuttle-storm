import("$./../../Logic/Init.gml");
import("$./../../Const.gml");
importex("$./ClassDef_PlayUI_Skill_Buy.gml");
bgcolor = "#123456";
fps = 200;
wndsize = "800,600";

new item
{
	size = "100%,100%";

	void OnClick()
	{
		staticvar Begin = new VRole_Skill_Buy_UI
		{
			//pos = "100,30";
			Init();
		}
	}

	new item
	{
		size = "50,50";bgcolor ="#FF";capturemouse = true;

		void OnClick()
		{
			parent.Begin.del();
		}
	}
}