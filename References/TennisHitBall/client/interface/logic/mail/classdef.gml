//
//邮件界面的逻辑类定义
//

importex("$./ClassDef_DBList.gml");
importex("$./../../UI/Mail/ClassDef.gml");

class VMail_Logic item
{
	size = "70%,65%";pos(0,50);bgcolor = "#F0F0";alpha = 50;

	//=============================与界面交互========================================
	void Init()
	{
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
		
		//复选框：全部选择
		staticvar s_CHK_AllChoose = new VMyCheckBox
		{
			size = "30,30";pos="16,412";Init("全");
		}

		//翻页：邮件
		staticvar s_PageCtrl = new VMyPageCtrl
		{
			valign(90,0);halign(50,0);
		}

		//回复：按钮
		staticvar s_Btn_WriteBack = new VMyButton
		{
			Init("回复");valign(100,0);halign(20,0);
		}
		//添加好友：按钮
		staticvar s_Btn_Add_Friend = new VMyButton
		{
			Init("加为好友");valign(100,0);halign(0,0);
		}
		//删除：按钮
		staticvar s_Btn_Del = new VMyButton
		{
			Init("删除");valign(100,0);halign(40,0);
		}
		//写邮件：按钮
		staticvar s_Btn_WriteMail = new VMyButton
		{
			Init("写邮件");valign(100,0);halign(80,0);
		}
		//接收：按钮
		staticvar s_Btn_Receive = new VMyButton
		{
			Init("接收");valign(100,0);halign(100,0);
		}
		//删除单个：按钮
		staticvar s_Btn_DelSingle= new VMyButton
		{
			Init("单个");
			pos="534,242";
		}

		//留言内容
		//参数 data1:
		staticvar s_Message = new VMyText
		{
			pos="494,41";size = "215,245";bgcolor = "#FF";src = "留言内容";autoenter = true;
		}

		//图标
		//参数 data1: 物品的识别ID
		//参数 data2: 物品的赠送ID
		staticvar s_GID = new VMyText{pos="461,305";src = "图标ID:";}

		//物品描述
		//参数 sendName：谁送你的
		//参数 ItemName：什么东西
		//参数 time：多少天后消失
		staticvar s_Desc = new VMyText
		{
			pos="574,313";src = "物品描述";size = "100,100";autoenter = true;
		}
	}
	inclass("VMail_UI");//界面显示类
	//==============================function=========================================
	//点击了关闭
	void OnClick_BtnClose()
	{
		parent.del();
	}
	
	//点击了删除-单个
	void OnClick_BtnDelSingle()
	{
		var _Row = _MailList.curselectrow();
		var _GID = _MailList.fieldstr(_Row,window.M_G_GOODS_ITEMPRESENT_ENTRYID); //赠送iD
		
		var _dlgid = 411;	//确定要删除该邮件吗？
		if (window.GetUnReceiveGoodsNum(_GID,window.MAIL_UNSELECT) > 0)
		{
			_dlgid = 412;	//还有物品未接收，确定要删除该邮件吗？
		}
		window.find("UIController").LoadDLG(_dlgid); 
		window.find("DLGLAYER").find("VMyMB_DelMail_Logic").SetType(window.MAIL_DEL_SINGLE);
	}

	//确定删除-单个
	void OnConfirm_BtnDelSingle()
	{
		var _Row = _MailList.curselectrow();
		var _GID = _MailList.fieldstr(_Row,window.M_G_GOODS_ITEMPRESENT_ENTRYID); //赠送iD

		//var _Param = ""+_GID+","+window.MAIL_DEL;
		//发出设置赠送物品记录状态的消息：赠送物品记录id,状态(可不传,默认为已查收)(1:已读 2:删除)
		//window.Too_SetPresentState(_Param);	

		window.DelMail(_GID);//作假

		UpDataMail();
	}
	//点击了添加好友按钮
	void OnClick_BtnAddSelect()
	{
		var _Row = _MailList.curselectrow();
		var _name = _MailList.fieldstr(_Row,window.M_G_GOODS_ITEMPRESENT_SENDUSER);
		window.AddFriend(_name);
		//alert(_name);
	}

	//点击了删除-选中
	void OnClick_BtnDelSelect()
	{
		var _dlgid = 413;	//确定要删除选中邮件吗？
		if (window.GetUnReceiveGoodsNum(window.MAIL_ALLMAIL,window.MAIL_SELECT) > 0)
		{
			_dlgid = 414;	//还有物品未接收，确定要删除选中邮件吗？
		}
		window.find("UIController").LoadDLG(_dlgid); 
		window.find("DLGLAYER").find("VMyMB_DelMail_Logic").SetType(window.MAIL_DEL_SELECT);
	}
	//确定删除-选中
	void OnConfirm_BtnDelSelect()
	{
		window.DelMail(window.MAIL_ALLMAIL,window.MAIL_SELECT);//作假

		UpDataMail();
	}

	//点击了全部删除
	void OnClick_DelAll()
	{
		var _dlgid = 415;	//确定要删除全部邮件吗？
		if (window.GetUnReceiveGoodsNum(window.MAIL_ALLMAIL,window.MAIL_SELECT) > 0)
		{
			_dlgid = 416;	//还有物品未接收，确定要删除全部邮件吗？
		}
		window.find("UIController").LoadDLG(_dlgid); 
		window.find("DLGLAYER").find("VMyMB_DelMail_Logic").SetType(window.MAIL_DEL_ALL);
	}

	//确定全部删除
	void OnConfirm_DelAll()
	{
		//var _Param = ""+window.MAIL_ALLMAIL+","+window.MAIL_DEL;
		//发出设置赠送物品记录状态的消息：赠送物品记录id,状态(可不传,默认为已查收)(1:已读 2:删除)
		//window.Too_SetPresentState(_Param);	

		window.DelMail(window.MAIL_ALLMAIL);//作假

		UpDataMail();
	}

	//点击了回复
	void OnClick_WriteBack()
	{
		var _Row = _MailList.curselectrow();
		var _Restitle = _MailList.fieldstr(_Row,window.M_G_GOODS_ITEMPRESENT_TITLE);
		var _name = _MailList.fieldstr(_Row,window.M_G_GOODS_ITEMPRESENT_SENDUSER);
		window.find("UIController").LoadUI("UI_WRITEMAIL");
		window.find("WRITEMAIL_LOGIC")._VWriteMail_Logic.SetNkName(_name,_Restitle);
	}
	
	//点击了写邮件
	void OnClick_WriteMail()
	{
		window.find("UIController").LoadUI("UI_WRITEMAIL");
	}
	
	//点击了接收
	void OnClick_Receive()
	{
		var _Row = _MailList.curselectrow();
		var _GID = _MailList.fieldstr(_Row,window.M_G_GOODS_ITEMPRESENT_ENTRYID); //赠送iD
		if (_GID == 0)
		{
			window.find("UIController").LoadDLG(144);//礼品已接受或已丢弃！
			s_Btn_Receive.SetState(window.BTN_STATE_GREY);//按钮为灰的
			return;
		}

		//发出接受赠送物品的消息：赠送id
		window.Too_GetPresentItem(_GID);
	}

	//初始化相关数据
	void InitData()
	{
		s_Message.SetData("","","");
		s_GID.show = false;
		s_ItemName.SetData("","","");
		s_Desc.src = "";
		s_Btn_Receive.show = false;
		s_Btn_WriteBack.show = false;
		s_Btn_DelSingle.show = false;
		s_Btn_Add_Friend.SetState(window.BTN_STATE_GREY);
	}

	//设置相关数据
	void SetDataBySelect()
	{
		InitData();
		var _Row = _MailList.curselectrow();
		s_Message.SetData(_MailList.fieldstr(_Row,window.M_G_GOODS_ITEMPRESENT_MSG),"","");
		s_Btn_WriteBack.show = true;
		s_Btn_DelSingle.show = true;
		s_Btn_WriteBack.SetState(window.BTN_STATE_LIGHT);

		var _sendUserID = _MailList.fieldstr(_Row,window.M_G_GOODS_ITEMPRESENT_SENDUSERID);
		if (toint(_sendUserID) <= 0)
		{
			s_Btn_WriteBack.SetState(window.BTN_STATE_GREY);
		}
		else
		{
			s_Btn_Add_Friend.SetState(window.BTN_STATE_LIGHT);
		}

		var _enterID = _MailList.fieldstr(_Row,window.M_G_GOODS_ITEMPRESENT_ITEMENTRYID);
	
		if (_enterID > 0)
		{
			s_GID.show = true;
			var _class = window.GetClassByEnterId(_enterID);
			//var _num = window.GetSubNumByItemID(_enterID);
			var _num = window.GetSubNumByItemID(_enterID);
			if(toint(_num) == 0)
			{
				_num = toint(_MailList.fieldstr(_Row,window.M_G_GOODS_ITEMPRESENT_NUMBER));
			}
			else
			{
				_num *= toint(_MailList.fieldstr(_Row,window.M_G_GOODS_ITEMPRESENT_NUMBER));
			}
			var _lv = window.GetIconLvByEnterID(_enterID);
			s_GID.SetIconEx(_enterID,_lv,_num);//图标 等级 数量
			
			s_Btn_Receive.show = true;
			s_Btn_Receive.SetState(window.BTN_STATE_LIGHT);

			var _Name = window.GetNameByEnterID(_enterID);//物品的名称

			var _time = _MailList.fieldstr(_Row,window.M_G_GOODS_ITEMPRESENT_DEADLINE);//物品的收到的时间
			var _day = window.g_MallTool.GetDeadLineDay(_time);
			//printf("B# 礼品到期时间：_day:"+_day+",_time:"+_time);

			var _sendUser = _MailList.fieldstr(_Row,window.M_G_GOODS_ITEMPRESENT_SENDUSER);
			s_Desc.SetData(_sendUser,_Name,_day);
		}
	}

	//设置响应事件
	void SetEvent()
	{
		set s_Btn_Close
		{
			void OnPressed(){parent.OnClick_BtnClose();}
		}
		set s_Btn_Help
		{
			void OnPressed(){window.CallBack_Help(window.POS_MAIL);}
		}
		set s_CHK_AllChoose
		{
			void OnCheck(){MouseCheck();window.SelectMailAll(0,1);}
			void OnUnCheck(){MouseUnCheck();window.SelectMailAll(0,0);}
		}

		set s_Btn_WriteBack
		{
			void OnPressed()
			{
				if (GetState() == window.BTN_STATE_LIGHT) {parent.OnClick_WriteBack();}
			}
			show = false;
		}
		set s_Btn_DelSingle
		{
			void OnPressed()
			{
				if (GetState() == window.BTN_STATE_LIGHT) {parent.OnClick_BtnDelSingle();}
			}
			show = false;
		}

		set s_Btn_Add_Friend
		{
			void OnPressed()
			{
				if (GetState() == window.BTN_STATE_LIGHT) {parent.OnClick_BtnAddSelect();}
			}
			SetState(window.BTN_STATE_GREY);
		}

		set s_Btn_Del
		{
			void OnPressed()
			{
				if (GetState() == window.BTN_STATE_LIGHT) {parent.OnClick_BtnDelSelect();}
			}
			SetState(window.BTN_STATE_GREY);
		}
		set s_Btn_WriteMail
		{
			void OnPressed()
			{
				if (GetState() == window.BTN_STATE_LIGHT) {parent.OnClick_WriteMail();}
			}
		}

		set s_Btn_Receive
		{
			void OnPressed()
			{
				if (GetState() == window.BTN_STATE_LIGHT) {parent.OnClick_Receive();}
			}
			show = false;
			SetState(window.BTN_STATE_GREY);
		}

		set s_PageCtrl
		{
			targetname="VMailList_Logic_NAME";
			countperpage = 11;
			window.find("G_DBMANAGE").GetRegDbTable(this,"Bind_VMailList_Logic");// 获得已绑定的数据表
		}
	}

	//================================DBList=========================================
	Init();
		
	//刷新邮箱
	void UpDataMail()
	{
		var _SQL = "SELECT * FROM ItemPresent WHERE State<="+window.MAIL_READED+" AND UserId="+window.GetMyUID()+" ORDER BY Deadline DESC";
		printf("B# 邮箱-UpDataMail;SQL:"+_SQL);
		window.find("G_DBMANAGE").SelectByRegDbTable("Bind_VMailList_Logic",window.M_G_GOODS,_SQL);
		//_MailList.scriptprcallsub("OnUnSelect");
		_MailList.checkselect(-1,-1);
		
		window.SetMailRead();

		InitData();
	}

	var _MailList = new VMailList_Logic
	{
		SetNeedReport = 1;//是否需要通知其他数据-当其中一条数据删除时
		name = "VMailList_Logic_NAME";
	
		window.find("G_DBMANAGE").RegDbTable(this,window.M_G_GOODS,window.ITEMPRESENT,"Bind_VMailList_Logic");// 绑定数据表
		
		void OnDelete(){window.find("G_DBMANAGE").ReMoveRegDbTable(this);} //移除绑定
		
		void PageviewEnd() // 翻页结束后调用
		{
			checkselect(-1,-1);
		}
	}	

	SetEvent();//必须先有list再有翻页的事件-否则会不显示页数
	UpDataMail();
};