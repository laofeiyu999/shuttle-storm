bgcolor = "#FFFFFF";
import("$./../Init.gml");
importex("$./ClassDef.gml");

new item
{
	size = "50,50";bgcolor = "#FF";zindex = "top";
	void OnClick()
	{
		set parent
		{
			find("help").del();
			new VHelp_Logic
			{
				name = "help";
				s_Sprite.SetData(1);
				s_title.SetData("背包");
				AddList("1.服饰",100);
				AddList("2.道具",200,"你所拥有的道具");

				void UpdataList(id)
				{
					s_List._html._body.delallchild();
					if (id == 100)
					{
						AddList("1-1.球拍",110);
						AddList("1-2.上衣",210,"你所拥有的上衣");
					}
				}
			}
		}
	}
}