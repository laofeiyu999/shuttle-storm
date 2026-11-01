//徽章设置
//夏洋洋 2010-3-4

importex("$./../../../UI/Family/pop/ClassDef_FamilyBadgeSet.gml");
importex("$./ClassDef_Badge.gml");

class VFamilyBadgeSet_Logic item
{
	void Init()
	{
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
		//确定
		staticvar s_Btn_SetOk = new VBTN_A_New
		{}
	}
	inclass("VFamilyBadgeSet_UI");
	Init();
	
	//=====================================================================
	void SetEvent()
	{
		set s_Btn_Close
		{
			void OnPressed(){parent.parent.del();}
		}
		set s_Btn_SetOk
		{
			void OnPressed()
			{
				window.find("FAMILY_LOGIC")._VFamily_Logic.m_MyFamily.m_FamilySet.SetBadgeDesignResult(parent.s_BadgeDesignResult.GetBadgeInfo());
				window.find("FAMILYBADGESET_LOGIC").del();
			}
		}
		set s_PageCtrl_Out
		{
			targetname = "VFamilyBadgeSet_BadgeOutList_Logic_Name";
			countperpage = 5;
			window.find("G_DBMANAGE").GetRegDbTable(this,"Bind_VFamilyBadgeSet_BadgeOutList_Logic");// 获得已绑定的数据表
		}
		set s_PageCtrl_In
		{
			targetname = "VFamilyBadgeSet_BadgeInList_Logic_Name";
			countperpage = 5;
			window.find("G_DBMANAGE").GetRegDbTable(this,"Bind_VFamilyBadgeSet_BadgeInList_Logic");// 获得已绑定的数据表
		}
	}
	
	//[功能]保存内外框信息
	//[参数]data1：内外框标志；data2：徽章等级；data3：图片索引
	//[返回值]无
	void SaveBadgeInfo(data1,data2,data3)
	{
		s_BadgeDesignResult.DesignBadge(data1,data2,data3);
	}
	//================================DBList==================================
	//徽章外框图的数据
	var m_BadgeOutList = new VCreateFamily_BadgeList_Logic
	{
		SetPos("47,150");
		SetSize("250,50");//bgcolor ="#ff";
		name = "VFamilyBadgeSet_BadgeOutList_Logic_Name";
		window.find("G_DBMANAGE").RegDbTable(this,window.TENNIS_GAME,window.FAMILYBADGEINFO,"Bind_VFamilyBadgeSet_BadgeOutList_Logic");// 绑定数据表
		
		var _selectParam = "SELECT * FROM FamilyBadgeInfo WHERE BadgeFlag=1 AND BadgeLevel="+window.GetFamilyLev();
		window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VFamilyBadgeSet_BadgeOutList_Logic",window.TENNIS_GAME,_selectParam);
		checkselect(30,30);
		void OnDelete()
		{
			window.find("G_DBMANAGE").ReMoveRegDbTable(this);//移除绑定
		}
	}
	//徽章内框图的数据
	var m_BadgeInList = new VCreateFamily_BadgeList_Logic
	{
		SetPos("47,240");
		SetSize("250,50");
		name = "VFamilyBadgeSet_BadgeInList_Logic_Name";
		window.find("G_DBMANAGE").RegDbTable(this,window.TENNIS_GAME,window.FAMILYBADGEINFO,"Bind_VFamilyBadgeSet_BadgeInList_Logic");// 绑定数据表

		var _selectParam = "SELECT * FROM FamilyBadgeInfo WHERE BadgeFlag=2 AND BadgeLevel="+window.GetFamilyLev();
		window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VFamilyBadgeSet_BadgeInList_Logic",window.TENNIS_GAME,_selectParam);
		checkselect(30,30);
		void OnDelete()
		{
			window.find("G_DBMANAGE").ReMoveRegDbTable(this);//移除绑定
		}
	}
	//=====================================================================
	void OnCreated()
	{
		SetEvent();
	}
}