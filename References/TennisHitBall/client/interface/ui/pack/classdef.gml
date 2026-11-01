//背包类定义
//


class VPack_UI VUIBG_UI
{
	size = "0%,0%";size=window.HALL_WND_SIZE;bgcolor=-1;alpha=-1;//pos=window.HALL_WND_POS;
	valign(50,0);halign(50,0);//pos = ""+(window.width-width)/2 + "," +(window.height-height)/2;
	
	OpenDrag();
	SetTitalPos("25,0");
	InitBG("$./imgs"+window.g_Sex+"/bb-bt-text.tga");
	InitClose();
	InitHelp();
	
	var x = 0;var y = 0;
	var posSX = 30;var posSY = 114;
	var posX = posSX;var posY = posSY;
	new VPic9_BK2_UI{size=""+(parent.width-30)+",415";pos="13,58";};

	var topage = new BaseText{size="61,20";pos="472,432";ycenter=true;src="到";};
	var jumpedit = new VPic9_EditBK_UI{size="61,20";pos="486,432";};
	var topage1 = new BaseText{ycenter=true;size="61,20";pos="547,432";src="页";};

	while(x < 5)
	{
		new VGoodsIcon_GreyBG_UI
		{
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

	//=============================与界面交互========================================
	void Init()
	{
		//左右的Radio集合
		//顺序：服装,美容,饰品,球拍,技能,属性,道具
		staticvar s_R_All = new VRadioCtrl_UI{pos="20,40";}
		//翻页：背包物品
		staticvar s_PageCtrl = new VPageCtrl_Base_UI{valign(90,7);halign(51,0);}
		//页数:edit
		staticvar s_Edit_Page = new BaseEditNum
		{
			pos="486,432";size="61,20";maxsize = 5;xcenter = true;ycenter=true;
		}
		//Go：按钮
		staticvar s_Btn_Go = new VBTN_37_New{pos="576,432";InitText("GO");}
	}
	
	void ReSetPos()
	{
		valign(50,0);halign(50,0);
	}
};
