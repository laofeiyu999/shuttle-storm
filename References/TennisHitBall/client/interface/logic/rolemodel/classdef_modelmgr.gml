//
//模型管理
//适用地方：商城（自己+默认）+个人信息（自己+别人）+背包 + 创建角色
//yxf 2009年10月19日
//

/*
	//取某一项的属性值
	//参数 type：类型 见枚举eAttType
	//参数 index：序号 0-6 见枚举eAttList
	int CFun_GetAttValue(int type,int index);

	//取玩家当前的属性-已穿装备（自己）
	//m_g_server.mdb roledt
	//参数roleID:玩家的角色ID
	//参数 sex:性别 1男 2女
	//参数 lv:等級
	void CFun_GetCurrUserAtt(int roleID,int sex,int lv);

	//取显示ID
	//参数 part：部件序号见枚举eAvaDataPART
	int CFun_GetDID(int part);

	//设置物品的 EnterID和 显示ID  
	//参数 _class：物品的类别 见“商城物品的分类”
	//参数 enterID：物品的EnterID
	//参数 did：物品的显示ID
	void CFun_SetGoodsIDEx(int _class,int enterID,int did);

	//取物品ID
	//参数 part：部件序号见枚举eAvaDataPART
	int CFun_GetEntryIDEx(int part);

	//去掉套装的痕迹
	//参数 enterID：物品的EnterID
	void CFun_ClearSuitGoodsID(int enterID);

	//初始化物品ID与属性
	void CFun_InitGoodsID();
*/
importex("$./ClassDef_AttributeEx.gml");
importex("$./ClassDef_Model.gml");
//importex("$./../Friend/ClassDef_RelationUnSee_DBList.gml");

class VModelMgr_Logic item//CUIModelMgr
{
	name = "VModelMgr_Logic";
	size = "50%,100%";halign(100,0);//bgcolor = "#000000";alpha = 80;
	
	var m_Type = -1;		//模型的初始化类型
	var m_CurrShowSex = 1;	//当前显示的模型
	var m_OtherSex = 0;		//自己以外的性别
	var C_Model_1 = new CUIModelMgr{}
	var C_Model_2 = new CUIModelMgr{}
	
	var m_ClearSuitFlag_1 = 0;	//模型1 套装清理标记
	var m_ClearSuitFlag_2 = 0;	//模型2 套装清理标记

	
	var m_IfCanTry	= true;		//设置试穿的间隔标识


	//接口相关====================================================
	//[功能]初始化模型
	//[参数]type:初始化的类型 {MODEL_INIT_CREATEROLE,MODEL_INIT_HALL,MODEL_INIT_OTHERROLE}
	void InitModel(type)
	{
		m_Type = type;
		if (m_Type == window.MODEL_INIT_CREATEROLE)
		{
			staticvar s_Model_1 = new VModelBase_Logic
			{
				show = false;
				Init(window.USER_SEX_MAN);
				InitModel_1();
			}
			staticvar s_Model_2 = new VModelBase_Logic
			{
				show = false;
				Init(window.USER_SEX_WOMAN);
				InitModel_1();
			}
			return;
		}
		if (m_Type == window.MODEL_INIT_HALL)
		{
			staticvar s_Att_1 = new VRoleAttributeEx_Logic
			{
				Init();zindex = "top";
			}
			staticvar s_Model_1 = new VModelBase_Logic
			{
				Init(window.GetMySex());
				InitModel_2(window.GetMyRID());
				
				printf("D# VModelMgr_Logic-RID:"+window.GetMyRID()+",Sex:"+window.GetMySex()+",RoleLV:"+window.GetRoleTypeLvByUID());
				parent.C_Model_1.CFun_GetCurrUserAtt(window.GetMyRID(),window.GetMySex(),window.GetRoleTypeLvByUID() );
				parent.SetAttValue(window.GetMySex());
			}
			staticvar s_Model_2 = new VModelBase_Logic
			{
				show = false;
				if (window.GetMySex() == window.USER_SEX_MAN)
				{
					parent.m_OtherSex = window.USER_SEX_WOMAN;
				}
				else
				{
					parent.m_OtherSex = window.USER_SEX_MAN;
				}
				Init(parent.m_OtherSex);
				InitModel_1();
			}
			staticvar s_UserInfo = new VModel_UserInfo_Logic{}
			staticvar s_Info = new VModelInfo_Logic{}
			staticvar s_Money = new VModelMoney_logic{}
			return;
		}
		if (m_Type == window.MODEL_INIT_OTHERROLE)
		{
			staticvar s_Model_1 = new VModelBase_Logic
			{
				Init(window.GetSexByUID(window.g_SelfInfo_UID));
				InitModel_2(window.g_SelfInfo_RID);
			}
			return;
		}
	}

	//[功能]隐藏所有的模型
	//[参数]param：true false
	void InitShow(param)
	{
		s_Model_1.show = param;
		if (m_Type == window.MODEL_INIT_CREATEROLE || m_Type == window.MODEL_INIT_HALL)
		{
			s_Model_2.show = param;

			s_Att_1.show = param;
		}
	}

	//[功能]切换性别
	//{参数]_sex:性别 1男 2女
	void SwitchSex(_sex)
	{
		printf("B# VModelMgr_Logic:SwitchSex():_sex:"+_sex);

		InitShow(false);
		m_CurrShowSex = _sex;

		if (m_Type == window.MODEL_INIT_CREATEROLE )
		{
			if (m_CurrShowSex == window.USER_SEX_MAN)
			{
				s_Model_1.show = true;
				s_Model_1.InitAct();	
			}
			if (m_CurrShowSex == window.USER_SEX_WOMAN)
			{
				s_Model_2.show = true;
				s_Model_2.InitAct();
			}
			return;
		}
		if (m_Type == window.MODEL_INIT_HALL)
		{
			if (window.GetMySex() == m_CurrShowSex)
			{
				s_Model_1.show = true;
				s_Model_1.InitAct();

				s_Att_1.show = true;
			}
			else
			{
				s_Model_2.show = true;
				s_Model_2.InitAct();

				s_Att_1.show = false;
			}
			return;
		}
	}

	//[功能]设置试穿的函数(旧的函数-创建角色还在用)
	//{参数]p1:部件1头发
	//{参数]p2:部件2五官
	//{参数]p3:部件3上装
	//{参数]p4:部件4裙裤 
	void SetMallTryDataOld(p1,p2,p3,p4)
	{
		if (m_CurrShowSex == window.USER_SEX_MAN)
		{
			s_Model_1.SetParts(p1,p2,p3,p4);
			return;
		}

		if (m_CurrShowSex == window.USER_SEX_WOMAN)
		{
			s_Model_2.SetParts(p1,p2,p3,p4);
			return;
		}
	}

	//[功能]商城-设置试穿的函数
	//{参数]_entryid:物品ID
	//[返回值]true/false(试穿成功与否-加了过快试穿保护)
	void Script_SetMallTryData(_entryid)
	{
		if (!m_IfCanTry)
		{
			var _sex = window.GetItemSexByID(_entryid);
			if (toint(_sex) > 0)
			{
				//window.WriteChat7(999);
			}
			printf("B# VModelMgr_Logic:试穿限制中.......");
			return false;
		}
		m_IfCanTry = false;
		timer(window._Time_Try_Limit,"m_IfCanTry=true");
		var _class = window.GetClassByEnterId(_entryid);
		
		//试穿特效
		//如果是3D粒子
		if ( _class == window.GOODS_CLASS_Propa3DEffect )
		{
			var _id = window.GetDisplayIDByEnterID(_entryid);
			SetEffectByID(_id);
			return true;
		}

		//如果是2D效果
		if ( _class == window.GOODS_CLASS_Propa2DEffectSH || _class == window.GOODS_CLASS_Propa2DEffectH )
		{
			var _idG = window.GetDisplayIDByEnterID(_entryid);
			Set2dEffectID(_idG);
			return true;
		}

		var _type = window.GetPartByClass(_class);
		printf("B# VModelMgr_Logic:Script_SetMallTryData():m_CurrShowSex:"+m_CurrShowSex+",_entryid:"+_entryid+",_class:"+_class+",_type:"+_type);
		var _actid = 0;//动作ID
		switch (_type)
		{
			case 3:{_actid = window._Act_Mall_JACKET;break;}//上装动作
			case 4:{_actid = window._ACT_MALL_TROUSER;break;}//下装动作
			case 7:{_actid = window._ACT_MALL_SHOES;break;}//鞋动作
			case 9:{_actid = window._ACT_MALL_RACKET;break;}//球拍动作
			case 8:{_actid = window._ACT_MALL_Back;break;}	//背饰动作
		}

		if (m_CurrShowSex == window.GetMySex())
		{
			if (_class / window.GOODS_CLASS_BASE == window.GOODS_CLASS_Suit)
			{
				ResetAvatar();
//				if (m_ClearSuitFlag_1 > 0)
//				{
//					C_Model_1.CFun_ClearSuitGoodsID(m_ClearSuitFlag_1);
//				}
//				m_ClearSuitFlag_1 = _entryid;
				C_Model_1.CFun_SetSuitGoodsID(_entryid);
			}
			else
			{
				m_ClearSuitFlag_1 = 0;
				C_Model_1.CFun_SetGoodsIDEx(_entryid);
			}
			s_Model_1.SetParts2(
				C_Model_1.CFun_GetDID(window.AVA_DP_0),
				C_Model_1.CFun_GetDID(window.AVA_DP_1),
				C_Model_1.CFun_GetDID(window.AVA_DP_2),
				C_Model_1.CFun_GetDID(window.AVA_DP_3),
				C_Model_1.CFun_GetDID(window.AVA_DP_4),
				C_Model_1.CFun_GetDID(window.AVA_DP_5),
				C_Model_1.CFun_GetDID(window.AVA_DP_6),
				C_Model_1.CFun_GetDID(window.AVA_DP_7),
				C_Model_1.CFun_GetDID(window.AVA_DP_8),
				C_Model_1.CFun_GetDID(window.AVA_DP_9),
				C_Model_1.CFun_GetDID(window.AVA_DP_10),
				C_Model_1.CFun_GetDID(window.AVA_DP_11),
				C_Model_1.CFun_GetDID(window.AVA_DP_12));
			s_Model_1.SetModelAct(_actid);
			return true;
		}
		else
		{
			if (_class / window.GOODS_CLASS_BASE == window.GOODS_CLASS_Suit)
			{
				ResetAvatar();
//				if (m_ClearSuitFlag_2 > 0)
//				{
//					C_Model_2.CFun_ClearSuitGoodsID(m_ClearSuitFlag_2);
//				}
//				m_ClearSuitFlag_2 = _entryid;
				C_Model_2.CFun_SetSuitGoodsID(_entryid);
			}
			else
			{
				m_ClearSuitFlag_2 = 0;
				C_Model_2.CFun_SetGoodsIDEx(_entryid);
			}

			s_Model_2.SetParts2(
				C_Model_2.CFun_GetDID(window.AVA_DP_0),
				C_Model_2.CFun_GetDID(window.AVA_DP_1),
				C_Model_2.CFun_GetDID(window.AVA_DP_2),
				C_Model_2.CFun_GetDID(window.AVA_DP_3),
				C_Model_2.CFun_GetDID(window.AVA_DP_4),
				C_Model_2.CFun_GetDID(window.AVA_DP_5),
				C_Model_2.CFun_GetDID(window.AVA_DP_6),
				C_Model_2.CFun_GetDID(window.AVA_DP_7),
				C_Model_2.CFun_GetDID(window.AVA_DP_8),
				C_Model_2.CFun_GetDID(window.AVA_DP_9),
				C_Model_2.CFun_GetDID(window.AVA_DP_10),
				C_Model_2.CFun_GetDID(window.AVA_DP_11),
				C_Model_2.CFun_GetDID(window.AVA_DP_12));
			s_Model_2.SetModelAct(_actid);
			return true;
		}
	}
	
	//[功能]商城-形象还原
	//[参数]state:0脱下 1穿上
	//			entryid：所操作的物品ID
	void ResetAvatar(state, entryid)
	{
		printf("B# VModelMgr_Logic:ResetAvatar():m_CurrShowSex:"+m_CurrShowSex+",entryid:"+entryid);
		if (m_CurrShowSex == window.GetMySex())
		{
			var _class = window.GetClassByEnterId(entryid);
			//如果是3D粒子
			if ( _class == window.GOODS_CLASS_Propa3DEffect )
			{
				if (state == 1) 
				{
					var _id= window.GetDisplayIDByEnterID(entryid);
					SetEffectByID(_id);
				}
				else
					s_Model_1.find("UI_TEffect").delallchild();
				return;
			}

			//如果是2D动画 - 竖
			if ( _class == window.GOODS_CLASS_Propa2DEffectSH)
			{
				if (state == 1) 
				{
					var _id2D= window.GetDisplayIDByEnterID(entryid);
					Set2dEffectID(_id2D);
				}
				else
				{
					s_Model_1.find("Name_v2dImg").show = false;
				}
				return;
			}
			if ( _class == window.GOODS_CLASS_Propa2DEffectH )
			{
				if (state == 1) 
				{
					var _id2D= window.GetDisplayIDByEnterID(entryid);
					Set2dEffectID(_id2D);
				}
				else
				{
					s_Model_1.find("Name_h2dImg").show = false;
				}
				return;
			}
			//s_Model_1.find("UI_TEffect").delallchild();
			//s_Model_1.find("Name_v2dImg").show = false;
			//s_Model_1.find("Name_h2dImg").show = false;
			DisplayPackEffect();

			s_Model_1.InitModel_2(window.GetMyRID());
			C_Model_1.CFun_GetCurrUserAtt(window.GetMyRID(),window.GetMySex(),window.GetRoleTypeLvByUID());
			C_Model_1.CFun_InitGoodsID();
		}
		else
		{
			s_Model_2.find("UI_TEffect").delallchild();
			s_Model_2.find("Name_v2dImg").show = false;
			s_Model_2.find("Name_h2dImg").show = false;
			s_Model_2.InitModel_1();
			C_Model_2.CFun_InitGoodsID();
		}
	}

	//[功能]商城-形象还原所有的-关闭时
	void ResetAvatarAll()
	{
		printf("B# VModelMgr_Logic:ResetAvatarAll():m_CurrShowSex:"+m_CurrShowSex);
		s_Model_1.InitModel_2(window.GetMyRID());
		C_Model_1.CFun_GetCurrUserAtt(window.GetMyRID(),window.GetMySex(),window.GetRoleTypeLvByUID());
		s_Model_1.InitAct();
		s_Model_2.InitModel_1();

		DisplayPackEffect();
	}

	//[功能]商城-获取商城试穿的数据
	//{返回值]物品EntryID组合 如:"1000,10002"
	void GetMallTryData()
	{
		if (m_CurrShowSex == window.GetMySex())
		{
			var _Temp = "";
			var _i = 0;
			while (_i < window.AVA_DP_MAX)
			{
				var _tempid = C_Model_1.CFun_GetEntryIDEx(_i);
				if (_tempid > 0)
				{	
					_Temp += ""+_tempid+",";
				}
				_i += 1;
			}
			//alert("_Temp1:"+_Temp);
			return _Temp;
		}
		else
		{
			var _Temp = "";
			var _i = 0;
			while (_i < window.AVA_DP_MAX)
			{
				var _tempid = C_Model_2.CFun_GetEntryIDEx(_i);
				if (_tempid > 0)
				{	
					_Temp += ""+_tempid+",";
				}
				_i += 1;
			}
			//alert("_Temp2:"+_Temp);
			return _Temp;
		}
	}


	//[功能]设置属性值
	//[参数] sex: 自己的性别
	void SetAttValue(sex)
	{
		printf("B# VModelMgr_Logic-SetAttValue():sex:"+sex);
		if (sex == window.GetMySex())
		{
			var _i = 0;
			while (_i < window.ATL_MAX)
			{
				var _init = C_Model_1.CFun_GetAttValue(window.ATT_INIT,_i);
				var _equip = C_Model_1.CFun_GetAttValue(window.ATT_EQUIP,_i);
				s_Att_1.Script_SetAttValue(_i,_init,_equip);
				_i += 1;
				//alert("_i:"+_i+",_init:"+_init+",_equip:"+_equip);
			}
		}
	}

	//[功能]通过索引设置属性值-属性改变后调用
	//[参数] index: 索引 0 - 6
	//		 equitvalue:装备后的值
	void SetAttValueByIndex(index,equitvalue)
	{
		printf("B# VModelMgr_Logic-SetAttValueByIndex():index:"+index+",equitvalue:"+equitvalue);
		var _init = window.GetUserInitAttByLv(window.GetMySex(),window.GetRoleTypeLvByUID(),index);
		s_Att_1.Script_SetAttValue(index,_init,equitvalue);
	}

	//[功能]设置属性值-等级改变后调用
	void SetAttValueOnLvChg()
	{
		printf("B# VModelMgr_Logic-SetAttValueOnLvChg()");
//		var _init = window.GetUserInitAttByLv(window.GetMySex(),window.GetRoleTypeLvByUID(),index);
//		s_Att_1.Script_SetAttValue(index,_init,equitvalue);
		var _i = 0;
		while (_i < window.ATL_MAX)
		{
			var _init = window.GetUserInitAttByLv(window.GetMySex(),window.GetRoleTypeLvByUID(),_i);
			var _equip = window.GetUserEquipAttByRID(window.GetMyRID(),_i);
			printf("B# VModelMgr_Logic-SetAttValueOnLvChg()_i:"+_i+",_init:"+_init+",_equip:"+_equip);
			s_Att_1.Script_SetAttValue(_i,_init,_equip);
			_i += 1;
		}
	}

	//[功能]装备-取消装备
	void OnUpData_Equip()
	{
		ResetAvatar();
	}
	
	//自己的数据-RoleDT
	var _MyRoleDBRow = new VNet2DBRow
	{
		void InitDB()
		{
			//alert("GetMyRID="+window.GetMyRID());
			if (window.GetMyRID()>0)
			{
				InitByInt(window.M_G_SERVER,window.ROLEDT,window.M_G_SERVER_ROLEDT_RID,window.GetMyRID());
				AddDBEvent("OnMyDataChange",0,49,50,51,52,54,55,60);
			}
		}		
		//索引，
		//rid				0 rid
		//TStrength			49 网球 力量
		//TSkill			50 网球 技巧
		//TForceHand		51 网球 网前
		//TBackHand			52 网球 后场
		//TServeFull		54 网球 发球满力
		//TEnergy			55 网球 能量
		//TStamina			60 网球 体力
		void OnMyDataChange(index,rid,TStrength,TSkill,TForceHand,TBackHand,TServeFull,TEnergy,TStamina)
		{
			if (window.g_DEBUG)
			{
				printf("B# VModelMgr_Logic-_MyRoleDBRow::index:"+index+",rid:"+rid
					+",TStrength:"+TStrength+",TSkill:"+TSkill+",TForceHand:"+TForceHand
					+",TBackHand:"+TBackHand+",TServeFull:"+TServeFull+",TEnergy:"+TEnergy
					+",TStamina:"+TStamina);
			}	
			switch (index)
			{
				case 49:parent.SetAttValueByIndex(window.ATL_STRENGTH,TStrength);break;
				case 50:parent.SetAttValueByIndex(window.ATL_SKILL,TSkill);break;
				case 51:parent.SetAttValueByIndex(window.ATL_FRONT,TForceHand);break;
				case 52:parent.SetAttValueByIndex(window.ATL_BACK,TBackHand);break;
				case 54:parent.SetAttValueByIndex(window.ATL_SERVE,TServeFull);break;
				case 55:parent.SetAttValueByIndex(window.ATL_ENERGY,TEnergy);break;
				case 60:parent.SetAttValueByIndex(window.ATL_THEW,TStamina);break;
			}
		}
	}

	//初始化我的数据
	void InitUserData()
	{
		var _VRow = new VNet2DBRow{}
		_VRow.InitByInt(window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_UID,window.GetMyUID());
		if (!_VRow.IsReady())
		{
			_VRow.del();
			printf("B# error-VModelMgr_Logic-InitUserData:DBname:"+window.M_G_SERVER+",TBName:"+window.USERDT);
			return;
		}
		var _totalmoney = _VRow.GetData(window.M_G_SERVER_USERDT_TOTALMONEY);	//拥有金币
		var _totalticket = _VRow.GetData(window.M_G_SERVER_USERDT_TOTALTICKET);	//点券
		var _tokenmoney = _VRow.GetData(window.M_G_SERVER_USERDT_TOKENMONEY);	//代金券
		
		s_Money.s_Gold.SetData(_totalmoney);
		s_Money.s_Ticket.SetData(_totalticket);
		s_Money.s_Token.SetData(_tokenmoney);

		var _vip = _VRow.GetData(window.M_G_SERVER_USERDT_VIPVALUE);	
		var _nkname = _VRow.GetData(window.M_G_SERVER_USERDT_NKNAME);
		s_Info.s_NkName.SetData(_nkname,_vip);

		var _family = window.GetFamilyName(_nkname);
		s_Info.s_Family.SetData(_family);
		
		var _lv = _VRow.GetData(window.M_G_SERVER_USERDT_CULEVEL);
		s_Info.s_Lv.SetData(_lv);
		
		var _Qualify = _VRow.GetData(window.M_G_SERVER_USERDT_RECEIVEQUALIFY);
		s_Info.s_Qualify.SetData(_Qualify);

		var _Technic = _VRow.GetData(window.M_G_SERVER_USERDT_TROLETYPE);
		s_Info.s_Technic.SetData(_Technic);

		_VRow.del();
	}

	
	void OnCreated()
	{
		InitUserData();

		//_MyUserDBRow.InitDB();
		_MyRoleDBRow.InitDB();

		s_Model_1.SetModelAct(_actid);
		
		if (window.IsHallHtnOpened(window.G_HALLBTN_MALL))
		{
			window.find("MALL_LOGIC").ClickSexRadio(window.GetMySex());
		}

		DisplayPackEffect();
		ReadLoverData("");
		ReadCurrPartnerData("");
	}
	void GetLoverData()
	{
		s_Info.s_Lover.SetData("");
		s_Info.s_Partner.SetData("");
	}

	//2010年8月27日 - 特效新增函数
	
	//[功能]显示背包已装备特效
	void DisplayPackEffect()
	{
		var _3deffect = window.GetCIDByPackID(window.GOODS_CLASS_Propa3DEffect);
		var _2deffectSH = window.GetCIDByPackID(window.GOODS_CLASS_Propa2DEffectSH);
		var _2deffectH= window.GetCIDByPackID(window.GOODS_CLASS_Propa2DEffectH);
		if(toint(_3deffect) > 0)
		{
			var _displayid= window.GetDisplayIDByEnterID(_3deffect);
			SetEffectByID(_displayid);
		}
		else
			s_Model_1.find("UI_TEffect").delallchild();
		
		if(toint(_2deffectSH) >0)
		{
			var _displayidSH= window.GetDisplayIDByEnterID(_2deffectSH);
			Set2dEffectID(_displayidSH);
		}
		else
		{
			s_Model_1.find("Name_v2dImg").show = false;
		}

		if(toint(_2deffectH) >0)
		{
			var _displayidH= window.GetDisplayIDByEnterID(_2deffectH);
			Set2dEffectID(_displayidH);
		}
		else
		{
			s_Model_1.find("Name_h2dImg").show = false;
		}
	}

	//[功能]设置粒子特效
	//[参数]_src：特效名字
	void SetEffectSrc(_src)
	{
		if (m_CurrShowSex == window.GetMySex())
		{
			s_Model_1.find("UI_TEffect").delallchild();
			s_Model_1.find("UI_TEffect").SetSrc(_src);
		}
		else
		{
			s_Model_2.find("UI_TEffect").delallchild();
			s_Model_2.find("UI_TEffect").SetSrc(_src);
		}
	}
	
	//[功能]设置粒子特效通过ID
	//[参数]_id：特效的ID
	void SetEffectByID(_id)
	{
		var _VRow = new VNet2DBRow{}
		_VRow.InitByInt(window.M_G_CLINET,window.EFFECTDEF,window.M_G_CLINET_EFFECTDEF_EFFECTINDEX,_id);
		if (!_VRow.IsReady())
		{
			_VRow.del();
			printf("B# error-VModelMgr_Logic-SetEffectByID:DBname:"+window.M_G_CLINET+",TBName:"+window.EFFECTDEF+",_id:"+_id);
			return;
		}
		
		var _name = _VRow.GetData(window.M_G_CLINET_EFFECTDEF_EFFECTNAME);	
		SetEffectSrc(_name);
	}

	//[功能]设置2d特效
	//[参数]id:特效ID
	void Set2dEffectID(id)
	{
		var _Obj;
		var _VRow = new VNet2DBRow{}
		_VRow.InitByInt(window.GAMEUI,window.UI2D_EFFECT,window.GAMEUI_UI2D_EFFECT_ID,id);
		if (!_VRow.IsReady())
		{
			_VRow.del();
			printf("B# error-VModelMgr_Logic-Set2dEffectID:DBname:"+window.GAMEUI+",TBName:"+window.UI2D_EFFECT+",id:"+id);
			return;
		}
		
		var _type = _VRow.GetData(window.GAMEUI_UI2D_EFFECT_TYPE);	
		if (m_CurrShowSex == window.GetMySex())
		{
			switch (_type)
			{
				case 1:_Obj = s_Model_1.find("Name_v2dImg");break;
				case 2:_Obj = s_Model_1.find("Name_h2dImg");break;
			}
		}
		else
		{
			switch (_type)
			{
				case 1:_Obj = s_Model_2.find("Name_v2dImg");break;
				case 2:_Obj = s_Model_2.find("Name_h2dImg");break;
			}
		}

		var _sizex = _VRow.GetData(window.GAMEUI_UI2D_EFFECT_SIZEX);	
		var _sizey = _VRow.GetData(window.GAMEUI_UI2D_EFFECT_SIZEY);	
		var _ws = _VRow.GetData(window.GAMEUI_UI2D_EFFECT_WS);	
		var _allfms = _VRow.GetData(window.GAMEUI_UI2D_EFFECT_ALLFMS);	
		var _imgname = _VRow.GetData(window.GAMEUI_UI2D_EFFECT_IMGNAME);	
		var _speed = _VRow.GetData(window.GAMEUI_UI2D_EFFECT_SPEED);	
		var _loops = _VRow.GetData(window.GAMEUI_UI2D_EFFECT_LOOPS);	
		var _pos = _VRow.GetData(window.GAMEUI_UI2D_EFFECT_POS);	
		_VRow.del();
		
		_Obj.show = true;
		_Obj.src = "$./../../UI/PublicImage/uieffect/"+_imgname;
		_Obj.clipani(_sizex,_sizey,_ws,_allfms);
		_Obj.anispeed = _speed;
		_Obj.aniloops = _loops;
		_Obj.pos = ""+_pos;
	}

	//[功能]给模型设置一个动作
	//[参数]_actid:动作ID
	void SetModelAction(_actid)
	{
		printf("B# VModelMgr_Logic-SetModelAction:_actid:"+_actid);
		s_Model_1.SetModelAct(_actid);
	}
	void OnDelete()
	{
		_VNet2DBTable1.del();
		_VNet2DBTable2.del();
	}
	
	//[功能]取情侣数据
	//[参数]nkname:昵称
	void ReadLoverData(nkname)
	{
		sleep(50);
		if (toint(window.GetCurrLoverKeyID()) == 0)
		{
			s_Info.s_Lover.SetData(0);
			return;
		}
		var _name = nkname;
		if (_name == 0 || _name == "")
			_name = window.GetCurrLoverNkName();
		s_Info.s_Lover.SetData(_name);
	}

	//[功能]取当前数据
	//[参数]nkname:昵称
	void ReadCurrPartnerData(nkname)
	{
		var _name = nkname;
		if (_name == 0 || _name == "")
			_name = window.GetCurPartnerName();
		s_Info.s_Partner.SetData(_name);
	}

//绑定表的单个字段，有改变时返回
	new item
	{
		var _Bind = new VN2DbFieldBinding
		{
			//SetBindingIndex(window.M_G_SERVER_USERDT_NKNAME);
			BindingByInt=""+window.M_G_SERVER+","+window.USERDT+","+window.M_G_SERVER_USERDT_UID+","+window.GetMyUID()+","+window.M_G_SERVER_USERDT_NKNAME;
		};

		void OnDataExchange(data)
		{
			//alert("OnDataExchange2 data="+data+",index="+index);
			parent.s_Info.s_NkName.SetData(data,_vip);
			window.g_MyName = data; //修改window.GetMyName()的返回值
		}
	}
	var ModelMgrBind=new item
	{
		var _Bind2 = new VN2DbFieldBinding
		{
			void rebind()
			{
				SetBindingIndex(window.M_G_SERVER_USERDT_NKNAME,window.GAMEUI_JIVECONSORTIAINI_STATE);
				BindingByInt=""+window.GAMEUI+","+window.JIVECONSORTIAINI+","+window.GAMEUI_JIVECONSORTIAINI_ID+","+window.GetFamilyIDByUID()+","+window.GAMEUI_JIVECONSORTIAINI_NAME+","+window.GAMEUI_JIVECONSORTIAINI_STATE;
			}
			rebind();
		};
		
		

		void OnDataExchange2(data,index)
		{
//			alert("OnDataExchange data="+data+",index="+index);
			if (window.GAMEUI_JIVECONSORTIAINI_STATE == index && data == 0)
				parent.s_Info.s_Family.SetData("");
			if (window.M_G_SERVER_USERDT_NKNAME == index)
			{
				parent.s_Info.s_Family.SetData(data);
			}
		}
	}
};