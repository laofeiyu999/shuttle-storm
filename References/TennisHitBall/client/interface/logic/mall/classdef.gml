//
//商城界面的类定义(包括:购物+技能镶嵌+充值)
//

importex("$./ClassDef_Shopping.gml");
importex("$./ClassDef_Control.gml");
importex("$./../../UI/Mall/ClassDef.gml");
importex("$./ClassDef_Shoping_Screen.gml");
importex("$./ClassDef_ShoppingTime.gml");

class VMall_Logic item
{
	var _bIN = false;
	size = "500,500";bgcolor = "#FFFFFF";name="VMall_Logic";

	//=============================与界面交互========================================
	void Init()
	{
		//帮助:按钮
		staticvar s_Btn_Help = new VMyButton
		{
			Init("?");halign(90,0);valign(0,0);
		}
		//关闭:按钮
		staticvar s_Btn_Close = new VMyButton
		{
			Init("X");halign(100,0);valign(0,0);
		}

		//搜索内容框
		staticvar s_Edit_SearchContent = new BaseEdit
		{}
		//搜索按钮
		staticvar s_Btn_Search = new VBTN_A_New
		{}
		//购买:按钮
		staticvar s_Btn_Buy = new VMyButton
		{
			Init("购买");pos = "200,400";
		}
		//赠送:按钮
		staticvar s_Btn_Send = new VMyButton
		{
			Init("赠送");pos = "300,400";
		}
		//索要:按钮
		staticvar s_Btn_Ask = new VMyButton
		{
			Init("索要");pos = "400,400";
		}
		//购物:按钮
		staticvar s_Btn_ShoppCar = new VMyButton
		{
			Init("购物车");pos = "500,400";
		}
		//精品区
		staticvar s_NiceShopping = new item
		{}
		//精品区进入按钮
		staticvar s_Btn_NiceShopping = new item
		{}
		//休闲区
		staticvar s_ComfortShopping = new item
		{}
		//休闲区进入按钮
		staticvar s_Btn_ComfortShopping = new item
		{}
	}

	inclass("VMall_UI");//界面显示类
	//==============================function=========================================
	Init();

	//商城时间计数器
	staticvar m_shoppingTime = new VShoppingTime_Logic{}
	//商城数据库物品的时间转换器 从2007-10-40 15:10:32格式转成到某个时间点的秒数
	//提供了如下功能：
	//GetGoodsBeginTime(int _entryID)：获取物品的开始时间,_entryID物品的Entry
	//GetGoodsEndTime(int _entryID)：获取物品的结束时间,_entryID物品的Entry
	staticvar m_MallGoods = new CMallGoods{name = "CMallGoods";}

	void ToBuyCarRecord()
	{
		window.find("BuyCarRecord").ClearSelect();
		if ( parent.m_LastSelect > 0 )
		{
			window.find("BuyCarRecord").AddSelect(parent.m_LastSelect,0,1,1);
		}
	}
	
	//[功能]检查购物车和背包情况
	//[参数]type:购买 赠送 所要 购物车
	//[返回值]0直接打开购物车 1不打开
	void CheckToBuyCar(type)
	{
		if ( type != window.MALL_OPT_BUY && type != window.MALL_OPT_ASK ) return 1;
//		if ( window.GetItemSexByID(parent.m_LastSelect) == 0  )
//		{
//			return 1;
//		}
		//需要对套装拆分 每个进行判断是否背包有此物品
		var data = window.find("BuyCarRecord").GetItem(parent.m_LastSelect);//alert("data:"+data);
		var num = window.GetSplitCount(data,",");
		var arr = window.SplitStr2(data,",",num);
		var i = 0;
		var bnofind = 1;
		while (i<num)
		{
			var entryid = toint(arr[i]);
			i+=1;
//			if ( window.GetItemSexByID(entryid) != 0 )
//			{
				var packnum = window.GetItemNumByEnterID(entryid);//alert("entryid:"+entryid+" packnum:"+packnum)
				var packId = window.GetPackIDbyCIDInPack(entryid);
				if ( packnum == 1&&packId!=window.GOODS_CLASS_DeadProps )
				{
					bnofind = 0;
					break;
				}
//			}
		}

		if ( bnofind == 0 )
		{
			if ( type == window.MALL_OPT_BUY )
			{
				window.find("UIController").LoadDLG(639);//您已拥有此物品，是否继续购买”，选是则继续购买
				window.find("VMB_BuyContinue_Logic").m_Select = parent.m_LastSelect;
			}
			if ( type == window.MALL_OPT_ASK )
			{
				window.find("UIController").LoadDLG(640);//您已拥有此物品，是否继续索要”，选是则继续索要
				window.find("VMB_AskContinue_Logic").m_Select = parent.m_LastSelect;
			}
		}
		return bnofind;
	}

	//点击了购买
	void OnClick_Buy()
	{
		if ( window.CheckCanOpenMallDlg() == 0 ) return;
		if ( window.find("BuyCarRecord").GetNum(0) >= window.MALL_BUYCAR_MAXNUM )
		{
			window.find("UIController").LoadDLG(641);
			return;
		}
		if ( CheckToBuyCar(window.MALL_OPT_BUY) != 1 ) return;
			//向购物车添加物品
		window.ToBuyCarRecord(0,0,0,parent.m_LastSelect);
		//add by chenjihui
		//2010-12-27
		window.find("BuyCarRecord").SelectBySex(window.GetMySex(),1,0);
		window.SetMallVar(window.MALL_OPT_BUY);
		window.find("UIController").LoadUI("UI_MALL_BUYCAR"); 
		window.find("MALL_BUY_LOGIC")._BuyCar.m_BuycarState = 1;
		return;		
	}
	//点击了赠送
	void OnClick_Gift()
	{
		if ( window.CheckCanOpenMallDlg() == 0 ) return;
		if ( window.find("BuyCarRecord").GetNum(0) >= window.MALL_BUYCAR_MAXNUM )
		{
			window.find("UIController").LoadDLG(641);
			return;
		}
		window.ToBuyCarRecord(0,0,0,parent.m_LastSelect);
		window.SetMallVar(window.MALL_OPT_GIFT);
		window.find("UIController").LoadUI("UI_MALL_BUYCAR"); 
	}
	//点击了索要
	void OnClick_Ask()
	{
		if ( window.CheckCanOpenMallDlg() == 0 ) return;
		if ( window.find("BuyCarRecord").GetNum(0) >= window.MALL_BUYCAR_MAXNUM )
		{
			window.find("UIController").LoadDLG(641);
			return;
		}
		if ( CheckToBuyCar(window.MALL_OPT_ASK) != 1 ) return;

		window.ToBuyCarRecord(0,0,0,parent.m_LastSelect);
		window.SetMallVar(window.MALL_OPT_ASK);
		window.find("UIController").LoadUI("UI_MALL_BUYCAR"); 
		window.find("MALL_BUY_LOGIC")._BuyCar.SetBuycarPos(0,0);
	}
	//点击了购物车
	void OnClick_BuyCar()
	{
		if ( window.CheckCanOpenMallDlg() == 0 ) return;
		window.find("BuyCarRecord").ClearSelect();
		window.find("BuyCarRecord").SelectBySex(window.GetMySex(),1,0);
		window.SetMallVar(window.MALL_OPT_BUYCAR);
		window.find("UIController").LoadUI("UI_MALL_BUYCAR"); 
	}

	//点击搜索
	void OnClick_Search()
	{
		var _name = s_Edit_SearchContent.GetSrc();// 得到文本内容
		m_Class_Shopping.SearchRefrestSelect(_name);	// 查询
	}

	void HideShoppingContent()
	{
		s_Btn_Buy.show = false;
		s_Btn_Send.show = false;
		s_Btn_Ask.show = false;
		s_Btn_ShoppCar.show = false;
		m_Class_Shopping.show = false;
		m_Class_Control.show = false;
//		m_Class_Screen.show = false;
	}

	//设置响应事件
	void SetEvent()
	{
		//帮助:按钮
		set s_Btn_Help{void OnPressed(){window.CallBack_Help(window.POS_MALL);}}
		//关闭:按钮
		set s_Btn_Close{void OnPressed(){parent.parent.del();}}

		//搜索:按钮
		set s_Btn_Search
		{
			void OnPressed()
			{
				window.find("VMall_Control").s_Btn_GoNiceShopping.show = false;// 屏蔽"进入精品区"按钮
				window.find("VMall_Control").s_Btn_GoComfortShopping.show = false;// 屏蔽"进入休闲区"按钮
				parent.OnClick_Search();
			}
		}
		//搜索内容框
		set s_Edit_SearchContent
		{
			void OnFocus()
			{
				window.find("NAME_GCMap").KeyBoardEnable(0);//0锁定解锁按键 1解除锁定
			}

			void OnLostFocus()
			{
				window.find("NAME_GCMap").KeyBoardEnable(1);//0锁定解锁按键 1解除锁定
			}
		}
		//购买:按钮
		set s_Btn_Buy
		{
			SetState(window.BTN_STATE_GREY);
			void OnPressed()
			{
				if ( GetState() == window.BTN_STATE_LIGHT  )
					parent.OnClick_Buy();
			}
		}
		//赠送:按钮
		set s_Btn_Send
		{
			SetState(window.BTN_STATE_GREY);
			void OnPressed()
			{
				if ( GetState() == window.BTN_STATE_LIGHT  )
					parent.OnClick_Gift();
			}
		}
		//索要:按钮
		set s_Btn_Ask
		{
			SetState(window.BTN_STATE_GREY);
			void OnPressed()
			{
				if ( GetState() == window.BTN_STATE_LIGHT  )
					parent.OnClick_Ask();
			}
		}
		//购物车:按钮
		set s_Btn_ShoppCar{void OnPressed(){parent.OnClick_BuyCar();}}
		//精品区进入按钮
		set s_Btn_NiceShopping
		{
			void OnPressed()
			{
				//if (GetState() == window.BTN_STATE_GREY){return;}
				parent.OnClick_ShoppingType(false,1);
				parent._bIN = true;
			}
		}
		//休闲区进入按钮
		set s_Btn_ComfortShopping
		{
			void OnPressed()
			{
				//if (GetState() == window.BTN_STATE_GREY){return;}
				parent.OnClick_ShoppingType(false,2);
				parent._bIN = true;
			}
		}
	}

	////点击分区，_open:播放屏风打开动画，false播放屏风关闭动画;_type:1为精品区，2为休闲区;
	void OnClick_ShoppingType(_open,_type)
	{
		if(!_open)
		{
//			s_Btn_NiceShopping.SetState(window.BTN_STATE_GREY);
//			s_Btn_ComfortShopping.SetState(window.BTN_STATE_GREY);
			s_Btn_NiceShopping.show = false;
			s_Btn_ComfortShopping.show = false;
		}
//		PlayScreen();
//		sleep(700);//停留时间：sleep的值减去动画播放时间
		FlashShoppingContent(_type);
	}

	//刷新商城显示内容，type:1为精品区，2为休闲区
	void FlashShoppingContent(_type)
	{
		//购物部分显示
		s_Btn_Buy.show = true;
		s_Btn_Send.show = true;
		s_Btn_Ask.show = true;
		s_Btn_ShoppCar.show = true;
		m_Class_Shopping.show = true;
		m_Class_Control.show = true;
		SetShoppingContent(_type);

		//分区部分隐藏
		s_NiceShopping.show = false;
		s_Btn_NiceShopping.show = false;
		s_ComfortShopping.show = false;
		s_Btn_ComfortShopping.show = false;
	}
	//刷新分区的商城物品内容，type:1为精品区，2为休闲区
	void SetShoppingContent(_type)
	{
		printf("D# chjh SetShoppingContent window.g_MainLabel="+window.g_MainLabel);
		var _radioNum = window.g_MainLabel;
		m_Class_Control.SetZone(_type);
		m_Class_Shopping.SetZone(_type);
		if	(window.find("VMall_Shopping_Logic").m_SearchState == false)
		{
			m_Class_Shopping.RefrestSelect();
			if (toint(_radioNum) != -1)
			{
				m_Class_Shopping.s_RadioCtrl_Mall.OnClickRadio(toint(_radioNum));
				window.g_MainLabel = -1;
			}
			else
			{
				m_Class_Shopping.s_RadioCtrl_Mall.OnClickRadio(0);
			}
		}
		else
		{
			m_Class_Shopping.RefrestSelect2();
		}
	}
//	//屏风动画
//	void PlayScreen()
//	{
//		m_Class_Screen.show = true;
//		m_Class_Screen.PlayFlash();
//	}
	//生成一些成员变量
	void NewSubObj()
	{
		staticvar m_Class_Shopping = new VMall_Shopping_Logic{ }
		staticvar m_Class_Control = new VMall_Control_Logic{}
//		staticvar m_Class_Screen = new VMall_ShoppingScreen_Logic{}
	}
	NewSubObj();
	SetEvent();
	HideShoppingContent();
	//过期物品弹出商城
	if (toint(window.g_PackToMall) == 1)
	{
		sleep(1000);
		OnClick_ShoppingType(false,toint(window.g_GoodsPriceType));
		window.g_PackToMall = 0;		//清空标志
	}

	void OnCreated()
	{
	staticvar _VNet2DBTable = new VNet2DBTable{};
	var sql = "SELECT * FROM "+window.BUYCARSELECT+" WHERE "+window.GAMEUI_BUYCARSELECT_STATE_STR+"=1 AND "+window.GAMEUI_BUYCARSELECT_TYPE_STR+"=0";
	_VNet2DBTable.Select( window.GAMEUI,sql);
	if(_VNet2DBTable.GetSize() != 0)
	{
		s_Btn_ShoppCar.SetFlicker(1);
	}
	_VNet2DBTable.del();
	}
};