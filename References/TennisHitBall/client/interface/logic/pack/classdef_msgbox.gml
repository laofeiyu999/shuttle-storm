//背包界面的提示框
//yxf 2008年11月13日

//确定要删除此物品吗？
class VMB_PackSellItem_Logic VMyMessageBox_2_Logic
{
	name = "VMB_PackSellItem_Logic";
	
	//construct
	function VMB_PackSellItem_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		//发出卖出物品的消息
		//参数：物品唯一id(-1)，物品识别id,装备位置(0卸下 1装上),角色唯一id,角色索引
		if (window.g_Pack_SellItem != "")
		{
			window.Too_SellItem(window.g_Pack_SellItem);
			window.g_Pack_SellItem = "";	
		}
		del();
	}
};

//确定要将技能X1替换成技能X2吗？
class VMB_SkillMosaic_Logic VMyMessageBox_2_Logic
{
	name = "VMB_SkillMosaic_Logic";
	
	//construct
	function VMB_SkillMosaic_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		if (window.g_CurrSelectRackeGID != 0 && window.g_SkillEnterID != 0)
		{
			//发出镶嵌物品的消息 
			//参数：被镶嵌物品唯一id,镶嵌物品唯一id(可叠加物品-1)，镶嵌物品识别id,镶嵌位置(-1为默认位置)
			var _Param = ""+window.g_CurrSelectRackeGID+",-1,"+window.g_SkillEnterID+",-1";
			window.Too_InlayItem(_Param);

		}
		del();
	}
};
//改名中……
//add by chenjihui
class VMB_NameCardChanging_Logic VMyMessageBox_1_Logic
{
	var countTime = -1;
	var start = 0;
	name = "VMB_NameCardChanging_Logic";
		//================================与显示交互=============================
	window.find("NAME_GCMap").KeyBoardEnable(0);//0锁定解锁按键 1解除锁定
	
	function VMB_NameCardChanging_Logic(id)
	{
		VMyMessageBox_1_Logic(id);
	}
	void GetSrc()
	{
		return _Box.s_Text_Cue.src;
	}

	set _Box
	{
		void Init()
		{
			staticvar s_BG = new VUIBG_UI
			{
				size = "308,208";
				halign(50,0);valign(50,0);
				SetTitalPos("25,0");
				InitBG("$./imgs"+window.g_Sex+"/tsxx.tga");
				new VPic9_BK2_UI
				{
					size(parent.width-30,150);pos = "13,30";
				}
			}
			staticvar s_Text_Cue = new BaseText
			{
				halign(50,-1);valign(50,-19);
				size = "275,102";autoenter = true;
				//bgcolor ="#FF";alpha = 50;
				
				void SetData(data1)
				{
					if (data1.Count <= 36)
					{
						xcenter = true;ycenter = true;
						src = data1;
					}
					else
					{
						src = "    "+data1;xcenter = false;ycenter = true;
					}
				}
			}
		}
		HideAllObj();
		inclass("VMB_NameCard_Changing_UI");//界面显示类
		Init();
	}
	
	//屏蔽ESC与ENTER键
	void DI_ShortcutKey(data)
	{
	}
};

//确定要将现在昵称XXX改为XXX吗
class VMB_ConfirmChangeName_Logic VMyMessageBox_2_Logic
{
	name = "VMB_ConfirmChangeName_Logic";
	
	//construct
	function VMB_ConfirmChangeName_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		window.find("UIController").LoadDLG(854);//改名中……
		window.find("DLGLAYER").find("VMB_NameCardChanging_Logic").ReplaceData("\n,\n");
		del();
	}
};
//改名卡
class VMB_ChangeNameCard_Logic VMyMessageBox_2_Logic
{
	name = "VMB_ChangeNameCard_Logic";
	var m_ID = 0;
	window.find("NAME_GCMap").KeyBoardEnable(0);//0锁定解锁按键 1解除锁定
	//construct
	function VMB_ChangeNameCard_Logic(id)
	{
		m_ID = id;
		VMyMessageBox_2_Logic(id);
	}
	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		var _NKName = GetSrc();

		if (m_ID == 807)
		{
			if (!_Box.checkNamelong()){return;}
			if (_Box.checkName() == 0){return;}
			window.find("UIController").LoadDLG(855);//二级确认框
			window.find("DLGLAYER").find("VMB_ConfirmChangeName_Logic").ReplaceData(window.g_MyName+","+_NKName);
			//改名消息参数
			window.g_cardtype = window.CHANGENAMECARD_ID;
			window.g_nkName = _NKName;
//			window.DclickChangeName(window.CHANGENAMECARD_ID,_NKName);
		}
		
		if (m_ID == 808)
		{
			if ( !window.haveFamilyState())
			{
				_Box.s_NameCheckResult.notinfamily();
				return ;
			}
			if (!_Box.checkFamilyNameLong()){return;}
			if (_Box.checkFamilyName()==0){return;}
			window.find("UIController").LoadDLG(855);//二级确认框
			window.find("DLGLAYER").find("VMB_ConfirmChangeName_Logic").ReplaceData(window.GetFamilyName()+","+_NKName);
			//改名消息参数
			window.g_cardtype = window.FAMILYCHANGENAMECARD_ID;
			window.g_nkName = _NKName;
//			window.DclickChangeName(window.FAMILYCHANGENAMECARD_ID,_NKName);
		}
	}	
	
	//得到输入框的内容
	void GetSrc()
	{
		return _Box.s_Edit.GetEditContent().src;
	}
	set _Box
	{
		void Init()
		{
			//昵称输入框
			staticvar s_Edit = new edit
			{
				valign(50,0);halign(50,0);
				color = "#ffffff";bgcolor = "#FF";
				size = "200,50";maxsize = 10;hot = 1;
			}
			//确定按钮
			staticvar s_Btn_Confirm = new VMyButton
			{
				Init("L加");valign(96,0);halign(15,0);
			}
			//取消按钮
			staticvar s_Btn_Cancel = new VMyButton
			{
				Init("L不加");valign(96,0);halign(95,0);
			}
		}
		HideAllObj();
		inclass("VMB_ChangeNameCard_UI");//界面显示类
		Init();


		void JudgeAnyNameLicit(namestr,tipParam)
		{
			if (window.g_CStrFilter.Filter2(namestr) == 0)//判断是否是打印字符
			{
				s_NameCheckResult.JudgeAnyName(0,tipParam);
				return -1;
			}
			if (window.g_DirtyFilter_Name.IsDirty(namestr))
			{
				s_NameCheckResult.JudgeAnyName(1,tipParam);
				return -2;
			}
			return 1;
		}
		void checkNameLong()
		{
			var _NKName =  s_Edit.GetEditContent();
			if (_NKName.Count < 4 || _NKName.Count > 12)
			{
				s_NameCheckResult.shownamenolonger();//昵称长度应在4-12字符之间。
				return false;
			}
			return true;
		}
		void checkName()
		{
			s_NameCheckResult.show = true;
			var _editContent = s_Edit.GetEditContent();
			if(_editContent == "")
			{
				s_NameCheckResult.showEditContentNullInfo();
				return false;
			}
			if (JudgeAnyNameLicit(_editContent,"昵称") < 0){return false;}
			else
			{
				var param = ""+window.GetMyUID()+","+_editContent;
				window.Tos_CheckModifyUserNick(param); 
			}
			return true;
		}
		

		void checkFamilyNameLong()
		{
			var _editContent = s_Edit.GetEditContent();
			if(_editContent.Count < 6)
			{
				s_NameCheckResult.shownamenolongerF();
				return false;
			}
			return true;
		}

		//[功能]名称检测 检测家族是否可用
		//[参数]无
		//[返回值]无
		void checkFamilyName()
		{
			if ( !window.haveFamilyState())
			{
				s_NameCheckResult.notinfamily();
				return false;
			}
			s_NameCheckResult.show = true;
			var _editContent = s_Edit.GetEditContent();
			if(_editContent == "")
			{
				s_NameCheckResult.showEditContentNullInfo();
				return false;
			}
			if(JudgeAnyNameLicit(_editContent,"家族名称")<0){return false;}
			else
			{
				window.F_Family_checkname(_editContent);
			}
			return true;
		}

		
		void SetEvent2()
		{
			set s_Btn_NameCheck
			{
				void OnPressed()
				{
					if (parent.checkNameLong())
					{
						parent.checkName();
					}
				}
			}
		}
		void SetEvent3()
		{
			set s_Btn_NameCheck
			{
				void OnPressed()
				{
					if (parent.checkFamilyNameLong())
					{
						parent.checkFamilyName();
					}
				}
			}
		}


		SetEvent();
		SetEvent2();
	}

	void OnCreated_EX()
	{
		if (m_ID == 808)
		{
			_Box.s_Edit.maxsize = 16;
			_Box.ChangeTitle2();
			_Box._inputtext._input2();
			_Box.SetEvent3();
		}
		//SetEvent();
	}

	void DelKeyboardEnable()
	{
		window.find("NAME_GCMap").KeyBoardEnable(1);//0锁定解锁按键 1解除锁定
	}
	void OnCancel()
	{
		DelKeyboardEnable();
		del();
	}
};
//点击订婚戒指
class VMB_EngagementRing_Logic VMyMessageBox_2_Logic
{
	name = "VMB_EngagementRing_Logic";
	var m_EnterID = 0;
	window.find("NAME_GCMap").KeyBoardEnable(0);//0锁定解锁按键 1解除锁定
	//construct
	function VMB_EngagementRing_Logic(id)
	{
		
		VMyMessageBox_2_Logic(id);
	}

	void SetData(_enterID)
	{
		m_EnterID = _enterID;
	}
	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		var _NKName = GetSrc();
		if (_NKName.Count == 0)
		{
			window.find("NAME_GCMap").KeyBoardEnable(1);//0锁定解锁按键 1解除锁定
			window.find("UIController").LoadDLG(237);//昵称长度应在4-12字符之间。
			return;
		}
		else if (_NKName.Count < 4 || _NKName.Count > 12)
		{
			window.find("NAME_GCMap").KeyBoardEnable(1);//0锁定解锁按键 1解除锁定
			window.find("UIController").LoadDLG(331);//昵称长度应在4-12字符之间。
			_Box.s_Edit.hot = 1;
			return;
		}
		else if (_NKName == window.GetMyName())
		{
			window.find("NAME_GCMap").KeyBoardEnable(1);//0锁定解锁按键 1解除锁定
			window.find("UIController").LoadDLG(832);//不能和自己订婚。  add by chenjihui
			return;
		}
		var _res = window.JudgeAnyNameLicit(_NKName,"昵称");
		if (_res < 0)
		{
			window.find("NAME_GCMap").KeyBoardEnable(1);//0锁定解锁按键 1解除锁定
			_Box.s_Edit.hot = 1;
			return;
		}
//		window.Tos_EngagementRingUserNick(_NKName);
		window.OnClick_ToBeLover(_NKName,m_EnterID);
		window.find("NAME_GCMap").KeyBoardEnable(1);//0锁定解锁按键 1解除锁定
		del();
	}	
	void OnCancel()
	{
		window.find("NAME_GCMap").KeyBoardEnable(1);//0锁定解锁按键 1解除锁定
		del();
	}	
	//得到输入框的内容
	void GetSrc()
	{
		return _Box.s_Edit.src;
	}
	set _Box
	{
		void Init()
		{
			//昵称输入框
			staticvar s_Edit = new edit
			{
				valign(50,0);halign(50,0);
				color = "#ffffff";bgcolor = "#FF";
				size = "200,50";maxsize = 10;hot = 1;
			}
			//确定按钮
			staticvar s_Btn_Confirm = new VMyButton
			{
				Init("L加");valign(96,0);halign(15,0);
			}
			//取消按钮
			staticvar s_Btn_Cancel = new VMyButton
			{
				Init("L不加");valign(96,0);halign(95,0);
			}
		}

		HideAllObj();
		inclass("VMB_Engagementring_UI");//界面显示类
		Init();
		SetEvent();
	}
};
// add by chenjihui
// 2010-12-29
// 双击变质糖果
class VMB_EateCandyOrNot_Logic VMyMessageBox_2_Logic
{
	name = "VMB_EateCandyOrNot_Logic";
	var m_EntryID = 0;

	window.g_Row.Release();

	//construct
	function VMB_EateCandyOrNot_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		var _param = ""+m_EntryID+",1";
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_SHOP,"UseGoods",_param);
		window.find("UIController").UserRequest(window.GAMEUI,window.REQUEST_SHOP,"UseGoodsFinish",_param);

		del();
	}

	//点击取消按钮或者敲回车时调用-继承时需要被覆盖
	void OnCancel()
	{
		window.g_Row.InitByInt(window.GAME,window.USEODDSITEM,window.GAME_USEODDSITEM_CID,m_EntryID);
		var _cancelID = window.g_Row.GetData(window.GAME_USEODDSITEM_CANCELDIALOG);
		window.find("UIController").LoadDLG(toint(_cancelID));
		del();
	}

	set _Box
	{
		void Init()
		{	
			//对话框内容
			staticvar s_Text_Cue = new VMyText
			{
				valign(50,0);halign(50,0);
				color = "#ffffff";
			}
			//吃糖果：按钮
			staticvar s_Btn_Confirm = new VMyButton
			{
				Init("把它吃掉");valign(96,0);halign(15,0);
			}
			//不吃：按钮
			staticvar s_Btn_Cancel = new VMyButton
			{
				Init("还是算了吧");valign(96,0);halign(95,0);
			}
		}
		HideAllObj();
		inclass("VMB_EateCandyOrNot_UI");//界面显示类
		Init();
		SetEvent();
	}
};


//PACK续费提示
class VMB_PackPropCtn_Logic VMyMessageBox_2_Logic
{
	name = "VMB_PackPropCtn_Logic";
	var m_entryID = 0;

	function VMB_PackPropCtn_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}

	void SetItemIds(_entryID)
	{
		m_entryID = _entryID;
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		var _Param = ""+m_entryID+",1,0";
		var _DeadORLive = window.CheckPackItemDeadLineByEntryID(window.g_agioEntry_ID);//判断背包中是否有打折卡并且是否能用
		if (_DeadORLive>0)
		{
			window.Too_BuyItem(_Param+",-1,"+window.g_agioEntry_ID);
		}
		else
			window.Too_BuyItem(_Param);
		del();
	}

	void OnCancel()
	{
		del();
	}
}
