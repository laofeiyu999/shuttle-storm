//背包类定义 - 饰品
//yxf 2009年11月1日

importex("$./../../UI/Pack/ClassDef_Jewelry.gml");

class VPack_Jewelry_Logic item
{
	size = "70%,65%";pos(0,50);bgcolor = "#FF";alpha = 50; 
	var m_JewelryIndex		= -1;	//饰品 全部-1 护腕/手链0 项链1 眼镜2 背饰3 附件4
	//=============================与界面交互========================================
	void Init()
	{	
		//全部：Radio
		staticvar s_R_JewelryAll = new VMyRadio
		{
			Init("全部");size = "50,30";pos = "60,30";
		}
		//护腕/手链：Radio
		staticvar s_R_Cuff = new VMyRadio
		{
			Init("护腕");size = "50,30";pos = "120,30";
		}
		//项链：Radio
		staticvar s_R_Necklace = new VMyRadio
		{
			Init("项链");size = "50,30";pos = "180,30";
		}
		//眼镜:Radio
		staticvar s_R_Glasses = new VMyRadio
		{
			Init("眼镜");size = "50,30";pos = "240,30";
		}
		//背饰:Radio
		staticvar s_R_Back = new VMyRadio
		{
			Init("背饰");size = "50,30";pos = "300,30";
		}
	}
	inclass("VPack_Jewelry_UI");//界面显示类
	//==============================function=========================================
	//切换选项卡
	//饰品 全部-1 护腕/手链0 项链1 眼镜2 背饰3 附件4
	void ChangeType(type)
	{
		m_JewelryIndex = type;
		parent.OnMySelect(m_JewelryIndex);
	}

	//设置响应事件
	void SetEvent()
	{
		//
		set s_R_JewelryAll
		{
			groupname="VPack_Jewelry_Group";startstate="1";
			void OnCheck(){if (GetChecked()){return;}MouseCheck();parent.ChangeType(-1);}
			void OnUnCheck(){MouseUnCheck();}
		}
//		set s_R_Cuff
//		{
//			groupname="VPack_Jewelry_Group";
//			void OnCheck(){if (GetChecked()){return;}MouseCheck();parent.ChangeType(0);}
//			void OnUnCheck(){MouseUnCheck();}
//		}
		set s_R_Necklace
		{
			groupname="VPack_Jewelry_Group";
			void OnCheck(){if (GetChecked()){return;}MouseCheck();parent.ChangeType(1);}
			void OnUnCheck(){MouseUnCheck();}
		}		
		set s_R_Glasses
		{
			groupname="VPack_Jewelry_Group";
			void OnCheck(){if (GetChecked()){return;}MouseCheck();parent.ChangeType(2);}
			void OnUnCheck(){MouseUnCheck();}
		}		
		set s_R_Back
		{
			groupname="VPack_Jewelry_Group";
			void OnCheck(){if (GetChecked()){return;}MouseCheck();parent.ChangeType(3);}
			void OnUnCheck(){MouseUnCheck();}
		}
	}

	void OnCreated()
	{
		Init();
		SetEvent();
	}
};