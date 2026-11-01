//写邮件
//yxf 2009年10月20日

importex("$./../../UI/Mail/ClassDef_WriteMail.gml");

class VWriteMail_Logic item
{
	size = "400,500";bgcolor = "#FFFF";alpha = 50;
	valign(50,0);halign(50,0);
	var m_Name = "";	//邮件接收方
	var m_FocusPos = 0;	//1.标题	2.内容
	//=============================与界面交互========================================
	void Init()
	{
		//关闭：按钮
		staticvar s_Btn_Close = new VMyButton
		{
			Init("X");size = "30,30";halign(100,0);
		}	
		//帮助：按钮
		staticvar s_Btn_Help = new VMyButton
		{
			Init("？");size = "30,30";halign(90,0);
		}

		//好友列表
		staticvar s_CB_FriendList = new VMyComboBox 
		{
			m_sizeX = 98;halign(10,0);valign(10,0);
		}
		
		//标题:edit
		staticvar s_Edit_Title = new edit
		{
			size = "180,26";pos = "120,56";
			font = "宋体,-1,20";bgcolor = "#FF";color = "#FFFFFF";cursorcolor = "#FFFFFF";
			maxsize = 12;ycenter = true;xcenter = true;
		}
		//内容:edit
		staticvar s_Edit_Msg = new edit
		{
			size = "300,300";pos = "10,91";
			font = "宋体,-1,20";bgcolor = "#FF";color = "#FFFFFF";cursorcolor = "#FFFFFF";
			maxsize = 100;autoenter = true;
		}

		//确定：按钮
		staticvar s_Btn_Confirm = new VMyButton
		{
			Init("确定");pos="23,429";
		}
		//取消：按钮
		staticvar s_Btn_Cancel = new VMyButton
		{
			Init("取消");pos="226,435";
		}
	}
	inclass("VWriteMail_UI");//界面显示类
	//==============================function=========================================
	//敏感字符过滤
	void StrFilter(_str)
	{
		_str = _str.Replace("(","（");
		_str = _str.Replace(")","）");
		_str = _str.Replace("\"","“");
		return _str;
	}

	//点击了确定
	void OnClick_Confirm()
	{
		var _name = s_CB_FriendList.GetText();
		
		if (_name == "" || _name.Count <= 0)
		{
			window.find("UIController").LoadDLG(408);//请输入或选择一个玩家！
			return;
		}
		if (_name.Count < 4 || _name.Count > 12)
		{
			window.find("UIController").LoadDLG(331);//昵称长度应在4-12字符之间。
			return;
		}
		var _res = window.JudgeAnyNameLicit(_name,"昵称");
		if (_res < 0)
		{
			return;
		}

		var _title = s_Edit_Title.src;
		//_title = StrFilter(_title);
		if (_title == "" || _title.Count <= 0)// || _title.TrimLeft(" ").Count <= 0
		{
			_title = "无标题";
		}
		else
		{
			var _res = window.JudgeAnyNameLicit(_title,"标题");
			if (_res < 0)
			{
				SetTitleHot();
				return;
			}
		}

		var _msg = s_Edit_Msg.src;
		//_msg = StrFilter(_msg);
		if (_msg == "" || _msg.Count <= 0 )//|| _msg.TrimLeft(" ").Count <= 0
		{
			window.find("UIController").LoadDLG(409);//邮件内容不能为空！
			SetMsgHot();
			return;
		}

		var _res = window.JudgeAnyNameLicit(_msg,"邮件内容");
		if (_res < 0)
		{
			SetMsgHot();
			return;
		}
		var _uid = window.GetUIDByName_KF(_name);
		var _sex = window.GetSexByName_KF(_name);

		var _param = ""+_uid+","+_sex+","+_name+","+_title+","+_msg;
		//发出邮寄消息
		//新新参数：iToUserId,iToUserSex,pszToUserName,pszTitle,pszToMsg,iGoodsId,iEntryId,iGoodsNum
		window.Too_Mail(_param);
		
		parent.del();
	}

	//夏洋洋添加于2009-12-11
	//设置焦点-标题
	void SetTitleHot()
	{
		timer(10,"s_Edit_Title.hot=1");m_FocusPos = 1;
	}
	//设置焦点-内容
	void SetMsgHot()
	{
		timer(10,"s_Edit_Msg.hot=1");m_FocusPos = 2;
	}
	//1标题 2内容
	void ChangeHot()
	{
		switch (m_FocusPos)
		{
		case 0:{SetTitleHot();break;}
		case 1:{SetMsgHot();break;}
		case 2:
		{
			SetTitleHot();
			break;
		}
		}
	}
	//设置响应事件
	void SetEvent()
	{
		//夏洋洋添加于2009-12-11
		set s_Edit_Title
		{
			timer(10,"hot=1");src = "无主题";
		}
		set s_CB_FriendList
		{
			//接口函数 WhichSelect:
			//参数：jid 好友用
			//		sex 性别
			void WhichSelect(jid,sex)
			{
				//printf("jid:"+jid+",sex:"+sex);
			}
			
			SetID("WriteMail",2); //全部
			SetPos(134,48);
			SetSize(145,166);
		}
		set s_Btn_Close
		{
			void OnPressed(){parent.parent.del();}
		}
//		set s_Btn_Help
//		{
//			void OnPressed(){window.CallBack_Help(window.POS_WRITEMAIL);}
//		}

		set s_Btn_Confirm
		{
			void OnPressed()
			{
				if(GetState()==window.BTN_STATE_LIGHT){parent.OnClick_Confirm();}
			}
		}
		set s_Btn_Cancel
		{
			void OnPressed(){parent.parent.del();}
		}
	}
	
	//设置昵称
	void SetNkName(_name,_title)
	{
		m_Name = _name;
		s_Edit_Title.src = "回复："+_title;
	}
	//仅设置昵称
	void SetNameOnly(_name)
	{
		m_Name = _name;
	}

	//================================DBList=========================================
	Init();
	SetEvent();

	void OnCreated()
	{
		if (m_Name != "")
		{
//			s_CB_FriendList.SetState(window.BTN_STATE_GREY);
			s_CB_FriendList.SetDefaultSrc(m_Name);
		}
	}
};