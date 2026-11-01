//游戏中技能道具快捷栏整合类
//吴楠

importex("$./ClassDef_PlayLogic_Skill.gml");

//游戏中快捷栏物品图标-总类
class VShortBarIcon_All_Logic item
{
	name="VShortBarIcon_All_Logic_NAME";size(500,80);
	
	var m_CanOpen = true;		//能否打开 true能 false不能
	
	// add by chenjihui
	//2011-3-5
	var s_Skill1Key = new img
	{
		pos = "5,0";
		size = "38,14";
		var m_isEnergy = -1;
		var m_skillNum = -1;

		void SetState(enterId,state)
		{
			if (enterId.__Long__ <= 1)
			{
				return;
			}
			m_skillNum = window.GetItemNumByEnterID(enterId.__Long__);
			if (state == 0 || m_skillNum.__Long__ <= 0)
				src = "$./../../UI/Game/imgs/l_j.tga";
			else
				src = "$./../../UI/Game/imgs/lj.tga";
		}
	}
	var s_Skill2Key = new img
	{
		size = "45,15";
		pos = "60,0";
		var m_isEnergy = -1;
		var m_skillNum = -1;

		void SetState(enterId,state)
		{
			if (enterId.__Long__ <= 1)
			{
				return;
			}
			m_skillNum = window.GetItemNumByEnterID(enterId.__Long__);
			if (state == 0 || m_skillNum.__Long__ <= 0)
				src = "$./../../UI/Game/imgs/l_s_k.tga";
			else
				src = "$./../../UI/Game/imgs/lsk.tga";
		}
	}
	var s_Skill3Key = new img
	{
		size = "38,14";
		pos = "118,0";
		var m_isEnergy = -1;
		var m_skillNum = -1;

		void SetState(enterId,state)
		{
			if (enterId.__Long__ <= 1)
			{
				return;
			}
			m_skillNum = window.GetItemNumByEnterID(enterId.__Long__);
			if (state == 0 || m_skillNum.__Long__ <= 0)
				src = "$./../../UI/Game/imgs/l_k.tga";
			else
				src = "$./../../UI/Game/imgs/lk.tga";
		}
	}
	var s_Skill4Key = new img
	{
		size = "50,20";
		pos = "167,-2";
		var m_isEnergy = -1;
		var m_skillNum = -1;

		void SetState(enterId,state)
		{
			if (enterId.__Long__ <= 1)
			{
				return;
			}
			m_skillNum = window.GetItemNumByEnterID(enterId.__Long__);
			if (state == 0 || m_skillNum.__Long__ <= 0)
				src = "$./../../UI/Game/imgs/l_jk.tga";
			else
				src = "$./../../UI/Game/imgs/ljk.tga";
		}
	}
	var s_Skill5Key = new img
	{
		size = "50,20";
		pos = "223,-2";
		var m_isEnergy = 0;
		var m_skillNum = -1;

		void SetState(enterId,state)
		{
			if (enterId.__Long__ <= 1)
			{
				return;
			}
			m_skillNum = window.GetItemNumByEnterID(enterId.__Long__);//alert("enterId="+enterId+",state="+state+"num="+m_skillNum);
			if (state == 0 || m_skillNum.__Long__ <= 0)
				src = "$./../../UI/Game/imgs/l_jk.tga";
			else
				src = "$./../../UI/Game/imgs/ljk.tga";
		}
	}
	var s_Skill1 = new VSkillIcon_Logic{pos = "0,20";}
	var s_Skill2 = new VSkillIcon_Logic{pos = "55,20";}
	var s_Skill3 = new VSkillIcon_Logic{pos = "110,20";}
	var s_Skill4 = new VSkillIcon_Logic{pos = "165,20";}
	var s_Skill5 = new VSkillIcon_Logic{pos = "220,20";}
	var s_Item1 = new VPropIcon_Logic{pos = "295,20";}
	var s_Item2 = new VPropIcon_Logic{pos = "350,20";}
	var s_Item3 = new VPropIcon_Logic{pos = "405,20";}

	//通过能量球个数和是否能使用判断技能图标亮与灰
	void PowerReturn()
	{
		if(s_Item1.m_SkillNum>0 && s_Item1.m_CanUse)
		{
			return true;
		}
		else
		{
			return false;
		}
	}//PowerReturn()

	//购买的返回
	//参数：enterID
	void BuyReturn(FourParam)
	{
		var _subEntry = window.GetSubEntryByEnterID(FourParam);
		printf("B# 快捷栏-购买的回调；BuyReturn:"+FourParam+",_subEntry:"+_subEntry);
		if(_subEntry == s_Skill1.m_ItemEnterID)
		{
			s_Skill1.s_SkillNum.SetData(s_Skill1.m_ItemEnterID);
			return;
		}
		if(_subEntry == s_Skill2.m_ItemEnterID)
		{
			s_Skill2.s_SkillNum.SetData(s_Skill2.m_ItemEnterID);
			return;
		}
		if(_subEntry == s_Skill3.m_ItemEnterID)
		{
			s_Skill3.s_SkillNum.SetData(s_Skill3.m_ItemEnterID);
			return;
		}
		if(_subEntry == s_Skill4.m_ItemEnterID)
		{
			s_Skill4.s_SkillNum.SetData(s_Skill4.m_ItemEnterID);
			return;
		}
		if(_subEntry == s_Skill5.m_ItemEnterID)
		{
			s_Skill5.s_SkillNum.SetData(s_Skill5.m_ItemEnterID);
			return;
		}
		if(_subEntry == s_Item1.m_ItemEnterID)
		{
			s_Item1.s_SkillNum.SetData(s_Item1.m_ItemEnterID);
			return;
		}
	}//BuyReturn()

	//消费的返回
	//参数：enterID
	void UseReturn(FourParam)
	{
		printf("B# 快捷栏-消费的回调；UseReturn:"+FourParam);

		if(FourParam == s_Skill1.m_ItemEnterID)
		{
			s_Skill1.s_SkillNum.SetData(s_Skill1.m_ItemEnterID);
			return;
		}
		if(FourParam == s_Skill2.m_ItemEnterID)
		{
			s_Skill2.s_SkillNum.SetData(s_Skill2.m_ItemEnterID);
			return;
		}
		if(FourParam == s_Skill3.m_ItemEnterID)
		{
			s_Skill3.s_SkillNum.SetData(s_Skill3.m_ItemEnterID);
			return;
		}
		if(FourParam == s_Skill4.m_ItemEnterID)
		{
			s_Skill4.s_SkillNum.SetData(s_Skill4.m_ItemEnterID);
			return;
		}
		if(FourParam == s_Skill5.m_ItemEnterID)
		{
			s_Skill5.s_SkillNum.SetData(s_Skill5.m_ItemEnterID);
			return;
		}
		if(FourParam == s_Item1.m_ItemEnterID)
		{
			s_Item1.s_SkillNum.SetData(s_Item1.m_ItemEnterID);
			return;
		}
	}//UseReturn()

	//设置图标的数量
	//[参数]enterID:物品ID
	void SetIconNum(enterID)
	{
		var _num = window.GetItemNumByEnterID(enterID);
		_num -= 1;

		printf("B# 快捷栏-SetIconNum-enterID:"+enterID+",_num:"+_num);

		if(enterID == s_Skill1.m_ItemEnterID)
		{
			s_Skill1.s_SkillNum.SetMyNum(_num,enterID);
			return;
		}

		if(enterID == s_Skill2.m_ItemEnterID)
		{
			s_Skill2.s_SkillNum.SetMyNum(_num,enterID);
			return;
		}
		if(enterID == s_Skill3.m_ItemEnterID)
		{
			s_Skill3.s_SkillNum.SetMyNum(_num,enterID);
			return;
		}
		if(enterID == s_Skill4.m_ItemEnterID)
		{
			s_Skill4.s_SkillNum.SetMyNum(_num,enterID);
			return;
		}
		if(enterID == s_Skill5.m_ItemEnterID)
		{
			s_Skill5.s_SkillNum.SetMyNum(_num,enterID);
			return;
		}
		if(enterID == s_Item1.m_ItemEnterID)
		{
			s_Item1.s_SkillNum.SetMyNum(_num,enterID);
			return;
		}
	}//SetIconNum()
};