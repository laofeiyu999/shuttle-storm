//
//背包：公共的list
//

importex("$./../../UI/Pack/ClassDef_DBList.gml");

//一行显示类：图标
class VColumn_Pack_Logic item
{
	size = "300,30";
	var m_GID = 0;		//物品的唯一ID
	var m_EnterID = 0;	//物品的识别ID
	var m_EquipPos = 0;	//装备的位置
	var m_EquipRID = 0;	//是否是已装备的物品
	var m_PackID = 0;
	var m_SubClass = -1;	//子类别：持有就行0 宝箱1 老虎机2 点券金币兑换券3 实物兑换券4 大礼包5
	var m_IsChange = 0;		//是否已兑换 0没有 1兑换了
	//===========================与显示交互======================
	void Init()
	{
		//物品识别ID
		//参数 ID: 物品的ID
		//参数 IsEquip:是否已装备 0未装备 1已装备
		//参数 GID: 物品的GID
		staticvar s_GID = new VMyText{}
	}
	inclass("VColumn_Pack_UI"); //界面显示类
	Init();
	//需要被显示的类覆盖
	void OnMySelect(){bgcolor = "#FFEA99";alpha = 50;}	//选择的效果
	void OnMyUnSelect(){bgcolor = "-1";}				//不选择的效果
	//===========================================================
	void OnMouseDownR()
	{
		//OnSelect();
		parent.checkselect(parent.mousex,parent.mousey);
		set window.find("TOPLAYER")
		{
			new VMyMouseR_DressDel
			{
				var _Row = window.find("VPack_DBList_Logic_NAME").curselectrow();
				var _GID = window.find("VPack_DBList_Logic_NAME").fieldstr(_Row,window.M_G_GOODS_PLAYERITEMS_GID); //GID
				var _EnterID = window.find("VPack_DBList_Logic_NAME").fieldstr(_Row,window.M_G_GOODS_PLAYERITEMS_CID); //物品识别id
				var _EquipPos = window.find("VPack_DBList_Logic_NAME").fieldstr(_Row,window.M_G_GOODS_PLAYERITEMS_EQUIPPOS); //装备位置 0卸下 1装上 
				var _EquipRID = window.find("VPack_DBList_Logic_NAME").fieldstr(_Row,window.M_G_GOODS_PLAYERITEMS_EQUIP); //已装备的RID
				var _PackID = window.find("VPack_DBList_Logic_NAME").fieldstr(_Row,window.M_G_GOODS_PLAYERITEMS_PACKID); //背包id
				
				_PackID = toint(_PackID);

				/*道具*/
				if (_PackID / window.GOODS_CLASS_BASE == window.GOODS_CLASS_Props && _PackID != window.GOODS_CLASS_KBRemindProp)
				{
					DelBub(m_Index_TakeOff);	//现在道具都没有装备了
					
					if (_PackID == window.GOODS_CLASS_PropsHave0 || _PackID == window.GOODS_CLASS_PropsHave1 
					|| _PackID == window.GOODS_CLASS_PropsTask || _PackID == window.GOODS_CLASS_PropaCard || 
					_PackID == window.GOODS_CLASS_PropaLCard || _PackID == window.GOODS_CLASS_LovParProps)
					{
						DelBub(m_Index_Equip);
					}
//					if (_PackID == window.GOODS_CLASS_PropsLvUp ||  _PackID == window.GOODS_CLASS_PropsGold)
//					{
//						ReSetBubSrc(m_Index_Equip,"使用");
//					}
//					if (_PackID == window.GOODS_CLASS_PropsGold || _PackID == window.GOODS_CLASS_PropsRMB || _PackID == window.GOODS_CLASS_PropsGoods)
//					{
//						ReSetBubSrc(m_Index_Equip,"使用");
//					}
						ReSetBubSrc(m_Index_Equip,"使用");
				}
				
				/*技能*/
				if (toint(_PackID) / window.GOODS_CLASS_BASE == window.GOODS_CLASS_Skill )
				{
					ReSetBubSrc(m_Index_Equip,"绑定");
					ReSetBubSrc(m_Index_TakeOff,"取消绑定");
				}

				if ( toint(_PackID) == window.GOODS_CLASS_DeadProps)
				{
					ReSetBubSrc(m_Index_CtinEquip,"购买");
					DelBub(m_Index_TakeOff);
					//DelBub(m_Index_Doff);
				}

				SetState(m_Index_TakeOff,0);

				if (_EquipPos == 1 && _EquipRID == window.GetMyRID())//装备物品不能丢弃
				{
					SetState(m_Index_TakeOff,1);
					SetState(m_Index_Equip,0);
					SetState(m_Index_Doff,0);
				}

				//技能单独处理
				if (_EquipPos == 1 && (toint(_PackID) / window.GOODS_CLASS_BASE == window.GOODS_CLASS_Skill) )
				{
					SetState(m_Index_TakeOff,1);
					SetState(m_Index_Equip,0);
					SetState(m_Index_Doff,0);
				}

				//点击了装备
				void On_Equip(data)
				{
					window.OnClick_PackGoods(_GID);
				}

				//点击了丢弃
				void On_Doff(data)
				{
					window.find("PACK_LOGIC")._VPack_Logic.m_Class_DeadProps.unlastselect();
					//发出卖出物品的消息
					//参数：物品唯一id(-1)，物品识别id,装备位置(0卸下 1装上),角色唯一id,角色索引
					window.g_Pack_SellItem = ""+_GID+","+_EnterID+",1";//alert("gid="+_GID+" enterID="+_EnterID);
					window.find("UIController").LoadDLG(23);//确定要销毁此物品吗？
				}
				//点击了取消装备
				void On_TakeOff(data)
				{
					window.OnClick_PackGoods(_GID);
				}
				//点击续费 重新购买
				void On_CtinEquip(data)
				{
					//var _Param = ""+_EnterID+",1,0";
					//window.Too_BuyItem(_Param);
//					window.GameCtndeaditems(_EnterID);
					window.find("PACK_LOGIC")._VPack_Logic.m_Class_DeadProps.DeadProps();
				}
			}
		}
	}
	void OnLBDClick()
	{
		window.OnClick_PackGoods(m_GID);
	}

	void OnSelect(){OnMySelect(); parent.parent.m_Class_DeadProps.setlastselect(m_EnterID);}
	void OnUnSelect(){OnMyUnSelect();parent.parent.m_Class_DeadProps.unlastselect(m_EnterID);}
	void OnDataExchange(iRow,szData)
	{
		m_GID = szData;
		m_EnterID = parent.fieldstr(iRow,window.M_G_GOODS_PLAYERITEMS_CID);//物品识别id
		m_PackID = parent.fieldstr(iRow,window.M_G_GOODS_PLAYERITEMS_PACKID);//背包id
		m_EquipRID = parent.fieldstr(iRow,window.M_G_GOODS_PLAYERITEMS_EQUIP);//已装备的RID
		m_EquipPos = parent.fieldstr(iRow,window.M_G_GOODS_PLAYERITEMS_EQUIPPOS);//装备位置 0卸下 1装上 
		var _Num = parent.fieldstr(iRow,window.M_G_GOODS_PLAYERITEMS_NUM);
		//var _lv = parent.fieldstr(iRow,window.M_G_GOODS_PLAYERITEMS_QUALITY);// 物品等级(这个字段没有通不过来, 所以不用这个)
		var _lv = GetItemLevel(m_EnterID);
		
		s_GID.SetUseState(false);					//使用中
		s_GID.SetIconEx(m_GID,_lv,_Num);
		s_GID.SetOprtIndex(window.ICON_OPRT_EQUIP);//悬停
		if (m_EquipPos == 1 && m_EquipRID == window.GetMyRID())
		{
			s_GID.SetOprtIndex(window.ICON_OPRT_CANCEL_EQUIP);	//悬停
			s_GID.SetUseState(true);					//使用中
		}

		//技能单独处理
		if (m_EquipPos == 1 && (toint(m_PackID) / window.GOODS_CLASS_BASE == window.GOODS_CLASS_Skill) )
		{
			s_GID.SetOprtIndex(window.ICON_OPRT_CANCEL_EQUIP);	//悬停
			s_GID.SetUseState(true);					//使用中
		}

		var _bind = parent.fieldstr(iRow,window.M_G_GOODS_PLAYERITEMS_BIND);
		if (toint(_bind) < 0)
		{
			m_IsChange = 1;

			//参数：物品唯一id
			//var _param = ""+m_GID;
			//window.Too_GetAwardChangeInfo(_param);
			//s_GID.SetData(1,m_GID);//已装备-悬停用
		}

		m_SubClass = window.GetSubClassByEnterId(m_EnterID);
	}
	// 通过ID 得到物品的等级
	void GetItemLevel(enterID)
	{
		window.g_Row.InitByInt(window.M_G_GOODS,window.ITEMS,window.M_G_GOODS_ITEMS_ENTRY,enterID);
		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			if (window.g_DEBUG)
			{
				printf("B# error-GetItemSexByID:DBname:"+window.M_G_GOODS+",TBName:"+window.ITEMS+",enterid:"+enterID);
			}
			return window.DB_ERR;
		}
		var _level = ""+window.g_Row.GetData(window.M_G_GOODS_ITEMS_QUALITY);
		window.g_Row.Release();
		return _level;
	}
};

//
//总的类：List
//
class VPack_DBList_Logic VN2ListCtrl
{
	//需要显示时改变
	size="700,380";pos(0,70);//simpleshowmode="1,10";
	//
	selecttype="1";colfilter="0";
	alpha = 70;bgcolor = "#FF00";
	
	inclass("VPack_DBList_UI"); //界面显示类

	columclass="0,VColumn_Pack_Logic"; //识别id

	//[功能]为了选中某一个子对象
	void SelectSubObjBy()
	{
		checkselect(10,10);
	}
};