//创建角色界面的显示类定义

class VCreateRole_UI VUIBG_UI
{
	size = "0%,0%";pos=window.HALL_WND_POS;bgcolor=-1;alpha=-1;//size=window.HALL_WND_SIZE;
	size = "648,505";
	
	void Init()
	{
		SetTitalPos("25,0");
		InitBG("$./imgs"+window.g_Sex+"/CreateRole.tga");
		InitBtnBG();
		SetBtnBGSize("619,30");
		SetBtnBGPos("0%,100%,14,-55");

		//-----------------------------------第一部分-------------------------------
		new VPic9_BK2_UI{pos="14,36";size="619,103";}

		new img{pos="27,50";src="$./imgs"+window.g_Sex+"/Nickname.tga";}		// 昵称
		new VPic9_EditBK_UI{size = "146,20";pos="60,48";}
		//昵称:edit
		staticvar s_Edit_NickName = new BaseEdit
		{
			setNoAddChr(" ",true);
			size = "146,20";pos="60,48";maxsize = 12;ycenter = true;
			timer(10,"hot=1");
		}

		new img{pos="256,50";src="$./imgs"+window.g_Sex+"/xb-text.tga";}	//性别 字
		//男：Radio
		new img{pos="345,50";src="$./imgs"+window.g_Sex+"/n-text.tga";}
		staticvar s_R_Man = new VRadio_Single_New_UI{pos="315,52";}
		//女：Radio
		new img{pos="420,50";src="$./imgs"+window.g_Sex+"/nv-text.tga";}
		staticvar s_R_Woman = new VRadio_Single_New_UI {pos="395,52";}

		// 技术特长选择
		new img{pos="19,82";src="$./imgs"+window.g_Sex+"/jslxxz-text.tga";}

		new VPic9_BK2_UI{pos="25,99";size="590,30";}

		// 球场位置
		new img{pos="28,108";src="$./imgs"+window.g_Sex+"/qcwz-text.tga";}
		//网前：Radio
		new img{pos="147,108";src="$./imgs"+window.g_Sex+"/wq-text.tga";}
		staticvar s_R_NetFront = new VRadio_Single_New_UI 
		{
			pos="120,110";
		}
		//底线：Radio
		new img{pos="238,108";src="$./imgs"+window.g_Sex+"/dx-text.tga";}
		staticvar s_R_BaseLine = new VRadio_Single_New_UI 
		{
			pos="214,110";
		}

		// 技术方向
		new img{pos="364,108";src="$./imgs"+window.g_Sex+"/jsfx-text.tga";}
		//力量：Radio
		new img{pos="483,108";src="$./imgs"+window.g_Sex+"/ll-text.tga";}
		staticvar s_R_Power = new VRadio_Single_New_UI 
		{
			pos="458,110";
		}
		//技巧：Radio
		new img{pos="574,108";src="$./imgs"+window.g_Sex+"/jq-text.tga";}
		staticvar s_R_Skill = new VRadio_Single_New_UI{pos="548,110";}

		//-----------------------------------第二部分-------------------------------
		new VPic9_BK2_UI{pos="14,143";size="619,143";}
		new VPic9_MsgBK_UI{pos = "23,153";size = "333,126";}
		//技术方向说明
		//[参数]_data:说的的文字
		staticvar s_Desc = new BaseText
		{
			pos = "26,156";size = "327,120";
			autoenter = true;//bgcolor = "#FF";alpha = 90;src = "技术方向说明";
		}
		//力量
		new img
		{
			pos="366,151";src="$./imgs"+window.g_Sex+"/ll2-text.tga";
			//staticvar _btnhover = new VBTN_HOVER{};
			//_btnhover.SetHangID(3);
		}
		//[参数]_curr:当前值
		//		_max:最大值(也许没有这个值)
		staticvar s_Power = new VExpline1_UI{pos="406,152";SetWidth(214);}
		
		//技术
		new img
		{
			pos="366,170";src="$./imgs"+window.g_Sex+"/jqiao-text.tga";
			//staticvar _btnhover = new VBTN_HOVER{};
			//_btnhover.SetHangID(4);
		}
		//[参数]_curr:当前值
		//		_max:最大值(也许没有这个值)
		staticvar s_Technic = new VExpline1_UI{pos="406,172";SetWidth(214);}

		//前场
		new img
		{
			pos="366,190";src="$./imgs"+window.g_Sex+"/qc-text.tga";
			//staticvar _btnhover = new VBTN_HOVER{};
			//_btnhover.SetHangID(5);
		}
		//[参数]_curr:当前值
		//		_max:最大值(也许没有这个值)
		staticvar s_Front = new VExpline1_UI{pos="406,191";SetWidth(214);}
		//后场
		new img
		{
			pos="366,209";src="$./imgs"+window.g_Sex+"/hc-text.tga";
			//staticvar _btnhover = new VBTN_HOVER{};
			//_btnhover.SetHangID(6);
		}
		//[参数]_curr:当前值
		//		_max:最大值(也许没有这个值)
		staticvar s_Back = new VExpline1_UI{pos="406,210";SetWidth(214);}

		//发球
		new img
		{
			pos="366,228";src="$./imgs"+window.g_Sex+"/fq-text.tga";
			//staticvar _btnhover = new VBTN_HOVER{};
			//_btnhover.SetHangID(7);
		}
		//[参数]_curr:当前值
		//		_max:最大值(也许没有这个值)
		staticvar s_Serve = new VExpline1_UI{pos="406,230";SetWidth(214);}
		//能量
		new img
		{
			pos="366,247";src="$./imgs"+window.g_Sex+"/nl-text.tga";
			//staticvar _btnhover = new VBTN_HOVER{};
			//_btnhover.SetHangID(8);
		}
		//[参数]_curr:当前值
		//		_max:最大值(也许没有这个值)
		staticvar s_Energy = new VExpline1_UI{pos="406,248";SetWidth(214);SetHangID(8);}
		//体力
		new img
		{
			pos="366,266";src="$./imgs"+window.g_Sex+"/tl-text.tga";
			//staticvar _btnhover = new VBTN_HOVER{};
			//_btnhover.SetHangID(34);
		}
		//[参数]_curr:当前值
		//		_max:最大值(也许没有这个值)
		staticvar s_Thew = new VExpline1_UI{pos="406,268";SetWidth(214);SetHangID(34);}

		//-----------------------------------第三部分-------------------------------
		new VPic9_BK2_UI{pos="14,290";size="619,160";}

		//创建角色：按钮
		staticvar s_Btn_Create = new VBTN_A_New{pos=""+(parent.width-140)+","+(parent.height-window.G_POP_BTN_POSY);InitText("创建角色");}
	}

	//需要先后顺序
	void Init2()
	{
		new img{pos="76,303";src="$./imgs"+window.g_Sex+"/xzfx-text.tga";}
		new img{pos="223,303";src="$./imgs"+window.g_Sex+"/xzrm-text.tga";}
		new img{pos="367,303";src="$./imgs"+window.g_Sex+"/xzsz-text.tga";}
		new img{pos="503,303";src="$./imgs"+window.g_Sex+"/xzqk-text.tga";}

		//翻页：发型
		staticvar s_PageCtrl_1 = new VPageCtrl_ChangeCloth_UI{pos="117,423";size="42,21";}
		//翻页：容貌
		staticvar s_PageCtrl_2 = new VPageCtrl_ChangeCloth_UI{pos="261,423";size="42,21";}
		//翻页：上装
		staticvar s_PageCtrl_3 = new VPageCtrl_ChangeCloth_UI{pos="404,423";size="42,21";}
		//翻页：裙裤
		staticvar s_PageCtrl_4 = new VPageCtrl_ChangeCloth_UI{pos="547,423";size="42,21";}
	}
}