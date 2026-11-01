//背包类定义
//yxf 2008年9月16日9:24

importex("$./ClassDef_DBList.gml");
importex("$./ClassDef_Attribute.gml");
importex("$./ClassDef_Clothing.gml");
importex("$./ClassDef_Hairdressing.gml");
importex("$./ClassDef_Jewelry.gml");
importex("$./ClassDef_Props.gml");
importex("$./ClassDef_Skill.gml");
importex("$./ClassDef_DeadProps.gml");

importex("$./../../UI/Pack/ClassDef.gml");

/*商城物品类型*/
/*
	商城物品的分类：
	其他0:如金钱，点券
	服饰
		|_____服装1: 上装0 裙/裤1 手套2 袜3 鞋4 球拍5
		|_____美容2: 头发0 五官1  
		|_____饰品3: 护腕/手链0 项链1 眼镜2 背饰3 附件4
	技能4：上旋0  削球1 扣杀2 放高球3 发球4
	道具5: 聊天工具0,辅助道具1
	属性6: 力量0,技巧1,前场2,后场3,发球4,能量5,体力6
	套装7: 
*/

class VPack_Logic item
{
	size = "70%,65%";pos(0,50);bgcolor = "#FF";alpha = 50;
	var m_UIIndex			= -1;	//主要 0服装，1美容，2饰品，3球拍，4技能，5道具,6属性
	//=============================与界面交互========================================
	void Init()
	{	
		//左右的Radio集合
		//顺序：服装,美容,饰品,球拍,技能,属性,道具
		staticvar s_R_All = new item
		{
			size = "500,30";bgcolor = "#FF";pos = "0,5";
			
			//初始化
			void InitMax(str,num)
			{
				var _arr = window.SplitStr2(str,",",num);

				var _index = 0;
				while (_index < num)
				{
					new text
					{
						var m_UIIndex = _index;		//正在索引
						src = _arr[m_UIIndex];font = "宋体,-1,24";color = "#FFFFFF";
						pos(m_UIIndex*60,0);
						void OnClick()
						{
							parent.parent.vml("OnCheckRadio"+m_UIIndex+"();");
						}
					} 
					_index += 1;
				}
			}
		}

		//关闭：按钮
		staticvar s_Btn_Close = new VMyButton
		{
			pos = "680,0";Init("X");size = "30,30";
		}
		//帮助：按钮
		staticvar s_Btn_Help = new VMyButton
		{
			pos(640,0);Init("？");size = "30,30";
		}

		//翻页：背包物品
		staticvar s_PageCtrl = new VMyPageCtrl
		{
			valign(100,0);halign(50,0);
		}
		
		//页数:edit
		staticvar s_Edit_Page = new edit
		{
			size = "100,26";pos="478,462";maxsize = 3;color = "#FFFFFF";cursorcolor = "#FFFFFF";
			//autoenter = "true";selectall = "true";
			font = "宋体,-1,30";xcenter = "true";
			bold = "true";onlynumber = "true"; 

			function OnInsertChar(c)
			{
				if (c=='-' || c=='.')
				{
					return false;
				}
				return true;
			}

			void OnEnter()
			{
				parent.JoinInputRoom();
			}
		}

		//Go：按钮
		staticvar s_Btn_Go = new VMyButton
		{
			pos="597,460";Init("GO");size = "30,30";
		}
	}
	inclass("VPack_UI");//界面显示类
	//==============================function=========================================
	//点击了关闭
	void OnClick_BtnClose()
	{
		parent.del();
	}
	
	//点击了服装
	void OnCheckRadio0()
	{
		ChangeType(0);
	}
	//点击了美容
	void OnCheckRadio1()
	{
		ChangeType(1);
	}
	//点击了饰品
	void OnCheckRadio2()
	{
		ChangeType(2);
	}
	//点击了球拍
	void OnCheckRadio3()
	{
		window.LMH1_Pack_Racket(); //引导事件
		ChangeType(3);
	}
	//点击了技能
	void OnCheckRadio4()
	{
		window.LMH1_Pack_Skill();	//引导事件
		ChangeType(4);
		window.OnClick_PackSkill_SetState();
	}
	//点击了属性
	void OnCheckRadio5()
	{
		window.LMH1_Pack_Attribute();	//引导事件
		ChangeType(6);
	}
	//点击了道具
	void OnCheckRadio6()
	{
		ChangeType(5);
	}
	//点击了过期道具
	void OnCheckRadio7()
	{
		ChangeType(7);
	}
	// add by chenjihui
	// 2011-1-5
	// 点击了续费车
	void OnClick_ChargeCar()
	{
//		alert("charge-car!!!");
//		window.g_MyItemsCheck.HandsCheckItemDeadLine();
//		window.PropContinue(m_itemIds,m_items,m_Type,m_entryID);
//		if ( window.CheckCanOpenMallDlg() == 0 ) return;
//		window.find("ChargeCarRecord").ClearSelect();
//		window.find("ChargeCarRecord").SelectBySex(window.GetMySex(),1,0);
//		window.SetMallVar(window.MALL_OPT_BUY);
		window.g_MyItemsCheck.CheckChargeItemDeadLine();
		window.find("UIController").LoadUI("UI_MALL_CHARGECAR");
//window.find("UIController").LoadUI("UI_MALL_BUYCAR");
	}
	//点击了Go
	void OnClick_Go()
	{
		var _page = toint(s_Edit_Page.src);
		if (_page <= 0 || _page == "" || _page > s_PageCtrl.m_AllPage)
		{
			window.find("UIController").LoadDLG(390);//无效的页数
			return;
		}
		s_PageCtrl.setpageto(_page);
	}
	
	//模拟选中
	//参数 index : 0-6
	void Check_UnCheck(index)
	{
		s_R_All.find("BtnName_Pack_Clothing").UnCheck();
		s_R_All.find("BtnName_Pack_Hairdressing").UnCheck();
		s_R_All.find("BtnName_Pack_Jewelry").UnCheck();
		s_R_All.find("BtnName_Pack_Racket").UnCheck();
		s_R_All.find("BtnName_Pack_Skill").UnCheck();
		s_R_All.find("BtnName_Pack_Attribute").UnCheck();
		s_R_All.find("BtnName_Pack_Props").UnCheck();

		switch (index)
		{
		case 0:s_R_All.find("BtnName_Pack_Clothing").Check();break;
		case 1:s_R_All.find("BtnName_Pack_Hairdressing").Check();break;
		case 2:s_R_All.find("BtnName_Pack_Jewelry").Check();break;
		case 3:s_R_All.find("BtnName_Pack_Racket").Check();break;
		case 4:s_R_All.find("BtnName_Pack_Skill").Check();break;
		case 5:s_R_All.find("BtnName_Pack_Attribute").Check();break;
		case 6:s_R_All.find("BtnName_Pack_Props").Check();break;
		}
	}
	//初始化显示：所有都隐藏
	void InitShow()
	{
		m_Class_Clothing.show = false;
		m_Class_Hairdressing.show = false;
		m_Class_Jewelry.show = false;
		m_Class_Skill.show = false;
		m_Class_Attribute.show = false;
		m_Class_Props.show = false;
		m_Class_DeadProps.show = false;
	}
	void InitPageCtr( state )
	{
		if ( state == 1)
		{
			topage.show=true; 
			topage1.show=true; 
			s_Edit_Page.show=true; 
			jumpedit.show=true; 
			s_Btn_Go.show=true;
			s_PageCtrl.show=true; 
		}
		if ( state == 0)
		{
			topage.show=false; 
			topage1.show=false; 
			s_Edit_Page.show=false; 
			jumpedit.show=false; 
			s_Btn_Go.show=false;
			s_PageCtrl.show=false; 
		}
		
	}
	//切换选项卡
	//主要 0服装，1美容，2饰品，3球拍，4技能，5道具,6属性
	void ChangeType(type)
	{
		m_UIIndex = type;
		InitShow();
		switch (type)
		{
			case 0:{m_Class_Clothing.show = true; m_Class_DeadProps.s_btn_rebuy.SetState(window.BTN_STATE_GREY);InitPageCtr(1);break;}
			case 1:{m_Class_Hairdressing.show = true; m_Class_DeadProps.s_btn_rebuy.SetState(window.BTN_STATE_GREY);InitPageCtr(1);break;}
			case 2:{m_Class_Jewelry.show = true; m_Class_DeadProps.s_btn_rebuy.SetState(window.BTN_STATE_GREY);InitPageCtr(1);break;}
			case 3:{ m_Class_DeadProps.s_btn_rebuy.SetState(window.BTN_STATE_GREY);InitPageCtr(1);break;}
			case 4:{m_Class_Skill.show = true; m_Class_DeadProps.s_btn_rebuy.SetState(window.BTN_STATE_GREY);InitPageCtr(1);break;}
			case 6:{m_Class_Attribute.show = true; m_Class_DeadProps.s_btn_rebuy.SetState(window.BTN_STATE_GREY);InitPageCtr(1);break;}
			case 5:{m_Class_Props.show = true; m_Class_DeadProps.s_btn_rebuy.SetState(window.BTN_STATE_GREY);InitPageCtr(1);break;}
			case 7:{m_Class_DeadProps.show = true; m_Class_DeadProps.s_btn_rebuy.SetState(window.BTN_STATE_GREY);InitPageCtr(0);break;}
		}

		OnMySelect();
	}
	
	//设置响应事件
	void SetEvent()
	{
		set s_R_All
		{
			SetRadioName("BtnName_Pack_Clothing,BtnName_Pack_Hairdressing,BtnName_Pack_Jewelry,BtnName_Pack_Racket,BtnName_Pack_Skill,BtnName_Pack_Attribute,BtnName_Pack_Props");
			InitMax("服装,美容,饰品,球拍,技能,属性,道具,过期物品",8,"PackRadio");
			name = "BtnName_Pack_";
		}
	
		set s_Btn_Close
		{
			void OnPressed(){parent.OnClick_BtnClose();}
		}
		set s_Btn_Help
		{
			void OnPressed(){window.CallBack_Help(window.POS_PACK,parent.m_TypeIndex);}
		}
		// add by chenjihui
		// 2011-1-5
//		set s_Btn_ChargeCar
//		{
//			void OnPressed(){if(GetState()==window.BTN_STATE_GREY){return;}parent.OnClick_ChargeCar();}
//		}
		set s_Btn_Go
		{
			void OnPressed(){parent.OnClick_Go();}
		}
		set s_PageCtrl//翻页：背包物品
		{
			targetname="VPack_DBList_Logic_NAME";
			countperpage = 10;
			window.find("G_DBMANAGE").GetRegDbTable(this,"Bind_VPack_DBList_Logic");// 获得已绑定的数据表
		}
	}

	//生成一些成员变量
	void NewSubObj()
	{
		//服装类
		staticvar m_Class_Clothing = new VPack_Clothing_Logic{};

		//美容类
		staticvar m_Class_Hairdressing = new VPack_Hairdressing_Logic{};

		//饰品类
		staticvar m_Class_Jewelry = new VPack_Jewelry_Logic{};

		//技能类
		staticvar m_Class_Skill = new VPack_Skill_Logic{};

		//属性类
		staticvar m_Class_Attribute = new VPack_Attribute_Logic{};

		//道具类
		staticvar m_Class_Props = new VPack_Props_Logic{};

		//过期续费
		staticvar m_Class_DeadProps = new VPack_DeadProps_Logic{};
	}

	//================================DBList=========================================
	//主要的索引
	void OnMySelect(_index)
	{
		//if (_index != m_UIIndex) return;
		//主要 0服装，1美容，2饰品，3球拍，4技能，5道具,6属性
		var _Class = 0;		//主类别 1服装，2美容，3饰品，105球拍，4技能，5属性，6道具
		var _SubClass = 0;	//子类别 
		var _SQL_CLASS		= "";	//Class 部分的SQL语句
		var _SQL_CLASSALL	= "";	//所有的此类情况
		var _SQL_ODERBY = "cid";//排序方式
		switch (m_UIIndex)  //0服装，1美容，2饰品，3球拍，4技能，5属性，6道具
		{
			case 0:
			{
				_Class = 1;_SubClass = m_Class_Clothing.m_ClothingIndex;
				_SQL_CLASSALL = "packId>=100 AND packId<=104";
				break;
			}
			case 1:
			{
				_Class = 2;_SubClass = m_Class_Hairdressing.m_HairdressingIndex;
				_SQL_CLASSALL = "packId>=200 AND packId<=201";
				break;
			}
			case 2:
			{
				_Class = 3;_SubClass = m_Class_Jewelry.m_JewelryIndex;
				_SQL_CLASSALL = "packId>=300 AND packId<=304";
				break;
			}
			case 3:
			{
				_Class = 1;_SubClass = 5;
				break;
			}
			case 4:
			{
				_Class = 4;_SubClass = m_Class_Skill.m_SkillIndex;
				_SQL_CLASSALL = "packId>=400 AND packId<=405";
				break;
			}
			case 5:
			{
				_Class = 5;_SubClass = m_Class_Props.m_PropsIndex;
				_SQL_CLASSALL = "packId>=500 AND packId<=599";
				break;
			}
			case 6:
			{
				_Class = 6;_SubClass = m_Class_Attribute.m_AttributeIndex;
				_SQL_CLASSALL = "packId>=600 AND packId<=606";
				break;
			}
			case 7:
			{
				_Class = 90;_SubClass = m_Class_DeadProps.m_DeadPropsIndex;
				_SQL_ODERBY = "Deadline";
				_SQL_CLASSALL = "packId==9000 ";
				break;
			}
		}
		
		if (_SubClass == -1)
			_SQL_CLASS = _SQL_CLASSALL;
		else
			_SQL_CLASS = "packId="+(toint(_Class)*100 + toint(_SubClass));

		var _SQL = "SELECT * FROM playerItems WHERE state=1 AND num>0 AND "+_SQL_CLASS+" AND ownerid="+window.GetMyUID()+" ORDER BY "+_SQL_ODERBY;
		printf("D# 背包SQL:"+_SQL+"\n");
		window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VPack_DBList_Logic",window.M_G_GOODS,_SQL);

		s_PageCtrl.setpageto(1);//强制翻到第一页
	}

	var _PackList = new VPack_DBList_Logic
	{
		name = "VPack_DBList_Logic_NAME";
	
		window.find("G_DBMANAGE").RegDbTable(this,window.M_G_GOODS,window.PLAYERITEMS,"Bind_VPack_DBList_Logic");// 绑定数据表
		
		void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);} //移除绑定

		void PageviewEnd() // 翻页结束后调用
		{
			//printf("B# 背包-服饰物品列表，PageviewEnd\n");
		}

		//[功能]得到当前选中项的主键
		void GetCurrSelectData()
		{
			var _irow = curselectrow();
			var _gid = fieldstr(_irow,window.M_G_GOODS_PLAYERITEMS_GID);
			return _gid
		}
	}
	// 刷新续费按钮状态
	// chenjihui 2011-1-14
	void refreshChargeCarButton()
	{
		if (window.g_IsEmpty == 0)
		{
			s_Btn_ChargeCar.SetFlicker(1);
		}
		else
		{
			s_Btn_ChargeCar.SetState(window.BTN_STATE_GREY);
		}
	}

	void OnCreated()
	{
		Init();
		SetEvent();
		NewSubObj();

		
//		refreshChargeCarButton();

		// chenjihui 2011-1-8
		if (window.g_IsEmpty == 0)
		{
			s_Btn_ChargeCar.SetFlicker(1);
		}
		else
		{
			s_Btn_ChargeCar.SetState(window.BTN_STATE_GREY);
		}

	}
};