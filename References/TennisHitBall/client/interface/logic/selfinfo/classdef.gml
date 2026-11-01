//个人信息类定义
// yxf 2009年10月21日

importex("$./ClassDef_BaseInfo.gml");
importex("$./ClassDef_Record.gml");
importex("$./ClassDef_sociality.gml");
importex("$./../../UI/SelfInfo/ClassDef.gml");

class VSelfInfo_Logic item
{
	size = "100%,100%";bgcolor = "#000000";alpha = 50;
	var m_TypeIndex = 0;	//类型 0基础信息，1战绩统计，2装备属性
//	var m_IsPlaying = false;	//设置动作的间隔标识(是否在播放)
//	group = 1;
	//=============================与界面交互========================================
	void Init()
	{
		//基础信息：Radio
		staticvar s_R_BaseInfo = new VMyRadio
		{
			Init("基础信息",1);pos = "470,100";
		}
		//战绩统计：Radio
		staticvar s_R_Record = new VMyRadio
		{
			Init("战绩统计",1);pos = "470,200";
		}
		//关闭：按钮
		staticvar s_Btn_Close = new VMyButton
		{
			Init("X");halign(100,0);
		}
		//帮助：按钮
		staticvar s_Btn_Help = new VMyButton
		{
			pos(90,20);Init("?");
		}
	}
	inclass("VSelfInfo_UI");//界面显示类
	//==============================function=========================================
	//点击了关闭
	void OnClick_BtnClose()
	{
		parent.del();
	}
	//初始化显示：所有都隐藏
	void InitShow()
	{
		m_Class_BaseInfo.show = false;
		m_Class_Record.show = false;
		m_Class_Equipment.show = false;
		m_Class_Sociality.show = false;
	}
	//基础信息，战绩统计，装备属性的切换
	//参数 type：类型 0基础信息，1战绩统计，2装备属性
	void ChangeType(type)
	{
		m_TypeIndex = type;
		InitShow();
		switch (type)
		{
			case 0:{m_Class_BaseInfo.show = true;break;}
			case 1:{m_Class_Record.show = true;break;}
			case 2:{m_Class_Sociality.show = true;break;}
			case 3:{m_Class_Equipment.show = true;break;}
		}
	}

	//设置响应事件
	void SetEvent()
	{
		set s_R_BaseInfo//基础信息：Radio
		{
			groupname="VSelfInfo_Type_Group";
			startstate="1";
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();
				parent.ChangeType(0);
			}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_R_Record//战绩统计：Radio
		{
			groupname="VSelfInfo_Type_Group";
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();
				parent.ChangeType(1);
			}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_R_Sociality
		{
			groupname="VSelfInfo_Type_Group";
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();
				parent.ChangeType(2);
			}
			void OnUnCheck(){MouseUnCheck();}
			//SetState(window.BTN_STATE_GREY);
		}
//		set s_R_Equipment//装备属性:Radio
//		{
//			groupname="VSelfInfo_Type_Group";
//			void OnCheck()
//			{
//				if (GetChecked()){return;}
//				MouseCheck();
//				parent.ChangeType(2);
//			}
//			void OnUnCheck(){MouseUnCheck();}
//		}
		set s_Btn_Close//关闭：按钮
		{
			void OnPressed(){parent.OnClick_BtnClose();}
		}
		set s_Btn_Help//帮助：按钮
		{
			show = false;
			void OnPressed(){window.CallBack_Help(window.POS_SELFINFO,parent.m_TypeIndex);}
		}
	}

	//生成一些成员变量
	void NewSubObj()
	{
		//基础信息类
		staticvar m_Class_BaseInfo = new VSelfInfo_BaseInfo_Logic{}

		//战绩统计类
		staticvar m_Class_Record = new VSelfInfo_Record_Logic{}

		//装备属性类
//		staticvar m_Class_Equipment = new VSelfInfo_Equipment_Logic{}
		
		//社交属性
		staticvar m_Class_Sociality = new VSelfInfo_Sociality_Logic{}

		var _CurrLoverKey = window.GetCurrLoverKeyID(window.g_SelfInfo_UID);
		var _Model_Women = "";	//女的Avatar
		var _Model_Man = "";	//男的Avatar

		var _Sex_1 = 0;
		var _Sex_2 = 0;
		var _type = 1;
		var _CurrLoverUID = window.GetCurrLoverUID(window.g_SelfInfo_UID);

		//alert("window.g_SelfInfo_UID="+window.g_SelfInfo_UID+",window.GetMyUID()="+window.GetMyUID()+",window.GetCurrLoverUID()"+window.GetCurrLoverUID());
		//if ( window.g_SelfInfo_UID == window.GetMyUID() || window.GetCurrLoverUID() == window.g_SelfInfo_UID)
		//{
			if (_CurrLoverKey > 0)
			{
				var _VNet2DBRow = new VNet2DBRow{}
				_VNet2DBRow.InitByBigInt(window.M_G_SERVER,window.RELATION,window.M_G_SERVER_RELATION_KEY,_CurrLoverKey);
				if(!_VNet2DBRow.IsReady())
				{
					_VNet2DBRow.del();
					printf("B# error-GetLoverValue0:DBname:"+window.M_G_SERVER+",TBName:"+window.RELATION+",_CurrLoverKey:"+_CurrLoverKey);
				}
				
				_type = 2;
				var _BUID =_VNet2DBRow.GetData(window.M_G_SERVER_RELATION_BID);			//大的UID
				var _SUID =_VNet2DBRow.GetData(window.M_G_SERVER_RELATION_SID);			//小的UID
				//if (_BUID != window.GetMyUID() && _SUID!= window.GetMyUID())
					//_type = 1;

				var _RoleShow = 0;
				var _SRoleShow = 0;
				var _Sex = 1;
				if(_BUID.__Long__ == window.g_SelfInfo_UID) //大ID是自己
				{
					//则情侣它是小ID
					_RoleShow =_VNet2DBRow.GetData(window.M_G_SERVER_RELATION_SROLESHOW);	//角色显示数据
					_SRoleShow = _VNet2DBRow.GetData(window.M_G_SERVER_RELATION_ROLESHOW);
					_Sex =_VNet2DBRow.GetData(window.M_G_SERVER_RELATION_SEX);				//角色性别 1:男 2:女
				}
				else
				{
					_RoleShow =_VNet2DBRow.GetData(window.M_G_SERVER_RELATION_ROLESHOW);	//角色显示数据
					_SRoleShow =_VNet2DBRow.GetData(window.M_G_SERVER_RELATION_SROLESHOW);	//角色显示数据
					_Sex =_VNet2DBRow.GetData(window.M_G_SERVER_RELATION_SSEX);				//角色性别 1:男 2:女
				}
				if(window.GetSelfSexByUID(window.g_SelfInfo_UID) == window.USER_SEX_MAN)	//如果你的情侣是男的
				{
					if ( window.GetSelfAvatarByUID(_CurrLoverUID) != -1)
					{
						_Model_Women = window.GetSelfAvatarByUID(_CurrLoverUID);
						_Model_Man = window.GetSelfAvatarByUID(window.g_SelfInfo_UID );
					}
					else
					{
						_Model_Women = _RoleShow;
						//_Model_Man = window.GetSelfAvatarByUID(window.g_SelfInfo_UID );
						_Model_Man = _SRoleShow;
					}
					_Sex_1 = window.USER_SEX_WOMAN;
					_Sex_2 = _Sex;
				}
				else
				{
					//_Model_Women = window.GetSelfAvatarByUID(window.g_SelfInfo_UID);
					if ( window.GetSelfAvatarByUID(_CurrLoverUID) != -1)
					{
						_Model_Women = window.GetSelfAvatarByUID(window.g_SelfInfo_UID);
						_Model_Man = window.GetSelfAvatarByUID(_CurrLoverUID);
					}
					else
					{
						_Model_Women = _SRoleShow;
						_Model_Man = _RoleShow;
					}
					_Sex_1 = _Sex;
					_Sex_2 = window.USER_SEX_MAN;
				}
			}
			else //自己没情侣
			{
				if (window.g_SelfInfo_UID == window.GetMyUID())
				{
					_Model_Women = window.GetMyAvatar();
					_Sex_1		 = window.GetMySex();
				}
				else
				{
					_Model_Women = window.GetSelfAvatarByUID(window.g_SelfInfo_UID );
					_Sex_1		 = window.GetSelfSexByUID(window.g_SelfInfo_UID);
				}
			}
		//}
		//else		// 看别人
		//{
				//_Model_Women = window.GetSelfAvatarByUID(window.g_SelfInfo_UID );
				//_Sex_1		 = window.GetSelfSexByUID(window.g_SelfInfo_UID);
		//}
		s_LovModel.SetData(_Model_Women,_Sex_1,_Model_Man,_Sex_2,_type);
	}	
	//================================DBList=========================================
	void OnCreated()
	{	
		Init();
		NewSubObj();
		SetEvent();
		SetAlpha();
//		//在玩家列表中打开个人信息，是否显示社交
//		if (window.g_SelfInfo_UID != window.GetMyUID())
//		{
//			s_R_Sociality.show = false;
//		}
//		else
//			s_R_Sociality.show = true;
	}

	void FlashContent()
	{
		m_Class_BaseInfo.ReadDataFromDB();
	}
};
