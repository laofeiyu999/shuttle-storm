//家族类定义 - 逻辑
//yxf 2009年9月10日15:42

//家族界面
//夏洋洋 2010-3-2

importex("$./../../UI/Family/ClassDef.gml");
importex("$./ClassDef_MemberList.gml");
importex("$./ClassDef_MyFamily.gml");
importex("$./ClassDef_FamilyList.gml");

class VFamily_Logic item
{
	size = "70%,65%";pos(0,50);bgcolor = "#FF";alpha = 50;
	//====================逻辑中使用的变量=======================
	var m_TypeIndex = 0;	//标签索引 1我的家族，2家族列表
	//=============================与界面交互========================================
	void Init()
	{	
		//关闭：按钮
		staticvar s_Btn_Close = new VMyButton
		{
			pos = "680,0";Init("X");size = "30,30";
		}	
		//帮助：按钮
		staticvar s_Btn_Help = new VMyButton
		{
			pos(640,0);Init("？");size = "30,30";
		}

		//我的家族
//		staticvar s_R_MyFamily = new VMyButton
//		{
//			InitText("我的家族");
//		}
		
		//家族列表
//		staticvar s_R_FamilyList = new VMyButton
//		{
//			InitText("家族列表");
//		}

//		//家族设置：按钮
//		staticvar s_Btn_Set = new VMyButton
//		{
//			Init("家族设置");
//		}
//		//邀请成员：按钮
//		staticvar s_Btn_Invite = new VMyButton
//		{
//			Init("邀请成员");pos(100,0);
//		}
//		//家族列表：按钮
//		staticvar s_Btn_FamilyList = new VMyButton
//		{
//			Init("家族列表");pos(200,0);
//		}
//		//详细信息：按钮
//		staticvar s_Btn_Info = new VMyButton
//		{
//			Init("详细信息");pos(300,0);
//		}
//		//退出家族：按钮
//		staticvar s_Btn_Exit = new VMyButton
//		{
//			Init("退出家族");pos(400,0);
//		}
//
//		//复选框：基本信息
//		staticvar s_CHK_BaseInfo = new VMyCheckBox
//		{
//			Init(">");size = "50,30";pos(650,250);
//		}
//
//		//家族公告
//		staticvar s_TXT_Affiche = new VMyText
//		{
//			src = "家族公告 2009年9月10日";pos(0,50);size = "300,260";bgcolor = "#FFFFFF";
//		}
//		//家族口号
//		staticvar s_TXT_Slogan = new VMyText
//		{
//			src = "口号是大家都有钱";pos(0,310);size = "300,50";bgcolor = "#FFFFF";
//		}
//
//		/*我的信息*/
//		//职位
//		staticvar s_TXT_Post = new VMyText
//		{
//			src = "职位";pos = "0,370";
//		}
//		//贡献度
//		staticvar s_TXT_Offer = new VMyText
//		{
//			src = "贡献度：100";pos = "0,400";
//		}
//		//贡献度排位
//		staticvar s_TXT_OfferTop = new VMyText
//		{
//			src = "贡献度排位：100";pos = "0,430";
//		}
//		
//		/*成员列表*/
//		staticvar s_TXT_Member = new VMyText
//		{
//			src = "成员(10/20)";pos = "400,50";
//		}
//		//成员列表:翻页
//		staticvar s_PageCtrl = new VMyPageCtrl
//		{
//			valign(100,0);halign(80,0);
//		}
	}
	inclass("VFamily_UI");//界面显示类
	//==============================function=========================================
	//点击了关闭
	void OnClick_BtnClose()
	{
		parent.del();
	}
	//生成一些成员变量
	void NewSubObj()
	{
		//我的家族
		staticvar m_MyFamily = new VMyFamily_Logic{}
//		//家族列表
//		staticvar m_FamilyList = new VFamilyList_Logic{}
	}
	//刷新家族内容
	void FamilyContentFlash()
	{
		m_MyFamily.FamilyContentFlash();
//		m_FamilyList.FamilyListFlash();
	}
	//隐藏标签中的内容
	void InitShow()
	{
		m_MyFamily.show = false;
//		m_FamilyList.show = false;
	}
	//切换选项卡
	//参数 type：标签索引 1我的家族，2家族列表(目前不用, 注释掉了)
	void ChangeType(type)
	{
		m_TypeIndex = type;
		InitShow();
		switch (type)
		{
			case 1:
			{
				m_MyFamily.show = true;
				m_MyFamily.FamilyContentFlash();
				break;
			}
//			case 2:
//			{
//				m_FamilyList.show = true;
//				m_FamilyList.FamilyListFlash();
//				break;
//			}
		}
		
	}
	//设置响应事件
	void SetEvent()
	{
		set s_Btn_Close
		{
			void OnPressed(){parent.OnClick_BtnClose();}
		}
		set s_Btn_Help
		{
			void OnPressed(){window.CallBack_Help(window.POS_FAMILY);}
		}

//		set s_R_MyFamily
//		{
//			groupname = "VFamily_Group";
//			startstate = "1";
//			void OnCheck()
//			{
//				if (GetChecked()){return;}
//				MouseCheck();
//				parent.ChangeType(1);
//			}
//			void OnUnCheck(){MouseUnCheck();}
//		}

//		set s_R_FamilyList
//		{
//			groupname = "VFamily_Group";
//			void OnCheck()
//			{
//				if (GetChecked()){return;}
//				MouseCheck();
//				parent.ChangeType(2);
//				window.F_Family_Getallteam();
//			}
//			void OnUnCheck(){MouseUnCheck();}
//		}

//		set s_Btn_Set//家族设置：按钮
//		{
//			void OnPressed()
//			{
//			}
//		}
//		set s_Btn_Invite//邀请成员：按钮
//		{
//			void OnPressed()
//			{
//			}
//		}
//		set s_Btn_FamilyList//家族列表：按钮
//		{
//			void OnPressed()
//			{
//			}
//		}
//		set s_Btn_Info//详细信息：按钮
//		{
//			void OnPressed()
//			{
//			}
//		}
//		set s_Btn_Exit//退出家族：按钮
//		{
//			void OnPressed()
//			{
//			}
//		}
//		set s_CHK_BaseInfo//复选框：基本信息
//		{
//			startstate = 1;
//			void OnCheck()
//			{
//				MouseCheck();
//			}
//			void OnUnCheck()
//			{
//				MouseUnCheck();
//			}
//		}
//		set s_PageCtrl//成员列表:翻页
//		{
//			targetname="VFamily_MemberList_Logic_NAME";
//			countperpage = 9;
//			window.find("G_DBMANAGE").GetRegDbTable(this,"Bind_VFamily_MemberList_Logic");// 获得已绑定的数据表
//		}
	}
	//================================DBList=========================================
//	var _MemberList = new VFamily_MemberList_Logic
//	{
//		name = "VFamily_MemberList_Logic_NAME";
//	
//		window.find("G_DBMANAGE").RegDbTable(this,window.M_G_SERVER,window.DESKDT,"Bind_VFamily_MemberList_Logic");// 绑定数据表
//
//		void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);} //移除绑定
//		
//		var _SQL = "Select * From deskdt";
//		window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VFamily_MemberList_Logic",window.M_G_SERVER,_SQL);
//
//		void PageviewEnd() // 翻页结束后调用
//		{
//		}
//	}

	void OnCreated()
	{
		Init();
		NewSubObj();
		SetEvent();
	}
};