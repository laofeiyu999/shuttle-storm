//大厅（商城+社区+大奖赛+训练+网球比赛）界面的按钮层-下 显示类定义
//@刘高辰
//08年8月28日

class VHall_BtnLayer_Bottom_UI item
{
	valign(100,0);size = "0%,0%";size = "100%,100";bgcolor = "-1";alpha = -1;
	
//	bgcolor = "#FF";alpha = 80;
	void GetMyTop(_p)
	{
		return (height-_p.height-19);
	}
	void GetTextLeft(_p,_width){return _p.left+(_p.width-_width)/2;}
	void GetTextTop(_p){return height-_p.height;}
	void Init()
	{
		staticvar m_curBtnDownName = 0;
		//主菜单：按钮
		staticvar s_BTN_MainMenu = new VBTN_Hall_Menu_New
		{
			SetPos(3,parent.GetMyTop(this)+12);
			void CallBack_OnImgChange(index)
			{
					parent.s_BTN_MainMenu_Name.SetData(index);
			}
			void ClearBtnTextState(state)
			{
				//printf("BTN:s_BTN_Mall:ClearBtnTextState()state:"+state);
				m_Selected = state;
				parent.s_BTN_MainMenu_Name.SetOpenState(state);
				if (m_Selected){SetImgSrcEx(3);LogicMouseOutFunc();}else{SetImgSrcEx(1);}
			}
		}
		new VPic3_Shade_UI
		{
			size = "80,32";
			left = parent.s_BTN_MainMenu.left+5;
			top = parent.s_BTN_MainMenu.top + parent.s_BTN_MainMenu.height - 25;
		}
		staticvar s_BTN_MainMenu_Name = new VButton_TextImg
		{
			Init("new/HallBottom_Text/zcd0");
			pos(parent.GetTextLeft(parent.s_BTN_MainMenu,width),parent.GetTextTop(this));
		}

		//快捷方式1
		staticvar s_BTN_ShortCut_1 = new VBTN_ShortCut{pos(90,70);}
		//快捷方式2
		staticvar s_BTN_ShortCut_2 = new VBTN_ShortCut{pos(115,70);}
		//快捷方式3
		staticvar s_BTN_ShortCut_3 = new VBTN_ShortCut{pos(140,70);}
		
		//商城
		staticvar s_BTN_Mall = new VBTN_Hall_Mall_New
		{
			SetPos(142,parent.GetMyTop(this)+12);
			//自身图片切换
			void CallBack_OnImgChange(index)
			{
				parent.s_BTN_Mall_Name.SetData(index);
			}
			//点击了其他按钮
			void ClearBtnTextState(state)
			{
				//printf("BTN:s_BTN_Mall:ClearBtnTextState()state:"+state);
				m_Selected = state;
				parent.s_BTN_Mall_Name.SetOpenState(state);
				if (m_Selected){SetImgSrcEx(3);LogicMouseOutFunc();}else{SetImgSrcEx(1);}
			}
		}
		staticvar s_BTN_Mall_Name = new VButton_TextImg
		{
			Init("new/HallBottom_Text/sc0");
			pos(parent.GetTextLeft(parent.s_BTN_Mall,width),parent.GetTextTop(this));
		}

		//排行榜
		staticvar s_BTN_TopStar = new VBTN_Hall_TopList_New
		{
			SetPos(192,parent.GetMyTop(this)+12);
			void CallBack_OnImgChange(index)
			{
				parent.s_BTN_TopStar_Name.SetData(index);
			}
			//点击了其他按钮
			void ClearBtnTextState(state)
			{
				//printf("BTN:s_BTN_TopStar:ClearBtnTextState()state:"+state);
				m_Selected = state;
				parent.s_BTN_TopStar_Name.SetOpenState(state);
				if (m_Selected){SetImgSrcEx(3);LogicMouseOutFunc();}else{SetImgSrcEx(1);}
			}
		}
		staticvar s_BTN_TopStar_Name = new VButton_TextImg
		{
			Init("new/HallBottom_Text/phb0");
			pos(parent.GetTextLeft(parent.s_BTN_TopStar,width),parent.GetTextTop(this));
		}
		
		//玩家列表
		staticvar s_BTN_UserList = new VBTN_Hall_playerList_New
		{
			SetPos(242,parent.GetMyTop(this)+12);
			void CallBack_OnImgChange(index){parent.s_BTN_UserList_Name.SetData(index);}
			//点击了其他按钮
			void ClearBtnTextState(state)
			{
				//printf("BTN:s_BTN_UserList:ClearBtnTextState()state:"+state);
				m_Selected = state;
				parent.s_BTN_UserList_Name.SetOpenState(state);
				if (m_Selected){SetImgSrcEx(3);LogicMouseOutFunc();}else{SetImgSrcEx(1);}
			}
		}
		staticvar s_BTN_UserList_Name = new VButton_TextImg
		{
			Init("new/HallBottom_Text/wjlb0");
			pos(parent.GetTextLeft(parent.s_BTN_UserList,width),parent.GetTextTop(this));
			//left += 3;
		}
		//家族
		staticvar s_BTN_Family = new VBTN_Hall_Family_New
		{
			SetPos(292,parent.GetMyTop(this)+12);
			void CallBack_OnImgChange(index){parent.s_BTN_Family_Name.SetData(index);}
			//点击了其他按钮
			void ClearBtnTextState(state)
			{
				//printf("BTN:s_BTN_TopStar:ClearBtnTextState()state:"+state);
				m_Selected = state;
				parent.s_BTN_Family_Name.SetOpenState(state);
				if (m_Selected){SetImgSrcEx(3);LogicMouseOutFunc();}else{SetImgSrcEx(1);}
			}
		}
		staticvar s_BTN_Family_Name = new VButton_TextImg
		{
			Init("new/HallBottom_Text/jz0");
			pos(parent.GetTextLeft(parent.s_BTN_Family,width),parent.GetTextTop(this));
			//left = left+7;
			
		}
		//训练：Radio
		staticvar s_BTN_Train = new VBTN_Hall_Train_New
		{
			SetPos(342,parent.GetMyTop(this)+12);
			void CallBack_OnImgChange(index){parent.s_BTN_Train_Name.SetData(index);}
			//点击了其他按钮
			void ClearBtnTextState(state)
			{
				//printf("BTN:s_BTN_Train:ClearBtnTextState()state:"+state);
				m_Selected = state;
				parent.s_BTN_Train_Name.SetOpenState(state);
				if (m_Selected){SetImgSrcEx(3);LogicMouseOutFunc();}else{SetImgSrcEx(1);}
			}
		}
		staticvar s_BTN_Train_Name = new VButton_TextImg
		{
			Init("new/HallBottom_Text/xl0");
			pos(parent.GetTextLeft(parent.s_BTN_Train,width),parent.GetTextTop(this));
		}
		//任务：Radio
		staticvar s_BTN_Task = new VBTN_Hall_Task_New
		{
			SetPos(395,parent.GetMyTop(this)+12);
			void CallBack_OnImgChange(index){parent.s_BTN_Task_Name.SetData(index);}
			//点击了其他按钮
			void ClearBtnTextState(state)
			{
				//printf("BTN:s_BTN_TopStar:ClearBtnTextState()state:"+state);
				m_Selected = state;
				parent.s_BTN_Task_Name.SetOpenState(state);
				if (m_Selected){SetImgSrcEx(3);LogicMouseOutFunc();}else{SetImgSrcEx(1);}
			}
		}
		staticvar s_BTN_Task_Name = new VButton_TextImg
		{
			Init("new/HallBottom_Text/rw0");
			pos(parent.GetTextLeft(parent.s_BTN_Task,width)-4,parent.GetTextTop(this));
		}
		//活动场：Radio
		staticvar s_BTN_Arena = new VBTN_Hall_activity_New
		{
			SetPos(442,parent.GetMyTop(this)+12);
			void CallBack_OnImgChange(index){parent.s_BTN_Arena_Name.SetData(index);}

			//点击了其他按钮
			void ClearBtnTextState(state)
			{
				//printf("BTN:s_BTN_Arena:ClearBtnTextState()state:"+state);
				m_Selected = state;
				parent.s_BTN_Arena_Name.SetOpenState(state);
				if (m_Selected){SetImgSrcEx(3);}else{SetImgSrcEx(1);}
			}
		}
		staticvar s_BTN_Arena_Name = new VButton_TextImg
		{
			Init("new/HallBottom_Text/hdc0");
			pos(parent.GetTextLeft(parent.s_BTN_Arena,width),parent.GetTextTop(this));
		}
		//游戏室：Radio
		staticvar s_BTN_GameHall = new VBTN_Hall_Hall_New
		{
			SetPos(505,parent.GetMyTop(this)+12);
			void CallBack_OnImgChange(index){parent.s_BTN_GameHall_Name.SetData(index);}
			//点击了其他按钮
			void ClearBtnTextState(state)
			{
				//printf("BTN:s_BTN_TopStar:ClearBtnTextState()state:"+state);
				m_Selected = state;
				parent.s_BTN_GameHall_Name.SetOpenState(state);
				if (m_Selected){SetImgSrcEx(3);LogicMouseOutFunc();}else{SetImgSrcEx(1);}
			}
		}
		staticvar s_BTN_GameHall_Name = new VButton_TextImg
		{
			Init("new/HallBottom_Text/yxs0");
			pos(parent.GetTextLeft(parent.s_BTN_GameHall,width),parent.GetTextTop(this));
		}
		new VPic3_Shade_UI
		{
			size = "450,32";
			left = parent.s_BTN_Mall.left;
			top = parent.s_BTN_Mall.top + parent.s_BTN_Mall.height - 25;
		}
		//好友
		staticvar s_BTN_Friend = new VBTN_Hall_friend_New
		{
			SetRelatePos(1);
			SetPos(250,parent.GetMyTop(this)+12);
			void CallBack_OnImgChange(index){parent.s_BTN_Friend_Name.SetData(index);}
			//点击了其他按钮
			void ClearBtnTextState(state)
			{
				//printf("BTN:s_BTN_TopStar:ClearBtnTextState()state:"+state);
				m_Selected = state;
				parent.s_BTN_Friend_Name.SetOpenState(state);
				if (m_Selected){SetImgSrcEx(3);LogicMouseOutFunc();}else{SetImgSrcEx(1);}
			}
		}
		staticvar s_BTN_Friend_Name = new VButton_TextImg
		{
			Init("new/HallBottom_Text/sj0");
			//pos(parent.GetTextLeft(parent.s_BTN_Friend,width),parent.GetTextTop(this));
			halign(100,-270);top = parent.GetTextTop(this);
		}
		//邮件：Radio
		staticvar s_BTN_Mail = new VBTN_Hall_mail_New
		{
			SetRelatePos(1);
			SetPos(200,parent.GetMyTop(this)+12);
			void CallBack_OnImgChange(index){parent.s_BTN_Mail_Name.SetData(index);}
			//点击了其他按钮
			void ClearBtnTextState(state)
			{
				//printf("BTN:s_BTN_TopStar:ClearBtnTextState()state:"+state);
				m_Selected = state;
				parent.s_BTN_Mail_Name.SetOpenState(state);
				if (m_Selected){SetImgSrcEx(3);LogicMouseOutFunc();}else{SetImgSrcEx(1);}
			}
		}
		staticvar s_BTN_Mail_Name = new VButton_TextImg
		{
			Init("new/HallBottom_Text/yj0");
//			pos(parent.GetTextLeft(parent.s_BTN_Mail,width),parent.GetTextTop(this));
//			left += 3;
			halign(100,-220);top = parent.GetTextTop(this);
		}
		//录像：Radio
		staticvar s_BTN_Video = new VBTN_Hall_Movie_New
		{
			SetRelatePos(1);
			SetPos(140,parent.GetMyTop(this)+12);
			void CallBack_OnImgChange(index){parent.s_BTN_Video_Name.SetData(index);}
			//点击了其他按钮
			void ClearBtnTextState(state)
			{
				//printf("BTN:s_BTN_TopStar:ClearBtnTextState()state:"+state);
				m_Selected = state;
				parent.s_BTN_Video_Name.SetOpenState(state);
				if (m_Selected){SetImgSrcEx(3);LogicMouseOutFunc();}else{SetImgSrcEx(1);}
			}
		}
		staticvar s_BTN_Video_Name = new VButton_TextImg
		{
			Init("new/HallBottom_Text/lx0");
			//pos(parent.GetTextLeft(parent.s_BTN_Video,width),parent.GetTextTop(this));
			halign(100,-160);top = parent.GetTextTop(this);
		}
		//个人信息：按钮
		staticvar s_BTN_SelfInfo = new VBTN_Hall_role_New
		{
			SetRelatePos(1);
			SetPos(80,parent.GetMyTop(this)+12);
			void CallBack_OnImgChange(index)
			{
					parent.s_BTN_SelfInfo_Name.SetData(index);
			}
			//点击了其他按钮
			void ClearBtnTextState(state)
			{
				//printf("BTN:s_BTN_Mall:ClearBtnTextState()state:"+state);
				m_Selected = state;
				parent.s_BTN_SelfInfo_Name.SetOpenState(state);
				if (m_Selected){SetImgSrcEx(3);LogicMouseOutFunc();}else{SetImgSrcEx(1);}
			}
		}
		staticvar s_BTN_SelfInfo_Name = new VButton_TextImg
		{
			Init("new/HallBottom_Text/jsxx0");
			//pos(parent.GetTextLeft(parent.s_BTN_SelfInfo,width),parent.GetTextTop(this));
			halign(100,-90);top = parent.GetTextTop(this);
		}
		//背包：按钮
		staticvar s_BTN_Pack = new VBTN_Hall_pack_New
		{
			SetRelatePos(1);
			SetPos(30,parent.GetMyTop(this)+14);
			void CallBack_OnImgChange(index)
			{
					parent.s_BTN_Pack_Name.SetData(index);
			}

			//点击了其他按钮
			void ClearBtnTextState(state)
			{
				//printf("BTN:s_BTN_Mall:ClearBtnTextState()state:"+state);
				m_Selected = state;
				parent.s_BTN_Pack_Name.SetOpenState(state);
				if (m_Selected){SetImgSrcEx(3);LogicMouseOutFunc();}else{SetImgSrcEx(1);}
			}
		}
		staticvar s_BTN_Pack_Name = new VButton_TextImg
		{
			Init("new/HallBottom_Text/bb0");
			//pos(parent.GetTextLeft(parent.s_BTN_Pack,width),parent.GetTextTop(this));
			halign(100,-45);top = parent.GetTextTop(this);
		}
		new VPic3_Shade_UI
		{
			size = "300,32";
			left = parent.s_BTN_Friend.left;
			top = parent.s_BTN_Friend.top + parent.s_BTN_Friend.height - 25;
		}
	}
}