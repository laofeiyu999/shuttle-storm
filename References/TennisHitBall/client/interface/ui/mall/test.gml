import ("$./../../Logic/Init.gml");
import ("$./ClassDef.gml");

size = "1024,768";
wndsize = "1024, 768";
pos = "0,0"
bgcolor = "#000000";

 商城主界面
new VMall_UI
{
	Init();

	// 界面购物(白色底+假购物边框)
	new VMall_Shopping_UI
	{
		Init();

		// 购物: 技能
		new VMall_Shopping_Attribute_UI { Init(); show = false; }
		// 购物: 饰品
		new VMall_Shopping_Deck_UI { Init(); show = false; }
		// 购物: 服饰
		new VMall_Shopping_Dress_UI { Init(); show = false; }
		// 购物: 面部
		new VMall_Shopping_Face_UI { Init(); show = false; }
		// 购物: 道具
		new VMall_Shopping_Props_UI { Init(); show = false; }
		// 购物: 技能
		new VMall_Shopping_Skill_UI { Init(); show = false; }
		// 购物: 热销
		new VMall_Shopping_HotSale_UI { Init(); show = true; }
		// 购物: 服饰的物品list
		new VColumn_Mall_DressList_UI { Init(); show = false; }
	}
}

// 界面控制
new VMall_Control_UI { Init(); }

//
//size = "300, 300";
//wndsize = "300.300";
//pos = "100,100";
//bgcolor = "#000000";
//
//new img
//{
//
////	src="$./../PublicImage/imgs"+window.g_Sex+"/new.tga";
////	clipani(61,38,1,4);anispeed = 6;
//};

