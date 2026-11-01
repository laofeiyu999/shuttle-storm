//
//商城-购物-服饰的物品list
//同性物品可以购买+赠送+索要
//异性物品只能赠送给跟物品同性的人

//一行显示类：图标+名称+有效期+金币+点券+索要+购买+赠送
class VColumn_ChargeCar_Column_UI item
{
	size = "600,98";//border="-1";
	//===========================与显示交互======================
	void Init()
	{
		//图标
		//参数 data1: 物品的识别ID
		//参数 sex: 是否为同性物品 1是 2不是
		staticvar s_GID = new VGoodsIconNew_Logic
		{
			
		}

		staticvar _mc = new img
		{
			src = "$./imgs"+window.g_Sex+"/mc-text.tga";
			pos = "105,8";
		}
		
		staticvar _ItemNameEdit = new VPic9_EditBK_UI
		{
			pos = "148,6";size="140,20"
		}
//		staticvar _McEditSelectedFlag = new img
//		{
//			src = "$./imgs"+window.g_Sex+"/xzsj.tga";
//			size = "7,7";
//			pos = "171,7";
//			show = false;
//		}
		staticvar _jg = new img
		{
			src = "$./imgs"+window.g_Sex+"/jg-text.tga";
			pos = "105,38";
		}
		//道具名称
		//参数 data1
		staticvar s_ItemName = new BaseText
		{
			pos = "155,9";//border="-1";
		}

		staticvar _ItemGoldEidt = new VPic9_EditBK_UI
		{
			pos = "148,36";size="140,20"
		}
//		staticvar _QxEditSelectedFlag = new img
//		{
//			src = "$./imgs"+window.g_Sex+"/xzsj.tga";
//			size = "7,7";
//			pos = "171,37";
//			show = false;
//		}
		staticvar _qx = new img
		{
			src = "$./imgs"+window.g_Sex+"/qx-text.tga";
			pos = "105,68";
		}
		//道具价格
		//参数 data1:多少
		//参数 data2:类型 1,金币;2,点券;3,Pk点
		staticvar s_ItemGold = new BaseText
		{
			pos = "155,39";//border="-1";
			void SetData(data1,data2,data3)
			{
				var _agio =parent.s_CB_CardSelect._CardType;
				if ( data2 == 1 )
				{
					src = "金币:" + data1;
				}
				if ( data2 == 2 )
				{
					src = "点券:" + data1;
				}
				if(data2 == 3)
				{
					src = "奖券:" + data1;
				}
				if (data3 == 1)
				{
//					var _pos1 = _agio.Find(".");
//					var _pos2 = _agio.Find("0");
//					if(toint(_pos2-_pos1) == 1)
//					{
//						_agio = _agio.Mid(0,1);
//					}
//					else
//					{
//						_agio = _agio.Mid(0,3);
//					}
					if (_agio == 1)
					{
						src += "(打7.2折)";
					}
					if (_agio == 2)
					{
						src += "(打5.4折)";
					}
					
				}
				else
				{
					src += "(打9折)";
				}
				var _DeadORLive = window.CheckPackItemDeadLine(window.GOODS_CLASS_PropaLCard);
				if(parent.parent.parent.m_LukyCardNum !=0 ||_DeadORLive == true)
				{
					if (_agio == 0)
					{
						var _realValue = toint(toint(data1)*0.9);
						SetGold(data2,_realValue);
					}
					if (_agio == 1)
					{
						var _realValue = toint(toint(data1)*0.72);
						SetGold(data2,_realValue);
					}
					if (_agio == 2)
					{
						var _realValue = toint(toint(data1)*0.54);
						SetGold(data2,_realValue);
					}		
				}
				else
				{	_realValue = 0;
					var _realValue = toint(toint(data1)*0.9);
					SetGold(data2,_realValue);
				}
			}
		}

//		new VPic9_EditBK_UI
//		{
//			pos = "170,66";size="140,20"
//		}

		//期限
		staticvar s_CB_Time = new VMyDropMenu_UI{pos = "148,66";}
		//选择卡类型
		staticvar s_CB_CardSelect = new VMyDropMenu_UI{}

		//选择
		staticvar s_CH_Sel = new VCK_CK_New
		{
			pos = "298,68";
			void MouseCheck_UI()
			{
				parent._mc.src = "$./imgs"+window.g_Sex+"/mc1-text.tga";
				parent._jg.src = "$./imgs"+window.g_Sex+"/jg1-text.tga";
				parent._qx.src = "$./imgs"+window.g_Sex+"/qx1-text.tga";
//				parent._McEditSelectedFlag.show = true;
//				parent._QxEditSelectedFlag.show = true;
				parent.s_GID.SetSelect(true);
			}
			void MouseUnCheck_UI()
			{
				parent._mc.src = "$./imgs"+window.g_Sex+"/mc-text.tga";
				parent._jg.src = "$./imgs"+window.g_Sex+"/jg-text.tga";
				parent._qx.src = "$./imgs"+window.g_Sex+"/qx-text.tga";
//				parent._McEditSelectedFlag.show = false;
//				parent._QxEditSelectedFlag.show = false;
				parent.s_GID.SetSelect(false);
			}
		}

	}

	void SetBuycarListPos(_CardState)
	{
		if(_CardState !=0 )
		{
			_mc.pos = "105,8";
			_ItemNameEdit.pos = "148,6";
			_jg.pos = "105,38";
			s_ItemName.pos = "155,9";
			_ItemGoldEidt.pos = "148,36";
			_qx.pos = "105,68";
			s_ItemGold.pos = "155,39";
			s_CH_Sel.pos = "298,68";	
			s_CB_CardSelect.show=true;
			s_CB_Time.SetPos(148,66);
			s_CB_Time.SetPosFunc(_CardState);
			s_CB_Time.setTimeMenuPos();
			return;
		}
		if(_CardState==0)
		{
			_mc.pos = "127,8";
			_ItemNameEdit.pos = "170,6";
			_jg.pos = "127,38";
			s_ItemName.pos = "177,9";
			_ItemGoldEidt.pos = "170,36";
			_qx.pos = "127,68";
			s_ItemGold.pos = "177,39";
			s_CH_Sel.pos = "320,68";
			s_CB_Time.SetPos(170,66);
			s_CB_CardSelect.show=false;
			s_CB_Time.setTimeMenuPos();
		}
		
	}
	//需要被显示的类覆盖
	void OnMySelect(){bgcolor = "#FFEA99";alpha = 50;}	//选择的效果
	void OnMyUnSelect(){bgcolor = "-1";}				//不选择的效果
};

//排版器，可自定义
//class VMall_BuyCar_TypeSet_UI VN2LCTypesetter
//{
//	autochgrow="381";
//};

//
//总的类：List
//
class VMall_ChargeCar_UI_List VN2ListCtrl
{
	//需要显示时改变
	size="380,300";valign(0,0);halign(0,0);
	alpha = 0;bgcolor = "-1";pos="30,80"
	scroll = window.SCROLL_NO;
	scroll = window.SCROLL_NOTENNIS;

	var _iRow = 0;
	void ScrollToEnd()
	{
		var _targety = (_iRow.__Long__) * 105;
		//scrollto(0, _targety);
		//scriptprcallsub("AdjustComBoxPos",_iRow);
	}
	//移动到某个位置
	void ScrollToIndex(index)
	{
		var _targety = index * 105;
		scrollto(0, _targety);
	}
	//typesetter ="VMall_BuyCar_TypeSet_UI";
};