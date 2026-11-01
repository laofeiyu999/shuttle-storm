//
//商城：购物-技能类定义
//yxf 2008年9月16日15:59
//

importex("$./../../UI/Mall/ClassDef_Shopping_Attribute.gml");

class VMall_Shopping_Attribute_Logic item
{
	size = "100%,100%";pos = "5,0";alpha = 60;enableUpdate(1);
	var m_CurrClassID = 0;
	//=============================与界面交互========================================
	void Init()
	{
		//力量:Radio
		staticvar s_R_Attribute1 = new VMyRadio
		{
			Init("力量",1);pos = "0,60";
		}
		//技巧:Radio
		staticvar s_R_Attribute2 = new VMyRadio
		{
			Init("技巧",1);pos = "50,60";
		}
		//前场:Radio
		staticvar s_R_Attribute3 = new VMyRadio
		{
			Init("前场",1);pos = "100,60";
		}
		//后场:Radio
		staticvar s_R_Attribute4 = new VMyRadio
		{
			Init("后场",1);pos = "150,60";
		}
		//发球:Radio
		staticvar s_R_Attribute5 = new VMyRadio
		{
			Init("发球",1);pos = "200,60";
		}
		//能量:Radio
		staticvar s_R_Attribute6 = new VMyRadio
		{
			Init("能量",1);pos = "250,60";
		}
		//体力:Radio
		staticvar s_R_Attribute7 = new VMyRadio
		{
			Init("体力",1);pos = "300,60";
		}
	}
	inclass("VMall_Shopping_Attribute_UI");//界面显示类
	//==============================function=========================================
	//设置响应事件
	void SetEvent()
	{
		set s_R_Attribute1//力量
		{
			groupname="VMall_Shopping_Attribute_Group";
			startstate="1";
			var m_ClassID = 600;
			void OnCheck()
			{
				if (GetChecked()){return;}MouseCheck();
				parent.m_CurrClassID = m_ClassID;parent.ChangeType();
			}
			void OnUnCheck(){MouseUnCheck()}
		}
		set s_R_Attribute2//技巧
		{
			groupname="VMall_Shopping_Attribute_Group";
			var m_ClassID = 601;
			void OnCheck()
			{
				if (GetChecked()){return;}MouseCheck();
				parent.m_CurrClassID = m_ClassID;parent.ChangeType();
			}
			void OnUnCheck(){MouseUnCheck()}
		}
		set s_R_Attribute3//前场
		{
			groupname="VMall_Shopping_Attribute_Group";
			var m_ClassID = 602;
			void OnCheck()
			{
				if (GetChecked()){return;}MouseCheck();
				parent.m_CurrClassID = m_ClassID;parent.ChangeType();
			}
			void OnUnCheck(){MouseUnCheck()}
		}
		set s_R_Attribute4//后场
		{
			groupname="VMall_Shopping_Attribute_Group";
			var m_ClassID = 603;
			void OnCheck()
			{
				if (GetChecked()){return;}MouseCheck();
				parent.m_CurrClassID = m_ClassID;parent.ChangeType();
			}
			void OnUnCheck(){MouseUnCheck()}
		}
		set s_R_Attribute5//发球
		{
			groupname="VMall_Shopping_Attribute_Group";
			var m_ClassID = 604;
			void OnCheck()
			{
				if (GetChecked()){return;}MouseCheck();
				parent.m_CurrClassID = m_ClassID;parent.ChangeType();
			}
			void OnUnCheck(){MouseUnCheck()}
		}
		set s_R_Attribute6//能量
		{
			groupname="VMall_Shopping_Attribute_Group";
			var m_ClassID = 605;
			void OnCheck()
			{
				if (GetChecked()){return;}MouseCheck();
				parent.m_CurrClassID = m_ClassID;parent.ChangeType();
			}
			void OnUnCheck(){MouseUnCheck()}
		}
		set s_R_Attribute7//体力
		{
			groupname="VMall_Shopping_Attribute_Group";
			var m_ClassID = 606;
			void OnCheck()
			{
				if (GetChecked()){return;}MouseCheck();
				parent.m_CurrClassID = m_ClassID;parent.ChangeType();
			}
			void OnUnCheck(){MouseUnCheck()}
		}
	}
	
	//清空选中状态
	void ClearCheck()
	{
		s_R_Attribute1.OnUnCheck();
//		s_R_Attribute2.OnUnCheck();
//		s_R_Attribute3.OnUnCheck();
//		s_R_Attribute4.OnUnCheck();
//		s_R_Attribute5.OnUnCheck();
//		s_R_Attribute6.OnUnCheck();
//		s_R_Attribute7.OnUnCheck();
	}

	//add by chenjihui
	//param:600力量，601技巧，602前场，603后场，604发球，605能量，606体力
	void SetLabelCheck(_type)
	{
		ClearCheck();
		switch (toint(_type))
		{
		case 600:
			s_R_Attribute1.OnCheck();
			break;
		case 601:
			s_R_Attribute2.OnCheck();
			break;
		case 602:
			s_R_Attribute3.OnCheck();
			break;
		case 603:
			s_R_Attribute4.OnCheck();
			break;
		case 604:
			s_R_Attribute5.OnCheck();
			break;
		case 605:
			s_R_Attribute6.OnCheck();
			break;
		case 606:
			s_R_Attribute7.OnCheck();
			break;
		}
	}

	void NewSubObj(){}
	void ChangeType(){parent.RefrestSelect();}	// 专门为"热销"设立的接口
	void GetClassID(){return m_CurrClassID;}

	void OnCreated()
	{
		Init();
		NewSubObj();
		SetEvent();
	}
};