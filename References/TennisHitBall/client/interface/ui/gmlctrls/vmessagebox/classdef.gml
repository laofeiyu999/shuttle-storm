//对话框的类定义
//yxf 2009年10月25日

//只有一个确定按钮的提示框
class VMyMessageBox_1_UI item
{
	size = "100%,100%";bgcolor = -1;alpha = -1;
	
	//================================与显示交互=============================
	void Init()
	{
		staticvar s_BG = new VUIBG_UI
		{
			size = "308,208";
			//pos = ""+(window.width-width)/2 + "," +(window.height-height)/2;
			halign(50,0);valign(50,0);
			SetTitalPos("25,0");
			InitBG("$./imgs"+window.g_Sex+"/tsxx.tga");
			InitClose();
			InitBtnBG();
			new VPic9_BK2_UI
			{
				size(parent.width-30,110);pos = "13,30";
			}
		}
	
		//对话框内容
		staticvar s_Text_Cue = new BaseText
		{
			//pos = "375,318";
			//pos = "17,37";
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
		//确定按钮
		staticvar s_Btn_Confirm = new VBTN_A_New
		{
			//pos = "470,441";
			//halign(50,0);top = 160;
			halign(50,0);valign(50,70);
			InitText("确定");
		}
	}
};


//含有两个按钮的提示框
class VMyMessageBox_2_UI item
{
	size = "100%,100%";bgcolor = -1;alpha = -1;

	void Init()
	{
		staticvar s_BG = new VUIBG_UI
		{
			size = "308,208";
			//pos = ""+(window.width-width)/2 + "," +(window.height-height)/2;
			halign(50,0);valign(50,0);
			SetTitalPos("25,0");
			InitBG("$./imgs"+window.g_Sex+"/tsxx.tga");
			InitClose();
			InitBtnBG();
			new VPic9_BK2_UI
			{
				size(parent.width-30,110);pos = "13,30";
			}
		}

		//对话框内容
		staticvar s_Text_Cue = new BaseText
		{
			//pos = "375,318";
			//pos = "17,37";
			halign(50,0);valign(50,-15);
			size = "274,102";autoenter = true;
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
		//确定按钮
		staticvar s_Btn_Confirm = new VBTN_A_New
		{
			//pos = "390,441";
			//pos = "30,160";
			halign(50,-70);valign(50,70);
			InitText("确定");
		}
		//取消按钮
		staticvar s_Btn_Cancel = new VBTN_A_New
		{
			//pos = "555,441";
			//pos = "200,160";
			halign(50,70);valign(50,70);
			InitText("取消");
		}
	}
	
	//设置按钮的名字
	void SetBtn_ConfirmName(_name)
	{
		if(_name == "" || _name == 0)
		{
			s_Btn_Confirm.InitText("确定");
		}
		s_Btn_Confirm.InitText(_name);
	}
	void SetBtn_CancelName(_name)
	{
		if(_name == "" || _name == 0)
		{
			s_Btn_Cancel.InitText("取消");
		}
		s_Btn_Cancel.InitText(_name);
	}
};

//加为好友的提示框
class VMB_AddFriend_UI item
{
	size = "100%,100%";bgcolor = -1;alpha = 0;
	s_BG.SetTitle("$./imgs"+window.g_Sex+"/tjhy-text.tga");
	//================================与显示交互=============================
	void Init()
	{
		new img
		{
			valign(46,0);halign(44,0);
			src = "$./imgs"+window.g_Sex+"/srwjnc-text.tga";
		}

		new VPic3_Login_EditBK_UI
		{
			size = "146,19";//pos="440,370";
			halign(50,0);valign(50,0);
		}
		//昵称输入框
		staticvar s_Edit = new BaseEdit
		{
			size = "146,19";//pos="440,370";
			halign(50,0);valign(50,0);
			maxsize = 12;timer(10,"hot=1");ycenter = true;xcenter = true;
		}
		//确定按钮
		staticvar s_Btn_Confirm = new VBTN_A_New
		{
			//pos = "390,441";
			halign(50,-70);valign(50,70);
			InitText("确定");
		}
		//取消按钮
		staticvar s_Btn_Cancel = new VBTN_A_New
		{
			//pos = "550,441";
			halign(50,70);valign(50,70);
			InitText("取消");
		}
	}


	//换标题
	void ChangeTitle()
	{
		s_BG.SetTitle("$./imgs"+window.g_Sex+"/tjhmd-text.tga");
	}
};

//正在改名
//add by chenjihui	2011-5-25
class VMB_NameCard_Changing_UI item
{
	size = "100%,100%";bgcolor = -1;alpha = -1;

	//================================与显示交互=============================
	var m_Time = 0;			//计时总时间
	var m_StartTime = 0;	//计时开始标志时间，系统当前秒数

	void OnUpdate()
	{
		if (toint(m_Time) == 0 && toint(m_StartTime) == 0)
		{
			return;
		}

		if ((window.tennisGameStatic.GetCurrentTM()-m_StartTime) >= 1)
		{
			if (m_Time == 0)
			{
				window.del();
			}
//			s_num.showTime(m_Time);
			m_Time -= 1;
			m_StartTime = window.tennisGameStatic.GetCurrentTM();
		}
	}

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
		//对话框内容
		staticvar s_Text_Cue = new BaseText
		{
			halign(50,-1);valign(50,0);
			size = "275,102";autoenter = true;
			//bgcolor ="#FF";alpha = 50;
			
			void SetData(data1)
			{
				parent.m_Time = window.g_changingTime;
				timer(window.g_sendMsgTime,"SendMsg","SendMsg");
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

			void SendMsg()
			{
				killtimer("SendMsg");
				window.DclickChangeName(window.g_cardtype,window.g_nkName);
			}
		}
//		staticvar s_num = new VN2NumShow
//		{
//			halign(50,0);valign(45,0);
//			void NEWNUM(){new img;}
//			void NUMSET(objname,index,num)//设置数字对象的显示
//			{
//				set find(objname)
//				{
//					src = "$./../../PublicImage/num/wager.tga";
//					clipani(35,37,1,10);
//					aniindex=num;
//					left=index*25;
//				}
//			}
//			
//			void showTime(_time)
//			{
//				if (toint(_time) > 0)
//				{
//					setNum(toint(_time));
//				}
//			}
//		}
	}
}

//改名卡 家族改名卡
class VMB_ChangeNameCard_UI item
{
	size = "100%,100%";bgcolor = -1;alpha = 0;
	s_BG.SetTitle("$./imgs"+window.g_Sex+"/gmk-text.tga");
	//================================与显示交互=============================
	void Init()
	{
		staticvar _inputtext = new img
		{
			valign(44,0);halign(43,0);
			src = "$./imgs"+window.g_Sex+"/qsrxdnc-text.tga";
			void _input1()
			{valign(44,0);halign(43,0);src = "$./imgs"+window.g_Sex+"/qsrxdnc-text.tga";}
			void _input2()
			{valign(44,0);halign(44,0);src = "$./imgs"+window.g_Sex+"/qsrxdjzmc-text.tga";}
		}
		
		//new VPic9_BK2_UI{pos = "371,423";size = "278,50";}
		new VPic3_Login_EditBK_UI
		{
			size = "146,19";//pos="440,370";
			halign(44,0);valign(47,0);
		}
		//昵称输入框
		staticvar s_Edit = new BaseEdit
		{
			size = "146,19";//pos="440,370";
			halign(44,0);valign(47,0);
			maxsize = 12;timer(10,"hot=1");ycenter = true;xcenter = true;
			//[功能]获取输入的内容
			//[参数]无
			//[返回值]返回输入的内容
			void GetEditContent()
			{
				return src;
			}
		}
		//名称检测 按钮
		staticvar s_Btn_NameCheck = new VBTN_58_New
		{
			InitText("名称检测");
			left = parent.s_Edit.left + parent.s_Edit.width +30;
			top = parent.s_Edit.top;
		}
		//名称检测结果
		staticvar s_NameCheckResult = new item
		{
			size = "70%,23";//bgcolor = "#ff";
			left = parent.s_Edit.left;
			top = parent.s_Edit.top + parent.s_Edit.height +3;
			var s_Img_CheckResult = new img
			{
				pos = "0,7";
			}
			var s_Text_CheckResult = new BaseText
			{
				left = parent.s_Edit.left + parent.s_Edit.width + 20;
				top = s_Img_CheckResult.top+5;
			}
			//[功能]检测家族名称是否可用
			//[参数]type：true为可用；false为不可用
			//[返回值]无
			void showResult(type)
			{
				if(type)
				{
					s_Img_CheckResult.src = "$./imgs"+window.g_Sex+"/g.tga";
					s_Text_CheckResult.SetData("可用的名称！");
				}
				else
				{
					s_Img_CheckResult.src = "$./imgs"+window.g_Sex+"/c.tga";
					s_Text_CheckResult.SetData("名称已存在或包含不可用字符！");
				}
			}
			//[功能]显示家族名称为空信息
			//[参数]无
			//[返回值]无
			void showEditContentNullInfo()
			{
				s_Img_CheckResult.src = "$./imgs"+window.g_Sex+"/c.tga";
				s_Text_CheckResult.SetData("名称不能为空！");
			}
			//[功能]如果名字长度不够
			//[参数]无
			//[返回值]无
			void shownamenolonger()
			{
				s_Img_CheckResult.src = "$./imgs"+window.g_Sex+"/c.tga";
				s_Text_CheckResult.SetData("昵称长度应在4-12字符之间！");
			}
			void shownamenolongerF()
			{
				s_Img_CheckResult.src = "$./imgs"+window.g_Sex+"/c.tga";
				s_Text_CheckResult.SetData("家族名称长度应在6-16字符之间！");
			}
			void notinfamily()
			{
				s_Img_CheckResult.src = "$./imgs"+window.g_Sex+"/c.tga";
				s_Text_CheckResult.SetData("修改家族名称的人不在家族中！");
			}
			void nofamilypower()
			{
				s_Img_CheckResult.src = "$./imgs"+window.g_Sex+"/c.tga";
				s_Text_CheckResult.SetData("修改家族名称的人没有权限！");
			}
			void familynamenotuse()
			{
				s_Img_CheckResult.src = "$./imgs"+window.g_Sex+"/c.tga";
				s_Text_CheckResult.SetData("家族名称已存在或包含不可用字符！");
			}

			void JudgeAnyName(type,data)
			{
				if(type == 0)
				{
					s_Img_CheckResult.src = "$./imgs"+window.g_Sex+"/c.tga";
					s_Text_CheckResult.SetData(""+data+"不可包含“空格,;</=”等特殊字符！");
				}
				else
				{
					s_Img_CheckResult.src = "$./imgs"+window.g_Sex+"/c.tga";
					s_Text_CheckResult.SetData(""+data+"不可包含不文明或敏感字符！");
				}
			}
		}

		//确定按钮
		staticvar s_Btn_Confirm = new VBTN_A_New
		{
			//pos = "390,441";
			halign(50,-70);valign(50,70);
			InitText("确定");
		}
		//取消按钮
		staticvar s_Btn_Cancel = new VBTN_A_New
		{
			//pos = "550,441";
			halign(50,70);valign(50,70);
			InitText("取消");
		}
	}

	//换标题
	void ChangeTitle()
	{
		s_BG.SetTitle("$./imgs"+window.g_Sex+"/gmk-text.tga");
	}

	//换标题
	void ChangeTitle2()
	{
		s_BG.SetTitle("$./imgs"+window.g_Sex+"/jzgmk-text.tga");
	}
};
//输入房间密码
class VMB_RoomPassWord_UI item
{
	size = "100%,100%";bgcolor = -1;alpha = 0;
		
	//================================与显示交互=============================
	void Init()
	{
		new img
		{
			valign(44,0);halign(44,0);
			src = "$./imgs"+window.g_Sex+"/qsrmm-text.tga";
		}
		new VPic9_EditBK_UI
		{
			size = "146,19";//pos="440,370";
			halign(50,0);valign(50,0);
		}
		//昵称输入框
		staticvar s_Edit = new BaseEdit
		{
			size = "146,19";//pos="440,370";
			password = true;
			halign(50,0);valign(50,0);
			maxsize = 10;timer(10,"hot=1");ycenter = true;xcenter = true;
		}
		//确定按钮
		staticvar s_Btn_Confirm = new VBTN_A_New
		{
			//pos = "390,441";
			halign(50,-70);valign(50,70);
			InitText("确定");
		}
		//取消按钮
		staticvar s_Btn_Cancel = new VBTN_A_New
		{
			//pos = "550,441";
			halign(50,70);valign(50,70);
			InitText("取消");
		}
	}
};

//训练失败判定
class VMB_TrainFail_UI item
{
	size = "100%,100%";bgcolor = -1;alpha = 0;

	void Init()
	{
		staticvar s_BG = new VUIBG_UI
		{
			size = "308,208";
			//pos = ""+(window.width-width)/2 + "," +(window.height-height)/2;
			halign(50,0);valign(50,0);
			SetTitalPos("25,0");
			InitBG("$./imgs"+window.g_Sex+"/tsxx.tga");
			InitClose();
			InitBtnBG();
			new VPic9_BK3_UI
			{
				size(parent.width-30,106);pos = "15,36";
			}
		}

		//对话框内容
		staticvar s_Text_Cue = new BaseText
		{
			//pos = "375,318";
			halign(50,0);valign(50,-15);
			size = "274,102";autoenter = true;
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
		//确定按钮
		staticvar s_Btn_Confirm = new VBTN_A_New
		{
			//pos = "390,441";
			halign(50,-70);valign(50,70);
			InitText("重复训练");
		}
		//取消按钮
		staticvar s_Btn_Cancel = new VBTN_A_New
		{
			//pos = "550,441";
			halign(50,70);valign(50,70);
			InitText("返回大厅");
		}
	}
};


//修改挑战金，同意否？
class VMB_AgreeModify_UI item
{
	size = "100%,100%";bgcolor = -1;alpha = 0;

	void Init()
	{
		staticvar s_BG = new VUIBG_UI
		{
			size = "308,208";
			//pos = ""+(window.width-width)/2 + "," +(window.height-height)/2;
			halign(50,0);valign(50,0);
			SetTitalPos("25,0");
			InitBG("$./imgs"+window.g_Sex+"/tsxx.tga");
			InitClose();
			InitBtnBG();
			new VPic9_BK3_UI
			{
				size(parent.width-30,106);pos = "15,36";
			}
		}

		//对话框内容
		staticvar s_Text_Cue = new BaseText
		{
			//pos = "375,318";
			halign(50,0);valign(50,-15);
			size = "274,102";autoenter = true;
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
		var s_num = new VN2NumShow
		{
			halign(50,0);valign(42,0);
			void NEWNUM(){new img;}
			void NUMSET(objname,index,num)//设置数字对象的显示
			{
				set find(objname)
				{
					src = "$./../../PublicImage/num/wager.tga";
					clipani(35,37,1,10);
					aniindex=num;
					left=index*25;
				}
			}
			var _time = window.g_ChangeWager_Time;
			void Run()
			{
				while (_time > 0 )
				{
					_time -= 1000;
					setNum(_time/1000);
					sleep(1000);
				}
			}
		}
		//确定按钮
		staticvar s_Btn_Confirm = new VBTN_A_New
		{
			//pos = "390,441";
			halign(50,-70);valign(50,70);
			InitText("同意");
		}
		//取消按钮
		staticvar s_Btn_Cancel = new VBTN_A_New
		{
			//pos = "550,441";
			halign(50,70);valign(50,70);
			InitText("反对");
		}
		s_num.Run();
	}
};


//别人邀请我去XX房间： 接受、拒绝
class VMB_InviteToRoom_UI item
{
	size = "100%,100%";bgcolor = -1;alpha = 0;
	void Init()
	{
		staticvar s_BG = new VUIBG_UI
		{
			size = "308,208";
			//pos = ""+(window.width-width)/2 + "," +(window.height-height)/2;
			halign(50,0);valign(50,0);
			SetTitalPos("25,0");
			InitBG("$./imgs"+window.g_Sex+"/tsxx.tga");
			InitClose();
			InitBtnBG();
			new VPic9_BK3_UI
			{
				size(parent.width-30,106);pos = "15,36";
			}
		}

		//对话框内容
		staticvar s_Text_Cue = new BaseText
		{
			//pos = "375,318";
			size = "274,102";autoenter = true;
			//bgcolor ="#FF";alpha = 50;
			halign(50,0);valign(50,-15);

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
		var s_num = new VN2NumShow
		{
			halign(50,0);valign(44,0);
			void NEWNUM(){new img;}
			void NUMSET(objname,index,num)//设置数字对象的显示
			{
				set find(objname)
				{
					src = "$./../../PublicImage/num/wager.tga";
					clipani(35,37,1,10);
					aniindex=num;
					left=index*25;
				}
			}
			var _time = window.g_InviteMsg_Time;
			void Run()
			{
				while (_time > 0 )
				{
					_time -= 1000;
					setNum(_time/1000);
					sleep(1000);
				}
			}
		}
		//确定按钮
		staticvar s_Btn_Confirm = new VBTN_A_New
		{
//			pos = "390,441";
			halign(50,-70);valign(50,70);
			InitText("接受");
		}
		//取消按钮
		staticvar s_Btn_Cancel = new VBTN_A_New
		{
			//pos = "550,441";
			halign(50,70);valign(50,70);
			InitText("拒绝");
		}
		s_num.Run();
	}
};


//设置获胜口号
class VMB_SetSlogan_UI item
{
	size = "100%,100%";bgcolor = -1;alpha = 0;
	s_BG.SetTitle("$./imgs"+window.g_Sex+"/hsgy-text01.tga");
	//================================与显示交互=============================
	void Init()
	{
		new img
		{
			valign(44,0);halign(44,0);
			src = "$./imgs"+window.g_Sex+"/srhsgy-text.tga";
		}

		new VPic9_EditBK_UI
		{
			size = "146,19";//pos="440,370";
			halign(50,0);valign(50,0);
		}
		//昵称输入框
		staticvar s_Edit = new BaseEdit
		{
			size = "146,19";//pos="440,370";
			halign(50,0);valign(50,0);
			maxsize = 40;timer(10,"hot=1");ycenter = true;xcenter = true;
		}
		//确定按钮
		staticvar s_Btn_Confirm = new VBTN_A_New
		{
			//pos = "390,441";
			halign(50,-70);valign(50,70);
			InitText("确定");
		}
		//取消按钮
		staticvar s_Btn_Cancel = new VBTN_A_New
		{
			//pos = "550,441";
			halign(50,70);valign(50,70);
			InitText("取消");
		}
	}
};

//别人邀请我去XX活动： 接受、拒绝
class VMB_InviteToArena_UI item
{
	size = "100%,100%";bgcolor = -1;alpha = 0;
	void Init()
	{
		staticvar s_BG = new VUIBG_UI
		{
			size = "308,208";
			//pos = ""+(window.width-width)/2 + "," +(window.height-height)/2;
			halign(50,0);valign(50,0);
			SetTitalPos("25,0");
			InitBG("$./imgs"+window.g_Sex+"/tsxx.tga");
			InitClose();
			InitBtnBG();
			new VPic9_BK3_UI
			{
				size(parent.width-30,106);pos = "15,36";
			}
		}

		//对话框内容
		staticvar s_Text_Cue = new BaseText
		{
			//pos = "375,318";
			halign(50,0);valign(50,-15);
			size = "274,102";autoenter = true;
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
		var s_num = new VN2NumShow
		{
			halign(50,0);valign(42,0);
			void NEWNUM(){new img;}
			void NUMSET(objname,index,num)//设置数字对象的显示
			{
				set find(objname)
				{
					src = "$./../../PublicImage/num/wager.tga";
					clipani(35,37,1,10);
					aniindex=num;
					left=index*25;
				}
			}
			var _time = window.g_InviteMsg_Time;
			void Run()
			{
				while (_time > 0 )
				{
					_time -= 1000;
					setNum(_time/1000);
					sleep(1000);
				}
			}
		}
		//确定按钮
		staticvar s_Btn_Confirm = new VBTN_A_New
		{
			//pos = "390,441";
			halign(50,-70);valign(50,70);
			InitText("接受");
		}
		//取消按钮
		staticvar s_Btn_Cancel = new VBTN_A_New
		{
			//pos = "550,441";
			halign(50,70);valign(50,70);
			InitText("拒绝");
		}
		s_num.Run();
	}
};

//情侣邀请界面 接受、拒绝
class VMB_InviteToBeLover_UI item
{
	size = "100%,100%";bgcolor = -1;alpha = 0;
	void Init()
	{
		//对话框内容
		staticvar s_Text_Cue = new BaseText
		{
			//pos = "375,318";
			size = "274,102";autoenter = true;
			//bgcolor ="#FF";alpha = 50;
			halign(50,0);valign(50,-15);

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
		var s_num = new VN2NumShow
		{
			halign(50,0);valign(44,0);
			void NEWNUM(){new img;}
			void NUMSET(objname,index,num)//设置数字对象的显示
			{
				set find(objname)
				{
					src = "$./../../PublicImage/num/wager.tga";
					clipani(35,37,1,10);
					aniindex=num;
					left=index*25;
				}
			}
			var _time = window.g_InviteLoverMsg_Time;
			void Run()
			{
				while (_time > 0 )
				{
					_time -= 1000;
					setNum(_time/1000);
					sleep(1000);
				}
			}
		}
		s_num.Run();
	}
};
//只有一个确定按钮的提示框<带链接的>
class VMyMessageBox_3_UI item
{
	size = "100%,100%";bgcolor = -1;alpha = -1;
	
	//================================与显示交互=============================
	void Init()
	{
		staticvar s_BG = new VUIBG_UI
		{
			size = "308,208";
			//pos = ""+(window.width-width)/2 + "," +(window.height-height)/2;
			halign(50,0);valign(50,0);
			SetTitalPos("25,0");
			InitBG("$./imgs"+window.g_Sex+"/tsxx.tga");
			InitClose();
			InitBtnBG();
			new VPic9_BK2_UI
			{
				size(parent.width-30,110);pos = "13,30";
			}
		}
		
		//条目列表显示区
		staticvar s_Text_Cue = new iframe
		{
			halign(50,-1);valign(50,-19);
			size = "275,102";//bgcolor = "#FF";
			scroll = window.SCROLL_NOTENNIS;
			var _html = new html
			{
				var _body = new body{}
			}
		}
		//确定按钮
		staticvar s_Btn_Confirm = new VBTN_A_New
		{
			//pos = "470,441";
			//halign(50,0);top = 160;
			halign(50,0);valign(50,70);
			InitText("确定");
		}
	}
};
//订婚戒指界面
class VMB_Engagementring_UI item
{
	size = "100%,100%";bgcolor = -1;alpha = 0;
	s_BG.SetTitle("$./imgs"+window.g_Sex+"/dh-text.tga");
	//================================与显示交互=============================
	void Init()
	{
		new img
		{
			valign(46,0);halign(44,0);
			src = "$./imgs"+window.g_Sex+"/srwjnc-text.tga";
		}

		new VPic3_Login_EditBK_UI
		{
			size = "146,19";//pos="440,370";
			halign(50,0);valign(50,0);
		}
		//昵称输入框
		staticvar s_Edit = new BaseEdit
		{
			size = "146,19";//pos="440,370";
			halign(50,0);valign(50,0);
			maxsize = 12;timer(10,"hot=1");ycenter = true;xcenter = true;
		}
		//确定按钮
		staticvar s_Btn_Confirm = new VBTN_A_New
		{
			//pos = "390,441";
			halign(50,-70);valign(50,70);
			InitText("确定");
		}
		//取消按钮
		staticvar s_Btn_Cancel = new VBTN_A_New
		{
			//pos = "550,441";
			halign(50,70);valign(50,70);
			InitText("取消");
		}

		//名称检测结果
		staticvar s_NameCheckResult = new item
		{
			size = "70%,23";//bgcolor = "#ff";
			left = parent.s_Edit.left;
			top = parent.s_Edit.top + parent.s_Edit.height +3;
			var s_Img_CheckResult = new img
			{
				pos = "0,7";
			}
			var s_Text_CheckResult = new BaseText
			{
				left = parent.s_Edit.left + parent.s_Edit.width + 20;
				top = s_Img_CheckResult.top+5;
			}
			//[功能]检测家族名称是否可用
			//[参数]type：true为可用；false为不可用
			//[返回值]无
			void showResult(type)
			{
				if(type)
				{
					s_Img_CheckResult.src = "$./imgs"+window.g_Sex+"/g.tga";
					s_Text_CheckResult.SetData("可用的名称！");
				}
				else
				{
					s_Img_CheckResult.src = "$./imgs"+window.g_Sex+"/c.tga";
					s_Text_CheckResult.SetData("名称已存在或包含不可用字符！");
				}
			}
			//[功能]显示名称为空信息
			//[参数]无
			//[返回值]无
			void showEditContentNullInfo()
			{
				s_Img_CheckResult.src = "$./imgs"+window.g_Sex+"/c.tga";
				s_Text_CheckResult.SetData("名称不能为空！");
			}
			//[功能]如果名字长度不够
			//[参数]无
			//[返回值]无
			void shownamenolonger()
			{
				s_Img_CheckResult.src = "$./imgs"+window.g_Sex+"/c.tga";
				s_Text_CheckResult.SetData("昵称长度应在4-12字符之间！");
			}
			void JudgeAnyName(type,data)
			{
				if(type == 0)
				{
					s_Img_CheckResult.src = "$./imgs"+window.g_Sex+"/c.tga";
					s_Text_CheckResult.SetData(""+data+"不可包含“空格,;</=”等特殊字符！");
				}
				else
				{
					s_Img_CheckResult.src = "$./imgs"+window.g_Sex+"/c.tga";
					s_Text_CheckResult.SetData(""+data+"不可包含不文明或敏感字符！");
				}
			}
		}
	}
};
// add by chenjihui
// 2010-12-29
//糖果界面
class VMB_EateCandyOrNot_UI item
{
	size = "100%,100%";bgcolor = -1;alpha = 0;

	void Init()
	{
		staticvar s_BG = new VUIBG_UI
		{
			size = "308,208";
			//pos = ""+(window.width-width)/2 + "," +(window.height-height)/2;
			halign(50,0);valign(50,0);
			SetTitalPos("25,0");
			InitBG("$./imgs"+window.g_Sex+"/tsxx.tga");
			InitClose();
			InitBtnBG();
			new VPic9_BK3_UI
			{
				size(parent.width-30,106);pos = "15,36";
			}
		}

		//对话框内容
		staticvar s_Text_Cue = new BaseText
		{
			//pos = "375,318";
			halign(50,0);valign(50,-15);
			size = "274,102";autoenter = true;
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
		//确定按钮
		staticvar s_Btn_Confirm = new VBTN_A_New
		{
			//pos = "390,441";
			halign(50,-70);valign(50,70);
			InitText("把它吃掉");
		}
		//取消按钮
		staticvar s_Btn_Cancel = new VBTN_A_New
		{
			//pos = "550,441";
			halign(50,70);valign(50,70);
			InitText("还是算了吧");
		}
	}
};

// add by chenjihui
// 2010-12-29
// 吃糖果后的界面
class VEateCandyResult_UI item
{
	size = "100%,100%";bgcolor = -1;alpha = -1;
	
	//================================与显示交互=============================
	void Init()
	{
		staticvar s_BG = new VUIBG_UI
		{
			size = "308,208";
			//pos = ""+(window.width-width)/2 + "," +(window.height-height)/2;
			halign(50,0);valign(50,0);
			SetTitalPos("25,0");
			InitBG("$./imgs"+window.g_Sex+"/tsxx.tga");
		//	InitClose();
			InitBtnBG();
			new VPic9_BK2_UI
			{
				size(parent.width-30,110);pos = "13,30";
			}
		}
	
		//对话框内容
		staticvar s_Text_Cue = new BaseText
		{
			//pos = "375,318";
			//pos = "17,37";
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
		//确定按钮
		staticvar s_Btn_Confirm = new VBTN_94_New
		{
//			SetSize(94,24);
			//pos = "470,441";
			//halign(50,0);top = 160;
			halign(50,0);valign(50,70);
			InitText("唉~为嘴伤身啊");
		}
	}
};
//愚人节版---心动感觉1界面
//add by chenjihui
//2011-3-1
class VMB_Touched_UI item
{
	size = "100%,100%";bgcolor = -1;alpha = -1;
	
	//================================与显示交互=============================
	void Init()
	{
		staticvar s_BG = new VUIBG_UI
		{
			size = "308,208";
			halign(50,0);valign(50,0);
			SetTitalPos("25,0");
			InitBG("$./imgs"+window.g_Sex+"/tsxx.tga");
			InitBtnBG();
			new VPic9_BK2_UI
			{
				size(parent.width-30,110);pos = "13,30";
			}
		}
	
		//对话框内容
		staticvar s_Text_Cue = new BaseText
		{
			halign(50,-1);valign(50,-19);
			size = "200,50";autoenter = true;

			void SetData(data1)
			{
				if (data1.Count <= 36)
				{
					xcenter = true;ycenter = true;
					src = data1;
				}
				else
				{
					src = ""+data1;xcenter = false;ycenter = true;
				}
			}
		}
		//昵称输入框
		staticvar s_Edit = new edit
		{
//			valign(50,0);halign(50,0);
//			color = "#ffffff";
			bgcolor = "#CCCCCC";
			size = "150,20";//pos="440,370";
			halign(50,0);valign(50,0);
			maxsize = 12;timer(10,"hot=1");ycenter = true;xcenter = true;
			font="宋体,-1,12";
		}
		//确定按钮
		staticvar s_Btn_Confirm = new VBTN_94_New
		{
			halign(50,0);valign(50,70);
			InitText("求婚");
		}
	}
};
