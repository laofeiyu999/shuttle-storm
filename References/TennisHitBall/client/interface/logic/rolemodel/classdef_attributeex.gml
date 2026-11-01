//
//用途：商城+背包+个人信息-属性的逻辑类
//yxf 2009年10月28日

importex("$./../../UI/RoleModel/ClassDef_AttributeEx.gml");

class VRoleAttributeEx_Logic item//CAvaAttributeEx
{
	size = "160,150";bgcolor = "#FF00";alpha = 70;

	void Init()
	{
		//力量
		//参数 data2: 原始值
		//参数 data3：附加值(0不加不减-白色 -1减-红色 1加-绿色) 
		staticvar s_TStrength = new VMyText{}
		
		//技术
		//参数 data2: 原始值
		//参数 data3：附加值(0不加不减-白色 -1减-红色 1加-绿色) 
		staticvar s_TSkill = new VMyText{pos = "0,20";}
		
		//前场
		//参数 data2: 原始值
		//参数 data3：附加值(0不加不减-白色 -1减-红色 1加-绿色) 
		staticvar s_TForceHand = new VMyText{pos = "0,40";}
		
		//后场
		//参数 data2: 原始值
		//参数 data3：附加值(0不加不减-白色 -1减-红色 1加-绿色) 
		staticvar s_TBackHand = new VMyText{pos = "0,60";}
		
		//发球
		//参数 data2: 原始值
		//参数 data3：附加值(0不加不减-白色 -1减-红色 1加-绿色) 
		staticvar s_TServe = new VMyText{pos = "0,80";}

		//能量
		//参数 data2: 原始值
		//参数 data3：附加值(0不加不减-白色 -1减-红色 1加-绿色) 
		staticvar s_TEnergy = new VMyText{pos = "0,100";}

		//体力
		//参数 data2: 原始值
		//参数 data3：附加值(0不加不减-白色 -1减-红色 1加-绿色) 
		staticvar s_Thew = new VMyText{src = "体力";pos="0,120";}

	}
	inclass("VRoleAttributeEx_UI");
	//====================================function===========================================
	//设置属性值
	//参数 index: 0-6
	//参数 init：初始值
	//参数 equip:装备后属性
	void Script_SetAttValue(index,init,equip)
	{
		printf("D# VModelMgr_Logic-Script_SetAttValue:index:"+index+",init:"+init+",equip:"+equip);
		if (equip==0){equip = init;}
		switch (index)
		{
			case 0:
				var _Power = equip;
				s_TStrength.SetDataEx(init,equip);
				var _needliliang = tofloat (_Power)/tofloat (6));
				var _liliangHangWndTip = window.GetUserHangWndTip(3);
				s_TStrength.SetHangSrc(window.ReplaceStr(_liliangHangWndTip,""+window.GetDotSecPos(tostring(_needliliang))+"%"));
				break;
			case 1:
				var _Technic = equip;
				s_TSkill.SetDataEx(init,equip);
				var _needjiqiao = tofloat (_Technic)/tofloat(3*4);
				var _jiqiaoHangWndTip = window.GetUserHangWndTip(4);
				s_TSkill.SetHangSrc(window.ReplaceStr(_jiqiaoHangWndTip,""+window.GetDotSecPos(tostring(_needjiqiao))+"%"));
				break;
			case 2:
				var _Front = equip;
				s_TForceHand.SetDataEx(init,equip);
				var _qianchang = new T_ScriptFun{var xishu2 =tofloat( _Front)*0.0055;var xishu = 1.65+xishu2;var xishu3 = (3.3+xishu)/2;var xishu4 = xishu3*(-1);_qianchang = 2*tofloat( window.tstatic.GetAngleOfThreePoint(xishu4,4.5,xishu3,4.5,0,-6.6));};
				var _qiangchangHangWndTip = window.GetUserHangWndTip(5);
				s_TForceHand.SetHangSrc(window.ReplaceStr(_qiangchangHangWndTip,""+window.GetDotSecPos(tostring(_qianchang))+"°"));
				break;
			case 3:
				var _Back = equip;
				s_TBackHand.SetDataEx(init,equip);
				var _houchang = new T_ScriptFun{var xishu2 = tofloat(_Back)*0.0055;var xishu = 1.65+xishu2;var xishu3 = (3.3+xishu)/2;var xishu4 = xishu3*(-1);_houchang = 2*tofloat( window.tstatic.GetAngleOfThreePoint(xishu4,4.5,xishu3,4.5,0,-12));};
				var _houchangHangWndTip = window.GetUserHangWndTip(6);
				s_TBackHand.SetHangSrc(window.ReplaceStr(_houchangHangWndTip,""+window.GetDotSecPos(tostring(_houchang))+"°"));
				break;
			case 4:
				var _Serve = equip;
				s_TServe.SetDataEx(init,equip);
				var _needfaqiu = tofloat (toint(_Serve)*3)/tofloat (2*9.33);
				var _faqiuHangWndTip = window.GetUserHangWndTip(7);
				s_TServe.SetHangSrc(window.ReplaceStr(_faqiuHangWndTip,""+window.GetDotSecPos(tostring(_needfaqiu))+"%"));
				break;
			case 5:s_TEnergy.SetDataEx(init,equip);break;
			case 6:s_Thew.SetDataEx(init,equip);break;
		}
		if(window.GetSelfInfoOpenState())
		{
			window.find("SELFINFO_LOGIC")._VSelfInfo_Logic.FlashContent();
		}
	}
};