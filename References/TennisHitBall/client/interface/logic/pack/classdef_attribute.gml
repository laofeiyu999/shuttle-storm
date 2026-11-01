//背包类定义 - 属性
//yxf 2008年9月16日9:24

importex("$./../../UI/Pack/ClassDef_Attribute.gml");

class VPack_Attribute_Logic item
{
	size = "70%,65%";pos(0,50);bgcolor = "#FF";alpha = 50;
	var m_AttributeIndex	= -1;	//属性 全部-1 力量0,技巧1,前场2,后场3,发球4,能量5,体力6
	//=============================与界面交互========================================
	void Init()
	{	
		/*属性*/
		//全部
		staticvar s_R_AttributeAll = new VMyRadio
		{
			Init("全部");size = "50,30";pos = "60,30";
		}
		//力量
		staticvar s_R_Strength = new VMyRadio
		{
			Init("力量");size = "50,30";pos = "120,30";
		}
		//技术
		staticvar s_R_Skill = new VMyRadio
		{
			Init("技术");size = "50,30";pos = "180,30";
		}
		//前场
		staticvar s_R_ForceHand = new VMyRadio
		{
			Init("前场");size = "50,30";pos = "240,30";
		}
		//后场
		staticvar s_R_BackHand = new VMyRadio
		{
			Init("后场");size = "50,30";pos = "300,30";
		}
		//发球
		staticvar s_R_TServe = new VMyRadio
		{
			Init("发球");size = "50,30";pos = "360,30";
		}
		//能量
		staticvar s_R_Energy = new VMyRadio
		{
			Init("能量");size = "50,30";pos = "420,30";
		}
		//体力
		staticvar s_R_Thew = new VMyRadio
		{
			Init("体力");size = "50,30";pos = "480,30";
		}
	}
	inclass("VPack_Attribute_UI");//界面显示类
	//==============================function=========================================
	//切换选项卡
	//属性 全部-1 力量0,技巧1,前场2,后场3,发球4,能量5,体力6
	void ChangeType(type)
	{
		m_AttributeIndex = type;
		parent.OnMySelect(m_AttributeIndex);
	}
	
	//设置响应事件
	void SetEvent()
	{
		//
		set s_R_AttributeAll
		{
			groupname="VPack_Attribute_Group";startstate="1";
			void OnCheck(){if (GetChecked()){return;}MouseCheck();parent.ChangeType(-1);}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_R_Strength
		{
			groupname="VPack_Attribute_Group";
			void OnCheck(){if (GetChecked()){return;}MouseCheck();parent.ChangeType(0);}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_R_Skill
		{
			groupname="VPack_Attribute_Group";
			void OnCheck(){if (GetChecked()){return;}MouseCheck();parent.ChangeType(1);}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_R_ForceHand
		{
			groupname="VPack_Attribute_Group";
			void OnCheck(){if (GetChecked()){return;}MouseCheck();parent.ChangeType(2);}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_R_BackHand
		{
			groupname="VPack_Attribute_Group";
			void OnCheck(){if (GetChecked()){return;}MouseCheck();parent.ChangeType(3);}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_R_TServe
		{
			groupname="VPack_Attribute_Group";
			void OnCheck(){if (GetChecked()){return;}MouseCheck();parent.ChangeType(4);}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_R_Energy
		{
			groupname="VPack_Attribute_Group";
			void OnCheck(){if (GetChecked()){return;}MouseCheck();parent.ChangeType(5);}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_R_Thew
		{
			groupname="VPack_Attribute_Group";
			void OnCheck(){if (GetChecked()){return;}MouseCheck();parent.ChangeType(6);}
			void OnUnCheck(){MouseUnCheck();}
		}
	}

	void OnCreated()
	{
		Init();
		SetEvent();
	}
};