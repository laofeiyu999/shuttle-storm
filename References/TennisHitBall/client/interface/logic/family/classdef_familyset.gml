//
//

importex("$./../../UI/Family/ClassDef_FamilySet.gml");

class VFamilySet_Logic item
{
	var s_NewFamuilyBadgeInfo = 0;	//最新的徽章数据
	var s_ApplyForFamilyCheck_Result = 0;	//加入家族是否需要验证
	var _clickSaveFlag = 0;		//点击了保存的标志：0为未点击，1为点击
	//========================================
	void Init()
	{
		//家族名称
		staticvar s_Img_FamilyName = new img
		{}
		staticvar s_EditBk_FamilyName = new VPic9_EditBK_UI
		{}
		staticvar s_Edit_FamilyName = new BaseEdit
		{}
		staticvar s_Mask_FamilyName = new item
		{}
		//家族签名
		staticvar s_Img_FamilySlogan = new img
		{}
		staticvar s_EditBk_FamilySlogan = new VPic9_EditBK_UI
		{}
		staticvar s_Edit_FamilySlogan = new BaseEdit
		{}
		//家族公告
		staticvar s_Img_FamilyAffiche = new img
		{}
		staticvar s_EditBk_FamilyAffiche = new VPic9_EditBK_UI
		{}
		staticvar s_Edit_FamilyAffiche = new BaseEdit
		{}
		//加入家族是否需要验证
		staticvar s_ApplyForFamilyCheck = new img
		{}
		staticvar s_R_checkChoice1 = new VRadio_Single_New_UI 
		{}
		staticvar s_Text_checkChoice1 = new BaseText
		{}
		staticvar s_checkChoice2 = new VRadio_Single_New_UI 
		{}
		staticvar s_Text_checkChoice1 = new BaseText
		{}
		staticvar s_Mask_checkChoice = new item
		{}
		//徽章设置
		staticvar s_Img_FamilyBadgeSet = new img
		{}
		staticvar s_Text_FamilyBadgeSet = new BaseText
		{}
		staticvar s_BadgeDesignResult = new item
		{}
		//悬停框
		staticvar s_hangConten = new VPic9_HandWnd_UI
		{}
		//保存设置
		staticvar s_SaveSet = new VBTN_A_New
		{}
	}
	inclass("VFamilySet_UI");
	//============================
	//[功能]设置徽章状态
	//[参数]无
	//[返回值]无
	void SetFamilyBadgeState()
	{
		var _iconSet = window.GetFamilyIconSet();
		if(_iconSet)
		{
			if(window.GetPeopleOnePopedomState(window.GetMyUID(),window.FAMILY_POPEDOM_MODIFYICON))
			{
				s_BadgeDesignResult.SetBadgeState(true);
			}
			else
			{
				s_BadgeDesignResult.SetBadgeState(false);
			}
		}
		else
		{
			s_BadgeDesignResult.SetBadgeState(false);
		}
	}

	//[功能]填充数据
	//[参数]无
	//[返回值]无
	void SetFamilySetContent()
	{
		s_Edit_FamilyName.src = ""+window.GetFamilyName();
		s_Edit_FamilySlogan.src=""+window.GetFamilySlogan();
		s_Edit_FamilyAffiche.src=""+window.GetFamilyAffiche();
		if(window.GetFamilyPotence() == window.FAMILY_POTENCE_HEADER)
		{
			s_ApplyForFamilyCheck.SetState(true);
			s_Img_FamilyBadgeSet.SetState(true);
			s_Mask_checkChoice.show = false;
		}
		else
		{
			s_ApplyForFamilyCheck.SetState(false);
			s_Img_FamilyBadgeSet.SetState(false);
			s_Mask_checkChoice.show = true;
		}
		if(window.GetApplyForFamily() == window.FAMILY_APPLYNEEDAGREE)
		{
			s_R_checkChoice1.UnCheck();
			s_checkChoice2.UnCheck();
			s_R_checkChoice1.Check();
		}
		else
		{
			s_R_checkChoice1.UnCheck();
			s_checkChoice2.UnCheck();
			s_checkChoice2.Check();
		}
		window.g_Row.InitByInt(window.GAMEUI,window.JIVECONSORTIAINI,window.GAMEUI_JIVECONSORTIAINI_ID,window.GetFamilyIDByName());
		if(!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			return window.DB_ERR;
		}
		var _BadgeData = window.g_Row.GetData(window.GAMEUI_JIVECONSORTIAINI_ICONID);
		window.g_Row.Release();
		SetBadgeDesignResult(_BadgeData);
	}

	//[功能]设置最新修改的徽章
	//[参数]data：徽章数据
	//[返回值]无
	void SetBadgeDesignResult(data)
	{
		s_NewFamuilyBadgeInfo = data;
		var _parserBadgeData = window.parserBadgeData(data);
		var _arrBadgeData = window.Splitstr2(_parserBadgeData,",",6);
		s_BadgeDesignResult.SetFamilyBadge(_arrBadgeData[0],_arrBadgeData[1],_arrBadgeData[2],_arrBadgeData[3],_arrBadgeData[4],_arrBadgeData[5]);
	}

	//[功能]保存修改后的设置
	//[参数]无
	//[返回值]无
	void On_SaveSet()
	{
		_clickSaveFlag = 1;
		ModifyCheck_1();
	}
	
	void ModifyCheck_1()
	{
		if(_clickSaveFlag != 1)
		{
			window.find("FAMILY_LOGIC")._VFamily_Logic.FamilyContentFlash();
			return;
		}
		if(s_Edit_FamilySlogan.GetFamilySlogan() !=  window.GetFamilySlogan())
		{
			var _checkResult = window.JudgeAnyNameLicit(s_Edit_FamilySlogan.GetFamilySlogan(),"家族签名");
			if(_checkResult == 1)
			{
				window.F_Family_Modifyslogan(s_Edit_FamilySlogan.GetFamilySlogan());
			}
			return;
		}
		if(s_Edit_FamilyAffiche.GetFamilyAffiche() != window.GetFamilyAffiche())
		{
			var _checkResult = window.JudgeAnyNameLicit(s_Edit_FamilyAffiche.GetFamilyAffiche(),"家族公告");
			if(_checkResult == 1)
			{
				window.F_Family_Modifycallboard(s_Edit_FamilyAffiche.GetFamilyAffiche());
			}
			return;
		}
		if(s_ApplyForFamilyCheck_Result != window.GetApplyForFamily())
		{
			window.F_Family_Modifyapply(s_ApplyForFamilyCheck_Result);
			return;
		}
		if(s_BadgeDesignResult.GetBadgeInfo() != window.GetFamilyBadgeData())
		{
			window.F_Family_Modifyicon(s_BadgeDesignResult.GetBadgeInfo());
			return;
		}
		_clickSaveFlag = 0;
	}
	void ModifyCheck_2()
	{
		if(_clickSaveFlag != 1)
		{
			window.find("FAMILY_LOGIC")._VFamily_Logic.FamilyContentFlash();
			return;
		}
		if(s_Edit_FamilyAffiche.GetFamilyAffiche() != window.GetFamilyAffiche())
		{
			var _checkResult = window.JudgeAnyNameLicit(s_Edit_FamilyAffiche.GetFamilyAffiche(),"家族公告");
			if(_checkResult == 1)
			{
				window.F_Family_Modifycallboard(s_Edit_FamilyAffiche.GetFamilyAffiche());
			}
			return;
		}
		if(s_ApplyForFamilyCheck_Result != window.GetApplyForFamily())
		{
			window.F_Family_Modifyapply(s_ApplyForFamilyCheck_Result);
			return;
		}
		if(s_BadgeDesignResult.GetBadgeInfo() != window.GetFamilyBadgeData())
		{
			window.F_Family_Modifyicon(s_BadgeDesignResult.GetBadgeInfo());
			return;
		}
		window.find("FAMILY_LOGIC")._VFamily_Logic.FamilyContentFlash();
		CheckFamilySet();
	}
	void ModifyCheck_3()
	{
		if(_clickSaveFlag != 1)
		{
			window.find("FAMILY_LOGIC")._VFamily_Logic.FamilyContentFlash();
			return;
		}
		if(s_ApplyForFamilyCheck_Result != window.GetApplyForFamily())
		{
			window.F_Family_Modifyapply(s_ApplyForFamilyCheck_Result);
			return;
		}
		if(s_BadgeDesignResult.GetBadgeInfo() != window.GetFamilyBadgeData())
		{
			window.F_Family_Modifyicon(s_BadgeDesignResult.GetBadgeInfo());
			return;
		}
		window.find("FAMILY_LOGIC")._VFamily_Logic.FamilyContentFlash();
		CheckFamilySet();
	}
	void ModifyCheck_4()
	{
		if(_clickSaveFlag != 1)
		{
			window.find("FAMILY_LOGIC")._VFamily_Logic.FamilyContentFlash();
			return;
		}
		if(s_BadgeDesignResult.GetBadgeInfo() != window.GetFamilyBadgeData())
		{
			window.F_Family_Modifyicon(s_BadgeDesignResult.GetBadgeInfo());
			return;
		}
		window.find("FAMILY_LOGIC")._VFamily_Logic.FamilyContentFlash();
		CheckFamilySet();
	}
	void ModifyCheck_5()
	{
		if(_clickSaveFlag != 1)
		{
			window.find("FAMILY_LOGIC")._VFamily_Logic.FamilyContentFlash();
			return;
		}
		window.find("FAMILY_LOGIC")._VFamily_Logic.FamilyContentFlash();
		CheckFamilySet();
	}

	//[功能]检测是否修改成功
	//[参数]无
	//[返回值]无
	void CheckFamilySet()
	{
		var i = 0;
		while(i<window.FAMILYSET_NUM)
		{
			var _log = window.FamilySetLog[i];
			if(_log == 1)
			{
				if(_clickSaveFlag == 1)
				{
					window.find("UIController").LoadDLG(663);
					//SetFamilySetContent();
					window.find("FAMILY_LOGIC")._VFamily_Logic.FamilyContentFlash();
				}
				break;
			}
			i+=1;
		}
		i = 0;
		while(i<window.FAMILYSET_NUM)
		{
			window.FamilySetLog[i] = 0;
			i += 1;
		}
		_clickSaveFlag = 0;
	}

	void SetEvent()
	{
		//徽章设置
		set s_BadgeDesignResult
		{
			void OnClick()
			{
				if(window.GetFamilyPotence() == window.FAMILY_POTENCE_HEADER)
				{
					var _iconSet = window.GetFamilyIconSet();
					if(_iconSet)
					{
						window.find("UIController").LoadUI("UI_FAMILYBADGESET");
					}
				}
			}
			void OnMouseOver()
			{
				var _iconSet = window.GetFamilyIconSet();
				if(_iconSet)
				{
					
					if(window.GetFamilyPotence() == window.FAMILY_POTENCE_HEADER)
					{
						var _familyHangWndTip = window.GetFamilyHangWndTip(49);
						parent.s_hangConten.SetData(""+_familyHangWndTip);
					}
					else
					{
						var _familyHangWndTip = window.GetFamilyHangWndTip(50);
						parent.s_hangConten.SetData(""+_familyHangWndTip);
					}
					
				}
				else
				{
					var _needFamilyLev = window.GetFamilyLev()+1;
					var _familyHangWndTip = window.GetFamilyHangWndTip(51);
					var _familyTip = window.ReplaceStr(_familyHangWndTip,""+_needFamilyLev);
					parent.s_hangConten.SetData(""+_familyTip);
				}
				parent.s_hangConten.show = true;
			}
			void OnMouseOut()
			{
				parent.s_hangConten.show = false;
			}
		}
		set s_R_checkChoice1
		{
			groupname = "ApplyForFamilyCheck_Choice";
			if(window.GetApplyForFamily() == window.FAMILY_APPLYNEEDAGREE)
			{
				startstate = 1;
			}
			void OnCheck()
			{
				MouseCheck();
				parent.s_ApplyForFamilyCheck_Result = window.FAMILY_APPLYNEEDAGREE;
			}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_checkChoice2
		{
			groupname = "ApplyForFamilyCheck_Choice";
			if(window.GetApplyForFamily() == window.FAMILY_APPLYNOTNEEDAGREE)
			{
				startstate = 1;
			}
			void OnCheck()
			{
				MouseCheck();
				parent.s_ApplyForFamilyCheck_Result = window.FAMILY_APPLYNOTNEEDAGREE;
			}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_SaveSet
		{
			void OnPressed()
			{
				parent.On_SaveSet();
			}
		}
	}

	void OnCreated()
	{
		Init();
		SetEvent();
		SetFamilySetContent();
	}
}

