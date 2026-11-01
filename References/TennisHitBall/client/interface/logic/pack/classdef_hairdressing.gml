//背包类定义 - 美容
//yxf 2009年11月1日

importex("$./../../UI/Pack/ClassDef_Hairdressing.gml");

class VPack_Hairdressing_Logic item
{
	size = "70%,65%";pos(0,50);bgcolor = "#FF";alpha = 50;
	var m_HairdressingIndex	= -1;	//美容 全部-1 头发0 五官1  
	//=============================与界面交互========================================
	void Init()
	{	
		/*美容*/
		//美容-全部：Radio
		staticvar s_R_HairdressingAll = new VMyRadio
		{
			Init("全部");size = "50,30";pos = "60,30";
		}

		//头发：Radio
		staticvar s_R_Hair = new VMyRadio
		{
			Init("头发");size = "50,30";pos = "120,30";
		}
		//五官：Radio
		staticvar s_R_Facial = new VMyRadio
		{
			Init("五官");size = "50,30";pos = "180,30";
		}
	}
	inclass("VPack_Hairdressing_UI");//界面显示类
	//==============================function=========================================
	//切换选项卡
	//美容 全部-1 头发0 五官1  
	void ChangeType(type)
	{
		m_HairdressingIndex = type;
		parent.OnMySelect(m_HairdressingIndex);
	}

	//设置响应事件
	void SetEvent()
	{
		//
		set s_R_HairdressingAll
		{
			groupname="VPack_Hairdressing_Group";startstate="1";
			void OnCheck(){if (GetChecked()){return;}MouseCheck();parent.ChangeType(-1);}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_R_Hair
		{
			groupname="VPack_Hairdressing_Group";
			void OnCheck(){if (GetChecked()){return;}MouseCheck();parent.ChangeType(0);}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_R_Facial
		{
			groupname="VPack_Hairdressing_Group";
			void OnCheck(){if (GetChecked()){return;}MouseCheck();parent.ChangeType(1);}
			void OnUnCheck(){MouseUnCheck();}
		}
	}
	
	void OnCreated()
	{
		Init();
		SetEvent();
	}
};