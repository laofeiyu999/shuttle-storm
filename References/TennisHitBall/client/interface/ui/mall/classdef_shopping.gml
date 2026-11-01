//商城：购物类定义
import("$./ClassDef_Shopping_Dress.gml");
import("$./ClassDef_Shopping_Face.gml");
import("$./ClassDef_Shopping_Deck.gml");
import("$./ClassDef_Shopping_Skill.gml");
import("$./ClassDef_Shopping_Attribute.gml");
import("$./ClassDef_Shopping_Props.gml");
import("$./ClassDef_Shopping_Dress_DBList.gml");
import("$./ClassDef_Shopping_HotSale.gml");
import("$./../../UI/Mall/ClassDef_Shopping.gml");

class VMall_Shopping_UI item
{
	size = "85%,100%";alpha = 0;pos="7,40";
	var x = 0;
	var posSX = 27;
	var posSY = 60;
	var posX = posSX;
	var posY = posSY;
	//=============================与界面交互========================================
	void Init()
	{
		new VPic9_BK2_UI
		{
			size="100%,361,-16,0";pos="8,25";
		}

		staticvar s_Btn_CloseSearch = new VBTN_A_New
		{
			InitText("关闭");
			pos = "30,30";
			show = false;
		}

		while(x < 5)
		{
			new VGoodsIcon_GreyBG_UI
			{
//				pos=""+parent.posX+","+parent.posY;
				pos=""+parent.posX+","+parent.posY;
			};
			x+=1;
			posX+=119;
		}
		posY+=147;
		x=0;
		posX = posSX;
		while(x < 5)
		{
			new VGoodsIcon_GreyBG_UI
			{
				pos=""+parent.posX+","+parent.posY;
			};
			x+=1;
			posX+=119;
		}

		staticvar s_RadioCtrl_Mall = new VRadioCtrl_UI
		{
			SetRadioName("BtnName_Mall_Hot,BtnName_Mall_Suit,BtnName_Mall_Clothing,BtnName_Mall_Hairdressing,BtnName_Mall_Jewelry,BtnName_Mall_Racket,BtnName_Mall_Skill,BtnName_Mall_Attribute,BtnName_Mall_Props");
			InitMax("热销,套装,服装,美容,饰品,球拍,技能,属性,道具",9,"Mall");pos = "8,7"
		}
		size = "600,384";
		SetRadioLightIndex(1);
		bgcolor=-1;

		//翻页：服饰物品
		staticvar s_PageCtrl = new VPageCtrl_Base_UI
		{
			SetSize(105,19);valign(0,0);halign(0,0);pos="230,358";halign(50,0);
		}

		new BaseText{size="61,20";pos="421,357";ycenter=true;src="到";};
		new BaseText{ycenter=true;size="61,20";pos="497,357";src="页";};
		new VPic9_EditBK_UI{size="61,20";pos="436,357";};
		//页数:edit
		staticvar s_Edit_Page = new BaseEditNum{pos="436,357";size="61,20";maxsize = 5;xcenter = "true";ycenter=true;}
		//Go：按钮
		staticvar s_Btn_Go = new VBTN_43_New{pos="516,357";InitText("GO");}
	}
};