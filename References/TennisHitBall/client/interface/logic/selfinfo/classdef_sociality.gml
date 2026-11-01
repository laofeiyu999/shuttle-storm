//个人信息:社交统计类定义

importex("$./../../UI/SelfInfo/ClassDef_sociality.gml");
importex("$./../../Logic/Friend/ClassDef_RelationUnSee_DBList.gml");

class VSelfInfo_Sociality_Logic item
{
	name = "VSelfInfo_Sociality_Logic";
	size = "100%,100%";bgcolor = "#FF";alpha = 50;
	var m_UID = 0; //情侣ID
	//=============================与界面交互========================================
	void Init()
	{
		new VPic9_BK2_UI{pos="16,58";size="285,482";}
		//情侣
		new img{pos = "30,75";}
		//情侣昵称
		new img{pos = "30,104";}
		staticvar s_Name_LoverDates = new BKText{}
//		//爱情指数
		new img{pos = "190,104";}
		staticvar s_Point_LoverDates = new BKText{}
		//解除婚约
		staticvar s_Btn_RelieveEngagement = new VBTN_58_New{}
//		//情侣徽章
//		new img{pos = "30,144";}
//		staticvar s_LBedge_LoverDates = new img{}
////		//情侣等级
//		new img{pos = "190,144";}
//		staticvar s_Level_LoverDates = new BKText{}
//		//搭档
//		new img{pos = "30,194";}
//		//当前搭档
//		new img{pos = "30,224";}
//		staticvar s_Curpartner_LoverDates = new BKText{}
//		//默契度
//		new img{pos = "190,224";}
//		staticvar s_Privity_LoverDates = new BKText{}
//		//搭档徽章
//		new img{pos = "30,264";}
//		staticvar s_PBedge_LoverDates = new img{}
//		//搭档等级
//		new img{pos = "190,264";}
//		staticvar s_PLevel_LoverDates = new BKText{}
		//家族
		new img{pos = "30,314";}
		//家族名称
		new img{pos = "30,354";}
		staticvar s_Fname_LoverDates = new BKText{}
		//家族等级
		new img{pos = "30,394";}
		staticvar s_FLevel_LoverDates = new BKText{}
		//家族徽章
		new img{pos = "190,394";}
		//家族成员
		new img{pos = "30,434";}
	}
	inclass("VSelfInfo_Sociality_UI");//界面显示类

//================================DBList=========================================

	void SetEvent()
	{
		set s_Btn_RelieveEngagement//解散情侣
		{
			void OnPressed()
			{
				if (GetState() == window.BTN_STATE_LIGHT) //亮的时候才能点
				{
					 window.OnClick_LoverPart2(m_UID);
				}
			}
			SetState(window.BTN_STATE_GREY);//按钮为灰的
		}
	}

	//取数据库的数据
	void ReadDataFromDB()
	{
//		staticvar _VNet2DBTable=new VNet2DBTable
//		{
//			var PCurName = 0;
//			var PSCurName= 0;
//			var PPrivity = 0;
//			var PBUID	 = 0;
//			void GetDataPartner(_PCurName,_PSCurName,_PPrivity,_PBUID)
//			{
//				PCurName = _PCurName; PSCurName = _PSCurName;
//				PPrivity = _PPrivity; PBUID      = _PBUID;
//			}
//		};
//		var _sqlP = "SELECT * FROM "+window.RELATION+" WHERE "+window.M_G_SERVER_RELATION_PCURRENT_STR+"=1";
//		_VNet2DBTable.Select( window.M_G_SERVER,_sqlP);
//		_VNet2DBTable.ReadData("GetDataPartner",""+window.M_G_SERVER_RELATION_NKNAME+","+window.M_G_SERVER_RELATION_SNKNAME+","+
//			window.M_G_SERVER_RELATION_PPRIVITY+","+window.M_G_SERVER_RELATION_BID);
//		if(_VNet2DBTable.GetSize()!=0)		
//		{
//			//搭档姓名
//			if(_VNet2DBTable.PBUID.__Long__ == window.GetMyUID()) 
//				s_Curpartner_PartnerDates.SetData(_VNet2DBTable.PSCurName);
//			else
//				s_Curpartner_PartnerDates.SetData(_VNet2DBTable.PCurName);
//			//默契度
//			s_Privity_PartnerDates.SetData(_VNet2DBTable.PPrivity);
//			//搭档徽章
//			s_PBedge_PartnerDates.show = true;
//			var PLevel = window.GetRelationLvByType_Partner(_VNet2DBTable.PPrivity);
//			s_PBedge_PartnerDates.SetData(PLevel);			
//			//搭档等级
//			s_PLevel_PartnerDates.SetData(PLevel);
//		}
//		_VNet2DBTable.del();

		staticvar _VNet2DBTable=new VNet2DBTable
		{
			var LName  = 0;
			var LSName  = 0;
			var LPoint = 0;
			var LBedge = 0;
			var LBUID  = 0;
			var LSUID  = 0;
			//var LLevel = 0;
			void GetDataLover(_LName,_LSName,_LPoint,_LBedge,_BUID,_SUID)
			{
				if (_BUID == window.GetMyUID() || _SUID == window.GetMyUID())
				{
					LName = _LName;
					LSName = _LSName;
					LPoint = _LPoint;
					LBedge = _LBedge;//LLevel = _LLevel;
					LBUID  = _BUID  ;
					LSUID  = _SUID  ;
				}
				
			}
		};
		var _sqlL = "SELECT * FROM "+window.RELATION+" WHERE "+window.M_G_SERVER_RELATION_WCOUPLE_STR+"=1";
		_VNet2DBTable.Select( window.M_G_SERVER,_sqlL);
		_VNet2DBTable.ReadData("GetDataLover",""+window.M_G_SERVER_RELATION_NKNAME+","+window.M_G_SERVER_RELATION_SNKNAME+","+
			window.M_G_SERVER_RELATION_WLOVES+","+window.M_G_SERVER_RELATION_WBADDISH+","+window.M_G_SERVER_RELATION_BID+","+
			window.M_G_SERVER_RELATION_SID);
		if(_VNet2DBTable.GetSize()!=0)		
		{
			var LoverName = 0;
			//情侣昵称
			if(_VNet2DBTable.LBUID.__Long__ == window.g_SelfInfo_UID) 
			{
					LoverName = _VNet2DBTable.LSName;
					m_UID = _VNet2DBTable.LSUID;
			}
			else
			{
				LoverName = _VNet2DBTable.LName;
				m_UID = _VNet2DBTable.LBUID;
			}
			if (window.g_SelfInfo_UID == window.GetMyUID())
				s_Btn_RelieveEngagement.SetState(window.BTN_STATE_LIGHT);//按钮为亮的
			
			
			//情侣等级
			//var LLevel = window.GetLoverExtraExp(m_UID,"lv");
			if ( LoverName != 0 || LoverName != "")
			{
				s_Name_LoverDates.SetData(LoverName);
				var LLevShowname = window.GetLoverExtraExp(m_UID,"showname");
				var Lexpadd = window.GetLoverExtraExp(m_UID,"expadd");
				//爱情指数
				s_LPoint_LoverDates.SetData(_VNet2DBTable.LPoint,LLevShowname,Lexpadd);
			}
//			//情侣徽章
//			if (toint(_VNet2DBTable.LPoint) >= 102100)
//			{
//				_VNet2DBTable.LPoint = 102100;
//				s_Level_LoverDates.SetData(5);
//			}
//			var _RelationSetID = window.GetSetIDByType_Lover(_VNet2DBTable.LPoint,_VNet2DBTable.LBedge);
//			var _VNet2DBRow = new VNet2DBRow{}
//			_VNet2DBRow.InitByInt(window.GAMEUI,window.RELATIONSET,window.GAMEUI_RELATIONSET_ID,_RelationSetID);
//			if(!_VNet2DBRow.IsReady())
//			{
//				_VNet2DBRow.del();
//				printf("B# error-GetLoverData1:DBname:"+window.GAMEUI+",TBName:"+window.RELATIONSET+",_RelationSetID:"+_RelationSetID);
//				return;
//			}
//			var _BadgeSrc = _VNet2DBRow.GetData(window.GAMEUI_RELATIONSET_BADGESRC);		// 徽章的图片名
//			s_LBedge_LoverDates.show = true;
//			s_LBedge_LoverDates.SetData(_BadgeSrc);
			_VNet2DBRow.del();
		}

		var _VNet2DBRow=new VNet2DBRow{};
		var _UID = window.GetMyUID();
//alert(window.GAMEUI+","+window.JIVECONSORTIA+","+window.GAMEUI_JIVECONSORTIA_USERNAME+","+tostring(window.g_LoverSearchResult));
		_VNet2DBRow.InitByString(window.GAMEUI,window.JIVECONSORTIA,window.GAMEUI_JIVECONSORTIA_USERNAME,tostring(window.g_LoverSearchResult));
		if (!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			return;
		}
		var _Family = _VNet2DBRow.GetData(window.GAMEUI_JIVECONSORTIA_CONSORTIAID);
		var _FamilyState = _VNet2DBRow.GetData(window.GAMEUI_JIVECONSORTIA_STATE);
		_VNet2DBRow.InitByInt(window.GAMEUI,window.JIVECONSORTIAINI,window.GAMEUI_JIVECONSORTIAINI_ID,_Family);
		var _FamilyName = _VNet2DBRow.GetData(window.GAMEUI_JIVECONSORTIAINI_NAME);
		var _FamilyLevel =_VNet2DBRow.GetData(window.GAMEUI_JIVECONSORTIAINI_CURRLV);
		var _FamilyMember =_VNet2DBRow.GetData(window.GAMEUI_JIVECONSORTIAINI_CURRNUM);
		var _familyBadgeData = _VNet2DBRow.GetData(window.GAMEUI_JIVECONSORTIAINI_ICONID);
		var _parserBadgeData = window.parserBadgeData(_familyBadgeData);
		//alert("_Family="+_Family+","+"_UID="+_UID+","+"_FamilyName="+_FamilyName+","+"_FamilyLevel="+_FamilyLevel+","+"_FamilyMember="+_FamilyMember+","+
		//	"_familyBadgeData="+_familyBadgeData+"_parserBadgeData="+_parserBadgeData);
		if (_FamilyState!=0)
		{
			//家族名称
			s_Fname_FamilyDates.SetData(_FamilyName);
			//家族等级				
			s_FLevel_FamilyDates.SetData(_FamilyLevel);
			//家族徽章
			var _arrBadgeData = window.Splitstr2(_parserBadgeData,",",6);//alert(_parserBadgeData);
			s_FBedge_FamilyDates.SetFamilyBadge(_arrBadgeData[0],_arrBadgeData[1],_arrBadgeData[2],_arrBadgeData[3],_arrBadgeData[4],_arrBadgeData[5]);
			//s_FBedge_FamilyDates.SetData(_FamilyLevel);
			//家族成员		
			var _FamilyMaxPeopleNum = window.GetFamilyMaxPeopleNum(_FamilyLevel);
			s_FMember_FamilyDates.SetData(_FamilyMember,_FamilyMaxPeopleNum);
		}

		_VNet2DBRow.del();
		_VNet2DBTable.del();
	}
	void OnCreated()
	{
		Init();
		SetEvent();

		if (window.g_SelfInfo_UID != window.GetMyUID())
		{
			var LName = window.GetCurrLoverNkName(window.g_SelfInfo_UID);
			if ( tostring(LName) != "0" && tostring(LName) !="")
			{
				s_Name_LoverDates.SetData(LName);
				var LLoverPoint = window.GerCurLovePointByUID(window.g_SelfInfo_UID);
				var LLevShowname = window.GetLoverExtraExp(window.g_SelfInfo_UID,"showname");
				var Lexpadd = window.GetLoverExtraExp(window.g_SelfInfo_UID,"expadd");
				//爱情指数
				s_LPoint_LoverDates.SetData(LLoverPoint,LLevShowname,Lexpadd);
				s_Btn_RelieveEngagement.SetState(window.BTN_STATE_GREY);
			}
		}
		else
		{
			ReadDataFromDB();
			new VRelationUnSee_DBList_Logic
			{
				name = "Sociality_VRelationUnSee_DBList_Logic_NAME";
				window.find("G_DBMANAGE").RegDbTable(this,window.M_G_SERVER,window.RELATION,"Bind_Sociality_VRelationUnSee_DBList_Logic");// 绑定数据表
				var myUID= window.GetMyUID();
				var _SQL = "SELECT * FROM "+window.RELATION+" WHERE "+window.M_G_SERVER_RELATION_WCOUPLE_STR +"=1 AND "+window.M_G_SERVER_RELATION_BID_STR+"="+myUID
					+" OR "+window.M_G_SERVER_RELATION_WCOUPLE_STR +"=1 AND "+window.M_G_SERVER_RELATION_SID_STR+"="+myUID;
				window.find("G_DBMANAGE").SelectByRegDbTable("Bind_Sociality_VRelationUnSee_DBList_Logic",window.M_G_SERVER,_SQL);
				void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);} //移除绑定
				void OnChgSize(_num)
				{
					if(_num==0){parent.GetLoverData();}
				}
			}
			if (toint(s_Name_LoverDates.src) != 0 || tostring(s_Name_LoverDates.src) != ""))
				s_Btn_RelieveEngagement.SetState(window.BTN_STATE_LIGHT);
			else
				s_Btn_RelieveEngagement.SetState(window.BTN_STATE_GREY);
		}

	}
	void GetLoverData()
	{
		s_Btn_RelieveEngagement.SetState(window.BTN_STATE_GREY);
		//情侣昵称
		s_Name_LoverDates.SetData("");
		//爱情指数
		s_LPoint_LoverDates.SetData("");
		//情侣等级
		s_Level_LoverDates.SetData("");
		s_LBedge_LoverDates.show = false;
		//搭档姓名
		s_Curpartner_PartnerDates.SetData("");
		//默契度
		s_Privity_PartnerDates.SetData("");
		//搭档徽章
		s_PBedge_PartnerDates.show = false;
		//搭档等级
		s_PLevel_PartnerDates.SetData("");
	}

};