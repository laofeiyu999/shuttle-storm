//
//创建角色的免费使用的物品list
//

importex("$./../../UI/CreateRole/ClassDef_FreeList.gml");

//一行显示类：图标
class VColumn_CreateRole_FreeUse_Logic item
{
	size = "100,100";
	var m_Class = 0;//物品的种类
	var m_GID = 0;	//物品的ID
	var m_DID = 0;	//物品的显示ID-Avatar
	//===========================与显示交互======================
	void Init()
	{
		//物品识别ID
		//参数 ID: 物品的ID
		//参数 Name：物品的名称
		staticvar s_GID = new VMyText{}
	}
	inclass("VColumn_CreateRole_FreeUse_UI"); //界面显示类
	Init();
	//需要被显示的类覆盖
	void OnMySelect(){bgcolor = "#FFEA99";alpha = 50;}	//选择的效果
	void OnMyUnSelect(){bgcolor = "-1";}				//不选择的效果
	//===========================================================
	void OnSelect()
	{
		OnMySelect();
		parent.parent.SetTryData(m_Class,m_DID);
	};
	void OnUnSelect()
	{
		OnMyUnSelect();
	};
	void OnDataExchange(iRow,szData)
	{
		m_GID = szData;
		var _Name = parent.fieldstr(iRow,window.M_G_GOODS_ITEMS_NAME);
		s_GID.SetIconEx(m_GID);
		m_DID = parent.fieldstr(iRow,window.M_G_GOODS_ITEMS_DISPLAY);
		m_Class = parent.fieldstr(iRow,window.M_G_GOODS_ITEMS_CLASS);	//Class
	}
};

//
//总的类：List
//
class VCreateRole_FreeList_Logic VN2ListCtrl
{
	//需要显示时改变
	size="100,100";simpleshowmode="1,1";
	selecttype="1";colfilter="0";
	columclass="0,VColumn_CreateRole_FreeUse_Logic"; //识别id
};

//头发
class VCreateRole_FreeList_Logic_1 VCreateRole_FreeList_Logic
{
	pos="13,314";alpha = 70;bgcolor = "#FF";
	inclass("VCreateRole_FreeList_UI_1"); //界面显示类
};
//容貌
class VCreateRole_FreeList_Logic_2 VCreateRole_FreeList_Logic
{
	pos="207,311";alpha = 70;bgcolor = "#FF00";
	inclass("VCreateRole_FreeList_UI_2"); //界面显示类
};
//上装
class VCreateRole_FreeList_Logic_3 VCreateRole_FreeList_Logic
{
	pos="389,312";alpha = 70;bgcolor = "#F0F0";
	inclass("VCreateRole_FreeList_UI_3"); //界面显示类
};
//裙裤
class VCreateRole_FreeList_Logic_4 VCreateRole_FreeList_Logic
{
	pos="554,313";alpha = 70;bgcolor = "#00FF";
	inclass("VCreateRole_FreeList_UI_4"); //界面显示类
};