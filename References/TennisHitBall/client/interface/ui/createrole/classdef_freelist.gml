//创建角色的免费使用的物品list
//@刘高辰
//08年8月28日

//一行显示类：图标
class VColumn_CreateRole_FreeUse_UI item
{
	size = "100%,100%";bgcolor = -1;cursor = window.CURSOR_ARROW;

	void Init()
	{
		//物品识别ID
		//参数 ID: 行动名称
		//参数 Name：物品的名称
		staticvar s_GID = new VIconMgr_Logic
		{
			SetNameHide(false);
			//SetMouseOverOpen(false);
			SetHasHangWnd(false);
		}
	}

	void OnMySelect()
	{
//		s_GID.SetSelect(true);
		//s_GID.SetMouseOverOpen(false);
	}		
	void OnMyUnSelect()
	{
//		s_GID.SetSelect(false);
		//s_GID.SetMouseOverOpen(true);
	}	
};

////排版器，可自定义
//class VCreateRolet_TypeSet_UI VN2LCTypesetter
//{
//	autochgrow="112";
//};

//总的类：List
//
class VCreateRole_FreeList_UI item
{
	//需要显示时改变
	size = "119,147";bgcolor = -1;alpha = 50;
	//valign(63,0);halign(76,0);//
//	typesetter ="VCreateRolet_TypeSet_UI";
};

class VCreateRole_FreeList_UI_1 VCreateRole_FreeList_UI
{
	pos = "48,296";alpha =  0;bgcolor = -1;
};
class VCreateRole_FreeList_UI_2 VCreateRole_FreeList_UI
{
	pos = "193,296";alpha =  0;bgcolor = -1;
};
class VCreateRole_FreeList_UI_3 VCreateRole_FreeList_UI
{
	pos = "336,296";alpha =  0;bgcolor = -1;
};
class VCreateRole_FreeList_UI_4 VCreateRole_FreeList_UI
{
	pos = "479,296";alpha =  0;bgcolor = -1;
};
