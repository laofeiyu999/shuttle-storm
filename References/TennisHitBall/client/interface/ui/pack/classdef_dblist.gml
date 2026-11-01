//
//背包：公共的list
//

//一行显示类：图标
class VColumn_Pack_UI item
{
	size = "119,147";//bgcolor = "#FF";alpha = 60;
	//===========================与显示交互======================
	void Init()
	{
		//物品识别ID
		//参数 ID: 物品的ID
		//参数 IsEquip:是否已装备 0未装备 1已装备
		//参数 GID: 物品的GID
		staticvar s_GID = new VIconMgr_Logic
		{
			SetHangType(window.ICON_PACK);
			SetMouseOverOpen(true);
			cursor = window.CURSOR_HAND;
		}
	}
	
	void OnMySelect()
	{
		s_GID.SetSelect(true);
		s_GID.SetMouseOverOpen(false);
	}		
	void OnMyUnSelect()
	{
		s_GID.SetSelect(false);
		s_GID.SetMouseOverOpen(true);
	}	
};

//排版器，可自定义
class VPack_TypeSet_UI VN2LCTypesetter
{
	autochgrow="595";
};

//
//总的类：List
//
class VPack_DBList_UI VN2ListCtrl
{
	//需要显示时改变
	size="595,295";pos(31,114);
	bgcolor=-1;
	alpha=-1;
	typesetter ="VPack_TypeSet_UI";
};