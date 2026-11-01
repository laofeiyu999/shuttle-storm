//商城-购买框类定义

importex("$./ClassDef_ChargeCar_DBList.gml");

class VMall_ChargeCar_UI VUIBG_UI
{
	size = "0%,0%";bgcolor = "-1";size="438,668";//bgcolor="#123456"
	valign(0,0);halign(0,0);pos = ""+(window.width-width)/2 + "," +(window.height-height)/2;

	//=============================与界面交互========================================
	void Init()
	{
		SetTitalPos("25,0");
		InitBG("$./imgs"+window.g_Sex+"/xf-text.tga");
//		InitHelp();
		InitClose();
		InitBtnBG();

		//上面的白色底
		new VPic9_BK2_UI
		{
			size="406,335";pos="15,52";//border="#123456"
		}
		//下面的白色底
		new VPic9_BK2_UI
		{
			size="406,209";pos="15,392";//border="#123456"
		}
		staticvar _LiveMess = new VPic9_EditBK_UI
		{
			size="366,70";pos="36,459";
		}
		//radio
		new VRadioCtrl_UI
		{
			InitMax("我的物品",1,"ChargeCar");
			SetWidth(440)
			pos = "5,30"
		}
		//全部选择:CheckBox
		staticvar s_CH_AllSel = new VCK_CK_New
		{
			pos="328,60";
//			void SetState(state)
//			{
//				if (state == window.BTN_STATE_LIGHT)
//				{
//					SetLight();
//				}
//				else
//				{
//					SetGrey();
//				}
//			}
			
		}
		staticvar s_CH_AllSelPH = new img
		{	
			pos="348,60";
			void SetState(state)
			{
				src = "$./imgs"+window.g_Sex+"/qbxz-text.tga";
				if (state == window.BTN_STATE_LIGHT)
				{
					src = "$./imgs"+window.g_Sex+"/qbxz-text.tga";
					//parent.s_CH_AllSel.SetLight();
				}
				else
				{	//parent.s_CH_AllSel.SetGrey();
					src = "$./imgs"+window.g_Sex+"/qbxz-hb-text.tga"; 

				}
			}
		}

		//总价格字
		new img
		{
			src = "$./imgs"+window.g_Sex+"/zjg-text.tga";
			pos="100,403";
		}
		new VPic9_EditBK_UI
		{
			size="210,20";pos="166,400";
		}
		staticvar s_TotalPrice = new BaseText
		{
			pos="170,403";//src = "金币:50000";
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
		//续费:RADIO
		staticvar s_R_Buy = new VRadio_Single_New_UI
		{
			pos="120,438";//x+9+20+20
		}
		staticvar s_MaskBuy = new item{pos = "169,303";}//x+9+20+20
		//续费字
		staticvar s_Word_Buy = new img//x+8+20+20
		{
			src = "$./imgs"+window.g_Sex+"/xf-st-text.tga";
			pos="150,438";
		}
//		//赠送:RADIO
//		staticvar s_R_Send = new VRadio_Single_New_UI
//		{
//			pos="173,435";
//		}
//		staticvar s_MaskSend = new item{pos = "230,300";}
//		//赠送字
//		staticvar s_Word_Send = new img
//		{
//			src = "$./imgs"+window.g_Sex+"/zs-text.tga";
//			pos="204,433";
//		}
//		//索要:RADIO
//		staticvar s_R_Ask = new VRadio_Single_New_UI
//		{
//			pos="285,435";
//		}
//		staticvar s_MaskAsk = new item{pos = "330,300";}
//		//索要字
//		staticvar s_Word_Ask = new img
//		{
//			src = "$./imgs"+window.g_Sex+"/sy-text.tga";
//			pos="316,433";
//		}
		//已使用
		staticvar s_UsedCard = new BaseText
		{
			pos = "200,438";src = "已使用：";
		}
//		//显示各种卡的图样
		staticvar s_LukyCard = new VGoodsIconNew_Logic
		{
			//src = "$./imgs"+window.g_Sex+"/mini-lucky.tga";
			s_bk.show = false;
			SetMySizeEx(40,40);
			SetIconEx(window.g_luckyEntry_ID,0,0);
			pos="250,423";
		}
		staticvar s_AgioCard = new VGoodsIconNew_Logic
		{
//			src = "$./imgs"+window.g_Sex+"/mini-discount.tga";
			s_bk.show = false;
			SetMySizeEx(40,40);
			SetIconEx(window.g_agioEntry_ID,0,0);
			pos="276,423";
		}
		//留言
		//参数 data1:
		staticvar s_LeaveWord = new BaseEdit
		{
			src ="续费享受9折优惠，并能与各类打折卡叠加，实现超低折扣\n"
+"（只有3天时限内的物品才能续费，并由系统自动放入此界面。已到期物品会自动进入您的背包“过期物品”中，可以随时购买，但不享受折扣，所以请抓住续费机会哦）";
			maxsize=500;autoenter="true";color="#FF3366";
			void Reset()
			{
				pos(parent._LiveMess.left+5,parent._LiveMess.top+5);
				size(parent._LiveMess.width-10,parent._LiveMess.height-10);
			}
			Reset();
		}
//		staticvar s_MaskWord = new item{pos = "100,350";}
		//我的金币图
		staticvar s_Img_MyGold = new img
		{
			src = "$./imgs"+window.g_Sex+"/wdjb-text.tga";
			pos = "35,582";
		}
		//拥有金币
		//参数 data1:
		staticvar s_MyGold = new BaseText
		{
			src = "555555:";
//			pos="100,580";
			left = parent.s_Img_MyGold.left+parent.s_Img_MyGold.width+10;
			top = 583;
		}
		//我的奖券
		staticvar s_Img_MyLottery = new img
		{
			src = "$./imgs"+window.g_Sex+"/wdjq-text.tga";
			pos = "170,582";
		}
		staticvar s_MyLottery = new BaseText
		{
			src = "555555:";
//			pos = "230,580";
			left = parent.s_Img_MyLottery.left+parent.s_Img_MyLottery.width+10;
			top = 583;
		}
		//我的点卷图
		staticvar s_Img_MyMoney = new img
		{
			src = "$./imgs"+window.g_Sex+"/wddq-text.tga";
			pos = "310,582";
		}
		//拥有点券
		//参数 data1:
		staticvar s_MyMoney = new BaseText
		{
			src = "555555:";
//			pos = "350,580";
			left = parent.s_Img_MyMoney.left+parent.s_Img_MyMoney.width+10;
			top = 583;
		}
		//确定购买:按钮
		staticvar s_Btn_Enter = new VBTN_A_New
		{
			InitText("确定");pos="30,"+(parent.height-window.G_POP_BTN_POSY);
		}
//		//确定删除:按钮
//		staticvar s_Btn_Del = new VBTN_A_New
//		{
//			InitText("删除");;pos="170,"+(parent.height-window.G_POP_BTN_POSY);
//		}
		//取消:按钮
		staticvar s_Btn_Esc = new VBTN_A_New
		{
			InitText("取消");pos=""+(parent.width-110)+","+(parent.height-window.G_POP_BTN_POSY);
		}
//		new item
//		{
//			size = "100%,100%";
//			void OnClick()
//			{
//				parent.s_CB_SelOther.SetMyHide(false);
//			}
//		}
//		
		staticvar s_captureItem =new item
		{
			bgcolor = "#cccccc";alpha = 70;capturemouse = true;//show=false;
			void Reset()
			{
				pos(parent.s_LeaveWord.left,parent.s_LeaveWord.top);
				size(parent.s_LeaveWord.width,parent.s_LeaveWord.height);
			}
			Reset();
		}
//		//选他人支付时出现可支付人的下拉列表
//		staticvar s_CB_SelOther = new VCombox_Friend_UI_Ex
//		{
//		}
		//各个点击状态（购买，赠送，索要，购物车）下的各种按键形式	夏洋洋添加于2009-12-17
		if(window.GetMallDLGType() == window.MALL_OPT_BUY)
		{
			s_Word_Buy.src = "$./imgs"+window.g_Sex+"/xf-st-text.tga";
//			s_R_Send.SetTopImgShow(false);
//			s_R_Send.SetState(window.BTN_STATE_GREY);
//			s_Word_Send.src = "$./imgs"+window.g_Sex+"/zsh-text.tga";
//			s_R_Ask.SetTopImgShow(false);
//			s_R_Ask.SetState(window.BTN_STATE_GREY);
//			s_Word_Ask.src = "$./imgs"+window.g_Sex+"/syh-text.tga";
//			s_CB_SelOther.SetEditState(false);
			s_captureItem.show=true;
		}
//		if(window.GetMallDLGType() == window.MALL_OPT_GIFT)
//		{
//			s_Word_Send.src = "$./imgs"+window.g_Sex+"/zs-text.tga";
//			s_R_Buy.SetTopImgShow(false);
//			s_R_Buy.SetState(window.BTN_STATE_GREY);
//			s_Word_Buy.src = "$./imgs"+window.g_Sex+"/gmh-text.tga";
//			s_R_Ask.SetTopImgShow(false);
//			s_R_Ask.SetState(window.BTN_STATE_GREY);
//			s_Word_Ask.src = "$./imgs"+window.g_Sex+"/syh-text.tga";
//			s_captureItem.show=false;
//		}
//		if(window.GetMallDLGType() == window.MALL_OPT_ASK)
//		{
//			s_Word_Ask.src = "$./imgs"+window.g_Sex+"/sy-text.tga";
//			s_R_Buy.SetTopImgShow(false);
//			s_R_Buy.SetState(window.BTN_STATE_GREY);
//			s_Word_Buy.src = "$./imgs"+window.g_Sex+"/gmh-text.tga";
//			s_R_Send.SetTopImgShow(false);
//			s_R_Send.SetState(window.BTN_STATE_GREY);
//			s_Word_Send.src = "$./imgs"+window.g_Sex+"/zsh-text.tga";
//			s_captureItem.show=false;
//		}
	}
	
	//显示各种卡的图样
	void SetBuycarPos(_AgioCardState,_LukyCardState)
	{
//		if (m_SelectType == window.MALL_OPT_ASK)
//		{
//			_AgioCardState = 0;
//			_LukyCardState = 0;
//		}
//		_LiveMess.size="366,70";
//		_LiveMess.pos="36,509";
		s_LeaveWord.Reset();
		s_captureItem.Reset();
		s_UsedCard.pos = "200,438";
		s_UsedCard.show=true;
		if(_AgioCardState==1&&_LukyCardState==1)
		{
			s_LukyCard.pos="250,423";
			s_AgioCard.pos="300,423";
			s_LukyCard.show =true;
			s_AgioCard.show =true;
			return;
		}
		if(_AgioCardState==0 && _LukyCardState==1)
		{
			s_LukyCard.pos="250,423";
			s_LukyCard.show =true;
			s_AgioCard.show =false;
			return;
		}
		if(_AgioCardState==1&&_LukyCardState==0)
		{
			s_AgioCard.pos="250,423";
			s_LukyCard.show =false;
			s_AgioCard.show =true;	
			return;
		}
//		_LiveMess.size="366,90";
//		_LiveMess.pos="36,489";
		s_LeaveWord.Reset();
		s_captureItem.Reset();
		s_LukyCard.show =false;
		s_AgioCard.show =false;
		s_UsedCard.show=false;
	}
};