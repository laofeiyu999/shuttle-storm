//
//商城界面-UI+Logic
//yxf 2008年9月1日10:43
//

importex("$./ClassDef.gml");

new item
{
	name = "MALL_LOGIC";size = "100%,100%";show = false;

	window.SetHallHtn_Open(window.G_HALLBTN_MALL);
	var _LastPos = window.GetUIPos();
	window.SetUIPos(window.POS_MALL);

	var _VMall_Logic = new VMall_Logic{}

	var m_RecordMan = new vector{type(1);}
	var m_RecordWoMan = new vector{type(1);}
	var m_PointMan = -1;
	var m_PointWoMan = -1;
	var m_LastSelect = -1;
	var m_SelectSex = 0;

	//点击男/女的图标,让外面的模型刷新
	void RefreshModel(sex)
	{
		window.SwitchSex(sex);
		m_SelectSex = sex;
		if ( m_SelectSex != window.GetMySex() )
			_VMall_Logic.s_Btn_Buy.SetState(window.BTN_STATE_GREY);
	}

	// 使" 购物, 赠送, 索要"按钮为可用或不可用
	void SetBtnState(isShow)
	{
		if (isShow == true)
		{
			window.find("VMall_Logic").s_Btn_Buy.SetState(window.BTN_STATE_LIGHT);// "购物"按钮
			window.find("VMall_Logic").s_Btn_Send.SetState(window.BTN_STATE_LIGHT);// "赠送"按钮
			window.find("VMall_Logic").s_Btn_Ask.SetState(window.BTN_STATE_LIGHT);// "赠送"按钮
		}
		if (isShow == false)
		{
			window.find("VMall_Logic").s_Btn_Buy.SetState(window.BTN_STATE_GREY);// "购物"按钮
			window.find("VMall_Logic").s_Btn_Send.SetState(window.BTN_STATE_GREY);// "赠送"按钮
			window.find("VMall_Logic").s_Btn_Ask.SetState(window.BTN_STATE_GREY);// "赠送"按钮
		}
	}

	//点击列表选中一个物体
	void SelectItem(entryid)
	{
		// 选中效果(段晓彤)
		window.g_Row.InitByInt(window.M_G_GOODS,window.ITEMS,window.M_G_GOODS_ITEMS_ENTRY,entryid);
		var _LimitBuyTimeCnt = 0;
		var _TState = 0;
		if(window.g_Row.IsReady())
		{
			_TState = window.g_Row.GetData(window.M_G_GOODS_ITEMS_TSTATE);	// 物品状态
			_LimitBuyTimeCnt = window.g_Row.GetData(window.M_G_GOODS_ITEMS_LIMITBUYTIMECOUNT);//LimitBuyTimeCount, 46 网球：限时购买数量
			window.g_Row.Release();
		}
		else
			window.g_Row.Release();
		var _CurrTime = window.g_ShopTimeNow;// 当前时间, 从洋洋那里得到
		var _StartTime = window.find("CMallGoods").GetGoodsBeginTime(entryid);// 得到毫秒级的时间
		var _EndTime = window.find("CMallGoods").GetGoodsEndTime(entryid);// 得到毫秒级的时间

		SetBtnState(true);
		switch(toint(_TState))
		{
			case 1:// 限时
				if (toint(_CurrTime) < toint(_StartTime) || toint(_CurrTime) > toint(_EndTime))// 如果物品未开始售卖 或物品已经截止
				{
					SetBtnState(false);
				}
				else
					SetBtnState(true);
				break;
			case 2:// 限量
				if (toint(_CurrTime) < toint(_StartTime) || toint(_CurrTime) > toint(_EndTime))// 如果物品未开始售卖 或物品已经截止
				{
					SetBtnState(false);
				}
				else
				{
//					SetBtnState(true);
					// LimitTimeItem(当前频道物品卖掉的记录表)
					var _LimitItemDBRow = new VNet2DBRow{};
					_LimitItemDBRow.InitByInt(window.M_G_GOODS, window.LIMITTIMEITEM, window.M_G_GOODS_LIMITTIMEITEM_ENTRYID, toint(entryid));
					if (_LimitItemDBRow.IsReady())
					{
						var _LimitCounted = _LimitItemDBRow.GetData(window.M_G_GOODS_LIMITTIMEITEM_NUM);// Num 当前频道该物品已经购买了的数量 
						if ((toint(_LimitBuyTimeCnt) - toint(_LimitCounted)) <= 0)// 当前频道物品总数 - 当前频道已经卖掉的物品数量 = 剩下多少个物品数量.
						{
							SetBtnState(false);
						}
						else
						{
							SetBtnState(true);
						}
						_LimitItemDBRow.del();// 释放
					}
					else
						_LimitItemDBRow.del();// 释放LimitTimeItem表对象
				}
				break;
			case 3:// 新品
				if (toint(_CurrTime) < toint(_StartTime))// 如果物品未开始售卖
					SetBtnState(false);
				else
					SetBtnState(true);
				break;
		}
		
		//第一步
		m_LastSelect = entryid;
		//第二步
		var v = window.SetMallTryData(entryid);

		if ( !v ) return;
		if ( m_SelectSex == 1 )
		{
			m_RecordMan.push_back(entryid);
			m_PointMan = m_RecordMan.size()-1;
		}
		else
		{
			m_RecordWoMan.push_back(entryid);
			m_PointWoMan = m_RecordWoMan.size()-1;
		}
	}

	//取消选择
	void UnSelectItem()
	{
		m_LastSelect = -1;
		_VMall_Logic.s_Btn_Buy.SetState(window.BTN_STATE_GREY);
		_VMall_Logic.s_Btn_Send.SetState(window.BTN_STATE_GREY);
		_VMall_Logic.s_Btn_Ask.SetState(window.BTN_STATE_GREY);
	}

	//点击了上一件
	void UpCloth()
	{
		if ( m_SelectSex == 1 )
		{
			m_PointMan-=1;
			if ( m_PointMan < 0 )
			{
				m_PointMan = 0;
				return;
			}
			if ( m_PointMan >= m_RecordMan.size() )
			{
				m_PointMan = m_RecordMan.size() - 1;
				return;
			}
			var v = m_RecordMan.get(m_PointMan);
			window.SetMallTryData(v);
		}
		else
		{
			m_PointWoMan-=1;
			if ( m_PointWoMan < 0 )
			{
				m_PointWoMan = 0;
				return;
			}
			if ( m_PointWoMan >= m_RecordWoMan.size() )
			{
				m_PointWoMan = m_RecordWoMan.size() - 1;
				return;
			}
			var v = m_RecordWoMan.get(m_PointWoMan);
			window.SetMallTryData(v);
		}
	}
	//点击了下一件
	void DownCloth()
	{
		if ( m_SelectSex == 1 )
		{
			m_PointMan+=1;
			if ( m_PointMan < 0 )
			{
				m_PointMan = 0;
				return;
			}
			if ( m_PointMan >= m_RecordMan.size() )
			{
				m_PointMan = m_RecordMan.size() - 1;
				return;
			}
			var v = m_RecordMan.get(m_PointMan);
			window.SetMallTryData(v);
		}
		else
		{
			m_PointWoMan+=1;
			if ( m_PointWoMan < 0 )
			{
				m_PointWoMan = 0;
				return;
			}
			if ( m_PointWoMan >= m_RecordWoMan.size() )
			{
				m_PointWoMan = m_RecordWoMan.size() - 1;
				return;
			}
			var v = m_RecordWoMan.get(m_PointWoMan);
			window.SetMallTryData(v);
		}
	}
	//点击了形象还原
	void AvaRestore()
	{
		window.ResetAvatar();
	}
	//点击了把当前形象发送到购物车
	void SendToBuyCar()
	{
		var data = window.GetMallTryData();
		var num = window.GetSplitCount(data,","); //个数
		if ( num <= 0 )
		{
			window.find("UIController").LoadDLG(633);//当前没有试穿,无需保存形象
			return;
		}

		var type = window.find("BuyCarRecord").CheckFull(5);
		if ( type == 0 )
		{
			window.find("UIController").LoadDLG(123);//已经保存5套服装了,无法保存
			return;
		}

		var ck = 1;
		while (ck < 6)
		{
			var v = window.find("BuyCarRecord").CheckVisual(ck,data);
			if ( v == 1 )
			{
				window.find("UIController").LoadDLG(637);//您已保存过此形象，是否继续保存
				return;
			}
			ck += 1;
		}
		
		var arr = window.SplitStr2(data,",",num);//价格-返回一个数组
		var i = 0;
		while (i<num)
		{
			var entryid = toint(arr[i]);
			i+=1;
			window.find("BuyCarRecord").AddSelect(entryid,type,0,0);
		}

		//
		window.find("UIController").LoadDLG(431);//形象保存成功
	}

	//点击性别的按钮
	void ClickSexRadio(sex)
	{
		if ( sex == window.USER_SEX_MAN )
		{
			_VMall_Logic.m_Class_Control.s_R_Woman.UnCheck();
			_VMall_Logic.m_Class_Control.s_R_Man.Check();
		}
		else
		{
			_VMall_Logic.m_Class_Control.s_R_Man.UnCheck();
			_VMall_Logic.m_Class_Control.s_R_Woman.Check();
		}
	}

	void OnCreated()
	{
		//zindex = "top";
		if (window.g_MallOpenType == window.G_MALLOPENTYPE_ROOM)
		{
			_VMall_Logic.m_Class_Control.show= false;
		}
		
		sleep(1000);
		show = true;

		window.find("TOPLAYER").delallchild();
//		window.g_IsOpenMalling = false;
		window.g_MallOpenType = -1;
		window.LMH1_MallCreated();//引导事件

		//播一个动作 2010年9月18日 yxf
		window.find("ROLEMODEL_LOGIC")._VModelMgr_Logic.SetModelAction(window._ACT_ENTER_MALL);
	}

	void OnDelete()
	{
		window.SetUIPos(_LastPos);
		window.SwitchSex(window.GetMySex());
		window.ResetAvatarAll();							//解决了商城中换性别试穿关商城后不能还原背包中已经装备的特效
		window.SetHallHtn_Close(window.G_HALLBTN_MALL);
	}
}