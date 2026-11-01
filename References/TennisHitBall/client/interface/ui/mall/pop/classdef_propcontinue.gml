//物品续费
//import("$./ClassDef_BuyCar_DBList.gml");

class VItem_PropContinue_UI VUIBG_UI
{
	size = "0%,0%";bgcolor = "-1";size="438,520";//bgcolor="#123456"
	valign(0,0);halign(0,0);pos = ""+(window.width-width)/2 + "," +(window.height-height)/2;
	void Init()
	{
		SetTitalPos("25,0");
		InitBG("$./imgs"+window.g_Sex+"/xf-text.tga");
		InitHelp();
		InitClose();
		InitBtnBG();

		//上面的白色底
		new VPic9_BK2_UI
		{
			size="406,350";pos="15,35";//border="#123456"
		}
		//下面的白色底
		new VPic9_BK2_UI
		{
			size="406,60";pos="15,392";//border="#123456"
		}
		/*new VPic9_EditBK_UI
		{
			size="366,90";pos="36,489";
		}*/
		//radio
		/*new VRadioCtrl_UI
		{
			InitMax("我的物品,形象1,形象2,形象3,形象4,形象5",6,"BuyCar");
			SetWidth(440)
			pos = "5,30"
		}*/
		//全部选择:CheckBox
		/*staticvar s_CH_AllSel = new VCK_CK_New
		{
			pos="328,60";
		}*/
		/*new img
		{
			src = "$./imgs"+window.g_Sex+"/qbxz-text.tga";pos="348,60";
		}*/
		//总价格字
		new img
		{
			src = "$./imgs"+window.g_Sex+"/zjg-text.tga";
			pos="78,400";
		}
		new VPic9_EditBK_UI
		{
			size="210,20";pos="176,400";
		}
		staticvar s_TotalPrice = new BaseText
		{
			pos="180,403";//src = "金币:50000";
			void SetValue(money,token,quan,vip)
			{
				printf("总价格:金币:"+money+",奖券:"+token+",点券:"+quan);
				src = "";
				if ( money != 0 )
				{
					src = "金币:" + money;
				}
				if ( token != 0 )
				{
					if ( money != 0 )
					{
						src += " ";
					}
					src += "奖券:" + token;
				}
				if ( quan != 0)
				{
					if ( money != 0 || token != 0)
					{
						src += " ";
					}
					src += "点券:" + quan;
				}
				if ( src != "" && vip )
				{
					src += "(vip 折扣)"
				}
			}
		}
		staticvar s_MaskWord = new item{pos = "100,350";}
		//我的金币图
		staticvar s_Img_MyGold = new img
		{
			src = "$./imgs"+window.g_Sex+"/wdjb-text.tga";
			pos = "30,430";
		}
		//拥有金币
		//参数 data1:
		staticvar s_MyGold = new BaseText
		{
			src = "555555:";
//			pos="100,580";
			left = parent.s_Img_MyGold.left+parent.s_Img_MyGold.width+10;
			top = 430;
		}
		//我的奖券
		staticvar s_Img_MyLottery = new img
		{
			src = "$./imgs"+window.g_Sex+"/wdjq-text.tga";
			pos = "150,430";
		}
		staticvar s_MyLottery = new BaseText
		{
			src = "555555:";
//			pos = "230,580";
			left = parent.s_Img_MyLottery.left+parent.s_Img_MyLottery.width+10;
			top = 430;
		}
		//我的点卷图
		staticvar s_Img_MyMoney = new img
		{
			src = "$./imgs"+window.g_Sex+"/wddq-text.tga";
			pos = "280,430";
		}
		//拥有点券
		//参数 data1:
		staticvar s_MyMoney = new BaseText
		{
			src = "555555:";
//			pos = "350,580";
			left = parent.s_Img_MyMoney.left+parent.s_Img_MyMoney.width+10;
			top = 430;
		}
		//确定购买:按钮
		staticvar s_Btn_Enter = new VBTN_A_New
		{
			InitText("确定");pos="30,"+(parent.height-window.G_POP_BTN_POSY);
		}
		//确定删除:按钮
//		staticvar s_Btn_Del = new VBTN_A_New
//		{
//			InitText("删除");;pos="175,"+(parent.height-window.G_POP_BTN_POSY);
//		}
		//取消:按钮
		staticvar s_Btn_Esc = new VBTN_A_New
		{
			InitText("取消");pos=""+(parent.width-110)+","+(parent.height-window.G_POP_BTN_POSY);
		}
		new item
		{
			size = "100%,100%";
			void OnClick()
			{
				parent.s_CB_SelOther.SetMyHide(false);
			}
		}
	}
	
}