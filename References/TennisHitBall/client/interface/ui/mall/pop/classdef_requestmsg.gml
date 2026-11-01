//商城-购买框类定义

importex("$./ClassDef_RequestMsg_DBList.gml");

class VMall_RequestMsg_UI VUIBG_UI
{
	size = "0%,0%";bgcolor = "-1";size="438,668";//bgcolor="#123456"
	valign(0,0);halign(0,0);pos = ""+(window.width-width)/2 + "," +(window.height-height)/2;

	//=============================与界面交互========================================
	void Init()
	{
		SetTitalPos("25,0");
		InitBG("$./imgs"+window.g_Sex+"/syxx-bt-text.tga");
		//InitHelp();
		InitClose();

		//上面的白色底
		new VPic9_BK2_UI
		{
			size="406,335";pos="15,52";//border="#123456"
		}

		//下面的白色底
		new VPic9_BK2_UI
		{
			size="406,223";pos="15,392";//border="#123456"
		}

		staticvar _LiveMess = new VPic9_EditBK_UI
		{
			size="366,90";pos="36,489";
		}

		//总价格字
		new img
		{
			src = "$./imgs"+window.g_Sex+"/zjg-text.tga";
			pos="78,400";
		}
		new VPic9_EditBK_UI
		{
			size="190,20";pos="176,400";
		}
		staticvar s_TotalPrice = new BaseText
		{
			pos="180,402";//src = "金币:50000";
			//金币 点券 奖券
			void SetValue(money,Quan,token)
			{
				src = "";
				if ( money != 0 )
				{
					src = "金币:" + money;
				}
				if ( Quan != 0 )
				{
					if ( money != 0 )
					{
						src += " ";
					}
					src += "点券:" + Quan;
				}
				if ( token != 0 )
				{
					if ( Quan != 0 )
					{
						src += " ";
					}
					src += "奖券:" + token;
				}
			}
		}

		//索要人字
		new img
		{
			src = "$./imgs"+window.g_Sex+"/syr-text.tga";
			pos="78,450";
		}
		new VPic9_EditBK_UI
		{
			size="180,20";pos="176,450";
		}
		staticvar s_NkName = new BaseText
		{
			pos="180,452";
		}
		//已使用
		staticvar s_UsedCard = new BaseText
		{
			pos = "66,495";src = "已使用：";
		}

		//留言
		//参数 data1:
		staticvar s_LeaveWord = new BaseText
		{
			autoenter="true";xcenter=true;ycenter=true;
			void Reset()
			{
				pos(parent._LiveMess.left+5,parent._LiveMess.top+5);
				size(parent._LiveMess.width-10,parent._LiveMess.height-10);
			}
			Reset();
		}
		//显示各种卡的图样
		staticvar s_LukyCard = new VGoodsIconNew_Logic
		{
			//src = "$./imgs"+window.g_Sex+"/mini-lucky.tga";
			s_bk.show = false;
			SetMySizeEx(40,40);
			SetIconEx(window.g_luckyEntry_ID,0,0);
			pos="66,480";
		}
		staticvar s_AgioCard = new VGoodsIconNew_Logic
		{
//			src = "$./imgs"+window.g_Sex+"/mini-discount.tga";
			s_bk.show = false;
			SetMySizeEx(40,40);
			SetIconEx(window.g_agioEntry_ID,0,0);
			pos="86,480";
		}

		//我的金币图
		staticvar s_Img_MyGold = new img
		{
			src = "$./imgs"+window.g_Sex+"/wdjb-text.tga";
			pos = "33,588";
		}
		//拥有金币
		//参数 data1:
		staticvar s_MyGold = new BaseText
		{
			src = "555555:";
			//pos="95,588";
			left = parent.s_Img_MyGold.left + parent.s_Img_MyGold.width + 10;
			top = 588;
		}

		//我的奖券
		staticvar s_Img_MyLottery = new img
		{
			src = "$./imgs"+window.g_Sex+"/wdjq-text.tga";
			pos = "155,588";
		}
		staticvar s_MyLottery = new BaseText
		{
			src = "555555:";
			//pos = "220,588";
			left = parent.s_Img_MyLottery.left + parent.s_Img_MyLottery.width + 10;
			top = 588;
		}

		//我的点卷图
		staticvar s_Img_MyMoney = new img
		{
			src = "$./imgs"+window.g_Sex+"/wddq-text.tga";
			pos = "280,588";
		}
		//拥有点券
		//参数 data1:
		staticvar s_MyMoney = new BaseText
		{
			src = "555555:";
//			pos = "345,588";
			left = parent.s_Img_MyMoney.left + parent.s_Img_MyMoney.width + 10;
			top = 588;
		}

		//确定购买:按钮
		staticvar s_Btn_Enter = new VBTN_A_New
		{
			InitText("确定");pos="51,625";
		}
		//取消:按钮
		staticvar s_Btn_Esc = new VBTN_A_New
		{
			InitText("取消");pos="301,625";
		}
	}

	//显示各种卡的图样
	void SetBuycarPos(_AgioCardState,_LukyCardState)
	{
//		alert("SetBuycarPos:"+_AgioCardState+","+_LukyCardState);
		_LiveMess.size="366,70";
		_LiveMess.pos="36,509";
		s_LeaveWord.Reset();
		s_UsedCard.pos = "66,490";
		s_UsedCard.show=true;
		if(_AgioCardState==1&&_LukyCardState==1)
		{
			s_LukyCard.pos="116,475";
			s_AgioCard.pos="166,475";
			s_LukyCard.show =true;
			s_AgioCard.show =true;
			return;
		}
		if(_AgioCardState==0 && _LukyCardState==1)
		{
			s_LukyCard.pos="116,475";
			s_LukyCard.show =true;
			s_AgioCard.show =false;
			return;
		}
		if(_AgioCardState==1&&_LukyCardState==0)
		{
			s_AgioCard.pos="116,475";
			s_LukyCard.show =false;
			s_AgioCard.show =true;	
			return;
		}
		_LiveMess.size="366,90";
		_LiveMess.pos="36,489";
		s_LeaveWord.Reset();
		s_LukyCard.show =false;
		s_AgioCard.show =false;
		s_UsedCard.show=false;
	}
};