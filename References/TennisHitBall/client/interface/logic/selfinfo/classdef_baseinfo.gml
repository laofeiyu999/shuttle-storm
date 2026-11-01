//个人信息:基础信息类定义
//yxf 2009年10月21日

importex("$./../../UI/SelfInfo/ClassDef_BaseInfo.gml");
importex("$./../../Logic/Friend/ClassDef_RelationUnSee_DBList.gml");

class VSelfInfo_BaseInfo_Logic item
{
	size = "100%,100%";bgcolor = "#FF";alpha = 50;

	//=============================与界面交互========================================
	void Init()
	{
		//人物昵称
		//参数 data1
		staticvar s_UserName = new VMyText{pos = "60,0";}

		//人物等级
		//参数 data1
		staticvar s_UserLevel = new VMyText{pos = "60,50";}

		//称号
		//参数 data1
		staticvar s_Title = new VMyText{pos = "60,70";}

		//人物性别
		//参数 data1
		staticvar s_UserSex = new VMyText{pos = "60,100";}

		//技术类型
		//参数 data1：
		staticvar s_TechnicType = new VMyText
		{
			pos = "250,0";void SetData(type){src = window.GetTechnicByType(type);}
		}

		//经验值比
		//参数data2:当前经验值
		//参数data3:升级所需经验
		staticvar s_Exp = new VMyText{pos = "60,200";}

		//金币
		//参数 data1
		staticvar s_UserGold = new VMyText{pos = "60,450";}

		//奖券
		staticvar s_UserLottery = new VMyText{pos = "119,224";size = "146,18";}

		//点券
		//参数 data1
		staticvar s_UserMoney = new VMyText{pos = "60,500";}

		staticvar s_RQ = new VMyText{pos="119,254";size="105,18";}
		staticvar s_XianHua = new VMyText{pos="225,254";InitText("献花");}

		//综合指数
		staticvar s_ZongHe=new BKText
		{
		    pos="475,327";size="83,20";
			void SetData(data,data1,data2,data3,data4)
			{
				if (data==1){src=""+data1;}
				if (data==2){src=""+data2;}
				if (data==3){src=""+data3;}
				if (data==4){src=""+data4;}	
			}
		
		}

		//力量
		staticvar s_LiLiang=new VMyText{pos="91,299";size="93,20";}//BKText{pos="91,299";size="93,20";}
		staticvar s_TStrength = new VMyText{}
		// 技术}
		staticvar s_JiShu=new VMyText{pos="91,322";size="93,20";}//BKText{pos="91,371";size="93,20";}
		staticvar s_TSkill = new VMyText{}
		// 前场
		staticvar s_QianChang=new VMyText{pos="91,346";size="93,20";}//BKText{pos="91,322";size="93,20";}
		staticvar s_TForceHand = new VMyText{}
		// 后场
		staticvar s_HouChang=new VMyText{pos="91,371";size="93,20";}//BKText{pos="91,346";size="93,20";}
		staticvar s_TBackHand = new VMyText{}
		// 发球
		staticvar s_FaQiu=new VMyText{pos="253,299";size="93,20";}//BKText{pos="253,299";size="93,20";}
		staticvar s_TServe = new VMyText{}
		// 能量
		staticvar s_NengLiang=new VMyText{pos="253,322";size="93,20";}//BKText{pos="253,322";size="93,20";}
		staticvar s_TEnergy = new VMyText{}
		// 体力
		staticvar s_TiLi=new VMyText{pos="253,346";size="93,20";}//BKText{pos="253,346";size="93,20";}
		staticvar s_Thew = new VMyText{}
		
		//家族
		staticvar s_Family = new BKText{};
		//情侣
		staticvar s_QingLv=new BKText{pos="158,456";size="146,19";}
		// 师徒
		staticvar s_ShiTu=new BKText{pos="158,489";size="146,19";}

	}
	inclass("VSelfInfo_BaseInfo_UI");//界面显示类
	//================================DBList=========================================
	//取数据库的数据
	void ReadDataFromDB()
	{
		window.g_Row.InitByInt(window.M_G_SERVER,window.USERDT,window.M_G_SERVER_USERDT_UID,window.g_SelfInfo_UID);
		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error:-个人信息-基础信息-DBname:"+window.M_G_SERVER+",TBName1:"+window.USERDT+",UID:"+window.g_SelfInfo_UID);
			window.find("UIController").LoadDLG(147);//玩家已离线，基础信息错误！
			return;
		}
		var _vip = window.g_Row.GetData(window.M_G_SERVER_USERDT_VIPVALUE);
		var _useID = window.g_Row.GetData(window.M_G_SERVER_USERDT_UID);
		var _userName = window.g_Row.GetData(window.M_G_SERVER_USERDT_NKNAME);
		s_UserName.SetData(_userName,_vip);
		var _tempExp = window.g_Row.GetData(window.M_G_SERVER_USERDT_CUEXP);//当前经验
		var _tempLv = window.g_Row.GetData(window.M_G_SERVER_USERDT_CULEVEL);//等级

		
		//人物等级
		s_UserLevel.SetData(_tempLv);

		//人物性别
		var _sex = window.g_Row.GetData(window.M_G_SERVER_USERDT_SEX);
		s_UserSex.SetData(window.g_Row.GetData(window.M_G_SERVER_USERDT_SEX));
		//只能查看自己的金币
		if (window.g_SelfInfo_UID == window.GetMyUID())
		{
			// 金币
			s_UserGold.SetData(window.g_Row.GetData(window.M_G_SERVER_USERDT_TOTALMONEY));
			// 奖券
			s_UserLottery.SetData(window.g_Row.GetData(window.M_G_SERVER_USERDT_TOKENMONEY));//临时措施-代金券
			// 点券
			s_UserMoney.SetData(window.g_Row.GetData(window.M_G_SERVER_USERDT_TOTALTICKET));
		}
		else
		{
			//金币
			s_UserGold.SetData("--");
			// 奖券
			s_UserLottery.SetData("--");
			//点券
			s_UserMoney.SetData("--");//临时措施-代金券
		}

		s_Title.SetData(window.g_Row.GetData(window.M_G_SERVER_USERDT_RECEIVEQUALIFY));//称号
		s_TechnicType.SetData(window.g_Row.GetData(window.M_G_SERVER_USERDT_TROLETYPE));
		//技术类型
		var _type = window.g_Row.GetData(window.M_G_SERVER_USERDT_TROLETYPE);
		
		var _RoleID = window.g_Row.GetData(window.M_G_SERVER_USERDT_RID);

		window.g_Row.Release();

		window.g_Row.InitByInt(window.M_G_SERVER,window.ROLEDT,window.M_G_SERVER_ROLEDT_RID,_RoleID);
		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error:-个人信息-属性-DBname:"+window.M_G_SERVER+",TBName1:"+window.ROLEDT+",_RoleID:"+_RoleID);
			window.find("UIController").LoadDLG(147);//玩家已离线，基础信息错误！
			return;
		}

		//s_LiLiang.SetData(window.g_Row.GetData(window.M_G_SERVER_ROLEDT_TSTRENGTH));
		//s_QianChang.SetData(window.g_Row.GetData(window.M_G_SERVER_ROLEDT_TFORCEHAND));
		//s_HouChang.SetData(window.g_Row.GetData(window.M_G_SERVER_ROLEDT_TBACKHAND));
		//s_JiShu.SetData(window.g_Row.GetData(window.M_G_SERVER_ROLEDT_TSKILL));
		//s_FaQiu.SetData(window.g_Row.GetData(window.M_G_SERVER_ROLEDT_TSERVEFULL));
		//s_NengLiang.SetData(window.g_Row.GetData(window.M_G_SERVER_ROLEDT_TENERGY));
		//s_TiLi.SetData(window.g_Row.GetData(window.M_G_SERVER_ROLEDT_TSTAMINA));

		//window.g_Row.Release();

		//力量
		var _Power = window.g_Row.GetData(window.M_G_SERVER_ROLEDT_TSTRENGTH);

		//前场
		var _Front = window.g_Row.GetData(window.M_G_SERVER_ROLEDT_TFORCEHAND);
		//后场
		var _Back = window.g_Row.GetData(window.M_G_SERVER_ROLEDT_TBACKHAND);
		//技术
		var _Technic = window.g_Row.GetData(window.M_G_SERVER_ROLEDT_TSKILL);
		//发球
		var _Serve = window.g_Row.GetData(window.M_G_SERVER_ROLEDT_TSERVEFULL);
		//能量
		var _Energy = window.g_Row.GetData(window.M_G_SERVER_ROLEDT_TENERGY);
		//体力
		var _Thew = window.g_Row.GetData(window.M_G_SERVER_ROLEDT_TSTAMINA);
		
		window.g_Row.Release();
        
		s_LiLiang.SetData(_Power,300);
		s_QianChang.SetData(_Front,300);
		s_HouChang.SetData(_Back,300);
		s_JiShu.SetData(_Technic,300);
		s_FaQiu.SetData(_Serve,120);
		s_NengLiang.SetData(_Energy,200);
		s_TiLi.SetData(_Thew,200);

		var zhishu1 = _Power*1 + _Front*1 +_Back*0.5 +_Technic*0.5 +_Serve*1 +_Energy*3 +_Thew*5 ;//前场力量
		var zhishu2 = _Power*1 + _Front*0.5 +_Back*1 +_Technic*0.5 +_Serve*1 +_Energy*3 +_Thew*5 ;//后场力量
		var zhishu3 = _Power*0.5 + _Front*1 +_Back*0.5 +_Technic*1 +_Serve*1 +_Energy*3 +_Thew*5 ;//前场技巧
		var zhishu4 = _Power*0.5 + _Front*0.5 +_Back*1 +_Technic*1 +_Serve*1 +_Energy*3 +_Thew*5 ;//后场技巧

		s_ZongHe.SetData(_type,zhishu1,zhishu2,zhishu3,zhishu4);
		var _roletypeLv = window.GetRoleTypeLvByUID(_useID,_tempLv);
        //力量
		var _Power0 = window.GetUserInitAttByLv(_sex,_roletypeLv,0);		
		//前场
		var _Front0 = window.GetUserInitAttByLv(_sex,_roletypeLv,2);
		//后场
		var _Back0 = window.GetUserInitAttByLv(_sex,_roletypeLv,window.ATL_BACK);
		//技术
		var _Technic0 = window.GetUserInitAttByLv(_sex,_roletypeLv,1);
		//发球
		var _Serve0 = window.GetUserInitAttByLv(_sex,_roletypeLv,window.ATL_SERVE);
		//能量
		var _Energy0 = window.GetUserInitAttByLv(_sex,_roletypeLv,window.ATL_ENERGY);
		//体力
		var _Thew0 = window.GetUserInitAttByLv(_sex,_roletypeLv,window.ATL_THEW);

		s_TStrength.SetDataEx(_Power0,_Power);
		s_TSkill.SetDataEx(_Technic0,_Technic);
		s_TForceHand.SetDataEx(_Front0,_Front);
		s_TBackHand.SetDataEx(_Back0,_Back);
		s_TServe.SetDataEx(_Serve0,_Serve);
		s_TEnergy.SetDataEx(_Energy0,_Energy);
		s_Thew.SetDataEx(_Thew0,_Thew);

		//各类替换的百分比和角度
		var _needliliang = tofloat (_Power)/tofloat (6);
		var _needjiqiao = tofloat (_Technic)/tofloat(3*4);
		var _needfaqiu = tofloat (_Serve*3)/tofloat (2*9.33);
		var _qianchang = new T_ScriptFun{var xishu2 =tofloat( _Front)*0.0055;var xishu = 1.65+xishu2;var xishu3 = (3.3+xishu)/2;var xishu4 = xishu3*(-1);_qianchang = 2*window.tstatic.GetAngleOfThreePoint(xishu4,4.5,xishu3,4.5,0,-6.6);};
		var _houchang = new T_ScriptFun{var xishu2 = tofloat(_Back)*0.0055;var xishu = 1.65+xishu2;var xishu3 = (3.3+xishu)/2;var xishu4 = xishu3*(-1);_houchang = 2*window.tstatic.GetAngleOfThreePoint(xishu4,4.5,xishu3,4.5,0,-12);};
		//alert("_needliliang="+_needliliang+"_needjiqiao="+_needjiqiao+"_needfaqiu="+_needfaqiu+"_qianchang="+_qianchang+"_houchang="+_houchang);

		//var _array = window.SplitStr2(""+_needliliang+","+_needjiqiao+","+_needfaqiu+","+_qianchang+","+_houchang,",",5);

		var _liliangHangWndTip = window.GetUserHangWndTip(3);
		var _jiqiaoHangWndTip = window.GetUserHangWndTip(4);
		var _faqiuHangWndTip = window.GetUserHangWndTip(7);
		var _qiangchangHangWndTip = window.GetUserHangWndTip(5);
		var _houchangHangWndTip = window.GetUserHangWndTip(6);

		var _liliangtip = window.ReplaceStr(_liliangHangWndTip,""+window.GetDotSecPos(tostring(_needliliang))+"%");
		var _jiqiaotip = window.ReplaceStr(_jiqiaoHangWndTip,""+window.GetDotSecPos(tostring(_needjiqiao))+"%");
		var _faqiutip = window.ReplaceStr(_faqiuHangWndTip,""+window.GetDotSecPos(tostring(_needfaqiu))+"%");
		var _qianchangtip = window.ReplaceStr(_qiangchangHangWndTip,""+window.GetDotSecPos(tostring(_qianchang))+"°");
		var _houchangtip = window.ReplaceStr(_houchangHangWndTip,""+window.GetDotSecPos(tostring(_houchang))+"°");

		s_TStrength.SetHangSrc(_liliangtip);
		s_TSkill.SetHangSrc(_jiqiaotip);
		s_TForceHand.SetHangSrc(_qianchangtip);
		s_TBackHand.SetHangSrc(_houchangtip);
		s_TServe.SetHangSrc(_faqiutip);

		s_LiLiang.SetHangSrc(_liliangtip);
		s_JiShu.SetHangSrc(_jiqiaotip);
		s_QianChang.SetHangSrc(_qianchangtip);
		s_HouChang.SetHangSrc(_houchangtip);
		s_FaQiu.SetHangSrc(_faqiutip);
		//alert("_liliangHangWndTip="+_liliangHangWndTip+",_liliangtip="+_liliangtip);

		//人气
		printf("A# 个人信息：g_SelfInfo_UID:"+window.g_SelfInfo_UID);
//		s_RQ.SetData(window.F_getflower(window.g_SelfInfo_UID));

		var _myFamily = "";
		if(s_UserName == window.GetMyName())
		{
			_myFamily = window.GetFamilyName();
		}
		else
		{
			_myFamily = "正在获取中...";
			window.F_Family_GetOtherPlayerFamilyName(_useID);
		}
		if(_myFamily == -1 || _myFamily == "")
		{
			_myFamily = -1;
		}
		s_Family.SetData(_myFamily);
//		s_QingLv.color = "#929292";
//		s_QingLv.SetData("未开放");
//		s_Partner.SetData(_Partner);

		//经验值比:当前经验/升级所需经验
		s_Exp.SetData(_tempExp,window.GetNeedExpByCurrLV(_tempLv));

		var _relation = window.find("friendsys").CheckRelation(_userName);//alert(_relation);

		if(_userName == window.GetMyName())
		{
			s_XianHua.SetState(window.BTN_STATE_GREY);
		}
		else if (toint(_relation) == window.FRIEND_BLACKLIST)
		{
			s_XianHua.SetState(window.BTN_STATE_GREY);
	    }
        else
		{
			s_XianHua.SetState(window.BTN_STATE_LIGHT);
		}
		GetBaseInfoLovAndPar();

	}

	//设置响应事件
	void SetEvent()
	{
		set s_XianHua
		{
			void OnPressed()
			{
				if (GetState() == window.USER_STATE_REDAY)
				{
					window.GamePresentFlower(parent.s_UserName.src);
				}
			}
		}
	}

	void GetBaseInfoLovAndPar()
	{
//		_VNet2DBTable1.del();
		_VNet2DBTable2.del();
//		staticvar _VNet2DBTable1=new VNet2DBTable
//		{
//			void GetData(_bname,_sname,_bigId)
//			{
//				if(GetSize()==0){parent.s_CurpartnerDates.SetData("");return;}
//				if (window.GetMyUID()== _bigId)
//					parent.s_CurpartnerDates.SetData(_sname);
//				else
//					parent.s_CurpartnerDates.SetData(_bname);
//			}
//			Select( window.M_G_SERVER,"SELECT * FROM "+window.RELATION+" WHERE "+window.M_G_SERVER_RELATION_PCURRENT_STR+"=1");
//			ReadData("GetData",""+window.M_G_SERVER_RELATION_NKNAME+","+window.M_G_SERVER_RELATION_SNKNAME+","+window.M_G_SERVER_RELATION_BID);
//		};
		// modify by chenjihui
		// 2010-12-23
		staticvar _VNet2DBTable2=new VNet2DBTable
		{	
			void GetData(_bname,_sname,_bigId,_smallID)
			{
				if(GetSize()==0){parent.s_QingLv.SetData("");return;}	//情侣记录为0
				if(window.g_SelfInfo_UID == _bigId)		//当前玩家ID等于大ID
				{parent.s_QingLv.SetData(_sname);}		
				else if(window.g_SelfInfo_UID == _smallID)		//当前玩家ID等于小ID
				{parent.s_QingLv.SetData(_bname);}
			}
			Select( window.M_G_SERVER,"SELECT * FROM "+window.RELATION+" WHERE "+window.M_G_SERVER_RELATION_WCOUPLE_STR+"=1");
			ReadData("GetData",""+window.M_G_SERVER_RELATION_NKNAME+","+window.M_G_SERVER_RELATION_SNKNAME+","+window.M_G_SERVER_RELATION_BID
				+","+window.M_G_SERVER_RELATION_SID);
		};
		_VNet2DBTable2.del();

//		staticvar _VNet2DBTable2=new VNet2DBTable
//		{	
//			void GetData(_bname,_sname,_bigId,_smallID)
//			{
//alert("bname="+_bname+"sname="+_sname+"bigID="+_bigId+"smallID="+_smallID);
//				if(GetSize()==0){parent.s_QingLv.SetData("");return;}
//				if(window.GetMyUID()== _bigId)
//				{parent.s_QingLv.SetData(_sname);}
//				else if(window.GetMyUID()== _smallID)
//				{parent.s_QingLv.SetData(_bname);}
//			}
//			Select( window.M_G_SERVER,"SELECT * FROM "+window.RELATION+" WHERE "+window.M_G_SERVER_RELATION_WCOUPLE_STR+"=1");
//			ReadData("GetData",""+window.M_G_SERVER_RELATION_NKNAME+","+window.M_G_SERVER_RELATION_SNKNAME+","+window.M_G_SERVER_RELATION_BID
//				+","+window.M_G_SERVER_RELATION_SID);
//		};
//		_VNet2DBTable2.del();
//}
	}

	void OnCreated()
	{
		Init();
		SetEvent();
		ReadDataFromDB();
//		if (window.g_SelfInfo_UID != window.GetMyUID())
//		{
//			
//			s_CurpartnerPic.show = false;
//			s_CurpartnerDates.show = false;
//			s_QingLvPic.show = false;
//			s_QingLv.show = false;
//			s_FamilyPic.SetPos2();
//			s_Family.SetPos2();
//			window.Tos_CheckLoverID(window.g_SelfInfo_UID);
//
//		}
//		else
//		{
			s_CurpartnerPic.show = false;
			s_CurpartnerDates.show = false;
			s_QingLvPic.show = true;
			s_QingLv.show = true;
			s_FamilyPic.SetPos1();
			s_Family.SetPos1();
//		}

//		new VRelationUnSee_DBList_Logic
//		{
//			name = "BaseInfo_VRelationUnSee_DBList_Logic_NAME";
//			window.find("G_DBMANAGE").RegDbTable(this,window.M_G_SERVER,window.FRIENDDT,"Bind_BaseInfo_VRelationUnSee_DBList_Logic");// 绑定数据表
//			var _SQL = "SELECT * FROM "+window.RELATION+" WHERE "+window.M_G_SERVER_RELATION_WCOUPLE_STR +"=1 OR "+window.M_G_SERVER_RELATION_PCURRENT_STR +"=1";
//			window.find("G_DBMANAGE").SelectByRegDbTable("Bind_BaseInfo_VRelationUnSee_DBList_Logic",window.M_G_SERVER,_SQL);
//			void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);} //移除绑定
//			void OnChgSize(_num)
//			{
//				if(_num==0){parent.GetLoverData();}
//			}
//		}
	}

//	void GetLoverData()
//	{
//		s_QingLv.SetData("");
//		s_CurpartnerDates.SetData("");
//	}
		void OnDelete()
	{
		_VNet2DBTable1.del();
		_VNet2DBTable2.del();
	}

	//[功能]取情侣数据
	//[参数]nkname:昵称
	void ReadLoverData(nkname)
	{
		var _name = nkname;
		if (_name == 0 || _name == "")
			_name = window.GetCurrLoverNkName(window.g_SelfInfo_UID);
		s_QingLv.SetData(_name);
	}

	//[功能]取当前数据
	//[参数]nkname:昵称
	void ReadCurrPartnerData(nkname)
	{
		var _name = nkname;
		if (_name == 0 || _name == "")
			_name = window.GetCurPartnerName();
		s_CurpartnerDates.SetData(_name);
	}


	


};