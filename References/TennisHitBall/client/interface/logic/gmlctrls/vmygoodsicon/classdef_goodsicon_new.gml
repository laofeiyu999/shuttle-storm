//
//物品的图标类定义
//yxf	2008年11月11日
//

importex("$./ClassDef_HangWnd.gml");

/*操作序号枚举
	-1	无操作
	0	点击试穿
	1	双击装备物品
	2	双击取消装备
	3	双击绑定
	4	双击接收礼品
	5	双击购买
	6	双击赠送
	7	双击取消绑定
*/

//物品和技能图标
//类型 0 商场+热销+训练提示+训练结算+购买框+赠送框+索要框+创建角色
class VGoodsIconNew_Logic item
{
	size = "100,100";bgcolor = "#FFFF";

	var m_GoodsID = -1;						//物品EntryID(其他)/背包GID(背包)/礼品盒GID(礼品盒)
	var m_OptIndex = window.ICON_OPRT_NULL;	//操作索引 见文件头
	var m_HangType = window.ICON_DEFAUIT;	//悬停类型 0默认(热销+训练) 1背包 2礼品盒 3商城
	var m_IsOpen = false;	//是否打开了
	var m_HasHangWnd = true;		//是否有悬停框

	//显示相关-----------------------------------------------------
	void Init()
	{
		//物品图标
		//参数1 物品ID
		staticvar s_Icon = new VMyText{}

		//物品等级
		//参数1 等级
		staticvar s_Lv = new VMyText{pos = "0,20";}

		// 物品等级边框
		// 参数1 等级
		staticvar s_lvFrm = new img {size = "99%,99%";}

		//物品数量
		//参数1 数量
		staticvar s_Num = new VMyText{pos = "0,40";}
	}
	//-------------------------------------------------------------
	inclass("VGoodsIconNew_UI");
	Init();
	
	//[外部接口]设置图片大小的函数(数量要一起移动)
	//参数：1.w
	//		2.h
	void SetMySizeEx(w,h)
	{
		SetMySizeUI(w,h);
	}

	//[外部接口]设置图标的数据
	//参数：1.物品ID 
	//		2.物品等级 [可选]
	//		3.物品数量 [可选]
	void SetIconEx(goodsid,lv,num)
	{
		m_GoodsID = goodsid;
		var _entryid = 0;
		switch (m_HangType)
		{
		case 0:_entryid = m_GoodsID;break;
		case 1:_entryid = window.GetPackEntryIDByGID(m_GoodsID);break;
		case 2:_entryid = window.GetGiftEntryIDByGID(m_GoodsID);break;
		case 3:_entryid = m_GoodsID;break;
		}

		//CallBack
		parent.CallBack_EntryID(_entryid);
		var _classKind = window.GetClassByEnterId(_entryid);
		// 段晓彤, 增加了技能的等级显示问题
		if(toint(_classKind)/window.GOODS_CLASS_BASE == window.GOODS_CLASS_Skill)
		{
			s_Icon.SetData(_entryid, lv);
			s_Lv.SetData(lv);
			s_Num.SetData(num);
//			// 设置"物品等级边框"
//			if (lv > 0)
//			{
//				s_lvFrm.SetSrc(lv);
//			}
		}
		else
		{
			s_Icon.SetData(_entryid);
			s_Lv.show = false;
			s_Num.SetData(num);
		}
		

		SetMySizeEx(width,height);
	}
	
	//[外部接口]设置悬停类型
	//参数 1.id 类型 {ICON_DEFAUIT=0,ICON_PACK,ICON_GIFT,ICON_MALL}
	void SetHangType(type)
	{
		m_HangType = type;
	}

	//[外部接口]设置悬停操作序号
	//参数 index:{	ICON_OPRT_NULL=-1,ICON_OPRT_TRY,ICON_OPRT_EQUIP,ICON_OPRT_CANCEL_EQUIP,
	//				ICON_OPRT_BIND,ICON_OPRT_RECIVE,ICON_OPRT_BUY,ICON_OPRT_GIFT,
	//				ICON_OPRT_CANCEL_BIND}
	void SetOprtIndex(index)
	{
		m_OptIndex = index;
	}
	
	//[外部接口]设置背景隐藏
	//参数 true false
	void SetBGHide(param)
	{
		s_BK.show = param;
	}

	//[外部接口]打开鼠标滑过效果
	//参数：true false
	void SetMouseOverOpen(_open)
	{
		SetMouseOverOpenUI(_open);
	}
	
	//[外部接口]设置选中效果
	//参数：true false
	void SetSelect(select)
	{
		SetSelectUI(select);
	}

	//[外部接口]设置是否有悬停框
	//参数：true false
	void SetHasHangWnd(param)
	{
		m_HasHangWnd = param;
	}

	void OnClick()
	{
		window.PlaySound(129);//点击物品图标时的声音
	}

	//延迟悬停
	void CallByMouseMsg()
	{
		//发出获得商城时间的消息：NULL
		window.Too_GetShopTime();
		
		m_IsOpen = true;
		set window.find("TOPLAYER")
		{
			new VGoodHangWnd_Logic{}
		}
		switch (m_HangType)
		{
			window.g_HangType = m_HangType;
			case 0://0默认(热销+训练)
			{
				window.find("TOPLAYER").find("VGoodHangWnd_Logic").SetGoodsData_0(m_GoodsID,m_OptIndex);
				break;
			}
			case 1://1背包
			{
				window.find("TOPLAYER").find("VGoodHangWnd_Logic").SetGoodsData_1(m_GoodsID,m_OptIndex);
				break;
			}
			case 2://2礼品盒
			{
				window.find("TOPLAYER").find("VGoodHangWnd_Logic").SetGoodsData_2(m_GoodsID,m_OptIndex);
				break;
			}
			case 3://商城
			{
				window.find("TOPLAYER").find("VGoodHangWnd_Logic").SetGoodsData_3(m_GoodsID,m_OptIndex);
				break;
			}
		}
	}
	//鼠标悬停-New
	void OnMouseOver()
	{
		if (!m_HasHangWnd) return;
		if (m_GoodsID <= 0) return;
		timer(200,"CallByMouseMsg","CallByMouseMsg_Name");
	}
	//鼠标悬停-Del
	void OnMouseOut()
	{
		killtimer("CallByMouseMsg_Name").del();
		if (m_IsOpen)
		{
			window.find("TOPLAYER").find("VGoodHangWnd_Logic").del();
		}
	}
};