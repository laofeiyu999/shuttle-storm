//我的家族界面
//夏洋洋 2010-3-2

importex("$./../../UI/Family/ClassDef_MyFamily.gml");
importex("$./ClassDef_FamilyHall.gml");
importex("$./ClassDef_FamilyInfo.gml");
importex("$./ClassDef_FamilySet.gml");
importex("$./ClassDef_FamilyApplyInfo.gml");

class VMyFamily_Logic item
{
	name = "VMyFamily_Logic";

	var m_TypeIndex = 1;	//标签索引 1家族大厅，2家族信息，3家族设置，4申请信息
	var m_isShowFamilyContent = 0;	//是否显示家族内容参数	0为不显示，1为显示
	//============================显示部分==================================
	void Init()
	{
//		//提示信息
//		staticvar s_Text_NoFamilyTip = new VMyText{};
//		//创建家族
//		staticvar s_Button_CreateFamily = new VMyButton{};

		staticvar s_HaveFamilyContent = new item
		{
			//退出家族
			staticvar s_Btn_OutFamily = new VBTN_A_New
			{}
			//家族大厅
			staticvar s_R_FamilyHall = new VMyRadio{pos="48,73";}
			
			//家族信息
			staticvar s_R_FamilyInfo = new VMyRadio{pos="143,73";}
			
			//家族设置
			staticvar s_R_FamilySet = new VMyRadio{pos="238,73"};
			
			//申请信息
			staticvar s_R_FamilyApplyInfo = new VMyRadio{pos = "335,73";};

			//家族比赛 字
			staticvar s_Img_FamilyCompete = new img
			{}
			//家族个人赛
			staticvar s_Btn_Family_Single = new VBTN_Family_Family_Single
			{}
			//家族双人赛
			staticvar s_Btn_Family_Double = new VBTN_Family_Family_other
			{}
			//家族对抗赛
			staticvar s_Btn_FamilyToFamily = new VBTN_Family_Family_other
			{}
			//俱乐部联赛
			staticvar s_Btn_Family_LeagueMatch = new VBTN_Family_Family_other
			{}
			//未知联赛
			staticvar s_Btn_Family_LeagueMatch = new VBTN_Family_Family_other
			{}
		}
		staticvar s_NoFamilyContent = new item
		{
			size = "100%,100%";
			//提示信息
			staticvar s_Text_NoFamilyTip = new VMyText{};
			//创建家族 按钮
			staticvar s_Button_CreateFamily = new VMyButton{}
			//加入家族 按钮
			staticvar s_Button_AddFamily = new VMyButton{};
		}
	}
	inclass("VMyFamily_UI");
	//==============================

	//生成一些成员变量
	void NewSubObj()
	{
		//家族大厅
		staticvar m_FamilyHall = new VFamilyHall_Logic{}
		//家族信息
		staticvar m_FamilyInfo = new VFamilyInfo_Logic{}
		//家族设置
		staticvar m_FamilySet = new VFamilySet_Logic{}
		//申请信息
		staticvar m_FamilyApplyInfo = new VFamilyApplyInfo_Logic{}
	}
	//隐藏标签中的内容
	void InitShow()
	{
		m_FamilyHall.show = false;
		m_FamilyInfo.show = false;
		m_FamilySet.show = false;
		m_FamilyApplyInfo.show = false;
	}
	//刷新标签中的内容
	void FlashSubObjContent()
	{
		m_FamilyHall.SetFamilyHallContent();
		m_FamilyInfo.SetFamilyInfo();
		m_FamilySet.SetFamilySetContent();
	}
	//设置标签状态
	void ChangeLabelState(_index)
	{
		s_HaveFamilyContent.s_R_FamilyHall.SetImgSrc(1);
		s_HaveFamilyContent.s_R_FamilyInfo.SetImgSrc(1);
		if(s_HaveFamilyContent.s_R_FamilySet.GetState() == window.BTN_STATE_LIGHT)
		{
			s_HaveFamilyContent.s_R_FamilySet.SetImgSrc(1);
		}
		if(s_HaveFamilyContent.s_R_FamilyApplyInfo.GetState() == window.BTN_STATE_LIGHT)
		{
			s_HaveFamilyContent.s_R_FamilyApplyInfo.SetImgSrc(1);
		}
		switch(_index)
		{
			case 1:
			{
				s_HaveFamilyContent.s_R_FamilyHall.SetImgSrc(3);
				break;
			}
			case 2:
			{
				s_HaveFamilyContent.s_R_FamilyInfo.SetImgSrc(3);
				break;
			}
			case 3:
			{
				if(s_HaveFamilyContent.s_R_FamilySet.GetState() == window.BTN_STATE_LIGHT)
				{
					s_HaveFamilyContent.s_R_FamilySet.SetImgSrc(3);
				}
				break;
			}
			case 4:
			{
				if(s_HaveFamilyContent.s_R_FamilyApplyInfo.GetState() == window.BTN_STATE_LIGHT)
				{
					s_HaveFamilyContent.s_R_FamilyApplyInfo.SetImgSrc(3);
				}
				break;
			}
		}
	}
	//切换选项卡
	//参数 type：标签索引 1家族大厅，2家族信息，3家族设置，4申请信息
	void ChangeType(type)
	{
		m_TypeIndex = type;
		InitShow();
		if(m_isShowFamilyContent == 1)
		{
			switch (type)
			{
				case 1:
				{
					m_FamilyHall.SetFamilyHallContent();
					m_FamilyHall.show = true;
					break;
				}
				case 2:
				{
					m_FamilyInfo.SetFamilyInfo();
					m_FamilyInfo.show = true;
					break;
				}
				case 3:
				{
					m_FamilySet.SetFamilyBadgeState();
					m_FamilySet.show = true;
					break;
				}
				case 4:
				{
					m_FamilyApplyInfo.s_ApplyInfoListContent.FlashContent();
					m_FamilyApplyInfo.show = true;
					break;
				}
			}
		}
		
		
	}

	//[功能]点击创建家族弹出创建家族界面
	//[参数]无
	//[返回值]无
	void OnClick_CreateFamily()
	{
		window.find("UIController").LoadUI("UI_CREATEFAMILY");
	}

	//[功能]退出家族
	//[参数]无
	//[返回值]无
	void OnClick_OutFamily()
	{
		if(window.GetFamilyPeopleNum() == 1)
		{
			window.find("UIController").LoadDLG(657);
			return;
		}
		var _potence = window.GetFamilyPotence();
		if(_potence == window.FAMILY_POTENCE_ASSISTANT)
		{
			window.find("UIController").LoadDLG(656);
		}
		else if(_potence == window.FAMILY_POTENCE_NORMAL)
		{
			window.find("UIController").LoadDLG(661);
		}
		else
		{
			window.F_Family_Leave();
		}
	}

	void SetEvent()
	{
		set s_NoFamilyContent.s_Button_CreateFamily
		{
			void OnPressed()
			{
				parent.parent.OnClick_CreateFamily();
			}
		}
		set s_NoFamilyContent.s_Button_AddFamily
		{
			name = "BtnName_Hall_Bottom_TopStar";
			window.SetHallBtnName(window.G_HALLBTN_TOPSTAR,this.name);
			void OnPressed()
			{
				window.g_SetFamily = 1;
				window.g_HallBtnMgr.SetHallOpenUIHideState(0);
				if (GetState() == window.BTN_STATE_GREY){return;}
				window.OnClick_BTN_TopStar();
				window.find("TOPSTAR_LOGIC")._VTopStar_Logic.Sets_R_Family();
			}
			
			
		}
		set s_HaveFamilyContent.s_Btn_OutFamily
		{
			void OnPressed()
			{
				parent.parent.OnClick_OutFamily();
			}
		}
		set s_HaveFamilyContent.s_R_FamilyHall
		{
			groupname = "MyFamily_Group";
			startstate = "1";
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();
				parent.parent.ChangeType(1);
			}
			void OnUnCheck(){MouseUnCheck();}

		}
		set s_HaveFamilyContent.s_R_FamilyInfo
		{
			groupname = "MyFamily_Group";
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();
				parent.parent.ChangeType(2);
			}
			void OnUnCheck(){MouseUnCheck();}

		}
		set s_HaveFamilyContent.s_R_FamilySet
		{
			groupname = "MyFamily_Group";
			void OnCheck()
			{
				if(GetState() == window.BTN_STATE_LIGHT)
				{
					if (GetChecked()){return;}
					MouseCheck();
					parent.parent.ChangeType(3);
				}
			}
			void OnUnCheck(){MouseUnCheck();}

		}
		set s_HaveFamilyContent.s_R_FamilyApplyInfo
		{
			groupname = "MyFamily_Group";
			void OnCheck()
			{
				if(GetState() == window.BTN_STATE_LIGHT)
				{
					if (GetChecked()){return;}
					MouseCheck();
					parent.parent.ChangeType(4);
					window.F_Family_Getallapply();
				}				
			}
			void OnUnCheck(){MouseUnCheck();}

		}
		set s_HaveFamilyContent.s_Btn_Family_Single
		{
			void OnPressed()
			{
				if(!window.JudgeIsNeedCancelQueue(window.CANCLERACE_FAMILYCOMPETE))
				{
					if (!window.g_FCM ==  1)
						window.find("UIController").LoadUI("UI_FAMILYCOMPETE_SINGLE");
					else
						window.find("UIController").LoadDLG(824);
				}
				
			}
		}
	}
	
	void SetBtnState()
	{
		var _potence = window.GetFamilyPotence();
		if(_potence ==window.FAMILY_POTENCE_HEADER || _potence ==window.FAMILY_POTENCE_ASSISTANT)
		{
			s_HaveFamilyContent.s_R_FamilySet.SetState(window.BTN_STATE_LIGHT);
			s_HaveFamilyContent.s_R_FamilyApplyInfo.SetState(window.BTN_STATE_LIGHT);
		}
		else
		{
			s_HaveFamilyContent.s_R_FamilySet.SetState(window.BTN_STATE_GREY);
			s_HaveFamilyContent.s_R_FamilyApplyInfo.SetState(window.BTN_STATE_GREY);
		}
	}

	//[功能]判断玩家是否有家族
	//[参数]无
	//[返回值]true：有家族；false：没有家族
	void haveFamily()
	{
		return window.haveFamilyState();
	}

	//[功能]根据玩家是否拥有家族来显示相应信息
	//[参数]type:true则显示家族部分；false则显示没有家族部分
	//[返回值]无
	void ShowContent(type)
	{
		if(type == true)
		{
			s_HaveFamilyContent.show = true;
			m_isShowFamilyContent = 1;
			s_NoFamilyContent.show = false;
			FlashSubObjContent();
			SetBtnState();
			ChangeType(m_TypeIndex);
			ChangeLabelState(m_TypeIndex);
		}
		else
		{
			s_HaveFamilyContent.show = false;
			InitShow();
			m_isShowFamilyContent = 0;
			s_NoFamilyContent.show = true;
		}
	}


	//[功能]显示界面中相应的内容
	//[参数]无
	//[返回值]无
	void showMyFamilyContent()
	{
		var isHaveFamily = haveFamily();
		ShowContent(isHaveFamily);
	}

	//[功能]刷新我的家族界面中的内容
	//[参数]无
	//[返回值]无
	void FamilyContentFlash()
	{
		showMyFamilyContent();
	}

	void OnCreated()
	{
		Init();
		NewSubObj();
		SetEvent();
		showMyFamilyContent();
	}
}