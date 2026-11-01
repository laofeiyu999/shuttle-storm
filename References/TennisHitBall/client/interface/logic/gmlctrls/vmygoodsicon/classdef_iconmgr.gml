//
//物品的图标管理类定义
//yxf	2009年10月25日
//

importex("$./ClassDef_GoodsIcon_New.gml");


//物品和技能图标
//类型 0 商场+热销+训练提示+训练结算+购买框+赠送框+索要框+创建角色
class VIconMgr_Logic item
{
	size = "100,100";bgcolor = "#FF";

	//显示相关-----------------------------------------------------
	void Init()
	{
		//物品名称
		//参数1 
		staticvar s_Name = new VMyText{}

		//图标类(含物品图标+数量+等级)
		//参数1 物品ID
		//参数2 数量
		//参数3 等级
		staticvar s_GoodsIcon = new VGoodsIconNew_Logic{}

		//使用状态
		staticvar s_State = new VMyText
		{
			src = "使用中";valign(100,0);show = false;
			void SetData(data1){show = data1;}
		}
	}
	//-------------------------------------------------------------
	inclass("VIconMgr_UI");
	Init();

	//VGoodsIconNew_Logic系列接口=======================================================
	
	//VGoodsIconNew_Logic ClallBack
	//[功能]将解析好的物品ID返回来
	//[参数]entryid:物品ID
	void CallBack_EntryID(entryid)
	{
		var _itemName = window.GetNameByEnterID(entryid);
		if(toint(_itemName) != -1)
		{
			s_Name.SetData(_itemName,"","");
		}
	}
	//[外部接口]设置图标的数据
	//参数：1.物品ID 
	//		2.物品等级 [可选]
	//		3.物品数量 [可选]
	void SetIconEx(goodsid,lv,num)
	{
		if(toint(goodsid) != -1)
		{
			s_GoodsIcon.SetIconEx(goodsid,lv,num);
		}
	}

	//[外部接口]设置任务图标的数据 夏洋洋添加于2009-12-12
	void SetTaskIconEx(goodsid,lv,num)
	{
		if(toint(goodsid) != -1)
		{
			s_GoodsIcon.show=true;
			SetNameHide(true);
			s_GoodsIcon.SetIconEx(goodsid,lv,num);
		}
		else
		{
			s_GoodsIcon.show=false;
			SetNameHide(false);
		}
	}

	//iframe使用
	var _frame_id = 0;
	var _frame_lvl = 0;
	void FrameSetId(_id)
	{
		_frame_id = _id;
	}
	void FrameSetLvl(_lvl)
	{
		_frame_lvl = _lvl;
	}
	void FrameSetNum(_num)
	{
		SetIconEx(_frame_id,_frame_lvl,_num);
	}

	//[外部接口]设置图片大小的函数(数量要一起移动)
	//参数：1.w
	//		2.h
	void SetMySizeEx(w,h)
	{
		s_GoodsIcon.SetMySizeEx(w,h);
	}
	
	//[外部接口]设置悬停类型
	//参数 1.id 类型 {ICON_DEFAUIT=0,ICON_PACK,ICON_GIFT}
	void SetHangType(type)
	{
		s_GoodsIcon.SetHangType(type);
	}

	//[外部接口]设置悬停操作序号
	//参数 index:{	ICON_OPRT_NULL=-1,ICON_OPRT_TRY,ICON_OPRT_EQUIP,ICON_OPRT_CANCEL_EQUIP,
	//				ICON_OPRT_BIND,ICON_OPRT_RECIVE,ICON_OPRT_BUY,ICON_OPRT_GIFT,
	//				ICON_OPRT_CANCEL_BIND}
	void SetOprtIndex(index)
	{
		s_GoodsIcon.SetOprtIndex(index);
	}
	//VGoodsIconNew_Logic系列接口 - End=======================================================

	//[外部接口]设置图标的使用状态
	//参数：true false
	void SetUseState(state)
	{
		s_State.SetData(state);
	}
	
	//[外部接口]设置选中效果
	//参数：true false
	void SetSelect(select)
	{
		SetSelectUI(select);
	}

	//[外部接口]打开鼠标滑过效果
	//参数：true false
	void SetMouseOverOpen(_open)
	{
		SetMouseOverOpenUI(_open);
	}
	
	//[外部接口]隐藏物品名称
	//参数：true false
	void SetNameHide(param)
	{
		s_Name.show = param;
	}

	//[外部接口]设置是否有悬停框
	//参数：true false
	void SetHasHangWnd(param)
	{
		s_GoodsIcon.SetHasHangWnd(param);
	}

	//
	s_GoodsIcon.SetBGHide(false);
};