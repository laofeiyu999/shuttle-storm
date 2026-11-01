//背包类定义 - 技能
//yxf 2009年11月1日

importex("$./../../UI/Pack/ClassDef_Skill.gml");

class VPack_Skill_Logic item
{
	size = "70%,65%";pos(0,50);bgcolor = "#FF";alpha = 50;
	var m_SkillIndex		= -1;	//技能 全部-1 上旋0  削球1 扣杀2 放高球3 发球4
	//=============================与界面交互========================================
	void Init()
	{	
		/*技能*/
		//技能全部：Radio
		staticvar s_R_SkillAll = new VMyRadio
		{
			Init("全部");size = "50,30";pos = "60,30";
		}
		//上旋：Radio
		staticvar s_R_First_quarter = new VMyRadio
		{
			Init("上旋");size = "50,30";pos = "120,30";
		}
		//削球：Radio
		staticvar s_R_Chip = new VMyRadio
		{
			Init("削球");size = "50,30";pos = "180,30";
		}
		//扣杀:Radio
		staticvar s_R_Kill_shot = new VMyRadio
		{
			Init("扣杀");size = "50,30";pos = "240,30";
		}
		//放高球:Radio
		staticvar s_R_HighBall = new VMyRadio
		{
			Init("放高球");size = "50,30";pos = "300,30";
		}
		//发球:Radio
		staticvar s_R_Serve = new VMyRadio
		{
			Init("发球");size = "50,30";pos = "360,30";
		}
	}
	inclass("VPack_Skill_UI");//界面显示类
	//==============================function=========================================
	//切换选项卡
	//技能 全部-1 上旋0  削球1 扣杀2 放高球3 发球4
	void ChangeType(type)
	{
		m_SkillIndex = type;
		parent.OnMySelect(m_SkillIndex);
	}
	
	//设置响应事件
	void SetEvent()
	{
		//
		set s_R_SkillAll
		{
			groupname="VPack_Skill_Group";startstate="1";
			void OnCheck(){if (GetChecked()){return;}MouseCheck();parent.ChangeType(-1);}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_R_First_quarter
		{
			groupname="VPack_Skill_Group";
			void OnCheck(){if (GetChecked()){return;}MouseCheck();parent.ChangeType(0);}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_R_Chip
		{
			groupname="VPack_Skill_Group";
			void OnCheck(){if (GetChecked()){return;}MouseCheck();parent.ChangeType(1);}
			void OnUnCheck(){MouseUnCheck();}
		}		
		set s_R_Kill_shot
		{
			groupname="VPack_Skill_Group";
			void OnCheck(){if (GetChecked()){return;}MouseCheck();parent.ChangeType(2);}
			void OnUnCheck(){MouseUnCheck();}
		}		
		set s_R_HighBall
		{
			groupname="VPack_Skill_Group";
			void OnCheck(){if (GetChecked()){return;}MouseCheck();parent.ChangeType(3);}
			void OnUnCheck(){MouseUnCheck();}
		}		
		set s_R_Serve
		{
			groupname="VPack_Skill_Group";
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