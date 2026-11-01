//
//技能类 :对应玩家的技能
//成员变量：拥有网前的能量，网后的能量，ID
//功能：得到某个技能的相关数值。判断自己时候能高亮显示
//作者：yxf	2008年8月12日
//

class VSkillDT_Logic item
{
	//================================成员变量================================================
	var m_ID = -1;				//技能的显示ID
	var m_EntryID = -1;			//技能的物品ID
	var m_iFrontEnergy = -1;	//网前技能需要的能量
	var m_iBackEnergy = -1;		//网后技能需要的能量

	//=================================成员函数================================================
	//外部接口：初始化
	//id:技能ID-显示ID
	//通过ID，初始化 网前需要的能量、网后的能量
	void InitData(id)
	{
		m_ID = id;
		if (toint(id) <= 0)
		{
			if (window.g_DEBUG)
			{
				printf("B# error!-VSkillDT_Logic:InitData()：id:"+id);
			}
			return;
		}
		/*
		var _DisplayID = window.GetDisplayIDByEnterID(id);
		if (_DisplayID < 0)
		{
			if (window.g_DEBUG)
			{
				printf("B# error!-VSkillDT_Logic:取显示ID错误()：_DisplayID:"+_DisplayID);
			}
			return;
		}*/
		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByInt(window.A001USER,window.SKILL,window.A001USER_SKILL_SKILLID,m_ID);	
		if (!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			if (window.g_DEBUG)
			{
				printf("B# error:DBname:"+window.A001USER+",TBName:"+window.SKILL+",m_ID:"+m_ID);
			}
			return;
		}
		
		m_iFrontEnergy = _VNet2DBRow.GetData(window.A001USER_SKILL_IFRONTNEEDENERGY);
		m_iBackEnergy = _VNet2DBRow.GetData(window.A001USER_SKILL_IBACKNEEDENERGY);

		_VNet2DBRow.del();

		m_EntryID = window.GetItemIDBySkillID(m_ID);
	}
};
