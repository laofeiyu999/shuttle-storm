////背包类定义 - 过期道具

importex("$./../../UI/Pack/ClassDef_DeadProps.gml");

class VPack_DeadProps_Logic item
{
	size = "70%,65%";pos(0,50);bgcolor = "#FF";alpha = 50;
	var m_DeadPropsIndex		= -1;	//过期道具 全部-1 辅助道具1,聊天工具0
	var m_LastSelect = 0; //最后一次选择的物品ID
	var m_PriceType = 0;		//物品价格类型
	var m_Classid = 0;		//物品类型

	void Init(){};

	inclass("VPack_DeadProps_UI");
		
	//==============================function=========================================
	//切换选项卡
	//道具 全部-1 辅助道具1,聊天工具0
	void ChangeType(type)
	{
		m_PropsIndex = type;
		parent.OnMySelect(m_PropsIndex);
	}
	void SetPriceType(enterid)
	{
		if (window.GetPriceTypeByID(enterid) == 1 || window.GetPriceTypeByID(enterid) == 3)
		{
			m_PriceType = 2;
		}
		if (window.GetPriceTypeByID(enterid) == 2)
		{
			m_PriceType = 1;
		}
	}
	
	void setlastselect( enterid )
	{ 
		m_Classid = window.GetClassIdByID(enterid);
		SetPriceType(enterid);
		m_LastSelect =enterid ; s_btn_rebuy.SetState(window.BTN_STATE_LIGHT);
	};
	void unlastselect()
	{
		s_btn_rebuy.SetState(window.BTN_STATE_GREY);
	}
	//设置选项卡
	//参数 type：类型 1服饰，2美容，3饰品，4技能，6属性，7道具，9热销
	void SetSelectLabel(_type,classtype)
	{
		if (toint(classtype) == 105)
		{
			return;
		}
		switch (toint(_type))
		{
		case 1:
			window.find("MALL_LOGIC")._VMall_Logic.m_Class_Shopping.m_Class_Dress.SetLabelCheck(classtype);
			break;
		case 2:
			window.find("MALL_LOGIC")._VMall_Logic.m_Class_Shopping.m_Class_Face.SetLabelCheck(classtype);
			break;
		case 3:
			window.find("MALL_LOGIC")._VMall_Logic.m_Class_Shopping.m_Class_Deck.SetLabelCheck(classtype);
			break;
		case 4:
			window.find("MALL_LOGIC")._VMall_Logic.m_Class_Shopping.m_Class_Skill.SetLabelCheck(classtype);
			break;
		case 6:
			window.find("MALL_LOGIC")._VMall_Logic.m_Class_Shopping.m_Class_Attribute.SetLabelCheck(classtype);
			break;
		case 7:
			window.find("MALL_LOGIC")._VMall_Logic.m_Class_Shopping.m_Class_Props.SetLabelCheck(classtype);
			break;
		case 9:
			window.find("MALL_LOGIC")._VMall_Logic.m_Class_Shopping.m_Class_HotSale.SetLabelCheck(classtype);
			break;
		
		}
	}
	//购买
	void DeadProps()
	{
		printf("E# chjh DeadProps enterid="+m_LastSelect);
		parent.show = false;
		window.g_DeadGoodId = m_LastSelect;
		window.g_PackToMall = 1;
		window.g_GoodsPriceType = m_PriceType;
		window.g_HallBtnMgr.SetHallOpenUIHideState(0);	//按钮状态
		//主标签赋值
		if (toint(m_Classid) == 105)		//此为球拍，因球拍和衣服classid都为100开始编号
		{
			window.g_MainLabel = 5;
		}
		else			
		{
			window.g_MainLabel = toint(m_Classid)/100 + 1;
		}
		window.OnClick_BTN_PackToMall();
		window.find("BuyCarRecord").AddSelect(m_LastSelect,0,1,1);
		window.find("MALL_LOGIC")._VMall_Logic.m_Class_Shopping.m_ClassID = m_Classid;
		
		sleep(1500);			//防止标签未选中
		//子选项选中
		SetSelectLabel(toint(m_Classid)/100,m_Classid);
		//设置第几页
		printf("E# chjh DeadProps window.g_DeadGoodsNum="+window.g_DeadGoodsNum); 
		if (toint(window.g_DeadGoodsNum) > 10)
		{
			window.find("MALL_LOGIC")._VMall_Logic.m_Class_Shopping.s_PageCtrl.setpageto(toint(window.g_DeadGoodsNum)/10+1);
			window.g_DeadGoodsNum = 0;
		}
		
		window.find("MALL_LOGIC")._VMall_Logic.OnClick_BuyCar();
		window.find("MALL_LOGIC")._VMall_Logic.s_Btn_ShoppCar.OnMouseOut();
		window.FQ_CheckSelect_MallGoodsList_ByID(m_LastSelect);		//设置物品选中
		printf("D# chjh 购物车打开，50ms后关闭背包");
		sleep(200);
		window.OnClick_BTN_Pack();		//关闭背包
	}
	//设置响应事件
	void SetEvent()
	{
		set s_btn_rebuy
		{
			void OnClick()
			{ 
				if ( GetState() ==window.BTN_STATE_LIGHT )
				{
					parent.DeadProps();
//					window.GameCtndeaditems(parent.m_LastSelect); 
				}
				
			};
		}
	}
	void OnCreated()
	{
		Init();
		SetEvent();
	}
};