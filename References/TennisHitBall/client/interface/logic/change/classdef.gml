//兑换的逻辑类定义
//yangxf 2009年5月26日
//

importex("$./../../UI/Change/ClassDef.gml");

class VChange_Logic item
{
	size = "500,250";bgcolor = "#FF";alpha = 50;
	var m_gid = 0;
	var m_entryid = 0;
	var m_FocusPos = 0; //1姓名 2电话 3联系地址 4邮政编码 5邮箱
	//=============================与界面交互========================================
	void Init()
	{	
		//物品名字
		staticvar s_Name = new VMyText{}
		//输入框:姓名
		staticvar s_EDIT_Name = new edit
		{
			pos = "10,300";size = "380,50";maxsize = 500;
			bgcolor = "#FFFF";
			autoenter = true;
			font = "宋体,-1,20";
		}
		//输入框:联系地址
		staticvar s_EDIT_Address = new edit
		{
			pos = "10,350";size = "380,50";maxsize = 500;
			bgcolor = "#FFFF";
			autoenter = true;
			font = "宋体,-1,20";
		}
		//输入框:电话
		staticvar s_EDIT_Phone = new edit
		{
			pos = "10,400";size = "380,50";maxsize = 500;
			bgcolor = "#FFFF";
			autoenter = true;
			font = "宋体,-1,20";
		}
		//输入框:邮政编码
		staticvar s_EDIT_mailcode = new edit
		{
			pos = "10,450";size = "380,50";maxsize = 6;
			bgcolor = "#FFFF";
			autoenter = true;
			font = "宋体,-1,20";
		}
		//输入框:e-mail
		staticvar s_EDIT_email = new edit
		{
			pos = "10,450";size = "380,50";maxsize = 500;
			bgcolor = "#FFFF";
			autoenter = true;
			font = "宋体,-1,20";
		}
		//确认并提交：按钮
		staticvar s_Btn_ConfirmPutin = new VMyButton
		{
			halign(100,0);Init("确认提交");size = "35,35";
		}
		//取消：按钮
		staticvar s_Btn_Cancel = new VMyButton
		{
			halign(100,0);Init("取消");size = "35,35";
		}
		//关闭：按钮
		staticvar s_Btn_Close = new VMyButton
		{
			halign(100,0);Init("X");size = "35,35";
		}
	}
	inclass("VChange_UI");//界面显示类
	//==============================function=========================================
	Init();
	//点击了按钮：确认提交
	void OnClick_ConfirmPutin()
	{
		if (s_EDIT_Name.src == "")
		{
			window.LoadInfoBoard(375);//姓名不能为空！
			SetNameHot();
			return;
		}
		if (s_EDIT_Phone.src == "")
		{
			window.LoadInfoBoard(376);//电话不能为空！
			SetPhoneHot();
			return;
		}
		if (s_EDIT_Address.src == "")
		{
			window.LoadInfoBoard(380);//联系地址不能为空！
			SetAddressHot();
			return;
		}
		if (s_EDIT_mailcode.src == "")
		{
			window.LoadInfoBoard(381);//邮政编码不能为空！
			SetAddressHot();
			return;
		}
		if (s_EDIT_email.src == "")
		{
			window.LoadInfoBoard(382);//E-mail不能为空！
			SeteEmailHot();
			return;
		}
		//参数：物品唯一id,姓名,地址,邮政编码,电话,e-mail
		var _param = ""+m_gid+","+s_EDIT_Name.src+","+s_EDIT_Address.src+","+s_EDIT_mailcode.src+","+s_EDIT_Phone.src+","+s_EDIT_email.src;

		window.Too_Award(_param);
	}
	//设置响应事件
	void SetEvent()
	{
		set s_Btn_Close
		{
			void OnPressed(){parent.parent.del();}
		}
		set s_Btn_Cancel
		{
			void OnPressed(){parent.parent.del();}
		}
		set s_Btn_ConfirmPutin//按钮：确认提交
		{
			void OnPressed(){parent.OnClick_ConfirmPutin();}
		}
		set s_EDIT_Name
		{
			void OnEnter(){parent.SetPhoneHot();}
		}
		set s_EDIT_Address
		{
			void OnEnter(){parent.SetMailCodeHot();}
		}
		set s_EDIT_Phone
		{
			void OnEnter(){parent.SetAddressHot();}
		}
		set s_EDIT_mailcode
		{
			void OnEnter(){parent.SeteEmailHot();}
		}
		set s_EDIT_email
		{
			void OnEnter(){parent.OnClick_ConfirmPutin();}
		}
	}
	//1姓名 2电话 3联系地址 4邮政编码 5邮箱
	//设置焦点-姓名
	void SetNameHot(){timer(10,"s_EDIT_Name.hot=1");m_FocusPos = 1;}
	//设置焦点-联系地址
	void SetAddressHot(){timer(10,"s_EDIT_Address.hot=1");m_FocusPos = 3;}
	//设置焦点-电话
	void SetPhoneHot(){timer(10,"s_EDIT_Phone.hot=1");m_FocusPos = 2;}
	//设置焦点-邮政编码
	void SetMailCodeHot(){timer(10,"s_EDIT_mailcode.hot=1");m_FocusPos = 4;}
	//设置焦点-邮箱
	void SeteEmailHot(){timer(10,"s_EDIT_email.hot=1");m_FocusPos = 5;}

	void ChangeHot()
	{
		switch (m_FocusPos)
		{
		case 0:{SetNameHot();break;}
		case 1:{SetPhoneHot();break;}
		case 2:{SetAddressHot();break;}
		case 3:{SetMailCodeHot();break;}
		case 4:{SeteEmailHot();break;}
		case 5:{SetNameHot();break;}
		}
	}
	//================================DBList=========================================
	SetEvent();
	
	//已兑换的
	void GetDataFromDB()
	{
		var _VNet2DBRow = new VNet2DBRow{}
		_VNet2DBRow.InitByBigInt(window.M_G_GOODS,window.AWARDCHANGE,window.M_G_GOODS_AWARDCHANGE_ID,m_gid);

		if (!_VNet2DBRow.IsReady())
		{
			_VNet2DBRow.del();
			printf("B# error-兑换GetDataFromDB:DBname:"+window.M_G_GOODS+",TBName:"+window.AWARDCHANGE+",m_gid:"+m_gid);
			return;
		}
		s_EDIT_Name.src = _VNet2DBRow.GetData(window.M_G_GOODS_AWARDCHANGE_NAME);
		s_EDIT_Address.src = _VNet2DBRow.GetData(window.M_G_GOODS_AWARDCHANGE_ADDRESS);
		s_EDIT_Phone.src = _VNet2DBRow.GetData(window.M_G_GOODS_AWARDCHANGE_PHONE);
		s_EDIT_mailcode.src = _VNet2DBRow.GetData(window.M_G_GOODS_AWARDCHANGE_POSTCODE);
		s_EDIT_email.src = _VNet2DBRow.GetData(window.M_G_GOODS_AWARDCHANGE_EMAIL);
		_VNet2DBRow.del();
	}

	void OnCreated()
	{
		SetNameHot();
		s_Name.SetData(window.LMH_GetChangeName(m_entryid));
	}
};