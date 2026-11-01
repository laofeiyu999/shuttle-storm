//
//商城：购物-技能类定义
//yxf 2008年9月16日15:59
//

importex("$./../../UI/Mall/ClassDef_Shopping_Skill.gml");

class VMall_Shopping_Skill_Logic item
{
	size = "100%,100%";pos = "5,0";alpha = 60;enableUpdate(1);
	var m_CurrClassID = 0;
	//=============================与界面交互========================================
	void Init()
	{
		//上旋:Radio
		staticvar s_R_Skill1 = new VMyRadio
		{
			Init("上旋",1);pos = "0,60";
		}
		//削球:Radio
		staticvar s_R_Skill2 = new VMyRadio
		{
			Init("削球",1);pos = "50,60";
		}
		//扣杀:Radio
		staticvar s_R_Skill3 = new VMyRadio
		{
			Init("扣杀",1);pos = "100,60";
		}
		//放高球:Radio
		staticvar s_R_Skill4 = new VMyRadio
		{
			Init("放高球",1);pos = "150,60";
		}
		//发球:Radio
		staticvar s_R_Skill5 = new VMyRadio
		{
			Init("发球",1);pos = "200,60";
		}
	}
	inclass("VMall_Shopping_Skill_UI");//界面显示类
	//==============================function=========================================
	//设置响应事件
	void SetEvent()
	{
		set s_R_Skill1//上旋
		{
			groupname="VMall_Shopping_Skill_Group";
			startstate="1";
			var m_ClassID = 400;
			void OnCheck()
			{
				if (GetChecked()){return;}MouseCheck();
				parent.m_CurrClassID = m_ClassID;parent.ChangeType();
			}
			void OnUnCheck(){MouseUnCheck()}
		}
		set s_R_Skill2//削球
		{
			groupname="VMall_Shopping_Skill_Group";
			var m_ClassID = 401;
			void OnCheck()
			{
				if (GetChecked()){return;}MouseCheck();
				parent.m_CurrClassID = m_ClassID;parent.ChangeType();
			}
			void OnUnCheck(){MouseUnCheck()}
		}
		set s_R_Skill3//扣杀
		{
			groupname="VMall_Shopping_Skill_Group";
			var m_ClassID = 402;
			void OnCheck()
			{
				if (GetChecked()){return;}MouseCheck();
				parent.m_CurrClassID = m_ClassID;parent.ChangeType();
			}
			void OnUnCheck(){MouseUnCheck()}
		}
		set s_R_Skill4//放高球
		{
			groupname="VMall_Shopping_Skill_Group";
			var m_ClassID = 403;
			void OnCheck()
			{
				if (GetChecked()){return;}MouseCheck();
				parent.m_CurrClassID = m_ClassID;parent.ChangeType();
			}
			void OnUnCheck(){MouseUnCheck()}
		}
		set s_R_Skill5//发球
		{
			groupname="VMall_Shopping_Skill_Group";
			var m_ClassID = 404;
			void OnCheck()
			{
				if (GetChecked()){return;}MouseCheck();
				parent.m_CurrClassID = m_ClassID;parent.ChangeType();
			}
			void OnUnCheck(){MouseUnCheck()}
		}
	}

	void ClearCheck()
	{
		s_R_Skill1.OnUnCheck();
//		s_R_Skill2.OnUnCheck();
//		s_R_Skill3.OnUnCheck();
//		s_R_Skill4.OnUnCheck();
//		s_R_Skill5.OnUnCheck();
	}

	//add by chenjihui
	//param:400上旋，401削球，402扣杀，403放高球，404发球
	void SetLabelCheck(_type)
	{
		ClearCheck();
		switch (toint(_type))
		{
		case 400:
			s_R_Skill1.OnCheck();
			break;
		case 401:
			s_R_Skill2.OnCheck();
			break;
		case 402:
			s_R_Skill3.OnCheck();
			break;
		case 403:
			s_R_Skill4.OnCheck();
			break;
		case 404:
			s_R_Skill5.OnCheck();
			break;
		}
	}
	void NewSubObj(){}
	void ChangeType(){parent.RefrestSelect();}
	void GetClassID(){return m_CurrClassID;}

	void OnCreated()
	{
		Init();
		NewSubObj();
		SetEvent();
	}
};