//创建家族 界面
//夏洋洋 2010-3-2

importex("$./../../../UI/Family/pop/ClassDef_CreateFamily.gml");
importex("$./ClassDef_Badge.gml");

class VCreateFamily_Logic item
{
	var m_MoneyType = 1;	//货币类型 1,金币;2,点券;3,Pk点
	var m_FocusPos = 0;	//焦点位置：1为家族名称，2为家族口号
	//==================================================
	void Init()
	{
		//确定创建
		staticvar s_Btn_Create = new VBTN_A_New{}
		//取消
		staticvar s_Btn_Cancle = new VBTN_A_New{}
		//家族名称 图
		staticvar s_Img_FamilyName = new img{}
		// 家族名称:edit 背景
		staticvar s_EditBk_FamilyName = new VPic9_EditBK_UI{}
		//家族名称:edit
		staticvar s_Edit_FamilyName = new BaseEdit{}
		//名称检测 按钮
		staticvar s_Btn_NameCheck = new VBTN_58_New{}
		//名称检测结果
		staticvar s_NameCheckResult = new item
		{
			var s_Img_CheckResult = new img
			{}
			var s_Text_CheckResult = new BaseText
			{}
		}
		//家族口号 图
		staticvar s_Img_FamilySlogan = new img
		{}
		// 家族口号:edit 背景
		staticvar s_EditBk_FamilySlogan = new VPic9_EditBK_UI
		{}
		//家族口号:edit
		staticvar s_Edit_FamilySlogan = new BaseEdit
		{}
		//徽章设计 图
		staticvar s_Text_DesignBadge = new img
		{}
		//徽章设计效果图
		staticvar s_BadgeDesignResult = new item
		{}
		//选择徽章外框图形 字
		staticvar s_Text_BadgeOutTip = new BaseText
		{}
		//选择徽章外框图形
		staticvar s_PageCtrl_Out = new VPageCtrl_ChangeFamilyBadge_UI
		{}
		//选择徽章中心图形 字
		staticvar s_Text_BadgeInTip = new BaseText
		{}
		//选择徽章中心图形
		staticvar s_PageCtrl_In = new VPageCtrl_ChangeFamilyBadge_UI
		{}
	}
	inclass("VCreateFamily_UI");
	Init();
	//==============================
	
	void SetFamilyNameHot()
	{
		timer(10,"s_Edit_FamilyName.hot=1");m_FocusPos = 1;
	}
	void SetFamilySloganHot()
	{
		timer(10,"s_Edit_FamilySlogan.hot=1");m_FocusPos = 2;
	}

	void ChangeHot()
	{
		switch(m_FocusPos)
		{
			case 0:{SetFamilyNameHot();break;}
			case 1:{SetFamilySloganHot();break;}
			case 2:{SetFamilyNameHot();break;}
		}
	}

	//[功能]创建家族
	//[参数]无
	//[返回值]无
	void OnClick_CreateFamily()
	{
		window.Tos_CreateFamily(""+window.GetMyUID()+","+s_Edit_FamilyName.GetEditContent()+","+s_Edit_FamilySlogan.GetSloganContent()+","+s_BadgeDesignResult.GetBadgeInfo());
	}

	//[功能]名称检测 检测家族是否可用
	//[参数]无
	//[返回值]无
	void checkFamilyName()
	{
		s_NameCheckResult.show = true;
		var _editContent = s_Edit_FamilyName.GetEditContent();
		if(_editContent == "")
		{
			s_NameCheckResult.showEditContentNullInfo();
			return;
		}
		if(window.JudgeAnyNameLicit(_editContent,"家族名称")<0)
		{
			s_NameCheckResult.showResult(false);
		}
		else
		{
			window.F_Family_checkname(_editContent);
		}
	}

	//[功能]检测家族名称长度
	//[参数]无
	//[返回值]返回长度是否正确
	void checkFamilyNameLong()
	{
		var _editContent = s_Edit_FamilyName.GetEditContent();
		if(_editContent.Count < 6)
		{
			window.find("UIController").LoadDLG(671);
			return false;
		}
		return true;
	}


	void SetEvent()
	{
		set s_Btn_Close
		{
			void OnPressed()
			{
				parent.parent.del();
			}
		}
		set s_Btn_Create
		{
			void OnPressed()
			{
				var _checkResult1 = window.JudgeAnyNameLicit(parent.s_Edit_FamilyName.GetEditContent(),"家族名称");
				var _checkResult2 = window.JudgeAnyNameLicit(parent.s_Edit_FamilySlogan.GetSloganContent(),"家族签名");
				if(_checkResult1 == 1 && _checkResult2 == 1)
				{
					if(parent.checkFamilyNameLong())
					{
						parent.OnClick_CreateFamily();
					}
				}
			}
		}
		set s_Btn_Cancle
		{
			void OnPressed(){parent.parent.del();}
		}
		set s_Btn_NameCheck
		{
			void OnPressed()
			{
				if (parent.checkFamilyNameLong())
				{
					parent.checkFamilyName();
				}
				else
				{
					parent.s_NameCheckResult.show = false;
				}
			}
		}
		set s_PageCtrl_Out
		{
			targetname = "VCreateFamily_BadgeOutList_Logic_Name";
			countperpage = 5;
			window.find("G_DBMANAGE").GetRegDbTable(this,"Bind_VCreateFamily_BadgeOutList_Logic");// 获得已绑定的数据表
		}
		set s_PageCtrl_In
		{
			targetname = "VCreateFamily_BadgeInList_Logic_Name";
			countperpage = 5;
			window.find("G_DBMANAGE").GetRegDbTable(this,"Bind_VCreateFamily_BadgeInList_Logic");// 获得已绑定的数据表
		}
	}

	//[功能]保存内外框信息
	//[参数]data1：内外框标志；data2：徽章等级；data3：图片索引
	//[返回值]无
	void SaveBadgeInfo(data1,data2,data3)
	{
		s_BadgeDesignResult.DesignBadge(data1,data2,data3);
	}

	//====================DBList=========================================
	//徽章外框图的数据
	var m_BadgeOutList = new VCreateFamily_BadgeList_Logic
	{
		SetPos("42,210");
		SetSize("250,50");
		name = "VCreateFamily_BadgeOutList_Logic_Name";
		window.find("G_DBMANAGE").RegDbTable(this,window.TENNIS_GAME,window.FAMILYBADGEINFO,"Bind_VCreateFamily_BadgeOutList_Logic");// 绑定数据表
		
		var _selectParam = "SELECT * FROM FamilyBadgeInfo WHERE BadgeFlag=1 AND BadgeLevel=1";
		window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VCreateFamily_BadgeOutList_Logic",window.TENNIS_GAME,_selectParam);
		checkselect(30,30);
		void OnDelete()
		{
			window.find("G_DBMANAGE").ReMoveRegDbTable(this);//移除绑定
		}
	}
	//徽章内框图的数据
	var m_BadgeInList = new VCreateFamily_BadgeList_Logic
	{
		SetPos("42,280");
		SetSize("250,50");
		name = "VCreateFamily_BadgeInList_Logic_Name";
		window.find("G_DBMANAGE").RegDbTable(this,window.TENNIS_GAME,window.FAMILYBADGEINFO,"Bind_VCreateFamily_BadgeInList_Logic");// 绑定数据表

		var _selectParam = "SELECT * FROM FamilyBadgeInfo WHERE BadgeFlag=2 AND BadgeLevel=1";
		window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VCreateFamily_BadgeInList_Logic",window.TENNIS_GAME,_selectParam);
		checkselect(30,30);
		void OnDelete()
		{
			window.find("G_DBMANAGE").ReMoveRegDbTable(this);//移除绑定
		}
	}

	void OnCreated()
	{
		
		SetEvent();
	}
}