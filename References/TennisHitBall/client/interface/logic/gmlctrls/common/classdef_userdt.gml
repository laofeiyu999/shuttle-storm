//
//玩家类 对应玩家的基本属性 
//成员：技能+userID,roleID,nkname,totalEnergy
//对应m_g_server.mdb 的userdt\roledt表
//功能：可以Get相应的属性值
//作者：yxf	2008年8月12日
//

import("$./ClassDef_SkillDT.gml");

class VUserDT_Logic item
{
	//================================成员变量===============================================
	var m_iUserID = -1;		//玩家ID	-游戏唯一
	var m_strNkname = "";	//昵称		-游戏唯一
	var m_iRoleID = -1;		//角色ID
	var m_iCuLevel = 1;		//等级
	var m_iTitle = 0;		//称号
	var m_iSex = 0;			//性别

	var m_iTStrength = 0;	//力量
	var m_iTSkill = 0;		//技术
	var m_iTForceHand = 0;	//前场
	var m_iTBackHand = 0;	//后场
	var m_iTEnergy = 0;		//能量
	var m_iTStamina = 0;	//体力
	var m_iTServe = 0;		//发球

	var m_iCharacter = 1;	//角色的性格 roleDT
	
	var m_Skill_1 = new VSkillDT_Logic{}	//技能1
	var m_Skill_2 = new VSkillDT_Logic{}	//技能2
	var m_Skill_3 = new VSkillDT_Logic{}	//技能3
	var m_Skill_4 = new VSkillDT_Logic{}	//技能4
	var m_Skill_5 = new VSkillDT_Logic{}	//技能5
	
	//=================================成员函数================================================
	//初始化-外部接口
	//参数:玩家ID
	void Init(userid)
	{
		m_iUserID = userid;
		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByInt(window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_UID,userid);	
		if (!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			printf("B# error:VUserDT_Logic-Init()-DBname:"+window.M_G_SERVER+",TBName:"+window.USERDT+",UID:"+userid);
			return;
		}
		m_strNkname = _VNet2DBRow.GetData(window.M_G_SERVER_USERDT_NKNAME);		//昵称
		m_iRoleID = _VNet2DBRow.GetData(window.M_G_SERVER_USERDT_RID);			//RID
		m_iCuLevel = _VNet2DBRow.GetData(window.M_G_SERVER_USERDT_CULEVEL);		//等级
		m_iTitle = _VNet2DBRow.GetData(window.M_G_SERVER_USERDT_RECEIVEQUALIFY);//称号ID
		m_iSex = _VNet2DBRow.GetData(window.M_G_SERVER_USERDT_SEX);				//性别

		_VNet2DBRow.InitByInt(window.M_G_SERVER,window.ROLEDT,window.M_G_SERVER_ROLEDT_RID,m_iRoleID);
		if (!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			printf("B# error:VUserDT_Logic-Init()-DBname:"+window.M_G_SERVER+",TBName:"+window.ROLEDT+",RID:"+m_iRoleID);
			return;
		}	
		m_iTStrength = _VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_TSTRENGTH);		//力量
		m_iTSkill = _VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_TSKILL);			//技术
		m_iTForceHand = _VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_TFORCEHAND);	//正手
		m_iTBackHand = _VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_TBACKHAND);		//反手
		m_iTEnergy = _VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_TENERGY);			//能量
		m_iTStamina = _VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_TSTAMINA);		//体力
		m_iTServe = _VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_TSERVEFULL);		//发球
		
		// 角色的性格:男（1俊朗型 2.冷酷型 3.阳光型） 女（1.可爱型 2.冷艳型 3.靓丽型）
		var _iCharacter = _VNet2DBRow.GetData(window.M_G_SERVER_ROLEDT_TCHARACTER);
		if (_iCharacter == "" || _iCharacter == 0)
		{
			m_iCharacter = 1;
		}
		else
		{
			m_iCharacter = _iCharacter;
		}

		_VNet2DBRow.del();
	}
	//初始化技能
	//参数:技能ID1，技能ID2，技能ID3，技能ID4，技能ID5
	// modify by chenjihui
	//2011-3-5
	void InitSkill(sid1,sid2,sid3,sid4,sid5)
	{
		//固定技能栏技能位置与栏位位置
		m_Skill_1.InitData(ContentSkill(sid1,sid2,sid3,sid4,sid5,1));	//上弦技能101,102,103,104
		m_Skill_2.InitData(ContentSkill(sid1,sid2,sid3,sid4,sid5,2));	//削球技能201,202,203,204
		m_Skill_3.InitData(ContentSkill(sid1,sid2,sid3,sid4,sid5,3));	//放高技能301,302,303,304
		m_Skill_4.InitData(ContentSkill(sid1,sid2,sid3,sid4,sid5,4));	//扣杀技能401,402,403,404
		m_Skill_5.InitData(ContentSkill(sid1,sid2,sid3,sid4,sid5,5));	//拐弯技能501,502,503,504
//		m_Skill_1.InitData(sid1);
//		m_Skill_2.InitData(sid2);
//		m_Skill_3.InitData(sid3);
//		m_Skill_4.InitData(sid4);
//		m_Skill_5.InitData(sid5);
	}

	//技能验证
	//参数在技能ID1……ID5中是否有技能ID为sid的
	//返回值：相应ID，-1未找到
	// add by chenjihui
	// 2011-3-5
	void ContentSkill(sid1,sid2,sid3,sid4,sid5,sid)
	{
		if (sid == toint(sid1)/100)
		{
			return sid1;
		}
		if (sid == toint(sid2)/100)
		{
			return sid2;
		}
		if (sid == toint(sid3)/100)
		{
			return sid3;
		}
		if (sid == toint(sid4)/100)
		{
			return sid4;
		}
		if (sid == toint(sid5)/100)
		{
			return sid5;
		}
		return -1;
	}

	//返回玩家ID
	void GetUID(){return m_iUserID;}
	//返回昵称
	void GetNkName(){return m_strNkname;}
	//返回角色ID
	void GetRID(){return m_iRoleID;}
	//返回等级
	void GetCurLevel(){return m_iCuLevel;}
	//返回称号
	void GetTitle(){return m_iTitle;}
	//返回性别
	void GetSex(){return m_iSex;}

	//返回力量
	void GetStrength(){return m_iTStrength;}
	//返回技术
	void GetSkill(){return m_iTSkill;}
	//返回正手
	void GetForceHand(){return m_iTForceHand;}
	//返回反手
	void GetBackHand(){return m_iTBackHand;}
	//返回能量
	void GetEnergy(){return m_iTEnergy;}
	//返回性格
	void GetCharacter(){return m_iCharacter;}
	//返回体力
	void GetStamina(){return m_iTStamina;}
	//返回发球
	void GetServe(){return m_iTServe;}

	//得到技能ID
	void GetSkillID(index)
	{
		var _Temp = -1;
		switch (index)
		{
			case 1:{_Temp = m_Skill_1.m_ID;break;}
			case 2:{_Temp = m_Skill_2.m_ID;break;}
			case 3:{_Temp = m_Skill_3.m_ID;break;}
			case 4:{_Temp = m_Skill_4.m_ID;break;}
			case 5:{_Temp = m_Skill_5.m_ID;break;}
			default:{break;}
		}
		return _Temp;
	}
	//得到技能的物品ID
	void GetSkillEntryID(index)
	{
		var _Temp = -1;
		switch (index)
		{
			case 1:{_Temp = m_Skill_1.m_EntryID;break;}
			case 2:{_Temp = m_Skill_2.m_EntryID;break;}
			case 3:{_Temp = m_Skill_3.m_EntryID;break;}
			case 4:{_Temp = m_Skill_4.m_EntryID;break;}
			case 5:{_Temp = m_Skill_5.m_EntryID;break;}
			default:{break;}
		}
		return _Temp;
	}
	//得到网前技能需要的能量
	void GetSkillFrontEnergy(index)
	{
		var _Temp = -1;
		switch (index)
		{
			case 1:{_Temp = m_Skill_1.m_iFrontEnergy;break;}
			case 2:{_Temp = m_Skill_2.m_iFrontEnergy;break;}
			case 3:{_Temp = m_Skill_3.m_iFrontEnergy;break;}
			case 4:{_Temp = m_Skill_4.m_iFrontEnergy;break;}
			case 5:{_Temp = m_Skill_5.m_iFrontEnergy;break;}
			default:{break;}
		}
		return _Temp;
	}
	//得到网后技能需要的能量
	void GetSkillBackEnergy(index)
	{
		var _Temp = -1;
		switch (index)
		{
			case 1:{_Temp = m_Skill_1.m_iBackEnergy;break;}
			case 2:{_Temp = m_Skill_2.m_iBackEnergy;break;}
			case 3:{_Temp = m_Skill_3.m_iBackEnergy;break;}
			case 4:{_Temp = m_Skill_4.m_iBackEnergy;break;}
			case 5:{_Temp = m_Skill_5.m_iBackEnergy;break;}
			default:{break;}
		}
		return _Temp;
	}
};