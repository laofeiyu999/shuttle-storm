//
//续费物品的LIST
importex("$./../../../UI/Mall/Pop/ClassDef_PropContinue_DBList.gml");

//一行显示类：图标+名称+有效期+金币+点券+索要+购买+赠送
class VColumn_PropContinue_Column_Logic item
{
	size = "600,35";
	
	var m_LimitTimeIndex = -1;
	var m_MoneyType = 0;		//购买所需金币类型 1,金币;2,点券;3,Pk点
	var m_PriceArr;			//价格的数组
	var m_Sel = 1;			//物品是否选择，0为为选择，1为选择
	var m_GoldType = 0;
	var m_GoldValue = 0;
	var m_EntryID = 0;
	var m_EntryGID = 0;
	//===========================与显示交互======================
	void Init()
	{
		//图标
		//参数 data1: 物品的识别ID
		//参数 sex: 是否为同性物品 1是 2不是
		staticvar s_GID = new VMyText{}

		//道具名称
		//参数 data1
		staticvar s_ItemName = new VMyText{pos = "50,0";border="#123456";}
		
		//道具价格
		//参数 data1:多少
		//参数 data2:类型 1,金币;2,点券;3,Pk点
		staticvar s_ItemGold = new VMyText{pos = "200,0";border="#123456";}

		//期限
		staticvar s_CB_Time = new VMyComboBox {m_sizeX = 98;pos = "300,0";border="#123456";}

		//选择
		staticvar s_CH_Sel = new VMyCheckBox
		{
			Init("选择");pos = "400,0"
		}
	}
	//需要被显示的类覆盖
	void OnMySelect(){bgcolor = "#FFEA99";alpha = 50;}	//选择的效果
	void OnMyUnSelect(){bgcolor = "-1";}				//不选择的效果
	inclass("VColumn_PropContinue_Column_UI"); //界面显示类
	//===============================function==============================
	//设置响应事件
	void SetEvent()
	{
		//选择:CheckBox
		set s_CH_Sel
		{
			void OnCheck()
			{
				parent.m_Sel = 1;
				MouseCheck_UI();
				MouseCheck();
				parent.RefreshTotalMoney();
			}
			void OnUnCheck()
			{
				parent.m_Sel = 0;
				MouseUnCheck_UI();
				MouseUnCheck();
				parent.RefreshTotalMoney();
			}
		}

		set s_CB_Time
		{
			void WhichSelect(index)
			{
				parent.m_LimitTimeIndex = index;
				parent.SetPriceByTime();
				parent.RefreshTotalMoney();
			}

			void GetOffSetX()
			{
				var _x = (parent.parent.parent.getViewX()+parent.parent.getViewX()+parent.getViewX()+parent.parent.parent.left+parent.parent.left+parent.left);
				return _x;
			}
			void GetOffSetY()
			{
				return (parent.parent.parent.getViewY()+parent.parent.getViewY()+parent.getViewY()+parent.parent.parent.top+parent.parent.top+parent.top);
			}
			void CheckDropMenuView()
			{
				var _top = top+parent.top+parent.parent.getViewY()+18;
//				printf("下拉框位置："+_top);
				if(_top<0 || _top>parent.parent.height){window.find("Menu"+m_DropMenuId).ShouldHide();}
				else{window.find("Menu"+_Menu.m_DropMenuId).ShouldShow();}
			}
			void OnUpDate()
			{
				//效率问题 加上判断
				if(m_isListShow == false){return};
				SetPos(170,66);
				CheckDropMenuView();
				sleep(1000);
			}
		}

		set s_ItemGold
		{
			void SetGold(type,value)
			{
				parent.m_GoldType = type;
				parent.m_GoldValue = value;
			}
		}
	}
	Init();
	SetEvent();
	//====================================================================
	void OnSelect()
	{
		OnMySelect();
	};
	void OnUnSelect(){OnMyUnSelect();};
	void OnDataExchange(iRow,szData)
	{
		var _type = parent.parent.m_Type;
		if(_type == 1)
		{
			m_EntryID = parent.fieldstr(iRow,window.M_G_GOODS_PLAYERITEMS_CID);
			m_EntryGID = parent.fieldstr(iRow,window.M_G_GOODS_PLAYERITEMS_GID);
			var _VNet2DBRow = new VNet2DBRow{}
			_VNet2DBRow.InitByInt(window.M_G_GOODS,window.ITEMS,window.M_G_GOODS_ITEMS_ENTRY,toint(m_EntryID));
			if(_VNet2DBRow.IsReady())
			{
				var _Lv = _VNet2DBRow.GetData(window.M_G_GOODS_ITEMS_QUALITY);
				var _num = _VNet2DBRow.GetData(window.M_G_GOODS_ITEMS_SUBNUM);
				s_GID.SetIconEx(m_EntryID,_Lv,_num);

				var _iconName = _VNet2DBRow.GetData(window.M_G_GOODS_ITEMS_NAME);
				s_ItemName.SetData(_iconName);

				var _Time = _VNet2DBRow.GetData(window.M_G_GOODS_ITEMS_TLIMITBUYTIME);
				var _Price = _VNet2DBRow.GetData(window.M_G_GOODS_ITEMS_TBUYPRICE);
				m_PriceArr = window.SplitStr2(_Price,",");
				var _TimeArr = window.SplitStr2(_Time,",");
				var _arrTime = window.SplitStr2(_Time,",");
				var _num = window.GetSplitCount(_Time,",");
				var _index=0;
				var _Time2 = "";
				while(_index<_num)
				{
					if(toint(_arrTime[_index])!=0)
					{
						_arrTime[_index] = ""+_arrTime[_index]+"天";
					}
					if(_Time2 == "")
					{
						_Time2 += _arrTime[_index];
					}
					else
					{
						_Time2 += ","+_arrTime[_index];
					}	
					_index+=1;
			
				}

				if ( m_LimitTimeIndex == - 1 )
				{
					m_LimitTimeIndex = 0;
				}
				s_CB_Time.SetID(szData);
				s_CB_Time.SetPos(170,66);
				s_CB_Time.SetWidthAndType(140,0);
				s_CB_Time.SetData(_Time2);
				s_CB_Time.SetDefaultSrc(_arrTime[m_LimitTimeIndex]);

				m_MoneyType = _VNet2DBRow.GetData(window.M_G_GOODS_ITEMS_USEPRICETYPE);
				SetPriceByTime();
				if(m_Sel == 1)
				{
					s_CH_Sel.Check();
				}
				else
				{
					s_CH_Sel.UnCheck();
				}
				RefreshTotalMoney();
			}
			_VNet2DBRow.del();
		}
		if(_type == 2)
		{
			m_EntryID = parent.fieldstr(iRow,window.M_G_GOODS_ITEMS_ENTRY);
			m_EntryGID = -1;
			var _Lv = toint(parent.fieldstr(window.M_G_GOODS_ITEMS_QUALITY));
			var _num = toint(parent.fieldstr(window.M_G_GOODS_ITEMS_SUBNUM));
			s_GID.SetIconEx(m_EntryID,_Lv,_num);

			var _iconName = window.GetNameByEnterID(m_EntryID);//parent.fieldstr(window.M_G_GOODS_ITEMS_NAME);
			s_ItemName.SetData(_iconName);

			var _Time = window.GetTimeByEnterID(m_EntryID);//parent.fieldstr(window.M_G_GOODS_ITEMS_TLIMITBUYTIME);
			var _Price = window.GetAllPriceByEnterID(m_EntryID);//parent.fieldstr(window.M_G_GOODS_ITEMS_TBUYPRICE);
			m_PriceArr = window.SplitStr2(_Price,",");
			var _TimeArr = window.SplitStr2(_Time,",");

			var _arrTime = window.SplitStr2(_Time,",");
				var _num = window.GetSplitCount(_Time,",");
				var _index=0;
				var _Time2 = "";
				while(_index<_num)
				{
					if(toint(_arrTime[_index])!=0)
					{
						_arrTime[_index] = ""+_arrTime[_index]+"天";
					}
					if(_Time2 == "")
					{
						_Time2 += _arrTime[_index];
					}
					else
					{
						_Time2 += ","+_arrTime[_index];
					}	
					_index+=1;
			
				}

			if ( m_LimitTimeIndex == - 1 )
			{
				m_LimitTimeIndex = 0;
			}
			s_CB_Time.SetID(szData);
			s_CB_Time.SetPos(170,66);
			s_CB_Time.SetWidthAndType(140,0);
			s_CB_Time.SetData(_Time2);
			s_CB_Time.SetDefaultSrc(_arrTime[m_LimitTimeIndex]);

			m_MoneyType = window.GetPriceTypeByID(m_EntryID);//parent.fieldstr(window.M_G_GOODS_ITEMS_USEPRICETYPE);
			SetPriceByTime();
			if(m_Sel == 1)
			{
				s_CH_Sel.Check();
			}
			else
			{
				s_CH_Sel.UnCheck();
			}
			RefreshTotalMoney();
		}
	}

	//根据时间设置价格
	//参数 index：有效期的序号0-~
	void SetPriceByTime()
	{
//		var _vipValue = window.GetVipTypeByUID();
//		if ( _vipValue > 0 )
		if(window.g_ItemAgio != 100)
		{
			s_ItemGold.SetData( toint(m_PriceArr[m_LimitTimeIndex]) ,m_MoneyType,1);
		}
		else
		{
			s_ItemGold.SetData(m_PriceArr[m_LimitTimeIndex],m_MoneyType,0);
		}
	}

	void AddMoney()
	{
		if ( m_Sel == 1 )
		{
			parent.parent.AddMoney(m_GoldType,m_GoldValue);
		}
	}

	void PropContinueParam()
	{
		var _type = parent.parent.m_Type;
		if ( m_Sel == 1)
		{
			var _Param = ""+m_EntryGID+","+m_EntryID+",1,"+m_LimitTimeIndex;
			parent.parent.PropContinueParam(_Param);
//			window.g_MyItemsCheck.AddDeadItems(m_EntryGID);
		}
		if(_type == 1)
		{
			window.g_MyItemsCheck.AddDeadItems(m_EntryGID);
		}
	}

	void RefreshTotalMoney()
	{
		parent.parent.RefreshTotalMoney();
	}
};

//
//总的类：List
//
class VItem_PropContinue_Logic_List VN2ListCtrl
{
	//需要显示时改变
	size="600,200";valign(15,0);halign(15,0);
	//
	selecttype="1";colfilter="0";//simpleshowmode="1,3";
	alpha = 70;bgcolor = "#FF0000";
	scroll = window.SCROLL_NOYES;
	
	inclass("VItem_PropContinue_UI_List"); //界面显示类

	columclass="0,VColumn_PropContinue_Column_Logic"; //识别id
};