
//网球比赛-创建房间：显示类定义
//2009年10月24日

class VHall_CreateRoom_Tennis_UI VUIBG_UI
{
	size = "355,455";bgcolor = -1;
	valign(0,0);halign(0,0);pos = ""+(window.width-width)/2 + "," +(window.height-height)/2;

	void Init()
	{
		OpenDrag();
		SetTitalPos("25,0");
		InitBG("$./imgs"+window.g_Sex+"/cjfj-bt-text.tga");
		InitClose();
		InitBtnBG();
		InitHelp();
		
		// 上方框
		new VPic9_BK2_UI{pos="17,36";size="322,231";};

		// 下方框
		new VPic9_BK2_UI{pos="17,273";size="322,117";};

		// 房间名称
		new img{pos(61,57-10);src="$./imgs"+window.g_Sex+"/fjmc-text.tga";};
		
		new VPic9_EditBK_UI{size = "148,20";pos(155,55-10);};

		//房间名称:edit
		staticvar s_Edit_RoomName = new BaseEdit
		{
			size = "148,20";pos(155,55-10);maxsize = 12;ycenter = true;xcenter = true;
		}

		// 房间密码
		new img{pos(61,90-13);src="$./imgs"+window.g_Sex+"/fjmm-text.tga";};

		new VPic9_EditBK_UI{size = "148,20";pos(155,88-13);};

		//密码:edit
		staticvar s_Edit_PassWord = new BaseEdit
		{
			size = "148,20";pos (155,88-13);maxsize = 10;ycenter = true;xcenter = true;
			password = true;
		}

		// 游戏模式
		new img{pos(61,125-18);src="$./imgs"+window.g_Sex+"/yxms-text.tga";};

		//游戏模式单选：普通
		staticvar s_R_GameModeNormal = new VRadio_Single_New_UI
		{
			pos(155,124-18);
		}
		//游戏模式单选：挑战金
		staticvar s_R_GameModeWager = new VRadio_Single_New_UI
		{
			pos(155,124-18+29+25);
		}
		//游戏模式情侣：
		staticvar s_R_GameModeLover = new VRadio_Single_New_UI
		{
			pos(155,124-18+29);
		}

		//游戏模式(普通)
		staticvar s_CB_GameModeNormal = new VMyDropMenu_UI
		{
			void GetOffSetX(){return parent.parent.parent.left + parent.parent.left+parent.left;}
			void GetOffSetY(){return parent.parent.parent.top + parent.parent.top+parent.top;}
		}

		//游戏模式(挑战金)
		staticvar s_CB_GameModeWager = new VMyDropMenu_UI
		{
			void GetOffSetX(){return parent.parent.parent.left + parent.parent.left+parent.left;}
			void GetOffSetY(){return parent.parent.parent.top + parent.parent.top+parent.top;}
		}

		//情侣游戏模式(挑战金)
		staticvar s_CB_GameModeLover = new VMyDropMenu_UI
		{
			void GetOffSetX(){return parent.parent.parent.left + parent.parent.left+parent.left;}
			void GetOffSetY(){return parent.parent.parent.top + parent.parent.top+parent.top;}
		}
		
		// 设置挑战金
		staticvar s_TZJBK = new img
		{
			pos(61,162+10+25);

			void SetState(state)
			{
				if (state == window.BTN_STATE_LIGHT)
				{
					src="$./imgs"+window.g_Sex+"/sztzj-text.tga";
				}
				else
				{
					src="$./imgs"+window.g_Sex+"/sztzj-hb-text.tga";
				}
			}
		};

		//挑战金:edit
		new VPic9_EditBK_UI{size = "80,20";pos(155,160+10+25);};

		//挑战金:edit
		staticvar s_Edit_SetStake = new BaseEditNum
		{
			size = "80,20";pos(155,160+10+25);
			maxsize = 10;ycenter = true;xcenter = true;
		}
		//挑战金:edit的遮罩
		staticvar s_Edit_SetStakeCap = new item
		{
			size = "80,20";pos(155,160+10+25);capturemouse = true;//bgcolor = "#FF";
		}

		//挑战金类型
		staticvar s_CB_SetStake = new VMyDropMenu_UI
		{
			void GetOffSetX(){return parent.parent.parent.left + parent.parent.left+parent.left;}
			void GetOffSetY(){return parent.parent.parent.top + parent.parent.top+parent.top;}
		}


		// 局制
		new img{pos(61,197+5+25);src="$./imgs"+window.g_Sex+"/jz-text.tga";};

		staticvar s_CHK_CanLook = new BaseText
		{
			pos="255,250";
			src="允许观战";
		};

		//游戏局制
		staticvar s_CB_GameNum = new VMyDropMenu_UI
		{
			void GetOffSetX(){return parent.parent.parent.left + parent.parent.left+parent.left;}
			void GetOffSetY(){return parent.parent.parent.top + parent.parent.top+parent.top;}
		}



		//地图列表背景
		new VMapBK_UI{pos="46,283";SetData(4);};
		new VMapBK_UI{pos="195,283";SetData(4);};

		//复选框：禁止观战
		staticvar s_CHK_CannotLook = new VCK_CK_New
		{
			//bgcolor="#FF";
			size = "68,20";pos = "235,247";
		}


		//翻页：选地图
		staticvar s_PageCtrl = new VPageCtrl_CreateRoom_UI
		{
			size="292,100";pos="30,323"
		}

		//确定：按钮
		staticvar s_Btn_Confirm = new VBTN_A_New
		{
			pos(30,parent.height-window.G_POP_BTN_POSY);InitText("确定");
		}
		//取消：按钮
		staticvar s_Btn_Cancel = new VBTN_A_New
		{
			pos(parent.width-110,parent.height-window.G_POP_BTN_POSY);InitText("取消");
		}
	}
	
	//改变标题
	//1创建房间 2房间设置
	void ChangeTitle(type)
	{
		if (type == 2)
		{
			//s_Btn_Help.show = false;
			SetTitle("$./imgs"+window.g_Sex+"/fjsz-text.tga");
		}
	}

//	void OnDragFunc()
//	{
//		
//		s_CB_GameModeNormal.SetPos(155+20,124-18);
//		s_CB_GameModeWager.SetPos(155+20,124-18+29);
//		s_CB_GameNum.SetPos(155,195+5);
//		s_CB_SetStake.SetPos(246,161+10);
//	}
};