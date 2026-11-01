//添加好友+添加黑名单 的弹出框
//yxf 2008年10月16日

//添加好友
class VMB_AddFriend_Logic VMyMessageBox_2_Logic
{
	name = "VMB_AddFriend_Logic";
	var m_ID = 0;
	//construct
	function VMB_AddFriend_Logic(id)
	{
		m_ID = id;
		VMyMessageBox_2_Logic(id);
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		var _NKName = GetSrc();
		if (_NKName.Count < 4 || _NKName.Count > 12)
		{
			window.find("UIController").LoadDLG(331);//昵称长度应在4-12字符之间。
			_Box.s_Edit.hot = 1;
			return;
		}
		var _res = window.JudgeAnyNameLicit(_NKName,"昵称");
		if (_res < 0)
		{
			_Box.s_Edit.hot = 1;
			return;
		}
		if (m_ID == 81)
		{
			window.AddFriend(_NKName);
		}
		if (m_ID == 82)
		{
			window.AddBlacklist(_NKName);
		}
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
		inclass("VMB_AddFriend_UI");//界面显示类
		Init();
		SetEvent();
	}

	void OnCreated_EX()
	{
		if (m_ID == 82)
		{
			_Box.ChangeTitle();
		}
	}
};
//您确定要与[%0]成为情侣吗，消耗%1定情信物x %2
class VMB_UseLoveItem_Logic VMyMessageBox_2_Logic
{
	name = "VMB_UseLoveItem_Logic";

	//construct
	function VMB_UseLoveItem_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}
	
	//记下参数
	var m_ItemID = 0;	//消耗的物品ID
	//var m_UID = 0;		//被操作者UID
	var m_UName = 0;		//被操作者UID
	void SetParam(_itemid,_uname)
	{
		m_ItemID = _itemid;
//		m_UID = _uid;
		m_UName = _uname;
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		//消耗物品
//		window.Too_RelationUseItem(""+m_ItemID+",1,"+m_UID);
		window.Too_BecameLover(""+m_ItemID+",1,"+m_UName);
		//邀请成为情侣
//		window.Tos_RelationInvite(""+window.RELATION_LOVER+","+window.RELATION_OPT_LOVER+","+m_UID);
		del();
	}
};

//你想把这枚戒指送给你的情侣，重温浪漫吗？
class VMB_BecomeLoverAgain_Logic VMyMessageBox_2_Logic
{
	name = "VMB_BecomeLoverAgain_Logic";

	//construct
	function VMB_BecomeLoverAgain_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}
	
	//记下参数
	var m_ItemID = 0;	//消耗的物品ID
	var m_UName = 0;		//被操作者UID
	void SetParam(_itemid,_uname)
	{
		m_ItemID = _itemid;
		m_UName = _uname;
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		//消耗物品
		window.Too_BecameLover(""+m_ItemID+",1,"+m_UName);
		del();
	}
};

//解除情侣关系需要花费%0%1，确定要与[%2]解除情侣关系吗？
class VMB_PartLover_Logic VMyMessageBox_2_Logic
{
	name = "VMB_PartLover_Logic";

	//construct
	function VMB_PartLover_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}
	
	//记下参数
	var m_UID = 0;		//被操作者UID
	void SetParam(_uid)
	{
		m_UID = _uid;
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		//使用金币的取消情侣
		window.Tos_RelationInvite(""+window.RELATION_LOVER+","+window.RELATION_OPT_DELLOVER+","+m_UID);
		del();
	}
};

//您确定要与[%0]解除情侣关系吗？ 一旦解除无法恢复，消耗“%1”x%2
class VMB_ForcePartLover_Logic VMyMessageBox_2_Logic
{
	name = "VMB_ForcePartLover_Logic";

	//construct
	function VMB_ForcePartLover_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}
	
	//记下参数
//	var m_ItemID = 0;	//消耗的物品ID
	var m_UID = 0;		//被操作者UID
	void SetParam(_uid)
	{
//		m_ItemID = _itemid;
		m_UID = _uid;
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
//		//消耗物品
//		window.Too_RelationUseItem(""+m_ItemID+",1,"+m_UID);
		//取消情侣关系
		window.Tos_CancelRelation(""+window.RELATION_LOVER+","+m_UID);
		del();
	}
};

//情侣升级需要%0，是否立刻去商城购买？
class VMB_UpLvLover_Logic VMyMessageBox_2_Logic
{
	name = "VMB_UpLvLover_Logic";
	var _itemid = 0;
	//construct
	function VMB_UpLvLover_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}
	
	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		//发出购买的消息
		//新新参数：iEntryId,iNum,iLimitDayField,iToUserId,iToUserSex,szToUserName,szTitle,szToMsg
		var _Param = ""+_itemid+",1,0";
		var _DeadORLive = window.CheckPackItemDeadLineByEntryID(window.g_agioEntry_ID);//判断背包中是否有打折卡并且是否能用
		if (_DeadORLive>0)
		{
			window.Too_BuyItem(_Param+",-1,"+window.g_agioEntry_ID);
		}
		else
			window.Too_BuyItem(_Param);
		del();
	}
};

//您确定要升级情侣关系吗，消耗%0 x%1
class VMB_UpLvLoverUseItem_Logic VMyMessageBox_2_Logic
{
	name = "VMB_UpLvLoverUseItem_Logic";

	//construct
	function VMB_UpLvLoverUseItem_Logic(id)
	{
		VMyMessageBox_2_Logic(id);
	}
	
	//记下参数
	var m_ItemID = 0;
	void SetParam(itemid)
	{
		m_ItemID = itemid;
	}

	//点击确定按钮或者敲回车时调用-继承时需要被覆盖
	void OnConfirm()
	{
		//消耗物品
		window.Too_RelationUseItem(""+m_ItemID+",1,"+window.GetCurrLoverUID());
		del();
	}
};

