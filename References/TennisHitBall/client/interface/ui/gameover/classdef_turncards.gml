//游戏结算后的的翻牌界面
//夏洋洋 2010-6-5

class VGame_Over_TurnCards_UI item
{
	size = "100%,100%";//alpha = 30;

	void Init()
	{
		new img
		{
			src = "$./imgs"+window.g_Sex+"/bk.jpg";
			//src = "$./imgs/dt.tga";	
			size = "100%,100%";
		}

		new img
		{
			src = "$./imgs/qxzzjdjl.tga";
			top = 30;
			left = 30;
		}

		//金币卡部分
		staticvar m_MoneyCardsBk = new img
		{
			size = "70%,200";
			src = "$./imgs/ditu.tga";
			halign(50,0);
			valign(25,0);
		}
		staticvar m_Text_MoneyCards = new img
		{
			src = "$./imgs/jbk-text.tga";
			left = parent.m_MoneyCardsBk.left+30;
			top = parent.m_MoneyCardsBk.top - height;
		}
		staticvar m_MoneyCardsTip = new img//BaseText
		{
			src = "$./imgs/nfd.tga";
			//src = "(您翻的第一张金币卡是免费的，请不要错过机会)";
			left = parent.m_Text_MoneyCards.left+parent.m_Text_MoneyCards.width+10;
			top = parent.m_Text_MoneyCards.top+10;
		}
		


		//奖券卡部分
		staticvar m_TokenCardsBk = new img
		{
			size = "70%,200";
			src = "$./imgs/ditu.tga";
			halign(50,0);
			valign(70,0);
		}
		staticvar m_Text_TokenCards = new img
		{
			src = "$./imgs/jqk-text.tga";
			left = parent.m_TokenCardsBk.left+30;
			top = parent.m_TokenCardsBk.top - height;
		}
		new img//BaseText
		{
			src = "$./imgs/myz.tga";
			//src = "(每翻一张奖券卡需要消耗100奖券)";
			left = parent.m_Text_TokenCards.left+parent.m_Text_TokenCards.width+10;
			top = parent.m_Text_TokenCards.top+10;
		}
//		//倒计时
//		staticvar m_TimeBk = new img
//		{
//			size = "100%,69";
//			src = "$./imgs/t.tga";
//			halign(70,0);valign(90,0);
//		}
//		staticvar m_TimeCount = new img
//		{
//			src = "$./imgs/sysj.tga";
//			top = parent.m_TimeBk.top+(parent.m_TimeBk.height-height)/2;
//			halign(20,0);//倒计时的位置
//		}
//		staticvar m_TimeNum = new VN2NumShow
//		{
//			//size = "78,35";
//			src = "$./../PublicImage/num/wager.tga";
//			top = parent.m_TimeCount.top;
//			left = parent.m_TimeCount.left+parent.m_TimeCount.width + 30;
//
//			void SetData(_num)
//			{
//				var _time = toint(_num);
//				setNum(_time);
//			}
//			
//			void SetEffect()
//			{
//				setParamTimer();
//			}
//		}

		//换新的倒计时数字
		staticvar m_TimeNum = new img
		{
			zindex = "top";
			void SetData(_num)
			{
				src = "$./../PublicImage/num/turncard/0"+_num+".tga";
				SetEffect();
			}
			
			void SetEffect()
			{
				alpha = 0;
				size = "344,418";
				pos = "340,175";

				setParamTimer("size","344,418","500,608",200,0);
				setParamTimer("pos","340,175","262,80",200,0);
				setParamTimer("alpha",0,100,1000,0);
			}
		}


		//返回房间-按钮
		staticvar s_BackToRoom = new VBTN_A_New
		{
			pos = "458,600";
			InitText("返回房间");
		}
	}
}

//单张卡
class VGame_Over_Cards_UI item
{
	size = "85,130";//bgcolor = "#ff0000";

	void Init()
	{
		//卡牌正面
		staticvar m_CardsFrontBk = new img
		{
			size = "100%,110";
			show = false;
			
			void SetSrc(_type)
			{
				switch(_type)
				{
					case 1:src="$./imgs/jbz.tga";break;
					case 2:src="$./imgs/djz.tga";break;
				}
			}
		}

		//卡牌内容
		staticvar m_CardsFront = new img
		{
			size = "75%,50%";
			left = parent.m_CardsFrontBk.left+(parent.m_CardsFrontBk.width-width)/2;
			top = parent.m_CardsFrontBk.top+(parent.m_CardsFrontBk.height-height)/2;

			void SetSrc(_ItemName,_lv)
			{
				if(_ItemName != "")
				{
					if (toint(_lv) > 0)
					{
						src = "$./../PublicImage/GoodsIcon/"+_ItemName+_lv+".tga";
					}
					else 
					{
						src = "$./../PublicImage/GoodsIcon/"+_ItemName+".tga";
					}
				}
			}
		}
		//物品的数量显示
		staticvar m_ItemNum = new VN2NumShow
		{
			src = "$./../PublicImage/num/Num.tga";
			top = parent.m_CardsFrontBk.top+parent.m_CardsFrontBk.height-25;
			//left = parent.m_CardsFrontBk.left+parent.m_CardsFrontBk.width - 30;
			show = false;

			void SetData(_num)
			{
				setNum(_num);
				var _numCount = tostring(_num).Count;
				left = parent.m_CardsFrontBk.left+parent.m_CardsFrontBk.width - 13*_numCount-10;
				show = true;
			}
		}
		
		//卡牌背面
		staticvar m_CardsBack = new img3d
		{
			size = "100%,110";

			void SetSrc(_type)
			{
				switch(_type)
				{
					case 1:src="$./imgs/jbk.tga";break;
					case 2:src="$./imgs/djk.tga";break;
				}
				clipani(126,165,9,1);
				anispeed = -1;
				aniindex = 0;
				aniloops = 1;
			}
		}
		//翻牌特效动画
		staticvar m_TurnCardEffect = new img3d
		{
			//size = "100%,110";
			pos = "-20,-10";
			src = "$./imgs/c020161.tga";
			clipani(128,128,1,12);
			anispeed = -1;
			aniindex = 0;
			aniloops = 1;
			setShader("2d_add_texture.fx");
			show = false;
		}
		//卡牌文字
		staticvar m_CardsText = new BaseText
		{
			size = "100%,20";//bgcolor = "#ff";
			xcenter = true;ycenter = true;
			top = parent.m_CardsBack.top+parent.m_CardsBack.height;
			left = parent.m_CardsBack.left;

			void SetData(_data)
			{
				if (_data == "") //系统翻牌
					src = "";
				else
					src = "("+_data+")";
			}
		}
		
		//底框
		staticvar m_BkFrame = new img
		{
			size = "100%,110";show = false;
			//src = "$./imgs/hong.tga";
		}

//		//遮罩层
//		staticvar m_CardsMask = new item
//		{
//			size = "100%,100%";
//			capturemouse = true;
//			show = false;
//		}
	}

	
	//设置底框
	void SetBkFrame()
	{
		m_BkFrame.show = false;
		if(m_OpenCardUID.__Long__ == -1)//系统翻牌
		{
			m_BkFrame.show = true;
			m_BkFrame.src = "$./imgs/lan.tga";
			return;
		}
		if(m_OpenCardUID.__Long__ == window.GetMyUID())//本人翻牌
		{
			m_BkFrame.show = true;
			m_BkFrame.src = "$./imgs/hong.tga";
			return;
		}
	}
}