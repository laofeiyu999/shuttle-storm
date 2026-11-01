//背包类定义 - 服装
//yxf 2009年11月1日

importex("$./../../UI/Pack/ClassDef_Clothing.gml");

class VPack_Clothing_Logic item
{
	size = "70%,65%";pos(0,50);bgcolor = "#FF";alpha = 50;
	var m_ClothingIndex		= -1;	//服装 全部-1 上装0 裙/裤1 手套2 袜3 鞋4 球拍5 
	//=============================与界面交互========================================
	void Init()
	{	
		//全部：Radio
		staticvar s_R_ClothingAll = new VMyRadio
		{
			Init("全部");size = "50,30";pos = "60,30";
		}
		//上装：Radio
		staticvar s_R_Jacket = new VMyRadio
		{
			Init("上装");size = "50,30";pos = "120,30";
		}
		//裙/裤：Radio
		staticvar s_R_Trouser = new VMyRadio
		{
			Init("裙/裤");size = "50,30";pos = "180,30";
		}
		//手套：Radio
		staticvar s_R_Glove = new VMyRadio
		{
			Init("手套");size = "50,30";pos = "240,30";
		}
		//袜:Radio
		staticvar s_R_Socks = new VMyRadio
		{
			Init("袜");size = "50,30";pos = "300,30";
		}
		//鞋:Radio
		staticvar s_R_Shoes = new VMyRadio
		{
			Init("鞋");size = "50,30";pos = "360,30";
		}
	}
	inclass("VPack_Clothing_UI");//界面显示类
	//==============================function=========================================
	//切换选项卡
	//类型 全部-1 上装0 裙/裤1 手套2 袜3 鞋4 球拍5 
	void ChangeType(type)
	{
		m_ClothingIndex = type;
		parent.OnMySelect(m_ClothingIndex);
	}
	
	//设置响应事件
	void SetEvent()
	{
		//
		set s_R_ClothingAll
		{
			groupname="VPack_Clothing_Group";startstate="1";
			void OnCheck(){if (GetChecked()){return;}MouseCheck();parent.ChangeType(-1);}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_R_Jacket
		{
			groupname="VPack_Clothing_Group";
			void OnCheck(){if (GetChecked()){return;}MouseCheck();parent.ChangeType(0);}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_R_Trouser
		{
			groupname="VPack_Clothing_Group";
			void OnCheck(){if (GetChecked()){return;}MouseCheck();parent.ChangeType(1);}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_R_Glove
		{
			groupname="VPack_Clothing_Group";
			void OnCheck(){if (GetChecked()){return;}MouseCheck();parent.ChangeType(2);}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_R_Socks
		{
			groupname="VPack_Clothing_Group";
			void OnCheck(){if (GetChecked()){return;}MouseCheck();parent.ChangeType(3);}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_R_Shoes
		{
			groupname="VPack_Clothing_Group";
			void OnCheck(){if (GetChecked()){return;}MouseCheck();parent.ChangeType(4);}
			void OnUnCheck(){MouseUnCheck();}
		}
	}

	void OnCreated()
	{
		Init();
		SetEvent();
	}
};