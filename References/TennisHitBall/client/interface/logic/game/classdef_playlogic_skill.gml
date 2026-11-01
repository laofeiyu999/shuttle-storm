//游戏中快捷栏类定义（技能+道具）
//作者：吴楠
//yxf 2009年4月20日修改


importex("$./ClassDef_PlayLogic_Skill_Buy.gml");
importex("$./../../UI/Game/ClassDef_PlayUI_Skill.gml");

//单个快捷栏图标基类，不产生对象
class VShortBarIcon_Logic item
{
	size = "53,53";bgcolor = "#FF00";
	var m_ItemEnterID = 0;		//图标的EntryID
	var m_CanUse = true;		//是否能用 true能用 false不能用
 	var _isFirst = true;		//是否为第一次设置数据
	var m_SkillNum = 0;			//物品是数量
	var m_SkillState = 0;		//图标的状态(0灰,1亮)
	
	var m_OptIndex = window.ICON_OPRT_FAST_BUY;	//操作索引 见文件头

	//=========================与显示交互===========================
	void Init()
	{
		//技能
		staticvar s_Skill_Icon = new text
		{
			size = "47,47";pos(3,3);
			//技能名，data2:技能ID,data3:状态(0灰,1亮)
			void SetData(data1,data2,data3)
			{
				parent.m_SkillState = data3;
				parent.m_ItemEnterID = data2;
				src=data2;
				if(parent._isFirst)
				{
					parent.s_SkillNum.SetData(data2);
					parent._isFirst=false;
				}
			}
		}
		//技能个数
		staticvar s_SkillNum = new text
		{
			size(30,16);pos(23,17);
			void SetData(data)
			{
				src=window.GetItemNumByEnterID(data);
			}
		}
		//是否使用
		staticvar s_PowerUse = new text
		{
			size(53,53);
			void SetData(param)
			{
				src=param;
			}
		}
	}
	inclass("VShortBarIcon_UI");
	//=====================================================
	Init();

	//快速购买弹出界面
	void fastBuy()
	{
		if (m_ItemEnterID <= 0) return;

		if(toint(m_ItemEnterID)!=toint(window.find("POPLAYER").find("Skill_Buy_Logic_NAME")._ID))
		{
			window.find("POPLAYER").find("Skill_Buy_Logic_NAME").OnShow();
		}
		window.find("POPLAYER").find("Skill_Buy_Logic_NAME").SetSkillID(m_ItemEnterID);
		//printf("B# 快捷栏-快速购买弹出界面-PowerID:"+m_ItemEnterID);
		if(toint(m_ItemEnterID)>0 && parent.m_CanOpen == true)
		{
			parent.m_CanOpen = false;
			set window.find("POPLAYER")
			{
				new VRole_Skill_Buy_Logic{}
			}
			window.find("POPLAYER").find("Skill_Buy_Logic_NAME").SetSkillID(m_ItemEnterID);
			window.find("POPLAYER").find("Skill_Buy_Logic_NAME").OnShow();
		}
	}
};

//技能图标
//modify by chenjihui
class VSkillIcon_Logic VShortBarIcon_Logic
{
	//参数：技能是否可用
	void OnClick_PropCall()
	{
		var _iconname = window.GetIconNameByEnterID(m_ItemEnterID);
		var _iconLv = window.GetIconLvByEnterID(m_ItemEnterID);
		var _skillkind = m_ItemEnterID.__Long__/100;
		s_Skill_Icon.ChangeStateGrey(m_ItemEnterID,_skillkind);		//技能按键字变灰
		s_Skill_Icon._Skill.src="$./../../UI/PublicImage/GoodsIcon/"+_iconname+"_0.tga";
		if(m_SkillNum>0 && parent.PowerReturn())
		{
			s_Skill_Icon.SetData("能量球开",m_ItemEnterID,0);
//			s_Skill_Icon._Skill.src="$./../../UI/PublicImage/Skill/"+_iconname+_iconLv+".tga";
		}
		if(m_SkillState && m_SkillNum>0)
		{
			s_Skill_Icon._Skill.src="$./../../UI/PublicImage/GoodsIcon/"+_iconname+_iconLv+".tga";
		}
	}
	set s_Skill_Icon
	{
		void OnClick()
		{
			parent.fastBuy();
		}
	}
};

//道具图标
class VPropIcon_Logic VShortBarIcon_Logic
{
	m_OptIndex = window.ICON_OPRT_BUY_SKILL;	//操作索引 见文件头
	
	//是否使用能量球
	void isPowerUse()
	{
		if(m_CanUse)
		{
			s_PowerUse.SetData(true);
		}
		else
		{
			s_PowerUse.SetData(false);
		}
	}
	set s_Skill_Icon
	{
		void OnClick()
		{
			if (parent.m_SkillNum == 0)
			{
				parent.fastBuy();
			}
			else
			{
				parent.isPowerUse();
			}

			parent.parent.s_Skill1.OnClick_PropCall();
			parent.parent.s_Skill2.OnClick_PropCall();
			parent.parent.s_Skill3.OnClick_PropCall();
			parent.parent.s_Skill4.OnClick_PropCall();
			parent.parent.s_Skill5.OnClick_PropCall();
		}
	}
};