//
//商城界面的类定义(包括:购物+技能镶嵌+充值)
//

importex("$./ClassDef_Shopping.gml");
importex("$./ClassDef_RoleData.gml");
importex("$./ClassDef_Control.gml");
importex("$./ClassDef_Shoping_Screen.gml");

class VMall_UI VUIBG_UI
{
	bgcolor = "-1";pos="15,73"size = "0%,0%";
	size=window.HALL_WND_SIZE;pos=window.HALL_WND_POS;bgcolor=-1;alpha=-1;

	SetTitalPos("25,0");
	InitBG("$./imgs"+window.g_Sex+ "/sc.tga");
	InitClose();
	InitHelp();
	InitBtnBG();
	size = "747,487";
	
	//=============================与界面交互========================================
	void Init()
	{
		staticvar s_EditBk_SearchConeten = new VPic9_EditBK_UI
		{
			size = "145,20";
			pos = "30,446";
		}
		//搜索内容框
		staticvar s_Edit_SearchContent = new BaseEdit
		{
			size = "145,20";
			pos = "30,446";
			maxsize = 20;ycenter = true;xcenter = true;
			setNoAddChr(" ",true);

			void GetSrc()
			{
				return src;
			}
		}
		//搜索按钮
		staticvar s_Btn_Search = new VBTN_A_New
		{
			InitText("搜索");
			left = parent.s_Edit_SearchContent.left + parent.s_Edit_SearchContent.width+10;
			top = parent.s_Edit_SearchContent.top - 2;
		}
		//购买:按钮
		staticvar s_Btn_Buy = new VBTN_A_New
		{
			InitText("购买");pos="298,444";
		}
		//赠送:按钮
		staticvar s_Btn_Send = new VBTN_A_New
		{
			InitText("赠送");pos="379,444";
		}
		//索要:按钮
		staticvar s_Btn_Ask = new VBTN_A_New
		{
			InitText("索要");pos="459,444";
		}
		//购物:按钮
		staticvar s_Btn_ShoppCar = new VBTN_A_New
		{
			InitText("购物车");pos="539,444";
		}
//		//精品区
//		staticvar s_NiceShopping = new img
//		{
//			size = "40%,90%";//bgcolor = "#ff";
//			pos = "20,33";
//			src = "$./imgs"+window.g_Sex+"/nice.tga";
//		}
		//精品区进入按钮
		staticvar s_Btn_NiceShopping = new VBTN_Mall_NiceShoppingTypeEnter
		{
			//InitText("进入");
			pos = "20,35";
			new Img
			{
				valign(90,0); halign(100,0);
				src = "$./../GmlCtrls/VButton/imgs"+window.g_Sex+"/new/Mall_New/t.tga";
			}
			new Img
			{
				//size = "100%, 30";
				valign(90,0); halign(100,0);
				src = "$./../GmlCtrls/VButton/imgs"+window.g_Sex+"/new/Mall_New/jpIn.tga";
			}
//			left = parent.s_NiceShopping.left + parent.s_NiceShopping.width - width - 30;
//			top = parent.s_NiceShopping.top + parent.s_NiceShopping.height - height -30;
		}
//		//休闲区
//		staticvar s_ComfortShopping = new img
//		{
//			size = "40%,90%";//bgcolor = "#ffff";
//			left = parent.s_NiceShopping.left + parent.s_NiceShopping.width + 10;
//			top = parent.s_NiceShopping.top;
//			src = "$./imgs"+window.g_Sex+"/comfort.tga";
//		}
		//休闲区进入按钮
		staticvar s_Btn_ComfortShopping = new VBTN_Mall_ComfortShoppingTypeEnter
		{
			//InitText("进入");
//			size="40%,90%";
			left = parent.s_Btn_NiceShopping.left + parent.s_Btn_NiceShopping.width + 10;
			top = parent.s_Btn_NiceShopping.top;
			new Img
			{
				valign(90,0); halign(100,0);
				src = "$./../GmlCtrls/VButton/imgs"+window.g_Sex+"/new/Mall_New/t.tga";
			}
			new Img
			{
				//size = "100%, 30";
				valign(90,0); halign(100,0);
				src = "$./../GmlCtrls/VButton/imgs"+window.g_Sex+"/new/Mall_New/xxIn.tga";
			}
//			left = parent.s_ComfortShopping.left + parent.s_ComfortShopping.width - width - 30;
//			top = parent.s_ComfortShopping.top + parent.s_ComfortShopping.height - height -30;
		}
	}
};