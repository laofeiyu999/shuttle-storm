//
//创建角色界面的类定义
//

importex("$./../../UI/CreateRole/ClassDef.gml");
importex("$./ClassDef_FreeList.gml");

class VCreateRole_Logic item
{
	size = "70%,65%";pos(0,50);bgcolor = "#FF00";alpha = 50;

	var m_Sex = 1;		//性别 1男2女
	var m_Pos = 0;		//位置 1网前2底线
	var m_Dir = 0;		//方向 1力量2技巧
	var m_CannotHot = false;	//弹出对话框就不能设置焦点了
	var _Arr1 = sysarray(5);			//1男试穿的ID
	var _Arr2 = sysarray(5);			//2女试穿的ID
	var m_ToleType = -1;		//角色类型

	//初始化数组
	void InitArr()
	{
		var _i_1 = 0;
		while (_i_1 < 5)
		{
			_Arr1[_i_1] = 0;
			_i_1 += 1;
		}

		var _i_2 = 0;
		while (_i_2 < 5)
		{
			_Arr2[_i_2] = 0;
			_i_2 += 1;
		}
	}

	//=============================与界面交互========================================
	void Init()
	{
		//昵称:edit
		staticvar s_Edit_NickName = new edit
		{
			size = "220,26";pos="16,22";
			font = "宋体,-1,20";bgcolor = "#FF";color = "#FFFFFF";cursorcolor = "#FFFFFF";
			maxsize = 16;ycenter = true;xcenter = true;
			timer(10,"hot=1");
		}
		//男：Radio
		staticvar s_R_Man = new VMyRadio
		{
			Init("男",0);size = "40,30";pos="307,22";
		}
		//女：Radio
		staticvar s_R_Woman = new VMyRadio
		{
			Init("女",0);size = "40,30";pos="413,22";
		}
		
		//网前：Radio
		staticvar s_R_NetFront = new VMyRadio
		{
			Init("网前",0);size = "40,30";pos="25,70";
		}
		//底线：Radio
		staticvar s_R_BaseLine = new VMyRadio
		{
			Init("底线",0);size = "40,30";pos="103,70";
		}

		//力量：Radio
		staticvar s_R_Power = new VMyRadio
		{
			Init("力量",0);size = "40,30";pos="260,70";
		}
		//技巧：Radio
		staticvar s_R_Skill = new VMyRadio
		{
			Init("技巧",0);size = "40,30";pos="364,70";
		}
		

		//技术方向说明
		//[参数]_data:说的的文字
		staticvar s_Desc = new VMyText
		{
			size = "350,150";bgcolor = "#FF";autoenter = true;
			src = "技术方向说明";pos="9,115";
		}
		//力量
		//[参数]_curr:当前值
		//		_max:最大值(也许没有这个值)
		staticvar s_Power = new VMyText{src = "力量";pos="409,115";}
		//前场
		//[参数]_curr:当前值
		//		_max:最大值(也许没有这个值)
		staticvar s_Front = new VMyText{src = "前场";pos="409,135";}
		//后场
		//[参数]_curr:当前值
		//		_max:最大值(也许没有这个值)
		staticvar s_Back = new VMyText{src = "后场";pos="409,155";}
		//技术
		//[参数]_curr:当前值
		//		_max:最大值(也许没有这个值)
		staticvar s_Technic = new VMyText{src = "技术";pos="409,175";}
		//发球
		//[参数]_curr:当前值
		//		_max:最大值(也许没有这个值)
		staticvar s_Serve = new VMyText{src = "发球";pos="409,195";}
		//能量
		//[参数]_curr:当前值
		//		_max:最大值(也许没有这个值)
		staticvar s_Energy = new VMyText{src = "能量";pos="409,215";}
		//体力
		//[参数]_curr:当前值
		//		_max:最大值(也许没有这个值)
		staticvar s_Thew = new VMyText{src = "体力";pos="409,235";}

		//翻页：发型
		staticvar s_PageCtrl_1 = new VMyPageCtrl{pos="2,460";}	
		//翻页：容貌
		staticvar s_PageCtrl_2 = new VMyPageCtrl{pos="203,459";}	
		//翻页：上装
		staticvar s_PageCtrl_3 = new VMyPageCtrl{pos="406,455";}
		//翻页：裙裤
		staticvar s_PageCtrl_4 = new VMyPageCtrl{pos="523,422";}

		//创建角色：按钮
		staticvar s_Btn_Create = new VMyButton
		{
			pos="593,446";Init("创建角色");
		}
	}
	inclass("VCreateRole_UI");//界面显示类
	Init();
	//==============================function=========================================
	//确定要创建-发出创建角色消息
	void OnConfirm_CreateRole()
	{
		var _param = ""+s_Edit_NickName.src+","+m_Sex+","+m_ToleType;
		if (toint(m_Sex) == 1)
		{
			_param += ","+_Arr1[1]+";"+_Arr1[2]+";"+_Arr1[3]+";"+_Arr1[4]+";";
		}
		else
		{
			_param += ","+_Arr2[1]+";"+_Arr2[2]+";"+_Arr2[3]+";"+_Arr2[4]+";";
		}
		//发出创建角色消息:"昵称","性别"，"角色类型","1头发(UI);2五官(UI);3上装(UI);4裙/裤(UI);"
		window.find("HELPLAYER").delallchild();//干掉创建角色时的引导帮助
		window.Too_CreateRole(_param);
		window.LoadInfoBoard(34,1,"");	//服务器连接中，请稍候……
	}
	//点击了创建角色
	void OnClick_BtnCreate()
	{
		var _NKName = s_Edit_NickName.src;
		if (_NKName.Count < 4 || _NKName.Count > 12)
		{
			window.find("UIController").LoadDLG(331);//昵称长度应在4-12字符之间。
			SetNkNameHot();
			return;
		}
		var _res = window.JudgeAnyNameLicit(_NKName,"昵称");
		if (_res < 0)
		{
			SetNkNameHot();
			return;
		}
		m_CannotHot = true;
		timer(10,"s_Edit_NickName.hot=0");
		window.find("UIController").LoadDLG(16);//确定要创建角色吗？
	}
	//设置焦点-用户名
	void SetNkNameHot()
	{
		if (m_CannotHot)
		{
			return;
		}
		timer(10,"s_Edit_NickName.hot=1");
	}
	//设置响应事件
	void SetEvent()
	{
		set s_Edit_NickName//昵称:edit
		{
			void OnEnter(){parent.OnClick_BtnCreate();}

			void OnKeyChar()
			{
				parent.parent._Info.s_NkName.SetData(src);
			}
		}
		set s_R_Man//男：Radio
		{
			groupname="VCreateRole_Sex_Group";startstate="1";
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();
				parent.SwitchSex(window.USER_SEX_MAN);
			}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_R_Woman//女：Radio
		{
			groupname="VCreateRole_Sex_Group";
			
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();
				parent.SwitchSex(window.USER_SEX_WOMAN);
			}
			void OnUnCheck(){MouseUnCheck();}
		}

		set s_R_NetFront
		{
			groupname="VCreateRole_Pos_Group";startstate="1";
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();
				parent.m_Pos = 1;
				parent.OnTypeChange();
			}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_R_BaseLine
		{
			groupname="VCreateRole_Pos_Group";
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();
				parent.m_Pos = 2;
				parent.OnTypeChange();
			}
			void OnUnCheck(){MouseUnCheck();}
		}

		set s_R_Power
		{
			groupname="VCreateRole_Dir_Group";startstate="1";
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();
				parent.m_Dir = 1;
				parent.OnTypeChange();
			}
			void OnUnCheck(){MouseUnCheck();}
		}
		set s_R_Skill
		{
			groupname="VCreateRole_Dir_Group";
			void OnCheck()
			{
				if (GetChecked()){return;}
				MouseCheck();
				parent.m_Dir = 2;
				parent.OnTypeChange();
			}
			void OnUnCheck(){MouseUnCheck();}
		}

		set s_PageCtrl_1//翻页：发型
		{
			targetname="VCreateRole_FreeList_Logic_1";
			countperpage = 1;
			window.find("G_DBMANAGE").GetRegDbTable(this,"Bind_VCreateRole_FreeList_Logic_1");
		}
		set s_PageCtrl_2//翻页：容貌
		{
			targetname="VCreateRole_FreeList_Logic_2";
			countperpage = 1;
			window.find("G_DBMANAGE").GetRegDbTable(this,"Bind_VCreateRole_FreeList_Logic_2");
		}

		set s_PageCtrl_3//翻页：上装
		{
			targetname="VCreateRole_FreeList_Logic_3";
			countperpage = 1;
			window.find("G_DBMANAGE").GetRegDbTable(this,"Bind_VCreateRole_FreeList_Logic_3");
		}

		set s_PageCtrl_4//翻页：裙裤
		{
			targetname="VCreateRole_FreeList_Logic_4";
			countperpage = 1;
			window.find("G_DBMANAGE").GetRegDbTable(this,"Bind_VCreateRole_FreeList_Logic_4");
		}

		set s_Btn_Create//创建角色：按钮
		{
			void OnPressed(){parent.OnClick_BtnCreate();}
		}
	}
	
	//[功能]切换性别
	//{参数]_sex:性别 1男 2女
	void SwitchSex(_sex)
	{
		m_Sex = _sex;
		parent._Model.SwitchSex(_sex);
		SelectGoodsByType();
		
		OnTypeChange();

		parent._Att_1.show = false;
		parent._Att_2.show = false;
		if (m_Sex == window.USER_SEX_MAN)
		{
			parent._Att_1.show = true;
		}
		else
		{
			parent._Att_2.show = true;
		}
	}

	//设置试穿的函数
	//参数 _class:物品的类别
	//参数 did:物品的显示ID-Avatar
	void SetTryData(_class,did)
	{
		var _type = window.GetPartByClass(_class);
		if (m_Sex == window.USER_SEX_MAN)
		{
			_Arr1[_type] = did;
			parent._Model.SetMallTryDataOld(_Arr1[1],_Arr1[2],_Arr1[3],_Arr1[4]);
			return;
		}
		if (m_Sex == window.USER_SEX_WOMAN)
		{
			_Arr2[_type] = did;
			parent._Model.SetMallTryDataOld(_Arr2[1],_Arr2[2],_Arr2[3],_Arr2[4]);
			return;
		}
	}

	//Select条件：点击标签时调用
	void SelectGoodsByType()
	{
		//主类别 1(上装,裙裤,袜,鞋) 2(头发,五官)
		//子类别 头发(2,0),五官(2,1),上装(1,0),裙裤(1,1) 袜(1,3),鞋(1,4)

		//头发
		var _SQL_1 = "SELECT * FROM "+window.ITEMS+" WHERE Class=200 AND Sex="+m_Sex+" AND FreeTry=1";
		window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VCreateRole_FreeList_Logic_1",window.M_G_GOODS,_SQL_1);
		//容貌
		var _SQL_2 = "SELECT * FROM "+window.ITEMS+" WHERE Class=201 AND Sex="+m_Sex+" AND FreeTry=1";
		window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VCreateRole_FreeList_Logic_2",window.M_G_GOODS,_SQL_2);
		//上装
		var _SQL_3 = "SELECT * FROM "+window.ITEMS+" WHERE Class=100 AND Sex="+m_Sex+" AND FreeTry=1";
		window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VCreateRole_FreeList_Logic_3",window.M_G_GOODS,_SQL_3);
		//裙裤
		var _SQL_4 = "SELECT * FROM "+window.ITEMS+" WHERE Class=101 AND Sex="+m_Sex+" AND FreeTry=1";
		window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VCreateRole_FreeList_Logic_4",window.M_G_GOODS,_SQL_4);

		_List_1.checkselect(10,10);
		_List_2.checkselect(10,10);
		_List_3.checkselect(10,10);
		_List_4.checkselect(10,10);
	}
	
	//职业类型发生了变化
	void OnTypeChange()
	{
		if (m_Pos == 0 || m_Dir == 0) return;
		VNETLOG(1132,"VCreateRole_Logic:OnTypeChange().m_Sex:"+m_Sex+"\n");
		if (m_Sex == 0)
		{
			printf("B# 严重错误VCreateRole_Logic:OnTypeChange().m_Sex:"+m_Sex);
			return;
		}
		var _DbName = "a00"+m_Sex+"user.mdb";
		var _key = 0;
		if (m_Pos == 1 && m_Dir == 1) _key = window.ROLE_TYPE_B_S; //1+1
		if (m_Pos == 2 && m_Dir == 1) _key = window.ROLE_TYPE_E_S; //2+1
		if (m_Pos == 1 && m_Dir == 2) _key = window.ROLE_TYPE_B_K; //1+2
		if (m_Pos == 2 && m_Dir == 2) _key = window.ROLE_TYPE_E_K; //2+2
		m_ToleType = _key;
		parent._Info.s_Technic.SetData(_key);

		_key *= window.ROLE_TYPE_IDBASE;
		_key += 1;	//1001 2001 3001 4001
		
		window.g_Row.InitByInt(_DbName,window.UPLEVEL,window.M_G_GOODS_ROLEINFO_ENTRYID,_key);
		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-OnTypeChange:DBname:"+_DbName+",TBName:"+window.UPLEVEL+",_key:"+_key);
			return;
		}
		
		s_Desc.SetData(window.g_Row.GetData(window.A001USER_UPLEVEL_DESC));

		//最大值
		//var _Max = 0;

		//力量
		var _Power = window.g_Row.GetData(window.A001USER_UPLEVEL_TSTRENGTH);
		_Max = _Power;
		//前场
		var _Front = window.g_Row.GetData(window.A001USER_UPLEVEL_TFORCEHAND);
		//if (_Front > _Max) _Max = _Front;
		//后场
		var _Back = window.g_Row.GetData(window.A001USER_UPLEVEL_TBACKHAND);
		//if (_Back > _Max) _Max = _Back;
		//技术
		var _Technic = window.g_Row.GetData(window.A001USER_UPLEVEL_TSKILL);
		//if (_Technic > _Max) _Max = _Technic;
		//发球
		var _Serve = window.g_Row.GetData(window.A001USER_UPLEVEL_TSERVEFULL);
		//if (_Serve > _Max) _Max = _Serve;
		//能量
		var _Energy = window.g_Row.GetData(window.A001USER_UPLEVEL_TMAXENERGY);
		//if (_Energy > _Max) _Max = _Energy;
		//体力
		var _Thew = window.g_Row.GetData(window.A001USER_UPLEVEL_TSTAMINA);
		//if (_Thew > _Max) _Max = _Thew;
		
		//_Max *= window.ROLE_TYPE_ATTRIBUTE;

		window.g_Row.Release();

		s_Power.SetData(_Power,300);
		s_Front.SetData(_Front,300);
		s_Back.SetData(_Back,300);
		s_Technic.SetData(_Technic,300);
		s_Serve.SetData(_Serve,120);
		s_Energy.SetData(_Energy,200);
		s_Thew.SetData(_Thew,200);
		
		if (m_Sex == window.USER_SEX_MAN)
		{
			parent._Att_1.Script_SetAttValue(window.ATL_STRENGTH,_Power,0);
			parent._Att_1.Script_SetAttValue(window.ATL_SKILL,_Technic,0);
			parent._Att_1.Script_SetAttValue(window.ATL_FRONT,_Front,0);
			parent._Att_1.Script_SetAttValue(window.ATL_BACK,_Back,0);
			parent._Att_1.Script_SetAttValue(window.ATL_SERVE,_Serve,0);
			parent._Att_1.Script_SetAttValue(window.ATL_ENERGY,_Energy,0);
			parent._Att_1.Script_SetAttValue(window.ATL_THEW,_Thew,0);
		}
		else
		{
			parent._Att_2.Script_SetAttValue(window.ATL_STRENGTH,_Power,0);
			parent._Att_2.Script_SetAttValue(window.ATL_SKILL,_Technic,0);
			parent._Att_2.Script_SetAttValue(window.ATL_FRONT,_Front,0);
			parent._Att_2.Script_SetAttValue(window.ATL_BACK,_Back,0);
			parent._Att_2.Script_SetAttValue(window.ATL_SERVE,_Serve,0);
			parent._Att_2.Script_SetAttValue(window.ATL_ENERGY,_Energy,0);
			parent._Att_2.Script_SetAttValue(window.ATL_THEW,_Thew,0);
		}

		//各类替换的百分比和角度
		var _needliliang = tofloat (_Power)/tofloat (6);
		var _needjiqiao = tofloat (_Technic)/tofloat(3*4);
		var _needfaqiu = tofloat (_Serve*3)/tofloat (2*9.33);
		var _qianchang = new T_ScriptFun{var xishu2 =tofloat( _Front)*0.0055;var xishu = 1.65+xishu2;var xishu3 = (3.3+xishu)/2;var xishu4 = xishu3*(-1);_qianchang = 2*window.tstatic.GetAngleOfThreePoint(xishu4,4.5,xishu3,4.5,0,-6.6);};
		var _houchang = new T_ScriptFun{var xishu2 = tofloat(_Back)*0.0055;var xishu = 1.65+xishu2;var xishu3 = (3.3+xishu)/2;var xishu4 = xishu3*(-1);_houchang = 2*window.tstatic.GetAngleOfThreePoint(xishu4,4.5,xishu3,4.5,0,-12);};
		
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

		s_Power.SetHangSrc(_liliangtip);
		s_Technic.SetHangSrc(_jiqiaotip);
		s_Front.SetHangSrc(_qianchangtip);
		s_Back.SetHangSrc(_houchangtip);
		s_Serve.SetHangSrc(_faqiutip);
	}
	

	//初始化变量
	void InitVar()
	{
		//男
		window.g_Row.InitByInt(window.M_G_GOODS,window.ROLEINFO,window.M_G_GOODS_ROLEINFO_ENTRYID,1);
		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-InitVar:DBname:"+window.M_G_GOODS+",TBName:"+window.ROLEINFO);
			printf("B# ERROR：数据库无此记录:1");
			return;
		}
		//DisplayID
		_Arr1[1] = window.g_Row.GetData(window.M_G_GOODS_ROLEINFO_DEFINEPART0);
		_Arr1[2] = window.g_Row.GetData(window.M_G_GOODS_ROLEINFO_DEFINEPART1);
		_Arr1[3] = window.g_Row.GetData(window.M_G_GOODS_ROLEINFO_DEFINEPART2);
		_Arr1[4] = window.g_Row.GetData(window.M_G_GOODS_ROLEINFO_DEFINEPART3);
		//_Arr1[5] = window.g_Row.GetData(window.M_G_GOODS_ROLEINFO_DEFINEPART5);
		//_Arr1[6] = window.g_Row.GetData(window.M_G_GOODS_ROLEINFO_DEFINEPART6);

		//女
		window.g_Row.InitByInt(window.M_G_GOODS,window.ROLEINFO,window.M_G_GOODS_ROLEINFO_ENTRYID,2);
		if (!window.g_Row.IsReady())
		{
			window.g_Row.Release();
			printf("B# error-InitVar:DBname:"+window.M_G_GOODS+",TBName:"+window.ROLEINFO);
			printf("B# ERROR：数据库无此记录:2");
			return;
		}
		//DisplayID
		_Arr2[1] = window.g_Row.GetData(window.M_G_GOODS_ROLEINFO_DEFINEPART0);
		_Arr2[2] = window.g_Row.GetData(window.M_G_GOODS_ROLEINFO_DEFINEPART1);
		_Arr2[3] = window.g_Row.GetData(window.M_G_GOODS_ROLEINFO_DEFINEPART2);
		_Arr2[4] = window.g_Row.GetData(window.M_G_GOODS_ROLEINFO_DEFINEPART3);
		//_Arr2[5] = window.g_Row.GetData(window.M_G_GOODS_ROLEINFO_DEFINEPART5);
		//_Arr2[6] = window.g_Row.GetData(window.M_G_GOODS_ROLEINFO_DEFINEPART6);

		window.g_Row.Release();
	}
	//================================DBList=========================================
	InitArr();
	InitVar();
	
	//发型
	var _List_1 = new VCreateRole_FreeList_Logic_1
	{
		name = "VCreateRole_FreeList_Logic_1";
		window.find("G_DBMANAGE").RegDbTable(this,window.M_G_GOODS,window.ITEMS,"Bind_VCreateRole_FreeList_Logic_1");// 绑定数据表
		void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);} //移除绑定
		void PageviewEnd() // 翻页结束后调用
		{
			checkselect(10,10);
		}
	}
	
	//容貌
	var _List_2 = new VCreateRole_FreeList_Logic_2
	{
		name = "VCreateRole_FreeList_Logic_2";
		window.find("G_DBMANAGE").RegDbTable(this,window.M_G_GOODS,window.ITEMS,"Bind_VCreateRole_FreeList_Logic_2");// 绑定数据表
		void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);} //移除绑定
		void PageviewEnd() // 翻页结束后调用
		{
			checkselect(10,10);
		}
	}
	//上装
	var _List_3 = new VCreateRole_FreeList_Logic_3
	{
		name = "VCreateRole_FreeList_Logic_3";
		window.find("G_DBMANAGE").RegDbTable(this,window.M_G_GOODS,window.ITEMS,"Bind_VCreateRole_FreeList_Logic_3");// 绑定数据表
		void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);} //移除绑定
		void PageviewEnd() // 翻页结束后调用
		{
			checkselect(10,10);
		}
	}
	//裙裤
	var _List_4 = new VCreateRole_FreeList_Logic_4
	{
		name = "VCreateRole_FreeList_Logic_4";
		window.find("G_DBMANAGE").RegDbTable(this,window.M_G_GOODS,window.ITEMS,"Bind_VCreateRole_FreeList_Logic_4");// 绑定数据表
		void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);} //移除绑定
		void PageviewEnd() // 翻页结束后调用
		{
			checkselect(10,10);
		}
	}

	void OnCreated()
	{
		Init2();
		SetEvent();
	}
};